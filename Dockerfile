FROM redmine:4
RUN gem install grpc bundle
RUN apt-get install imagemagick