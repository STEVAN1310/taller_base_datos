--
-- PostgreSQL database dump
--

\restrict kVq5dzKqTXbwVNEIqQkpshQKDI9c41aCcLQAkbh1jjYBBqSRX7f9NPOIJbGGu4n

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

-- Started on 2026-11-19 15:04:35

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
-- TOC entry 230 (class 1259 OID 16913)
-- Name: clases; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clases (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    dia_semana character varying(20) NOT NULL,
    hora time without time zone NOT NULL,
    cupo integer NOT NULL,
    entrenador_id integer NOT NULL,
    estado character varying(20) DEFAULT 'activa'::character varying NOT NULL,
    CONSTRAINT chk_estado_clase CHECK (((estado)::text = ANY ((ARRAY['activa'::character varying, 'suspendida'::character varying])::text[]))),
    CONSTRAINT clases_cupo_check CHECK ((cupo > 0))
);


ALTER TABLE public.clases OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16912)
-- Name: clases_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clases_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clases_id_seq OWNER TO postgres;

--
-- TOC entry 5072 (class 0 OID 0)
-- Dependencies: 229
-- Name: clases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clases_id_seq OWNED BY public.clases.id;


--
-- TOC entry 224 (class 1259 OID 16855)
-- Name: entrenadores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entrenadores (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    especialidad character varying(100) NOT NULL,
    correo character varying(100) NOT NULL
);


ALTER TABLE public.entrenadores OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16854)
-- Name: entrenadores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.entrenadores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.entrenadores_id_seq OWNER TO postgres;

--
-- TOC entry 5073 (class 0 OID 0)
-- Dependencies: 223
-- Name: entrenadores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.entrenadores_id_seq OWNED BY public.entrenadores.id;


--
-- TOC entry 226 (class 1259 OID 16868)
-- Name: fichas_medicas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fichas_medicas (
    id integer NOT NULL,
    peso numeric(5,2) NOT NULL,
    estatura numeric(3,2) NOT NULL,
    lesiones text,
    socio_id integer NOT NULL,
    CONSTRAINT fichas_medicas_estatura_check CHECK ((estatura > (0)::numeric)),
    CONSTRAINT fichas_medicas_peso_check CHECK ((peso > (0)::numeric))
);


ALTER TABLE public.fichas_medicas OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16867)
-- Name: fichas_medicas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fichas_medicas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.fichas_medicas_id_seq OWNER TO postgres;

--
-- TOC entry 5074 (class 0 OID 0)
-- Dependencies: 225
-- Name: fichas_medicas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fichas_medicas_id_seq OWNED BY public.fichas_medicas.id;


--
-- TOC entry 232 (class 1259 OID 16932)
-- Name: inscripciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inscripciones (
    id integer NOT NULL,
    fecha_inscripcion date NOT NULL,
    socio_id integer NOT NULL,
    clase_id integer NOT NULL
);


ALTER TABLE public.inscripciones OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16931)
-- Name: inscripciones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inscripciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.inscripciones_id_seq OWNER TO postgres;

--
-- TOC entry 5075 (class 0 OID 0)
-- Dependencies: 231
-- Name: inscripciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inscripciones_id_seq OWNED BY public.inscripciones.id;


--
-- TOC entry 228 (class 1259 OID 16890)
-- Name: membresias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.membresias (
    id integer NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_fin date NOT NULL,
    socio_id integer NOT NULL,
    plan_id integer NOT NULL,
    valor_pagado numeric(10,2) NOT NULL,
    CONSTRAINT membresias_check CHECK ((fecha_fin >= fecha_inicio)),
    CONSTRAINT membresias_fechas_check CHECK ((fecha_fin > fecha_inicio)),
    CONSTRAINT membresias_valor_pagado_check CHECK ((valor_pagado > (0)::numeric))
);


ALTER TABLE public.membresias OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16889)
-- Name: membresias_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.membresias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.membresias_id_seq OWNER TO postgres;

--
-- TOC entry 5076 (class 0 OID 0)
-- Dependencies: 227
-- Name: membresias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.membresias_id_seq OWNED BY public.membresias.id;


--
-- TOC entry 222 (class 1259 OID 16840)
-- Name: planes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planes (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    duracion_meses integer NOT NULL,
    precio numeric(10,2) NOT NULL,
    CONSTRAINT planes_duracion_meses_check CHECK ((duracion_meses > 0)),
    CONSTRAINT planes_precio_check CHECK ((precio > (0)::numeric))
);


ALTER TABLE public.planes OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16839)
-- Name: planes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.planes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.planes_id_seq OWNER TO postgres;

