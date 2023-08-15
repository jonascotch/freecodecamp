--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    guesses integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (160, 82, 723);
INSERT INTO public.games VALUES (161, 82, 405);
INSERT INTO public.games VALUES (162, 83, 684);
INSERT INTO public.games VALUES (163, 83, 468);
INSERT INTO public.games VALUES (164, 82, 758);
INSERT INTO public.games VALUES (165, 82, 823);
INSERT INTO public.games VALUES (166, 82, 194);
INSERT INTO public.games VALUES (167, 84, 2);
INSERT INTO public.games VALUES (168, 84, 3);
INSERT INTO public.games VALUES (169, 85, 458);
INSERT INTO public.games VALUES (170, 85, 838);
INSERT INTO public.games VALUES (171, 86, 293);
INSERT INTO public.games VALUES (172, 86, 160);
INSERT INTO public.games VALUES (173, 85, 69);
INSERT INTO public.games VALUES (174, 85, 680);
INSERT INTO public.games VALUES (175, 85, 227);
INSERT INTO public.games VALUES (176, 87, 770);
INSERT INTO public.games VALUES (177, 87, 874);
INSERT INTO public.games VALUES (178, 88, 323);
INSERT INTO public.games VALUES (179, 88, 864);
INSERT INTO public.games VALUES (180, 87, 583);
INSERT INTO public.games VALUES (181, 87, 48);
INSERT INTO public.games VALUES (182, 87, 448);
INSERT INTO public.games VALUES (183, 89, 968);
INSERT INTO public.games VALUES (184, 89, 729);
INSERT INTO public.games VALUES (185, 90, 911);
INSERT INTO public.games VALUES (186, 90, 654);
INSERT INTO public.games VALUES (187, 89, 274);
INSERT INTO public.games VALUES (188, 89, 321);
INSERT INTO public.games VALUES (189, 89, 734);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (82, 'user_1692133322358');
INSERT INTO public.users VALUES (83, 'user_1692133322357');
INSERT INTO public.users VALUES (84, 'Joao');
INSERT INTO public.users VALUES (85, 'user_1692133797933');
INSERT INTO public.users VALUES (86, 'user_1692133797932');
INSERT INTO public.users VALUES (87, 'user_1692133920259');
INSERT INTO public.users VALUES (88, 'user_1692133920258');
INSERT INTO public.users VALUES (89, 'user_1692133949241');
INSERT INTO public.users VALUES (90, 'user_1692133949240');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 189, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 90, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

