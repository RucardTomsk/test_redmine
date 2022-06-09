this_dir = File.expand_path(File.dirname(__FILE__))
lib_dir = File.join(this_dir, 'lib')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)
gem 'grpc'
require 'grpc'
require 'CalculatingService_pb.rb'
require 'CalculatingService_services_pb.rb'
require 'config.rb'
require 'json/ext'
require 'json'

class IterationsController < ApplicationController

  include ProbabilitiesHelper
  include CheckboxFixingHelper

  class Node
    attr_accessor :name
    attr_accessor :checkbox
    attr_accessor :probabilities
  end

  def index
    @project = Project.find(params[:project_id])
    @probabilities_history = params[:prob_history]
    @iterations_count = get_last_iteration_number(@project.id)
    @checkpoint_codes = get_checkbox_name_from_alphas(@project.alphas)

    @checkbox_history = {}
    @checkboxes = get_checkpoints_from_alphas(@project.alphas)

    @checkpoints_names = {}
    @checkboxes.each do |checkbox|
      history = AlphaCheckpointState.where(checkpoints_id: checkbox.id).order(:iteration)
      history_array = []
      history.each do |checkbox_state|
        history_array << checkbox_state.checkbox_state
      end
      @checkbox_history[checkbox.id] = history_array
      @checkpoints_names[checkbox.id] = checkbox.definition.name
    end
    @api_key = @project.essence_api_key
    @api_key = Config::Api_default_key if @api_key.nil?
  end

  def create
    # save alphas checkpoints
    @project = Project.find(params[:project_id])
    alphas = @project.alphas
    @checkpoints = get_checkpoints_from_alphas(alphas)
    current_iteration = get_last_iteration_number(@project.id) + 1
    @checkpoints.each do |checkpoint|
      AlphaCheckpointState.create({ iteration: current_iteration, checkbox_state: checkpoint.fulfilled,
                                     checkpoints_id: checkpoint.id })
    end
    #save work_products_checkpoints
    work_products = @project.work_products
    @checkpoints = get_checkpoints_from_work_products(work_products)
    @checkpoints.each do |checkpoint|
      WpCheckpointState.create({ iteration: current_iteration, checkbox_state: checkpoint.fulfilled,
                                 wp_checkpoints_id: checkpoint.id })
    end

    flash[:notice] = "Checkboxes states were saved successfully. Current iteration number for #{@project.name} is #{current_iteration}."
    redirect_to action: "index", project_id: @project.id
  end

  def new
    puts "New?"
    p params[:graph_description]
  end

  def count_probabilities_for_iteration

    @project = Project.find(params[:project_id])

    # form validation
    if params[:api_key].empty?
      flash[:alert] = "Please, add secret key for Essence API"
      redirect_to action: "index", project_id: @project.id
      return
    end

    if params[:selected_threshold].empty?
      flash[:alert] = "Please, add threshold value"
      redirect_to action: "index", project_id: @project.id
      return
    end

    if params[:selected_influence_weak].empty?
      flash[:alert] = "Please, add value for weak influence"
      redirect_to action: "index", project_id: @project.id
      return
    end

    if params[:selected_influence_medium].empty?
      flash[:alert] = "Please, add value for medium influence"
      redirect_to action: "index", project_id: @project.id
      return
    end

    if params[:selected_influence_strong].empty?
      flash[:alert] = "Please, add value for strong influence"
      redirect_to action: "index", project_id: @project.id
      return
    end

    iteration = params[:selected_iteration]
    @iterations_count = iteration.to_i
    @hover_hash = get_checkbox_name_from_alphas(@project.alphas)

    # get checkpoints for Core Alphas
    @core_history = {}
    core_alphas = Alpha.where(project_id: @project.id).to_a
    core_alphas = core_alphas.select do |alpha|
      alpha.definition.parent_id.nil?
    end
    core_checkboxes = get_checkpoints_from_alphas(core_alphas)
    core_checkboxes.each do |checkbox|
      history = AlphaCheckpointState.where(checkpoints_id: checkbox.id).order(:iteration)
      history_array = []
      history.each do |checkbox_state|
        if checkbox_state.iteration <= @iterations_count
          history_array << { checkbox_state.iteration => checkbox_state.checkbox_state }
        end
      end
      @core_history[checkbox.definition.checkpoint_def_id] = history_array
    end

    # get all checkbox states for all iterations in format 'state -> [checkbox -> array of states]'
    subalphas = Alpha.where(project_id: @project.id)
    subalphas = subalphas.reject do |alpha|
      alpha.definition.parent_id.nil?
    end

    @checkbox_history = {}

    subalphas.each do |alpha|
      subalpha_states = {}
      alpha.definition.state_definitions.each do |state_def|
        subalpha_states[state_def.state_def_id] = {}
      end

      subalpha_checkboxes = get_checkpoints_from_alphas([alpha])
      subalpha_checkboxes.each do |checkbox|
        history = AlphaCheckpointState.where(checkpoints_id: checkbox.id).order(:iteration)
        history_array = []
        history.each do |checkbox_state|
          if checkbox_state.iteration <= @iterations_count
            history_array << { checkbox_state.iteration => checkbox_state.checkbox_state }
          end
        end
        subalpha_states[checkbox.definition.state_definition.state_def_id][checkbox.definition.checkpoint_def_id] = history_array
      end

      subalpha_states.each do |state|
        if @checkbox_history[state[0]] == nil
          @checkbox_history[state[0]] = []
        end
        @checkbox_history[state[0]] << state[1]

      end
    end

    #get all checkpoints for work products

    @project.work_products.each do |work_product|
      wp_levels = {}
      work_product.definition.level_of_details_definitions.each do |level_def|
        wp_levels[level_def.level_def_id] = {}
      end

      wp_checkboxes = get_checkpoints_from_work_products([work_product])
      wp_checkboxes.each do |checkbox|
        history = WpCheckpointState.where(wp_checkpoints_id: checkbox.id).order(:iteration)
        history_array = []
        history.each do |checkbox_state|
          if checkbox_state.iteration <= @iterations_count
            history_array << { checkbox_state.iteration => checkbox_state.checkbox_state }
          end
        end
        wp_levels[checkbox.definition.level_of_details_definition.level_def_id][checkbox.definition.checkpoint_def_id] = history_array
      end

      wp_levels.each do |level|
        if @checkbox_history[level[0]] == nil
          @checkbox_history[level[0]] = []
        end
        @checkbox_history[level[0]] << level[1]

      end
    end

    threshold = params[:selected_threshold].to_f
    api_key = params[:api_key]
    stub = CalculatingService::Stub.new(Config::Api_address, :this_channel_is_insecure)
    _API = stub.calculate(Request.new(_map: [@core_history, @checkbox_history].to_json, iter: @iterations_count+1, threshold: threshold, key: api_key))

    # map for probabilities 'number of iteration'->'map with probabilities'
    @probabilities_history = JSON.parse(_API._res)
    @project.update(essence_api_key: api_key)
    #@probabilities_history = Hash.new
    #count probabilities with nodes
    #@probabilities_history[0] = probabilities(0, nil, nodes)
    #p "Probabilities for 0 iteration are counted"
    #(1.. @iterations_count).each { |i|
    #  @probabilities_history[i] = probabilities(i, @probabilities_history[i - 1], nodes)
    #  p "Probabilities for" + i.to_s + " iteration are counted"
    #}
    #puts @probabilities_history
    #m = stub.test(Test.new(_test: @probabilities_history.to_json))
    # probabilities for view in format 'nodeId -> array of probabilities'
    @probs_for_view = {}
    @checkbox_history.each do |checkbox|
      @probs_for_view[checkbox[0]] = []
    end
    @probabilities_history.each do |probabilities|
      probabilities[1].each do |probability|
        @probs_for_view[probability[0]] = [] if @probs_for_view[probability[0]].nil?
        @probs_for_view[probability[0]] << probability[1]
      end
    end

    # entropy counting
    #   @original_checkboxes = Hash.new

    current_iteration_checkboxes = CheckboxState.where(["projectId = ? and iteration = ?", @project.id, @iterations_count])
    @original_checkboxes = {}

    current_iteration_checkboxes.each do |checkbox|
      @original_checkboxes[checkbox.nodeId] = checkbox.checkbox_state
    end

      #checkboxes = @original_checkboxes.clone
      #if @iterations_count > 0
        #previous_probability = @probabilities_history[@iterations_count - 1]
      #else
        #previous_probability = nil
      #end

    #@entropy = get_entropy(@probabilities_history[@iterations_count])
    #  p "Main entropy is counted"
    #result = count_probabilities_for_each_checkbox(checkboxes, nodes, previous_probability, @iterations_count)
    #@probs_for_checkboxes = result[0]
    #@new_entropy = result[1]

    @probs_less_half = JSON.parse(_API.plh)
    @probs_less_half.delete_if do |key|
      if @checkbox_history[key[0]] != nil
        @checkbox_history[key[0]][@iterations_count] == false
      else
        false
      end
    end
    @probs_less_half_parents = JSON.parse(_API.plhp)

  end

  def load_nodes_from_file(file)
    parser = Nokogiri::XML::SAX::Parser.new(EssenceGraphToMemoryParser.new)
    parser.parse(file)
    parser.document.nodes
  end

  def probabilities(iteration, previous_probabilities, nodes)

    checkboxes_history = CheckboxState.where(["projectId = ? and iteration = ?", @project.id, iteration])

    checkboxes = {}

    checkboxes_history.each do |checkbox|
      checkboxes[checkbox.nodeId] = checkbox.checkbox_state
    end

    probabilities = {}

    checkboxes.each do |current_checkbox|
      unless probabilities.has_key?(current_checkbox[0])
        probabilities[current_checkbox[0]] = count_probability(current_checkbox[0], nodes, checkboxes, probabilities, @project.id, iteration, previous_probabilities)
        p "Count probabulity for #{current_checkbox[0]}= #{probabilities[current_checkbox[0]].to_s} iteration #{iteration.to_s}"
      end
    end
    probabilities
  end

  def count_entropy_for_each_checkbox(checkboxes, nodes, previous_probabilities, iteration)
    result = {}
    checkboxes.each do |checkbox|
      p "Counting entropy for #{checkbox[0]}"
      checkbox[1] = !checkbox[1]
      checkboxes[checkbox[0]] = !checkboxes[checkbox[0]]
      probabilities = count_probabilities(checkboxes, @project.id, nodes, iteration, previous_probabilities)
      result[checkbox[0]] = count_entropy_from_hash(probabilities)
      checkboxes[checkbox[0]] = !checkboxes[checkbox[0]]
    end
    result
  end

  def count_probabilities_for_each_checkbox(checkboxes, nodes, previous_probabilities, iteration)
    result = {}
    entropy = {}
    checkboxes.each do |checkbox|
      p "Counting entropy for #{checkbox[0]}"
      checkbox[1] = !checkbox[1]
      checkboxes[checkbox[0]] = !checkboxes[checkbox[0]]
      probabilities = count_probabilities(checkboxes, @project.id, nodes, iteration, previous_probabilities)
      result[checkbox[0]] = probabilities
      entropy[checkbox[0]] = count_entropy_from_hash(probabilities)
      checkboxes[checkbox[0]] = !checkboxes[checkbox[0]]
    end
    [result, entropy]
  end

  def get_entropy(probabilities)
    count_entropy_from_hash(probabilities)
  end
end
