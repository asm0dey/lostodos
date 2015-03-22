SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = ON;
SET check_function_bodies = FALSE;
SET client_min_messages = WARNING;

SET search_path = PUBLIC, pg_catalog;

SET search_path = PUBLIC, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = FALSE;

CREATE TABLE project (
  id                 BIGINT                      NOT NULL,
  created_by         CHARACTER VARYING(50)       NOT NULL,
  created_date       TIMESTAMP WITHOUT TIME ZONE NOT NULL,
  last_modified_by   CHARACTER VARYING(50),
  last_modified_date TIMESTAMP WITHOUT TIME ZONE,
  name               CHARACTER VARYING(255),
  owner_id           BIGINT                      NOT NULL
);


ALTER TABLE project OWNER TO lostodos;

CREATE SEQUENCE project_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE project_id_seq OWNER TO lostodos;

ALTER SEQUENCE project_id_seq OWNED BY project.id;
CREATE TABLE t_authority (
  name CHARACTER VARYING(50) NOT NULL
);


ALTER TABLE t_authority OWNER TO lostodos;

CREATE TABLE t_persistent_audit_event (
  event_id   BIGINT                 NOT NULL,
  event_date TIMESTAMP WITHOUT TIME ZONE,
  event_type CHARACTER VARYING(255),
  principal  CHARACTER VARYING(255) NOT NULL
);


ALTER TABLE t_persistent_audit_event OWNER TO lostodos;


CREATE TABLE t_persistent_audit_event_data (
  event_id BIGINT                 NOT NULL,
  value    CHARACTER VARYING(255),
  name     CHARACTER VARYING(255) NOT NULL
);


ALTER TABLE t_persistent_audit_event_data OWNER TO lostodos;


CREATE SEQUENCE t_persistent_audit_event_event_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE t_persistent_audit_event_event_id_seq OWNER TO lostodos;


ALTER SEQUENCE t_persistent_audit_event_event_id_seq OWNED BY t_persistent_audit_event.event_id;

CREATE TABLE t_persistent_token (
  series      CHARACTER VARYING(255) NOT NULL,
  ip_address  CHARACTER VARYING(39),
  token_date  DATE,
  token_value CHARACTER VARYING(255) NOT NULL,
  user_agent  CHARACTER VARYING(255),
  user_id     BIGINT
);


ALTER TABLE t_persistent_token OWNER TO lostodos;

CREATE TABLE t_user (
  id                 BIGINT                      NOT NULL,
  created_by         CHARACTER VARYING(50)       NOT NULL,
  created_date       TIMESTAMP WITHOUT TIME ZONE NOT NULL,
  last_modified_by   CHARACTER VARYING(50),
  last_modified_date TIMESTAMP WITHOUT TIME ZONE,
  email              CHARACTER VARYING(100),
  login              CHARACTER VARYING(50)       NOT NULL,
  password           CHARACTER VARYING(100)      NOT NULL
);


ALTER TABLE t_user OWNER TO lostodos;

CREATE TABLE t_user_authority (
  user_id        BIGINT                NOT NULL,
  authority_name CHARACTER VARYING(50) NOT NULL
);


ALTER TABLE t_user_authority OWNER TO lostodos;

CREATE SEQUENCE t_user_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE t_user_id_seq OWNER TO lostodos;

ALTER SEQUENCE t_user_id_seq OWNED BY t_user.id;

CREATE TABLE tag (
  id                 BIGINT                      NOT NULL,
  created_by         CHARACTER VARYING(50)       NOT NULL,
  created_date       TIMESTAMP WITHOUT TIME ZONE NOT NULL,
  last_modified_by   CHARACTER VARYING(50),
  last_modified_date TIMESTAMP WITHOUT TIME ZONE,
  color              CHARACTER VARYING(255)      NOT NULL,
  name               CHARACTER VARYING(255)      NOT NULL,
  owner_id           BIGINT                      NOT NULL
);


ALTER TABLE tag OWNER TO lostodos;

CREATE SEQUENCE tag_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE tag_id_seq OWNER TO lostodos;

ALTER SEQUENCE tag_id_seq OWNED BY tag.id;

CREATE TABLE tag_tasks (
  tags_id  BIGINT NOT NULL,
  tasks_id BIGINT NOT NULL
);


ALTER TABLE tag_tasks OWNER TO lostodos;

CREATE TABLE task_hierarchy_item (
  dtype              CHARACTER VARYING(31)       NOT NULL,
  id                 BIGINT                      NOT NULL,
  created_by         CHARACTER VARYING(50)       NOT NULL,
  created_date       TIMESTAMP WITHOUT TIME ZONE NOT NULL,
  last_modified_by   CHARACTER VARYING(50),
  last_modified_date TIMESTAMP WITHOUT TIME ZONE,
  name               CHARACTER VARYING(255)      NOT NULL,
  due_time           TIMESTAMP WITHOUT TIME ZONE,
  root               BOOLEAN,
  parent_id          BIGINT,
  project_id         BIGINT
);


ALTER TABLE task_hierarchy_item OWNER TO lostodos;

CREATE SEQUENCE task_hierarchy_item_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


