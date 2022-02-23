DROP DATABASE IF EXISTS mds_B3_uml;

CREATE DATABASE IF NOT EXISTS mds_B3_uml;

USE mds_b3_uml;

CREATE TABLE IF NOT EXISTS user (
  id INT UNSIGNED AUTO_INCREMENT, 
  fname VARCHAR(20), 
  lname VARCHAR(20),
  password VARCHAR(100),
  email VARCHAR(80) UNIQUE,
  phone DECIMAL(10,0),
  address TINYTEXT,
  city VARCHAR(60),
  zipcode DECIMAL(5, 0),
  country VARCHAR(20),
  updated_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW() NOT NULL,
  created_at TIMESTAMP NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS event (
  id INT UNSIGNED AUTO_INCREMENT,
  name VARCHAR(50),
  begin_date DATE,
  end_date DATE,
  cover TINYTEXT,
  updated_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW() NOT NULL,
  created_at TIMESTAMP NOT NULL,
  local_id INT UNSIGNED,
  album_id INT UNSIGNED,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS e_group (
  id INT UNSIGNED AUTO_INCREMENT,
  name VARCHAR(50),
  cover TINYTEXT,
  updated_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW() NOT NULL,
  created_at TIMESTAMP NOT NULL,
  user_id INT UNSIGNED,
  role_id INT UNSIGNED,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS type (
  id INT UNSIGNED AUTO_INCREMENT,
  name VARCHAR(20),
  updated_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW() NOT NULL,
  created_at TIMESTAMP NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS message (
  id INT UNSIGNED AUTO_INCREMENT,
  message TEXT,
  updated_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW() NOT NULL,
  created_at TIMESTAMP NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS album (
  id INT UNSIGNED AUTO_INCREMENT,
  name VARCHAR(50),
  updated_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW() NOT NULL,
  created_at TIMESTAMP NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS image (
  id INT UNSIGNED AUTO_INCREMENT,
  link TINYTEXT,
  updated_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW() NOT NULL,
  created_at TIMESTAMP NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS comment (
  id INT UNSIGNED AUTO_INCREMENT,
  message TEXT,
  updated_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW() NOT NULL,
  created_at TIMESTAMP NOT NULL,
  user_id INT UNSIGNED,
  comment_id INT UNSIGNED,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS ticket_office (
  id INT UNSIGNED AUTO_INCREMENT,
  name VARCHAR(20),
  updated_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW() NOT NULL,
  created_at TIMESTAMP NOT NULL,
  type_id INT UNSIGNED,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS ticket (
  id INT UNSIGNED AUTO_INCREMENT,
  name VARCHAR(50),
  price FLOAT,
  quantity SMALLINT,
  updated_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW() NOT NULL,
  created_at TIMESTAMP NOT NULL,
  type_id INT UNSIGNED,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS ticket_type (
  id INT UNSIGNED AUTO_INCREMENT,
  name VARCHAR(50),
  updated_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW() NOT NULL,
  created_at TIMESTAMP NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS role (
  id INT UNSIGNED AUTO_INCREMENT,
  name VARCHAR(20),
  updated_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW() NOT NULL,
  created_at TIMESTAMP NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS perm (
  id INT UNSIGNED AUTO_INCREMENT,
  name VARCHAR(20),
  updated_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW() NOT NULL,
  created_at TIMESTAMP NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS shopping_list (
  id INT UNSIGNED AUTO_INCREMENT,
  name VARCHAR(20),
  time DATE,
  updated_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW() NOT NULL,
  created_at TIMESTAMP NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS item (
  id INT UNSIGNED AUTO_INCREMENT,
  name VARCHAR(20),
  quantity INT,
  updated_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW() NOT NULL,
  created_at TIMESTAMP NOT NULL,
  shopping_id INT UNSIGNED,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS survey (
  id INT UNSIGNED AUTO_INCREMENT,
  name VARCHAR(30),
  updated_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW() NOT NULL,
  created_at TIMESTAMP NOT NULL,
  question_id INT UNSIGNED,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS question (
  id INT UNSIGNED AUTO_INCREMENT,
  content TEXT(500),
  updated_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW() NOT NULL,
  created_at TIMESTAMP NOT NULL,
   survey_id INT UNSIGNED,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS answer (
  id INT UNSIGNED AUTO_INCREMENT,
  content TINYTEXT,
  updated_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW() NOT NULL,
  created_at TIMESTAMP NOT NULL,
   question_id INT UNSIGNED,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS localization (
  id INT UNSIGNED AUTO_INCREMENT,
  name VARCHAR(30),
  updated_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW() NOT NULL,
  created_at TIMESTAMP NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS address (
  id INT UNSIGNED AUTO_INCREMENT,
  street_number TINYINT(3),
  street_name VARCHAR(50),
  city VARCHAR(30),
  country VARCHAR(20),
  updated_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW() NOT NULL,
  created_at TIMESTAMP NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS ride_sharing (
  id INT UNSIGNED AUTO_INCREMENT,
  name VARCHAR(30),
  time DATE,
  travel_max DATE,
  updated_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW() NOT NULL,
  created_at TIMESTAMP NOT NULL,
  local_id INT UNSIGNED,
  car_id INT UNSIGNED,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS car (
  id INT UNSIGNED AUTO_INCREMENT,
  name VARCHAR(20),
  places TINYINT,
  updated_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW() NOT NULL,
  created_at TIMESTAMP NOT NULL,
  ride_id INT UNSIGNED,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS group_member (
  user_id INT UNSIGNED,
  group_id INT UNSIGNED,
  role_id INT UNSIGNED  
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS event_member (
  user_id INT UNSIGNED,
  event_id INT UNSIGNED,
  role_id INT UNSIGNED
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS group_type (
  group_id INT UNSIGNED,
  type_id INT UNSIGNED
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS group_message (
  user_id INT UNSIGNED,
  group_id INT UNSIGNED,
  message_id INT UNSIGNED
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS event_message (
  user_id INT UNSIGNED,
  event_id INT UNSIGNED,
  message_id INT UNSIGNED
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS event_type (
  event_id INT UNSIGNED,
  type_id INT UNSIGNED
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS album_image (
  album_id INT UNSIGNED,
  image_id INT UNSIGNED
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS ticket_bought (
  user_id INT UNSIGNED,
  office_id INT UNSIGNED,
  ticket_id INT UNSIGNED
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS ticket_office (
  ticket_id INT UNSIGNED,
  office_id INT UNSIGNED
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS user_shopping (
  user_id INT UNSIGNED,
  shopping_id INT UNSIGNED
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS user_survey (
  user_id INT UNSIGNED,
  survey_id INT UNSIGNED
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS user_answer (
  user_id INT UNSIGNED,
  answer_id INT UNSIGNED
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS role_perm (
  role_id INT UNSIGNED,
  perm_id INT UNSIGNED
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS local_address (
  local_id INT UNSIGNED,
  address_id INT UNSIGNED
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS user_ride (
  user_id INT UNSIGNED,
  ride_id INT UNSIGNED
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE event ADD CONSTRAINT fk_event_album_id FOREIGN KEY (album_id) REFERENCES album(id);
ALTER TABLE event ADD CONSTRAINT fk_event_image_id FOREIGN KEY (local_id) REFERENCES localization(id);
ALTER TABLE e_group ADD CONSTRAINT fk_egroup_user_id FOREIGN KEY (user_id) REFERENCES user(id);
ALTER TABLE e_group ADD CONSTRAINT fk_egroup_role_id FOREIGN KEY (role_id) REFERENCES role(id);
ALTER TABLE comment ADD CONSTRAINT fk_comment_user_id FOREIGN KEY (user_id) REFERENCES user(id);
ALTER TABLE comment ADD CONSTRAINT fk_comment_comment_id FOREIGN KEY (comment_id) REFERENCES comment(id);
ALTER TABLE ticket ADD CONSTRAINT fk_ticket_type_id FOREIGN KEY (type_id) REFERENCES type(id);
ALTER TABLE item ADD CONSTRAINT fk_item_shopping_id FOREIGN KEY (shopping_id) REFERENCES shopping_list(id);
ALTER TABLE answer ADD CONSTRAINT fk_answer_question_id FOREIGN KEY (question_id) REFERENCES question(id);
ALTER TABLE question ADD CONSTRAINT fk_question_survey_id FOREIGN KEY (survey_id) REFERENCES survey(id);
ALTER TABLE ride_sharing ADD CONSTRAINT fk_ride_local_id FOREIGN KEY (local_id) REFERENCES localization(id);
ALTER TABLE ride_sharing ADD CONSTRAINT fk_ride_car_id FOREIGN KEY (car_id) REFERENCES car(id);
ALTER TABLE car ADD CONSTRAINT fk_car_ride_id FOREIGN KEY (ride_id) REFERENCES ride_sharing(id);
ALTER TABLE group_member ADD CONSTRAINT fk_group_member_user_id FOREIGN KEY (user_id) REFERENCES user(id);
ALTER TABLE group_member ADD CONSTRAINT fk_group_member_group_id FOREIGN KEY (group_id) REFERENCES e_group(id);
ALTER TABLE group_member ADD CONSTRAINT fk_group_member_role_id FOREIGN KEY (role_id) REFERENCES role(id);
ALTER TABLE event_member ADD CONSTRAINT fk_event_member_user_id FOREIGN KEY (user_id) REFERENCES user(id);
ALTER TABLE event_member ADD CONSTRAINT fk_event_member_event_id FOREIGN KEY (event_id) REFERENCES event(id);
ALTER TABLE event_member ADD CONSTRAINT fk_event_member_role_id FOREIGN KEY (role_id) REFERENCES role(id);
ALTER TABLE group_type ADD CONSTRAINT fk_group_type_group_id FOREIGN KEY (group_id) REFERENCES e_group(id);
ALTER TABLE group_type ADD CONSTRAINT fk_group_type_type_id FOREIGN KEY (type_id) REFERENCES type(id);
ALTER TABLE group_message ADD CONSTRAINT fk_group_message_user_id FOREIGN KEY (user_id) REFERENCES user(id);
ALTER TABLE group_message ADD CONSTRAINT fk_group_message_group_id FOREIGN KEY (group_id) REFERENCES e_group(id);
ALTER TABLE group_message ADD CONSTRAINT fk_group_message_message_id FOREIGN KEY (message_id) REFERENCES message(id);
ALTER TABLE event_message ADD CONSTRAINT fk_event_message_user_id FOREIGN KEY (user_id) REFERENCES user(id);
ALTER TABLE event_message ADD CONSTRAINT fk_event_message_event_id FOREIGN KEY (event_id) REFERENCES event(id);
ALTER TABLE event_message ADD CONSTRAINT fk_event_message_message_id FOREIGN KEY (message_id) REFERENCES message(id);
ALTER TABLE event_type ADD CONSTRAINT fk_event_type_event_id FOREIGN KEY (event_id) REFERENCES event(id);
ALTER TABLE event_type ADD CONSTRAINT fk_event_type_type_id FOREIGN KEY (type_id) REFERENCES type(id);
ALTER TABLE album_image ADD CONSTRAINT fk_album_image_album_id FOREIGN KEY (album_id) REFERENCES album(id);
ALTER TABLE album_image ADD CONSTRAINT fk_album_image_image_id FOREIGN KEY (image_id) REFERENCES image(id);
ALTER TABLE ticket_bought ADD CONSTRAINT fk_ticket_bought_user_id FOREIGN KEY (user_id) REFERENCES user(id);
ALTER TABLE ticket_bought ADD CONSTRAINT fk_ticket_bought_office_id FOREIGN KEY (office_id) REFERENCES ticket_office(id);
ALTER TABLE ticket_bought ADD CONSTRAINT fk_ticket_bought_ticket_id FOREIGN KEY (ticket_id) REFERENCES ticket(id);
ALTER TABLE ticket_office ADD CONSTRAINT fk_ticket_office_ticket_id FOREIGN KEY (ticket_id) REFERENCES ticket(id);
ALTER TABLE ticket_office ADD CONSTRAINT fk_ticket_office_office_id FOREIGN KEY (office_id) REFERENCES office(id);
ALTER TABLE user_shopping ADD CONSTRAINT fk_user_shopping_user_id FOREIGN KEY (user_id) REFERENCES user(id);
ALTER TABLE user_shopping ADD CONSTRAINT fk_user_shopping_shopping_id FOREIGN KEY (shopping_id) REFERENCES shopping_list(id);
ALTER TABLE user_survey ADD CONSTRAINT fk_user_survey_user_id FOREIGN KEY (user_id) REFERENCES user(id);
ALTER TABLE user_survey ADD CONSTRAINT fk_user_survey_survey_id FOREIGN KEY (survey_id) REFERENCES survey(id);
ALTER TABLE user_answer ADD CONSTRAINT fk_user_answer_user_id FOREIGN KEY (user_id) REFERENCES user(id);
ALTER TABLE user_answer ADD CONSTRAINT fk_user_answer_answer_id FOREIGN KEY (answer_id) REFERENCES answer(id);
ALTER TABLE role_perm ADD CONSTRAINT fk_role_perm_role_id FOREIGN KEY (role_id) REFERENCES role(id);
ALTER TABLE role_perm ADD CONSTRAINT fk_role_perm_perm_id FOREIGN KEY (perm_id) REFERENCES perm(id);
ALTER TABLE local_address ADD CONSTRAINT fk_local_address_local_id FOREIGN KEY (local_id) REFERENCES localization(id);
ALTER TABLE local_address ADD CONSTRAINT fk_local_address_address_id FOREIGN KEY (address_id) REFERENCES address(id);
ALTER TABLE user_ride ADD CONSTRAINT fk_user_ride_user_id FOREIGN KEY (user_id) REFERENCES user(id);
ALTER TABLE user_ride ADD CONSTRAINT fk_user_ride_ride_id FOREIGN KEY (ride_id) REFERENCES ride_sharing(id);