--
-- TOC entry 5077 (class 0 OID 0)
-- Dependencies: 221
-- Name: planes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.planes_id_seq OWNED BY public.planes.id;


--
-- TOC entry 220 (class 1259 OID 16825)
-- Name: socios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socios (
    id integer NOT NULL,
    numero_documento character varying(20) NOT NULL,
    nombre character varying(100) NOT NULL,
    telefono character varying(20) NOT NULL,
    correo character varying(100),
    acepta_whatsapp boolean DEFAULT false NOT NULL
);


ALTER TABLE public.socios OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16824)
-- Name: socios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.socios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.socios_id_seq OWNER TO postgres;

--
-- TOC entry 5078 (class 0 OID 0)
-- Dependencies: 219
-- Name: socios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.socios_id_seq OWNED BY public.socios.id;


--
-- TOC entry 235 (class 1259 OID 16984)
-- Name: v_ingresos_planes; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_ingresos_planes AS
 SELECT p.id AS plan_id,
    p.nombre AS plan,
    count(m.id) AS total_vendidas,
    COALESCE(sum(m.valor_pagado), (0)::numeric) AS dinero_recaudado
   FROM (public.planes p
     LEFT JOIN public.membresias m ON ((p.id = m.plan_id)))
  GROUP BY p.id, p.nombre;


ALTER VIEW public.v_ingresos_planes OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16974)
-- Name: v_membresias_vencidas; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_membresias_vencidas AS
 SELECT s.id AS socio_id,
    s.nombre,
    s.telefono,
    s.acepta_whatsapp,
    max(m.fecha_fin) AS fecha_vencimiento
   FROM (public.socios s
     JOIN public.membresias m ON ((s.id = m.socio_id)))
  GROUP BY s.id, s.nombre, s.telefono, s.acepta_whatsapp
 HAVING (max(m.fecha_fin) < CURRENT_DATE);


ALTER VIEW public.v_membresias_vencidas OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16979)
-- Name: v_ocupacion_clases; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_ocupacion_clases AS
 SELECT c.id AS clase_id,
    c.nombre AS clase,
    c.dia_semana,
    c.hora,
    c.cupo,
    count(i.id) AS inscritos,
    (c.cupo - count(i.id)) AS cupos_disponibles
   FROM (public.clases c
     LEFT JOIN public.inscripciones i ON ((c.id = i.clase_id)))
  WHERE ((c.estado)::text = 'activa'::text)
  GROUP BY c.id, c.nombre, c.dia_semana, c.hora, c.cupo;


ALTER VIEW public.v_ocupacion_clases OWNER TO postgres;

--
-- TOC entry 4857 (class 2604 OID 16916)
-- Name: clases id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clases ALTER COLUMN id SET DEFAULT nextval('public.clases_id_seq'::regclass);


--
-- TOC entry 4854 (class 2604 OID 16858)
-- Name: entrenadores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entrenadores ALTER COLUMN id SET DEFAULT nextval('public.entrenadores_id_seq'::regclass);


--
-- TOC entry 4855 (class 2604 OID 16871)
-- Name: fichas_medicas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fichas_medicas ALTER COLUMN id SET DEFAULT nextval('public.fichas_medicas_id_seq'::regclass);


--
-- TOC entry 4859 (class 2604 OID 16935)
-- Name: inscripciones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones ALTER COLUMN id SET DEFAULT nextval('public.inscripciones_id_seq'::regclass);


--
-- TOC entry 4856 (class 2604 OID 16893)
-- Name: membresias id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membresias ALTER COLUMN id SET DEFAULT nextval('public.membresias_id_seq'::regclass);


--
-- TOC entry 4853 (class 2604 OID 16843)
-- Name: planes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planes ALTER COLUMN id SET DEFAULT nextval('public.planes_id_seq'::regclass);


--
-- TOC entry 4851 (class 2604 OID 16828)
-- Name: socios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socios ALTER COLUMN id SET DEFAULT nextval('public.socios_id_seq'::regclass);


--
-- TOC entry 5064 (class 0 OID 16913)
-- Dependencies: 230
-- Data for Name: clases; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clases (id, nombre, dia_semana, hora, cupo, entrenador_id, estado) FROM stdin;
1	Spinning Intenso	Lunes	07:00:00	2	1	activa
2	Yoga Restaurativo	Miércoles	18:00:00	10	2	activa
4	Estiramiento Guiado	Sábado	09:30:00	8	2	activa
3	Cardio Hit	Viernes	08:00:00	12	1	suspendida
5	Pilates	Viernes	18:00:00	12	1	activa
\.


