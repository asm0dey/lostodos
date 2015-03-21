--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: t_authority; Type: TABLE; Schema: public; Owner: lostodos; Tablespace: 
--

CREATE TABLE t_authority (
    name character varying(50) NOT NULL
);


ALTER TABLE t_authority OWNER TO lostodos;

--
-- Name: t_persistent_audit_event; Type: TABLE; Schema: public; Owner: lostodos; Tablespace: 
--

CREATE TABLE t_persistent_audit_event (
    event_id bigint NOT NULL,
    event_date timestamp without time zone,
    event_type character varying(255),
    principal character varying(255) NOT NULL
);


ALTER TABLE t_persistent_audit_event OWNER TO lostodos;

--
-- Name: t_persistent_audit_event_data; Type: TABLE; Schema: public; Owner: lostodos; Tablespace: 
--

CREATE TABLE t_persistent_audit_event_data (
    event_id bigint NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE t_persistent_audit_event_data OWNER TO lostodos;

--
-- Name: t_persistent_audit_event_event_id_seq; Type: SEQUENCE; Schema: public; Owner: lostodos
--

CREATE SEQUENCE t_persistent_audit_event_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE t_persistent_audit_event_event_id_seq OWNER TO lostodos;

--
-- Name: t_persistent_audit_event_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lostodos
--

ALTER SEQUENCE t_persistent_audit_event_event_id_seq OWNED BY t_persistent_audit_event.event_id;


--
-- Name: t_persistent_token; Type: TABLE; Schema: public; Owner: lostodos; Tablespace: 
--

CREATE TABLE t_persistent_token (
    series character varying(255) NOT NULL,
    ip_address character varying(39),
    token_date date,
    token_value character varying(255) NOT NULL,
    user_agent character varying(255),
    user_id bigint
);


ALTER TABLE t_persistent_token OWNER TO lostodos;

--
-- Name: t_user; Type: TABLE; Schema: public; Owner: lostodos; Tablespace: 
--

CREATE TABLE t_user (
    id bigint NOT NULL,
    created_by character varying(50) NOT NULL,
    created_date timestamp without time zone NOT NULL,
    last_modified_by character varying(50),
    last_modified_date timestamp without time zone,
    activated boolean NOT NULL,
    activation_key character varying(20),
    email character varying(100),
    first_name character varying(50),
    lang_key character varying(5),
    last_name character varying(50),
    login character varying(50) NOT NULL,
    password character varying(100) NOT NULL
);


ALTER TABLE t_user OWNER TO lostodos;

--
-- Name: t_user_authority; Type: TABLE; Schema: public; Owner: lostodos; Tablespace: 
--

CREATE TABLE t_user_authority (
    user_id bigint NOT NULL,
    authority_name character varying(50) NOT NULL
);


ALTER TABLE t_user_authority OWNER TO lostodos;

--
-- Name: t_user_id_seq; Type: SEQUENCE; Schema: public; Owner: lostodos
--

CREATE SEQUENCE t_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE t_user_id_seq OWNER TO lostodos;

--
-- Name: t_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lostodos
--

ALTER SEQUENCE t_user_id_seq OWNED BY t_user.id;


--
-- Name: tag; Type: TABLE; Schema: public; Owner: lostodos; Tablespace: 
--

CREATE TABLE tag (
    id bigint NOT NULL,
    created_by character varying(50) NOT NULL,
    created_date timestamp without time zone NOT NULL,
    last_modified_by character varying(50),
    last_modified_date timestamp without time zone,
    color character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    owner_id bigint NOT NULL
);


ALTER TABLE tag OWNER TO lostodos;

--
-- Name: tag_id_seq; Type: SEQUENCE; Schema: public; Owner: lostodos
--

CREATE SEQUENCE tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tag_id_seq OWNER TO lostodos;

--
-- Name: tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lostodos
--

ALTER SEQUENCE tag_id_seq OWNED BY tag.id;


--
-- Name: tag_tasks; Type: TABLE; Schema: public; Owner: lostodos; Tablespace: 
--

CREATE TABLE tag_tasks (
    tags_id bigint NOT NULL,
    tasks_id bigint NOT NULL
);


ALTER TABLE tag_tasks OWNER TO lostodos;

--
-- Name: task_hierarchy_item; Type: TABLE; Schema: public; Owner: lostodos; Tablespace: 
--

CREATE TABLE task_hierarchy_item (
    dtype character varying(31) NOT NULL,
    id bigint NOT NULL,
    created_by character varying(50) NOT NULL,
    created_date timestamp without time zone NOT NULL,
    last_modified_by character varying(50),
    last_modified_date timestamp without time zone,
    name character varying(255) NOT NULL,
    due_time timestamp without time zone,
    root boolean,
    owner_id bigint NOT NULL,
    parent_id bigint
);


ALTER TABLE task_hierarchy_item OWNER TO lostodos;

--
-- Name: task_hierarchy_item_id_seq; Type: SEQUENCE; Schema: public; Owner: lostodos
--

CREATE SEQUENCE task_hierarchy_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE task_hierarchy_item_id_seq OWNER TO lostodos;

--
-- Name: task_hierarchy_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lostodos
--

ALTER SEQUENCE task_hierarchy_item_id_seq OWNED BY task_hierarchy_item.id;


--
-- Name: event_id; Type: DEFAULT; Schema: public; Owner: lostodos
--

ALTER TABLE ONLY t_persistent_audit_event ALTER COLUMN event_id SET DEFAULT nextval('t_persistent_audit_event_event_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lostodos
--

ALTER TABLE ONLY t_user ALTER COLUMN id SET DEFAULT nextval('t_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lostodos
--

ALTER TABLE ONLY tag ALTER COLUMN id SET DEFAULT nextval('tag_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lostodos
--

ALTER TABLE ONLY task_hierarchy_item ALTER COLUMN id SET DEFAULT nextval('task_hierarchy_item_id_seq'::regclass);


--
-- Data for Name: t_authority; Type: TABLE DATA; Schema: public; Owner: lostodos
--

INSERT INTO t_authority VALUES ('ROLE_USER');


--
-- Data for Name: t_persistent_audit_event; Type: TABLE DATA; Schema: public; Owner: lostodos
--



--
-- Data for Name: t_persistent_audit_event_data; Type: TABLE DATA; Schema: public; Owner: lostodos
--



--
-- Name: t_persistent_audit_event_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lostodos
--

SELECT pg_catalog.setval('t_persistent_audit_event_event_id_seq', 1, false);


--
-- Data for Name: t_persistent_token; Type: TABLE DATA; Schema: public; Owner: lostodos
--



--
-- Data for Name: t_user; Type: TABLE DATA; Schema: public; Owner: lostodos
--



--
-- Data for Name: t_user_authority; Type: TABLE DATA; Schema: public; Owner: lostodos
--



--
-- Name: t_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lostodos
--

SELECT pg_catalog.setval('t_user_id_seq', 1, false);


--
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: lostodos
--



--
-- Name: tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lostodos
--

SELECT pg_catalog.setval('tag_id_seq', 1, false);


--
-- Data for Name: tag_tasks; Type: TABLE DATA; Schema: public; Owner: lostodos
--



--
-- Data for Name: task_hierarchy_item; Type: TABLE DATA; Schema: public; Owner: lostodos
--



--
-- Name: task_hierarchy_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lostodos
--

SELECT pg_catalog.setval('task_hierarchy_item_id_seq', 1, false);


--
-- Name: t_authority_pkey; Type: CONSTRAINT; Schema: public; Owner: lostodos; Tablespace: 
--

ALTER TABLE ONLY t_authority
    ADD CONSTRAINT t_authority_pkey PRIMARY KEY (name);


--
-- Name: t_persistent_audit_event_data_pkey; Type: CONSTRAINT; Schema: public; Owner: lostodos; Tablespace: 
--

ALTER TABLE ONLY t_persistent_audit_event_data
    ADD CONSTRAINT t_persistent_audit_event_data_pkey PRIMARY KEY (event_id, name);


--
-- Name: t_persistent_audit_event_pkey; Type: CONSTRAINT; Schema: public; Owner: lostodos; Tablespace: 
--

ALTER TABLE ONLY t_persistent_audit_event
    ADD CONSTRAINT t_persistent_audit_event_pkey PRIMARY KEY (event_id);


--
-- Name: t_persistent_token_pkey; Type: CONSTRAINT; Schema: public; Owner: lostodos; Tablespace: 
--

ALTER TABLE ONLY t_persistent_token
    ADD CONSTRAINT t_persistent_token_pkey PRIMARY KEY (series);


--
-- Name: t_user_authority_pkey; Type: CONSTRAINT; Schema: public; Owner: lostodos; Tablespace: 
--

ALTER TABLE ONLY t_user_authority
    ADD CONSTRAINT t_user_authority_pkey PRIMARY KEY (user_id, authority_name);


--
-- Name: t_user_pkey; Type: CONSTRAINT; Schema: public; Owner: lostodos; Tablespace: 
--

ALTER TABLE ONLY t_user
    ADD CONSTRAINT t_user_pkey PRIMARY KEY (id);


--
-- Name: tag_pkey; Type: CONSTRAINT; Schema: public; Owner: lostodos; Tablespace: 
--

ALTER TABLE ONLY tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (id);


--
-- Name: tag_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: lostodos; Tablespace: 
--

ALTER TABLE ONLY tag_tasks
    ADD CONSTRAINT tag_tasks_pkey PRIMARY KEY (tags_id, tasks_id);


--
-- Name: task_hierarchy_item_pkey; Type: CONSTRAINT; Schema: public; Owner: lostodos; Tablespace: 
--

ALTER TABLE ONLY task_hierarchy_item
    ADD CONSTRAINT task_hierarchy_item_pkey PRIMARY KEY (id);


--
-- Name: uk_7gshuknepkj6oy1702fqwsr8r; Type: CONSTRAINT; Schema: public; Owner: lostodos; Tablespace: 
--

ALTER TABLE ONLY t_user
    ADD CONSTRAINT uk_7gshuknepkj6oy1702fqwsr8r UNIQUE (login);


--
-- Name: uk_i6qjjoe560mee5ajdg7v1o6mi; Type: CONSTRAINT; Schema: public; Owner: lostodos; Tablespace: 
--

ALTER TABLE ONLY t_user
    ADD CONSTRAINT uk_i6qjjoe560mee5ajdg7v1o6mi UNIQUE (email);


--
-- Name: usertag; Type: CONSTRAINT; Schema: public; Owner: lostodos; Tablespace: 
--

ALTER TABLE ONLY tag
    ADD CONSTRAINT usertag UNIQUE (owner_id, name);


--
-- Name: fk_734uvj2o0lc1xkni3k1ll9k2x; Type: FK CONSTRAINT; Schema: public; Owner: lostodos
--

ALTER TABLE ONLY tag
    ADD CONSTRAINT fk_734uvj2o0lc1xkni3k1ll9k2x FOREIGN KEY (owner_id) REFERENCES t_user(id);


--
-- Name: fk_8m9ars95vla6yl2rcef51cp5n; Type: FK CONSTRAINT; Schema: public; Owner: lostodos
--

ALTER TABLE ONLY tag_tasks
    ADD CONSTRAINT fk_8m9ars95vla6yl2rcef51cp5n FOREIGN KEY (tasks_id) REFERENCES task_hierarchy_item(id);


--
-- Name: fk_cekdwiaydjn97qi7ebeexb1bw; Type: FK CONSTRAINT; Schema: public; Owner: lostodos
--

ALTER TABLE ONLY t_persistent_audit_event_data
    ADD CONSTRAINT fk_cekdwiaydjn97qi7ebeexb1bw FOREIGN KEY (event_id) REFERENCES t_persistent_audit_event(event_id);


--
-- Name: fk_ei8y1xe1mmbsb69r952qqx2ch; Type: FK CONSTRAINT; Schema: public; Owner: lostodos
--

ALTER TABLE ONLY t_user_authority
    ADD CONSTRAINT fk_ei8y1xe1mmbsb69r952qqx2ch FOREIGN KEY (authority_name) REFERENCES t_authority(name);


--
-- Name: fk_khp4hdywgtlpt5n9jp6bgddgy; Type: FK CONSTRAINT; Schema: public; Owner: lostodos
--

ALTER TABLE ONLY task_hierarchy_item
    ADD CONSTRAINT fk_khp4hdywgtlpt5n9jp6bgddgy FOREIGN KEY (owner_id) REFERENCES t_user(id);


--
-- Name: fk_nplwj41xm916m8jpkfxgw0905; Type: FK CONSTRAINT; Schema: public; Owner: lostodos
--

ALTER TABLE ONLY t_persistent_token
    ADD CONSTRAINT fk_nplwj41xm916m8jpkfxgw0905 FOREIGN KEY (user_id) REFERENCES t_user(id);


--
-- Name: fk_pjqqpkvlp7j75rw1j902hcado; Type: FK CONSTRAINT; Schema: public; Owner: lostodos
--

ALTER TABLE ONLY task_hierarchy_item
    ADD CONSTRAINT fk_pjqqpkvlp7j75rw1j902hcado FOREIGN KEY (parent_id) REFERENCES task_hierarchy_item(id);


--
-- Name: fk_pkm88ipfoxp80vvihh7i5bqrs; Type: FK CONSTRAINT; Schema: public; Owner: lostodos
--

ALTER TABLE ONLY t_user_authority
    ADD CONSTRAINT fk_pkm88ipfoxp80vvihh7i5bqrs FOREIGN KEY (user_id) REFERENCES t_user(id);


--
-- Name: fk_tntku54jm84qhv6etyc11oi14; Type: FK CONSTRAINT; Schema: public; Owner: lostodos
--

ALTER TABLE ONLY tag_tasks
    ADD CONSTRAINT fk_tntku54jm84qhv6etyc11oi14 FOREIGN KEY (tags_id) REFERENCES tag(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

