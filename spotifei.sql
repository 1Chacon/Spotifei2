--
-- PostgreSQL database dump
--

-- Dumped from database version 15.13
-- Dumped by pg_dump version 17.4

-- Started on 2025-05-21 22:46:45

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 16409)
-- Name: artista; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.artista (
    id integer NOT NULL,
    nome character varying(100) NOT NULL
);


ALTER TABLE public.artista OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16408)
-- Name: artista_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.artista_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.artista_id_seq OWNER TO postgres;

--
-- TOC entry 3398 (class 0 OID 0)
-- Dependencies: 216
-- Name: artista_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.artista_id_seq OWNED BY public.artista.id;


--
-- TOC entry 223 (class 1259 OID 16447)
-- Name: historico_busca; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.historico_busca (
    id integer NOT NULL,
    id_usuario integer,
    id_musica integer,
    data_busca timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.historico_busca OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16446)
-- Name: historico_busca_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.historico_busca_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.historico_busca_id_seq OWNER TO postgres;

--
-- TOC entry 3399 (class 0 OID 0)
-- Dependencies: 222
-- Name: historico_busca_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.historico_busca_id_seq OWNED BY public.historico_busca.id;


--
-- TOC entry 221 (class 1259 OID 16428)
-- Name: interacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.interacao (
    id integer NOT NULL,
    id_usuario integer,
    id_musica integer,
    tipo character varying(10),
    data_interacao timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT interacao_tipo_check CHECK (((tipo)::text = ANY ((ARRAY['curtir'::character varying, 'descurtir'::character varying])::text[])))
);


ALTER TABLE public.interacao OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16427)
-- Name: interacao_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.interacao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.interacao_id_seq OWNER TO postgres;

--
-- TOC entry 3400 (class 0 OID 0)
-- Dependencies: 220
-- Name: interacao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.interacao_id_seq OWNED BY public.interacao.id;


--
-- TOC entry 219 (class 1259 OID 16416)
-- Name: musica; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.musica (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    genero character varying(50),
    id_artista integer
);


ALTER TABLE public.musica OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16415)
-- Name: musica_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.musica_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.musica_id_seq OWNER TO postgres;

--
-- TOC entry 3401 (class 0 OID 0)
-- Dependencies: 218
-- Name: musica_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.musica_id_seq OWNED BY public.musica.id;


--
-- TOC entry 225 (class 1259 OID 16465)
-- Name: playlist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.playlist (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    id_usuario integer
);


ALTER TABLE public.playlist OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16464)
-- Name: playlist_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.playlist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.playlist_id_seq OWNER TO postgres;

--
-- TOC entry 3402 (class 0 OID 0)
-- Dependencies: 224
-- Name: playlist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.playlist_id_seq OWNED BY public.playlist.id;


--
-- TOC entry 227 (class 1259 OID 16477)
-- Name: playlist_musica; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.playlist_musica (
    id integer NOT NULL,
    id_playlist integer,
    id_musica integer
);


ALTER TABLE public.playlist_musica OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16476)
-- Name: playlist_musica_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.playlist_musica_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.playlist_musica_id_seq OWNER TO postgres;

--
-- TOC entry 3403 (class 0 OID 0)
-- Dependencies: 226
-- Name: playlist_musica_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.playlist_musica_id_seq OWNED BY public.playlist_musica.id;


--
-- TOC entry 215 (class 1259 OID 16400)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    usuario character varying(50) NOT NULL,
    senha character varying(50) NOT NULL
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16399)
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuario_id_seq OWNER TO postgres;

--
-- TOC entry 3404 (class 0 OID 0)
-- Dependencies: 214
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;


--
-- TOC entry 3204 (class 2604 OID 16412)
-- Name: artista id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artista ALTER COLUMN id SET DEFAULT nextval('public.artista_id_seq'::regclass);


--
-- TOC entry 3208 (class 2604 OID 16450)
-- Name: historico_busca id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historico_busca ALTER COLUMN id SET DEFAULT nextval('public.historico_busca_id_seq'::regclass);


--
-- TOC entry 3206 (class 2604 OID 16431)
-- Name: interacao id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interacao ALTER COLUMN id SET DEFAULT nextval('public.interacao_id_seq'::regclass);