--
-- TOC entry 5058 (class 0 OID 16855)
-- Dependencies: 224
-- Data for Name: entrenadores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.entrenadores (id, nombre, especialidad, correo) FROM stdin;
1	Javier Morales	Spinning y Cardio	javier.morales@cuerpoactivo.com
2	Camila Ortiz	Yoga y Movilidad	camila.ortiz@cuerpoactivo.com
3	Diego Fernández	Entrenamiento Funcional	diego.fernandez@cuerpoactivo.com
\.


--
-- TOC entry 5060 (class 0 OID 16868)
-- Dependencies: 226
-- Data for Name: fichas_medicas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fichas_medicas (id, peso, estatura, lesiones, socio_id) FROM stdin;
1	78.50	1.75	Ninguna	1
2	62.00	1.64	Esguince antiguo en tobillo derecho	2
3	85.20	1.80	Molestia lumbar leve	3
4	58.40	1.60	\N	4
\.


--
-- TOC entry 5066 (class 0 OID 16932)
-- Dependencies: 232
-- Data for Name: inscripciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inscripciones (id, fecha_inscripcion, socio_id, clase_id) FROM stdin;
1	2026-11-02	1	1
2	2026-11-03	2	1
3	2026-11-03	1	2
4	2026-11-04	1	3
5	2026-11-05	2	2
6	2026-11-06	3	2
7	2026-11-07	3	4
8	2026-11-08	4	3
9	2026-11-09	4	4
10	2026-11-10	5	4
\.


--
-- TOC entry 5062 (class 0 OID 16890)
-- Dependencies: 228
-- Data for Name: membresias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.membresias (id, fecha_inicio, fecha_fin, socio_id, plan_id, valor_pagado) FROM stdin;
1	2026-08-01	2026-09-01	1	1	85000.00
2	2026-11-01	2027-02-01	1	2	220000.00
3	2026-09-10	2026-10-10	2	1	85000.00
4	2026-06-01	2027-06-01	3	3	750000.00
5	2026-11-05	2026-12-05	4	1	85000.00
6	2026-10-15	2027-01-15	5	2	220000.00
7	2026-11-10	2026-12-10	6	1	75000.00
\.


--
-- TOC entry 5056 (class 0 OID 16840)
-- Dependencies: 222
-- Data for Name: planes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.planes (id, nombre, duracion_meses, precio) FROM stdin;
1	Mensual	1	85000.00
2	Trimestral	3	220000.00
3	Anual	12	750000.00
\.


--
-- TOC entry 5054 (class 0 OID 16825)
-- Dependencies: 220
-- Data for Name: socios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.socios (id, numero_documento, nombre, telefono, correo, acepta_whatsapp) FROM stdin;
2	1010101002	Laura Gómez	3012223344	laura.gomez@email.com	f
4	1010101004	Sofía Herrera	3104445566	sofia.herrera@email.com	f
6	1010101006	Valentina Castro	3126667788	\N	f
1	1010101001	Carlos Mendoza	3009876543	carlos.mendoza@email.com	t
3	1010101003	Andrés Rojas	3023334455	andres.rojas@email.com	t
5	1010101005	Mateo Vargas	3115556677	mateo.vargas@email.com	t
\.


--
-- TOC entry 5079 (class 0 OID 0)
-- Dependencies: 229
-- Name: clases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clases_id_seq', 5, true);


--
-- TOC entry 5080 (class 0 OID 0)
-- Dependencies: 223
-- Name: entrenadores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.entrenadores_id_seq', 3, true);


--
-- TOC entry 5081 (class 0 OID 0)
-- Dependencies: 225
-- Name: fichas_medicas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fichas_medicas_id_seq', 4, true);


--
-- TOC entry 5082 (class 0 OID 0)
-- Dependencies: 231
-- Name: inscripciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inscripciones_id_seq', 10, true);


--
-- TOC entry 5083 (class 0 OID 0)
-- Dependencies: 227
-- Name: membresias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.membresias_id_seq', 8, true);


--
-- TOC entry 5084 (class 0 OID 0)
-- Dependencies: 221
-- Name: planes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.planes_id_seq', 3, true);


--
-- TOC entry 5085 (class 0 OID 0)
-- Dependencies: 219
-- Name: socios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.socios_id_seq', 6, true);


--
-- TOC entry 4890 (class 2606 OID 16963)
-- Name: clases clases_entrenador_id_dia_hora_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clases
    ADD CONSTRAINT clases_entrenador_id_dia_hora_key UNIQUE (entrenador_id, dia_semana, hora);


