CREATE TABLE "laundry" (
id bigserial PRIMARY KEY,
title varchar(255),
image varchar(255),
content varchar(255),
date_created timestamp NOT NULL DEFAULT Now(),
date_updated timestamp NOT NULL DEFAULT Now()
);

CREATE TABLE "authentications" (
  "id" serial not null PRIMARY KEY,
  "role_id" bigint NOT NULL,
  "email" varchar NOT NULL,
  "password" varchar NOT NULL,
  "created_at" timestamp default current_timestamp
);

INSERT INTO "authentications" 
	VALUES (1, 1, 'mosesozoumeh@gmail.com','$2y$12$I6SrnTYJu.NTVKFIrKfcSObXxkJ1w0rKpt/2K8Ok1KBWiDtGZ9pne');
INSERT INTO "authentications"
	VALUES (2, 1, 'chidera.levsports@gmail.com','$2y$12$FhAyitEt425Gqe0pBnMsHO/X.8.RZ8tF/l8bCCY/f7VOhREG3Wd2e');

CREATE TABLE "about" (
  id bigserial 	PRIMARY KEY,
  title varchar(255),
  content text,
	images varchar(255),
  date_created timestamp NOT NULL DEFAULT Now(),
	date_updated timestamp NOT NULL DEFAULT Now()
);

CREATE TABLE "contactus" (
  id bigserial 	PRIMARY KEY,
  title varchar(255),
  content text,
	images varchar(255),
  date_created timestamp NOT NULL DEFAULT Now(),
	date_updated timestamp NOT NULL DEFAULT Now()
);
CREATE TABLE "price" (
id bigserial PRIMARY KEY,
name varchar(255),
price varchar(255),
date_created timestamp NOT NULL DEFAULT Now(),
date_updated timestamp NOT NULL DEFAULT Now()
);
