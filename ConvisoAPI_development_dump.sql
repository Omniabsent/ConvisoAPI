--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: julia
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO julia;

--
-- Name: change_histories; Type: TABLE; Schema: public; Owner: julia
--

CREATE TABLE public.change_histories (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    vulnerability_id bigint NOT NULL,
    vulnerability_status integer NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.change_histories OWNER TO julia;

--
-- Name: change_histories_id_seq; Type: SEQUENCE; Schema: public; Owner: julia
--

CREATE SEQUENCE public.change_histories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.change_histories_id_seq OWNER TO julia;

--
-- Name: change_histories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: julia
--

ALTER SEQUENCE public.change_histories_id_seq OWNED BY public.change_histories.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: julia
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO julia;

--
-- Name: users; Type: TABLE; Schema: public; Owner: julia
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying,
    password_digest character varying,
    email character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO julia;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: julia
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO julia;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: julia
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: vulnerabilities; Type: TABLE; Schema: public; Owner: julia
--

CREATE TABLE public.vulnerabilities (
    id bigint NOT NULL,
    name character varying,
    description character varying,
    impact_level integer,
    solution character varying,
    status integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp(6) without time zone
);


ALTER TABLE public.vulnerabilities OWNER TO julia;

--
-- Name: vulnerabilities_id_seq; Type: SEQUENCE; Schema: public; Owner: julia
--

CREATE SEQUENCE public.vulnerabilities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vulnerabilities_id_seq OWNER TO julia;

--
-- Name: vulnerabilities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: julia
--

ALTER SEQUENCE public.vulnerabilities_id_seq OWNED BY public.vulnerabilities.id;


--
-- Name: change_histories id; Type: DEFAULT; Schema: public; Owner: julia
--

ALTER TABLE ONLY public.change_histories ALTER COLUMN id SET DEFAULT nextval('public.change_histories_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: julia
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: vulnerabilities id; Type: DEFAULT; Schema: public; Owner: julia
--

ALTER TABLE ONLY public.vulnerabilities ALTER COLUMN id SET DEFAULT nextval('public.vulnerabilities_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: julia
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2022-02-22 04:18:14.13107	2022-02-22 04:18:14.13107
schema_sha1	8eabff232ceb230621632cfd57cafc02a3d17e25	2022-02-22 04:18:14.160409	2022-02-22 04:18:14.160409
\.


--
-- Data for Name: change_histories; Type: TABLE DATA; Schema: public; Owner: julia
--

COPY public.change_histories (id, user_id, vulnerability_id, vulnerability_status, created_at, updated_at) FROM stdin;
1	2	1	3	2022-02-22 04:21:14.439074	2022-02-22 04:21:14.439074
2	2	2	3	2022-02-22 04:21:28.484121	2022-02-22 04:21:28.484121
3	2	3	1	2022-02-22 04:23:02.45535	2022-02-22 04:23:02.45535
4	2	2	4	2022-02-22 04:24:07.807072	2022-02-22 04:24:07.807072
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: julia
--

COPY public.schema_migrations (version) FROM stdin;
20220222040634
20220219083908
20220219085756
20220219091101
20220219212903
20220220003817
20220221011956
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: julia
--

COPY public.users (id, name, password_digest, email, created_at, updated_at) FROM stdin;
1	user	$2a$12$HQ0jVd11k4/zCrDuf7aT9.vnNBfp0mLeWwy3YOcRbbvqb8Tie0ioS	user@teste.com	2022-02-22 04:20:36.698956	2022-02-22 04:20:36.698956
2	user2	$2a$12$fNE01Zh/71iQvfH/nUdqFukMAEhxrpD9zte.bzSH0lB6FSq4w3f8G	user2@teste.com	2022-02-22 04:20:42.84225	2022-02-22 04:20:42.84225
\.


--
-- Data for Name: vulnerabilities; Type: TABLE DATA; Schema: public; Owner: julia
--

COPY public.vulnerabilities (id, name, description, impact_level, solution, status, created_at, updated_at, deleted_at) FROM stdin;
1	Phishing	this is bait	3	don't fall for bait	3	2022-02-22 04:21:14.361663	2022-02-22 04:21:14.361663	\N
3	Phishing 3	the return of the bait	2	you seriously should have learned by now	1	2022-02-22 04:23:02.385834	2022-02-22 04:23:02.385834	\N
2	Phishing 2	this is another bait 	3	don't fall for bait again	3	2022-02-22 04:21:28.44546	2022-02-22 04:24:07.834348	2022-02-22 04:24:07.834333
\.


--
-- Name: change_histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: julia
--

SELECT pg_catalog.setval('public.change_histories_id_seq', 4, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: julia
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: vulnerabilities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: julia
--

SELECT pg_catalog.setval('public.vulnerabilities_id_seq', 3, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: julia
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: change_histories change_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: julia
--

ALTER TABLE ONLY public.change_histories
    ADD CONSTRAINT change_histories_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: julia
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: julia
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: vulnerabilities vulnerabilities_pkey; Type: CONSTRAINT; Schema: public; Owner: julia
--

ALTER TABLE ONLY public.vulnerabilities
    ADD CONSTRAINT vulnerabilities_pkey PRIMARY KEY (id);


--
-- Name: index_change_histories_on_user_id; Type: INDEX; Schema: public; Owner: julia
--

CREATE INDEX index_change_histories_on_user_id ON public.change_histories USING btree (user_id);


--
-- Name: index_change_histories_on_vulnerability_id; Type: INDEX; Schema: public; Owner: julia
--

CREATE INDEX index_change_histories_on_vulnerability_id ON public.change_histories USING btree (vulnerability_id);


--
-- Name: index_vulnerabilities_on_deleted_at; Type: INDEX; Schema: public; Owner: julia
--

CREATE INDEX index_vulnerabilities_on_deleted_at ON public.vulnerabilities USING btree (deleted_at);


--
-- Name: index_vulnerabilities_on_impact_level; Type: INDEX; Schema: public; Owner: julia
--

CREATE INDEX index_vulnerabilities_on_impact_level ON public.vulnerabilities USING btree (impact_level);


--
-- Name: index_vulnerabilities_on_name; Type: INDEX; Schema: public; Owner: julia
--

CREATE INDEX index_vulnerabilities_on_name ON public.vulnerabilities USING btree (name);


--
-- Name: index_vulnerabilities_on_status; Type: INDEX; Schema: public; Owner: julia
--

CREATE INDEX index_vulnerabilities_on_status ON public.vulnerabilities USING btree (status);


--
-- Name: change_histories fk_rails_748bc4765c; Type: FK CONSTRAINT; Schema: public; Owner: julia
--

ALTER TABLE ONLY public.change_histories
    ADD CONSTRAINT fk_rails_748bc4765c FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: change_histories fk_rails_80b937c795; Type: FK CONSTRAINT; Schema: public; Owner: julia
--

ALTER TABLE ONLY public.change_histories
    ADD CONSTRAINT fk_rails_80b937c795 FOREIGN KEY (vulnerability_id) REFERENCES public.vulnerabilities(id);


--
-- PostgreSQL database dump complete
--