--
-- TOC entry 4892 (class 2606 OID 16925)
-- Name: clases clases_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clases
    ADD CONSTRAINT clases_pkey PRIMARY KEY (id);


--
-- TOC entry 4880 (class 2606 OID 16866)
-- Name: entrenadores entrenadores_correo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entrenadores
    ADD CONSTRAINT entrenadores_correo_key UNIQUE (correo);


--
-- TOC entry 4882 (class 2606 OID 16864)
-- Name: entrenadores entrenadores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entrenadores
    ADD CONSTRAINT entrenadores_pkey PRIMARY KEY (id);


--
-- TOC entry 4884 (class 2606 OID 16881)
-- Name: fichas_medicas fichas_medicas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fichas_medicas
    ADD CONSTRAINT fichas_medicas_pkey PRIMARY KEY (id);


--
-- TOC entry 4886 (class 2606 OID 16883)
-- Name: fichas_medicas fichas_medicas_socio_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fichas_medicas
    ADD CONSTRAINT fichas_medicas_socio_id_key UNIQUE (socio_id);


--
-- TOC entry 4894 (class 2606 OID 16941)
-- Name: inscripciones inscripciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones
    ADD CONSTRAINT inscripciones_pkey PRIMARY KEY (id);


--
-- TOC entry 4896 (class 2606 OID 16943)
-- Name: inscripciones inscripciones_socio_id_clase_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones
    ADD CONSTRAINT inscripciones_socio_id_clase_id_key UNIQUE (socio_id, clase_id);


--
-- TOC entry 4888 (class 2606 OID 16901)
-- Name: membresias membresias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membresias
    ADD CONSTRAINT membresias_pkey PRIMARY KEY (id);


--
-- TOC entry 4876 (class 2606 OID 16853)
-- Name: planes planes_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planes
    ADD CONSTRAINT planes_nombre_key UNIQUE (nombre);


--
-- TOC entry 4878 (class 2606 OID 16851)
-- Name: planes planes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planes
    ADD CONSTRAINT planes_pkey PRIMARY KEY (id);


--
-- TOC entry 4870 (class 2606 OID 16838)
-- Name: socios socios_correo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socios
    ADD CONSTRAINT socios_correo_key UNIQUE (correo);


--
-- TOC entry 4872 (class 2606 OID 16836)
-- Name: socios socios_numero_documento_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socios
    ADD CONSTRAINT socios_numero_documento_key UNIQUE (numero_documento);


--
-- TOC entry 4874 (class 2606 OID 16834)
-- Name: socios socios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socios
    ADD CONSTRAINT socios_pkey PRIMARY KEY (id);


--
-- TOC entry 4900 (class 2606 OID 16926)
-- Name: clases clases_entrenador_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clases
    ADD CONSTRAINT clases_entrenador_id_fkey FOREIGN KEY (entrenador_id) REFERENCES public.entrenadores(id);


--
-- TOC entry 4897 (class 2606 OID 16964)
-- Name: fichas_medicas fichas_medicas_socio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fichas_medicas
    ADD CONSTRAINT fichas_medicas_socio_id_fkey FOREIGN KEY (socio_id) REFERENCES public.socios(id) ON DELETE CASCADE;


--
-- TOC entry 4901 (class 2606 OID 16949)
-- Name: inscripciones inscripciones_clase_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones
    ADD CONSTRAINT inscripciones_clase_id_fkey FOREIGN KEY (clase_id) REFERENCES public.clases(id);


--
-- TOC entry 4902 (class 2606 OID 16969)
-- Name: inscripciones inscripciones_socio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones
    ADD CONSTRAINT inscripciones_socio_id_fkey FOREIGN KEY (socio_id) REFERENCES public.socios(id) ON DELETE CASCADE;


--
-- TOC entry 4898 (class 2606 OID 16907)
-- Name: membresias membresias_plan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membresias
    ADD CONSTRAINT membresias_plan_id_fkey FOREIGN KEY (plan_id) REFERENCES public.planes(id);


--
-- TOC entry 4899 (class 2606 OID 16902)
-- Name: membresias membresias_socio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membresias
    ADD CONSTRAINT membresias_socio_id_fkey FOREIGN KEY (socio_id) REFERENCES public.socios(id);


-- Completed on 2026-11-19 15:04:35

--
-- PostgreSQL database dump complete
--

\unrestrict kVq5dzKqTXbwVNEIqQkpshQKDI9c41aCcLQAkbh1jjYBBqSRX7f9NPOIJbGGu4n

