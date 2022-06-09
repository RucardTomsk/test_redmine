-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: redmine
-- ------------------------------------------------------
-- Server version	5.7.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activity_definitions`
--
SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `activity_definitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_definitions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `method_definition_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_activity_definitions_on_method_definition_id` (`method_definition_id`),
  CONSTRAINT `fk_rails_4b8cb127c8` FOREIGN KEY (`method_definition_id`) REFERENCES `method_definitions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_definitions`
--

LOCK TABLES `activity_definitions` WRITE;
/*!40000 ALTER TABLE `activity_definitions` DISABLE KEYS */;
INSERT INTO `activity_definitions` VALUES (1,'Achieve Acceptance','The product is accepted for release. Progressively accepting the product enables frequent releases to be made to maximize return-on-investment.',2),(2,'Agree Definition of Done','Agree the quality criteria that will be used to determine whether any change to the product is fully and correctly implemented.',2),(3,'Build Stakeholder Network','Actively engage all stakeholders with a legitimate and material interest in the endeavor, including eliciting feedback and negotiating compromises as required.',2),(4,'Collaborate, Communicate, Coordinate','The team applies and evolves a way of working that maximizes levels of performance, communication and collaboration, and works to secure the facilities they need to do this.',2),(5,'Demonstrate the Product','Show the evolving product to  stakeholders and elicit feedback as frequently as possible to converge on an optimal solution.',2),(6,'Evolve a Releasable Product','Increase the value of a product while ensuring that it remains usable and of production quality.',2),(7,'Evolve the Product Vision','Agree and communicate the goals and return-on-investment case for the product to drive and inform ongoing decisions about the product.',2),(8,'Hold a Daily Stand-Up','The team meets every day, same time and place, to assess progress, coordinate activity, and raise and action impediments. The meeting is timeboxed, typically to 15 minutes.',2),(9,'Hold a Retrospective','The whole team meets regularly to reflect on its way of working. Improvements are identified and prioritized, and actions agreed. At the next retrospective, the results are evaluated.',2),(10,'Plan a Timebox','The team is guided on the current priority objectives, and collaborates to plan the work and negotiate a viable and acceptable work plan.',2),(11,'Prepare a Product Backlog Item','Ensure that the Product Backlog Item is ready for development and that it is clear how it will be tested.',2),(12,'Refine Product Backlog','Get and keep the Product Backlog visible, up-to-date and in good working order, with high priority items well understood.',2),(13,'Review a Timebox','Review the outcomes of a timebox, in terms of objectives achieved, and assess progress made, so that plans can be adapted as needed.',2),(14,'Schedule the Timeboxes','Put the dates in the diary when each timebox will start and end, typically through to the end of the project or through to the next major release or equivalent high-level milestone.',2),(15,'Share Knowhow','The team uses techniques, such as pair-working and knowledge-sharing, to propagate skills across the team, and to hand over work to others when the need for this arises.',2),(16,'Team Kick-Start','The team works together to clarify its mission, agree a strategy for achieving it and decide how they will work together as a team.',2);
/*!40000 ALTER TABLE `activity_definitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alpha_containments`
--

DROP TABLE IF EXISTS `alpha_containments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `alpha_containments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lower_bound` int(11) DEFAULT NULL,
  `upper_bound` int(11) DEFAULT NULL,
  `subordinate_id` int(11) DEFAULT NULL,
  `super_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_alpha_containments_on_subordinate_id` (`subordinate_id`),
  KEY `index_alpha_containments_on_super_id` (`super_id`),
  CONSTRAINT `fk_rails_a5c19bd85f` FOREIGN KEY (`subordinate_id`) REFERENCES `alpha_definitions` (`id`),
  CONSTRAINT `fk_rails_c195efaaed` FOREIGN KEY (`super_id`) REFERENCES `alpha_definitions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alpha_containments`
--

LOCK TABLES `alpha_containments` WRITE;
/*!40000 ALTER TABLE `alpha_containments` DISABLE KEYS */;
INSERT INTO `alpha_containments` VALUES (1,0,-1,9,6),(2,0,-1,8,7),(3,1,-1,12,7),(4,1,-1,10,2),(5,1,-1,11,3);
/*!40000 ALTER TABLE `alpha_containments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alpha_criterion_definitions`
--

DROP TABLE IF EXISTS `alpha_criterion_definitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `alpha_criterion_definitions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `criterion_type` int(11) DEFAULT NULL,
  `partial` tinyint(1) DEFAULT NULL,
  `minimal` tinyint(1) DEFAULT NULL,
  `activity_definition_id` int(11) DEFAULT NULL,
  `state_definition_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_alpha_criterion_definitions_on_activity_definition_id` (`activity_definition_id`),
  KEY `index_alpha_criterion_definitions_on_state_definition_id` (`state_definition_id`),
  CONSTRAINT `fk_rails_104a87f1b8` FOREIGN KEY (`state_definition_id`) REFERENCES `state_definitions` (`id`),
  CONSTRAINT `fk_rails_7282c88a83` FOREIGN KEY (`activity_definition_id`) REFERENCES `activity_definitions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alpha_criterion_definitions`
--

LOCK TABLES `alpha_criterion_definitions` WRITE;
/*!40000 ALTER TABLE `alpha_criterion_definitions` DISABLE KEYS */;
INSERT INTO `alpha_criterion_definitions` VALUES (1,1,0,1,6,11),(2,1,0,1,8,31),(3,1,0,1,9,2),(4,0,0,0,5,57),(5,0,0,0,1,58),(6,1,0,0,7,57),(7,1,0,0,1,4),(8,1,1,0,5,58),(9,0,0,0,11,23),(10,0,0,0,6,39),(11,1,0,0,11,39),(12,1,0,0,6,17),(13,1,0,0,12,23),(14,1,0,0,12,12),(15,1,0,1,6,16),(16,0,0,0,1,24),(17,0,0,0,5,29),(18,1,0,0,1,48),(19,1,0,0,3,29),(20,1,1,0,5,24),(21,0,0,0,4,18),(22,1,0,0,15,32),(23,1,0,1,4,13),(24,1,0,0,16,18),(25,1,0,0,14,50),(26,1,0,0,10,33),(27,1,0,0,13,47),(28,0,0,0,10,50),(29,1,0,1,4,25),(30,1,0,0,16,35),(31,1,0,0,15,59),(32,1,1,0,9,59),(33,0,0,0,4,35),(34,0,0,0,14,28),(35,1,1,0,14,34),(36,1,0,0,10,53),(37,1,1,0,8,55);
/*!40000 ALTER TABLE `alpha_criterion_definitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alpha_criterions`
--

DROP TABLE IF EXISTS `alpha_criterions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `alpha_criterions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_id` int(11) DEFAULT NULL,
  `alpha_id` int(11) DEFAULT NULL,
  `alpha_criterion_definition_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_alpha_criterions_on_issue_id` (`issue_id`),
  KEY `index_alpha_criterions_on_alpha_id` (`alpha_id`),
  KEY `index_alpha_criterions_on_alpha_criterion_definition_id` (`alpha_criterion_definition_id`),
  CONSTRAINT `fk_rails_8e63e2a5a6` FOREIGN KEY (`alpha_id`) REFERENCES `alphas` (`id`),
  CONSTRAINT `fk_rails_e9609fbf92` FOREIGN KEY (`alpha_criterion_definition_id`) REFERENCES `alpha_criterion_definitions` (`id`),
  CONSTRAINT `fk_rails_fa37b9feeb` FOREIGN KEY (`issue_id`) REFERENCES `issues` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alpha_criterions`
--

LOCK TABLES `alpha_criterions` WRITE;
/*!40000 ALTER TABLE `alpha_criterions` DISABLE KEYS */;
INSERT INTO `alpha_criterions` VALUES (1,2,19,35),(2,2,20,25),(3,5,16,19),(4,6,21,7),(5,6,26,18);
/*!40000 ALTER TABLE `alpha_criterions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alpha_definitions`
--

DROP TABLE IF EXISTS `alpha_definitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `alpha_definitions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `method_definition_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_alpha_definitions_on_method_definition_id` (`method_definition_id`),
  CONSTRAINT `fk_rails_d00d7a1cec` FOREIGN KEY (`method_definition_id`) REFERENCES `method_definitions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alpha_definitions`
--

LOCK TABLES `alpha_definitions` WRITE;
/*!40000 ALTER TABLE `alpha_definitions` DISABLE KEYS */;
INSERT INTO `alpha_definitions` VALUES (1,'Opportunity','The set of circumstances that makes it appropriate to develop or change a software system.',2),(2,'Requirements','What the software system must do to address the opportunity and satisfy the stakeholders.',2),(3,'Software System','A system made up of software, hardware, and data that provides its primary value by the execution of the software.',2),(4,'Stakeholders','The people, groups, or organizations who affect or are affected by a software system.',2),(5,'Team','A group of people actively engaged in the development, maintenance, delivery or support of a specific software system.',2),(6,'Way of Working','The tailored set of practices and tools used by a team to guide and support their work.',2),(7,'Work','Activity involving mental or physical effort done in order to achieve a result.',2),(8,'Impediment','Something that is preventing or slowing productive progress.',2),(9,'Improvement','A possible adaptation to improve a Team’s  Way of Working.\r\n',2),(10,'Product Backlog Item','Something to build into the product to enhance its value.',2),(11,'Software Change','A single change to the code-base that is made for a known purpose and is tested before it is integrated.',2),(12,'Timebox','A short, fixed time period for which a focused plan can be built to achieve a set of specified objectives and, after which, progress can be assessed and plans adapted as needed.',2);
/*!40000 ALTER TABLE `alpha_definitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alphas`
--

DROP TABLE IF EXISTS `alphas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `alphas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `link` text,
  `project_id` int(11) DEFAULT NULL,
  `alpha_definition_id` int(11) DEFAULT NULL,
  `achieved_state_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_alphas_on_project_id` (`project_id`),
  KEY `index_alphas_on_alpha_definition_id` (`alpha_definition_id`),
  KEY `index_alphas_on_achieved_state_id` (`achieved_state_id`),
  KEY `index_alphas_on_parent_id` (`parent_id`),
  CONSTRAINT `fk_rails_163db9df2d` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  CONSTRAINT `fk_rails_6574e5c58e` FOREIGN KEY (`parent_id`) REFERENCES `alphas` (`id`),
  CONSTRAINT `fk_rails_68e861ba2d` FOREIGN KEY (`alpha_definition_id`) REFERENCES `alpha_definitions` (`id`),
  CONSTRAINT `fk_rails_a11e877d5e` FOREIGN KEY (`achieved_state_id`) REFERENCES `state_definitions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alphas`
--

LOCK TABLES `alphas` WRITE;
/*!40000 ALTER TABLE `alphas` DISABLE KEYS */;
INSERT INTO `alphas` VALUES (1,'Opportunity',NULL,1,1,NULL,NULL),(2,'Requirements',NULL,1,2,NULL,NULL),(3,'Product Backlog Item 1',NULL,1,10,NULL,2),(4,'Software System',NULL,1,3,NULL,NULL),(5,'Software Change 1',NULL,1,11,NULL,4),(6,'Stakeholders',NULL,1,4,NULL,NULL),(7,'Team',NULL,1,5,NULL,NULL),(8,'Way of Working',NULL,1,6,NULL,NULL),(9,'Work',NULL,1,7,NULL,NULL),(10,'Timebox 1',NULL,1,12,NULL,9),(11,'Opportunity',NULL,3,1,4,NULL),(12,'Requirements',NULL,3,2,8,NULL),(13,'Product Backlog Item 1',NULL,3,10,NULL,12),(14,'Software System',NULL,3,3,NULL,NULL),(15,'Software Change 1',NULL,3,11,NULL,14),(16,'Stakeholders',NULL,3,4,29,NULL),(17,'Team',NULL,3,5,NULL,NULL),(18,'Way of Working',NULL,3,6,NULL,NULL),(19,'Work',NULL,3,7,28,NULL),(20,'Timebox 1',NULL,3,12,NULL,19),(21,'Opportunity',NULL,4,1,NULL,NULL),(22,'Requirements',NULL,4,2,NULL,NULL),(23,'Product Backlog Item 1',NULL,4,10,NULL,22),(24,'Software System',NULL,4,3,NULL,NULL),(25,'Software Change 1',NULL,4,11,NULL,24),(26,'Stakeholders',NULL,4,4,NULL,NULL),(27,'Team',NULL,4,5,NULL,NULL),(28,'Way of Working',NULL,4,6,NULL,NULL),(29,'Work',NULL,4,7,NULL,NULL),(30,'Timebox 1',NULL,4,12,NULL,29),(31,'Opportunity',NULL,5,1,NULL,NULL),(32,'Requirements',NULL,5,2,NULL,NULL),(33,'Product Backlog Item 1',NULL,5,10,NULL,32),(34,'Software System',NULL,5,3,NULL,NULL),(35,'Software Change 1',NULL,5,11,NULL,34),(36,'Stakeholders',NULL,5,4,NULL,NULL),(37,'Team',NULL,5,5,NULL,NULL),(38,'Way of Working',NULL,5,6,NULL,NULL),(39,'Work',NULL,5,7,NULL,NULL),(40,'Timebox 1',NULL,5,12,NULL,39);
/*!40000 ALTER TABLE `alphas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `container_id` int(11) DEFAULT NULL,
  `container_type` varchar(30) DEFAULT NULL,
  `filename` varchar(255) NOT NULL DEFAULT '',
  `disk_filename` varchar(255) NOT NULL DEFAULT '',
  `filesize` bigint(20) NOT NULL DEFAULT '0',
  `content_type` varchar(255) DEFAULT '',
  `digest` varchar(64) NOT NULL DEFAULT '',
  `downloads` int(11) NOT NULL DEFAULT '0',
  `author_id` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `disk_directory` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_attachments_on_author_id` (`author_id`),
  KEY `index_attachments_on_created_on` (`created_on`),
  KEY `index_attachments_on_container_id_and_container_type` (`container_id`,`container_type`),
  KEY `index_attachments_on_disk_filename` (`disk_filename`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_sources`
--

DROP TABLE IF EXISTS `auth_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_sources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(60) NOT NULL DEFAULT '',
  `host` varchar(60) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `account` varchar(255) DEFAULT NULL,
  `account_password` varchar(255) DEFAULT '',
  `base_dn` varchar(255) DEFAULT NULL,
  `attr_login` varchar(30) DEFAULT NULL,
  `attr_firstname` varchar(30) DEFAULT NULL,
  `attr_lastname` varchar(30) DEFAULT NULL,
  `attr_mail` varchar(30) DEFAULT NULL,
  `onthefly_register` tinyint(1) NOT NULL DEFAULT '0',
  `tls` tinyint(1) NOT NULL DEFAULT '0',
  `filter` text,
  `timeout` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_auth_sources_on_id_and_type` (`id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_sources`
--

LOCK TABLES `auth_sources` WRITE;
/*!40000 ALTER TABLE `auth_sources` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boards`
--

DROP TABLE IF EXISTS `boards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `boards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `topics_count` int(11) NOT NULL DEFAULT '0',
  `messages_count` int(11) NOT NULL DEFAULT '0',
  `last_message_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `boards_project_id` (`project_id`),
  KEY `index_boards_on_last_message_id` (`last_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boards`
--

LOCK TABLES `boards` WRITE;
/*!40000 ALTER TABLE `boards` DISABLE KEYS */;
/*!40000 ALTER TABLE `boards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changes`
--

DROP TABLE IF EXISTS `changes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `changes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `changeset_id` int(11) NOT NULL,
  `action` varchar(1) NOT NULL DEFAULT '',
  `path` text NOT NULL,
  `from_path` text,
  `from_revision` varchar(255) DEFAULT NULL,
  `revision` varchar(255) DEFAULT NULL,
  `branch` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `changesets_changeset_id` (`changeset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changes`
--

LOCK TABLES `changes` WRITE;
/*!40000 ALTER TABLE `changes` DISABLE KEYS */;
/*!40000 ALTER TABLE `changes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changeset_parents`
--

DROP TABLE IF EXISTS `changeset_parents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `changeset_parents` (
  `changeset_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  KEY `changeset_parents_changeset_ids` (`changeset_id`),
  KEY `changeset_parents_parent_ids` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changeset_parents`
--

LOCK TABLES `changeset_parents` WRITE;
/*!40000 ALTER TABLE `changeset_parents` DISABLE KEYS */;
/*!40000 ALTER TABLE `changeset_parents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changesets`
--

DROP TABLE IF EXISTS `changesets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `changesets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repository_id` int(11) NOT NULL,
  `revision` varchar(255) NOT NULL,
  `committer` varchar(255) DEFAULT NULL,
  `committed_on` datetime NOT NULL,
  `comments` longtext,
  `commit_date` date DEFAULT NULL,
  `scmid` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `changesets_repos_rev` (`repository_id`,`revision`),
  KEY `index_changesets_on_user_id` (`user_id`),
  KEY `index_changesets_on_repository_id` (`repository_id`),
  KEY `index_changesets_on_committed_on` (`committed_on`),
  KEY `changesets_repos_scmid` (`repository_id`,`scmid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changesets`
--

LOCK TABLES `changesets` WRITE;
/*!40000 ALTER TABLE `changesets` DISABLE KEYS */;
/*!40000 ALTER TABLE `changesets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changesets_issues`
--

DROP TABLE IF EXISTS `changesets_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `changesets_issues` (
  `changeset_id` int(11) NOT NULL,
  `issue_id` int(11) NOT NULL,
  UNIQUE KEY `changesets_issues_ids` (`changeset_id`,`issue_id`),
  KEY `index_changesets_issues_on_issue_id` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changesets_issues`
--

LOCK TABLES `changesets_issues` WRITE;
/*!40000 ALTER TABLE `changesets_issues` DISABLE KEYS */;
/*!40000 ALTER TABLE `changesets_issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkpoint_definitions`
--

DROP TABLE IF EXISTS `checkpoint_definitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkpoint_definitions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `state_definition_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_checkpoint_definitions_on_state_definition_id` (`state_definition_id`),
  CONSTRAINT `fk_rails_456c22c3de` FOREIGN KEY (`state_definition_id`) REFERENCES `state_definitions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkpoint_definitions`
--

LOCK TABLES `checkpoint_definitions` WRITE;
/*!40000 ALTER TABLE `checkpoint_definitions` DISABLE KEYS */;
INSERT INTO `checkpoint_definitions` VALUES (1,'Acceptable solution described','The stakeholders accept that the requirements describe an acceptable solution.',1),(2,'Acceptance criteria established','Acceptance criteria are defined and agreed with client.',34),(3,'Accepting stakeholders known','The stakeholders that will accept the results are known.',28),(4,'Accessible to whole team','All team members have access to the practices and tools required to do their work.',25),(5,'Adapted to context','The practices and tools are being adapted to the team\'s context.',27),(6,'Added value clear','The added value provided by the system is clear.',56),(7,'Addresses problems','The team identifies and addresses problems without outside help.',32),(8,'Agreed service levels supported','The system is fully supported to the agreed service levels.',30),(9,'Approach recommended','A recommendation for the approach to be taken is available.',35),(10,'Architecture accepted as fit-for-purpose','The relevant stakeholders agree that the demonstrated architecture is appropriate.',16),(11,'Architecture selection criteria agreed','The criteria to be used when selecting the architecture have been agreed on.',6),(12,'Assumptions clear','Assumptions are clearly stated.',8),(13,'At least one investing stakeholder interested','At least one of the stakeholders wishes to make an investment in better understanding the opportunity and the value associated with addressing it.',21),(14,'At least one solution proposed','At least one software-based solution has been proposed.',52),(15,'At least one team member ready','The team or at least some of the team members are ready to start the work.',34),(16,'Budget reconciled & closed','The budget has been reconciled and closed.',9),(17,'Buy, build, reuse decisions made','Buy, build and reuse decisions have been made.',6),(18,'Change under control','The rate of change to the agreed requirements is relatively low and under control.',1),(19,'Changes promptly communicated','The stakeholder representatives promptly communicate changes that are relevant for their stakeholder groups.',29),(20,'Clear how opportunity addressed','The parts of the opportunity satisfied by the requirements are clear.',1),(21,'Collaboration approach agreed','The collaboration approach among the stakeholder representatives has been agreed.',42),(22,'Commitment made','Commitment is made.',34),(23,'Commitments consistently met','Tasks are consistently completed on time and within their estimates.',55),(24,'Communication mechanisms defined','Team communication mechanisms have been defined.',18),(25,'Communication open and honest','Communication within the team is open and honest.',13),(26,'Composition defined','The composition of the team is defined.',51),(27,'Conflicts addressed','Conflicting requirements are identified and attended to.',12),(28,'Consistently meeting commitments','The team consistently meets its commitments.',32),(29,'Constraints clear','Any constraints on the work\'s performance are clearly identified.',28),(30,'Constraints identified & considered','Constraints are identified and considered.',8),(31,'Constraints known and defined','Constraints on the team\'s operation are known.',51),(32,'Continually tuned','The team continually tunes their use of the practices and tools.',59),(33,'Continuously adapting to change','The team continuously adapts to the changing context.',32),(34,'Cost and effort estimated','Cost and effort of the work are estimated.',34),(35,'Credible plan in place','A credible plan is in place.',34),(36,'Critical HW configurations demonstrated','Critical hardware configurations have been demonstrated.',16),(37,'Critical interfaces demonstrated','Critical interfaces have been demonstrated.',16),(38,'Decisions on system organization made','Significant decisions about the organization of the system have been made.',6),(39,'Defect levels acceptable','Defect levels are acceptable to the stakeholders.',56),(40,'Definition of done in place','The work is being broken down into actionable work items with clear definitions of done.',53),(41,'Development stakeholders identified','The stakeholders involved in developing the new system are identified.',8),(42,'Development started','Development work has been started.',53),(43,'Enough addressed to be acceptable','Enough of the requirements are addressed for the resulting system to be acceptable to the stakeholders.',3),(44,'Enough members recruited','Enough team members have been recruited to enable the work to progress.',18),(45,'Essential characteristics clear','The requirements communicate the essential characteristics of the system to be delivered.',12),(46,'Estimates revised to reflect performance','Estimates are revised to reflect the team\'s performance.',55),(47,'Everything archived','Everything has been archived.',9),(48,'External collaborators identified','Any external collaborators (organizations, teams and individuals) are identified.',18),(49,'Feedback mechanisms in place','Procedures are in place to handle feedback on the team\'s way of working.',27),(50,'Feedback on system use available','Stakeholders are using the new system and providing feedback on their experiences.',49),(51,'Focused on mission','The team is focused on achieving the team mission.',13),(52,'Funding in place','Funding to start the work is in place.',34),(53,'Funding stakeholders identified','The stakeholders that will fund the initial work on the new system are identified.',14),(54,'Funding stakeholders known','The stakeholders that will fund the work are known.',28),(55,'Gaps between available and needed way of working understood','The gaps that exist between the practices and tools that are needed and the practices and tools that are available have been analyzed and understood.',19),(56,'Gaps in capability understood','The capability gaps that exist between what is needed to execute the desired way of working and the capability levels of the team have been analyzed and understood.',19),(57,'Governance rules defined','Governance rules are defined.',51),(58,'Growth mechanisms in place','Mechanisms to grow the team are in place.',51),(59,'HW platforms identified','Hardware platforms have been identified.',6),(60,'How to work understood','All team members understand how to perform their work.',18),(61,'Idea behind opportunity identified','An idea for a way of improving current ways of working, increasing market share, or applying a new or innovative software system has been identified.',21),(62,'Impact understood','The impact of implementing the requirements is understood.',12),(63,'Individual responsibilities accepted and aligned to competencies','The team members understand their responsibilities and how they align with their competencies.',18),(64,'Initiator identified','The initiator of the work is clearly identified.',28),(65,'Inspected and adapted by whole team','The whole team is involved in the inspection and adaptation of the way-of-working.',25),(66,'Integrated way of working available','The selected practices and tools have been integrated to form a usable way-of-working.',19),(67,'Integration points defined','Integration and delivery points are defined.',34),(68,'Integration with environment demonstrated','The integration with other existing systems has been demonstrated.',16),(69,'Key architectural characteristics demonstrated','Key architectural characteristics have been demonstrated.',16),(70,'Key practices & tools selected','The key practices and tools that form the foundation of the way-of-working are selected.',19),(71,'Key stakeholder groups represented','There is agreement on the stakeholder groups to be represented. At a minimum, the stakeholders groups that fund, use, support, and maintain the system have been considered.',41),(72,'Key technical risks agreed to','Key technical risks agreed to.',6),(73,'Key usage scenarios explained','The most important usage scenarios for the system can be explained.',12),(74,'Leadership model selected','Leadership model is selected.',51),(75,'Lessons learned shared','Lessons learned are shared for future use.',45),(76,'Lessons learned','Lessons learned have been itemized, recorded and discussed.',9),(77,'Members accepting work','Team members are accepting work.',18),(78,'Members available to other teams','The team members are available for assignment to other teams.',5),(79,'Members commit to team','Each team member commits to working on the team as defined.',18),(80,'Members introduced','The team members have met (perhaps virtually) and are beginning to get to know each other.',18),(81,'Members know each other','The team members know each other.',13),(82,'Metrics available','Metrics have been made available.',9),(83,'Minimal expectations agreed','The stakeholder representatives have agreed upon their minimal expectations for the next deployment of the new system.',24),(84,'Mission concluded','No further effort is being put in by the team to complete the mission.',5),(85,'Mission defined','The team mission has been defined in terms of the opportunities and outcomes.',51),(86,'Need for a solution confirmed','It has been confirmed that a software-based solution is needed.',52),(87,'No authorized users','There are no \'official\' stakeholders who still use the system.',46),(88,'No hindering requirements','There are no outstanding requirement items preventing the system from being accepted as fully satisfying the requirements.',20),(89,'No longer in use','The team\'s way of working is no longer being used.',45),(90,'No longer supported','The system is no longer supported.',46),(91,'No outstanding, uncompleted tasks','There are no outstanding, uncompleted tasks.',9),(92,'Non-negotiable practices & tools identified','All non-negotiable practices and tools have been identified.',19),(93,'Only admin tasks left','All outstanding tasks are administrative housekeeping or related to preparing the next piece of work.',15),(94,'Operational context understood','The context within which the team will operate is understood.',35),(95,'Operational support in place','Operational support is in place.',40),(96,'Opportunity addressed','A usable system that demonstrably addresses the opportunity is available.',4),(97,'Opportunity clear','There is a clear opportunity for the new system to address.',14),(98,'Opportunity value quantified','The value of addressing the opportunity has been quantified either in absolute terms or in returns or savings per time period (e.g. per annum).',57),(99,'Other stakeholders identified','The other stakeholders who share the opportunity have been identified.',21),(100,'Outcomes clear and quantified','The desired outcomes required of the solution are clear and quantified.',57),(101,'Practice & tool constraints known','The constraints that apply to the selection, acquisition and use of practices and tools are known.',35),(102,'Practices & tools in use','The practices and tools are being used to do real work.',27),(103,'Practices & tools support collaboration','The practices and tools support team communication and collaboration.',27),(104,'Practices naturally applied','The team naturally applies the practices without thinking about them.',59),(105,'Practices needed to start work agreed','Enough practices for work to start are agreed to by the team.',19),(106,'Predictable progress being made','Team members are making progress as planned by using and adapting the way-of-working to suit their current context.',59),(107,'Priorities clear & perspectives balanced','The stakeholder representatives agree with how their different priorities and perspectives are being balanced to provide a clear direction for the team.',24),(108,'Priorities clear','The priority of the requirements is clear.',12),(109,'Prioritization scheme clear','The prioritization scheme is clear.',8),(110,'Priority clear','The priority of the work is clear.',28),(111,'Problems and root causes identified','Any underlying problems and their root causes have been identified.',52),(112,'Progress measured','Measures are available to show progress and velocity.',55),(113,'Progress monitored','Work progress is monitored.',53),(114,'Pursuit viable','It is clear that the pursuit of the opportunity is viable.',58),(115,'ROI acceptable','The return-on-investment profile is at least as good as anticipated.',7),(116,'Rationale clear','The rationale behind the requirements is clear.',12),(117,'Re-work under control','Re-work is under control.',55),(118,'Reasons to develop solution understood','The reasons for the development of a software-based solution are understood by all members of the team.',58),(119,'Regularly inspected','The use of the practices and tools selected are regularly inspected.',27),(120,'Release content known','Release content is known.',56),(121,'Rep\'s happy with their involvement','The stakeholder representatives are happy with their involvement in the work.',24),(122,'Rep\'s input valued','The stakeholder representatives agree that their input is valued by the team and treated with respect.',24),(123,'Replaced or discontinued','The system has been replaced or discontinued.',46),(124,'Representatives assist the team','The stakeholder representatives assist the team in accordance with their responsibilities.',29),(125,'Representatives authorized','The stakeholder representatives are authorized to carry out their responsibilities.',42),(126,'Required commitment level clear','The level of team commitment is clear.',51),(127,'Required competencies identified','Required competencies are identified.',51),(128,'Required result clear','The result required of the work being initiated is clear.',28),(129,'Requirement\'s format agreed','The way the requirements will be described is agreed upon.',8),(130,'Requirements and system match','The stakeholders accept the requirements as accurately reflecting what the system does and does not do.',3),(131,'Requirements fully satisfied','The system is accepted by the stakeholders as fully satisfying the requirements.',20),(132,'Requirements management in place','The mechanisms for managing the requirements are in place.',8),(133,'Requirements shared','The requirements are captured and shared with the team and the stakeholders.',12),(134,'Requirements\' origin clear','The origin of the requirements is clear.',12),(135,'Resource availability understood','Resource availability is understood.',34),(136,'Responsibilities agreed','The stakeholder representatives have agreed to take on their responsibilities.',42),(137,'Responsibilities defined','The responsibilities of the stakeholder representatives have been defined.',41),(138,'Responsibilities fulfilled','The team responsibilities have been handed over or fulfilled.',5),(139,'Responsibilities outlined','The team\'s responsibilities are outlined.',51),(140,'Resulting system accepted','The stakeholder(s) has accepted the resulting software system.',15),(141,'Results achieved','Work results have been achieved.',15),(142,'Rework and backtracking minimized','Effective progress is being achieved with minimal avoidable backtracking and reworking.',32),(143,'Risk exposure understood','Risk exposure is understood.',34),(144,'Risks acceptable & manageable','The risks associated with the solution are acceptable and manageable.',58),(145,'Risks under control','Risks are under control as the impact if they occur and the likelihood of them occurring have been reduced to acceptable levels.',55),(146,'Roles understood','Every team member understands how the team is organized and what their individual role is.',18),(147,'Shared solution understanding exists','The stakeholders have a shared understanding of the extent of the proposed solution.',8),(148,'Size determined','The team size is determined.',51),(149,'Solution accrues benefits','The solution has started to accrue benefits for the stakeholders.',7),(150,'Solution identified','The stakeholders in the opportunity and the proposed solution have been identified.',52),(151,'Solution impact understood','The impact of the solution on the stakeholders is understood.',57),(152,'Solution outlined','A solution has been outlined.',58),(153,'Solution possible within constraints','The indications are that the solution can be developed and deployed within constraints.',58),(154,'Solution profitable','The indicative (ball-park) costs of the solution are less than the anticipated value of the opportunity.',58),(155,'Solution worth deploying','The stakeholders agree that the available solution is worth deploying.',4),(156,'Source of funding clear','The source of funding is clear.',28),(157,'Stakeholder feedback provided','The stakeholder representatives provide feedback on the system from their stakeholder group perspective.',48),(158,'Stakeholder groups identified','All the different groups of stakeholders that are, or will be, affected by the development and operation of the software system are identified.',41),(159,'Stakeholders accept requirements','The stakeholders accept the requirements as accurately capturing what they require to fully satisfy the need for a new system.',20),(160,'Stakeholders agree system is to be produced','The initial set of stakeholders agrees that a system is to be produced.',14),(161,'Stakeholders agree with principles','Principles and constraints are agreed to by the stakeholders.',35),(162,'Stakeholders satisfied','The stakeholders are satisfied that the solution produced addresses the opportunity.',4),(163,'Stakeholders want the system','The stakeholder representatives want to make the system operational.',40),(164,'Stakeholders\' needs established','The stakeholders\' needs that generate the opportunity have been established.',52),(165,'Success criteria clear','The success criteria by which the deployment of the software system is to be judged are clear.',57),(166,'Sufficiently broken down to start','The work is broken down sufficiently for productive work to start.',34),(167,'Supported by team','The use of the practices and tools is supported by the team.',27),(168,'System accepted as fit-for-purpose','The stakeholder representatives accept the system as fit-for-purpose.',40),(169,'System available for use','The system has been made available to the stakeholders intended to use it.',30),(170,'System boundary known','System boundary is known.',6),(171,'System can be operated','The system can be operated by stakeholders who use it.',56),(172,'System exercised & performance measured','The system can be exercised and its performance can be measured.',16),(173,'System fully documented','The system is fully documented.',56),(174,'System functionality tested','The functionality provided by the system has been tested.',56),(175,'System live','At least one example of the system is fully operational.',30),(176,'System meets expectations','The stakeholders confirm that the new system meets their expectations.',49),(177,'System performance acceptable','The performance of the system is acceptable to the stakeholders.',56),(178,'System purpose agreed','The stakeholders agree on the purpose of the new system.',8),(179,'System ready for deployment','The stakeholder representatives confirm that they agree that the system is ready for deployment.',48),(180,'System success clear','It is clear what success is for the new system.',8),(181,'System value understood','The value that the software system offers to the stakeholders that fund and use the software system is understood.',57),(182,'System worth making operational','The system implementing the requirements is accepted by the stakeholders as worth making operational.',3),(183,'Tasks being completed','Tasks are being completed.',55),(184,'Tasks being progressed','Team members are accepting and progressing tasks.',53),(185,'Tasks identified and prioritized','Tasks have been identified and prioritized by the team and stakeholders.',34),(186,'Team actively support principles','Principles and constraints are committed to by the team.',35),(187,'Team knows & agrees on what to deliver','The team understands what has to be delivered and agrees to deliver it.',12),(188,'Team released','The team has been released.',9),(189,'Team\'s input valued','The team members agree that their input is valued by the stakeholder representatives and treated with respect.',24),(190,'Technologies selected','Programming languages and technologies to be used have been selected.',6),(191,'Testable','The requirements are testable.',1),(192,'Timely feedback and decisions provided','The stakeholder representatives provide feedback and take part in decision making in a timely manner.',29),(193,'Tool needs agreed','The tool needs of the work and its stakeholders are agreed.',35),(194,'Tools naturally support way-of-working','The tools naturally support the way that the team works.',59),(195,'Unplanned work under control','Unplanned work is under control.',55),(196,'Updates stopped','Updates to the system will no longer be produced.',46),(197,'Used by whole team','The practices and tools are being used by the whole team to perform their work.',25),(198,'User documentation available','Installation and other user documentation are available.',40),(199,'Users identified','The stakeholders that will use the new system are identified.',14),(200,'Value realized clear','The set of requirement items implemented provide clear value to the stakeholders.',3),(201,'Value to be realized clear','The value provided by implementing the requirements is clear.',1),(202,'Waste continuously eliminated','Wasted work, and the potential for wasted work are continuously eliminated.',32),(203,'Way of working supported & respected','The stakeholder representative\'s support and respect the team\'s way of working.',42),(204,'Works as one unit','The team is working as one cohesive unit.',13);
/*!40000 ALTER TABLE `checkpoint_definitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkpoints`
--

DROP TABLE IF EXISTS `checkpoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkpoints` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fulfilled` tinyint(1) DEFAULT NULL,
  `alpha_id` int(11) DEFAULT NULL,
  `checkpoint_definition_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_checkpoints_on_alpha_id` (`alpha_id`),
  KEY `index_checkpoints_on_checkpoint_definition_id` (`checkpoint_definition_id`),
  CONSTRAINT `fk_rails_8fb90639cd` FOREIGN KEY (`checkpoint_definition_id`) REFERENCES `checkpoint_definitions` (`id`),
  CONSTRAINT `fk_rails_c71405ac6c` FOREIGN KEY (`alpha_id`) REFERENCES `alphas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=817 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkpoints`
--

LOCK TABLES `checkpoints` WRITE;
/*!40000 ALTER TABLE `checkpoints` DISABLE KEYS */;
INSERT INTO `checkpoints` VALUES (1,0,1,96),(2,0,1,155),(3,0,1,162),(4,0,1,115),(5,0,1,149),(6,0,1,13),(7,0,1,61),(8,0,1,99),(9,0,1,14),(10,0,1,86),(11,0,1,111),(12,0,1,150),(13,0,1,164),(14,0,1,98),(15,0,1,100),(16,0,1,151),(17,0,1,165),(18,0,1,181),(19,0,1,114),(20,0,1,118),(21,0,1,144),(22,0,1,152),(23,0,1,153),(24,0,1,154),(25,0,2,1),(26,0,2,18),(27,0,2,20),(28,0,2,191),(29,0,2,201),(30,0,2,43),(31,0,2,130),(32,0,2,182),(33,0,2,200),(34,0,2,12),(35,0,2,30),(36,0,2,41),(37,0,2,109),(38,0,2,129),(39,0,2,132),(40,0,2,147),(41,0,2,178),(42,0,2,180),(43,0,2,27),(44,0,2,45),(45,0,2,62),(46,0,2,73),(47,0,2,108),(48,0,2,116),(49,0,2,133),(50,0,2,134),(51,0,2,187),(52,0,2,53),(53,0,2,97),(54,0,2,160),(55,0,2,199),(56,0,2,88),(57,0,2,131),(58,0,2,159),(59,0,4,11),(60,0,4,17),(61,0,4,38),(62,0,4,59),(63,0,4,72),(64,0,4,170),(65,0,4,190),(66,0,4,10),(67,0,4,36),(68,0,4,37),(69,0,4,68),(70,0,4,69),(71,0,4,172),(72,0,4,8),(73,0,4,169),(74,0,4,175),(75,0,4,95),(76,0,4,163),(77,0,4,168),(78,0,4,198),(79,0,4,87),(80,0,4,90),(81,0,4,123),(82,0,4,196),(83,0,4,6),(84,0,4,39),(85,0,4,120),(86,0,4,171),(87,0,4,173),(88,0,4,174),(89,0,4,177),(90,0,6,83),(91,0,6,107),(92,0,6,121),(93,0,6,122),(94,0,6,189),(95,0,6,19),(96,0,6,124),(97,0,6,192),(98,0,6,71),(99,0,6,137),(100,0,6,158),(101,0,6,21),(102,0,6,125),(103,0,6,136),(104,0,6,203),(105,0,6,157),(106,0,6,179),(107,0,6,50),(108,0,6,176),(109,0,7,78),(110,0,7,84),(111,0,7,138),(112,0,7,25),(113,0,7,51),(114,0,7,81),(115,0,7,204),(116,0,7,24),(117,0,7,44),(118,0,7,48),(119,0,7,60),(120,0,7,63),(121,0,7,77),(122,0,7,79),(123,0,7,80),(124,0,7,146),(125,0,7,7),(126,0,7,28),(127,0,7,33),(128,0,7,142),(129,0,7,202),(130,0,7,26),(131,0,7,31),(132,0,7,57),(133,0,7,58),(134,0,7,74),(135,0,7,85),(136,0,7,126),(137,0,7,127),(138,0,7,139),(139,0,7,148),(140,0,8,55),(141,0,8,56),(142,0,8,66),(143,0,8,70),(144,0,8,92),(145,0,8,105),(146,0,8,4),(147,0,8,65),(148,0,8,197),(149,0,8,5),(150,0,8,49),(151,0,8,102),(152,0,8,103),(153,0,8,119),(154,0,8,167),(155,0,8,9),(156,0,8,94),(157,0,8,101),(158,0,8,161),(159,0,8,186),(160,0,8,193),(161,0,8,75),(162,0,8,89),(163,0,8,32),(164,0,8,104),(165,0,8,106),(166,0,8,194),(167,0,9,16),(168,0,9,47),(169,0,9,76),(170,0,9,82),(171,0,9,91),(172,0,9,188),(173,0,9,93),(174,0,9,140),(175,0,9,141),(176,0,9,3),(177,0,9,29),(178,0,9,54),(179,0,9,64),(180,0,9,110),(181,0,9,128),(182,0,9,156),(183,0,9,2),(184,0,9,15),(185,0,9,22),(186,0,9,34),(187,0,9,35),(188,0,9,52),(189,0,9,67),(190,0,9,135),(191,0,9,143),(192,0,9,166),(193,0,9,185),(194,0,9,40),(195,0,9,42),(196,0,9,113),(197,0,9,184),(198,0,9,23),(199,0,9,46),(200,0,9,112),(201,0,9,117),(202,0,9,145),(203,0,9,183),(204,0,9,195),(205,1,11,96),(206,1,11,155),(207,1,11,162),(208,0,11,115),(209,0,11,149),(210,1,11,13),(211,1,11,61),(212,1,11,99),(213,1,11,14),(214,1,11,86),(215,1,11,111),(216,1,11,150),(217,1,11,164),(218,1,11,98),(219,1,11,100),(220,1,11,151),(221,1,11,165),(222,1,11,181),(223,1,11,114),(224,1,11,118),(225,1,11,144),(226,1,11,152),(227,1,11,153),(228,1,11,154),(229,0,12,1),(230,0,12,18),(231,0,12,20),(232,0,12,191),(233,0,12,201),(234,0,12,43),(235,0,12,130),(236,0,12,182),(237,0,12,200),(238,1,12,12),(239,1,12,30),(240,1,12,41),(241,1,12,109),(242,1,12,129),(243,1,12,132),(244,1,12,147),(245,1,12,178),(246,1,12,180),(247,0,12,27),(248,0,12,45),(249,0,12,62),(250,0,12,73),(251,0,12,108),(252,0,12,116),(253,0,12,133),(254,0,12,134),(255,0,12,187),(256,1,12,53),(257,1,12,97),(258,1,12,160),(259,1,12,199),(260,0,12,88),(261,0,12,131),(262,0,12,159),(263,1,14,11),(264,1,14,17),(265,1,14,38),(266,1,14,59),(267,1,14,72),(268,0,14,170),(269,1,14,190),(270,0,14,10),(271,0,14,36),(272,0,14,37),(273,0,14,68),(274,0,14,69),(275,0,14,172),(276,0,14,8),(277,0,14,169),(278,0,14,175),(279,0,14,95),(280,0,14,163),(281,0,14,168),(282,0,14,198),(283,0,14,87),(284,0,14,90),(285,0,14,123),(286,0,14,196),(287,0,14,6),(288,0,14,39),(289,0,14,120),(290,0,14,171),(291,0,14,173),(292,0,14,174),(293,0,14,177),(294,0,16,83),(295,0,16,107),(296,0,16,121),(297,0,16,122),(298,0,16,189),(299,1,16,19),(300,1,16,124),(301,1,16,192),(302,1,16,71),(303,1,16,137),(304,1,16,158),(305,1,16,21),(306,1,16,125),(307,1,16,136),(308,1,16,203),(309,0,16,157),(310,0,16,179),(311,0,16,50),(312,0,16,176),(313,0,17,78),(314,0,17,84),(315,0,17,138),(316,0,17,25),(317,0,17,51),(318,0,17,81),(319,0,17,204),(320,0,17,24),(321,0,17,44),(322,0,17,48),(323,0,17,60),(324,0,17,63),(325,0,17,77),(326,0,17,79),(327,0,17,80),(328,0,17,146),(329,0,17,7),(330,0,17,28),(331,0,17,33),(332,0,17,142),(333,0,17,202),(334,0,17,26),(335,0,17,31),(336,0,17,57),(337,0,17,58),(338,0,17,74),(339,0,17,85),(340,0,17,126),(341,0,17,127),(342,0,17,139),(343,0,17,148),(344,0,18,55),(345,0,18,56),(346,0,18,66),(347,0,18,70),(348,0,18,92),(349,0,18,105),(350,0,18,4),(351,0,18,65),(352,0,18,197),(353,0,18,5),(354,0,18,49),(355,0,18,102),(356,0,18,103),(357,0,18,119),(358,0,18,167),(359,0,18,9),(360,0,18,94),(361,0,18,101),(362,0,18,161),(363,0,18,186),(364,0,18,193),(365,0,18,75),(366,0,18,89),(367,0,18,32),(368,0,18,104),(369,0,18,106),(370,0,18,194),(371,0,19,16),(372,0,19,47),(373,0,19,76),(374,0,19,82),(375,0,19,91),(376,0,19,188),(377,0,19,93),(378,0,19,140),(379,0,19,141),(380,1,19,3),(381,1,19,29),(382,1,19,54),(383,1,19,64),(384,1,19,110),(385,1,19,128),(386,1,19,156),(387,0,19,2),(388,0,19,15),(389,0,19,22),(390,0,19,34),(391,0,19,35),(392,0,19,52),(393,0,19,67),(394,0,19,135),(395,0,19,143),(396,0,19,166),(397,0,19,185),(398,0,19,40),(399,0,19,42),(400,0,19,113),(401,0,19,184),(402,0,19,23),(403,0,19,46),(404,0,19,112),(405,0,19,117),(406,0,19,145),(407,0,19,183),(408,0,19,195),(409,0,21,96),(410,0,21,155),(411,0,21,162),(412,0,21,115),(413,0,21,149),(414,0,21,13),(415,0,21,61),(416,0,21,99),(417,0,21,14),(418,0,21,86),(419,0,21,111),(420,0,21,150),(421,0,21,164),(422,0,21,98),(423,0,21,100),(424,0,21,151),(425,0,21,165),(426,0,21,181),(427,0,21,114),(428,0,21,118),(429,0,21,144),(430,0,21,152),(431,0,21,153),(432,0,21,154),(433,0,22,1),(434,0,22,18),(435,0,22,20),(436,0,22,191),(437,0,22,201),(438,0,22,43),(439,0,22,130),(440,0,22,182),(441,0,22,200),(442,0,22,12),(443,0,22,30),(444,0,22,41),(445,0,22,109),(446,0,22,129),(447,0,22,132),(448,0,22,147),(449,0,22,178),(450,0,22,180),(451,0,22,27),(452,0,22,45),(453,0,22,62),(454,0,22,73),(455,0,22,108),(456,0,22,116),(457,0,22,133),(458,0,22,134),(459,0,22,187),(460,0,22,53),(461,0,22,97),(462,0,22,160),(463,0,22,199),(464,0,22,88),(465,0,22,131),(466,0,22,159),(467,0,24,11),(468,0,24,17),(469,0,24,38),(470,0,24,59),(471,0,24,72),(472,0,24,170),(473,0,24,190),(474,0,24,10),(475,0,24,36),(476,0,24,37),(477,0,24,68),(478,0,24,69),(479,0,24,172),(480,0,24,8),(481,0,24,169),(482,0,24,175),(483,0,24,95),(484,0,24,163),(485,0,24,168),(486,0,24,198),(487,0,24,87),(488,0,24,90),(489,0,24,123),(490,0,24,196),(491,0,24,6),(492,0,24,39),(493,0,24,120),(494,0,24,171),(495,0,24,173),(496,0,24,174),(497,0,24,177),(498,0,26,83),(499,0,26,107),(500,0,26,121),(501,0,26,122),(502,0,26,189),(503,0,26,19),(504,0,26,124),(505,0,26,192),(506,0,26,71),(507,0,26,137),(508,0,26,158),(509,0,26,21),(510,0,26,125),(511,0,26,136),(512,0,26,203),(513,0,26,157),(514,0,26,179),(515,0,26,50),(516,0,26,176),(517,0,27,78),(518,0,27,84),(519,0,27,138),(520,0,27,25),(521,0,27,51),(522,0,27,81),(523,0,27,204),(524,0,27,24),(525,0,27,44),(526,0,27,48),(527,0,27,60),(528,0,27,63),(529,0,27,77),(530,0,27,79),(531,0,27,80),(532,0,27,146),(533,0,27,7),(534,0,27,28),(535,0,27,33),(536,0,27,142),(537,0,27,202),(538,0,27,26),(539,0,27,31),(540,0,27,57),(541,0,27,58),(542,0,27,74),(543,0,27,85),(544,0,27,126),(545,0,27,127),(546,0,27,139),(547,0,27,148),(548,0,28,55),(549,0,28,56),(550,0,28,66),(551,0,28,70),(552,0,28,92),(553,0,28,105),(554,0,28,4),(555,0,28,65),(556,0,28,197),(557,0,28,5),(558,0,28,49),(559,0,28,102),(560,0,28,103),(561,0,28,119),(562,0,28,167),(563,0,28,9),(564,0,28,94),(565,0,28,101),(566,0,28,161),(567,0,28,186),(568,0,28,193),(569,0,28,75),(570,0,28,89),(571,0,28,32),(572,0,28,104),(573,0,28,106),(574,0,28,194),(575,0,29,16),(576,0,29,47),(577,0,29,76),(578,0,29,82),(579,0,29,91),(580,0,29,188),(581,0,29,93),(582,0,29,140),(583,0,29,141),(584,0,29,3),(585,0,29,29),(586,0,29,54),(587,0,29,64),(588,0,29,110),(589,0,29,128),(590,0,29,156),(591,0,29,2),(592,0,29,15),(593,0,29,22),(594,0,29,34),(595,0,29,35),(596,0,29,52),(597,0,29,67),(598,0,29,135),(599,0,29,143),(600,0,29,166),(601,0,29,185),(602,0,29,40),(603,0,29,42),(604,0,29,113),(605,0,29,184),(606,0,29,23),(607,0,29,46),(608,0,29,112),(609,0,29,117),(610,0,29,145),(611,0,29,183),(612,0,29,195),(613,0,31,96),(614,0,31,155),(615,0,31,162),(616,0,31,115),(617,0,31,149),(618,0,31,13),(619,0,31,61),(620,0,31,99),(621,0,31,14),(622,0,31,86),(623,0,31,111),(624,0,31,150),(625,0,31,164),(626,0,31,98),(627,0,31,100),(628,0,31,151),(629,0,31,165),(630,0,31,181),(631,0,31,114),(632,0,31,118),(633,0,31,144),(634,0,31,152),(635,0,31,153),(636,0,31,154),(637,0,32,1),(638,0,32,18),(639,0,32,20),(640,0,32,191),(641,0,32,201),(642,0,32,43),(643,0,32,130),(644,0,32,182),(645,0,32,200),(646,0,32,12),(647,0,32,30),(648,0,32,41),(649,0,32,109),(650,0,32,129),(651,0,32,132),(652,0,32,147),(653,0,32,178),(654,0,32,180),(655,0,32,27),(656,0,32,45),(657,0,32,62),(658,0,32,73),(659,0,32,108),(660,0,32,116),(661,0,32,133),(662,0,32,134),(663,0,32,187),(664,0,32,53),(665,0,32,97),(666,0,32,160),(667,0,32,199),(668,0,32,88),(669,0,32,131),(670,0,32,159),(671,0,34,11),(672,0,34,17),(673,0,34,38),(674,0,34,59),(675,0,34,72),(676,0,34,170),(677,0,34,190),(678,0,34,10),(679,0,34,36),(680,0,34,37),(681,0,34,68),(682,0,34,69),(683,0,34,172),(684,0,34,8),(685,0,34,169),(686,0,34,175),(687,0,34,95),(688,0,34,163),(689,0,34,168),(690,0,34,198),(691,0,34,87),(692,0,34,90),(693,0,34,123),(694,0,34,196),(695,0,34,6),(696,0,34,39),(697,0,34,120),(698,0,34,171),(699,0,34,173),(700,0,34,174),(701,0,34,177),(702,0,36,83),(703,0,36,107),(704,0,36,121),(705,0,36,122),(706,0,36,189),(707,0,36,19),(708,0,36,124),(709,0,36,192),(710,0,36,71),(711,0,36,137),(712,0,36,158),(713,0,36,21),(714,0,36,125),(715,0,36,136),(716,0,36,203),(717,0,36,157),(718,0,36,179),(719,0,36,50),(720,0,36,176),(721,0,37,78),(722,0,37,84),(723,0,37,138),(724,0,37,25),(725,0,37,51),(726,0,37,81),(727,0,37,204),(728,0,37,24),(729,0,37,44),(730,0,37,48),(731,0,37,60),(732,0,37,63),(733,0,37,77),(734,0,37,79),(735,0,37,80),(736,0,37,146),(737,0,37,7),(738,0,37,28),(739,0,37,33),(740,0,37,142),(741,0,37,202),(742,0,37,26),(743,0,37,31),(744,0,37,57),(745,0,37,58),(746,0,37,74),(747,0,37,85),(748,0,37,126),(749,0,37,127),(750,0,37,139),(751,0,37,148),(752,0,38,55),(753,0,38,56),(754,0,38,66),(755,0,38,70),(756,0,38,92),(757,0,38,105),(758,0,38,4),(759,0,38,65),(760,0,38,197),(761,0,38,5),(762,0,38,49),(763,0,38,102),(764,0,38,103),(765,0,38,119),(766,0,38,167),(767,0,38,9),(768,0,38,94),(769,0,38,101),(770,0,38,161),(771,0,38,186),(772,0,38,193),(773,0,38,75),(774,0,38,89),(775,0,38,32),(776,0,38,104),(777,0,38,106),(778,0,38,194),(779,0,39,16),(780,0,39,47),(781,0,39,76),(782,0,39,82),(783,0,39,91),(784,0,39,188),(785,0,39,93),(786,0,39,140),(787,0,39,141),(788,0,39,3),(789,0,39,29),(790,0,39,54),(791,0,39,64),(792,0,39,110),(793,0,39,128),(794,0,39,156),(795,0,39,2),(796,0,39,15),(797,0,39,22),(798,0,39,34),(799,0,39,35),(800,0,39,52),(801,0,39,67),(802,0,39,135),(803,0,39,143),(804,0,39,166),(805,0,39,185),(806,0,39,40),(807,0,39,42),(808,0,39,113),(809,0,39,184),(810,0,39,23),(811,0,39,46),(812,0,39,112),(813,0,39,117),(814,0,39,145),(815,0,39,183),(816,0,39,195);
/*!40000 ALTER TABLE `checkpoints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commented_type` varchar(30) NOT NULL DEFAULT '',
  `commented_id` int(11) NOT NULL DEFAULT '0',
  `author_id` int(11) NOT NULL DEFAULT '0',
  `comments` text,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_comments_on_commented_id_and_commented_type` (`commented_id`,`commented_type`),
  KEY `index_comments_on_author_id` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_field_enumerations`
--

DROP TABLE IF EXISTS `custom_field_enumerations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_field_enumerations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `position` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_field_enumerations`
--

LOCK TABLES `custom_field_enumerations` WRITE;
/*!40000 ALTER TABLE `custom_field_enumerations` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_field_enumerations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields`
--

DROP TABLE IF EXISTS `custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `field_format` varchar(30) NOT NULL DEFAULT '',
  `possible_values` text,
  `regexp` varchar(255) DEFAULT '',
  `min_length` int(11) DEFAULT NULL,
  `max_length` int(11) DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `is_for_all` tinyint(1) NOT NULL DEFAULT '0',
  `is_filter` tinyint(1) NOT NULL DEFAULT '0',
  `position` int(11) DEFAULT NULL,
  `searchable` tinyint(1) DEFAULT '0',
  `default_value` text,
  `editable` tinyint(1) DEFAULT '1',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `multiple` tinyint(1) DEFAULT '0',
  `format_store` text,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `index_custom_fields_on_id_and_type` (`id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields`
--

LOCK TABLES `custom_fields` WRITE;
/*!40000 ALTER TABLE `custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields_projects`
--

DROP TABLE IF EXISTS `custom_fields_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_fields_projects` (
  `custom_field_id` int(11) NOT NULL DEFAULT '0',
  `project_id` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `index_custom_fields_projects_on_custom_field_id_and_project_id` (`custom_field_id`,`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields_projects`
--

LOCK TABLES `custom_fields_projects` WRITE;
/*!40000 ALTER TABLE `custom_fields_projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields_roles`
--

DROP TABLE IF EXISTS `custom_fields_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_fields_roles` (
  `custom_field_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  UNIQUE KEY `custom_fields_roles_ids` (`custom_field_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields_roles`
--

LOCK TABLES `custom_fields_roles` WRITE;
/*!40000 ALTER TABLE `custom_fields_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields_trackers`
--

DROP TABLE IF EXISTS `custom_fields_trackers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_fields_trackers` (
  `custom_field_id` int(11) NOT NULL DEFAULT '0',
  `tracker_id` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `index_custom_fields_trackers_on_custom_field_id_and_tracker_id` (`custom_field_id`,`tracker_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields_trackers`
--

LOCK TABLES `custom_fields_trackers` WRITE;
/*!40000 ALTER TABLE `custom_fields_trackers` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields_trackers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_values`
--

DROP TABLE IF EXISTS `custom_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customized_type` varchar(30) NOT NULL DEFAULT '',
  `customized_id` int(11) NOT NULL DEFAULT '0',
  `custom_field_id` int(11) NOT NULL DEFAULT '0',
  `value` text,
  PRIMARY KEY (`id`),
  KEY `custom_values_customized` (`customized_type`,`customized_id`),
  KEY `index_custom_values_on_custom_field_id` (`custom_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_values`
--

LOCK TABLES `custom_values` WRITE;
/*!40000 ALTER TABLE `custom_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_project_id` (`project_id`),
  KEY `index_documents_on_category_id` (`category_id`),
  KEY `index_documents_on_created_on` (`created_on`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_addresses`
--

DROP TABLE IF EXISTS `email_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `notify` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_email_addresses_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_addresses`
--

LOCK TABLES `email_addresses` WRITE;
/*!40000 ALTER TABLE `email_addresses` DISABLE KEYS */;
INSERT INTO `email_addresses` VALUES (1,1,'admin@example.net',1,1,'2019-11-13 03:31:50','2019-11-13 03:31:50'),(2,5,'somnoynadno@yandex.ru',1,1,'2021-02-15 05:44:57','2021-02-15 05:44:57'),(3,6,'perekrist31@gmail.com',1,1,'2021-03-13 07:04:07','2021-03-13 07:04:07'),(4,7,'7toretto7@gmail.com',1,1,'2021-03-15 04:52:42','2021-03-15 04:52:42'),(5,8,'rafikova0rr@gmail.com',1,1,'2021-03-17 05:44:08','2021-03-17 05:44:08'),(6,9,'rgarchangel@gmail.com',1,1,'2021-04-07 06:23:50','2021-04-07 06:23:50');
/*!40000 ALTER TABLE `email_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enabled_modules`
--

DROP TABLE IF EXISTS `enabled_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `enabled_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `enabled_modules_project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enabled_modules`
--

LOCK TABLES `enabled_modules` WRITE;
/*!40000 ALTER TABLE `enabled_modules` DISABLE KEYS */;
INSERT INTO `enabled_modules` VALUES (1,1,'issue_tracking'),(2,1,'time_tracking'),(3,1,'news'),(4,1,'documents'),(5,1,'files'),(6,1,'wiki'),(7,1,'repository'),(8,1,'boards'),(9,1,'calendar'),(10,1,'gantt'),(11,1,'semat_essence'),(23,3,'issue_tracking'),(33,3,'semat_essence'),(34,4,'issue_tracking'),(35,4,'time_tracking'),(36,4,'news'),(37,4,'documents'),(38,4,'files'),(39,4,'wiki'),(40,4,'repository'),(41,4,'boards'),(42,4,'calendar'),(43,4,'gantt'),(44,4,'semat_essence'),(45,5,'issue_tracking'),(46,5,'time_tracking'),(47,5,'news'),(48,5,'documents'),(49,5,'files'),(50,5,'wiki'),(51,5,'repository'),(52,5,'boards'),(53,5,'calendar'),(54,5,'gantt'),(55,5,'semat_essence');
/*!40000 ALTER TABLE `enabled_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enumerations`
--

DROP TABLE IF EXISTS `enumerations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `enumerations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `position` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `project_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `position_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_enumerations_on_project_id` (`project_id`),
  KEY `index_enumerations_on_id_and_type` (`id`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enumerations`
--

LOCK TABLES `enumerations` WRITE;
/*!40000 ALTER TABLE `enumerations` DISABLE KEYS */;
INSERT INTO `enumerations` VALUES (1,'Low',1,0,'IssuePriority',1,NULL,NULL,'lowest'),(2,'Normal',2,1,'IssuePriority',1,NULL,NULL,'default'),(3,'High',3,0,'IssuePriority',1,NULL,NULL,'high3'),(4,'Urgent',4,0,'IssuePriority',1,NULL,NULL,'high2'),(5,'Immediate',5,0,'IssuePriority',1,NULL,NULL,'highest'),(6,'User documentation',1,0,'DocumentCategory',1,NULL,NULL,NULL),(7,'Technical documentation',2,0,'DocumentCategory',1,NULL,NULL,NULL),(8,'Design',1,0,'TimeEntryActivity',1,NULL,NULL,NULL),(9,'Development',2,0,'TimeEntryActivity',1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `enumerations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups_users`
--

DROP TABLE IF EXISTS `groups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `groups_users` (
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  UNIQUE KEY `groups_users_ids` (`group_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_users`
--

LOCK TABLES `groups_users` WRITE;
/*!40000 ALTER TABLE `groups_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_items`
--

DROP TABLE IF EXISTS `import_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `import_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `import_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `obj_id` int(11) DEFAULT NULL,
  `message` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_items`
--

LOCK TABLES `import_items` WRITE;
/*!40000 ALTER TABLE `import_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imports`
--

DROP TABLE IF EXISTS `imports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `imports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `settings` text,
  `total_items` int(11) DEFAULT NULL,
  `finished` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imports`
--

LOCK TABLES `imports` WRITE;
/*!40000 ALTER TABLE `imports` DISABLE KEYS */;
/*!40000 ALTER TABLE `imports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_categories`
--

DROP TABLE IF EXISTS `issue_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `issue_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(60) NOT NULL DEFAULT '',
  `assigned_to_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `issue_categories_project_id` (`project_id`),
  KEY `index_issue_categories_on_assigned_to_id` (`assigned_to_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_categories`
--

LOCK TABLES `issue_categories` WRITE;
/*!40000 ALTER TABLE `issue_categories` DISABLE KEYS */;
INSERT INTO `issue_categories` VALUES (1,1,'Tasks',NULL);
/*!40000 ALTER TABLE `issue_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_relations`
--

DROP TABLE IF EXISTS `issue_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `issue_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_from_id` int(11) NOT NULL,
  `issue_to_id` int(11) NOT NULL,
  `relation_type` varchar(255) NOT NULL DEFAULT '',
  `delay` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_issue_relations_on_issue_from_id_and_issue_to_id` (`issue_from_id`,`issue_to_id`),
  KEY `index_issue_relations_on_issue_from_id` (`issue_from_id`),
  KEY `index_issue_relations_on_issue_to_id` (`issue_to_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_relations`
--

LOCK TABLES `issue_relations` WRITE;
/*!40000 ALTER TABLE `issue_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_statuses`
--

DROP TABLE IF EXISTS `issue_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `issue_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `is_closed` tinyint(1) NOT NULL DEFAULT '0',
  `position` int(11) DEFAULT NULL,
  `default_done_ratio` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_issue_statuses_on_position` (`position`),
  KEY `index_issue_statuses_on_is_closed` (`is_closed`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_statuses`
--

LOCK TABLES `issue_statuses` WRITE;
/*!40000 ALTER TABLE `issue_statuses` DISABLE KEYS */;
INSERT INTO `issue_statuses` VALUES (1,'New',0,1,NULL),(2,'In Progress',0,2,NULL),(3,'Resolved',0,3,NULL),(4,'Feedback',0,4,NULL),(5,'Closed',1,5,NULL),(6,'Rejected',1,6,NULL);
/*!40000 ALTER TABLE `issue_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issues`
--

DROP TABLE IF EXISTS `issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `issues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tracker_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `due_date` date DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  `assigned_to_id` int(11) DEFAULT NULL,
  `priority_id` int(11) NOT NULL,
  `fixed_version_id` int(11) DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `done_ratio` int(11) NOT NULL DEFAULT '0',
  `estimated_hours` float DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `root_id` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `closed_on` datetime DEFAULT NULL,
  `activity_definition_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `issues_project_id` (`project_id`),
  KEY `index_issues_on_status_id` (`status_id`),
  KEY `index_issues_on_category_id` (`category_id`),
  KEY `index_issues_on_assigned_to_id` (`assigned_to_id`),
  KEY `index_issues_on_fixed_version_id` (`fixed_version_id`),
  KEY `index_issues_on_tracker_id` (`tracker_id`),
  KEY `index_issues_on_priority_id` (`priority_id`),
  KEY `index_issues_on_author_id` (`author_id`),
  KEY `index_issues_on_created_on` (`created_on`),
  KEY `index_issues_on_root_id_and_lft_and_rgt` (`root_id`,`lft`,`rgt`),
  KEY `index_issues_on_parent_id` (`parent_id`),
  KEY `index_issues_on_activity_definition_id` (`activity_definition_id`),
  CONSTRAINT `fk_rails_f482d90bbb` FOREIGN KEY (`activity_definition_id`) REFERENCES `activity_definitions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issues`
--

LOCK TABLES `issues` WRITE;
/*!40000 ALTER TABLE `issues` DISABLE KEYS */;
INSERT INTO `issues` VALUES (1,2,3,'Agree Definition of Done 1','',NULL,NULL,1,NULL,2,NULL,1,0,'2019-11-13 04:37:55','2019-11-13 04:37:55','2019-11-13',0,NULL,NULL,1,1,2,0,NULL,2),(2,2,3,'Schedule the Timeboxes 1','',NULL,NULL,2,NULL,2,NULL,1,2,'2019-11-13 04:40:01','2019-11-13 04:41:56','2019-11-13',0,NULL,NULL,2,1,2,0,'2019-11-13 04:40:43',14),(3,2,3,'Daily Stand-Up 11-13-2019','',NULL,NULL,1,NULL,2,NULL,1,0,'2019-11-13 04:43:48','2019-11-13 04:43:48','2019-11-13',0,NULL,NULL,3,1,2,0,NULL,8),(4,2,3,'Daily Stand-Up 11-14-2019','',NULL,NULL,1,NULL,2,NULL,1,0,'2019-11-13 04:44:17','2019-11-13 04:44:17','2019-11-13',0,NULL,NULL,4,1,2,0,NULL,8),(5,2,3,'Build Stakeholder Network','',NULL,NULL,5,NULL,2,NULL,1,1,'2019-11-13 04:46:57','2019-11-13 04:47:11','2019-11-13',0,NULL,NULL,5,1,2,0,'2019-11-13 04:47:11',3),(6,2,4,'123','h3. ',NULL,NULL,1,NULL,2,NULL,1,2,'2021-03-03 10:09:12','2021-03-03 10:12:21','2021-03-03',0,NULL,NULL,6,1,2,0,'2021-03-03 10:09:40',1);
/*!40000 ALTER TABLE `issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journal_details`
--

DROP TABLE IF EXISTS `journal_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `journal_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `journal_id` int(11) NOT NULL DEFAULT '0',
  `property` varchar(30) NOT NULL DEFAULT '',
  `prop_key` varchar(30) NOT NULL DEFAULT '',
  `old_value` longtext,
  `value` longtext,
  PRIMARY KEY (`id`),
  KEY `journal_details_journal_id` (`journal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal_details`
--

LOCK TABLES `journal_details` WRITE;
/*!40000 ALTER TABLE `journal_details` DISABLE KEYS */;
INSERT INTO `journal_details` VALUES (1,1,'attr','status_id','1','5'),(2,1,'attr','activity_definition_id','1','14'),(3,2,'attr','status_id','5','2'),(4,3,'attr','status_id','1','5'),(5,4,'attr','status_id','1','5'),(6,5,'attr','status_id','5','1');
/*!40000 ALTER TABLE `journal_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journals`
--

DROP TABLE IF EXISTS `journals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `journals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `journalized_id` int(11) NOT NULL DEFAULT '0',
  `journalized_type` varchar(30) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `notes` longtext,
  `created_on` datetime NOT NULL,
  `private_notes` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `journals_journalized_id` (`journalized_id`,`journalized_type`),
  KEY `index_journals_on_user_id` (`user_id`),
  KEY `index_journals_on_journalized_id` (`journalized_id`),
  KEY `index_journals_on_created_on` (`created_on`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journals`
--

LOCK TABLES `journals` WRITE;
/*!40000 ALTER TABLE `journals` DISABLE KEYS */;
INSERT INTO `journals` VALUES (1,2,'Issue',1,'','2019-11-13 04:40:43',0),(2,2,'Issue',1,'','2019-11-13 04:41:56',0),(3,5,'Issue',1,'','2019-11-13 04:47:11',0),(4,6,'Issue',1,'','2021-03-03 10:09:40',0),(5,6,'Issue',1,'','2021-03-03 10:12:21',0);
/*!40000 ALTER TABLE `journals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `level_of_details_definitions`
--

DROP TABLE IF EXISTS `level_of_details_definitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `level_of_details_definitions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `order` int(11) DEFAULT NULL,
  `work_product_definition_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_level_of_details_definitions_on_work_product_definition_id` (`work_product_definition_id`),
  CONSTRAINT `fk_rails_7e0aafa1a4` FOREIGN KEY (`work_product_definition_id`) REFERENCES `work_product_definitions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level_of_details_definitions`
--

LOCK TABLES `level_of_details_definitions` WRITE;
/*!40000 ALTER TABLE `level_of_details_definitions` DISABLE KEYS */;
INSERT INTO `level_of_details_definitions` VALUES (1,'Automated','There is sufficient information captured in the appropriate form to enable the test script to be automatically executed by the chosen test automation technology.',30,9),(2,'Capacity Established','The level of committed availability of the team members to the team is captured sufficient to support the building of viable plans and making work commitments on this basis.',20,7),(3,'Capacity Estimated','The committed level of availability of the team members for the period of the timebox  is captured.',20,10),(4,'Communication Plans Outlined','There is a description of how the stakeholders of each type will be communicated with in order to ensure that their needs are being met.',30,6),(5,'Completion Conditions Listed','The set of things that need to be completed for a backlog item to be correctly considered to be done is clearly listed.',10,1),(6,'Cost-Benefit Quantified','The cost benefit of each the things of value to build into the product has been quantified, at least relatively, sufficient to support prioritization decisions, including what it is right to invest in developing next.',30,2),(7,'Items Gathered','There is a visible list of things of value to build into the product.',10,2),(8,'Items Prioritized','The list of things of value to build into the product is listed in priority order - from highest to lowest.',20,2),(9,'Members Identified','The people that make up the team are named.',10,7),(10,'Mission Clarified','The mission of the team is described in a way that ensures there is a shared understanding of what outcomes the team is collaborating to achieve.',10,8),(11,'Need Identified','The need for an opportunity to be addressed has been described sufficient for there to be a shared understanding of what the opportunity is that has been identified.',10,3),(12,'Objectives Clear','The goal or goals of the timebox have been captured and made visible.',10,10),(13,'Outlined','There is a sufficiently outlined description of the way of working of the team, primarily in terms of a listing of practices that are adopted.',20,8),(14,'Practices Described','The practices that the team are using are sufficiently described that it is clear what the team will be doing and how they will set about doing it.',30,8),(15,'Processes Fully Documented','All aspects of the team\'s way of working are fully documented, for example as a fully elaborated method comprising a fully elaborated set of practices.',40,8),(16,'Progress Analyzed','The rate of progress has been analyzed sufficient to support forecasting needs (e.g. as team velocity measured in story points).',20,5),(17,'Progress Columns Drawn-Up','There is a visible and accessible team board (either physical or electronic) with the progression states visible as columns that work items can be moved across to track their progress.',10,4),(18,'Progress Data Visible','The current state of progress is visible, for example as work items done and total associated sizing points (e.g. Story Points).',10,5),(19,'Progress of Objectives Visible','The progres that has been made towards the completion of the current work objectives isvisible, for example as a set of cards that represent all backlog items that are currently part of the work in progress, correctly positioned in the column that represents their current actual state of progress.',30,4),(20,'Quality Criteria and Evidence Described','The objective basis on which each quality condition will be assured, assessed and evidenced is fully defined.',20,1),(21,'ROI Projected','The return-on-investment profile for the solution has been quantified based on the outlined value release strategy.',40,3),(22,'Representatives Named','The names of suitable representatives for each stakeholder type have been captured.',20,6),(23,'Responsibilities Defined','The responsibilities of the team and the distribution of these across the team members are captured sufficient to support effective and effective collaborative working.',30,7),(24,'Scripted','There is a manual script that enables the test case to be executed in a repeatable way by a tester; including test data, test steps and instructions on how to evaluate expected test results.',20,9),(25,'Solution Envisaged','There is a description of the solution that has been envisaged as the best way to meet the identified need.',20,3),(26,'Stakeholder Types Described','The types of stakeholder that must be satisfied for the solution value to be realized have been captured.',10,6),(27,'Task-Level Effort Reported','The progress in completing the estimated tasks required to achieve the work objectives is captured and reported.',30,5),(28,'Task-Level Progress Visible','The tasks that the team need to do in order to complete the current work objectives are visible, for example as task cards that are progressed on the board, and are also associated with any related work item cards.',40,4),(29,'Tasks Estimated','Each timebox goal or work objective has been broken down into the tasks required to complete it and the tasks have been estimated sufficient to ensure that the plan is viable.',40,10),(30,'Test Ideas Captured','The reasoning that justifies the test case has been formulated, including why the test case exists and what aspect or part of the requirements is to be tested.',10,9),(31,'Value Release Strategy Outlined','There is a strategy outlined for delivering value as early and as often as possible by progressively advancing the available solution.',30,3),(32,'Viable Plan Outlined','What the team can commit to achieving based on the available capacity is described.',30,10),(33,'Work Objectives Visible','The current work objectives are visible, for example as a set of cards that represent all backlog items that are currently part of the work in progress.',20,4);
/*!40000 ALTER TABLE `level_of_details_definitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_roles`
--

DROP TABLE IF EXISTS `member_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `inherited_from` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_member_roles_on_member_id` (`member_id`),
  KEY `index_member_roles_on_role_id` (`role_id`),
  KEY `index_member_roles_on_inherited_from` (`inherited_from`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_roles`
--

LOCK TABLES `member_roles` WRITE;
/*!40000 ALTER TABLE `member_roles` DISABLE KEYS */;
INSERT INTO `member_roles` VALUES (1,1,3,NULL),(2,1,4,NULL);
/*!40000 ALTER TABLE `member_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `project_id` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `mail_notification` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_members_on_user_id_and_project_id` (`user_id`,`project_id`),
  KEY `index_members_on_user_id` (`user_id`),
  KEY `index_members_on_project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,1,1,'2019-11-13 04:18:28',0);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `board_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `content` text,
  `author_id` int(11) DEFAULT NULL,
  `replies_count` int(11) NOT NULL DEFAULT '0',
  `last_reply_id` int(11) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `locked` tinyint(1) DEFAULT '0',
  `sticky` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `messages_board_id` (`board_id`),
  KEY `messages_parent_id` (`parent_id`),
  KEY `index_messages_on_last_reply_id` (`last_reply_id`),
  KEY `index_messages_on_author_id` (`author_id`),
  KEY `index_messages_on_created_on` (`created_on`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `method_definitions`
--

DROP TABLE IF EXISTS `method_definitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `method_definitions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `method_definitions`
--

LOCK TABLES `method_definitions` WRITE;
/*!40000 ALTER TABLE `method_definitions` DISABLE KEYS */;
INSERT INTO `method_definitions` VALUES (1,''),(2,'Agile Essentials');
/*!40000 ALTER TABLE `method_definitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `title` varchar(60) NOT NULL DEFAULT '',
  `summary` varchar(255) DEFAULT '',
  `description` text,
  `author_id` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `comments_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `news_project_id` (`project_id`),
  KEY `index_news_on_author_id` (`author_id`),
  KEY `index_news_on_created_on` (`created_on`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `open_id_authentication_associations`
--

DROP TABLE IF EXISTS `open_id_authentication_associations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `open_id_authentication_associations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issued` int(11) DEFAULT NULL,
  `lifetime` int(11) DEFAULT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `assoc_type` varchar(255) DEFAULT NULL,
  `server_url` blob,
  `secret` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `open_id_authentication_associations`
--

LOCK TABLES `open_id_authentication_associations` WRITE;
/*!40000 ALTER TABLE `open_id_authentication_associations` DISABLE KEYS */;
/*!40000 ALTER TABLE `open_id_authentication_associations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `open_id_authentication_nonces`
--

DROP TABLE IF EXISTS `open_id_authentication_nonces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `open_id_authentication_nonces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` int(11) NOT NULL,
  `server_url` varchar(255) DEFAULT NULL,
  `salt` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `open_id_authentication_nonces`
--

LOCK TABLES `open_id_authentication_nonces` WRITE;
/*!40000 ALTER TABLE `open_id_authentication_nonces` DISABLE KEYS */;
/*!40000 ALTER TABLE `open_id_authentication_nonces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `homepage` varchar(255) DEFAULT '',
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  `parent_id` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `identifier` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `inherit_members` tinyint(1) NOT NULL DEFAULT '0',
  `default_version_id` int(11) DEFAULT NULL,
  `default_assigned_to_id` int(11) DEFAULT NULL,
  `method_definition_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_projects_on_lft` (`lft`),
  KEY `index_projects_on_rgt` (`rgt`),
  KEY `index_projects_on_method_definition_id` (`method_definition_id`),
  CONSTRAINT `fk_rails_4914ef446d` FOREIGN KEY (`method_definition_id`) REFERENCES `method_definitions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'Interesting Project','','',1,NULL,'2019-11-13 03:52:52','2019-11-13 04:32:42','interesting-project',9,3,4,0,NULL,NULL,2),(3,'Interesting Project','','',1,NULL,'2019-11-13 04:33:28','2019-11-13 04:33:37','interesting-project-1',1,1,2,0,NULL,NULL,2),(4,'New Project1','','',1,NULL,'2021-03-03 10:07:57','2021-03-03 10:08:09','new-project1',1,7,8,0,NULL,NULL,2),(5,'MyTestProj','','',1,NULL,'2021-03-10 07:56:32','2021-03-10 07:56:41','mytestproj',1,5,6,0,NULL,NULL,2);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_trackers`
--

DROP TABLE IF EXISTS `projects_trackers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects_trackers` (
  `project_id` int(11) NOT NULL DEFAULT '0',
  `tracker_id` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `projects_trackers_unique` (`project_id`,`tracker_id`),
  KEY `projects_trackers_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_trackers`
--

LOCK TABLES `projects_trackers` WRITE;
/*!40000 ALTER TABLE `projects_trackers` DISABLE KEYS */;
INSERT INTO `projects_trackers` VALUES (3,1),(3,2),(3,3),(4,1),(4,2),(4,3),(5,1),(5,2),(5,3);
/*!40000 ALTER TABLE `projects_trackers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queries`
--

DROP TABLE IF EXISTS `queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `queries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `filters` text,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `column_names` text,
  `sort_criteria` text,
  `group_by` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `visibility` int(11) DEFAULT '0',
  `options` text,
  PRIMARY KEY (`id`),
  KEY `index_queries_on_project_id` (`project_id`),
  KEY `index_queries_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queries`
--

LOCK TABLES `queries` WRITE;
/*!40000 ALTER TABLE `queries` DISABLE KEYS */;
/*!40000 ALTER TABLE `queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queries_roles`
--

DROP TABLE IF EXISTS `queries_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `queries_roles` (
  `query_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  UNIQUE KEY `queries_roles_ids` (`query_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queries_roles`
--

LOCK TABLES `queries_roles` WRITE;
/*!40000 ALTER TABLE `queries_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `queries_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repositories`
--

DROP TABLE IF EXISTS `repositories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `repositories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  `login` varchar(60) DEFAULT '',
  `password` varchar(255) DEFAULT '',
  `root_url` varchar(255) DEFAULT '',
  `type` varchar(255) DEFAULT NULL,
  `path_encoding` varchar(64) DEFAULT NULL,
  `log_encoding` varchar(64) DEFAULT NULL,
  `extra_info` longtext,
  `identifier` varchar(255) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_repositories_on_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repositories`
--

LOCK TABLES `repositories` WRITE;
/*!40000 ALTER TABLE `repositories` DISABLE KEYS */;
/*!40000 ALTER TABLE `repositories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `position` int(11) DEFAULT NULL,
  `assignable` tinyint(1) DEFAULT '1',
  `builtin` int(11) NOT NULL DEFAULT '0',
  `permissions` text,
  `issues_visibility` varchar(30) NOT NULL DEFAULT 'default',
  `users_visibility` varchar(30) NOT NULL DEFAULT 'all',
  `time_entries_visibility` varchar(30) NOT NULL DEFAULT 'all',
  `all_roles_managed` tinyint(1) NOT NULL DEFAULT '1',
  `settings` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Non member',0,1,1,'---\n- :view_issues\n- :add_issues\n- :add_issue_notes\n- :save_queries\n- :view_gantt\n- :view_calendar\n- :view_time_entries\n- :view_news\n- :comment_news\n- :view_documents\n- :view_wiki_pages\n- :view_wiki_edits\n- :view_messages\n- :add_messages\n- :view_files\n- :browse_repository\n- :view_changesets\n','default','all','all',1,NULL),(2,'Anonymous',0,1,2,'---\n- :view_issues\n- :view_gantt\n- :view_calendar\n- :view_time_entries\n- :view_news\n- :view_documents\n- :view_wiki_pages\n- :view_wiki_edits\n- :view_messages\n- :view_files\n- :browse_repository\n- :view_changesets\n','default','all','all',1,NULL),(3,'Manager',1,1,0,'---\n- :add_project\n- :edit_project\n- :close_project\n- :select_project_modules\n- :manage_members\n- :manage_versions\n- :add_subprojects\n- :manage_public_queries\n- :save_queries\n- :view_issues\n- :add_issues\n- :edit_issues\n- :copy_issues\n- :manage_issue_relations\n- :manage_subtasks\n- :set_issues_private\n- :set_own_issues_private\n- :add_issue_notes\n- :edit_issue_notes\n- :edit_own_issue_notes\n- :view_private_notes\n- :set_notes_private\n- :delete_issues\n- :view_issue_watchers\n- :add_issue_watchers\n- :delete_issue_watchers\n- :import_issues\n- :manage_categories\n- :view_time_entries\n- :log_time\n- :edit_time_entries\n- :edit_own_time_entries\n- :manage_project_activities\n- :view_news\n- :manage_news\n- :comment_news\n- :view_documents\n- :add_documents\n- :edit_documents\n- :delete_documents\n- :view_files\n- :manage_files\n- :view_wiki_pages\n- :view_wiki_edits\n- :export_wiki_pages\n- :edit_wiki_pages\n- :rename_wiki_pages\n- :delete_wiki_pages\n- :delete_wiki_pages_attachments\n- :protect_wiki_pages\n- :manage_wiki\n- :view_changesets\n- :browse_repository\n- :commit_access\n- :manage_related_issues\n- :manage_repository\n- :view_messages\n- :add_messages\n- :edit_messages\n- :edit_own_messages\n- :delete_messages\n- :delete_own_messages\n- :manage_boards\n- :view_calendar\n- :view_gantt\n','all','all','all',1,NULL),(4,'Developer',2,1,0,'---\n- :manage_versions\n- :manage_categories\n- :view_issues\n- :add_issues\n- :edit_issues\n- :view_private_notes\n- :set_notes_private\n- :manage_issue_relations\n- :manage_subtasks\n- :add_issue_notes\n- :save_queries\n- :view_gantt\n- :view_calendar\n- :log_time\n- :view_time_entries\n- :view_news\n- :comment_news\n- :view_documents\n- :view_wiki_pages\n- :view_wiki_edits\n- :edit_wiki_pages\n- :delete_wiki_pages\n- :view_messages\n- :add_messages\n- :edit_own_messages\n- :view_files\n- :manage_files\n- :browse_repository\n- :view_changesets\n- :commit_access\n- :manage_related_issues\n','default','all','all',1,NULL),(5,'Reporter',3,1,0,'---\n- :view_issues\n- :add_issues\n- :add_issue_notes\n- :save_queries\n- :view_gantt\n- :view_calendar\n- :log_time\n- :view_time_entries\n- :view_news\n- :comment_news\n- :view_documents\n- :view_wiki_pages\n- :view_wiki_edits\n- :view_messages\n- :add_messages\n- :edit_own_messages\n- :view_files\n- :browse_repository\n- :view_changesets\n','default','all','all',1,NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_managed_roles`
--

DROP TABLE IF EXISTS `roles_managed_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles_managed_roles` (
  `role_id` int(11) NOT NULL,
  `managed_role_id` int(11) NOT NULL,
  UNIQUE KEY `index_roles_managed_roles_on_role_id_and_managed_role_id` (`role_id`,`managed_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_managed_roles`
--

LOCK TABLES `roles_managed_roles` WRITE;
/*!40000 ALTER TABLE `roles_managed_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles_managed_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('1'),('1-semat_essence'),('10'),('100'),('101'),('102'),('103'),('104'),('105'),('106'),('107'),('108'),('11'),('12'),('13'),('14'),('15'),('16'),('17'),('18'),('19'),('2'),('2-semat_essence'),('20'),('20090214190337'),('20090312172426'),('20090312194159'),('20090318181151'),('20090323224724'),('20090401221305'),('20090401231134'),('20090403001910'),('20090406161854'),('20090425161243'),('20090503121501'),('20090503121505'),('20090503121510'),('20090614091200'),('20090704172350'),('20090704172355'),('20090704172358'),('20091010093521'),('20091017212227'),('20091017212457'),('20091017212644'),('20091017212938'),('20091017213027'),('20091017213113'),('20091017213151'),('20091017213228'),('20091017213257'),('20091017213332'),('20091017213444'),('20091017213536'),('20091017213642'),('20091017213716'),('20091017213757'),('20091017213835'),('20091017213910'),('20091017214015'),('20091017214107'),('20091017214136'),('20091017214236'),('20091017214308'),('20091017214336'),('20091017214406'),('20091017214440'),('20091017214519'),('20091017214611'),('20091017214644'),('20091017214720'),('20091017214750'),('20091025163651'),('20091108092559'),('20091114105931'),('20091123212029'),('20091205124427'),('20091220183509'),('20091220183727'),('20091220184736'),('20091225164732'),('20091227112908'),('20100129193402'),('20100129193813'),('20100221100219'),('20100313132032'),('20100313171051'),('20100705164950'),('20100819172912'),('20101104182107'),('20101107130441'),('20101114115114'),('20101114115359'),('20110220160626'),('20110223180944'),('20110223180953'),('20110224000000'),('20110226120112'),('20110226120132'),('20110227125750'),('20110228000000'),('20110228000100'),('20110401192910'),('20110408103312'),('20110412065600'),('20110511000000'),('20110902000000'),('20111201201315'),('20120115143024'),('20120115143100'),('20120115143126'),('20120127174243'),('20120205111326'),('20120223110929'),('20120301153455'),('20120422150750'),('20120705074331'),('20120707064544'),('20120714122000'),('20120714122100'),('20120714122200'),('20120731164049'),('20120930112914'),('20121026002032'),('20121026003537'),('20121209123234'),('20121209123358'),('20121213084931'),('20130110122628'),('20130201184705'),('20130202090625'),('20130207175206'),('20130207181455'),('20130215073721'),('20130215111127'),('20130215111141'),('20130217094251'),('20130602092539'),('20130710182539'),('20130713104233'),('20130713111657'),('20130729070143'),('20130911193200'),('20131004113137'),('20131005100610'),('20131124175346'),('20131210180802'),('20131214094309'),('20131215104612'),('20131218183023'),('20140228130325'),('20140903143914'),('20140920094058'),('20141029181752'),('20141029181824'),('20141109112308'),('20141122124142'),('20150113194759'),('20150113211532'),('20150113213922'),('20150113213955'),('20150208105930'),('20150510083747'),('20150525103953'),('20150526183158'),('20150528084820'),('20150528092912'),('20150528093249'),('20150725112753'),('20150730122707'),('20150730122735'),('20150921204850'),('20150921210243'),('20151020182334'),('20151020182731'),('20151021184614'),('20151021185456'),('20151021190616'),('20151024082034'),('20151025072118'),('20151031095005'),('20160404080304'),('20160416072926'),('20160529063352'),('20161001122012'),('20161002133421'),('20161010081301'),('20161010081528'),('20161010081600'),('20161126094932'),('20161220091118'),('20170207050700'),('20170302015225'),('20170309214320'),('20170320051650'),('20170418090031'),('20170419144536'),('21'),('22'),('23'),('24'),('25'),('26'),('27'),('28'),('29'),('3'),('30'),('31'),('32'),('33'),('34'),('35'),('36'),('37'),('38'),('39'),('4'),('40'),('41'),('42'),('43'),('44'),('45'),('46'),('47'),('48'),('49'),('5'),('50'),('51'),('52'),('53'),('54'),('55'),('56'),('57'),('58'),('59'),('6'),('60'),('61'),('62'),('63'),('64'),('65'),('66'),('67'),('68'),('69'),('7'),('70'),('71'),('72'),('73'),('74'),('75'),('76'),('77'),('78'),('79'),('8'),('80'),('81'),('82'),('83'),('84'),('85'),('86'),('87'),('88'),('89'),('9'),('90'),('91'),('92'),('93'),('94'),('95'),('96'),('97'),('98'),('99');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` text,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_settings_on_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state_definitions`
--

DROP TABLE IF EXISTS `state_definitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `state_definitions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `order` int(11) DEFAULT NULL,
  `alpha_definition_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_state_definitions_on_alpha_definition_id` (`alpha_definition_id`),
  CONSTRAINT `fk_rails_5953165767` FOREIGN KEY (`alpha_definition_id`) REFERENCES `alpha_definitions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state_definitions`
--

LOCK TABLES `state_definitions` WRITE;
/*!40000 ALTER TABLE `state_definitions` DISABLE KEYS */;
INSERT INTO `state_definitions` VALUES (1,'Acceptable','The requirements describe a system that is acceptable to the stakeholders.',40,2),(2,'Action Agreed','It has been agreed what action to take to enact or otherwise respond to an improvement.',30,9),(3,'Addressed','Enough of the requirements have been addressed to satisfy the need for a new system in a way that is acceptable to the stakeholders.',50,2),(4,'Addressed','A solution has been produced that demonstrably addresses the opportunity.',50,1),(5,'Adjourned','The team is no longer accountable for carrying out its mission.',50,5),(6,'Architecture Selected','An architecture has been selected that addresses the key technical risks and any applicable organizational constraints.',10,3),(7,'Benefit Accrued','The operational use or sale of the solution is creating tangible benefits.',60,1),(8,'Bounded','The purpose and theme of the new system are clear.',20,2),(9,'Closed','All remaining housekeeping tasks have been completed and the work has been officially closed.',60,7),(10,'Code Maintainable','Any necessary code refactoring has been done to ensure that the code is not only working but is also maintainable (or, at the very least, no less maintainable than before the change was applied).',40,11),(11,'Code Working','The code has been changed to achieve the purpose of the change and the implementation has been verified against relevant quality criteria.',20,11),(12,'Coherent','The requirements provide a coherent description of the essential characteristics of the new system.',30,2),(13,'Collaborating','The team members are working together as one unit.',30,5),(14,'Conceived','The need for a new system has been agreed.',10,2),(15,'Concluded','The work to produce the results has been concluded.',50,7),(16,'Demonstrable','An executable version of the system is available that demonstrates the architecture is fit for purpose and supports functional and non-functional testing.',20,3),(17,'Done','The item has been implemented in the product and has been demonstrated to be of adequate quality.',30,10),(18,'Formed','The team has been populated with enough committed people to start the mission.',20,5),(19,'Foundation Established','The key practices, and tools, that form the foundation of the way of working are selected and ready for use.',20,6),(20,'Fulfilled','The requirements that have been addressed fully satisfy the need for a new system.',60,2),(21,'Identified','A commercial, social or business opportunity has been identified that could be addressed by a software-based solution.',10,1),(22,'Identified','A possible adaptation to improve a team’s way of working has been identified.',10,9),(23,'Identified','A way to enhance the value of a product has been found.',10,10),(24,'In Agreement','The stakeholder representatives are in agreement.',40,4),(25,'In Place','All team members are using the way of working to accomplish their work.',40,6),(26,'In Use','The improvement is in use and now a fully embedded part of the team\'s way of working.',60,9),(27,'In Use','Some members of the team are using, and adapting, the way-of-working.',30,6),(28,'Initiated','The work has been requested.',10,7),(29,'Involved','The stakeholder representatives are actively involved in the work and fulfilling their responsibilities.',30,4),(30,'Operational','The system is in use in an operational environment.',50,3),(31,'Owned','There is clear ownership of the impediment in terms of an individual or sub-team that has accepted primary responsibility for its removal.',20,8),(32,'Performing','The team is working effectively and efficiently.',40,5),(33,'Planned','There is a viable plan outlined for the timebox including objectives, team member availability, and what the team can commit to achieving in terms of completed work items.',20,12),(34,'Prepared','All pre-conditions for starting the work have been met.',20,7),(35,'Principles Established','The principles, and constraints, that shape the way-of-working are established.',10,6),(36,'Prioritized','A possible adaptation to improve a team’s way of working has been prioritized so support decisions on what to focus on improving and when.',20,9),(37,'Purpose Clear','It is clear what the goal or outcome of the code change is: for example, the new test or tests that need to pass have been written.',10,11),(38,'Raised','The impediment has been identified, surfaced, verbalized or otherwise communicated.',10,8),(39,'Ready for Development','The item is sufficiently well understood that the team responsible for adding it to the product can plan and start the work to get this done.',20,10),(40,'Ready','The system (as a whole) has been accepted for deployment in a live environment.',40,3),(41,'Recognized','Stakeholders have been identified.',10,4),(42,'Represented','The mechanisms for involving the stakeholders are agreed and the stakeholder representatives have been appointed.',20,4),(43,'Resolved','Ther impediment has been cleared or removed so that the work that was being impeded can now be moved forward again efficiently and effectively.',30,8),(44,'Results Evaluated','The team has assessed the success or otherwise of the improvement.',50,9),(45,'Retired','The way of working is no longer in use by the team.',60,6),(46,'Retired','The system is no longer supported.',60,3),(47,'Reviewed','The outcomes of the timebox have been reviewed in terms of the actual objectives achieved and work items completed.',30,12),(48,'Satisfied for Deployment','The minimal expectations of the stakeholder representatives have been achieved.',50,4),(49,'Satisfied in Use','The system has met or exceeds the minimal stakeholder expectations.',60,4),(50,'Scheduled','The timebox has been defined in terms of its start and end times.',10,12),(51,'Seeded','The team\'s mission is clear and the know-how needed to grow the team is in place.',10,5),(52,'Solution Needed','The need for a software-based solution has been confirmed.',20,1),(53,'Started','The work is proceeding.',30,7),(54,'Trialed','The improvement has been enacted in such a way that the team is able to assess its success and decide whether to continue with the enactment, reverse out of it, or adapt it in some way.',40,9),(55,'Under Control','The work is going well, risks are under control, and productivity levels are sufficient to achieve a satisfactory result.',40,7),(56,'Usable','The system is usable and demonstrates all of the quality characteristics of an operational system.',30,3),(57,'Value Established','The value of a successful solution has been established.',30,1),(58,'Viable','It is agreed that a solution can be produced quickly and cheaply enough to successfully address the opportunity.',40,1),(59,'Working Well','The team\'s way of working is working well for the team.',50,6);
/*!40000 ALTER TABLE `state_definitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_entries`
--

DROP TABLE IF EXISTS `time_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `issue_id` int(11) DEFAULT NULL,
  `hours` float NOT NULL,
  `comments` varchar(1024) DEFAULT NULL,
  `activity_id` int(11) NOT NULL,
  `spent_on` date NOT NULL,
  `tyear` int(11) NOT NULL,
  `tmonth` int(11) NOT NULL,
  `tweek` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `time_entries_project_id` (`project_id`),
  KEY `time_entries_issue_id` (`issue_id`),
  KEY `index_time_entries_on_activity_id` (`activity_id`),
  KEY `index_time_entries_on_user_id` (`user_id`),
  KEY `index_time_entries_on_created_on` (`created_on`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_entries`
--

LOCK TABLES `time_entries` WRITE;
/*!40000 ALTER TABLE `time_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `action` varchar(30) NOT NULL DEFAULT '',
  `value` varchar(40) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tokens_value` (`value`),
  KEY `index_tokens_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
INSERT INTO `tokens` VALUES (3,1,'feeds','cc750ab2c4ab1dd7761b61373abf582c83121269','2019-11-13 03:33:58','2019-11-13 03:33:58'),(6,1,'session','675f86d1e860fc3981c1bec6b8500df45ec42826','2019-11-13 04:48:16','2019-11-13 04:54:52'),(7,1,'session','2f1874f5169c64c24ca2d9ce72eba4581dcd3b88','2021-02-10 10:09:12','2021-02-10 10:09:59'),(8,1,'session','d28895b03189b3807e0421246b7d9604871a0fa4','2021-02-10 10:15:31','2021-02-10 10:15:59'),(9,1,'session','eb51d9b1f45988f3ad1c5d8587dcef214d409114','2021-03-03 10:07:33','2021-03-03 10:14:09'),(10,1,'session','3650da8da292937440992079830438777c337167','2021-03-10 07:55:26','2021-03-10 07:56:42'),(11,1,'session','6fd6056a6721964bf821f798b5db54100c7b3767','2021-03-24 05:34:44','2021-03-24 05:34:44'),(12,1,'session','257821e3883f279df398ce5c279ea5c052c19010','2021-03-24 10:36:20','2021-03-24 10:36:20'),(13,1,'session','a1ca66be53b1b08931791ca774102ef4ba4dd3ce','2021-03-26 09:24:41','2021-03-26 09:24:42'),(14,1,'session','9b9102f36bcdc138c478c54e87f8ef7fdf2a6529','2021-11-26 13:11:05','2021-11-26 13:11:23'),(15,1,'session','23dfff3c4697b5cf89bffb915bbf7b1e293c8df3','2021-11-27 09:45:53','2021-11-27 09:46:17');
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trackers`
--

DROP TABLE IF EXISTS `trackers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `trackers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `is_in_chlog` tinyint(1) NOT NULL DEFAULT '0',
  `position` int(11) DEFAULT NULL,
  `is_in_roadmap` tinyint(1) NOT NULL DEFAULT '1',
  `fields_bits` int(11) DEFAULT '0',
  `default_status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trackers`
--

LOCK TABLES `trackers` WRITE;
/*!40000 ALTER TABLE `trackers` DISABLE KEYS */;
INSERT INTO `trackers` VALUES (1,'Bug',1,1,0,0,1),(2,'Feature',1,2,1,0,1),(3,'Support',0,3,0,0,1);
/*!40000 ALTER TABLE `trackers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_preferences`
--

DROP TABLE IF EXISTS `user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_preferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `others` text,
  `hide_mail` tinyint(1) DEFAULT '1',
  `time_zone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_preferences_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_preferences`
--

LOCK TABLES `user_preferences` WRITE;
/*!40000 ALTER TABLE `user_preferences` DISABLE KEYS */;
INSERT INTO `user_preferences` VALUES (1,1,'---\n:no_self_notified: \'1\'\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n:textarea_font: \'\'\n:gantt_zoom: 2\n:gantt_months: 6\n',1,''),(2,5,'---\n:no_self_notified: true\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n',1,''),(3,6,'---\n:no_self_notified: true\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n',1,''),(4,7,'---\n:no_self_notified: true\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n',0,''),(5,8,'---\n:no_self_notified: true\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n',0,''),(6,9,'---\n:no_self_notified: true\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n',0,'');
/*!40000 ALTER TABLE `user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL DEFAULT '',
  `hashed_password` varchar(40) NOT NULL DEFAULT '',
  `firstname` varchar(30) NOT NULL DEFAULT '',
  `lastname` varchar(255) NOT NULL DEFAULT '',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `last_login_on` datetime DEFAULT NULL,
  `language` varchar(5) DEFAULT '',
  `auth_source_id` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `identity_url` varchar(255) DEFAULT NULL,
  `mail_notification` varchar(255) NOT NULL DEFAULT '',
  `salt` varchar(64) DEFAULT NULL,
  `must_change_passwd` tinyint(1) NOT NULL DEFAULT '0',
  `passwd_changed_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_users_on_id_and_type` (`id`,`type`),
  KEY `index_users_on_auth_source_id` (`auth_source_id`),
  KEY `index_users_on_type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','7b2e9f54cdff413fcde01f330af6896c3cd7e6cd','Redmine','Admin',1,1,'2021-11-27 09:45:53','',NULL,'2019-11-13 03:31:10','2019-11-13 03:33:19','User',NULL,'all','',0,'2019-11-13 03:33:19'),(2,'','','','Anonymous users',0,1,NULL,'',NULL,'2019-11-13 03:31:48','2019-11-13 03:31:48','GroupAnonymous',NULL,'',NULL,0,NULL),(3,'','','','Non member users',0,1,NULL,'',NULL,'2019-11-13 03:31:48','2019-11-13 03:31:48','GroupNonMember',NULL,'',NULL,0,NULL),(4,'','','','Anonymous',0,0,NULL,'',NULL,'2019-11-13 03:32:52','2019-11-13 03:32:52','AnonymousUser',NULL,'only_my_events',NULL,0,NULL),(5,'somnoynadno','d9fb7fde2e7aa4c21e4379120321e033feba7ebf','Alexander','Zorkin',0,2,NULL,'en',NULL,'2021-02-15 05:44:57','2021-02-15 05:44:57','User',NULL,'only_my_events','744c55da18a093f11a0a06c2d2199616',0,'2021-02-15 05:44:57'),(6,'Kristina','4456e8a8b69dabc440cc3cbf699e527f4c665702','Kristina','Peregudova',0,2,NULL,'en',NULL,'2021-03-13 07:04:07','2021-03-13 07:04:07','User',NULL,'only_my_events','87aa40fbec39fb981aa730f6829f59cd',0,'2021-03-13 07:04:07'),(7,'alexey.shumeyko','a54cae31d09b71c86273e4656fa5f7deab6f6b34','Alexey','Shumeyko',0,2,NULL,'ru',NULL,'2021-03-15 04:52:42','2021-03-15 04:52:42','User',NULL,'only_my_events','d5bac469e853aa2c6abe517dd98e7d72',0,'2021-03-15 04:52:42'),(8,'rafikova_rr','ef5a87a9c6925b0db98cbc95aa009ebec1245c30','Rufina','Rafikova',0,2,NULL,'ru',NULL,'2021-03-17 05:44:08','2021-03-17 05:44:08','User',NULL,'only_my_events','ddf2afae6906a226f052e924579f74b4',0,'2021-03-17 05:44:08'),(9,'rgarchangel@gmail.com','77e1fc5df32113fa5b7b526242e6e7e350ab1795','Eduard','Zubchuk',0,2,NULL,'ru',NULL,'2021-04-07 06:23:50','2021-04-07 06:23:50','User',NULL,'only_my_events','e69b573efd7b17eb3050a6da081b5c02',0,'2021-04-07 06:23:50');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT '',
  `effective_date` date DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `wiki_page_title` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'open',
  `sharing` varchar(255) NOT NULL DEFAULT 'none',
  PRIMARY KEY (`id`),
  KEY `versions_project_id` (`project_id`),
  KEY `index_versions_on_sharing` (`sharing`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watchers`
--

DROP TABLE IF EXISTS `watchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `watchers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `watchable_type` varchar(255) NOT NULL DEFAULT '',
  `watchable_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `watchers_user_id_type` (`user_id`,`watchable_type`),
  KEY `index_watchers_on_user_id` (`user_id`),
  KEY `index_watchers_on_watchable_id_and_watchable_type` (`watchable_id`,`watchable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchers`
--

LOCK TABLES `watchers` WRITE;
/*!40000 ALTER TABLE `watchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `watchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_content_versions`
--

DROP TABLE IF EXISTS `wiki_content_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wiki_content_versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wiki_content_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `data` longblob,
  `compression` varchar(6) DEFAULT '',
  `comments` varchar(1024) DEFAULT '',
  `updated_on` datetime NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_content_versions_wcid` (`wiki_content_id`),
  KEY `index_wiki_content_versions_on_updated_on` (`updated_on`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_content_versions`
--

LOCK TABLES `wiki_content_versions` WRITE;
/*!40000 ALTER TABLE `wiki_content_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_content_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_contents`
--

DROP TABLE IF EXISTS `wiki_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wiki_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `text` longtext,
  `comments` varchar(1024) DEFAULT '',
  `updated_on` datetime NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_contents_page_id` (`page_id`),
  KEY `index_wiki_contents_on_author_id` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_contents`
--

LOCK TABLES `wiki_contents` WRITE;
/*!40000 ALTER TABLE `wiki_contents` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_pages`
--

DROP TABLE IF EXISTS `wiki_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wiki_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wiki_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_on` datetime NOT NULL,
  `protected` tinyint(1) NOT NULL DEFAULT '0',
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_pages_wiki_id_title` (`wiki_id`,`title`),
  KEY `index_wiki_pages_on_wiki_id` (`wiki_id`),
  KEY `index_wiki_pages_on_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_pages`
--

LOCK TABLES `wiki_pages` WRITE;
/*!40000 ALTER TABLE `wiki_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_redirects`
--

DROP TABLE IF EXISTS `wiki_redirects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wiki_redirects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wiki_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `redirects_to` varchar(255) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `redirects_to_wiki_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_redirects_wiki_id_title` (`wiki_id`,`title`),
  KEY `index_wiki_redirects_on_wiki_id` (`wiki_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_redirects`
--

LOCK TABLES `wiki_redirects` WRITE;
/*!40000 ALTER TABLE `wiki_redirects` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_redirects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wikis`
--

DROP TABLE IF EXISTS `wikis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wikis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `start_page` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `wikis_project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wikis`
--

LOCK TABLES `wikis` WRITE;
/*!40000 ALTER TABLE `wikis` DISABLE KEYS */;
INSERT INTO `wikis` VALUES (1,1,'Wiki',1),(3,3,'Wiki',1),(4,4,'Wiki',1),(5,5,'Wiki',1);
/*!40000 ALTER TABLE `wikis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_product_criterion_definitions`
--

DROP TABLE IF EXISTS `work_product_criterion_definitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_product_criterion_definitions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `criterion_type` int(11) DEFAULT NULL,
  `partial` tinyint(1) DEFAULT NULL,
  `minimal` tinyint(1) DEFAULT NULL,
  `activity_definition_id` int(11) DEFAULT NULL,
  `level_of_details_definition_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_wp_criterion_definitions_on_activity_definition_id` (`activity_definition_id`),
  KEY `index_wp_criterion_definitions_on_level_of_details_definition_id` (`level_of_details_definition_id`),
  CONSTRAINT `fk_rails_1f2f9b5d45` FOREIGN KEY (`level_of_details_definition_id`) REFERENCES `level_of_details_definitions` (`id`),
  CONSTRAINT `fk_rails_21ca30a9ba` FOREIGN KEY (`activity_definition_id`) REFERENCES `activity_definitions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_product_criterion_definitions`
--

LOCK TABLES `work_product_criterion_definitions` WRITE;
/*!40000 ALTER TABLE `work_product_criterion_definitions` DISABLE KEYS */;
INSERT INTO `work_product_criterion_definitions` VALUES (1,0,0,0,11,8),(2,1,0,1,2,5),(3,0,0,1,12,6),(4,1,0,0,12,8),(5,1,0,0,7,31),(6,1,0,0,13,19),(7,1,0,1,10,33),(8,1,0,1,13,16),(9,1,0,1,3,22),(10,1,0,1,16,2),(11,1,0,1,4,13),(12,1,0,0,16,13),(13,0,0,0,4,13),(14,0,0,0,6,30),(15,1,0,1,11,30),(16,1,0,1,6,24),(17,1,0,0,13,32),(18,1,0,1,10,32);
/*!40000 ALTER TABLE `work_product_criterion_definitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_product_criterions`
--

DROP TABLE IF EXISTS `work_product_criterions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_product_criterions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_id` int(11) DEFAULT NULL,
  `work_product_id` int(11) DEFAULT NULL,
  `work_product_criterion_definition_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_work_product_criterions_on_issue_id` (`issue_id`),
  KEY `index_work_product_criterions_on_work_product_id` (`work_product_id`),
  KEY `index_wp_criterions_on_wp_criterion_definition_id` (`work_product_criterion_definition_id`),
  CONSTRAINT `fk_rails_7435f0a6ba` FOREIGN KEY (`work_product_id`) REFERENCES `work_products` (`id`),
  CONSTRAINT `fk_rails_a0a925015c` FOREIGN KEY (`issue_id`) REFERENCES `issues` (`id`),
  CONSTRAINT `fk_rails_cd577925d1` FOREIGN KEY (`work_product_criterion_definition_id`) REFERENCES `work_product_criterion_definitions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_product_criterions`
--

LOCK TABLES `work_product_criterions` WRITE;
/*!40000 ALTER TABLE `work_product_criterions` DISABLE KEYS */;
INSERT INTO `work_product_criterions` VALUES (1,5,12,9);
/*!40000 ALTER TABLE `work_product_criterions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_product_definitions`
--

DROP TABLE IF EXISTS `work_product_definitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_product_definitions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `method_definition_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_work_product_definitions_on_method_definition_id` (`method_definition_id`),
  CONSTRAINT `fk_rails_0504cdde63` FOREIGN KEY (`method_definition_id`) REFERENCES `method_definitions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_product_definitions`
--

LOCK TABLES `work_product_definitions` WRITE;
/*!40000 ALTER TABLE `work_product_definitions` DISABLE KEYS */;
INSERT INTO `work_product_definitions` VALUES (1,'Definition of Done','The quality criteria that will be used to determine whether the product is of acceptable / releasable quality.',2),(2,'Product Backlog','An ordered list of things to build into the product to enhance its value.',2),(3,'Product Vision','Communicates what is ultimately wanted or needed from the product, as well as how value will be progressively realized.\r\n',2),(4,'Progress Board','Makes the work to do and the progress in doing it visible, ideally as a big physical board in the area where the team works together.',2),(5,'Progress Update','Communicates progress made in achieving objectives and/or progressing towards milestones.',2),(6,'Stakeholder Network','Who the stakeholder representatives are, and how we will engage with them throughout the endeavor.\r\n',2),(7,'Team Membership','Shows who is on the team and what percentage of their time is committed to the team. The people on the team are the one true source of all value, so absolute clarity regarding who is and is not dedicated to the team is crucial.',2),(8,'Team Way of Working','Captures in a clear, simple and visible way, statements from the team as to how they will work together to achieve their mission.',2),(9,'Test Case','Defines test inputs and expected results to help evaluate whether a specific aspect of the system works correctly.',2),(10,'Timebox Plan','Describes how the team will work to achieve the timebox objectives. \r\n\r\nThis might be captured as bullet points on flip-chart paper and then displayed near the Progress Board.',2);
/*!40000 ALTER TABLE `work_product_definitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_product_manifests`
--

DROP TABLE IF EXISTS `work_product_manifests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_product_manifests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lower_bound` int(11) DEFAULT NULL,
  `upper_bound` int(11) DEFAULT NULL,
  `alpha_definition_id` int(11) DEFAULT NULL,
  `work_product_definition_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_work_product_manifests_on_alpha_definition_id` (`alpha_definition_id`),
  KEY `index_work_product_manifests_on_work_product_definition_id` (`work_product_definition_id`),
  CONSTRAINT `fk_rails_1d30a36e36` FOREIGN KEY (`work_product_definition_id`) REFERENCES `work_product_definitions` (`id`),
  CONSTRAINT `fk_rails_6fa5fb83a6` FOREIGN KEY (`alpha_definition_id`) REFERENCES `alpha_definitions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_product_manifests`
--

LOCK TABLES `work_product_manifests` WRITE;
/*!40000 ALTER TABLE `work_product_manifests` DISABLE KEYS */;
INSERT INTO `work_product_manifests` VALUES (1,0,-1,2,9),(2,0,-1,7,5),(3,1,-1,2,1),(4,1,-1,7,4),(5,1,1,1,3),(6,1,1,12,10),(7,1,1,6,8),(8,1,1,5,7),(9,1,1,4,6),(10,1,1,2,2);
/*!40000 ALTER TABLE `work_product_manifests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_products`
--

DROP TABLE IF EXISTS `work_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `link` text,
  `project_id` int(11) DEFAULT NULL,
  `work_product_definition_id` int(11) DEFAULT NULL,
  `level_of_details_definition_id` int(11) DEFAULT NULL,
  `alpha_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_work_products_on_project_id` (`project_id`),
  KEY `index_work_products_on_work_product_definition_id` (`work_product_definition_id`),
  KEY `index_work_products_on_level_of_details_definition_id` (`level_of_details_definition_id`),
  KEY `index_work_products_on_alpha_id` (`alpha_id`),
  CONSTRAINT `fk_rails_46014145de` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  CONSTRAINT `fk_rails_8a1738424a` FOREIGN KEY (`level_of_details_definition_id`) REFERENCES `level_of_details_definitions` (`id`),
  CONSTRAINT `fk_rails_9cdbe427ce` FOREIGN KEY (`alpha_id`) REFERENCES `alphas` (`id`),
  CONSTRAINT `fk_rails_ce904ac9a3` FOREIGN KEY (`work_product_definition_id`) REFERENCES `work_product_definitions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_products`
--

LOCK TABLES `work_products` WRITE;
/*!40000 ALTER TABLE `work_products` DISABLE KEYS */;
INSERT INTO `work_products` VALUES (1,'Product Vision 1',NULL,1,3,NULL,1),(2,'Definition of Done 1',NULL,1,1,NULL,2),(3,'Product Backlog 1',NULL,1,2,NULL,2),(4,'Stakeholder Network 1',NULL,1,6,NULL,6),(5,'Team Membership 1',NULL,1,7,NULL,7),(6,'Team Way of Working 1',NULL,1,8,NULL,8),(7,'Progress Board 1',NULL,1,4,NULL,9),(8,'Timebox Plan 1',NULL,1,10,NULL,10),(9,'Product Vision 1',NULL,3,3,NULL,11),(10,'Definition of Done 1',NULL,3,1,NULL,12),(11,'Product Backlog 1',NULL,3,2,7,12),(12,'Stakeholder Network 1',NULL,3,6,22,16),(13,'Team Membership 1',NULL,3,7,NULL,17),(14,'Team Way of Working 1',NULL,3,8,NULL,18),(15,'Progress Board 1',NULL,3,4,NULL,19),(16,'Timebox Plan 1',NULL,3,10,NULL,20),(17,'Product Vision 1',NULL,4,3,NULL,21),(18,'Definition of Done 1',NULL,4,1,NULL,22),(19,'Product Backlog 1',NULL,4,2,NULL,22),(20,'Stakeholder Network 1',NULL,4,6,NULL,26),(21,'Team Membership 1',NULL,4,7,NULL,27),(22,'Team Way of Working 1',NULL,4,8,NULL,28),(23,'Progress Board 1',NULL,4,4,NULL,29),(24,'Timebox Plan 1',NULL,4,10,NULL,30),(25,'Product Vision 1',NULL,5,3,NULL,31),(26,'Definition of Done 1',NULL,5,1,NULL,32),(27,'Product Backlog 1',NULL,5,2,NULL,32),(28,'Stakeholder Network 1',NULL,5,6,NULL,36),(29,'Team Membership 1',NULL,5,7,NULL,37),(30,'Team Way of Working 1',NULL,5,8,NULL,38),(31,'Progress Board 1',NULL,5,4,NULL,39),(32,'Timebox Plan 1',NULL,5,10,NULL,40);
/*!40000 ALTER TABLE `work_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflows`
--

DROP TABLE IF EXISTS `workflows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tracker_id` int(11) NOT NULL DEFAULT '0',
  `old_status_id` int(11) NOT NULL DEFAULT '0',
  `new_status_id` int(11) NOT NULL DEFAULT '0',
  `role_id` int(11) NOT NULL DEFAULT '0',
  `assignee` tinyint(1) NOT NULL DEFAULT '0',
  `author` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(30) DEFAULT NULL,
  `field_name` varchar(30) DEFAULT NULL,
  `rule` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wkfs_role_tracker_old_status` (`role_id`,`tracker_id`,`old_status_id`),
  KEY `index_workflows_on_old_status_id` (`old_status_id`),
  KEY `index_workflows_on_role_id` (`role_id`),
  KEY `index_workflows_on_new_status_id` (`new_status_id`),
  KEY `index_workflows_on_tracker_id` (`tracker_id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflows`
--

LOCK TABLES `workflows` WRITE;
/*!40000 ALTER TABLE `workflows` DISABLE KEYS */;
INSERT INTO `workflows` VALUES (1,1,1,2,3,0,0,'WorkflowTransition',NULL,NULL),(2,1,1,3,3,0,0,'WorkflowTransition',NULL,NULL),(3,1,1,4,3,0,0,'WorkflowTransition',NULL,NULL),(4,1,1,5,3,0,0,'WorkflowTransition',NULL,NULL),(5,1,1,6,3,0,0,'WorkflowTransition',NULL,NULL),(6,1,2,1,3,0,0,'WorkflowTransition',NULL,NULL),(7,1,2,3,3,0,0,'WorkflowTransition',NULL,NULL),(8,1,2,4,3,0,0,'WorkflowTransition',NULL,NULL),(9,1,2,5,3,0,0,'WorkflowTransition',NULL,NULL),(10,1,2,6,3,0,0,'WorkflowTransition',NULL,NULL),(11,1,3,1,3,0,0,'WorkflowTransition',NULL,NULL),(12,1,3,2,3,0,0,'WorkflowTransition',NULL,NULL),(13,1,3,4,3,0,0,'WorkflowTransition',NULL,NULL),(14,1,3,5,3,0,0,'WorkflowTransition',NULL,NULL),(15,1,3,6,3,0,0,'WorkflowTransition',NULL,NULL),(16,1,4,1,3,0,0,'WorkflowTransition',NULL,NULL),(17,1,4,2,3,0,0,'WorkflowTransition',NULL,NULL),(18,1,4,3,3,0,0,'WorkflowTransition',NULL,NULL),(19,1,4,5,3,0,0,'WorkflowTransition',NULL,NULL),(20,1,4,6,3,0,0,'WorkflowTransition',NULL,NULL),(21,1,5,1,3,0,0,'WorkflowTransition',NULL,NULL),(22,1,5,2,3,0,0,'WorkflowTransition',NULL,NULL),(23,1,5,3,3,0,0,'WorkflowTransition',NULL,NULL),(24,1,5,4,3,0,0,'WorkflowTransition',NULL,NULL),(25,1,5,6,3,0,0,'WorkflowTransition',NULL,NULL),(26,1,6,1,3,0,0,'WorkflowTransition',NULL,NULL),(27,1,6,2,3,0,0,'WorkflowTransition',NULL,NULL),(28,1,6,3,3,0,0,'WorkflowTransition',NULL,NULL),(29,1,6,4,3,0,0,'WorkflowTransition',NULL,NULL),(30,1,6,5,3,0,0,'WorkflowTransition',NULL,NULL),(31,2,1,2,3,0,0,'WorkflowTransition',NULL,NULL),(32,2,1,3,3,0,0,'WorkflowTransition',NULL,NULL),(33,2,1,4,3,0,0,'WorkflowTransition',NULL,NULL),(34,2,1,5,3,0,0,'WorkflowTransition',NULL,NULL),(35,2,1,6,3,0,0,'WorkflowTransition',NULL,NULL),(36,2,2,1,3,0,0,'WorkflowTransition',NULL,NULL),(37,2,2,3,3,0,0,'WorkflowTransition',NULL,NULL),(38,2,2,4,3,0,0,'WorkflowTransition',NULL,NULL),(39,2,2,5,3,0,0,'WorkflowTransition',NULL,NULL),(40,2,2,6,3,0,0,'WorkflowTransition',NULL,NULL),(41,2,3,1,3,0,0,'WorkflowTransition',NULL,NULL),(42,2,3,2,3,0,0,'WorkflowTransition',NULL,NULL),(43,2,3,4,3,0,0,'WorkflowTransition',NULL,NULL),(44,2,3,5,3,0,0,'WorkflowTransition',NULL,NULL),(45,2,3,6,3,0,0,'WorkflowTransition',NULL,NULL),(46,2,4,1,3,0,0,'WorkflowTransition',NULL,NULL),(47,2,4,2,3,0,0,'WorkflowTransition',NULL,NULL),(48,2,4,3,3,0,0,'WorkflowTransition',NULL,NULL),(49,2,4,5,3,0,0,'WorkflowTransition',NULL,NULL),(50,2,4,6,3,0,0,'WorkflowTransition',NULL,NULL),(51,2,5,1,3,0,0,'WorkflowTransition',NULL,NULL),(52,2,5,2,3,0,0,'WorkflowTransition',NULL,NULL),(53,2,5,3,3,0,0,'WorkflowTransition',NULL,NULL),(54,2,5,4,3,0,0,'WorkflowTransition',NULL,NULL),(55,2,5,6,3,0,0,'WorkflowTransition',NULL,NULL),(56,2,6,1,3,0,0,'WorkflowTransition',NULL,NULL),(57,2,6,2,3,0,0,'WorkflowTransition',NULL,NULL),(58,2,6,3,3,0,0,'WorkflowTransition',NULL,NULL),(59,2,6,4,3,0,0,'WorkflowTransition',NULL,NULL),(60,2,6,5,3,0,0,'WorkflowTransition',NULL,NULL),(61,3,1,2,3,0,0,'WorkflowTransition',NULL,NULL),(62,3,1,3,3,0,0,'WorkflowTransition',NULL,NULL),(63,3,1,4,3,0,0,'WorkflowTransition',NULL,NULL),(64,3,1,5,3,0,0,'WorkflowTransition',NULL,NULL),(65,3,1,6,3,0,0,'WorkflowTransition',NULL,NULL),(66,3,2,1,3,0,0,'WorkflowTransition',NULL,NULL),(67,3,2,3,3,0,0,'WorkflowTransition',NULL,NULL),(68,3,2,4,3,0,0,'WorkflowTransition',NULL,NULL),(69,3,2,5,3,0,0,'WorkflowTransition',NULL,NULL),(70,3,2,6,3,0,0,'WorkflowTransition',NULL,NULL),(71,3,3,1,3,0,0,'WorkflowTransition',NULL,NULL),(72,3,3,2,3,0,0,'WorkflowTransition',NULL,NULL),(73,3,3,4,3,0,0,'WorkflowTransition',NULL,NULL),(74,3,3,5,3,0,0,'WorkflowTransition',NULL,NULL),(75,3,3,6,3,0,0,'WorkflowTransition',NULL,NULL),(76,3,4,1,3,0,0,'WorkflowTransition',NULL,NULL),(77,3,4,2,3,0,0,'WorkflowTransition',NULL,NULL),(78,3,4,3,3,0,0,'WorkflowTransition',NULL,NULL),(79,3,4,5,3,0,0,'WorkflowTransition',NULL,NULL),(80,3,4,6,3,0,0,'WorkflowTransition',NULL,NULL),(81,3,5,1,3,0,0,'WorkflowTransition',NULL,NULL),(82,3,5,2,3,0,0,'WorkflowTransition',NULL,NULL),(83,3,5,3,3,0,0,'WorkflowTransition',NULL,NULL),(84,3,5,4,3,0,0,'WorkflowTransition',NULL,NULL),(85,3,5,6,3,0,0,'WorkflowTransition',NULL,NULL),(86,3,6,1,3,0,0,'WorkflowTransition',NULL,NULL),(87,3,6,2,3,0,0,'WorkflowTransition',NULL,NULL),(88,3,6,3,3,0,0,'WorkflowTransition',NULL,NULL),(89,3,6,4,3,0,0,'WorkflowTransition',NULL,NULL),(90,3,6,5,3,0,0,'WorkflowTransition',NULL,NULL),(91,1,1,2,4,0,0,'WorkflowTransition',NULL,NULL),(92,1,1,3,4,0,0,'WorkflowTransition',NULL,NULL),(93,1,1,4,4,0,0,'WorkflowTransition',NULL,NULL),(94,1,1,5,4,0,0,'WorkflowTransition',NULL,NULL),(95,1,2,3,4,0,0,'WorkflowTransition',NULL,NULL),(96,1,2,4,4,0,0,'WorkflowTransition',NULL,NULL),(97,1,2,5,4,0,0,'WorkflowTransition',NULL,NULL),(98,1,3,2,4,0,0,'WorkflowTransition',NULL,NULL),(99,1,3,4,4,0,0,'WorkflowTransition',NULL,NULL),(100,1,3,5,4,0,0,'WorkflowTransition',NULL,NULL),(101,1,4,2,4,0,0,'WorkflowTransition',NULL,NULL),(102,1,4,3,4,0,0,'WorkflowTransition',NULL,NULL),(103,1,4,5,4,0,0,'WorkflowTransition',NULL,NULL),(104,2,1,2,4,0,0,'WorkflowTransition',NULL,NULL),(105,2,1,3,4,0,0,'WorkflowTransition',NULL,NULL),(106,2,1,4,4,0,0,'WorkflowTransition',NULL,NULL),(107,2,1,5,4,0,0,'WorkflowTransition',NULL,NULL),(108,2,2,3,4,0,0,'WorkflowTransition',NULL,NULL),(109,2,2,4,4,0,0,'WorkflowTransition',NULL,NULL),(110,2,2,5,4,0,0,'WorkflowTransition',NULL,NULL),(111,2,3,2,4,0,0,'WorkflowTransition',NULL,NULL),(112,2,3,4,4,0,0,'WorkflowTransition',NULL,NULL),(113,2,3,5,4,0,0,'WorkflowTransition',NULL,NULL),(114,2,4,2,4,0,0,'WorkflowTransition',NULL,NULL),(115,2,4,3,4,0,0,'WorkflowTransition',NULL,NULL),(116,2,4,5,4,0,0,'WorkflowTransition',NULL,NULL),(117,3,1,2,4,0,0,'WorkflowTransition',NULL,NULL),(118,3,1,3,4,0,0,'WorkflowTransition',NULL,NULL),(119,3,1,4,4,0,0,'WorkflowTransition',NULL,NULL),(120,3,1,5,4,0,0,'WorkflowTransition',NULL,NULL),(121,3,2,3,4,0,0,'WorkflowTransition',NULL,NULL),(122,3,2,4,4,0,0,'WorkflowTransition',NULL,NULL),(123,3,2,5,4,0,0,'WorkflowTransition',NULL,NULL),(124,3,3,2,4,0,0,'WorkflowTransition',NULL,NULL),(125,3,3,4,4,0,0,'WorkflowTransition',NULL,NULL),(126,3,3,5,4,0,0,'WorkflowTransition',NULL,NULL),(127,3,4,2,4,0,0,'WorkflowTransition',NULL,NULL),(128,3,4,3,4,0,0,'WorkflowTransition',NULL,NULL),(129,3,4,5,4,0,0,'WorkflowTransition',NULL,NULL),(130,1,1,5,5,0,0,'WorkflowTransition',NULL,NULL),(131,1,2,5,5,0,0,'WorkflowTransition',NULL,NULL),(132,1,3,5,5,0,0,'WorkflowTransition',NULL,NULL),(133,1,4,5,5,0,0,'WorkflowTransition',NULL,NULL),(134,1,3,4,5,0,0,'WorkflowTransition',NULL,NULL),(135,2,1,5,5,0,0,'WorkflowTransition',NULL,NULL),(136,2,2,5,5,0,0,'WorkflowTransition',NULL,NULL),(137,2,3,5,5,0,0,'WorkflowTransition',NULL,NULL),(138,2,4,5,5,0,0,'WorkflowTransition',NULL,NULL),(139,2,3,4,5,0,0,'WorkflowTransition',NULL,NULL),(140,3,1,5,5,0,0,'WorkflowTransition',NULL,NULL),(141,3,2,5,5,0,0,'WorkflowTransition',NULL,NULL),(142,3,3,5,5,0,0,'WorkflowTransition',NULL,NULL),(143,3,4,5,5,0,0,'WorkflowTransition',NULL,NULL),(144,3,3,4,5,0,0,'WorkflowTransition',NULL,NULL);
/*!40000 ALTER TABLE `workflows` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-29  5:43:18
