--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_type_id integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(12,2) NOT NULL,
    has_life boolean NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.galaxy ALTER COLUMN galaxy_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.galaxy_galaxy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text NOT NULL,
    has_life boolean DEFAULT false NOT NULL
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.galaxy_type ALTER COLUMN galaxy_type_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.galaxy_type_galaxy_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    planet_id integer NOT NULL,
    diameter_in_km integer NOT NULL,
    is_spherical boolean NOT NULL,
    discovery_year integer NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.moon ALTER COLUMN moon_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.moon_moon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    star_id integer NOT NULL,
    distance_from_star numeric(10,3) NOT NULL,
    has_life boolean NOT NULL,
    number_of_moons integer NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.planet ALTER COLUMN planet_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.planet_planet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_id integer NOT NULL,
    stellar_class character varying(20) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    mass_in_solar_masses numeric(8,3) NOT NULL,
    is_spherical boolean NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.star ALTER COLUMN star_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.star_star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (1, 'Milky Way', 1, 13600, 0.00, true, 'The barred spiral galaxy that contains our Solar System.');
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (2, 'Andromeda', 1, 10000, 2537000.00, false, 'The nearest large spiral galaxy to the Milky Way.');
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (3, 'Triangulum', 1, 12000, 2730000.00, false, 'A spiral galaxy in the Local Group.');
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (4, 'Large Magellanic Cloud', 3, 13000, 163000.00, false, 'An irregular satellite galaxy of the Milky Way.');
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (5, 'Small Magellanic Cloud', 3, 13000, 200000.00, false, 'A dwarf irregular galaxy near the Milky Way.');
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (6, 'Messier 87', 2, 13000, 53500000.00, false, 'A giant elliptical galaxy in the Virgo Cluster.');


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type OVERRIDING SYSTEM VALUE VALUES (1, 'Spiral', 'A rotating disk with winding arms and a central bulge.', true);
INSERT INTO public.galaxy_type OVERRIDING SYSTEM VALUE VALUES (2, 'Elliptical', 'A rounded system with older stars and little interstellar gas.', false);
INSERT INTO public.galaxy_type OVERRIDING SYSTEM VALUE VALUES (3, 'Irregular', 'A galaxy without a regular spiral or elliptical shape.', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (1, 'Moon', 3, 3475, true, -2000, 'Earth''s only natural satellite.');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (2, 'Phobos', 4, 22, false, 1877, 'The larger and innermost moon of Mars.');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (3, 'Deimos', 4, 12, false, 1877, 'The smaller outer moon of Mars.');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (4, 'Io', 5, 3643, true, 1610, 'A volcanically active moon of Jupiter.');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (5, 'Europa', 5, 3122, true, 1610, 'An icy moon that may contain a subsurface ocean.');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (6, 'Ganymede', 5, 5268, true, 1610, 'The largest moon in the Solar System.');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (7, 'Callisto', 5, 4821, true, 1610, 'A heavily cratered moon of Jupiter.');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (8, 'Amalthea', 5, 167, false, 1892, 'A small irregular inner moon of Jupiter.');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (9, 'Himalia', 5, 140, false, 1904, 'The largest member of Jupiter''s Himalia group.');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (10, 'Elara', 5, 86, false, 1905, 'An irregular prograde moon of Jupiter.');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (11, 'Mimas', 6, 396, true, 1789, 'A small icy moon of Saturn.');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (12, 'Enceladus', 6, 504, true, 1789, 'An icy moon with active water-rich plumes.');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (13, 'Tethys', 6, 1062, true, 1684, 'An icy moon of Saturn.');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (14, 'Dione', 6, 1123, true, 1684, 'A dense icy moon of Saturn.');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (15, 'Rhea', 6, 1528, true, 1672, 'Saturn''s second-largest moon.');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (16, 'Titan', 6, 5150, true, 1655, 'A large moon with a thick atmosphere.');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (17, 'Iapetus', 6, 1469, true, 1671, 'A moon of Saturn with striking light and dark hemispheres.');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (18, 'Miranda', 7, 472, true, 1948, 'A small moon of Uranus with varied terrain.');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (19, 'Ariel', 7, 1158, true, 1851, 'A bright icy moon of Uranus.');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (20, 'Umbriel', 7, 1169, true, 1851, 'A dark icy moon of Uranus.');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (21, 'Titania', 7, 1578, true, 1787, 'The largest moon of Uranus.');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (22, 'Oberon', 7, 1523, true, 1787, 'The outermost major moon of Uranus.');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (23, 'Triton', 8, 2707, true, 1846, 'Neptune''s large retrograde moon.');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (24, 'Nereid', 8, 340, true, 1949, 'A distant moon of Neptune with an unusual orbit.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (1, 'Mercury', 1, 0.387, false, 0, 'The smallest planet in the Solar System.');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (2, 'Venus', 1, 0.723, false, 0, 'A rocky planet with a dense carbon dioxide atmosphere.');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (3, 'Earth', 1, 1.000, true, 1, 'The only known planet with life.');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (4, 'Mars', 1, 1.524, false, 2, 'A rocky planet known for its reddish appearance.');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (5, 'Jupiter', 1, 5.203, false, 95, 'The largest planet in the Solar System.');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (6, 'Saturn', 1, 9.537, false, 146, 'A gas giant famous for its rings.');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (7, 'Uranus', 1, 19.191, false, 28, 'An ice giant that rotates on its side.');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (8, 'Neptune', 1, 30.069, false, 16, 'A distant blue ice giant.');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (9, 'Sirius b', 2, 25.000, false, 0, 'A hypothetical catalog placeholder for a planetary record.');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (10, 'Proxima b', 3, 0.049, false, 0, 'An exoplanet orbiting Proxima Centauri.');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (11, 'Alpha Centauri Bb', 4, 0.040, false, 0, 'A debated candidate exoplanet around Alpha Centauri A.');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (12, 'Vega b', 5, 0.800, false, 0, 'A hypothetical exoplanet record associated with Vega.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (1, 'Sun', 1, 'G2V', 4600, 1.000, true, 'The star at the center of the Solar System.');
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (2, 'Sirius', 1, 'A1V', 242, 2.063, true, 'A bright binary star system in Canis Major.');
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (3, 'Proxima Centauri', 1, 'M5.5Ve', 4850, 0.122, true, 'The nearest known star to the Sun.');
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (4, 'Alpha Centauri A', 1, 'G2V', 5300, 1.100, true, 'The primary star in the Alpha Centauri system.');
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (5, 'Vega', 1, 'A0V', 455, 2.135, true, 'A bright star in the constellation Lyra.');
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (6, 'Betelgeuse', 1, 'M1-M2 Ia', 10, 16.500, true, 'A red supergiant in Orion.');
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (7, 'M31-V1', 2, 'Cepheid', 50, 5.000, true, 'A Cepheid variable in the Andromeda Galaxy.');
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (8, 'M33-Var A', 3, 'Variable', 20, 12.000, true, 'A luminous variable star in the Triangulum Galaxy.');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


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
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


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
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