--
-- TOC entry 3205 (class 2604 OID 16419)
-- Name: musica id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musica ALTER COLUMN id SET DEFAULT nextval('public.musica_id_seq'::regclass);


--
-- TOC entry 3210 (class 2604 OID 16468)
-- Name: playlist id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlist ALTER COLUMN id SET DEFAULT nextval('public.playlist_id_seq'::regclass);


--
-- TOC entry 3211 (class 2604 OID 16480)
-- Name: playlist_musica id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlist_musica ALTER COLUMN id SET DEFAULT nextval('public.playlist_musica_id_seq'::regclass);


--
-- TOC entry 3203 (class 2604 OID 16403)
-- Name: usuario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);


--
-- TOC entry 3382 (class 0 OID 16409)
-- Dependencies: 217
-- Data for Name: artista; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.artista (id, nome) FROM stdin;
1	Coldplay
2	Adele
3	Imagine Dragons
4	Taylor Swift
\.


--
-- TOC entry 3388 (class 0 OID 16447)
-- Dependencies: 223
-- Data for Name: historico_busca; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.historico_busca (id, id_usuario, id_musica, data_busca) FROM stdin;
1	2	2	2025-05-19 21:41:57.536321
2	2	10	2025-05-19 21:41:57.579126
3	2	1	2025-05-19 21:42:01.30508
4	2	2	2025-05-19 21:42:01.347787
5	2	3	2025-05-19 21:42:01.390959
6	2	4	2025-05-19 21:42:01.433721
7	2	5	2025-05-19 21:42:01.476537
8	2	6	2025-05-19 21:42:01.521171
9	2	7	2025-05-19 21:42:01.568167
10	2	8	2025-05-19 21:42:01.613642
11	2	9	2025-05-19 21:42:01.658427
12	2	10	2025-05-19 21:42:01.701819
13	2	11	2025-05-19 21:42:01.748784
14	2	12	2025-05-19 21:42:01.792229
15	2	13	2025-05-19 21:42:01.83615
16	2	14	2025-05-19 21:42:01.878287
17	2	15	2025-05-19 21:42:01.921215
18	2	16	2025-05-19 21:42:01.965715
19	2	5	2025-05-19 21:42:07.237276
20	2	6	2025-05-19 21:42:07.280634
21	2	13	2025-05-19 21:42:07.326562
22	2	14	2025-05-19 21:42:07.372899
23	2	1	2025-05-19 21:42:12.369266
24	2	2	2025-05-19 21:42:12.412513
25	2	3	2025-05-19 21:42:12.456639
26	2	4	2025-05-19 21:42:12.499278
27	2	5	2025-05-19 21:42:12.548424
28	2	6	2025-05-19 21:42:12.695458
29	2	7	2025-05-19 21:42:12.737446
30	2	8	2025-05-19 21:42:12.781347
31	2	9	2025-05-19 21:42:12.826181
32	2	10	2025-05-19 21:42:12.869243
33	2	11	2025-05-19 21:42:12.91199
34	2	12	2025-05-19 21:42:12.961997
35	2	13	2025-05-19 21:42:13.022889
36	2	14	2025-05-19 21:42:13.073816
37	2	15	2025-05-19 21:42:13.126588
38	2	16	2025-05-19 21:42:13.171055
39	2	1	2025-05-19 21:43:05.186959
40	2	2	2025-05-19 21:43:05.230078
41	2	3	2025-05-19 21:43:05.271919
42	2	4	2025-05-19 21:43:05.313105
43	2	5	2025-05-19 21:43:05.356008
44	2	6	2025-05-19 21:43:05.399204
45	2	7	2025-05-19 21:43:05.441171
46	2	8	2025-05-19 21:43:05.483289
47	2	9	2025-05-19 21:43:05.527398
48	2	10	2025-05-19 21:43:05.569354
49	2	11	2025-05-19 21:43:05.612466
50	2	12	2025-05-19 21:43:05.655433
51	2	13	2025-05-19 21:43:05.697413
52	2	14	2025-05-19 21:43:05.740319
53	2	15	2025-05-19 21:43:05.782492
54	2	16	2025-05-19 21:43:05.823763
55	2	1	2025-05-19 21:43:05.913675
56	2	2	2025-05-19 21:43:05.957244
57	2	3	2025-05-19 21:43:06.001097
58	2	4	2025-05-19 21:43:06.044384
59	2	5	2025-05-19 21:43:06.085892
60	2	6	2025-05-19 21:43:06.127769
61	2	7	2025-05-19 21:43:06.172258
62	2	8	2025-05-19 21:43:06.215047
63	2	9	2025-05-19 21:43:06.261448
64	2	10	2025-05-19 21:43:06.303814
65	2	11	2025-05-19 21:43:06.455375
66	2	12	2025-05-19 21:43:06.498994
67	2	13	2025-05-19 21:43:06.541535
68	2	14	2025-05-19 21:43:06.583204
69	2	15	2025-05-19 21:43:06.625135
70	2	16	2025-05-19 21:43:06.667777
71	3	1	2025-05-19 21:57:37.407441
72	3	9	2025-05-19 21:57:37.452891
73	3	1	2025-05-19 21:57:49.941397
74	3	2	2025-05-19 21:57:49.986588
75	3	3	2025-05-19 21:57:50.029194
76	3	4	2025-05-19 21:57:50.072168
77	3	5	2025-05-19 21:57:50.116562
78	3	6	2025-05-19 21:57:50.160347
79	3	7	2025-05-19 21:57:50.204595
80	3	8	2025-05-19 21:57:50.249838
81	3	9	2025-05-19 21:57:50.292768
82	3	10	2025-05-19 21:57:50.335792
83	3	11	2025-05-19 21:57:50.378983
84	3	12	2025-05-19 21:57:50.422252
85	3	13	2025-05-19 21:57:50.566111
86	3	14	2025-05-19 21:57:50.612178
87	3	15	2025-05-19 21:57:50.660518
88	3	16	2025-05-19 21:57:50.706802
89	3	1	2025-05-19 22:12:47.56902
90	3	2	2025-05-19 22:12:47.613539
91	3	3	2025-05-19 22:12:47.656921
92	3	4	2025-05-19 22:12:47.700265
93	3	5	2025-05-19 22:12:47.744191
94	3	6	2025-05-19 22:12:47.787841
95	3	7	2025-05-19 22:12:47.830899
96	3	8	2025-05-19 22:12:47.873014
97	3	9	2025-05-19 22:12:47.915087
98	3	10	2025-05-19 22:12:47.95773
99	3	11	2025-05-19 22:12:48.000953
100	3	12	2025-05-19 22:12:48.044423
101	3	13	2025-05-19 22:12:48.088021
102	3	14	2025-05-19 22:12:48.241054
103	3	15	2025-05-19 22:12:48.283796
104	3	16	2025-05-19 22:12:48.327107
105	3	1	2025-05-19 22:12:56.214906
106	3	2	2025-05-19 22:12:56.255839
107	3	3	2025-05-19 22:12:56.297498
108	3	4	2025-05-19 22:12:56.339861
109	3	5	2025-05-19 22:12:56.384018
110	3	6	2025-05-19 22:12:56.427154
111	3	7	2025-05-19 22:12:56.48615
112	3	8	2025-05-19 22:12:56.579712
113	3	9	2025-05-19 22:12:56.621913
114	3	10	2025-05-19 22:12:56.667274
115	3	11	2025-05-19 22:12:56.709493
116	3	12	2025-05-19 22:12:56.750503
117	3	13	2025-05-19 22:12:56.792372
118	3	14	2025-05-19 22:12:56.839427
119	3	15	2025-05-19 22:12:56.883656
120	3	16	2025-05-19 22:12:56.926948
121	3	1	2025-05-19 22:18:21.356219
122	3	2	2025-05-19 22:18:21.399159
123	3	3	2025-05-19 22:18:21.441743
124	3	4	2025-05-19 22:18:21.483253
125	3	5	2025-05-19 22:18:21.52629
126	3	6	2025-05-19 22:18:21.568196
127	3	7	2025-05-19 22:18:21.609919
128	3	8	2025-05-19 22:18:21.651578
129	3	9	2025-05-19 22:18:21.694431
130	3	10	2025-05-19 22:18:21.738376
131	3	11	2025-05-19 22:18:21.780554
132	3	12	2025-05-19 22:18:21.823243
133	3	13	2025-05-19 22:18:21.868082
134	3	14	2025-05-19 22:18:21.915206
135	3	15	2025-05-19 22:18:21.957356
136	3	16	2025-05-19 22:18:22.001411
137	3	1	2025-05-19 22:18:32.376217
138	3	2	2025-05-19 22:18:32.419879
139	3	3	2025-05-19 22:18:32.465197
140	3	4	2025-05-19 22:18:32.509949
141	3	5	2025-05-19 22:18:32.552191
142	3	6	2025-05-19 22:18:32.594658
143	3	7	2025-05-19 22:18:32.637101
144	3	8	2025-05-19 22:18:32.678564
145	3	9	2025-05-19 22:18:32.718918
146	3	10	2025-05-19 22:18:32.760356
147	3	11	2025-05-19 22:18:32.806774
148	3	12	2025-05-19 22:18:32.85266
149	3	13	2025-05-19 22:18:32.895128
150	3	14	2025-05-19 22:18:32.936868
151	3	15	2025-05-19 22:18:32.977787
152	3	16	2025-05-19 22:18:33.019473
153	3	5	2025-05-20 22:42:53.900229
154	3	6	2025-05-20 22:42:53.952397
155	3	13	2025-05-20 22:42:53.99859
156	3	14	2025-05-20 22:42:54.047237
157	3	1	2025-05-21 01:05:11.503956
158	3	2	2025-05-21 01:05:11.555988
159	3	3	2025-05-21 01:05:11.604434
160	3	4	2025-05-21 01:05:11.651532
161	3	5	2025-05-21 01:05:11.699211
162	3	6	2025-05-21 01:05:11.74971
163	3	7	2025-05-21 01:05:11.801574
164	3	8	2025-05-21 01:05:11.847753
165	3	9	2025-05-21 01:05:11.896073
166	3	10	2025-05-21 01:05:11.944492
167	3	11	2025-05-21 01:05:11.989354
168	3	12	2025-05-21 01:05:12.032437
169	3	13	2025-05-21 01:05:12.074683
170	3	14	2025-05-21 01:05:12.119009
171	3	15	2025-05-21 01:05:12.263948
172	3	16	2025-05-21 01:05:12.419378
173	3	2	2025-05-21 01:05:55.224423
174	3	10	2025-05-21 01:05:55.266652
\.


