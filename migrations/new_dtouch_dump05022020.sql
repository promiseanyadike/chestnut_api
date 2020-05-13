--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-1.pgdg16.04+1)
-- Dumped by pg_dump version 11.5 (Ubuntu 11.5-3.pgdg16.04+1)

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

SET default_with_oids = false;

--
-- Name: about; Type: TABLE; Schema: public; Owner: sysdba
--

CREATE TABLE public.about (
    id bigint NOT NULL,
    title character varying(255),
    content text,
    images character varying(255),
    date_created timestamp without time zone DEFAULT now() NOT NULL,
    date_updated timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.about OWNER TO sysdba;

--
-- Name: about_id_seq; Type: SEQUENCE; Schema: public; Owner: sysdba
--

CREATE SEQUENCE public.about_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.about_id_seq OWNER TO sysdba;

--
-- Name: about_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sysdba
--

ALTER SEQUENCE public.about_id_seq OWNED BY public.about.id;


--
-- Name: authentications; Type: TABLE; Schema: public; Owner: sysdba
--

CREATE TABLE public.authentications (
    id integer NOT NULL,
    role_id bigint NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.authentications OWNER TO sysdba;

--
-- Name: authentications_id_seq; Type: SEQUENCE; Schema: public; Owner: sysdba
--

CREATE SEQUENCE public.authentications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authentications_id_seq OWNER TO sysdba;

--
-- Name: authentications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sysdba
--

ALTER SEQUENCE public.authentications_id_seq OWNED BY public.authentications.id;


--
-- Name: contactus; Type: TABLE; Schema: public; Owner: sysdba
--

CREATE TABLE public.contactus (
    id bigint NOT NULL,
    title character varying(255),
    content text,
    images character varying(255),
    date_created timestamp without time zone DEFAULT now() NOT NULL,
    date_updated timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.contactus OWNER TO sysdba;

--
-- Name: contactus_id_seq; Type: SEQUENCE; Schema: public; Owner: sysdba
--

CREATE SEQUENCE public.contactus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contactus_id_seq OWNER TO sysdba;

--
-- Name: contactus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sysdba
--

ALTER SEQUENCE public.contactus_id_seq OWNED BY public.contactus.id;


--
-- Name: laundry; Type: TABLE; Schema: public; Owner: sysdba
--

CREATE TABLE public.laundry (
    id bigint NOT NULL,
    title character varying(255),
    image character varying(255),
    content text,
    date_created timestamp without time zone DEFAULT now() NOT NULL,
    date_updated timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.laundry OWNER TO sysdba;

--
-- Name: laundry_id_seq; Type: SEQUENCE; Schema: public; Owner: sysdba
--

CREATE SEQUENCE public.laundry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.laundry_id_seq OWNER TO sysdba;

--
-- Name: laundry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sysdba
--

ALTER SEQUENCE public.laundry_id_seq OWNED BY public.laundry.id;


--
-- Name: price; Type: TABLE; Schema: public; Owner: sysdba
--

CREATE TABLE public.price (
    id bigint NOT NULL,
    name character varying(255),
    price character varying(255),
    date_created timestamp without time zone DEFAULT now() NOT NULL,
    date_updated timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.price OWNER TO sysdba;

--
-- Name: price_id_seq; Type: SEQUENCE; Schema: public; Owner: sysdba
--

CREATE SEQUENCE public.price_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.price_id_seq OWNER TO sysdba;

--
-- Name: price_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sysdba
--

ALTER SEQUENCE public.price_id_seq OWNED BY public.price.id;


--
-- Name: about id; Type: DEFAULT; Schema: public; Owner: sysdba
--

ALTER TABLE ONLY public.about ALTER COLUMN id SET DEFAULT nextval('public.about_id_seq'::regclass);


--
-- Name: authentications id; Type: DEFAULT; Schema: public; Owner: sysdba
--

ALTER TABLE ONLY public.authentications ALTER COLUMN id SET DEFAULT nextval('public.authentications_id_seq'::regclass);


--
-- Name: contactus id; Type: DEFAULT; Schema: public; Owner: sysdba
--

ALTER TABLE ONLY public.contactus ALTER COLUMN id SET DEFAULT nextval('public.contactus_id_seq'::regclass);


--
-- Name: laundry id; Type: DEFAULT; Schema: public; Owner: sysdba
--

ALTER TABLE ONLY public.laundry ALTER COLUMN id SET DEFAULT nextval('public.laundry_id_seq'::regclass);


--
-- Name: price id; Type: DEFAULT; Schema: public; Owner: sysdba
--

ALTER TABLE ONLY public.price ALTER COLUMN id SET DEFAULT nextval('public.price_id_seq'::regclass);


--
-- Data for Name: about; Type: TABLE DATA; Schema: public; Owner: sysdba
--

INSERT INTO public.about (id, title, content, images, date_created, date_updated) VALUES (1, 'About D''TOUCHEXPERTSLAUNDRY', 'We at D''TouchExpertsLaundry thrive because of our long-term game changer and actionable synergy culture.Dynamically touching base about engineering low hanging fruit will make us leaders in the value-added best practice industry. We use our customer-focused standard setters to globally manage our stack expectations. We use our seamless platforms to strategically manage our brand expectations.', '', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.about (id, title, content, images, date_created, date_updated) VALUES (2, 'Our Mision', 'Our milestone development lifecycle enables long-term, immersive user experiences. Is your vertical prepared for competitive enterprise growth? We aim to reliably right-size our capability by dynamically incentivizing our company-wide end-to-end game changers. Our organic growth development lifecycle enables best-of-breed, mission critical standpoints.', '', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.about (id, title, content, images, date_created, date_updated) VALUES (3, 'Our History', 'September 2017 we had a mandate to deliver world class laundry services to people around us. We wanted to stand out and realised for us to do that we needed to brand the business and today We thrive because of our world-class alignment and immersive brand culture. So we can hit the ground running, we will be globally integrating every bandwidth in our space. You need to reliably facilitate your verticals to increase your silo velocity. We thrive because of our senior step-change and best-of-breed core asset culture.', '', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.about (id, title, content, images, date_created, date_updated) VALUES (4, 'Our Vision', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sagittis purus arcu, vel ultrices tortor vestibulum scelerisque. Delivering world Class Laundry services to our clients confidence.', '', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.about (id, title, content, images, date_created, date_updated) VALUES (5, 'OPARAH OBINNA', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus nec iaculis mauris.', 'static/obinna.jpg', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.about (id, title, content, images, date_created, date_updated) VALUES (6, 'EBUBE ARIRIGUZO', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus nec iaculis mauris.', 'static/ebube.jpg', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.about (id, title, content, images, date_created, date_updated) VALUES (7, '20, Kayode Street, Double Powerline Ejigbo Lagos Nigeria.', '+2348168131014', '', '0001-01-01 00:00:00', '0001-01-01 00:00:00');


--
-- Data for Name: authentications; Type: TABLE DATA; Schema: public; Owner: sysdba
--

INSERT INTO public.authentications (id, role_id, email, password, created_at) VALUES (1, 1, 'mosesozoumeh@gmail.com', '$2y$12$I6SrnTYJu.NTVKFIrKfcSObXxkJ1w0rKpt/2K8Ok1KBWiDtGZ9pne', '2020-01-11 11:47:19.642998');
INSERT INTO public.authentications (id, role_id, email, password, created_at) VALUES (2, 1, 'chidera.levsports@gmail.com', '$2y$12$FhAyitEt425Gqe0pBnMsHO/X.8.RZ8tF/l8bCCY/f7VOhREG3Wd2e', '2020-01-11 11:47:19.687559');


--
-- Data for Name: contactus; Type: TABLE DATA; Schema: public; Owner: sysdba
--

INSERT INTO public.contactus (id, title, content, images, date_created, date_updated) VALUES (1, 'Dry Cleaning & Laundry to your Door Steps', 'We at Deep touch laundry, deliver high quality care dry cleaning services. Save time for more important things as you can trust us with any type of laundry service you desire. Your wears are delivered in better condition and at the right time too. Our objective is always leaving you, our dear valued customer looking spotless and bright to your much delight.', '', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.contactus (id, title, content, images, date_created, date_updated) VALUES (2, 'clean clothes have Never been this easy', '', '', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.contactus (id, title, content, images, date_created, date_updated) VALUES (3, 'self service', 'you need to reliably transform your standard setters to increase your capability velocity. We aim to dynamically integrate our cloud by virtually revolutionizing our immersive wholesale propositions.', '', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.contactus (id, title, content, images, date_created, date_updated) VALUES (4, 'commercial', 'you need to reliably transform your standard setters to increase your capability velocity. We aim to dynamically integrate our cloud by virtually revolutionizing our immersive wholesale propositions.', '', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.contactus (id, title, content, images, date_created, date_updated) VALUES (5, 'stain removal', 'you need to reliably transform your standard setters to increase your capability velocity. We aim to dynamically integrate our cloud by virtually revolutionizing our immersive wholesale propositions.', '', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.contactus (id, title, content, images, date_created, date_updated) VALUES (6, 'Delivery', 'you need to reliably transform your standard setters to increase your capability velocity. We aim to dynamically integrate our cloud by virtually revolutionizing our immersive wholesale propositions.', '', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.contactus (id, title, content, images, date_created, date_updated) VALUES (7, 'Gallery', '', '', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.contactus (id, title, content, images, date_created, date_updated) VALUES (8, '', '', '', '0001-01-01 00:00:00', '0001-01-01 00:00:00');


--
-- Data for Name: laundry; Type: TABLE DATA; Schema: public; Owner: sysdba
--

INSERT INTO public.laundry (id, title, image, content, date_created, date_updated) VALUES (2, 'clean clothes have Never been this easy', '', '', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.laundry (id, title, image, content, date_created, date_updated) VALUES (3, 'self service', '', 'you need to reliably transform your standard setters to increase your capability velocity. We aim to dynamically integrate our cloud by virtually revolutionizing our immersive wholesale propositions.', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.laundry (id, title, image, content, date_created, date_updated) VALUES (4, 'commercial', '', 'you need to reliably transform your standard setters to increase your capability velocity. We aim to dynamically integrate our cloud by virtually revolutionizing our immersive wholesale propositions.', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.laundry (id, title, image, content, date_created, date_updated) VALUES (8, '', 'static/blue-jeans-casual-clothes-1082528.jpg', '', '0001-01-01 00:00:00', '0017-01-01 00:00:00');
INSERT INTO public.laundry (id, title, image, content, date_created, date_updated) VALUES (9, '', 'static/blue-clothes-clothing-52518.jpg', '', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.laundry (id, title, image, content, date_created, date_updated) VALUES (10, '', 'static/shirt.jpg', '', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.laundry (id, title, image, content, date_created, date_updated) VALUES (11, '', 'static/iron.jpg', '', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.laundry (id, title, image, content, date_created, date_updated) VALUES (12, '', 'static/g6.jpg', '', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.laundry (id, title, image, content, date_created, date_updated) VALUES (13, '', 'static/apparel-clothes-clothing-8434.jpg', '', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.laundry (id, title, image, content, date_created, date_updated) VALUES (14, '', 'static/apparel-black-and-white-black-and-white-581339.jpg', '', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.laundry (id, title, image, content, date_created, date_updated) VALUES (15, '', 'static/abstract-blur-business-264726.jpg', '', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.laundry (id, title, image, content, date_created, date_updated) VALUES (16, '', 'static/bath.jpg', '', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.laundry (id, title, image, content, date_created, date_updated) VALUES (17, '', 'static/slide-52.jpg', '', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.laundry (id, title, image, content, date_created, date_updated) VALUES (18, '', 'static/chucks.jpg', '', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.laundry (id, title, image, content, date_created, date_updated) VALUES (19, '', 'static/closet-clothes-clothes-rack-102129.jpg', '', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.laundry (id, title, image, content, date_created, date_updated) VALUES (20, '', 'static/dtouchlogo.svg', '', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.laundry (id, title, image, content, date_created, date_updated) VALUES (21, 'EBUBE ARIRIGUZO', 'static/ebube.jpg', 'MANAGER', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.laundry (id, title, image, content, date_created, date_updated) VALUES (22, 'OBINNA OPARAH', 'static/obinna.jpg', 'CEO', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.laundry (id, title, image, content, date_created, date_updated) VALUES (1, 'Dry Cleaning & Laundry To Your Door Step', '', 'We at Deep touch laundry, deliver high quality care dry cleaning services. Save time for more important things as you can trust us with any type of laundry service you desire. Your wears are delivered in better condition and at the right time too. Our objective is always leaving you, our dear valued customer looking spotless and bright to your much delight.', '0001-01-01 00:00:00', '0017-01-01 00:00:00');
INSERT INTO public.laundry (id, title, image, content, date_created, date_updated) VALUES (5, 'Stain Removal', '', 'you need to reliably transform your standard setters to increase your capability velocity. We aim to dynamically integrate our cloud by virtually revolutionizing our immersive wholesale propositions.', '0001-01-01 00:00:00', '0017-01-01 00:00:00');
INSERT INTO public.laundry (id, title, image, content, date_created, date_updated) VALUES (6, 'Delivery', '', 'you need to reliably transform your standard setters to increase your capability velocity. We aim to dynamically integrate our cloud by virtually revolutionizing our immersive wholesale propositions.', '0001-01-01 00:00:00', '0017-01-01 00:00:00');
INSERT INTO public.laundry (id, title, image, content, date_created, date_updated) VALUES (23, '20, Kayode Street, Double Powerline Ejigbo Lagos Nigeria.', '', '+2348168131014', '0001-01-01 00:00:00', '0001-01-01 00:00:00');


--
-- Data for Name: price; Type: TABLE DATA; Schema: public; Owner: sysdba
--

INSERT INTO public.price (id, name, price, date_created, date_updated) VALUES (1, '', '200', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.price (id, name, price, date_created, date_updated) VALUES (2, 'Shirts', '', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.price (id, name, price, date_created, date_updated) VALUES (3, 'Trousers', '', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.price (id, name, price, date_created, date_updated) VALUES (4, 'Gown', '', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.price (id, name, price, date_created, date_updated) VALUES (5, 'Skirts', '', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.price (id, name, price, date_created, date_updated) VALUES (6, 'Tedy Bear(small)', '', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.price (id, name, price, date_created, date_updated) VALUES (7, '', '100', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.price (id, name, price, date_created, date_updated) VALUES (8, 'Head-Tie', '', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.price (id, name, price, date_created, date_updated) VALUES (9, 'Cap', '', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.price (id, name, price, date_created, date_updated) VALUES (11, '', '300', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.price (id, name, price, date_created, date_updated) VALUES (12, 'Native', '', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.price (id, name, price, date_created, date_updated) VALUES (13, 'Bed Spray(small)', '', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.price (id, name, price, date_created, date_updated) VALUES (14, '', 'Specials', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.price (id, name, price, date_created, date_updated) VALUES (15, 'Suits', '1000', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.price (id, name, price, date_created, date_updated) VALUES (16, 'Jackets', '400', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.price (id, name, price, date_created, date_updated) VALUES (17, 'Wedding Gown', '3000', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.price (id, name, price, date_created, date_updated) VALUES (18, 'Agbada', '500', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.price (id, name, price, date_created, date_updated) VALUES (19, 'Duve(big)', '1000', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.price (id, name, price, date_created, date_updated) VALUES (21, 'Bed Spray(big)', '500', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.price (id, name, price, date_created, date_updated) VALUES (22, 'Curtain(#1)', '400', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.price (id, name, price, date_created, date_updated) VALUES (23, 'Curtains(#4)', '1400', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.price (id, name, price, date_created, date_updated) VALUES (24, 'Shoes', '150', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.price (id, name, price, date_created, date_updated) VALUES (25, 'Tedy Bear(Big)', '400', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.price (id, name, price, date_created, date_updated) VALUES (26, 'New House Cleaning', '(30000-70000)', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.price (id, name, price, date_created, date_updated) VALUES (29, '', '250', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.price (id, name, price, date_created, date_updated) VALUES (30, 'Wedding Gown', '1500', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.price (id, name, price, date_created, date_updated) VALUES (31, 'Agbada', '250', '0001-01-01 00:00:00', '0001-01-01 00:00:00');
INSERT INTO public.price (id, name, price, date_created, date_updated) VALUES (20, 'Duve(small)', '700', '0001-01-01 00:00:00', '0017-01-01 00:00:00');
INSERT INTO public.price (id, name, price, date_created, date_updated) VALUES (27, 'suits', '250', '0001-01-01 00:00:00', '0017-01-01 00:00:00');
INSERT INTO public.price (id, name, price, date_created, date_updated) VALUES (28, 'Chemical Cloth Wash', '100', '0001-01-01 00:00:00', '0017-01-01 00:00:00');
INSERT INTO public.price (id, name, price, date_created, date_updated) VALUES (32, 'Chemical Cloth Wash', '100', '0001-01-01 00:00:00', '0017-01-01 00:00:00');
INSERT INTO public.price (id, name, price, date_created, date_updated) VALUES (10, 'Tie', '20', '0001-01-01 00:00:00', '0017-01-01 00:00:00');


--
-- Name: about_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sysdba
--

SELECT pg_catalog.setval('public.about_id_seq', 7, true);


--
-- Name: authentications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sysdba
--

SELECT pg_catalog.setval('public.authentications_id_seq', 1, false);


--
-- Name: contactus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sysdba
--

SELECT pg_catalog.setval('public.contactus_id_seq', 8, true);


--
-- Name: laundry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sysdba
--

SELECT pg_catalog.setval('public.laundry_id_seq', 23, true);


--
-- Name: price_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sysdba
--

SELECT pg_catalog.setval('public.price_id_seq', 32, true);


--
-- Name: about about_pkey; Type: CONSTRAINT; Schema: public; Owner: sysdba
--

ALTER TABLE ONLY public.about
    ADD CONSTRAINT about_pkey PRIMARY KEY (id);


--
-- Name: authentications authentications_pkey; Type: CONSTRAINT; Schema: public; Owner: sysdba
--

ALTER TABLE ONLY public.authentications
    ADD CONSTRAINT authentications_pkey PRIMARY KEY (id);


--
-- Name: contactus contactus_pkey; Type: CONSTRAINT; Schema: public; Owner: sysdba
--

ALTER TABLE ONLY public.contactus
    ADD CONSTRAINT contactus_pkey PRIMARY KEY (id);


--
-- Name: laundry laundry_pkey; Type: CONSTRAINT; Schema: public; Owner: sysdba
--

ALTER TABLE ONLY public.laundry
    ADD CONSTRAINT laundry_pkey PRIMARY KEY (id);


--
-- Name: price price_pkey; Type: CONSTRAINT; Schema: public; Owner: sysdba
--

ALTER TABLE ONLY public.price
    ADD CONSTRAINT price_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