ALTER TABLE task_hierarchy_item_id_seq OWNER TO lostodos;

ALTER SEQUENCE task_hierarchy_item_id_seq OWNED BY task_hierarchy_item.id;

ALTER TABLE ONLY project ALTER COLUMN id SET DEFAULT nextval('project_id_seq' :: REGCLASS);

ALTER TABLE ONLY t_persistent_audit_event ALTER COLUMN event_id SET DEFAULT nextval(
    't_persistent_audit_event_event_id_seq' :: REGCLASS);

ALTER TABLE ONLY t_user ALTER COLUMN id SET DEFAULT nextval('t_user_id_seq' :: REGCLASS);

ALTER TABLE ONLY tag ALTER COLUMN id SET DEFAULT nextval('tag_id_seq' :: REGCLASS);

ALTER TABLE ONLY task_hierarchy_item ALTER COLUMN id SET DEFAULT nextval('task_hierarchy_item_id_seq' :: REGCLASS);

SELECT pg_catalog.setval('project_id_seq', 1, FALSE);


SELECT pg_catalog.setval('t_persistent_audit_event_event_id_seq', 1, FALSE);


SELECT pg_catalog.setval('t_user_id_seq', 1, FALSE);


SELECT pg_catalog.setval('tag_id_seq', 1, FALSE);


SELECT pg_catalog.setval('task_hierarchy_item_id_seq', 1, FALSE);

ALTER TABLE ONLY project
ADD CONSTRAINT project_pkey PRIMARY KEY (id);

ALTER TABLE ONLY t_authority
ADD CONSTRAINT t_authority_pkey PRIMARY KEY (name);

ALTER TABLE ONLY t_persistent_audit_event_data
ADD CONSTRAINT t_persistent_audit_event_data_pkey PRIMARY KEY (event_id, name);

ALTER TABLE ONLY t_persistent_audit_event
ADD CONSTRAINT t_persistent_audit_event_pkey PRIMARY KEY (event_id);

ALTER TABLE ONLY t_persistent_token
ADD CONSTRAINT t_persistent_token_pkey PRIMARY KEY (series);

ALTER TABLE ONLY t_user_authority
ADD CONSTRAINT t_user_authority_pkey PRIMARY KEY (user_id, authority_name);

ALTER TABLE ONLY t_user
ADD CONSTRAINT t_user_pkey PRIMARY KEY (id);

ALTER TABLE ONLY tag
ADD CONSTRAINT tag_pkey PRIMARY KEY (id);

ALTER TABLE ONLY tag_tasks
ADD CONSTRAINT tag_tasks_pkey PRIMARY KEY (tags_id, tasks_id);

ALTER TABLE ONLY task_hierarchy_item
ADD CONSTRAINT task_hierarchy_item_pkey PRIMARY KEY (id);

ALTER TABLE ONLY t_user
ADD CONSTRAINT uk_i6qjjoe560mee5ajdg7v1o6mi UNIQUE (email);

ALTER TABLE ONLY tag
ADD CONSTRAINT usertag UNIQUE (owner_id, name);

ALTER TABLE ONLY tag
ADD CONSTRAINT fk_734uvj2o0lc1xkni3k1ll9k2x FOREIGN KEY (owner_id) REFERENCES t_user (id);

ALTER TABLE ONLY tag_tasks
ADD CONSTRAINT fk_8m9ars95vla6yl2rcef51cp5n FOREIGN KEY (tasks_id) REFERENCES task_hierarchy_item (id);

ALTER TABLE ONLY t_persistent_audit_event_data
ADD CONSTRAINT fk_cekdwiaydjn97qi7ebeexb1bw FOREIGN KEY (event_id) REFERENCES t_persistent_audit_event (event_id);

ALTER TABLE ONLY task_hierarchy_item
ADD CONSTRAINT fk_eatml8g602mf4er4vwrwo9mfe FOREIGN KEY (project_id) REFERENCES project (id);

ALTER TABLE ONLY t_user_authority
ADD CONSTRAINT fk_ei8y1xe1mmbsb69r952qqx2ch FOREIGN KEY (authority_name) REFERENCES t_authority (name);

ALTER TABLE ONLY t_persistent_token
ADD CONSTRAINT fk_nplwj41xm916m8jpkfxgw0905 FOREIGN KEY (user_id) REFERENCES t_user (id);

ALTER TABLE ONLY project
ADD CONSTRAINT fk_oe92jxold6k7tbv6w0hl89c5c FOREIGN KEY (owner_id) REFERENCES t_user (id);

ALTER TABLE ONLY task_hierarchy_item
ADD CONSTRAINT fk_pjqqpkvlp7j75rw1j902hcado FOREIGN KEY (parent_id) REFERENCES task_hierarchy_item (id);

ALTER TABLE ONLY t_user_authority
ADD CONSTRAINT fk_pkm88ipfoxp80vvihh7i5bqrs FOREIGN KEY (user_id) REFERENCES t_user (id);

ALTER TABLE ONLY tag_tasks
ADD CONSTRAINT fk_tntku54jm84qhv6etyc11oi14 FOREIGN KEY (tags_id) REFERENCES tag (id);