--
-- TOC entry 3386 (class 0 OID 16428)
-- Dependencies: 221
-- Data for Name: interacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.interacao (id, id_usuario, id_musica, tipo, data_interacao) FROM stdin;
1	3	1	curtir	2025-05-19 22:12:45.213564
2	3	4	curtir	2025-05-19 22:12:50.8587
3	3	1	curtir	2025-05-19 22:18:13.271837
4	3	16	curtir	2025-05-19 22:18:25.921871
5	3	5	curtir	2025-05-21 01:05:16.832538
\.


--
-- TOC entry 3384 (class 0 OID 16416)
-- Dependencies: 219
-- Data for Name: musica; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.musica (id, nome, genero, id_artista) FROM stdin;
1	Yellow	Rock	1
2	Fix You	Rock	1
3	Hello	Pop	2
4	Rolling in the Deep	Pop	2
5	Radioactive	Alternative	3
6	Demons	Alternative	3
7	Blank Space	Pop	4
8	Shake It Off	Pop	4
9	Yellow	Rock	1
10	Fix You	Rock	1
11	Hello	Pop	2
12	Rolling in the Deep	Pop	2
13	Radioactive	Alternative	3
14	Demons	Alternative	3
15	Blank Space	Pop	4
16	Shake It Off	Pop	4
\.


