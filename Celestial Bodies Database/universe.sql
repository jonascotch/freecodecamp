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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: colors; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.colors (
    colors_id integer NOT NULL,
    name character varying NOT NULL,
    hue text
);


ALTER TABLE public.colors OWNER TO freecodecamp;

--
-- Name: colors_color_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.colors_color_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.colors_color_id_seq OWNER TO freecodecamp;

--
-- Name: colors_color_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.colors_color_id_seq OWNED BY public.colors.colors_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60),
    axis_in_lightyears integer NOT NULL,
    type character varying,
    seen_from_earth boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60),
    planet_id integer,
    colors_id integer,
    diameter_in_kms integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(69),
    star_id integer,
    colors_id integer,
    has_life boolean NOT NULL,
    inhabitants_in_millions numeric
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_id integer,
    colors_id integer,
    classification character varying(1) NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: colors colors_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.colors ALTER COLUMN colors_id SET DEFAULT nextval('public.colors_color_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: colors; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.colors VALUES (2, 'red', NULL);
INSERT INTO public.colors VALUES (5, 'orange', NULL);
INSERT INTO public.colors VALUES (6, 'violet', NULL);
INSERT INTO public.colors VALUES (7, 'white', NULL);
INSERT INTO public.colors VALUES (8, 'black', NULL);
INSERT INTO public.colors VALUES (1, 'blue', 'light');
INSERT INTO public.colors VALUES (4, 'green', 'light');
INSERT INTO public.colors VALUES (3, 'yellow', 'light');
INSERT INTO public.colors VALUES (9, 'red', 'dark');
INSERT INTO public.colors VALUES (10, 'blue', 'dark');
INSERT INTO public.colors VALUES (11, 'yellow', 'dark');
INSERT INTO public.colors VALUES (12, 'green', 'dark');
INSERT INTO public.colors VALUES (13, 'brown', NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 'spiral', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 220000, 'barred spiral', true);
INSERT INTO public.galaxy VALUES (3, 'Tadpole', 280000, 'distorted spiral', true);
INSERT INTO public.galaxy VALUES (4, 'Cigar', 37000, 'starburst', false);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 60000, 'spiral', true);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 50000, 'peculiar', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (7, 'Red Moon', 1, 2, 1);
INSERT INTO public.moon VALUES (10, 'Wegthor', 12, 2, 1);
INSERT INTO public.moon VALUES (3, 'Honeymoon', 1, 3, 1);
INSERT INTO public.moon VALUES (4, 'Moon', 1, 7, 1);
INSERT INTO public.moon VALUES (11, 'Blue Moon', 1, 10, 1);
INSERT INTO public.moon VALUES (9, 'Europa', 4, 5, 1560);
INSERT INTO public.moon VALUES (2, 'Keith Moon', 1, 8, 0);
INSERT INTO public.moon VALUES (5, 'Sailor Moon', 1, 10, 0);
INSERT INTO public.moon VALUES (6, 'Moonarchy', 1, 10, 0);
INSERT INTO public.moon VALUES (8, 'Moonshine', 1, 7, 0);
INSERT INTO public.moon VALUES (12, 'Phobos', 5, 2, 27);
INSERT INTO public.moon VALUES (13, 'Deimos', 5, 3, 15);
INSERT INTO public.moon VALUES (14, 'Io', 4, 11, 3643);
INSERT INTO public.moon VALUES (15, 'Ganymede', 4, 12, 5268);
INSERT INTO public.moon VALUES (16, 'Callisto', 4, 13, 4820);
INSERT INTO public.moon VALUES (17, 'Mimas', 6, 7, 396);
INSERT INTO public.moon VALUES (18, 'Tethys', 6, 7, 1067);
INSERT INTO public.moon VALUES (19, 'Hyperion', 6, 12, 270);
INSERT INTO public.moon VALUES (20, 'Ariel', 7, 2, 245);
INSERT INTO public.moon VALUES (21, 'Proteus', 8, 7, 420);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 1, true, 7888);
INSERT INTO public.planet VALUES (2, 'Mercury', 1, 7, false, 0);
INSERT INTO public.planet VALUES (3, 'Venus', 1, 3, false, 0);
INSERT INTO public.planet VALUES (4, 'Jupiter', 1, 5, false, 0);
INSERT INTO public.planet VALUES (5, 'Mars', 1, 2, false, 0);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 11, false, 0);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 1, false, 0);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 10, false, 0);
INSERT INTO public.planet VALUES (9, 'Pluto', 1, 7, false, 0);
INSERT INTO public.planet VALUES (11, 'Planet of the Apes', 1, 1, true, 0.00864);
INSERT INTO public.planet VALUES (10, 'Planet Hollywood', 1, 10, true, 0.0004);
INSERT INTO public.planet VALUES (12, 'Krypton', 7, 10, true, 1400);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 7, 'O');
INSERT INTO public.star VALUES (2, 'Sirius', 1, 1, 'A');
INSERT INTO public.star VALUES (3, 'Polaris', 1, 3, 'F');
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 7, 'O');
INSERT INTO public.star VALUES (5, 'Vega', 1, 1, 'A');
INSERT INTO public.star VALUES (6, 'Antares', 1, 2, 'M');
INSERT INTO public.star VALUES (7, 'Rao', 2, 9, 'M');


--
-- Name: colors_color_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.colors_color_id_seq', 13, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: colors colors_colors_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.colors
    ADD CONSTRAINT colors_colors_id_key UNIQUE (colors_id);


--
-- Name: colors colors_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.colors
    ADD CONSTRAINT colors_pkey PRIMARY KEY (colors_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_colors_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_colors_id_fkey FOREIGN KEY (colors_id) REFERENCES public.colors(colors_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_colors_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_colors_id_fkey FOREIGN KEY (colors_id) REFERENCES public.colors(colors_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_colors_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_colors_id_fkey FOREIGN KEY (colors_id) REFERENCES public.colors(colors_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

