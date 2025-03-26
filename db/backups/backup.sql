--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Debian 16.4-1.pgdg120+2)
-- Dumped by pg_dump version 17.0

-- Started on 2025-03-25 11:26:56 EDT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


--
-- TOC entry 3403 (class 0 OID 16715)
-- Dependencies: 216
-- Data for Name: closures; Type: TABLE DATA; Schema: public; Owner: galc-api-production
--

COPY public.closures (id, start_date, end_date, note, created_at, updated_at) FROM stdin;
1	2022-10-03	2022-10-17	Closed till 2022-10-17	2022-10-07 04:13:13.722782	2022-10-07 04:13:13.722782
2	2023-04-07	2023-08-16		2023-04-07 22:51:38.544347	2023-04-07 22:51:38.544347
4	2023-08-15	2023-08-24		2023-08-16 17:00:38.856925	2023-08-16 17:00:38.856925
5	2024-02-17	2024-07-15		2024-01-30 19:17:23.847107	2024-07-15 18:49:17.811451
6	2024-02-01	2024-08-29		2024-07-15 18:50:45.945689	2024-07-15 18:51:47.97395
7	2025-02-15	\N		2025-01-21 23:39:07.834822	2025-01-21 23:39:07.834822
\.


--
-- TOC entry 3405 (class 0 OID 16722)
-- Dependencies: 218
-- Data for Name: facets; Type: TABLE DATA; Schema: public; Owner: galc-api-production
--

COPY public.facets (id, name, created_at, updated_at, ordered, ord, allow_multiple) FROM stdin;
4	Genre	2022-07-28 23:59:21.42568	2022-07-28 23:59:21.42568	f	2	t
5	Medium	2022-07-28 23:59:21.439352	2022-07-28 23:59:21.439352	f	3	t
2	Size	2022-07-28 23:59:21.393262	2022-07-28 23:59:21.393262	t	0	f
3	Decade	2022-07-28 23:59:21.399992	2022-07-28 23:59:21.399992	t	1	f
1	Appearance	2022-07-28 23:59:21.373092	2022-07-28 23:59:29.756711	f	4	f
\.


--
-- TOC entry 3407 (class 0 OID 16731)
-- Dependencies: 220
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: galc-api-production
--

COPY public.images (id, basename, thumbnail, created_at, updated_at) FROM stdin;
1	Abeles(SelfPortrait).jpg	Abeles(SelfPortrait)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
2	Abeles(Solitaire).jpg	Abeles(Solitaire)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
3	Abeles(TwoFigures).jpg	Abeles(TwoFigures)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
4	Abeles(Weekend).jpg	Abeles(Weekend)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
5	Ackroyd(StMarys).jpg	Ackroyd(StMarys)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
6	Adams (Cane Cutter).jpg	Adams (Cane Cutter)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
7	Afro(Composition).jpg	Afro(Composition)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
8	AGrabow(EXPNDS).jpg	AGrabow(EXPNDS)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
9	AGrabow(EXPRMNTS).jpg	AGrabow(EXPRMNTS)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
10	Aitken(VeilSystem).jpg	Aitken(VeilSystem)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
11	Akawie Barge.jpg	Akawie Barge_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
12	Albers(Joy).jpg	Albers(Joy)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
13	Alicia(Auto15).jpg	Alicia(Auto15)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
14	Alicia(Auto40).jpg	Alicia(Auto40)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
15	Alps(Bird).jpg	Alps(Bird)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
16	Alps(YellowRectangle).jpg	Alps(YellowRectangle)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
17	Altman(ParkFigure).jpg	Altman(ParkFigure)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
18	Alt(Platell).jpg	Alt(Platell)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
19	alularach (bon).jpg	alularach (bon)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
20	Alva(Protector).jpg	Alva(Protector)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
21	Alvar (Sonate Rouge).jpg	Alvar (Sonate Rouge)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
22	Amano(CastleGate).jpg	Amano(CastleGate)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
23	amano (eve).jpg	amano (eve)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
24	Amano(NostalgiaI).jpg	Amano(NostalgiaI)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
25	Amano(SelfFigure).jpg	Amano(SelfFigure)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
26	Anderson(SelfPortrait).jpg	Anderson(SelfPortrait)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
27	Andreani(Elephants).jpg	Andreani(Elephants)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
28	Anonymous(Amigdala).jpg	Anonymous(Amigdala)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
29	anonymous (apples).jpg	anonymous (apples)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
30	Anonymous(Garrulus Carolinesis, The Chatterer).jpg	Anonymous(Garrulus Carolinesis, The Chatterer)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
31	Anonymous(Leucoium bulbosum minus).jpg	Anonymous(Leucoium bulbosum minus)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
32	Anonymous (Oxyantha).jpg	Anonymous (Oxyantha)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
33	Anonymous(Tulipa).jpg	Anonymous(Tulipa)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
34	Antonini(Still Life with Pomegranate).jpg	Antonini(Still Life with Pomegranate)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
35	Anuszkiewicz(Squares).jpg	Anuszkiewicz(Squares)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
36	Anuszkiewicz(Unkown).JPG	Anuszkiewicz(Unkown)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
37	Anuszkiewicz (We are led to believe a lie. . .).jpg	Anuszkiewicz (We are led to believe a lie. . .)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
38	Appel (Composition).jpg	Appel (Composition)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
39	Appel(Figure).jpg	Appel(Figure)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
40	Appel (Lovers).jpg	Appel (Lovers)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
41	Appel(Poster).jpg	Appel(Poster)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
42	Appel(Untitled).jpg	Appel(Untitled)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
43	Araki(Composition Grise).jpg	Araki(Composition Grise)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
44	Araki(Cygne).jpg	Araki(Cygne)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
45	Arastu(Colorful).jpg	Arastu(Colorful)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
46	Arnold(White).jpg	Arnold(White)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
47	Arp(Almost Vase).jpg	Arp(Almost Vase)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
48	Arp(Two Shapes).jpg	Arp(Two Shapes)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
49	Artigas (II etait presque 18 hueres).jpg	Artigas (II etait presque 18 hueres)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
50	Artschwager Untitled.JPG	Artschwager Untitled_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
51	avati (carnaval).jpg	avati (carnaval)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
52	Avati (La Carpe).jpg	Avati (La Carpe)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
53	Avati (Les Ridicules).jpg	Avati (Les Ridicules)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
54	Avati(Nature).jpg	Avati(Nature)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
55	Avedisian(Tide Light).jpg	Avedisian(Tide Light)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
56	Azuma (Image of the Black Circle).jpg	Azuma (Image of the Black Circle)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
57	Azuma (Plateau).jpg	Azuma (Plateau)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
58	Baj (Monster and Lady).jpg	Baj (Monster and Lady)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
59	Ballif(Composition).jpg	Ballif(Composition)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
60	Ballif(Espace).jpg	Ballif(Espace)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
61	Ballif (Sezambre).jpg	Ballif (Sezambre)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
62	Barlach (Erste Tag, from Die Wandlungen).jpg	Barlach (Erste Tag, from Die Wandlungen)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
63	Barnet(Silent Season - Spring).jpg	Barnet(Silent Season - Spring)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
64	Barraza(NoSomos).jpg	Barraza(NoSomos)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
65	Baskin (Beatitude).jpg	Baskin (Beatitude)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
66	Baskin(Boy).jpg	Baskin(Boy)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
67	Baskin (Mantegna at Eremitani).jpg	Baskin (Mantegna at Eremitani)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
68	Baskin (Standing Eagle).jpg	Baskin (Standing Eagle)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
69	Bate (Between).jpg	Bate (Between)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
70	Baumeister(Painter).jpg	Baumeister(Painter)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
71	Bawden(Brighton).jpg	Bawden(Brighton)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
72	Bawden(Smithfield).jpg	Bawden(Smithfield)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
73	Bazaine(Hollande).jpg	Bazaine(Hollande)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
74	Beal(Trillium).jpg	Beal(Trillium)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
75	Bechtle (Sunset).jpg	Bechtle (Sunset)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
76	Beckmann(Weathervane).jpg	Beckmann(Weathervane)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
77	Beham(HolyFamily).jpg	Beham(HolyFamily)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
78	Belau(Arboretum).jpg	Belau(Arboretum)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
79	Belau(Untitled).jpg	Belau(Untitled)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
80	Bender(Glyph).jpg	Bender(Glyph)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
81	Bender(PeyoteBird).jpg	Bender(PeyoteBird)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
82	Bender (Sand Painting).jpg	Bender (Sand Painting)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
83	Bentley (Entertainer).jpg	Bentley (Entertainer)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
84	Bentley(FemaleGangster).jpg	Bentley(FemaleGangster)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
85	Bentley (Hectic Nymph).jpg	Bentley (Hectic Nymph)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
86	Bentley(PortraitHead).jpg	Bentley(PortraitHead)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
87	Ben Zion (And It Came to Pass).jpg	Ben Zion (And It Came to Pass)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
88	Berdick (Apples).jpg	Berdick (Apples)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
89	Bernard(Bretonne).jpg	Bernard(Bretonne)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
90	Bernardi(Ser Mujer).jpg	Bernardi(Ser Mujer)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
91	Bernard(Spinner).jpg	Bernard(Spinner)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
92	Bertrand (Study No. 2).jpg	Bertrand (Study No. 2)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
93	Besnard(LeFlirt).jpg	Besnard(LeFlirt)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
94	Beutlich(River).jpg	Beutlich(River)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
95	Bicat (Berkshire Downs).jpg	Bicat (Berkshire Downs)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
96	Biggers (Upper Room).jpg	Biggers (Upper Room)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
97	Bissiere(Loiseau).jpg	Bissiere(Loiseau)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
98	Bissiere (Woods in Autumn).jpg	Bissiere (Woods in Autumn)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
99	Blake(And When).jpg	Blake(And When)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
100	Blake (Before Dawn).jpg	Blake (Before Dawn)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
101	Blake (Calling All the Fishes).jpg	Blake (Calling All the Fishes)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
102	Blake(one who called).jpg	Blake(one who called)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
103	Blase (Girl with Dove).jpg	Blase (Girl with Dove)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
104	Blaustein (Romantic Landscape).jpg	Blaustein (Romantic Landscape)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
105	Blaustein(Tangle).jpg	Blaustein(Tangle)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
106	Bolotowsky (Plate 6).jpg	Bolotowsky (Plate 6)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
107	Boni (Detente).jpg	Boni (Detente)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
108	Bonnard (Daphnis et Chloe).jpg	Bonnard (Daphnis et Chloe)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
109	Bonnard(FemmeAssise).jpg	Bonnard(FemmeAssise)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
110	Bonnard (le bain).jpg	Bonnard (le bain)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
111	Bonnard (Seated Ladies).jpg	Bonnard (Seated Ladies)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
112	Bonnard(Woman Bath).jpg	Bonnard(Woman Bath)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
113	Boulanger(Children).jpg	Boulanger(Children)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
114	Boulanger(Two Children).jpg	Boulanger(Two Children)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
115	Bowman(Moon).jpg	Bowman(Moon)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
116	Boys(Rue).jpg	Boys(Rue)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
117	Bracquemond (Geese in a Storm).jpg	Bracquemond (Geese in a Storm)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
118	bracquemond (pecheur).jpg	bracquemond (pecheur)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
119	Bracquemond(Pecheur).jpg	Bracquemond(Pecheur)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
120	Bradford (Coastal Bird).jpg	Bradford (Coastal Bird)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
121	Bradford (Pacific Coast Tower).jpg	Bradford (Pacific Coast Tower)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
122	Bradford (Untitled, Birds).jpg	Bradford (Untitled, Birds)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
123	Bragar(ElViento).jpg	Bragar(ElViento)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
124	Braque(Leaves).jpg	Braque(Leaves)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
125	Braque(Tartuffe).jpg	Braque(Tartuffe)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
126	Braque (Untitled, Two Birds).jpg	Braque (Untitled, Two Birds)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
127	Breidenthal(Bat).jpg	Breidenthal(Bat)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
128	Brianchon(Regarde).jpg	Brianchon(Regarde)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
129	Brown(Interior).jpg	Brown(Interior)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
130	Brown(Portrait).jpg	Brown(Portrait)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
131	Brown(Umoja).jpg	Brown(Umoja)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
132	Brunsdon(Molton).jpg	Brunsdon(Molton)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
133	Buffet (Vase).jpg	Buffet (Vase)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
134	Buhot(Embarcadere).jpg	Buhot(Embarcadere)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
135	Buren.JPG	Buren_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
136	Burri(Plate)jpg.jpg	Burri(Plate)jpg_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
137	Calder (Composition).jpg	Calder (Composition)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
138	Callot(Peasant).jpg	Callot(Peasant)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
139	Campigli(Collier).jpg	Campigli(Collier)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
140	Campigli(GroupWomen).jpg	Campigli(GroupWomen)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
141	Canogar (Untitled).jpg	Canogar (Untitled)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
142	Cantu (Untitled, Figures against Red).jpg	Cantu (Untitled, Figures against Red)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
143	Capdeville(FouleBleue).jpg	Capdeville(FouleBleue)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
144	Carcan (Still Life).jpg	Carcan (Still Life)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
145	Carmi(Signal).jpg	Carmi(Signal)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
146	Carzou(LaChambre).jpg	Carzou(LaChambre)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
147	Cassill(Barren).jpg	Cassill(Barren)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
148	Castellon(KunmingBus).jpg	Castellon(KunmingBus)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
149	Castellon (The Artist Alone).jpg	Castellon (The Artist Alone)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
150	Caulfield(OhHelen).jpg	Caulfield(OhHelen)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
151	Chadwick(Composition).jpg	Chadwick(Composition)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
152	Chadwick(TwoBirds).jpg	Chadwick(TwoBirds)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
153	Chagall(Crows).jpg	Chagall(Crows)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
154	Chagall(Jeremiah).jpg	Chagall(Jeremiah)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
155	Chagall(Lovers).jpg	Chagall(Lovers)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
156	Chagall(Moses).jpg	Chagall(Moses)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
157	Chagall(Quai).jpg	Chagall(Quai)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
158	Chailloux(Brief).jpg	Chailloux(Brief)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
159	Chamberlin(Yuba).jpg	Chamberlin(Yuba)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
160	Chatham (Rearrangement).jpg	Chatham (Rearrangement)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
161	ChavezSanchez(Untitled).jpg	ChavezSanchez(Untitled)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
162	Chavez (tsk tsk).jpg	Chavez (tsk tsk)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
163	Childs(Satellite).jpg	Childs(Satellite)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
164	Chiriaco(Mythological).jpg	Chiriaco(Mythological)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
165	Christ-Janer(Skyforms).jpg	Christ-Janer(Skyforms)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
166	Citron(Mutation).jpg	Citron(Mutation)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
167	Claret(Untitled).jpg	Claret(Untitled)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
168	Clarke(Stages).jpg	Clarke(Stages)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
169	Clemente(Departure).jpg	Clemente(Departure)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
170	Cleveland(Daisies).JPG	Cleveland(Daisies)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
171	Cleveland(PinkFlower)jpg.jpg	Cleveland(PinkFlower)jpg_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
172	Cleveland(Tangerines).jpg	Cleveland(Tangerines)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
173	Cock(Ruins).jpg	Cock(Ruins)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
174	Coen(Head).jpg	Coen(Head)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
175	Colescott(FlorentineTowers).jpg	Colescott(FlorentineTowers)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
176	Colescott History.jpg	Colescott History_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
177	Colescott (Pursuit).jpg	Colescott (Pursuit)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
178	Cole(Underlaying).jpg	Cole(Underlaying)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
179	Conover (Cityscape).jpg	Conover (Cityscape)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
180	Coplans (Composition I).jpg	Coplans (Composition I)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
181	Corinth(BearingCross).jpg	Corinth(BearingCross)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
182	Corita (C capital clown).jpg	Corita (C capital clown)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
183	Corita (c is for clowns, etc.).jpg	Corita (c is for clowns, etc.)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
184	Corita (d is for digging it).jpg	Corita (d is for digging it)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
185	Corita (H I carry your heart).jpg	Corita (H I carry your heart)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
186	Corita (h is for my heart).jpg	Corita (h is for my heart)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
187	Corita (I i am coming alive).jpg	Corita (I i am coming alive)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
188	Corita (j is for jesus).jpg	Corita (j is for jesus)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
189	Corita (k is for knight).jpg	Corita (k is for knight)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
190	Corita (M however measured).jpg	Corita (M however measured)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
191	Corita (m is for magick).jpg	Corita (m is for magick)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
192	Corita (n is for caution).jpg	Corita (n is for caution)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
193	Corita (O is for god).jpg	Corita (O is for god)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
194	Corita (q is for cutie pie).jpg	Corita (q is for cutie pie)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
195	Corita (r is for rabbit).jpg	Corita (r is for rabbit)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
196	Corita (s is for saint).jpg	Corita (s is for saint)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
197	Corita (S my favorite symbols).jpg	Corita (S my favorite symbols)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
198	Corita (u is for us).jpg	Corita (u is for us)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
199	Corita (v is for vibrations).jpg	Corita (v is for vibrations)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
200	Corita (V very interesting).jpg	Corita (V very interesting)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
201	Corita (w is for white stone).jpg	Corita (w is for white stone)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
202	Corita (X give a damn).jpg	Corita (X give a damn)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
203	Corita (y is for why not).jpg	Corita (y is for why not)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
204	Corita (y why worry).jpg	Corita (y why worry)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
205	Cornell(ManWithCrossedArms).jpg	Cornell(ManWithCrossedArms)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
206	Coudrain (Israeli Landscape).jpg	Coudrain (Israeli Landscape)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
207	Cuni (Composition in White).jpg	Cuni (Composition in White)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
208	Cunningham(Sather).jpg	Cunningham(Sather)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
209	Curt(Composition with Blue).jpg	Curt(Composition with Blue)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
210	Curt (Landsape No. 2).jpg	Curt (Landsape No. 2)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
211	Curt(No177).jpg	Curt(No177)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
212	Curt(Untitled).jpg	Curt(Untitled)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
213	Dadgar(Art).jpg	Dadgar(Art)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
214	Dalenoord(Memento).jpg	Dalenoord(Memento)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
215	Daley (Philodendron).jpg	Daley (Philodendron)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
216	Dalvit(CompositionPink).jpg	Dalvit(CompositionPink)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
217	Damianovich (Air Spaces).jpg	Damianovich (Air Spaces)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
218	DAndlau(Chataignes).jpg	DAndlau(Chataignes)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
219	Daniells(Coast).jpg	Daniells(Coast)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
220	Daniels(Anuenue).jpg	Daniels(Anuenue)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
221	Daniels(Garden).jpg	Daniels(Garden)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
222	Daniels(Stream).jpg	Daniels(Stream)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
223	Das Gupta (Homage to Oriental Art Cat).jpg	Das Gupta (Homage to Oriental Art Cat)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
224	Daumier(LeDame).jpg	Daumier(LeDame)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
225	daumier (les bons).jpg	daumier (les bons)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
226	Daumier(Quand).jpg	Daumier(Quand)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
227	Daumier(Visite).jpg	Daumier(Visite)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
228	Davies(MotherChild).jpg	Davies(MotherChild)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
229	Debenjak (Cycle 5).jpg	Debenjak (Cycle 5)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
230	De Chirico (Untitled).jpg	De Chirico (Untitled)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
231	De Forest (2300).jpg	De Forest (2300)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
232	Dehn (India Night).jpg	Dehn (India Night)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
233	Dehn(Mountain).jpg	Dehn(Mountain)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
234	DehnVirginia(Night).jpg	DehnVirginia(Night)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
235	Delaunay (Composition).jpg	Delaunay (Composition)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
236	Delaunay(Form).jpg	Delaunay(Form)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
237	Demauro(Bird).jpg	Demauro(Bird)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
238	Denis(MotherChildCypress).jpg	Denis(MotherChildCypress)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
239	Derpapas(Untitled).jpg	Derpapas(Untitled)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
240	Deshaies(CycleSmallSea).jpg	Deshaies(CycleSmallSea)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
241	Deshaies (Hornet's Nest).jpg	Deshaies (Hornet's Nest)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
242	Dikkenboer (Still Life).jpg	Dikkenboer (Still Life)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
243	Dobkin (The Black BLouse.jpg	Dobkin (The Black BLouse_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
244	Dombeck (S.F. Fire Escape).jpg	Dombeck (S.F. Fire Escape)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
245	domberger (brown squares).jpg	domberger (brown squares)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
246	Dorny (Almina).jpg	Dorny (Almina)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
247	Dorny(City Lights).jpg	Dorny(City Lights)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
248	Dorny(Kilkenny.jpg	Dorny(Kilkenny_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
249	Dorny (Milk Orange).jpg	Dorny (Milk Orange)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
250	DosSantos(EveningPost).jpg	DosSantos(EveningPost)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
251	Dos Santos (Little Garden).jpg	Dos Santos (Little Garden)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
252	DSCN2802.JPG	DSCN2802_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
253	DSCN2803.JPG	DSCN2803_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
254	DSCN2805.JPG	DSCN2805_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
255	DSCN2807.JPG	DSCN2807_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
256	DSCN2821.JPG	DSCN2821_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
257	Dubreuil(Women Bathing).jpg	Dubreuil(Women Bathing)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
258	dubuffet (illustration).jpg	dubuffet (illustration)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
259	Dubuffet(Impermanence).jpg	Dubuffet(Impermanence)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
260	dubuffet (inervention).jpg	dubuffet (inervention)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
261	Dufy(DeuxAntillaises).jpg	Dufy(DeuxAntillaises)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
262	Dufy (Homage).jpg	Dufy (Homage)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
263	Dufy (Mozart).jpg	Dufy (Mozart)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
264	Dunoyer(La Seine).jpg	Dunoyer(La Seine)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
265	Eckmair (Public Landing).jpg	Eckmair (Public Landing)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
266	Eder (Untitled, Diving).jpg	Eder (Untitled, Diving)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
267	Eder (Untitled, Sunny).jpg	Eder (Untitled, Sunny)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
268	Edzard (Sisters).jpg	Edzard (Sisters)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
269	Eggers (From Twins).jpg	Eggers (From Twins)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
270	Eglau (Abstract Floating Landscape).jpg	Eglau (Abstract Floating Landscape)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
271	Eglau (Rocky Landscape).jpg	Eglau (Rocky Landscape)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
272	Eglau (Rocky Landscape, Portugal).jpg	Eglau (Rocky Landscape, Portugal)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
273	EphraimMarcus(Genezareth).jpg	EphraimMarcus(Genezareth)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
274	Ernst (Eule Owl).jpg	Ernst (Eule Owl)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
275	Ernst (Line Drawing on Blue).jpg	Ernst (Line Drawing on Blue)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
276	Ernst(Untitled).jpg	Ernst(Untitled)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
277	Esteve (Composition).jpg	Esteve (Composition)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
278	Esteve (Untitled).jpg	Esteve (Untitled)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
279	Faber(Abstraction).jpg	Faber(Abstraction)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
280	Fah(Opaline).jpg	Fah(Opaline)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
281	Falco(Noche).jpg	Falco(Noche)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
282	FantinLatour(CroquisDance).jpg	FantinLatour(CroquisDance)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
283	FantinLatour(UnMorceau).jpg	FantinLatour(UnMorceau)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
284	Ferenbach(ClosingUp).jpg	Ferenbach(ClosingUp)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
285	Fiorini(CompositionIII).jpg	Fiorini(CompositionIII)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
286	Fiorini (La Place).jpg	Fiorini (La Place)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
287	Fiorini(Taormina).jpg	Fiorini(Taormina)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
288	Fitreman(LaGrande).jpg	Fitreman(LaGrande)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
289	Flory(Crab).jpg	Flory(Crab)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
290	Forain(CourtroomScene).jpg	Forain(CourtroomScene)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
291	Forain(SeatedWoman).jpg	Forain(SeatedWoman)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
292	Ford(OrangeInterior).jpg	Ford(OrangeInterior)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
293	Fornas(DevilsFuneral).jpg	Fornas(DevilsFuneral)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
294	Forrester (Last Warren Trees).jpg	Forrester (Last Warren Trees)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
295	Forsberg(Temple).jpg	Forsberg(Temple)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
296	Forsberg(UrefOch).jpg	Forsberg(UrefOch)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
297	Foster(Wrapped).jpg	Foster(Wrapped)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
298	Francis(OneCentLife).jpg	Francis(OneCentLife)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
299	FrasconiAntonio(SardineBoat).jpg	FrasconiAntonio(SardineBoat)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
300	FrasconiPablo(Duomo).jpg	FrasconiPablo(Duomo)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
301	Frederick (Japanese Waters II).jpg	Frederick (Japanese Waters II)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
302	Frederick(Renewal).jpg	Frederick(Renewal)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
303	Frelaut(FloodVendee).jpg	Frelaut(FloodVendee)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
304	Friedlaender(Composition).jpg	Friedlaender(Composition)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
305	Friedlaender(Coq).jpg	Friedlaender(Coq)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
306	Friedlander(Composition3).jpg	Friedlander(Composition3)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
307	Friedlander(CompositionI).jpg	Friedlander(CompositionI)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
308	Friedlander(Crepuscule).jpg	Friedlander(Crepuscule)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
309	Frink (Herring Gull).jpg	Frink (Herring Gull)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
310	Frink (Pigeons).jpg	Frink (Pigeons)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
311	Fukazawa(Untitled).jpg	Fukazawa(Untitled)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
312	Gantner(Water).jpg	Gantner(Water)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
313	Garbarina(TheDance).JPG	Garbarina(TheDance)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
314	Garcia (Maguey).jpg	Garcia (Maguey)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
315	Gellee (No. 13).jpg	Gellee (No. 13)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
316	Gellee (No. 36).jpg	Gellee (No. 36)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
317	Gellee (Shepherd).jpg	Gellee (Shepherd)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
318	Gerlach(Ancient).jpg	Gerlach(Ancient)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
319	Germain(Composition).jpg	Germain(Composition)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
320	Gersh(Gas Mask).jpg	Gersh(Gas Mask)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
321	Gersh(Light).jpg	Gersh(Light)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
322	Gersh(Untitled II).jpg	Gersh(Untitled II)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
323	Gersh(Untitled I).jpg	Gersh(Untitled I)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
324	Giacometti (Untiteld, Portrait of a Man).jpg	Giacometti (Untiteld, Portrait of a Man)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
325	Giacometti (Untitled, Portrait of a Man in Glasses) .jpg	Giacometti (Untitled, Portrait of a Man in Glasses) _360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
326	Giacometti (Untitled, Sitting Nude).jpg	Giacometti (Untitled, Sitting Nude)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
327	Gibbons(Dusk).jpg	Gibbons(Dusk)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
328	Gibbons(Embarcadero Center).jpg	Gibbons(Embarcadero Center)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
329	Gibbons(Embarcadero Upwards).jpg	Gibbons(Embarcadero Upwards)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
330	Gibbons(Fillmore).jpg	Gibbons(Fillmore)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
331	Gibbons (Golden Gate).jpg	Gibbons (Golden Gate)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
332	Gibbons(Hayes).jpg	Gibbons(Hayes)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
333	Gibbons(Ol House).jpg	Gibbons(Ol House)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
334	Giraldon(Lutece).jpg	Giraldon(Lutece)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
335	Gisiger(Ecuries).jpg	Gisiger(Ecuries)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
336	Goldyne(FishPlatter).jpg	Goldyne(FishPlatter)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
337	Gollifer(PlateV).jpg	Gollifer(PlateV)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
338	GonzalezTornero(Naub).jpg	GonzalezTornero(Naub)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
339	Gonzalez-Tornero( Tree).jpg	Gonzalez-Tornero( Tree)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
340	Gorey(InGymnasium).jpg	Gorey(InGymnasium)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
341	Gorey(InsectBicycle).jpg	Gorey(InsectBicycle)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
342	Gorey(LadyYachtDeck).jpg	Gorey(LadyYachtDeck)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
343	Goudt(TobiasCarryingtheFish).JPG	Goudt(TobiasCarryingtheFish)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
344	Goya(Abuelo).jpg	Goya(Abuelo)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
345	Goya(Discipulo).jpg	Goya(Discipulo)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
346	Goya(Mano).jpg	Goya(Mano)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
347	Goya(Repulen).jpg	Goya(Repulen)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
348	Graeff(Lidru).jpg	Graeff(Lidru)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
349	Graeff(Ligriklo).jpg	Graeff(Ligriklo)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
350	Graham (Ascending Forms).jpg	Graham (Ascending Forms)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
351	Grant(HouseLord).jpg	Grant(HouseLord)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
352	Greaver(Duet).jpg	Greaver(Duet)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
353	Greaves (van gogh).jpg	Greaves (van gogh)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
354	Greenfield(Anemones).jpg	Greenfield(Anemones)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
355	GreenPeter(BlueLandFigure).jpg	GreenPeter(BlueLandFigure)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
356	GreenPeter(SeaWoodForm).jpg	GreenPeter(SeaWoodForm)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
357	Gropper(SwingLowChariot).jpg	Gropper(SwingLowChariot)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
358	Gropper(Untitled).jpg	Gropper(Untitled)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
359	Gross(GrezelesVineyards).jpg	Gross(GrezelesVineyards)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
360	Gross(RoundedHills).jpg	Gross(RoundedHills)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
361	Grosz (In Memory).jpg	Grosz (In Memory)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
362	Grosz(Kartenspieler).jpg	Grosz(Kartenspieler)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
363	Grut(Untitled).jpg	Grut(Untitled)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
364	Gui(Remnant).jpg	Gui(Remnant)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
365	Gui(Untitled).jpg	Gui(Untitled)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
366	Gunther(DuomoFlorence).jpg	Gunther(DuomoFlorence)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
367	Gustafson(KindofChairs).jpg	Gustafson(KindofChairs)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
368	Haan (Feuille).jpg	Haan (Feuille)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
369	Haan (Oil Well).jpg	Haan (Oil Well)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
370	Haase(DivisionsSpace).jpg	Haase(DivisionsSpace)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
371	Haden(BatterseaReach).jpg	Haden(BatterseaReach)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
372	Haessle.jpg	Haessle_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
373	Hagiwara(NecklaceHeavens).jpg	Hagiwara(NecklaceHeavens)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
374	Harding(Elm).jpg	Harding(Elm)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
375	Harnest(CompositionBlueYellow).jpg	Harnest(CompositionBlueYellow)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
376	Harnest(CompositionOrange).jpg	Harnest(CompositionOrange)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
377	Harris(Amor).jpg	Harris(Amor)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
378	Harris(BotanicalI).jpg	Harris(BotanicalI)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
379	Harris(Carnations).jpg	Harris(Carnations)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
380	Harris(DividedCountry).JPG	Harris(DividedCountry)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
381	Harris(Little Dahlias).jpg	Harris(Little Dahlias)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
382	Harris(Lovers).JPG	Harris(Lovers)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
383	Harrison(RegalInsert).jpg	Harrison(RegalInsert)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
384	Harris(StripedBowl).jpg	Harris(StripedBowl)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
385	Harris(TeAmo).jpg	Harris(TeAmo)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
386	Hartigan(PallasAthena).jpg	Hartigan(PallasAthena)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
387	Hartigan(Untitled).jpg	Hartigan(Untitled)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
388	Hart(JerseyHills).jpg	Hart(JerseyHills)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
389	Hartung(Composition2).jpg	Hartung(Composition2)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
390	Harumasu (Young Girl).jpg	Harumasu (Young Girl)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
391	Hasegawa(Indifference).jpg	Hasegawa(Indifference)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
392	Hasegawa(MaskedBallII).jpg	Hasegawa(MaskedBallII)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
393	Hauser Bunny Shark (2).JPG	Hauser Bunny Shark (2)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
394	Hayter(Danae).jpg	Hayter(Danae)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
395	Hayter(Noyee).jpg	Hayter(Noyee)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
396	Heath(Character).jpg	Heath(Character)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
397	Heath(ToBe).jpg	Heath(ToBe)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
398	Heckel(KrankesMadchen).jpg	Heckel(KrankesMadchen)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
399	Hernandez(Manual).jpg	Hernandez(Manual)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
400	Hernandez(Skull).jpg	Hernandez(Skull)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
401	Hernandez(Yin).jpg	Hernandez(Yin)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
402	Hickey(3Pears).jpg	Hickey(3Pears)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
403	Hickey(Leek).jpg	Hickey(Leek)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
404	Hickey(StillLifeBlue).jpg	Hickey(StillLifeBlue)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
405	Hidekata(Untitled).jpg	Hidekata(Untitled)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
406	Higgins(FlightEgypt).jpg	Higgins(FlightEgypt)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
407	Hiroshige(Fireworks).jpg	Hiroshige(Fireworks)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
408	Hiroshige(PoundingCloth).jpg	Hiroshige(PoundingCloth)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
409	Hnizdovsky(Bouquet).jpg	Hnizdovsky(Bouquet)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
410	Hoff(EdgeofForest).jpg	Hoff(EdgeofForest)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
411	Hogarth(DistressedPoet).jpg	Hogarth(DistressedPoet)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
412	Hokusai(UraFuji).jpg	Hokusai(UraFuji)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
413	holmes (stripes).jpg	holmes (stripes)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
414	Holsten(BoyBoat).jpg	Holsten(BoyBoat)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
415	Holston(YoungFisherman).jpg	Holston(YoungFisherman)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
416	Honegger (Similair).jpg	Honegger (Similair)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
417	Honegger(Waldfrucht).jpg	Honegger(Waldfrucht)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
418	Horner(MuirBeach).JPG	Horner(MuirBeach)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
419	Howard(DoubleDee).jpg	Howard(DoubleDee)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
420	Hundertwasser(PaintedWords).JPG	Hundertwasser(PaintedWords)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
421	Hunter(DeathofArt).jpg	Hunter(DeathofArt)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
422	Hunter(SelfPortraitHistorians).jpg	Hunter(SelfPortraitHistorians)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
423	Hussong(Intaglio).jpg	Hussong(Intaglio)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
424	Hussong(Lithography).jpg	Hussong(Lithography)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
425	Hussong(Relief).jpg	Hussong(Relief)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
426	Hussong(Screenprinting).jpg	Hussong(Screenprinting)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
427	Ihle(AnimalKingdom).jpg	Ihle(AnimalKingdom)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
428	Ikeda (Four Hands).jpg	Ikeda (Four Hands)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
429	Ikegawa (Maru-to-Shima).jpg	Ikegawa (Maru-to-Shima)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
430	Ikegawa (Monogatari).jpg	Ikegawa (Monogatari)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
431	Ikegawa(Sakana II).jpg	Ikegawa(Sakana II)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
432	Ikegawa(Sakana).jpg	Ikegawa(Sakana)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
433	Inshaw (Girl).jpg	Inshaw (Girl)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
434	Isabey(EgliseSaintJean).jpg	Isabey(EgliseSaintJean)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
435	Jager (Gnolis).jpg	Jager (Gnolis)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
436	Jager(Munchen).jpg	Jager(Munchen)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
437	Janko(MoonValley).jpg	Janko(MoonValley)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
438	Johnson (Castings).jpg	Johnson (Castings)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
439	JohnsonWoodrow(Monkey).jpg	JohnsonWoodrow(Monkey)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
440	Johnston(IvoryCoast).jpg	Johnston(IvoryCoast)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
441	Johnston(Monsoon).jpg	Johnston(Monsoon)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
442	Jones (Candy Heart).jpg	Jones (Candy Heart)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
443	Jones(FourthJuly).jpg	Jones(FourthJuly)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
444	Jones (Scallions).jpg	Jones (Scallions)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
445	Jongkind (Views of Holland).jpg	Jongkind (Views of Holland)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
446	Jo(RIP).jpg	Jo(RIP)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
447	Josifov (Missing).jpg	Josifov (Missing)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
448	Jules(YoungMusician).jpg	Jules(YoungMusician)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
449	Kain(WinterPear).jpg	Kain(WinterPear)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
450	Kandinsky(Composition).jpg	Kandinsky(Composition)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
451	Kano(Untitled).jpg	Kano(Untitled)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
452	Kaplan(Redhead).jpg	Kaplan(Redhead)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
453	Kasten(Aix).jpg	Kasten(Aix)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
454	Kasten(Amalfi).jpg	Kasten(Amalfi)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
455	Kasten(AndroclesLion).jpg	Kasten(AndroclesLion)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
456	Kasten (A Time and a Place).jpg	Kasten (A Time and a Place)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
457	Kasten(BlueJeans).jpg	Kasten(BlueJeans)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
458	Kasten(FeteStJean).jpg	Kasten(FeteStJean)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
459	Kasten(Firebird).jpg	Kasten(Firebird)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
460	Kasten(TidesTime).jpg	Kasten(TidesTime)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
461	Katsuda(No75Butterfly).jpg	Katsuda(No75Butterfly)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
462	Kawashima(No106).jpg	Kawashima(No106)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
463	Kay(Bourges).jpg	Kay(Bourges)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
464	Kelly(Net).jpg	Kelly(Net)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
465	Kelly(Red-orange over blue).jpg	Kelly(Red-orange over blue)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
466	Kent(TheTree).jpg	Kent(TheTree)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
467	Kiley(Abstraction).jpg	Kiley(Abstraction)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
468	Killion(Tamalpais).jpg	Killion(Tamalpais)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
469	Kimura (Blue Wind D).jpg	Kimura (Blue Wind D)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
470	Kimura(OntheSquare).jpg	Kimura(OntheSquare)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
471	Kinoshita(Untitled).jpg	Kinoshita(Untitled)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
472	Kirchner(ZweiReitende).jpg	Kirchner(ZweiReitende)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
473	Kishi(Bird).jpg	Kishi(Bird)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
474	Kishi(CatGirl).jpg	Kishi(CatGirl)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
475	Kitaj(Arden).jpg	Kitaj(Arden)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
476	Kitaj(Fear).jpg	Kitaj(Fear)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
477	Kitaj(PortraitCreeley).jpg	Kitaj(PortraitCreeley)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
478	Klinghoffer(MotherChild).jpg	Klinghoffer(MotherChild)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
479	Knispel (Kasrilevke).jpg	Knispel (Kasrilevke)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
480	Kobashi (Swamp Plant).jpg	Kobashi (Swamp Plant)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
481	Kogyo(FloatingBridge).jpg	Kogyo(FloatingBridge)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
482	Kogyo(Naniwa).jpg	Kogyo(Naniwa)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
483	Kohn(DoublePortrait).jpg	Kohn(DoublePortrait)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
484	Kohn(Mathematician).jpg	Kohn(Mathematician)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
485	Kohn(Mountain).jpg	Kohn(Mountain)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
486	Kohn(Stranger).jpg	Kohn(Stranger)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
487	Kohn(Wildcat).jpg	Kohn(Wildcat)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
488	Kokoschka(Frogs10).jpg	Kokoschka(Frogs10)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
489	Kokoschka(Frogs11).jpg	Kokoschka(Frogs11)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
490	Kokoschka(Frogs12).jpg	Kokoschka(Frogs12)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
491	Kokoschka(Frogs1).jpg	Kokoschka(Frogs1)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
492	Kokoschka(Frogs2).jpg	Kokoschka(Frogs2)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
493	Kokoschka(Frogs3).jpg	Kokoschka(Frogs3)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
494	Kokoschka(Frogs4).jpg	Kokoschka(Frogs4)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
495	Kokoschka(Frogs5).jpg	Kokoschka(Frogs5)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
496	Kokoschka(Frogs6).jpg	Kokoschka(Frogs6)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
497	Kokoschka(Frogs7).jpg	Kokoschka(Frogs7)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
498	Kokoschka(Frogs8).jpg	Kokoschka(Frogs8)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
499	Kokoschka(Frogs9).jpg	Kokoschka(Frogs9)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
500	Kokoschka(Wanderer).jpg	Kokoschka(Wanderer)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
501	Kollwitz (Mother).jpg	Kollwitz (Mother)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
502	Koppel(BostonRavine).jpg	Koppel(BostonRavine)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
503	Koppel (Crossing of the Chowchillas River).jpg	Koppel (Crossing of the Chowchillas River)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
504	Koppel(EntranceTejonPass).jpg	Koppel(EntranceTejonPass)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
505	Koppelman (Retrospect).jpg	Koppelman (Retrospect)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
506	Koppel(ValleyKahWeeYa).jpg	Koppel(ValleyKahWeeYa)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
507	Korin(Garden).jpg	Korin(Garden)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
508	Krikorian(CompositioninGrey).JPG	Krikorian(CompositioninGrey)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
509	Kruck (Cloudy Skyline).jpg	Kruck (Cloudy Skyline)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
510	Kruck (Massada, Israel).jpg	Kruck (Massada, Israel)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
511	Kugler (Alte Maner in Rom).jpg	Kugler (Alte Maner in Rom)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
512	Kugler(OldWalls).jpg	Kugler(OldWalls)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
513	Kuniyoshi (The 47 Ronin-Nobukiyo).jpg	Kuniyoshi (The 47 Ronin-Nobukiyo)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
514	Kupfernagel(OldHouse).jpg	Kupfernagel(OldHouse)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
515	Landacre(SomeIngredients).jpg	Landacre(SomeIngredients)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
516	Landau(Palace).jpg	Landau(Palace)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
517	Landau(TheHarp).jpg	Landau(TheHarp)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
518	Landau(T.R.).jpg	Landau(T.R.)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
519	LaPel (Kwuf Kubal GafnitSpurdal Nug).jpg	LaPel (Kwuf Kubal GafnitSpurdal Nug)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
520	Lardera(Untitled).jpg	Lardera(Untitled)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
521	Larkin (Yellow Vase).jpg	Larkin (Yellow Vase)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
522	Le Brocquy (Child with Flowers).jpg	Le Brocquy (Child with Flowers)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
523	LeBrocquy(TheTain).jpg	LeBrocquy(TheTain)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
524	LeCorbusier(OffeneHand).jpg	LeCorbusier(OffeneHand)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
525	LeCorbusier(Solstice).jpg	LeCorbusier(Solstice)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
526	Leger(LaGare).jpg	Leger(LaGare)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
527	Leger(Paraplules).jpg	Leger(Paraplules)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
528	Lent(TwoTrees).jpg	Lent(TwoTrees)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
529	Lepere(LaVie).jpg	Lepere(LaVie)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
530	Lepere(LeQuartier).jpg	Lepere(LeQuartier)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
531	Lepere(StormSandDune).jpg	Lepere(StormSandDune)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
532	Leroy(BridalVeil).jpg	Leroy(BridalVeil)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
533	Leroy(OurHouse).jpg	Leroy(OurHouse)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
534	LeVa(Installation).jpg	LeVa(Installation)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
535	Levine(AdamEve).jpg	Levine(AdamEve)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
536	Levine(Hillel).jpg	Levine(Hillel)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
537	Levine(RapeSabines).jpg	Levine(RapeSabines)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
538	Levy (Horse).jpg	Levy (Horse)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
539	LeWitt Lines in 4 Directions (2).JPG	LeWitt Lines in 4 Directions (2)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
540	LeYaouanc(Deviation).jpg	LeYaouanc(Deviation)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
541	Lininger(Archae).jpg	Lininger(Archae)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
542	Lininger(HoldingPatterns).jpg	Lininger(HoldingPatterns)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
543	Lininger(HomageSharaku).jpg	Lininger(HomageSharaku)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
544	Lininger(MelancholiaII).jpg	Lininger(MelancholiaII)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
545	Lininger(YanthraIII).jpg	Lininger(YanthraIII)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
546	liu, hung (miss fortune).jpg	liu, hung (miss fortune)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
547	Li (Untitled, Butterfly).jpg	Li (Untitled, Butterfly)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
548	Li (Untitled, Dragonfly).jpg	Li (Untitled, Dragonfly)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
549	Lllovet(Untitled).jpg	Lllovet(Untitled)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
550	Longstreet (Medics, Pacific).jpg	Longstreet (Medics, Pacific)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
551	Longstreet (Secret Language).jpg	Longstreet (Secret Language)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
552	Longstreet (The Blue Peach).jpg	Longstreet (The Blue Peach)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
553	Longstreet (Untitled, Medics).jpg	Longstreet (Untitled, Medics)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
554	Longstreet (Untitled Still-Life).jpg	Longstreet (Untitled Still-Life)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
555	lopez (womens).jpg	lopez (womens)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
556	Louttre(LaRosiere).jpg	Louttre(LaRosiere)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
557	Lowney Path.JPG	Lowney Path_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
558	Luca(ToAndFro).jpg	Luca(ToAndFro)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
559	Mack (Rainbow Caught in the Mist).jpg	Mack (Rainbow Caught in the Mist)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
560	Maglione (Untitled).jpg	Maglione (Untitled)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
561	Maillol(StandingNude).jpg	Maillol(StandingNude)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
562	Maki(SymbolNo2).jpg	Maki(SymbolNo2)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
563	Maki(Untitled).jpg	Maki(Untitled)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
564	Makk (Floating Lilies).jpg	Makk (Floating Lilies)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
565	Makk (September Pond).jpg	Makk (September Pond)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
566	Mamnguqsualuk (Bear People Sharing Some Fish).jpg	Mamnguqsualuk (Bear People Sharing Some Fish)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
567	Manaresi(Landscape).jpg	Manaresi(Landscape)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
568	Manessier(Fevrier).jpg	Manessier(Fevrier)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
569	Manet(Berthe).jpg	Manet(Berthe)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
570	Marca-Relli (Untitled Collage).jpg	Marca-Relli (Untitled Collage)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
571	Marcks(Totenhaupt).jpg	Marcks(Totenhaupt)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
572	Margitich (Dense).jpg	Margitich (Dense)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
573	Margitich (Friends Digging).jpg	Margitich (Friends Digging)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
574	Margitich (Friends).jpg	Margitich (Friends)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
575	Margitich (Friends New Lake).jpg	Margitich (Friends New Lake)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
576	Margitich (Friends Shoveling).jpg	Margitich (Friends Shoveling)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
577	Margitich (Friends Tractors).jpg	Margitich (Friends Tractors)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
578	Margitich (Loading a Canon).jpg	Margitich (Loading a Canon)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
579	Marin(ChurchTower).jpg	Marin(ChurchTower)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
580	Marin(DellaFava).jpg	Marin(DellaFava)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
581	Marini (Acrobat).jpg	Marini (Acrobat)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
582	Marini(Composition).jpg	Marini(Composition)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
583	Markson(Bath).jpg	Markson(Bath)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
584	Markson(Everton).jpg	Markson(Everton)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
585	Markson (Queens Dock).jpg	Markson (Queens Dock)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
586	Marquet (Le Pont Neuf).jpg	Marquet (Le Pont Neuf)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
587	Marsh (Bowery).jpg	Marsh (Bowery)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
588	Marten(Daydream).jpg	Marten(Daydream)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
589	Marten(Moment).jpg	Marten(Moment)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
590	Marten(Pride).jpg	Marten(Pride)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
591	Martinelli (Net and Triton).jpg	Martinelli (Net and Triton)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
592	Martin(Parsley).jpg	Martin(Parsley)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
593	Martin(Trouville).jpg	Martin(Trouville)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
594	MarxEvelyn(FrozenCalm).jpg	MarxEvelyn(FrozenCalm)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
595	MarxRobert(Woman).jpg	MarxRobert(Woman)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
596	Marx (Woman in Spring Hat).jpg	Marx (Woman in Spring Hat)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
597	Masayoshi(Untitled).jpg	Masayoshi(Untitled)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
598	Massie(Peconic).jpg	Massie(Peconic)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
599	Masson(LaModele).jpg	Masson(LaModele)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
600	Masson(LeavesNo2).jpg	Masson(LeavesNo2)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
601	Matoush(MidnightRider).jpg	Matoush(MidnightRider)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
602	Matta(Astronauts).jpg	Matta(Astronauts)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
603	Max(Poster2020).jpg	Max(Poster2020)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
604	Max(Poster).jpg	Max(Poster)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
605	Mayner (Untitled Composition).jpg	Mayner (Untitled Composition)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
606	McBride(Sinking).jpg	McBride(Sinking)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
607	McBride(Trick).jpg	McBride(Trick)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
608	McCloskey(Departure).jpg	McCloskey(Departure)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
609	McCombs(StreetCorner).jpg	McCombs(StreetCorner)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
610	McEwen(Tulips).jpg	McEwen(Tulips)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
611	McGary(ThreeWomen).jpg	McGary(ThreeWomen)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
612	McMillan(Loon).jpg	McMillan(Loon)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
613	Meckseper(Flaschen).jpg	Meckseper(Flaschen)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
614	Meeker(SwampTheme).jpg	Meeker(SwampTheme)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
615	Merida (Los Cafrades).jpg	Merida (Los Cafrades)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
616	Mersereau (Car Troubles).jpg	Mersereau (Car Troubles)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
617	Merwart (Untitled).jpg	Merwart (Untitled)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
618	Metz(Bruke).jpg	Metz(Bruke)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
619	Metz(EdgeCity).jpg	Metz(EdgeCity)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
620	Meyer(Gasshopper).jpg	Meyer(Gasshopper)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
621	Micossi(RoccaLaziale).jpg	Micossi(RoccaLaziale)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
622	Millares(Untitled).jpg	Millares(Untitled)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
623	Millington(Nasturtiums).jpg	Millington(Nasturtiums)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
624	Millington (Watering Can).jpg	Millington (Watering Can)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
625	Milshtein(LesCartes).jpg	Milshtein(LesCartes)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
626	Milton (Panorama).jpg	Milton (Panorama)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
627	Minami(Tree).jpg	Minami(Tree)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
628	Minoru(GiftBicycle).jpg	Minoru(GiftBicycle)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
629	Miro (Poster).jpg	Miro (Poster)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
630	Mitchell (Rainforest).jpg	Mitchell (Rainforest)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
631	Miyasaki (Eclipse).jpg	Miyasaki (Eclipse)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
632	Miyashita(VillageonHill).jpg	Miyashita(VillageonHill)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
633	Moholy(Dusk).jpg	Moholy(Dusk)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
634	Moore(BlackRedImage).jpg	Moore(BlackRedImage)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
635	Moore(Orca).jpg	Moore(Orca)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
636	Moore(SeatedFigures).jpg	Moore(SeatedFigures)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
637	Morgan(Granite).jpg	Morgan(Granite)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
638	Morgan (Percenda).jpg	Morgan (Percenda)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
639	Morisot(Cat).jpg	Morisot(Cat)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
640	Morisot(Drawing).jpg	Morisot(Drawing)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
641	Mubarak(2350).jpg	Mubarak(2350)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
642	Muller(YoungGirl).jpg	Muller(YoungGirl)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
643	Mumprecht((LaColombe).jpg	Mumprecht((LaColombe)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
644	Munch(LaGrandParoi).jpg	Munch(LaGrandParoi)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
645	Music(ApresPeche).jpg	Music(ApresPeche)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
646	Music (Journey).jpg	Music (Journey)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
647	Music(MotifI).jpg	Music(MotifI)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
648	Nakayama(Untitled).jpg	Nakayama(Untitled)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
649	Nakazawa(Shoshun).jpg	Nakazawa(Shoshun)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
650	Nash (Still Life).jpg	Nash (Still Life)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
651	Neeley(Downstream).jpg	Neeley(Downstream)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
652	Neeley(Moss).jpg	Neeley(Moss)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
653	Nelson (Dark Horse).jpg	Nelson (Dark Horse)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
654	Nelson (My Mustang).jpg	Nelson (My Mustang)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
655	Nice Bear.JPG	Nice Bear_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
656	Nicholson(Flower).jpg	Nicholson(Flower)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
657	Nicholson(May).jpg	Nicholson(May)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
658	Nieman(Lips).jpg	Nieman(Lips)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
659	Noda (Diary).jpg	Noda (Diary)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
660	Norton (Circles).jpg	Norton (Circles)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
661	Nowak (Mountain).jpg	Nowak (Mountain)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
662	Nunzio (Paesaggio No. 4).jpg	Nunzio (Paesaggio No. 4)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
663	Obata(Horse).jpg	Obata(Horse)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
664	OHara(Hunt).jpg	OHara(Hunt)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
665	Ohmae(Brave).jpg	Ohmae(Brave)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
666	Okamura (Song of Mussel).jpg	Okamura (Song of Mussel)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
667	Okona(Landing).jpg	Okona(Landing)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
668	Oldenburg (Sketch).jpg	Oldenburg (Sketch)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
669	Oldenburg (Typewriter).jpg	Oldenburg (Typewriter)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
670	Oliveira (Great Bird).jpg	Oliveira (Great Bird)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
671	ONeal(Dark).jpg	ONeal(Dark)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
672	Onosato (Untitled).jpg	Onosato (Untitled)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
673	Ono(Untitled).jpg	Ono(Untitled)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
674	Oparah(Unititled).jpg	Oparah(Unititled)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
675	Orvik(Marjerie).jpg	Orvik(Marjerie)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
676	Ostrower(CompositionBrown).jpg	Ostrower(CompositionBrown)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
677	Otterson (Broken Black).jpg	Otterson (Broken Black)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
678	Oudot(Eygalieris.jpg	Oudot(Eygalieris_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
679	Oudot(Wreathed).jpg	Oudot(Wreathed)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
680	Paabus(Passage).jpg	Paabus(Passage)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
681	Palmer(WearyPloughman).jpg	Palmer(WearyPloughman)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
682	Paolozzi (Experience).jpg	Paolozzi (Experience)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
683	Parnall (Honeycomb).jpg	Parnall (Honeycomb)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
684	Pauwels(Aloe).jpg	Pauwels(Aloe)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
685	Pechstein (Village).jpg	Pechstein (Village)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
686	Pellerin (Mort de).jpg	Pellerin (Mort de)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
687	Perrin(Penmachuo).jpg	Perrin(Penmachuo)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
688	Peterson (Pink).jpg	Peterson (Pink)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
689	Petit(Beach).jpg	Petit(Beach)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
690	Pfahler(LookPoster).jpg	Pfahler(LookPoster)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
691	Pfeiffer(Portable).jpg	Pfeiffer(Portable)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
692	Picasso (Bouquet).jpg	Picasso (Bouquet)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
693	Picasso (Knife and Apple).jpg	Picasso (Knife and Apple)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
694	Picasso(Profile).jpg	Picasso(Profile)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
695	Picasso (Satyr).jpg	Picasso (Satyr)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
696	Picasso (Small Dove).jpg	Picasso (Small Dove)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
697	Pierce(BirdsSunflowers).jpg	Pierce(BirdsSunflowers)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
698	Piper(High).jpg	Piper(High)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
699	Piper(PetworthParkGates).jpg	Piper(PetworthParkGates)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
700	Piranesi (Della Facciata).jpg	Piranesi (Della Facciata)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
701	Piranesi (Veduta).jpg	Piranesi (Veduta)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
702	Pohlod(Untitled).jpg	Pohlod(Untitled)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
703	Polau(Nuus).jpg	Polau(Nuus)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
704	Poleo (Mother and Child).jpg	Poleo (Mother and Child)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
705	Poliakoff (Untitled, Composition).jpg	Poliakoff (Untitled, Composition)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
706	Polos(Aquarium).jpg	Polos(Aquarium)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
707	polos (still life with flowers).jpg	polos (still life with flowers)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
708	Pomodoro (Untitled 152).jpg	Pomodoro (Untitled 152)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
709	Pomodoro ( Untitled No. 153).jpg	Pomodoro ( Untitled No. 153)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
710	PonceDeLeon(SummerHorizons).jpg	PonceDeLeon(SummerHorizons)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
711	Pond(GrandmothersFan).jpg	Pond(GrandmothersFan)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
712	Pond (My Modern Toaster-Heater-Oven).jpg	Pond (My Modern Toaster-Heater-Oven)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
713	Poskovic (Well-Known Folly).jpg	Poskovic (Well-Known Folly)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
714	Pozatti (Tower of Babel).jpg	Pozatti (Tower of Babel)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
715	Prassinos(NuitDeLeau).jpg	Prassinos(NuitDeLeau)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
716	Prida(DeOtrasMundos).jpg	Prida(DeOtrasMundos)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
717	Prussing(KilaueaPoint).jpg	Prussing(KilaueaPoint)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
718	Prussing(NaPaliCoast).jpg	Prussing(NaPaliCoast)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
719	Quentin(Fusiori).jpg	Quentin(Fusiori)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
720	Raffael (II Fish).jpg	Raffael (II Fish)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
721	Rajput-Jodphur (Raja).jpg	Rajput-Jodphur (Raja)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
722	Rappe (Musicians).jpg	Rappe (Musicians)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
723	Rappe (White Iris).jpg	Rappe (White Iris)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
724	Realier-Dumas(Corinne).jpg	Realier-Dumas(Corinne)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
725	Rebeyrolle(Composition).jpg	Rebeyrolle(Composition)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
726	Rebeyrolle(L'oiseauPerdu).jpg	Rebeyrolle(L'oiseauPerdu)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
727	Redon(DesertStuddedMountains).jpg	Redon(DesertStuddedMountains)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
728	Redon (Intelligence).jpg	Redon (Intelligence)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
729	Redoute(Untitled).jpg	Redoute(Untitled)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
730	Rembrandt (Circumcision).jpg	Rembrandt (Circumcision)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
731	Renner (Chicago).jpg	Renner (Chicago)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
732	Renner(OrangeCloud).jpg	Renner(OrangeCloud)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
733	Renner (Raincloud).jpg	Renner (Raincloud)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
734	Renner(Transplant).jpg	Renner(Transplant)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
735	Renoir (Ambroise).jpg	Renoir (Ambroise)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
736	Reyes (Cha Cha Cha).jpg	Reyes (Cha Cha Cha)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
737	Reyes (Eastern Sierras BW).jpg	Reyes (Eastern Sierras BW)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
738	Reyes (Eastern Sierras Color).jpg	Reyes (Eastern Sierras Color)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
739	Reyes (Female Study III).jpg	Reyes (Female Study III)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
740	Reyes (Sorrento).jpg	Reyes (Sorrento)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
741	Rezvani(Composition).jpg	Rezvani(Composition)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
742	Ricci (Snake).jpg	Ricci (Snake)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
743	Rice(Change).jpg	Rice(Change)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
744	Rice (Six Squares).jpg	Rice (Six Squares)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
745	Richards(QuartedNo3).jpg	Richards(QuartedNo3)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
746	Richier (Standing Figure).jpg	Richier (Standing Figure)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
747	Righi(ClownFlute).jpg	Righi(ClownFlute)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
748	Rinehart (Untitled).jpg	Rinehart (Untitled)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
749	Ringgold(Joe).jpg	Ringgold(Joe)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
750	Rivera (Untitled).jpg	Rivera (Untitled)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
751	R Mangold Square.JPG	R Mangold Square_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
752	R Mangold Untitled.JPG	R Mangold Untitled_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
753	Robbins(Home).jpg	Robbins(Home)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
754	Robinson (Mr Charles).jpg	Robinson (Mr Charles)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
755	Rocker(CelloPlayer).jpg	Rocker(CelloPlayer)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
756	Rodriguez(LoHizo).JPG	Rodriguez(LoHizo)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
757	Rodriguez (Loteria).jpg	Rodriguez (Loteria)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
758	Rodriguez (Rey).jpg	Rodriguez (Rey)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
759	Rodriguez (Sinfonia).jpg	Rodriguez (Sinfonia)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
760	Rolling (The Shepherd).jpg	Rolling (The Shepherd)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
761	Roovers(Dutch).jpg	Roovers(Dutch)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
762	Rosa (Democritus).jpg	Rosa (Democritus)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
763	Rosa (Jason and the Dragon).jpg	Rosa (Jason and the Dragon)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
764	Ross(Farm).jpg	Ross(Farm)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
765	Rothenstein (Cockerel).jpg	Rothenstein (Cockerel)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
766	Rothenstein(Inset).jpg	Rothenstein(Inset)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
767	Rouault(Christ).jpg	Rouault(Christ)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
768	rouault (la mort).jpg	rouault (la mort)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
769	Roudebush (Lake Merritt).jpg	Roudebush (Lake Merritt)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
770	rowlandson (rivals).jpg	rowlandson (rivals)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
771	Runacher(Aveyron).jpg	Runacher(Aveyron)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
772	Runacher(Paris Watersong).jpg	Runacher(Paris Watersong)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
773	Rutherford (Iowa).jpg	Rutherford (Iowa)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
774	Ryan(Untitled).jpg	Ryan(Untitled)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
775	Saff (Plate I).jpg	Saff (Plate I)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
776	Saito (Nara).jpg	Saito (Nara)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
777	Saito(Ryoan-ji, Kyoto).jpg	Saito(Ryoan-ji, Kyoto)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
778	Saito (Toriemoto).jpg	Saito (Toriemoto)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
779	Salemme A (One).jpg	Salemme A (One)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
780	Sanchez (El Espiritu).jpg	Sanchez (El Espiritu)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
781	SanchezEmilio(Bellezas).jpg	SanchezEmilio(Bellezas)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
782	Santamaria(Bajo).jpg	Santamaria(Bajo)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
783	Santamaria(Culebra).jpg	Santamaria(Culebra)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
784	Santamaria(Encerrado).jpg	Santamaria(Encerrado)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
785	Santamaria(Mascara).jpg	Santamaria(Mascara)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
786	Santamaria(Quetzalcoatl).jpg	Santamaria(Quetzalcoatl)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
787	Sariano(Monsieur).jpg	Sariano(Monsieur)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
788	Sariano(XRated).jpg	Sariano(XRated)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
789	Sato(Crosssection).jpg	Sato(Crosssection)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
790	(Sato)Fog.jpg	(Sato)Fog_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
791	Sato (Mask).jpg	Sato (Mask)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
792	Sawada(Skyscape).jpg	Sawada(Skyscape)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
793	scarpa (untitled).jpg	scarpa (untitled)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
794	Schapiro(Untitled).jpg	Schapiro(Untitled)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
795	Schlemmer (Figure H2).jpg	Schlemmer (Figure H2)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
796	Schmidt(MarineFlora).jpg	Schmidt(MarineFlora)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
797	Schmidt Rottluff (Man Reading).jpg	Schmidt Rottluff (Man Reading)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
798	Schorr(ABouquet).jpg	Schorr(ABouquet)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
799	Schuster(Boisson).jpg	Schuster(Boisson)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
800	Schwarz(DieSitzung).jpg	Schwarz(DieSitzung)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
801	Schwarz (Injection).jpg	Schwarz (Injection)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
802	Schwitters(AbstractXII).jpg	Schwitters(AbstractXII)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
803	Scott (Dimension).jpg	Scott (Dimension)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
804	Scwarz(DasDirndl).jpg	Scwarz(DasDirndl)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
805	Segal (Untitled).jpg	Segal (Untitled)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
806	Sekino(Gaka).jpg	Sekino(Gaka)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
807	Severini (Dancer).jpg	Severini (Dancer)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
808	Severini (Still Life).jpg	Severini (Still Life)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
809	Shahn (Lute).jpg	Shahn (Lute)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
810	Shahn (Mine).jpg	Shahn (Mine)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
811	Shahn (Phoenix).jpg	Shahn (Phoenix)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
812	Shapiro(TwoLovers).jpg	Shapiro(TwoLovers)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
813	Silverman(Umbria).jpg	Silverman(Umbria)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
814	Simbari(Marina).jpg	Simbari(Marina)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
815	Singer(PortraitD).jpg	Singer(PortraitD)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
816	Siqueiros (Guardian).jpg	Siqueiros (Guardian)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
817	Skippe (Figure).jpg	Skippe (Figure)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
818	Skippe (Saint).jpg	Skippe (Saint)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
819	Skorczewski(Tower).jpg	Skorczewski(Tower)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
820	Skorczewski(Warehouse).jpg	Skorczewski(Warehouse)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
821	S Mangold 6 inches 4 ways (2).JPG	S Mangold 6 inches 4 ways (2)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
822	Smiechowska(Nu).jpg	Smiechowska(Nu)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
823	Smith(Gray).jpg	Smith(Gray)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
824	SmithMaren(TygerTyger).jpg	SmithMaren(TygerTyger)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
825	SmithMoishe(Rapallo).jpg	SmithMoishe(Rapallo)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
826	Smith(Orange).jpg	Smith(Orange)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
827	Snow (Ampere Maxwell).jpg	Snow (Ampere Maxwell)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
828	Soulages (Gold and Black).jpg	Soulages (Gold and Black)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
829	Soulages (Red).jpg	Soulages (Red)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
830	SouthAfricanArtist(Protest).JPG	SouthAfricanArtist(Protest)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
831	SouthAfrican(Rhino).jpg	SouthAfrican(Rhino)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
832	Soyer(Lipstick).jpg	Soyer(Lipstick)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
833	Soyer(MotherChild).jpg	Soyer(MotherChild)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
834	Spahr(712).JPG	Spahr(712)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
835	Spahr(Accident).jpg	Spahr(Accident)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
836	Spahr(Aeneid(412)).jpg	Spahr(Aeneid(412))_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
837	Spohn(SanFranciscoHouse).jpg	Spohn(SanFranciscoHouse)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
838	Springer (Rocks).jpg	Springer (Rocks)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
839	Springer(Untitled).jpg	Springer(Untitled)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
840	Spruance (Black Friday).jpg	Spruance (Black Friday)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
841	Spruance(MobyDick).jpg	Spruance(MobyDick)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
842	staack (window).jpg	staack (window)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
843	stack (guitar player).jpg	stack (guitar player)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
844	Stanley(Italiano).jpg	Stanley(Italiano)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
845	Stark(Feet).jpg	Stark(Feet)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
846	Stark(Trash).jpg	Stark(Trash)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
847	Stark(Wallpaper).jpg	Stark(Wallpaper)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
848	stasack (two figures).jpg	stasack (two figures)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
849	stasik (orchard).jpg	stasik (orchard)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
850	stasik (untitled).jpg	stasik (untitled)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
851	stern (bridge).jpg	stern (bridge)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
852	stevens (stonehenge).jpg	stevens (stonehenge)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
853	stocker (untitled).jpg	stocker (untitled)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
854	Stokol(visitorcenter).jpg	Stokol(visitorcenter)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
855	Stone (Turkish Toy II).jpg	Stone (Turkish Toy II)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
856	Stout Untitled.JPG	Stout Untitled_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
857	Sugimoto (Pine trees and sun).jpg	Sugimoto (Pine trees and sun)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
858	Summers (basholi).jpg	Summers (basholi)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
859	Summers (Bundi).jpg	Summers (Bundi)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
860	Summers(Chamba).jpg	Summers(Chamba)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
861	Summers(Kulu).jpg	Summers(Kulu)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
862	Summers(Malwa).jpg	Summers(Malwa)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
863	Summers(Mankot).jpg	Summers(Mankot)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
864	Summers(Nurpur).jpg	Summers(Nurpur)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
865	Summers(PuertaDelSol).jpg	Summers(PuertaDelSol)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
866	Sun(Dark).jpg	Sun(Dark)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
867	Sutherland(Fountain).jpg	Sutherland(Fountain)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
868	Sutherland (Insect).jpg	Sutherland (Insect)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
869	Sutton (Crimsom Nude).jpg	Sutton (Crimsom Nude)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
870	Swanson(CircusBicyclist).jpg	Swanson(CircusBicyclist)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
871	Swanson J (Acrobats).jpg	Swanson J (Acrobats)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
872	Swanson J (Circus Horses).jpg	Swanson J (Circus Horses)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
873	Swanson J (Conductor).jpg	Swanson J (Conductor)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
874	Swanson J (Holiday).jpg	Swanson J (Holiday)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
875	Swanson J (Lets Work Together).jpg	Swanson J (Lets Work Together)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
876	Swanson J (Star Clown).jpg	Swanson J (Star Clown)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
877	Swanson(RainyDay).jpg	Swanson(RainyDay)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
878	Swanson R (Fairies).jpg	Swanson R (Fairies)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
879	Swanson R (Snakes).jpg	Swanson R (Snakes)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
880	Sykes(CathedralInterior).jpg	Sykes(CathedralInterior)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
881	Tachibana(Conversation).jpg	Tachibana(Conversation)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
882	Tachibana(Fern).jpg	Tachibana(Fern)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
883	Tajiri (Figure).jpg	Tajiri (Figure)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
884	Takahashi(NostalgiaKyoto).jpg	Takahashi(NostalgiaKyoto)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
885	Takal (Autumn Field).jpg	Takal (Autumn Field)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
886	Takar(Back).jpg	Takar(Back)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
887	Takis (Telelumiere).jpg	Takis (Telelumiere)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
888	TalCoat(Proche).jpg	TalCoat(Proche)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
889	Tamayo (Man and Woman).jpg	Tamayo (Man and Woman)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
890	Tapies(EmprienteDePied).jpg	Tapies(EmprienteDePied)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
891	Tapies(Untitled).jpg	Tapies(Untitled)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
892	Taplitz (Aqueous).jpg	Taplitz (Aqueous)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
893	Taplitz(HeresGoodFriends).jpg	Taplitz(HeresGoodFriends)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
894	Taplitz(Lily).jpg	Taplitz(Lily)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
895	Tarpey(Bazaar).jpg	Tarpey(Bazaar)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
896	Tarpey (edo crane).jpg	Tarpey (edo crane)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
897	Tarrago (Senora).jpg	Tarrago (Senora)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
898	Terzian(LandscapeWithVillage).jpg	Terzian(LandscapeWithVillage)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
899	tharrats (composition).jpg	tharrats (composition)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
900	Thornton (Canterbury).jpg	Thornton (Canterbury)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
901	tisari (le revelateur).jpg	tisari (le revelateur)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
902	todo (tractor).jpg	todo (tractor)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
903	Tookoome(Umingmak).jpg	Tookoome(Umingmak)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
904	toulmouche (the serious book).jpg	toulmouche (the serious book)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
905	Toulouse Lautrec (Carnaval).jpg	Toulouse Lautrec (Carnaval)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
906	Trevelyan(Rain).jpg	Trevelyan(Rain)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
907	trevelyan (wellington clock tower).jpg	trevelyan (wellington clock tower)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
908	trier (growth).jpg	trier (growth)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
909	Trujillo(Wolf).JPG	Trujillo(Wolf)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
910	tschumi (cat).jpg	tschumi (cat)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
911	Tsukioka(Ikari).jpg	Tsukioka(Ikari)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
912	Tsukioka (Kan yokyu).jpg	Tsukioka (Kan yokyu)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
913	ubac (composition2).jpg	ubac (composition2)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
914	ubac (composition).jpg	ubac (composition)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
915	Ubac (Gravure).jpg	Ubac (Gravure)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
916	Uchima(Between).jpg	Uchima(Between)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
917	Uchima (Rain).jpg	Uchima (Rain)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
918	Umetaro(Mountaineer).jpg	Umetaro(Mountaineer)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
919	Unknown (Apollo).jpg	Unknown (Apollo)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
920	Unknown(Arabic).jpg	Unknown(Arabic)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
921	Unknown (Arch 1).jpg	Unknown (Arch 1)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
922	Unknown(Indic).jpg	Unknown(Indic)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
923	Unknown (Man with Plate).jpg	Unknown (Man with Plate)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
924	Unknown (Niche).jpg	Unknown (Niche)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
925	unknown(NIW1).jpg	unknown(NIW1)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
926	Unknown(NIW2).jpg	Unknown(NIW2)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
927	Unknown (Orange).jpg	Unknown (Orange)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
928	Unknown(Printing).jpg	Unknown(Printing)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
929	Unknown (Prometheus).jpg	Unknown (Prometheus)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
930	Unknown(Shalihotra).jpg	Unknown(Shalihotra)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
931	Unknown (Shinto Temple).jpg	Unknown (Shinto Temple)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
932	Unknown(TINposter).jpg	Unknown(TINposter)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
933	Unknown (Train Interior).jpg	Unknown (Train Interior)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
934	Unknown (Untitled, Bowl).jpg	Unknown (Untitled, Bowl)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
935	Unknown (Untitled, Cityscape).jpg	Unknown (Untitled, Cityscape)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
936	Unknown (Untitled, Comp in Green and Black).jpg	Unknown (Untitled, Comp in Green and Black)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
937	Unknown (Untitled, Female).jpg	Unknown (Untitled, Female)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
938	Unknown (Untitled, Forest).jpg	Unknown (Untitled, Forest)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
939	Unknown (Untitled, Fruits).jpg	Unknown (Untitled, Fruits)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
940	Unknown (Untitled, Getting Ready).jpg	Unknown (Untitled, Getting Ready)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
941	Unknown (Untitled, Girl).jpg	Unknown (Untitled, Girl)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
942	Unknown (Untitled, Office).jpg	Unknown (Untitled, Office)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
943	Unknown (Untitled, Portrait).jpg	Unknown (Untitled, Portrait)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
944	Unknown (Untitled, Twenty Dollar Coin).jpg	Unknown (Untitled, Twenty Dollar Coin)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
945	Unknown (Untitled, Two Faces).jpg	Unknown (Untitled, Two Faces)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
946	Unknown (Untitled, Weeping Man).jpg	Unknown (Untitled, Weeping Man)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
947	Unknown (Untitled, Window).jpg	Unknown (Untitled, Window)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
948	Usami(Untitled).jpg	Usami(Untitled)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
949	Usher (Sea Change).jpg	Usher (Sea Change)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
950	Utagawa (Untitled).jpg	Utagawa (Untitled)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
951	Utrillo (Rue).jpg	Utrillo (Rue)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
952	Vaccaro(ComingToRest).jpg	Vaccaro(ComingToRest)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
953	VanDongen(Femme).jpg	VanDongen(Femme)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
954	Van Dyck (Ecce Homo).jpg	Van Dyck (Ecce Homo)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
955	VanHoesen(Gull).jpg	VanHoesen(Gull)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
956	VanHoesen(RaccoonStraits).JPG	VanHoesen(RaccoonStraits)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
957	Vasarely(Betelgeuse).jpg	Vasarely(Betelgeuse)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
958	Vasarely(LondonArtsPoster).jpg	Vasarely(LondonArtsPoster)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
959	Vasarely(LookAtPoster).jpg	Vasarely(LookAtPoster)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
960	Vasarely(Vega).jpg	Vasarely(Vega)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
961	Veber(Untitled).jpg	Veber(Untitled)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
962	Velde(Castle).jpg	Velde(Castle)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
963	Velde(Church).jpg	Velde(Church)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
964	Velde(Tower).jpg	Velde(Tower)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
965	Velde(TwoMen).jpg	Velde(TwoMen)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
966	viera da silva (composition).jpg	viera da silva (composition)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
967	Viera da Silva (Ville Espagnole).jpg	Viera da Silva (Ville Espagnole)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
968	Viggiano(Cat).jpg	Viggiano(Cat)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
969	Viggiano(Girl2).jpg	Viggiano(Girl2)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
970	Viggiano(Girl) .jpg	Viggiano(Girl) _360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
971	Viggiano(Kids).jpg	Viggiano(Kids)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
972	Viggiano(Man).jpg	Viggiano(Man)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
973	Viggiano(Truck).jpg	Viggiano(Truck)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
974	Vilchis(Unicornio).jpg	Vilchis(Unicornio)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
975	Villon (Cheval).jpg	Villon (Cheval)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
976	Villon(Composition).JPG	Villon(Composition)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
977	Villon (Woman with Pitcher).jpg	Villon (Woman with Pitcher)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
978	Vines(Soulfood).jpg	Vines(Soulfood)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
979	Vlaminck (Valley of the Avre River).jpg	Vlaminck (Valley of the Avre River)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
980	Vlaminick(IllustrationXVIII).jpg	Vlaminick(IllustrationXVIII)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
981	Voulkos(Ironhead).jpg	Voulkos(Ironhead)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
982	Vuillard(LeRepas).jpg	Vuillard(LeRepas)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
983	Vuillard(Place).jpg	Vuillard(Place)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
984	Vujaklja(Composition).jpg	Vujaklja(Composition)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
985	Walker (Blue Fir).jpg	Walker (Blue Fir)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
986	Walker(MorningFog).jpg	Walker(MorningFog)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
987	Wang(Bee with Flowering Plant).jpg	Wang(Bee with Flowering Plant)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
988	Wang(Dragonfly with plants).jpg	Wang(Dragonfly with plants)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
989	Wang (Rock with Butterfly).jpg	Wang (Rock with Butterfly)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
990	Wang(Rock with sparrows).jpg	Wang(Rock with sparrows)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
991	Warner(ChicagoPyramid).jpg	Warner(ChicagoPyramid)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
992	Warren (Monstera).jpg	Warren (Monstera)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
993	Watanabe(JerichosCastle).jpg	Watanabe(JerichosCastle)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
994	Watanabe (Jonah).jpg	Watanabe (Jonah)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
995	Watson(IgorStravinsky).jpg	Watson(IgorStravinsky)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
996	Weber (Cubed Reflection III).jpg	Weber (Cubed Reflection III)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
997	Weber (Facet I).jpg	Weber (Facet I)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
998	Weber(InteriorI).jpg	Weber(InteriorI)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
999	Weems(Untitled).jpg	Weems(Untitled)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1000	Weiers(Toad).jpg	Weiers(Toad)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1001	Weil(MemberQumran).jpg	Weil(MemberQumran)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1002	Weir (The Evening Lamp).jpg	Weir (The Evening Lamp)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1003	Weisberg (A Knight of Ghostes).jpg	Weisberg (A Knight of Ghostes)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1004	Weisberg (Lordlie Loftes).jpg	Weisberg (Lordlie Loftes)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1005	Weisberg(MakeMusicke).jpg	Weisberg(MakeMusicke)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1006	Weisberg (Queen of Love).jpg	Weisberg (Queen of Love)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1007	Weisberg(Reflections).jpg	Weisberg(Reflections)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1008	Weisbuch (Untitled).jpg	Weisbuch (Untitled)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1009	Wernick(Untitled1300).jpg	Wernick(Untitled1300)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1010	Wernick(Untitled).jpg	Wernick(Untitled)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1011	Wesselmann Shiny Nude.JPG	Wesselmann Shiny Nude_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1012	Wessels(SicilianHilltop).jpg	Wessels(SicilianHilltop)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1013	Wessels (Sicilian Village).jpg	Wessels (Sicilian Village)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1014	Westerman(Oaks).jpg	Westerman(Oaks)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1015	Whistler (Draped Figure).jpg	Whistler (Draped Figure)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1016	Whistler (Red Dress).jpg	Whistler (Red Dress)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1017	Winkler(Boats).jpg	Winkler(Boats)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1018	Winkler(Clay).jpg	Winkler(Clay)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1019	Winkler (Delicatessen).jpg	Winkler (Delicatessen)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1020	Winkler (Dusk at Fisherman's Warf).jpg	Winkler (Dusk at Fisherman's Warf)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1021	Winkler(Haunted).jpg	Winkler(Haunted)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1022	Winkler(NoonRestA).JPG	Winkler(NoonRestA)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1023	Winkler (Pasture).jpg	Winkler (Pasture)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1024	Winkler(Rebuilding).jpg	Winkler(Rebuilding)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1025	Winkler(Ritter).jpg	Winkler(Ritter)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1026	Winkler(Sequoia).JPG	Winkler(Sequoia)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1027	Winkler (St Pauls).jpg	Winkler (St Pauls)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1028	Winkler(Telegraph).jpg	Winkler(Telegraph)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1029	Winter(Abstraction).jpg	Winter(Abstraction)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1030	Winter(CompositionBlack).jpg	Winter(CompositionBlack)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1031	Winter(Composition).jpg	Winter(Composition)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1032	Wise(CarpPond).jpg	Wise(CarpPond)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1033	Wise Judy (Poppies).jpg	Wise Judy (Poppies)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1034	Wise(LoversPoem).jpg	Wise(LoversPoem)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1035	Wong(Pandora).jpg	Wong(Pandora)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1036	Wood (Planes in Space).jpg	Wood (Planes in Space)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1037	Wright(Arachnid).jpg	Wright(Arachnid)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1075	fein-large.jpg	fein-large_360px.jpg	2024-07-24 19:26:32.627562	2024-07-24 19:26:32.627562
1038	Wujcik(JamesRosenquist).jpg	Wujcik(JamesRosenquist)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1039	Wunderlich(Sphinx).jpg	Wunderlich(Sphinx)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1040	Yamaguchi(Hotaka).jpg	Yamaguchi(Hotaka)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1041	Yoon(Face).jpg	Yoon(Face)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1042	Yoon(Sleep).jpg	Yoon(Sleep)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1043	Yoshida(SpaceNo27).jpg	Yoshida(SpaceNo27)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1044	Yoshihara(Flower).jpg	Yoshihara(Flower)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1045	Yoshihara(TornRose).jpg	Yoshihara(TornRose)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1046	Yoshihara(WomanSky).jpg	Yoshihara(WomanSky)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1047	Youkeles(Small World).jpg	Youkeles(Small World)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1048	Young(SheepHerder).jpg	Young(SheepHerder)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1049	Young(SpringFortLee).jpg	Young(SpringFortLee)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1050	Zadkine(FetePaysanne).jpg	Zadkine(FetePaysanne)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1051	Zao (Composition Blue Red).jpg	Zao (Composition Blue Red)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1052	Zao(Tree).jpg	Zao(Tree)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1053	Ziemann (Nearing the Woods).jpg	Ziemann (Nearing the Woods)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1054	Zorn(GuitarPlayer).jpg	Zorn(GuitarPlayer)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1055	Zox(Untitled).jpg	Zox(Untitled)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1056	Zucker Relocation (2).JPG	Zucker Relocation (2)_360px.jpg	2023-03-14 16:58:50.969487	2023-03-14 16:58:50.969487
1057	Singier (Untitled).jpg	Singier (Untitled)_360px.jpg	2023-05-31 20:19:57.517621	2023-05-31 20:19:57.517621
1058	Twain-autobiographyvolume3.jpg	Twain-autobiographyvolume3_360px.jpg	2023-06-12 18:09:12.39982	2023-06-12 18:09:12.39982
1059	Adams(Golden).jpg	Adams(Golden)_360px.jpg	2023-07-27 20:16:23.038218	2023-07-27 20:16:23.038218
1060	Corita(digging).jpg	Corita(digging)_360px.jpg	2023-07-27 20:19:40.84815	2023-07-27 20:19:40.84815
1061	Corita(ynot).jpg	Corita(ynot)_360px.jpg	2023-07-27 20:22:45.9318	2023-07-27 20:22:45.9318
1062	Lucey(Tulips).jpg	Lucey(Tulips)_360px.jpg	2023-07-27 20:33:37.013164	2023-07-27 20:33:37.013164
1063	Oni-Eseleh(Cloistered).jpg	Oni-Eseleh(Cloistered)_360px.jpg	2023-07-27 20:38:13.808998	2023-07-27 20:38:13.808998
1064	Unknown(Sale2021).jpg	Unknown(Sale2021)_360px.jpg	2023-07-27 20:42:52.647621	2023-07-27 20:42:52.647621
1065	Adams(Golden)-1.jpg	Adams(Golden)-1_360px.jpg	2023-07-27 20:45:31.81813	2023-07-27 20:45:31.81813
1066	Lautze(Ripple).jpg	Lautze(Ripple)_360px.jpg	2023-07-27 20:57:37.21429	2023-07-27 20:57:37.21429
1067	Burrell(Balance).jpg	Burrell(Balance)_360px.jpg	2023-07-27 21:01:20.66801	2023-07-27 21:01:20.66801
1068	Burrell(Balance)-1.jpg	Burrell(Balance)-1_360px.jpg	2023-07-31 18:26:39.018127	2023-07-31 18:26:39.018127
1069	Lautze(Ripple)-1.jpg	Lautze(Ripple)-1_360px.jpg	2023-07-31 18:28:38.192283	2023-07-31 18:28:38.192283
1070	Vasquez(Cuarto3).jpg	Vasquez(Cuarto3)_360px.jpg	2023-08-02 23:30:07.382268	2023-08-02 23:30:07.382268
1071	Vasquez(Cuarto4).jpg	Vasquez(Cuarto4)_360px.jpg	2023-08-02 23:31:52.229707	2023-08-02 23:31:52.229707
1072	Burgess(Herb).jpg	Burgess(Herb)_360px.jpg	2023-08-08 21:22:32.246374	2023-08-08 21:22:32.246374
1073	Anuszkiewicz(May).jpg	Anuszkiewicz(May)_360px.jpg	2023-08-21 19:02:26.566333	2023-08-21 19:02:26.566333
1074	Yoshihara(Woman).jpg	Yoshihara(Woman)_360px.jpg	2023-09-13 22:43:51.158345	2023-09-13 22:43:51.158345
1076	Weber(Cubed).jpg	Weber(Cubed)_360px.jpg	2024-07-24 19:48:43.989088	2024-07-24 19:48:43.989088
1077	Bolotowsky(Plate6).jpg	Bolotowsky(Plate6)_360px.jpg	2024-07-24 20:10:32.028606	2024-07-24 20:10:32.028606
1078	Ingram(Untitled).jpg	Ingram(Untitled)_360px.jpg	2024-07-24 22:44:08.763782	2024-07-24 22:44:08.763782
1079	Ingram(Untitled)-1.jpg	Ingram(Untitled)-1_360px.jpg	2024-07-24 22:46:53.704307	2024-07-24 22:46:53.704307
1080	Ballif(ESpace).jpg	Ballif(ESpace)_360px.jpg	2024-07-30 19:09:28.058727	2024-07-30 19:09:28.058727
1081	Ballif(Sezambre).jpg	Ballif(Sezambre)_360px.jpg	2024-07-30 19:13:22.384428	2024-07-30 19:13:22.384428
1082	Lam(Untitled).jpg	Lam(Untitled)_360px.jpg	2024-08-07 20:21:26.459742	2024-08-07 20:21:26.459742
1083	Jang(Birthright).jpg	Jang(Birthright)_360px.jpg	2024-08-07 20:25:37.663884	2024-08-07 20:25:37.663884
1084	Airo(Green).jpg	Airo(Green)_360px.jpg	2024-08-07 20:29:05.940036	2024-08-07 20:29:05.940036
1085	Stroech(Making).jpg	Stroech(Making)_360px.jpg	2024-08-07 20:32:25.165968	2024-08-07 20:32:25.165968
1086	Harris(Untitled).jpg	Harris(Untitled)_360px.jpg	2024-08-07 20:43:49.972694	2024-08-07 20:43:49.972694
1087	Griffin(Untitled).jpg	Griffin(Untitled)_360px.jpg	2024-08-07 20:46:12.490348	2024-08-07 20:46:12.490348
1088	Lam(Untitled)-1.jpg	Lam(Untitled)-1_360px.jpg	2024-08-07 20:52:10.61047	2024-08-07 20:52:10.61047
1089	Jang(Birthright)-1.jpg	Jang(Birthright)-1_360px.jpg	2024-08-07 20:53:09.30157	2024-08-07 20:53:09.30157
1090	Santos(Rainbow).jpg	Santos(Rainbow)_360px.jpg	2024-08-07 20:58:43.711062	2024-08-07 20:58:43.711062
1091	Santos(Urgent).jpg	Santos(Urgent)_360px.jpg	2024-08-07 20:59:55.205895	2024-08-07 20:59:55.205895
1092	LeeJohnson(boy).jpg	LeeJohnson(boy)_360px.jpg	2024-08-14 19:33:47.019253	2024-08-14 19:33:47.019253
1093	Demauro(Bird)-1.jpg	Demauro(Bird)-1_360px.jpg	2024-08-14 19:40:10.327762	2024-08-14 19:40:10.327762
1095	Collins(Parks).jpg	Collins(Parks)_360px.jpg	2024-08-14 19:47:27.039568	2024-08-14 19:47:27.039568
1096	Grabow(EXPNDS).jpg	Grabow(EXPNDS)_360px.jpg	2024-08-14 19:58:25.467435	2024-08-14 19:58:25.467435
1097	Le Yaouanc(Deviation).jpg	Le Yaouanc(Deviation)_360px.jpg	2024-09-04 19:39:58.742215	2024-09-04 19:39:58.742215
1098	Maglione(Rainbow).jpg	Maglione(Rainbow)_360px.jpg	2024-09-04 20:02:54.057754	2024-09-04 20:02:54.057754
1099	Maglione(Rainbow)-1.jpg	Maglione(Rainbow)-1_360px.jpg	2024-09-04 20:10:32.550768	2024-09-04 20:10:32.550768
1100	Trier(Growth).jpg	Trier(Growth)_360px.jpg	2024-09-04 22:05:36.020028	2024-09-04 22:05:36.020028
1102	SouthAfricanArtist (Protest).jpg	SouthAfricanArtist (Protest)_360px.jpg	2024-09-05 20:35:24.954173	2024-09-05 20:35:24.954173
\.


--
-- TOC entry 3409 (class 0 OID 16737)
-- Dependencies: 222
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: galc-api-production
--

COPY public.items (id, title, artist, artist_url, date, description, dimensions, series, mms_id, barcode, circulation, location, value, appraisal_date, notes, reserve_date, created_at, updated_at, suppressed, image_id) FROM stdin;
1078	Marjerie Glacier	Orvik, Kari	https://www.kariorvik.com/	2020	Wet plate collodion and acrylic.	12 x 15"	\N	991054191109706532	C104988207	\N	\N	\N	\N	Purchased from the Art KALA 2020 Auction.	\N	2022-07-28 23:59:21.060879	2023-05-31 20:17:07.923596	f	675
1149	Untitled	Singier, Gustave	https://en.wikipedia.org/wiki/Gustave_Singier	1966	Signed and dated. Printed for an exhibition at the Galerie de France, Paris.	17 x 22"	"40/200"	991085989627506532	C103792143	\N	\N	\N	\N	\N	\N	2023-05-31 20:22:31.165173	2023-05-31 20:24:17.952878	f	1057
8	The Barge of Ichneumon	Akawie, Thomas	http://www.artnet.com/artists/thomas-akawie/biography	1980	Signed and numbered.	37.5 x 29"	"70/100"	991051110899706532	C103791389	\N	\N	500	2006	\N	2019-08-27	2022-07-28 23:59:21.060879	2023-09-05 14:40:07.900891	f	11
392	Standing Figure	Richier, Germaine	\N	1950	Signed and numbered.	23.5 x 33.5"	"5/75"	991051285239706532	C104974148	\N	\N	400	2006	Provenance: Otto Stangl.	\N	2022-07-28 23:59:21.060879	2023-09-20 19:42:42.487108	f	746
135	A Cycle of a Small Sea: Under	Deshaies, Arthur	http://americanart.si.edu/collections/search/artist/?id=1228	1959	Lucite engraving on paper. Signed and numbered. Severe foxing all over.	28 x 32"	"6/50"	991051123279706532	c093336530	\N	\N	175	2006	\N	2020-01-10	2022-07-28 23:59:21.060879	2024-05-17 21:48:21.298058	f	240
1151	Golden Gate From Baker Beach	Adams, Ansel	https://en.wikipedia.org/wiki/Ansel_Adams	1953	From "The Golden Gate Series Set." Digitally mastered print from Ansel's original photograph.	19.5 x 17"	\N	991086086280706532	C103792958	\N	\N	\N	\N	\N	\N	2023-07-27 20:16:31.979972	2023-07-31 18:33:19.263966	f	1065
3	Solitaire	Abeles, Sigmund	http://www.sigmundabeles.net/	1978	Published by Lakeside Studio, printed by Paul Maguire, Inc., Boston.	15 x 18"	"3/30"	991051110599706532	c093330697	\N	\N	200	2006	\N	2019-09-18	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	2
4	Two Figures	Abeles, Sigmund	http://www.sigmundabeles.net/	\N	Signed and numbered.	24.25 x 31.5"	"5/25"	991051110779706532	c093330819	\N	\N	300	2006	\N	2020-10-02	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	3
2	Weekend Visitors	Abeles, Sigmund	http://www.sigmundabeles.net/	1977	Published by Lakeside Studio, printed by Paul Maguire, Inc., Boston.	19.5 x 27.5"	"47/50"	991051110739706532	C103787248	\N	\N	400	2006	\N	2019-08-31	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	4
6	St. Mary's - Evening	Ackroyd, Norman	https://en.wikipedia.org/wiki/Norman_Ackroyd	1962	Signed, dated and annotated 'St. Mary's - Germany.'	33 x 28.5"	"34/75"	991051110829706532	c093330828	\N	\N	400	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	5
7	Veil System	Aitken, Pauline	http://www.paulineaitken.com/	1969	Signed and numbered.	34.5 x 29.25"	"61/75"	991051110859706532	c093330837	\N	\N	350	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	10
1019	Joy	Albers, Josef	https://en.wikipedia.org/wiki/Josef_Albers	1962	From "Homage to the Square: Ten Works by Josef Albers." Published by Ives-Sillman.	17 x 17"	"184/250"	991043365389706532	C104947588	\N	\N	500	\N	Gift of Ellen Meltzer and Jane Fowler in memory of Marilyn and Phillip Meltzer.	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	12
10	Yellow Rectangle	Alps, Glen	https://en.wikipedia.org/wiki/Glen_Alps	1960	Signed and titled.	31 x 30"	Artist's Proof	991051110929706532	c093330961	\N	Graduate Services Dissertation Room	400	2006	\N	2019-09-17	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	16
12	Park Figure (Untitled Suite XI)	Altman, Harold	\N	1961	Signed and numbered. Printed by Emiliano Sorini. Published by Tamarind Lithography Workshop.	27.5 x 34.5"	"47/50"	991051112389706532	c093335925	\N	\N	450	2006	\N	2018-10-12	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	17
11	Plate II	Alt, Otmar	https://de.wikipedia.org/wiki/Otmar_Alt	1974	Signed and numbered.	24.5 x 32"	"35/50"	991051110959706532	C093330970	\N	\N	400	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	18
13	Untitled (Bon a tirer)	Abularach, Rodolfo	https://en.wikipedia.org/wiki/Rodolfo_Abularach	1966	Artist's proof. Signed and annotated "Bon a tirer."	24 x 39"	\N	991051112429706532	C093335934	\N	Hanging by Circulation Desk in Morrison	200	2006	\N	\N	2022-07-28 23:59:21.060879	2022-09-08 18:27:41.037372	t	19
697	Sonate Rouge	Alvar (Sunol Munoz-Ramos)	https://en.wikipedia.org/wiki/Alvar_Su%C3%B1ol	1974	Signed and numbered.	44 x 35"	"46/225"	\N	C103510736	NON-CIRC	Hanging across from Circulation Desk in Morrison	2500	\N	b18360066	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	21
17	The Castle Gate	Amano, Kunihiro	http://portlandartmuseum.us/mwebcgi/mweb.exe?request=record;id=8275;type=701	1966	Signed.	30.75 x 23.5"	"135/210"	991051112549706532	c093335961	\N	\N	350	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	22
16	Self Figure (in white)	Amano, Kazumi	http://www.britishmuseum.org/research/search_the_collection_database/term_details.aspx?bioId=149271	1965	Slight foxing; crease in upper left of image.	29 x 24"	"9/30"	991051112509706532	c093335952	\N	\N	250	2006	\N	2020-03-06	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	25
19	Self-Portrait	Anderson, Carol Whipple	\N	\N	Signed and numbered; inscribed 'Self Portrait - Woodcut.'	22.5 x 25"	"10/74"	991053836249706532	c067068537	\N	\N	100	2006	\N	2020-02-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	26
38	Composition	Ballif, Yannick	\N	1974	\N	35 x 28"	"51/60"	991051112729706532	c093335873	\N	\N	150	2006	\N	2019-09-16	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	59
1152	d is for digging it	Corita	https://en.wikipedia.org/wiki/Corita_Kent	1968	From the series "International Signal Code Alphabet."	23 x 28.5”	\N	991079824199706532	C103792523	\N	\N	\N	\N	\N	\N	2023-07-27 20:19:44.494646	2023-07-31 18:35:34.865333	f	1060
1160	cuarto 4/4	Vazquez, Sharon Carlos	\N	2022	Silkscreen with watercolor on paper. Part of a quadriptych. 	35.5 x 28"	\N	991086086260106532	C104943005	\N	\N	\N	\N	\N	\N	2023-08-02 23:31:59.367737	2023-08-03 20:58:49.437184	f	1071
1159	cuarto 3/4	Vazquez, Sharon Carlos	\N	2022	Silkscreen with watercolor on paper. Part of a quadriptych.	35.5 x 28"	\N	991086086260206532	C104942995	\N	\N	\N	\N	\N	\N	2023-08-02 23:30:15.709585	2023-08-03 20:56:39.383737	f	1070
1161	Herbarium VII	Burgess, Michele	https://www.micheleburgessart.com/	2010	Illustration from the book "Herbarium," printed on Rives and Gampi papers. Signed and numbered by the artist.	11.75 x 9.5"	"A/P"	991086112541406532	C117621865	\N	\N	350.00	\N	\N	\N	2023-08-08 21:01:25.731399	2023-08-08 21:23:58.78638	f	1072
167	La Grande Idole	Fitreman, Gerard	\N	\N	Full margins.	29.5 x 37"	"54/90"	991051350169706532	c093329895	\N	\N	400	2006	\N	2012-08-20	2022-07-28 23:59:21.060879	2023-08-17 00:18:34.679721	f	288
919	Red-Orange over Blue (Rouge-Orange sur Bleu)	Kelly, Ellsworth	https://en.wikipedia.org/wiki/Ellsworth_Kelly	1965	From "Suite of Twenty-Seven Color Lithographs."	38.5 x 27"	"15/75"	991008719659706532	C103786068	\N	\N	8000	\N	NON-CIRC	2019-08-28	2022-07-28 23:59:21.060879	2023-05-31 20:30:27.190467	t	465
18	Nostalgia I	Amano, Kunihiro	http://portlandartmuseum.us/mwebcgi/mweb.exe?request=record;id=8275;type=701	\N	Signed and titled. Mid 20th Century	16 x 16"	\N	991051110559706532	C104947986	\N	\N	350	2006	\N	2019-09-09	2022-07-28 23:59:21.060879	2023-08-21 20:13:06.979348	f	24
804	Dimension of Interest	Scott	\N	1985	Signed and titled. Unable to read signature to identify artist's first name.	21 x 24.5"	Artist's proof	991078648009706532	C104970823	\N	\N	500	\N	\N	2019-09-09	2022-07-28 23:59:21.060879	2023-08-23 19:01:43.661143	f	803
774	Holiday in the Park	Swanson, John August	https://en.wikipedia.org/wiki/John_August_Swanson	1974	Signed, titled, and numbered.	24.5 x 25.5"	Artist's proof	991078599659706532	C104970601	\N	\N	500	\N	\N	2019-09-16	2022-07-28 23:59:21.060879	2023-08-23 19:09:38.527568	f	874
1153	y is for why not	Corita	https://en.wikipedia.org/wiki/Corita_Kent	1968	From the series "International Signal Code Alphabet." 	23 x 28.5”	\N	991079824749706532	C104933049	\N	\N	\N	\N	\N	\N	2023-07-27 20:26:34.560456	2023-07-31 18:44:36.293134	f	1061
1155	Cloistered 	Oni-Eseleh, Dawline-Jane	https://www.dawlinejaneart.com/	2022	Risograph with copper leaf.	18.75 x 12.75”	\N	991086086280406532	C103792815	\N	\N	\N	\N	\N	\N	2023-07-27 20:38:19.675394	2023-07-31 18:54:35.152172	f	1063
1156	East Bay Print Sale Poster 2021	Unknown	\N	2021	Poster advertising the 2021 East Bay Print Sale, run by Max's Garage Press.	16.5 x 22.5”	\N	991086086280206532	C103792532	\N	\N	\N	\N	\N	\N	2023-07-27 20:40:12.411603	2023-07-31 19:06:30.785681	f	1064
1162	Untitled, Watercolor	Haessle, Jean-Marie	https://en.wikipedia.org/wiki/Jean-Marie_Haessle	\N	\N	17 x 22"	\N	991086115841706532	C104943014	\N	\N	\N	\N	\N	\N	2023-08-17 22:09:26.499979	2023-08-17 22:10:55.442249	t	\N
372	Maximal Gyre V	Pomodoro, Arnaldo	https://en.wikipedia.org/wiki/Arnaldo_Pomodoro	1968	Signed and numbered. Script blindstamp "cp." Floated in mat. Badly lightstained.	31 x 38.5"	"44/80"	991051353319706532	C093330095	\N	\N	350	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2023-08-24 23:58:36.676947	f	708
1040	No Somos Inmigrantes (We Are Not Immigrants)	Barraza, Jesus	https://en.wikipedia.org/wiki/Jesus_Barraza	2018	Original photo by Diane Ovalle. Printed for Dignidad Rebelde.	21.25 x 27.25"	\N	991047233239706532	C103787132	\N	\N	\N	\N	Gift of Steve Mendoza	2019-09-02	2022-07-28 23:59:21.060879	2023-08-26 00:03:10.907354	f	64
1013	Umoja	Brown, Larry "Poncho"	https://www.larryponchobrown.net/	1992	Signed. Artist's proof.	31.5 x 25.5"	\N	991041389999706532	C103789972	\N	\N	\N	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2023-08-26 00:08:28.249195	f	131
1154	Tulips in California Wildflowers, EV 	Lucey, Julia	https://www.julialucey.com/	2022	\N	18 x 24.75”	\N	991086086280506532	C103792673	\N	\N	\N	\N	\N	\N	2023-07-27 20:35:05.429659	2023-08-26 00:45:39.53	f	1062
367	Look at Poster	Pfahler, Georg Karl	https://de.wikipedia.org/wiki/Georg_Karl_Pfahler	1968	Unsigned. Published in conjunction with "Look at Pfahler", Galerie Thomas, Munich.	27.5 x 37"	\N	991051284709706532	C103787965	\N	\N	50	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2023-08-28 19:32:04.672653	f	690
461	Look at Poster	Vasarely, Victor	https://en.wikipedia.org/wiki/Victor_Vasarely	1969	Unsigned. Print of Vasarely's "Planetarische Folklore," published in conjunction with "Look at Vasarely", Galerie Thomas, Munich.	37 x 27.5"	\N	991051352569706532	C093329992	\N	\N	50	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2023-08-28 19:37:19.837468	f	959
476	Member of the Qumran Community	Weil, Shraga	https://en.wikipedia.org/wiki/Shraga_Weil	1965	Signed and numbered.	33 x 26"	"106/150"	991051321989706532	C104974582	\N	\N	850	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2023-09-04 16:27:59.264896	f	1001
945	Installation Floor Plan for Any Space Surrounded by Four Walls	Le Va, Barry	https://en.wikipedia.org/wiki/Barry_Le_Va	1976	Printed by Aaron Arnow; published by Parasol Press, Ltd., New York.	22 x 14"	"216/1000"	991036394089706532	C104947621	\N	\N	\N	\N	Gift of Amy Baker Sandback	2019-09-21	2022-07-28 23:59:21.060879	2023-09-05 20:57:04.740072	f	534
37	Sezambre	Ballif, Yannick	\N	1969	Full margins.	29.5 x 37"	"54/60"	991051112769706532	C093335873	\N	\N	100	2006	\N	2018-08-20	2022-07-28 23:59:21.060879	2024-07-30 19:13:25.269031	f	1081
1163	Chase the Morning Sun	Fein, Beth	https://www.bethfein.com/	2022	Wood block monoprint and mixed media.	21.5 x 28"	\N	991086248529506532	C104943342	\N	\N	800	\N	\N	\N	2024-07-24 19:26:35.934297	2024-08-14 20:42:53.369542	f	1075
227	Pounding Cloth at the Chofu Tama River in Musashi	Ando, Hiroshige (Utagawa, Hiroshige)	https://en.wikipedia.org/wiki/Hiroshige	1835	From the series "Six Jewel Rivers in Various Provinces." Reproduction after original color woodcut.	21 x 16"	"Six Tama Rivers"	991051090469706532	c093335110	\N	\N	200	2006	\N	2018-08-20	2022-07-28 23:59:21.060879	2023-08-21 21:53:10.572973	f	408
823	Apollo	Illouz, Salomon	http://salomonillouz.com/	2003	Signed, titled, dated and numbered.	33 x 26.5"	"1/1"	991078662359706532	C104970504	\N	\N	500	\N	\N	2019-09-09	2022-07-28 23:59:21.060879	2023-08-23 19:21:48.220286	f	919
152	From "Twins"	Eggers, W.P. Eberhard	https://www.annexgalleries.com/artists/biography/3268/Eggers/Wilhelm	1973	Signed, numbered, and dated.	16 x 19"	"56/80"	991051094729706532	c093330758	\N	\N	100	2006	Gift of Miss Helen and Miss Madeline Pardee	2019-09-16	2022-07-28 23:59:21.060879	2023-08-26 00:20:26.13773	f	269
1157	Untitled Ripple	Lautze, Cora	https://coramarielautze.com/	2019	\N	21.5 x 28"	\N	991086086281006532	C117621500	\N	\N	\N	\N	\N	\N	2023-07-27 20:57:58.634252	2023-08-26 00:40:29.310738	f	1069
336	Swamp Theme	Meeker, Dean	https://www.annexgalleries.com/artists/biography/1570/Meeker/Dean	1955	Signed and numbered.	27 x 21"	"114/210"	991051076409706532	c091134086	\N	\N	100	2006	\N	2018-09-27	2022-07-28 23:59:21.060879	2023-08-26 00:52:46.936071	f	614
1158	Balance Is a Wave	Burrell, Alexa	https://www.alexachristineburrell.com/	2021	Digital print from a still from a music video.	31 x 20"	1/15	991086086281106532	C117621971	\N	\N	\N	\N	\N	\N	2023-07-27 21:01:25.711503	2023-07-31 18:26:50.340587	f	1068
1168	Making Arrangements	Stroech, Megan	https://meganstroech.com/home.html	2022	Screenprint, oil pastel, gouache and acrylic on paper.	21 x 24"	\N	991086248530706532	C104943458	\N	\N	\N	\N	\N	\N	2024-08-07 20:32:31.928317	2024-08-14 20:21:32.468304	f	1085
1173	Boy Dey Onna Hip	Lee-Johnson, Jazzmen	https://www.jazzmenleejohnson.com/	2022	Signed on the back. Edition of 29.	17.5 x 31.5	\N	991086248530406532	C104943476	\N	\N	\N	\N	\N	\N	2024-08-14 19:33:50.693588	2024-08-14 20:33:22.952586	f	1092
1167	Green Butterfly	Airo, Darius	https://dariusairo.com/	2023	Signed, numbered, and titled. Soft and hard ground copper plate etching with aquatint and chine collé. Printed by Pigeon Hole Press.	13 x 15"	"1/4"	991086248530906532	C104943430	\N	\N	\N	\N	\N	\N	2024-08-07 20:29:10.157497	2024-08-14 20:09:40.014577	f	1084
1166	a birthright, an obligation, all the same	Jang, Insil	https://www.insiljang.com/	2023	4-color screenprint. Signed and numbered verso. Printed at Du-Good Press, NY. 	23.5 x 29.5"	Edition of 14	991086248529706532	C104943379	\N	\N	\N	\N	\N	\N	2024-08-07 20:26:27.054004	2024-08-14 20:38:28.895128	f	1089
1164	Untitled (Native American figure)	Ingram, Jerry	https://americanart.si.edu/artist/jerry-ingram-7314	1975	Signed and numbered. Gift of Benjamin A. Spanbock. 	27.5 x 35"	XI/XV	991086248529306532	C104943333	550	\N	\N	\N	\N	\N	2024-07-24 19:38:36.276285	2024-08-14 20:45:51.158558	f	1079
1014	A Soulfood Nite	Vines, Roederick	https://rvinesvision.com/	1992	Signed and numbered.	47 x 21"	"591/900"	991041390539706532	C103790118	\N	255 Doe	\N	\N	\N	2019-09-22	2022-07-28 23:59:21.060879	2024-08-14 21:11:58.43324	t	978
1169	Untitled	Harris, Peter	https://niadart.org/peter-harris/	2019	Printed at NIAD Art Center. Open edition. 	12.5 x 16.5"	\N	991086248530806532	C104943449	\N	\N	\N	\N	\N	\N	2024-08-07 20:44:46.093631	2024-08-21 22:11:40.566862	f	1086
1165	Untitled	Lam, Nathan	https://niadart.org/nathan-lam/	2022	Printed at NIAD Art Center. Open edition. 	15 x 15"	\N	991086248529906532	C104943403	\N	\N	\N	\N	\N	\N	2024-08-07 20:21:33.247147	2024-08-21 22:12:57.701038	f	1088
199	Duet	Greaver, Hanne	http://portlandartmuseum.us/mwebcgi/mweb.exe?request=record;id=910;type=701	1977	Model was the concertmaster of the Kalamazoo Symphony.	15 x 12"	"8/25"	991051091749706532	c093335262	\N	\N	75	2006	\N	2020-02-10	2022-07-28 23:59:21.060879	2024-09-05 16:52:45.165203	f	352
177	Renewal	Frederick, Robilee	https://www.annexgalleries.com/artists/biography/4797/Frederick/Robilee	\N	Signed and annotated "A/P No. 3." Africa VII.	34 x 19"	Artist's proof	991051234499706532	c093331983	\N	\N	100	2006	\N	2019-09-09	2022-07-28 23:59:21.060879	2023-08-21 22:45:31.156976	f	302
544	Muir Beach Overlook	Horner, Lisah	http://www.lisahhorner.com/about.html	2003	Signed.	24 x 36"	\N	991051327309706532	c093328925	\N	\N	500	\N	17737337	2019-08-28	2022-07-28 23:59:21.060879	2023-08-26 00:33:58.218386	f	418
9	Bird	Alps, Glen	https://en.wikipedia.org/wiki/Glen_Alps	\N	Signed in pencil.	23 x 21"	Artist's Proof	991051110699706532	C093330943	\N	\N	100	2006	\N	2019-09-07	2022-07-28 23:59:21.060879	2024-07-24 19:55:38.267245	f	15
1174	Parks for Everyone	Collins, Jeremy	https://jercollins.com/	2023	Printed in collaboration with Parks CA. Edition of 300.	19 x 24"	\N	991086248530506532	C104943467	\N	\N	\N	\N	\N	\N	2024-08-14 19:47:40.08459	2024-08-14 20:25:23.806193	f	1095
1172	Urgent Lexicon: Pinay	Santos, Christine	https://csantos.xyz/work	2024	Signed.	32 x 28"	\N	991086248528906532	C104943485	\N	\N	\N	\N	\N	\N	2024-08-07 20:59:57.806323	2024-08-16 18:31:34.377457	f	1091
1171	Rainbow State Fantasies	Santos, Christine	https://csantos.xyz/work	2024	Screen print monoprint. Signed.	32 x 28"	\N	991086248529106532	C104943494	\N	\N	\N	\N	\N	\N	2024-08-07 20:58:51.251543	2024-08-16 18:31:49.109543	f	1090
1170	Untitled	Griffin, Felicia	https://niadart.org/felecia-griffin/	2020	Printed at NIAD Art Center. Open edition.	47 x 28.5"	\N	991086248528806532	C104943500	\N	\N	\N	\N	\N	\N	2024-08-07 20:46:16.628906	2024-08-21 22:12:33.209454	f	1087
15	Eve	Anno, Kim	https://www.kimanno.com/	1995	From the portfolio: "10 x 10 Ten Women Ten Prints."	29.5 x 30"	15/75	991053836329706532	c093335943	\N	\N	500	\N	\N	2019-08-29	2022-07-28 23:59:21.060879	2024-09-05 22:01:25.461928	f	23
215	Composition in Orange	Harnest, Fritz	https://en.wikipedia.org/wiki/Fritz_Harnest	\N	Signed. Slight foxing. Provenance: Otto Stangl.	13 x 16"	Artist's Proof	991051090669706532	C104947393	\N	\N	500	2006	\N	2019-09-23	2022-07-28 23:59:21.060879	2023-09-06 21:06:31.255356	f	376
521	Aqueous	Taplitz, Phyllis	https://www.annexgalleries.com/artists/biography/2327/Taplitz/Phyllis	\N	\N	33 x 25"	\N	991051286269706532	C093334116	\N	\N	500	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2023-08-21 23:26:34.00282	f	892
398	Aveyron	Runacher, Suzanne	https://www.annexgalleries.com/artists/biography/2064/Runacher/Suzanne	\N	Signed and inscribed "EP E/IV/IV."	26 x 32"	\N	991051285439706532	c093332817	\N	Graduate Services Dissertation Room	100	2006	\N	2019-12-02	2022-07-28 23:59:21.060879	2023-08-21 23:42:38.900822	f	771
696	The Elephants, from "The Triumph of Julius Ceasar"	Andreani, Andrea	https://en.wikipedia.org/wiki/Andrea_Andreani	1599	One of nine Chiaroscuro woodcuts after Mantegna. B101; K32.	\N	\N	\N	\N	NON-CIRC	Stored in box	3000	2006	b18360084	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	27
22	Amigdala cum flore	Unknown	\N	\N	Printed in the style of of Basilius Besler. Engraving on paper with hand coloring, titled in plate along the lower edge.	11.5 x 22.25"	\N	991053836289706532	C103790525	\N	\N	300	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	28
20	The Chatterer (Garrulus Carolinensis)	Unknown	\N	1771	From M. Catesby's "Natural History of Carolina, Florida, and the Bahama Islands."	16.5 x 20"	\N	991051103779706532	C087370839	\N	\N	50	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	30
29	Il etait presque 18 heures	Artigas, Joan Gardy	https://en.wikipedia.org/wiki/Joan_Gardy_Artigas	1970	Signed and numbered. Slight crease in upper left.	33 x 27"	"39/75"	991051112649706532	c093335998	\N	\N	400	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2023-08-21 22:12:38.58556	f	49
31	The Ridiculous Ones, Plate 2 (Les Ridicules, Planche No.2)	Avati, Mario	https://fr.wikipedia.org/wiki/Mario_Avati	1953	Inscribed "50 etat."	27.5 x 21.5"	"6/16"	991051102679706532	C103788233	\N	\N	300	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2023-09-05 19:58:17.486986	f	53
28	Cygne	Araki, Tetsuo	https://en.wikipedia.org/wiki/Tetsuo_Araki	1969	Signed and numbered.	26 x 22"	"61/75"	991051103679706532	C103788181	\N	\N	250	2006	\N	2019-09-05	2022-07-28 23:59:21.060879	2023-09-17 00:24:27.857539	f	44
23	Leucoium bulbosum minus	Unknown	\N	\N	Printed in the style of of Basilius Besler. Engraving on paper with hand coloring, titled in plate along the lower edge.	11.5 x 22.25"	\N	991051103739706532	C087370820	\N	\N	300	2006	b16390478, 20101210 MISSING mocs	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	31
24	Oxyacantha	Unknown	\N	\N	Printed in the style of of Basilius Besler. Engraving on paper with hand coloring, titled in plate along the lower edge.	11.5 x 22.25"	\N	991051103599706532	C087370723	\N	\N	300	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	32
21	Tulipa aurei coloris	Unknown	\N	\N	Printed in the style of of Basilius Besler. Engraving on paper with hand coloring, titled in plate along the lower edge.	12 x 22"	\N	991051103569706532	C087370714	\N	\N	600	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	33
25	Still Life with Pomegranate	Antonini, Annapia	\N	\N	\N	18.5 x 21"	"7/15"	991051103529706532	C103787220	\N	\N	150	2006	\N	2019-10-18	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	34
27	Inward Eye #6	Anuszkiewicz, Richard	https://en.wikipedia.org/wiki/Richard_Anuszkiewicz	1970	Signed and numbered with letters in upper margin: Artist's name and "Edition Domberger Stuttgart."	20 x 22.5"	"79/165"	991051112579706532	C093335970	\N	\N	300	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	36
26	Inward Eye #3	Anuszkiewicz, Richard	https://en.wikipedia.org/wiki/Richard_Anuszkiewicz	1970	Unsigned.	26 x 20"	"479/500"	991051112619706532	C104971702	\N	\N	300	2006	\N	2019-09-13	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	37
583	Composition	Appel, Karel	https://en.wikipedia.org/wiki/Karel_Appel	1959	\N	\N	\N	\N	C093330235	NON-CIRC	255 Doe	1400	2006	b16398946	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	38
584	The Lovers	Appel, Karel	https://en.wikipedia.org/wiki/Karel_Appel	1959	\N	\N	\N	\N	C093330226	NON-CIRC	255 Doe	1400	2006	b16398945	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	40
1064	Martha Jackson Gallery Poster	Appel, Karel	https://en.wikipedia.org/wiki/Karel_Appel	1969	\N	23" x 18.5"	\N	991050061709706532	C103790622	\N	\N	\N	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	41
585	Untitled	Appel, Karel	https://en.wikipedia.org/wiki/Karel_Appel	1959	Signed and numbered.	33.5 x 23.5"	"52/125"	\N	C103510745	NON-CIRC	\N	1400	2006	b18360089	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	42
586	Almost a vase and flower (Presque vase et fleur)	Arp, Jean	https://en.wikipedia.org/wiki/Jean_Arp	1955	A331. Signed and numbered.	22.5 x 26"	"75/200"	\N	C103787035	NON-CIRC	\N	1400	2006	b16398943	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	47
587	Composition with Two Shapes	Arp, Jean	https://en.wikipedia.org/wiki/Jean_Arp	1951	Signed and numbered.	21.5 x 28.5"	"62/200"	\N	C093330217	NON-CIRC	\N	1200	2006	b16398944	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	48
947	Untitled (Rubber Stamp Portfolio)	Artschwager, Richard	https://en.wikipedia.org/wiki/Richard_Artschwager	1976	Printed by Catherine Kord; published by Parasol Press, Ltd., New York.	14 x 14"	"216/1000"	991036394179706532	C104974500	\N	\N	\N	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	50
30	Carnival (Carnaval)	Avati, Mario	https://fr.wikipedia.org/wiki/Mario_Avati	1950	\N	27.5 x 21.5"	"43/100"	991051102569706532	c093335837	\N	\N	200	2006	\N	2019-09-02	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	51
32	The Carp (La Carpe)	Avati, Mario	https://fr.wikipedia.org/wiki/Mario_Avati	1958	\N	18.75 x 22.75"	"50/50"	991051102539706532	c093335730	\N	\N	100	2006	\N	2019-09-23	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	52
33	Still Life with Matches (Nature morte aux allumettes)	Avati, Mario	https://fr.wikipedia.org/wiki/Mario_Avati	1959	Signed and inscribed "E.A."	23 x 19"	"6/12"	991051353749706532	C093330192	\N	\N	800	2006	\N	2019-09-10	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	54
34	Image of the Black Circle	Azuma, Norio	http://americanart.si.edu/collections/search/artist/?id=182	1960-1969	Signed and numbered.	27.5 x 32.5"	"22/24"	991051112689706532	C093336008	\N	\N	250	2006	\N	2019-08-31	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	56
36	Monster and Lady	Baj, Enrico	https://en.wikipedia.org/wiki/Enrico_Baj	1956	Slight foxing.	27.5 x 21.5"	"33/60"	991051102599706532	c093335846	\N	\N	500	2006	\N	2019-09-03	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	58
39	First Day, from "The Manifestation of God" (Erste Tag, from Die Wandlungen Gottes)	Barlach, Ernest	https://en.wikipedia.org/wiki/Ernst_Barlach	1920	Unsigned proof apart from the edition of 110. Significant discoloration of paper.	10.25 x 14.25"	"?/110"	991051353499706532	C093330138	\N	\N	700	2006	\N	2019-11-11	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	62
588	Silent Season - Spring	Barnet, Will	https://en.wikipedia.org/wiki/Will_Barnet	1971	Signed and numbered.	22.5 x 17.25"	"103/225"	\N	C093329549	NON-CIRC	\N	1100	2006	b16398803	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	63
40	Beatitude (After Ben Shahn)	Baskin, Leonard	https://en.wikipedia.org/wiki/Leonard_Baskin	1955	Signed and Numbered. Inscribed 'Ben Shahn.'	21 x 17.5"	"?/400"	991053836369706532	c067068519	\N	\N	800	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	65
786	Frightened Boy and His Dog	Baskin, Leonard	https://en.wikipedia.org/wiki/Leonard_Baskin	1954	Signed and numbered. Stamped on the lower left corner.	21.5 x 24"	"44/210"	991078627709706532	C104970975	\N	\N	750	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	66
41	Mantegna at Eremitani	Baskin, Leonard	https://en.wikipedia.org/wiki/Leonard_Baskin	1952	\N	27.5 x 21.5"	"?/15"	991051353629706532	C103787026	\N	\N	750	2006	\N	2017-01-15	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	67
42	Standing Eagle	Baskin, Leonard	https://en.wikipedia.org/wiki/Leonard_Baskin	1966	\N	16.75 x 20.25"	"34/60"	991051102519706532	C093335721	\N	\N	600	2006	\N	2019-09-08	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	68
43	Between Day and Night	Bate, Norman Arthur	\N	1958	Signed and numbered.	27 x 21.25"	"9/200"	991053836399706532	c067068500	\N	\N	325	2006	\N	2019-09-09	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	69
589	The Painter at the Easel (Maler an der Staffelei)	Baumeister, Willi	https://en.wikipedia.org/wiki/Willi_Baumeister	1935	Signed.	27 x 21"	\N	\N	C093330110	NON-CIRC	\N	2800	2006	b16398934	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	70
590	Royal Pavilion, Brighton	Bawden, Edward	https://en.wikipedia.org/wiki/Edward_Bawden	1960	Signed, annotated "artist's proof," and numbered.	25.5 x 31"	"30/40"	\N	C093330174	NON-CIRC	255 Doe	1600	2006	b16398940	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	71
591	Smithfield Market, London	Bawden, Edward	https://en.wikipedia.org/wiki/Edward_Bawden	1967	From the series "Six London Markets" published by Curwen Prints, London. Signed and numbered.	25 x 31"	"10/75"	\N	C093330183	NON-CIRC	\N	2200	2006	b16398941	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	72
44	Hollande III	Bazaine, Jean Rene	https://en.wikipedia.org/wiki/Jean_Ren%C3%A9_Bazaine	1957	\N	17 x 16.25"	"147/150"	991051102479706532	C093335712	\N	\N	400	2006	\N	2019-09-06	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	73
45	Trillium	Beal, Jack	https://en.wikipedia.org/wiki/Jack_Beal	1977	\N	17 x 20"	"15/50"	991051353459706532	C093330129	\N	\N	800	2006	17752176	2019-08-29	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	74
46	Sunset Tercel	Bechtle, Robert	https://en.wikipedia.org/wiki/Robert_Bechtle	1987	Printed at Crown Point Press, San Francisco.	25 x 24"	"1/15"	991051348829706532	C093329558	\N	\N	800	2006	17750428	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	75
592	Weathervane (Wetterfanhe)	Beckmann, Max	https://en.wikipedia.org/wiki/Max_Beckmann	1946	Signed. GA290; H358. Plate 2 from the series "Day and Dream."	19 x 15"	"?/90"	\N	C093330280	NON-CIRC	\N	1600	2006	b16398951	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	76
593	Holy Family Under a Tree	Beham, Hans Sebald	https://en.wikipedia.org/wiki/Sebald_Beham	1521	Bartsch IX, 123. Pauli/Hollstein 889. Dodgson 108. Geisbert XIX. Bilderkatalog 196. Without the monogram. Thread margins, slight brown stain in lower center near edge.	19 x 15"	\N	\N	C093330299	NON-CIRC	\N	2200	2006	b16398952	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	77
1083	Arboretum Entrance	Belau, Susan	https://susanbelau.com/	2018	Etching and chin-colle. Signed, numbered, and annotated "E/V."	11 x 12"	"2/6"	991054291949706532	\N	\N	\N	\N	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	78
48	Glyph Series IV	Bender, Eleanore	\N	1977	Signed.	12.5 x 12.5"	"15/50"	991051102309706532	C093335679	\N	\N	50	2006	\N	2019-09-06	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	80
47	Peyote Bird	Bender, Eleanore	\N	1973	\N	28.5 x 40''	"8/10"	991051350389706532	C093329956	\N	\N	50	2006	\N	2019-09-12	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	81
49	Sand Painting	Bender, Eleanore	\N	\N	\N	32 x 26.5"	\N	991051114899706532	C104972016	\N	\N	50	2006	17498610	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	82
50	Entertainer of Our Armed Hosts	Bentley, Wilder	https://www.annexgalleries.com/artists/biography/178/Bentley/Harvey	1946	\N	21 x 27.25"	\N	991051114939706532	C093336202	\N	\N	500	2006	\N	2019-09-23	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	83
52	Female Gangster	Bentley, Wilder	https://www.annexgalleries.com/artists/biography/178/Bentley/Harvey	1947	\N	15 x 18.5"	\N	991051114979706532	C093336211	\N	\N	600	2006	\N	2019-09-11	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	84
35	Plateau	Azuma, Norio	http://americanart.si.edu/collections/search/artist/?id=182	1960-1969	Signed and annotated "Artist's Proof."	26 x 22"	Artist's Proof	991051102639706532	c093335855	\N	\N	250	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2023-09-05 20:58:09.348676	f	57
574	Espace	Ballif, Yannick	\N	1969	Signed, dated, and numbered.	30.5 x 39"	?/60	991078465599706532	C103510754	\N	\N	500	\N	\N	2012-10-01	2022-07-28 23:59:21.060879	2024-09-04 00:53:40.201844	f	1080
53	Hectic Nymph	Bentley, Wilder	https://www.annexgalleries.com/artists/biography/178/Bentley/Harvey	1946	\N	21.5 x 27.5"	\N	991051115019706532	C103787257	\N	\N	500	2006	\N	2019-10-01	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	85
51	Portrait Head	Bentley, Wilder	https://www.annexgalleries.com/artists/biography/178/Bentley/Harvey	1947	\N	21.5 x 27.5"	\N	991051115069706532	C093336239	\N	\N	500	2006	\N	2019-09-09	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	86
55	The Apple	Berdich, Vera	https://en.wikipedia.org/wiki/Vera_Berdich	1947	Signed and numbered.	15.5 x 18.5"	"7/7"	991051102379706532	C093335697	\N	\N	500	2006	\N	2019-09-16	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	88
732	Bretonne dans sa ferme avec son cochon	Bernard, Emile	https://en.wikipedia.org/wiki/%C3%89mile_Bernard	1889	Signed. Colored with watercolor. From the series "Bretonnerie."	18 x 15"	\N	\N	C094893637	NON-CIRC	\N	2000	\N	b18366070	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	89
594	The Spinner (La Fileuse)	Bernard, Emile	https://en.wikipedia.org/wiki/%C3%89mile_Bernard	1892	Boyle-Turner 12a. Stamped signature "e.b." A posthumous edition published by La Guilde Internationale de la Gravure Geneva, Paris, late 1950s.	14.5 x 19.5"	\N	\N	C093329530	NON-CIRC	\N	2000	2006	b16398802	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	91
56	Study No. 2	Bertrand, Huguette Arthur	https://fr.wikipedia.org/wiki/Huguette_Arthur_Bertrand	\N	Signed and inscribed "epreuve d'artiste." Soft creases in upper right margin.	21.5 x 27.5"	Artist's Proof	991051115149706532	c093336248	\N	\N	150	2006	\N	2019-09-10	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	92
595	Upper Room	Biggers, John	https://en.wikipedia.org/wiki/John_T._Biggers	1984	Signed and numbered.	38 x 26"	"25/75"	\N	C098423127	NON-CIRC	255 Doe	5500	2006	b16467901	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	96
596	And when they lifted up their eyes...	Blake, William	https://en.wikipedia.org/wiki/William_Blake	1825	Binyon 112 iii; Bindman 632. Plate 7 from "The Book of Job," second edition, 1874. Image has foxing. Provenance: R.E. Lewis.	8.5 x 6.5"	\N	\N	C093329512	NON-CIRC	\N	1800	2006	b16398800	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	99
61	Before Dawn	Blake, Paul	\N	1980	Signed and numbered.	25 x 18"	"8/20"	991051115219706532	c093336266	\N	\N	200	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	100
62	Calling the Fishes	Blake, Paul	\N	\N	Unsigned.	25.25 x 30.5"	\N	991051115259706532	c093336275	\N	\N	200	2006	\N	2019-09-09	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	101
63	Girl with Dove	Blase, Karl Oskar	https://de.wikipedia.org/wiki/Karl_Oskar_Blase	1957	Signed and annotated "Holzdrucke."	21 x 27"	"12/50"	991051115299706532	c093336284	\N	\N	250	2006	\N	2019-12-17	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	103
64	Romantic Landscape	Blaustein, Al	http://alblaustein.com/index.html	1962	\N	23.5 x 32"	"23/30"	991051120149706532	C104971720	\N	\N	200	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	104
65	The Tangle	Blaustein, Al	http://alblaustein.com/index.html	1961	\N	26 x 32.5"	"29/30"	991051120199706532	c093336594	\N	\N	200	2006	\N	2018-10-14	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	105
66	Detente	Boni, Paolo	http://www.moma.org/collection/artists/664?locale=en	1962	\N	27 x 23"	"4/12"	991051102149706532	c093336123	\N	\N	250	2006	\N	2019-09-08	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	107
67	Woman and Boy	Bonnard, Pierre	https://en.wikipedia.org/wiki/Pierre_Bonnard	1930	Unsigned. From "La vie de sainte Monique" (The Life of Saint Monique). Illustrations for a book published by Ambroise Vollard.	14.5 x 17.5"	"?/340"	991051102279706532	C103787169	\N	\N	350	2006	\N	2017-08-23	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	109
69	The Bath (Le Bain)	Bonnard, Pierre	https://en.wikipedia.org/wiki/Pierre_Bonnard	1925	Edition of 225 unsigned impressions for Peintres Lithographies de Manet à Matisse, Published by Frapier. Blindstamp in lower right.	13 x 9"	"?/240"	\N	C093329521	NON-CIRC	\N	2600	2006	b16398801	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	110
68	Seated Ladies	Bonnard, Pierre	https://en.wikipedia.org/wiki/Pierre_Bonnard	1930	Unsigned. From "La vie de sainte Monique" (The Life of Saint Monique). Illustrations for a book published by Ambroise Vollard.	16 x 13.5"	"?/340"	991051102249706532	C104971863	\N	\N	350	2006	17488386	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	111
597	Woman seated in her bath (Femme assise dans sa baignoire)	Bonnard, Pierre	https://en.wikipedia.org/wiki/Pierre_Bonnard	1942	CRM 78; B115. Cover for the program of a recital by Maurice Chevalier, Cannes, 1942. Printed by Arte. Signed.	20.5 x 17"	"?/1000"	\N	C093330314	NON-CIRC	\N	1800	2006	b16398954	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	112
70	Children Playing Football	Boulanger, Graciela Rodo	https://en.wikipedia.org/wiki/Graciela_Rodo_Boulanger	1973	Unsigned. Trimmed past bleed.	16 x 19.5"	\N	991051100159706532	c093336114	\N	\N	250	2006	\N	2019-09-19	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	113
713	Two Children (Deux Enfants)	Boulanger, Graciela Rodo	\N	\N	Signed and numbered.	32.5 x 26"	"44/80"	\N	C094905010	NON-CIRC	\N	1500	\N	b18362501	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	114
882	Geese and the Approaching Storm	Bracquemond, Felix	https://en.wikipedia.org/wiki/F%C3%A9lix_Bracquemond	1879	Signed.	17.5 x 21.25"	\N	991079522659706532	C103496113	\N	\N	500	\N	\N	2019-08-27	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	117
73	Fisherman at Net-casting (Pecheur a l'epervier)	Bracquemond, Felix	https://en.wikipedia.org/wiki/F%C3%A9lix_Bracquemond	1868	Bouillon 189. Unsigned.	17 x 13.5"	"?/25"	991051100129706532	C093335819	\N	\N	250	2006	\N	2019-10-08	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	118
922	One Who Called Now Follows	Blake, Paul	\N	1975	\N	35.5 x 31"	"8/8"	991009071149706532	C103786086	\N	\N	\N	\N	\N	2019-09-19	2022-07-28 23:59:21.060879	2023-08-21 22:15:16.765265	f	102
54	And It Came to Pass	Ben-Zion (Weinman, Benzion)	https://en.wikipedia.org/wiki/Ben-Zion_(artist)	1950	\N	21.5 x 27.5"	"114/140"	991051102409706532	c093335703	\N	\N	200	2006	\N	2019-11-09	2022-07-28 23:59:21.060879	2023-08-26 00:04:44.460886	f	87
71	El Viento	Bragar, Phillip F.	\N	1961	Signed and numbered.	21.5 x 25.5"	"14/20"	991051100099706532	C103787691	\N	\N	150	2006	\N	2019-09-08	2022-07-28 23:59:21.060879	2023-09-12 03:41:14.319413	f	123
719	Le Lierre (The Ivy)	Braque, Georges	https://en.wikipedia.org/wiki/Georges_Braque	1955	Signed.	27 x 21"	\N	\N	C094905427	NON-CIRC	\N	1500	\N	b18363163	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	124
72	Tartuffe	Braque, Georges	https://en.wikipedia.org/wiki/Georges_Braque	1963	Unsigned.	10.75 x 7.5"	"?/180"	991054201349706532	C098423118	\N	\N	500	2006	17484942	2019-09-02	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	125
1118	Bat Kiss	Breidenthal, Elinor	\N	2020	\N	16 x 16"	\N	991085987125206532	C103791909	\N	\N	\N	\N	\N	\N	2022-09-21 16:53:24.23515	2022-09-21 16:53:24.23515	f	127
74	Untitled, Regards sur Paris	Brianchon, Maurice	https://fr.wikipedia.org/wiki/Maurice_Brianchon	1960	From "Regards sur Paris" published by André Sauret.	17.5 x 20.5"	"55/200"	991051100059706532	c093336105	\N	\N	300	2006	17484937; Provenance: Ferdinand Roten (for $85)	2019-08-29	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	128
75	Interior with Model	Brown, Kathan	https://en.wikipedia.org/wiki/Kathan_Brown	1963	Signed and numbered.	16 x 21.5"	"146/250"	991051100019706532	c093336099	\N	\N	100	2006	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	129
76	Portrait	Brown, Ray	\N	1962	Signed and numbered.	26 x 32.25"	"3/25"	991051120239706532	c093336600	\N	\N	300	\N	\N	2018-10-14	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	130
88	The Artist Alone	Castellon, Federico	https://en.wikipedia.org/wiki/Federico_Castell%C3%B3n	1963	Freundlich 110.	30 x 26"	"13/25"	991051120349706532	C104943315	\N	\N	200	2006	\N	2020-02-08	2022-07-28 23:59:21.060879	2024-07-24 20:01:09.30153	f	149
77	Molton	Brunsdon, John	https://en.wikipedia.org/wiki/John_Brunsdon	1962	Signed and numbered.	26 x 26"	"41/50"	991051120269706532	c093336619	\N	\N	350	2006	\N	2019-09-09	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	132
78	Sunflowers and melon (Tournesols et melon)	Buffet, Bernard	https://en.wikipedia.org/wiki/Bernard_Buffet	1967	Signed and numbered.	19 x 25"	"9/125"	\N	C093330341	NON-CIRC	255 Doe	2100	2006	17752251, b16398957	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	133
79	Waterfront in Trouville (Embarcadere a Trouville)	Buhot, Felix	https://en.wikipedia.org/wiki/F%C3%A9lix_Buhot	1877	Signed in the plate at bottom right.	15 x 19"	\N	991051348619706532	C093329503	\N	\N	600	2006	\N	2019-09-10	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	134
941	1000 Placements	Buren, Daniel	https://en.wikipedia.org/wiki/Daniel_Buren	1977	Printed by Aaron Arnow; published by Parasol Press, Ltd., New York.	14 x 14"	"216/1000"	991036393439706532	C104974485	\N	\N	\N	\N	Gift of Amy Baker Sandback	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	135
80	Plate	Burri, Alberto	https://en.wikipedia.org/wiki/Alberto_Burri	1965	Signed and numbered.	\N	"69/80"	\N	C093329497	NON-CIRC	255 Doe	3000	2006	17750412, b16398798	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	136
625	Composition	Calder, Alexander	https://en.wikipedia.org/wiki/Alexander_Calder	\N	Signed.	\N	\N	\N	C104971049	NON-CIRC	255 Doe	5000	\N	b18360127	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	137
1030	Peasant with a Cup	Callot, Jacques	https://en.wikipedia.org/wiki/Jacques_Callot	1617	From "Les Caprices" Series B, "The Nancy Set."	9 x 13"	\N	991044528049706532	\N	\N	\N	\N	\N	Gift of Amy Baker Sandback	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	138
82	The Necklace (Collier)	Campigli, Massimo	https://en.wikipedia.org/wiki/Massimo_Campigli	1952	Signed and numbered.	21 x 27"	"177/200"	991051348539706532	C093329488	\N	\N	900	2006	17750409	2019-09-26	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	139
81	Group of Women	Campigli, Massimo	https://en.wikipedia.org/wiki/Massimo_Campigli	1932	Unsigned.	19 x 15"	\N	991051354299706532	C093330323	\N	\N	800	2006	17752248	2019-11-29	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	140
83	Foule Bleue	Capdeville, Jean	\N	1972	\N	31 x 37"	"20/75"	991051350339706532	c093329938	\N	\N	150	2006	\N	2019-08-29	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	143
84	Still Life	Carcan, Rene	https://en.wikipedia.org/wiki/Ren%C3%A9_Carcan	\N	Signed and numbered.	28 x 22"	"61/100"	991051120309706532	C104970513	\N	\N	300	2006	\N	2019-09-09	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	144
89	Oh Helen	Caulfield, Patrick	https://en.wikipedia.org/wiki/Patrick_Caulfield	1973	Signed and numbered. Lower center verso stamped: "Oh Helen, I roam my room." From the series "Some Poems of Jules LaForgue."	22 x 25.5"	"46/100"	991051354349706532	C093330332	\N	\N	900	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	150
90	Composition	Chadwick, Lynn	https://en.wikipedia.org/wiki/Lynn_Chadwick	1956	Signed and numbered.	21.5 x 27.5"	"51/60"	991051120379706532	c093336646	\N	\N	400	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	151
91	Winged Creature	Chadwick, Lynn	https://en.wikipedia.org/wiki/Lynn_Chadwick	1958	Signed and numbered.	21.5 x 27.5"	"9/100"	991051120419706532	c093336655	\N	\N	400	2006	\N	2018-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	152
95	The Crow and the Fox	Chagall, Marc	https://en.wikipedia.org/wiki/Marc_Chagall	1952	Unsigned. Numbered. From "Les Fables de la Fontaine."	17 x 19"	"106/200"	991051099799706532	c093336053	\N	\N	500	2006	\N	2019-09-06	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	153
92	Jeremiah	Chagall, Marc	https://en.wikipedia.org/wiki/Marc_Chagall	1956	Unsigned. Published in Verve 33/34. One of 17 biblical illustrations. Printed to edge of sheet.	15 x 19.25"	"?/6500"	991051099979706532	c093336080	\N	\N	500	2006	\N	2019-09-04	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	154
96	Lovers	Chagall, Marc	https://en.wikipedia.org/wiki/Marc_Chagall	1951	Unsigned. Printed to the edge of sheet.	19.25 x 15.25"	\N	991051099939706532	C103494638	\N	\N	900	2006	\N	2018-08-21	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	155
93	Moses Receiving Tablets of the Law	Chagall, Marc	https://en.wikipedia.org/wiki/Marc_Chagall	1956	Unsigned. Published in Verve 33/34. One of 17 biblical illustrations. Printed to edge of sheet.	19 x 15"	\N	991051099899706532	c093336062	\N	\N	300	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	156
877	Untitled, Two Birds	Braque, Georges	https://en.wikipedia.org/wiki/Georges_Braque	1963	Cover of a catalogue published by Mourlot, Paris.	14.5 x 17.75"	\N	991079289479706532	C103532039	\N	\N	500	\N	b18439981	2019-08-28	2022-07-28 23:59:21.060879	2024-09-05 20:19:40.185578	f	126
94	Quai aux Fleurs	Chagall, Marc	https://en.wikipedia.org/wiki/Marc_Chagall	1954	From "Derrière le Miroir 66-68." Mourlot 99.	19.25 x 16"	"66/68"	\N	C103494319	NON-CIRC	\N	1100	2006	b16390341	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	157
97	Letter to Gerrit Achterberg (Brief aan Gerrit Achterberg)	Chailloux, Roger	\N	1965	Signed, titled, dated, and numbered. Published by Prent 190. Creases in upper part of image.	27 x 33"	"9/10"	991051120449706532	C093336664	\N	\N	300	2006	\N	2018-10-19	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	158
787	Rearrangement	Chatham, Doris	\N	1960	Signed, titled and numbered.	16 x 19"	"6/20"	991078627769706532	C103494920	\N	\N	500	\N	Originally a gift of Mrs. Audrey K. Salz to UAM	2019-08-30	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	160
99	Tsk-Tsk	Chavez Sanchez, Esteban	\N	1991	Signed and annotated "A/P."	\N	Artist's Proof	991051120489706532	C093336673	\N	255 Doe	600	2006	17504560	2012-09-06	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	162
100	Satellite	Childs, Bernard	https://en.wikipedia.org/wiki/Bernard_Childs	1963	Signed and annotated "épreuve d'artiste." Moisture stain, lower right.	17.5 x 20.5"	"7/10"	\N	c093336044	\N	NON-CIRC	1000	2006	17484911, b16390343	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	163
101	Mythological	Chiriaco, Margit	\N	1959	Signed, dated and titled.	21.5 x 27.5"	Artist's Proof	991051099709706532	c093336035	\N	\N	100	2006	\N	2017-10-12	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	164
1046	Untitled, Abstract Figure	Clemente, Francesco	https://en.wikipedia.org/wiki/Francesco_Clemente	1986	From the book "The Departure of the Argonaut" by Alberto Savinio.	28.5 x 37"	\N	991048828109706532	C103790376	\N	\N	\N	\N	\N	2019-02-10	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	169
537	Daisies in Purple Bottle	Cleveland, Walter	\N	1974	\N	15 x 18"	"31/200"	991053843469706532	c067068360	\N	\N	500	\N	\N	2020-02-16	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	170
104	Pink Flower in Bottle	Cleveland, Walter	\N	\N	Signed.	19.5 x 15.5"	"8/100"	991051099609706532	c093336026	\N	\N	100	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	171
105	Ruins of the Greater Palatine Hill	Cock, Hieronymus	https://en.wikipedia.org/wiki/Hieronymus_Cock	1561	Paper looks old; edition looks fine apart from vertical crease down center.	19 x 15"	\N	991051099519706532	c093335882	\N	\N	800	2006	17484887	2019-03-05	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	173
106	Head	Coen, Eleanor	https://en.wikipedia.org/wiki/Eleanor_Coen	1963	Signed.	28.5 x 23.5"	Artist's Proof	991051099379706532	c093335749	\N	\N	150	2006	\N	2019-09-08	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	174
108	Florentine Towers	Colescott, Warrington	https://en.wikipedia.org/wiki/Warrington_Colescott	1951	Matted to image.	21.5 x 27.5"	\N	991051353949706532	C093330244	\N	\N	700	2006	Gift of Dr. and Mrs. Erwin Rosenthal; 17752231	2019-09-04	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	175
107	Pursuit	Colescott, Warrington	https://en.wikipedia.org/wiki/Warrington_Colescott	1971	From the portfolio illustrating Thomas Mann's novel "Death in Venice." Edition of 122 plus 73 various proofs. Published by Aquarius Press, Baltimore. Lightstained.	23.5 x 17"	"119/122"	991051122779706532	c093336309	\N	\N	250	2006	\N	2019-08-30	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	177
1076	Underlaying Bark	Cole, Jennifer	https://www.jennifercoledesigns.com/	2017	With small chine college drypoint.	19.25 x 25u0094	\N	991054191449706532	C104987744	\N	\N	\N	\N	Purchased from the Art KALA 2020 Auction.	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	178
109	Cityscape	Conover, Robert	\N	1957	Published by the International Graphic Arts Society. Soft crease, upper margin.	12.75 x 16.25"	"87/200"	\N	C093330253	NON-CIRC	\N	1200	2006	17752234, b16398948	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	179
111	The Bearing of the Cross	Corinth, Lovis	https://en.wikipedia.org/wiki/Lovis_Corinth	1920-1922	Signed and numbered.	15 x 18.5"	"81/120"	991051099419706532	C103494452	\N	\N	950	2006	17484858	2019-09-02	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	181
889	C capital clown	Corita	https://en.wikipedia.org/wiki/Corita_Kent	1968	Signed. "68-69-32"	26.25 x 26.25"	\N	991079824119706532	C103531983	\N	\N	$1,400	\N	\N	2018-10-10	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	182
890	c is for clowns etc.	Corita	https://en.wikipedia.org/wiki/Corita_Kent	1968	Signed. "68-69-3"	26.25 x 20.5"	\N	991079824149706532	C103531877	\N	\N	$1,200	\N	\N	2020-01-27	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	183
110	Composition I	Coplans, John	https://en.wikipedia.org/wiki/John_Coplans	1958	Signed and numbered.	24 x 34"	"20/20"	991051122829706532	C104947384	\N	\N	600	2006	17507085	2019-09-09	2022-07-28 23:59:21.060879	2023-10-15 16:43:17.839124	f	180
892	H I carry your heart	Corita	https://en.wikipedia.org/wiki/Corita_Kent	1968	Signed. "68-69-38"	26.25 x 26.25"	\N	991079824219706532	C103531743	\N	\N	$1,400	\N	\N	2020-02-19	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	185
893	h is for my heart	Corita	https://en.wikipedia.org/wiki/Corita_Kent	1968	Signed. "68-69-8"	26.25 x 20.5"	\N	991079824269706532	C103531910	\N	\N	$600	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	186
894	I I am coming alive	Corita	https://en.wikipedia.org/wiki/Corita_Kent	1968	Signed. "68-69-39"	26.25 x 26.25"	\N	991079824329706532	C103531734	\N	\N	$900	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	187
895	j is for jesus	Corita	https://en.wikipedia.org/wiki/Corita_Kent	1968	Signed. "68-69-10"	26.25 x 20.5"	\N	991079824369706532	C103531929	\N	\N	$600	\N	\N	2019-10-08	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	188
896	k is for knight	Corita	https://en.wikipedia.org/wiki/Corita_Kent	1968	Signed. "68-69-11"	26.25 x 20.5"	\N	991079824409706532	C103531956	\N	\N	$600	\N	\N	2019-10-08	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	189
102	Skyforms	Christ-Janer, Albert	http://www.nga.gov/content/ngaweb/Collection/artist-info.3754.html	1972	Signed.	30.5 x 38.5"	"?/25"	991051350269706532	C103787761	\N	\N	350	2006	\N	2019-08-30	2022-07-28 23:59:21.060879	2023-08-21 22:23:19.118721	f	165
897	M however measured	Corita	https://en.wikipedia.org/wiki/Corita_Kent	1968	Signed. "68-69-43"	26.25 x 26.25"	\N	991079824429706532	C103531725	\N	\N	$1,400	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	190
898	m is for magick	Corita	https://en.wikipedia.org/wiki/Corita_Kent	1968	Signed. "68-69-13"	26.25 x 20.5"	\N	991079824449706532	C103531965	\N	\N	$1,200	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	191
899	n is for caution	Corita	https://en.wikipedia.org/wiki/Corita_Kent	1968	Signed. "68-69-14"	26.25 x 20.5"	\N	991079824489706532	C103532136	\N	\N	$1,200	\N	\N	2019-10-08	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	192
900	O is for god	Corita	https://en.wikipedia.org/wiki/Corita_Kent	1968	Signed. "68-69-15"	26.25 x 20.5"	\N	991079824509706532	C103532127	\N	\N	$720	\N	\N	2019-09-23	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	193
901	q is for cutie pie	Corita	https://en.wikipedia.org/wiki/Corita_Kent	1968	Signed. "68-69-17"	26.25 x 20.5"	\N	991079824529706532	C103531938	\N	\N	$600	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	194
902	r is for rabbit	Corita	https://en.wikipedia.org/wiki/Corita_Kent	1968	Signed. "68-69-18"	26.25 x 20.5"	\N	991079824549706532	C103531947	\N	\N	$900	\N	\N	2018-10-07	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	195
903	s is for saint	Corita	https://en.wikipedia.org/wiki/Corita_Kent	1968	Signed. "68-69-19"	26.25 x 20.5"	\N	991079824569706532	C103531974	\N	\N	$1,200	\N	\N	2019-09-23	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	196
904	S my favorite symbols	Corita	https://en.wikipedia.org/wiki/Corita_Kent	1968	Signed. "68-69-49"	26.25 x 26.25"	\N	991079824589706532	C103531752	\N	\N	$1,400	\N	\N	2019-09-11	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	197
905	u is for us	Corita	https://en.wikipedia.org/wiki/Corita_Kent	1968	Signed. "68-69-21"	26.25 x 20.5"	\N	991079824619706532	C103531886	\N	\N	$720	\N	\N	2020-01-27	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	198
906	v is for vibrations	Corita	https://en.wikipedia.org/wiki/Corita_Kent	1968	Signed. "68-69-22"	26.25 x 20.5"	\N	991079824629706532	C103531901	\N	\N	$600	\N	\N	2019-09-09	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	199
907	V very interesting	Corita	https://en.wikipedia.org/wiki/Corita_Kent	1968	Signed. "68-69-52"	26.25 x 26.25"	\N	991079824689706532	C103532118	\N	\N	$1,680	\N	\N	2019-10-02	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	200
908	w is for white stone	Corita	https://en.wikipedia.org/wiki/Corita_Kent	1968	Signed. "68-69-23"	26.25 x 20.5"	\N	991079824709706532	C103531895	\N	\N	$600	\N	\N	2019-09-10	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	201
909	X give a damn	Corita	https://en.wikipedia.org/wiki/Corita_Kent	1968	Signed. "68-69-54"	26.25 x 26.25"	\N	991079824729706532	C103531868	\N	\N	$1,080	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	202
122	Chataignes	D'Andlau, Helene	\N	1957	Signed and numbered.	19 x 26"	"102/200"	991053841529706532	C067068379	\N	\N	50	2006	\N	2018-09-18	2022-07-28 23:59:21.060879	2023-08-26 00:16:04.661368	f	218
114	Composition in White	Cuni, Jose Alfonso	\N	\N	Signed and numbered.	23.5 x 29"	"1/6"	991051122919706532	c093336503	\N	\N	100	2006	\N	2019-09-10	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	207
1015	Sather Gate, Berkeley	Cunningham, Marion O.	https://en.wikipedia.org/wiki/Marion_Osborn_Cunningham	1946	Signed and dated.	10.75 x 12.75"	\N	991041390769706532	C103789705	\N	\N	\N	\N	\N	2019-10-14	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	208
116	Composition with Blue and Orange	Curt, Rolf	https://fr.wikipedia.org/wiki/Rolf_Curt	1959	\N	23 x 34"	Artist's Proof	991051122949706532	c093336497	\N	\N	150	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	209
117	Landscape No. 2	Curt, Rolf	https://fr.wikipedia.org/wiki/Rolf_Curt	1959	\N	24 x 33.5"	Artist's Proof	991051122989706532	c093336488	\N	\N	150	2006	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	210
115	No. 177	Curt, Rolf	https://fr.wikipedia.org/wiki/Rolf_Curt	1957	Signed and numbered. Annotated "2 Plats --" in German.	27.5 x 35"	"3/30"	991051123029706532	c093336479	\N	\N	200	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	211
1139	Untitled (Composition)	Curt, Rolf	https://fr.wikipedia.org/wiki/Rolf_Curt	1959	Signed and dated.	21.5 x 28"	Artist's proof	991085987141106532	C103796015	\N	\N	\N	\N	\N	\N	2022-09-21 16:53:24.440146	2022-09-21 16:53:24.440146	f	212
1077	Art, the New Truth	Dadgar, Ali	http://wwww.alidadgar.com/home.html	2019	Acrylic paint on newspaper	18 x 22u0094	\N	991054191289706532	C104988058	\N	\N	\N	\N	Purchased from the Art KALA 2020 Auction.	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	213
118	Memento	Dalenoord, Jenny	https://en.wikipedia.org/wiki/Jenny_Dalenoord	1953	Signed and numbered. H28.	18 x 23"	"34/200"	991051099489706532	c093335776	\N	\N	175	2006	\N	2019-09-04	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	214
120	Composition with Pink and Green	Dalvit, Oskar	https://de.wikipedia.org/wiki/Oskar_Dalvit	1955	Signed. Provenance: Otto Stangl.	17 x 14"	Artist's Proof	991051097779706532	c093331099	\N	\N	250	2006	\N	2018-09-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	216
535	When the Coast Was Theirs	Daniells, Mark	\N	\N	\N	19 x 16"	"14/100"	991053843389706532	C103790871	\N	\N	500	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	219
119	Philodendron	Daley, Kenneth G.	\N	1966	Signed and numbered. Printed for the New York Graphic Arts Society.	23 x 30"	"110/210"	991051123069706532	C104974236	\N	\N	500	2006	\N	2019-09-15	2022-07-28 23:59:21.060879	2023-09-05 15:21:44.207558	f	215
121	Air Spaces	Damianovich, Zulema	\N	1958	Signed.	22 x 28"	Artist's Proof	991051097739706532	C104939663	\N	\N	100	2006	\N	2019-09-06	2022-07-28 23:59:21.060879	2023-09-05 22:06:21.317066	f	217
911	Y why worry	Corita	https://en.wikipedia.org/wiki/Corita_Kent	1968	Signed. "68-69-55"	26.25 x 26.25"	\N	991079824769706532	C104943324	\N	\N	$1,080	\N	\N	2018-09-20	2022-07-28 23:59:21.060879	2024-07-24 19:59:11.20551	f	204
125	The Lady who Devotes Herself to the Arts (La dame qui cultive les arts)	Daumier, Honore	https://en.wikipedia.org/wiki/Honor%C3%A9_Daumier	1846	D1175. Plate 87 from "Les Beaux Jours de la Vie." Handcolored.	18 x 14"	Plate 87	991051097709706532	c093330925	\N	\N	400	2006	Provenance: R.E. Lewis ($80).	2019-09-04	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	224
126	Ne l'effraye pas Eudoxie	Daumier, Honore	https://en.wikipedia.org/wiki/Honor%C3%A9_Daumier	1846	DR 1478. No. 2 from "Les Bons Bourgeois." Inscribed "Ne l'effraye pas Eudoxie...il va se poser...il prend mon nez pour une rose!"	27 x 21"	\N	991051123139706532	c093336682	\N	\N	400	2006	\N	2019-10-02	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	225
124	When one's portrait is exhibited at the salon (Quand on a son portrait au salon)	Daumier, Honore	https://en.wikipedia.org/wiki/Honor%C3%A9_Daumier	1845	D1146iii. Plate 59 from "Les Beaux Jours de la Vie." Handcolored.	12 x 17"	Plate 59	991051097639706532	c093331062	\N	\N	400	2006	Provenance: R.E. Lewis ($90).	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	226
127	Visit to the Tents of the Turks (Visite aux tentes des Turcos)	Daumier, Honore	https://en.wikipedia.org/wiki/Honor%C3%A9_Daumier	1871	Pinholes in left margin; moderate to severe foxing.	16.5 x 17"	\N	991051097669706532	c093331071	\N	\N	200	2006	\N	2017-10-10	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	227
128	Mother and Child	Davies, Arthur Bowen	https://en.wikipedia.org/wiki/Arthur_Bowen_Davies	1921	Signed.	14 x 15.5"	"?/25"	991051095039706532	c093330882	\N	\N	400	2006	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	228
914	Cycle Composition No. 5	Debenjak, Riko	https://sl.wikipedia.org/wiki/Riko_Debenjak	1965-66	Signed and numbered.	22 x 28"	65/66	991005931249706532	C103785781	\N	\N	\N	\N	\N	2019-10-23	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	229
917	Il cavaliere solitario	De Chirico, Giorgio	https://en.wikipedia.org/wiki/Giorgio_de_Chirico	1968	From the book: "Giorgio De Chirico," published by A. Marotta.	21 x 26"	\N	991007902439706532	C103785930	\N	\N	\N	\N	\N	2019-08-30	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	230
598	No. 2300	De Forest, Roy	https://en.wikipedia.org/wiki/Roy_De_Forest	1995	Signed and numbered X/XXV.	\N	"10/25"	\N	C093330271	NON-CIRC	255 Doe	1200	2006	b16398950	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	231
129	India Night	Dehn, Adolf	https://en.wikipedia.org/wiki/Adolf_Dehn	1961	Signed. Artist's proof.	23 x 27.5"	"?/40"	991051123189706532	C093336558	\N	\N	500	\N	\N	2020-02-21	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	232
130	Night	Dehn, Virginia	https://en.wikipedia.org/wiki/Virginia_Dehn	\N	Signed and numbered.	26.5 x 22"	"6/10"	991051123229706532	C093336691	\N	\N	150	2006	\N	2018-08-31	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	234
131	Composition	Delaunay-Terk, Sonia	https://en.wikipedia.org/wiki/Sonia_Delaunay	1970	Signed and numbered X/XXV.	\N	"10/25"	\N	C093330262	NON-CIRC	255 Doe	1400	2006	17752237, b16398949	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	235
132	Form	Delaunay-Terk, Sonia	https://en.wikipedia.org/wiki/Sonia_Delaunay	1965	Signed and numbered.	16 x 14"	"7/100"	\N	c093331026	NON-CIRC	\N	1200	2006	17476588, b16390162	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	236
134	Mother and Child with Cypress Tree	Denis, Maurice	https://en.wikipedia.org/wiki/Maurice_Denis	1897	C 103. Initialed in lower right corner. Published in Pan. Slight discoloration in left margin.	22 x 17"	\N	991051095129706532	c093331044	\N	\N	500	2006	\N	2019-09-24	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	238
136	Hornet's Nest	Deshaies, Arthur	http://americanart.si.edu/collections/search/artist/?id=1228	1956	Signed and numbered.	20 x 24"	"22/200"	991051095079706532	c093331035	\N	\N	300	2006	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	241
142	Almina	Dorny, Bertrand	https://fr.wikipedia.org/wiki/Bertrand_Dorny	\N	Signed and numbered.	28.5 x 22"	"30/40"	991051128109706532	c093336363	\N	\N	300	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	246
143	Evening Feast	Dos Santos, Bartolomeu	https://en.wikipedia.org/wiki/Bartolomeu_Cid_dos_Santos	1963	Signed and numbered.	31 x 34"	"32/50"	991051352769706532	c093330040	\N	\N	200	2006	\N	2019-02-09	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	250
545	Congratulations	Mitchell, Sharon Augusta	http://www.islandinternational.com/artist-sharon-augusta-mitchell.php	\N	Signed and numbered.	18 x 16"	"3/25"	991053845789706532	c067069036	\N	\N	500	\N	\N	2019-09-04	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	252
541	Composition in Yellow and Red	Krikorian, Leo	http://leokrikorian.com/	1993	\N	16.5 x 21.5"	"32/100"	991051327889706532	c093329363	\N	\N	500	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	253
531	Ginger Bread House	Unknown	\N	1989	Trial Proof	14 x 14"	\N	991053843179706532	c067068421	\N	\N	500	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	255
790	The Five Bathers (Les Cinq Baigneuses)	Dubreuil, Pierre	https://fr.wikipedia.org/wiki/Pierre_Dubreuil_(artiste)	1960	Signed and numbered.	19 x 23.5"	"50/200"	991078638819706532	C104971012	\N	\N	750	\N	\N	2019-08-30	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	257
146	Homme et mur	Dubuffet, Jean	https://en.wikipedia.org/wiki/Jean_Dubuffet	1950	Plate 7 from "Les Murs." Unsigned and annotated "74-432-12 c.s. $50" in pencil, no. 550.	22.5 x 19"	"92/172"	\N	C093330305	NON-CIRC	\N	2000	2006	17752245, b16398953	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	258
522	Hoba (Running Horses)	Nakayama, Tadashi	https://en.wikipedia.org/wiki/Tadashi_Nakayama_(artist)	1961	Signed and numbered.	14 x 40"	\N	991051349569706532	C103788002	\N	\N	500	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2023-09-05 14:35:33.800279	f	256
133	Bird	Demauro, Donald	\N	\N	Signed and numbered.	11 x 15"	"84/250"	991051094969706532	C104943412	\N	\N	125	\N	\N	2017-08-30	2022-07-28 23:59:21.060879	2024-08-14 19:40:13.436938	f	1093
123	Homage to Oriental Art: Cat	Das Gupta	\N	\N	Signed, titled, and numbered. First name not supplied. Inspired by "Cat Watching a Spider" by Oide Toko.	28.5 x 29.5"	"148/200"	991051123109706532	c093336442	\N	\N	100	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2024-09-04 01:04:55.080036	f	223
144	Impermanence	Dubuffet, Jean	https://en.wikipedia.org/wiki/Jean_Dubuffet	1959	Signed and numbered.	29 x 23"	"26/30"	991051229469706532	c093331886	\N	\N	400	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	259
145	Innervation	Dubuffet, Jean	https://en.wikipedia.org/wiki/Jean_Dubuffet	1959	Signed and inscribed "epreuve d'artiste."	29 x 23"	Artist's Proof	991051229439706532	c093331877	\N	\N	400	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	260
148	Two Girls of the Antilles (Deux Antillaises)	Dufy, Raoul	https://en.wikipedia.org/wiki/Raoul_Dufy	1930	Unsigned.	21 x 28"	\N	991051229489706532	c093331895	\N	\N	200	2006	\N	2019-08-29	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	261
149	Homage a Claude Debussy	Dufy, Raoul	https://en.wikipedia.org/wiki/Raoul_Dufy	1952	Unsigned.	23 x 25"	"133/145"	991051229549706532	C104970522	\N	\N	300	2006	\N	2019-08-29	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	262
147	Mozart	Dufy, Raoul	https://en.wikipedia.org/wiki/Raoul_Dufy	1970	Unsigned. From "Illumination Nouvelles."	17.5 x 24.5"	\N	991051229589706532	C104971845	\N	\N	300	2006	\N	2019-08-29	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	263
730	La Seine	Dunoyer de Segonzac, Andre	https://en.wikipedia.org/wiki/Andr%C3%A9_Dunoyer_de_Segonzac	1967	Print has crease through the middle.	23 x 31"	\N	\N	C094893354	NON-CIRC	\N	1000	\N	b18366053	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	264
150	Public Landing	Eckmair, Frank	http://brierhillgallery.com/eckmair-frank/	1965	Signed and numbered.	20 x 16"	"169/250"	991051094809706532	c093330998	\N	\N	150	2006	\N	2020-02-16	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	265
846	Untitled, Diving	Eder, Esther Garcia	http://esther-garcia-eder.com/	1991	Signed.	29.25 x 17"	"4/15"	991078982589706532	C103496353	\N	\N	750	\N	\N	2019-09-10	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	266
847	Untitled, Sunny	Eder, Esther Garcia	http://esther-garcia-eder.com/	1992	Signed and dated.	20.5 x 18.75"	\N	991078982729706532	C103495623	\N	\N	750	\N	\N	2019-08-29	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	267
151	Sisters (Schwestern)	Edzard, Dietz	https://de.wikipedia.org/wiki/Dietz_Edzard	1923	\N	19 x 14.5"	"15/52"	991051094769706532	c093330846	\N	\N	300	2006	\N	2019-01-03	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	268
154	Abstract Floating Landscape (Abstakte Flotzlandschaft)	Eglau, Otto	https://de.wikipedia.org/wiki/Otto_Eglau	1957	Signed and numbered.	21.5 x 27.5"	"6/30"	991051229659706532	c093331929	\N	\N	300	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	270
838	Rocky Landscape, Portugal	Eglau, Otto	https://de.wikipedia.org/wiki/Otto_Eglau	1959	Signed and numbered.	22 x 25.75"	"3/50"	991051229629706532	C103496362	\N	\N	300	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	271
153	Dune Landscape	Eglau, Otto	https://de.wikipedia.org/wiki/Otto_Eglau	1959	Signed and numbered.	20.5 x 27.5"	"6/20"	991078826889706532	c093331910	\N	\N	300	2006	\N	2019-09-05	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	272
156	Owl (Eule)	Ernst, Max	https://en.wikipedia.org/wiki/Max_Ernst	1955	Signed and numbered.	\N	"25/220"	\N	C093330855	NON-CIRC	Stored in box	1000	2006	b16390158	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	274
157	Line Drawing on Blue	Ernst, Max	https://en.wikipedia.org/wiki/Max_Ernst	\N	Signed and numbered.	18 x 13.5"	"19/51"	\N	c093331017	NON-CIRC	\N	1200	2006	b16390160	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	275
158	Rhythms	Ernst, Max	https://en.wikipedia.org/wiki/Max_Ernst	1949	\N	11 x 17.5''	"132/200"	\N	C093331008	NON-CIRC	Stored in box	1100	2006	17476574, b16390159	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	276
159	Composition, No. 27	Esteve, Maurice	https://en.wikipedia.org/wiki/Maurice_Est%C3%A8ve	\N	Signed and annotated "epreuve d'artiste."	\N	Artist's Proof	\N	C093330147	NON-CIRC	Stored in box	1800	2006	17752183, b16398937	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	277
714	Untitled	Esteve, Maurice	https://en.wikipedia.org/wiki/Maurice_Est%C3%A8ve	\N	\N	32.5 x 26"	"171/175"	\N	C094905153	NON-CIRC	255 Doe	1800	\N	b18362539	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	278
160	Abstraction	Faber, William J.	\N	1964	Signed and numbered. Annotated "proveta de artista." Slight foxing.	23 x 28"	"24/50"	991051234069706532	C104971711	\N	\N	250	2006	17630157	2019-09-23	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	279
161	Opaline	Fah, Vera	\N	\N	Signed and numbered.	23 x 27"	"10/99"	991051234119706532	c093332093	\N	\N	50	2006	\N	2020-01-13	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	280
1143	La Noche	Falco, Robert	https://robertfalcostudio.com/	2019	2-color screen print. Signed.	29.5 x 23"	\N	991085987133906532	C103795996	\N	\N	\N	\N	\N	\N	2022-09-21 16:53:24.463104	2022-09-21 16:53:24.463104	f	281
162	Croquis de Danse	Fantin-Latour, Henri	https://en.wikipedia.org/wiki/Henri_Fantin-Latour	1904	Unsigned. Lightstained.	18.25 x 16.25"	\N	991051094549706532	C093330730	\N	\N	500	2006	\N	2018-09-25	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	282
163	A Piece by Schumann (Un morceau de Schumann)	Fantin-Latour, Henri	https://en.wikipedia.org/wiki/Henri_Fantin-Latour	1864	Published by Cadart & Luquet (with their stamp).	19 x 15.5"	\N	991051094579706532	C093330606	\N	\N	800	2006	17476541	2018-09-01	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	283
164	Closing Up	Ferenbach, Hannah	\N	1971	Signed and numbered.	25 x 19"	"13/40"	991051234149706532	c093332039	\N	\N	100	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	284
165	Taormina	Fiorini, Marcel	https://it.wikipedia.org/wiki/Marcel_Fiorini	1965	Signed and numbered.	22 x 28"	"84/100"	991051234229706532	c093332011	\N	\N	500	2006	\N	2019-09-01	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	287
794	Crab	Flory, Arthur L.	http://www.nga.gov/content/ngaweb/Collection/artist-info.4109.html	1958	Signed, titled, dated and numbered.	19.5 x 25.5"	"17/200"	991078646819706532	C103494009	\N	\N	750	\N	\N	2019-09-03	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	289
174	From "One Cent Life"	Francis, Sam	https://en.wikipedia.org/wiki/Sam_Francis	1964	Signed. From a portfolio by 28 artists.	23 x 18"	Artist's Proof	\N	c093335341	NON-CIRC	\N	1500	2006	17474794, b16390129	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	298
176	Sardine Fishermen V	Frasconi, Antonio	https://en.wikipedia.org/wiki/Antonio_Frasconi	1955	Signed.	34 x 25"	Artist's Proof	991051234469706532	c093331974	\N	\N	900	2006	17630209	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	299
175	Duomo, Florence	Frasconi, Pablo	https://en.wikipedia.org/wiki/Antonio_Frasconi	1962	\N	16 x 19"	\N	991051093709706532	C104971687	\N	\N	200	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	300
173	The Clock and the Room (Uret och rummet)	Forsberg, Jan	\N	1962	Signed and numbered.	21 x 29"	"21/50"	991051094459706532	c093330721	\N	\N	400	2006	\N	2019-02-07	2022-07-28 23:59:21.060879	2024-09-04 19:06:44.172654	f	296
178	Flood in the Vendee	Frelaut, Jean	https://fr.wikipedia.org/wiki/Jean_Fr%C3%A9laut	1937	Signed and numbered.	16 x 18"	"5/40"	991051094409706532	c093330712	\N	\N	500	2006	\N	2019-10-12	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	303
913	Avril	Friedlaender, Johnny	https://en.wikipedia.org/wiki/Johnny_Friedlaender	1957	Signed and numbered.	22 x 28"	"9/90"	991005930379706532	C103787017	\N	\N	\N	\N	\N	2015-12-11	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	304
181	Poisson III: La Fleur Marine	Friedlaender, Johnny	https://en.wikipedia.org/wiki/Johnny_Friedlaender	1955	Signed and inscribed "epreuve d'artiste."	21.5 x 27.5"	Artist's Proof	991051234549706532	C093331992	\N	\N	800	2006	17474796	2019-09-10	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	306
179	Composition, Tower	Friedlaender, Johnny	https://en.wikipedia.org/wiki/Johnny_Friedlaender	\N	Signed and numbered.	22 x 28"	"15/100"	991051093789706532	C093335493	\N	\N	800	2006	17630212	2012-08-20	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	307
180	Evening in October (Crepuscule d'Octobre)	Friedlaender, Johnny	https://en.wikipedia.org/wiki/Johnny_Friedlaender	1959	\N	27 x 25"	"66/95"	\N	C093332525	NON-CIRC	\N	1100	2006	17744829, b16196901	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	308
182	Herring Gull	Frink, Elisabeth	https://en.wikipedia.org/wiki/Elisabeth_Frink	1974	Signed and numbered.	24.75 x 18.5"	"16/150"	\N	\N	NON-CIRC	\N	2200	2006	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	309
183	Pigeons	Frink, Elisabeth	https://en.wikipedia.org/wiki/Elisabeth_Frink	1967	Signed and numbered.	22.5 x 30.75"	"19/50"	\N	c093329886	NON-CIRC	\N	1600	2006	17750578, b16398837	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	310
915	Blue Doors	Fukazawa, Yukio	\N	1966	\N	22 x 31''	"3/30"	991005668359706532	C103788826	\N	\N	\N	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	311
552	The Dance	Garberina, Angie	http://www.home.earthlink.net/~agarberina/about.html	2003	\N	20 x 16"	"2/4"	991053846049706532	c067068892	\N	\N	500	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	313
796	Maguey de la Vida	Garcia, Rupert	http://americanart.si.edu/collections/search/artist/?id=1732	1974	Signed, titled and annotated, "A/P."	27.5 x 32.5"	Artist's proof	991078640499706532	C104971021	\N	\N	750	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	314
867	No. 13	Gellee, Claude (Lorrain, Claude)	https://en.wikipedia.org/wiki/Claude_Lorrain	1774	Published by John Boydell, Engraver in Cheapside. From the original drawing in the collection of the Duke of Devonshire. In lower right, "R. Earlom fecit."	16.5 x 18.5"	\N	991079228099706532	C103495915	\N	\N	250	\N	\N	2019-09-05	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	315
868	No. 36	Gellee, Claude (Lorrain, Claude)	https://en.wikipedia.org/wiki/Claude_Lorrain	1774	Published by John Boydell, Engraver in Cheapside. From the original drawing in the collection of the Duke of Devonshire. In lower right, "R. Earlom fecit."	16.5 x 18.5"	\N	991079228369706532	C103496052	\N	\N	250	\N	\N	2020-03-08	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	316
607	Shepherd and Shepherdess Conversing (Berger et Bergere conversant)	Gellee, Claude (Lorrain, Claude)	https://en.wikipedia.org/wiki/Claude_Lorrain	1651	Manocci 41, state iv-vii. Matted over or just to image. Artist is also known as Claude le Lorrain.	15 x 17.5"	\N	\N	C103494850	NON-CIRC	255 Doe	1200	2006	b16390077	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	317
1103	Ancient Bristlecone Pines, Study 19	Gerlach, Adam	https://www.adamgerlach.com/	2019	Hand-signed by artist. From the series "Traces of Light."	19 x 23"	\N	991056572969706532	\N	\N	\N	\N	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	318
185	Composition	Germain, Jacques	\N	1958	Signed and numbered.	20 x 22.5"	"36/70"	991051092129706532	c093335527	\N	\N	250	2006	\N	2019-08-31	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	319
764	Untitled II	Gersh, Adam	http://www.gershgoroth.com/hire-us/	2010	Signed.	23.5 x 17.5"	\N	991078598509706532	C104970577	\N	\N	500	\N	\N	2019-11-11	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	322
887	Untitled, Portrait of a Man	Giacometti, Alberto	https://en.wikipedia.org/wiki/Alberto_Giacometti	1961	Unsigned. From the journal "Derriere le Miroir" #127	17 x 21"	\N	991079581919706532	C103532020	\N	\N	750	\N	\N	2017-11-30	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	324
886	Untitled, Portrait of a Man in Glasses	Giacometti, Alberto	https://en.wikipedia.org/wiki/Alberto_Giacometti	1961	Unsigned. From the journal "Derriere le Miroir" #127	17 x 21"	\N	991079581869706532	C103532011	\N	\N	750	\N	b18507950	2019-09-10	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	325
888	Untitled, Sitting Nude Woman	Giacometti, Alberto	https://en.wikipedia.org/wiki/Alberto_Giacometti	1961	Unsigned. From the journal "Derriere le Miroir" #127	17 x 21"	\N	991079581939706532	C103532002	\N	\N	750	\N	b18507957	2018-08-20	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	326
1104	wrapped : her symmetrical circle of wonder	Foster, Barbara	https://www.barbarafoster.art/	2020	Woodcut on giclée photograph. Signed by the artist.	23 x 18"	"1/7"	991056573109706532	C104988252	\N	\N	\N	\N	\N	\N	2022-07-28 23:59:21.060879	2023-08-26 00:24:30.073948	f	297
740	Dusk	Gibbons, Alice	https://www.artspan.org/artist/alicegibbons	1973	Signed, titled, and numbered.	17 x 11"	"12/30"	991078567329706532	C094893512	\N	\N	500	\N	\N	2019-09-19	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	327
739	Embarcadero Center	Gibbons, Alice	https://www.artspan.org/artist/alicegibbons	2004	Signed, titled and numbered. Printed in Graphic Arts Workshop in San Francisco, CA.	22.5 x 13"	"2/50"	991078567269706532	C094893655	\N	\N	500	\N	\N	2019-08-27	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	328
738	Embarcadero Upwards	Gibbons, Alice	https://www.artspan.org/artist/alicegibbons	2004	Signed, titled and numbered. Printed in Graphic Arts Workshop in San Francisco, CA.	17 x 15.25"	"4/50"	991078567179706532	C094893372	\N	\N	500	\N	\N	2018-08-29	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	329
741	Golden Gate Bridge from Fort Point	Gibbons, Alice	https://www.artspan.org/artist/alicegibbons	1978	Signed, titled and numbered. Printed in Graphic Arts Workshop in San Francisco, CA.	19 x 17"	"25/100"	991078567459706532	C104971766	\N	\N	500	\N	\N	2017-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	331
186	Lutece	Giraldon, Adolphe	https://fr.wikipedia.org/wiki/Adolphe_Giraldon	1898	Initialed in the plate at bottom right.	13.5 x 21"	\N	991051092169706532	c093335411	\N	\N	200	2006	\N	2019-09-05	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	334
1071	Les Ecuries d'Augias (The Augean Stables)	Gisiger, Hansjorg	https://www.moma.org/artists/69920	1955	Signed, titled, and numbered.	31.5 x 23"	XX/4	991054190799706532	C104987887	\N	\N	\N	\N	Gift of Lois Friedberg-Dobry	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	335
187	Fish Platter	Goldyne, Joseph	http://americanart.si.edu/exhibitions/online/monotypes/goldynebio.html	1982	Signed and numbered. Editon of 25 plus 9 proofs. Garver 79. Printed by David Kelso, made in California.	25 x 17"	"11/25"	\N	c093335387	NON-CIRC	\N	1600	2006	17453960, b16390074	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	336
188	Plate V	Gollifer, Sue	http://arts.brighton.ac.uk/staff/sue-gollifer	1969	Signed and numbered.	29 x 26"	"53/75"	991051234589706532	c093332002	\N	\N	300	2006	\N	2018-08-21	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	337
190	Naub	Gonzalez-Tornero, Sergio	http://www.moma.org/collection/artists/2232?locale=en	1964	Signed and inscribed "Epreuve d'essai."	28.5 x 25"	Artist's Proof	991051234639706532	c093332233	\N	\N	150	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	338
189	A Tree	Gonzalez-Tornero, Sergio	http://www.moma.org/collection/artists/2232?locale=en	1964	Signed and numbered.	32 x 31.5"	"51/100"	991051350089706532	c093329877	\N	\N	150	2006	\N	2019-09-12	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	339
192	Girl with Gymnasium Friend	Gorey, Edward	https://en.wikipedia.org/wiki/Edward_Gorey	1975	Signed and numbered.	13 x 15"	"95/120"	991051092049706532	c093335590	\N	\N	900	2006	17453959	2020-01-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	340
191	Insect on a Unicycle	Gorey, Edward	https://en.wikipedia.org/wiki/Edward_Gorey	1975	Signed and numbered.	13 x 17"	"35/120"	991051092019706532	c093335457	\N	\N	900	2006	17453958	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	341
193	Lady on Yacht Deck ("Caviglia cruised the Adriatic...")	Gorey, Edward	https://en.wikipedia.org/wiki/Edward_Gorey	1975	Signed and numbered. From his book "The Blue Aspic," originally published in 1968.	13 x 12"	"103/125"	991051091889706532	c093335305	\N	\N	900	2006	17453547	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	342
532	Tobias Carrying the Fish (after Elsheimer)	Goudt, Hendrick	https://en.wikipedia.org/wiki/Hendrick_Goudt	1613	Artist's name inscribed in the plate.	17 x 17"	\N	991053843209706532	c067069328	\N	\N	500	\N	Gift of the Class of 1961 in honor of Dr. and Mrs. Gordon Sproul	2019-09-10	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	343
1067	¿Si sabra más el discípulo? (Might not the pupil know more?)	Goya y Lucientes, Francisco Jose de	https://en.wikipedia.org/wiki/Francisco_Goya	\N	No. 37 from the series "Los Caprichos."	15 x 19"	\N	991051213219706532	\N	\N	\N	\N	\N	Gift of Nancy Jaffe	2019-08-29	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	345
1066	El sí pronuncian y la mano alargan al primero que llega (They say yes and give their hand to the first comer)	Goya y Lucientes, Francisco Jose de	https://en.wikipedia.org/wiki/Francisco_Goya	\N	No. 2 from the series "Los Caprichos."	15 x 19"	\N	991051213089706532	\N	\N	\N	\N	\N	Gift of Nancy Jaffe	2019-08-29	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	346
1068	Se repulen (They spruce themselves up)	Goya y Lucientes, Francisco Jose de	https://en.wikipedia.org/wiki/Francisco_Goya	\N	No. 51 from the series "Los Caprichos."	15 x 19"	\N	991051213239706532	\N	\N	\N	\N	\N	Gift of Nancy Jaffe	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	347
196	Lidru	Graeff, Werner	https://de.wikipedia.org/wiki/Werner_Graeff	1963	\N	28 x 26"	"60/100"	991051234669706532	c093332224	\N	Graduate Services Dissertation Room	400	2006	\N	2019-10-30	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	348
195	Ligriklo	Graeff, Werner	https://de.wikipedia.org/wiki/Werner_Graeff	1964	\N	23 x 30"	"31/90"	991051234719706532	c093332215	\N	Graduate Services Dissertation Room	400	2006	\N	2019-02-05	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	349
197	Ascending Forms	Graham, Elwood	\N	\N	Signed. Lightstained. Watercolor.	13 x 32''	Artist's Proof	991051246789706532	c093333592	\N	\N	500	2006	Gift of Mrs. Ansley K. Salz	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	350
198	House of the Lord	Grant, Alistair	\N	\N	Signed and numbered.	24 x 19"	"31/50"	991051091929706532	c093335314	\N	\N	150	2006	\N	2019-08-29	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	351
200	Van Gogh	Greaves, Derrick	http://www.derrickgreaves.com/	1968-1969	Signed and numbered.	26 x 24"	"19/30"	991051246809706532	c093333608	\N	\N	275	2006	\N	2019-08-31	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	353
203	Anemones	Greenfield, Graham	http://artuk.org/discover/artists/greenfield-graham-b-1951	1977	Signed and numbered.	21 x 16"	"131/150"	991051091829706532	C104972043	\N	\N	100	2006	\N	2019-08-29	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	354
201	Blue Land Figure	Green, Peter	\N	1968	Signed and numbered.	26 x 28.5"	"72/100"	991051246859706532	c093333732	\N	\N	150	2006	\N	2019-08-29	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	355
205	Swing Low Sweet Chariot	Gropper, William	https://en.wikipedia.org/wiki/William_Gropper	1940	Signed. Published by Associated American Artists, New York.	16.5 x 20.5"	"?/250	991051091859706532	c093335299	\N	\N	200	2006	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	357
204	Hassidim	Gropper, William	https://en.wikipedia.org/wiki/William_Gropper	1965	Signed and numbered. From the portfolio "Twelve Etchings."	21 x 24.5"	"4/100"	991051091969706532	c093335402	\N	\N	200	2006	\N	2018-09-26	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	358
207	Grezels - Vineyards (Les Vignes)	Gross, Anthony	https://en.wikipedia.org/wiki/Anthony_Gross	1964	\N	23 x 27"	"9/50"	991051246899706532	c093333617	\N	\N	500	2006	\N	2019-09-11	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	359
206	Rounded Hills (Les Mamelons)	Gross, Anthony	https://en.wikipedia.org/wiki/Anthony_Gross	1962	Signed and numbered.	23 x 28"	"20/50"	991051246969706532	c093332750	\N	\N	500	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	360
835	In Memory of Thomas Rowlandson (Thomas Rowlandson zum Andenken)	Grosz, George	https://en.wikipedia.org/wiki/George_Grosz	1920	\N	13.25 x 15.75"	\N	991078776419706532	C103532279	\N	\N	750	\N	\N	2019-09-15	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	361
208	Card Players (Kartenspieler)	Grosz, George	https://en.wikipedia.org/wiki/George_Grosz	1958	Signed. Plate 58 from Ecce Homo, 1916-1921. DSI 58.	19.5 x 16"	Artist's Proof	991051090869706532	c093335217	\N	\N	900	2006	17373196	2020-01-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	362
799	Portuguese Women	Gut, Jean-Jacques	\N	1959	Signed and numbered.	20 x 25.5"	"95/200"	991078647789706532	C104970814	\N	\N	500	\N	\N	2019-09-22	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	363
1140	Remnant	Gui, Emily	http://emilygui.com/	2022	\N	26.25 x 22.5"	\N	991085985042206532	C103796219	\N	\N	\N	\N	\N	\N	2022-09-21 16:53:24.446207	2022-09-21 16:53:24.446207	f	364
1074	Untitled, Chairs	Gui, Emily	http://emilygui.com/	2019	\N	20.5 x 24u0094	\N	991054191319706532	C104987896	\N	\N	\N	\N	Purchased from the Art KALA 2020 Auction.	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	365
210	Kind of Chairs	Gustafson, Glenn	\N	1984	Signed and inscribed "A/P."	23 x 22"	Artist's Proof	991051090919706532	c093335226	\N	\N	100	2006	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	367
832	Feuille No. 2	Haass, Terry	https://de.wikipedia.org/wiki/Terry_Haass	1960	Signed, titled and numbered.	21.25 x 17.25"	"99/200"	991078768639706532	C103495757	\N	\N	500	\N	\N	2018-08-22	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	368
833	Oil Well 120	Haass, Terry	https://de.wikipedia.org/wiki/Terry_Haass	1958	Signed, titled and numbered.	17.75 x 21.25"	"69/200"	991078768669706532	C103495173	\N	\N	500	\N	\N	2017-09-01	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	369
211	Division in Space (Teilung im Raum)	Haase, Volkmar	\N	1958	Signed and annotated "Probedruck" (trial print). Small crease or tear in lower left corner.	28 x 21.5"	Artist's Proof	991051090959706532	c093335235	\N	\N	175	2006	\N	2017-08-30	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	370
212	Battersea Reach	Haden, Sir Francis Seymour	https://en.wikipedia.org/wiki/Francis_Seymour_Haden	1863	Unsigned. Schneiderman 48; from the series "Etudes à l'Eau-forte." Annotated "Out of Whistler's window" in plate.	14 x 17"	\N	991051090999706532	c093335244	\N	\N	500	2006	\N	2019-09-22	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	371
213	Necklace on the Heavens	Hagiwara, Hideo	https://en.wikipedia.org/wiki/Hideo_Hagiwara	1963	Signed and numbered.	25 x 16"	"4/30"	991051091029706532	c093335396	\N	\N	950	2006	17373201	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	373
214	Elm	Harding, James Duffield	https://en.wikipedia.org/wiki/James_Duffield_Harding	1841	From the series "The Park and the Forest," published by McLean. Signed with initials in the stone.	26 x 24"	\N	991051091059706532	c093335253	\N	\N	400	2006	\N	2019-09-05	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	374
503	Composition in Blue and Yellow	Harnest, Fritz	https://de.wikipedia.org/wiki/Fritz_Harnest	1959	Signed and numbered. From the portfolio "Acht Holzschnitte."	19.5 x 15"	"2/313"	991051090709706532	C093335174	\N	\N	500	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	375
202	Sea Wood Form	Green, Peter	\N	1966	Signed and numbered. Water stain, lower right margin; ink adhesion to glass with small patch pulled off.	40 x 31"	"7/20"	991051350049706532	C093329868	DAMAGED	\N	150	2006	17750571	2012-10-22	2022-07-28 23:59:21.060879	2024-08-14 21:09:02.277048	t	356
555	Amor	Harris, Deborah	http://www.deborah-harris.com/	2005	Initialed and numbered.	13.5 x 16.5"	"7/8"	991051327419706532	c093329345	\N	\N	500	\N	\N	2019-08-29	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	377
554	Botanical I	Harris, Deborah	http://www.deborah-harris.com/	\N	Signed and numbered.	19.5 x 23.5"	"2/10"	991051327239706532	c093329196	\N	\N	500	\N	\N	2019-09-09	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	378
556	Carnations	Harris, Deborah	http://www.deborah-harris.com/	\N	Signed and numbered.	19.5 x 23.5"	"2/16"	991051327199706532	c093329053	\N	\N	500	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	379
737	Little Dahlias	Harris, Deborah	http://www.deborah-harris.com/	2006	Initialed, dated and numbered.	14.5 x 16.5"	"5/5"	991078560299706532	C094893239	\N	\N	500	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	381
546	Lovers	Harris, Deborah	http://www.deborah-harris.com/	\N	\N	15 x 19"	\N	991053845839706532	c067068883	\N	\N	500	\N	\N	2019-09-09	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	382
216	Regal Insert	Harrison, Michael	http://www.mikeharrisonart.com/untitled4.html	1969	Signed and numbered.	32 x 29"	"36/50"	991051247119706532	c093333769	\N	\N	200	2006	\N	2019-10-14	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	383
209	Duomo	Gunther, Max	\N	1963	Signed and numbered. Original Associated American Artists label on back of frame.	23 x 28"	"32/100"	991051246929706532	C104947366	\N	\N	250	2006	\N	2019-09-09	2022-07-28 23:59:21.060879	2023-09-05 15:27:49.834108	f	366
557	Striped Bowl	Harris, Deborah	http://www.deborah-harris.com/	\N	Signed and numbered.	19.5 x 23.5"	"2/10"	991051327159706532	c093328916	\N	\N	500	\N	\N	2019-09-05	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	384
553	Te Amo	Harris, Deborah	http://www.deborah-harris.com/	2005	Initialed and numbered.	13.5 x 16.5"	"4/8"	991051327459706532	c093328934	\N	\N	500	\N	\N	2019-09-09	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	385
218	Pallas Athena	Hartigan, Grace	https://en.wikipedia.org/wiki/Grace_Hartigan	1961	Signed and numbered. S5.	20.75 x 14.25"	"22/30"	\N	C104970629	NON-CIRC	255 Doe	1800	2006	17744824, b16196897	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	386
805	Untitled, Color Composition	Hartigan, Grace	https://en.wikipedia.org/wiki/Grace_Hartigan	1953	Screenprint from "Folder" magazine with three screenprints. Initialed "G.H." Printed by Tiber Press, New York.	14 x 16"	"?/500"	991078654439706532	C104970470	\N	\N	500	\N	\N	2019-08-29	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	387
217	Jersey Hills	Hart, George Overbury ("Pop")	https://en.wikipedia.org/wiki/Pop_Hart	1923	Signed.	19 x 14''	Artist's Proof	991051090759706532	c093335183	\N	\N	400	2006	\N	2020-02-19	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	388
951	Bunny Shark	Hauser, Sarah	http://sarahhauserart.com/	2003	\N	\N	"6/35"	991036394429706532	C104974519	\N	\N	\N	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	393
622	Danae	Hayter, Stanley William	https://en.wikipedia.org/wiki/Stanley_William_Hayter	1954	BM 213. Signed and numbered. Some wrinkling from moisture. Provenance: Otto Stagl.	16 x 12"	"57/95"	\N	C093335022	NON-CIRC	\N	1800	2006	b16196899	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	394
623	La Noyee	Hayter, Stanley William	https://en.wikipedia.org/wiki/Stanley_William_Hayter	1955	BM 222. Signed and numbered.	14.25 x 19"	"77/175"	\N	C093335013	NON-CIRC	\N	1400	2006	b16196898	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	395
221	To Be or Not to Be, That is the Question	Heath, Henry	\N	1827	Published by SW Fores.	16 x 19.5"	\N	991051090839706532	C093335208	\N	\N	200	2006	\N	2019-09-04	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	397
223	Sick Girl (Krankes Madchen)	Heckel, Erich	https://en.wikipedia.org/wiki/Erich_Heckel	1913	Signed. Dube 266B; looks like good impression; may be dated.	15 x 12"	Artist's Proof	\N	c093332701	NON-CIRC	\N	1100	2006	17750209, b16398749	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	398
1122	Manual Labor	Hernandez, Hector	https://hectoromarhernandez.com/	2008	Copperplate mezzotint. Edition of 13.	24 x 12"	"8/13"	991085987141206532	C103792286	\N	\N	\N	\N	\N	\N	2022-09-21 16:53:24.326958	2022-09-21 16:53:24.326958	f	399
1123	Untitled (Skull)	Hernandez, Hector	https://hectoromarhernandez.com/	2008	Zinc aquatint mezzotint. Edition of 13.	23 x 31.5"	\N	991085987134306532	C103792295	\N	\N	\N	\N	\N	\N	2022-09-21 16:53:24.336111	2022-09-21 16:53:24.336111	f	400
1121	Yin Yang 69	Hernandez, Hector	https://hectoromarhernandez.com/	2011	Copperplate mezzotint. Edition of 5.	14.5 x 11"	A/P	991085987141306532	C103791884	\N	\N	\N	\N	\N	\N	2022-09-21 16:53:24.287519	2022-09-21 16:53:24.287519	f	401
506	Three Pears	Hickey, Patrick	https://en.wikipedia.org/wiki/Patrick_Hickey_(artist)	\N	Signed and numbered.	20 x 23"	"12/30"	991051090319706532	C093335077	\N	\N	500	\N	\N	2019-09-02	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	402
1016	Leeks and Snails	Hickey, Patrick	https://en.wikipedia.org/wiki/Patrick_Hickey_(artist)	\N	Signed and numbered.	25 x 19.5"	"2/30"	991040528589706532	C104939441	\N	\N	\N	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	403
224	Still Life in Blue	Hickey, Patrick	https://en.wikipedia.org/wiki/Patrick_Hickey_(artist)	1964	Signed and numbered.	20.5 x 26"	"10/75"	\N	c093335086	NON-CIRC	\N	1200	2006	17373164, b16390018	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	404
225	Flight into Egypt	Higgins, Eugene	http://americanart.si.edu/collections/search/artist/?id=2211	1915	Signed lower left. Trimmed to the image; crease in the image, upper left.	\N	"11/96"	\N	c093335129	NON-CIRC	Stored in box	1400	2006	17373177, b16390022	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	406
226	Fireworks at Ryogoku Bridge	Ando, Hiroshige (Utagawa, Hiroshige)	https://en.wikipedia.org/wiki/Hiroshige	1847-1848	From the series "Edo Meisho" ("Famous Places in Edo"). Artist was a student of the Utagawa School.	14.5 x 19.25"	\N	991051090429706532	C103494443	\N	\N	650	2006	\N	2020-02-16	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	407
228	Bouquet	Hnizdovsky, Jacques	https://en.wikipedia.org/wiki/Jacques_Hnizdovsky	1964	Signed and numbered. Paper wrinkled all over.	24 x 26"	"118/150"	991051247349706532	c093333635	\N	\N	300	2006	\N	2019-08-29	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	409
229	Edge of the Forest	Hoff, Margo	http://www.chicagomodern.org/artists/margo_hoff/	1956	Signed and numbered.	26 x 28"	"105/200"	991051247389706532	c093333918	\N	\N	250	2006	\N	2018-08-20	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	410
230	The Distressed Poet	Hogarth, William	https://en.wikipedia.org/wiki/William_Hogarth	1736	Signed on the plate. Torn and reattached corners, some discoloration.	21 x 27"	\N	991051247829706532	c093333909	\N	\N	400	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	411
231	Ura Fuji (The Other Side of Fuji)	Hokusai, Katsushika	https://en.wikipedia.org/wiki/Hokusai	1834	A spread taken from the book "Fugaku Hyakkei" ("One Hundred Views of Mount Fuji").	13 x 15"	\N	991051090549706532	c093335138	\N	\N	150	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	412
504	Masked Ball II (Bal Masque II)	Hasegawa, Shoichi	https://www.annexgalleries.com/artists/biography/3897/Hasegawa/Shoichi	1965	\N	24 x 28''	"24/30"	991051247209706532	C093333778	\N	\N	500	\N	\N	2019-09-27	2022-07-28 23:59:21.060879	2023-08-26 00:30:07.0954	f	392
233	Boy in Boat	Holston, Joseph	http://www.holstonart.com/art/	1989	\N	13.5 x 13"	\N	991051082699706532	c087370662	\N	\N	100	2006	\N	2018-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	414
232	Stripes	Holmes, Reginald	https://www.galeriecazeault.com/reginald-holmes.php	1969	Signed and numbered.	26.5 x 35"	"89/98"	991051247899706532	c093333884	\N	\N	500	2006	\N	2019-08-30	2022-07-28 23:59:21.060879	2023-08-26 00:33:27.914502	f	413
507	Young Fisherman	Holston, Joseph	http://www.holstonart.com/art/	1989	\N	19 x 14"	\N	991051082729706532	C087370796	\N	\N	500	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	415
235	Similar	Honegger, Gottfried	https://en.wikipedia.org/wiki/Gottfried_Honegger	1960	Signed and numbered.	30.5 x 36.25"	"2/45"	991051350009706532	C103494595	\N	Graduate Services Dissertation Room	500	2006	\N	2019-01-16	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	416
234	Forest Fruit (Waldfrucht)	Honegger, Gottfried	https://en.wikipedia.org/wiki/Gottfried_Honegger	1955	Signed.	27.5 x 21.5"	Artist's Proof	991051082819706532	c087370732	\N	\N	500	2006	\N	2019-08-29	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	417
782	Thirty-Eight Double-Dee	Howard, Mildred	https://en.wikipedia.org/wiki/Mildred_Howard	1995	Signed and numbered. From the portfolio: "10 x 10 Ten Women Ten Prints."	29 x 29"	"40/75"	991051247869706532	C104970780	\N	\N	500	\N	\N	2019-10-01	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	419
508	Surreal Couple	Hundertwasser, Friedrich	https://en.wikipedia.org/wiki/Friedensreich_Hundertwasser	1967	Signature printed in the plate. From the illustrated book "PAROLES PEINTES III" ("PAINTED WORDS III"). Numbered 633.	21 x 17"	\N	991051090639706532	C093335156	\N	\N	500	\N	17373184	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	420
236	The Death of Art	Hunter, John H.	https://www.nortonsimon.org/collections/browse_artist.php?name=Hunter%2C+John&resultnum=7	1978	Signed and numbered.	16 x 12"	"3/50"	991051090589706532	c093335147	\N	\N	200	2006	\N	2020-02-01	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	421
237	Self-Portrait Among Art Historians	Hunter, John H.	https://www.nortonsimon.org/collections/browse_artist.php?name=Hunter%2C+John&resultnum=7	1978	Signed and numbered.	14.5 x 13"	"11/50"	991051090399706532	c093335095	\N	\N	200	2006	\N	2019-09-09	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	422
1128	Intaglio Test Print	Hussong, Randy	https://www.randyhussong.com/	2012	Design inspired by early television test patterns. Developed as a teaching aid for printmaking classes.	31 x 25"	\N	991085987135206532	C103796158	\N	\N	\N	\N	\N	\N	2022-09-21 16:53:24.371885	2022-09-21 16:53:24.371885	f	423
1129	Lithography Test Print	Hussong, Randy	https://www.randyhussong.com/	2013	Design inspired by early television test patterns. Developed as a teaching aid for printmaking classes.	31 x 25"	\N	991085987135106532	C103796291	\N	\N	\N	\N	\N	\N	2022-09-21 16:53:24.378314	2022-09-21 16:53:24.378314	f	424
1130	Relief Test Print	Hussong, Randy	https://www.randyhussong.com/	2017	Design inspired by early television test patterns. Developed as a teaching aid for printmaking classes.	31 x 25"	\N	991085987134806532	C103796176	\N	\N	\N	\N	\N	\N	2022-09-21 16:53:24.384657	2022-09-21 16:53:24.384657	f	425
1127	Screen Test Print	Hussong, Randy	https://www.randyhussong.com/	2011	Design inspired by early television test patterns. Developed as a teaching aid for printmaking classes.	31 x 25"	\N	991085987140406532	C103795987	\N	\N	\N	\N	\N	\N	2022-09-21 16:53:24.364963	2022-09-21 16:53:24.364963	f	426
238	The Animal Kingdom	Ihle, John	http://www.nga.gov/content/ngaweb/Collection/artist-info.4414.html	1957	Signed and numbered. North Dakota 1; Achenbach exhibition 20 (1962). Published by International Graphic Arts Society.	21 x 26.5"	"91/200"	991051082769706532	c087370802	\N	\N	500	2006	\N	2019-10-10	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	427
720	Monogatari	Ikegawa, Shiro	\N	\N	Signed and numbered.	21.5 x 20"	"16/50"	\N	C094905436	NON-CIRC	\N	1000	\N	b18363170	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	430
1018	Sakana-No-Mita-Yume II	Ikegawa, Shiro	\N	1973	Signed and numbered.	32 x 24"	"4/75"	991040531529706532	C104939502	\N	\N	\N	\N	Gift of Ellen Meltzer and Jane Fowler in memory of Marilyn and Phillip Meltzer.	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	431
1021	Sakana-No-Mita-Yume I	Ikegawa, Shiro	\N	1973	Signed and numbered. Framed in a plexiglass box.	30 x 22"	"4/75"	991041870109706532	C104947904	\N	\N	\N	\N	Gift of Ellen Meltzer and Jane Fowler in memory of Marilyn and Phillip Meltzer.	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	432
613	Girl Sitting in Garden	Inshaw, David	https://en.wikipedia.org/wiki/David_Inshaw	1975	Signed and numbered.	23.25 x 30"	"58/85"	\N	C093334967	NON-CIRC	\N	1200	2006	b16196882	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	433
240	Church of St. John in Thiers (Eglise Saint-Jean, Thiers)	Isabey, Eugene	https://en.wikipedia.org/wiki/Eug%C3%A8ne_Isabey	1831	From the series of prints made for the 'Auvergne' chapter of the book "Voyages pittoresques et romantiques dans l'ancienne France."	20 x 22.5"	\N	991051082659706532	c087370644	\N	\N	600	2006	\N	2019-08-30	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	434
614	Gnolis's Glove (Gnolis Handschuh)	Jager, Bernhard	https://de.wikipedia.org/wiki/Bernhard_J%C3%A4ger	1971	Signed and numbered. Edition of 100.	31.5 x 24.5"	"15/45 II"	991051349739706532	C103494577	\N	\N	200	2006	\N	2018-09-27	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	435
241	Munchen	Jager, Bernhard	https://de.wikipedia.org/wiki/Bernhard_J%C3%A4ger	1970	Unsigned.	28.5 x 21"	\N	991051247989706532	c093333723	\N	\N	200	2006	\N	2019-09-10	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	436
509	Castings	Johnson, Ben	https://en.wikipedia.org/wiki/Ben_Johnson_(artist)	1975	\N	36 x 28.5"	\N	991051282509706532	C093333079	\N	\N	500	\N	\N	2019-09-09	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	438
243	Monkey Series II	Johnson, Woodrow ("Woody")	http://www.woodyjohnsonsculpture.com/	1983	Signed and numbered. Local artist.	32 x 26.5"	"8/25"	991051282549706532	c093333219	\N	\N	100	2006	\N	2020-01-25	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	439
244	Ivory Coast	Johnston, Ynez	https://en.wikipedia.org/wiki/Ynez_Johnston	1958	Signed and numbered. Lightstained.	27.5 x 21.5"	"126/210"	991051282579706532	c093333352	\N	\N	500	2006	\N	2019-08-30	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	440
239	Maru-to-Shima	Ikegawa, Shiro	https://www.annexgalleries.com/artists/biography/1102/Ikegawa/Shiro	1963	Signed and numbered.	26 x 21"	"50/50"	991051247949706532	c093333875	\N	\N	300	2006	\N	2019-09-10	2022-07-28 23:59:21.060879	2023-08-26 00:35:06.489697	f	429
242	Moon Valley	Janko, May	\N	1958	Signed and numbered.	28 x 32"	"12/20"	991051282149706532	C093332932	\N	\N	300	2006	\N	2019-09-07	2022-07-28 23:59:21.060879	2023-09-05 22:04:26.75629	f	437
921	Monsoon	Johnston, Ynez	https://en.wikipedia.org/wiki/Ynez_Johnston	1994	\N	21 x 17"	Artist's proof	991008718379706532	C103786059	\N	\N	\N	\N	\N	2019-10-10	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	441
246	Candy Heart	Jones, Liza	http://portlandartmuseum.us/mwebcgi/mweb.exe?request=record;id=8468;type=701	1979	Signed and numbered.	21.5 x 17.5"	"23/100"	991051082609706532	c087370778	\N	\N	200	2006	\N	2018-08-25	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	442
247	Fourth of July	Jones, Liza	http://portlandartmuseum.us/mwebcgi/mweb.exe?request=record;id=8468;type=701	1979	Signed and numbered.	16.5 x 12"	"3/100"	991051082479706532	c087370635	\N	\N	200	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	443
245	Scallions	Jones, Liza	http://portlandartmuseum.us/mwebcgi/mweb.exe?request=record;id=8468;type=701	1979	Signed and annotated "Artist's proof."	14 x 30"	Artist's Proof	991051282609706532	c093332923	\N	\N	200	2006	\N	2020-01-27	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	444
615	Views of Holland (Vues de Hollande)	Jongkind, Johan Barthold	https://en.wikipedia.org/wiki/Johan_Jongkind	\N	Etching with letters "Imp a Delatre, Paris."	17 x 18.5"	\N	\N	C087370741	NON-CIRC	\N	1000	2006	b16389736	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	445
1146	RIP 2020	Jo, Hellen	https://helllllen.org/	2021	5-color Riso print. Printed at Tiny Splendor in Oakland, CA. Signed and dated.	18 x 22"	\N	991085987124606532	C103796273	\N	\N	\N	\N	\N	\N	2022-09-21 16:53:24.479846	2022-09-21 16:53:24.479846	f	446
759	Missing	Josifov, Igor	http://igorjosifov.prima-dent.org/	2009	From his exhibition "Past Present Permanent (Mental Prison)." Debossed lettering.	22 x 18"	\N	991078593309706532	C104970568	\N	\N	500	\N	\N	2019-09-03	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	447
249	Winter Pear	Kain, Kathryn	http://www.kathrynkain.com/	1989	Signed. Floated in mat.	15 x 13"	\N	991051082569706532	c087370787	\N	\N	100	2006	\N	2019-09-15	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	449
250	Orientalisches	Kandinsky, Wassily	https://en.wikipedia.org/wiki/Wassily_Kandinsky	1966	Reprint of woodcut from the series "Klange."	15 x 13.75"	\N	991051082529706532	C103494771	\N	\N	400	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	450
251	Untitled	Kano, Mitsuo	\N	1967	Signed and annotated "épreuve d'artiste."	28 x 36"	Artist's Proof	991051282669706532	c093332905	\N	\N	150	2006	\N	2019-08-29	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	451
252	Redhead	Kaplan, Jerome	http://www.nga.gov/content/ngaweb/Collection/artist-info.2586.html	\N	Signed and numbered.	21 x 16"	"9/35"	991051082269706532	c087523712	\N	\N	350	2006	\N	2018-10-03	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	452
259	Aix	Kasten, Karl	https://en.wikipedia.org/wiki/Karl_Kasten	1959	Signed and numbered.	25.5 x 21"	"1/25"	\N	c087523721	\N	\N	700	2006	17369892; withdrawn missing 2019	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	453
256	Amalfi	Kasten, Karl	https://en.wikipedia.org/wiki/Karl_Kasten	1968	\N	25 x 22"	\N	991051082389706532	c087370626	\N	\N	700	2006	17369897	2019-09-09	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	454
257	Androcles and the Lion	Kasten, Karl	https://en.wikipedia.org/wiki/Karl_Kasten	1949	Signed and numbered.	21.5 x 17.5"	"7/25"	991051082519706532	c087370750	\N	\N	700	2006	17369904	2020-01-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	455
258	Blue Jeans	Kasten, Karl	https://en.wikipedia.org/wiki/Karl_Kasten	1975	Signed and numbered.	23.5 x 20"	"8/30"	991051082349706532	c087370617	\N	\N	800	2006	17369896	2019-10-05	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	457
255	Fete St. Jean	Kasten, Karl	https://en.wikipedia.org/wiki/Karl_Kasten	1961	Slipped from hinge.	31.5 x 25"	"?/15"	991051282719706532	c093332880	\N	\N	500	2006	\N	2018-09-18	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	458
253	Firebird	Kasten, Karl	https://en.wikipedia.org/wiki/Karl_Kasten	1959	Signed and numbered.	31.5 x 27.5"	"1/12"	991046384739706532	c093335031	\N	\N	800	2006	17744827	2019-09-10	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	459
254	Tides of Time	Kasten, Karl	https://en.wikipedia.org/wiki/Karl_Kasten	1954	Signed and numbered.	21.5 x 20"	"1/25"	991051082319706532	c087523703	\N	\N	700	2006	17369895	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	460
260	No. 75 [Butterfly and Beetle]	Katsuda, Yukio	http://www.artic.edu/aic/collections/artwork/artist/Katsuda+Yukio	1974	Signed and numbered.	16.5 x 21"	"67/100"	991051082189706532	c087523730	\N	\N	150	2006	\N	2019-09-05	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	461
262	Bourges	Kay, Bernard	\N	1967	\N	28 x 22"	"100/100"	991051282759706532	c093333015	\N	\N	100	2006	\N	2019-08-30	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	463
778	Net Mending	Kelly, Francis	\N	\N	Signed, titled and annotated, "Artist's proof."	28 x 32.5"	Artist's proof	991078618869706532	C104970771	\N	\N	500	\N	\N	2019-09-04	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	464
261	No. 106	Kawashima, Takeshi	http://takeshikawashima.com/art/index.php	1970	Signed and numbered.	30 x 30"	"28/80"	991051282739706532	c093332871	\N	\N	300	2006	\N	2019-08-27	2022-07-28 23:59:21.060879	2024-09-04 19:24:16.539117	f	462
263	The Tree	Kent, Rockwell	https://en.wikipedia.org/wiki/Rockwell_Kent	1928	Signed.	19.5 x 15.5"	"?/100"	991051082099706532	c087523758	\N	\N	900	2006	17369889	2019-08-27	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	466
264	Abstraction	Kiley, Robert L.	\N	1956	Signed and numbered 56-8.	28 x 21.5"	\N	991051282789706532	c093332862	\N	\N	100	2006	\N	2019-09-10	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	467
752	West Point, Mt. Tamalpais	Killion, Tom	http://tomkillion.com/	2008	Signed and numbered. Multi-block reduction-cut.	17.75 x 23.75"	"97/175"	991078587829706532	C103494656	\N	\N	750	\N	\N	2019-08-27	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	468
617	Blue Wind D	Kimura, Yoshiharu	\N	1972	Signed and numbered.	18 x 16"	"29/100"	991051348859706532	C093329567	\N	\N	500	\N	\N	2019-10-22	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	469
265	On the Square	Kimura, Reiji	\N	\N	Signed and inscribed "Artist's Proof."	27 x 22"	Artist's Proof	991051282819706532	c093333060	\N	\N	150	2006	\N	2019-09-10	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	470
505	Untitled	Hidekata	\N	\N	\N	15 x 18.5"	\N	991051090279706532	C093335068	\N	\N	500	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	405
266	Face (Woman)	Kinoshita, Tomio	\N	1965	Signed and numbered.	32.5 x 24.5"	"4/50"	991051282839706532	c093333006	\N	\N	350	2006	\N	2020-01-27	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	471
267	Two Mounted Artillerymen (Zwei Reitende Artilleristen)	Kirchner, Ernst Ludwig	https://en.wikipedia.org/wiki/Ernst_Ludwig_Kirchner	1916	Unsigned. From "Der Bildermann."	17 x 14"	\N	991051282869706532	c093333051	\N	\N	400	2006	\N	2019-08-29	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	472
618	Little Bird and Girl	Kishi, Koo	\N	1974	Signed.	18 x 21"	\N	991051333009706532	C093329008	\N	\N	200	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	473
268	Cat and Girl	Kishi, Koo	\N	1973	Signed and numbered.	17 x 21"	"50/50"	991051082139706532	c087523749	\N	\N	200	2006	\N	2019-09-09	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	474
269	For Fear	Kitaj, Ronald B.	https://en.wikipedia.org/wiki/R._B._Kitaj	1967	Signed and numbered. K 23.	24.5 x 37.5"	"34/70"	991051282889706532	c093333024	\N	\N	600	2006	\N	2020-02-08	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	476
270	For Love (Robert Creeley)	Kitaj, Ronald B.	https://en.wikipedia.org/wiki/R._B._Kitaj	1966	Signed and numbered. From the series "First Series - Some Poets." Creeley was a friend of the artist and an occasional collaborator.	25.5 x 32.5"	"5/70"	991046384919706532	c093332677	\N	\N	800	2006	17744832	2019-09-09	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	477
828	Swamp Plant #3	Kobashi, Yasuhide	https://en.wikipedia.org/wiki/Yasuhide_Kobashi	\N	\N	13.75 x 13.75"	\N	991078753319706532	C103495890	\N	\N	300	\N	\N	2020-02-18	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	480
273	Naniwa: The Scholar Onin and the Spirit of Plum Trees	Tsukioka, Kogyo	https://en.wikipedia.org/wiki/K%C5%8Dgyo_Tsukioka	1897	From the series "Pictures of Noh Plays (Nogaku Zue]."	18.5 x 14"	\N	991051079209706532	c091134402	\N	\N	75	2006	\N	2019-09-10	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	482
277	The Mathematician	Kohn, Misch	http://www.moma.org/collection/artists/3193?locale=en	1964	Edition of 50. Signed and inscribed "artist imp."	24.5 x 33.5"	Artist's Proof	991051282999706532	c093334462	\N	\N	250	2006	\N	2019-09-13	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	484
275	Stranger	Kohn, Misch	http://www.moma.org/collection/artists/3193?locale=en	1961	Annotated "artist's proof."	19 x 23"	Artist's Proof	991051078959706532	c091134475	\N	\N	300	2006	\N	2019-09-09	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	486
274	Wildcat	Kohn, Misch	http://www.moma.org/collection/artists/3193?locale=en	1964	Signed and numbered.	30 x 26"	"13/50"	991051283279706532	c093334374	\N	\N	500	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	487
1060	The Verdict	Kokoschka, Oskar	https://en.wikipedia.org/wiki/Oskar_Kokoschka	1969	Plate from the series "Die Frösche des Aristophanes" ("The Frogs of Aristophanes"). Signed and numbered.	19 x 25"	"7/70"	991048848649706532	\N	\N	\N	\N	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	488
1059	Pluto Challenges Dionysus	Kokoschka, Oskar	https://en.wikipedia.org/wiki/Oskar_Kokoschka	1969	Plate from the series "Die Frösche des Aristophanes" ("The Frogs of Aristophanes"). Signed and numbered.	19 x 25"	"7/70"	991048848609706532	\N	\N	\N	\N	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	489
1061	Exodus	Kokoschka, Oskar	https://en.wikipedia.org/wiki/Oskar_Kokoschka	1969	Plate from the series "Die Frösche des Aristophanes" ("The Frogs of Aristophanes"). Signed and numbered.	19 x 25"	"7/70"	991048848749706532	\N	\N	\N	\N	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	490
1050	Portrait of Aristophanes	Kokoschka, Oskar	https://en.wikipedia.org/wiki/Oskar_Kokoschka	1969	Plate from the series "Die Frösche des Aristophanes" ("The Frogs of Aristophanes"). Signed and numbered.	19 x 25"	"7/70"	991048847419706532	\N	\N	\N	\N	\N	\N	2019-08-30	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	491
1051	Dionysus in the Robe of Hercules	Kokoschka, Oskar	https://en.wikipedia.org/wiki/Oskar_Kokoschka	1969	Plate from the series "Die Frösche des Aristophanes" ("The Frogs of Aristophanes"). Signed and numbered.	19 x 25"	"7/70"	991048847639706532	\N	\N	\N	\N	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	492
1052	Dionysus and the Heavily-laden Xanthias	Kokoschka, Oskar	https://en.wikipedia.org/wiki/Oskar_Kokoschka	1969	Plate from the series "Die Frösche des Aristophanes" ("The Frogs of Aristophanes"). Signed and numbered.	19 x 25"	"7/70"	991048847599706532	\N	\N	\N	\N	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	493
1053	The Frogs	Kokoschka, Oskar	https://en.wikipedia.org/wiki/Oskar_Kokoschka	1969	Plate from the series "Die Frösche des Aristophanes" ("The Frogs of Aristophanes"). Signed and numbered.	19 x 25"	"7/70"	991048847709706532	\N	\N	\N	\N	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	494
1054	Dionysus and Xanthias Meet the Empusa	Kokoschka, Oskar	https://en.wikipedia.org/wiki/Oskar_Kokoschka	1969	Plate V from the series "Die Frösche des Aristophanes" ("The Frogs of Aristophanes"). Signed and numbered.	19 x 25"	"7/70"	991048847749706532	\N	\N	\N	\N	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	495
1055	Dionysus and Xanthias Bombarded by Aiakos	Kokoschka, Oskar	https://en.wikipedia.org/wiki/Oskar_Kokoschka	1969	Plate from the series "Die Frösche des Aristophanes" ("The Frogs of Aristophanes"). Signed and numbered.	19 x 25"	"7/70"	991048847789706532	\N	\N	\N	\N	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	496
1056	The Choir Speaks to the Audience	Kokoschka, Oskar	https://en.wikipedia.org/wiki/Oskar_Kokoschka	1969	Plate from the series "Die Frösche des Aristophanes" ("The Frogs of Aristophanes"). Signed and numbered.	19 x 25"	"7/70"	991048848269706532	\N	\N	\N	\N	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	497
619	Kasrilevke, Plate 8	Knispel, Gershon	https://en.wikipedia.org/wiki/Gershon_Knispel	1966	Signed and numbered. Illustration for Shalom Aleichem's "Stories."	26 x 20"	"88/125"	991051282939706532	C093333042	\N	\N	150	2006	\N	2019-11-13	2022-07-28 23:59:21.060879	2023-08-26 00:38:57.184534	f	479
276	Double Portrait of the Artist: Mies van der Rohe and Janis Joplin	Kohn, Misch	http://www.moma.org/collection/artists/3193?locale=en	1974	Signed in colored pencil.	25.5 x 20"	Artist's Proof	991051079269706532	C103787947	\N	\N	400	2006	\N	2019-08-29	2022-07-28 23:59:21.060879	2024-07-24 20:22:37.736271	f	483
1057	Dionysus, Aeschylus and Euripides Perform Sacrifices	Kokoschka, Oskar	https://en.wikipedia.org/wiki/Oskar_Kokoschka	1969	Plate from the series "Die Frösche des Aristophanes" ("The Frogs of Aristophanes"). Signed and numbered.	19 x 25"	"7/70"	991048848369706532	\N	\N	\N	\N	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	498
1058	The Debate	Kokoschka, Oskar	https://en.wikipedia.org/wiki/Oskar_Kokoschka	1969	Plate from the series "Die Frösche des Aristophanes" ("The Frogs of Aristophanes"). Signed and numbered.	19 x 25"	"7/70"	991048848409706532	\N	\N	\N	\N	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	499
278	Wanderer in Thunderstorm (Wanderer im Gewitter)	Kokoschka, Oskar	https://en.wikipedia.org/wiki/Oskar_Kokoschka	1914	Signed. WW 60. Plate 3, "Bach Cantata No. 3," from "O Ewigkeit."	27 x 21.5"	"?/100"	\N	C093334921	NON-CIRC	\N	1200	2006	17744594, b16196878	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	500
810	Mother with Child in Arms	Kollwitz, Kathe	https://en.wikipedia.org/wiki/K%C3%A4the_Kollwitz	1910	Blind stamp in lower right corner: "avd Becke Muenchen-22."	15.5 x 12"	\N	\N	C104970878	NON-CIRC	\N	1500	\N	b18372399	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	501
282	View of the Boston Ravine, Oldest Meeting House	Koppel, Charles	http://www.artprice.com/artist/197233/charles-koppel/biography	1851-1854	Unsigned. From the journal "Gleason's Pictorial Drawing Room Companion."	13 x 18"	\N	991051079069706532	c091134448	\N	\N	50	2006	\N	2018-10-06	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	502
281	Crossing of the Chowchillas River	Koppel, Charles	http://www.artprice.com/artist/197233/charles-koppel/biography	1855	Unsigned. "U.S.P.R.R. Exp. & Surveys.--Cal. Geology--Plate II."	13 x 16"	\N	991051078919706532	c091134387	\N	\N	125	2006	\N	2019-10-01	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	503
279	Entrance of the Tejon Pass and a Portion of the Tejon	Koppel, Charles	http://www.artprice.com/artist/197233/charles-koppel/biography	1855	From U.S.P.R.R. Exp. & Surveys - Cal."	14.75 x 12.75"	\N	991051078879706532	c091134378	\N	\N	125	2006	\N	2019-09-02	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	504
851	Retrospect	Koppelman, Chaim	https://en.wikipedia.org/wiki/Chaim_Koppelman	1959	Signed and titled.	14.5 x 21.5"	"?/250"	991079166069706532	C103495784	\N	\N	500	\N	\N	2020-02-12	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	505
280	Valley of the Kah-Wee-Ya River (Four Creeks)	Koppel, Charles	http://www.artprice.com/artist/197233/charles-koppel/biography	1855	From U.S.P.R.R. Exp. & Surveys - Cal." Severely faded.	13 x 14.75"	\N	991051079119706532	c091134439	\N	\N	125	2006	\N	2019-08-30	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	506
793	Garden Scene	Ogata, Korin	https://en.wikipedia.org/wiki/Ogata_K%C5%8Drin	\N	Stamp-like signature in lower right corner.	21 x 22.5"	\N	\N	C103787008	NON-CIRC	\N	1500	\N	b18371940	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	507
540	Composition in Grey and Red	Krikorian, Leo	http://leokrikorian.com/	1993	\N	16.5 x 19.5"	"33/100"	991051327939706532	c093328952	\N	\N	500	\N	\N	2019-09-02	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	508
283	Cloudy Skyline	Kruck, Christian	https://de.wikipedia.org/wiki/Christian_Kruck	1963	Signed and numbered.	29 x 22"	"101/200"	991051283029706532	c093334453	\N	\N	250	2006	\N	2019-09-09	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	509
284	Massada, Israel	Kruck, Christian	https://de.wikipedia.org/wiki/Christian_Kruck	1975	Signed and numbered.	29 x 38"	\N	991051283059706532	C103494610	\N	\N	175	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	510
285	Old Walls in Rome (Alte Mauern in Rom)	Kugler, Rudolf	https://de.wikipedia.org/wiki/Rudolf_K%C3%BCgler	1960	Signed and numbered.	29 x 23"	"110/200"	991051283089706532	c093334435	\N	\N	250	2006	\N	2019-08-30	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	511
930	In Spain	Kugler, Rudolf	https://de.wikipedia.org/wiki/Rudolf_K%C3%BCgler	1957	\N	21.5 x 27.25"	No. 194	991011628899706532	C103788394	\N	\N	1000.00	\N	Purchased from the gift of Miss Helen and Miss Madeline Pardee.	2019-09-09	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	512
286	The 47 Ronin - Nobukiyo	Utagawa, Kuniyoshi	https://en.wikipedia.org/wiki/Utagawa_Kuniyoshi	1847	Artist was a student of the Utagawa School.	17.5 x 14.5"	\N	991051078999706532	C104972061	\N	\N	200	2006	\N	2019-09-06	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	513
287	Old House in Waldenburg, Saxony	Kupfernagel, Heinz	https://de.wikipedia.org/wiki/Heinz_Kupfernagel	1956	Signed and numbered.	23.5 x 29.5"	"6/15"	991051283119706532	c093334426	\N	\N	250	2006	\N	2019-09-21	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	514
288	Some Ingredients	Landacre, Paul	https://en.wikipedia.org/wiki/Paul_Landacre	1950	Signed and numbered. Published by The Woodcut Society, New York.	15.5 x 13.25"	"10/250"	991051077709706532	c091134280	\N	\N	650	2006	17364470; Purchased from the Jean Conrad Fund	2019-09-09	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	515
536	Palace	Landau, Jacob	https://en.wikipedia.org/wiki/Jacob_Landau_(artist)	1965	Signed.	28 x 36"	"10/20"	991053843429706532	c067069188	\N	\N	900	\N	\N	2017-09-03	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	516
290	The Harp	Landau, Jacob	https://en.wikipedia.org/wiki/Jacob_Landau_(artist)	1960	Signed and annotated. For Hubert Jelinek's "Virtuoso Harp" record cover.	25 x 23.5"	Artist's Proof	991051283149706532	c093334417	\N	\N	500	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	517
289	T.R.	Landau, Jacob	https://en.wikipedia.org/wiki/Jacob_Landau_(artist)	\N	Signed and annotated "Artist's Proof."	16 x 20"	Artist's Proof	991051077739706532	C091134299	\N	\N	900	2006	17364477	2019-09-24	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	518
291	Kwuf Kubal Gafnit Spurdal Nug	LaPel, Roger	\N	\N	Signed and numbered.	26 x 26"	"8/250"	991051283179706532	c093334408	\N	\N	50	2006	\N	2018-01-16	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	519
293	Yellow Vase	Larkin, Eugene	\N	1957	Signed and numbered.	27 x 21"	"68/210"	991051283249706532	c093334383	\N	\N	300	2006	\N	2019-09-15	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	521
292	Untitled	Lardera, Berto	https://en.wikipedia.org/wiki/Berto_Lardera	1956	Signed and numbered.	23.5 x 33.5"	"47/50"	991051283209706532	C104947375	\N	\N	450	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2023-09-20 19:41:24.987939	f	520
844	Child with Flowers	Le Brocquy, Louis	https://en.wikipedia.org/wiki/Louis_le_Brocquy	1954	Signed and numbered. Upper left has "Dawson's Gallery" written in pencil.	\N	"21/25"	\N	\N	NON-CIRC	Stored in box	5000	\N	b18401103	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	522
296	Untitled (The Táin)	Le Brocquy, Louis	https://en.wikipedia.org/wiki/Louis_le_Brocquy	1969	Signed and numbered. From "The Táin," published in Dublin by Dolmen Press.	\N	"23/50"	\N	c091134314	NON-CIRC	\N	3200	2006	17364484, b16389549	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	523
295	Sun Breaker (Brise-soleil)	Le Corbusier (Jeanneret-Gris, Charles-Edouard)	https://en.wikipedia.org/wiki/Le_Corbusier	1955	Signed and numbered. From: "The Poem of the Right Angle" (Le Poeme de l'Angle Droit).	21.5 x 27.5"	"8/61"	991046384039706532	c093334958	\N	\N	900	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	525
297	Railroad Station (La Gare)	Leger, Fernand	https://en.wikipedia.org/wiki/Fernand_L%C3%A9ger	1955	Stamped and numbered. From "La Ville" series.	27 x 24.5"	"81/180"	\N	C103787044	NON-CIRC	\N	1000	2006	17744595, b16196879	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	526
298	Umbrellas (Parapluies)	Leger, Fernand	https://en.wikipedia.org/wiki/Fernand_L%C3%A9ger	1955	Stamped and numbered. From "La Ville" series.	21.5 x 27.5"	"24/180"	991046383999706532	c093334949	\N	\N	700	2006	17744596	2019-08-29	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	527
301	La Vie	Lepere, Auguste	https://en.wikipedia.org/wiki/Auguste-Louis_Lep%C3%A8re	1908	Signed.	17.25 x 15.5"	Artist's Proof	991051077939706532	c091134341	\N	\N	350	2006	\N	2019-09-09	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	529
302	Le Quartier des Gobelins	Lepere, Auguste	https://en.wikipedia.org/wiki/Auguste-Louis_Lep%C3%A8re	1896	Lotz-Brissonneau 96. From the Gazette des Beaux-Arts. Signed in plate with letters.	13 x 16"	Artist's Proof	991051077899706532	c091134332	\N	\N	200	2006	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	530
300	Storm on the Sand Dune	Lepere, Auguste	https://en.wikipedia.org/wiki/Auguste-Louis_Lep%C3%A8re	1908-1909	Signed and numbered.	17.5 x 14.5"	"16/35"	991051077869706532	c091134323	\N	\N	600	2006	\N	2020-01-02	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	531
304	Bridal Veil	Leroy, William	http://collection.spencerart.ku.edu/eMuseumPlus?service=ExternalInterface&module=artist&objectId=17064&viewType=detailView	1989	Falls of Yosemite Series #2. Signed.	10.5 x 15.5"	Artist's Proof	991051077399706532	c091134208	\N	\N	100	2006	\N	2019-09-23	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	532
303	Our House	Leroy, William	http://collection.spencerart.ku.edu/eMuseumPlus?service=ExternalInterface&module=artist&objectId=17064&viewType=detailView	1985	Signed and numbered.	13 x 12.5"	"30/50"	991051077589706532	c091134253	\N	\N	100	2006	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	533
946	Lines in Four Directions	LeWitt, Sol	https://en.wikipedia.org/wiki/Sol_LeWitt	1976	Printed by Aaron Arnow; published by Parasol Press, Ltd., New York.	14 x 14"	"216/1000"	991036394129706532	C104974810	\N	\N	\N	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2024-09-04 21:03:32.571106	t	539
307	Adam and Eve	Levine, Jack	https://en.wikipedia.org/wiki/Jack_Levine	1963	Signed and numbered.	19 x 23"	"57/100"	991051077499706532	c091134235	\N	\N	400	2006	\N	2016-08-30	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	535
306	Hillel	Levine, Jack	https://en.wikipedia.org/wiki/Jack_Levine	1963	Edition of 100	19 x 23"	"?/100"	991051077459706532	c091134226	\N	\N	400	2006	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	536
305	Rape of the Sabines	Levine, Jack	https://en.wikipedia.org/wiki/Jack_Levine	1965	Signed and numbered. Some foxing.	21 x 18.5"	"14/100"	991051077429706532	c091134217	\N	\N	400	2006	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	537
1138	Archae Birds	Lininger, Richard	https://art.famsf.org/richard-lininger	1973	Signed, titled, and numbered.	26 x 17"	"8/50"	991085987140906532	C103796282	\N	\N	\N	\N	\N	\N	2022-09-21 16:53:24.433039	2022-09-21 16:53:24.433039	f	541
309	Holding Patterns	Lininger, Richard	https://art.famsf.org/richard-lininger	1977	Signed and numbered.	25 x 32.5"	"1/25"	991051283309706532	C103790905	\N	\N	100	2006	\N	2019-08-29	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	542
311	Homage to Sharaku	Lininger, Richard	https://art.famsf.org/richard-lininger	1974	Signed and numbered.	23 x 32"	"5/75"	991051283339706532	c093334356	\N	\N	100	2006	\N	2019-10-30	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	543
310	Melancholia II	Lininger, Richard	https://art.famsf.org/richard-lininger	1976	Signed and numbered.	16.5 x 13.5"	"1/30"	991051077549706532	c091134244	\N	\N	100	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	544
308	Yantra III	Lininger, Richard	https://art.famsf.org/richard-lininger	1977	Signed and inscribed "EV2."	31 x 23"	Artist's Proof	991051283369706532	C093334347	\N	\N	100	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	545
549	Miss Fortune	Liu, Hung	https://en.wikipedia.org/wiki/Hung_Liu	1995	From the portfolio: "10 x 10 Ten Women Ten Prints."	26 x 26"	\N	991053845969706532	c067069355	\N	\N	500	\N	\N	2019-08-30	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	546
795	Untitled, Butterfly and Flowers	Li, Ai-Vee (Li, Aiwei)	http://oxfordindex.oup.com/view/10.1093/benz/9780199773787.article.B00109229	\N	Stamped, signed and numbered. Watercolor.	22.5 x 18.5"	"55/200"	991078646929706532	C103494513	\N	\N	750	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	547
852	Untitled, Dragonfly and Flowers	Li, Ai-Vee (Li, Aiwei)	http://oxfordindex.oup.com/view/10.1093/benz/9780199773787.article.B00109229	\N	Stamped, signed and numbered. Watercolor.	21.5 x 17.25"	"59/200"	991079166119706532	C103495906	\N	\N	750	\N	\N	2019-09-11	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	548
783	Deviation Centrifuge	Le Yaouanc, Alain	https://fr.wikipedia.org/wiki/Alain_Le_Yaouanc	1972	Signed and numbered.	21 x 27"	"10/75"	991078626259706532	C104970948	\N	\N	750	\N	\N	2019-09-26	2022-07-28 23:59:21.060879	2024-09-04 19:40:03.44768	f	1097
600	Signal Imaginaire	Carmi, Eugenio	http://www.eugeniocarmi.eu/en/home.page	1971	\N	37 x 29"	\N	991051349439706532	C104972034	\N	\N	500	2006	\N	2019-09-04	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	145
872	Medics, Pacific Dressing Station	Longstreet, Stephen	https://en.wikipedia.org/wiki/Stephen_Longstreet	1944	Signed, dated and titled. Ink sketch for print. Dedication reads, "For V.L. with much thanks - Stephen Longstreet."	19 x 24.25"	\N	991079228599706532	C103495456	\N	\N	900	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	550
871	The Secret Language	Longstreet, Stephen	https://en.wikipedia.org/wiki/Stephen_Longstreet	\N	Signed and titled.	22.5 x 27.5"	\N	991079228559706532	C103495155	\N	\N	600	\N	\N	2019-08-29	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	551
870	The Blue Peach - Soul Food - God's Plenty	Longstreet, Stephen	https://en.wikipedia.org/wiki/Stephen_Longstreet	\N	Signed and titled.	24.5 x 20.75"	\N	991079228539706532	C103495447	\N	\N	750	\N	\N	2019-09-30	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	552
873	Untitled, Medics	Longstreet, Stephen	https://en.wikipedia.org/wiki/Stephen_Longstreet	1941	Signed, dated and numbered. Inscribed "limited edition print."	18.5 x 24.5"	\N	991079228619706532	C103495164	\N	\N	500	\N	\N	2019-09-13	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	553
869	Untitled, Still-Life with Fruit	Longstreet, Stephen	https://en.wikipedia.org/wiki/Stephen_Longstreet	\N	Signed and numbered. Watercolor.	16 x 13.5"	"11/20"	991079228459706532	C103495304	\N	\N	250	\N	\N	2019-08-30	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	554
523	Tribute to Dolores Huerta (Homenaje a Dolores Huerta)	Lopez, Yolanda M.	https://en.wikipedia.org/wiki/Yolanda_Lopez	1995	Signed. From the portfolio: "10 x 10 Ten Women Ten Prints."	27 x 28"	"15/75"	991051283429706532	c093334338	\N	\N	500	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	555
313	La Rosiere de Saint Pompon	Bissiere, Marc-Antoine (Louttre, Marc-Antoine; Louttre. B)	https://fr.wikipedia.org/wiki/Louttre.B	1970	Signed and numbered.	27.5 x 37.5"	"21/60"	991051283439706532	c093334310	\N	\N	200	2006	\N	2018-09-15	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	556
952	The Path	Lowney, Bruce Stark	\N	1985	Signed and numbered.	\N	"3/25"	991036394469706532	C104974670	\N	\N	\N	\N	\N	2018-08-20	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	557
314	Street Crowd	Luca, Mark	\N	\N	Signed and numbered.	26 x 22"	"5/10"	991051077619706532	c091134262	\N	\N	150	2006	\N	2019-11-29	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	558
315	Rainbow Caught in the Mist	Mack, Martin	\N	\N	Signed and numbered.	25 x 32"	"4/70"	991051283489706532	c093334301	\N	\N	150	2006	\N	2019-09-11	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	559
317	Standing Nude, Hands in Hair	Maillol, Aristide	https://en.wikipedia.org/wiki/Aristide_Maillol	1935	Unsigned. Page 77 from "L'Art d'Aimer by Ovid."	23 x 21"	\N	991051076949706532	c091134192	\N	\N	400	2006	\N	2019-09-03	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	561
318	Symbol No.2	Maki, Haku	https://en.wikipedia.org/wiki/Maki_Haku	1957	\N	21 x 26.5"	"15/200"	991051076899706532	c091134183	\N	\N	250	2006	\N	2019-09-13	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	562
319	Untitled, 66-4	Maki, Haku	https://en.wikipedia.org/wiki/Maki_Haku	1957	Signed and numbered.	26 x 30"	"15/200"	991051283549706532	c093334286	\N	\N	250	2006	\N	2019-08-29	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	563
776	Floating Lilies	Makk, A.B.	http://makkart.com/about-us/a-b-makk/	\N	Signed and numbered.	14 x 19"	"212/275"	991078618629706532	C104970920	\N	\N	750	\N	\N	2019-03-10	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	564
316	Untitled	Maglione, Milvia	https://awarewomenartists.com/en/artiste/milvia-maglione/	\N	Signed and numbered.	29 x 26"	"III/XX"	991051283519706532	c093334295	\N	\N	200	2006	\N	2019-08-29	2022-07-28 23:59:21.060879	2024-09-04 20:10:35.306504	f	1099
323	Untitled Collage	Marca-Relli, Conrad (Marcarelli, Corrado)	https://en.wikipedia.org/wiki/Conrad_Marca-Relli	1966	Signed and numbered.	31 x 26"	"3/20"	991051283589706532	c093334277	\N	\N	200	2006	\N	2019-09-05	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	570
1072	Das Totenhaupt	Marcks, Gerhard	https://en.wikipedia.org/wiki/Gerhard_Marcks	1923	Titled, dated, and initialed.	13.5 x 16"	\N	991054190839706532	C104988049	\N	\N	\N	\N	Gift of Lois Friedberg-Dobry	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	571
768	Dense Populations	Margitich, Justin	http://justinmargitich.com/home.html	\N	Signed, titled and numbered.	19.5 x 25"	"24/24"	991078599179706532	C104970586	\N	\N	500	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	572
762	Friends of the Urban Forest, Digging a Hole	Margitich, Justin	http://justinmargitich.com/home.html	2009	\N	15.25 x 17.25"	\N	991078598319706532	C104970896	\N	\N	500	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	573
747	Friends of the Urban Forest	Margitich, Justin	http://justinmargitich.com/home.html	2009	Signed, titled and annotated, "AP."	16 x 13.25"	\N	991078568239706532	C094893664	\N	\N	500	\N	\N	2019-09-02	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	574
312	Untitled	Llovet, Ramon	https://www.annexgalleries.com/artists/biography/2880/Llovet/Ramon	\N	Signed and annotated "P.A."	29 x 23"	Artist's Proof	991051283399706532	C103787071	\N	\N	250	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2023-09-08 15:28:08.748309	f	549
743	Friends of the Urban Forest Enjoy Their New Lake	Margitich, Justin	http://justinmargitich.com/home.html	2009	Signed, titled and numbered.	13 x 17"	"4/5"	991078568079706532	C094893257	\N	\N	500	\N	\N	2018-08-23	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	575
763	Friends of the Urban Forest, Tractors and Trees	Margitich, Justin	http://justinmargitich.com/home.html	2009	Signed and numbered.	14.25 x 16.25"	"3/6"	991078598399706532	C104970735	\N	\N	500	\N	\N	2018-08-23	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	577
767	Loading a Cannon	Margitich, Justin	http://justinmargitich.com/home.html	\N	Signed, titled and numbered.	16 x 33.5"	"1/16"	991078599139706532	C104970744	\N	\N	500	\N	\N	2020-02-06	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	578
324	Church Tower with Clock	Marin, John	https://en.wikipedia.org/wiki/John_Marin	1906	Reproduction after original etching. Zigrosser 28.	14.5 x 10.5"	\N	991051327699706532	c093329211	\N	\N	100	2006	\N	2019-11-27	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	579
325	Della Fava, Venice	Marin, John	https://en.wikipedia.org/wiki/John_Marin	1906	Reproduction after original etching. Zigrosser 64.	17 x 14.5"	\N	991051327729706532	C093329354	\N	\N	100	2006	\N	2019-08-30	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	580
626	Juggler (Jongleur)	Marini, Marino	\N	1952	Signed and numbered. Edition of 50.	32.5 x 23"	"20/25"	\N	C103510976	NON-CIRC	\N	1800	2006	b18360159	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	581
1017	Everton from Brow Side	Markson, Helena	http://www.emmamason.co.uk/a/helena-markson	1964-1965	Signed and inscribed "A/P". From the portfolio "Liverpool Suite."	33 x 28"	\N	991040528719706532	C104939423	\N	\N	\N	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	584
627	Le Pont Neuf	Marquet, Albert	https://en.wikipedia.org/wiki/Albert_Marquet	1937	For the book "Paris" by J. G. Daragnès.	21 x 18.5"	\N	\N	C103510772	NON-CIRC	\N	1000	\N	b18360581	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	586
709	Bowery	Marsh, Reginald	https://en.wikipedia.org/wiki/Reginald_Marsh_(artist)	1928	Numbered 19 and signed by Felicia Marsh.	\N	\N	\N	\N	NON-CIRC	Stored in box	1800	2006	b18360178	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	587
736	Daydream in Silk	Marten, Willa Z.	http://art.mcn.org/Willa-Marten/	\N	Signed. Gold ink on paper.	25 x 19"	\N	991078560149706532	C094893646	\N	\N	500	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	588
735	Moment of Movement	Marten, Willa Z.	http://art.mcn.org/Willa-Marten/	\N	Stamped in lower right corner, "Willa Marten."	19 x 25.5"	\N	991078560109706532	C094893503	\N	\N	500	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	589
543	Pride of the Seven Moons	Marten, Willa Z.	http://art.mcn.org/Willa-Marten/	\N	\N	32 x 27"	\N	991053845759706532	C067069027	\N	\N	500	\N	\N	2019-09-02	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	590
781	Net and Triton	Martinelli, Ezio (Martinelli, Azio)	https://en.wikipedia.org/wiki/Ezio_Martinelli	1957	Signed, titled and numbered.	27 x 21"	"94/200"	991078619069706532	C104970461	\N	\N	750	\N	\N	2019-09-04	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	591
327	Parsley	Martin, Anna	\N	1896	Plate 22 by E. Grasset for La Plante et Ses Applications Ornamentales, Paris.	16 x 23"	Plate 22	991051076599706532	c091134110	\N	\N	80	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	592
328	In Frozen Calm	Marx, Evelyn	\N	1958	Signed and numbered. Some ink adhesion to glass.	27 x 21"	"105/200"	\N	c091134129	\N	\N	150	2006	17362554, b16389509, 20110409 WITHDRAWN; Damaged beyond repair mocs	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	594
330	Untitled, Bird on a Branch	Kitao, Masayoshi (Kuwagata, Keisai)	http://www.britishmuseum.org/research/search_the_collection_database/term_details.aspx?bioId=146047	1804	Smudged and creased. Page from an illustrated book.	14.5 x 17"	\N	991051076719706532	c091134147	\N	\N	250	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	597
331	La Modele	Masson, Andre	https://en.wikipedia.org/wiki/Andr%C3%A9_Masson	1959	Signed and numbered.	23.5 x 33.5"	"2/60"	991053840279706532	c067068467	\N	\N	800	2006	51163572	2019-09-17	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	599
1120	East Bay Print Sale Poster 2020	Takar, Kenny	https://maxsgaragepress.com/	2020	Poster advertising the 2020 East Bay Print Sale, run by Max's Garage Press.	16 x 22"	\N	991085987125006532	C103792152	\N	\N	\N	\N	\N	\N	2022-09-21 16:53:24.250927	2022-09-21 16:53:24.250927	f	603
875	Untitled, Composition in Brown, Green and Orange	Mayner, R.	\N	1973	Signed and dated. Dedication reads "To: Dr. Lieberman."	27.25 x 22.25"	\N	991079228669706532	C103495775	\N	\N	500	\N	\N	2018-11-02	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	605
1131	Sinking	McBride, Vera	\N	2020	Woodcut reduction. Signed, titled, and numbered.	19 x 25"	Artist's proof	991085987140606532	C103795835	\N	\N	\N	\N	\N	\N	2022-09-21 16:53:24.391407	2022-09-21 16:53:24.391407	f	606
1132	Trick of the Eye	McBride, Vera	\N	2021	Signed, titled, and numbered.	16 x 20"	"2/15"	991085987140506532	C103795844	\N	\N	\N	\N	\N	\N	2022-09-21 16:53:24.397437	2022-09-21 16:53:24.397437	f	607
1075	Departure	McCloskey, Robin	http://www.robinmccloskey.net/	2019	\N	19.5 x 24u0094	\N	991054191399706532	C104987735	\N	\N	\N	\N	Purchased from the Art KALA 2020 Auction.	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	608
335	Street Corner	McCombs, Bruce	http://americanart.si.edu/collections/search/artist/?id=3208	1975	Signed and numbered.	30.5 x 41.5"	"65/150"	991051349929706532	c093329831	\N	\N	250	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	609
1009	Old English Tulips No.2	McEwen, Rory	https://en.wikipedia.org/wiki/Rory_McEwen_(artist)	1978	\N	21 x 24.5"	"106/150"	991051348899706532	C093329576	\N	\N	\N	\N	\N	2019-09-15	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	610
520	Three Women	McGary, Rosalind	\N	1991	Signed and numbered. Acrylic and India ink.	17.5 x 22"	"201/1500"	991051076829706532	C091134165	\N	\N	500	\N	\N	2019-09-09	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	611
326	Composition	Marini, Marino	https://en.wikipedia.org/wiki/Marino_Marini_(sculptor)	1955	Signed and numbered.	21.5 x 27.5"	"4/50"	991053840209706532	c067068476	\N	\N	900	2006	51163570	2019-08-28	2022-07-28 23:59:21.060879	2023-08-26 00:46:55.137045	f	582
334	Astronauts	Matta, Roberto (Matta Echaurren, Roberto Antonio Sebastian)	https://en.wikipedia.org/wiki/Roberto_Matta	1965	Signed and numbered. Alternately titled "Castronautes."	21 x 27"	"11/99"	991051347329706532	c093332792	\N	\N	500	\N	\N	2020-02-19	2022-07-28 23:59:21.060879	2023-08-21 23:15:15.940155	f	602
329	Woman in Front of a Landscape	Marx, Robert	https://mainstreetartscs.org/robertmarx/	1964	Signed and numbered.	17.5 x 19.5"	"7/25"	991051076669706532	c091134138	\N	\N	150	2006	\N	\N	2022-07-28 23:59:21.060879	2023-08-26 00:48:26.945645	f	595
333	Midnight Rider	Matoush, Lyle	\N	\N	Signed and numbered.	27.5 x 35"	"15/15"	991051283989706532	c093333033	\N	\N	150	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2024-08-26 18:40:24.761637	t	601
332	Leaves No. 2	Masson, Andre	https://en.wikipedia.org/wiki/Andr%C3%A9_Masson	1965	Signed and annotated "ep. artiste." Illustration from Album B of "Feuilles Eparses."	16 x 14"	Artist's Proof	991051076759706532	C103494993	\N	\N	900	2006	17362565	2019-08-30	2022-07-28 23:59:21.060879	2024-09-04 20:18:40.868191	f	600
880	Bottles (Flaschen)	Meckseper, Friedrich	https://de.wikipedia.org/wiki/Friedrich_Meckseper	1959	Signed, dated and numbered.	23.5 x 33.5"	"2/30"	991079339009706532	C103494814	\N	\N	500	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	613
701	Los Cafrades	Merida, Carlos	https://en.wikipedia.org/wiki/Carlos_M%C3%A9rida	\N	Signed and numbered.	\N	"32/50"	\N	C104971207	NON-CIRC	255 Doe	1000	2006	b18360611	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	615
742	Car Troubles and an Arch-Angel Reduced	Mersereau, Michael	\N	\N	Signed, titled and numbered.	11 x 18.5"	"1/10"	991078568009706532	C094893381	\N	\N	500	\N	\N	2019-09-12	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	616
733	Untitled	Merwart, Ludwig	https://en.wikipedia.org/wiki/Ludwig_Merwart	\N	Signed and and inscribed, "VII G + XI B + 10 R" (Is this the title?)	28 x 21.5"	\N	\N	C094893220	NON-CIRC	\N	1000	\N	b18366074	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	617
338	Bridge (Brucke)	Metz, Hans	\N	1957	Bad foxing.	25.5 x 33"	\N	991051284019706532	C104971872	\N	\N	200	2006	\N	2019-09-09	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	618
337	Edge of the City	Metz, Hans	\N	1956	Signed and numbered. Foxing in lower margin.	34 x 29"	"7/25"	991051284229706532	c093333194	\N	\N	200	2006	\N	2019-09-09	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	619
339	Grasshopper	Meyer, Jean S.	\N	\N	Signed and numbered.	23 x 17.5"	"7/14"	991051076559706532	c091134101	\N	\N	100	2006	\N	2019-09-16	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	620
340	Rocca Centro Laziale	Micossi, Mario	\N	1962	Signed and numbered.	17 x 21.75"	"11/70"	991051076499706532	c091134095	\N	\N	325	2006	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	621
341	Mutilados de paz (Wounded Peace)	Millares, Manolo	https://en.wikipedia.org/wiki/Manolo_Millares	1965	Signed and numbered in white pencil.	18.5 x 22"	"89/100"	991051076459706532	c091134059	\N	\N	300	2006	\N	2020-02-13	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	622
342	Nasturtiums	Millington, Terence	\N	1979	Signed and numbered.	20 x 21.5"	"47/75"	991051069659706532	c091134077	\N	\N	100	2006	\N	2019-12-09	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	623
734	Watering Can	Millington, Terence	\N	1978	Signed and numbered.	20.25 x 21.5"	"13/75"	991078559779706532	C094893363	\N	\N	500	\N	\N	2020-01-13	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	624
343	Les Cartes à Jouer	Milshtein, Zwy	https://atelier-milshtein.com/en/biography/	\N	Signed and numbered.	18.5 x 16"	"43/50"	991051069549706532	c091134031	\N	\N	200	2006	\N	2018-10-09	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	625
634	Panorama I	Milton, Peter	http://www.petermilton.com/	1963	Johnson 30. Signed and numbered.	\N	"20/35"	\N	C093332534	NON-CIRC	255 Doe	1200	2006	b16196902	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	626
510	Arbre (Tree)	Minami, Keiko	https://en.wikipedia.org/wiki/Keiko_Minami	1955	Signed and numbered.	19 x 20"	"16/50"	991051069589706532	C091134068	\N	\N	500	\N	17358704	2019-09-10	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	627
344	Jitensha no okurimono (Gift of a Bicycle)	Yokota, Minoru	\N	1975	Signed and numbered.	19.5 x 14"	"25/30"	991051069629706532	c091134040	\N	\N	500	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	628
695	Galerie Maeght	Miro, Joan	https://en.wikipedia.org/wiki/Joan_Mir%C3%B3	1949	Poster for Miro's gallery show.	27.5 x 21"	\N	\N	C103510815	NON-CIRC	255 Doe	1000	\N	b18360627	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	629
635	Eclipse	Miyasaki, George	http://www.georgemiyasaki.com/George_Miyasaki/George_Miyasaki.html	1979	Signed and numbered.	\N	"5/10"	\N	C093332668	NON-CIRC	\N	2200	2006	b16196903	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	631
345	Village on the Hill	Miyashita, Tokio	\N	1954	Signed and numbered.	19 x 15"	"2/20"	991051037139706532	c091132875	\N	\N	300	2006	\N	2019-09-11	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	632
1065	Dusk at the Playing Fields of Eton	Moholy-Nagy, Laszlo	https://en.wikipedia.org/wiki/L%C3%A1szl%C3%B3_Moholy-Nagy	1973	Photo-reproduction of a gelatin silver print from 1936.	13.5 x 15.5"	\N	991050880719706532	C103790686	\N	\N	\N	\N	\N	2019-08-29	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	633
347	Black on Red Image	Moore, Henry	https://en.wikipedia.org/wiki/Henry_Moore	1963	Cramer 42, Signed and numbered.	26.5 x 30"	"55/65"	\N	c093333343	NON-CIRC	\N	1600	2006	17667165, b16396496	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	634
346	Figures on a Green Background (Personnages sur fond vert)	Moore, Henry	https://en.wikipedia.org/wiki/Henry_Moore	1957	Signed and numbered. Severe lightstaining, Cramer 37, published by Berggruen & Cie and printed by Mourlot.	27.5 x 21.5"	"8/200"	\N	c093329406	NON-CIRC	\N	6000	2006	17740940, b16398202	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	636
550	Percenda	Morgan, Ruth	http://archive.bampfa.berkeley.edu/exhibition/87	1995	Signed and numbered. From the portfolio: "10 x 10 Ten Women Ten Prints."	24 x 24"	"40/75"	991053846009706532	c067069364	\N	\N	500	\N	\N	2019-08-30	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	638
1142	2350 B.C.E.	Mubarak, Cinque	https://cinque-mubarak.com/	2021	12-color screen print. Signed and numbered.	17 x 31"	\N	991085987134006532	C103796121	\N	\N	\N	\N	\N	\N	2022-09-21 16:53:24.457508	2022-09-21 16:53:24.457508	f	641
348	Young Girl Among the Reeds (Madchen Zwischen Blattpflanzen)	Muller, Otto	https://en.wikipedia.org/wiki/Otto_Mueller	1912	Unsigned.	21 x 27.5"	"?/500"	\N	c091132981	NON-CIRC	\N	1800	2006	b16388030	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	642
349	La colombe blanche	Mumprecht, Rudolf	https://de.wikipedia.org/wiki/Rudolf_Mumprecht	1950	Signed and numbered.	21.5 x 23.5"	"42/75"	991051284319706532	c093333185	\N	\N	400	2006	\N	2019-09-16	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	643
350	La Grande Paroi	Munch, Bernard	\N	1973	Signed "MUNCH" and numbered.	24 x 30"	"5/60"	991051284359706532	c093333176	\N	\N	500	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	644
353	After Fishing (Apres la peche)	Music, Zoran Antonio	https://en.wikipedia.org/wiki/Zoran_Mu%C5%A1i%C4%8D	1958	Signed and numbered.	25 x 31"	"59/120"	991051331739706532	c093329123	\N	\N	700	2006	17740924	2019-09-18	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	645
1036	Shoshun (Early Spring)	Nakazawa, Shin'ichi	https://www.artelino.com/articles/shinichi-nakazawa.asp	\N	Accompanied by a haiku: "The flowers around Yoshino River are now falling off / Because the wind is blowing / The wind fell not only flowers / But also the shadows"	31 x 22	"15/35"	991047232049706532	C103787099	\N	\N	\N	\N	Gift of Frances and Ben Burr	2019-08-28	2022-07-28 23:59:21.060879	2023-08-21 23:35:09.44607	f	649
351	Sienese Landscape (Paysage Siennois)	Music, Zoran Antonio	https://en.wikipedia.org/wiki/Zoran_Mu%C5%A1i%C4%8D	1956	Signed and numbered.	28 x 22"	"2/90"	991051331799706532	c093329266	\N	\N	700	2006	17740926	2019-08-30	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	646
352	Motif I	Music, Zoran Antonio	https://en.wikipedia.org/wiki/Zoran_Mu%C5%A1i%C4%8D	1959	Signed and numbered. Provenance: Otto Stangl.	23 x 33"	"8/140"	991051331679706532	c093328989	\N	\N	700	2006	17740922	2019-09-12	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	647
354	Still Life With Compote	Nash, Alfred	\N	1959	Signed and numbered.	27 x 25.5"	"5/20"	991051284389706532	C103786989	\N	\N	100	2006	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	650
1125	Downstream	Neeley, Kathleen	https://www.kathleenneeley.com/	2021	Five-color multi-block linocut. Part of the series "The Understory." Signed, titled, and numbered.	21 x 24"	\N	991085987124906532	ucb00155609	\N	\N	\N	\N	\N	\N	2022-09-21 16:53:24.350831	2022-09-21 16:53:24.350831	f	651
1124	Moss Lord	Neeley, Kathleen	https://www.kathleenneeley.com/	2020	Five-color multi-block linocut. Part of the series "The Understory." Signed, titled, and numbered.	21 x 24"	\N	991085987140206532	C103792310	\N	\N	\N	\N	\N	\N	2022-09-21 16:53:24.343409	2022-09-21 16:53:24.343409	f	652
1091	Dark Horse	Nelson, Madison	\N	2020	Signed and numbered by the artist.	14.5 x 17.5"	"8/8"	991054391189706532	\N	\N	\N	\N	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	653
1090	My Mustang	Nelson, Madison	\N	2019	Signed and numbered by the artist.	12 x 15"	"5/5"	991054391159706532	\N	\N	\N	\N	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	654
950	Bear with Predella	Nice, Don	http://www.donnice.com/	1976	Printed by Aaron Arnow; published by Parasol Press, Ltd., New York.	14 x 14"	"216/1000"	991036394339706532	C103787150	\N	\N	\N	\N	\N	2019-10-24	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	655
355	Lips	Neiman, Yehuda	https://fr.wikipedia.org/wiki/Yehuda_Neiman	1968	Signed and numbered.	34.5 x 32"	"10/60"	991051349919706532	c093329822	\N	\N	300	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	658
641	Diary July 8, 1968	Noda, Tetsuya	https://en.wikipedia.org/wiki/Tetsuya_Noda	1968	Signed. One dark fox mark.	38.5 x 37.5"	\N	\N	C093329813	NON-CIRC	\N	1100	2006	\N	2016-08-30	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	659
356	Circles	Norton, Tom	\N	1969	Signed and numbered.	25 x 31"	"13/98"	991051284559706532	C103494294	\N	\N	100	2006	\N	2019-08-29	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	660
357	Paesaggio No. 4	Gulino, Nunzio	https://it.wikipedia.org/wiki/Nunzio_Gulino	1953	Signed and numbered.	19 x 15"	"6/10"	991051036809706532	c091132866	\N	\N	700	2006	17318244	2018-09-29	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	662
1098	Untitled (Jumping Horse)	Obata, Chiura	https://en.wikipedia.org/wiki/Chiura_Obata	1960	Hand-signed by artist in bottom left corner. Printed at Uchida Press, Kyoto, Japan.	20 x 25.5u0094	\N	991056573529706532	C104987780	\N	\N	\N	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	663
358	The Hunt	O'Hara, Frederick	https://www.annexgalleries.com/artists/biography/1761/O'Hara/Frederick	1957	Signed and numbered.	25 x 21"	"111/210'	991051036849706532	c091132945	\N	\N	700	2006	17318248	2019-09-27	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	664
848	Brave and Noble	Ohmae, Hiroshi	http://www.moma.org/collection/artists/4383	1957	Signed, titled, dated and numbered.	17.25 x 26.75"	"32/200"	991078982879706532	C103496210	\N	\N	500	\N	\N	2017-08-23	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	665
359	Song of Mussel	Okamura, Kichiemon	\N	1973	Signed and numbered.	16 x 19"	"5/50"	991051036969706532	c091132963	\N	\N	200	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	666
1141	Lunar Landing	Okona, Chinwe	https://www.chinweokona.com/	2022	4-color screen print; printed on jet black suede mat board. Signed, numbered, and dated.	25 x 20.5"	\N	991085987134206532	C103796264	\N	\N	\N	\N	\N	\N	2022-09-21 16:53:24.451828	2022-09-21 16:53:24.451828	f	667
642	Sketch of Three-Way Plug	Oldenburg, Claes	https://en.wikipedia.org/wiki/Claes_Oldenburg	1965	AP 86. Signed. Appears to be numbered 22/50. Floated in mat.	38.5 x 31"	"22/50"	\N	C093329804	NON-CIRC	\N	1600	2006	b16398829	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	668
643	Typewriter Eraser	Oldenburg, Claes	https://en.wikipedia.org/wiki/Claes_Oldenburg	1970	Gemini 38. 18. Published by Gemini G.E.L. Signed and numbered. Edition of 100 plus 25 proofs.	16.25 x 12.75"	"11/100"	\N	C091132972	NON-CIRC	\N	2800	2006	b16388029	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	669
644	The Great Bird	Oliveira, Nathan	https://en.wikipedia.org/wiki/Nathan_Oliveira	1957	Signed and numbered	34 x 27.5"	"10/15"	\N	C093329433	NON-CIRC	\N	4500	2006	Done at 56th Street Studio, Oakland, California; moisture lower left corner; b16398242	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	670
551	Dark Days in the Abundant Blue Light of Paris	O'Neal, Mary Lovelace	https://en.wikipedia.org/wiki/Mary_Lovelace_O%27Neal	1995	From the portfolio: "10 x 10 Ten Women Ten Prints."	29 x 29"	\N	991051349769706532	c093329798	\N	\N	500	\N	\N	2019-09-06	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	671
854	Untitled	Onosato, Toshinobu	https://fr.wikipedia.org/wiki/Toshinobu_Onosato	1966	Signed, numbered and dated. Some fire damage on the edge of the print.	\N	"60/120"	\N	\N	NON-CIRC	Stored in box	5000	\N	b18413269	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	672
1101	Untitled (It's All Here)	Oparah, Nkiruka	http://www.nkirukaoparah.com/	2019	Hand-signed by artist on back. Detail in colored pencil.	18 x 21.5"	"3/4"	991056573609706532	C104987948	\N	\N	\N	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	674
360	Untitled	Ono, Tadashige	https://en.wikipedia.org/wiki/Tadashige_Ono	\N	Signed. Old Bridge in Leningrad, Russia.	15.5 x 19"	Artist's Proof	991051035869706532	C091132802	\N	\N	750	2006	\N	2019-08-30	2022-07-28 23:59:21.060879	2023-08-21 23:40:05.833323	f	673
361	Composition in Brown and Blue	Ostrower, Fayga	https://en.wikipedia.org/wiki/Fayga_Ostrower	1958	Signed and numbered.	33.5 x 23.5"	"3/30"	991051284599706532	C103532242	\N	\N	100	2006	\N	2019-09-26	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	676
860	Broken Black	Otterson, Jack	\N	1953	Signed, titled and numbered. Annotated E-32.	\N	"11/53"	991079188659706532	C103496405	\N	\N	750	\N	\N	2019-09-02	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	677
362	Eygalieris	Oudot, Roland	https://fr.wikipedia.org/wiki/Roland_Oudot	1956	Signed and numbered.	21 x 19"	"24/107"	991051035939706532	c091132820	\N	\N	300	2006	\N	2019-10-17	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	678
645	Wreathed Head	Oudot, Roland	https://fr.wikipedia.org/wiki/Roland_Oudot	\N	Annotaed "ep. d'artiste." Numbered. Lightstained.	18 x 15.5"	"II/X"	991051035909706532	C103494717	\N	\N	300	2006	\N	2019-09-02	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	679
1145	Passage	Paabus, Kristina	https://kristinapaabus.com/home.html	2021	Signed by artist.	24 x 29"	\N	991085987124706532	C103795853	\N	\N	\N	\N	\N	\N	2022-09-21 16:53:24.474193	2022-09-21 16:53:24.474193	f	680
363	The Weary Ploughman (The Herdsman)	Palmer, Samuel	https://en.wikipedia.org/wiki/Samuel_Palmer	1858	Lister 8 viii/viii, published in "A Selection of Etchings by the Etching Club" 1865.	17 x 19"	"8/8"	991051035979706532	C091132839	\N	\N	900	2006	\N	2012-09-18	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	681
364	Experience	Paolozzi, Eduardo	https://en.wikipedia.org/wiki/Eduardo_Paolozzi	1964	Plate from the portfolio "As Is When." Signed and numbered.	37 x 29"	"7/65"	991051284639706532	103790710	\N	\N	250	2006	17667176	2019-08-29	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	682
365	Honeycomb	Parnall, Peter	https://en.wikipedia.org/wiki/Peter_Parnall	1976	Signed and numbered.	25 x 17"	"307/1000"	991051036019706532	c091132848	\N	\N	60	2006	\N	2019-08-30	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	683
1089	Aloe	Pauwels, Nora	https://www.norapauwels.com/	2019	Signed and numbered.	25 x 19"	"2/5"	991054292149706532	\N	\N	\N	\N	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	684
646	Village Sunset (Reisebilder 1 - Thuringen)	Pechstein, Max (Pechstein, H. Max)	https://de.wikipedia.org/wiki/Max_Pechstein	1919	From the series "Reisebilder." Krüger L 306. One of 50 impressions. Signed.	\N	\N	\N	C091132857	NON-CIRC	Stored in box	1000	2006	b16388000	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	685
884	Mort de Monseigneur l'Archeveque de Paris	Pellerin	https://en.wikipedia.org/wiki/Auguste_Pellerin	1848	After Pellerin, printed by Epinal. Lower left hand corner, there is a blindstamp with a shield and the initals, "C.F."	21.25 x 16.75"	\N	991079581289706532	C103532093	\N	\N	500	\N	\N	2019-09-02	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	686
366	Penmacho	Perrin, Brian	\N	1961	Signed, titled, and numbered.	34 x 28.5"	"6/25"	991051284689706532	c093332853	\N	\N	350	2006	\N	2020-02-13	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	687
731	The Beach	Petit, Jacques	\N	1965	Signed and annotated "E.A."	25 X 27"	\N	991078559399706532	C094893497	\N	\N	900	\N	\N	2019-08-31	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	689
368	Portable	Pfeiffer, Werner	\N	\N	Signed and numbered. Water stains.	27.5 x 35.5"	"70/100"	991051284749706532	c093333307	\N	\N	200	2006	\N	2020-01-29	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	691
710	Flowers in a Vase	Picasso, Pablo	https://en.wikipedia.org/wiki/Pablo_Picasso	1950	\N	19.5 x 16"	\N	\N	C103510842	NON-CIRC	\N	3000	\N	b16398755	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	692
648	The Knife and the Apple (Le couteau et la pomme)	Picasso, Pablo	https://en.wikipedia.org/wiki/Pablo_Picasso	1947	Unsigned. For the book "Dans l'Atélier de Picasso" (In Picasso's Studio) published by Fernand Mourlot, Paris. Mourlot 78; Bloch 430.	18.25 x 21.5"	"?/50"	\N	C094905278	NON-CIRC	\N	2000	2006	b18361951	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	693
800	Profile of a Blond Woman (Femme Blonde de Profil)	Picasso, Pablo	https://en.wikipedia.org/wiki/Pablo_Picasso	1947	Numbered. Unsigned.	\N	"78/250"	\N	\N	NON-CIRC	\N	1500	\N	b18372005	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	694
647	Head of Satyr (Second Vallauris Poster - Deuxieme Affiche Vallauris)	Picasso, Pablo	https://en.wikipedia.org/wiki/Pablo_Picasso	1948	Signed in pencil and numbered. There is also a poster edition of 300 with letters. Mourlot 119b.	\N	"23/50"	\N	C104971368	NON-CIRC	255 Doe	3000	2006	b18361954	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	695
649	The Small Dove	Picasso, Pablo	https://en.wikipedia.org/wiki/Pablo_Picasso	1949	Unsigned. Bloch 600; Mourlot 174.	16.25 x 14"	"?/2500"	\N	C103495003	NON-CIRC	255 Doe	1100	2006	b16387981	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	696
369	Birds and Sunflower	Pierce, Leona	http://www.moma.org/collection/artists/4618	1961	Signed.	18.5 x 40"	\N	991051284779706532	c093333158	\N	\N	200	2006	\N	2020-03-08	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	697
370	Petworth Park Gates	Piper, John	https://en.wikipedia.org/wiki/John_Piper_(artist)	1965	Signed and numbered.	27.5 x 21.5"	Artist's Proof	991051284819706532	c093332844	\N	\N	700	2006	17667183	2019-08-29	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	699
650	Veduta della Facciata della Basilica di S. Croce in Gerusalemme	Piranesi, Giovanni Battista	https://en.wikipedia.org/wiki/Giovanni_Battista_Piranesi	1750	\N	\N	\N	\N	\N	NON-CIRC	Stored in box	1200	\N	b18361482	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	700
651	Veduta della Vasta Fontana di Trevi anticamenta detta l'Acqua Vergine	Piranesi, Giovanni Battista	https://en.wikipedia.org/wiki/Giovanni_Battista_Piranesi	1751	H 19; WE 145; F 883. Plate 19 from the series "Vedute di Roma."	\N	\N	\N	\N	NON-CIRC	Stored in box	1200	2006	b18361490	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	701
1081	Untitled, Circles	Pohlod, Meghan	http://www.meghanpohlod.com/	2020	Unsigned.	20.5 x 20.5"	\N	991054193479706532	C104988067	\N	\N	\N	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	702
938	Nuus	Polau, A.	\N	1969	Signed, titled and numbered.	12.5 x 16''	"2/20"	991034944539706532	C103787628	\N	\N	500.00	\N	\N	2019-09-10	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	703
883	Mother and Child	Poleo, Hector	https://es.wikipedia.org/wiki/H%C3%A9ctor_Poleo	1944	Signed and numbered.	23 x 27"	"31/120"	\N	C103495979	NON-CIRC	\N	5000	\N	b18503889	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	704
858	Composition in Blue, Black and Yellow (Composition bleue, noire et jaune)	Poliakoff, Serge	https://en.wikipedia.org/wiki/Serge_Poliakoff	1957	Signed and annotated "E.A."	\N	Artist's proof	\N	\N	NON-CIRC	Stored in box	5000	\N	b18413730	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	705
371	Aquarium	Polos, Theodore	http://art.famsf.org/theodore-c-polos	1935	Signed in black. Paper rippled overall. Watercolor.	31.5 x 25.5"	Artist's Proof	991051333189706532	c093329017	\N	\N	700	2006	17741790	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	706
527	Still Life With Flowers	Polos, Theodore	http://art.famsf.org/theodore-c-polos	1935	Signed. Watercolor.	25 x 30"	\N	991051333269706532	C093329293	\N	\N	700	2006	\N	2020-01-04	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	707
374	Summer Horizons	Ponce de Leon, Michael	https://en.wikipedia.org/wiki/Michael_Ponce_de_Leon	1958	Signed and numbered.	27 x 21"	"9/200"	991051284859706532	c093332987	\N	\N	150	2006	\N	2018-08-21	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	710
376	My Grandmother's Fan Without Everything Else Around It	Pond, Clayton	http://claytonpond.com/bio/	1968	Signed and numbered.	30.5 x 29.5"	"38/100"	991051353189706532	C093330086	\N	\N	250	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	711
375	My Modern Toaster-Heater-Oven	Pond, Clayton	http://claytonpond.com/bio/	1973	Signed and numbered.	25 x 31"	"49/100"	991051284889706532	c093333291	\N	\N	250	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	712
377	Tower of Babel	Pozzatti, Rudy	\N	1958	Signed and numbered.	33.5 x 27.5"	"10/15"	991051284929706532	c093333149	\N	\N	200	2006	\N	2015-01-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	714
378	Nuit de l'eau	Prassinos, Mario	https://en.wikipedia.org/wiki/Mario_Prassinos	1964	Signed and numbered.	35.5 x 28.5"	"56/100"	991051284989706532	C103494601	\N	\N	400	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	715
511	De Otras Mundos and Ella Era la Lune	Ramos Prida, Fernando	https://art.famsf.org/fernando-ramos-prida	1970	\N	20.5 x 13"	\N	991051393949706532	c093330518	\N	\N	500	\N	\N	2019-10-30	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	716
547	Kilauea Point	Prussing, Rosalie	\N	1990-1999	Signed and numbered.	22 x 22"	"64/750"	991053845899706532	c067069337	\N	\N	500	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	717
548	Na Pali Coast	Prussing, Rosalie	\N	1990-1999	Signed and numbered.	22 x 22"	"22/750"	991053845929706532	c067069346	\N	\N	500	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	718
379	Fusiori	Quentin, Bernard	https://fr.wikipedia.org/wiki/Bernard_Quentin	1960	Signed and numbered.	27 x 21"	"19/50"	991051035489706532	c091132699	\N	\N	150	2006	\N	2019-09-09	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	719
654	II Fish	Raffael, Joseph	https://en.wikipedia.org/wiki/Joseph_Raffael	1978	Signed and numbered.	\N	"28/50"	\N	C093329150	NON-CIRC	255 Doe	1000	2006	b16398240	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	720
653	A Raja on Horseback with Attendant	Rajput Jodphur School	\N	Early 19th century	Corners abraded with paint loss; a few creases in lower image.	20.5 x 16.5"	\N	\N	C103510994	NON-CIRC	\N	4500	2006	b18360188	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	721
380	Musicians	Rappe, Eleanor	\N	1977	Signed and inscribed "a/p."	13 x 16"	Artist's Proof	991051035579706532	c091132714	\N	\N	300	2006	\N	2019-09-05	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	722
381	White Iris	Rappe, Eleanor	\N	1979	Signed and numbered.	17.5 x 21"	"1/30"	991051035619706532	c091132723	\N	\N	300	2006	\N	2020-01-08	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	723
382	Corinne	Realier-Dumas, Maurice	https://fr.wikipedia.org/wiki/Maurice_R%C3%A9alier-Dumas	1897	One from a set from four lithographs. Signed in the stone lower left. Estampe Moderne blindstamp lower right.	18.5 x 14.5"	\N	991051035539706532	c091132705	\N	\N	300	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	724
801	Untitled, Red and Black Composition	Rebeyrolle, Paul	https://en.wikipedia.org/wiki/Paul_Rebeyrolle	1968	Proof-bearing signature printed lower right. Lower left stamp: "Maeght Editeur, Paris."	37.5 x 27.5"	\N	991078647849706532	C103493999	\N	OVERSIZED	500	\N	\N	2019-09-11	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	725
383	L'oiseau perdu	Rebeyrolle, Paul	https://en.wikipedia.org/wiki/Paul_Rebeyrolle	1969	Signed and numbered.	21 x 26"	"12/25"	991051285039706532	c093333130	\N	\N	500	2006	\N	2019-09-09	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	726
384	And He Percieves a Desert Studded with Mounds (Et il distingue une plaine aride et mamelonneuse)	Redon, Odilon	https://en.wikipedia.org/wiki/Odilon_Redon	1896	Unsigned, From the series, "Tentation de Saint-Antoine." Published by Blanchard, Paris. Mellerio 140; H 248; L 195.	19 x 16.5"	\N	991051029979706532	c091133806	\N	\N	700	2006	\N	2018-08-22	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	727
655	L'Intelligence fut a moi! Je devins le Buddha!	Redon, Odilon	https://en.wikipedia.org/wiki/Odilon_Redon	1896	From the series, "Tentation de Saint-Antoine." Published by Blanchard, Paris. Mellerio 145; H 320; L 220.	\N	"?/50"	\N	C091132741	NON-CIRC	Stored in box	1200	2006	b16387977	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	728
385	Ill. for Plantes and Grasses	Redoute, Pierre-Joseph	https://en.wikipedia.org/wiki/Pierre-Joseph_Redout%C3%A9	1799	From Candolle's Plantarum Succulentarium Historia, Paris. Foxing.	18.5 x 15"	\N	991051035329706532	c091132732	\N	\N	150	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	729
373	Maximal Gyre IV	Pomodoro, Arnaldo	https://en.wikipedia.org/wiki/Arnaldo_Pomodoro	1968	Signed and numbered. Full margins.	31 x 38.5"	"44/88"	99105135336970653	C093330101	\N	\N	350	2006	\N	2019-09-04	2022-07-28 23:59:21.060879	2023-08-25 00:01:38.574455	f	709
656	Circumcision in the Stable	Rembrandt (Rembrandt Harmenszoon van Rijn)	https://en.wikipedia.org/wiki/Rembrandt	1654	Unsigned. Bartsch 47, first state of two. Dark impression.	\N	\N	\N	\N	NON-CIRC	Stored in box	6000	2006	b18361494	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	730
387	Orange Cloud	Renner, Robin	\N	1969	Signed and numbered.	30.5 x 26"	"6/10"	991051285119706532	c093333273	\N	\N	50	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	732
386	Transplant	Renner, Robin	\N	1970	Signed and numbered.	29 x 23"	"6/10"	991051285159706532	c093333264	\N	\N	50	2006	\N	2019-08-30	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	734
659	Ambroise Vollard	Renoir, Pierre-Auguste	https://en.wikipedia.org/wiki/Pierre-Auguste_Renoir	1904	From "Album de Douze Lithographs." Unsigned. Fox marks.	17.25 x 14.25"	\N	\N	C103494869	NON-CIRC	255 Doe	3100	2006	b16387979	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	735
748	Female Study III	Reyes, Fernando	http://www.freyesart.com/about/	1998	Signed, titled and numbered.	17.25 x 17.5"	"1/35"	991078568369706532	C094893673	\N	\N	500	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	739
729	Sorrento Harbour	Reyes, Fernando	http://www.freyesart.com/about/	2000	Signed and numbered.	17 x 15"	"8/27"	991078545049706532	C094893345	\N	\N	500	\N	\N	2019-09-01	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	740
388	Composition	Rezvani, Serge	\N	1958	Signed and numbered.	25.5 x 31.5	"7/30"	991051285199706532	c093333255	\N	\N	200	2006	\N	2019-09-06	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	741
830	View of a Village and a Woman Frightened by a Snake	Ricci, Marco	https://en.wikipedia.org/wiki/Marco_Ricci	1723-1730	Center fold; perhaps two plates. Paper rather light.	\N	\N	\N	\N	NON-CIRC	Stored in box	2500	2006	b16387980	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	742
389	Change	Rice, Brian	https://en.wikipedia.org/wiki/Brian_Rice_(artist)	1969	Signed and numbered.	30 x 30.75"	"97/125"	991051352869706532	C093330077	\N	\N	450	2006	\N	2019-08-29	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	743
390	6 Squares on Green	Rice, Brian	https://en.wikipedia.org/wiki/Brian_Rice_(artist)	1969	Signed and numbered.	30.5 x 28.5"	"50/70"	991051352849706532	C093330068	\N	\N	450	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	744
391	Quartet - No. 3 Scherzo	Richards, Jeanne Herron	https://mona.unk.edu/collection/ricjea1.shtml	\N	Signed and numbered.	21.5 x 21.5"	"3/8"	991051035189706532	c091132778	\N	\N	150	2006	\N	2019-09-09	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	745
393	Clown with Flute	Righi, Federico	\N	1970	Signed and numbered.	22.5 x 29"	"92/100"	991051285269706532	c093332978	\N	\N	350	2006	\N	2019-09-10	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	747
825	Untitled Pastel	Rinehart, Rick	\N	\N	Pastel on paper.	22.75 x 28.75"	\N	991078662529706532	C103494504	\N	\N	500	\N	\N	2019-08-27	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	748
660	Untitled	Rivera, Gustavo	http://www.gustavoramosrivera.com/	1979	Signed and numbered.	34.5 x 26.5"	"11/70"	\N	C093329424	NON-CIRC	255 Doe	1500	2006	b16398238	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	750
943	A Square with Four Squares Cut Away	Mangold, Robert	https://en.wikipedia.org/wiki/Robert_Mangold	1976	Printed by Aaron Arnow; published by Parasol Press, Ltd., New York.	14 x 14"	"216/1000"	991036393559706532	C104974801	\N	\N	\N	\N	\N	2018-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	751
953	Untitled	Mangold, Robert	https://en.wikipedia.org/wiki/Robert_Mangold	1995	Signed and numbered.	\N	"4/14"	991036394559706532	C104974838	\N	\N	\N	\N	\N	2017-08-23	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	752
1062	Home for Christmas	Robbins, Frederick	\N	\N	Signed and titled.	12" x 15.5"	\N	991050051069706532	C103790613	\N	\N	\N	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	753
827	Mr. Charles	Robinson, Coygon, Jr.	https://evansrobinsonjr.artspan.com/home#.V6URJlUrLxk	2006	Signed, titled and numbered.	19.5 x 14.5"	"114/750"	991078752969706532	C103495748	\N	\N	500	\N	\N	2019-08-29	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	754
394	Cello Player	Rocker, Fermin	https://en.wikipedia.org/wiki/Fermin_Rocker	1940	Signed.	13 x 16.5"	\N	991051035219706532	c091132769	\N	\N	400	2006	\N	2019-09-11	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	755
565	La Loteria III	Rodriguez, Artemio	http://www.letterpress.com/greenknight/page3.htm	1996	Signed and numbered.	21 x 19"	44/50	991053875229706532	C098422628	\N	\N	500	\N	\N	2019-09-16	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	757
559	El Rey de las Cosas	Rodriguez, Artemio	http://www.letterpress.com/greenknight/page3.htm	2001	Signed and numbered.	28 x 23.5"	"30/75"	991053875269706532	C098422619	\N	\N	500	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	758
558	Sinfonia Para Los Dioses	Rodriguez, Artemio	http://www.letterpress.com/greenknight/page3.htm	1995	Signed and numbered.	21 x 20"	"2/5"	991053875349706532	C098422567	\N	\N	500	\N	\N	2019-09-10	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	759
395	The Shepherd	Rolling, Karl	\N	1955	Signed and numbered.	22.5 x 26.5"	"134/150"	991051285329706532	C104972007	\N	\N	100	2006	\N	2019-09-05	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	760
661	Democritus in Meditation	Rosa, Salvator	https://en.wikipedia.org/wiki/Salvator_Rosa	1662	\N	27.5 x 19.5"	\N	\N	C093329080	NON-CIRC	\N	1600	\N	b16398095	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	762
662	Jason and the Dragon	Rosa, Salvator	https://en.wikipedia.org/wiki/Salvator_Rosa	1663-1664	Paper looks old and in nice condition.	20.5 x 16"	\N	\N	C091132626	NON-CIRC	\N	1600	2006	b16387943	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	763
1045	Untitled, Christ and Pontius Pilate	Rouault, Georges	https://en.wikipedia.org/wiki/Georges_Rouault	1935	An illustration to André Suarès "Passion," published in 1939. Lettered with Rouault's initials on block.	16 x 20"	\N	991048765829706532	C103790367	\N	\N	\N	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	767
512	Jo Baker's Birthday	Ringgold, Faith	https://en.wikipedia.org/wiki/Faith_Ringgold	1995	Signed and numbered. From the portfolio: "10 x 10 Ten Women Ten Prints."	26 x 25"	"15/75"	991051285299706532	c093332835	\N	\N	500	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2024-09-05 22:00:23.185202	f	749
396	Death Took Him as He Rose From a Bed of Nettles (La mort l'a pris comme il sortait du lit d'orties )	Rouault, Georges	https://en.wikipedia.org/wiki/Georges_Rouault	1948	Unsigned.	29 x 21"	Plate 45	991051285399706532	c093333103	\N	\N	600	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	768
397	The Rivals	Rowlandson, Thomas	https://en.wikipedia.org/wiki/Thomas_Rowlandson	1807	Colors very fresh. Good condition except for discoloration in the corners. In lower right, "pub. July 14 1811 by J Rowlandson..."	19 x 15.5"	\N	991051035259706532	c091132750	\N	\N	150	2006	\N	2019-09-10	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	770
400	Bellezas de Trinidad	Sanchez, Emilio	https://en.wikipedia.org/wiki/Emilio_Sanchez_(artist)	1976	Signed and numbered.	34 x 28"	"21/50"	991051285579706532	C093333246	\N	\N	300	2006	\N	2019-09-04	2022-07-28 23:59:21.060879	2024-09-04 21:13:29.043045	f	781
665	Iowa Landscape	Rutherford, Erica	\N	1973	\N	28 x 33"	\N	991078486649706532	C094905135	\N	\N	500	\N	missing	2011-08-25	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	773
1119	When I Was Your Age This Was All Orchards	Ryan, David	\N	2020	3-color Riso print.	18.5 x 15.5"	\N	991085987125106532	C103791893	\N	\N	\N	\N	\N	\N	2022-09-21 16:53:24.243187	2022-09-21 16:53:24.243187	f	774
668	Nara, Ancient City	Saito, Kiyoshi	https://en.wikipedia.org/wiki/Kiyoshi_Sait%C5%8D	1957	Signed and numbered.	21.5 x 27"	"65/200"	\N	C091132617	NON-CIRC	\N	1200	2006	b16387942	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	776
669	Toriemoto, Kyoto	Saito, Kiyoshi	https://en.wikipedia.org/wiki/Kiyoshi_Sait%C5%8D	1971	Numbered.	19 x 22.5"	"95/200"	\N	C091132635	NON-CIRC	\N	1200	2006	b16387945	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	778
928	One Against Many	Salemme, Attilio	http://www.moma.org/collection/artists/5122?locale=en	1946	No. 81	19 x 14.5''	No. 81	991011627579706532	C103788303	\N	\N	\N	\N	\N	2019-09-06	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	779
1134	Bajo el nopal	Sanchez Santamaria, Sergio	https://www.annexgalleries.com/artists/biography/4384/Santamaria/Sergio	2020	Signed and numbered. From the portfolio "Dioses y petates."	19 x 25"	\N	991085987134706532	C103796024	\N	\N	\N	\N	\N	\N	2022-09-21 16:53:24.409115	2022-09-21 16:53:24.409115	f	782
1135	Culebra en el Petate	Sanchez Santamaria, Sergio	https://www.annexgalleries.com/artists/biography/4384/Santamaria/Sergio	2020	Signed and numbered. From the portfolio "Dioses y petates."	19 x 25"	\N	991085987134606532	C103795880	\N	\N	\N	\N	\N	\N	2022-09-21 16:53:24.41517	2022-09-21 16:53:24.41517	f	783
1136	Dios Encerrado	Sanchez Santamaria, Sergio	https://www.annexgalleries.com/artists/biography/4384/Santamaria/Sergio	2020	Signed and numbered. From the portfolio "Dioses y petates."	19 x 25"	\N	991085987134406532	C103795899	\N	\N	\N	\N	\N	\N	2022-09-21 16:53:24.421065	2022-09-21 16:53:24.421065	f	784
1137	Mascara de Guerrero	Sanchez Santamaria, Sergio	https://www.annexgalleries.com/artists/biography/4384/Santamaria/Sergio	2020	Signed and numbered. From the portfolio "Dioses y petates."	19 x 25"	\N	991085987140806532	C103796237	\N	\N	\N	\N	\N	\N	2022-09-21 16:53:24.426981	2022-09-21 16:53:24.426981	f	785
1133	Quetzalcoatl	Sanchez Santamaria, Sergio	https://www.annexgalleries.com/artists/biography/4384/Santamaria/Sergio	2020	Signed, titled, and numbered.	19 x 25"	\N	991085987140706532	C103796228	\N	\N	\N	\N	\N	\N	2022-09-21 16:53:24.403212	2022-09-21 16:53:24.403212	f	786
1033	Monsieur Fonstecut, Attorney at the Green Building	Sariano, Jean	\N	1972	Signed and numbered.	\N	\N	991046415369706532	C103786943	\N	\N	\N	\N	Purchased from the gift of Helen and Madeline Pardee.	2019-09-05	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	787
401	X-Rated Was Never Like That!	Sariano, Jean	\N	1979	Signed and numbered.	20 x 29"	"81/99"	991051285609706532	C093333237	\N	\N	350	2006	\N	2020-01-26	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	788
1096	(Cross-section)	Sato, Ezra	\N	2021	\N	12.25 x 14.25"	\N	991056572839706532	\N	\N	\N	\N	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	789
1097	I MET A GHOST WALKING BACK FROM THE FOG	Sato, Ezra	\N	2019	\N	12.5 x 10.5"	\N	991056572849706532	\N	\N	\N	\N	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	790
1117	The Mask Collector	Sato, Rob	https://www.robsato.com/	2020	Printed by Tiny Splendor. From the exhibition "Car Crash Picnic."	15.5 x 19"	\N	991085987125406532	C103792028	\N	\N	\N	\N	\N	\N	2022-09-21 16:53:24.125898	2022-09-21 16:53:24.125898	f	791
1039	Untitled, Skyscape	Sawada, Tetsuro	\N	\N	\N	31 x 24.5"	"28/40"	991047232229706532	C103787123	\N	\N	\N	\N	Gift of Frances and Ben Burr	2019-09-09	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	792
402	Untitled	Schapiro, Miriam	https://en.wikipedia.org/wiki/Miriam_Schapiro	1962	Annotated "A/P."	22.5 x 21"	Artist's Proof	991051034909706532	C091132787	\N	\N	600	2006	\N	2019-10-23	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	794
671	Figure H 2 (from "Bauhaus Mappe")	Schlemmer, Oskar	https://en.wikipedia.org/wiki/Oskar_Schlemmer	1921	Signed in pencil. Soft crease, right margin. Original pink tone of paper totally faded.	27.5 x 21.5"	\N	\N	C093330156	NON-CIRC	\N	4500	2006	b16398938	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	795
403	Marine Flora	Schmidt, Charlotte	\N	1957	Signed and numbered.	22 x 28"	"2/5"	991051285679706532	C093333228	\N	\N	100	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	796
878	Man Reading (Lesender Mann)	Schmidt-Rottluff, Karl	https://en.wikipedia.org/wiki/Karl_Schmidt-Rottluff	1921	Unsigned. Title and author found on back of print. Circulating copy.	13.5 x 16.75"	\N	991078776859706532	C103532260	\N	\N	750	\N	\N	2019-09-10	2022-07-28 23:59:21.060879	2022-09-08 18:27:41.041801	t	797
399	Paris Watersong	Runacher, Suzanne	https://www.annexgalleries.com/artists/biography/2064/Runacher/Suzanne	\N	Signed and numbered.	25 x 24.5"	"25/70"	991051285499706532	c093332950	\N	Graduate Services Dissertation Room	100	2006	\N	2019-09-06	2022-07-28 23:59:21.060879	2023-08-21 23:42:43.274341	f	772
920	Ryoan-ji, Kyoto	Saito, Kiyoshi	https://en.wikipedia.org/wiki/Kiyoshi_Sait%C5%8D	1960	\N	23.5 x 28.5"	\N	991008719819706532	C104939566	\N	\N	\N	\N	\N	2019-09-04	2022-07-28 23:59:21.060879	2023-09-05 15:25:22.720258	f	777
528	Untitled	Scarpa, Gino	https://no.wikipedia.org/wiki/Gino_Scarpa	1969	Aquatint etching and carborundum on black paper.	23 x 27"	\N	991051034679706532	C091132644	\N	\N	300	2006	\N	2019-09-19	2022-07-28 23:59:21.060879	2024-09-05 17:01:02.088263	f	793
155	A Bouquet	Elman, Emily Schorr	\N	1957	Signed and numbered.	19 x 19"	"36/200"	991051347239706532	C103790677	\N	\N	100	2006	Another impression is in the permanent collection of the Butler Institute.	2018-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	798
1102	Boisson D'Avril	Schuster, Julian	\N	2019	Hand-colored. Signed by the artist.	21 x 33"	"6/30"	991056573429706532	C104987939	\N	\N	\N	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	799
404	Die Sitzung mit E.T.A. Hoffman	Schwarz, Reiner	https://de.wikipedia.org/wiki/Reiner_Schwarz	1970	Signed and numbered.	18 x 25.5"	"51/75"	991051034619706532	C104971854	\N	\N	250	2006	\N	2019-10-17	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	800
711	The Injection (Die Injektion)	Schwarz, Reiner	https://de.wikipedia.org/wiki/Reiner_Schwarz	1971	Signed and numbered.	23 x 18''	"45/50"	991078495919706532	C094904991	\N	\N	500	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	801
406	Abstract XII	Schwitters, Kurt	https://en.wikipedia.org/wiki/Kurt_Schwitters	1919	Unsigned. From "Das Kestnerbuch" published by Heinrich Böhme Verlag.	13 x 11"	\N	991051029899706532	C091133790	\N	\N	500	2006	\N	2019-09-09	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	802
405	Das Dirndl-Modell	Schwarz, Reiner	https://de.wikipedia.org/wiki/Reiner_Schwarz	1969	Signed and numbered.	25 x 19"	"48/100"	991051034579706532	C091132608	\N	\N	100	2006	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	804
789	White Rain	Segal, George	https://en.wikipedia.org/wiki/George_Segal_(artist)	1978	Signed.	35 x 27"	\N	991078638599706532	C104971748	\N	\N	750	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	805
407	My Son (Gaka no shonen - Artist's Boy)	Sekino, Jun'ichiro	\N	1956	Signed and numbered.	21.5 x 27.5"	"18/30"	991051328089706532	C093328961	\N	\N	900	2006	17737769	2019-08-29	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	806
672	Dancer (Danseuse)	Severini, Gino	https://en.wikipedia.org/wiki/Gino_Severini	1956	Signed and numbered. Paper browned. M 27. Provenance: Berggruen & Cie.	32.5 x 23.5"	"82/200"	\N	C093329372	NON-CIRC	\N	1800	2006	b16398101	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	807
673	Still Life (Nature Morte)	Severini, Gino	https://en.wikipedia.org/wiki/Gino_Severini	1956	Singed and annotated "Epreuve d'artiste."	27.5 x 21.5"	\N	\N	C091132547	NON-CIRC	\N	1800	2006	b16387933	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	808
674	Lute and Molecules, No. 2	Shahn, Ben	https://en.wikipedia.org/wiki/Ben_Shahn	1958	P 30. Signed and inscribed "e.a." Some soft creases. Handcolored.	40 x 30"	"?/100"	\N	C093330031	NON-CIRC	Graduate Services Dissertation Room	1000	2006	b16398912	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	809
675	Mine Building	Shahn, Ben	https://en.wikipedia.org/wiki/Ben_Shahn	1956	Signed and annotated " Theorem." P 22.	23 x 34"	\N	\N	C093329099	NON-CIRC	\N	2000	2006	b16398099	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	810
676	Phoenix	Shahn, Ben	https://en.wikipedia.org/wiki/Ben_Shahn	1952	Signed and numbered.	33 x 23.5"	"75/100"	\N	C093329239	NON-CIRC	\N	2200	2006	b16398100	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	811
408	Portrait of D	Singer, Arnold	\N	\N	Signed.	28 x 22.5"	Artist's Proof	991051285759706532	C093332808	\N	\N	200	2006	\N	2019-09-09	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	815
678	Guardian of the Peace (El guardian de la paz)	Siqueiros, David Alfaro	https://en.wikipedia.org/wiki/David_Alfaro_Siqueiros	1945	\N	19 x 16"	\N	\N	C103494726	NON-CIRC	255 Doe	1800	2006	b16387935	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	816
679	Standing Figure Reading a Book	Skippe, John	\N	1781	Looks mounted on old sheet with watercolored border.	\N	\N	\N	C091132574	NON-CIRC	Stored in box	1500	2006	b16387936	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	817
680	Standing Saint with a Book	Skippe, John	\N	1781	Looks mounted on old sheet with watercolored border.	\N	\N	\N	C091133879	NON-CIRC	Stored in box	1400	2006	b16387789	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	818
809	Wieża Babel II (Tower of Babel II)	Skorczewski, Krzysztof	http://www.skorczewski.com/en/artist/biography.html	1983	Signed and numbered. Annotated "E.O."	23.5 x 20"	"20/20"	991078655079706532	C104970869	\N	\N	600	\N	\N	2018-08-22	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	819
942	Six Inches Four Ways	Mangold, Sylvia	https://en.wikipedia.org/wiki/Sylvia_Plimack_Mangold	1976	Printed by A. Colish Press; published by Parasol Press, Ltd., New York.	14 x 14"	"216/1000"	991036393519706532	C104974643	\N	\N	\N	\N	\N	2019-09-07	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	821
409	Nu	Smiechowska, Krystyna	\N	1969	Full margins.	38 x 30.5"	"9/20"	991051352699706532	C093330022	\N	\N	100	2006	\N	2019-09-24	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	822
1029	Untitled, Gray Composition	Smith, Gordon	https://en.wikipedia.org/wiki/Gordon_A._Smith	1971	Signed and dated by the artist.	13.5 x 16"	"13/75"	991044527969706532	\N	\N	\N	\N	\N	Gift of Amy Baker Sandback	2019-09-03	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	823
410	Tyger-Tyger	Smith, Maren	\N	1958	Signed and numbered.	26 x 21.5"	"1/1"	991051034539706532	C091132583	\N	\N	100	2006	\N	2019-10-23	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	824
683	Composition in Gold and Black	Soulages, Pierre	https://en.wikipedia.org/wiki/Pierre_Soulages	1957	Signed and numbered.	27.5 x 21.5"	"61/100"	\N	C093329257	NON-CIRC	\N	2500	2006	b16398196	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	828
684	Composition with Red	Soulages, Pierre	https://en.wikipedia.org/wiki/Pierre_Soulages	1957	Signed and numbered.	27.5 x 21.5"	"37/100"	\N	C093329114	NON-CIRC	\N	2500	2006	b16398197	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	829
513	Two Lovers	Shapiro, Shmuel	\N	1966	Signed and numbered.	24 x 26"	"14/100"	991051034419706532	C104941706	\N	\N	500	\N	\N	2019-09-15	2022-07-28 23:59:21.060879	2023-09-20 19:39:23.534605	f	812
1028	Untitled, Orange Stairs	Smith, Gordon	https://en.wikipedia.org/wiki/Gordon_A._Smith	1971	Signed by the artist and inscribed "Best Wishes."	14.5 x 14.5"	\N	991044527879706532	C104947612	\N	\N	\N	\N	Gift of Amy Baker Sandback	2019-08-28	2022-07-28 23:59:21.060879	2024-09-04 21:18:06.403608	f	826
807	Untitled, Grazing Horse	Levy, Nat	\N	\N	Signed. Watercolor. Gift of Clara Shirpser-Levy.	23.5 x 29"	\N	991078654709706532	C104970841	\N	\N	750	\N	\N	2019-09-05	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	538
515	Rhino Print	Unknown	\N	1989	Signed and numbered. Unable to read signature. South African artist.	15 x 11"	\N	991053841569706532	c067068342	\N	\N	50	2006	\N	2019-09-03	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	831
413	Mother and Child	Soyer, Raphael	https://en.wikipedia.org/wiki/Raphael_Soyer	1965	Signed and numbered. Published by Associated American Artists, New York. From the portfolio "Sixteen Etchings by Raphael Soyer."	18 x 16"	"62/85"	991051031759706532	C091132529	\N	\N	250	2006	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	833
414	Aeneid 7/12	Spahr, Herlinde	http://www.herlindespahr.com/herlindespahr.com/HOME.html	1982	Signed and numbered. From "Picturae Cassae, " illustrations of Virgil's "Aeneid."	23.5 x 27.5"	"5/25"	991051285829706532	C093334268	\N	\N	500	2006	\N	2019-08-29	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	834
416	Accident	Spahr, Herlinde	http://www.herlindespahr.com/herlindespahr.com/HOME.html	1986	Signed and numbered.	16 x 19.5"	"6/20"	991051031649706532	C091132404	\N	\N	650	2006	17311167	2019-09-02	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	835
415	Aeneid 4/12	Spahr, Herlinde	http://www.herlindespahr.com/herlindespahr.com/HOME.html	1983	Signed and numbered. From "Picturae Cassae, " illustrations of Virgil's "Aeneid."	24 x 31"	"8/25"	991051285789706532	C093332941	\N	\N	500	2006	\N	2019-08-29	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	836
417	San Francisco House No. 4	Spohn, Marvin	\N	1971	Signed and annotated "a/p."	26 x 19"	Artist's Proof	991051031619706532	C091132413	\N	\N	150	2006	\N	2017-09-05	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	837
816	Stones (Galets)	Springer, Ferdinand	https://fr.wikipedia.org/wiki/Ferdinand_Springer	1967	Signed and numbered. Blind stamp in lower left corner, "La Couriere, Paris."	20 x 41"	"27/75"	991078661589706532	C104970683	\N	OVERSIZED	750	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	838
788	Black Friday	Spruance, Benton	http://www.nga.gov/content/ngaweb/Collection/artist-info.2759.html	1958	Signed, titled, dated and numbered. Iniatials in lower right corner.	28.5 x 20.25"	"17/210"	991078640549706532	C103494434	\N	\N	800	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	840
421	Window	Staack, Zora	\N	\N	Signed and inscribed "épreuve d'artiste"	29.5 x 22.5"	Artist's Proof	991051285909706532	C093334240	\N	\N	200	2006	\N	2019-09-09	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	842
420	Guitar Player	Stack, Frank	\N	\N	Signed and numbered.	13.5 x 17.25"	"3/10"	991051031539706532	C091132431	\N	\N	125	2006	\N	2018-08-21	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	843
1085	Feet	Stark, Lucy	https://lucystark.com/	2017	\N	21 x 25"	\N	991054291969706532	\N	\N	\N	\N	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	845
1086	Trash	Stark, Lucy	https://lucystark.com/	2017	\N	21 x 25"	\N	991054292029706532	\N	\N	\N	\N	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	846
1087	Fruit Salad	Stark, Lucy	https://lucystark.com/	2016	Arrangement of four prints designed to resemble tiled wallpaper.	33.5 x 33.5"	\N	991054292049706532	\N	\N	\N	\N	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	847
422	Two Figures - Two Animals	Stasack, Edward	http://www.nga.gov/content/ngaweb/Collection/artist-info.34034.html	1957	Signed and numbered.	26 x 31"	"25/30"	991051331559706532	C093329390	\N	\N	900	2006	17740902	2018-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	848
423	Untitled	Stasik, Andrew	http://americanart.si.edu/collections/search/artist/?id=4608	1962	Signed and inscribed "artist's proof."	27 x 32"	Artist's Proof	991051285959706532	C093334222	\N	\N	200	2006	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	850
424	San Francisco - Oakland Bay Bridge	Stern, Alexander	\N	1936	Signed.	17 x 21"	Artist's Proof	991051031579706532	C091132422	\N	\N	200	2006	\N	2019-10-11	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	851
425	Stonehenge	Stevens, Norman	\N	1976	Signed and numbered.	13 x 15"	"67/100"	991051031389706532	C091132477	\N	\N	200	2006	\N	2019-10-10	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	852
427	Around a Violet Center	Stokoe, Michael	\N	1969	Signed and numbered. Publisher: Editions Alecto.	33 x 30"	"46/50"	991051286039706532	C093334204	\N	\N	250	2006	\N	2019-09-02	2022-07-28 23:59:21.060879	2023-08-28 19:41:26.289257	f	854
419	Spectre of Moby Dick	Spruance, Benton	http://www.nga.gov/content/ngaweb/Collection/artist-info.2759.html	1963	One of 10 artist's proofs before the offset lithograph book edition of "Moby Dick."	34.5 x 27.5"	Artist's Proof	991051332959706532	C104974421	\N	\N	800	2006	17741770	2019-09-03	2022-07-28 23:59:21.060879	2023-09-05 15:23:21.580392	f	841
412	Lipstick	Soyer, Raphael	https://en.wikipedia.org/wiki/Raphael_Soyer	1965	Signed and numbered. Published by Associated American Artists, New York. From the portfolio "Sixteen Etchings by Raphael Soyer."	18 x 16"	"55/85"	991051031719706532	C103787576	\N	\N	350	2006	\N	2019-09-05	2022-07-28 23:59:21.060879	2023-09-05 19:01:15.320743	f	832
426	Untitled (Still Life with Fruit)	Stocker, Carlotta	\N	1953	Signed and numbered.	27 x 33.5"	"32/43"	991051285999706532	C103532251	\N	\N	350	2006	\N	2019-08-29	2022-07-28 23:59:21.060879	2023-09-14 01:03:37.605449	f	853
418	Untitled	Springer, Ferdinand	https://fr.wikipedia.org/wiki/Ferdinand_Springer	1960	Signed and numbered.	27.5 x 21.5"	"22/75"	991051285869706532	C104974768	\N	\N	200	2006	\N	2019-09-05	2022-07-28 23:59:21.060879	2023-10-15 16:37:50.074078	f	839
524	Orchard	Stasik, Andrew	http://americanart.si.edu/collections/search/artist/?id=4608	1965	Signed and numbered.	34 x 26"	\N	991051285929706532	C093334231	\N	\N	500	\N	\N	2019-09-08	2022-07-28 23:59:21.060879	2024-09-04 21:30:34.35033	f	849
428	Turkish Toy II	Stone, Gwen	https://lostartsalon.com/collections/gwen-stone	1960	Signed and numbered.	13 x 18.5"	"8/35"	991051031349706532	C091132510	\N	\N	100	2006	\N	2019-09-02	2022-07-28 23:59:21.060879	2024-09-04 21:35:02.402527	f	855
539	Protest March	Unknown	\N	\N	Signed and numbered. Unable to read signature. South African artist.	17 x 11.5"	\N	991053843579706532	c091132538	\N	\N	500	\N	\N	2019-09-05	2022-07-28 23:59:21.060879	2024-09-05 20:35:28.367883	f	1102
949	Untitled (Rubber Stamp Portfolio)	Stout, Myron	https://en.wikipedia.org/wiki/Myron_Stout	1976	Printed by A. Colish Press; published by Parasol Press, Ltd., New York.	14 x 14"	"216/1000"	991036394259706532	C104974829	\N	\N	\N	\N	\N	2019-08-31	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	856
429	Pine Trees and Sun	Sugimoto, Henry	https://en.wikipedia.org/wiki/Henry_Sugimoto	1957	Oiginal International Graphic Arts Society label on back.	26 x 21"	\N	991051286079706532	C093334064	\N	\N	400	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	857
430	Basholi	Summers, Carol	https://en.wikipedia.org/wiki/Carol_Summers	1980	Signed and numbered. Published by Associated American Artists, New York (Summers 161).	29 x 41"	"76/125"	991051286109706532	C093334073	\N	\N	800	2006	17667230	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	858
431	Bundi	Summers, Carol	https://en.wikipedia.org/wiki/Carol_Summers	1980	From the series "Inside the Palace, a Bow to India." Good condition.	14 x 14"	"?/200"	991051031459706532	C091132459	\N	\N	225	2006	\N	2019-08-29	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	859
435	Kulu	Summers, Carol	https://en.wikipedia.org/wiki/Carol_Summers	1980	Signed and numbered. From the series "Inside the Palace, a Bow to India." Good condition.	14 x 14"	"19/200"	991051031169706532	C091132370	\N	\N	225	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	861
436	Malwa	Summers, Carol	https://en.wikipedia.org/wiki/Carol_Summers	1980	From the series "Inside the Palace, a Bow to India." Good condition.	14 x 14"	"49/200"	991051031209706532	C091132495	\N	\N	225	2006	\N	2019-08-30	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	862
434	Mankot	Summers, Carol	https://en.wikipedia.org/wiki/Carol_Summers	1980	From the series "Inside the Palace, a Bow to India." Good condition.	14 x 14"	"?/200"	991051030119706532	C091133897	\N	\N	225	2006	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	863
432	Nurpur	Summers, Carol	https://en.wikipedia.org/wiki/Carol_Summers	1980	From the series "Inside the Palace, a Bow to India." Good condition.	14 x 14"	"?/200"	991051031489706532	C091132440	\N	\N	225	2006	\N	2019-08-30	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	864
437	Puerta del Sol	Summers, Carol	https://en.wikipedia.org/wiki/Carol_Summers	1976	Edition of 75	20 x 20"	"?/75"	991051331649706532	C093328970	\N	\N	700	2006	17740908	2019-08-31	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	865
1147	Dark Images	Sun, Deth P	https://www.dethpsun.com/	2021	Printed at Tiny Splendor in Oakland, CA. Signed and dated.	18 x 22"	\N	991085987124506532	C103795862	\N	\N	\N	\N	\N	\N	2022-09-21 16:53:24.486199	2022-09-21 16:53:24.486199	f	866
517	Fountain	Sutherland, Graham	https://en.wikipedia.org/wiki/Graham_Sutherland	1965	Signed and numbered.	37 x 29.5"	\N	\N	C093334082	NON-CIRC	\N	1200	\N	b16396544	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	867
685	Insect	Sutherland, Graham	https://en.wikipedia.org/wiki/Graham_Sutherland	1963	Signed and numbered. Edition of 65 plus 13 additional artist's proofs. Published in "Europäische Graphik I" and printed by Emil Matthieu, Zurich.	35 x 29"	"55/65"	\N	C093329248	NON-CIRC	\N	1200	2006	b16398104	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	868
686	Crimson Nude	Sutton, Philip	https://en.wikipedia.org/wiki/Philip_Sutton_(artist)	1969	Signed and numbered.	36.5 x 21"	"40/50"	\N	C093330013	NON-CIRC	\N	1000	2006	b16398910	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	869
439	Circus Bicyclist	Swanson, John August	https://en.wikipedia.org/wiki/John_August_Swanson	1982	Signed and annotated "A.P."	32 x 24"	Artist's Proof	991051286169706532	C104971881	\N	\N	450	2006	\N	2019-09-05	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	870
770	Acrobats	Swanson, John August	https://en.wikipedia.org/wiki/John_August_Swanson	1986	Signed, dated, titled and numbered.	21 x 16"	"75/100"	991078599309706532	C104970753	\N	\N	500	\N	\N	2020-02-06	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	871
773	Circus Horses	Swanson, John August	https://en.wikipedia.org/wiki/John_August_Swanson	1982	Signed, dated, titled and numbered.	25.5 x 29"	"43/100"	991078599559706532	C104970443	\N	\N	500	\N	\N	2019-09-05	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	872
771	The Conductor	Swanson, John August	https://en.wikipedia.org/wiki/John_August_Swanson	1987	Signed, dated, titled and numbered.	32 x 24.5"	"86/240"	991078599369706532	C104970595	\N	\N	500	\N	\N	2019-09-09	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	873
433	Chamba	Summers, Carol	https://en.wikipedia.org/wiki/Carol_Summers	1980	From the series "Inside the Palace, a Bow to India."	14 x 14"	"?/200"	\N	C091132468	\N	\N	225	2006	WITHDRAWN	\N	2022-07-28 23:59:21.060879	2024-08-14 21:11:02.06965	t	860
769	Star Clown	Swanson, John August	https://en.wikipedia.org/wiki/John_August_Swanson	2008	Signed, dated, titled and numbered.	24 x 18"	"27/122"	991078599249706532	C104970425	\N	\N	500	\N	\N	2019-10-08	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	876
438	Rainy Day	Swanson, John August	https://en.wikipedia.org/wiki/John_August_Swanson	1981	Signed and numbered.	33 x 40"	"4/150"	991051393889706532	c093330004	\N	OVERSIZED	500	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	877
750	Fairies	Swanson, Robert	\N	1996	Signed and annotated "a/p."	10 x 12"	Artist's proof	991078572529706532	C104970416	\N	\N	500	\N	\N	2020-01-26	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	878
749	Woman with Snakes Around Her Head	Swanson, Robert	\N	1996	Signed and numbered.	12.25 x 14.25"	"2/10"	991078572509706532	C104970407	\N	\N	500	\N	\N	2019-10-03	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	879
440	Cathedral Interior	Sykes, Maltby	http://mmfa.org/exhibitions/maltby-sykes-a-witness-to-his-time/	1957	Signed and numbered.	21 x 27"	"63/200"	991051328219706532	C093329381	\N	\N	700	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	880
772	Let's Work Together, Make a Difference	Swanson, John August	https://en.wikipedia.org/wiki/John_August_Swanson	2008	Signed and dated. Dedication: "For the Morrison's Graphic Arts Collection: To honor all who have done much to build communities of justice, hope and compassion."	29.5 x 41"	\N	991078599469706532	C104970434	\N	255 Doe	750	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2024-08-14 21:12:40.048995	t	875
1099	conversation #8	Tachibana, Seiko	https://www.seikotachibana.net/	2004	Hand-signed by artist. Floated in frame.	23 x 21"	4/5	991056573449706532	\N	\N	\N	\N	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	881
1079	fern-butterfly effect h-1	Tachibana, Seiko	http://www.seikotachibana.com/	2014	Signed, titled, and numbered.	13 x 17"	"2/25"	991054191179706532	C104988216	\N	\N	\N	\N	Purchased from the Art KALA 2020 Auction.	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	882
760	Figure I	Tajiri, Ryoko	https://ryokotajiri.wordpress.com/	\N	\N	19 x 16"	\N	991078598049706532	C104970726	\N	\N	750	\N	\N	2019-09-09	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	883
780	Autumn Field	Takal, Peter	http://weatherspoon.uncg.edu/exhibitions/show/?title=peter-takal-drawings	1959	Signed.	21.25 x 23.5"	\N	991078619019706532	C103496238	\N	\N	500	\N	\N	2020-01-18	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	885
1148	Back Peace	Takar, Kenny	\N	2021	Printed at Tiny Splendor in Oakland, CA. Signed and dated.	18 x 22"	\N	991085987124406532	C103796006	\N	\N	\N	\N	\N	\N	2022-09-21 16:53:24.492802	2022-09-21 16:53:24.492802	f	886
777	Telelumiere, No. 5	Takis (Takis, Vassilakis)	https://en.wikipedia.org/wiki/Takis	1974	Signed, titled and annotated, "E.A."	30 x 22"	Artist's proof	991078618699706532	C104970762	\N	\N	750	\N	\N	2019-09-02	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	887
442	Proche de l'ete	Tal-Coat, Pierre	https://en.wikipedia.org/wiki/Pierre_Tal-Coat	1962	Signed and numbered.	21 x 31"	"41/90"	991051286209706532	C093334107	\N	\N	300	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	888
687	Man and Woman	Tamayo, Rufino	https://en.wikipedia.org/wiki/Rufino_Tamayo	1926	Signed.	\N	"?/60"	\N	C091132486	NON-CIRC	Stored in box	3000	2006	b16387828	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	889
445	Footprint (Empreinte de pied)	Tapies, Antoni	https://en.wikipedia.org/wiki/Antoni_T%C3%A0pies	1972	\N	25 x 32"	\N	991051328129706532	103790765	\N	\N	750	2006	17737772	2020-01-31	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	890
444	Untitled	Tapies, Antoni	https://en.wikipedia.org/wiki/Antoni_T%C3%A0pies	1970	Signed and inscribed "Prova d'artista XXI."	30.5 x 37"	Artist's Proof	991046824629706532	C067068485	\N	Graduate Services Dissertation Room	650	2006	51162269	2019-09-23	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	891
451	Tractor	Todo Garcia, Francisco	\N	\N	Signed and numbered.	26 x 32"	"39/95"	991051286419706532	C093334152	\N	\N	250	2006	\N	2019-08-29	2022-07-28 23:59:21.060879	2024-09-04 21:43:58.875172	f	902
1011	The Lily Pond	Taplitz, Phyllis	\N	1979	\N	21 x 25"	"5/40"	991041388149706532	C103789839	\N	\N	\N	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	894
1034	Turkish Bazaar	Tarpey, Christine	http://www.christinetarpey.com/about-me/	\N	Signed and numbered.	20 x 20"	\N	991046415409706532	C103786952	\N	\N	\N	\N	Purchased from the gift of Helen and Madeline Pardee.	2019-09-12	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	895
447	Edo Crane	Tarpey, Christine	http://www.christinetarpey.com/about-me/	\N	Signed, numbered, and annotated "5th edition."	30 x 17"	"3/10"	991051286309706532	C093334125	\N	\N	100	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	896
448	Woman with Her Cat (Senora con su gato)	Tarrago, Leticia	\N	\N	Signed and numbered.	\N	"1/50"	\N	C093334134	\N	\N	300	2006	b16396549, 20110217 MISSING mocs	2010-02-21	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	897
940	Landscape with Village	Terzian, Jane	\N	1960	Signed.	38.5 x 31.5''	"4/10"	991034981859706532	C104974403	\N	\N	1000.00	\N	\N	2019-09-06	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	898
449	Composition	Tharrats, Joan Josep (Juan Jose)	https://es.wikipedia.org/wiki/Joan-Josep_Tharrats	1958	\N	26 x 21"	Artist's Proof	991051286379706532	C093334143	\N	\N	250	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	899
689	Canterbury Cathedral	Thornton, Valerie	\N	1980	Signed and numbered.	28 x 25"	"22/50"	\N	C093329169	NON-CIRC	\N	1000	2006	b16397822	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	900
450	Le revelateur	Tisari, Christian	\N	\N	Signed and numbered.	13 x 15"	"13/30"	991051029859706532	C091133781	\N	\N	100	2006	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	901
443	The Serious Book	Toulmouche, Auguste	https://en.wikipedia.org/wiki/Auguste_Toulmouche	1874	Signed.	14 x 17"	\N	991054201389706532	C098423109	\N	\N	50	2006	\N	2020-03-04	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	904
690	Carnaval	Toulouse-Lautrec, Henri de	https://en.wikipedia.org/wiki/Henri_de_Toulouse-Lautrec	1894	Unsigned. Published in the portfolio "Album de la Revue Blanche."	19 x 15"	"?/2000"	\N	\N	NON-CIRC	\N	1600	2006	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	905
784	Rain Forest	Trevelyan, Julian	https://en.wikipedia.org/wiki/Julian_Trevelyan	1966	Signed, titled and numbered.	33.5 x 24.5"	"106/125"	991078626679706532	C104970957	\N	\N	650	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	906
452	Wellington, Clock Tower	Trevelyan, Julian	https://en.wikipedia.org/wiki/Julian_Trevelyan	1975	Numbered.	32.5 x 28"	"39/52"	991051319099706532	C093329309	\N	\N	650	2006	17732961	2019-09-18	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	907
567	Wolf	Trujillo, James	http://americanart.si.edu/collections/search/artist/?id=5864	2005	Signed, numbered, and annotated "A.P."	14 x 12.5"	"21/21"	991053886359706532	C098422691	\N	\N	500	\N	\N	2015-08-31	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	909
446	Here's to Good Friends	Taplitz, Phyllis	https://www.annexgalleries.com/artists/biography/2327/Taplitz/Phyllis	\N	Signed and numbered.	16 x 16.25"	"7/75"	991051031309706532	C091132501	\N	\N	150	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2023-08-21 23:28:15.160774	f	893
931	Umingmak: Animals Afraid of Animals	Tookoome, Simon	https://en.wikipedia.org/wiki/Simon_Tookoome	1981	Stonecut image. Signed and titled.	26.5 x 38.75"	No. 1064A	991011629209706532	C104974591	\N	\N	1000.00	\N	Purchased from the gift of Miss Helen and Miss Madeline Pardee.	2019-08-28	2022-07-28 23:59:21.060879	2023-08-28 19:53:31.846738	f	903
453	Growth	Trier, Hann	https://en.wikipedia.org/wiki/Hann_Trier	1957	Signed.	34 x 24.5"	\N	991051286469706532	C104947852	\N	\N	500	2006	\N	2019-09-27	2022-07-28 23:59:21.060879	2024-09-04 22:05:42.416263	f	1100
454	Cat	Tschumi, Otto	https://de.wikipedia.org/wiki/Otto_Tschumi	1958	Signed and numbered.	22 x 17"	"4/20"	991051030989706532	C091132334	\N	\N	400	2006	\N	2019-09-04	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	910
1010	Ikari Kazuki: An Anchor for a Handstone; The Warrior Taira no Tomori	Tsukioka, Kogyo	https://en.wikipedia.org/wiki/K%C5%8Dgyo_Tsukioka	1897	From the series "Pictures of Noh Plays [Nogaku Zue]."	18.5 x 14"	\N	991041387999706532	C103789699	\N	\N	\N	\N	\N	2019-08-30	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	911
620	Kan-yokyu: The Palace of Hsienyang	Tsukioka, Kogyo	https://en.wikipedia.org/wiki/K%C5%8Dgyo_Tsukioka	1897	From the series "Pictures of Noh Plays (Nogaku Zue)."	18.5 x 14"	\N	991078452989706532	C103510930	\N	\N	500	\N	\N	2019-10-03	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	912
455	Composition	Ubac, Rodolphe Raoul	https://en.wikipedia.org/wiki/Raoul_Ubac	1958	Signed and numbered.	21 x 28"	"13/125"	991051286509706532	C093334170	\N	\N	300	2006	\N	2019-09-01	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	913
456	Composition in Black and Gold	Ubac, Rodolphe Raoul	https://en.wikipedia.org/wiki/Raoul_Ubac	1956	Signed and numbered.	21 x 28"	"25/150"	991051286549706532	C093334189	\N	\N	300	2006	\N	2017-09-09	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	914
1022	Between Silences	Uchima, Ansei	http://www.myjapanesehanga.com/home/artists/ansei-uchima-1921-2000-	1967	Signed, numbered, titled, and dated.	18 x 24"	"84/200"	991043687209706532	C104947436	\N	\N	\N	\N	Gift of Ellen Meltzer and Jane Fowler in memory of Marilyn and Phillip Meltzer	2019-08-30	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	916
1038	Mountaineer (Yama otoko)	Umetaro, Azechi	\N	1953	Artist's proof	16.5 x 22	Edition of 50	991047232159706532	C103787114	\N	\N	\N	\N	Gift of Frances and Ben Burr	2019-09-19	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	918
1063	Untitled, Arabic Manuscript	Unknown	\N	\N	Lettering in black ink with gold outline.	18" x 21.5"	\N	991050047719706532	C103790482	\N	\N	\N	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	920
1032	Untitled, Fragment of an Indic Manuscript	Unknown	\N	\N	A fragment of an Indic manuscript depicting animals symbolizing twelve kalpas.	8.5 x 13.5"	\N	991044528179706532	\N	\N	\N	\N	\N	Gift of Amy Baker Sandback	2019-09-17	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	922
516	Man With Plate	Unknown	\N	1984	Signed and numbered. Unable to read signature. South African artist.	21 x 17"	"2/11"	991053841469706532	c067069319	\N	\N	50	2006	\N	2019-09-04	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	923
808	Niche VI	Unknown	\N	1992	Signed, titled and numbered. Annotated "E.V." Unable to read signature to identify artist.	31 x 23"	"6/20"	991078654809706532	C104970850	\N	\N	500	\N	\N	2019-09-10	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	924
1049	Untitled, Literatuurnummer 1993	Unknown	\N	1993	Poster for the magazine Nieuw Israelietisch Weekblad (New Israelite Weekly).	16.25 x 24u0094	\N	991048828209706532	C103790385	\N	\N	\N	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	925
1048	Untitled, Literatuurnummer 1995	Unknown	\N	1995	Poster for the magazine Nieuw Israelietisch Weekblad (New Israelite Weekly).	16.25 x 24u0094	\N	991048828169706532	C103790242	\N	\N	\N	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	926
1047	Printing Is a Way of Life	Unknown	\N	2000	Original poster on the occasion of "Living with Letters," a Josua Reichert exhibition, at the Joods Historisch Museum.	21 x 29"	\N	991048766219706532	C103790233	\N	\N	\N	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	928
814	Prometheus	Diedrich, Helmut Stephan	\N	1968	Signed, titled, dated and numbered.	17 x 21.5"	"11/50"	991078661389706532	C104970665	\N	\N	500	\N	\N	2018-09-11	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	929
1031	Untitled, Horses from the Shalihotra Samhita	Unknown	\N	\N	A page from the "Shalihotra Samhita" in the Marwari language in Devanagari script.	13 x 16"	\N	991044528149706532	\N	\N	\N	\N	\N	Gift of Amy Baker Sandback	2019-09-10	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	930
1044	100 jaar Cabaret (100 Years of Cabaret)	Unknown	\N	1995	Exhibition poster from the Theater Instituut Nederland.	18 x 25.5u0094	\N	991048725409706532	C103790224	\N	\N	\N	\N	\N	2019-08-27	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	932
815	Train Interior 1	Unknown	\N	\N	Signed, titled and numbered. Unable to read signature to identify artist.	31 x 25"	"1/7"	991078661439706532	C104970674	\N	\N	500	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	933
812	Cerises et Éventail (Cherries and Fan)	Schkolnyk, Laurent	http://www.schkolnykfineart.com/	\N	Signed and numbered.	14 x 14"	"44/80"	991078661139706532	C104970647	\N	\N	500	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	934
821	Untitled, Cityscape	Unknown	\N	\N	\N	25.5 x 19.5"	\N	991078662209706532	C104970489	\N	\N	500	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	935
842	Untitled, Composition in Green and Black	Unknown	\N	\N	Signed and numbered. Unable to read signature to identify artist.	23.75 x 21.5"	"77/200"	991078970559706532	C103495313	\N	\N	500	\N	\N	2017-12-15	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	936
818	Untitled, Female Rider on Horse	Unknown	\N	2005	Signed, dated, numbered and annotated "A.P." Unable to read signature to identify artist.	23.5 x 18"	"6/6"	991078662089706532	C104970708	\N	\N	500	\N	\N	2019-09-10	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	937
1035	Untitled, Orange and Green Composition	Unknown	\N	\N	Signed and numbered. Unable to read artist's name.	27.5 x 30"	\N	991086248467506532	C104944744	\N	\N	\N	\N	\N	\N	2022-07-28 23:59:21.060879	2024-08-26 19:56:22.599699	f	927
824	Arch #1	Illouz, Salomon	http://salomonillouz.com/	\N	No identifying marks.	33 x 26.5"	\N	991078662439706532	C104972025	\N	\N	500	\N	\N	2019-09-09	2022-07-28 23:59:21.060879	2023-08-23 19:26:28.684802	f	921
806	Shinto Temple	Luthmann, Hans	\N	1931	Signed and titled. 	15 x 19"	\N	991078654589706532	C104970832	\N	\N	500	\N	\N	2019-10-10	2022-07-28 23:59:21.060879	2024-09-05 20:45:44.926466	f	931
840	Untitled, Composition in Black and Gray	Ubac, Rodolphe Raoul	https://en.wikipedia.org/wiki/Raoul_Ubac	1958	Etching created for the art review "XXe siècle" no. 10. Published under the direction of G. di San Lazzaro.	14.5 x 17.25"	?/2000	991079581569706532	C103532084	\N	\N	900	\N	\N	2019-09-22	2022-07-28 23:59:21.060879	2024-09-05 19:09:59.856597	f	915
866	Untitled, Girl	Unknown	\N	1994	Signed, dated, and annotated "A.P." Unable to read signature to identify artist.	33.25 x 25.25"	Artist's proof	991079192139706532	C103532066	\N	\N	500	\N	\N	2018-08-22	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	941
817	Untitled, Two Faces	Unknown	\N	2003	Signed, titled and numbered. Unable to read title (in Greek?). "Museography." Unable to read signature to identify artist.	20 x 16"	"5/7"	991078661899706532	C104970692	\N	\N	500	\N	\N	2017-09-27	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	945
820	Untitled, Window and Door	Unknown	\N	1980	Signed. Unable to read signature to identify artist. Looks to be "J.N. B..."	23.5 x 18.5"	\N	991078662189706532	C104970717	\N	\N	500	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	947
457	Untitled	Usami, Keiji	\N	1968	\N	36.5 x 27"	\N	991051286599706532	C104971915	\N	\N	100	2006	\N	2019-08-29	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	948
853	Sea Change	Usher, Mary	\N	1953	Signed, titled, dated and annotated E-22.	17.75 x 23.25"	\N	991079166209706532	C103496043	\N	\N	500	\N	\N	2019-09-14	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	949
518	Untitled, kabuki actor with scroll	Utagawa, Kunisada	https://en.wikipedia.org/wiki/Kunisada	\N	Artist was a student of the Utagawa School.	16 x 20"	\N	991051079029706532	C103790880	\N	\N	500	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	950
693	Rue d'Orchampt	Utrillo, Maurice	https://en.wikipedia.org/wiki/Maurice_Utrillo	1952	F 5. Unsigned.	13.75 x 17.25"	"?/575"	\N	C091132343	NON-CIRC	255 Doe	1100	2006	b16387822	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	951
459	Young Brunette	Van Dongen, Kees	https://en.wikipedia.org/wiki/Kees_van_Dongen	1930	Signed and numbered. Edition of 120. Some foxing.	21.5 x 27.5"	"82/120"	991051319449706532	C093329044	\N	\N	900	2006	17732971	2019-09-03	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	953
811	Ecce Homo	Van Dyck, Anthony (Van Dyck, Antoon)	https://en.wikipedia.org/wiki/Anthony_van_Dyck	1630	Inscribed on print: "Ecce stat innocuus spinis redemitus acutis,/ Aemula sunt cuius bella labella rosis:/ Et vero Iudae illudis arundine Regi,/ Impie sed nescis te mala quanta manent." Below that: "Anton. van Dyck, Invenit et fecit agua forti." Blind stamp, "Musee Louvre Chalcographie."	24.5 x 19"	\N	\N	C104970638	NON-CIRC	\N	2500	\N	b18372403	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	954
460	Gull	Van Hoesen, Beth	https://en.wikipedia.org/wiki/Beth_Van_Hoesen	1964	Signed and numbered. Published by the International Graphic Arts Society. Lightstained.	23 x 20"	"129/210"	991051031099706532	C091132352	\N	\N	850	2006	17311050	2019-08-29	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	955
533	Raccoon Straits	Van Hoesen, Beth	https://en.wikipedia.org/wiki/Beth_Van_Hoesen	\N	Signed and numbered.	21 x 17"	"29/35"	991053843279706532	c067069160	\N	\N	500	\N	In honor of Donald Coney, University Librarian, and founder of the Graphic Arts Loan Collection.	2019-09-06	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	956
462	Betelgeuse	Vasarely, Victor	https://en.wikipedia.org/wiki/Victor_Vasarely	1970	Signed and numbered. From "Un Hommage a Alexander Dauvillier."	30 x 24"	"61/150"	991051319529706532	C093329327	\N	\N	900	2006	17732975	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	957
850	Muchacha Peinandose (Girl Combing Her Hair)	Ibarz Roca, Miguel	https://www.grafos-verlag.com/Ibarz-Miguel_1	1957	Signed and numbered. 	25.5 x 21"	"183/200"	991078983149706532	C103496380	\N	\N	500	\N	\N	2019-09-24	2022-07-28 23:59:21.060879	2024-09-05 19:32:35.102107	f	940
464	Vega	Vasarely, Victor	https://en.wikipedia.org/wiki/Victor_Vasarely	1957	Signed and numbered. From "Un Hommage a Alexander Dauvillier."	29.5 x 23.5"	"61/150"	991051319489706532	C093329187	\N	\N	900	2006	17732972	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	960
465	Glass of Wine	Veber, Jean	https://en.wikipedia.org/wiki/Jean_Veber	1905	Signed and numbered. Very badly foxed.	17 x 21"	"109/180"	991051031129706532	C091132361	\N	\N	300	2006	\N	2020-02-21	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	961
723	Landscape with Castle on the River	Van de Velde, Jan (Velde, Jan van de)	https://en.wikipedia.org/wiki/Jan_van_de_Velde	1616	Inscribed in plate at bottom right: "10." From "Sixty Landscapes."	11.5 x 15.5"	\N	991078537599706532	C094893479	\N	\N	500	\N	\N	2019-09-11	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	962
463	London Arts Poster	Vasarely, Victor	https://en.wikipedia.org/wiki/Victor_Vasarely	1968	Unsigned. Image for his "From Constructivism to Kinetic Art" exhibition, London Arts Gallery, 1968.	32 x 37"	\N	991051352529706532	C093329983	\N	\N	150	2006	\N	2019-08-29	2022-07-28 23:59:21.060879	2023-08-28 19:54:49.180963	f	958
458	Coming to Rest	Vaccaro, Nick Dante	\N	\N	Signed and numbered.	33 x 27"	"1/6"	991051286639706532	C104947685	\N	\N	100	2006	\N	2019-09-09	2022-07-28 23:59:21.060879	2023-09-05 19:59:36.170069	f	952
863	Untitled, Twenty Dollar Coin	Bose, Arun	https://armstrongfineart.com/collections/arun-bose	\N	Signed and numbered.	19.25 x 15.25"	"111/120"	991079191859706532	C103495641	\N	\N	500	\N	\N	2017-12-04	2022-07-28 23:59:21.060879	2023-09-14 00:39:28.067635	f	944
813	Black Woman (Model Margot Jefferson)	Abeles, Sigmund	http://www.sigmundabeles.net/	1969	Signed and numbered.	23.5 x 18.5"	"16/250"	991078661199706532	C104970656	\N	\N	400	\N	\N	2019-09-25	2022-07-28 23:59:21.060879	2023-09-22 19:08:54.00425	f	943
802	Left Handed Bureaucrat, State One	 Carruthers, Roy	https://www.annexgalleries.com/artists/biography/370/Carruthers/Roy	1981	Signed and annotated, "E.P."  Edition of 12.	44.75 x 31.25"	Artist's proof	991078647889706532	C103494647	\N	OVERSIZED	500	\N	\N	2019-08-27	2022-07-28 23:59:21.060879	2024-09-05 19:40:32.858633	f	942
865	In the Forest	Peterdi, Gabor 	https://en.wikipedia.org/wiki/Gabor_Peterdi	1957	Signed and numbered. 	19.75 x 25.25"	"157/200"	991079192029706532	C103496025	\N	\N	500	\N	\N	2019-09-03	2022-07-28 23:59:21.060879	2024-09-05 19:53:55.859168	f	938
864	The Tear	Hirsch, Joseph	https://en.wikipedia.org/wiki/Joseph_Hirsch	1959	Signed and numbered. 	25.24 x 19.25"	"50/220"	991079191909706532	C103496371	\N	\N	500	\N	\N	2020-01-25	2022-07-28 23:59:21.060879	2024-09-05 19:46:50.338818	f	946
885	Fruits	Matisse, Henri	https://en.wikipedia.org/wiki/Henri_Matisse	1964	Unsigned. Published on the occasion of the exhibition "L'atelier Mourlot." Edition of 2000.	11.25 x 13.25"	\N	991079581429706532	C103532075	\N	\N	400	\N	\N	2019-09-17	2022-07-28 23:59:21.060879	2024-09-05 20:11:35.696463	f	939
725	Landscape with Apse of Church	Van de Velde, Jan (Velde, Jan van de)	https://en.wikipedia.org/wiki/Jan_van_de_Velde	1616	Inscribed in plate at bottom right: "2." From "Sixty Landscapes."	11.5 x 15.5"	\N	991078544359706532	C094893202	\N	\N	500	\N	\N	2019-09-30	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	963
724	Landscape with Ruined Tower	Van de Velde, Jan (Velde, Jan van de)	https://en.wikipedia.org/wiki/Jan_van_de_Velde	1616	Inscribed in plate at bottom center: "12." From "Sixty Landscapes."	11.5 x 15.5"	\N	991078544199706532	C094893619	\N	\N	500	\N	\N	2018-09-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	964
726	Landscape with Two Men Fishing and Dovecote	Van de Velde, Jan (Velde, Jan van de)	https://en.wikipedia.org/wiki/Jan_van_de_Velde	1616	From "Sixty Landscapes."	11.5 x 15.5"	\N	991078544539706532	C094893628	\N	\N	500	\N	\N	2019-10-02	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	965
466	Composition (Le Gardin)	Vieira da Silva, Maria Elena	https://en.wikipedia.org/wiki/Maria_Helena_Vieira_da_Silva	1959	Annotated "Epreuve d'artiste."	19 x 15"	Artist's Proof	991051333089706532	c093329284	\N	\N	800	2006	17741786	2019-09-16	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	966
841	Ville espagnole	Vieira da Silva, Maria Elena	https://en.wikipedia.org/wiki/Maria_Helena_Vieira_da_Silva	1966	From "XXeme Siecle."	14.5 x 17.25"	\N	991078970489706532	C103532057	\N	\N	800	\N	\N	2019-08-31	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	967
1043	Negative Cat	Moholy-Nagy, Laszlo	https://en.wikipedia.org/wiki/L%C3%A1szl%C3%B3_Moholy-Nagy	1973	Photo-reproduction of a gelatin silver print from 1926.	13 x 15.5"	\N	991048676749706532	\N	\N	\N	\N	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	968
1025	Untitled, Girl in Black and White Makeup	Viggiano, Bill	\N	1975	Artist's stamp on back.	14.5 x 12"	\N	991044527759706532	\N	\N	\N	\N	\N	Gift of Amy Baker Sandback	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	969
1023	Untitled, Girl in Makeup	Viggiano, Bill	\N	1975	Artist's stamp on back.	14.5 x 11.5"	\N	991044527609706532	\N	\N	\N	\N	\N	Gift of Amy Baker Sandback	2020-02-05	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	970
1041	Untitled, Landscape with Children	Viggiano, Bill	\N	\N	Signed by the artist.	16.5 x 13.5"	\N	991048676719706532	\N	\N	\N	\N	\N	\N	2019-08-31	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	971
1024	Untitled, Man with Feather	Viggiano, Bill	\N	1975	Artist's stamp on back.	14.5 x 12"	\N	991044527689706532	\N	\N	\N	\N	\N	Gift of Amy Baker Sandback	2019-02-05	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	972
1042	Untitled, Landscape with Truck	Viggiano, Bill	\N	\N	Signed by the artist.	16.5 x 13.5"	\N	991048676679706532	\N	\N	\N	\N	\N	\N	2020-02-08	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	973
467	Unicorn (Unicornio)	Vilchis, Fernando	\N	1979	Signed, inscribed "c.a." and numbered.	31 x 28"	"9/10"	991051286669706532	C104970531	\N	\N	500	2006	\N	2019-09-19	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	974
699	Cheval	Villon, Jacques	https://en.wikipedia.org/wiki/Jacques_Villon	1921	Unsigned. Edition of 100.	\N	\N	\N	C091133815	NON-CIRC	\N	1000	2006	b16387787	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	975
538	Composition	Villon, Jacques	https://en.wikipedia.org/wiki/Jacques_Villon	\N	\N	18 x 15"	\N	\N	c067068397	NON-CIRC	\N	1000	\N	b16467130	2010-02-01	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	976
700	Woman with a Pitcher (Femme a la cruche)	Villon, Jacques	https://en.wikipedia.org/wiki/Jacques_Villon	1928	After Fernand Leger. Signed and numbered. Badly stained from mount.	21.5 x 30"	"?/200"	\N	\N	NON-CIRC	\N	2400	2006	b16398203	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	977
843	Valley of the Avre River	Vlaminck, Maurice de	https://en.wikipedia.org/wiki/Maurice_de_Vlaminck	1958	Signed. Printed by Atelier Mourlot in Paris.	16.25 x 14.25"	"?/2000"	991078970699706532	C103532048	\N	\N	500	\N	\N	2020-01-18	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	979
468	Illustration XVIII for "Haute Folie"	Vlaminck, Maurice de	https://en.wikipedia.org/wiki/Maurice_de_Vlaminck	1964	Unsigned. Published in 1964 by Scripta & Picta, Paris, and printed by Mourlot Freres.	19 x 18"	\N	991051030329706532	C091133824	\N	\N	150	2006	\N	2019-09-01	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	980
1084	Abstract II: Ironhead	Voulkos, Peter	https://en.wikipedia.org/wiki/Peter_Voulkos	1979	One from a series of five prints, published by Master Editions. Signed by the artist.	27 x 37"	\N	991054292089706532	\N	\N	\N	\N	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	981
469	The Meal (Le repas)	Vuillard, Jean Edouard	https://en.wikipedia.org/wiki/%C3%89douard_Vuillard	1935	From the series "La Cuisine (Cooking)." Unsigned.	20 x 17"	\N	991051030269706532	C091133888	\N	\N	450	2006	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	982
876	Le Square Vintimille	Vuillard, Jean Edouard	https://en.wikipedia.org/wiki/%C3%89douard_Vuillard	1937	Signed.	21.5 x 18"	\N	991079273429706532	C103493670	\N	\N	500	\N	Gift of the class of 1961 in honor of Dr. and Mrs. Robert Gordon Sproul.	2019-10-23	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	983
470	Morning Fog	Walker	\N	\N	Signed and numbered. Unable to identify artist without first name.	\N	"31/80"	991051352499706532	C093329974	\N	\N	\N	2006	\N	2019-09-06	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	986
925	Bee and Flowering Plant	Wang, Gai	https://fr.wikipedia.org/wiki/Wang_Gai	1679-1701	Page spread from "The Mustard Seed Garden Manual of Painting" ("Jieziyuan Huazhuan").	18.25 x 15.5"	\N	991008364649706532	C104974537	\N	\N	\N	\N	\N	2019-09-10	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	987
926	Dragonfly with Plants	Wang, Gai	https://fr.wikipedia.org/wiki/Wang_Gai	1679-1701	Page spread from "The Mustard Seed Garden Manual of Painting" ("Jieziyuan Huazhuan").	18.25 x 15.5"	\N	991008401919706532	C104974379	\N	\N	\N	\N	\N	2019-09-10	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	988
923	Rock with Butterfly	Wang, Gai	https://fr.wikipedia.org/wiki/Wang_Gai	1679-1701	Page spread from "The Mustard Seed Garden Manual of Painting" ("Jieziyuan Huazhuan").	18.25 x 15.5"	\N	991008363529706532	C103787646	\N	\N	\N	\N	\N	2019-09-15	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	989
542	Composition	Vujaklija, Lazar	https://moma.org/collection/artists/6195?locale=en	1955	Signed and numbered.	21 x 26.5"	"65/200"	991053843619706532	C103787956	\N	\N	500	\N	\N	2019-09-30	2022-07-28 23:59:21.060879	2023-09-05 17:01:01.279393	f	984
924	Rock with Sparrows	Wang, Gai	https://fr.wikipedia.org/wiki/Wang_Gai	1679-1701	Page spread from "The Mustard Seed Garden Manual of Painting" ("Jieziyuan Huazhuan").	18.25 x 15.5"	\N	991008402049706532	C104974528	\N	\N	\N	\N	\N	2019-09-02	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	990
471	Chicago Pyramid	Warner, Doug	\N	1977	Signed and numbered. Printed by Landfall Press, Chicago, and published by the Lakeside Studio.	21 x 26"	"13/40"	991051030399706532	C091133860	\N	\N	40	2006	\N	2019-09-10	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	991
472	Jericho's Castle	Watanabe, Sadao	https://en.wikipedia.org/wiki/Sadao_Watanabe_(artist)	1965	Signed and numbered.	30.5 x 34"	"28/50"	991051352449706532	C093329965	\N	\N	300	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	993
779	Jonah	Watanabe, Sadao	https://en.wikipedia.org/wiki/Sadao_Watanabe_(artist)	1965	Signed and numbered.	31 x 26"	"44/50"	991078618929706532	C104970939	\N	\N	500	\N	\N	2019-09-03	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	994
473	Igor Stravinsky - The Last Rite	Watson, Neil	\N	\N	Signed and numbered.	35 x 23"	"10/10"	991051286719706532	C093333945	\N	\N	100	2006	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	995
704	Facet I: Basic Cube Reflection	Weber, Stephanie	http://stephanieweberart.com/	\N	Signed and numbered. Each of the "Cubes" is unique according to artist.	\N	\N	\N	C093329178	NON-CIRC	Stored in box	1500	2003	b16397827	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	997
519	Untitled, Trees with Mattress	Weems, Carrie Mae	https://en.wikipedia.org/wiki/Carrie_Mae_Weems	1995	Signed and numbered. From the portfolio: "10 x 10 Ten Women Ten Prints." Photo screenprint.	25 x 25"	"15/75"	991051286749706532	c093333954	\N	\N	500	\N	\N	2019-01-05	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	999
475	The Toad	Weiers, Ernst	\N	1955	Numbered.	22 x 28"	"3/15"	991051286779706532	C093333963	\N	\N	200	2006	\N	2019-09-23	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	1000
477	The Evening Lamp	Weir, Julian Alden	https://en.wikipedia.org/wiki/J._Alden_Weir	1891	Unsigned. Good impression on nice paper.	12 x 13.5"	\N	991051319209706532	C093328882	\N	\N	600	2006	\N	2019-03-20	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	1002
831	A Knight of Ghostes and Shadowes	Weisberg, Ruth	https://en.wikipedia.org/wiki/Ruth_Weisberg	1969	Signed, numbered, dated and titled. From "Tom O'Bedlam's Song" with 5 intaglio and relief prints by Ruth Weisberg, printed by Kelyn Press in 1969.	16.75 x 21.25"	"15/40"	991078768239706532	C103495881	\N	\N	200	\N	\N	2019-09-10	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	1003
834	The Lordlie Loftes of Bedlam	Weisberg, Ruth	https://en.wikipedia.org/wiki/Ruth_Weisberg	1969	Signed, numbered, dated and titled. From "Tom O'Bedlam's Song" with 5 intaglio and relief prints by Ruth Weisberg, printed by Kelyn Press in 1969.	16.75 x 21.5"	"15/40"	991078768699706532	C103495766	\N	\N	200	\N	\N	2018-08-24	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	1004
478	Make Mee Musicke to My Sorrowe	Weisberg, Ruth	https://en.wikipedia.org/wiki/Ruth_Weisberg	1969	Signed and numbered. From "Tom O'Bedlam's Song" with 5 intaglio and relief prints by Ruth Weisberg, printed by Kelyn Press in 1969.	18.5 x 16"	"15/40"	991051362739706532	c093330369	\N	\N	200	2006	\N	2018-09-06	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	1005
819	The Queen of Love	Weisberg, Ruth	https://en.wikipedia.org/wiki/Ruth_Weisberg	1969	Signed and numbered. From "Tom O'Bedlam's Song" with 5 intaglio and relief prints by Ruth Weisberg, printed by Kelyn Press in 1969.	21 x 16"	"15/40"	991078662169706532	C103494939	\N	\N	500	\N	\N	2019-09-09	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	1006
479	Reflections	Weisberg, Ruth	https://en.wikipedia.org/wiki/Ruth_Weisberg	1968	Signed and numbered. Dedication reads: "for Karen and Gena with Love - Ruth"	23 x 22"	"5/86"	991051349139706532	C093329637	\N	\N	200	2006	\N	2019-09-18	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	1007
874	Untitled	Weisbuch, Claude	https://fr.wikipedia.org/wiki/Claude_Weisbuch	\N	Signed and numbered. After Velazquez's "Surrender at Breda."	27 x 36.5"	"85/100"	991079228649706532	C103495146	\N	\N	750	\N	\N	2019-09-18	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	1008
480	Untitled II	Wernick, Andrew	\N	1989	Signed. From the Dakota series. Printed on Arches Hot Press paper.	18.5 x 14.5"	\N	991051362809706532	C093330387	\N	\N	400	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	1009
481	Untitled I	Wernick, Andrew	\N	1989	Signed. From the Dakota series. Printed on Arches Hot Press paper.	\N	Artist's Proof	991051362769706532	C093330378	\N	\N	400	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	1010
948	Shiny Nude	Wesselmann, Tom	https://en.wikipedia.org/wiki/Tom_Wesselmann	1977	Printed by A. Colish Press; published by Parasol Press, Ltd., New York.	14 x 14"	"216/1000"	991036394209706532	C104974661	\N	\N	\N	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	1011
482	Sicilian Hilltop IV	Wessels, Glenn	\N	1970	Signed and numbered.	27 x 34"	"7/14"	991078443289706532	C103510921	\N	\N	300	2006	\N	2019-09-14	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	1012
859	Sicilian Village	Wessels, Glenn	\N	1966	Signed, numbered, dated and titled.	24.75 x 31.25	"5/?"	991079188039706532	C103501312	\N	\N	300	\N	\N	2020-02-06	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	1013
1144	Valley Oaks	Westerman, Donna	https://viola-bagpipe-6ml9.squarespace.com/	[2020]	Woodcut reduction.	32 x 30"	\N	991085987124806532	C103796130	\N	\N	\N	\N	\N	\N	2022-09-21 16:53:24.468651	2022-09-21 16:53:24.468651	f	1014
705	Draped Figure, Seated	Whistler, James Abbott McNeill	https://en.wikipedia.org/wiki/James_Abbott_McNeill_Whistler	1893	Unsigned.	\N	"?/100"	\N	\N	NON-CIRC	Stored in box	1700	2006	b16397823	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	1015
703	Cubed Reflection III	Weber, Stephanie	http://stephanieweberart.com/	\N	Signed and numbered. Each of the "Cubes" is unique according to artist.	24 x 21"	\N	\N	C104943157	NON-CIRC	\N	1500	2006	b16397826	\N	2022-07-28 23:59:21.060879	2024-07-24 19:48:48.316023	t	1076
474	Interior I	Weber, Stephanie	http://stephanieweberart.com/	1977	\N	19 x 22"	\N	991051319259706532	 C104943397	\N	\N	850	2006	17732966	\N	2022-07-28 23:59:21.060879	2024-08-07 20:07:11.351685	f	998
1037	Aquifer	Nakayama, Masako	\N	1975	\N	15.5 x 20"	9/20	991047232109706532	C103787105	\N	\N	\N	\N	Gift of Frances and Ben Burr	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	648
849	The Red Dress (La robe rouge)	Whistler, James Abbott McNeill	https://en.wikipedia.org/wiki/James_Abbott_McNeill_Whistler	1894	On the bottom of print, "Given to E. Schotten by E. Piper, April 1910." In lower left corner has names, "F. Goulding" and "R Bernie Philip." In lower right, looks to be initialed, "FG."	\N	\N	\N	\N	NON-CIRC	Stored in box	1700	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	1016
757	Boats and Gulls	Winkler, John W.	http://johnwwinkleretcher.com/	1943	Signed.	\N	\N	991078588559706532	C103494498	\N	\N	500	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	1017
754	Clay Street - San Francisco	Winkler, John W.	http://johnwwinkleretcher.com/	1913	Signed and numbered.	12 x 15"	"63/71"	991078588349706532	C103494902	\N	\N	500	\N	\N	2019-10-08	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	1018
755	Delicatessen Maker	Winkler, John W.	http://johnwwinkleretcher.com/	1917	Signed.	\N	\N	\N	\N	NON-CIRC	Stored in box	1000	\N	b18367858	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	1019
483	Dusk at Fisherman's Wharf	Winkler, John W.	http://johnwwinkleretcher.com/	1934	Signed.	14 x 16"	Artist's Proof	991051346899706532	C093332695	\N	\N	300	2006	\N	2019-08-31	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	1020
484	Haunted House with Cats B	Winkler, John W.	http://johnwwinkleretcher.com/	1919	Signed. House originally belonged to Sally Stanford, former Mayor of Sausalito.	10 x 7"	\N	991053843539706532	C067068333	\N	\N	500	\N	\N	2019-09-06	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	1021
564	Noon Rest A	Winkler, John W.	http://johnwwinkleretcher.com/	1919	Signed.	15.5 x 16"	\N	991053879099706532	C098422637	\N	\N	500	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	1022
753	Pasture in Normandy	Winkler, John W.	http://johnwwinkleretcher.com/	1924	Signed.	9.5 x 13.25"	\N	991078588299706532	C103494629	\N	\N	500	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	1023
566	Re-Building City Hall (After the Great Earthquake)	Winkler, John W.	http://johnwwinkleretcher.com/	1919	Signed.	15.5 x 10.5"	\N	991053886319706532	C098422673	\N	\N	500	\N	\N	2012-01-26	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	1024
756	Mt. Ritter and Banner	Winkler, John W.	http://johnwwinkleretcher.com/	1964	Signed.	\N	\N	991078588499706532	C103494780	\N	\N	500	\N	\N	2019-09-09	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	1025
560	Sequoia	Winkler, John W.	http://johnwwinkleretcher.com/	1935-1940	\N	17 x 21.5"	\N	991053878899706532	C098422664	\N	\N	500	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	1026
758	St Paul's from the River, London	Winkler, John W.	http://johnwwinkleretcher.com/	1927	Signed.	22 x 16.75"	\N	991078588639706532	C103494799	\N	\N	500	\N	\N	2019-12-02	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	1027
569	Telegraph Hill	Winkler, John W.	http://johnwwinkleretcher.com/	1919	\N	15.5 x 13"	\N	991053956519706532	C098422026	\N	\N	300	2006	\N	2020-03-05	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	1028
488	Abstraction	Winter, Fritz	https://en.wikipedia.org/wiki/Fritz_Winter	1950	\N	14 x 16"	\N	991051346999706532	C093332710	\N	\N	900	2006	17750212	2019-10-03	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	1029
486	Siebdruck 8	Winter, Fritz	https://en.wikipedia.org/wiki/Fritz_Winter	1950	Signed. From the series "Fritz Winter: 9 Originale Handdrucke."	21.5 x 27.5"	Artist's Proof	991051349109706532	C093329628	\N	\N	900	2006	17750459	2019-09-11	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	1031
489	Carp in a Pond	Wise, Judy	http://www.judywise.com/	1980	\N	23 x 14"	"73/85"	991051347039706532	C093332729	\N	\N	400	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	1032
916	Poppies	Wise, Judy	http://www.judywise.com/	1981	Signed.	16.5" x 23 "	"43/75"	991007853589706532	C103785921	\N	\N	\N	\N	\N	2019-08-29	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	1033
490	Lover's Poem	Wise, Judy	http://www.judywise.com/	1981	Signed, titled, and numbered.	19 x 19"	"8/60"	991051347169706532	C093332756	\N	\N	300	2006	\N	2019-09-09	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	1034
829	Planes in Space E-28	Wood, Clyde	\N	1952	Signed, titled, and dated.	18.25 x 21.25"	\N	991078753459706532	C103496034	\N	\N	500	\N	\N	2019-09-09	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	1036
487	Siebdruck 5	Winter, Fritz	https://en.wikipedia.org/wiki/Fritz_Winter	1950	Signed. From the series "Fritz Winter: 9 Originale Handdrucke."	21.5 x 27.5"	Artist's Proof	991051349069706532	C104974740	\N	\N	700	2006	17750457	2019-09-04	2022-07-28 23:59:21.060879	2023-10-15 16:45:00.726634	f	1030
491	Arachnid	Wright, Donald	\N	1959	Signed and numbered.	23 x 17"	"2/5"	991051349019706532	C093329600	\N	\N	100	2006	\N	2019-09-03	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	1037
492	James Rosenquist	Wujcik, Theo	http://www.theowujcik.com/	1972	Signed and numbered.	23.5 x 25.5"	"23/30"	991051349189706532	C093329646	\N	\N	300	2006	\N	2018-09-27	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	1038
1080	Sphinx und Handschuh	Wunderlich, Paul	https://en.wikipedia.org/wiki/Paul_Wunderlich	1979	Signed and numbered.	21 x 27"	"971/1500"	991054193239706532	C104987902	\N	\N	\N	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	1039
918	Mt. Hotaka at Daybreak	Yamaguchi, Susumu	http://www.britishmuseum.org/research/search_the_collection_database/term_details.aspx?bioId=142692	1957	\N	27 x 21"	\N	991007903029706532	C103785949	\N	\N	\N	\N	\N	2019-08-27	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	1040
766	Face	Yoon, June	http://www.juneyoon.com/	2008	Signed and numbered.	26.5 x 19.5"	"1/6"	991078599049706532	C104970911	\N	\N	500	\N	\N	2018-09-06	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	1041
765	Untitled, Sleep	Yoon, June	http://www.juneyoon.com/	\N	\N	25 x 18"	\N	991078598579706532	C104970902	\N	\N	600	\N	\N	2020-02-08	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	1042
1126	Pandora (Ink Kitten)	Wong, Anita Yan	https://www.anitayanwong.com/	2021	Ink painting using black sum-e ink and calligraphy brush.	17 x 21.5"	\N	991085987140306532	C103792019	\N	\N	\N	\N	\N	\N	2022-09-21 16:53:24.357916	2023-09-13 22:47:43.620367	f	1035
493	Space No. 27	Yoshida, Masaji	http://www.moma.org/collection/artists/6508?locale=en	1963	Signed and numbered.	25 x 25"	"5/30"	991051349239706532	C103494911	\N	\N	450	2006	17750463	2019-09-16	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	1043
495	Torn Rose	Yoshihara, Hideo	https://moma.org/collection/artists/6511?locale=en	1967	Signed and numbered.	30 x 23.5"	"11/30"	991051349269706532	C093329664	\N	\N	200	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	1045
496	Small World	Youkeles, Anne	\N	1971	Signed and numbered. Uniquely folded for a raised effect.	10 x 10"	"50/100"	991051346869706532	C093332686	\N	\N	350	2006	\N	2019-09-26	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	1047
499	Country Celebration (Fete Paysanne)	Zadkine, Ossip	https://en.wikipedia.org/wiki/Ossip_Zadkine	1960	Signed and numbered.	35 x 27"	"44/110"	991051349339706532	C093329682	\N	\N	500	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	1050
707	Composition with Blue and Red	Zao, Wou-Ki	https://en.wikipedia.org/wiki/Zao_Wou-Ki	\N	Signed and numbered.	\N	"35/95"	\N	C093329460	NON-CIRC	\N	1500	\N	b16398761	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	1051
500	Tree	Zao, Wou-Ki	https://en.wikipedia.org/wiki/Zao_Wou-Ki	\N	Signed artist's proof.	\N	\N	\N	C093329318	NON-CIRC	Stored in box	1500	2006	17750240, b16397828	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	t	1052
845	Nearing the Woods	Ziemann, Richard Claude	http://americanart.si.edu/collections/search/artist/?id=5554	1958	Signed, titled, dated and numbered.	19.75 x 23.5"	"39/200"	991078982549706532	C103496229	\N	\N	500	\N	\N	2019-10-30	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	1053
501	Guitar Player	Zorn, Anders	https://en.wikipedia.org/wiki/Anders_Zorn	1900	Signed.	19 x 16"	Artist's Proof	991051319409706532	C093328907	\N	\N	800	2006	17732970	2019-02-08	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	1054
1012	Untitled III	Zox, Larry	\N	1971	Signed and numbered.	43 x 25"	"3/51"	991051352429706532	C093329947	\N	\N	\N	\N	\N	2019-09-01	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	1055
944	The Relocation of Property by Natural Forces	Zucker, Joe	https://en.wikipedia.org/wiki/Joe_Zucker	1976	Printed by Aaron Arnow; published by Parasol Press, Ltd., New York.	14 x 14"	"216/1000"	991036393589706532	C104974494	\N	\N	\N	\N	\N	2019-09-04	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	1056
498	Sheep Herder	Young, Mahonri	https://en.wikipedia.org/wiki/Mahonri_Young	1915	Signed. Portrays a Navajo shepherdess.	15 x 19.5"	Artist's Proof	991051347079706532	C093332738	\N	\N	150	2006	\N	2019-09-04	2022-07-28 23:59:21.060879	2023-08-21 23:18:01.85604	f	1048
497	Spring, Fort Lee	Young, Mahonri	https://en.wikipedia.org/wiki/Mahonri_Young	1934	Signed.	15 x 17"	Artist's Proof	991051347119706532	C093332747	\N	\N	150	2006	\N	2019-11-27	2022-07-28 23:59:21.060879	2023-08-21 23:20:16.360755	f	1049
706	Red Flower	Yoshihara, Hideo	https://moma.org/collection/artists/6511?locale=en	1961	Tititled, signed, and numbered.	31 x 23.5"	\N	991051347509706532	C093329479	\N	\N	450	2006	\N	2019-08-30	2022-07-28 23:59:21.060879	2023-09-13 22:13:08.305388	f	1044
494	Woman in the Sky	Yoshihara, Hideo	https://moma.org/collection/artists/6511?locale=en	1967	Signed. Lightstained.	30 x 24"	Artist's Proof	991051349309706532	C093329673	\N	\N	200	2006	17750471	2019-08-27	2022-07-28 23:59:21.060879	2023-09-13 22:43:54.815152	f	1074
1	Apples	Unknown	\N	1876-1885	(Plate xxix) Published by H. Bull & R. Hogg for the Herefordshire Pomona, London.	16.5 x 20.5"	\N	991051103819706532	C093330688	\N	\N	100	2006	\N	2019-08-29	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	29
14	The Protector	Alva (Siegfried Alweiss)	\N	\N	Signed and numbered.	27.5 x 21.5"	"8/20"	991051110679706532	C103791370	\N	\N	100	2006	\N	2020-03-08	2022-07-28 23:59:21.060879	2023-09-07 22:08:43.816075	f	20
5	Measuring Up (Self-Portrait)	Abeles, Sigmund	http://www.sigmundabeles.net/	1976	Published by Lakeside Studio.	19.25 x 24.75"	"5/50"	991051110639706532	c093330679	\N	\N	400	2006	\N	2017-11-30	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	1
58	Berkshire Downs	Bicat, Andre	https://www.britishmuseum.org/collection/term/BIOG19570	1974	Signed and numbered.	21 x 25"	"105/150"	991051102219706532	C103494984	\N	\N	400	2006	\N	2019-09-20	2022-07-28 23:59:21.060879	2023-08-26 00:06:42.661413	f	95
57	The Flirt (Le Flirt)	Besnard, Albert	https://en.wikipedia.org/wiki/Paul-Albert_Besnard	1886	Signed in pencil. D52; from the series "La Femme."	18 x 21"	"5/100"	991051102349706532	c093335688	\N	\N	950	2006	17488389	2019-08-27	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	93
60	L'oiseau	Bissiere, Roger	https://en.wikipedia.org/wiki/Roger_Bissi%C3%A8re	1951	\N	15 x 18"	Artist's Proof	991051102179706532	c093336132	\N	\N	400	2006	\N	2019-09-15	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	97
59	Bois d'Automne (Woods in Autumn)	Bissiere, Roger	https://en.wikipedia.org/wiki/Roger_Bissi%C3%A8re	1958	\N	23.5 x 33.5"	"89/125"	991051115189706532	c093336257	\N	\N	450	2006	\N	2019-09-05	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	98
103	Untitled	Claret, Joan	http://www.joanclaret.com/index_eng.html	1962	\N	20 x 17"	\N	991051099569706532	c093335891	\N	\N	300	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2023-09-14 00:49:34.127222	f	167
85	La Chambre	Carzou, Jean	https://en.wikipedia.org/wiki/Jean_Carzou	1965	\N	13.75 x 15.75"	"71/100"	991051099869706532	c093335916	\N	\N	350	2006	\N	2019-11-13	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	146
86	Barren Landscape	Cassill, Jean Kubota	\N	1964	Signed and numbered.	32.5 x 29.5"	"7/25"	991051350309706532	C103787266	\N	\N	100	2006	\N	2017-10-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	147
87	Kunming Bus	Castellon, Federico	https://en.wikipedia.org/wiki/Federico_Castell%C3%B3n	1950	Freundlich 73. From the portfolio "China," published by Federico Castellon.	15.75 x 19.75"	"112/200"	991051099839706532	c093335651	\N	\N	225	2006	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	148
112	Man with Crossed Arms	Cornell, Thomas Browne	https://en.wikipedia.org/wiki/Thomas_Cornell_(artist)	1965	Signed and inscribed "A.P." Portrait of Marvin Sadik.	28.5 x 23.5"	Artist's Proof	991051099449706532	c093335767	\N	\N	250	2006	\N	2017-02-21	2022-07-28 23:59:21.060879	2024-09-04 00:58:21.703174	f	205
113	Israeli Landscape	Coudrain, Brigitte	http://americanart.si.edu/collections/search/artist/?id=1008	\N	\N	24 x 28"	"4/75"	991051122869706532	c093336512	\N	\N	450	2006	\N	2019-09-19	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	206
140	Brown Squares	Domberger, Luitpold 	https://www.domberger.de/en/domberger.html	1970	Signed and numbered.	30 x 30"	"53/100"	991051350209706532	C093329901	\N	\N	600	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2023-08-26 00:18:50.00772	f	245
138	The Black Blouse	Dobkin, Alexander	http://www.moma.org/collection/artists/1564?locale=en	1962	Signed and numbered. Lightstained.	31x 28"	"38/100"	991051128009706532	C104943388	\N	\N	175	2006	\N	2019-08-29	2022-07-28 23:59:21.060879	2024-08-07 20:05:34.680635	f	243
137	Still Life	Dikkenboer, Daniel	http://art.famsf.org/daniel-dikkenboer	1954	\N	21 x 27"	"101/200"	991051127969706532	c093336372	\N	\N	200	2006	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	242
139	S.F. Fire Escape	Dombeck, James	\N	1978	Signed and numbered.	24.5 x 30.5"	"3/30"	991051128069706532	c093336354	\N	\N	200	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	244
141	Milk Orange	Dorny, Bertrand	https://fr.wikipedia.org/wiki/Bertrand_Dorny	\N	Signed and numbered.	23 x 35"	"13/30"	991051229399706532	c093337826	\N	\N	300	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	249
166	Composition III, ou nature morte au pot gris	Fiorini, Marcel	https://it.wikipedia.org/wiki/Marcel_Fiorini	1958	Signed and numbered.	22 x 28"	"64/120"	991051234189706532	c093332020	\N	\N	400	2006	\N	2019-09-15	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	285
168	Courtroom Scene	Forain, Jean Louis	https://en.wikipedia.org/wiki/Jean-Louis_Forain	\N	Unsigned. Probably subsequent to the catalogue raisonne.	21 x 27"	\N	991051094609706532	c093330749	\N	\N	600	2006	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	290
169	Seated Woman with Wavy Hair	Forain, Jean Louis	https://en.wikipedia.org/wiki/Jean-Louis_Forain	1905	Unsigned.	15 x 20"	\N	991051094669706532	c093330615	\N	\N	300	2006	\N	2020-02-11	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	291
170	Orange Interior	Ford, Mary	\N	1979	Signed and numbered.	23 x 20"	"188/200"	991051093629706532	C103786998	\N	\N	100	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	292
171	Devil's Funeral	Fornas, Leander	http://www.moma.org/collection/artists/1942?locale=ko	1955	Inscribed "tpla."	27 x 22"	"8/12"	991051093669706532	c093335509	\N	\N	100	2006	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	293
172	Temple	Forsberg, Jim	\N	1956	Signed and numbered.	20 x 26.5"	"34/200"	991051094499706532	c093330590	\N	\N	200	2006	\N	2019-09-05	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	295
194	Asta su Abuelo (And so was his grandfather)	Goya y Lucientes, Francisco Jose de	https://en.wikipedia.org/wiki/Francisco_Goya	1890	No. 39 from the series "Los Caprichos."	16 x 13"	\N	991051091779706532	c093335271	\N	\N	500	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	344
220	Indifference	Hasegawa, Shoichi	https://www.annexgalleries.com/artists/biography/3897/Hasegawa/Shoichi	1964	Signed and numbered.	26 x 28"	"27/30"	991051247179706532	c093333626	\N	\N	350	2006	\N	2019-09-23	2022-07-28 23:59:21.060879	2023-08-26 00:30:01.955966	f	391
219	Composition No. 2	Hartung, Hans	https://en.wikipedia.org/wiki/Hans_Hartung	1957	Signed and numbered. Fondation Hans Hartung L 11. Published by Jean Pons and Berggruen & Cie., Paris.	21.5 x 27.5"	"40/100"	991046384579706532	c093334994	\N	\N	800	2006	17744823	2019-09-04	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	389
222	A Character Who Will Not Suit the Ladies	Heath, Henry	\N	1830	Captioned "No. 12. One of Pa's choice, but he won't do for me." Printed by LeFevre & Kohler.	15 x 13"	\N	991051090789706532	C104971757	\N	\N	100	2006	\N	2019-08-30	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	396
248	Young Musician	Jules, Mervin	\N	1958	Edition of 200	27 x 21"	"?/200"	991051282639706532	c093332914	\N	\N	150	2006	\N	2019-09-09	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	448
271	Mother and Child	Klinghoffer, Clara	http://www.claraklinghoffer.com/	1965	Signed and numbered. Published by Associated American Artists, New York.	16.5 x 19"	"106/250"	991051079139706532	c091134420	\N	\N	200	2006	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	478
272	Funabashi: The Floating Bridge	Tsukioka, Kogyo	https://en.wikipedia.org/wiki/K%C5%8Dgyo_Tsukioka	1897	From the series "Pictures of Noh Plays (Nogaku Zue)."	18.25 x 14"	\N	991051079179706532	c091134396	\N	\N	100	2006	\N	2019-09-24	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	481
294	Open Hand (La main ouverte)	Le Corbusier (Jeanneret-Gris, Charles-Edouard)	https://en.wikipedia.org/wiki/Le_Corbusier	1955	Signed and numbered. A sketch for Chandigarh's "Open Hand Monument." Provenance: Berggruen & Cie.	23.5 x 33.5"	"59/150"	991046384119706532	c093334976	\N	\N	900	2006	\N	2018-08-20	2022-07-28 23:59:21.060879	2023-08-26 00:41:10.742864	f	524
299	Two Trees	Lent, Donald	\N	1963	Signed and numbered.	23 x 19.5"	"4/5"	991051077799706532	c091134305	\N	\N	50	2006	\N	2019-09-20	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	528
320	Bear People Sharing Some Fish	Mamnguqsualuk, Victoria	\N	1981	Embossed stamp plus a yellow "Luna Aegea" stamp. Artist is a Canadian Eskimo from Baker Lake.	29 x 40.5"	"31/35"	991051349969706532	C103494151	\N	OVERSIZED	500	2006	\N	2019-09-29	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	566
321	Landscape	Manaresi, Paolo	https://it.wikipedia.org/wiki/Paolo_Manaresi	1965	Signed and numbered.	27 x 21"	"14/35"	991051076859706532	c091134174	\N	\N	800	2006	17362575	2011-08-25	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	567
322	February in Holland (Fevrier en Hollande)	Manessier, Alfred	https://en.wikipedia.org/wiki/Alfred_Manessier	1957	Edition of 175.	15 x 19"	"?/175"	991051077659706532	c091134271	\N	\N	800	2006	17364440	2019-09-13	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	568
530	The Dragon	Unknown	\N	1988	Trial Proof	15 x 11"	\N	991053841429706532	c067068412	\N	\N	500	\N	\N	2019-09-15	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	254
411	Rapallo	Smith, Moishe	http://www.nga.gov/content/ngaweb/Collection/artist-info.3092.html	1965	Signed and numbered. Published by Associated American Artists, New York.	17 x 19"	"168/250"	991051031679706532	C091132389	\N	\N	100	2006	\N	2019-10-01	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	825
441	Nostalgia of Kyoto	Takahashi, Rikio	\N	1960	Signed and numbered.	40 x 30.5"	"53/200"	991051234749706532	C093332206	\N	\N	200	2006	\N	2019-08-27	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	884
526	May	Anuszkiewicz, Richard	https://en.wikipedia.org/wiki/Richard_Anuszkiewicz	1972	Signed and numbered. From the 1972 "Domberger Siebdruck Kalender" series.	22 x 22"	"79/165"	991051103639706532	C103790756	\N	\N	300	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2023-08-21 19:02:38.696602	f	1073
534	Portrait of Charles Meryon	Bracquemond, Felix	https://en.wikipedia.org/wiki/F%C3%A9lix_Bracquemond	1853	Signed "Ch. M. / B. 1853" in the plate at upper left. Bottom edge trimmed.	15 x 13"	\N	991053843329706532	c067068388	\N	\N	500	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	119
580	Stages at Rye	Clarke, Graham	https://www.grahamclarke.co.uk/home.php	\N	Signed.	30.5 x 36"	"1/50"	991051349469706532	C104947658	\N	\N	150	2006	\N	2019-08-31	2022-07-28 23:59:21.060879	2023-09-05 14:37:58.601453	f	168
572	Composition grise	Araki, Tetsuo	https://en.wikipedia.org/wiki/Tetsuo_Araki	\N	Signed and numbered.	24.5 x 28.5"	"9/25"	991051103709706532	C103788215	\N	\N	250	2006	\N	2019-10-18	2022-07-28 23:59:21.060879	2023-10-15 16:41:17.254261	f	43
576	Plate 6	Bolotowsky, Ilya	https://en.wikipedia.org/wiki/Ilya_Bolotowsky	1968	Signed and numbered.	29 x 31"	"56/125"	991051349389706532	C104943360	\N	\N	350	2006	\N	2019-09-02	2022-07-28 23:59:21.060879	2024-07-24 20:10:34.53026	f	1077
573	Tide Light	Avedisian, Edward	https://en.wikipedia.org/wiki/Edward_Avedisian	1969	\N	35.5 x 28.5"	\N	991051347289706532	C093332783	\N	\N	1000	\N	\N	2019-08-27	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	55
577	Rue de la grosse horloge, Rouen	Boys, Thomas Shotter	https://en.wikipedia.org/wiki/Thomas_Shotter_Boys	1839	From the series "Picturesque Architecture."	18.5 x 22"	\N	991051348979706532	C093329594	\N	\N	600	2006	\N	2019-09-10	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	116
579	Mutation	Citron, Minna Wright	https://en.wikipedia.org/wiki/Minna_Citron	1962	Lightstained.	27 x 32.5"	\N	991051349539706532	C093329734	\N	\N	300	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	166
582	History of Printmaking: Hayter Discovers Viscosity	Colescott, Warrington	https://en.wikipedia.org/wiki/Warrington_Colescott	1976	Signed and numbered. From "The History of Printmaking."	19.5 x 27.5"	"45/50"	991051332879706532	C103510879	\N	\N	700	2006	\N	2019-09-06	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	176
581	Mountain	Dehn, Adolf	https://en.wikipedia.org/wiki/Adolf_Dehn	1961	Signed.	24 x 28"	"?/40"	991051349509706532	C103787239	\N	\N	200	2006	\N	2017-09-23	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	233
561	Divided Country	Harris, Deborah	http://www.deborah-harris.com/	2004	Initialed and inscribed "a.p."	14 x 12"	\N	991053879019706532	C098422655	\N	\N	500	\N	\N	2019-10-11	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	380
568	May	Nicholson, William	https://en.wikipedia.org/wiki/William_Nicholson_(artist)	1898	From "An Almanac of Twelve Sport."	15 x 13.5"	\N	991051327659706532	C093329071	\N	\N	175	2006	\N	2019-09-10	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	657
562	Lo Hizo!	Rodriguez, Artemio	http://www.letterpress.com/greenknight/page3.htm	1995	Signed and numbered.	13 x 11"	"9/30"	991053879059706532	C098422646	\N	\N	500	\N	\N	2019-03-01	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	756
599	Little Garden	Dos Santos, Bartolomeu	https://en.wikipedia.org/wiki/Bartolomeu_Cid_dos_Santos	1968	Signed.	22.5 x 24.5"	\N	991051332919706532	C103494692	\N	\N	200	2006	\N	2019-09-09	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	251
601	Genezareth Sea	Ephraim-Marcus, Kate	\N	1958	Signed.	21.5 x 27"	\N	991051348939706532	C093329585	\N	\N	500	\N	\N	2019-10-21	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	273
602	La demoiselle à la licorne	Fiorini, Marcel	\N	1969	\N	22 x 28"	\N	991051234259706532	C093331965	\N	\N	400	2006	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	286
603	Last Warren Trees	Forrester, Patricia Tobacco	\N	1968	Signed and numbered. Annotated "2nd edition."	26 x 31"	"14/75"	991051349609706532	C103494586	\N	\N	500	2006	\N	2019-09-05	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	294
604	Le Coq I	Friedlaender, Johnny	https://en.wikipedia.org/wiki/Johnny_Friedlaender	1951	Signed and inscribed "epreuve art. Japon." Foxing.	27.5 x 21"	\N	991051093819706532	C093335323	\N	\N	800	2006	\N	2019-02-22	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	305
606	Japanese Waters II	Frederick, Robilee	https://www.annexgalleries.com/artists/biography/4797/Frederick/Robilee	\N	Signed.	34 x 24"	\N	991051349709706532	C104971906	\N	\N	500	\N	\N	2019-09-11	2022-07-28 23:59:21.060879	2023-08-21 22:45:15.348409	f	301
605	Water's Edge	Gantner, Bernard	\N	\N	\N	24 x 29.5"	\N	991078466009706532	C103510958	\N	\N	300	2006	\N	2019-09-09	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	312
608	Fillmore Car Barn & Powerhouse	Gibbons, Alice	https://www.artspan.org/artist/alicegibbons	2007	\N	11 x 9"	\N	991051327379706532	C093329202	\N	\N	500	\N	\N	2019-09-09	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	330
609	Hayes & Buchanan	Gibbons, Alice	https://www.artspan.org/artist/alicegibbons	2007	\N	11 x 9"	\N	991051327339706532	C093329062	\N	\N	500	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	332
610	This Ol' House	Gibbons, Alice	https://www.artspan.org/artist/alicegibbons	2006	\N	11 x 9"	\N	991051327279706532	C093329336	\N	\N	500	\N	\N	2017-10-01	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	333
611	A Young Girl and Shamisen	Harumasu (Utagawa Shunsho)	\N	1844	\N	19.5 x 15"	\N	991054201429706532	C098423093	\N	\N	500	\N	\N	2019-09-30	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	390
612	Four Hands	Ikeda, Masuo	http://www.moma.org/collection/artists/2801?locale=en	1965	Signed and inscribed, "ep. d'artiste."	23.5 x 21.5"	\N	991051327779706532	C093328943	\N	\N	500	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	428
616	A Time and a Place	Kasten, Karl	https://en.wikipedia.org/wiki/Karl_Kasten	1964	Artist's proof.	26.5 x 23"	\N	991051282699706532	C093332899	\N	\N	500	\N	\N	2019-09-10	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	456
631	Woman in Spring Hat	Marx, Robert	https://mainstreetartscs.org/robertmarx/	1964	Signed and numbered.	27.5 x 21.5"	"13/15"	991078475549706532	C104971696	\N	\N	150	\N	\N	\N	2022-07-28 23:59:21.060879	2023-08-26 00:48:31.437351	f	596
624	Let Us Call it Arden and Live in It	Kitaj, Ronald B.	https://en.wikipedia.org/wiki/R._B._Kitaj	1966	Published by Marlborough Graphics.	37 x 28"	"?/70"	991078466339706532	C103510967	\N	\N	800	2006	\N	2019-09-06	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	475
621	Mountain Climber	Kohn, Misch	http://www.moma.org/collection/artists/3193?locale=en	1950	Signed, titled, and dated.	33 x 23"	"?/30"	991051282969706532	C104970610	\N	\N	300	2006	\N	2019-09-14	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	485
761	Friends of the Urban Forest, Shoveling Dirt	Margitich, Justin	http://justinmargitich.com/home.html	2009	\N	14.5 x 16.5"	\N	991078598299706532	C104970887	\N	\N	500	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	576
628	Bath Street	Markson, Helena	http://www.emmamason.co.uk/a/helena-markson	1964	Signed and numbered.	34 x 25"	"99/100"	991078474979706532	C103510763	\N	\N	500	\N	\N	2019-09-08	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	583
629	Queen's Dock	Markson, Helena	http://www.emmamason.co.uk/a/helena-markson	1964-1965	Signed and numbered. From the portfolio "Liverpool Suite."	34 x 28"	"51/100"	991051347409706532	C093329451	\N	\N	500	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	585
630	Trouville	Martin, Frank	\N	1968	\N	34.25 x 27.5"	"37/50"	991078475359706532	C103510781	\N	\N	450	2006	\N	2019-08-30	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	593
632	Peconic View	Massie, Lorna	\N	1981	Signed and numbered.	24 x 31.5"	"132/200"	991051349669706532	C093329761	\N	\N	150	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	598
636	Orca	Moore, Kevin	\N	1979	Signed and numbered.	31 x 33.25"	"5/25"	991078476729706532	C103510833	\N	\N	500	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	635
637	Granite Tor	Morgan, Norma	http://www.nga.gov/content/ngaweb/Collection/artist-info.5026.html	1955	Signed.	22.5 x 28"	Artist's proof	991051037089706532	C103494559	\N	\N	400	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	637
638	Girl with a Cat (Fillette au chat)	Morisot, Berthe	https://en.wikipedia.org/wiki/Berthe_Morisot	1889	Bailly Herzberg 6. Presumably from the Duret edition of 1923. With pinholes but no sign of cancellation marks.	13.5 x 12.25"	\N	991051037219706532	C103494762	\N	\N	800	2006	\N	2019-09-15	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	639
639	Drawing Lesson (Lecon de dessin)	Morisot, Berthe	https://en.wikipedia.org/wiki/Berthe_Morisot	1899	Etude de Berthe Morisot Dessinant Avec sa Fille (Study of Berthe Morisot Drawing with her Daughter). Bailly Herzberg 8iii. Cancellation pinholes. Paper browned.	14.25 x 12.25"	\N	991051037179706532	C103494708	\N	\N	750	2006	\N	2019-09-09	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	640
640	Flower Girl, Drury Lane	Nicholson, William	https://en.wikipedia.org/wiki/William_Nicholson_(artist)	1898	Good condition.	15 x 15u0094	\N	991051036889706532	C091132954	\N	\N	175	2006	\N	2017-12-14	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	656
652	Pink	Petersen, Margaret	\N	1970	Signed and dated.	25 x 31"	\N	991078485939706532	C104971739	\N	\N	500	2006	\N	2019-08-31	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	688
657	Raincloud	Renner, Robin	\N	1977	Signed.	19 x 24.5"	"?/10"	991078467409706532	C103510985	\N	\N	50	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	733
663	Cockerel with Spread Wings	Rothenstein, Michael	https://en.wikipedia.org/wiki/Michael_Rothenstein	1955-1960	Signed and numbered.	25.5 x 33.5"	"20/30"	991051285359706532	C093332969	\N	\N	600	2006	\N	2018-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	765
658	Chicago 7 - the Eclypse of Bobby Seale	Renner, Robin	\N	1970	\N	31 x 25"	"2/8"	991051285079706532	C104972052	\N	\N	50	2006	\N	2019-09-09	2022-07-28 23:59:21.060879	2023-06-29 00:17:28.909349	f	731
666	Inset Wheels	Rothenstein, Michael	https://en.wikipedia.org/wiki/Michael_Rothenstein	1965	Numbered. Part of the "Two Circles Series."	28 x 42"	"10/30"	991051352819706532	C093330059	\N	OVERSIZED, Hanging in GRDS	400	2006	\N	2019-09-27	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	766
664	Lake Merritt Boathouse, Oakland	Roudebush, Harriet	https://art.famsf.org/harriet-roudebush	\N	Signed. Paper browned.	13 x 16"	\N	991051327849706532	C093329220	\N	\N	200	2006	\N	2019-10-03	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	769
670	El Espiritu Santo	Sanchez, Enrique	\N	1960	\N	57 x 31"	\N	991053845869706532	C067069045	\N	OVERSIZED	700	2006	\N	2019-09-09	2022-07-28 23:59:21.060879	2023-08-24 18:35:39.643448	t	780
667	Plate I	Saff, Donald	https://en.wikipedia.org/wiki/Donald_Saff	1969	Signed and numbered. From the portfolio "Breezes." Crease in image.	33 x 25.5"	"50/100"	991051285539706532	C093333097	\N	\N	700	2006	\N	2019-10-30	2022-07-28 23:59:21.060879	2024-09-04 21:01:27.223694	f	775
694	Loon Island Outlook	McMillan, Stephen	http://www.sonic.net/aquatint/	1988	Signed and inscribed "1 plate edition."	13 x 17"	"6/60"	991078475699706532	C103510806	\N	\N	500	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	612
692	Rainforest Tapestry	Mitchell, Sharon Augusta	http://www.islandinternational.com/artist-sharon-augusta-mitchell.php	1993	Edition of 100.	28.5 x 34"	"?/100"	991078476599706532	C103510824	\N	\N	375	2006	\N	2019-08-27	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	630
677	Marina	Simbari, Nicola	https://en.wikipedia.org/wiki/Nicola_Simbari	\N	Original Associated American Artists label on back of frame.	28 x 23.5"	\N	991051285719706532	C104939584	\N	\N	300	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2023-09-12 04:02:08.2737	f	814
681	Magazyn Lalek (Warehouse of Dolls)	Skorczewski, Krzysztof	http://www.skorczewski.com/en/artist/biography.html	1987	Signed and numbered.	15.5 x 16.5"	"39/100"	991078462459706532	C103510949	\N	\N	600	2006	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	820
682	Maxwell's Marvelous Equation: Ampere-Maxwell's Law	Snow, Maryly	http://www.snowstudios.com/	1991	Signed and annotated "A/P."	33.5 x 24"	\N	991078537189706532	C094893196	\N	\N	500	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	827
698	Daphnis et Chloe	Bonnard, Pierre	https://en.wikipedia.org/wiki/Pierre_Bonnard	1902	Illustration for "Daphnis and Chloe".	15.25 x 12.25"	\N	991078465809706532	C103494300	\N	\N	500	\N	\N	\N	2022-07-28 23:59:21.060879	2023-09-13 22:57:03.848845	f	108
691	Tranquil Rain	Uchima, Ansei	http://www.myjapanesehanga.com/home/artists/ansei-uchima-1921-2000-	1963	Signed and annotated "Artist's Proof."	26.5 x 24"	\N	991051347369706532	C093329442	\N	\N	500	\N	\N	2019-09-09	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	917
702	Monstera deliciosa?	Warren, Terrence	\N	1978	Signed and numbered.	31.5 x 27.5"	"37/80"	991051333059706532	C093329141	\N	\N	100	2006	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	992
715	San Francisco - 1980	Chavez Sanchez, Esteban	\N	1980	Signed and annotated "A/P."	41.5 x 30"	\N	991078507259706532	C094905144	\N	OVERSIZED	600	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	161
718	Anuenue Namolokama	Daniells, Mark	\N	1990	Signed and numbered.	27 x 38"	"345/500"	991078519189706532	C094905296	\N	\N	500	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	220
717	Garden Island III	Daniells, Mark	\N	1991	Signed and numbered.	27 x 38"	"198/500"	991078519129706532	C103791802	\N	\N	500	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2023-09-05 15:55:01.649716	f	221
716	Stream of Dreams	Daniells, Mark	\N	1992	Signed and numbered.	27 x 38"	"144/500"	991078508279706532	C094905287	\N	\N	500	\N	\N	2019-08-31	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	222
721	City Lights	Dorny, Bertrand	https://fr.wikipedia.org/wiki/Bertrand_Dorny	\N	Signed and numbered.	29 x 26"	"41/50"	991078519669706532	C094893600	\N	\N	750	\N	\N	2019-09-09	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	247
708	Berthe Morisot	Manet, Edouard	https://en.wikipedia.org/wiki/%C3%89douard_Manet	1872	Executed by Manet in 1872; this impression was published in 1910 for "Manet & the French Impressionists" by Theodore Duret. Printed from the cancelled plate with two punched holes.	12.5 x 10.75"	\N	991078466669706532	C103494489	\N	\N	100	2006	Harris 75 ii/ii. Large cancellation holes.	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	569
712	Well-Known Folly (¡QUÉ GUERRERO!)	Poskovic, Endi	http://endiposkovic.com/home.html	2005	Numbered and annotated "E.A."	27 x 32.5"	"8/15"	991078506089706532	C094905001	\N	\N	800	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	713
722	Cha, Cha, Cha	Reyes, Fernando	http://www.freyesart.com/about/	2005	Signed and numbered.	17.5 x 15.5"	"28/35"	991078537349706532	C094893336	\N	\N	500	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	736
727	Eastern Sierras (Black and White)	Reyes, Fernando	http://www.freyesart.com/about/	2000	Signed and numbered.	15.5 x 17.5"	"3/100"	991078544949706532	C094893211	\N	\N	500	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	737
728	Eastern Sierras (Color)	Reyes, Fernando	http://www.freyesart.com/about/	2000	Signed and numbered.	15.5 x 17.5"	"13/20"	991078545009706532	C094893488	\N	\N	500	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	738
751	Auto Vision, No. 40	Alicia, Juana	https://en.wikipedia.org/wiki/Juana_Alicia	1995	Signed and numbered. From the portfolio: "10 x 10 Ten Women Ten Prints."	30 x 23.5"	"40/75"	991078577989706532	C103494425	\N	\N	500	\N	\N	2019-09-04	2022-07-28 23:59:21.060879	2024-09-05 21:59:41.875058	f	14
746	Gas Mask I	Gersh, Adam	http://www.gershgoroth.com/hire-us/	2010	Signed.	20.5 x 17"	\N	991078568219706532	C094893530	\N	\N	500	\N	\N	2019-11-11	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	320
744	Light	Gersh, Adam	http://www.gershgoroth.com/hire-us/	2010	Signed.	33 x 25"	\N	991078568159706532	C094893521	\N	\N	500	\N	\N	2019-09-22	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	321
745	Untitled I	Gersh, Adam	http://www.gershgoroth.com/hire-us/	2010	Signed.	18.5 x 23.25"	\N	991078568199706532	C094893390	\N	\N	500	\N	\N	2014-02-07	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	323
785	Blue Fir	Walker	\N	\N	Signed, titled and numbered.	28 x 22"	"29/80"	991078626779706532	C104970966	\N	\N	500	\N	\N	2019-08-30	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	985
792	Moon in the City	Bowman, Dorothy Louise	http://www.nga.gov/content/ngaweb/Collection/artist-info.33220.html	1957	Signed, titled and dated.	20 x 17.5"	"?/210"	991078646669706532	C103795774	\N	\N	900	\N	\N	2019-09-01	2022-07-28 23:59:21.060879	2023-09-05 15:58:09.340613	f	115
798	Auto Vision, No. 15	Alicia, Juana	https://en.wikipedia.org/wiki/Juana_Alicia	1995	Signed and numbered. From the portfolio: "10 x 10 Ten Women Ten Prints."	30 x 23.5"	"15/75"	991078647729706532	C104970805	\N	\N	500	\N	\N	2019-09-02	2022-07-28 23:59:21.060879	2024-09-05 21:59:46.339312	f	13
803	Cane Cutter	Adams, Tate	https://en.wikipedia.org/wiki/Tate_Adams	1963	Signed, titled, dated and numbered.	39 x 28.5"	"11/50"	991078647949706532	C103501312	\N	\N	750	\N	\N	2018-09-19	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	6
791	Untitled, Colorful Figures	Arastu, Salma	https://en.wikipedia.org/wiki/Salma_Arastu	\N	Signed.	15 x 19"	\N	991078646569706532	C104970799	\N	\N	500	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	45
797	Ser Mujer es Saber Resistir	Bernardi, Claudia	https://www.cca.edu/academics/faculty/cbernardi	1995	Signed, titled and numbered. From the portfolio: "10 x 10 Ten Women Ten Prints."	27 x 27"	"40/75"	991078647689706532	C104971030	\N	\N	500	\N	\N	2019-09-03	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	90
822	Untitled, Bodies and Parts	Derpapas, Georgios	\N	1962	Titled and dated. Annotated "A.P."	22 x 17.5"	Artist's proof	991078662279706532	C104970498	\N	\N	500	\N	\N	2018-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	239
837	The Mountain (Der Berg)	Nowak, Fred	\N	\N	Signed.	16.75 x 12"	\N	991078776919706532	C103532109	\N	\N	500	\N	\N	2019-08-31	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	661
855	Coastal Bird	Bradford, Howard	\N	1954	Signed, titled and numbered. Annotated E68 in lower left.	17.25 x 23.25"	\N	991079166609706532	C103495614	\N	\N	500	\N	\N	2019-09-09	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	120
856	Pacific Coast Tower	Bradford, Howard	https://www.howardbradford.com/	1954	Signed, titled, and dated.	18.75 x 25.25"	\N	991079174789706532	C103495605	\N	\N	500	\N	\N	2019-09-01	2022-07-28 23:59:21.060879	2023-08-26 00:07:41.948317	f	121
857	Untitled, Birds	Bradford, Howard	https://www.howardbradford.com/	1953	Signed and dated. Annotated E65 in lower left corner. Some water damage on the right side of print.	17.75 x 21.75"	\N	991079175089706532	C103495632	\N	\N	500	\N	\N	2019-08-27	2022-07-28 23:59:21.060879	2023-08-26 00:07:46.992182	f	122
862	Untitled	Canogar, Rafael	https://es.wikipedia.org/wiki/Rafael_Canogar	1966	Signed and numbered.	25 x 20"	"5/25"	991079191769706532	C103496414	\N	\N	900	\N	\N	2017-09-05	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	141
861	Untitled, Figures against Red	Cantu, Gerardo	https://de.wikipedia.org/wiki/Gerardo_Cant%C3%BA	1971	Signed, dated and numbered.	20.25 x 24.25"	"2/30"	991079188879706532	C103496399	\N	\N	750	\N	\N	2019-11-23	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	142
881	Composition	Afro (Basaldella, Afro)	https://en.wikipedia.org/wiki/Afro_Basaldella	1957	Signed and numbered.	23.5 x 33.5"	"32/110"	991079339259706532	C103494957	\N	\N	750	\N	\N	2019-08-27	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	7
879	Tangerines	Cleveland, Walter	\N	\N	Signed.	16.5 x 20.5"	\N	991079338909706532	C103494540	\N	\N	500	\N	\N	2019-08-28	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	172
912	River	Beutlich, Tadek	https://www.britishmuseum.org/collection/term/BIOG19516	1967	\N	31.5" x 41.5"	45/75	991005668209706532	C103787655	\N	255 Doe	1000.00	\N	\N	2019-08-31	2022-07-28 23:59:21.060879	2024-08-14 21:11:43.668986	t	94
1026	Untitled	Haessle, Jean-Marie	https://en.wikipedia.org/wiki/Jean-Marie_Haessle	1992	Signed and dated.	15 x 11"	\N	991044527789706532	C104947773	\N	\N	\N	\N	Gift of Amy Baker Sandback	2019-10-22	2022-07-28 23:59:21.060879	2023-08-17 22:10:25.96006	f	372
1070	EXPRMNTS	Grabow, Alexandra	\N	2019	Signed by the artist. 3 of a series.	12 x 30"	\N	991051324669706532	C103790774	\N	\N	\N	\N	\N	2019-09-26	2022-07-28 23:59:21.060879	2023-08-26 00:26:34.890635	f	9
1069	EXPNDS	Grabow, Alexandra	\N	2019	Signed by the artist.	27 x 33"	\N	991051324699706532	C104943421	\N	\N	\N	\N	\N	2019-09-03	2022-07-28 23:59:21.060879	2024-08-14 19:58:28.756077	f	1096
1100	Untitled (Silver Leaves)	Belau, Susan	https://susanbelau.com/	2017	Signed and dated by artist in lower right corner of print.	12.25 x 15.25u0094	"4/5"	991056572939706532	\N	\N	\N	\N	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	79
1082	Yuba River III	Chamberlin, Wesley	\N	1986	Signed and titled.	34 x 27.5u0094	\N	991054193609706532	\N	\N	\N	\N	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	159
1110	White Peacock	Arnold, Paul	http://www.loraincounty.com/nonprofit/feature.shtml?f=29729	1957	Signed, dated, and titled.	\N	"3/200"	991056573909706532	\N	\N	\N	\N	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	46
1109	Kilkenny	Dorny, Bertrand	https://fr.wikipedia.org/wiki/Bertrand_Dorny	1969	Signed, dated, and titled. Published by Nielsen Gallery, Boston.	\N	"32/40"	991056573879706532	\N	\N	\N	\N	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	248
1107	Seaton	Piper, John	https://en.wikipedia.org/wiki/John_Piper_(artist)	1978	Signed and numbered. Printed by Curwen Studio, published by Orde Levinson.	32.5 x 26"	"9/75"	991056573699706532	C104988100	\N	\N	\N	\N	\N	\N	2022-07-28 23:59:21.060879	2023-09-04 16:32:10.347637	f	698
1106	Dutch Fishing Harbor in Volendam	Roovers, Piet F.	\N	1955	Signed, dated, and numbered.	\N	"92/200"	991056573739706532	\N	\N	\N	\N	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	761
1105	Italiano Romantico	Stanley, M. Louise	https://mlouisestanley.com/	1994	Graphite on paper. Signed by the artist. The drawing began as a page in one of Stanley's travel journals.	23.5 x 27.5"	\N	991056573179706532	\N	\N	\N	\N	\N	\N	\N	2022-07-28 23:59:21.060879	2022-07-28 23:59:21.060879	f	844
1108	Umbria	Silverman, Mel	\N	1962	Signed and dated in lower right; numbered and titled in lower left.	\N	"13/24"	991056573769706532	C104987799	\N	\N	\N	\N	\N	\N	2022-07-28 23:59:21.060879	2023-09-05 18:59:59.820661	f	813
1111	Farm [Slovene Farm]	Ross, John	http://oldprintshop.com/artists/46940	1965	Signed, numbered, and titled.	\N	"10/75"	991056573939706532	C104988270	\N	\N	\N	\N	\N	\N	2022-07-28 23:59:21.060879	2023-09-05 20:02:11.114744	f	764
\.


--
-- TOC entry 3413 (class 0 OID 16754)
-- Dependencies: 226
-- Data for Name: terms; Type: TABLE DATA; Schema: public; Owner: galc-api-production
--

COPY public.terms (id, value, facet_id, parent_id, created_at, updated_at, ord) FROM stdin;
1	Color	1	\N	2022-07-28 23:59:21.388959	2022-07-28 23:59:21.388959	\N
2	Black and White	1	\N	2022-07-28 23:59:21.391809	2022-07-28 23:59:21.391809	\N
20	Abstract	4	\N	2022-07-28 23:59:21.427105	2022-07-28 23:59:21.427105	\N
21	Animals	4	\N	2022-07-28 23:59:21.428479	2022-07-28 23:59:21.428479	\N
22	Cityscape	4	\N	2022-07-28 23:59:21.429997	2022-07-28 23:59:21.429997	\N
23	Figurative	4	\N	2022-07-28 23:59:21.431429	2022-07-28 23:59:21.431429	\N
24	Landscape	4	\N	2022-07-28 23:59:21.432785	2022-07-28 23:59:21.432785	\N
25	Pop Art	4	\N	2022-07-28 23:59:21.434101	2022-07-28 23:59:21.434101	\N
26	Religious	4	\N	2022-07-28 23:59:21.435423	2022-07-28 23:59:21.435423	\N
27	Still Life	4	\N	2022-07-28 23:59:21.43674	2022-07-28 23:59:21.43674	\N
28	Text Based	4	\N	2022-07-28 23:59:21.438044	2022-07-28 23:59:21.438044	\N
30	Collage	5	\N	2022-07-28 23:59:21.442054	2022-07-28 23:59:21.442054	\N
35	Giclée	5	\N	2022-07-28 23:59:21.448628	2022-07-28 23:59:21.448628	\N
36	Intaglio	5	\N	2022-07-28 23:59:21.449927	2022-07-28 23:59:21.449927	\N
40	Mixed Media	5	\N	2022-07-28 23:59:21.455231	2022-07-28 23:59:21.455231	\N
41	Monoprint	5	\N	2022-07-28 23:59:21.456584	2022-07-28 23:59:21.456584	\N
42	Monotype	5	\N	2022-07-28 23:59:21.457896	2022-07-28 23:59:21.457896	\N
43	Painting	5	\N	2022-07-28 23:59:21.459361	2022-07-28 23:59:21.459361	\N
44	Photograph	5	\N	2022-07-28 23:59:21.460652	2022-07-28 23:59:21.460652	\N
47	Planographic	5	\N	2022-07-28 23:59:21.464535	2022-07-28 23:59:21.464535	\N
48	Relief	5	\N	2022-07-28 23:59:21.46583	2022-07-28 23:59:21.46583	\N
52	Stencil	5	\N	2022-07-28 23:59:21.471022	2022-07-28 23:59:21.471022	\N
53	Unidentified	5	\N	2022-07-28 23:59:21.472421	2022-07-28 23:59:21.472421	\N
29	Aquatint	5	36	2022-07-28 23:59:21.440666	2022-07-28 23:59:21.493731	\N
32	Drypoint	5	36	2022-07-28 23:59:21.444648	2022-07-28 23:59:21.496402	\N
33	Engraving	5	36	2022-07-28 23:59:21.445966	2022-07-28 23:59:21.498594	\N
34	Etching	5	36	2022-07-28 23:59:21.447294	2022-07-28 23:59:21.503084	\N
39	Mezzotint	5	36	2022-07-28 23:59:21.453948	2022-07-28 23:59:21.505275	\N
46	Photoprint	5	36	2022-07-28 23:59:21.46325	2022-07-28 23:59:21.507381	\N
49	Relief Etching	5	36	2022-07-28 23:59:21.467138	2022-07-28 23:59:21.509477	\N
38	Lithograph	5	47	2022-07-28 23:59:21.452575	2022-07-28 23:59:21.514283	\N
45	Photolithograph	5	47	2022-07-28 23:59:21.461952	2022-07-28 23:59:21.516455	\N
56	Zincograph	5	47	2022-07-28 23:59:21.476378	2022-07-28 23:59:21.518401	\N
31	Collagraph	5	48	2022-07-28 23:59:21.44336	2022-07-28 23:59:21.52352	\N
37	Linocut	5	48	2022-07-28 23:59:21.451247	2022-07-28 23:59:21.525577	\N
54	Wood Engraving	5	48	2022-07-28 23:59:21.473696	2022-07-28 23:59:21.527528	\N
55	Woodcut	5	48	2022-07-28 23:59:21.47502	2022-07-28 23:59:21.529537	\N
50	Serigraph	5	52	2022-07-28 23:59:21.468452	2022-07-28 23:59:21.53366	\N
51	Silkscreen	5	52	2022-07-28 23:59:21.469746	2022-07-28 23:59:21.535919	\N
57	Risograph	5	\N	2022-09-20 20:18:37.179993	2022-09-20 20:18:37.179993	\N
7	Before 1900	3	\N	2022-07-28 23:59:21.40251	2022-07-28 23:59:21.40251	0
8	1900-1909	3	\N	2022-07-28 23:59:21.403951	2022-07-28 23:59:21.403951	1
9	1910-1919	3	\N	2022-07-28 23:59:21.405451	2022-07-28 23:59:21.405451	2
10	1920-1929	3	\N	2022-07-28 23:59:21.406765	2022-07-28 23:59:21.406765	3
11	1930-1939	3	\N	2022-07-28 23:59:21.408103	2022-07-28 23:59:21.408103	4
12	1940-1949	3	\N	2022-07-28 23:59:21.413378	2022-07-28 23:59:21.413378	5
13	1950-1959	3	\N	2022-07-28 23:59:21.415055	2022-07-28 23:59:21.415055	6
14	1960-1969	3	\N	2022-07-28 23:59:21.416878	2022-07-28 23:59:21.416878	7
15	1970-1979	3	\N	2022-07-28 23:59:21.418407	2022-07-28 23:59:21.418407	8
16	1980-1989	3	\N	2022-07-28 23:59:21.419838	2022-07-28 23:59:21.419838	9
17	1990-1999	3	\N	2022-07-28 23:59:21.421346	2022-07-28 23:59:21.421346	10
18	After 1999	3	\N	2022-07-28 23:59:21.422946	2022-07-28 23:59:21.422946	11
19	No Date	3	\N	2022-07-28 23:59:21.424287	2022-07-28 23:59:21.424287	12
3	Small	2	\N	2022-07-28 23:59:21.394588	2022-07-28 23:59:21.394588	0
4	Medium	2	\N	2022-07-28 23:59:21.395958	2022-07-28 23:59:21.395958	1
5	Large	2	\N	2022-07-28 23:59:21.397338	2022-07-28 23:59:21.397338	2
6	Oversized	2	\N	2022-07-28 23:59:21.39868	2022-07-28 23:59:21.39868	3
\.


--
-- TOC entry 3411 (class 0 OID 16746)
-- Dependencies: 224
-- Data for Name: items_terms; Type: TABLE DATA; Schema: public; Owner: galc-api-production
--

COPY public.items_terms (item_id, term_id) FROM stdin;
1	1
1	3
1	7
1	27
1	38
2	2
2	4
2	15
2	23
2	38
3	2
3	3
3	15
3	23
3	38
4	2
4	5
4	19
4	23
4	34
4	29
5	2
5	4
5	15
5	23
5	38
6	1
6	5
6	14
6	22
6	29
6	34
7	1
7	5
7	14
7	20
7	34
8	1
8	6
8	16
8	26
8	38
9	2
9	4
9	19
9	21
9	38
10	1
10	5
10	14
10	20
10	31
11	1
11	5
11	15
11	20
11	40
12	1
12	5
12	14
12	23
12	38
13	1
13	6
13	14
13	20
13	38
14	1
14	4
14	19
14	20
14	50
15	1
15	5
15	20
16	1
16	5
16	14
16	20
16	38
17	1
17	5
17	14
17	20
17	55
17	31
18	1
18	3
18	19
18	20
1163	18
19	2
19	4
19	19
19	23
19	55
20	1
20	3
20	7
20	21
20	27
20	34
21	1
21	3
21	7
21	27
21	33
22	1
22	3
22	7
22	27
22	33
23	1
23	3
23	7
23	27
23	33
24	1
24	3
24	7
24	27
24	33
25	1
25	3
25	19
25	27
25	29
25	34
26	1
26	4
26	15
26	20
26	50
27	1
27	4
27	15
27	20
27	50
28	1
28	4
28	14
28	20
28	29
28	34
29	1
29	5
1163	24
29	20
29	38
30	2
30	4
30	13
30	23
30	34
30	29
30	39
31	2
31	4
31	13
31	23
31	34
31	29
32	2
32	4
32	13
32	21
32	34
32	29
33	2
33	4
33	13
33	27
33	34
33	29
34	1
34	5
34	14
34	20
34	50
35	1
35	4
35	14
35	20
35	50
36	1
36	4
36	13
36	23
36	38
37	1
37	6
37	14
37	20
37	34
37	32
38	1
38	5
38	15
38	20
38	32
38	34
39	2
39	3
39	10
39	23
39	26
39	55
40	1
40	3
40	13
40	23
40	55
41	2
41	4
41	13
41	23
41	55
42	1
42	3
42	14
42	21
42	34
43	2
43	4
43	13
43	20
43	22
43	34
43	29
43	39
44	1
44	3
44	13
44	20
44	38
45	1
45	3
45	15
45	27
45	37
46	1
46	4
46	16
46	22
46	34
47	1
47	6
47	15
47	21
47	31
48	1
48	3
48	15
48	23
48	34
49	1
49	5
49	19
49	21
49	31
50	1
50	4
50	12
50	23
50	42
51	1
51	4
51	12
51	23
51	42
52	1
52	3
52	12
52	23
52	42
53	1
53	4
53	12
53	23
53	42
54	2
54	4
54	13
54	23
54	34
54	29
55	1
55	3
55	12
55	27
55	29
55	34
56	1
56	4
56	19
56	20
56	29
57	2
57	3
57	7
57	23
57	34
58	1
58	4
58	15
58	24
58	34
58	29
59	1
59	5
59	13
59	20
59	38
60	1
60	3
60	13
60	20
60	38
61	1
61	4
61	16
61	24
61	21
61	50
62	1
62	5
62	19
62	20
62	50
63	1
63	4
63	13
63	23
63	21
63	55
64	2
64	5
64	14
64	24
64	34
65	2
65	5
65	14
65	23
65	34
65	29
66	2
66	4
66	14
66	20
66	48
67	2
67	3
67	11
67	23
67	38
68	2
68	3
68	11
68	23
68	38
69	2
69	3
69	10
69	23
69	38
70	1
70	3
70	15
70	23
70	38
71	1
71	4
71	14
71	24
71	20
71	55
72	1
72	3
72	14
72	23
72	38
73	2
73	3
73	7
73	24
73	34
74	1
74	3
74	14
74	22
74	38
75	2
75	3
75	14
75	23
75	34
75	29
76	2
76	5
76	14
76	23
76	34
76	29
77	1
77	4
77	14
77	20
77	34
78	1
78	4
78	14
78	27
78	38
79	2
79	3
79	7
79	22
79	34
80	1
80	14
80	20
80	34
80	30
81	2
81	3
81	11
81	23
81	34
82	1
82	4
82	13
82	23
82	38
83	1
83	6
83	15
83	20
83	38
84	1
84	4
84	19
84	27
84	29
84	34
85	1
85	3
85	14
85	23
85	38
86	2
86	5
86	14
86	24
86	29
86	34
87	2
87	3
87	13
87	23
87	29
87	34
88	1
88	5
88	14
88	23
88	38
89	1
89	4
89	15
89	27
89	50
90	1
90	4
90	13
90	20
90	38
91	1
91	4
91	13
91	20
91	38
92	1
92	3
92	13
92	23
92	26
92	38
93	1
93	3
93	13
93	23
93	26
93	38
94	1
94	3
94	13
94	23
94	38
95	2
95	3
95	13
95	21
95	29
95	34
96	1
96	3
96	13
96	23
96	38
97	2
97	5
97	14
97	20
97	34
97	29
99	1
99	17
99	22
99	34
99	40
100	2
100	3
100	14
100	20
100	34
101	2
101	4
101	13
101	23
101	34
101	29
102	1
102	6
1163	1
102	20
102	38
103	1
103	3
103	14
103	20
103	34
103	29
104	1
104	3
104	19
104	27
104	34
105	2
105	3
105	7
105	22
105	34
106	1
106	4
106	14
106	23
106	38
107	1
107	4
107	15
107	23
107	34
107	29
108	1
108	4
108	13
108	22
108	50
109	1
109	3
109	13
109	20
109	55
109	48
110	1
110	5
110	13
110	20
110	50
111	2
111	3
111	10
111	23
111	26
111	32
112	2
112	4
112	23
112	29
112	34
113	1
113	4
113	19
113	24
113	34
113	29
114	2
114	5
114	19
114	20
114	36
115	1
115	5
115	13
115	20
115	34
115	29
116	1
116	5
116	13
116	20
116	29
116	34
117	1
117	5
117	13
117	20
117	29
117	34
118	2
118	4
118	13
118	24
118	37
119	1
119	5
119	14
119	20
119	34
119	29
120	1
120	3
120	13
120	20
120	50
121	1
121	4
121	13
121	20
121	50
122	1
122	4
122	13
122	27
122	33
123	1
123	5
123	19
123	21
123	38
124	1
124	3
124	7
124	23
124	38
125	1
125	3
125	7
125	23
125	38
126	2
126	4
126	7
126	23
126	24
126	38
127	1
127	3
127	7
127	23
127	38
128	2
128	3
128	10
128	23
128	38
129	1
129	4
129	14
129	21
129	23
129	38
130	2
130	4
130	19
130	24
130	38
131	1
131	15
131	20
131	38
132	1
132	3
132	14
132	20
132	34
132	29
133	2
133	3
133	19
133	21
133	29
133	34
134	2
134	3
134	7
134	23
134	38
135	2
135	5
135	13
135	20
135	33
136	2
136	4
136	13
136	20
136	33
137	1
137	4
137	13
137	27
137	38
138	2
138	5
138	14
138	23
138	38
139	1
139	5
139	15
139	22
139	38
140	1
140	5
140	15
140	20
140	50
141	1
141	5
141	19
141	20
141	38
142	1
142	5
142	19
142	20
142	34
143	2
1163	4
143	14
143	23
143	29
144	1
144	5
144	13
144	20
144	38
145	2
145	5
145	13
145	20
145	34
146	2
146	4
146	13
146	23
146	38
147	1
147	4
147	15
147	23
147	27
147	38
148	2
148	4
148	11
148	23
148	34
149	1
149	4
149	13
149	27
149	38
150	2
150	3
150	14
150	24
150	55
151	2
151	3
151	10
151	23
151	32
152	1
152	3
152	15
152	23
152	36
153	1
153	4
153	13
153	24
153	34
153	29
154	1
154	4
154	13
154	20
154	24
154	34
155	2
155	3
155	13
155	27
155	55
156	1
156	3
156	13
156	21
156	38
157	1
157	3
157	19
157	20
157	34
158	1
158	3
158	12
158	23
158	20
158	38
159	1
159	4
159	19
159	20
159	38
160	1
160	4
160	14
160	20
160	38
161	1
161	5
161	19
161	27
161	38
162	2
162	3
162	8
162	23
162	38
163	2
163	3
163	7
163	23
163	34
163	33
164	1
164	4
164	15
164	22
164	34
165	1
165	4
165	14
165	20
165	34
166	1
166	4
166	13
166	20
166	29
167	1
167	6
167	19
167	20
167	40
168	2
168	4
168	19
168	23
168	38
169	1
169	3
169	8
169	23
169	38
170	1
170	4
170	15
170	27
170	50
171	2
171	4
171	13
171	23
171	34
171	29
172	2
172	4
172	13
172	20
172	55
173	2
173	4
173	27
173	29
173	34
174	1
174	4
174	14
174	20
174	38
175	1
175	3
175	14
175	22
175	55
176	1
176	5
176	13
176	24
176	55
177	1
177	5
177	19
177	23
177	24
177	29
178	2
178	3
178	11
178	24
178	34
179	1
179	4
179	19
179	20
179	34
180	1
180	4
180	13
180	20
180	34
181	1
181	4
181	13
181	20
181	29
181	34
182	1
182	4
182	15
182	21
182	38
183	1
183	5
183	14
183	21
183	38
185	1
185	4
185	13
185	20
185	38
186	1
186	3
186	7
186	23
186	38
187	1
187	4
187	16
187	20
187	29
187	32
188	1
188	4
188	14
188	20
188	50
189	1
189	6
189	14
189	20
189	24
189	34
190	1
190	4
190	14
190	20
190	34
191	2
191	3
191	15
191	21
191	34
192	2
192	3
192	15
192	23
192	34
193	2
193	3
193	15
193	23
193	38
194	2
194	3
194	7
194	21
194	23
194	29
194	34
195	1
195	5
195	14
195	20
195	55
196	1
196	4
196	14
196	20
196	37
197	1
197	5
197	19
197	20
197	43
198	1
198	4
198	19
198	22
198	26
198	34
198	29
199	2
199	3
199	15
199	23
199	34
200	1
200	4
200	14
200	23
200	34
201	1
201	5
201	14
201	20
201	55
202	1
202	6
202	14
202	20
202	55
203	1
203	3
203	15
203	27
203	34
203	29
204	2
204	4
204	14
204	23
204	34
205	2
205	3
205	12
205	23
205	38
206	2
206	4
206	14
206	24
206	34
207	2
207	4
207	14
207	24
207	34
208	2
208	3
208	13
208	23
208	45
209	2
209	4
209	14
209	22
209	38
210	2
210	4
210	16
210	27
210	34
210	29
211	1
211	4
211	13
211	20
211	34
211	29
212	2
212	3
212	7
212	22
212	34
212	32
213	1
213	4
213	14
213	20
213	34
214	1
214	4
214	7
214	24
214	38
215	1
215	3
215	19
215	20
215	55
216	1
216	5
216	14
216	20
216	34
216	29
217	1
217	3
217	10
217	22
217	32
218	1
218	3
218	14
218	20
218	38
219	1
219	4
219	13
219	20
219	38
220	1
220	4
220	14
220	20
220	34
221	1
221	3
221	7
221	23
221	34
222	1
222	3
222	7
222	23
222	38
223	2
223	3
223	9
223	23
223	55
224	1
224	4
224	14
224	27
224	34
224	29
225	2
225	3
225	9
225	23
225	42
226	1
226	3
226	7
226	22
226	55
227	1
227	3
227	7
227	23
227	24
227	55
228	2
228	4
228	14
228	27
228	55
229	1
229	4
229	13
229	24
229	55
230	2
230	4
230	7
230	23
230	33
230	34
231	2
231	3
231	7
231	23
231	24
231	55
232	1
232	5
232	14
232	20
232	50
233	1
233	3
233	16
233	23
233	34
234	1
234	4
234	13
234	20
234	38
235	1
235	6
235	14
235	20
235	38
236	1
236	3
236	15
236	21
236	23
236	38
237	1
237	3
237	15
237	23
237	38
238	1
238	4
238	13
238	21
238	20
238	34
239	1
239	4
239	14
239	20
239	34
240	2
240	4
240	7
240	24
240	26
240	38
241	1
241	5
241	15
241	23
241	38
242	1
242	5
242	13
242	20
242	24
242	34
243	2
243	5
243	16
243	21
243	20
243	55
244	1
244	4
244	13
244	22
244	34
245	1
245	5
245	15
245	27
245	34
246	1
246	4
246	15
246	25
246	34
246	30
247	1
247	3
247	15
247	25
247	34
247	30
248	1
248	4
248	13
248	23
248	55
249	1
249	3
249	16
249	27
249	42
250	1
250	3
250	14
250	20
250	55
251	1
251	5
251	14
251	20
251	34
252	1
252	3
252	19
252	23
252	34
252	29
253	1
253	5
253	13
253	20
253	34
254	2
254	3
254	13
254	20
254	29
254	34
255	1
255	5
255	14
255	20
255	36
256	1
256	4
256	14
256	20
256	38
257	2
257	3
257	12
257	20
257	21
257	23
257	34
258	1
258	4
258	15
258	20
258	34
259	2
259	4
259	13
259	20
259	53
260	1
260	3
260	15
260	21
260	50
261	1
261	5
261	20
261	50
262	1
262	4
262	14
262	22
262	29
263	2
263	3
263	10
263	24
263	38
264	1
264	4
264	13
264	20
264	50
265	1
265	4
265	19
265	20
265	34
266	1
266	5
266	14
266	20
266	55
267	2
267	3
267	9
267	21
267	23
267	38
268	2
268	3
268	15
268	21
268	23
268	38
269	1
269	6
269	14
269	20
269	51
270	1
270	5
270	14
270	23
270	50
271	2
271	3
271	14
271	23
271	38
272	1
272	3
272	7
272	23
272	55
273	1
273	3
273	7
273	23
273	55
274	2
274	5
274	14
274	21
274	29
274	34
275	1
275	4
275	14
275	23
275	38
276	2
276	4
276	15
276	23
276	38
277	2
277	5
277	14
277	23
277	34
278	2
278	4
278	9
278	23
278	38
279	2
279	3
279	7
279	24
279	38
280	1
280	3
280	7
280	24
280	38
281	1
281	3
281	7
281	24
281	38
282	2
282	3
282	7
282	24
282	28
282	33
283	1
283	4
283	14
283	20
283	38
284	1
284	6
284	15
284	24
284	38
285	1
285	4
285	14
285	22
285	29
285	34
286	1
286	3
286	7
286	23
286	55
287	2
287	4
287	13
287	22
287	55
288	2
288	3
288	13
288	27
288	54
289	2
289	3
289	19
289	23
289	55
290	2
290	4
290	14
290	20
290	55
291	1
291	4
291	19
291	20
291	34
291	40
292	1
292	5
292	13
292	20
292	38
293	1
293	4
293	13
293	27
293	55
294	1
294	5
294	13
294	20
294	38
295	1
295	4
295	13
295	20
295	38
296	2
296	3
296	14
296	23
296	38
297	1
297	4
297	13
297	20
297	38
298	1
298	4
298	13
298	27
298	38
299	2
299	4
299	14
299	24
299	34
300	2
300	3
300	8
300	24
300	34
301	2
301	3
301	8
301	24
301	34
302	2
302	3
302	7
302	22
302	34
303	1
303	3
303	16
303	22
303	29
303	34
304	2
304	3
304	16
304	24
304	34
305	1
305	3
305	14
305	23
305	29
305	34
306	2
306	4
306	14
306	23
306	34
307	2
307	4
307	14
307	23
307	26
307	32
307	34
308	1
308	5
308	15
308	20
308	38
309	2
309	5
309	15
309	20
309	38
310	2
310	3
310	15
310	20
310	38
311	2
311	5
311	15
311	20
311	29
311	34
312	1
312	5
312	19
312	22
312	24
312	38
313	1
313	5
313	15
313	20
313	36
314	2
314	4
314	19
314	23
314	38
315	1
315	5
315	19
315	20
315	28
315	50
316	1
316	4
316	19
316	24
316	23
316	50
317	1
317	4
317	11
317	23
317	38
318	1
318	4
318	13
318	20
318	55
319	1
319	5
319	13
319	20
319	55
320	1
320	6
320	16
320	21
320	23
320	37
321	2
321	4
321	14
321	24
321	34
322	1
322	3
322	13
322	20
322	24
322	38
323	1
323	5
323	14
323	20
323	48
324	2
324	3
324	8
324	22
324	34
325	2
325	3
325	8
325	22
325	34
326	1
326	4
326	13
326	20
326	38
327	1
327	4
327	7
327	27
327	38
328	1
328	4
328	13
328	23
328	20
328	55
329	2
329	3
329	14
329	23
329	29
329	34
330	1
330	3
330	7
330	21
330	55
331	2
331	5
331	13
331	23
331	38
332	1
332	3
332	20
332	29
333	1
333	6
333	19
333	20
333	24
333	50
334	1
334	4
1163	48
334	20
334	23
334	34
335	1
335	6
335	15
335	22
335	34
335	29
336	1
336	4
336	13
336	20
336	50
337	1
337	6
337	13
337	22
337	29
337	34
338	1
338	5
338	13
338	22
338	20
338	34
339	2
339	4
339	19
339	21
339	38
340	2
340	3
340	14
340	20
340	36
340	29
341	2
341	4
341	14
341	26
341	20
341	50
342	1
342	4
342	15
342	27
342	34
343	1
343	3
343	19
343	27
343	29
343	34
344	1
344	3
344	15
344	20
344	23
344	34
345	2
345	3
345	13
345	22
345	29
345	34
346	1
346	4
346	13
346	23
346	38
347	1
347	5
347	14
347	20
347	38
348	2
348	4
348	9
348	23
348	55
349	1
349	4
349	13
349	21
349	29
350	1
350	5
350	15
350	20
350	34
351	1
351	4
351	13
351	24
351	34
352	1
352	5
352	13
352	20
352	38
353	1
353	5
353	13
353	20
353	21
353	29
354	2
354	4
354	13
354	27
354	29
354	34
355	1
355	5
355	14
355	25
355	38
356	1
356	5
356	14
356	20
356	38
357	2
357	3
357	13
357	24
357	34
358	1
358	4
358	13
358	21
358	38
359	1
359	3
359	15
359	23
359	52
360	1
360	3
360	19
360	22
360	55
361	1
361	5
361	13
361	20
361	34
361	29
362	2
362	3
362	13
362	24
362	38
363	2
363	3
363	7
363	24
363	34
364	1
364	6
364	14
364	20
364	51
365	1
365	4
365	15
365	20
365	21
365	50
366	1
366	5
366	14
366	20
366	29
366	34
367	1
367	6
367	14
367	20
1164	23
368	1
368	5
368	19
368	20
368	50
369	1
369	6
369	14
369	21
369	55
370	1
370	4
370	14
370	24
370	38
371	1
371	5
371	11
371	20
371	21
371	43
372	1
372	6
372	14
372	20
372	38
373	1
373	6
373	14
373	20
373	38
374	1
374	4
374	13
374	24
374	38
375	1
375	5
375	15
375	27
375	50
376	1
376	5
376	14
376	27
376	50
377	2
377	5
377	13
377	20
377	26
377	34
378	1
378	5
378	14
378	20
378	29
378	34
379	1
379	4
379	14
379	20
379	38
380	1
380	3
380	15
380	23
380	34
381	1
381	3
381	15
381	27
381	21
381	34
382	1
382	3
382	7
382	23
382	38
383	1
383	4
383	14
383	20
383	38
384	2
384	3
384	7
384	20
384	24
384	38
385	1
385	3
385	7
385	27
385	33
386	1
386	4
386	15
386	23
386	50
387	1
387	5
387	14
387	23
387	50
388	1
388	5
388	13
388	20
388	55
389	1
389	6
389	14
389	20
389	50
390	1
390	5
390	14
390	20
390	50
391	1
391	4
391	19
391	20
391	29
391	34
392	2
392	5
392	13
392	20
392	23
392	34
393	1
393	4
393	15
393	23
393	38
394	2
394	3
394	12
394	23
394	34
395	1
395	4
395	13
395	21
395	23
395	33
396	2
396	4
396	12
396	23
396	29
396	34
397	1
397	3
397	7
397	23
397	34
398	1
398	5
398	19
398	20
398	29
398	34
399	1
399	4
1164	5
399	20
399	29
399	34
400	1
400	5
400	22
400	38
401	1
401	4
401	15
401	23
401	48
401	34
402	2
402	4
402	14
402	20
402	29
402	34
403	1
403	4
403	13
403	20
403	50
404	1
404	4
404	15
404	23
404	21
404	38
405	1
405	4
405	14
405	23
405	38
406	2
406	3
406	9
406	20
406	55
407	1
407	4
407	13
407	23
407	55
408	2
408	4
408	19
408	23
408	38
409	1
409	14
409	23
409	29
409	34
410	1
410	4
410	13
410	20
410	34
410	29
411	2
411	3
411	14
411	22
411	29
411	34
412	2
412	3
412	14
412	23
412	34
413	2
413	3
413	14
413	23
413	34
413	29
414	2
414	4
414	16
414	20
414	38
415	2
415	5
415	16
415	20
415	38
416	1
416	3
416	16
416	20
416	38
417	1
417	4
417	15
417	22
417	32
417	34
418	1
418	4
418	14
418	20
418	34
419	1
419	5
419	14
419	20
419	38
420	2
420	3
420	19
420	23
420	38
421	1
421	5
421	19
421	20
421	38
422	2
422	5
422	13
422	20
422	21
422	23
422	36
423	2
423	5
423	14
423	38
424	2
424	3
424	11
424	22
424	34
425	1
425	3
425	15
425	24
425	34
426	1
426	5
426	13
426	20
1164	15
427	1
427	6
427	14
427	20
427	50
428	1
428	3
428	20
428	50
429	1
429	4
429	13
429	24
429	55
430	1
430	6
430	16
430	20
430	55
431	1
431	3
431	16
431	20
431	55
432	1
432	3
432	16
432	20
432	55
433	1
433	3
433	16
433	20
433	55
434	1
434	3
434	16
434	20
434	55
435	1
435	3
435	16
435	20
435	55
436	1
436	3
436	16
436	20
436	55
437	1
437	3
437	15
437	20
437	40
438	1
438	6
438	16
438	23
438	50
439	1
439	5
439	16
439	23
439	50
440	1
440	4
440	13
440	22
440	33
440	39
441	1
441	6
441	14
441	20
441	55
442	1
442	5
442	14
442	20
442	38
443	2
443	3
443	7
443	23
443	38
444	2
444	6
444	15
444	20
444	38
445	1
445	5
445	15
445	20
445	38
446	1
446	3
446	19
446	21
446	27
446	29
446	34
447	1
447	5
447	19
447	21
447	34
448	1
448	19
448	23
448	21
448	34
448	29
449	1
449	4
449	13
449	20
449	38
450	1
450	3
450	19
450	21
450	34
451	1
451	5
451	19
451	24
451	38
452	1
452	5
452	15
452	22
452	34
453	1
453	5
453	20
453	29
453	34
454	2
454	3
454	13
454	20
454	21
454	38
455	1
455	4
455	13
455	20
455	38
456	1
456	4
456	13
456	20
456	38
457	1
457	5
457	14
457	20
457	50
458	2
458	5
458	19
458	20
458	32
459	1
459	4
459	11
459	23
459	38
460	2
460	4
460	14
460	21
460	33
461	1
461	6
461	14
461	20
461	50
462	2
462	5
462	15
462	20
462	50
463	1
463	6
463	14
463	20
463	50
464	2
464	4
464	13
464	20
464	50
465	1
465	3
465	8
465	23
465	38
466	1
466	3
466	13
466	27
466	50
467	1
467	5
467	15
467	20
467	51
467	36
468	1
468	3
468	14
468	24
468	38
469	2
469	3
469	11
469	23
469	38
470	1
470	6
470	19
470	24
470	34
471	1
471	4
471	15
471	20
471	38
472	1
472	6
472	14
472	23
472	55
473	1
473	5
473	19
473	23
473	34
474	1
474	3
474	15
474	27
474	40
475	1
475	4
475	13
475	21
475	38
476	1
476	5
476	14
476	23
476	38
477	2
477	3
477	7
477	23
477	32
477	34
478	1
478	3
478	14
478	23
478	36
479	1
479	4
479	14
479	23
479	34
480	1
480	3
480	16
480	20
480	40
481	1
481	3
481	16
481	20
481	40
482	2
482	5
482	15
482	24
482	38
483	2
483	3
483	11
483	22
483	34
484	2
484	3
484	9
484	21
484	22
484	34
486	1
486	4
486	13
486	20
486	50
487	2
487	4
487	13
487	20
487	50
488	2
488	3
488	13
488	20
488	55
489	1
489	3
489	16
489	27
489	34
489	29
490	1
490	3
490	16
490	21
490	34
491	2
491	4
491	13
491	21
491	34
492	2
492	4
492	15
492	23
492	38
493	1
493	4
493	14
493	20
493	55
494	1
494	5
494	14
494	27
494	20
1164	1
495	1
495	5
495	14
495	23
495	20
495	34
495	38
496	1
496	3
496	15
496	20
496	52
497	2
497	3
1164	38
497	21
497	23
497	48
498	2
498	3
1170	18
498	24
498	32
499	1
499	5
499	14
499	20
499	23
499	38
500	2
500	3
500	19
500	24
500	38
501	2
501	3
501	8
501	23
501	34
503	1
503	3
503	13
503	20
503	55
504	1
504	4
504	14
504	20
504	34
505	1
505	3
505	19
505	23
505	55
506	1
506	4
506	19
506	27
506	34
507	2
507	3
507	16
507	23
507	34
508	1
508	3
508	14
508	20
508	29
508	34
509	1
509	5
509	15
509	20
509	50
510	1
510	4
510	13
510	24
510	29
510	34
511	1
511	3
511	15
511	20
511	34
512	1
512	4
512	17
512	23
512	51
513	1
513	4
513	14
513	23
513	20
513	38
515	1
515	3
515	16
515	21
515	53
516	1
516	3
516	16
516	23
516	55
517	1
517	6
517	14
517	38
518	1
518	3
518	7
518	23
518	55
519	2
519	4
519	17
519	24
519	50
520	1
520	3
520	17
520	23
520	43
521	1
521	5
521	19
521	20
521	55
522	1
522	6
522	14
522	21
522	55
523	1
523	4
523	17
523	23
523	51
524	1
524	5
524	20
524	38
526	1
526	4
1170	20
526	20
526	50
527	1
527	5
527	11
527	27
527	43
528	1
528	4
528	14
528	20
528	34
530	1
530	3
530	16
530	21
530	38
531	2
531	3
531	16
531	24
531	38
532	2
532	3
532	7
532	23
532	24
532	28
532	33
533	2
533	3
533	19
533	24
533	34
533	39
534	1
534	3
534	7
534	23
534	34
535	1
535	3
535	19
535	24
535	35
536	2
536	5
536	14
536	23
536	38
537	1
537	3
537	15
537	27
537	34
538	1
538	3
538	19
538	20
538	29
539	1
539	3
539	19
539	23
539	55
540	1
540	3
540	17
540	20
540	50
541	1
541	3
541	17
541	20
541	50
542	1
542	4
542	13
542	20
542	21
542	38
543	1
543	5
543	19
543	21
543	41
544	1
544	18
544	24
544	37
545	1
545	3
545	19
545	21
545	38
546	2
546	3
546	19
546	23
546	37
547	1
547	4
547	17
547	24
547	35
548	1
548	4
548	17
548	24
548	35
549	1
549	4
549	17
549	23
549	51
550	2
550	4
550	17
550	23
550	51
551	1
551	5
551	17
551	20
551	51
552	1
552	3
552	18
552	23
552	38
553	1
553	3
553	18
553	27
553	37
554	1
554	4
554	19
554	27
554	37
555	1
555	3
555	18
555	27
555	28
555	37
556	2
556	4
556	19
556	27
556	37
557	2
557	4
557	19
557	27
557	37
558	2
558	4
558	17
558	23
558	55
559	1
559	4
559	18
559	21
559	23
559	55
560	2
560	3
560	11
560	24
560	34
561	2
561	3
561	18
561	23
561	37
562	2
562	3
562	17
562	23
562	21
562	55
564	2
564	3
564	9
564	23
564	21
564	34
565	2
565	4
565	17
565	27
565	55
566	2
566	3
566	9
566	22
566	34
567	1
567	3
567	18
567	21
567	34
568	1
568	3
568	7
568	23
568	38
569	2
569	3
569	9
569	22
569	34
572	1
572	4
572	19
572	20
572	34
573	1
573	5
573	14
573	20
573	38
574	1
574	6
574	20
574	34
574	32
576	1
576	5
576	14
576	20
576	50
577	1
577	3
577	7
577	22
577	38
579	1
579	5
579	14
579	20
579	34
580	1
580	6
580	14
580	22
580	55
581	2
581	4
581	14
581	24
581	38
582	1
582	4
582	15
582	23
582	38
583	1
583	13
583	20
583	38
584	1
584	13
584	20
584	38
585	1
585	5
585	13
585	20
585	38
586	1
586	4
586	13
586	20
586	38
587	1
587	4
587	13
587	20
587	38
588	1
588	4
588	15
588	23
588	21
588	38
589	1
589	4
589	11
589	20
589	38
590	1
590	5
590	14
590	22
590	37
591	1
591	5
591	14
591	23
591	22
591	38
591	37
592	2
592	3
592	12
592	23
592	21
592	38
593	1
593	3
593	7
593	23
593	26
593	55
594	1
594	3
594	7
594	23
594	24
594	56
595	1
595	5
595	16
595	23
595	38
596	1
596	3
596	7
596	26
596	33
597	1
597	3
597	12
597	23
597	38
598	1
598	17
598	23
598	21
598	24
598	38
599	1
599	4
599	14
599	20
599	34
599	29
600	1
600	6
600	15
600	20
600	50
601	1
601	4
601	13
601	23
601	24
601	38
602	1
602	4
602	14
602	20
602	36
603	2
603	5
603	14
603	24
603	34
604	1
604	4
604	13
604	21
604	34
605	1
605	5
605	19
605	22
605	38
606	1
606	5
606	19
606	23
606	31
607	2
607	3
607	7
607	24
607	34
608	2
608	3
608	18
608	22
608	34
609	2
609	3
609	18
609	22
609	34
610	2
610	3
610	18
610	22
610	34
611	1
611	3
611	7
611	23
611	24
611	55
612	1
612	4
612	14
612	20
612	32
613	1
613	4
613	15
613	23
613	24
613	50
614	1
614	5
614	15
614	23
614	38
615	2
615	3
615	19
615	24
615	34
616	1
616	4
616	14
616	20
616	29
616	34
617	1
617	3
617	15
617	20
617	55
618	1
618	3
618	15
618	21
618	23
618	55
619	2
619	4
619	14
619	22
619	38
620	1
620	3
620	7
620	23
620	55
621	2
621	5
621	13
621	23
621	55
622	1
622	3
622	13
622	20
622	33
622	34
623	1
623	3
623	13
623	20
623	33
623	34
624	1
624	6
624	14
624	20
624	50
625	1
625	19
625	20
625	38
626	2
626	5
626	13
626	23
626	38
627	2
627	4
627	11
627	22
627	34
628	1
628	5
628	14
628	22
628	29
628	34
629	1
629	5
629	14
629	22
629	29
629	34
630	1
630	5
630	14
630	23
630	55
631	2
631	4
631	14
631	23
631	38
632	1
632	5
632	16
632	24
632	50
634	2
634	14
634	24
634	34
635	1
635	3
635	15
635	34
635	29
636	2
636	6
636	15
636	21
636	34
637	2
637	4
637	13
637	24
637	34
638	2
638	3
638	7
638	21
638	23
638	32
639	1
639	3
639	7
639	23
639	32
640	1
640	3
640	7
640	23
640	38
640	55
641	1
641	6
641	14
641	27
641	55
641	50
642	1
642	5
642	14
642	27
642	38
643	1
643	3
643	15
643	27
643	38
644	1
644	5
644	13
644	21
644	38
645	2
645	3
645	19
645	23
645	38
646	2
646	3
646	9
646	24
646	38
647	1
647	12
647	23
647	38
648	2
648	4
648	12
648	27
648	38
649	2
649	3
649	12
649	21
649	38
650	2
650	4
650	7
650	22
650	34
650	33
651	2
651	4
651	7
651	22
651	34
651	33
652	1
652	5
652	15
652	20
652	23
652	38
653	1
653	3
653	7
653	21
653	23
653	43
654	1
654	15
654	21
654	38
655	2
655	3
655	7
655	23
655	38
656	2
656	3
656	7
656	23
656	34
657	1
657	4
657	15
657	20
657	50
658	1
658	5
658	15
658	20
658	23
658	50
659	2
659	3
659	8
659	23
659	38
660	1
660	5
660	15
660	24
660	20
660	38
661	2
661	4
661	7
661	23
661	34
662	2
662	3
662	7
662	21
662	23
662	32
662	34
663	1
663	5
663	13
663	21
663	37
664	2
664	3
664	19
664	22
664	34
665	1
665	5
665	15
665	24
665	50
666	1
666	6
666	14
666	20
666	38
666	48
666	37
667	1
667	5
667	20
668	1
668	4
668	13
668	22
668	55
669	1
669	4
669	15
669	22
669	55
670	1
670	6
670	14
670	26
670	20
670	55
671	2
671	4
671	10
671	23
671	38
672	1
672	5
672	13
672	20
672	23
672	38
673	1
673	4
673	13
673	20
673	27
673	38
674	1
674	6
674	13
674	27
674	50
675	1
675	5
675	13
675	22
675	51
676	1
676	5
676	13
676	21
676	50
677	1
677	4
703	4
677	24
677	38
678	2
678	3
678	12
678	21
678	38
679	1
679	3
679	7
679	23
679	55
680	1
680	3
680	7
680	23
680	55
681	2
681	3
681	16
681	23
681	34
682	2
682	5
682	17
682	28
682	34
682	29
683	1
683	4
683	13
683	20
683	34
684	1
684	4
684	13
684	20
684	34
685	1
685	5
685	14
685	21
685	38
686	1
686	5
686	14
686	23
686	55
687	2
687	3
687	10
687	23
687	55
689	1
689	4
689	16
689	22
689	29
690	1
690	3
690	7
690	23
690	38
691	1
691	4
691	14
691	20
691	24
691	55
692	1
692	5
692	17
692	21
692	34
692	33
692	29
692	39
693	2
693	3
693	13
693	22
693	38
694	1
694	3
694	16
694	24
694	29
694	34
695	1
695	4
695	12
695	21
695	23
695	38
696	1
696	3
696	7
696	21
696	23
696	55
697	1
697	6
697	15
697	23
697	38
698	2
698	3
698	8
698	28
698	23
698	38
699	1
699	3
699	10
699	20
699	34
700	1
700	4
700	10
700	23
700	33
700	29
701	1
701	19
701	20
701	23
701	38
702	1
702	5
702	15
702	27
702	50
703	1
703	19
703	20
703	40
704	1
704	3
704	19
704	20
704	34
704	30
705	2
705	3
705	7
705	23
705	38
706	1
706	5
706	14
706	20
1165	18
707	1
707	3
707	19
707	20
707	53
708	2
708	3
708	7
708	23
708	32
708	34
709	2
709	3
709	10
709	23
709	33
709	34
710	2
710	3
710	13
710	27
710	38
711	1
711	4
711	15
711	23
711	38
712	1
712	5
712	18
712	25
712	55
713	1
713	5
713	19
713	23
713	34
713	29
714	1
714	5
714	19
1165	1
714	20
714	38
715	1
715	6
715	16
715	23
715	22
715	36
716	1
716	6
716	17
716	24
716	38
717	1
717	6
717	17
717	24
717	38
718	1
718	6
718	17
718	24
718	38
719	2
719	4
719	13
719	27
719	34
720	1
720	4
720	19
720	20
720	36
721	1
721	5
721	19
721	20
721	36
722	1
722	3
722	18
722	23
722	34
723	2
723	3
723	7
723	24
723	34
724	2
724	3
724	7
724	24
724	34
725	2
725	3
725	7
725	24
725	34
726	2
726	3
726	7
726	24
726	34
727	2
727	3
727	18
727	24
727	55
728	1
728	3
728	18
728	24
728	55
729	1
729	3
729	18
729	24
729	55
730	1
730	5
730	14
730	24
730	22
730	38
731	1
731	4
731	14
731	24
731	38
732	1
732	3
732	7
732	23
732	24
732	38
733	1
733	4
733	19
733	20
733	34
734	1
734	4
734	15
734	27
734	34
735	1
735	4
735	19
735	23
735	40
736	1
736	4
736	19
736	23
736	53
737	1
737	3
737	18
737	27
737	37
738	2
738	3
738	18
738	22
738	34
739	2
739	3
739	18
739	22
739	34
740	2
740	3
740	15
740	22
740	34
741	2
741	3
741	15
741	22
741	34
742	1
742	3
742	19
742	24
742	46
743	2
743	3
743	18
743	23
743	34
744	2
744	5
744	18
744	23
744	38
745	2
745	4
745	18
745	20
745	38
746	2
746	3
746	18
746	23
746	38
747	2
747	3
747	18
747	23
747	24
747	34
748	1
748	3
748	17
748	23
748	20
748	34
749	2
749	3
749	17
749	21
749	23
749	53
750	1
750	3
750	17
750	23
750	53
751	1
751	5
751	17
751	23
751	51
752	1
752	4
752	18
752	24
752	48
753	2
753	3
753	10
753	24
753	34
754	2
754	3
754	9
754	22
754	34
755	2
755	3
755	9
755	22
755	23
755	34
756	2
756	3
756	14
756	24
756	34
757	2
757	3
757	12
757	21
757	24
757	34
758	2
758	3
758	10
758	22
758	34
759	2
759	3
759	18
759	23
759	51
760	2
760	3
760	19
760	23
760	42
761	2
761	3
761	18
761	23
761	34
762	2
762	3
762	18
762	23
762	34
763	2
763	3
763	18
763	23
763	24
763	34
764	2
764	4
764	18
764	23
764	38
765	1
765	4
765	19
765	23
765	53
766	2
766	4
766	18
766	23
766	53
767	1
767	5
767	18
767	23
767	53
768	1
768	4
768	18
768	23
768	53
769	1
769	4
769	18
769	23
769	50
770	1
770	3
770	16
770	23
770	50
771	1
771	5
771	16
771	23
771	50
772	1
772	6
772	18
772	28
772	23
772	35
773	1
773	5
773	16
773	21
773	23
773	50
774	1
774	4
774	15
774	23
774	22
1165	3
1165	37
1166	18
1166	23
1166	1
1166	50
776	1
776	3
776	19
776	24
776	50
777	1
777	5
777	15
777	20
777	38
778	1
778	5
778	19
778	24
778	34
779	1
779	5
779	14
779	23
779	55
780	2
780	4
780	13
780	24
780	32
780	34
781	1
781	4
781	13
781	20
781	34
781	33
781	39
782	1
782	5
782	17
782	27
782	51
783	2
783	4
783	20
783	40
784	1
784	5
784	14
784	24
784	29
784	34
785	1
785	4
785	19
785	24
785	40
786	1
786	4
786	13
786	21
786	23
786	55
787	1
787	3
787	14
787	20
787	34
788	1
788	4
788	13
788	23
788	38
789	2
789	5
789	15
789	23
789	38
790	2
790	4
790	14
790	23
790	32
790	34
791	1
791	3
791	19
791	23
791	43
792	1
792	3
792	13
792	20
792	50
793	1
793	4
793	7
793	24
793	53
794	1
794	4
794	13
794	21
794	38
795	1
795	4
795	19
795	27
796	1
796	5
796	15
796	20
796	50
797	1
797	4
797	17
797	20
797	23
797	50
798	1
798	5
798	17
798	23
798	51
799	1
799	4
799	13
799	23
799	38
800	2
800	3
800	12
800	23
800	34
800	29
801	1
801	6
801	14
801	20
801	23
801	38
802	2
802	6
802	23
803	2
803	6
803	14
803	23
803	20
803	37
804	2
804	4
804	16
804	20
804	53
805	1
805	3
805	13
805	20
805	50
806	2
806	3
806	22
807	1
807	4
807	19
807	24
807	21
807	43
808	1
808	5
808	17
808	20
808	53
809	2
809	4
809	16
809	22
809	34
809	39
810	2
810	3
810	9
810	23
810	34
811	2
811	4
811	7
811	26
811	34
812	1
812	3
812	19
812	27
812	39
813	2
813	4
813	14
813	23
813	32
814	2
814	3
814	14
814	23
814	34
815	1
815	5
815	19
815	22
815	53
816	1
816	6
816	14
816	27
816	29
816	34
817	2
817	3
817	18
817	23
817	53
818	1
818	4
818	18
818	23
818	21
818	48
818	43
819	1
819	3
819	14
819	23
819	36
820	1
820	4
820	16
820	22
820	53
821	1
821	4
821	19
821	22
821	53
822	2
822	3
822	14
822	23
822	34
823	1
823	5
823	18
823	20
823	53
824	1
824	5
824	19
824	20
824	53
825	1
825	4
825	19
825	20
825	53
827	1
827	3
827	18
827	23
827	46
828	2
828	3
828	19
828	20
828	55
829	1
829	3
829	13
829	20
1166	5
830	2
830	3
830	7
830	24
830	23
830	34
831	1
831	3
831	14
831	23
831	36
832	1
832	4
832	14
832	20
832	34
832	29
833	1
833	4
833	13
833	20
833	34
834	1
834	3
834	14
834	23
834	36
835	2
835	3
835	10
835	23
835	38
1149	3
1149	14
1149	20
1149	38
1149	1
837	1
837	3
837	19
837	24
837	40
838	1
838	4
838	13
838	24
838	34
840	2
840	3
840	13
840	20
840	33
841	1
841	3
841	14
841	22
841	38
842	2
842	4
842	19
842	20
842	53
843	2
843	3
843	13
843	24
843	38
844	2
844	4
844	13
844	23
844	34
845	2
845	4
845	13
845	24
845	34
846	1
846	4
846	17
846	20
846	48
847	1
847	3
847	17
847	20
847	43
848	1
848	4
848	13
848	20
848	55
849	2
849	3
849	7
849	23
849	38
850	1
850	4
850	23
851	2
851	3
851	13
851	24
851	23
851	34
852	1
852	3
852	19
852	27
853	1
853	4
853	13
853	22
853	20
853	53
854	1
854	4
854	14
854	20
854	50
855	1
855	4
855	13
855	21
855	24
855	50
856	1
856	4
856	13
856	24
856	20
856	50
857	1
857	3
857	13
857	21
857	50
858	1
858	4
858	13
858	20
858	38
859	2
859	5
859	14
859	24
859	38
860	1
860	4
860	13
860	20
860	50
861	1
861	4
861	15
861	23
861	40
862	2
862	4
862	14
862	20
862	38
863	1
863	3
863	19
863	27
863	40
864	2
864	4
864	23
865	2
865	4
865	13
865	24
866	1
866	5
866	17
866	23
866	42
867	2
867	3
867	7
867	24
867	23
867	34
868	2
868	3
868	7
868	24
868	23
868	21
868	34
869	1
869	3
869	19
869	27
869	43
870	1
870	4
870	19
870	27
870	30
871	1
871	4
871	19
871	20
871	30
872	1
872	4
872	12
872	23
872	30
873	1
873	4
873	12
873	23
873	38
874	2
874	6
874	19
874	23
1167	18
875	1
875	4
875	15
875	20
875	53
876	2
876	4
876	11
876	22
876	32
876	34
877	1
877	3
877	14
877	20
877	38
878	2
878	3
878	10
878	23
878	55
879	1
879	3
879	19
879	27
879	34
880	1
880	5
880	13
880	27
880	34
881	1
881	5
881	13
881	20
881	38
882	2
882	3
882	7
882	21
882	24
882	34
883	1
883	4
883	12
883	23
883	51
884	1
884	3
884	7
884	23
884	28
884	33
885	2
885	3
885	27
885	38
886	2
886	3
886	14
886	23
886	38
887	2
887	3
887	14
887	23
887	38
888	2
888	3
888	14
888	23
888	38
889	1
889	4
889	14
889	28
889	51
890	1
890	4
890	14
890	28
890	51
1167	21
1167	1
1167	3
1167	29
892	1
892	4
892	14
892	28
892	51
893	1
893	4
893	14
893	28
893	51
894	1
894	4
894	14
894	28
894	51
895	1
895	4
895	14
895	28
895	51
896	1
896	4
896	14
896	28
896	51
897	1
897	4
897	14
897	28
897	51
898	1
898	4
898	14
898	28
898	51
899	1
899	4
899	14
899	28
899	51
900	1
900	4
900	14
900	28
900	51
901	1
901	4
901	14
901	28
901	51
902	1
902	4
902	14
902	28
902	51
903	1
903	4
903	14
903	28
903	51
904	1
904	4
904	14
904	28
904	51
905	1
905	4
905	14
905	28
905	51
906	1
906	4
906	14
906	28
906	51
907	1
907	4
907	14
907	28
907	51
908	1
908	4
908	14
908	28
908	51
909	1
909	4
909	14
909	28
909	51
1167	34
1168	18
1168	27
1168	1
911	1
911	4
911	14
911	28
911	51
912	1
912	6
912	14
912	20
912	48
913	1
913	4
913	13
913	20
913	34
914	1
914	4
914	14
914	20
914	29
914	34
915	1
915	5
915	14
915	20
915	34
915	29
916	1
916	3
916	16
916	23
916	34
917	1
917	4
917	14
917	23
917	38
918	1
918	4
918	13
918	24
918	55
919	1
919	6
919	14
919	20
919	38
920	1
920	4
920	14
920	20
920	55
921	1
921	3
921	17
921	20
921	34
922	1
922	5
1168	30
922	23
922	24
922	50
923	1
923	3
923	7
923	21
923	55
924	1
924	3
924	7
924	21
924	55
925	1
925	3
925	7
925	21
925	55
926	1
926	3
926	7
926	21
926	55
928	1
928	3
928	12
928	20
928	27
928	50
930	1
930	4
930	13
930	22
930	29
930	34
931	1
931	6
931	16
931	21
1168	40
938	2
938	3
938	14
938	23
938	53
940	2
940	6
940	14
940	24
940	32
941	1
941	3
941	15
941	20
941	48
942	2
942	3
942	15
942	27
942	48
943	2
943	3
943	15
943	20
943	48
944	2
944	3
944	15
944	20
944	22
944	48
945	1
945	3
945	15
945	20
945	48
946	2
946	3
946	15
946	20
946	48
947	2
947	3
947	15
947	27
947	48
948	1
948	3
948	15
948	23
948	48
949	2
949	3
949	15
949	20
949	48
950	2
950	3
950	15
950	21
950	48
951	2
951	3
951	18
951	21
951	37
952	1
952	4
952	16
952	24
952	38
953	1
953	4
953	17
953	20
953	55
1009	1
1009	4
1009	15
1009	27
1009	49
1010	1
1010	3
1010	7
1010	23
1010	55
1011	1
1011	4
1011	15
1011	24
1011	34
1012	1
1012	5
1012	15
1012	20
1012	29
1013	1
1013	5
1013	17
1013	23
1013	50
1014	1
1014	6
1014	17
1014	23
1014	38
1015	1
1015	3
1015	12
1015	22
1015	50
1016	1
1016	4
1016	19
1016	21
1016	27
1016	34
1017	1
1017	5
1017	14
1017	22
1017	29
1017	34
1018	1
1018	5
1018	15
1018	21
1018	36
1018	40
1019	1
1019	3
1019	14
1019	20
1019	51
1168	50
1169	18
1169	20
1169	1
1169	3
1021	1
1021	5
1021	15
1021	21
1021	36
1021	40
1022	1
1022	4
1022	14
1022	20
1022	55
1023	2
1023	3
1023	15
1023	23
1023	44
1024	2
1024	3
1024	15
1024	23
1024	44
1025	2
1025	3
1025	15
1025	23
1025	44
1026	1
1026	3
1026	17
1026	20
1026	40
1028	1
1028	3
1028	20
1028	51
1029	1
1029	3
1029	15
1029	20
1029	51
1030	2
1030	3
1030	7
1030	23
1030	34
1031	1
1031	3
1031	19
1031	21
1031	28
1031	53
1032	1
1032	3
1032	19
1032	21
1032	53
1033	1
1033	4
1033	15
1033	23
1033	34
1034	1
1034	3
1034	19
1034	23
1034	34
1035	1
1035	5
1035	19
1035	20
1035	36
1036	1
1036	5
1036	19
1036	20
1036	38
1037	1
1037	3
1037	15
1037	20
1037	55
1038	1
1038	3
1038	13
1038	23
1038	55
1039	1
1039	5
1039	19
1039	20
1039	51
1040	1
1040	4
1040	18
1040	23
1040	51
1041	2
1041	3
1041	15
1041	23
1041	24
1041	44
1042	2
1042	3
1042	15
1042	24
1042	44
1043	2
1043	3
1043	15
1043	21
1043	44
1044	1
1044	4
1044	17
1044	23
1044	50
1045	2
1045	3
1045	11
1045	23
1045	26
1045	54
1046	1
1046	6
1046	16
1046	20
1046	38
1047	1
1047	5
1047	18
1047	28
1047	51
1048	1
1048	4
1048	17
1048	20
1048	23
1048	51
1049	1
1049	4
1049	17
1049	20
1049	51
1050	2
1050	4
1050	14
1050	23
1050	32
1051	2
1051	4
1051	14
1051	23
1051	32
1052	2
1052	4
1052	14
1052	23
1052	32
1053	2
1053	4
1053	14
1053	23
1053	32
1054	2
1054	4
1054	14
1054	23
1054	32
1055	2
1055	4
1055	14
1055	23
1055	32
1056	2
1056	4
1056	14
1056	24
1056	32
1057	2
1057	4
1057	14
1057	23
1057	32
1058	2
1058	4
1058	14
1058	23
1058	32
1059	2
1059	4
1059	14
1059	23
1059	32
1060	2
1060	4
1060	14
1060	23
1060	32
1061	2
1061	4
1061	14
1061	23
1061	32
1062	2
1062	3
1062	19
1062	24
1062	34
1063	2
1063	3
1063	19
1063	28
1063	53
1064	1
1064	4
1064	14
1064	20
1064	50
1065	2
1065	3
1065	15
1065	23
1065	44
1066	2
1066	3
1066	7
1066	23
1066	29
1066	34
1067	2
1067	3
1067	7
1067	21
1067	23
1067	29
1067	34
1068	2
1068	3
1068	7
1068	23
1068	29
1068	34
1069	1
1069	5
1069	18
1069	20
1069	29
1069	34
1070	1
1070	5
1070	18
1070	20
1070	29
1070	34
1071	1
1071	5
1071	13
1071	37
1072	2
1072	3
1072	10
1072	23
1072	55
1074	1
1074	4
1074	18
1074	27
1074	51
1075	1
1075	4
1075	18
1075	20
1075	24
1075	34
1075	42
1076	1
1076	4
1076	18
1076	31
1077	1
1077	3
1077	18
1077	20
1077	28
1077	43
1078	1
1078	3
1078	18
1078	24
1078	44
1079	1
1079	3
1079	18
1079	20
1079	36
1080	1
1080	4
1080	15
1080	23
1080	38
1081	1
1081	3
1081	18
1081	20
1081	48
1082	1
1082	5
1082	16
1082	24
1082	37
1082	55
1083	1
1083	3
1083	18
1083	24
1083	34
1084	1
1084	5
1084	15
1084	20
1084	23
1084	38
1085	1
1085	4
1085	18
1085	23
1085	51
1086	1
1086	4
1086	18
1086	27
1086	51
1087	1
1087	5
1087	18
1087	51
1089	2
1089	5
1089	18
1089	27
1089	34
1090	1
1090	3
1090	18
1090	36
1091	2
1091	3
1091	18
1091	21
1091	29
1151	44
1151	22
1151	13
1151	2
1096	1
1096	3
1096	18
1096	20
1096	37
1097	2
1097	3
1097	18
1097	20
1097	36
1098	2
1098	4
1098	14
1098	21
1098	54
1099	1
1099	4
1099	18
1099	20
1099	36
1100	2
1100	3
1100	18
1100	27
1100	38
1101	2
1101	3
1101	18
1101	20
1101	50
1102	5
1102	18
1102	37
1103	2
1103	4
1103	18
1103	24
1103	44
1104	1
1104	4
1104	18
1104	24
1104	44
1104	55
1105	2
1105	5
1105	17
1105	23
1105	53
1106	1
1106	5
1106	13
1106	22
1106	38
1107	1
1107	5
1107	15
1107	24
1107	38
1108	1
1108	5
1108	14
1108	20
1108	22
1108	55
1109	1
1109	5
1109	14
1109	20
1109	29
1109	34
1110	1
1110	5
1110	13
1110	21
1110	55
1111	1
1111	5
1111	14
1111	21
1111	27
1111	31
1152	14
1152	4
1152	51
1152	1
1152	20
1152	28
1157	18
1157	4
1157	51
1157	20
1157	1
1156	18
1158	18
1158	5
1158	23
1158	1
1117	18
1117	57
1117	1
1117	20
1117	23
1117	3
1118	18
1118	37
1118	2
1118	21
1118	3
1119	18
1119	57
1119	1
1119	23
1119	3
1120	18
1120	57
1120	1
1120	23
1120	28
1120	3
1121	18
1121	39
1121	2
1121	21
1121	3
1122	18
1122	39
1122	2
1122	23
1122	3
1123	18
1123	39
1123	2
1123	23
1123	5
1124	18
1124	37
1124	1
1124	21
1124	4
1125	18
1125	37
1125	1
1125	21
1125	4
1126	18
1126	40
1126	2
1126	21
1126	3
1127	18
1127	50
1127	1
1127	5
1128	18
1128	36
1128	1
1128	5
1129	18
1129	38
1129	1
1129	5
1130	18
1130	48
1130	2
1130	5
1131	18
1131	55
1131	1
1131	4
1132	18
1132	55
1132	2
1132	3
1133	18
1133	37
1133	1
1133	4
1134	18
1134	37
1134	1
1134	4
1135	18
1135	37
1135	1
1135	4
1136	18
1136	37
1136	1
1136	4
1137	18
1137	37
1137	1
1137	4
1138	15
1138	38
1138	1
1138	21
1138	4
1139	13
1139	34
1139	1
1139	4
1140	18
1140	50
1140	1
1140	4
1141	18
1141	50
1141	2
1141	4
1142	18
1142	50
1142	1
1142	5
1143	18
1143	50
1143	1
1143	5
1144	18
1144	50
1144	2
1144	5
1145	18
1145	42
1145	1
1145	5
1146	18
1146	57
1146	1
1146	23
1146	4
1147	18
1147	57
1147	1
1147	21
1147	4
1148	18
1148	57
1158	53
1161	1
18	55
922	15
334	14
498	9
1148	1
1148	23
1148	4
1153	14
1153	4
1153	20
1153	28
1153	51
1153	1
1154	27
1154	1
1154	18
1154	29
1154	30
1154	4
1155	18
1155	23
1155	1
1155	4
1155	57
1156	1
1169	50
1156	3
1156	57
1156	21
1156	28
1159	18
1159	20
1159	28
1159	51
1159	5
1159	1
1160	18
1160	20
1160	28
1160	1
1160	51
1160	5
1161	18
1161	20
1161	3
1161	34
1162	3
1162	43
1162	20
1162	1
526	15
29	15
102	15
334	29
497	11
874	33
399	13
677	14
829	50
774	50
367	50
931	48
143	6
706	38
494	34
494	38
426	37
1170	1
409	6
1170	31
1165	20
1163	40
1171	18
1171	20
1171	1
1171	5
1171	41
1172	1
1172	28
1172	18
1172	5
1172	51
1173	18
1173	23
1173	1
544	6
1173	51
1174	21
1174	24
1174	1
1174	4
1174	50
1174	18
1170	6
1168	4
1173	4
1151	3
574	14
112	14
173	14
261	15
783	15
795	38
852	38
332	14
667	34
667	38
667	14
400	15
1028	15
524	14
428	14
453	13
850	38
850	13
802	38
802	16
864	13
864	38
865	33
865	34
885	14
806	11
806	34
15	17
15	50
\.


--
-- TOC entry 3412 (class 0 OID 16749)
-- Dependencies: 225
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: galc-api-production
--

COPY public.schema_migrations (version) FROM stdin;
20220309221609
20220311190417
20220406202724
20220406203912
20220406213014
20220406213252
20220414191138
20220414225150
20220414225809
20220415173214
20220531202541
20220609204903
20220809165539
20220809172916
20220809173101
20220809174454
20220809180904
20220809184756
20220810184802
20220908164857
20220912185831
20220914235036
20220920203301
20220920213123
20220921205344
20220921220637
20220926171602
20221003153449
20221031204826
20221129184628
20221129184749
20221129190229
20221129191450
20221201214805
20221207235838
20221208171034
20221208181611
\.


--
-- TOC entry 3420 (class 0 OID 0)
-- Dependencies: 217
-- Name: closures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: galc-api-production
--

SELECT pg_catalog.setval('public.closures_id_seq', 7, true);


--
-- TOC entry 3421 (class 0 OID 0)
-- Dependencies: 219
-- Name: facets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: galc-api-production
--

SELECT pg_catalog.setval('public.facets_id_seq', 5, true);


--
-- TOC entry 3422 (class 0 OID 0)
-- Dependencies: 221
-- Name: images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: galc-api-production
--

SELECT pg_catalog.setval('public.images_id_seq', 1102, true);


--
-- TOC entry 3423 (class 0 OID 0)
-- Dependencies: 223
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: galc-api-production
--

SELECT pg_catalog.setval('public.items_id_seq', 1174, true);


--
-- TOC entry 3424 (class 0 OID 0)
-- Dependencies: 227
-- Name: terms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: galc-api-production
--

SELECT pg_catalog.setval('public.terms_id_seq', 57, true);


-- Completed on 2025-03-25 11:27:07 EDT

--
-- PostgreSQL database dump complete
--