--
-- TOC entry 3390 (class 0 OID 16465)
-- Dependencies: 225
-- Data for Name: playlist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.playlist (id, nome, id_usuario) FROM stdin;
1		2
2		2
3	wilson 1	2
4	wilson1	3
5	wilson2	3
\.


--
-- TOC entry 3392 (class 0 OID 16477)
-- Dependencies: 227
-- Data for Name: playlist_musica; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.playlist_musica (id, id_playlist, id_musica) FROM stdin;
\.


--
-- TOC entry 3380 (class 0 OID 16400)
-- Dependencies: 215
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario (id, nome, usuario, senha) FROM stdin;
1	Usuário Teste	teste	123
2	wilson	wilson	wilson
3	chacon	chacon	chacon
\.


--
-- TOC entry 3405 (class 0 OID 0)
-- Dependencies: 216
-- Name: artista_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.artista_id_seq', 4, true);


--
-- TOC entry 3406 (class 0 OID 0)
-- Dependencies: 222
-- Name: historico_busca_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.historico_busca_id_seq', 174, true);


--
-- TOC entry 3407 (class 0 OID 0)
-- Dependencies: 220
-- Name: interacao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.interacao_id_seq', 5, true);


--
-- TOC entry 3408 (class 0 OID 0)
-- Dependencies: 218
-- Name: musica_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.musica_id_seq', 16, true);


--
-- TOC entry 3409 (class 0 OID 0)
-- Dependencies: 224
-- Name: playlist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.playlist_id_seq', 5, true);


--
-- TOC entry 3410 (class 0 OID 0)
-- Dependencies: 226
-- Name: playlist_musica_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.playlist_musica_id_seq', 2, true);


--
-- TOC entry 3411 (class 0 OID 0)
-- Dependencies: 214
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_id_seq', 3, true);


--
-- TOC entry 3218 (class 2606 OID 16414)
-- Name: artista artista_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artista
    ADD CONSTRAINT artista_pkey PRIMARY KEY (id);


--
-- TOC entry 3224 (class 2606 OID 16453)
-- Name: historico_busca historico_busca_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historico_busca
    ADD CONSTRAINT historico_busca_pkey PRIMARY KEY (id);


--
-- TOC entry 3222 (class 2606 OID 16435)
-- Name: interacao interacao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interacao
    ADD CONSTRAINT interacao_pkey PRIMARY KEY (id);


--
-- TOC entry 3220 (class 2606 OID 16421)
-- Name: musica musica_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musica
    ADD CONSTRAINT musica_pkey PRIMARY KEY (id);


--
-- TOC entry 3228 (class 2606 OID 16482)
-- Name: playlist_musica playlist_musica_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlist_musica
    ADD CONSTRAINT playlist_musica_pkey PRIMARY KEY (id);


--
-- TOC entry 3226 (class 2606 OID 16470)
-- Name: playlist playlist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlist
    ADD CONSTRAINT playlist_pkey PRIMARY KEY (id);


--
-- TOC entry 3214 (class 2606 OID 16405)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 3216 (class 2606 OID 16407)
-- Name: usuario usuario_usuario_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_usuario_key UNIQUE (usuario);


--
-- TOC entry 3232 (class 2606 OID 16459)
-- Name: historico_busca historico_busca_id_musica_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historico_busca
    ADD CONSTRAINT historico_busca_id_musica_fkey FOREIGN KEY (id_musica) REFERENCES public.musica(id);


--
-- TOC entry 3233 (class 2606 OID 16454)
-- Name: historico_busca historico_busca_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historico_busca
    ADD CONSTRAINT historico_busca_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);


--
-- TOC entry 3230 (class 2606 OID 16441)
-- Name: interacao interacao_id_musica_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interacao
    ADD CONSTRAINT interacao_id_musica_fkey FOREIGN KEY (id_musica) REFERENCES public.musica(id);


--
-- TOC entry 3231 (class 2606 OID 16436)
-- Name: interacao interacao_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interacao
    ADD CONSTRAINT interacao_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);


--
-- TOC entry 3229 (class 2606 OID 16422)
-- Name: musica musica_id_artista_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musica
    ADD CONSTRAINT musica_id_artista_fkey FOREIGN KEY (id_artista) REFERENCES public.artista(id);


--
-- TOC entry 3234 (class 2606 OID 16471)
-- Name: playlist playlist_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlist
    ADD CONSTRAINT playlist_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);


--
-- TOC entry 3235 (class 2606 OID 16488)
-- Name: playlist_musica playlist_musica_id_musica_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlist_musica
    ADD CONSTRAINT playlist_musica_id_musica_fkey FOREIGN KEY (id_musica) REFERENCES public.musica(id);


--
-- TOC entry 3236 (class 2606 OID 16483)
-- Name: playlist_musica playlist_musica_id_playlist_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlist_musica
    ADD CONSTRAINT playlist_musica_id_playlist_fkey FOREIGN KEY (id_playlist) REFERENCES public.playlist(id);


-- Completed on 2025-05-21 22:46:45

--
-- PostgreSQL database dump complete
--

