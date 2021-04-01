--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: versionado; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA versionado;


ALTER SCHEMA versionado OWNER TO postgres;

--
-- Name: SCHEMA versionado; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA versionado IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: versao; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE versao (
    atual integer NOT NULL
);


ALTER TABLE public.versao OWNER TO postgres;

SET search_path = versionado, pg_catalog;

--
-- Name: adjacencia; Type: TABLE; Schema: versionado; Owner: postgres; Tablespace: 
--

CREATE TABLE adjacencia (
    membro1 integer NOT NULL,
    membro2 integer NOT NULL,
    colaboracao integer,
    versao integer NOT NULL
);


ALTER TABLE versionado.adjacencia OWNER TO postgres;

SET search_path = public, pg_catalog;

--
-- Name: adjacencia; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW adjacencia AS
    SELECT adjacencia.membro1, adjacencia.membro2, adjacencia.colaboracao FROM versionado.adjacencia, versao WHERE (adjacencia.versao = versao.atual);


ALTER TABLE public.adjacencia OWNER TO postgres;

SET search_path = versionado, pg_catalog;

--
-- Name: capitulo; Type: TABLE; Schema: versionado; Owner: postgres; Tablespace: 
--

CREATE TABLE capitulo (
    livro character varying,
    edicao character varying,
    editora character varying,
    volume character varying,
    id_publicacao integer NOT NULL,
    versao integer NOT NULL
);


ALTER TABLE versionado.capitulo OWNER TO postgres;

SET search_path = public, pg_catalog;

--
-- Name: capitulo; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW capitulo AS
    SELECT capitulo.livro, capitulo.edicao, capitulo.editora, capitulo.volume, capitulo.id_publicacao FROM versionado.capitulo, versao WHERE (capitulo.versao = versao.atual);


ALTER TABLE public.capitulo OWNER TO postgres;

SET search_path = versionado, pg_catalog;

--
-- Name: componente; Type: TABLE; Schema: versionado; Owner: postgres; Tablespace: 
--

CREATE TABLE componente (
    componente integer NOT NULL,
    vertice integer NOT NULL,
    versao integer NOT NULL
);


ALTER TABLE versionado.componente OWNER TO postgres;

SET search_path = public, pg_catalog;

--
-- Name: componente; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW componente AS
    SELECT componente.componente, componente.vertice FROM versionado.componente, versao WHERE (componente.versao = versao.atual);


ALTER TABLE public.componente OWNER TO postgres;

SET search_path = versionado, pg_catalog;

--
-- Name: conferencia; Type: TABLE; Schema: versionado; Owner: postgres; Tablespace: 
--

CREATE TABLE conferencia (
    volume character varying,
    evento character varying,
    id_publicacao integer NOT NULL,
    versao integer NOT NULL
);


ALTER TABLE versionado.conferencia OWNER TO postgres;

SET search_path = public, pg_catalog;

--
-- Name: conferencia; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW conferencia AS
    SELECT conferencia.volume, conferencia.evento, conferencia.id_publicacao FROM versionado.conferencia, versao WHERE (conferencia.versao = versao.atual);


ALTER TABLE public.conferencia OWNER TO postgres;

SET search_path = versionado, pg_catalog;

--
-- Name: diametro; Type: TABLE; Schema: versionado; Owner: postgres; Tablespace: 
--

CREATE TABLE diametro (
    posicao integer NOT NULL,
    membro integer NOT NULL,
    versao integer NOT NULL
);


ALTER TABLE versionado.diametro OWNER TO postgres;

SET search_path = public, pg_catalog;

--
-- Name: diametro; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW diametro AS
    SELECT diametro.posicao, diametro.membro FROM versionado.diametro, versao WHERE (diametro.versao = versao.atual);


ALTER TABLE public.diametro OWNER TO postgres;

SET search_path = versionado, pg_catalog;

--
-- Name: grafo; Type: TABLE; Schema: versionado; Owner: postgres; Tablespace: 
--

CREATE TABLE grafo (
    id integer NOT NULL,
    densidade real,
    giant_component real,
    versao integer NOT NULL
);


ALTER TABLE versionado.grafo OWNER TO postgres;

SET search_path = public, pg_catalog;

--
-- Name: grafo; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW grafo AS
    SELECT grafo.id, grafo.densidade, grafo.giant_component FROM versionado.grafo, versao WHERE (grafo.versao = versao.atual);


ALTER TABLE public.grafo OWNER TO postgres;

--
-- Name: rede; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE rede (
    id integer NOT NULL,
    nome character varying,
    autor integer,
    visibilidade boolean,
    xml character varying,
    anoinicio integer,
    anofim integer
);


ALTER TABLE public.rede OWNER TO postgres;

--
-- Name: grupo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE grupo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.grupo_id_seq OWNER TO postgres;

--
-- Name: grupo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE grupo_id_seq OWNED BY rede.id;


--
-- Name: grupo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('grupo_id_seq', 1, false);


SET search_path = versionado, pg_catalog;

--
-- Name: livro; Type: TABLE; Schema: versionado; Owner: postgres; Tablespace: 
--

CREATE TABLE livro (
    edicao character varying,
    volume character varying,
    id_publicacao integer NOT NULL,
    versao integer
);


ALTER TABLE versionado.livro OWNER TO postgres;

SET search_path = public, pg_catalog;

--
-- Name: livro; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW livro AS
    SELECT livro.edicao, livro.volume, livro.id_publicacao FROM versionado.livro, versao WHERE (livro.versao = versao.atual);


ALTER TABLE public.livro OWNER TO postgres;

SET search_path = versionado, pg_catalog;

--
-- Name: membros; Type: TABLE; Schema: versionado; Owner: postgres; Tablespace: 
--

CREATE TABLE membros (
    id_membro integer NOT NULL,
    nome character varying,
    id_lattes character varying,
    centralidade real DEFAULT 0,
    pagerank real DEFAULT 0,
    grau integer DEFAULT 0,
    cluster_coefficient real DEFAULT 0,
    versao integer NOT NULL,
    closeness real DEFAULT 0
);


ALTER TABLE versionado.membros OWNER TO postgres;

SET search_path = public, pg_catalog;

--
-- Name: membros; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW membros AS
    SELECT membros.id_membro, membros.nome, membros.id_lattes, membros.centralidade, membros.pagerank, membros.grau, membros.cluster_coefficient, membros.closeness FROM versionado.membros, versao WHERE (membros.versao = versao.atual);


ALTER TABLE public.membros OWNER TO postgres;

--
-- Name: matriz_adjacencia; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW matriz_adjacencia AS
    SELECT membro1.nome AS membro1, membro2.nome AS membro2, adj.colaboracao FROM ((adjacencia adj JOIN membros membro1 ON ((adj.membro1 = membro1.id_membro))) JOIN membros membro2 ON ((adj.membro2 = membro2.id_membro)));


ALTER TABLE public.matriz_adjacencia OWNER TO postgres;

--
-- Name: membrosrede; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE membrosrede (
    idgrupo integer NOT NULL,
    idlattes integer NOT NULL
);


ALTER TABLE public.membrosrede OWNER TO postgres;

SET search_path = versionado, pg_catalog;

--
-- Name: publicacao; Type: TABLE; Schema: versionado; Owner: postgres; Tablespace: 
--

CREATE TABLE publicacao (
    id_publicacao integer NOT NULL,
    tipo character varying(2),
    titulo character varying,
    autores character varying,
    ano integer,
    paginas character varying,
    id_membro integer,
    cluster integer,
    versao integer
);


ALTER TABLE versionado.publicacao OWNER TO postgres;

SET search_path = public, pg_catalog;

--
-- Name: publicacao; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW publicacao AS
    SELECT publicacao.id_publicacao, publicacao.tipo, publicacao.titulo, publicacao.autores, publicacao.ano, publicacao.paginas, publicacao.id_membro, publicacao.cluster, publicacao.versao FROM versionado.publicacao, versao WHERE (publicacao.versao = versao.atual);


ALTER TABLE public.publicacao OWNER TO postgres;

SET search_path = versionado, pg_catalog;

--
-- Name: replica; Type: TABLE; Schema: versionado; Owner: postgres; Tablespace: 
--

CREATE TABLE replica (
    id1 integer NOT NULL,
    id2 integer NOT NULL,
    v_cont integer DEFAULT 0 NOT NULL,
    f_cont integer DEFAULT 0 NOT NULL,
    versao integer,
    CONSTRAINT replica_check CHECK ((id1 < id2))
);


ALTER TABLE versionado.replica OWNER TO postgres;

SET search_path = public, pg_catalog;

--
-- Name: replica; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW replica AS
    SELECT replica.id1, replica.id2, replica.v_cont, replica.f_cont FROM versionado.replica, versao WHERE (replica.versao = versao.atual);


ALTER TABLE public.replica OWNER TO postgres;

--
-- Name: publicacoes_com_replica; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW publicacoes_com_replica AS
    SELECT pub.id_publicacao, pub.titulo, pub.autores, pub.ano, membros.nome AS membro, membros.id_membro, pub.cluster, pub.tipo FROM (publicacao pub JOIN membros ON ((pub.id_membro = membros.id_membro))) WHERE ((pub.cluster IN (SELECT replica.id1 FROM replica)) OR (pub.cluster IN (SELECT replica.id2 FROM replica))) ORDER BY pub.cluster, membros.id_membro;


ALTER TABLE public.publicacoes_com_replica OWNER TO postgres;

SET search_path = versionado, pg_catalog;

--
-- Name: revista; Type: TABLE; Schema: versionado; Owner: postgres; Tablespace: 
--

CREATE TABLE revista (
    doi character varying,
    revista character varying,
    volume character varying,
    numero character varying,
    id_publicacao integer NOT NULL,
    versao integer
);


ALTER TABLE versionado.revista OWNER TO postgres;

SET search_path = public, pg_catalog;

--
-- Name: revista; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW revista AS
    SELECT revista.doi, revista.revista, revista.volume, revista.numero, revista.id_publicacao FROM versionado.revista, versao WHERE (revista.versao = versao.atual);


ALTER TABLE public.revista OWNER TO postgres;

SET search_path = versionado, pg_catalog;

--
-- Name: revista_aceito; Type: TABLE; Schema: versionado; Owner: postgres; Tablespace: 
--

CREATE TABLE revista_aceito (
    doi character varying,
    revista character varying,
    numero character varying,
    id_publicacao integer NOT NULL,
    versao integer
);


ALTER TABLE versionado.revista_aceito OWNER TO postgres;

SET search_path = public, pg_catalog;

--
-- Name: revista_aceito; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW revista_aceito AS
    SELECT revista_aceito.doi, revista_aceito.revista, revista_aceito.numero, revista_aceito.id_publicacao FROM versionado.revista_aceito, versao WHERE (revista_aceito.versao = versao.atual);


ALTER TABLE public.revista_aceito OWNER TO postgres;

--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE usuarios (
    md5 character varying(32),
    email character varying NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE usuarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuarios_id_seq OWNER TO postgres;

--
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usuarios_id_seq OWNED BY usuarios.id;


--
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usuarios_id_seq', 1, true);


SET search_path = versionado, pg_catalog;

--
-- Name: publicacao_id_publicacao_seq; Type: SEQUENCE; Schema: versionado; Owner: postgres
--

CREATE SEQUENCE publicacao_id_publicacao_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE versionado.publicacao_id_publicacao_seq OWNER TO postgres;

--
-- Name: publicacao_id_publicacao_seq; Type: SEQUENCE OWNED BY; Schema: versionado; Owner: postgres
--

ALTER SEQUENCE publicacao_id_publicacao_seq OWNED BY publicacao.id_publicacao;


--
-- Name: publicacao_id_publicacao_seq; Type: SEQUENCE SET; Schema: versionado; Owner: postgres
--

SELECT pg_catalog.setval('publicacao_id_publicacao_seq', 3317, true);


--
-- Name: resumo; Type: TABLE; Schema: versionado; Owner: postgres; Tablespace: 
--

CREATE TABLE resumo (
    id_publicacao integer NOT NULL,
    doi character varying,
    evento character varying,
    volume character varying,
    numero character varying,
    versao integer
);


ALTER TABLE versionado.resumo OWNER TO postgres;

--
-- Name: resumo_exp; Type: TABLE; Schema: versionado; Owner: postgres; Tablespace: 
--

CREATE TABLE resumo_exp (
    id_publicacao integer NOT NULL,
    doi character varying,
    evento character varying,
    volume character varying,
    versao integer
);


ALTER TABLE versionado.resumo_exp OWNER TO postgres;

SET search_path = public, pg_catalog;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rede ALTER COLUMN id SET DEFAULT nextval('grupo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuarios ALTER COLUMN id SET DEFAULT nextval('usuarios_id_seq'::regclass);


SET search_path = versionado, pg_catalog;

--
-- Name: id_publicacao; Type: DEFAULT; Schema: versionado; Owner: postgres
--

ALTER TABLE ONLY publicacao ALTER COLUMN id_publicacao SET DEFAULT nextval('publicacao_id_publicacao_seq'::regclass);


SET search_path = public, pg_catalog;

--
-- Data for Name: membrosrede; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY membrosrede (idgrupo, idlattes) FROM stdin;
\.


--
-- Data for Name: rede; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rede (id, nome, autor, visibilidade, xml, anoinicio, anofim) FROM stdin;
\.


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usuarios (md5, email, id) FROM stdin;
cabc35624bd7ec60dc0438e31e753045	lucas	1
\.


--
-- Data for Name: versao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY versao (atual) FROM stdin;
3
\.


SET search_path = versionado, pg_catalog;

--
-- Data for Name: adjacencia; Type: TABLE DATA; Schema: versionado; Owner: postgres
--

COPY adjacencia (membro1, membro2, colaboracao, versao) FROM stdin;
0	1	1	2
0	10	1	2
0	34	1	2
1	24	2	2
1	28	3	2
1	34	3	2
4	10	2	2
4	18	42	2
6	11	1	2
6	14	3	2
6	24	1	2
6	28	1	2
6	34	3	2
6	37	3	2
7	27	4	2
8	24	1	2
8	34	5	2
10	16	1	2
10	18	2	2
10	22	3	2
10	30	6	2
11	14	3	2
11	24	1	2
11	28	1	2
11	34	4	2
11	37	3	2
14	24	2	2
14	28	1	2
14	34	6	2
14	37	7	2
19	31	1	2
20	34	3	2
24	28	3	2
24	29	1	2
24	34	17	2
24	37	2	2
28	32	1	2
28	34	25	2
28	37	1	2
29	34	1	2
32	34	2	2
34	37	5	2
35	36	1	2
0	1	1	3
0	10	1	3
0	34	1	3
1	24	2	3
1	28	3	3
1	34	3	3
4	10	2	3
4	18	42	3
6	11	1	3
6	14	3	3
6	24	1	3
6	28	1	3
6	34	3	3
6	37	3	3
7	27	4	3
8	24	1	3
8	34	5	3
10	16	1	3
10	18	2	3
10	22	3	3
10	30	6	3
11	14	3	3
11	24	1	3
11	28	1	3
11	34	4	3
11	37	3	3
14	24	2	3
14	28	1	3
14	34	6	3
14	37	7	3
19	31	1	3
20	34	3	3
24	28	3	3
24	29	1	3
24	34	17	3
24	37	2	3
28	32	1	3
28	34	25	3
28	37	1	3
29	34	1	3
31	34	1	3
32	34	2	3
34	37	5	3
35	36	1	3
\.


--
-- Data for Name: capitulo; Type: TABLE DATA; Schema: versionado; Owner: postgres
--

COPY capitulo (livro, edicao, editora, volume, id_publicacao, versao) FROM stdin;
MPH Stumpf; DJ Balding; M. Girolami. (Org.). Handbook of Statistical Systems Biology. Chichester		John Wiley Sons, Ltd		1747	2
Frank Emmert-Streib; Matthias Dehmer. (Org.). Analysis of Microarray Data - A Network-Based Approach. 1ed.Weinheim		Wiley-VCH Verlag GmbH Co. KGaA	1	1748	2
Gustavo Lugo; Jomi Hübner. (Org.). Post-Procedings of the 2011 Workshop and School of Agent Systems, their Environment and Applications (WESAAC). 1ed.New York		IEEE	1	1797	2
G.P. Dimuro; A.C.R. Costa; J. Sichman; P. Tedesco; D. Adamati; J. Balsa; L. Antunes.. (Org.). Advances in Social Simulation, Post-Proceedings of the Brazilian Workshop on Social Simulation. 1ed.Los Alamitos		IEEE	1	1798	2
G.P. Dimuro; A.C.R. Costa; J. Sichman; P. Tedesco; D. Adamati; J. Balsa; L. Antunes. (Org.). Advances in Social Simulation, Post-Proceedings of the Brazilian Workshop on Social Simulation. 1ed.Los Alamitos		IEEE	1	1799	2
G.P. Dimuro; A.C.R. Costa; J. Sichman; P. Tedesco; D. Adamati; J. Balsa; L. Antunes. (Org.). Advances in Social Simulation, Post-Proceedings of the Brazilian Workshop on Social Simulation. 1ed.Los Alamitos		IEEE	1	1800	2
G.P. Dimuro; A.C.R. Costa; J. Sichman; P. Tedesco; D. Adamati; J. Balsa; L. Antunes. (Org.). Advances in Social Simulation, Post-Proceedings of the Brazilian Workshop on Social Simulation. 1ed.Los Alamitos		IEEE	1	1801	2
G.P. Dimuro; A.C.R. Costa; J. Sichman; P. Tedesco; D. Adamati; J. Balsa; L. Antunes. (Org.). Advances in Social Simulation, Post-Proceedings of the Brazilian Workshop on Social Simulation. 1ed.Los Alamitos		IEEE	1	1802	2
G.P. Dimuro; A.C.R. Costa; J. Sichman; P. Tedesco; D. Adamati; J. Balsa; L. Antunes. (Org.). Advances in Social Simulation, Post-Proceedings of the Brazilian Workshop on Social Simulation. 1ed.Los Alamitos		IEEE	1	1803	2
Gustavo Lugo; Jomi Hübner.. (Org.). Post-Procedings of the 2011 Workshop and School of Agent Systems, their Environment and Applications (WESAAC). 1ed.New York		IEEE	1	1804	2
Gustavo Lugo; Jomi Hubner. (Org.). Post-Procedings of the 2011 Workshop and School of Agent Systems, their Environment and Applications (WESAAC). 1ed.New York		IEEE	1	1805	2
D. F. Adamatti. (Org.). Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações - Artigos Selecionados das quatro primeiras edições. Rio Grande		Edigraf- Editora e Gráfica da Universidade Federal do Rio Grande	1	1806	2
D. F. Adamatti. (Org.). Analisando Trocas Sociais Baseadas em Personalidades Através de Cadeias de Markov Intervalares. Rio Grande		Edigraf- Editora e Gráfica da Universidade Federal do Rio Grande	1	1807	2
D.F. Adamatti. (Org.). Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações - Artigos Selecionados das quatro primeiras edições. Rio Grande		Edigraf- Editora e Gráfica da Universidade Federal do Rio Grande	1	1808	2
D.F. Adamatti. (Org.). Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações - Artigos Selecionados das quatro primeiras edições. 73ed.Rio Grande		Edigraf- Editora e Gráfica da Universidade Federal do Rio Grande	1	1809	2
		Edigraf- Editora e Gráfica da Universidade Federal do Rio Grande	1	1810	2
D.F. Adamatti. (Org.). Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações - Artigos Selecionados das quatro primeiras edições. Rio Grande		Edigraf- Editora e Gráfica da Universidade Federal do Rio Grande	1	1811	2
D.F. Adamatti. (Org.). Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações - Artigos Selecionados das quatro primeiras edições. Rio Grande		Edigraf- Editora e Gráfica da Universidade Federal do Rio Grande	1	1812	2
Botelho, S. S. C., Adamatti, D. and Rocha, L. A. O.. (Org.). Third Southern Conference on Computational Modeling (MCSUL), 2009 (Post-Proceedings, Revised Selected Papers). Los Alamitos		IEEE	1	1813	2
R. Trappl. (Org.). Cybernetics and Systems 2010 (Track: From Agent Theory to Agent Implementation AT2AI-7). 1ed.Vienna		OFAI	1	1814	2
Virginia Dignum. (Org.). Multiagent Systems - Semantics and Dynamics of Organization Models. 1ed.Hershey		IGI Global	1	1815	2
Sichman, J.; Noriega, P.; Padget, J.; Ossowski, S.. (Org.). Coordination, Organizations, Institutions and Norms in Multi-Agent Systems III. Revised selected papers of COIN Workshops 2007 (lecture Notes in Artificial Intelilgence). Berlin		Springer-Verlag	4870	1816	2
Matteo Baldoni;Tran Cao Son; M. Birna van Riemsdijk;Michael Winikoff. (Org.). Declarative Agent Languages and Technologies VI - DALT 2008 (LNCS 5397). Berlin		Springer	1	1817	2
Gustavo Gimenez-Lugo. (Org.). Agent Systems, their Environment and Applications (WESAAC), 2011 Workshop and School of. 1ed.Los Alamos		IEEE		1929	2
Graçaliz P. Dimuro; Diana F. Adamatti; Antonio C. R. Costa; Jaime S. Sichman; Helder Coelho; Patricia Tedesco; João Balsa; Gleifer V. Alves. (Org.). Post-Proceedings of the Brazilian Workshop on Social Simulation. 1ed.Los Alamitos		IEEE	1	1930	2
Graçaliz P. Dimuro; Diana F. Adamatti; Antonio C. R. Costa; Jaime S. Sichman; Helder Coelho; Patricia Tedesco; João Balsa; Gleifer V. Alves. (Org.). Post-Proceedings of the Brazilian Workshop on Social Simulation. 1ed.Los Alamitos		IEEE	1	1931	2
		Information Resources Management Association		1932	2
Marcos Gestal Pose; Daniel Rivero Cebrián. (Org.). Soft Computing Methods for Practical Environmental Solutions: Techniques and Studies		Information Science Reference		1933	2
Adamatti, D. .F.. (Org.). Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações - Artigos Selecionados das quatro primeiras edições. Rio Grande / RS		FURG	1	1934	2
Adamatti, D. .F.. (Org.). Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações - Artigos Selecionados das quatro primeiras edições. Rio Grande / RS		FURG	1	1935	2
David R.C. Hill; Alexandre Muzy;Bernard P. Zeigle. (Org.). Activity-Based Modeling and Simulation. 1ed.Paris - France		Presses Universitaires Blaise-Pascal	1	1936	2
J. Mattos, L. Rosa Jr, M. Pilla. (Org.). Desafios e Avanços em Computação: o estado da arte. 1ed.Pelotas RS		Editora e Gráfica Universitária	1	1937	2
Gustavo Lugo; Jomi Hübner. (Org.). Post-Procedings of the 2011 Workshop and School of Agent Systems, their Environment and Applications (WESAAC). 1ed.Los Alamitos		IEEE	1	2025	2
Gustavo Lugo; Jomi Hübner. (Org.). Post-Procedings of the 2011 Workshop and School of Agent Systems, their Environment and Applications (WESAAC). 1ed.Los Alamitos		IEEE	1	2026	2
G.P. Dimuro; A.C.R. Costa; J. Sichman; P. Tedesco; D. Adamati; J. Balsa; L. Antunes. (Org.). Advances in Social Simulation, Post-Proceedings of the Brazilian Workshop on Social Simulation. Los Alamitos		IEEE	1	2027	2
G.P. Dimuro; A.C.R. Costa; J. Sichman; P. Tedesco; D. Adamati; J. Balsa; L. Antunes. (Org.). Advances in Social Simulation, Post-Proceedings of the Brazilian Workshop on Social Simulation. Los Alamitos		IEEE	1	2028	2
G.P. Dimuro; A.C.R. Costa; J. Sichman; P. Tedesco; D. Adamati; J. Balsa; L. Antunes. (Org.). Advances in Social Simulation, Post-Proceedings of the Brazilian Workshop on Social Simulation. Los Alamitos		IEEE	1	2029	2
Simone André da Costa Cavalheiro; Luciana Foss; Marilton Sanchotene de Aguiar;Graçaliz Pereira Dimuro; Antônio Carlos da Rocha Costa. (Org.). Post-Proceedings of the Workshop-School on Theoretical Computer Science. 1ed.Los Alamitos		IEEE	1	2030	2
Simone André da Costa Cavalheiro; Luciana Foss; Marilton Sanchotene de Aguiar;Graçaliz Pereira Dimuro; Antônio Carlos da Rocha Costa. (Org.). Post-Proceedings of the Workshop-School on Theoretical Computer Science. 1ed.Los Alamitos		IEEE	1	2031	2
Simone André da Costa Cavalheiro; Luciana Foss; Marilton Sanchotene de Aguiar;Graçaliz Pereira Dimuro; Antônio Carlos da Rocha Costa. (Org.). Post-Proceedings of the Workshop-School on Theoretical Computer Science. 1ed.Los Alamitos		IEEE	1	2032	2
Simone André da Costa Cavalheiro; Luciana Foss; Marilton Sanchotene de Aguiar;Graçaliz Pereira Dimuro; Antônio Carlos da Rocha Costa. (Org.). Post-Proceedings of the Workshop-School on Theoretical Computer Science. 1ed.Los Alamitos		IEEE	1	2033	2
Simone André da Costa Cavalheiro; Luciana Foss; Marilton Sanchotene de Aguiar;Graçaliz Pereira Dimuro; Antônio Carlos da Rocha Costa. (Org.). Post-Proceedings of the Workshop-School on Theoretical Computer Science. 1ed.Los Alamitos		IEEE	1	2034	2
Simone André da Costa Cavalheiro; Luciana Foss; Marilton Sanchotene de Aguiar;Graçaliz Pereira Dimuro; Antônio Carlos da Rocha Costa. (Org.). Post-Proceedings of the Workshop-School on Theoretical Computer Science. 1ed.Los Alamitos		IEEE	1	2035	2
Simone André da Costa Cavalheiro; Luciana Foss; Marilton Sanchotene de Aguiar;Graçaliz Pereira Dimuro; Antônio Carlos da Rocha Costa. (Org.). Post-Proceedings 2011 Workshop-School on Theoretical Computer Science - WEIT 2011. 1ed.Los Alamitos		IEEE	1	2036	2
Simone André da Costa Cavalheiro; Luciana Foss; Marilton Sanchotene de Aguiar;Graçaliz Pereira Dimuro; Antônio Carlos da Rocha Costa. (Org.). Post-Proceedings of the Workshop-School on Theoretical Computer Science. 1ed.Los Alamitos		IEEE	1	2037	2
Simone André da Costa Cavalheiro; Luciana Foss; Marilton Sanchotene de Aguiar;Graçaliz Pereira Dimuro; Antônio Carlos da Rocha Costa. (Org.). Post-Proceedings of the Workshop-School on Theoretical Computer Science. 1ed.Los Alamitos		IEEE	1	2038	2
D. F. ADAMATTI. (Org.). Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações - Artigos Selecionados das quatro primeiras edições. Rio Grande		Edigraf- Editora e Gráfica da Universidade Federal do Rio Grande	1	2039	2
D. F. Adamatti. (Org.). Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações - Artigos Selecionados das quatro primeiras edições. Rio Grande		Edigraf- Editora e Gráfica da Universidade Federal do Rio Grande	1	2040	2
D. F. Adamatti. (Org.). Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações - Artigos Selecionados das quatro primeiras edições. Rio Grande		Edigraf- Editora e Gráfica da Universidade Federal do Rio Grande	1	2041	2
D. F. Adamatti. (Org.). Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações - Artigos Selecionados das quatro primeiras edições. Rio Grande		Edigraf- Editora e Gráfica da Universidade Federal do Rio Grande	1	2042	2
D. F. Adamatti. (Org.). Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações - Artigos Selecionados das quatro primeiras edições. Rio Grande		Edigraf- Editora e Gráfica da Universidade Federal do Rio Grande	1	2043	2
Botelho, S. S. C., Adamatti, D. and Rocha, L. A. O.. (Org.). Third Southern Conference on Computational Modeling (MCSUL), 2009 (Post-Proceedings, Revised Selected Papers). Los Alamitos		IEEE	1	2044	2
Virginia Dignum. (Org.). Handbook of Research on Multi-Agent Systems: Semantics and Dynamics of Organizational Models. Hershey		IGI Global	1	2045	2
Sichman, J.; Padget, J.; Ossowski, S.; Noriega, P.. (Org.). Coordination, Organizations, Institutions and Norms in Multi-Agent Systems III. Revised selected papers of COIN Workshops 2007 (Lecture Notes in Artificial Intelligence Series). Springer-Verlag		Berlin	4870	2046	2
Adriano C. Machado Pereira; Gisele Lobo Pappa. Marco Winckler; Roberta Lima Gomes.. (Org.). Tópicos em sistemas colaborativos, multimídia, web e banco de dados.. Porto Alegre		Sociedade Brasileira de Computação	1	2110	2
Adamatti, D. .F... (Org.). Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações - Artigos Selecionados das quatro primeiras edições.. Rio Grande			1	2120	2
Ying-ping Chen,; Meng-Hiot Lim. (Org.). Linkage in evolutionary computation. Studies in Computational Intelligence. New York		Springer	157	2121	2
ROCHA, L. A. O. (Org.) ; Botelho, S.S.C. (Org.) ; ADAMATTI, D. F. (Org.). (Org.). Simpósio de Modelagem Computacional do Sul. 1ed		IEEE Xplore	1	2143	2
ROCHA, L. A. O. (Org.) ; Botelho, S.S.C. (Org.) ; ADAMATTI, D. F. (Org.). (Org.). Simpósio de Modelagem Computacional do Sul. 1ed		IEEE Xplore	1	2144	2
		IEEE Xplore	1	2145	2
Osvaldo L. L. de Moraes. (Org.). Meteorologia e Poluiçãp Atmosférica: Teoria, Experimentos e Simulação. 1ed.Santa Maria		FACOS-UFSM	1	2165	2
Ricardo Reis. (Org.). Advanced Topics on VLSI Design. 1ed.Porto Alegre		Instituto de Informatica da UFRGS		2190	2
J. Mattos, L. Rosa Jr.; M. Pilla. (Org.). Desafios e Avanços em Computação: o Estado da Arte. Pelotas, RS		Editora e Gráfica Universitária		2191	2
Hanafiah Yussof. (Org.). Robot Localization and Map Building. Vienna, Austria		Intech	19	2211	2
		InTech		2281	2
		InTech		2282	2
		InTech		2283	2
		iConcept Press	1	2327	2
			1	2328	2
ROCHA, L. A. O. ,Botelho, S.S.C. ,ADAMATTI, D. F.. (Org.). Simpósio de Modelagem Computacional do Sul		IEEE Xplore	1	2329	2
ROCHA, L. A. O. ,Botelho, S.S.C. ,ADAMATTI, D. F.. (Org.). Simpósio de Modelagem Computacional do Sul			1	2330	2
		IEEE Xplore		2331	2
MPH Stumpf; DJ Balding; M. Girolami. (Org.). Handbook of Statistical Systems Biology. Chichester		John Wiley Sons, Ltd		2436	3
Frank Emmert-Streib; Matthias Dehmer. (Org.). Analysis of Microarray Data - A Network-Based Approach. 1ed.Weinheim		Wiley-VCH Verlag GmbH Co. KGaA	1	2437	3
Gustavo Lugo; Jomi Hübner. (Org.). Post-Procedings of the 2011 Workshop and School of Agent Systems, their Environment and Applications (WESAAC). 1ed.New York		IEEE	1	2496	3
G.P. Dimuro; A.C.R. Costa; J. Sichman; P. Tedesco; D. Adamati; J. Balsa; L. Antunes.. (Org.). Advances in Social Simulation, Post-Proceedings of the Brazilian Workshop on Social Simulation. 1ed.Los Alamitos		IEEE	1	2497	3
G.P. Dimuro; A.C.R. Costa; J. Sichman; P. Tedesco; D. Adamati; J. Balsa; L. Antunes. (Org.). Advances in Social Simulation, Post-Proceedings of the Brazilian Workshop on Social Simulation. 1ed.Los Alamitos		IEEE	1	2498	3
G.P. Dimuro; A.C.R. Costa; J. Sichman; P. Tedesco; D. Adamati; J. Balsa; L. Antunes. (Org.). Advances in Social Simulation, Post-Proceedings of the Brazilian Workshop on Social Simulation. 1ed.Los Alamitos		IEEE	1	2499	3
G.P. Dimuro; A.C.R. Costa; J. Sichman; P. Tedesco; D. Adamati; J. Balsa; L. Antunes. (Org.). Advances in Social Simulation, Post-Proceedings of the Brazilian Workshop on Social Simulation. 1ed.Los Alamitos		IEEE	1	2500	3
G.P. Dimuro; A.C.R. Costa; J. Sichman; P. Tedesco; D. Adamati; J. Balsa; L. Antunes. (Org.). Advances in Social Simulation, Post-Proceedings of the Brazilian Workshop on Social Simulation. 1ed.Los Alamitos		IEEE	1	2501	3
G.P. Dimuro; A.C.R. Costa; J. Sichman; P. Tedesco; D. Adamati; J. Balsa; L. Antunes. (Org.). Advances in Social Simulation, Post-Proceedings of the Brazilian Workshop on Social Simulation. 1ed.Los Alamitos		IEEE	1	2502	3
Gustavo Lugo; Jomi Hübner.. (Org.). Post-Procedings of the 2011 Workshop and School of Agent Systems, their Environment and Applications (WESAAC). 1ed.New York		IEEE	1	2503	3
Gustavo Lugo; Jomi Hubner. (Org.). Post-Procedings of the 2011 Workshop and School of Agent Systems, their Environment and Applications (WESAAC). 1ed.New York		IEEE	1	2504	3
D. F. Adamatti. (Org.). Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações - Artigos Selecionados das quatro primeiras edições. Rio Grande		Edigraf- Editora e Gráfica da Universidade Federal do Rio Grande	1	2505	3
D. F. Adamatti. (Org.). Analisando Trocas Sociais Baseadas em Personalidades Através de Cadeias de Markov Intervalares. Rio Grande		Edigraf- Editora e Gráfica da Universidade Federal do Rio Grande	1	2506	3
D.F. Adamatti. (Org.). Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações - Artigos Selecionados das quatro primeiras edições. Rio Grande		Edigraf- Editora e Gráfica da Universidade Federal do Rio Grande	1	2507	3
D.F. Adamatti. (Org.). Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações - Artigos Selecionados das quatro primeiras edições. 73ed.Rio Grande		Edigraf- Editora e Gráfica da Universidade Federal do Rio Grande	1	2508	3
		Edigraf- Editora e Gráfica da Universidade Federal do Rio Grande	1	2509	3
D.F. Adamatti. (Org.). Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações - Artigos Selecionados das quatro primeiras edições. Rio Grande		Edigraf- Editora e Gráfica da Universidade Federal do Rio Grande	1	2510	3
D.F. Adamatti. (Org.). Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações - Artigos Selecionados das quatro primeiras edições. Rio Grande		Edigraf- Editora e Gráfica da Universidade Federal do Rio Grande	1	2511	3
Botelho, S. S. C., Adamatti, D. and Rocha, L. A. O.. (Org.). Third Southern Conference on Computational Modeling (MCSUL), 2009 (Post-Proceedings, Revised Selected Papers). Los Alamitos		IEEE	1	2512	3
R. Trappl. (Org.). Cybernetics and Systems 2010 (Track: From Agent Theory to Agent Implementation AT2AI-7). 1ed.Vienna		OFAI	1	2513	3
Virginia Dignum. (Org.). Multiagent Systems - Semantics and Dynamics of Organization Models. 1ed.Hershey		IGI Global	1	2514	3
Sichman, J.; Noriega, P.; Padget, J.; Ossowski, S.. (Org.). Coordination, Organizations, Institutions and Norms in Multi-Agent Systems III. Revised selected papers of COIN Workshops 2007 (lecture Notes in Artificial Intelilgence). Berlin		Springer-Verlag	4870	2515	3
Matteo Baldoni;Tran Cao Son; M. Birna van Riemsdijk;Michael Winikoff. (Org.). Declarative Agent Languages and Technologies VI - DALT 2008 (LNCS 5397). Berlin		Springer	1	2516	3
Gustavo Gimenez-Lugo. (Org.). Agent Systems, their Environment and Applications (WESAAC), 2011 Workshop and School of. 1ed.Los Alamos		IEEE		2656	3
Graçaliz P. Dimuro; Diana F. Adamatti; Antonio C. R. Costa; Jaime S. Sichman; Helder Coelho; Patricia Tedesco; João Balsa; Gleifer V. Alves. (Org.). Post-Proceedings of the Brazilian Workshop on Social Simulation. 1ed.Los Alamitos		IEEE	1	2657	3
Graçaliz P. Dimuro; Diana F. Adamatti; Antonio C. R. Costa; Jaime S. Sichman; Helder Coelho; Patricia Tedesco; João Balsa; Gleifer V. Alves. (Org.). Post-Proceedings of the Brazilian Workshop on Social Simulation. 1ed.Los Alamitos		IEEE	1	2658	3
		Information Resources Management Association		2659	3
Marcos Gestal Pose; Daniel Rivero Cebrián. (Org.). Soft Computing Methods for Practical Environmental Solutions: Techniques and Studies		Information Science Reference		2660	3
Adamatti, D. .F.. (Org.). Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações - Artigos Selecionados das quatro primeiras edições. Rio Grande / RS		FURG	1	2661	3
Adamatti, D. .F.. (Org.). Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações - Artigos Selecionados das quatro primeiras edições. Rio Grande / RS		FURG	1	2662	3
David R.C. Hill; Alexandre Muzy;Bernard P. Zeigle. (Org.). Activity-Based Modeling and Simulation. 1ed.Paris - France		Presses Universitaires Blaise-Pascal	1	2663	3
J. Mattos, L. Rosa Jr, M. Pilla. (Org.). Desafios e Avanços em Computação: o estado da arte. 1ed.Pelotas RS		Editora e Gráfica Universitária	1	2664	3
Gustavo Lugo; Jomi Hübner. (Org.). Post-Procedings of the 2011 Workshop and School of Agent Systems, their Environment and Applications (WESAAC). 1ed.Los Alamitos		IEEE	1	2814	3
Gustavo Lugo; Jomi Hübner. (Org.). Post-Procedings of the 2011 Workshop and School of Agent Systems, their Environment and Applications (WESAAC). 1ed.Los Alamitos		IEEE	1	2815	3
G.P. Dimuro; A.C.R. Costa; J. Sichman; P. Tedesco; D. Adamati; J. Balsa; L. Antunes. (Org.). Advances in Social Simulation, Post-Proceedings of the Brazilian Workshop on Social Simulation. Los Alamitos		IEEE	1	2816	3
G.P. Dimuro; A.C.R. Costa; J. Sichman; P. Tedesco; D. Adamati; J. Balsa; L. Antunes. (Org.). Advances in Social Simulation, Post-Proceedings of the Brazilian Workshop on Social Simulation. Los Alamitos		IEEE	1	2817	3
G.P. Dimuro; A.C.R. Costa; J. Sichman; P. Tedesco; D. Adamati; J. Balsa; L. Antunes. (Org.). Advances in Social Simulation, Post-Proceedings of the Brazilian Workshop on Social Simulation. Los Alamitos		IEEE	1	2818	3
Simone André da Costa Cavalheiro; Luciana Foss; Marilton Sanchotene de Aguiar;Graçaliz Pereira Dimuro; Antônio Carlos da Rocha Costa. (Org.). Post-Proceedings of the Workshop-School on Theoretical Computer Science. 1ed.Los Alamitos		IEEE	1	2819	3
Simone André da Costa Cavalheiro; Luciana Foss; Marilton Sanchotene de Aguiar;Graçaliz Pereira Dimuro; Antônio Carlos da Rocha Costa. (Org.). Post-Proceedings of the Workshop-School on Theoretical Computer Science. 1ed.Los Alamitos		IEEE	1	2820	3
Simone André da Costa Cavalheiro; Luciana Foss; Marilton Sanchotene de Aguiar;Graçaliz Pereira Dimuro; Antônio Carlos da Rocha Costa. (Org.). Post-Proceedings of the Workshop-School on Theoretical Computer Science. 1ed.Los Alamitos		IEEE	1	2821	3
Simone André da Costa Cavalheiro; Luciana Foss; Marilton Sanchotene de Aguiar;Graçaliz Pereira Dimuro; Antônio Carlos da Rocha Costa. (Org.). Post-Proceedings of the Workshop-School on Theoretical Computer Science. 1ed.Los Alamitos		IEEE	1	2822	3
Simone André da Costa Cavalheiro; Luciana Foss; Marilton Sanchotene de Aguiar;Graçaliz Pereira Dimuro; Antônio Carlos da Rocha Costa. (Org.). Post-Proceedings of the Workshop-School on Theoretical Computer Science. 1ed.Los Alamitos		IEEE	1	2823	3
Simone André da Costa Cavalheiro; Luciana Foss; Marilton Sanchotene de Aguiar;Graçaliz Pereira Dimuro; Antônio Carlos da Rocha Costa. (Org.). Post-Proceedings of the Workshop-School on Theoretical Computer Science. 1ed.Los Alamitos		IEEE	1	2824	3
Simone André da Costa Cavalheiro; Luciana Foss; Marilton Sanchotene de Aguiar;Graçaliz Pereira Dimuro; Antônio Carlos da Rocha Costa. (Org.). Post-Proceedings 2011 Workshop-School on Theoretical Computer Science - WEIT 2011. 1ed.Los Alamitos		IEEE	1	2825	3
Simone André da Costa Cavalheiro; Luciana Foss; Marilton Sanchotene de Aguiar;Graçaliz Pereira Dimuro; Antônio Carlos da Rocha Costa. (Org.). Post-Proceedings of the Workshop-School on Theoretical Computer Science. 1ed.Los Alamitos		IEEE	1	2826	3
Simone André da Costa Cavalheiro; Luciana Foss; Marilton Sanchotene de Aguiar;Graçaliz Pereira Dimuro; Antônio Carlos da Rocha Costa. (Org.). Post-Proceedings of the Workshop-School on Theoretical Computer Science. 1ed.Los Alamitos		IEEE	1	2827	3
D. F. ADAMATTI. (Org.). Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações - Artigos Selecionados das quatro primeiras edições. Rio Grande		Edigraf- Editora e Gráfica da Universidade Federal do Rio Grande	1	2828	3
D. F. Adamatti. (Org.). Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações - Artigos Selecionados das quatro primeiras edições. Rio Grande		Edigraf- Editora e Gráfica da Universidade Federal do Rio Grande	1	2829	3
D. F. Adamatti. (Org.). Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações - Artigos Selecionados das quatro primeiras edições. Rio Grande		Edigraf- Editora e Gráfica da Universidade Federal do Rio Grande	1	2830	3
D. F. Adamatti. (Org.). Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações - Artigos Selecionados das quatro primeiras edições. Rio Grande		Edigraf- Editora e Gráfica da Universidade Federal do Rio Grande	1	2831	3
D. F. Adamatti. (Org.). Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações - Artigos Selecionados das quatro primeiras edições. Rio Grande		Edigraf- Editora e Gráfica da Universidade Federal do Rio Grande	1	2832	3
Botelho, S. S. C., Adamatti, D. and Rocha, L. A. O.. (Org.). Third Southern Conference on Computational Modeling (MCSUL), 2009 (Post-Proceedings, Revised Selected Papers). Los Alamitos		IEEE	1	2833	3
Virginia Dignum. (Org.). Handbook of Research on Multi-Agent Systems: Semantics and Dynamics of Organizational Models. Hershey		IGI Global	1	2834	3
Sichman, J.; Padget, J.; Ossowski, S.; Noriega, P.. (Org.). Coordination, Organizations, Institutions and Norms in Multi-Agent Systems III. Revised selected papers of COIN Workshops 2007 (Lecture Notes in Artificial Intelligence Series). Springer-Verlag		Berlin	4870	2835	3
Adriano C. Machado Pereira; Gisele Lobo Pappa. Marco Winckler; Roberta Lima Gomes.. (Org.). Tópicos em sistemas colaborativos, multimídia, web e banco de dados.. Porto Alegre		Sociedade Brasileira de Computação	1	2913	3
Adamatti, D. .F... (Org.). Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações - Artigos Selecionados das quatro primeiras edições.. Rio Grande			1	2935	3
Ying-ping Chen,; Meng-Hiot Lim. (Org.). Linkage in evolutionary computation. Studies in Computational Intelligence. New York		Springer	157	2936	3
ROCHA, L. A. O. (Org.) ; Botelho, S.S.C. (Org.) ; ADAMATTI, D. F. (Org.). (Org.). Simpósio de Modelagem Computacional do Sul. 1ed		IEEE Xplore	1	2963	3
ROCHA, L. A. O. (Org.) ; Botelho, S.S.C. (Org.) ; ADAMATTI, D. F. (Org.). (Org.). Simpósio de Modelagem Computacional do Sul. 1ed		IEEE Xplore	1	2964	3
		IEEE Xplore	1	2965	3
Osvaldo L. L. de Moraes. (Org.). Meteorologia e Poluiçãp Atmosférica: Teoria, Experimentos e Simulação. 1ed.Santa Maria		FACOS-UFSM	1	2990	3
Ricardo Reis. (Org.). Advanced Topics on VLSI Design. 1ed.Porto Alegre		Instituto de Informatica da UFRGS		3030	3
J. Mattos, L. Rosa Jr.; M. Pilla. (Org.). Desafios e Avanços em Computação: o Estado da Arte. Pelotas, RS		Editora e Gráfica Universitária		3031	3
Hanafiah Yussof. (Org.). Robot Localization and Map Building. Vienna, Austria		Intech	19	3061	3
		InTech		3149	3
		InTech		3150	3
		InTech		3151	3
		iConcept Press	1	3197	3
			1	3198	3
ROCHA, L. A. O. ,Botelho, S.S.C. ,ADAMATTI, D. F.. (Org.). Simpósio de Modelagem Computacional do Sul		IEEE Xplore	1	3199	3
ROCHA, L. A. O. ,Botelho, S.S.C. ,ADAMATTI, D. F.. (Org.). Simpósio de Modelagem Computacional do Sul			1	3200	3
		IEEE Xplore		3201	3
\.


--
-- Data for Name: componente; Type: TABLE DATA; Schema: versionado; Owner: postgres
--

COPY componente (componente, vertice, versao) FROM stdin;
\.


--
-- Data for Name: conferencia; Type: TABLE DATA; Schema: versionado; Owner: postgres
--

COPY conferencia (volume, evento, id_publicacao, versao) FROM stdin;
	Simpósio Brasileiro de Redes Neurais, 2012, Curitiba. Proc. of the SBRN 2012	1749	2
	Brazilian Symposium on Artificial Intelligence, 2010, São Bernardo do Campo. Lecture Notes in Artificial Intelligence, subseries of Lecture Notes in Computer Science. Berlim: Springer-Verlag	1750	2
	Brazilian Symposium on Neural network, 2010, São Bernardo do Campo. 2010 Eleventh Brazilian Symposium on Neural Networks (SBRN 2010). California: Conference Publishing Services (CPS)	1751	2
9	Simposio Brasileiro de Automação Inteligente, 2009, Brasília. Anais do IX Simpósio Brasileiro de Automação Inteligente,	1752	2
	Computer Graphics International, 2008, Istanbul. Proceedings of Computer Graphics International	1753	2
U	Computer Graphics and Imaging - CGIM, 2011, Innsbruck/Austria. Proceedings of the 12th IASTED International Conference on Computer Graphics and Imaging - CGIM. Calgary/Canadá: ACTA Press	1758	2
	VIII Encontro Nacional de Inteligência Artificial - ENIA/CSBC, 2011, Natal. Anais do XXXI Congresso da Sociedade Brasileira de Computação - CSBC	1759	2
	X Simpósio Brasileiro de Automação Inteligente - SBAI, 2011, São João del-Rei/MG - Brasil. Anais do X Simpósio Brasileiro de Automação Inteligente - SBAI	1760	2
	26th Computer Graphics International Conference, 2008, Istambul , Turquia. Proceedings of the 26th Computer Graphics International Conference	1761	2
1	I Seminário Diálogos em Educação a Distância, 2012, Rio Grande. Seminário Diálogos em Educação a Distância. Rio Grande: SEAD-FURG	1763	2
	XIV Fórum de Estudos: Leituras de Paulo Freire, 2012, Erechim. Educação Popular e Transformação Social. Erechim: UFFS	1764	2
	XIV Fórum de Estudos: Leituras de Paulo Freire, 2012, Erechim. Educação Popular e Transformação Social. Erechim: UFFS	1765	2
	IX Seminário de Pesquisa em Educação da Região Sul - ANPED Sul, 2012, Caxias do Sul. A Pós-Graduação e as suas Interlocuções com a Educação Básica. Caxias do Sul	1766	2
	IV Congresso Internacional de Educação, Pesquisa e Gestão, 2012, Ponta Grossa. Políticas e Práticas Educacionais. Ponta Grossa	1767	2
	II Fórum Internacional sobre Prática Docente Universitária, 2012, Uberlândia. Planejamento e Avaliação no Contexto Glocal. Uberlandia	1768	2
	VI Seminário Nacional Diálogos com Paulo Freire, 2012, Santa Maria. Educação, cultura e resistências na sociedade contemporânea. Santa Maria	1769	2
	XIII Fórum de Estudos: Leituras de Paulo Freire, 2011, Santa Rosa - RS. XIII Fórum de Estudos: Leituras de Paulo Freire	1770	2
	XIII Fórum de Estudos: Leituras de Paulo Freire, 2011, Santa Rosa - RS. XIII Fórum de Estudos: Leituras de Paulo Freire	1771	2
	V Colóquio Internacional "Educação e Contemporaneidade", 2011, São Cristóvão. A Etnomatemática como Aporte às Práticas de Ensino na Educação de Jovens e Adultos. São Cristóvão	1772	2
	VII Congresso Internacional de Educação, 2011, São Leopoldo. Profissão Docente: Há Futuro para este Ofício?. São Leopoldo	1773	2
	I Fórum Internacional Sobre Prática Docente Universitária, 2011, Uberlânida. Inclusão Social e Tecnologias de Informação e Comunicação. Uberlândia	1774	2
	V Colóquio Internacional "Educação e Contemporaneidade", 2011, São Cristóvão. A Etnomatemática como Aporte às Práticas de Ensino na Educação de Jovens e Adultos. São Cristóvão	1775	2
	X Congresso Nacional de Educação - EDUCERE, 2011, Curitiba. Formação para mudanças no contexto da educação: políticas, representações sociais e práticas. Curitiba	1776	2
	X Congresso Nacional de Educação EDUCERE, 2011, Curitiba. Formação para mudanças no contexto da educação: políticas, representações sociais e práticas. Curitiba	1777	2
	X Congresso Nacional de Educação EDUCERE, 2011, Curitiba. Formação para mudanças no contexto da educação: políticas, representações sociais e práticas. Curitiba	1778	2
	V Seminário Diálogos com Paulo Freire, 2011, Pelotas. Das Práticas Escolares às Pedagogias das Marchas	1779	2
	V Escola Regional de Banco de Dados, 2009, Ijuí - RS. V Escola Regional de Banco de Dados. Ijuí - RS	1780	2
	Seminário de Informática, 2008, Torres - RS. Seminário de Informática	1781	2
1	BWSS 2012 - The Third Brazilian Workshop on Social Simulation, 2012, Curitiba. Anais do BWSS 2012. Porto Alegre: SBC	1818	2
1	BWSS 2012 - The Third Brazilian Workshop on Social Simulation, 2012, Curitiba. Anais do BWSS 2012. Porto Alegre: SBC	1819	2
1	BWSS 2012 - The Third Brazilian Workshop on Social Simulation, 2012, Curitiba. Anais do BWSS 2012. Porto Alegre: SBC	1820	2
1	II CBSF - Segundo Congresso Brasileiro de Sistemas Fuzzy, 2012, Natal. Anais do CBSF. Natal: UFRN	1821	2
1	Encontro Nacional de Inteligência Artificial - ENIA 2012, 2012, Curitiba. Anais do ENIA 2012. Porto Alegre: SBC	1822	2
1	WESAAC 2012 - VI Workshop-Escola de Sistemas de Agentes, seus Ambientes e Aplicações, 2012, Florianópolis. Anais do WESAAC 2012. Florianópolis: UFSC	1823	2
1	Workshop on Adaptive and Learning Agents - ALA 2012 / AAMAS 2012 -11th International Conference on Autonomous Agents and Multiagent Systems, 2012, Valencia, Espanha. Proceedings of AAMAS 2012 - ALA Workshop. Richland, South Carolina: IFAMAS	1824	2
1	WESAAC 2012 - Workshop-Escola de Sistemas de Agentes, seus Ambientes e Aplicações, 2012, Florianópolis. Anais do WESAAC 2012. Florianópolis: UFSC	1825	2
1	AMPLE@ECAI 2012 - 2nd International Workshop on Agent-based Modeling for Policy Engineering, European Conference on Artificial Intelligence, 2012, Montpellier, França. Proceedings of AMPLE@ECAI 2012. Montpellier: Université de Montpellier	1826	2
1	V Workshop-Escola de Sistemas de Agentes, seus Ambientes e Aplicações, 2011, Curitiba. Anais do WESAAC 2011. Curitiba: UTFPR	1827	2
1	WEIT 2011 - Workshop-Escola de Informática Teórica, 2011, Pelotas. Anais do WEIT 2011. Rio Grande: FURG	1828	2
1	WEIT 2011 - Workshop-Escola de Informática Teórica, 2011, Pelotas. Anais do WEIT 2011. Pelotas: UFPEL	1829	2
1	V Workshop-Escola de Sistemas de Agentes, seus Ambientes e Aplicações, 2011, Curitiba. Anais do WESAAC 2011. Curitiba: UTFPR	1830	2
1	WESAAC 2010: Workshop-Escola de Sistemas de Agentes, seus Ambientes e Aplicações, 2010, Rio Grande. Anais do WESAAC 2010. Porto Alegre: FURG	1831	2
1	WESAAC 2010: Workshop-Escola de Sistemas de Agentes, seus Ambientes e Aplicações, 2010, Rio Grande. Anais do WESACC 2010. Rio Grande: FURG	1832	2
1	WESAAC 2010: Workshop-Escola de Sistemas de Agentes, seus Ambientes e Aplicações, 2010, Rio Grande. Anais do WESAAC 2010. Rio Grande: FURG	1833	2
1	WESAAC 2010: Workshop-Escola de Sistemas de Agentes, seus Ambientes e Aplicações, 2010, Rio Grande. Anais do WESAAC 2010. Rio Grande: FURG	1834	2
1	WESAAC 2010: Workshop-Escola de Sistemas Multiagentes, seus Ambientes e Aplicações, 2010, Rio Grande. Anais do WESAAC 2010. Rio Grande: FURG	1835	2
627	The Multi-Agent Logics, Languages, and Organisations Federated Workshops (MALLOW 2010)/LAnguages, methodologies and Development tools for multi-agent systemS (LADS 2010), 2010, Lyon. Olivier Boissier, Amal El Fallah Seghrouchni, Salima Hassas and Nicolas Maudet (Eds.), MALLOW 2010 - The Multi-Agent Logics, Languages, and Organisations Federated Workshops, CEUR-WS Workshop Proceedings Series. Aachen: Sun SITE Central Europe/ RWTH Aachen University/Tilburg University	1836	2
627	The Multi-Agent Logics, Languages, and Organisations Federated Workshops (MALLOW 2010)/Workshop on Multi-Agent Systems and Simulation (MASS 2010), 2010, Lyon. Olivier Boissier, Amal El Fallah Seghrouchni, Salima Hassas and Nicolas Maudet (Eds.), MALLOW 2010 - The Multi-Agent Logics, Languages, and Organisations Federated Workshops, CEUR-WS Workshop Proceedings Series. Aachen: Sun SITE Central Europe/ RWTH Aachen University/Tilburg University	1837	2
1	V Workshop on MSc Dissertation and PhD Thesis in Artificial Intelligence, 2010, São Bernardo do Campo. Anais do V Workshop on MSc Dissertation and PhD Thesis in Artificial Intelligence/Joint Conference SBIA/SBRN/JRI 2010. Porto Alegre: SBC	1838	2
1	Second Brazilian Workshop on Social Simulation (BWSS 2010) at Joint Conferences XX SBIA/XI SBRN/IV JRI, 2010, São Bernardo do Campo. (P. T. Aquino Junior, Ed.) Workshop Proceedings/Joint Conference 2010. Porto Alegre: SBC	1839	2
1	Second Brazilian Workshop on Social Simulation - BWSS 2010 at Joint Conference SBIA/SBRN/JRI 2010, 2010, São Bernardo do Campo. (P. T. Aquino Junior, Ed.) Workshop Proceedings/Joint Conference 2010. Porto Alegre: SBC	1840	2
1	Congresso Brasileiro de Sistemas Fuzzy, 2010, Sorocaba. Anais do CBSF 2010. São Carlos: UFSCar	1841	2
1	Second Brazilian Workshop on Social Simulation (BWSS 2010) at Joint Conferences XX SBIA/XI SBRN/IV JRI, 2010, São Bernardo do Campo. (P. T. Aquino Junior, Ed.) Workshop Proceedings/Joint Conference 2010. Porto Alegre: SBC	1842	2
6433	12th Ibero-American Conference on AI, 2010, Bahia Blanca. Angel Morales and Guillerno Simari (Eds.) Advances in Artificial Inteligence - IBERAMIA 2010, Lecture Notes In Artificial Intelligence. Berlin: Springer	1843	2
1	INFORUM - Simpósio de Informática, 2010, Braga. INFORUM Proceedings. Braga: Universidade do Minho	1844	2
1	Computability in Europe 2009: Mathematical Theory and Computational Practice, 2009, Heidelberg. Proceedings of CiE 2009. Heidelberg: Universität Heidelberg	1845	2
1	V Simpósio Brasileiro de Sistemas de Informação, 2009, Brasília. Anais do V Simpósio Brasileiro de Sistemas de Informação. Porto Alegre: SBC	1846	2
1	14th Portuguese Conference on Artificial Intelligence - EPIA'2009/Social Simulation and Modelling - SSM, 2009, 2009, Aveiro. L.S. Lopes, N. Lau, P. Mariano, L.M. Rocha (Eds.) New Trends in Artificial Intelligence. Aveiro: Universidade de Aveiro	1847	2
1	14th Portuguese Conference on Artificial Intelligence - EPIA'2009/Multi-Agent Systems: Theory and Applications - MASTA 2009, 2009, Aveiro. L.S. Lopes, N. Lau, P. Mariano, L.M. Rocha (Eds.) New Trends in Artificial Intelligence. Aveiro: Universidade de Aveiro	1848	2
1	14th Portuguese Conference on Artificial Intelligence - EPIA'2009/Social Simulation and Modelling - SSM 2009, 2009, Aveiro. L.S. Lopes, N. Lau, P. Mariano, L.M. Rocha (Eds.) New Trends in Artificial Intelligence. Aveiro: Universidade de Aveiro	1849	2
1	14th Portuguese Conference on Artificial Intelligence - EPIA'2009/Social Simulation and Modelling - SSM 2009, 2009, Aveiro. Proceedings of EPIA 2009. Aveiro, Portugal: APPIA/Universidade de Aveiro	1850	2
1	3rd Southern Conference on Computational Modeling, 2009, Rio Grande. Proceedings of MCSUL 2009. Rio Grande: FURG	1851	2
1	Fourth Conference on Computability in Europe: Logic and Theory of Algorithms, 2008, Atenas. Logic and Theory of Algorithms, Proceedings of CiE 2008. Atenas: Univ. Athens	1852	2
1	XXXIV Conferência Latinoamericano de Informática, 2008, Buenos Aires. Anales CLEI 2008. Buenos Aires: SADIO	1853	2
1	1st Brazilian Workshop on Social Simulation, 2008, Salvador. Proceedings of the BWSS 2008. Porto Alegre: SBC	1854	2
1	Workshop-Escola de Sistemas de Agentes para Ambientes Colaborativos	1855	2
5249	19th Brazilian Symposium on Artificial Intelligence, 2008, Salvador. G. Zaverucha and A. L. Costa (Eds.) Advances in Artificial Intelligence - SBIA 2008 Proceedings (Lecture Notes in Artificial Intelligence). Berlin: Springer	1856	2
1	Congresso de Matemática Aplicada e Computacional, 2008, 2008, Belém. Anais do CNMAC 2008. Belém: SBMAC	1857	2
1	19th Brazilian Symposium on Artificial Intelligence - Workshop on Social Simulation (SBIA - BWSS 2008), 2008, Salvador. Proceedings of BWSS 2009. Porto Alegre: SBC	1858	2
1	SEGeT 2008 - V Simpósio de Excelência em Gestão e Tecnologia, 2008, Resende, RJ. Anais do SEGeT 2008 - V Simpósio de Excelência em Gestão e Tecnologia. Resende, RJ: Associação Educacional Dom Bosco	1859	2
1	Jornadas Chilenas de Computación 2008 - Workshop en Agentes y Sistemas Colaborativos, 2008, Punta Arenas. Anales de las Jornadas Chilenas de Computación 2008. Santiago, Chile: Sociedad Chilena de Computación	1860	2
1	BWSS 2008 - Brazilian Workshop on Social Simulation, 2008, Salvador. Proceedings of the BWSS 2008 - Brazilian Workshop on Social Simulation. Pelotas: UCPel/SBC	1861	2
	Simpósio Brasileiro de Sistemas Elétricos, 2008, Belo Horizonte. Anais do SBSE 2008	1862	2
	Congresso Brasileiro de Automática, 2008, 2008, Juiz de Fora. Anais eletrônicos do CBA 2008	1863	2
	LARS 2008 - 5º Simpósio Latino-Americano de Robótica, 2008, Salvador/Brasil. Anais do 5º Simpósio Latino-Americano de Robótica	1864	2
	2012 IEEE Third Latin American Symposium on Circuits and Systems (LASCAS), 2012, Playa del Carmen. Proceedings of 2012 IEEE Third Latin American Symposium on Circuits and Systems (LASCAS)	1867	2
	Simposio Sul de Microeletronica - SIM 2012, 2012, Sao Miguel das Missoes. Anais do Simposio Sul de Microeletronica - SIM 2012	1868	2
	Simposio Sul de Microeletronica - SIM 2012, 2012, Sao Miguel das Missoes. Anais do Simposio Sul de Microeletronica - SIM 2012	1869	2
	Simposio Sul de Microeletronica - SIM 2012, 2012, Sao Miguel das Missoes. Anais do Simposio Sul de Microeletronica - SIM 2012	1870	2
	SForum - The 12th Microelectronics Students Forum, 2012, Brasilia. SForum - The 12th Microelectronics Students Forum	1871	2
	SForum - The 12th Microelectronics Students Forum, 2012, Brasilia. SForum - The 12th Microelectronics Students Forum	1872	2
	SIM 2011, 2011, Porto Alegre. SIM 2011	1873	2
	XVI Iberchip Workshop, 2010, Foz do Iguaçu. XVI Iberchip Workshop	1874	2
	SIM 2010, 2010, Porto Alegre. SIM 2010	1875	2
	XXIV CRICTE, 2010, Rio Grande. XXIV CRICTE - Anais	1876	2
	XXIV CRICTE, 2010, Rio Grande. XXIV CRICTE - Anais	1877	2
	XXIV CRICTE, 2010, Rio Grande. XXIV CRICTE - Anais	1878	2
	DATE 2009, 2009, Nice - França. DATE Proceedings	1879	2
	LATW, 2009, Buzios. IEEE Digital Library - IEEE Xplore IEEE Catalog Number: CFP09LAT Library of Congress: 2009901807	1880	2
	24th IEEE International Symposium on Defect and Fault Tolerance in VLSI Systems, 2009, Chicago. Proceeding of 24th IEEE International Symposium on Defect and Fault Tolerance in VLSI Systems	1881	2
	IWS09 Iberchip XV Workshop, 2009, Buenos Aires. Anais of Iberchip XV Workshop 2009	1882	2
	SIM 2009, 2008, Bento Gonçalves. Proceedings of SIM 2009	1883	2
	DECIDE 2008, 2008, Mexico. Proceedings of DECIDE 2008	1884	2
14	Information Control Problems in Manufacturing, 2012, BUCHAREST. 14th IFAC Symposium on Information Control Problems in Manufacturing	1887	2
1	International Conference on Offshore and Marine Technology: Science and Innovation, 2012, Rio Grande. Proceedings of First International Conference on Offshore and Marine Technology: Science and Innovation	1888	2
1	The Sixth International Conference on Mobile Ubiquitous Computing, Systems, Services and Technologies, 2012, Barcelona. The Sixth International Conference on Mobile Ubiquitous Computing, Systems, Services and Technologies. Sao Diego: Elsevier	1889	2
1	IX - Congresso Brasileiro de Ensino Superior a Distância, 2012, Recife. IX - Congresso Brasileiro de Ensino Superior a Distância	1890	2
1	Sixth World Congress on Engineering Asset Management (WCEAM2011), 2011, Cincinnati. Sixth World Congress on Engineering Asset Management (WCEAM2011)	1891	2
	1st IFAC Workshop on Advanced Maintenance Engineering, Services and Technology - IFAC A-MEST'10, 2010, 2010, Lisboa. Proceedings of the 1st IFAC Workshop on Advanced Maintenance Engineering, Services and Technology - IFAC A-MEST'10, 2010	1892	2
	12th Brazilian Workshop on Real-Time and Embedded Systems, 2010, Gramado. . Anais do 12th Brazilian Workshop on Real-Time and Embedded Systems	1893	2
	14º Congresso Internacional e Exposição Sul-Americana de Automação, Sistemas e Instrumentação, 2010, 2010, São Paulo. Anais do Brazil Automation ISA 2010	1894	2
1	World Congress on Engineering Asset Management 2009, 2009, Athens. WCEAM2009 - World Congress on Engineering Asset Management 2009. London: Springer-Verlag London Ltd	1895	2
1	The Modern Information Technology in the Innovation Processes of the Industrial Enterprises - MITIP2009, 2009, Bergamo. 11th International Conference on The Modern Information Technology in the Innovation Processes of the Industrial Enterprises. Bergamo: Università degli Studi di Bergamo	1896	2
	6º Seminário de Eletrônica de Potência e Controle, 2012, Santa Maria. 6. Seminário de Eletrônica de Potência e Controle - SEPOC. Santa Maria	1899	2
	2012 Sixth IEEE/PES Transmission and Distribution: Latin America Conference and Exposition (TD-LA), 2012, Montevideo. Proceedings of the 2012 Sixth IEEE/PES Transmission and Distribution: Latin America Conference and Exposition (TD-LA)	1900	2
	2012 Sixth IEEE/PES Transmission and Distribution: Latin America Conference and Exposition (TD-LA), 2012, Montevideo. Proceedings of the 2012 Sixth IEEE/PES Transmission and Distribution: Latin America Conference and Exposition (TD-LA)	1901	2
	2012 Sixth IEEE/PES Transmission and Distribution: Latin America Conference and Exposition (TD-LA), 2012, Montevideo. Proceedings of the 2012 Sixth IEEE/PES Transmission and Distribution: Latin America Conference and Exposition (TD-LA)	1902	2
	XIX Congresso Brasileiro de Automática, CBA 2012, 2012, Campina Grande. Anais do XIX Congresso Brasileiro de Automática, CBA 2012	1903	2
	XIX Congresso Brasileiro de Automática, CBA 2012, 2012, Campina Grande. Anais do XIX Congresso Brasileiro de Automática, CBA 2012	1904	2
	XIX Congresso Brasileiro de Automática, CBA 2012, 2012, Campina Grande. Anais do XIX Congresso Brasileiro de Automática, CBA 2012	1905	2
01	SBCCI 2010, 2010, São Paulo. SBCCI'10 Proceedings of the 23rd symposium on Integrated circuits and system design. New York: ACM	1906	2
	25th South Symposium on Microelectronics, 2010, Pelotas. Anais do SIM 2010. Porto Alegre: EDIPUCRS	1907	2
01	Fault-Tolerant Distributed Algorithms on VLSI Chips, 2009, Dagstuhl. Dagstuhl Seminar Proceedings. Dagstuhl: Schloss Dagstuhl - Leibniz-Zentrum fuer Informatik, Germany	1908	2
01	3rd International Conference on Design and Technology of Integrated Systems in Nanoscale Era, 2008, DTIS 2008., 2008, Tozeur. Proceedings of DTIS 2008	1909	2
01	Joint 6th International IEEE Northeast Workshop on Circuits and Systems and TAISA Conference, 2008. NEWCAS-TAISA 2008., 2008, Montreal. Proceedins of NEWCAS-TAISA 2008	1910	2
01	51st Midwest Symposium on Circuits and Systems, 2008. MWSCAS 2008., 2008, Knoxville. Proceedings of MWSCAS 2008	1911	2
01	15th International Conference on Electronics, Circuits and Systems, 2008. ICECS 2008., 2008, St. Julien's. Proceedings of ICECS 2008	1912	2
01	15th International Conference on Electronics, Circuits and Systems, 2008. ICECS 2008., 2008, St. Julien's. Proceedings of ICECS 2008	1913	2
	Colloque National du GDR SoC-SiP, 2008, Paris. Colloque National du GDR SoC-SiP	1914	2
	GEOProcessing 2012, 2012, Valência / Espanha. GEOProcessing 2012. Valência / Espanha: IARIA	1938	2
	1o. Seminário Nacional de Inclusão Digital e Software Livre, 2012, Passo Fundo / RS. SENID 2012. Passo Fundo / RS: Editora UPF	1939	2
	Fourth International Conference on Networked Digital Technologies, 2012, Dubai / Emirados Árabes. NDT 2012 - Communications in Computer and Information Science (CCIS 7899) of Springer Lecture Notes Series. Berlin: Springer	1940	2
	Workshop-Escola de Sistemas de Agentes, seus Ambientes e Aplicações, 2012, Florianópolis / SC. WESAAC 2012. Florianópolis / SC: UFSC	1941	2
	Workshop de Desafios da Computação Aplicada à Educação, 2012, Curitiba / PR. Desafie - CSBC 2012. Curitiba / PR: SBC	1942	2
	Congresso Nacional de Diversidade e Inclusão, 2012, São José dos Campos / SP. CONADI 2012. São José dos Campos / SP: CONADI	1943	2
4	Seminário de Extensão Universitária da Região Sul, 2012, Rio Grande / RS. SEURS 2012. Rio Grande / RS: Editora FURG	1944	2
	II Congreso Internacional de Computación e Informática, 2012, Cidad del Carmen. CONACI 2012. Berlin: Springer	1945	2
	Seminário de Extensão Universitária da Região Sul, 2012, Rio Grande / RS. SEURS 2012. Rio Grande / RS: Editora FURG	1946	2
	Conferência Sul-Brasileira de Modelagem Computacional, 2012, Rio Grande / RS. MCSUL 2012. Rio Grande / RS: Editora FURG	1947	2
	Conferência Sul-Brasileira de Modelagem Computacional, 2012, Rio Grande / RS. MCSUL 2012. Rio Grande / RS: Editora FURG	1948	2
	Conferência Sul-Brasileira de Modelagem Computacional, 2012, Rio Grande / RS. MCSUL 2012. Rio Grande / RS: Editora FURG	1949	2
	Conferência Sul-Brasileira de Modelagem Computacional, 2012, Rio Grande / RS. MCSUL 2012. Rio Grande / RS: Editora FURG	1950	2
	Brazilian Workshop on Social Simulation, 2012, Curitiba. BWSS 2012. Los Alamos: IEEE	1951	2
	Brazilian Workshop on Social Simulation, 2012, Curitiba / PR. BWSS 2012. Los Alamos: IEEE	1952	2
	Conferência Sul-Brasileira de Modelagem Computacional, 2012, Rio Grande / RS. MCSUL 2012. Rio Grande / RS: Editora FURG	1953	2
	III Workshop de Computação Aplicada ao Meio Ambiente e ao Recursos Naturais, 2011, Natal / RN. WCAMA 2011. Porto Alegre / RS: CSBC	1954	2
	XI Congreso Iberoamericano de Extensión Universitaria, 2011, Santa Fé / Argentina. XI Congreso Iberoamericano de Extensión Universitaria. Santa Fé / Argentina: La Universidad Nacional del Litoral	1955	2
	Seminário de Extensão Universitária da Região Sul, 2011, Foz do Iguaçu / PR. SEUS 2011. Foz do Iguaçu / PR: Unioeste	1956	2
	Congresso Brasileiro de Extesão Universitária, 2011, Porto Alegre RS. CBEU 2011. Porto Alegre / RS: UFRGS	1957	2
	I Simpósio Brasileiro de Educação Inclusiva, 2011, Salvador / BA. I Simpósio Brasileiro de Educação Inclusiva. Salvador / BA: UFBA	1958	2
	II Seminário de Políticas Públicas e Educação: constituindo a cidadania?, 2011, Rio Grande RS. II Seminário de Políticas Públicas e Educação. Rio Grande RS: FURG	1959	2
	The Second International Conference on Networked Digital Technologies, 2010, Praga - República Tcheca. NDT 2010 - LNCS 7899. Heidelberg - Alemanha: Springer	1960	2
	Congresso Regional de Iniciação Científica e Tecnológica em Engenharia, 2010, Rio Grande / RS. CRICTE 2010. Rio Grande	1961	2
	Congresso Regional de Iniciação Científica e Tecnológica em Engenharia, 2010, Rio Grande / RS. CRICTE 2010. Rio Grande	1962	2
	Congresso Regional de Iniciação Científica e Tecnológica em Engenharia, 2010, Rio Grande / RS. CRICTE 2010. Rio Grande	1963	2
	MCSul 2010 - Simpósio de Modelagem Computacional do Sul, 2010, Rio Grande / RS. MCSul 2010. Rio Grande: FURG	1964	2
	MCSul 2010 - Simpósio de Modelagem Computacional do Sul, 2010, Rio Grande / RS. MCSul 2010. Rio Grande: FURG	1965	2
	Cargese Interdisciplinar Seminar 2009, 2009, Cargese. Modeling Simulation of Evolutionary Agents in Virtual Worlds	1966	2
	WCAMA - Workshop de Computação Aplicada ao Meio Ambiente, 2009, Bento Gonçalves. WCAMA	1967	2
02	International Conference on Computer Engineering and Technology, 2009. International Conference on Computer Engineering and Technolog	1968	2
	III Worshop Escola de Sistemas de Agentes para Ambientes Colaborativos, 2009, Caxias do Sul. WESAAC	1969	2
	MDEIS 2008 joint to 10th International Conference on Enterprise Information Systems (ICEIS 2008), 2008, Barcelona. The 4th International Workshop on Model-Driven Enterprise Information Systems	1970	2
	KRRSW 2008 joint to 5th European Semantic Web Conference (ESWC 2008), 2008, Tenerife. 1st International Workshop on Knowledge Reuse and Reengineering over the Semantic Web	1971	2
	SEMISH, 2008, Belém. Seminário Integrado de Software e Hardware (SEMISH 2008)	1972	2
	WESAAC, 2008, Santa Cruz do Sul. Workshop-Escola de Sistemas de Agentes para Ambientes Colaborativos	1973	2
	Seminário de Tecnologia da Informação Aplicada (STIA), 2008, Chapecó / SC. Seminário de Tecnologia da Informação Aplicada	1974	2
	Simpósio Brasileiro de Inteligência Artificial - Concurso de Teses e Dissertações em Inteligência Artificial, 2008, Salvador. SBIA/CTDIA2008	1975	2
	Congresso Sul Brasileiro de Computação, 2008, Criciúma / SC. Sulcomp 2008	1976	2
	Congresso Sul Brasileiro de Computação, 2008, Criciúma / SC. Sulcomp 2008	1977	2
	V Conferência Sul em Modelagem Computacional - MCSul 2012, 2012, Rio Grande. Anais da V Conferência Sul em Modelagem Computacional - VMCSul	1979	2
	X Simpósio Brasileiro de Automação Inteligentes, 2011, São João del-Rei, MG. Anais do X Simpósio Brasileiro de Automação Inteligente	1980	2
	2010 Fourth International Conference on Network and System Security, 2010, Melbourne. Proceedings of International Conference on Data and Knowledge Engineering 2010	1981	2
	1st International Conference on Applied Robotics for the Power Industry (CARPI), 2010, Montreal. Proceedings of 1st International Conference on Applied Robotics for the Power Industry (CARPI)	1982	2
9	Simpósio Brasileiro de Automação Inteligente - SBAI, 2009, Brasília. ANAIS DO IX SIMPÓSIO BRASILEIRO DE AUTOMAÇÃO INTELIGENTE"	1983	2
	Congresso Brasileiro de Automática, 2008, Juiz de Fora. Anais XVII do Congresso Brasileiro de Automática	1984	2
	Congresso Brasileiro de Automática, 2008, Juiz de Fora. Anais do XVII Congresso Brasileiro de Automática	1985	2
	5th IEEE Latin American Robotics Symposium, 2008, Salvador. Proceedings of 5th Latin American Robotics Symposium	1986	2
	5th IEEE Latin American Robotics Symposium, 2008, Salvador. Proceedings of 5th Latin American Robotics Symposium	1987	2
	Escola Regional de Banco de Dados, 2012, Curitiba. Anais da VIII Escola Regional de Banco de Dados	1989	2
	Escola Regional de Banco de Dados, 2012, Curitiba. Anais da VIII Escola Regional de Banco de Dados	1990	2
	XXXI International Conference of the Chilean Computer Science Society (SCCC), 2012, Valparaíso. Proceedings of the International Conference of the Chilean Computer Science Society	1991	2
	V Conferência Sul em Modelagem Computacional (MCSUL), 2012, Rio Grande. Anais da V Conferência Sul em Modelagem Computacional	1992	2
	XXXVIII Seminário Integrado de Software e Hardware - SEMISH, 2011, Natal. Anais do XXXI Congresso da Sociedade Brasileira de Computação	1993	2
	XXX International Conference of the Chilean Computer Science Society - SCCC, 2011, Curicó. Proceedings of the XXX International Conference of the Chilean Computer Science Society	1994	2
	IADIS International Conference WWW/Internet, 2011, Rio de Janeiro. Proceedings of the IADIS International Conference WWW/Internet 2011	1995	2
	XXIII Simpósio Brasileiro de Bancos de Dados - SBBD, 2008, Campinas. Anais do XXIII Simpósio Brasileiro de Bancos de Dados	1996	2
	IV Escola Regional de Bancos de Dados - ERBD, 2008, Florianópolis. Anais da IV Escola Regional de Bancos de Dados	1997	2
2	I Seminário Internacional de Educação em Ciências, 2011, Rio Grande. I SINTEC - Seminário Internacional de Educação em Ciências	1999	2
	1st International Conference on Applied Robotics for the Power Industry (CARPI), 2010, Montreal. 1st International Conference on Applied Robotics for the Power Industry (CARPI)	2000	2
	CBA 2010 - XVIII Congresso Brasileiro de Automática, 2010, Bonito. CBA 2010 - XVIII Congresso Brasileiro de Automática	2001	2
	Latin American Robotics Symposium and Intelligent Robotics Meeting, 2010, São Bernardo do Campo. Latin American Robotics Symposium and Intelligent Robotics Meeting	2002	2
	IX Simpósio Brasileiro de Automação Inteligente, 2009, Brasilia. IX Simpósio Brasileiro de Automação Inteligente	2003	2
	Rio Pipeline 2009 Conference and Exhibition, 2009, Rio de Janeiro. Rio Pipeline 2009 Conference and Exhibition	2004	2
	5th Latin American Robotics Symposium, 2008, Slavador. IEEE Latin American Robotics Symposium	2005	2
	Simpósio Brasileiro de Sistemas Elétricos, 2008, Belo Horizonte. Simpósio Brasileiro de Sistemas Elétricos	2006	2
	Congresso Brasileiro de Automática, 2008, Juiz de Fora. Congresso Brasileiro de Automática	2007	2
	XXIII ANPET - Congresso de Pesquisa e Ensino em Transportes, 2009, Vitória/ES. Panorama Naconal da Pesquisa em Transportes 2009	2008	2
	III Workshop de Computação Aplicada ao Meio Ambiente e ao Recursos Naturais, 2011, Natal / RN. III Workshop de Computação Aplicada ao Meio Ambiente e ao Recursos Naturais	2009	2
1	Workshop on Adaptive and Learning Agents - ALA 2012 / AAMAS 2012 -11th International Conference on Autonomous Agents and Multiagent Systems, 2012, Valência. Proceedings of AAMAS 2012 - ALA Workshop (Enda Howley, Peter Vrancx and Matt Knudson, eds.). Valência: IFAMAS	2047	2
1	WESAAC 2012 - VI Workshop-Escola de Sistemas de Agentes, seus Ambientes e Aplicações, 2012, Florianópolis. J.F. H ubner; A.A.F. Brandão; R. Silveira; J. Marchi (Eds.) Anais do WESAAC 2012. Florianópolis: UFSC	2048	2
1	WESAAC 2012 - VI Workshop-Escola de Sistemas de Agentes, seus Ambientes e Aplicações, 2012, Florianópolis. J.F. H ubner; A.A.F. Brandão; R. Silveira; J. Marchi (Eds.) Anais do WESAAC 2012. Florianópolis: UFSC	2049	2
1	WESAAC 2012 - VI Workshop-Escola de Sistemas de Agentes, seus Ambientes e Aplicações, 2012, Florianópolis. J.F. H ubner; A.A.F. Brandão; R. Silveira; J. Marchi (Eds.) Anais do WESAAC 2012. Florianópolis: UFSC	2050	2
1	VIII Congresso Nacional de Excelência em Gestão, 2012, Rio de Janeiro. Anais do VIII CNEG. Rio de Janeiro: UFF	2051	2
1	Encontro Nacional de Inteligência Artificial - ENIA 2012, 2012, Curitiba. Anais do ENIA 2012 - Proceedings of the Brazilian Conference on Intelligent Systems. Porto Alegre: SBC	2052	2
1	II CBSF - Segundo Congresso Brasileiro de Sistemas Fuzzy, 2012, Natal. Anais do CBSF. Natal: UFRN	2053	2
1	II CBSF - Segundo Congresso Brasileiro de Sistemas Fuzzy, 2012, Natal. Anais do CBSF. Natal: UFRN	2054	2
1	II CBSF - Segundo Congresso Brasileiro de Sistemas Fuzzy, 2012, Natal. Anais do CBSF. Natal: UFRN	2055	2
1	II CBSF - Segundo Congresso Brasileiro de Sistemas Fuzzy, 2012, Natal. Anais do CBSF. Natal: UFRN	2056	2
1	BWSS 2012 - The Third Brazilian Workshop on Social Simulation, 2012, Curitiba. Proceedings of BWSS 2012 - Proceedings of the Braziian Conference on Intelligent Systems BRACIS 2012. Porto Alegre: SBC	2057	2
1	BWSS 2012 - The Third Brazilian Workshop on Social Simulation, 2012, Curitiba. Proceedings of BWSS 2012 - Proceedings of the Braziian Conference on Intelligent Systems BRACIS 2012. Porto Alegre: SBC	2058	2
1	BWSS 2012 - The Third Brazilian Workshop on Social Simulation, 2012, Curitiba. Proceedings of BWSS 2012 - Proceedings of the Braziian Conference on Intelligent Systems BRACIS 2012. Porto Alegre: SBC	2059	2
1	BWSS 2012 - The Third Brazilian Workshop on Social Simulation at BRACIS 2012, 2012, Curitiba. Proceedings of BWSS 2012 - Proceedings of the Brazilian Conference on Intelligente Systems - BRACIS 2012 - BWSS 2012. Porto Alegre: SBC	2060	2
1	V Workshop-Escola de Sistemas de Agentes, seus Ambientes e Aplicações, 2011, Curitiba. Gustavo A. G. Lugo, Jomi F- Hübner, Cesar A. Tacla (Eds.) Anais do WESAAC 2011. Curitiba: UTFPR	2061	2
1	WEIT 2011 - Workshop-Escola de Informática Teórica, 2011, Pelotas. G.P. Dimuro, L. Foss, M.S. Aguiar, S. Costa, A.C.R. Costa (Eds.) Anais do WEIT 2011. Rio Grande: FURG	2062	2
1	WEIT 2011 - Workshop-Escola de Informática Teórica, 2011, Pelotas. G.P. Dimuro, L. Foss, M.S. Aguiar, S. Costa, A.C.R. Costa (Eds.) Anais do WEIT 2011. Rio Grande: FURG	2063	2
1	WEIT 2011 - Workshop-Escola de Informática Teórica, 2011, Pelotas. G.P. Dimuro, L. Foss, M.S. Aguiar, S. Costa, A.C.R. Costa (Eds.) Anais do WEIT 2011. Rio Grande: FURG	2064	2
1	WEIT 2011 - Workshop-Escola de Informática Teórica, 2011, Pelotas. G.P. Dimuro, L. Foss, M.S. Aguiar, S. Costa, A.C.R. Costa (Eds.) Anais do WEIT 2011. Rio Grande: FURG	2065	2
1	WEIT 2011 - Workshop-Escola de Informática Teórica, 2011, Pelotas. G.P. Dimuro, L. Foss, M.S. Aguiar, S. Costa, A.C.R. Costa (Eds.) Anais do WEIT 2011. Rio Grande: FURG	2066	2
1	WEIT 2011 - Workshop-Escola de Informática Teórica, 2011, Pelotas. G.P. Dimuro, L. Foss, M.S. Aguiar, S. Costa, A.C.R. Costa (Eds.) Anais do WEIT 2011. Rio Grande: FURG	2067	2
1	WEIT 2011 - Workshop-Escola de Informática Teórica, 2011, Pelotas. G.P. Dimuro, L. Foss, M.S. Aguiar, S. Costa, A.C.R. Costa (Eds.) Anais do WEIT 2011. Rio Grande: FURG	2068	2
1	Workshop-Escola de Sistemas de Agentes, seus Ambientes e Aplicações, 2010, Rio Grande. Anais do WESAAC 2010. Rio Grande: FURG	2069	2
1	Workshop-Escola de Sistemas de Agentes, seus Ambientes e Aplicações, 2010, Rio Grande. Anais do WESAAC 2010. Rio Grande: FURG	2070	2
627	The Multi-Agent Logics, Languages, and Organisations Federated Workshops (MALLOW 2010)/LAnguages, methodologies and Development tools for multi-agent systemS (LADS 2010), 2010, Lyon. Olivier Boissier, Amal El Fallah Seghrouchni, Salima Hassas and Nicolas Maudet (Eds.), MALLOW 2010 - The Multi-Agent Logics, Languages, and Organisations Federated Workshops, CEUR-WS Workshop Proceedings Series. Aachen: Sun SITE Central Europe/ RWTH Aachen University/Tilburg University	2071	2
1	IADIS International Conference Applied Computing, 2010, Timisoara. Applied Computing	2113	2
	IADIS International Conference Applied Computing, 2010, Timisoara. Applied Computing	2114	2
627	The Multi-Agent Logics, Languages, and Organisations Federated Workshops (MALLOW 2010)/Workshop on Multi-Agent Systems and Simulation (MASS), 2010, Lyon. Olivier Boissier, Amal El Fallah Seghrouchni, Salima Hassas and Nicolas Maudet (Eds.), MALLOW 2010 - The Multi-Agent Logics, Languages, and Organisations Federated Workshops, CEUR-WS Workshop Proceedings Series. Aachen: Sun SITE Central Europe/ RWTH Aachen University/Tilburg University	2072	2
1	V Workshop on MSc Dissertation and PhD Thesis in Artificial Intelligence/Joint Cinference SBIA/SBRN/JRI 2010, 2010, São Bernardo do Campo. (P. T. Aquino, Ed.) Workshop Proceedings/Joint Conference 2010. Porto Alegre: SBC	2073	2
1	Second Brazilian Workshop on Social Simulation (BWSS 2010) at Joint Conferences XX SBIA/XI SBRN/IV JRI, 2010, São Bernardo do Campos. (P. T. Aquino Junior, Ed.) Workshop Proceedings/Joint Conference 2010. Porto Alegre: SBC	2074	2
1	Congresso Brasileiro de Sistemas Fuzzy, 2010, Sorocaba. Anais do CBSF 2010. São Carlos: UFSCar	2075	2
1	Second Brazilian Workshop on Social Simulation - BWSS 2010 at Joint Conference SBIA/SBRN/JRI 2010, 2010, São Bernardo do Campo. (P. T. Aquino Junior, Ed.) Workshop Proceedings/Joint Conference 2010. Porto Alegre: SBC	2076	2
1	4th Southern Conference on Computational Modeling/IX Encontro Regional de Matemática Aplicada e Computacional, 2010, Rio Grande. Anais do 4 MCSUL/IX ERMAC. Rio Grande: FURG	2077	2
1	4th Southern Conference on Computational Modeling/IX Encontro Regional de Matemática Aplicada e Computacional, 2010, Rio Grande. Anais do 4MCSUL/IX ERMAC. Rio Grande: FURG	2078	2
1	4th Southern Conference on Computational Modeling/IX Encontro Regional de Matemática Aplicada e Computacional, 2010, Rio Grande. Anais do 4MCSUL/IX ERMAC. Rio Grande: FURG	2079	2
1	4th Southern Conference on Computational Modeling/IX Encontro Regional de Matemática Aplicada e Computacional, 2010, Rio Grande. Anais do 4 MCSUL/IX ERMAC. Rio Grande: FURG	2080	2
1	Computability in Europe 2009: Mathematical Theory and Computational Practice, 2009, Heidelberg. Klaus Ambos-Spies, Benedikt Löwe, Wolfgang Merkle (Editors) Mathematical Theory and Computational Practice. Heidelberg: University of Heidelberg	2081	2
1	International Fuzzy Systems Association World Congress/European Society for Fuzzy Logic and Technonoly Conference 2009, 2009, Lisboa. Proceedings of 2009 ISFA World Congress/2009 EUSFLAT Conference. Lisboa: ISFA/EUSFLAT	2082	2
1	14th Portuguese Conference on Artificial Intelligence - EPIA'2009/Social Simulation and Modelling - SSM, 2009, Aveiro. L.S. Lopes, N. Lau, P. Mariano, L.M. Rocha (eds.) New Trends In Artificial Intelligence. Aveiro: Universidade de Aveiro	2083	2
1	14th Portuguese Conference on Artificial Intelligence - EPIA'2009/Multi-Agent Systems: Theory and Applications - MASTA 2009, 2009, Aveiro. L.S. Lopes, N. Lau, P. Mariano, L.M. Rocha (eds.) New Trends In Artificial Intelligence. Aveiro: Universidade de Aveiro	2084	2
2	XXXII Congresso Nacional de Matemática Aplicada e Computacional, 2009, Cuiabá. A. L. Bortoli et al. (Eds.) Anais do CNMAC. São Carlos: SBMAC	2085	2
1	The 3rd Southern Conference on Computational Modeling, 2009, Rio Grande. Proceedings of MCSUL 2009. Rio Grande: FURG	2086	2
1	Fourth Conference on Computability in Europe: Logic and Theory of Algorithms, 2008, Athens. Arnold Beckmann, Costas Dimitracopoulos and Benedikt Löwe (eds.) Logic and Theory of Algorithms, Proceedings of CiE 2008. Athens: University of Athens	2087	2
5110	15th Workshop on Logic, Information, Language and Computation, 2008, Edinburgh. Wilfrid Hodges and Ruy de Queiroz (Eds.) Logic, Language, Information and Computation15th International Workshop, WoLLIC 2008 Edinburgh, UK, July 1-4, 2008 Proceedings (Lecture Notes in Artificial Intelligence). Berlin: Springer-Verlag	2088	2
1	XXXI Congresso Nacional de Matemática Aplicada e Computacional, 2008, Belém. E. C. Abreu et al. Anais do CNMAC. São Carlos: SBMAC	2089	2
1	XXXI Congresso Nacional de Matemática Aplicada e Computacional, 2008, Belém. E. C. Abreu et al. (Eds.) Anais do CNMAC. São Carlos: SBMAC	2090	2
1	II Workshop-Escola de Sistemas de Agentes para Sistemas Colaborativos, 2008, Santa Cruz. R. Frozza e A. A. Kozen (Org.) Anais do WESAAC 2008. Santa Cruz do Sil: EDUNISC	2091	2
1	II Workshop Escola de Sistemas de Agentes para Ambientes Colaborativos, 2008, Santa Cruz. R. Frozza e A. A. Konzen (Org.) Anais do WESAAC 2008. Santa Cruz do Sul: EDUNIISC	2092	2
1	II Workshop-Escola de Sistemas de Agentes para Ambientes Colaborativos, 2008, Santa Cruz. R. Frozza e A. A. Konzen (Org.) Anais do WESAAC 2008. Santa Cruz so Sul: EDUNISC	2093	2
5249	19th Brazilian Symposium on Artificial Intelligence, 2008, Salvador. G. Zaverucha and A. L. Costa (Eds.) Advances in Artificial Intelligence - SBIA 2008 Proceedings (Lecture Notes in Artificial Intelligence). Berlin: Springer	2094	2
1	Third Workshop on Logical and Semantic Frameworks, with Applications, 2008, Salvador. Mario Benevides and Elaine Pimentel (eds.), Pré-Proceedings of LSFA 2008. Porto Alegre: SBC	2095	2
1	(G. P. Henning, M. R. Galli y S. Goneet, eds.) XXXIV Conferência Latinoamericano de Informática, 2008, Santa Fe. Anales CLEI 2008. Buenos Aires: Sadio	2096	2
1	SBIA 2008 / BWSS 2008 - 1st Brazilian Workshop on Social Simulation, 2008, Salvador. Proceedings of SBIA 2008 / BWSS 2008. Porto Alegre: SBC	2097	2
1	VII Simpósio de Informática da Região Centro do RS, 2008, Santa Maria. Anais do SIRC 2008. Santa Maria: UNIFRA	2098	2
1	IV Workshop on MSc Dissertation and PhD Thesis in Artificial Intelligence (WTDIA), 2008, Salvador. Proceedings of IV WTDIA. Porto Alegre: SBC	2099	2
1	VI Best MSc Dissertation/PhD Thesis Contest (CTDIA), 2008, Salvador. Proceedings of VI CTDIA. Porto Alegre: SBC	2100	2
	BTAS '09, 2009, Washington, D.C. IEEE 3rd International Conference on Biometrics: Theory, Applications, and Systems, 2009	2101	2
	VIII Congreso Internacional sobre Investigación en la Didáctica de las Ciencias, 2009, Barcelona. Enseñanza de las Ciencias - VIII Congreso Internacional sobre Investigación en la Didáctica de las Ciencias	2102	2
	IV Seminário Jogos Eletrônicos, Educação e Comunicação - construindo novas trilhas, 2008, Bahia. IV Seminário Jogos Eletrônicos, Educação e Comunicação - construindo novas trilhas	2103	2
	Simpósio Brasileiro de Jogos e Entretenimento Digital, 2008, Belo Horizonte. SBGAMES 2008	2104	2
7409	Brazilian Symposium on Bioinformatics, 2012, Campo Grande. LNBI-LNCS. Advances in Bioinformatics and Computational Biology. Berlin: Springer-Verlag	2111	2
6098	The Twenty Third International Conference on Industrial, Engineering Other Applications of Applied Intelligent Systems, 2010, Córdoba. Trends in Applied Intelligent Systems. IEA/AIE 2010 Part III LNAI-LNCS. Berlin: Springer-Verlag	2112	2
5167	III Brazilian Simposium on Bioinformatics, 2008, Santo André. LNBI-LNCS. Advances in Bioinformatics and Computational Biology.. Berlin: Springer-Verlag	2115	2
	IV Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações, 2010, Rio Grande. Anais do IV Wesaac	2122	2
1	Congresso Regional de Iniciação Científica e Tecnológica em Engenharia - CRICTE, 2010, Rio Grande. Anais	2123	2
	IV Conferência Sul de Modelagem Computacional, 2010, Rio Grande. Anais	2124	2
	International Joint Conference on Neural Networks (IJCNN2008), 2008, Hong Kong. International Joint Conference on Neural Networks (IJCNN2008)	2125	2
	SEGeT Simpósio de Excelência em Gestão e Tecnologia, 2012, Resende - RJ. Anais do IX Simpósio de Excelência em Gestão e Tecnologia - SEGeT	2129	2
	XXIII ENANGRAD - AVALIAÇÃO E GESTÃO DO CURSO DE ADMINISTRAÇÃO: Realidades e Perspectivas, 2012, Bento Gonçalves - RS. Anais do XXIII ENANGRAD - AVALIAÇÃO E GESTÃO DO CURSO DE ADMINISTRAÇÃO: Realidades e Perspectivas	2130	2
	WCCA 2011 World Congress on Communication and Arts, 2011, São Paulo. WCCA 2011 World Congress on Communication and Arts. São Paulo	2131	2
	17º CIAED - Congresso Internacional ABED de Educação a Distância, 2011, Manaus. A Grande Conversação: Diferentes Formas de Aprender, Conteúdos Variados e Tecnologias Diferenciadas - Interação com Diversidade	2132	2
XI	XI Colóquio Internacional sobre Gestão Universitária nas Américas, 2011, Florianópolis. Anais XI Colóquio Internacional sobre Gestão Universitária nas Américas	2133	2
1	II Encontro Fluminense de Engenharia de Produção, 2010, Rio das Ostras - RJ. UMA ANÁLISE DAS DIFICULDADES DE INVESTIMENTO NAS MPEs PELA BAIXA UTILIZAÇÃO DE FERRAMENTAS DE GESTÃO	2134	2
	ESUD - Congresso Brasileiro de Ensino Superior a Distância, 2010, Cuiabá. A EaD e sua institucionalização: reflexões e processos	2135	2
	II CONGRESO INTERNACIONAL - CIENCIAS, TECNOLOGÍAS Y CULTURAS. DIÁLOGO ENTRE LAS DISCIPLINAS DEL CONOCIMIENTO. MIRANDO AL FUTURO DE AMÉRICA LATINA Y EL CARIBE, 2010, Santiago. Educação e Tecnologias	2136	2
	I Congresso Internacional de Educação a Distância da UFPel, 2010, Pelotas. Anais do I Congresso Internacional de Educação a Distância da UFPel	2137	2
1	NAVTEC 2012 - Conferência Internacional em Tecnologias Naval e Offshore: Ciência e Inovação, 2012, Rio Grande. Anais NAVTEC 2012	2146	2
1	NAVTEC 2012 - Conferência Internacional em Tecnologias Naval e Offshore: Ciência e Inovação, 2012, Rio Grande. Anais NAVTEC 2012	2147	2
	ENIA - VIII Encontro Nacional de Inteligência Artificial, 2011, Natal. Anais do VIII Encontro Nacional de Inteligência Artificial	2148	2
	X Simpósio Brasileiro de Automática, 2011, São João del Rey. X Simpósio Brasileiro de Automática	2149	2
	Internet of Things (iThings/CPSCom), 2011 International Conference on and 4th International Conference on Cyber, Physical and Social Computing, 2011, Dalian. Anais Internet of Things (iThings/CPSCom), 2011 International Conference on and 4th International Conference on Cyber, Physical and Social Computing	2150	2
	IV Seminário e workshop em Engenharia Oceânica, 2010, Rio Grande. Anais do IV Seminário e workshop em Engenharia Oceânica	2151	2
	4MCSUL, 2010, Rio Grande. Anais do 4MCSUL	2152	2
	23 Congresso Nacional de Transporte Aquaviário, Construção Naval e Offshore, 2010, Rio de Janeiro. Anais do 23 Congresso Nacional de Transporte Aquaviário, Construção Naval e Offshore	2153	2
	1st International Conference on Applied Robotics for the Power Industry (CARPI), 2010, Montreal. Anais do 1st International Conference on Applied Robotics for the Power Industry (CARPI)	2154	2
	INCOM 2009, 2009, Moscou. Anais di 13th IFAC Symposium on Information Control Problems in Manufacturing	2155	2
CD-ROM	Simpósio Brasileiro de Sistemas Elétricos, 2008, Belo Horizonte. Anais do SBSE 2008. Belo Horizonte: Editora da Universidade Federal de Minas Gerais	2156	2
cd-rom	Simpósio Brasileiro de Redes de Computadores - Salão de Ferramentas, 2008, Rio de Janeiro. Anais do SBRC 2008	2157	2
	VII SBGames, 2008, Belo Horizonte. Anais do Simpósio Brasileial ro de Jogos para Computador e Entretenimento Digital - 2008	2158	2
1	XI Congreso Argentino de Meteorologia, 2012, Mendoza. XI Congremet. Buenos Aires: Centro Argentino de Meteorologos	2166	2
1	XI Congreso Argentino de Meteorologia, 2012, Mendoza. XI Congremet. Buenos Aires: Centro Argentino de Meteorologos	2167	2
1	XI Congreso Argentino de Meteorologia, 2012, Mendoza. XI Congremet. Buenos Aires: Centro Argentino de Meteorologos	2168	2
1	XVII Congresso Brasileiro de Meteorologia, 2012, Gramado, RS. Anais do XVII Congresso Brasileiro de Meteorologia. Rio de Janeiro: SBMet	2169	2
1	XVII Congresso Brasileiro de Meteorologia, 2012, Gramado, RS. Anais do XVII Congresso Brasileiro de Meteorologia. Rio de Janeiro: SBMet	2170	2
1	XIII Congreso Latinoamericano e Ibérico de Meteorología e X Congreso Argentino de Meteorología, 2009, Buenos Aires. Anais. Buenos Aires	2171	2
1	XIII Congreso Latinoamericano e Ibérico de Meteorología e X Congreso Argentino de Meteorología, 2009, Buenos Aires. Anais. Buenos Aires	2172	2
1	XIII Congreso Latinoamericano e Ibérico de Meteorología e X Congreso Argentino de Meteorología, 2009, Buenos Aires. Anais. Buenos Aires	2173	2
1	XIII Congreso Latinoamericano e Ibérico de Meteorología e X Congreso Argentino de Meteorología, 2009, Buenos Aires. Anais. Buenos Aires	2174	2
1	III Simpósio Internacional de Climatologia, 2009, Canela, RS. Anais. Canela, RS	2175	2
1	III Simpósio Internacional de Climatologia, 2009, Canela, RS. Anais. Canela, RS	2176	2
1	II Simpósio de Pesquisa em Ensino e História de Ciências da Terra, 2009, São Paulo. Anais. São Paulo	2177	2
1	XV Congresso Brasileiro de Meteorologia, 2008, São Paulo. Anais. São Paulo: SBMet	2178	2
1	XV Congresso Brasileiro de Meteorologia, 2008, São Paulo. Anais. São Paulo: SBMet	2179	2
1	XV Congresso Brasileiro de Meteorologia, 2008, São Paulo. Anais. São Paulo: SBMet	2180	2
1	XV Congresso Brasileiro de Meteorologia, 2008, São Paulo. Anais. São Paulo: SBMet	2181	2
	Escola Regional de Redes de Computadores, 2012, Pelotas. X Escola Regional de Redes de Computadores	2182	2
	Escola Regional de Redes de Computadores, 2012, Pelotas. X Escola Regional de Redes de Computadores	2183	2
	IEEE International Requirements Engineering Conference (RE), 2012, Chicago. 20th IEEE International Requirements Engineering Conference	2184	2
	SIM 2012 - South Symposium on Microelectronics, 2012, São Miguel das Missões. Proceedings of SIM 2012 - South Symposium on Microelectronics	2192	2
	South Symposium on Microelectronics (SIM 2012), 2012, São Miguel das Missões. Proceedings of South Symposium on Microelectronics (SIM 2012)	2193	2
	South Symposium on Microelectronics (SIM 2012), 2012, São Miguel das Missões. Proceedings of South Symposium on Microelectronics (SIM 2012)	2194	2
	South Symposium on Microelectronics, 2012, São Miguel das Missões. Proceedings of South Symposium on Microelectronics	2195	2
	26th South Symposium on Microelectronics - SIM2011, 2011, Novo Hamburgo. Proceedings of South Symposium on Microelectronics - SIM2011	2196	2
	24th Symposium on Integrated Circuits and Systems Design - SBCCI 2011, 2011, João Pessoa. Proceedings of 24th Symposium on Integrated Circuits and Systems Design - SBCCI 2011	2197	2
	29th IEEE International Conference on Computer Design - ICCD 2011, 2011, Amherst. Proceedings of 29th IEEE International Conference on Computer Design - ICCD 2011	2198	2
	South Symposium on Microelectronics, 2010, Porto Alegre. Proceedings. Porto Alegre: EDIPUCRS	2199	2
	International19th International Workshop on Power And Timing Modeling Optimization and Simulation, 2009, Delft. Lecture Notes in Computer Science	2200	2
	24th South Symposium on Microelectronics, 2009, Pelotas. Proceedings of the 24th South Symposium on Microelectronics. Pelotas: Editora e Gráfica Universitária PREC-UFPel	2201	2
	18th ACM Great Lakes symposium on VLSI (GLSVLSI), 2008, Orlando, Florida. Proceedings of 18th ACM Great Lakes symposium on VLSI (GLSVLSI). New York: ACM	2202	2
	XXIII South Symposium on Microelectronics (SIM), 2008, Bento Gonçalves. Proceedings of XXIII South Symposium on Microelectronics (SIM). Porto Alegre: Evangraf	2203	2
	IEEE Custom Integrated Circuits Conference, 2008. Custom Integrated Circuits Conference	2204	2
	17th ACM/IEEE International Workshop on Logic and Synthesis, 2008, Lake Tahoe. Workshop Notes of the 17th ACM/IEEE International Workshop on Logic and Synthesis	2205	2
	IEEE International Conference on Robotics and Automation - ICRA, 2012, Saint Paul. Proceedings of IEEE International Conference on Robotics and Automation	2212	2
	International Conference on Offshore and Marine Technology: Science and Innovation, 2012, Rio Grande, Brazil. Proceedings of International Conference on Offshore and Marine Technology: Science and Innovation	2213	2
	Brazilian Symposium on Neural Networks, 2012, Curitiba, Brazil. Proceedings of Brazilian Symposium on Neural Networks	2214	2
	XIX Congresso Brasileiro de Automática, 2012, Campina Grande, Brazil. Anais do XIX Congresso Brasileiro de Automática	2215	2
	XIX Congresso Brasileiro de Automática, 2012, Campina Grande, Brazil. Anais do XIX Congresso Brasileiro de Automática	2216	2
	XIX Congresso Brasileiro de Automática, 2012, Campina Grande, Brazil. Anais do XIX Congresso Brasileiro de Automática	2217	2
	XIX Congresso Brasileiro de Automática, 2012, Campina Grande, Brazil. Anais do XIX Congresso Brasileiro de Automática	2218	2
	XIX Congresso Brasileiro de Automática, 2012, Campina Grande, Brazil. Anais do XIX Congresso Brasileiro de Automática	2219	2
	Latin American Robotics Symposium / Brazilian Robotics Symposium (LARS/SBR), 2012, Fortaleza, Brazil. Proceedings of IEEE Latin American Robotics Symposium	2220	2
	Latin American Robotics Symposium / Brazilian Robotics Symposium (LARS/SBR), 2012, Fortaleza, Brazil. Proceedings of IEEE Latin American Robotics Symposium	2221	2
	Latin American Robotics Symposium / Brazilian Robotics Symposium (LARS/SBR), 2012, Fortaleza, Brazil. Proceedings of IEEE Latin American Robotics Symposium	2222	2
	Encontro Nacional de Inteligência Artificial - ENIA, 2012, Curitiba. Anais do IX Encontro Nacional de Inteligência Artificial - ENIA	2223	2
	ENIA - VIII Encontro Nacional de Inteligência Artificial - CSBC, 2011, Natal. ENIA - VIII Encontro Nacional de Inteligência Artificial - CSBC	2224	2
	IEEE 9th International Conference on. Industrial Informatics, 2011, Lisboa. IEEE 9th International Conference on. Industrial Informatics	2225	2
	X Simpósio Brasileiro de Automática - SBAI 2011, 2011, Sao Joao del Rei - Brazil. Anais do X Simpósio Brasileiro de Automática	2226	2
	X Simpósio Brasileiro de Automática - SBAI 2011, 2011, Sao Joao del Rey - Brazil. Anais do X Simpósio Brasileiro de Automática	2227	2
	The 17th International Conference on Systems, Signals and Image Processing (IWSSIP 2010), 2010, Niteroi, Brazil. Proceedings of the 17th International Conference on Systems, Signals and Image Processing. Niteroi, RJ, Brazil: Editora da Universidade Federal Fluminense	2228	2
	IEEE International Conference on Robotics and Automation (ICRA), 2010, Anchorage, USA. Proceedings of the IEEE Int. Conf. on Robotics and Automation	2229	2
	XXII Concurso de Teses e Dissertações da SBC - CSBC, 2010, Belo Horizonte. Anais do Congresso da SBC (CSBC)	2230	2
	13th International Conference on Information Fusion (FUSION), 2010, Edinburgh, UK. Proceedings of 13th International Conference on Information Fusion	2231	2
	IEEE International Conference on Multisensor Fusion and Integration, 2010, Salt Lake, USA. Proceedings of the 2010 IEEE International Conference on Multisensor Fusion and Integration	2232	2
	Congresso Brasileiro de Automática, 2010, Bonito - Brazil. Anais do XVIII Congresso Brasileiro de Automática	2233	2
	Congresso Brasileiro de Automática, 2010, Bonito - Brazil. Anais do XVIII Congresso Brasileiro de Automática	2234	2
	13th International Conference on Information Fusion (FUSION), 2010, Edinburg, UK. Proceedings of 13th International Conference on Information Fusion (FUSION)	2235	2
	IEEE/RSJ International Conference on Intelligent Robots and Systems, 2010, Taipei - Taiwan. Proceedings of IEEE/RSJ International Conference on Intelligent Robots and Systems	2236	2
	Latin American Robotics Symposium, 2010, São Bernardo do Campo - Brazil. Proceedings of VII Latin American Robotics Symposium	2237	2
	I International Conference on Biodental Engineering, 2009, Porto - Portugal. I International Conference on Biodental Engineering	2238	2
	International Congress of Mechanical Engineering (COBEM), 2009, Gramado - Brazil. Anais do COBEM 2009	2239	2
	The 2009 IEEE/RSJ International Conference on Intelligent Robots and Systems (IROS), 2009, St. Louis USA. The 2009 IEEE/RSJ International Conference on Intelligent Robots and Systems (IROS)	2240	2
	European Conference on Mobile Robots, 2009, Dubrovnik. Proceedings of the 4th European Conference on Mobile Robots	2241	2
	European Conference on Mobile Robots, 2009, Dubrovnik. Proceedings of the 4th European Conference on Mobile Robots	2242	2
	IX Simpósio Brasileiro de Automação Inteligente, 2009, Brasilia. Anais do IX Simpósio Brasileiro de Automação Inteligente	2243	2
	IEEE Latin American Robotics Symposium (LARS), 2009, Valparaiso - Chile. Proceedings of IEEE Latin American Robotics Symposium	2244	2
	Simpósio Brasileiro de Automação Inteligente (SBAI), 2009, Brasilia. Anais do Simpósio Brasileiro de Automação Inteligente (SBAI)	2245	2
	III MCSUL - 3rd Southern Conference on Computational Modelling, 2009, Rio Grande - Brazil. Anais do III MCSUL	2246	2
	IEEE/OES Oceans, 2009, Bremen, Germany. Proceedings of IEEE/OES Oceans	2247	2
1	Simposio Brasileiro de Sistemas Elétricos, 2008, Belo Horizonte. Anais do SBSE 2008	2248	2
	Congresso da Sociedade Brasileira de Computação - Concurso de Trabalhos de Iniciação Científica, 2008, Belem. Anais do XXVIII Congresso da Sociedade Brasileira de Computação	2249	2
	XVII Congresso Brasileiro de Automática, 2008, Juiz de Fora - MG - Brazil. Anais do XVII Congresso Brasileiro de Automática	2250	2
1-4	MTS/IEEE Oceans, 2008, Quebec. Proc. of the MTS/IEEE Oceans	2251	2
	Workshop of Undergraduate Work - Brazilian Symposium on Computer Graphics and Image Processing (SIBGRAPI), 2008, Campo Grande. Proceedings of the XXI Brazilian Symposium on Computer Graphics and Image Processing (SIBGRAPI)	2252	2
	III Seminário e Workshop de Engenharia Oceânica, 2008, Rio Grande. Anais do III Seminário e Workshop de Engenharia Oceânica	2253	2
	5th Latin American Robotics Symposium - LARS, 2008, Salvador. Proceedings of the 5th Latin American Robotics Symposium	2254	2
	Internet of Things (iThings/CPSCom), 2011, Dalian. 2011 International Conference on and 4th International Conference on Cyber, Physical and Social Computing	2256	2
	Encontro de Pesquisa em Educação da Região Sul - ANPED SUL, 2010, Londrina. Anais do ANPED SUL	2257	2
	Workshop de Desafios da Computação Aplicada à Educação, 2012, Curitiba/PR. Desafie - CSBC 2012, SBC	2259	2
	Congresso Nacional de Diversidade e Inclusão, 2012, São José dos Campos / SP. CONADI 2012	2260	2
	II Congreso Internacional de Computación e Informática, 2012, Ciudad del Carmen. CONACI 2012. Berlin: Springer	2261	2
	Seminário de Extensão Universitária da Região Sul, 2012, Rio Grande. SEURS 2012. Rio Grande: Editora FURG	2262	2
	III Congresso Baiano de Educação Inclusiva: Práticas, Formação e Lugares, 2011, Salvador. III Congresso Baiano de Educação Inclusiva: Práticas, Formação e Lugares	2263	2
	II Seminário de Políticas Públicas e Educação: constituindo a cidadania?, 2011, Rio Grande, RS. II Seminário de Políticas Públicas e Educação	2264	2
	1º Congresso Internacional de Educação à Distância da UFPEL, 2010, Pelotas. 1º Congresso Internacional de Educação à Distância da UFPEL	2265	2
	XV II - CIESC Iberian American Conference on High Education in Computer Science, 2009, Pelotas. CLEI 2009	2266	2
	International Biometric Performance Testing Conference, 2010, Washington, D.C.. NIST Special Publication 500-283	2268	2
	Biometrics: Theory, Applications, and Systems, 2010, Washington, D.C.. IEEE 4th International Conference on Biometrics: Theory, Applications, and Systems, 2010. BTAS '10	2269	2
	International Conference on Frontiers in Handwriting Recognition, 2010, Kolkata, India. Proceedings of the 12th International Conference on Frontiers in Handwriting Recognition	2270	2
	Simpósio Brasileiro de Telecomunicações, 2009, Blumenau, SC. Anais do XXVII Simpósio Brasileiro de Telecomunicações	2271	2
	Biometrics: Theory, Applications, and Systems, 2009, Washington, D.C.. IEEE 3rd International Conference on Biometrics: Theory, Applications, and Systems, 2009. BTAS '09	2272	2
	Simposio Brasileiro de Telecomunicacoes, 2008, Recife. Anais do XXVI Simpósio Brasileiro de Telecomunicações	2273	2
1	IEEE 9th International Conference on Industrial Informatics, 2011, Lisboa. Proceedings of 2011 IEEE 9th International Conference on Industrial Informatics	2274	2
Único	2010 17th IEEE International Conference and Workshops on Engineering of Computer Based Systems (ECBS), 2010, Rio de Janeiro. Proceeding of 2010 17th IEEE International Conference and Workshops on Engineering of Computer Based Systems (ECBS). Oxfor, England: IEEE	2275	2
	2010 23rd SIBGRAPI Conference on Graphics, Patterns and Images (SIBGRAPI), 2010, Gramado, Brazil. Proceedings 23rd SIBGRAPI Conference on Graphics, Patterns and Images. Los Alamitos, California: IEEE Computer Society	2276	2
	XVIII Congresso Brasileiro de Automática, 2010, Bonito, Brasil. Anais do XVIII Congresso Brasileiro de Automática	2277	2
Único	The 3rd South Conference on Computational Modeling III MCSUL, 2009, Rio Grande. Anais do III Simpósio de Modelagem Computacional do Sul 3MCSul	2278	2
	IECON 2011 - 37th Annual Conference on IEEE Industrial Electronics Society, 2011, Melbourne. IECON 2011 - 37th Annual Conference on IEEE Industrial Electronics Society	2284	2
	Power Electronics Conference (COBEP), 2011, Natal. Congresso Brasileiro de Eletrônica de Potência	2285	2
	International Conference on Electrical Machines ICEM, 2010, Roma. XIX International Conference on Electrical Machines ICEM-2010	2286	2
	International Conference on Electrical Machines, 2010, Roma. XIX International Conference on Electrical Machines ICEM-2010	2287	2
	International Conference on Electrical Machines, 2010, Roma. XIX International Conference on Electrical Machines ICEM-2010	2288	2
	International Conference on Electrical Machines, 2010, Roma. XIX International Conference on Electrical Machines ICEM-2010	2289	2
	Congresso Brasileiro de Automática, 2010, Bonito. XVIII Congresso Brasileiro de Automática CBA2010	2290	2
	Congresso Brasileiro de Automática, 2010, Bonito. XVIII Congresso Brasileiro de Automática CBA2010	2291	2
	International Electric Machines and Drives Conference - IEMDC, 2009, Miami. Renewable Energy Systems for Today Tomorrow	2292	2
	International Electric Machines and Drives Conference - IEMDC, 2009, Miami. Renewable Energy Systems for Today Tomorrow	2293	2
	Congresso Brasileiro de Eletrônica de Potência - Cobep'09, 2009, Bonito, Mato Grosso do Sul. Congresso Brasileiro de Eletrônica de Potência - Cobep'09	2294	2
1	Congresso Brasileiro de Automática, 2012, Natal. Congresso Brasileiro de Automática CBA 2012	3206	3
	Congresso Brasileiro de Eletrônica de Potência - Cobep'09, 2009, Bonito, Mato Grosso do Sul. Congresso Brasileiro de Eletrônica de Potência - Cobep'09	2295	2
	Congresso Brasileiro de Eletrônica de Potência - Cobep'09, 2009, Bonito, Mato Grosso do Sul. Congresso Brasileiro de Eletrônica de Potência - Cobep'09	2296	2
	IECON 2009, 2009, Porto. 35th Annual Conference of the IEEE Industrial Electronics Society	2297	2
	XVII Congresso Brasileiro de Automática, 2008, Juiz de Fora. Anais do XVII Congresso Brasileiro de Automática	2298	2
	XVII Congresso Brasileiro de Automática, 2008, Juiz de Fora. Anais do XVII Congresso Brasileiro de Automática	2299	2
1	NAVTEC 2012, 2012. Conferência Internacional em Tecnologias Naval e Offshore: Ciência e Inovação	2332	2
1	NAVTEC 2012, 2012. Conferência Internacional em Tecnologias Naval e Offshore: Ciência e Inovação	2333	2
1	NAVTEC 2012, 2012. Conferência Internacional em Tecnologias Naval e Offshore: Ciência e Inovação	2334	2
1	Congresso Brasileiro de Automática, 2012, Natal. Congresso Brasileiro de Automática CBA 2012	2335	2
1	Congresso Brasileiro de Automática, 2012, Natal. Congresso Brasileiro de Automática CBA 2012	2336	2
1	Congresso Brasileiro de Automática, 2012, Natal. Congresso Brasileiro de Automática CBA 2012	2337	2
1	Congresso Brasileiro de Automática, 2012, Natal. Congresso Brasileiro de Automática CBA 2012	2338	2
1	The Sixth International Conference on Mobile Ubiquitous Computing, Systems, Services and Technologies, 2012, Barcelona. The Sixth International Conference on Mobile Ubiquitous Computing, Systems, Services and Technologies	2339	2
1	Ciclo de Palestras Novas Tecnologias na Educação, 2012. Ciclo de Palestras Novas Tecnologias na Educação	2340	2
1	IEEE Latin American Robotic Systems - IEEE LARS, 2012. IEEE Latin American Robotic Systems - IEEE LARS	2341	2
1	IEEE Latin American Robotic Systems - IEEE LARS, 2012. IEEE Latin American Robotic Systems - IEEE LARS	2342	2
1	IEEE Latin American Robotic Systems - IEEE LARS, 2012. IEEE Latin American Robotic Systems - IEEE LARS	2343	2
1	Workshop em Robótica Educacional, 2012. Workshop em Robótica Educacional	2344	2
1	SBGames, 2012. SBGames	2345	2
1	Simpósio Brasileiro de Redes Neurais, 2012. Simpósio Brasileiro de Redes Neurais	2346	2
1	SIBIGRAPH - Workshop de Teses e Dissertações, 2012. SIBIGRAPH - Workshop de Teses e Dissertações	2347	2
1	3 rd International Conference on Robotic and Education, 2012. Conference Proceedings 3 rd International Conference on	2348	2
	Encontro Nacional de Inteligência Artificial, 2011, Natal. ENIA 2011	2349	2
	SINTEC - SEMINÁRIO INTERNACIONAL DE EDUCAÇÃO EM CIÊNCIAS, 2011, Rio Grande. SINTEC - SEMINÁRIO INTERNACIONAL DE EDUCAÇÃO EM CIÊNCIAS	2350	2
	X Simpósio Brasileiro de Automática, 2011, Sao Joao del Rei. X Simpósio Brasileiro de Automática	2351	2
	X Simpósio Brasileiro de Automática, 2011, Sao Joao del Rey. X Simpósio Brasileiro de Automática	2352	2
	2011 International Conference on and 4th International Conference on Cyber, Physical and Social Computing, 2011, Dalian. Internet of Things (iThings/CPSCom)	2353	2
	XXIX Simpósio Nacional de Educação Física, 2010. XXIX Simpósio Nacional de Educação Física	2354	2
	SIBIGRAPI, 2010. SIBIGRAPI	2355	2
	Congresso Brasileiro de Automática, 2010. CBA 2010	2356	2
	Congresso Brasileiro de Automática, 2010. CBA 2010	2357	2
	Congresso Brasileiro de Automática, 2010. CBA 2010	2358	2
	Congresso Brasileiro de Automática, 2010. CBA 2010	2359	2
	Congresso Brasileiro de Automática, 2010. CBA 2010	2360	2
	IEEE International Conference on Multisensor Fusion and Integration, 2010. IEEE International Conference on Multisensor Fusion and Integration	2361	2
	12th Brazilian Workshop on Real-Time and Embedded Systems, 2010, Gramado. Anais do 12th Brazilian Workshop on Real-Time and Embedded Systems	2362	2
	1st IFAC Workshop on Advanced Maintenance Engineering, Services and Technology - IFAC A-MEST'10, 2010, Lisboa. Proceedings of the 1st IFAC Workshop on Advanced Maintenance Engineering, Services and Technology - IFAC A-MEST'10	2363	2
	IV MCSUL - Southern Conference in Computational Modeling, 2010. IV MCSUL	2364	2
	IV Seminário e Workshop em Engenharia Oceânica, 2010. SEMENGO 2010	2365	2
	23 Congresso Nacional de Transporte Aquaviário, Construção Naval e Offshore, 2010. SOBENA 2010	2366	2
	SBGames, 2010. Simpósio Brasileiro de Jogos	2367	2
	Seminário de Pesquisa Qualitativa, 2010. Seminário de Pesquisa Qualitativa	2368	2
	INCOM 2009	2369	2
	IEEE Oceans 2009, 2009, Bremem. CD IEEE Oceans 2009	2370	2
	VIII Congreso Internacional sobre Investigación en Didáctica de las Ciencias, 2009	2371	2
	Simposio Brasileiro de Automação Inteligente, 2009, Brasilia. Simposio Brasileiro de Automação Inteligente	2372	2
	Simpósio Brasileiro de Automação Inteligente, 2009, Brasília. Simpósio Brasileiro de Automação Inteligente	2373	2
	Simpósio Brasileiro de Automação Inteligente, 2009, Brasilia. Simpósio Brasileiro de Automação Inteligente	2374	2
	Simposio Brasileiro de Automação Inteligente, 2009, Brasilia. Simposio Brasileiro de Automação Inteligente	2375	2
	IEEE Latin American Robotic Symposium, 2009. IEEE LARS	2376	2
1	Simposio Brasileiro de Sistemas Elétricos, 2008, Belo Horizonte. Simposio Brasileiro de Sistemas Elétricos	2377	2
	Congresso Brasileiro de Automática, 2008, Jiuz de Fora. Congresso Brasileiro de Automática	2378	2
	Congresso Brasileiro de Automática, 2008, Jiuz de Fora. Congresso Brasileiro de Automática	2379	2
	Latin American Robotic System - LARS, 2008, Salvador. Latin American Robotic Systems	2380	2
	Latin American Robotic System - LARS, 2008, Salvador. Latin American Robotic Systems	2381	2
	Congresso da Sociedade Brasileira de Computação, 2008. Concurso de Iniciação Científica	2382	2
	Workshop in Under-graduated Work, 2008. SIBGRAPI 2008	2383	2
	IEEE Oceans, 2008, Quebec. IEEE Oceans	2384	2
	IEEE Latin American Robotic Symposium, 2008, Salvador. IEEE Latin American Robotic Symposium	2385	2
	IEEE Latin American Robotic Symposium, 2008, Salvador. IEEE Latin American Robotic Symposium	2386	2
	SBGames, 2008, Belo Horizionte. SBGames	2387	2
	IV Seminário Jogos Eletrônicos, Educação e Comunicação construindo novas trilhas, 2008. IV Seminário Jogos Eletrônicos, Educação e Comunicação construindo novas trilhas	2388	2
	VIII Southern Programmable Logic Conference - SPL 2012, 2012, Bento Gonçalves. VIII Southern Programmable Logic Conference - SPL 2012	2390	2
	VIII Southern Programmable Logic Conference - SPL 2012 - Designer Forum, 2012, Bento Gonçalves. Southern Programmable Logic Conference - SPL 2012 - Designer Forum	2391	2
1	Mostra Nacional de Robótica MNR, 2011, São João Del Rey / MG. Mostra Nacional de Robótica	2392	2
	Workshop IBERCHIP, 2010, Foz do Iguaçu, PR, Brasil. XVI Workshop IBERCHIP	2393	2
1	Electronics, Circuits, and Systems (ICECS), 2010 17th IEEE International Conference on, 2010, Atenas. Proceedings of 17th International Conference on Electronic Circuits and Systems	2394	2
	International Conference on Electronic Circuits and Systems, 2010, Atenas. Proceedings of the 17th International Conference on Electronic Circuits and Systems	2395	2
1	IEEE Latin American Symposium on Circuits and Systems, 2010, Foz do Iguaçu. IEEE Latin American Symposium on Circuits and Systems	2396	2
	4th Southern Conference on Computational Modeling - 4º MCSUL, 2010, RIo Grande. 4th Southern Conference on Computational Modeling - 4º MCSUL	2397	2
	4th Southern Conference on Computational Modeling - 4º MCSUL, 2010, Rio Grande. 4th Southern Conference on Computational Modeling - 4º MCSUL	2398	2
	The 3rd Pacific-Rim Symposium on Image and Video Technology, 2009, Tóquio, Japão. Pacific-Rim Symposium on Image and Video Technology	2399	2
1	24o Simpósio Sul de Microeletrônica - SIM2009, 2009, Pelotas, RS. 24º simpósio sul de microeletrônica	2400	2
1	24o Simpósio Sul de Microeletrônica - SIM2009, 2009, Pelotas, RS. 24º simpósio sul de microeletrônica	2401	2
1	24o Simpósio Sul de Microeletrônica - SIM2009, 2009, Pelotas, RS. 24º simpósio sul de microeletrônica	2402	2
1	24º simpósio sul de microeletrônica, 2009, Pelotas, RS. 24º simpósio sul de microeletrônica	2403	2
	2nd International Conference on Signals, Circuits and Systems. SCS 2008., 2008, Tunísia. 2nd International Conference on Signals, Circuits and Systems	2404	2
	IFIP International Conference on Very Large Scale Integration. VLSI - SoC 2008., 2008, Rodes, Grécia. IFIP International Conference on Very Large Scale Integration	2405	2
	XIV Workshop Iberchip, 2008, Puebla, México. XIV Workshop Iberchip	2406	2
	XIV Workshop Iberchip, 2008. XIV Workshop Iberchip	2407	2
	21st Symposium on Integrated Circuits and Systems Design, 2008, Gramado, Brasil. 21st Symposium on Integrated Circuits and Systems Design	2408	2
1	III Seminário e Workshop em Engenharia Oceânica, Semengo'08, 2008, Rio Grande. III Seminário e Workshop em Engenharia Oceânica	2409	2
1	III Seminário e Workshop em Engenharia Oceânica, 2008, Rio Grande. III Seminário e Workshop em Engenharia Oceânica	2410	2
1	IV Southern Conference on Computational Modeling, 2010, Rio Grande, RS, 2010, Rio Grande. IV Southern Conference on Computational Modeling 2010	2413	2
	III Seminário e Workshop em Engenharia Oceânica, 2008, Rio Grande. III Seminário e Workshop em Engenharia Oceânica	2414	2
	III Seminário e Workshop em Engenharia Oceânica, 2008, Rio Grande. III Seminário e Workshop em Engenharia Oceânica	2415	2
	Congresso Brasileiro de Automática, 2008, Juiz de Fora. Congresso Brasileiro de Automática	2416	2
	Congresso Brasileiro de Automática, 2008, Juiz de Fora. Congresso Brasileiro de Automática	2417	2
	Congresso Nacional de Engenharia Mecânica, 2008, Salvador. Congresso Nacional de Engenharia Mecânica	2418	2
	Congresso Nacional de Engenharia Mecânica, 2008, Salvador. Congresso Nacional de Engenharia Mecânica	2419	2
	XVIII Congresso Brasileiro de Automática - CBA 2010, 2010, Bonito / MS. Anais do XVIII Congresso Brasileiro de Automática - CBA 2010	2422	2
	The 2010 1st International Conference on Applied Robotics for the Power Industry, 2010, Montreal. Proceedings of The 2010 1st International Conference on Applied Robotics for the Power industry	2423	2
	The 2010 1st International Conference on Applied Robotics for the Power industry, 2010, Montreal. Proceedings of The 2010 1st International Conference on Applied Robotics for the Power industry	2424	2
	14th IEEE International Conference on Emerging Technology and Factory Automation, 2009, Palma de Mallorca. Proceedings of the 14th IEEE International Conference on Emerging Technologies and Factory Automation (ETFA)	2425	2
	IX Simpósio Brasileiro de Automação Inteligente, 2009, Brasília. Anais do IX Simpósio Brasileiro de Automação Inteligente	2426	2
	IX Simpósio Brasileiro de Automação Inteligente, 2009, Brasília. Anais do IX Simpósio Brasileiro de Automação Inteligente	2427	2
	Rio Pipeline 2009 Conference and Exhibition, 2009, Rio de Janeiro. Anais do Rio Pipeline 2009 Conference and Exhibition	2428	2
	Simpósio Brasileiro de Sistemas Elétricos, 2008, Belo Horizonte. Anais do Simpósio Brasileiro de Sistemas Elétricos 2008	2429	2
	Congresso Brasileiro de Automática, 2008, Juiz de Fora. Anais do XVII Congresso Brasileiro de Automática	2430	2
	Simpósio Latino-Americano de Robótica, 2008, Salvador. Anais do 5o. Simpósio Latino-Americano de Robótica	2431	2
	Simpósio Brasileiro de Redes Neurais, 2012, Curitiba. Proc. of the SBRN 2012	2438	3
	Brazilian Symposium on Artificial Intelligence, 2010, São Bernardo do Campo. Lecture Notes in Artificial Intelligence, subseries of Lecture Notes in Computer Science. Berlim: Springer-Verlag	2439	3
	Brazilian Symposium on Neural network, 2010, São Bernardo do Campo. 2010 Eleventh Brazilian Symposium on Neural Networks (SBRN 2010). California: Conference Publishing Services (CPS)	2440	3
9	Simposio Brasileiro de Automação Inteligente, 2009, Brasília. Anais do IX Simpósio Brasileiro de Automação Inteligente,	2441	3
	Computer Graphics International, 2008, Istanbul. Proceedings of Computer Graphics International	2442	3
U	Computer Graphics and Imaging - CGIM, 2011, Innsbruck/Austria. Proceedings of the 12th IASTED International Conference on Computer Graphics and Imaging - CGIM. Calgary/Canadá: ACTA Press	2453	3
	VIII Encontro Nacional de Inteligência Artificial - ENIA/CSBC, 2011, Natal. Anais do XXXI Congresso da Sociedade Brasileira de Computação - CSBC	2454	3
	X Simpósio Brasileiro de Automação Inteligente - SBAI, 2011, São João del-Rei/MG - Brasil. Anais do X Simpósio Brasileiro de Automação Inteligente - SBAI	2455	3
	26th Computer Graphics International Conference, 2008, Istambul , Turquia. Proceedings of the 26th Computer Graphics International Conference	2456	3
1	I Seminário Diálogos em Educação a Distância, 2012, Rio Grande. Seminário Diálogos em Educação a Distância. Rio Grande: SEAD-FURG	2460	3
	XIV Fórum de Estudos: Leituras de Paulo Freire, 2012, Erechim. Educação Popular e Transformação Social. Erechim: UFFS	2461	3
	XIV Fórum de Estudos: Leituras de Paulo Freire, 2012, Erechim. Educação Popular e Transformação Social. Erechim: UFFS	2462	3
	IX Seminário de Pesquisa em Educação da Região Sul - ANPED Sul, 2012, Caxias do Sul. A Pós-Graduação e as suas Interlocuções com a Educação Básica. Caxias do Sul	2463	3
	IV Congresso Internacional de Educação, Pesquisa e Gestão, 2012, Ponta Grossa. Políticas e Práticas Educacionais. Ponta Grossa	2464	3
	II Fórum Internacional sobre Prática Docente Universitária, 2012, Uberlândia. Planejamento e Avaliação no Contexto Glocal. Uberlandia	2465	3
	VI Seminário Nacional Diálogos com Paulo Freire, 2012, Santa Maria. Educação, cultura e resistências na sociedade contemporânea. Santa Maria	2466	3
	XIII Fórum de Estudos: Leituras de Paulo Freire, 2011, Santa Rosa - RS. XIII Fórum de Estudos: Leituras de Paulo Freire	2467	3
	XIII Fórum de Estudos: Leituras de Paulo Freire, 2011, Santa Rosa - RS. XIII Fórum de Estudos: Leituras de Paulo Freire	2468	3
	V Colóquio Internacional "Educação e Contemporaneidade", 2011, São Cristóvão. A Etnomatemática como Aporte às Práticas de Ensino na Educação de Jovens e Adultos. São Cristóvão	2469	3
	VII Congresso Internacional de Educação, 2011, São Leopoldo. Profissão Docente: Há Futuro para este Ofício?. São Leopoldo	2470	3
	I Fórum Internacional Sobre Prática Docente Universitária, 2011, Uberlânida. Inclusão Social e Tecnologias de Informação e Comunicação. Uberlândia	2471	3
	V Colóquio Internacional "Educação e Contemporaneidade", 2011, São Cristóvão. A Etnomatemática como Aporte às Práticas de Ensino na Educação de Jovens e Adultos. São Cristóvão	2472	3
	X Congresso Nacional de Educação - EDUCERE, 2011, Curitiba. Formação para mudanças no contexto da educação: políticas, representações sociais e práticas. Curitiba	2473	3
	X Congresso Nacional de Educação EDUCERE, 2011, Curitiba. Formação para mudanças no contexto da educação: políticas, representações sociais e práticas. Curitiba	2474	3
	X Congresso Nacional de Educação EDUCERE, 2011, Curitiba. Formação para mudanças no contexto da educação: políticas, representações sociais e práticas. Curitiba	2475	3
	V Seminário Diálogos com Paulo Freire, 2011, Pelotas. Das Práticas Escolares às Pedagogias das Marchas	2476	3
	V Escola Regional de Banco de Dados, 2009, Ijuí - RS. V Escola Regional de Banco de Dados. Ijuí - RS	2477	3
	Seminário de Informática, 2008, Torres - RS. Seminário de Informática	2478	3
1	BWSS 2012 - The Third Brazilian Workshop on Social Simulation, 2012, Curitiba. Anais do BWSS 2012. Porto Alegre: SBC	2517	3
1	BWSS 2012 - The Third Brazilian Workshop on Social Simulation, 2012, Curitiba. Anais do BWSS 2012. Porto Alegre: SBC	2518	3
1	BWSS 2012 - The Third Brazilian Workshop on Social Simulation, 2012, Curitiba. Anais do BWSS 2012. Porto Alegre: SBC	2519	3
1	II CBSF - Segundo Congresso Brasileiro de Sistemas Fuzzy, 2012, Natal. Anais do CBSF. Natal: UFRN	2520	3
1	Encontro Nacional de Inteligência Artificial - ENIA 2012, 2012, Curitiba. Anais do ENIA 2012. Porto Alegre: SBC	2521	3
1	WESAAC 2012 - VI Workshop-Escola de Sistemas de Agentes, seus Ambientes e Aplicações, 2012, Florianópolis. Anais do WESAAC 2012. Florianópolis: UFSC	2522	3
1	Workshop on Adaptive and Learning Agents - ALA 2012 / AAMAS 2012 -11th International Conference on Autonomous Agents and Multiagent Systems, 2012, Valencia, Espanha. Proceedings of AAMAS 2012 - ALA Workshop. Richland, South Carolina: IFAMAS	2523	3
1	WESAAC 2012 - Workshop-Escola de Sistemas de Agentes, seus Ambientes e Aplicações, 2012, Florianópolis. Anais do WESAAC 2012. Florianópolis: UFSC	2524	3
1	AMPLE@ECAI 2012 - 2nd International Workshop on Agent-based Modeling for Policy Engineering, European Conference on Artificial Intelligence, 2012, Montpellier, França. Proceedings of AMPLE@ECAI 2012. Montpellier: Université de Montpellier	2525	3
1	V Workshop-Escola de Sistemas de Agentes, seus Ambientes e Aplicações, 2011, Curitiba. Anais do WESAAC 2011. Curitiba: UTFPR	2526	3
1	WEIT 2011 - Workshop-Escola de Informática Teórica, 2011, Pelotas. Anais do WEIT 2011. Rio Grande: FURG	2527	3
1	WEIT 2011 - Workshop-Escola de Informática Teórica, 2011, Pelotas. Anais do WEIT 2011. Pelotas: UFPEL	2528	3
1	V Workshop-Escola de Sistemas de Agentes, seus Ambientes e Aplicações, 2011, Curitiba. Anais do WESAAC 2011. Curitiba: UTFPR	2529	3
1	WESAAC 2010: Workshop-Escola de Sistemas de Agentes, seus Ambientes e Aplicações, 2010, Rio Grande. Anais do WESAAC 2010. Porto Alegre: FURG	2530	3
1	WESAAC 2010: Workshop-Escola de Sistemas de Agentes, seus Ambientes e Aplicações, 2010, Rio Grande. Anais do WESACC 2010. Rio Grande: FURG	2531	3
1	WESAAC 2010: Workshop-Escola de Sistemas de Agentes, seus Ambientes e Aplicações, 2010, Rio Grande. Anais do WESAAC 2010. Rio Grande: FURG	2532	3
1	WESAAC 2010: Workshop-Escola de Sistemas de Agentes, seus Ambientes e Aplicações, 2010, Rio Grande. Anais do WESAAC 2010. Rio Grande: FURG	2533	3
1	WESAAC 2010: Workshop-Escola de Sistemas Multiagentes, seus Ambientes e Aplicações, 2010, Rio Grande. Anais do WESAAC 2010. Rio Grande: FURG	2534	3
627	The Multi-Agent Logics, Languages, and Organisations Federated Workshops (MALLOW 2010)/LAnguages, methodologies and Development tools for multi-agent systemS (LADS 2010), 2010, Lyon. Olivier Boissier, Amal El Fallah Seghrouchni, Salima Hassas and Nicolas Maudet (Eds.), MALLOW 2010 - The Multi-Agent Logics, Languages, and Organisations Federated Workshops, CEUR-WS Workshop Proceedings Series. Aachen: Sun SITE Central Europe/ RWTH Aachen University/Tilburg University	2535	3
627	The Multi-Agent Logics, Languages, and Organisations Federated Workshops (MALLOW 2010)/Workshop on Multi-Agent Systems and Simulation (MASS 2010), 2010, Lyon. Olivier Boissier, Amal El Fallah Seghrouchni, Salima Hassas and Nicolas Maudet (Eds.), MALLOW 2010 - The Multi-Agent Logics, Languages, and Organisations Federated Workshops, CEUR-WS Workshop Proceedings Series. Aachen: Sun SITE Central Europe/ RWTH Aachen University/Tilburg University	2536	3
14	Information Control Problems in Manufacturing, 2012, BUCHAREST. 14th IFAC Symposium on Information Control Problems in Manufacturing	2606	3
1	V Workshop on MSc Dissertation and PhD Thesis in Artificial Intelligence, 2010, São Bernardo do Campo. Anais do V Workshop on MSc Dissertation and PhD Thesis in Artificial Intelligence/Joint Conference SBIA/SBRN/JRI 2010. Porto Alegre: SBC	2537	3
1	Second Brazilian Workshop on Social Simulation (BWSS 2010) at Joint Conferences XX SBIA/XI SBRN/IV JRI, 2010, São Bernardo do Campo. (P. T. Aquino Junior, Ed.) Workshop Proceedings/Joint Conference 2010. Porto Alegre: SBC	2538	3
1	Second Brazilian Workshop on Social Simulation - BWSS 2010 at Joint Conference SBIA/SBRN/JRI 2010, 2010, São Bernardo do Campo. (P. T. Aquino Junior, Ed.) Workshop Proceedings/Joint Conference 2010. Porto Alegre: SBC	2539	3
1	Congresso Brasileiro de Sistemas Fuzzy, 2010, Sorocaba. Anais do CBSF 2010. São Carlos: UFSCar	2540	3
1	Second Brazilian Workshop on Social Simulation (BWSS 2010) at Joint Conferences XX SBIA/XI SBRN/IV JRI, 2010, São Bernardo do Campo. (P. T. Aquino Junior, Ed.) Workshop Proceedings/Joint Conference 2010. Porto Alegre: SBC	2541	3
6433	12th Ibero-American Conference on AI, 2010, Bahia Blanca. Angel Morales and Guillerno Simari (Eds.) Advances in Artificial Inteligence - IBERAMIA 2010, Lecture Notes In Artificial Intelligence. Berlin: Springer	2542	3
1	INFORUM - Simpósio de Informática, 2010, Braga. INFORUM Proceedings. Braga: Universidade do Minho	2543	3
1	Computability in Europe 2009: Mathematical Theory and Computational Practice, 2009, Heidelberg. Proceedings of CiE 2009. Heidelberg: Universität Heidelberg	2544	3
1	V Simpósio Brasileiro de Sistemas de Informação, 2009, Brasília. Anais do V Simpósio Brasileiro de Sistemas de Informação. Porto Alegre: SBC	2545	3
1	14th Portuguese Conference on Artificial Intelligence - EPIA'2009/Social Simulation and Modelling - SSM, 2009, 2009, Aveiro. L.S. Lopes, N. Lau, P. Mariano, L.M. Rocha (Eds.) New Trends in Artificial Intelligence. Aveiro: Universidade de Aveiro	2546	3
1	14th Portuguese Conference on Artificial Intelligence - EPIA'2009/Multi-Agent Systems: Theory and Applications - MASTA 2009, 2009, Aveiro. L.S. Lopes, N. Lau, P. Mariano, L.M. Rocha (Eds.) New Trends in Artificial Intelligence. Aveiro: Universidade de Aveiro	2547	3
1	14th Portuguese Conference on Artificial Intelligence - EPIA'2009/Social Simulation and Modelling - SSM 2009, 2009, Aveiro. L.S. Lopes, N. Lau, P. Mariano, L.M. Rocha (Eds.) New Trends in Artificial Intelligence. Aveiro: Universidade de Aveiro	2548	3
1	14th Portuguese Conference on Artificial Intelligence - EPIA'2009/Social Simulation and Modelling - SSM 2009, 2009, Aveiro. Proceedings of EPIA 2009. Aveiro, Portugal: APPIA/Universidade de Aveiro	2549	3
1	3rd Southern Conference on Computational Modeling, 2009, Rio Grande. Proceedings of MCSUL 2009. Rio Grande: FURG	2550	3
1	Fourth Conference on Computability in Europe: Logic and Theory of Algorithms, 2008, Atenas. Logic and Theory of Algorithms, Proceedings of CiE 2008. Atenas: Univ. Athens	2551	3
1	XXXIV Conferência Latinoamericano de Informática, 2008, Buenos Aires. Anales CLEI 2008. Buenos Aires: SADIO	2552	3
1	1st Brazilian Workshop on Social Simulation, 2008, Salvador. Proceedings of the BWSS 2008. Porto Alegre: SBC	2553	3
1	Workshop-Escola de Sistemas de Agentes para Ambientes Colaborativos	2554	3
5249	19th Brazilian Symposium on Artificial Intelligence, 2008, Salvador. G. Zaverucha and A. L. Costa (Eds.) Advances in Artificial Intelligence - SBIA 2008 Proceedings (Lecture Notes in Artificial Intelligence). Berlin: Springer	2555	3
1	Congresso de Matemática Aplicada e Computacional, 2008, 2008, Belém. Anais do CNMAC 2008. Belém: SBMAC	2556	3
1	19th Brazilian Symposium on Artificial Intelligence - Workshop on Social Simulation (SBIA - BWSS 2008), 2008, Salvador. Proceedings of BWSS 2009. Porto Alegre: SBC	2557	3
1	SEGeT 2008 - V Simpósio de Excelência em Gestão e Tecnologia, 2008, Resende, RJ. Anais do SEGeT 2008 - V Simpósio de Excelência em Gestão e Tecnologia. Resende, RJ: Associação Educacional Dom Bosco	2558	3
1	Jornadas Chilenas de Computación 2008 - Workshop en Agentes y Sistemas Colaborativos, 2008, Punta Arenas. Anales de las Jornadas Chilenas de Computación 2008. Santiago, Chile: Sociedad Chilena de Computación	2559	3
1	BWSS 2008 - Brazilian Workshop on Social Simulation, 2008, Salvador. Proceedings of the BWSS 2008 - Brazilian Workshop on Social Simulation. Pelotas: UCPel/SBC	2560	3
	Simpósio Brasileiro de Sistemas Elétricos, 2008, Belo Horizonte. Anais do SBSE 2008	2569	3
	Congresso Brasileiro de Automática, 2008, 2008, Juiz de Fora. Anais eletrônicos do CBA 2008	2570	3
	LARS 2008 - 5º Simpósio Latino-Americano de Robótica, 2008, Salvador/Brasil. Anais do 5º Simpósio Latino-Americano de Robótica	2571	3
	2012 IEEE Third Latin American Symposium on Circuits and Systems (LASCAS), 2012, Playa del Carmen. Proceedings of 2012 IEEE Third Latin American Symposium on Circuits and Systems (LASCAS)	2574	3
	Simposio Sul de Microeletronica - SIM 2012, 2012, Sao Miguel das Missoes. Anais do Simposio Sul de Microeletronica - SIM 2012	2575	3
	Simposio Sul de Microeletronica - SIM 2012, 2012, Sao Miguel das Missoes. Anais do Simposio Sul de Microeletronica - SIM 2012	2576	3
	Simposio Sul de Microeletronica - SIM 2012, 2012, Sao Miguel das Missoes. Anais do Simposio Sul de Microeletronica - SIM 2012	2577	3
	SForum - The 12th Microelectronics Students Forum, 2012, Brasilia. SForum - The 12th Microelectronics Students Forum	2578	3
	SForum - The 12th Microelectronics Students Forum, 2012, Brasilia. SForum - The 12th Microelectronics Students Forum	2579	3
	SIM 2011, 2011, Porto Alegre. SIM 2011	2580	3
	XVI Iberchip Workshop, 2010, Foz do Iguaçu. XVI Iberchip Workshop	2581	3
	SIM 2010, 2010, Porto Alegre. SIM 2010	2582	3
	XXIV CRICTE, 2010, Rio Grande. XXIV CRICTE - Anais	2583	3
	XXIV CRICTE, 2010, Rio Grande. XXIV CRICTE - Anais	2584	3
	XXIV CRICTE, 2010, Rio Grande. XXIV CRICTE - Anais	2585	3
	DATE 2009, 2009, Nice - França. DATE Proceedings	2586	3
	LATW, 2009, Buzios. IEEE Digital Library - IEEE Xplore IEEE Catalog Number: CFP09LAT Library of Congress: 2009901807	2587	3
	24th IEEE International Symposium on Defect and Fault Tolerance in VLSI Systems, 2009, Chicago. Proceeding of 24th IEEE International Symposium on Defect and Fault Tolerance in VLSI Systems	2588	3
	IWS09 Iberchip XV Workshop, 2009, Buenos Aires. Anais of Iberchip XV Workshop 2009	2589	3
	SIM 2009, 2008, Bento Gonçalves. Proceedings of SIM 2009	2590	3
	DECIDE 2008, 2008, Mexico. Proceedings of DECIDE 2008	2591	3
	IEEE/OES Oceans, 2009, Bremen, Germany. Proceedings of IEEE/OES Oceans	3097	3
1	International Conference on Offshore and Marine Technology: Science and Innovation, 2012, Rio Grande. Proceedings of First International Conference on Offshore and Marine Technology: Science and Innovation	2607	3
1	The Sixth International Conference on Mobile Ubiquitous Computing, Systems, Services and Technologies, 2012, Barcelona. The Sixth International Conference on Mobile Ubiquitous Computing, Systems, Services and Technologies. Sao Diego: Elsevier	2608	3
1	IX - Congresso Brasileiro de Ensino Superior a Distância, 2012, Recife. IX - Congresso Brasileiro de Ensino Superior a Distância	2609	3
1	Sixth World Congress on Engineering Asset Management (WCEAM2011), 2011, Cincinnati. Sixth World Congress on Engineering Asset Management (WCEAM2011)	2610	3
	1st IFAC Workshop on Advanced Maintenance Engineering, Services and Technology - IFAC A-MEST'10, 2010, 2010, Lisboa. Proceedings of the 1st IFAC Workshop on Advanced Maintenance Engineering, Services and Technology - IFAC A-MEST'10, 2010	2611	3
	12th Brazilian Workshop on Real-Time and Embedded Systems, 2010, Gramado. . Anais do 12th Brazilian Workshop on Real-Time and Embedded Systems	2612	3
	14º Congresso Internacional e Exposição Sul-Americana de Automação, Sistemas e Instrumentação, 2010, 2010, São Paulo. Anais do Brazil Automation ISA 2010	2613	3
1	World Congress on Engineering Asset Management 2009, 2009, Athens. WCEAM2009 - World Congress on Engineering Asset Management 2009. London: Springer-Verlag London Ltd	2614	3
1	The Modern Information Technology in the Innovation Processes of the Industrial Enterprises - MITIP2009, 2009, Bergamo. 11th International Conference on The Modern Information Technology in the Innovation Processes of the Industrial Enterprises. Bergamo: Università degli Studi di Bergamo	2615	3
	6º Seminário de Eletrônica de Potência e Controle, 2012, Santa Maria. 6. Seminário de Eletrônica de Potência e Controle - SEPOC. Santa Maria	2622	3
	2012 Sixth IEEE/PES Transmission and Distribution: Latin America Conference and Exposition (TD-LA), 2012, Montevideo. Proceedings of the 2012 Sixth IEEE/PES Transmission and Distribution: Latin America Conference and Exposition (TD-LA)	2623	3
	2012 Sixth IEEE/PES Transmission and Distribution: Latin America Conference and Exposition (TD-LA), 2012, Montevideo. Proceedings of the 2012 Sixth IEEE/PES Transmission and Distribution: Latin America Conference and Exposition (TD-LA)	2624	3
	2012 Sixth IEEE/PES Transmission and Distribution: Latin America Conference and Exposition (TD-LA), 2012, Montevideo. Proceedings of the 2012 Sixth IEEE/PES Transmission and Distribution: Latin America Conference and Exposition (TD-LA)	2625	3
	XIX Congresso Brasileiro de Automática, CBA 2012, 2012, Campina Grande. Anais do XIX Congresso Brasileiro de Automática, CBA 2012	2626	3
	XIX Congresso Brasileiro de Automática, CBA 2012, 2012, Campina Grande. Anais do XIX Congresso Brasileiro de Automática, CBA 2012	2627	3
	XIX Congresso Brasileiro de Automática, CBA 2012, 2012, Campina Grande. Anais do XIX Congresso Brasileiro de Automática, CBA 2012	2628	3
01	SBCCI 2010, 2010, São Paulo. SBCCI'10 Proceedings of the 23rd symposium on Integrated circuits and system design. New York: ACM	2629	3
	25th South Symposium on Microelectronics, 2010, Pelotas. Anais do SIM 2010. Porto Alegre: EDIPUCRS	2630	3
01	Fault-Tolerant Distributed Algorithms on VLSI Chips, 2009, Dagstuhl. Dagstuhl Seminar Proceedings. Dagstuhl: Schloss Dagstuhl - Leibniz-Zentrum fuer Informatik, Germany	2631	3
01	3rd International Conference on Design and Technology of Integrated Systems in Nanoscale Era, 2008, DTIS 2008., 2008, Tozeur. Proceedings of DTIS 2008	2632	3
01	Joint 6th International IEEE Northeast Workshop on Circuits and Systems and TAISA Conference, 2008. NEWCAS-TAISA 2008., 2008, Montreal. Proceedins of NEWCAS-TAISA 2008	2633	3
01	51st Midwest Symposium on Circuits and Systems, 2008. MWSCAS 2008., 2008, Knoxville. Proceedings of MWSCAS 2008	2634	3
01	15th International Conference on Electronics, Circuits and Systems, 2008. ICECS 2008., 2008, St. Julien's. Proceedings of ICECS 2008	2635	3
01	15th International Conference on Electronics, Circuits and Systems, 2008. ICECS 2008., 2008, St. Julien's. Proceedings of ICECS 2008	2636	3
	Colloque National du GDR SoC-SiP, 2008, Paris. Colloque National du GDR SoC-SiP	2637	3
	GEOProcessing 2012, 2012, Valência / Espanha. GEOProcessing 2012. Valência / Espanha: IARIA	2665	3
	1o. Seminário Nacional de Inclusão Digital e Software Livre, 2012, Passo Fundo / RS. SENID 2012. Passo Fundo / RS: Editora UPF	2666	3
	Fourth International Conference on Networked Digital Technologies, 2012, Dubai / Emirados Árabes. NDT 2012 - Communications in Computer and Information Science (CCIS 7899) of Springer Lecture Notes Series. Berlin: Springer	2667	3
	Workshop-Escola de Sistemas de Agentes, seus Ambientes e Aplicações, 2012, Florianópolis / SC. WESAAC 2012. Florianópolis / SC: UFSC	2668	3
	Workshop de Desafios da Computação Aplicada à Educação, 2012, Curitiba / PR. Desafie - CSBC 2012. Curitiba / PR: SBC	2669	3
	Congresso Nacional de Diversidade e Inclusão, 2012, São José dos Campos / SP. CONADI 2012. São José dos Campos / SP: CONADI	2670	3
4	Seminário de Extensão Universitária da Região Sul, 2012, Rio Grande / RS. SEURS 2012. Rio Grande / RS: Editora FURG	2671	3
	II Congreso Internacional de Computación e Informática, 2012, Cidad del Carmen. CONACI 2012. Berlin: Springer	2672	3
	Seminário de Extensão Universitária da Região Sul, 2012, Rio Grande / RS. SEURS 2012. Rio Grande / RS: Editora FURG	2673	3
	Conferência Sul-Brasileira de Modelagem Computacional, 2012, Rio Grande / RS. MCSUL 2012. Rio Grande / RS: Editora FURG	2674	3
	Conferência Sul-Brasileira de Modelagem Computacional, 2012, Rio Grande / RS. MCSUL 2012. Rio Grande / RS: Editora FURG	2675	3
	Conferência Sul-Brasileira de Modelagem Computacional, 2012, Rio Grande / RS. MCSUL 2012. Rio Grande / RS: Editora FURG	2676	3
	Conferência Sul-Brasileira de Modelagem Computacional, 2012, Rio Grande / RS. MCSUL 2012. Rio Grande / RS: Editora FURG	2677	3
	Brazilian Workshop on Social Simulation, 2012, Curitiba. BWSS 2012. Los Alamos: IEEE	2678	3
	Brazilian Workshop on Social Simulation, 2012, Curitiba / PR. BWSS 2012. Los Alamos: IEEE	2679	3
	Conferência Sul-Brasileira de Modelagem Computacional, 2012, Rio Grande / RS. MCSUL 2012. Rio Grande / RS: Editora FURG	2680	3
	III Workshop de Computação Aplicada ao Meio Ambiente e ao Recursos Naturais, 2011, Natal / RN. WCAMA 2011. Porto Alegre / RS: CSBC	2681	3
1	Simposio Brasileiro de Sistemas Elétricos, 2008, Belo Horizonte. Anais do SBSE 2008	3098	3
	XI Congreso Iberoamericano de Extensión Universitaria, 2011, Santa Fé / Argentina. XI Congreso Iberoamericano de Extensión Universitaria. Santa Fé / Argentina: La Universidad Nacional del Litoral	2682	3
	Seminário de Extensão Universitária da Região Sul, 2011, Foz do Iguaçu / PR. SEUS 2011. Foz do Iguaçu / PR: Unioeste	2683	3
	Congresso Brasileiro de Extesão Universitária, 2011, Porto Alegre RS. CBEU 2011. Porto Alegre / RS: UFRGS	2684	3
	I Simpósio Brasileiro de Educação Inclusiva, 2011, Salvador / BA. I Simpósio Brasileiro de Educação Inclusiva. Salvador / BA: UFBA	2685	3
	II Seminário de Políticas Públicas e Educação: constituindo a cidadania?, 2011, Rio Grande RS. II Seminário de Políticas Públicas e Educação. Rio Grande RS: FURG	2686	3
	The Second International Conference on Networked Digital Technologies, 2010, Praga - República Tcheca. NDT 2010 - LNCS 7899. Heidelberg - Alemanha: Springer	2687	3
	Congresso Regional de Iniciação Científica e Tecnológica em Engenharia, 2010, Rio Grande / RS. CRICTE 2010. Rio Grande	2688	3
	Congresso Regional de Iniciação Científica e Tecnológica em Engenharia, 2010, Rio Grande / RS. CRICTE 2010. Rio Grande	2689	3
	Congresso Regional de Iniciação Científica e Tecnológica em Engenharia, 2010, Rio Grande / RS. CRICTE 2010. Rio Grande	2690	3
	MCSul 2010 - Simpósio de Modelagem Computacional do Sul, 2010, Rio Grande / RS. MCSul 2010. Rio Grande: FURG	2691	3
	MCSul 2010 - Simpósio de Modelagem Computacional do Sul, 2010, Rio Grande / RS. MCSul 2010. Rio Grande: FURG	2692	3
	Cargese Interdisciplinar Seminar 2009, 2009, Cargese. Modeling Simulation of Evolutionary Agents in Virtual Worlds	2693	3
	WCAMA - Workshop de Computação Aplicada ao Meio Ambiente, 2009, Bento Gonçalves. WCAMA	2694	3
02	International Conference on Computer Engineering and Technology, 2009. International Conference on Computer Engineering and Technolog	2695	3
	III Worshop Escola de Sistemas de Agentes para Ambientes Colaborativos, 2009, Caxias do Sul. WESAAC	2696	3
	MDEIS 2008 joint to 10th International Conference on Enterprise Information Systems (ICEIS 2008), 2008, Barcelona. The 4th International Workshop on Model-Driven Enterprise Information Systems	2697	3
	KRRSW 2008 joint to 5th European Semantic Web Conference (ESWC 2008), 2008, Tenerife. 1st International Workshop on Knowledge Reuse and Reengineering over the Semantic Web	2698	3
	SEMISH, 2008, Belém. Seminário Integrado de Software e Hardware (SEMISH 2008)	2699	3
	WESAAC, 2008, Santa Cruz do Sul. Workshop-Escola de Sistemas de Agentes para Ambientes Colaborativos	2700	3
	Seminário de Tecnologia da Informação Aplicada (STIA), 2008, Chapecó / SC. Seminário de Tecnologia da Informação Aplicada	2701	3
	Simpósio Brasileiro de Inteligência Artificial - Concurso de Teses e Dissertações em Inteligência Artificial, 2008, Salvador. SBIA/CTDIA2008	2702	3
	Congresso Sul Brasileiro de Computação, 2008, Criciúma / SC. Sulcomp 2008	2703	3
	Congresso Sul Brasileiro de Computação, 2008, Criciúma / SC. Sulcomp 2008	2704	3
	V Conferência Sul em Modelagem Computacional - MCSul 2012, 2012, Rio Grande. Anais da V Conferência Sul em Modelagem Computacional - VMCSul	2749	3
	Segundo Congresso Brasileiro de Sistemas Fuzzy, 2012, Natal - RN. Recentes Avanços em Sistemas "Fuzzy"	2750	3
	X Simpósio Brasileiro de Automação Inteligentes, 2011, São João del-Rei, MG. Anais do X Simpósio Brasileiro de Automação Inteligente	2751	3
	2010 Fourth International Conference on Network and System Security, 2010, Melbourne. Proceedings of International Conference on Data and Knowledge Engineering 2010	2752	3
	1st International Conference on Applied Robotics for the Power Industry (CARPI), 2010, Montreal. Proceedings of 1st International Conference on Applied Robotics for the Power Industry (CARPI)	2753	3
9	Simpósio Brasileiro de Automação Inteligente - SBAI, 2009, Brasília. ANAIS DO IX SIMPÓSIO BRASILEIRO DE AUTOMAÇÃO INTELIGENTE"	2754	3
	Congresso Brasileiro de Automática, 2008, Juiz de Fora. Anais XVII do Congresso Brasileiro de Automática	2755	3
	Congresso Brasileiro de Automática, 2008, Juiz de Fora. Anais do XVII Congresso Brasileiro de Automática	2756	3
	5th IEEE Latin American Robotics Symposium, 2008, Salvador. Proceedings of 5th Latin American Robotics Symposium	2757	3
	5th IEEE Latin American Robotics Symposium, 2008, Salvador. Proceedings of 5th Latin American Robotics Symposium	2758	3
	Escola Regional de Banco de Dados, 2012, Curitiba. Anais da VIII Escola Regional de Banco de Dados	2761	3
	Escola Regional de Banco de Dados, 2012, Curitiba. Anais da VIII Escola Regional de Banco de Dados	2762	3
	XXXI International Conference of the Chilean Computer Science Society (SCCC), 2012, Valparaíso. Proceedings of the International Conference of the Chilean Computer Science Society	2763	3
	V Conferência Sul em Modelagem Computacional (MCSUL), 2012, Rio Grande. Anais da V Conferência Sul em Modelagem Computacional	2764	3
	XXXVIII Seminário Integrado de Software e Hardware - SEMISH, 2011, Natal. Anais do XXXI Congresso da Sociedade Brasileira de Computação	2765	3
	XXX International Conference of the Chilean Computer Science Society - SCCC, 2011, Curicó. Proceedings of the XXX International Conference of the Chilean Computer Science Society	2766	3
	IADIS International Conference WWW/Internet, 2011, Rio de Janeiro. Proceedings of the IADIS International Conference WWW/Internet 2011	2767	3
	XXIII Simpósio Brasileiro de Bancos de Dados - SBBD, 2008, Campinas. Anais do XXIII Simpósio Brasileiro de Bancos de Dados	2768	3
	IV Escola Regional de Bancos de Dados - ERBD, 2008, Florianópolis. Anais da IV Escola Regional de Bancos de Dados	2769	3
1	Conferência Sul em Modelagem Computacional (MCSUL), 2012, Rio Grande. V MCSUL	2779	3
2	Seminário Internacional de Ciência e Educação, 2012, Rio Grande. II Seminário Internacional de Educação em Ciências	2780	3
2	I Seminário Internacional de Educação em Ciências, 2011, Rio Grande. I SINTEC - Seminário Internacional de Educação em Ciências	2781	3
	1st International Conference on Applied Robotics for the Power Industry (CARPI), 2010, Montreal. 1st International Conference on Applied Robotics for the Power Industry (CARPI)	2782	3
	CBA 2010 - XVIII Congresso Brasileiro de Automática, 2010, Bonito. CBA 2010 - XVIII Congresso Brasileiro de Automática	2783	3
1	NAVTEC 2012, 2012. Conferência Internacional em Tecnologias Naval e Offshore: Ciência e Inovação	3204	3
	Latin American Robotics Symposium and Intelligent Robotics Meeting, 2010, São Bernardo do Campo. Latin American Robotics Symposium and Intelligent Robotics Meeting	2784	3
	IX Simpósio Brasileiro de Automação Inteligente, 2009, Brasilia. IX Simpósio Brasileiro de Automação Inteligente	2785	3
	Rio Pipeline 2009 Conference and Exhibition, 2009, Rio de Janeiro. Rio Pipeline 2009 Conference and Exhibition	2786	3
	5th Latin American Robotics Symposium, 2008, Slavador. IEEE Latin American Robotics Symposium	2787	3
	Simpósio Brasileiro de Sistemas Elétricos, 2008, Belo Horizonte. Simpósio Brasileiro de Sistemas Elétricos	2788	3
	Congresso Brasileiro de Automática, 2008, Juiz de Fora. Congresso Brasileiro de Automática	2789	3
	XXIII ANPET - Congresso de Pesquisa e Ensino em Transportes, 2009, Vitória/ES. Panorama Naconal da Pesquisa em Transportes 2009	2792	3
	III Workshop de Computação Aplicada ao Meio Ambiente e ao Recursos Naturais, 2011, Natal / RN. III Workshop de Computação Aplicada ao Meio Ambiente e ao Recursos Naturais	2793	3
1	Workshop on Adaptive and Learning Agents - ALA 2012 / AAMAS 2012 -11th International Conference on Autonomous Agents and Multiagent Systems, 2012, Valência. Proceedings of AAMAS 2012 - ALA Workshop (Enda Howley, Peter Vrancx and Matt Knudson, eds.). Valência: IFAMAS	2836	3
1	WESAAC 2012 - VI Workshop-Escola de Sistemas de Agentes, seus Ambientes e Aplicações, 2012, Florianópolis. J.F. H ubner; A.A.F. Brandão; R. Silveira; J. Marchi (Eds.) Anais do WESAAC 2012. Florianópolis: UFSC	2837	3
1	WESAAC 2012 - VI Workshop-Escola de Sistemas de Agentes, seus Ambientes e Aplicações, 2012, Florianópolis. J.F. H ubner; A.A.F. Brandão; R. Silveira; J. Marchi (Eds.) Anais do WESAAC 2012. Florianópolis: UFSC	2838	3
1	WESAAC 2012 - VI Workshop-Escola de Sistemas de Agentes, seus Ambientes e Aplicações, 2012, Florianópolis. J.F. H ubner; A.A.F. Brandão; R. Silveira; J. Marchi (Eds.) Anais do WESAAC 2012. Florianópolis: UFSC	2839	3
1	VIII Congresso Nacional de Excelência em Gestão, 2012, Rio de Janeiro. Anais do VIII CNEG. Rio de Janeiro: UFF	2840	3
1	Encontro Nacional de Inteligência Artificial - ENIA 2012, 2012, Curitiba. Anais do ENIA 2012 - Proceedings of the Brazilian Conference on Intelligent Systems. Porto Alegre: SBC	2841	3
1	II CBSF - Segundo Congresso Brasileiro de Sistemas Fuzzy, 2012, Natal. Anais do CBSF. Natal: UFRN	2842	3
1	II CBSF - Segundo Congresso Brasileiro de Sistemas Fuzzy, 2012, Natal. Anais do CBSF. Natal: UFRN	2843	3
1	II CBSF - Segundo Congresso Brasileiro de Sistemas Fuzzy, 2012, Natal. Anais do CBSF. Natal: UFRN	2844	3
1	II CBSF - Segundo Congresso Brasileiro de Sistemas Fuzzy, 2012, Natal. Anais do CBSF. Natal: UFRN	2845	3
1	BWSS 2012 - The Third Brazilian Workshop on Social Simulation, 2012, Curitiba. Proceedings of BWSS 2012 - Proceedings of the Braziian Conference on Intelligent Systems BRACIS 2012. Porto Alegre: SBC	2846	3
1	BWSS 2012 - The Third Brazilian Workshop on Social Simulation, 2012, Curitiba. Proceedings of BWSS 2012 - Proceedings of the Braziian Conference on Intelligent Systems BRACIS 2012. Porto Alegre: SBC	2847	3
1	BWSS 2012 - The Third Brazilian Workshop on Social Simulation, 2012, Curitiba. Proceedings of BWSS 2012 - Proceedings of the Braziian Conference on Intelligent Systems BRACIS 2012. Porto Alegre: SBC	2848	3
1	BWSS 2012 - The Third Brazilian Workshop on Social Simulation at BRACIS 2012, 2012, Curitiba. Proceedings of BWSS 2012 - Proceedings of the Brazilian Conference on Intelligente Systems - BRACIS 2012 - BWSS 2012. Porto Alegre: SBC	2849	3
1	V Workshop-Escola de Sistemas de Agentes, seus Ambientes e Aplicações, 2011, Curitiba. Gustavo A. G. Lugo, Jomi F- Hübner, Cesar A. Tacla (Eds.) Anais do WESAAC 2011. Curitiba: UTFPR	2850	3
1	WEIT 2011 - Workshop-Escola de Informática Teórica, 2011, Pelotas. G.P. Dimuro, L. Foss, M.S. Aguiar, S. Costa, A.C.R. Costa (Eds.) Anais do WEIT 2011. Rio Grande: FURG	2851	3
1	WEIT 2011 - Workshop-Escola de Informática Teórica, 2011, Pelotas. G.P. Dimuro, L. Foss, M.S. Aguiar, S. Costa, A.C.R. Costa (Eds.) Anais do WEIT 2011. Rio Grande: FURG	2852	3
1	WEIT 2011 - Workshop-Escola de Informática Teórica, 2011, Pelotas. G.P. Dimuro, L. Foss, M.S. Aguiar, S. Costa, A.C.R. Costa (Eds.) Anais do WEIT 2011. Rio Grande: FURG	2853	3
1	WEIT 2011 - Workshop-Escola de Informática Teórica, 2011, Pelotas. G.P. Dimuro, L. Foss, M.S. Aguiar, S. Costa, A.C.R. Costa (Eds.) Anais do WEIT 2011. Rio Grande: FURG	2854	3
1	WEIT 2011 - Workshop-Escola de Informática Teórica, 2011, Pelotas. G.P. Dimuro, L. Foss, M.S. Aguiar, S. Costa, A.C.R. Costa (Eds.) Anais do WEIT 2011. Rio Grande: FURG	2855	3
1	WEIT 2011 - Workshop-Escola de Informática Teórica, 2011, Pelotas. G.P. Dimuro, L. Foss, M.S. Aguiar, S. Costa, A.C.R. Costa (Eds.) Anais do WEIT 2011. Rio Grande: FURG	2856	3
1	WEIT 2011 - Workshop-Escola de Informática Teórica, 2011, Pelotas. G.P. Dimuro, L. Foss, M.S. Aguiar, S. Costa, A.C.R. Costa (Eds.) Anais do WEIT 2011. Rio Grande: FURG	2857	3
1	Workshop-Escola de Sistemas de Agentes, seus Ambientes e Aplicações, 2010, Rio Grande. Anais do WESAAC 2010. Rio Grande: FURG	2858	3
1	Workshop-Escola de Sistemas de Agentes, seus Ambientes e Aplicações, 2010, Rio Grande. Anais do WESAAC 2010. Rio Grande: FURG	2859	3
627	The Multi-Agent Logics, Languages, and Organisations Federated Workshops (MALLOW 2010)/LAnguages, methodologies and Development tools for multi-agent systemS (LADS 2010), 2010, Lyon. Olivier Boissier, Amal El Fallah Seghrouchni, Salima Hassas and Nicolas Maudet (Eds.), MALLOW 2010 - The Multi-Agent Logics, Languages, and Organisations Federated Workshops, CEUR-WS Workshop Proceedings Series. Aachen: Sun SITE Central Europe/ RWTH Aachen University/Tilburg University	2860	3
627	The Multi-Agent Logics, Languages, and Organisations Federated Workshops (MALLOW 2010)/Workshop on Multi-Agent Systems and Simulation (MASS), 2010, Lyon. Olivier Boissier, Amal El Fallah Seghrouchni, Salima Hassas and Nicolas Maudet (Eds.), MALLOW 2010 - The Multi-Agent Logics, Languages, and Organisations Federated Workshops, CEUR-WS Workshop Proceedings Series. Aachen: Sun SITE Central Europe/ RWTH Aachen University/Tilburg University	2861	3
1	V Workshop on MSc Dissertation and PhD Thesis in Artificial Intelligence/Joint Cinference SBIA/SBRN/JRI 2010, 2010, São Bernardo do Campo. (P. T. Aquino, Ed.) Workshop Proceedings/Joint Conference 2010. Porto Alegre: SBC	2862	3
1	Second Brazilian Workshop on Social Simulation (BWSS 2010) at Joint Conferences XX SBIA/XI SBRN/IV JRI, 2010, São Bernardo do Campos. (P. T. Aquino Junior, Ed.) Workshop Proceedings/Joint Conference 2010. Porto Alegre: SBC	2863	3
1	Congresso Brasileiro de Sistemas Fuzzy, 2010, Sorocaba. Anais do CBSF 2010. São Carlos: UFSCar	2864	3
1	Second Brazilian Workshop on Social Simulation - BWSS 2010 at Joint Conference SBIA/SBRN/JRI 2010, 2010, São Bernardo do Campo. (P. T. Aquino Junior, Ed.) Workshop Proceedings/Joint Conference 2010. Porto Alegre: SBC	2865	3
1	4th Southern Conference on Computational Modeling/IX Encontro Regional de Matemática Aplicada e Computacional, 2010, Rio Grande. Anais do 4 MCSUL/IX ERMAC. Rio Grande: FURG	2866	3
1	4th Southern Conference on Computational Modeling/IX Encontro Regional de Matemática Aplicada e Computacional, 2010, Rio Grande. Anais do 4MCSUL/IX ERMAC. Rio Grande: FURG	2867	3
1	4th Southern Conference on Computational Modeling/IX Encontro Regional de Matemática Aplicada e Computacional, 2010, Rio Grande. Anais do 4MCSUL/IX ERMAC. Rio Grande: FURG	2868	3
1	4th Southern Conference on Computational Modeling/IX Encontro Regional de Matemática Aplicada e Computacional, 2010, Rio Grande. Anais do 4 MCSUL/IX ERMAC. Rio Grande: FURG	2869	3
1	Computability in Europe 2009: Mathematical Theory and Computational Practice, 2009, Heidelberg. Klaus Ambos-Spies, Benedikt Löwe, Wolfgang Merkle (Editors) Mathematical Theory and Computational Practice. Heidelberg: University of Heidelberg	2870	3
1	International Fuzzy Systems Association World Congress/European Society for Fuzzy Logic and Technonoly Conference 2009, 2009, Lisboa. Proceedings of 2009 ISFA World Congress/2009 EUSFLAT Conference. Lisboa: ISFA/EUSFLAT	2871	3
1	14th Portuguese Conference on Artificial Intelligence - EPIA'2009/Social Simulation and Modelling - SSM, 2009, Aveiro. L.S. Lopes, N. Lau, P. Mariano, L.M. Rocha (eds.) New Trends In Artificial Intelligence. Aveiro: Universidade de Aveiro	2872	3
1	14th Portuguese Conference on Artificial Intelligence - EPIA'2009/Multi-Agent Systems: Theory and Applications - MASTA 2009, 2009, Aveiro. L.S. Lopes, N. Lau, P. Mariano, L.M. Rocha (eds.) New Trends In Artificial Intelligence. Aveiro: Universidade de Aveiro	2873	3
2	XXXII Congresso Nacional de Matemática Aplicada e Computacional, 2009, Cuiabá. A. L. Bortoli et al. (Eds.) Anais do CNMAC. São Carlos: SBMAC	2874	3
1	The 3rd Southern Conference on Computational Modeling, 2009, Rio Grande. Proceedings of MCSUL 2009. Rio Grande: FURG	2875	3
1	Fourth Conference on Computability in Europe: Logic and Theory of Algorithms, 2008, Athens. Arnold Beckmann, Costas Dimitracopoulos and Benedikt Löwe (eds.) Logic and Theory of Algorithms, Proceedings of CiE 2008. Athens: University of Athens	2876	3
5110	15th Workshop on Logic, Information, Language and Computation, 2008, Edinburgh. Wilfrid Hodges and Ruy de Queiroz (Eds.) Logic, Language, Information and Computation15th International Workshop, WoLLIC 2008 Edinburgh, UK, July 1-4, 2008 Proceedings (Lecture Notes in Artificial Intelligence). Berlin: Springer-Verlag	2877	3
1	XXXI Congresso Nacional de Matemática Aplicada e Computacional, 2008, Belém. E. C. Abreu et al. Anais do CNMAC. São Carlos: SBMAC	2878	3
1	XXXI Congresso Nacional de Matemática Aplicada e Computacional, 2008, Belém. E. C. Abreu et al. (Eds.) Anais do CNMAC. São Carlos: SBMAC	2879	3
1	II Workshop-Escola de Sistemas de Agentes para Sistemas Colaborativos, 2008, Santa Cruz. R. Frozza e A. A. Kozen (Org.) Anais do WESAAC 2008. Santa Cruz do Sil: EDUNISC	2880	3
1	II Workshop Escola de Sistemas de Agentes para Ambientes Colaborativos, 2008, Santa Cruz. R. Frozza e A. A. Konzen (Org.) Anais do WESAAC 2008. Santa Cruz do Sul: EDUNIISC	2881	3
1	II Workshop-Escola de Sistemas de Agentes para Ambientes Colaborativos, 2008, Santa Cruz. R. Frozza e A. A. Konzen (Org.) Anais do WESAAC 2008. Santa Cruz so Sul: EDUNISC	2882	3
5249	19th Brazilian Symposium on Artificial Intelligence, 2008, Salvador. G. Zaverucha and A. L. Costa (Eds.) Advances in Artificial Intelligence - SBIA 2008 Proceedings (Lecture Notes in Artificial Intelligence). Berlin: Springer	2883	3
1	Third Workshop on Logical and Semantic Frameworks, with Applications, 2008, Salvador. Mario Benevides and Elaine Pimentel (eds.), Pré-Proceedings of LSFA 2008. Porto Alegre: SBC	2884	3
1	(G. P. Henning, M. R. Galli y S. Goneet, eds.) XXXIV Conferência Latinoamericano de Informática, 2008, Santa Fe. Anales CLEI 2008. Buenos Aires: Sadio	2885	3
1	SBIA 2008 / BWSS 2008 - 1st Brazilian Workshop on Social Simulation, 2008, Salvador. Proceedings of SBIA 2008 / BWSS 2008. Porto Alegre: SBC	2886	3
1	VII Simpósio de Informática da Região Centro do RS, 2008, Santa Maria. Anais do SIRC 2008. Santa Maria: UNIFRA	2887	3
1	IV Workshop on MSc Dissertation and PhD Thesis in Artificial Intelligence (WTDIA), 2008, Salvador. Proceedings of IV WTDIA. Porto Alegre: SBC	2888	3
1	VI Best MSc Dissertation/PhD Thesis Contest (CTDIA), 2008, Salvador. Proceedings of VI CTDIA. Porto Alegre: SBC	2889	3
	BTAS '09, 2009, Washington, D.C. IEEE 3rd International Conference on Biometrics: Theory, Applications, and Systems, 2009	2904	3
	VIII Congreso Internacional sobre Investigación en la Didáctica de las Ciencias, 2009, Barcelona. Enseñanza de las Ciencias - VIII Congreso Internacional sobre Investigación en la Didáctica de las Ciencias	2905	3
	IV Seminário Jogos Eletrônicos, Educação e Comunicação - construindo novas trilhas, 2008, Bahia. IV Seminário Jogos Eletrônicos, Educação e Comunicação - construindo novas trilhas	2906	3
	Simpósio Brasileiro de Jogos e Entretenimento Digital, 2008, Belo Horizonte. SBGAMES 2008	2907	3
7409	Brazilian Symposium on Bioinformatics, 2012, Campo Grande. LNBI-LNCS. Advances in Bioinformatics and Computational Biology. Berlin: Springer-Verlag	2914	3
6098	The Twenty Third International Conference on Industrial, Engineering Other Applications of Applied Intelligent Systems, 2010, Córdoba. Trends in Applied Intelligent Systems. IEA/AIE 2010 Part III LNAI-LNCS. Berlin: Springer-Verlag	2915	3
1	IADIS International Conference Applied Computing, 2010, Timisoara. Applied Computing	2916	3
	IADIS International Conference Applied Computing, 2010, Timisoara. Applied Computing	2917	3
5167	III Brazilian Simposium on Bioinformatics, 2008, Santo André. LNBI-LNCS. Advances in Bioinformatics and Computational Biology.. Berlin: Springer-Verlag	2918	3
	IV Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações, 2010, Rio Grande. Anais do IV Wesaac	2937	3
1	Congresso Regional de Iniciação Científica e Tecnológica em Engenharia - CRICTE, 2010, Rio Grande. Anais	2938	3
	IV Conferência Sul de Modelagem Computacional, 2010, Rio Grande. Anais	2939	3
	International Joint Conference on Neural Networks (IJCNN2008), 2008, Hong Kong. International Joint Conference on Neural Networks (IJCNN2008)	2940	3
	SEGeT Simpósio de Excelência em Gestão e Tecnologia, 2012, Resende - RJ. Anais do IX Simpósio de Excelência em Gestão e Tecnologia - SEGeT	2949	3
	XXIII ENANGRAD - AVALIAÇÃO E GESTÃO DO CURSO DE ADMINISTRAÇÃO: Realidades e Perspectivas, 2012, Bento Gonçalves - RS. Anais do XXIII ENANGRAD - AVALIAÇÃO E GESTÃO DO CURSO DE ADMINISTRAÇÃO: Realidades e Perspectivas	2950	3
	WCCA 2011 World Congress on Communication and Arts, 2011, São Paulo. WCCA 2011 World Congress on Communication and Arts. São Paulo	2951	3
	17º CIAED - Congresso Internacional ABED de Educação a Distância, 2011, Manaus. A Grande Conversação: Diferentes Formas de Aprender, Conteúdos Variados e Tecnologias Diferenciadas - Interação com Diversidade	2952	3
XI	XI Colóquio Internacional sobre Gestão Universitária nas Américas, 2011, Florianópolis. Anais XI Colóquio Internacional sobre Gestão Universitária nas Américas	2953	3
1	II Encontro Fluminense de Engenharia de Produção, 2010, Rio das Ostras - RJ. UMA ANÁLISE DAS DIFICULDADES DE INVESTIMENTO NAS MPEs PELA BAIXA UTILIZAÇÃO DE FERRAMENTAS DE GESTÃO	2954	3
	ESUD - Congresso Brasileiro de Ensino Superior a Distância, 2010, Cuiabá. A EaD e sua institucionalização: reflexões e processos	2955	3
	II CONGRESO INTERNACIONAL - CIENCIAS, TECNOLOGÍAS Y CULTURAS. DIÁLOGO ENTRE LAS DISCIPLINAS DEL CONOCIMIENTO. MIRANDO AL FUTURO DE AMÉRICA LATINA Y EL CARIBE, 2010, Santiago. Educação e Tecnologias	2956	3
	I Congresso Internacional de Educação a Distância da UFPel, 2010, Pelotas. Anais do I Congresso Internacional de Educação a Distância da UFPel	2957	3
1	NAVTEC 2012 - Conferência Internacional em Tecnologias Naval e Offshore: Ciência e Inovação, 2012, Rio Grande. Anais NAVTEC 2012	2966	3
1	NAVTEC 2012 - Conferência Internacional em Tecnologias Naval e Offshore: Ciência e Inovação, 2012, Rio Grande. Anais NAVTEC 2012	2967	3
	ENIA - VIII Encontro Nacional de Inteligência Artificial, 2011, Natal. Anais do VIII Encontro Nacional de Inteligência Artificial	2968	3
	X Simpósio Brasileiro de Automática, 2011, São João del Rey. X Simpósio Brasileiro de Automática	2969	3
	Internet of Things (iThings/CPSCom), 2011 International Conference on and 4th International Conference on Cyber, Physical and Social Computing, 2011, Dalian. Anais Internet of Things (iThings/CPSCom), 2011 International Conference on and 4th International Conference on Cyber, Physical and Social Computing	2970	3
	IV Seminário e workshop em Engenharia Oceânica, 2010, Rio Grande. Anais do IV Seminário e workshop em Engenharia Oceânica	2971	3
	4MCSUL, 2010, Rio Grande. Anais do 4MCSUL	2972	3
	23 Congresso Nacional de Transporte Aquaviário, Construção Naval e Offshore, 2010, Rio de Janeiro. Anais do 23 Congresso Nacional de Transporte Aquaviário, Construção Naval e Offshore	2973	3
	1st International Conference on Applied Robotics for the Power Industry (CARPI), 2010, Montreal. Anais do 1st International Conference on Applied Robotics for the Power Industry (CARPI)	2974	3
	INCOM 2009, 2009, Moscou. Anais di 13th IFAC Symposium on Information Control Problems in Manufacturing	2975	3
CD-ROM	Simpósio Brasileiro de Sistemas Elétricos, 2008, Belo Horizonte. Anais do SBSE 2008. Belo Horizonte: Editora da Universidade Federal de Minas Gerais	2976	3
cd-rom	Simpósio Brasileiro de Redes de Computadores - Salão de Ferramentas, 2008, Rio de Janeiro. Anais do SBRC 2008	2977	3
	VII SBGames, 2008, Belo Horizonte. Anais do Simpósio Brasileial ro de Jogos para Computador e Entretenimento Digital - 2008	2978	3
1	XI Congreso Argentino de Meteorologia, 2012, Mendoza. XI Congremet. Buenos Aires: Centro Argentino de Meteorologos	2991	3
1	XI Congreso Argentino de Meteorologia, 2012, Mendoza. XI Congremet. Buenos Aires: Centro Argentino de Meteorologos	2992	3
1	XI Congreso Argentino de Meteorologia, 2012, Mendoza. XI Congremet. Buenos Aires: Centro Argentino de Meteorologos	2993	3
1	XVII Congresso Brasileiro de Meteorologia, 2012, Gramado, RS. Anais do XVII Congresso Brasileiro de Meteorologia. Rio de Janeiro: SBMet	2994	3
1	XVII Congresso Brasileiro de Meteorologia, 2012, Gramado, RS. Anais do XVII Congresso Brasileiro de Meteorologia. Rio de Janeiro: SBMet	2995	3
1	XIII Congreso Latinoamericano e Ibérico de Meteorología e X Congreso Argentino de Meteorología, 2009, Buenos Aires. Anais. Buenos Aires	2996	3
1	XIII Congreso Latinoamericano e Ibérico de Meteorología e X Congreso Argentino de Meteorología, 2009, Buenos Aires. Anais. Buenos Aires	2997	3
1	XIII Congreso Latinoamericano e Ibérico de Meteorología e X Congreso Argentino de Meteorología, 2009, Buenos Aires. Anais. Buenos Aires	2998	3
1	XIII Congreso Latinoamericano e Ibérico de Meteorología e X Congreso Argentino de Meteorología, 2009, Buenos Aires. Anais. Buenos Aires	2999	3
1	III Simpósio Internacional de Climatologia, 2009, Canela, RS. Anais. Canela, RS	3000	3
1	III Simpósio Internacional de Climatologia, 2009, Canela, RS. Anais. Canela, RS	3001	3
1	II Simpósio de Pesquisa em Ensino e História de Ciências da Terra, 2009, São Paulo. Anais. São Paulo	3002	3
1	XV Congresso Brasileiro de Meteorologia, 2008, São Paulo. Anais. São Paulo: SBMet	3003	3
1	XV Congresso Brasileiro de Meteorologia, 2008, São Paulo. Anais. São Paulo: SBMet	3004	3
1	XV Congresso Brasileiro de Meteorologia, 2008, São Paulo. Anais. São Paulo: SBMet	3005	3
1	XV Congresso Brasileiro de Meteorologia, 2008, São Paulo. Anais. São Paulo: SBMet	3006	3
	Escola Regional de Redes de Computadores, 2012, Pelotas. X Escola Regional de Redes de Computadores	3016	3
	Escola Regional de Redes de Computadores, 2012, Pelotas. X Escola Regional de Redes de Computadores	3017	3
	IEEE International Requirements Engineering Conference (RE), 2012, Chicago. 20th IEEE International Requirements Engineering Conference	3018	3
	SIM 2012 - South Symposium on Microelectronics, 2012, São Miguel das Missões. Proceedings of SIM 2012 - South Symposium on Microelectronics	3032	3
	South Symposium on Microelectronics (SIM 2012), 2012, São Miguel das Missões. Proceedings of South Symposium on Microelectronics (SIM 2012)	3033	3
	South Symposium on Microelectronics (SIM 2012), 2012, São Miguel das Missões. Proceedings of South Symposium on Microelectronics (SIM 2012)	3034	3
	South Symposium on Microelectronics, 2012, São Miguel das Missões. Proceedings of South Symposium on Microelectronics	3035	3
	26th South Symposium on Microelectronics - SIM2011, 2011, Novo Hamburgo. Proceedings of South Symposium on Microelectronics - SIM2011	3036	3
1	Congresso Brasileiro de Automática, 2012, Natal. Congresso Brasileiro de Automática CBA 2012	3205	3
	24th Symposium on Integrated Circuits and Systems Design - SBCCI 2011, 2011, João Pessoa. Proceedings of 24th Symposium on Integrated Circuits and Systems Design - SBCCI 2011	3037	3
	29th IEEE International Conference on Computer Design - ICCD 2011, 2011, Amherst. Proceedings of 29th IEEE International Conference on Computer Design - ICCD 2011	3038	3
	South Symposium on Microelectronics, 2010, Porto Alegre. Proceedings. Porto Alegre: EDIPUCRS	3039	3
	International19th International Workshop on Power And Timing Modeling Optimization and Simulation, 2009, Delft. Lecture Notes in Computer Science	3040	3
	24th South Symposium on Microelectronics, 2009, Pelotas. Proceedings of the 24th South Symposium on Microelectronics. Pelotas: Editora e Gráfica Universitária PREC-UFPel	3041	3
	18th ACM Great Lakes symposium on VLSI (GLSVLSI), 2008, Orlando, Florida. Proceedings of 18th ACM Great Lakes symposium on VLSI (GLSVLSI). New York: ACM	3042	3
	XXIII South Symposium on Microelectronics (SIM), 2008, Bento Gonçalves. Proceedings of XXIII South Symposium on Microelectronics (SIM). Porto Alegre: Evangraf	3043	3
	IEEE Custom Integrated Circuits Conference, 2008. Custom Integrated Circuits Conference	3044	3
	17th ACM/IEEE International Workshop on Logic and Synthesis, 2008, Lake Tahoe. Workshop Notes of the 17th ACM/IEEE International Workshop on Logic and Synthesis	3045	3
	IEEE International Conference on Robotics and Automation - ICRA, 2012, Saint Paul. Proceedings of IEEE International Conference on Robotics and Automation	3062	3
	International Conference on Offshore and Marine Technology: Science and Innovation, 2012, Rio Grande, Brazil. Proceedings of International Conference on Offshore and Marine Technology: Science and Innovation	3063	3
	Brazilian Symposium on Neural Networks, 2012, Curitiba, Brazil. Proceedings of Brazilian Symposium on Neural Networks	3064	3
	XIX Congresso Brasileiro de Automática, 2012, Campina Grande, Brazil. Anais do XIX Congresso Brasileiro de Automática	3065	3
	XIX Congresso Brasileiro de Automática, 2012, Campina Grande, Brazil. Anais do XIX Congresso Brasileiro de Automática	3066	3
	XIX Congresso Brasileiro de Automática, 2012, Campina Grande, Brazil. Anais do XIX Congresso Brasileiro de Automática	3067	3
	XIX Congresso Brasileiro de Automática, 2012, Campina Grande, Brazil. Anais do XIX Congresso Brasileiro de Automática	3068	3
	XIX Congresso Brasileiro de Automática, 2012, Campina Grande, Brazil. Anais do XIX Congresso Brasileiro de Automática	3069	3
	Latin American Robotics Symposium / Brazilian Robotics Symposium (LARS/SBR), 2012, Fortaleza, Brazil. Proceedings of IEEE Latin American Robotics Symposium	3070	3
	Latin American Robotics Symposium / Brazilian Robotics Symposium (LARS/SBR), 2012, Fortaleza, Brazil. Proceedings of IEEE Latin American Robotics Symposium	3071	3
	Latin American Robotics Symposium / Brazilian Robotics Symposium (LARS/SBR), 2012, Fortaleza, Brazil. Proceedings of IEEE Latin American Robotics Symposium	3072	3
	Encontro Nacional de Inteligência Artificial - ENIA, 2012, Curitiba. Anais do IX Encontro Nacional de Inteligência Artificial - ENIA	3073	3
	ENIA - VIII Encontro Nacional de Inteligência Artificial - CSBC, 2011, Natal. ENIA - VIII Encontro Nacional de Inteligência Artificial - CSBC	3074	3
	IEEE 9th International Conference on. Industrial Informatics, 2011, Lisboa. IEEE 9th International Conference on. Industrial Informatics	3075	3
	X Simpósio Brasileiro de Automática - SBAI 2011, 2011, Sao Joao del Rei - Brazil. Anais do X Simpósio Brasileiro de Automática	3076	3
	X Simpósio Brasileiro de Automática - SBAI 2011, 2011, Sao Joao del Rey - Brazil. Anais do X Simpósio Brasileiro de Automática	3077	3
	The 17th International Conference on Systems, Signals and Image Processing (IWSSIP 2010), 2010, Niteroi, Brazil. Proceedings of the 17th International Conference on Systems, Signals and Image Processing. Niteroi, RJ, Brazil: Editora da Universidade Federal Fluminense	3078	3
	IEEE International Conference on Robotics and Automation (ICRA), 2010, Anchorage, USA. Proceedings of the IEEE Int. Conf. on Robotics and Automation	3079	3
	XXII Concurso de Teses e Dissertações da SBC - CSBC, 2010, Belo Horizonte. Anais do Congresso da SBC (CSBC)	3080	3
	13th International Conference on Information Fusion (FUSION), 2010, Edinburgh, UK. Proceedings of 13th International Conference on Information Fusion	3081	3
	IEEE International Conference on Multisensor Fusion and Integration, 2010, Salt Lake, USA. Proceedings of the 2010 IEEE International Conference on Multisensor Fusion and Integration	3082	3
	Congresso Brasileiro de Automática, 2010, Bonito - Brazil. Anais do XVIII Congresso Brasileiro de Automática	3083	3
	Congresso Brasileiro de Automática, 2010, Bonito - Brazil. Anais do XVIII Congresso Brasileiro de Automática	3084	3
	13th International Conference on Information Fusion (FUSION), 2010, Edinburg, UK. Proceedings of 13th International Conference on Information Fusion (FUSION)	3085	3
	IEEE/RSJ International Conference on Intelligent Robots and Systems, 2010, Taipei - Taiwan. Proceedings of IEEE/RSJ International Conference on Intelligent Robots and Systems	3086	3
	Latin American Robotics Symposium, 2010, São Bernardo do Campo - Brazil. Proceedings of VII Latin American Robotics Symposium	3087	3
	I International Conference on Biodental Engineering, 2009, Porto - Portugal. I International Conference on Biodental Engineering	3088	3
	International Congress of Mechanical Engineering (COBEM), 2009, Gramado - Brazil. Anais do COBEM 2009	3089	3
	The 2009 IEEE/RSJ International Conference on Intelligent Robots and Systems (IROS), 2009, St. Louis USA. The 2009 IEEE/RSJ International Conference on Intelligent Robots and Systems (IROS)	3090	3
	European Conference on Mobile Robots, 2009, Dubrovnik. Proceedings of the 4th European Conference on Mobile Robots	3091	3
	European Conference on Mobile Robots, 2009, Dubrovnik. Proceedings of the 4th European Conference on Mobile Robots	3092	3
	IX Simpósio Brasileiro de Automação Inteligente, 2009, Brasilia. Anais do IX Simpósio Brasileiro de Automação Inteligente	3093	3
	IEEE Latin American Robotics Symposium (LARS), 2009, Valparaiso - Chile. Proceedings of IEEE Latin American Robotics Symposium	3094	3
	Simpósio Brasileiro de Automação Inteligente (SBAI), 2009, Brasilia. Anais do Simpósio Brasileiro de Automação Inteligente (SBAI)	3095	3
	III MCSUL - 3rd Southern Conference on Computational Modelling, 2009, Rio Grande - Brazil. Anais do III MCSUL	3096	3
	Congresso da Sociedade Brasileira de Computação - Concurso de Trabalhos de Iniciação Científica, 2008, Belem. Anais do XXVIII Congresso da Sociedade Brasileira de Computação	3099	3
	XVII Congresso Brasileiro de Automática, 2008, Juiz de Fora - MG - Brazil. Anais do XVII Congresso Brasileiro de Automática	3100	3
1-4	MTS/IEEE Oceans, 2008, Quebec. Proc. of the MTS/IEEE Oceans	3101	3
	Workshop of Undergraduate Work - Brazilian Symposium on Computer Graphics and Image Processing (SIBGRAPI), 2008, Campo Grande. Proceedings of the XXI Brazilian Symposium on Computer Graphics and Image Processing (SIBGRAPI)	3102	3
	III Seminário e Workshop de Engenharia Oceânica, 2008, Rio Grande. Anais do III Seminário e Workshop de Engenharia Oceânica	3103	3
	5th Latin American Robotics Symposium - LARS, 2008, Salvador. Proceedings of the 5th Latin American Robotics Symposium	3104	3
	Internet of Things (iThings/CPSCom), 2011, Dalian. 2011 International Conference on and 4th International Conference on Cyber, Physical and Social Computing	3113	3
	Encontro de Pesquisa em Educação da Região Sul - ANPED SUL, 2010, Londrina. Anais do ANPED SUL	3114	3
	Workshop de Desafios da Computação Aplicada à Educação, 2012, Curitiba/PR. Desafie - CSBC 2012, SBC	3117	3
	Congresso Nacional de Diversidade e Inclusão, 2012, São José dos Campos / SP. CONADI 2012	3118	3
	II Congreso Internacional de Computación e Informática, 2012, Ciudad del Carmen. CONACI 2012. Berlin: Springer	3119	3
	Seminário de Extensão Universitária da Região Sul, 2012, Rio Grande. SEURS 2012. Rio Grande: Editora FURG	3120	3
	III Congresso Baiano de Educação Inclusiva: Práticas, Formação e Lugares, 2011, Salvador. III Congresso Baiano de Educação Inclusiva: Práticas, Formação e Lugares	3121	3
	II Seminário de Políticas Públicas e Educação: constituindo a cidadania?, 2011, Rio Grande, RS. II Seminário de Políticas Públicas e Educação	3122	3
	1º Congresso Internacional de Educação à Distância da UFPEL, 2010, Pelotas. 1º Congresso Internacional de Educação à Distância da UFPEL	3123	3
	XV II - CIESC Iberian American Conference on High Education in Computer Science, 2009, Pelotas. CLEI 2009	3124	3
	Robotics in Education, 2012, Praga. Proceedings of the 3rd International Conference on Robotics in Education	3129	3
	International Biometric Performance Testing Conference, 2010, Washington, D.C.. NIST Special Publication 500-283	3130	3
	Biometrics: Theory, Applications, and Systems, 2010, Washington, D.C.. IEEE 4th International Conference on Biometrics: Theory, Applications, and Systems, 2010. BTAS '10	3131	3
	International Conference on Frontiers in Handwriting Recognition, 2010, Kolkata, India. Proceedings of the 12th International Conference on Frontiers in Handwriting Recognition	3132	3
	Simpósio Brasileiro de Telecomunicações, 2009, Blumenau, SC. Anais do XXVII Simpósio Brasileiro de Telecomunicações	3133	3
	Biometrics: Theory, Applications, and Systems, 2009, Washington, D.C.. IEEE 3rd International Conference on Biometrics: Theory, Applications, and Systems, 2009. BTAS '09	3134	3
	Simposio Brasileiro de Telecomunicacoes, 2008, Recife. Anais do XXVI Simpósio Brasileiro de Telecomunicações	3135	3
1	IEEE 9th International Conference on Industrial Informatics, 2011, Lisboa. Proceedings of 2011 IEEE 9th International Conference on Industrial Informatics	3136	3
Único	2010 17th IEEE International Conference and Workshops on Engineering of Computer Based Systems (ECBS), 2010, Rio de Janeiro. Proceeding of 2010 17th IEEE International Conference and Workshops on Engineering of Computer Based Systems (ECBS). Oxfor, England: IEEE	3137	3
	2010 23rd SIBGRAPI Conference on Graphics, Patterns and Images (SIBGRAPI), 2010, Gramado, Brazil. Proceedings 23rd SIBGRAPI Conference on Graphics, Patterns and Images. Los Alamitos, California: IEEE Computer Society	3138	3
	XVIII Congresso Brasileiro de Automática, 2010, Bonito, Brasil. Anais do XVIII Congresso Brasileiro de Automática	3139	3
Único	The 3rd South Conference on Computational Modeling III MCSUL, 2009, Rio Grande. Anais do III Simpósio de Modelagem Computacional do Sul 3MCSul	3140	3
	IECON 2011 - 37th Annual Conference on IEEE Industrial Electronics Society, 2011, Melbourne. IECON 2011 - 37th Annual Conference on IEEE Industrial Electronics Society	3152	3
	Power Electronics Conference (COBEP), 2011, Natal. Congresso Brasileiro de Eletrônica de Potência	3153	3
	International Conference on Electrical Machines ICEM, 2010, Roma. XIX International Conference on Electrical Machines ICEM-2010	3154	3
	International Conference on Electrical Machines, 2010, Roma. XIX International Conference on Electrical Machines ICEM-2010	3155	3
	International Conference on Electrical Machines, 2010, Roma. XIX International Conference on Electrical Machines ICEM-2010	3156	3
	International Conference on Electrical Machines, 2010, Roma. XIX International Conference on Electrical Machines ICEM-2010	3157	3
	Congresso Brasileiro de Automática, 2010, Bonito. XVIII Congresso Brasileiro de Automática CBA2010	3158	3
	Congresso Brasileiro de Automática, 2010, Bonito. XVIII Congresso Brasileiro de Automática CBA2010	3159	3
	International Electric Machines and Drives Conference - IEMDC, 2009, Miami. Renewable Energy Systems for Today Tomorrow	3160	3
	International Electric Machines and Drives Conference - IEMDC, 2009, Miami. Renewable Energy Systems for Today Tomorrow	3161	3
	Congresso Brasileiro de Eletrônica de Potência - Cobep'09, 2009, Bonito, Mato Grosso do Sul. Congresso Brasileiro de Eletrônica de Potência - Cobep'09	3162	3
	Congresso Brasileiro de Eletrônica de Potência - Cobep'09, 2009, Bonito, Mato Grosso do Sul. Congresso Brasileiro de Eletrônica de Potência - Cobep'09	3163	3
	Congresso Brasileiro de Eletrônica de Potência - Cobep'09, 2009, Bonito, Mato Grosso do Sul. Congresso Brasileiro de Eletrônica de Potência - Cobep'09	3164	3
	IECON 2009, 2009, Porto. 35th Annual Conference of the IEEE Industrial Electronics Society	3165	3
	XVII Congresso Brasileiro de Automática, 2008, Juiz de Fora. Anais do XVII Congresso Brasileiro de Automática	3166	3
	XVII Congresso Brasileiro de Automática, 2008, Juiz de Fora. Anais do XVII Congresso Brasileiro de Automática	3167	3
1	NAVTEC 2012, 2012. Conferência Internacional em Tecnologias Naval e Offshore: Ciência e Inovação	3202	3
1	NAVTEC 2012, 2012. Conferência Internacional em Tecnologias Naval e Offshore: Ciência e Inovação	3203	3
1	Congresso Brasileiro de Automática, 2012, Natal. Congresso Brasileiro de Automática CBA 2012	3207	3
1	Congresso Brasileiro de Automática, 2012, Natal. Congresso Brasileiro de Automática CBA 2012	3208	3
1	The Sixth International Conference on Mobile Ubiquitous Computing, Systems, Services and Technologies, 2012, Barcelona. The Sixth International Conference on Mobile Ubiquitous Computing, Systems, Services and Technologies	3209	3
1	Ciclo de Palestras Novas Tecnologias na Educação, 2012. Ciclo de Palestras Novas Tecnologias na Educação	3210	3
1	IEEE Latin American Robotic Systems - IEEE LARS, 2012. IEEE Latin American Robotic Systems - IEEE LARS	3211	3
1	IEEE Latin American Robotic Systems - IEEE LARS, 2012. IEEE Latin American Robotic Systems - IEEE LARS	3212	3
1	IEEE Latin American Robotic Systems - IEEE LARS, 2012. IEEE Latin American Robotic Systems - IEEE LARS	3213	3
1	Workshop em Robótica Educacional, 2012. Workshop em Robótica Educacional	3214	3
1	SBGames, 2012. SBGames	3215	3
1	Simpósio Brasileiro de Redes Neurais, 2012. Simpósio Brasileiro de Redes Neurais	3216	3
1	SIBIGRAPH - Workshop de Teses e Dissertações, 2012. SIBIGRAPH - Workshop de Teses e Dissertações	3217	3
1	3 rd International Conference on Robotic and Education, 2012. Conference Proceedings 3 rd International Conference on	3218	3
	Encontro Nacional de Inteligência Artificial, 2011, Natal. ENIA 2011	3219	3
	SINTEC - SEMINÁRIO INTERNACIONAL DE EDUCAÇÃO EM CIÊNCIAS, 2011, Rio Grande. SINTEC - SEMINÁRIO INTERNACIONAL DE EDUCAÇÃO EM CIÊNCIAS	3220	3
	X Simpósio Brasileiro de Automática, 2011, Sao Joao del Rei. X Simpósio Brasileiro de Automática	3221	3
	X Simpósio Brasileiro de Automática, 2011, Sao Joao del Rey. X Simpósio Brasileiro de Automática	3222	3
	2011 International Conference on and 4th International Conference on Cyber, Physical and Social Computing, 2011, Dalian. Internet of Things (iThings/CPSCom)	3223	3
	XXIX Simpósio Nacional de Educação Física, 2010. XXIX Simpósio Nacional de Educação Física	3224	3
	SIBIGRAPI, 2010. SIBIGRAPI	3225	3
	Congresso Brasileiro de Automática, 2010. CBA 2010	3226	3
	Congresso Brasileiro de Automática, 2010. CBA 2010	3227	3
	Congresso Brasileiro de Automática, 2010. CBA 2010	3228	3
	Congresso Brasileiro de Automática, 2010. CBA 2010	3229	3
	Congresso Brasileiro de Automática, 2010. CBA 2010	3230	3
	IEEE International Conference on Multisensor Fusion and Integration, 2010. IEEE International Conference on Multisensor Fusion and Integration	3231	3
	12th Brazilian Workshop on Real-Time and Embedded Systems, 2010, Gramado. Anais do 12th Brazilian Workshop on Real-Time and Embedded Systems	3232	3
	1st IFAC Workshop on Advanced Maintenance Engineering, Services and Technology - IFAC A-MEST'10, 2010, Lisboa. Proceedings of the 1st IFAC Workshop on Advanced Maintenance Engineering, Services and Technology - IFAC A-MEST'10	3233	3
	IV MCSUL - Southern Conference in Computational Modeling, 2010. IV MCSUL	3234	3
	IV Seminário e Workshop em Engenharia Oceânica, 2010. SEMENGO 2010	3235	3
	23 Congresso Nacional de Transporte Aquaviário, Construção Naval e Offshore, 2010. SOBENA 2010	3236	3
	SBGames, 2010. Simpósio Brasileiro de Jogos	3237	3
	Seminário de Pesquisa Qualitativa, 2010. Seminário de Pesquisa Qualitativa	3238	3
	INCOM 2009	3239	3
	IEEE Oceans 2009, 2009, Bremem. CD IEEE Oceans 2009	3240	3
	VIII Congreso Internacional sobre Investigación en Didáctica de las Ciencias, 2009	3241	3
	Simposio Brasileiro de Automação Inteligente, 2009, Brasilia. Simposio Brasileiro de Automação Inteligente	3242	3
	Simpósio Brasileiro de Automação Inteligente, 2009, Brasília. Simpósio Brasileiro de Automação Inteligente	3243	3
	Simpósio Brasileiro de Automação Inteligente, 2009, Brasilia. Simpósio Brasileiro de Automação Inteligente	3244	3
	Simposio Brasileiro de Automação Inteligente, 2009, Brasilia. Simposio Brasileiro de Automação Inteligente	3245	3
	IEEE Latin American Robotic Symposium, 2009. IEEE LARS	3246	3
1	Simposio Brasileiro de Sistemas Elétricos, 2008, Belo Horizonte. Simposio Brasileiro de Sistemas Elétricos	3247	3
	Congresso Brasileiro de Automática, 2008, Jiuz de Fora. Congresso Brasileiro de Automática	3248	3
	Congresso Brasileiro de Automática, 2008, Jiuz de Fora. Congresso Brasileiro de Automática	3249	3
	Latin American Robotic System - LARS, 2008, Salvador. Latin American Robotic Systems	3250	3
	Latin American Robotic System - LARS, 2008, Salvador. Latin American Robotic Systems	3251	3
	Congresso da Sociedade Brasileira de Computação, 2008. Concurso de Iniciação Científica	3252	3
	Workshop in Under-graduated Work, 2008. SIBGRAPI 2008	3253	3
	IEEE Oceans, 2008, Quebec. IEEE Oceans	3254	3
	IEEE Latin American Robotic Symposium, 2008, Salvador. IEEE Latin American Robotic Symposium	3255	3
	IEEE Latin American Robotic Symposium, 2008, Salvador. IEEE Latin American Robotic Symposium	3256	3
	SBGames, 2008, Belo Horizionte. SBGames	3257	3
	IV Seminário Jogos Eletrônicos, Educação e Comunicação construindo novas trilhas, 2008. IV Seminário Jogos Eletrônicos, Educação e Comunicação construindo novas trilhas	3258	3
	VIII Southern Programmable Logic Conference - SPL 2012, 2012, Bento Gonçalves. VIII Southern Programmable Logic Conference - SPL 2012	3266	3
	VIII Southern Programmable Logic Conference - SPL 2012 - Designer Forum, 2012, Bento Gonçalves. Southern Programmable Logic Conference - SPL 2012 - Designer Forum	3267	3
1	Mostra Nacional de Robótica MNR, 2011, São João Del Rey / MG. Mostra Nacional de Robótica	3268	3
	Workshop IBERCHIP, 2010, Foz do Iguaçu, PR, Brasil. XVI Workshop IBERCHIP	3269	3
1	Electronics, Circuits, and Systems (ICECS), 2010 17th IEEE International Conference on, 2010, Atenas. Proceedings of 17th International Conference on Electronic Circuits and Systems	3270	3
	International Conference on Electronic Circuits and Systems, 2010, Atenas. Proceedings of the 17th International Conference on Electronic Circuits and Systems	3271	3
1	IEEE Latin American Symposium on Circuits and Systems, 2010, Foz do Iguaçu. IEEE Latin American Symposium on Circuits and Systems	3272	3
	4th Southern Conference on Computational Modeling - 4º MCSUL, 2010, RIo Grande. 4th Southern Conference on Computational Modeling - 4º MCSUL	3273	3
	4th Southern Conference on Computational Modeling - 4º MCSUL, 2010, Rio Grande. 4th Southern Conference on Computational Modeling - 4º MCSUL	3274	3
	The 3rd Pacific-Rim Symposium on Image and Video Technology, 2009, Tóquio, Japão. Pacific-Rim Symposium on Image and Video Technology	3275	3
1	24o Simpósio Sul de Microeletrônica - SIM2009, 2009, Pelotas, RS. 24º simpósio sul de microeletrônica	3276	3
1	24o Simpósio Sul de Microeletrônica - SIM2009, 2009, Pelotas, RS. 24º simpósio sul de microeletrônica	3277	3
1	24o Simpósio Sul de Microeletrônica - SIM2009, 2009, Pelotas, RS. 24º simpósio sul de microeletrônica	3278	3
1	24º simpósio sul de microeletrônica, 2009, Pelotas, RS. 24º simpósio sul de microeletrônica	3279	3
	2nd International Conference on Signals, Circuits and Systems. SCS 2008., 2008, Tunísia. 2nd International Conference on Signals, Circuits and Systems	3280	3
	IFIP International Conference on Very Large Scale Integration. VLSI - SoC 2008., 2008, Rodes, Grécia. IFIP International Conference on Very Large Scale Integration	3281	3
	XIV Workshop Iberchip, 2008, Puebla, México. XIV Workshop Iberchip	3282	3
	XIV Workshop Iberchip, 2008. XIV Workshop Iberchip	3283	3
	21st Symposium on Integrated Circuits and Systems Design, 2008, Gramado, Brasil. 21st Symposium on Integrated Circuits and Systems Design	3284	3
1	III Seminário e Workshop em Engenharia Oceânica, Semengo'08, 2008, Rio Grande. III Seminário e Workshop em Engenharia Oceânica	3285	3
1	III Seminário e Workshop em Engenharia Oceânica, 2008, Rio Grande. III Seminário e Workshop em Engenharia Oceânica	3286	3
1	IV Southern Conference on Computational Modeling, 2010, Rio Grande, RS, 2010, Rio Grande. IV Southern Conference on Computational Modeling 2010	3289	3
	III Seminário e Workshop em Engenharia Oceânica, 2008, Rio Grande. III Seminário e Workshop em Engenharia Oceânica	3290	3
	III Seminário e Workshop em Engenharia Oceânica, 2008, Rio Grande. III Seminário e Workshop em Engenharia Oceânica	3291	3
	Congresso Brasileiro de Automática, 2008, Juiz de Fora. Congresso Brasileiro de Automática	3292	3
	Congresso Brasileiro de Automática, 2008, Juiz de Fora. Congresso Brasileiro de Automática	3293	3
	Congresso Nacional de Engenharia Mecânica, 2008, Salvador. Congresso Nacional de Engenharia Mecânica	3294	3
	Congresso Nacional de Engenharia Mecânica, 2008, Salvador. Congresso Nacional de Engenharia Mecânica	3295	3
	XVIII Congresso Brasileiro de Automática - CBA 2010, 2010, Bonito / MS. Anais do XVIII Congresso Brasileiro de Automática - CBA 2010	3300	3
	The 2010 1st International Conference on Applied Robotics for the Power Industry, 2010, Montreal. Proceedings of The 2010 1st International Conference on Applied Robotics for the Power industry	3301	3
	The 2010 1st International Conference on Applied Robotics for the Power industry, 2010, Montreal. Proceedings of The 2010 1st International Conference on Applied Robotics for the Power industry	3302	3
	14th IEEE International Conference on Emerging Technology and Factory Automation, 2009, Palma de Mallorca. Proceedings of the 14th IEEE International Conference on Emerging Technologies and Factory Automation (ETFA)	3303	3
	IX Simpósio Brasileiro de Automação Inteligente, 2009, Brasília. Anais do IX Simpósio Brasileiro de Automação Inteligente	3304	3
	IX Simpósio Brasileiro de Automação Inteligente, 2009, Brasília. Anais do IX Simpósio Brasileiro de Automação Inteligente	3305	3
	Rio Pipeline 2009 Conference and Exhibition, 2009, Rio de Janeiro. Anais do Rio Pipeline 2009 Conference and Exhibition	3306	3
	Simpósio Brasileiro de Sistemas Elétricos, 2008, Belo Horizonte. Anais do Simpósio Brasileiro de Sistemas Elétricos 2008	3307	3
	Congresso Brasileiro de Automática, 2008, Juiz de Fora. Anais do XVII Congresso Brasileiro de Automática	3308	3
	Simpósio Latino-Americano de Robótica, 2008, Salvador. Anais do 5o. Simpósio Latino-Americano de Robótica	3309	3
\.


--
-- Data for Name: diametro; Type: TABLE DATA; Schema: versionado; Owner: postgres
--

COPY diametro (posicao, membro, versao) FROM stdin;
\.


--
-- Data for Name: grafo; Type: TABLE DATA; Schema: versionado; Owner: postgres
--

COPY grafo (id, densidade, giant_component, versao) FROM stdin;
1	0.169590637	0.736842096	2
\.


--
-- Data for Name: livro; Type: TABLE DATA; Schema: versionado; Owner: postgres
--

COPY livro (edicao, volume, id_publicacao, versao) FROM stdin;
		1745	2
		1746	2
		1782	2
1	1. 132p 	1792	2
1	1. 267p 	1793	2
1	1. 163p 	1794	2
1	1. 313p 	1795	2
	1	1796	2
1	1. 305p 	1924	2
		1925	2
		1926	2
	1. 247p 	1927	2
1	1. 401p 	1928	2
1		1978	2
1	1. 132p 	2021	2
1	1. 70p 	2022	2
1	1. 267p 	2023	2
1	1. 163p 	2024	2
		2119	2
1	1. 100p 	2142	2
1	1. 100p 	2322	2
1	1. 71p 	2323	2
1	1. 157p 	2324	2
1	1. 401p 	2325	2
1	1. 145p 	2326	2
		2434	3
		2435	3
		2481	3
1	1. 132p 	2491	3
1	1. 267p 	2492	3
1	1. 163p 	2493	3
1	1. 313p 	2494	3
	1	2495	3
1	1. 305p 	2651	3
		2652	3
		2653	3
	1. 247p 	2654	3
1	1. 401p 	2655	3
1		2748	3
1	1. 132p 	2810	3
1	1. 70p 	2811	3
1	1. 267p 	2812	3
1	1. 163p 	2813	3
		2934	3
1	1. 100p 	2962	3
1	1. 100p 	3192	3
1	1. 71p 	3193	3
1	1. 157p 	3194	3
1	1. 401p 	3195	3
1	1. 145p 	3196	3
\.


--
-- Data for Name: membros; Type: TABLE DATA; Schema: versionado; Owner: postgres
--

COPY membros (id_membro, nome, id_lattes, centralidade, pagerank, grau, cluster_coefficient, versao, closeness) FROM stdin;
0	Adriano Velasque Werhli	4393367734853964	0	0	0	0	2	0
1	Alessandro de Lima Bicho	6965119196945931	0	0	0	0	2	0
2	André Luis Castro de Freitas	8252864210379656	0	0	0	0	2	0
3	Andre Prisco Vargas	0243625998325831	0	0	0	0	2	0
4	Antonio Carlos da Rocha Costa	5601943285331545	0	0	0	0	2	0
5	Celso Luiz Lopes Rodrigues	2264555408583001	0	0	0	0	2	0
6	Cláudio Dornelles Mello Júnior	5464430592929387	0	0	0	0	2	0
7	Cristina Meinhardt	6816603089210442	0	0	0	0	2	0
8	Danúbia Bueno Espíndola	9582755594379866	0	0	0	0	2	0
9	Denis Teixeira Franco	5184930755123241	0	0	0	0	2	0
10	Diana Francisca Adamatti	4984043849101331	0	0	0	0	2	0
11	Eder Mateus Nunes Gonçalves	8560050240967369	0	0	0	0	2	0
12	Eduardo André de Lima Carneiro	0889307239698374	0	0	0	0	2	0
13	Eduardo Nunes Borges	5851601274050374	0	0	0	0	2	0
14	Emanuel da Silva Diaz Estrada	3463902649683230	0	0	0	0	2	0
15	Geralcy Carneiro da Silva	2251297387859499	0	0	0	0	2	0
16	Gerson Alberto Leiria Nunes	0354617883280818	0	0	0	0	2	0
17	Glauber Acunha Goncalves	2814370196736373	0	0	0	0	2	0
18	Graçaliz Pereira Dimuro	9414212573217453	0	0	0	0	2	0
19	Greyce Nogueira Schroeder	6398615776166771	0	0	0	0	2	0
20	Ivete Martins Pinto	8740785327180983	0	0	0	0	2	0
21	Karina dos Santos Machado	3528633359332021	0	0	0	0	2	0
22	Leonardo Ramos Emmendorfer	1129100746134234	0	0	0	0	2	0
23	Luciano Maciel Ribeiro	0119381103799648	0	0	0	0	2	0
24	Nelson Lopes Duarte Filho	5369672706522008	0	0	0	0	2	0
25	Nisia Krusche	1606080164385644	0	0	0	0	2	0
26	Odorico Machado Mendizabal	6058299964884859	0	0	0	0	2	0
27	Paulo Francisco Butzen	1952072482347004	0	0	0	0	2	0
28	Paulo Lilles Jorge Drews Junior	5551697165370587	0	0	0	0	2	0
29	Rafael Augusto Penna dos Santos	2765008024136365	0	0	0	0	2	0
30	Regina Barwaldt	2017770059745262	0	0	0	0	2	0
31	Ricardo Nagel Rodrigues	8456023041589649	0	0	0	0	2	0
32	Rodrigo Andrade de Bem	3935196239515458	0	0	0	0	2	0
33	Rodrigo Zelir Azzolin	0985488148768235	0	0	0	0	2	0
34	Silvia Silva da Costa Botelho	8800859024101679	0	0	0	0	2	0
35	Vagner Santos da Rosa	4599170539959463	0	0	0	0	2	0
36	Vitor Irigon Gervini	2056380331247057	0	0	0	0	2	0
37	Vinícius Menezes de Oliveira	9262132256691648	0	0	0	0	2	0
0	Adriano Velasque Werhli	4393367734853964	0	0	0	0	3	0
1	Alessandro de Lima Bicho	6965119196945931	0	0	0	0	3	0
2	André Luis Castro de Freitas	8252864210379656	0	0	0	0	3	0
3	Andre Prisco Vargas	0243625998325831	0	0	0	0	3	0
4	Antonio Carlos da Rocha Costa	5601943285331545	0	0	0	0	3	0
5	Celso Luiz Lopes Rodrigues	2264555408583001	0	0	0	0	3	0
6	Cláudio Dornelles Mello Júnior	5464430592929387	0	0	0	0	3	0
7	Cristina Meinhardt	6816603089210442	0	0	0	0	3	0
8	Danúbia Bueno Espíndola	9582755594379866	0	0	0	0	3	0
9	Denis Teixeira Franco	5184930755123241	0	0	0	0	3	0
10	Diana Francisca Adamatti	4984043849101331	0	0	0	0	3	0
11	Eder Mateus Nunes Gonçalves	8560050240967369	0	0	0	0	3	0
12	Eduardo André de Lima Carneiro	0889307239698374	0	0	0	0	3	0
13	Eduardo Nunes Borges	5851601274050374	0	0	0	0	3	0
14	Emanuel da Silva Diaz Estrada	3463902649683230	0	0	0	0	3	0
15	Geralcy Carneiro da Silva	2251297387859499	0	0	0	0	3	0
16	Gerson Alberto Leiria Nunes	0354617883280818	0	0	0	0	3	0
17	Glauber Acunha Goncalves	2814370196736373	0	0	0	0	3	0
18	Graçaliz Pereira Dimuro	9414212573217453	0	0	0	0	3	0
19	Greyce Nogueira Schroeder	6398615776166771	0	0	0	0	3	0
20	Ivete Martins Pinto	8740785327180983	0	0	0	0	3	0
21	Karina dos Santos Machado	3528633359332021	0	0	0	0	3	0
22	Leonardo Ramos Emmendorfer	1129100746134234	0	0	0	0	3	0
23	Luciano Maciel Ribeiro	0119381103799648	0	0	0	0	3	0
24	Nelson Lopes Duarte Filho	5369672706522008	0	0	0	0	3	0
25	Nisia Krusche	1606080164385644	0	0	0	0	3	0
26	Odorico Machado Mendizabal	6058299964884859	0	0	0	0	3	0
27	Paulo Francisco Butzen	1952072482347004	0	0	0	0	3	0
28	Paulo Lilles Jorge Drews Junior	5551697165370587	0	0	0	0	3	0
29	Rafael Augusto Penna dos Santos	2765008024136365	0	0	0	0	3	0
30	Regina Barwaldt	2017770059745262	0	0	0	0	3	0
31	Ricardo Nagel Rodrigues	8456023041589649	0	0	0	0	3	0
32	Rodrigo Andrade de Bem	3935196239515458	0	0	0	0	3	0
33	Rodrigo Zelir Azzolin	0985488148768235	0	0	0	0	3	0
34	Silvia Silva da Costa Botelho	8800859024101679	0	0	0	0	3	0
35	Vagner Santos da Rosa	4599170539959463	0	0	0	0	3	0
36	Vitor Irigon Gervini	2056380331247057	0	0	0	0	3	0
37	Vinícius Menezes de Oliveira	9262132256691648	0	0	0	0	3	0
\.


--
-- Data for Name: publicacao; Type: TABLE DATA; Schema: versionado; Owner: postgres
--

COPY publicacao (id_publicacao, tipo, titulo, autores, ano, paginas, id_membro, cluster, versao) FROM stdin;
1743	AP	Comparing the reconstruction of regulatory pathways with distinct Bayesian networks inference methods	WERHLI, A. V.	2012	S2	0	\N	2
1744	AP	GENE REGULATORY NETWORK RECONSTRUCTION BY BAYESIAN INTEGRATION OF PRIOR KNOWLEDGE AND/OR DIFFERENT EXPERIMENTAL CONDITIONS	WERHLI, ADRIANO V. ; HUSMEIER, DIRK	2008	543	0	\N	2
2432	AP	Comparing the reconstruction of regulatory pathways with distinct Bayesian networks inference methods	WERHLI, A. V.	2012	S2	0	\N	3
1746	LP	IV MCSUL Southern Conference on Computational Modeling / IX ERMAC Encontro regional de Matemática Aplicada e Computacional	WERHLI, A. V. (Org.) ; Emmendorfer, L. R. (Org.) ; COSTA, A. C. R. (Org.) ; Retamoso, M. (Org.)	2010		0	\N	2
1747	CL	Advanced Applications of Bayesian Networks in Systems Biology	Husmeier, D. ; WERHLI, A. V. ; Grzegorczyk, Marco	2011	270-289	0	\N	2
1748	CL	Reverse Engineering Gene Regulatory Networks with Various Machine	Grzegorczyk, Marco ; Husmeier, D. ; WERHLI, A. V.	2008	101-142	0	\N	2
1749	TC	An epsilon-greedy mutation operator based on prior knowledge for GA convergence and accuracy improvement: an application to networks inference	Mendoza, M. R. ; WERHLI, A. V. ; BAZZAN, A. L. C.	2012		0	\N	2
1750	TC	Bayesian Network Structure Inference with an Hierarchical Bayesian Model	WERHLI, A. V.	2010	92-101	0	\N	2
1751	TC	Inferring Genetic Regulatory Networks with an Hierarchical Bayesian Model and a Parallel Sampling Algorithm	Mendoza, M. R. ; WERHLI, A. V.	2010	91-96	0	\N	2
2433	AP	GENE REGULATORY NETWORK RECONSTRUCTION BY BAYESIAN INTEGRATION OF PRIOR KNOWLEDGE AND/OR DIFFERENT EXPERIMENTAL CONDITIONS	WERHLI, ADRIANO V. ; HUSMEIER, DIRK	2008	543	0	\N	3
1754	AP	Simulating crowds based on a space colonization algorithm	BICHO, A. L. ; RODRIGUES, R. A. ; MUSSE, S. R. ; JUNG, C. R. ; PARAVISI, M. ; MAGALHÃES, L. P.	2012	70-79	1	\N	2
2435	LP	IV MCSUL Southern Conference on Computational Modeling / IX ERMAC Encontro regional de Matemática Aplicada e Computacional	WERHLI, A. V. (Org.) ; Emmendorfer, L. R. (Org.) ; COSTA, A. C. R. (Org.) ; Retamoso, M. (Org.)	2010		0	\N	3
1756	AP	An Interactive Model for Steering Behaviors of Groups of Characters	RODRIGUES, R. A. ; BICHO, A. L. ; PARAVISI, M. ; JUNG, C. R. ; MAGALHÃES, L. P. ; MUSSE, S. R.	2010	594-616	1	\N	2
1757	AP	Tree Paths: A New Model for Steering Behaviors. Proceedings of the 9th International Conference on Intelligent Virtual Agents	RODRIGUES, R. A. ; BICHO, A. L. ; PARAVISI, M. ; JUNG, C. R. ; MAGALHÃES, L. P. ; MUSSE, S. R.	2009	358-371	1	\N	2
1758	TC	Simulation of Autonomous Agents using Terrain Reasoning	CASSOL, V. J. ; MARSON, F. P. ; VENDRAMINI, M. ; PARAVISI, M. ; MUSSE, S. R. ; BICHO, A. L. ; JUNG, C. R.	2011	101-108	1	\N	2
2436	CL	Advanced Applications of Bayesian Networks in Systems Biology	Husmeier, D. ; WERHLI, A. V. ; Grzegorczyk, Marco	2011	270-289	0	\N	3
2437	CL	Reverse Engineering Gene Regulatory Networks with Various Machine	Grzegorczyk, Marco ; Husmeier, D. ; WERHLI, A. V.	2008	101-142	0	\N	3
2438	TC	An epsilon-greedy mutation operator based on prior knowledge for GA convergence and accuracy improvement: an application to networks inference	Mendoza, M. R. ; WERHLI, A. V. ; BAZZAN, A. L. C.	2012		0	\N	3
1762	AP	Estudo de Caso sobre Programação Orientada a Aspectos Utilizando RMI. Hífen (Uruguaiana	BORGES, F.S. ; FREITAS, A. L. C.	2008	1	2	\N	2
1763	TC	O Exercício, em Freire, da Conscientização Apoiado no Uso de Tecnologias na Educação	FREITAS, A. L. C. ; FREITAS, L.A.A.	2012	48-60	2	\N	2
1764	TC	A Conscientização em Espaços Menores: o inacabamento do professor	FREITAS, A. L. C. ; FREITAS, L.A.A.	2012		2	\N	2
1765	TC	A Conscientização, em Freire, Apoiada no Uso de Tecnologias na Educação a Distância	FREITAS, L.A.A. ; FREITAS, A. L. C.	2012		2	\N	2
1766	TC	Experienciações no Espaço Tempo da Sala de Aula: Em que condições são possíveis integrar os saberes?	FREITAS, A. L. C. ; FREITAS, L.A.A. ; SPEROTTO, R. I.	2012		2	\N	2
1767	TC	Experienciações no Espaço Tempo da Sala de Aula:A tecnologia a favor da integração dos saberes	FREITAS, A. L. C. ; FREITAS, L.A.A.	2012		2	\N	2
1768	TC	Da Educação Bancária a Educação Problematizadora: Os espaços menores entre esse extremos e a sua contribuição para o ensinar e o aprender. Em que medida isso é possível?	FREITAS, A. L. C. ; FREITAS, L.A.A.	2012		2	\N	2
1769	TC	Da Educação Bancária a Educação Problematizadora: Desvelando os espaços menores entre esses extremos e as contribuições para o ensinar e o aprender	FREITAS, A. L. C. ; FREITAS, L.A.A.	2012		2	\N	2
1770	TC	Há, em Freire, Espaços na Educação a Distância para a Possibilidade de Conscientização?	FREITAS, L.A.A. ; FREITAS, A. L. C.	2011		2	\N	2
1771	TC	Problematizando a Educação Conscientizadora na Promoção da Atividade de Integração Curricular	FREITAS, A. L. C. ; FREITAS, L.A.A.	2011		2	\N	2
1772	TC	Refletindo Sobre as Verdades no Espaço Tempo da Sala de Aula	FREITAS, A. L. C. ; FREITAS, L.A.A.	2011		2	\N	2
1773	TC	A Promoção da Atividade de Integração Curricular no Espaço Tempo Sala de Aula	FREITAS, A. L. C. ; FREITAS, L.A.A.	2011		2	\N	2
1774	TC	A Produção de Recursos Tecnológicos na Atividade de Integração Curricular	FREITAS, A. L. C. ; FREITAS, L.A.A.	2011		2	\N	2
1775	TC	As Práticas Educativas a Serviço da Transformação Social: pela Sustentabilidade da Vida	FREITAS, L.A.A. ; FREITAS, A. L. C.	2011		2	\N	2
1776	TC	Ressignificando as Atividades no Espaço Tempo da Sala de Aula	FREITAS, A. L. C. ; FREITAS, L.A.A.	2011		2	\N	2
1777	TC	A Atividade de Integração Curricular no Espaço Tempo da Sala de Aula	FREITAS, A. L. C. ; FREITAS, L.A.A.	2011		2	\N	2
1778	TC	A Prática Docente a Serviço da Transformação Social	FREITAS, L.A.A. ; FREITAS, A. L. C.	2011		2	\N	2
1779	TC	Compreendendo a Atividade de Integração Curricular no Espaço Tempo da Sala de Aula	FREITAS, A. L. C. ; FREITAS, L.A.A.	2011		2	\N	2
1780	TC	TUNING - Técnicas de Otimização de Banco de Dados. Um Estudo Comparativo: Mysql e Postgresql	CARNEIRO, A.P. ; MOREIRA, J.L. ; FREITAS, A. L. C.	2009		2	\N	2
1781	TC	Um Estudo sobre Técnicas de Otimização de Banco de Dados	CARNEIRO, A.P. ; MOREIRA, J.L. ; FREITAS, A. L. C.	2008		2	\N	2
2439	TC	Bayesian Network Structure Inference with an Hierarchical Bayesian Model	WERHLI, A. V.	2010	92-101	0	\N	3
2440	TC	Inferring Genetic Regulatory Networks with an Hierarchical Bayesian Model and a Parallel Sampling Algorithm	Mendoza, M. R. ; WERHLI, A. V.	2010	91-96	0	\N	3
1782	LP	Caderno de Atividades Práticas Supervisionadas. Anhanguera Publicações e Comércio de Material Didático Ltda	CAVALHEIRO, Rafael Fagundes ; VARGAS, A. P. ; DEVINCENZI, Sam da Silva	2008		3	\N	2
1783	AP	Usando CSP, RSL e o Modelo PopOrg na Especificação Formal de Organizações de SMAs	BARBOSA, R. M. ; COSTA, A. C. R.	2011	389-411	4	\N	2
1784	AP	Aplicação de Agentes BDI com Percepção Fuzzy no Modelo Presa-Predador	Farias, G. P. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R.	2011	299-324	4	\N	2
1786	AP	Exchange Values and Social Power Supporting the Choice of Partners	FRANCO, M. H. I. ; COSTA, A. C. R. ; COELHO, H.	2010	art_02	4	\N	2
1787	AP	Interpretações do Interferômetro de Mach-Zehnder no Modelo qMG. TEMA	AMARAL, R. B. ; REISER, Renata Hax Sander ; COSTA, A. C. R.	2009	111-124	4	\N	2
1789	AP	Capacitação de Gestores de Universidades através da Utilização de Jogos de Empresas Baseados em Instituições Eletrônicas	BERNARDI, Giliane ; COSTA, A. C. R.	2008	53-59	4	\N	2
1790	AP	Quantum Arrows in Haskell	VIZZOTO, Juliana Kaiser ; COSTA, A. C. R. ; Sabry, A.	2008	139-152	4	\N	2
1791	AA	Situated Normative Infra-structures: The Normative Objects Approach	OKUYAMA, Fabio Yoshimitsu ; COSTA, A. C. R. ; BORDINI, Rafael Heitor	2011		4	\N	2
2443	RE	DESCOBERTA DE CONHECIMENTO EM BANCOS DE DADOS: APLICADO AO CASO DE ALUNOS COM SUBSÍDIO NO NÚCLEO DE ASSITÊNCIA ESTUDANTIL NAE DA UNIVERSIDADE FEDERAL DO RIO GRANDE - FURG	WAGNER, A. ; Emmendorfer, L. R. ; WERHLI, A. V.	2011	1-5. CD-ROM	0	\N	3
2444	RC	Inferência de Redes Genéticas Regulatórias Utilizando Redes Booleanas	BARRETO, N. M. ; WERHLI, A. V.	2011		0	\N	3
2445	RC	Inferência de Estrutura de Redes Biológicas com a Combinação de Métricas de Redes Bayesianas	DUARTE, K. P. ; WERHLI, A. V.	2011		0	\N	3
1795	LP	Advance in Artificial Intelligence - SBIA 2010	COSTA, A. C. R. (Org.) ; Vicari, R. M. (Org.) ; Tonidandel, F. (Org.)	2010		4	\N	2
1796	LP	Proceedings of BWSS - Brazilian Workshop on Social Simulation. Porto Alegre: SBC	COSTA, A. C. R. (Org.)	2008		4	\N	2
2446	RC	Data Mining: Aplicado ao Caso de Alunos com Subsídio no Núcleo de Assistência Estudantil - NAE da Universidade Federal do Rio Grande - FURG	LORENZ, W. G. ; WERHLI, A. V.	2011		0	\N	3
2447	RC	Comparison of Bayesian networks and its extensions applied to the inference of regulatory networks	WERHLI, A. V.	2010		0	\N	3
2448	RC	Inferring genetic regulatory networks with an hierarchical Bayesian model and a parallel sampling algorithm	Mendoza, M. R. ; WERHLI, A. V.	2010		0	\N	3
1801	CL	On the Operationality of Moral-Sense Decision Making	COELHO, H. ; TRIGO, P. ; COSTA, A. C. R.	2011	15-20	4	\N	2
1802	CL	Simulating Argumentation about Exchange Values in Multi-agent Interactions	FRANCO, M. H. I. ; COSTA, A. C. R. ; COELHO, H.	2011	103-110	4	\N	2
1803	CL	Equation-Based Models as Formal Specifications of Agent-Based Models for Social Simulation: Preliminary Issues	COSTA, A. C. R. ; JEANNES, F. M. ; CAVA, U. A.	2011	119-126	4	\N	2
1804	CL	Towards the Modeling of the Social Organization of an Experiment of Social Management of Urban Vegetable Gardens	SANTOS, I. A. S. ; RODRIGUES, T. F. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R. ; DIMURO, G. ; MANUEL, E.	2011	98-101	4	\N	2
1805	CL	The Cultural Level of Agent Societies	COSTA, A. C. R.	2011	1-19	4	\N	2
2449	AP	Simulating crowds based on a space colonization algorithm	BICHO, A. L. ; RODRIGUES, R. A. ; MUSSE, S. R. ; JUNG, C. R. ; PARAVISI, M. ; MAGALHÃES, L. P.	2012	70-79	1	\N	3
2451	AP	An Interactive Model for Steering Behaviors of Groups of Characters	RODRIGUES, R. A. ; BICHO, A. L. ; PARAVISI, M. ; JUNG, C. R. ; MAGALHÃES, L. P. ; MUSSE, S. R.	2010	594-616	1	\N	3
2452	AP	Tree Paths: A New Model for Steering Behaviors. Proceedings of the 9th International Conference on Intelligent Virtual Agents	RODRIGUES, R. A. ; BICHO, A. L. ; PARAVISI, M. ; JUNG, C. R. ; MAGALHÃES, L. P. ; MUSSE, S. R.	2009	358-371	1	\N	3
1810	CL	Uso de CSP na Especificação Formal do Nível Micro-Organizacional de SMAs. Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações - Artigos Selecionados das quatro primeiras edições. Rio Grande	BARBOSA, R. M. ; COSTA, A. C. R. ; TEDESCO, P. ; Mota, A.	2010	86-94	4	\N	2
1811	CL	Modelo de Agente Econômico Cognitivo com Base no Conceito de Agentes BDI	JEANNES, F. M. ; COSTA, A. C. R.	2010	126-137	4	\N	2
1812	CL	Teoria dos Jogos aplicada à coordenação de agentes, utilizando Teoria dos Valores de Troca	Pereira, D. R. ; COSTA, A. C. R.	2010	150-161	4	\N	2
2453	TC	Simulation of Autonomous Agents using Terrain Reasoning	CASSOL, V. J. ; MARSON, F. P. ; VENDRAMINI, M. ; PARAVISI, M. ; MUSSE, S. R. ; BICHO, A. L. ; JUNG, C. R.	2011	101-108	1	\N	3
1814	CL	Using CSP in the Formal Specification of the Micro-organizational level of Multiagent Systems	BARBOSA, R. M. ; COSTA, A. C. R.	2010	459-464	4	\N	2
1817	CL	A Distributed Normative Infrastructure for Situated Multi-Agent Organisations	OKUYAMA, Fabio Yoshimitsu ; BORDINI, Rafael Heitor ; COSTA, A. C. R.	2008	29-46	4	\N	2
1799	CL	An Interactional Characterization of Social Functions	COSTA, A. C. R. ; DIMURO, Graçaliz Pereira	2011	74-81	4	1799	2
2457	RC	Consultoria em Legalização de Software	RAMOS, R. C. ; BICHO, A. L. ; CARVALHO, J. T. ; HAX, V. A.	2011	1-1. CD-ROM	1	\N	3
2458	RC	Computing Agents Motion using Terrain Reasoning	CASSOL, V. J. ; MARSON, F. P. ; VENDRAMINI, M. ; PARAVISI, M. ; BICHO, A. L. ; JUNG, C. R. ; MUSSE, S. R.	2010	10-11	1	\N	3
2459	AP	Estudo de Caso sobre Programação Orientada a Aspectos Utilizando RMI. Hífen (Uruguaiana	BORGES, F.S. ; FREITAS, A. L. C.	2008	1	2	\N	3
2460	TC	O Exercício, em Freire, da Conscientização Apoiado no Uso de Tecnologias na Educação	FREITAS, A. L. C. ; FREITAS, L.A.A.	2012	48-60	2	\N	3
2461	TC	A Conscientização em Espaços Menores: o inacabamento do professor	FREITAS, A. L. C. ; FREITAS, L.A.A.	2012		2	\N	3
2462	TC	A Conscientização, em Freire, Apoiada no Uso de Tecnologias na Educação a Distância	FREITAS, L.A.A. ; FREITAS, A. L. C.	2012		2	\N	3
2463	TC	Experienciações no Espaço Tempo da Sala de Aula: Em que condições são possíveis integrar os saberes?	FREITAS, A. L. C. ; FREITAS, L.A.A. ; SPEROTTO, R. I.	2012		2	\N	3
2464	TC	Experienciações no Espaço Tempo da Sala de Aula:A tecnologia a favor da integração dos saberes	FREITAS, A. L. C. ; FREITAS, L.A.A.	2012		2	\N	3
1825	TC	Simulando a Execução de Políticas Públicas através de Jason e CArtAgO	SANTOS, I. A. S. ; COSTA, A. C. R.	2012	81-92	4	\N	2
1826	TC	Toward a Framework for Simulating Agent-Based Models of Public Policy Processes on the Jason-CArtAgO Platform	COSTA, A. C. R. ; SANTOS, I. A. S.	2012	1-15	4	\N	2
2465	TC	Da Educação Bancária a Educação Problematizadora: Os espaços menores entre esse extremos e a sua contribuição para o ensinar e o aprender. Em que medida isso é possível?	FREITAS, A. L. C. ; FREITAS, L.A.A.	2012		2	\N	3
2466	TC	Da Educação Bancária a Educação Problematizadora: Desvelando os espaços menores entre esses extremos e as contribuições para o ensinar e o aprender	FREITAS, A. L. C. ; FREITAS, L.A.A.	2012		2	\N	3
2467	TC	Há, em Freire, Espaços na Educação a Distância para a Possibilidade de Conscientização?	FREITAS, L.A.A. ; FREITAS, A. L. C.	2011		2	\N	3
1830	TC	Um Modelo Multiagente para Carregamento Compartilhado com Prioridades em um Terminal de Conêineres: Combinando o Problema da Mochila com PDMs	Rodrigues, L. M. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R. ; EMMENDORFER, L.	2011	51-62	4	\N	2
2468	TC	Problematizando a Educação Conscientizadora na Promoção da Atividade de Integração Curricular	FREITAS, A. L. C. ; FREITAS, L.A.A.	2011		2	\N	3
2469	TC	Refletindo Sobre as Verdades no Espaço Tempo da Sala de Aula	FREITAS, A. L. C. ; FREITAS, L.A.A.	2011		2	\N	3
1833	TC	Uso de CSP na Especificação Formal do Nível Micro-Organizacional de Sistemas Multiagentes	BARBOSA, R. M. ; COSTA, A. C. R.	2010	13-21	4	\N	2
1834	TC	Um Modelo de Agente Econômico Cognitivo com Base no Conceito de Agentes BDI	JEANNES, F. M. ; COSTA, A. C. R.	2010	53-64	4	\N	2
1835	TC	Teoria dos Jogos aplicada à coordenação de agentes, utilizando Teoria dos Valores de Troca	Pereira, D. R. ; COSTA, A. C. R.	2010	77-88	4	\N	2
2470	TC	A Promoção da Atividade de Integração Curricular no Espaço Tempo Sala de Aula	FREITAS, A. L. C. ; FREITAS, L.A.A.	2011		2	\N	3
2471	TC	A Produção de Recursos Tecnológicos na Atividade de Integração Curricular	FREITAS, A. L. C. ; FREITAS, L.A.A.	2011		2	\N	3
2472	TC	As Práticas Educativas a Serviço da Transformação Social: pela Sustentabilidade da Vida	FREITAS, L.A.A. ; FREITAS, A. L. C.	2011		2	\N	3
2473	TC	Ressignificando as Atividades no Espaço Tempo da Sala de Aula	FREITAS, A. L. C. ; FREITAS, L.A.A.	2011		2	\N	3
2474	TC	A Atividade de Integração Curricular no Espaço Tempo da Sala de Aula	FREITAS, A. L. C. ; FREITAS, L.A.A.	2011		2	\N	3
2475	TC	A Prática Docente a Serviço da Transformação Social	FREITAS, L.A.A. ; FREITAS, A. L. C.	2011		2	\N	3
1842	TC	On the Operationality of Moral-Sense Decision Making	COELHO, H. ; COSTA, A. C. R. ; TRIGO, P.	2010	11-22	4	\N	2
1843	TC	Moral Minds as Multiple-Layer Organizations	COELHO, H. ; COSTA, A. C. R. ; TRIGO, P.	2010	254-263	4	\N	2
1844	TC	Decision Making for Agent Moral Conducts	COELHO, H. ; COSTA, A. C. R. ; TRIGO, P.	2010	1-12	4	\N	2
2476	TC	Compreendendo a Atividade de Integração Curricular no Espaço Tempo da Sala de Aula	FREITAS, A. L. C. ; FREITAS, L.A.A.	2011		2	\N	3
1846	TC	Aprendizagem Organizacional através de Simulação baseada em Instituições Eletrônicas e Agentes de Software	BERNARDI, Giliane ; COSTA, A. C. R.	2009		4	\N	2
2477	TC	TUNING - Técnicas de Otimização de Banco de Dados. Um Estudo Comparativo: Mysql e Postgresql	CARNEIRO, A.P. ; MOREIRA, J.L. ; FREITAS, A. L. C.	2009		2	\N	3
2478	TC	Um Estudo sobre Técnicas de Otimização de Banco de Dados	CARNEIRO, A.P. ; MOREIRA, J.L. ; FREITAS, A. L. C.	2008		2	\N	3
1849	TC	A Critical Study of the Coherence between EBMs and ABMs in the Simulation of the Hawks-Doves-LawAbiders Society	JEANNES, F. M. ; COSTA, A. C. R.	2009	475-486	4	\N	2
1850	TC	On the Intelligence of Moral Agency	COELHO, H. ; COSTA, A. C. R.	2009	439-450	4	\N	2
2479	RC	Re-significando as Atividades em Sala de Aula	FREITAS, A. L. C. ; FREITAS, L.A.A.	2011		2	\N	3
2480	RC	AXUL - Um framework PHP para a geração de interfaces XUL	MADSEN, C. A. B. W. ; FREITAS, A. L. C.	2009		2	\N	3
2481	LP	Caderno de Atividades Práticas Supervisionadas. Anhanguera Publicações e Comércio de Material Didático Ltda	CAVALHEIRO, Rafael Fagundes ; VARGAS, A. P. ; DEVINCENZI, Sam da Silva	2008		3	\N	3
2482	AP	Usando CSP, RSL e o Modelo PopOrg na Especificação Formal de Organizações de SMAs	BARBOSA, R. M. ; COSTA, A. C. R.	2011	389-411	4	\N	3
1855	TC	Capacitação de Gestores de Instituições de Ensino Superior através da Simulação de Processos Administrativos utilizando a Abordagem de Instituições Eletrônicas	BERNARDI, Giliane ; COSTA, A. C. R.	2008	1-12	4	\N	2
2483	AP	Aplicação de Agentes BDI com Percepção Fuzzy no Modelo Presa-Predador	Farias, G. P. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R.	2011	299-324	4	\N	3
2485	AP	Exchange Values and Social Power Supporting the Choice of Partners	FRANCO, M. H. I. ; COSTA, A. C. R. ; COELHO, H.	2010	art_02	4	\N	3
2486	AP	Interpretações do Interferômetro de Mach-Zehnder no Modelo qMG. TEMA	AMARAL, R. B. ; REISER, Renata Hax Sander ; COSTA, A. C. R.	2009	111-124	4	\N	3
1857	TC	Interpretações do Interferômetro de Mach-Zehnder no Modelo qMG	AMARAL, R. B. ; REISER, Renata Hax Sander ; COSTA, A. C. R.	2008	1-10	4	\N	2
1858	TC	Simulating Argumentation about Exchange Values in Multi-Agents Interactions	ISLABÃO, Márcia Hafelle ; COSTA, A. C. R.	2009	1-12	4	\N	2
1859	TC	Jogos de Empresa e Aprendizagem Organizacional: um Estudo de Caso de Simulação de Processos Organizacionais de uma Instituição de Educação Superior	BERNARDI, Giliane ; COSTA, A. C. R.	2008		4	\N	2
1860	TC	Jogo de Empresa baseado em Agentes de Software e Instituições Eletrônicas para Aprendizagem Organizacional de Gestores de Instituições de Educação Superior	BERNARDI, Giliane ; COSTA, A. C. R.	2008		4	\N	2
1861	TC	Equation based Models as Formal Specifications of Agent-based Models for Social Simulation: preliminary issues	COSTA, A. C. R. ; JEANNES, F. M. ; CAVA, U. A.	2008	1-12	4	\N	2
2488	AP	Capacitação de Gestores de Universidades através da Utilização de Jogos de Empresas Baseados em Instituições Eletrônicas	BERNARDI, Giliane ; COSTA, A. C. R.	2008	53-59	4	\N	3
2489	AP	Quantum Arrows in Haskell	VIZZOTO, Juliana Kaiser ; COSTA, A. C. R. ; Sabry, A.	2008	139-152	4	\N	3
2490	AA	Situated Normative Infra-structures: The Normative Objects Approach	OKUYAMA, Fabio Yoshimitsu ; COSTA, A. C. R. ; BORDINI, Rafael Heitor	2011		4	\N	3
1866	AP	A Low-Cost Solution for Deploying Processor Cores in Harsh Environments. IEEE Transactions on Industrial Electronics (1982	Violante, Massimo ; MEINHARDT, Cristina ; REIS, R. A. L. ; Reis, Ricardo ; Sonza Reorda, Matteo	2011	2617-2626	7	\N	2
1867	TC	Evaluation of Process Variability on Current for Nanotechnologies Devices	MEINHARDT, Cristina ; REIS, Ricardo	2012	1-4	7	\N	2
1871	TC	Energy Evaluation of Nanometer CMOS Technologies	NUNES, C. S. ; MEINHARDT, Cristina ; BUTZEN, P. F.	2012	1-4	7	\N	2
1872	TC	Full Adder Cells Evaluation for Subthreshold Operation on 32nm CMOS Technology	SILVA, A. N. ; MEINHARDT, Cristina ; BUTZEN, P. F.	2012		7	\N	2
1873	TC	Impact of Process Variability considering Transistor Networks Delay	GUEX, Jerson P. ; MEINHARDT, Cristina ; REIS, Ricardo	2011	1-4	7	\N	2
1874	TC	Estudo do impacto da variabilidade em um conjunto de blocos básicos para composição de leiautes regulares	MEINHARDT, Cristina ; GUEX, Jerson P. ; REIS, Ricardo	2010	1-6	7	\N	2
1875	TC	A Case Study about Variability Impact in a Set of Basic Blocks Designed to Regular Layouts	GUEX, Jerson P. ; MEINHARDT, Cristina ; REIS, Ricardo	2010	71-74	7	\N	2
1876	TC	ESTUDO DA INFLUÊNCIA DA TEMPERATURA NO COMPORTAMENTO ELÉTRICO DE TRANSISTORES EM TECNOLOGIAS NANOMÉTRICAS	Diones Fischer ; Marcio Macedo ; Matheus Muller Korb ; MEINHARDT, Cristina	2010	1-4	7	\N	2
1877	TC	IMPLEMENTAÇÃO DE UM SIMULADOR DE SISTEMA DE MEMÓRIA CACHE	Christian Silva ; Eduardo Teixeira ; Mauro Barbat ; MEINHARDT, Cristina	2010		7	\N	2
1878	TC	UMA IMPLEMENTAÇÃO DO ALGORITMO BOOTH USANDO MANIPULAÇÃO DE BITS	Matheus Machado ; MEINHARDT, Cristina	2010		7	\N	2
1879	TC	A Low-Cost SEE Mitigation Solution for Soft-Processors Embedded in Systems on Programmable Chips	VIOLANTE, M. ; MEINHARDT, Cristina ; REIS, Ricardo ; REORDA, M. S.	2009	352-358	7	\N	2
1880	TC	Recovery Scheme for Hardening System on Programmable Chips	MEINHARDT, Cristina ; VIOLANTE, M. ; REORDA, M. S. ; REIS, Ricardo	2009	1-6	7	\N	2
1881	TC	An On-Board Data-Handling Computer for Deep-Space Exploration Built Using Commercial-Of-The-Shelf SRAM-Based FPGAs	VIOLANTE, M. ; REORDA, M. S. ; MEINHARDT, Cristina ; REIS, Ricardo	2009	254-262	7	\N	2
1882	TC	Leiautes Regulares Baseados em Matrizes de Células	MEINHARDT, Cristina ; REIS, Ricardo ; TAVARES, Reginaldo da Nobrega	2009	127-132	7	\N	2
1883	TC	An Experimental Analysis of the Lockstep Architecture	MEINHARDT, Cristina ; VIOLANTE, M. ; REORDA, M. S. ; REIS, Ricardo	2008	89-93	7	\N	2
1884	TC	Recovery Scheme for Hardening System on Programmable Chips	MEINHARDT, Cristina ; VIOLANTE, M. ; REIS, Ricardo ; REORDA, M. S.	2008	1-4	7	\N	2
2494	LP	Advance in Artificial Intelligence - SBIA 2010	COSTA, A. C. R. (Org.) ; Vicari, R. M. (Org.) ; Tonidandel, F. (Org.)	2010		4	\N	3
1886	AA	A Model-based Integration of Data to Improve Maintenance Management by Mixed Reality	ESPÍNDOLA, Danúbia Bueno ; FUMAGALLI, L. ; GARETTI, M. ; PEREIRA, Carlos Eduardo ; BOTELHO, Silvia S da C ; HENRIQUES, Renato Ventura Bayan	2012		8	\N	2
1887	TC	Integrating Intelligent Maintenance Systems and Spare Parts Supply Chains	ESPÍNDOLA, Danúbia Bueno ; FRAZZON, E. M. ; HELLINGRATH, B. ; PEREIRA, Carlos Eduardo	2012		8	\N	2
2495	LP	Proceedings of BWSS - Brazilian Workshop on Social Simulation. Porto Alegre: SBC	COSTA, A. C. R. (Org.)	2008		4	\N	3
1890	TC	Um caso de uso do ambiente virtual de aprendizagem (SLOODLE) no ensino à distância	Mota, F. ; ESPÍNDOLA, Danúbia Bueno ; TUSNSKI, L. F. M. ; Pinto, I. M.	2012	1-12	8	\N	2
1891	TC	Visualization Management of Industrial Maintenance Data Using Augmented Reality	ESPÍNDOLA, Danúbia Bueno ; PEREIRA, Carlos Eduardo ; HENRIQUES, Renato Ventura Bayan ; BOTELHO, Silvia S da C	2011	1-8	8	\N	2
1868	TC	Design of 16nm SRAM Architecture	GOMES, I. A. C. ; Meinhardt, Cristina ; BUTZEN, P. F.	2012	1-4	7	1868	2
2500	CL	On the Operationality of Moral-Sense Decision Making	COELHO, H. ; TRIGO, P. ; COSTA, A. C. R.	2011	15-20	4	\N	3
1894	TC	Detecção de falhas em atuadores nas linhas de transporte de petróleo e/ou derivados	HENRIQUES, Renato Ventura Bayan ; PEREIRA, Carlos Eduardo ; SCHNEIDER, Eduardo Luis ; GONÇALVES, Luiz Fernando ; ESPÍNDOLA, Danúbia Bueno	2010		8	\N	2
1895	TC	IM:MR - A Tool for integration of data from different formats	ESPÍNDOLA, Danúbia Bueno ; PEREIRA, Carlos Eduardo ; PINHO, Marcio	2009	620-626	8	\N	2
1896	TC	A solution for integration of IM and MR data	ESPÍNDOLA, Danúbia Bueno ; PEREIRA, Carlos Eduardo	2009	423-430	8	\N	2
1897	AP	Signal probability for reliability evaluation of logic circuits	FRANCO, D ; VASCONCELOS, M ; NAVINER, L ; NAVINER, J	2008	1586-1591	9	\N	2
1898	AP	Relevant metrics for evaluation of concurrent error detection schemes	DEVASCONCELOS, M ; FRANCO, D ; NAVINER, L ; NAVINER, J	2008	1601-1603	9	\N	2
1899	TC	Uma nova técnica para análise HEPWM baseada na aplicação de multiplicadores de Lagrange	OBADOWSKI, V. N. ; RIECHEL, T. L. ; CRUZ, M. F. ; UGOSKI, P. E. M. ; RICHTER, C. M. ; SEVERO, S. L. S. ; A. P. Lerm ; FRANCO, D. T. ; CIARELLI, W. F.	2012		9	\N	2
1900	TC	A Supervisory System for Real-Time Oscillography of Synchronous Generators	CRUZ, M. F. ; RIECHEL, T. L. ; OBADOWSKI, V. N. ; UGOSKI, P. E. M. ; RICHTER, C. M. ; SEVERO, S. L. S. ; A. P. Lerm ; OLIVEIRA, M. O. ; PAZ, M. C. R. ; BRETAS, A. S. ; FRANCO, D. T. ; CIARELLI, W. F.	2012		9	\N	2
1901	TC	A New Method to Minimize Harmonic Components on PWM Signals Based on Lagrange Multipliers	OBADOWSKI, V. N. ; RIECHEL, T. L. ; CRUZ, M. F. ; UGOSKI, P. E. M. ; RICHTER, C. M. ; SEVERO, S. L. S. ; A. P. Lerm ; OLIVEIRA, M. O. ; PAZ, M. C. R. ; BRETAS, A. S. ; FRANCO, D. T. ; CIARELLI, W. F.	2012		9	\N	2
1902	TC	Active Power Regulation of Auxiliary Generation Units in Hydroelectric Power Plants Using Power Electronic Switching	PAZ, M. C. R. ; OLIVEIRA, M. O. ; BRETAS, A. S. ; CRUZ, M. F. ; RIECHEL, T. L. ; OBADOWSKI, V. N. ; UGOSKI, P. E. M. ; RICHTER, C. M. ; A. P. Lerm ; SEVERO, S. L. S. ; FRANCO, D. T. ; CIARELLI, W. F.	2012		9	\N	2
1903	TC	Controle de Potência Ativa em Geradores Auxiliares de Usinas Hidrelétricas Através de sua Compensação Série	OLIVEIRA, M. O. ; PAZ, M. C. R. ; BRETAS, A. S. ; CRUZ, M. F. ; RIECHEL, T. L. ; OBADOWSKI, V. N. ; UGOSKI, P. E. M. ; RICHTER, C. M. ; SEVERO, S. L. S. ; A. P. Lerm ; FRANCO, D. T. ; CIARELLI, W. F.	2012		9	\N	2
1904	TC	Sistema Supervisório Voltado para Oscilografia em Tempo Real de Geradores Síncronos	CRUZ, M. F. ; RIECHEL, T. L. ; OBADOWSKI, V. N. ; UGOSKI, P. E. M. ; RICHTER, C. M. ; SEVERO, S. L. S. ; A. P. Lerm ; OLIVEIRA, M. O. ; PAZ, M. C. R. ; BRETAS, A. S. ; FRANCO, D. T. ; CIARELLI, W. F.	2012		9	\N	2
1905	TC	Um Novo Método para Minimização de Componentes Harmônicos em Sinais PWM Baseado em Multiplicadores de Lagrange Aplicados a HEPWM	OBADOWSKI, V. N. ; RIECHEL, T. L. ; CRUZ, M. F. ; UGOSKI, P. E. M. ; RICHTER, C. M. ; SEVERO, S. L. S. ; A. P. Lerm ; OLIVEIRA, M. O. ; PAZ, M. C. R. ; BRETAS, A. S. ; FRANCO, D. T. ; CIARELLI, W. F.	2012		9	\N	2
1906	TC	On evaluating the signal reliability of self-checking arithmetic circuits	FRANCO, D. T. ; VASCONCELOS, M ; NAVINER, L ; NAVINER, J	2010	109-114	9	\N	2
1907	TC	A Software Tool for the Analysis of Reliability in Combinational Logic Circuits	BORGES, M. T. ; OLIVEIRA, R. F. ; FRANCO, D. T.	2010	83-86	9	\N	2
1908	TC	Methods and Metrics for Reliability Assessment	NAVINER, L ; NAVINER, J ; FRANCO, D. T. ; VASCONCELOS, M	2009	1-14	9	\N	2
1909	TC	Efficient computation of logic circuits reliability based on Probabilistic Transfer Matrix	NAVINER, L ; VASCONCELOS, M ; FRANCO, D. T. ; NAVINER, J	2008	01-04	9	\N	2
1910	TC	Reliability analysis of combinational circuits based on a probabilistic binomial model	VASCONCELOS, M ; FRANCO, D. T. ; NAVINER, L ; NAVINER, J	2008	310-313	9	\N	2
1911	TC	Reliability of logic circuits under multiple simultaneous faults	FRANCO, D. T. ; VASCONCELOS, M ; NAVINER, L ; NAVINER, J	2008	265-268	9	\N	2
1912	TC	Reliability analysis of logic circuits based on signal probability	FRANCO, D. T. ; VASCONCELOS, M ; NAVINER, L ; NAVINER, J	2008	670-673	9	\N	2
1913	TC	On the output events in concurrent error detection schemes	VASCONCELOS, M ; FRANCO, D. T. ; NAVINER, L ; NAVINER, J	2008	978-981	9	\N	2
1914	TC	Evaluating signal reliability of logic circuits by signal probability	FRANCO, D. T. ; VASCONCELOS, M ; NAVINER, L ; NAVINER, J	2008	01-02	9	\N	2
1915	AP	Utilização de Autômatos Celulares para Simulação de Impactos Ambientais	SILVA, F. N. ; ADAMATTI, D. F.	2012	1-10	10	\N	2
1916	AP	FURG Smart Games: a development enviroment to NPC decisions in games	MADSEN, C. ; LUCCA, G. ; DANIEL, G. B. ; ADAMATTI, D. F.	2012	47-61	10	\N	2
1917	AP	Usando a Metodologia Prometheus para Modelagem de um Sistema Multiagente	RODRIGUES, T. ; ADAMATTI, D. F.	2012	1-15	10	\N	2
1918	AP	NeuroFURG: uma ferramenta de apoio ao ensino de Redes Neurais Artificiais	MADSEN, C. ; ADAMATTI, D. F.	2011	14-24	10	\N	2
1919	AP	Simulação Baseada em Multiagentes como Ferramenta em Estudos Interdisciplinares. RENOTE	ADAMATTI, D. F.	2011	1-9	10	\N	2
1920	AP	Using Artificial Intelligence in Computational Games	MADSEN, C. ; ADAMATTI, D. F.	2011	60-67	10	\N	2
1921	AP	Uso de Árvores de Decisão para Captura de Comportamentos de Agentes	SILVEIRA, J. A. ; PAES, T. L. ; ADAMATTI, D. F. ; EMMENDORFER, L. R.	2011	1-21	10	\N	2
1922	AP	An analysis of the insertion of virtual players in GMABS methodology using the Vip-JogoMan prototype. JASSS	ADAMATTI, D. F. ; SICHMAN, Jaime Simão ; COELHO, Helder	2009	1-40	10	\N	2
1923	AP	Inserção de Jogadores Virtuais em Jogos de Papeis para uso em sistemas de apoio a decisão em Grupos: um Experimento no Domínio da Gestão dos Recursos Naturais. IP	ADAMATTI, D. F.	2008	115-116	10	\N	2
1924	LP	V Conferência Sul em Modelagem Computacional	SOUZA, J. A. (Org.) ; ADAMATTI, D. F. (Org.) ; RODRIGUES, R. G. (Org.) ; KRUSCHE, N. (Org.) ; EMMENDORFER, L. R. (Org.)	2012		10	\N	2
1925	LP	Advances in Social Simulation, 2010 Second Brazilian Workshop on Social Simulation, BWSS 2010, Post-Proceedings. Los Alamitos: IEEE	DIMURO, G. P. (Org.) ; COSTA, A. C. R. (Org.) ; SICHMAN, Jaime Simão (Org.) ; Tedesco, P. C. A. R. (Org.) ; ADAMATTI, D. F. (Org.) ; BALSA, J. (Org.) ; ANTUNES, L. (Org.)	2011		10	\N	2
2501	CL	Simulating Argumentation about Exchange Values in Multi-agent Interactions	FRANCO, M. H. I. ; COSTA, A. C. R. ; COELHO, H.	2011	103-110	4	\N	3
1927	LP	Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações - Artigos Selecionados das quatro primeiras edições. Rio Grande / RS: Edigraf- Editora e Gráfica da Universidade Federal do Rio Grande	ADAMATTI, D. F. (Org.)	2010		10	\N	2
1928	LP	Anais do Simpósio de Modelagem Computacional do Sul	ROCHA, L. A. O. (Org.) ; BOTELHO, S.S.C. (Org.) ; ADAMATTI, D. F. (Org.)	2009		10	\N	2
1929	CL	An Agent-Based Decision Support System to Simulate Generated Impacts by Industries Installation	NUNES, G. ; THOMASI, C. D. ; JUGUEIRO, M. ; ADAMATTI, D. F.	2012	95	10	\N	2
1930	CL	A Proposal for Interoperability to Agent Communication Using Synonyms	SPEROTTO, F. A. ; ADAMATTI, D. F.	2012	1-5	10	\N	2
1931	CL	Modeling Role Interactions in a Social Organization for the Simulation of the Social Production and Management of Urban Ecosystems: the case of San Jernimo Vegetable Garden of Seville, Spain	SANTOS, F. C. P. ; RODRIGUES, T. ; ADAMATTI, D. F. ; DIMURO, G. ; DIMURO, G. P. ; COSTA, A. C. R. ; JEREZ, E. M.	2012	1-4	10	\N	2
1932	CL	Artificial Intelligence Applied to Natural Resources Management. Machine Learning: Concepts, Methodologies, Tools and Applications. New York	ADAMATTI, D. F. ; AGUIAR, M. S.	2011	1566-1582	10	\N	2
1933	CL	Artificial Intelligence Applied to Natural Resources Management	ADAMATTI, D. F. ; AGUIAR, M. S.	2010	313-330	10	\N	2
1934	CL	Simulação Baseada em Multiagentes em Atividades de Graduação	ADAMATTI, D. F.	2010	208-211	10	\N	2
2502	CL	Equation-Based Models as Formal Specifications of Agent-Based Models for Social Simulation: Preliminary Issues	COSTA, A. C. R. ; JEANNES, F. M. ; CAVA, U. A.	2011	119-126	4	\N	3
1936	CL	Design of an Artificial Decision Maker for a Human-Based Social Simulation - Experience of the SIMPARC ProjectDesign of an Artificial Decision Maker for a Human-Based Social Simulation - Experience of the SIMPARC Project	BRIOT, J. ; SORDONI, A. ; VASCONCELOS FILHO, J. E. ; PATTO, V. S. ; ADAMATTI, D. F. ; IRVING, M. ; MELLO, G. ; Lucena, C.	2010	17-35	10	\N	2
1937	CL	A Inteligência Artificial e o Gerenciamento de Recursos Naturais	ADAMATTI, D. F. ; AGUIAR, M. S.	2009	67-86	10	\N	2
1938	TC	Using GIS for Impact Analysis from Industries Installation	THOMASI, C. D. ; NUNES, G. ; JUGUEIRO, M. ; ADAMATTI, D. F.	2012		10	\N	2
1939	TC	Experiências de Inclusão Digital em Escolas Municipais de Rio Grande	ADAMATTI, D. F. ; SILVA, D. ; FELIX, D. ; FLORES, E. ; ROCHANO, E. L. ; LINDENAU, G. ; CARVALHO, J. T. ; HAX, V. A. ; DJALO, M.	2012	1-10	10	\N	2
1940	TC	FURG Smart Games: a Propose for a Environment to Game Development With Software Reuse and Artificial Intelligence	MADSEN, C. ; LUCCA, G. ; DANIEL, G. B. ; ADAMATTI, D. F.	2012	1-15	10	\N	2
2503	CL	Towards the Modeling of the Social Organization of an Experiment of Social Management of Urban Vegetable Gardens	SANTOS, I. A. S. ; RODRIGUES, T. F. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R. ; DIMURO, G. ; MANUEL, E.	2011	98-101	4	\N	3
2504	CL	The Cultural Level of Agent Societies	COSTA, A. C. R.	2011	1-19	4	\N	3
1944	TC	Inclusão Digital como Ferramenta para Mudanças Sociais	ADAMATTI, D. F. ; CARVALHO, J. T. ; HAX, V. A. ; KLUMB, A. ; DUARTE, B. T. ; MIRAPALHETA, B. ; SILVA, D. ; FLORES, E. ; ROCHANO, E. L. ; LUCCA, G. ; LINDENAU, G. ; MARTINAZZO, L. A. ; DJALO, M. ; GRILLO, T. ; LEAL, T.	2012	1-6	10	\N	2
1947	TC	Um Modelo para Comunicação de Agentes Tratando Informações Imprecisas Baseado em Sinônimos	SPEROTTO, F. A. ; ADAMATTI, D. F.	2012	1-6	10	\N	2
1948	TC	FSG-ANNBack: Proposal of an Environment to Insert Artificial Neural Networks to Game Development Using Software Reuse	MADSEN, C. ; LUCCA, G. ; DANIEL, G. B. ; ADAMATTI, D. F.	2012	1-6	10	\N	2
1949	TC	Definição de sistema de apoio à decisão baseado em agentes para simulação de impactos gerados pela instalação de indústrias	BASTOS, N. ; MARQUES, B. ; ADAMATTI, D. F.	2012	1-6	10	\N	2
1950	TC	Processamento e Classificação de Sinais Cerebrais para o Uso em Sistemas BCI	SILVEIRA, J. A. ; ADAMATTI, D. F.	2012	1-6	10	\N	2
1951	TC	A Model for Agent Communication Based on Imprecise Information Using Synonyms	SPEROTTO, F. A. ; ADAMATTI, D. F.	2012	1-6	10	\N	2
1953	TC	Utilização do Simulador SUMO para Simulação de Dispersão de Poluentes	BORN, M. B. ; ADAMATTI, D. F.	2012	1-6	10	\N	2
2509	CL	Uso de CSP na Especificação Formal do Nível Micro-Organizacional de SMAs. Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações - Artigos Selecionados das quatro primeiras edições. Rio Grande	BARBOSA, R. M. ; COSTA, A. C. R. ; TEDESCO, P. ; Mota, A.	2010	86-94	4	\N	3
1955	TC	Inclusão Digital em Escola de Ensino Básico em Rio Grande (RS)	ADAMATTI, D. F. ; CARVALHO, J. T. ; HAX, V. A. ; KLUMB, A. ; SILVA, D. ; FLORES, E. ; CAMACHO, P. M. ; DJALO, M.	2011		10	\N	2
1956	TC	Inclusão Digital em Escola de Ensino Básico em Rio Grande (RS)	ADAMATTI, D. F. ; CARVALHO, J. T. ; HAX, V. A. ; KLUMB, A. ; SILVA, D. ; FLORES, E. ; CAMACHO, P. M. ; DJALO, M.	2011		10	\N	2
1957	TC	Atividades para Inclusão Digital em Ensino Básico: Uma Experiência em Escola de Rio Grande (RS)	ADAMATTI, D. F. ; CARVALHO, J. T. ; HAX, V. A. ; KLUMB, A. ; SILVA, D. ; CAMACHO, P. M. ; DJALO, M.	2011		10	\N	2
2510	CL	Modelo de Agente Econômico Cognitivo com Base no Conceito de Agentes BDI	JEANNES, F. M. ; COSTA, A. C. R.	2010	126-137	4	\N	3
2511	CL	Teoria dos Jogos aplicada à coordenação de agentes, utilizando Teoria dos Valores de Troca	Pereira, D. R. ; COSTA, A. C. R.	2010	150-161	4	\N	3
1960	TC	A Framework for Intelligent Games	ADAMATTI, D. F.	2010	376-380	10	\N	2
1962	TC	Problemas de Sincronização em Massively Multiplayer Online Games: Um Experimento Sobre a Plataforma SIM3D	FELSKE, M. S. ; ADAMATTI, D. F.	2010	1-4 - CDROM	10	\N	2
1963	TC	Um Overview sobre a Utilização de Técnicas de Inteligência Artificial em Gerenciamento de Recursos Naturais	GULARTE, A. ; THOMASI, C. D. ; NUNES, G. ; ADAMATTI, D. F.	2010	1-4 - CDROM	10	\N	2
2513	CL	Using CSP in the Formal Specification of the Micro-organizational level of Multiagent Systems	BARBOSA, R. M. ; COSTA, A. C. R.	2010	459-464	4	\N	3
1978	LP	Introdução à Educação a Distância	GONÇALVES, E. M. N. ; Vieira, Suzane R	2011		11	\N	2
1965	TC	UMA FERRAMENTA DE SIMULAÇÃO PARA IMPACTOS AMBIENTAIS	NUNES, G. ; THOMASI, C. D. ; GULARTE, A. ; ADAMATTI, D. F.	2010		10	\N	2
1966	TC	Design of an Artificial Decision Maker for a Human-based Social Simulation - Experience of the SimParc Project	BRIOT, J. ; SORDONI, A. ; VASCONCELOS FILHO, J. E. ; PATTO, V. S. ; ADAMATTI, D. F. ; IRVING, M.	2009	1-16.CDROM	10	\N	2
1967	TC	A Computer-based Support for Participatory Management of Protected Areas: The SimParc Project	BRIOT, J. ; PATTO, V. S. ; VASCONCELOS FILHO, J. E. ; ADAMATTI, D. F. ; SORDONI, A. ; MELLO, G.	2009	1337-1346	10	\N	2
1968	TC	An Overview of the MABS and RPG Techniques in Natural Resources Management	ADAMATTI, D. F.	2009	538-542	10	\N	2
1969	TC	Desenvolvimento de agentes: Uma análise da utilização da metodologia Prometheus	BERNY, V. M. ; ADAMATTI, D. F. ; COSTA, A. C. R.	2009	1-10.CDROM	10	\N	2
1970	TC	A Framework to combine MDA and Ontology Learning	CANTELE, R. C. ; FERREIRA, M. A. G. V. ; ADAMATTI, D. F. ; ARAUJO, M.	2008	1-12.CDROM	10	\N	2
1971	TC	An Experiment on Knowledge Reuse: Standards Applied	CANTELE, R. C. ; FERREIRA, M. A. G. V. ; ADAMATTI, D. F. ; ARAUJO, M.	2008	1-12.CDROM	10	\N	2
1972	TC	A Computer-based Support for Participatory Management of Protected Areas: The SimParc Project	BRIOT, J. ; VASCONCELOS FILHO, J. E. ; ADAMATTI, D. F. ; PATTO, V. S. ; BARBOSA, S. ; FURTADO, V. ; IRVING, M. ; Lucena, C.	2008	1-15.CDROM	10	\N	2
1973	TC	Uso de Agentes e Ontologias na Integração de Sistemas de Informação em Saúde	WEBBER, C. G. ; ADAMATTI, D. F. ; SALVADORI, J. ; RIBEIRO, A. M. ; PINTO, L. F. ; FERLA, A.	2008	1-10.CDROM	10	\N	2
1974	TC	ExML: um Curso de Nivelamento na Modalidade EAD	Falavigna, M.R. ; ADAMATTI, D. F. ; Kuyven, N. L.	2008	1-6.CDROM	10	\N	2
1975	TC	Inserção de Jogadores Virtuais em Jogos de Papéis para Uso em Sistemas de Apoio a Decisão em Grupos: Um Experimento no Domínio da Gestão de Recursos Naturais	ADAMATTI, D. F. ; SICHMAN, Jaime Simão	2008	1-10.CDROM	10	\N	2
1976	TC	Construção de Ontologias Iniciais a partir de Sistemas Legados	ADAMATTI, D. F.	2008	1-10.CDROM	10	\N	2
1977	TC	A Web Semântica e a Eduação	CANTELE, R. C. ; ADAMATTI, D. F. ; FERREIRA, M. A. G. V.	2008	1-1.CDROM	10	\N	2
1979	TC	Modelagem de Função Avaliação para o Domínio de Futebol de Robôs em Simulação 2D	GONÇALVES, E. M. N. ; FOGAÇA, Mateus	2012	184-187	11	\N	2
1980	TC	Gerando Bases de Conhecimento no Formato XML para Sistemas Multiagentes utilizando Redes de Petri	GONÇALVES, E. M. N. ; SANTOS, M. M.	2011		11	\N	2
1981	TC	An Approach to Specify Knowledge in Multi-agent Systems using Petri Nets	GONÇALVES, E. M. N.	2010	456-461	11	\N	2
2516	CL	A Distributed Normative Infrastructure for Situated Multi-Agent Organisations	OKUYAMA, Fabio Yoshimitsu ; BORDINI, Rafael Heitor ; COSTA, A. C. R.	2008	29-46	4	\N	3
1987	TC	TATUBOT - Robotic System for Inspection of Undergrounded Cable System	MELLO, C. ; GONÇALVES, E. M. N. ; ESTRADA, E. ; ALMEIDA, Renan Rosado de ; BOTELHO, S. S. C. ; OLIVEIRA, V. M.	2008	170-175	11	\N	2
1988	AP	An unsupervised heuristic-based approach for bibliographic metadata deduplication	Borges, Eduardo N. ; de Carvalho, Moisés G. ; Galante, Renata ; GONÇALVES, Marcos André ; Laender, Alberto H.F.	2011	706-718	13	\N	2
1989	TC	Um sistema para análise de redes de pesquisa baseado na Plataforma Lattes	FARIAS, Lucas R. ; Vargas, André P. ; Borges, Eduardo N.	2012	1-10 CD-ROM	13	\N	2
1990	TC	Uma ferramenta para coleta e análise de dados do segmento naval	Otero, Tiago F. ; FARIAS, Lucas R. ; Vargas, André P. ; Borges, Eduardo N.	2012	1-4 CD-ROM	13	\N	2
1991	TC	ARGOsearch: an information retrieval system based on text similarity and extensible relevance criteria	Borges, Eduardo N. ; PEREIRA, Igor A. ; TOMASINI, C. ; Vargas, André P.	2012	1-8	13	\N	2
1992	TC	Um mecanismo de busca para sistemas de gerenciamento de bibliotecas baseado em critérios de relevância extensíveis	PEREIRA, Igor A. ; TOMASINI, C. ; Borges, Eduardo N. ; Vargas, André P.	2012	7-12	13	\N	2
1993	TC	CiênciaBrasil - The Brazilian Portal of Science and Technology	LAENDER, Alberto H. F. ; Moro, Mirella M. ; Silva, Altigran S. ; Davis Jr., Clodoveu A. ; GONÇALVES, Marcos André ; Galante, Renata ; Silva, Allan J. C. ; Bigonha, Carolina A. S. ; Dalip, Daniel Hasan ; Barbosa, Eduardo M. ; Borges, Eduardo N. ; Cortez, Eli ; Procópio Jr., Peterson ; de Alencar, Rafael Odon ; Cardoso, Thiago N. C. ; Salles, Thiago	2011	1366-1379	13	\N	2
1994	TC	An Automatic Approach for Duplicate Bibliographic Metadata Identification Using Classification	Borges, Eduardo N. ; Becker, Karin ; HEUSER, Carlos A. ; Galante, Renata	2011	1-7	13	\N	2
1995	TC	A Classification-based Approach for Bibliographic Metadata Deduplication	Borges, Eduardo N. ; Becker, Karin ; HEUSER, Carlos A. ; GALANTE, Renata de Matos	2011	221-228	13	\N	2
1996	TC	Uma Abordagem Efetiva e Eficiente para Deduplicação de Metadados Bibliográficos de Objetos Digitais	BORGES, Eduardo Nunes ; GALANTE, Renata de Matos ; GONÇALVES, Marcos André	2008	76-90	13	\N	2
1997	TC	XSimilarity : Uma Ferramenta para Consultas por Similaridade embutidas na Linguagem XQuery	SILVA, Maria Estela Vieira da ; BORGES, Eduardo Nunes ; GALANTE, Renata de Matos	2008	148-157	13	\N	2
1999	TC	Projeto Reuni: uma proposta da utilização de Modelagem Computacional no Ensino de Engenharia	LOPES, N. R. ; MACHADO, B. N. ; ESTRADA, E. S. D. ; Isoldi, L. A. ; Santos, E. D.	2011	252-264	14	\N	2
2002	TC	Navigation system for an underground distribution inspection platform using simulation	ESTRADA, E. S. D. ; Silveira, L. ; OLIVEIRA, V. M. ; BOTELHO, S. S. C.	2010	109-114	14	\N	2
2524	TC	Simulando a Execução de Políticas Públicas através de Jason e CArtAgO	SANTOS, I. A. S. ; COSTA, A. C. R.	2012	81-92	4	\N	3
2525	TC	Toward a Framework for Simulating Agent-Based Models of Public Policy Processes on the Jason-CArtAgO Platform	COSTA, A. C. R. ; SANTOS, I. A. S.	2012	1-15	4	\N	3
2008	TC	Predição espacial de monóxido de carbono gerado pelo tráfego veicular urbano	SILVA, G. C. ; GOLDNER, L. G. ; Ridley, Ian ; Dalotto, Roque	2009		15	\N	2
2529	TC	Um Modelo Multiagente para Carregamento Compartilhado com Prioridades em um Terminal de Conêineres: Combinando o Problema da Mochila com PDMs	Rodrigues, L. M. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R. ; EMMENDORFER, L.	2011	51-62	4	\N	3
2010	AP	Interval Additive Generators of Interval T-Norms and Interval T-Conorms	Dimuro, Graçaliz Pereira ; Bedregal, Benjamín Callejas ; Santiago, Regivan Hugo Nunes ; Reiser, Renata Hax Sander	2011	3898-3916	18	\N	2
2012	AP	On interval fuzzy S-implications	BEDREGAL, B. R. C. ; Dimuro, G.P. ; Santiago, R.H.N. ; Reiser, R.H.S.	2010	1373-1389	18	\N	2
2013	AP	Analyzing the relationship between interval-valued D-Implications and interval-valued QL-Implications. TEMA	REISER, R. H. S. ; BEDREGAL, B. R. C. ; SANTIAGO, R. H. N. ; DIMURO, G. P.	2010	89-100	18	\N	2
2014	AP	Aplicação de Agentes BDI com Percepção Fuzzy no Modelo Presa-Predador	FARIAS, G. P. ; DIMURO, G. P. ; COSTA, A. C. R.	2010	299-324	18	\N	2
2015	AP	Xor-Implications and E-Implications: Classes of Fuzzy Implications Based on Fuzzy Xor	BEDREGAL, B. R. C. ; REISER, R. H. S. ; DIMURO, G. P.	2009	5-18	18	\N	2
2016	AP	Interval-Valued D-Implications. TEMA	REISER, R. H. S. ; BEDREGAL, B. R. C. ; SANTIAGO, R. H. N. ; DIMURO, G. P.	2009	63-74	18	\N	2
2018	AP	S-Implications on Bounded Lattices and the Interval Constructor. TEMA	REISER, R. H. S. ; DIMURO, G. P. ; BEDREGAL, B. R. C. ; SANTIAGO, R. H. N.	2008	143-154	18	\N	2
2019	AP	Incerteza de Dados em Fluxo de Potência: Uma abordagem com a Matemática Intervalar do C-XSC. TEMA	Vargas, R. ; FARIAS, C. M. ; BARBOZA, L. V. ; DIMURO, G. P.	2008	491-502	18	\N	2
2020	AA	Uma Abordagem para Jogos Bayesianos Fuzzy com base na Probabilidade Fuzzy de Buckley	ASMUS, T. C. ; DIMURO, G. P.	2012		18	\N	2
2532	TC	Uso de CSP na Especificação Formal do Nível Micro-Organizacional de Sistemas Multiagentes	BARBOSA, R. M. ; COSTA, A. C. R.	2010	13-21	4	\N	3
2022	LP	ENIA - VIII Encontro Nacional de Inteligência Artificial/CSBC 2011 - XXXI Congresso da Sociedade Brasileira de Computação	PRATI, R. (Org.) ; DIMURO, G. P. (Org.) ; CAMPOS, A. (Org.)	2011		18	\N	2
2533	TC	Um Modelo de Agente Econômico Cognitivo com Base no Conceito de Agentes BDI	JEANNES, F. M. ; COSTA, A. C. R.	2010	53-64	4	\N	3
2534	TC	Teoria dos Jogos aplicada à coordenação de agentes, utilizando Teoria dos Valores de Troca	Pereira, D. R. ; COSTA, A. C. R.	2010	77-88	4	\N	3
2026	CL	Towards the Modeling of the Social Organization of an Experiment of Social Management of Urban Vegetable Gardens	SANTOS, I. ; RODRIGUES, T. F. ; DIMURO, G. P. ; COSTA, A. C. R. ; DIMURO, G. ; Jerez, E. de M.	2012	98-101	18	\N	2
2030	CL	On Interval Fuzzy Numbers	DIMURO, G. P.	2011	1-6	18	\N	2
2031	CL	On Fuzzy Probabilities in Bayesian Games	ASMUS, T. C. ; DIMURO, G. P.	2011	20-26	18	\N	2
2032	CL	On Vector and Matrices of Fuzzy Numbers	RIBES, J. L. B. ; DIMURO, G. P. ; AGUIAR, M. S.	2011	34-40	18	\N	2
2033	CL	Measuring the Quality of Internet Shopping: An Experiment Using Fuzzy Logic	RODRIGUES, L. M. ; DIMURO, G. P.	2011	55-61	18	\N	2
2034	CL	Hand Skill Programming: Using Fuzzy Sets to Program Topobo Kinectis Memory Devices	SANTINI, M.M. ; BOTELHO, S. S. C. ; DIMURO, G. P. ; RODRIGUES, C. L. L.	2011	62-68	18	\N	2
2035	CL	Modeling Uncertainty and Decision Making in Strategic Interactions in Multiagent Systems: An Overview	BRIÃO, S. L. ; DIMURO, G. P. ; COSTA, A. C. R.	2011	115-121	18	\N	2
2541	TC	On the Operationality of Moral-Sense Decision Making	COELHO, H. ; COSTA, A. C. R. ; TRIGO, P.	2010	11-22	4	\N	3
2542	TC	Moral Minds as Multiple-Layer Organizations	COELHO, H. ; COSTA, A. C. R. ; TRIGO, P.	2010	254-263	4	\N	3
2036	CL	A Fuzzy-BDI Agent Model for Exchanges of Non-economic Services, Based on the Social Exchange Theory	FARIAS, G. P. ; DIMURO, G. P. ; COSTA, A. C. R.	2011	129-132	18	\N	2
2037	CL	Hybrid Intelligent Systems: A Study on Genetic Algorithms and Fuzzy Approaches	MACEDO, L. F. K. ; DIMURO, G. P. ; AGUIAR, M. S.	2011	133-139	18	\N	2
2038	CL	Towards Developmental Turing Machines	COSTA, S. A. ; COSTA, A. C. R. ; DIMURO, G. P.	2011	151-157	18	\N	2
2543	TC	Decision Making for Agent Moral Conducts	COELHO, H. ; COSTA, A. C. R. ; TRIGO, P.	2010	1-12	4	\N	3
2040	CL	Construção de Planos BDI a partir de Políticas Ótimas de POMDPs, com Aplicação na Programação em AgentSpeak usando o Jason	PEREIRA, D. R. ; GONÇALVES, L. V. ; DIMURO, G. P.	2010	24-30	18	\N	2
2545	TC	Aprendizagem Organizacional através de Simulação baseada em Instituições Eletrônicas e Agentes de Software	BERNARDI, Giliane ; COSTA, A. C. R.	2009		4	\N	3
2548	TC	A Critical Study of the Coherence between EBMs and ABMs in the Simulation of the Hawks-Doves-LawAbiders Society	JEANNES, F. M. ; COSTA, A. C. R.	2009	475-486	4	\N	3
2549	TC	On the Intelligence of Moral Agency	COELHO, H. ; COSTA, A. C. R.	2009	439-450	4	\N	3
2048	TC	Simulação Multiagente de uma Abordagem Evolutiva e Espacial para o Jogo do Ultimato	MACEDO, L. F. K. ; RIBEIRO, M. ; BRIÃO, S. L. ; AGUIAR, M. S. ; DIMURO, G. P. ; FONSECA, C. N.	2012	35-46	18	\N	2
2050	TC	Planejamento de Rotas de Robôs Móveis: Estudo da Viabilidade de Uma Abordagem Baseada em Algoritmos Genéticos em um Ambiente Multiagente	CABREIRA, T. M. ; AGUIAR, M. S. ; DIMURO, G. P.	2012	253-264	18	\N	2
2051	TC	Proposta de modelo de avaliação da satisfação de usuários de transporte público usando lógica fuzzy	MATTOS, V. L. D. ; ROSA, S. E. ; Dimuro, G.P.	2012	1-10	18	\N	2
2053	TC	Uma Ordem Total para Números Fuzzy Intervalares Triangulares Simétricos	ASMUS, T. C. ; DIMURO, G. P.	2012	1-12	18	\N	2
2055	TC	Planejamento de Rotas de Robôs Móveis em Ambientes Dinâmicos: Uma Abordagem Utilizando Algoritmos Genéticos e Lógica Fuzzy	CABREIRA, T. M. ; DIMURO, G. P. ; AGUIAR, M. S.	2012	1-12	18	\N	2
2056	TC	Método de Ordenação de Números Fuzzy Intervalares: uma proposta	BRIÃO, S. L. ; DIMURO, G. P.	2012	1-12	18	\N	2
2554	TC	Capacitação de Gestores de Instituições de Ensino Superior através da Simulação de Processos Administrativos utilizando a Abordagem de Instituições Eletrônicas	BERNARDI, Giliane ; COSTA, A. C. R.	2008	1-12	4	\N	3
2556	TC	Interpretações do Interferômetro de Mach-Zehnder no Modelo qMG	AMARAL, R. B. ; REISER, Renata Hax Sander ; COSTA, A. C. R.	2008	1-10	4	\N	3
2060	TC	An Evolutionary Learning Approach for Robot Path Planning with Fuzzy Obstacle Detection and Avoidance in a Multi-agent Environment	CABREIRA, T. M. ; AGUIAR, M. S. ; DIMURO, G. P.	2012	1-16	18	\N	2
2557	TC	Simulating Argumentation about Exchange Values in Multi-Agents Interactions	ISLABÃO, Márcia Hafelle ; COSTA, A. C. R.	2009	1-12	4	\N	3
2062	TC	Interface Experimental de Fuzificação para o TOPOBO	SANTINI, M.M. ; BOTELHO, S. S. C. ; MOTA, F. P. ; RODRIGUES, C. L. L. ; DIMURO, G. P.	2011	74-82	18	\N	2
2063	TC	Probabilidade Fuzzy em Jogos Bayesianos	ASMUS, T. C. ; DIMURO, G. P.	2011	109-121	18	\N	2
2064	TC	Sobre Sistemas Híbridos: Algoritmos Genéticos e Abordagens Fuzzy	MACEDO, L. F. K. ; AGUIAR, M. S. ; DIMURO, G. P.	2011	140-151	18	\N	2
2558	TC	Jogos de Empresa e Aprendizagem Organizacional: um Estudo de Caso de Simulação de Processos Organizacionais de uma Instituição de Educação Superior	BERNARDI, Giliane ; COSTA, A. C. R.	2008		4	\N	3
2559	TC	Jogo de Empresa baseado em Agentes de Software e Instituições Eletrônicas para Aprendizagem Organizacional de Gestores de Instituições de Educação Superior	BERNARDI, Giliane ; COSTA, A. C. R.	2008		4	\N	3
2067	TC	Um Estudo Sobre Vetores e Matrizes de Números Fuzzy	RIBES, J. L. B. ; DIMURO, G. P. ; AGUIAR, M. S.	2011	201-210	18	\N	2
2068	TC	Utilizando Lógica Fuzzy para Avaliar a Qualidade de uma Compra Via Internet	RODRIGUES, L. M. ; DIMURO, G. P.	2011	254-265	18	\N	2
2560	TC	Equation based Models as Formal Specifications of Agent-based Models for Social Simulation: preliminary issues	COSTA, A. C. R. ; JEANNES, F. M. ; CAVA, U. A.	2008	1-12	4	\N	3
2561	RE	Modelando a Organização Social de um Experimento de Gestão Social de Hortas Urbanas	RODRIGUES, T. F. ; SANTOS, I. A. S. ; DIMURO, G. ; COSTA, A. C. R. ; DIMURO, Graçaliz Pereira	2011	163-166	4	\N	3
2562	RE	Estendendo o Modelo de Organização de Sistemas Multiagentes PopOrg com Unidades Organizacionais Recursivas	ROSA, S. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R.	2010	143-146	4	\N	3
2563	RE	Simulação Baseada em Agentes de Processos de Gestão Social de Ecossistemas Urbanos: o caso das hortas urbanas da cidade de Sevilla	RODRIGUES, T. F. ; DIMURO, G. ; VON GROL, C. ; PINHEIRO, T. V. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R.	2010	257-260	4	\N	3
2564	RE	Introducing Social Groups and Group Exchanges in the PopOrg Model	COSTA, A. C. R. ; DIMURO, Graçaliz Pereira	2009	1297-1298	4	\N	3
2565	RE	Um Modelo de Percepção Fuzzy para Agentes BDI	Farias, G. P. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R.	2009	1-4	4	\N	3
2077	TC	Agentes Compartilhando Recursos Utilizando Processos de Decisão de Markov	RODRIGUES, L. M. ; DIMURO, G. P.	2010	107-110	18	\N	2
2078	TC	Simulação Baseada em Agentes de Processos de Gestão Social de Ecossistemas Urbanos: o caso das hortas urbanas da cidade de Sevilla	RODRIGUES, T. F. ; DIMURO, G. ; VON GROL, C. ; Pinheiro, T. V. ; DIMURO, G. P. ; COSTA, A. C. R.	2010	257-260	18	\N	2
2079	TC	Uma Proposta de Modelo Híbrido com Agentes Evolutivos BDI-Fuzzy-Intervalares	MACEDO, L. F. K. ; DIMURO, G. P. ; AGUIAR, M. S. ; COSTA, A. C. R. ; MATTOS, V. L. D.	2010	274-289	18	\N	2
2080	TC	Tomando Decisões em um Ambiente de Informação Imperfeita: introdução de probabilidades fuzzy (intervalares) em um modelo híbrido de agente BDI-MDP	RIBES, J. L. B. ; DIMURO, G. P. ; AGUIAR, M. S. ; COSTA, A. C. R. ; MATTOS, V. L. D.	2010	280-285	18	\N	2
2566	RE	A Distributed Normative Infrastructure for Situated Multi-Agent Organisations	OKUYAMA, Fabio Yoshimitsu ; BORDINI, R. H. ; COSTA, A. C. R.	2008	1501-1504	4	\N	3
2082	TC	An Approach to Interval-Valued R-Implications and Automorphisms	BEDREGAL, B. R. C. ; DIMURO, G. P. ; REISER, R. H. S.	2009	1-6	18	\N	2
2567	RC	Especificando Rotinas Organizacionais de Sistemas Multiagentes: Detecção de Desvios com Base no Conceito de Expectativas	SILVA, C. E. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R.	2010	139-142	4	\N	3
2568	RC	Um Modelo Híbrido de Agente BDI-Fuzzy	Farias, G. P. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R.	2010	147-150	4	\N	3
2085	TC	Analyzing the Relations between Interval-valued D-Implications and Interval-valued QL-Implications	REISER, R. H. S. ; DIMURO, G. P. ; BEDREGAL, B. R. C. ; SANTIAGO, R. H. N.	2009	190-196	18	\N	2
2088	TC	Interval Additive Generators of Interval T-Norms	DIMURO, G. P. ; BEDREGAL, B. R. C. ; REISER, R. H. S. ; SANTIAGO, R. H. N.	2008	123-135	18	\N	2
2089	TC	Interval Valued D-Implications	REISER, R. H. S. ; DIMURO, G. P. ; BEDREGAL, B. R. C. ; SANTIAGO, R. H. N.	2008	203-209	18	\N	2
2090	TC	Avaliação Fuzzy de Trocas Sociais entre Agentes Baseados em Personalidades	SANTOS, A. V. ; DIMURO, G. P. ; BEDREGAL, B. R. C.	2008	176-182	18	\N	2
2091	TC	Avaliação Fuzzy de Trocas Sociais em Sistemas Multiagentes baseados em Personalidades	SANTOS, A. V. ; DIMURO, G. P. ; BEDREGAL, B. R. C.	2008	1-10	18	\N	2
2092	TC	Construção de Planos BDI a partir de Políticas Ótimas de POMDPs, com Aplicação na Programação em AgentSpeak usando o Jason	PEREIRA, D. R. ; GONÇALVES, L. V. ; DIMURO, G. P.	2008	1-10	18	\N	2
2093	TC	Auto-Regulação de Trocas Sociais Baseadas em Personalidades em Sistemas Multiagentes	GONÇALVES, L. V. ; PEREIRA, D. R. ; DIMURO, G. P.	2008	1-10	18	\N	2
2095	TC	Xor-Implications and E-Implications: Classes of fuzzy implications based on fuzzy Xor	BEDREGAL, B. R. C. ; REISER, R. H. S. ; DIMURO, G. P.	2008	8-20	18	\N	2
2573	AP	A Low-Cost Solution for Deploying Processor Cores in Harsh Environments. IEEE Transactions on Industrial Electronics (1982	Violante, Massimo ; MEINHARDT, Cristina ; REIS, R. A. L. ; Reis, Ricardo ; Sonza Reorda, Matteo	2011	2617-2626	7	\N	3
2098	TC	Valores de Trocas Sociais Fuzzy em Agentes com Personalidades	SANTOS, A. V. ; DIMURO, G. P. ; BEDREGAL, B. R. C.	2008	1-6	18	\N	2
2099	TC	Avaliação Fuzzy de Trocas Sociais em Sistemas Multiagentes baseados em Personalidades	SANTOS, A. V. ; DIMURO, G. P.	2008	1-10	18	\N	2
2100	TC	Building BDI Plans from POMDPs Optimal Policies, with an Application to the Self-Regulation of Social Exchanges in Multi-Agent Systems	PEREIRA, D. R. ; DIMURO, G. P.	2008	1-10	18	\N	2
2574	TC	Evaluation of Process Variability on Current for Nanotechnologies Devices	MEINHARDT, Cristina ; REIS, Ricardo	2012	1-4	7	\N	3
2105	AP	Mining flexible-receptor molecular docking data	MACHADO, K. S. ; WINCK, A. T. ; RUIZ, D. D. A. ; NORBERTO DE SOUZA, O	2011	n/a-n/a	21	\N	2
2106	AP	FReDoWS: a method to automate molecular docking simulations with explicit receptor flexibility and snapshots selection	MACHADO, K. S. ; Schroeder, Evelyn K ; Ruiz, Duncan D ; Cohen, Elisângela ML ; Norberto de Souza, Osmar	2011	S6	21	\N	2
2107	AP	Effect of the explicit flexibility of the InhA enzyme from Mycobacterium tuberculosis in molecular docking simulations	Cohen, Elisangela ML ; MACHADO, K. S. ; Cohen, Marcelo ; Norberto de Souza, Osmar	2011	S7	21	\N	2
2108	AP	Mining flexible-receptor docking experiments to select promising protein receptor snapshots	MACHADO, K. S. ; WINCK, A. T. ; RUIZ, D. D. A. ; NORBERTO DE SOUZA, O	2010	S6	21	\N	2
2109	AA	Automatic Design of Decision-Tree Induction Algorithms Tailored to Flexible-Receptor Docking Data	Barros, R. C. ; WINCK, A. T. ; MACHADO, K. S. ; BASGALUPP, M. P. ; CARVALHO, A. C. P. F. L. ; RUIZ, D. D. A. ; NORBERTO DE SOUZA, O	2012		21	\N	2
2110	CL	Processo de KDD aplicado à bioinformática	WINCK, A. T. ; MACHADO, K. S. ; RUIZ, D. D. A. ; NORBERTO DE SOUZA, O	2010	159-180	21	\N	2
2111	TC	A Comparative Analysis of Public Ligand Databases Based on Molecular Descriptors	WINCK, A. T. ; QUEVEDO, C. V. ; MACHADO, K. S. ; NORBERTO DE SOUZA, O ; RUIZ, D. D. A.	2012	156-167	21	\N	2
2112	TC	Association Rules to Identify Receptor and Ligands Structures thourgh Named Entities Recognition	Winck, A. ; MACHADO, K. S. ; RUIZ, D. D. A. ; STRUBE de LIMA, V. L.	2010	119-128	21	\N	2
2113	TC	Comparison of Discretization Methods of Flexible-Receptor Docking Data for Analyses by Decision Trees	MACHADO, K. S. ; WINCK, A. T. ; RUIZ, D. D. A. ; NORBERTO DE SOUZA, O	2010	223-229	21	\N	2
2575	TC	Design of 16nm SRAM Architecture	GOMES, I. A. C. ; Meinhardt, Cristina ; BUTZEN, P. F.	2012	1-4	7	2575	3
2114	TC	Supporting Intermolecular Interaction Analyses of Flexible-Receptor Docking Simulations	WINCK, A. T. ; MACHADO, K. S. ; NORBERTO DE SOUZA, O ; RUIZ, D. D. A.	2010	183-190	21	\N	2
2115	TC	Extracting Information from Flexible Receptor-Flexible Ligand Docking Experiments	MACHADO, K. S. ; SCHROEDER, E. K. ; RUIZ, D. D. A. ; Winck, A. ; NORBERTO DE SOUZA, O	2008	104-114	21	\N	2
2116	AP	Uma Estratégia Híbrida para o Problema de Empacotamento	SANTOS, R. ; EMMENDORFER, L. R.	2011	1-7	22	\N	2
2117	AP	Modelagem Ambiental: Perspectivas e Contribuições	NEVES, C. ; BRUM, R. S. ; KIRINUS, E. ; SANTOS, R. ; EMMENDORFER, L. R.	2011	15-20	22	\N	2
2118	AP	Effective Linkage Learning Using Low-Order Statistics and Clustering	Emmendorfer, Leonardo Ramos ; POZO, Aurora Trinidad Ramirez	2009	1233-1246	22	\N	2
2119	LP	Anais do IV Workshop- Escola de Sistemas de Agentes, seus Ambientes e apliCações	ADAMATTI, D. F. ; WERHLI, A. V. ; LUGO. G. G. ; EMMENDORFER, L. R.	2010		22	1745	2
2121	CL	A Clustering-based Approach for Linkage Learning Applied to Multimodal Optimization	EMMENDORFER, L. R. ; POZO, Aurora Trinidad Ramirez	2008	225-248	22	\N	2
2122	TC	Detectando Padrões Comportamentais de Agentes Através de Árvores de Decisão	EMMENDORFER, L. R. ; ADAMATTI, D. F. ; SILVEIRA, J. ; PAES, T.	2010		22	\N	2
2578	TC	Energy Evaluation of Nanometer CMOS Technologies	NUNES, C. S. ; MEINHARDT, Cristina ; BUTZEN, P. F.	2012	1-4	7	\N	3
2579	TC	Full Adder Cells Evaluation for Subthreshold Operation on 32nm CMOS Technology	SILVA, A. N. ; MEINHARDT, Cristina ; BUTZEN, P. F.	2012		7	\N	3
2125	TC	Selecting Software Reliability Models with a Neural Network Meta Classifier	CAIUTA, R. ; POZO, Aurora Trinidad Ramirez ; EMMENDORFER, L. R. ; VERGILIO, S.	2008	201-209	22	\N	2
2126	AP	EXPLORATION E EXPLOITATION: UM OLHAR NO SETOR DE REFINO DE PETRÓLEO SOB A DIMENSÃO DO APRENDIZADO ORGANIZACIONAL	SATT, Sergio ; RIBEIRO, Luciano Maciel	2012	25-35	23	\N	2
2127	AP	Gestão de projetos ambientais: responsabilidade social transformada em diferencial competitivo	PINTO, D. C. D. ; RIBEIRO, Luciano Maciel	2009	9-28	23	\N	2
2128	AP	A importância da TI para a competitividade das micro e pequenas empresas	RIBEIRO, Luciano Maciel ; SATT, Sergio	2008	11-24	23	\N	2
2129	TC	AVALIANDO A ESTRATÉGIA DO PARQUE TECNOLÓGICO OCEANTEC A PARTIR DA UTILIZAÇÃO DA FERRAMENTA ESTRATEGIGRAMA	RIBEIRO, Luciano Maciel ; BOTELHO, S. S. C. ; DUARTE FILHO, N. L.	2012		23	\N	2
2130	TC	REVISÃO DOS CONCEITOS DE EXPLORATION E EXPLOITATION ASSOCIADOS AO SETOR DE REFINO DE PETRÓLEO	RIBEIRO, Luciano Maciel ; SATT, Sergio	2012		23	\N	2
2131	TC	JAZZ E EDUCAÇÃO A DISTÂNCIA: OS DESAFIOS E RESPOSTAS NOS POLOS PRESENCIAIS. In:	RIBEIRO, Luciano Maciel ; Sperotto, Rosária Ilgenfritz	2011		23	\N	2
2132	TC	Analisando as interações realizas no Fórum de um curso ministrado na modalidade Educação a Distância	RIBEIRO, Luciano Maciel ; IRIONDO, WALTER RUBEN OTERO	2011		23	\N	2
2133	TC	JAZZ E EDUCAÇÃO A DISTÂNCIA: OS DESAFIOS E RESPOSTAS NOS POLOS PRESENCIAIS	RIBEIRO, Luciano Maciel ; Sperotto, Rosária Ilgenfritz	2011		23	\N	2
2134	TC	UMA ANÁLISE DAS DIFICULDADES DE INVESTIMENTO NAS MPEs PELA BAIXA UTILIZAÇÃO DE FERRAMENTAS DE GESTÃO	RIBEIRO, Luciano Maciel ; SATT, Sergio	2010		23	\N	2
2135	TC	Avaliação de interações assíncronas baseadas em texto em Ambientes Virtuais de Ensino Aprendizagem	IRIONDO, WALTER RUBEN OTERO ; RIBEIRO, Luciano Maciel	2010		23	\N	2
2136	TC	Avaliação de Fóruns de discussão nos cursos de Educação a Distância: desafios metodológicos e resultados empíricos	IRIONDO, WALTER RUBEN OTERO ; RIBEIRO, Luciano Maciel	2010		23	\N	2
2137	TC	Educação a Distância: resultados empíricos da avaliação de Fóruns de discussão	IRIONDO, WALTER RUBEN OTERO ; RIBEIRO, Luciano Maciel	2010		23	\N	2
2138	AP	Space D*	Silveira, Luan ; Maffei, Renan Q. ; Botelho, Silvia S. C. ; Drews, Paulo L. ; Bicho, Alessandro de L. ; DUARTE FILHO, Nelson Lopes	2012	1-11	24	\N	2
2580	TC	Impact of Process Variability considering Transistor Networks Delay	GUEX, Jerson P. ; MEINHARDT, Cristina ; REIS, Ricardo	2011	1-4	7	\N	3
2581	TC	Estudo do impacto da variabilidade em um conjunto de blocos básicos para composição de leiautes regulares	MEINHARDT, Cristina ; GUEX, Jerson P. ; REIS, Ricardo	2010	1-6	7	\N	3
2582	TC	A Case Study about Variability Impact in a Set of Basic Blocks Designed to Regular Layouts	GUEX, Jerson P. ; MEINHARDT, Cristina ; REIS, Ricardo	2010	71-74	7	\N	3
2583	TC	ESTUDO DA INFLUÊNCIA DA TEMPERATURA NO COMPORTAMENTO ELÉTRICO DE TRANSISTORES EM TECNOLOGIAS NANOMÉTRICAS	Diones Fischer ; Marcio Macedo ; Matheus Muller Korb ; MEINHARDT, Cristina	2010	1-4	7	\N	3
2584	TC	IMPLEMENTAÇÃO DE UM SIMULADOR DE SISTEMA DE MEMÓRIA CACHE	Christian Silva ; Eduardo Teixeira ; Mauro Barbat ; MEINHARDT, Cristina	2010		7	\N	3
2585	TC	UMA IMPLEMENTAÇÃO DO ALGORITMO BOOTH USANDO MANIPULAÇÃO DE BITS	Matheus Machado ; MEINHARDT, Cristina	2010		7	\N	3
2586	TC	A Low-Cost SEE Mitigation Solution for Soft-Processors Embedded in Systems on Programmable Chips	VIOLANTE, M. ; MEINHARDT, Cristina ; REIS, Ricardo ; REORDA, M. S.	2009	352-358	7	\N	3
2587	TC	Recovery Scheme for Hardening System on Programmable Chips	MEINHARDT, Cristina ; VIOLANTE, M. ; REORDA, M. S. ; REIS, Ricardo	2009	1-6	7	\N	3
2588	TC	An On-Board Data-Handling Computer for Deep-Space Exploration Built Using Commercial-Of-The-Shelf SRAM-Based FPGAs	VIOLANTE, M. ; REORDA, M. S. ; MEINHARDT, Cristina ; REIS, Ricardo	2009	254-262	7	\N	3
2589	TC	Leiautes Regulares Baseados em Matrizes de Células	MEINHARDT, Cristina ; REIS, Ricardo ; TAVARES, Reginaldo da Nobrega	2009	127-132	7	\N	3
2590	TC	An Experimental Analysis of the Lockstep Architecture	MEINHARDT, Cristina ; VIOLANTE, M. ; REORDA, M. S. ; REIS, Ricardo	2008	89-93	7	\N	3
2591	TC	Recovery Scheme for Hardening System on Programmable Chips	MEINHARDT, Cristina ; VIOLANTE, M. ; REIS, Ricardo ; REORDA, M. S.	2008	1-4	7	\N	3
2592	RC	PROJETO DE UM SOMADOR TOLERANTE A FALHAS COM BAIXO CONSUMO DE POTÊNCIA	ZIMPECK, A. L. ; AGUIAR, Y. Q. ; MACIEL, B. ; MEINHARDT, Cristina ; BUTZEN, P. F.	2011	1-1	7	\N	3
2593	RC	ELICITAÇÃO DE REQUISITOS PARA O DESENVOLVIMENTO DE FERRAMENTAS EDUCACIONAIS PARA O ENSINO DE ORGANIZAÇÃO E ARQUITETURA DE COMPUTADORES	WIECZORECK, I. ; MENDIZABAL, Odorico Machado ; MEINHARDT, Cristina	2011	1-1	7	\N	3
2594	RC	AVALIAÇÃO DO DESEMPENHO E CONSUMO DE POTÊNCIA DE PORTAS LÓGICAS CMOS EM TECNOLOGIAS NANOMÉTRICAS	STERZ, A. P. ; NUNES, C. S. ; MEINHARDT, Cristina ; BUTZEN, P. F.	2011	1-1	7	\N	3
2595	RC	PROJETO DE UM BLOCO DE MÉMORIA SRAM NA TECNOLOGIA DE 16NM	GOMES, I. A. C. ; BUTZEN, P. F. ; MEINHARDT, Cristina	2011	1-1	7	\N	3
2596	RC	Projeto de flip-flops tipo D com baixo consumo de potência	BRUN, J. V. F. ; BUTZEN, P. F. ; MEINHARDT, Cristina	2011	1-1	7	\N	3
2597	RC	OTIMIZAÇÃO DO DIMENSIONAMENTO DOS TRANSISTORES DE UM CIRCUITO SOMADOR PARA REDUÇÃO DE ATRASOS E CONSUMO DE POTÊNCIA	AGUIAR, Y. Q. ; MACIEL, B. ; ZIMPECK, A. L. ; BUTZEN, P. F. ; MEINHARDT, Cristina	2011	1-1	7	\N	3
2598	RC	Avaliação de Famílias Lógicas para Circuitos com Baixo Consumo de Potência	NUNES, C. S. ; SILVA, A. N. ; MEINHARDT, Cristina ; BUTZEN, P. F.	2011	1-1	7	\N	3
2599	RC	AVALIAÇÃO DA EFICÁCIA DE MODELOS DE TRANSISTORES NO PROJETO DE CIRCUITOS COM BAIXO CONSUMO DE ENERGIA	SILVA, A. N. ; NUNES, C. S. ; MEINHARDT, Cristina ; BUTZEN, P. F.	2011	1-1	7	\N	3
2600	RC	ESTUDO DOS ATRASOS CAUSADOS PELA TEMPERATURA EM TRANSISTORES DE NOVAS TECNOLOGIAS	Diones Fischer ; Marcio Macedo ; MEINHARDT, Cristina	2010	1-2	7	\N	3
2601	RC	COMPARAÇÃO ENTRE OS EFEITOS DA TEMPERATURA EM TRANSISTORES DE NOVAS TECNOLOGIAS NANOMÉTRICAS	Marcio Macedo ; Diones Fischer ; MEINHARDT, Cristina	2010	1-2	7	\N	3
2602	RC	ESTUDO DA INFLUÊNCIA DA TENSÃO VGS NO COMPORTAMENTO DA CORRENTE DE TRANSISTORES EM 16 NANÔMETROS	Matheus Muller Korb ; MEINHARDT, Cristina	2010	1-2	7	\N	3
2157	TC	Estimando Atrasos em Redes de Computadores Através de Sistemas de Coordenadas - A Ferramenta Euclideana	MADRUGA, Felipe ; DUARTE FILHO, Nelson Lopes ; COELHO, Rafael ; PIAS, Marcelo	2008	51-58	24	\N	2
2158	TC	Using Game Engines in Digital Manufacturing through Immersive and Collaborative Visualization Systems	BOTELHO, Silvia Silva da Costa ; DUARTE FILHO, Nelson Lopes ; Tyska, J ; MARCOS, Pedro ; Maffei, Renan ; OLIVEIRA, Rodrigo Ruas ; OLIVEIRA, R. R. ; HAX, V.	2008	101-105	24	\N	2
2159	AP	Effects of RegCM3 parameterizations on simulated rainy season over South America	da Rocha, RP ; Cuadra, SV ; Reboita, MS ; Kruger, LF ; Ambrizzi, T ; KRUSCHE, N.	2012	253-265	25	\N	2
2160	AP	Entendendo o Tempo e o Clima na América do Sul	REBOITA, M. S. ; KRUSCHE, N. ; REBOITA, M. S. ; Ambrizzi, T ; DA ROCHA, R. P.	2012	18-29	25	\N	2
2161	AP	Diagnóstico Qualitativo da Poluição Atmosferica em Rio Grande -RS, 2000 a 2002	NÓBREGA, M. R. ; KRUSCHE, N.	2011	129-150	25	\N	2
2162	AP	Estimativa da altura da camada limite na região de Rio Grande, RS	SARAIVA, L. B. ; KRUSCHE, N.	2011	55-58	25	\N	2
2163	AP	Simulação de nevoeiros no litoral sul do Brasil	GOMES, C.S. ; KRUSCHE, N. ; ROCHA, R. P. da	2011	235-237	25	\N	2
2164	AP	Extreme Storm Surges in the south of Brazil: Atmospheric Conditions and shore erosion	PARISE, C. K. ; CALLIARI, L. J. ; KRUSCHE, N.	2009	175-188	25	\N	2
2165	CL	A Camada Limite Planetária	MORAES, O. L. L. ; Zimermann, H. R. ; TIECHRIEB, C. A. ; MAGNAGO, R. O. ; CARNEIRO, J. V. ; KRUSCHE, N. ; ALVES, R. ; DEGRAZIA, G. A. ; ACEVEDO, O. ; FISCH, G.	2010	7-238	25	\N	2
2166	TC	Aquecimento Global avaliado pela Comparação entre Modelo Climático Global Educacional e Reanálise NCEP/NCAR no período 1958 a 2010	Gambetá-Leite, M. R. S. ; Gomes, C. S. ; Krusche, N	2012	1-4 CDROM	25	\N	2
2167	TC	Estudo de Caso: Simulação Numérica das alterações causadas pelas Mudanças na Excentricidade e Obliquidade da Terra	SPOLAVORI, A. ; Krusche, N	2012	1-5-CDROM	25	\N	2
2168	TC	Simulação de Nevoeiros de Advecção em Rio Grande, RS, Brasil: Análise das Condições Iniciais e de Fronteira em Modelo de Mesoescala	Gomes, C. S. ; Gambetá-Leite, M. R. S. ; SPOLAVORI, A. ; Krusche, N ; ROCHA, R. P. da	2012	1-5-CDROM	25	\N	2
2169	TC	CARACTERIZAÇÃO DA PRECIPITAÇÃO DE RIO GRANDE, RS, ENTRE 1991 A 2010	KRUSCHE, N. ; Reboita, MS	2012	1 CD-ROM-5 CD-ROM	25	\N	2
2170	TC	A UTILIZAÇÃO DE SISTEMAS MULTIAGENTES PARA A MODELAGEM DE MUDANÇAS CLIMÁTICAS	Gonçalves, G. I. P. ; KRUSCHE, N. ; COSTA, A. C. R.	2012	1 CD-ROM-5 CD-ROM	25	\N	2
2171	TC	Padrões de Precipitação no Sul do Brasil: Comparação entre Observação e Reanálise	SANTOS, M. B. ; KRUSCHE, N.	2009	1-7	25	\N	2
2172	TC	Sistema Integrado de Monitoramento do Tempo e do Clima do Sul do Brasil	KRUSCHE, N. ; ALVES, R. ; MORAES, O. L. L.	2009	1-7	25	\N	2
2173	TC	Avaliação das Brisas Marítimas na região de Rio Grande, RS, na Primavera de 2006	SARAIVA, L. B. ; KRUSCHE, N.	2009	1-7	25	\N	2
2174	TC	Nevoeiros na Região Litorânea do Sul do Brasil	GOMES, C.S. ; KRUSCHE, N.	2009	1-7	25	\N	2
2175	TC	Simulação Climática para o Sul do Brasil com Diferentes Projeções Cartográficas	GOMES, C.S. ; REBOITA, M. S. ; KRUGER, L. F. ; KRUSCHE, N.	2009	1-7	25	\N	2
2176	TC	Validação de Simulação Climática da Camada Limite Planetária na Região Costeira do Sul do Brasil	KRUSCHE, N. ; ROCHA, R. P. da	2009	1-7	25	\N	2
2177	TC	Concepções dos Estudantes sobre Conceitos que embasam a Compreensão de Mudanças Climáticas	KRUSCHE, N. ; CAPPELLETTO, E. ; PEREIRA, N.	2009	1-7	25	\N	2
2178	TC	Previsão Climática de Ensemble utilizando o Modelo EDGCM	FRANZEN, M. ; MAIER, É. L. B. ; KRUSCHE, N.	2008	1-6	25	\N	2
2179	TC	Padrões Atmosféricos Sinóticos geradores de Marés Meteorológicas Intensas na Praia do Cassino, RS	PARISE, C. K. ; CALLIARI, L. J. ; KRUSCHE, N.	2008	1-6	25	\N	2
2180	TC	Estrutura e Manutenção do Banco de Dados Meteorológicos da Universidade Federal do Rio Grande	MENDOZA, M. ; KRUSCHE, N. ; LANAU, L.	2008	1-6	25	\N	2
2181	TC	Influência Climática na Safra de Penaeus (Farfantepenaeus) Paulensis Perez-Farfante, no períodoentre 1971 e 1972 no Estuário da Lagoa do Patos, Rio Grande do Sul, Brasil	MOREIRA, R. P. ; KRUSCHE, N.	2008	1-6	25	\N	2
2182	TC	Monitoramento e Análise do Impacto no Desempenho em Ambientes Virtualizados	POPIOLEK, P. ; MENDIZABAL, O. M.	2012		26	\N	2
2183	TC	Estudo da Viabilidade do ROS como Plataforma para IoT	HAX, V. A. ; BOTELHO, S. ; DUARTE FILHO, Nelson Lopes ; MENDIZABAL, O. M.	2012		26	\N	2
2184	TC	Log-Based Approach for Performance Requirements Elicitation and Prioritization	MENDIZABAL, O. M. ; SPIER, M. ; SAAD, R.	2012	297-302	26	\N	2
2186	AP	An Array-Based Test Circuit for Fully Automated Gate Dielectric Breakdown Characterization	Keane, John ; Venkatraman, Shrinivas ; BUTZEN, P. F. ; KIM, C. H.	2011	787-895	27	\N	2
2187	AP	Leakage Analysis Considering the Effect of Inter-Cell Wire Resistance for Nanoscaled CMOS Circuits	BUTZEN, P. F. ; DAL BEM, V. ; REIS, A. I. ; RIBAS, R. P.	2010	192-200	27	\N	2
2185	AP	Projeto de um Bloco de Memória SRAM em Tecnologias CMOS Nanométricas de 16nm	GOMES, I. A. C. ; MEINHARDT, C. ; BUTZEN, P. F.	2012	31-40	27	1865	2
2603	RC	OrBDD Logic Synthesis: Improving Timing Through Fan out Managing	MEINHARDT, Cristina ; TAVARES, Reginaldo da Nobrega ; REIS, Ricardo	2008	1-4	7	\N	3
2715	RE	Detectando Padrões Comportamentais de Agentes Através de Árvores de Decisão	SILVEIRA, J. A. ; PAES, T. L. ; EMMENDORFER, L. R. ; ADAMATTI, D. F.	2010	131-134	10	\N	3
2188	AP	Standby Power Consumption Estimation by Interacting Leakage Current Mechanisms in Nanoscaled CMOS Digital Circuits	BUTZEN, P. F. ; ROSA JR, L. S. ; CHIAPPETTA F., E.J.D. ; REIS, A. I. ; REIS, A. I. ; RIBAS, R. P.	2010	247-255	27	\N	2
2189	AP	Transistor Network Restructuring Against NBTI Degradation	BUTZEN, P. F. ; Dal BEM, V. ; REIS, A. I. ; REIS, A. I. ; RIBAS, R. P.	2010	1298-1303	27	\N	2
2190	CL	Leakage Current in Sub-Micrometer CMOS Gates	BUTZEN, P. F. ; RIBAS, R. P.	2009	211-240	27	\N	2
2191	CL	Efeitos Físicos Nanométricos em Circuitos Integrados Digitais	BUTZEN, P. F. ; DAL BEM, V. ; REIS, A. I. ; RIBAS, R. P.	2009	225-244	27	\N	2
2605	AA	A Model-based Integration of Data to Improve Maintenance Management by Mixed Reality	ESPÍNDOLA, Danúbia Bueno ; FUMAGALLI, L. ; GARETTI, M. ; PEREIRA, Carlos Eduardo ; BOTELHO, Silvia S da C ; HENRIQUES, Renato Ventura Bayan	2012		8	\N	3
2195	TC	Logic Gates Design for Aging Enhancement	BUTZEN, P. F. ; DAL BEM, V. ; REIS, A. I. ; RIBAS, R. P.	2011	1-4	27	\N	2
2196	TC	Area Overhead and Performance Impact of Regular Transistor Layout Design in Digital Integrated Circuit	DAL BEM, V. ; BUTZEN, P. F. ; MARRANGHELLO, F. S. ; REIS, A. I. ; RIBAS, R. P.	2011	67-70	27	\N	2
2197	TC	Area impact analysis of via-configurable regular fabric for digital integrated circuit design	DAL BEM, V. ; BUTZEN, P. F. ; KLOCK, C. E. ; CALLEGARO, V. ; REIS, A. I. ; RIBAS, R. P.	2011	103-108	27	\N	2
2198	TC	Impact and optimization of lithography-aware regular layout in digital circuit design	DAL BEM, V. ; BUTZEN, P. F. ; MARRANGHELLO, F. S. ; REIS, A. I. ; RIBAS, R. P.	2011	279-284	27	\N	2
2199	TC	Designing NBTI Robust Gates	BUTZEN, P. F. ; DAL BEM, V. ; REIS, A. I. ; RIBAS, R. P.	2010	193-196	27	\N	2
2200	TC	Routing Resistance Influence in Loading Effect on Leakage Analysis	BUTZEN, P. F. ; REIS, A. I. ; RIBAS, R. P.	2009		27	\N	2
2201	TC	Loading Effect Analysis Considering Routing Resistance	BUTZEN, P. F. ; REIS, A. I. ; RIBAS, R. P.	2009		27	\N	2
2202	TC	Simple and Accurate Method for Fast Static Current Estimation in CMOS Complex Gates with Interaction of Leakage Mechanisms	BUTZEN, P. F. ; DA ROSA JUNIOR, L. S. ; CHIAPPETTA FILHO, E. J. D. ; MOURA, D. S. ; REIS, A. I. ; RIBAS, R. P.	2008	407-410	27	\N	2
2203	TC	Accurate Method for Subthreshold and Gate Leakage Current Estimation in CMOS Complex Gates	BUTZEN, P. F. ; DA ROSA JUNIOR, L. S. ; CHIAPPETTA FILHO, E. J. D. ; MOURA, D. S. ; REIS, A. I. ; RIBAS, R. P.	2008	23-26	27	\N	2
2204	TC	An array-based test circuit for fully automated gate dielectric breakdown characterization	Keane, John ; Venkatraman, Shrinivas ; BUTZEN, P. F. ; KIM, C. H.	2008		27	\N	2
2205	TC	Subthreshold and Gate Leakage Estimation in Complex Gates	BUTZEN, P. F. ; ROSA JR, L. S. ; CHIAPPETTA F., E.J.D. ; MOURA, D. S. ; REIS, A. I. ; RIBAS, R. P.	2008		27	\N	2
2606	TC	Integrating Intelligent Maintenance Systems and Spare Parts Supply Chains	ESPÍNDOLA, Danúbia Bueno ; FRAZZON, E. M. ; HELLINGRATH, B. ; PEREIRA, Carlos Eduardo	2012		8	\N	3
2609	TC	Um caso de uso do ambiente virtual de aprendizagem (SLOODLE) no ensino à distância	Mota, F. ; ESPÍNDOLA, Danúbia Bueno ; TUSNSKI, L. F. M. ; Pinto, I. M.	2012	1-12	8	\N	3
2610	TC	Visualization Management of Industrial Maintenance Data Using Augmented Reality	ESPÍNDOLA, Danúbia Bueno ; PEREIRA, Carlos Eduardo ; HENRIQUES, Renato Ventura Bayan ; BOTELHO, Silvia S da C	2011	1-8	8	\N	3
2211	CL	Self-Localization and Mapping for Underwater Autonomous Vehicles	BOTELHO, S. S. C. ; OLIVEIRA, G. L. ; DREWS JR, P. L. J. ; FIGUEIREDO, M. ; HAFFELE, C.	2010	365-382	28	\N	2
2212	TC	Efficient Change Detection in 3D Environment for Autonomous Surveillance Robots based on Implicit Volume	VIEIRA, A. W. ; DREWS JR, P. L. J. ; CAMPOS, M. F. M.	2012		28	\N	2
2213	TC	Tracking System for Underwater Inspection Using Computer Vision	DREWS JR, P. L. J. ; KUHN, V. N. ; GOMES, S. C. P.	2012		28	\N	2
2215	TC	Controlling a Inspection ROV Using Low Cost Sensors	KUHN, V. N. ; DREWS JR, P. L. J. ; GOMES, S. C. P.	2012		28	\N	2
2613	TC	Detecção de falhas em atuadores nas linhas de transporte de petróleo e/ou derivados	HENRIQUES, Renato Ventura Bayan ; PEREIRA, Carlos Eduardo ; SCHNEIDER, Eduardo Luis ; GONÇALVES, Luiz Fernando ; ESPÍNDOLA, Danúbia Bueno	2010		8	\N	3
2614	TC	IM:MR - A Tool for integration of data from different formats	ESPÍNDOLA, Danúbia Bueno ; PEREIRA, Carlos Eduardo ; PINHO, Marcio	2009	620-626	8	\N	3
2219	TC	Filtragem e Estimação de Estados com Restrições Aplicado ao SLAM Visual	OLIVEIRA, V. M. ; DREWS JR, P. L. J. ; OLIVEIRA	2012		28	\N	2
2220	TC	A Terrain-Based Path Planning for Mobile Robots with Bounded Curvature	DREWS JR, P. L. J. ; MACHARET, D. G. ; CAMPOS, M. F. M.	2012		28	\N	2
2615	TC	A solution for integration of IM and MR data	ESPÍNDOLA, Danúbia Bueno ; PEREIRA, Carlos Eduardo	2009	423-430	8	\N	3
2616	RE	Rastreamento e imersão 3d para visualização de estruturas navais e offshore	SCHROEDER, Greyce N ; ESPÍNDOLA, Danúbia Bueno ; BOTELHO, Silvia S da C ; DUARTE, Nelson	2012		8	\N	3
2223	TC	Aprendizado Ativo e Semi-Supervisionado na Classificacao de Microalgas	DREWS JR, P. L. J. ; COLARES, R. G. ; MACHADO, P. N. ; FARIA, M. F. ; DETONI, A. M. S. ; TAVANO, V. M.	2012		28	\N	2
2617	RE	O uso de Realidade Aumentada em Sistemas de Manutenção Inteligente	ESPÍNDOLA, Danúbia Bueno ; PEREIRA, Carlos Eduardo	2008	54-58	8	\N	3
2618	RC	A Visualização Mista nos Sistemas de Automação de Processos de Manutenção Preditiva de Máquinas da Indústria	ESPÍNDOLA, Danúbia Bueno ; PEREIRA, Carlos Eduardo ; HENRIQUES, Renato Ventura Bayan ; BOTELHO, Silvia Silva da Costa	2010	3021-3027	8	\N	3
2192	TC	Design of 16nm SRAM Architecture	GOMES, I. A. C. ; MEINHARDT, C. ; BUTZEN, P. F.	2012	1-4	27	1868	2
2619	RC	Visualization of Intelligent Maintenance Systems Through Mixed Reality	ESPÍNDOLA, Danúbia Bueno ; PEREIRA, Carlos Eduardo ; PINHO, Marcio	2008	203-204	8	\N	3
2228	TC	Computer Vision Algorithm for Detecting Wear in Teeth	MEIRELES, A. B. ; CASAS, E. B. L ; CORNACCHIA, T. M. ; CAMPOS, M. F. M. ; ALVES NETO,A. ; DREWS JR, P. L. J.	2010	1-4	28	\N	2
2229	TC	Novelty Detection and 3D Shape Retrieval using Superquadrics and Multi-Scale Sampling for Autonomous Mobile Robots	DREWS JR, P. L. J. ; NUNEZ, P. ; ROCHA, R. P. P. ; CAMPOS, M. F. M. ; DIAS, J.	2010	3635-3640	28	\N	2
2230	TC	Detecção de Mudanças e Recuperação de Forma em Mapas 3D Baseados em Nuvens de Pontos	DREWS JR, P. L. J. ; CAMPOS, M. F. M.	2010	1-8	28	\N	2
2231	TC	Crowd Behavior Analysis under Cameras Network Fusion using Probabilistic Methods	DREWS JR, P. L. J. ; QUINTAS, J. ; DIAS, J. ; ANDERSSON, M. ; NYG RDS, J. ; RYDELL, J.	2010	1-8	28	\N	2
2620	AP	Signal probability for reliability evaluation of logic circuits	FRANCO, D ; VASCONCELOS, M ; NAVINER, L ; NAVINER, J	2008	1586-1591	9	\N	3
2621	AP	Relevant metrics for evaluation of concurrent error detection schemes	DEVASCONCELOS, M ; FRANCO, D ; NAVINER, L ; NAVINER, J	2008	1601-1603	9	\N	3
2234	TC	Detecção de Mudanças e Recuperação de Forma em Mapas 3D Baseados em Nuvens de Pontos	DREWS JR, P. L. J. ; ROCHA, R. P. P. ; DIAS, J. ; CAMPOS, M. F. M.	2010	1-7	28	\N	2
2235	TC	Probabilistic LMA-Based Classification of Human Behaviour Understanding Using Power Spectrum Techinique	KHOSHHAL, K. ; ALIAKBARPOUR, H. ; QUINTAS, J. ; DREWS JR, P. L. J. ; DIAS, J.	2010	1-7	28	\N	2
2236	TC	Change Detection in 3D Environments Based on Gaussian Mixture Model and Robust Structural Matching for Autonomous Robotic Applications	NUNEZ, P. ; DREWS JR, P. L. J. ; BANDERA, A. ; ROCHA, R. P. P. ; CAMPOS, M. F. M. ; DIAS, J.	2010	2633-2638	28	\N	2
2237	TC	Growing Cell Structures applied to Sensor Fusion and SLAM	BOTELHO, S. S. C. ; HAFFELE, C. ; FIGUEIREDO, M. ; DREWS JR, P. L. J. ; OLIVEIRA, G. L.	2010		28	\N	2
2238	TC	Methods for Assessing Dental Wear in Bruxism	MEIRELES, A. B. ; CORNACCHIA, T. M. ; CASAS, E. B. L ; BASTOS, F. S. ; GODOY, G. C. ; MARQUES, F. S. ; DREWS JR, P. L. J. ; ALVES NETO,A. ; CAMPOS, M. F. M.	2009	1-6	28	\N	2
2239	TC	Multidisciplinary Approach In Tooth Wear: Biomechanical Aspects And Computational View	MEIRELES, A. B. ; CORNACCHIA, T. M. ; CASAS, E. B. L ; GODOY, G. C. ; MARQUES, F. S. ; DREWS JR, P. L. J. ; ALVES NETO,A. ; CAMPOS, M. F. M.	2009	1-10	28	\N	2
2240	TC	Novelty Detection and 3D Shape Retrieval based on Gaussian Mixture Models for Autonomous Surveillance Robotics	NUNEZ, P. ; DREWS JR, P. L. J. ; ROCHA, R. P. P. ; CAMPOS, M. F. M. ; DIAS, J.	2009	4724-4730	28	\N	2
2241	TC	Data Fusion Calibration for a 3D Laser Range Finder and a Camera using Inertial Data	NUNEZ, P. ; DREWS JR, P. L. J. ; ROCHA, R. P. P. ; DIAS, J.	2009	1-6	28	\N	2
2242	TC	Object Shape Retrieval through Grasp Exploration	FARIA, D. R. ; PRADO, J. A. S. ; DREWS JR, P. L. J. ; DIAS, J.	2009	1-6	28	\N	2
2622	TC	Uma nova técnica para análise HEPWM baseada na aplicação de multiplicadores de Lagrange	OBADOWSKI, V. N. ; RIECHEL, T. L. ; CRUZ, M. F. ; UGOSKI, P. E. M. ; RICHTER, C. M. ; SEVERO, S. L. S. ; A. P. Lerm ; FRANCO, D. T. ; CIARELLI, W. F.	2012		9	\N	3
2623	TC	A Supervisory System for Real-Time Oscillography of Synchronous Generators	CRUZ, M. F. ; RIECHEL, T. L. ; OBADOWSKI, V. N. ; UGOSKI, P. E. M. ; RICHTER, C. M. ; SEVERO, S. L. S. ; A. P. Lerm ; OLIVEIRA, M. O. ; PAZ, M. C. R. ; BRETAS, A. S. ; FRANCO, D. T. ; CIARELLI, W. F.	2012		9	\N	3
2245	TC	Visual Odometry and Mapping for Underwater Autonomous Vehicles	BOTELHO, S. S. C. ; DREWS JR, P. L. J. ; OLIVEIRA, G. L. ; FIGUEIREDO, M. ; HAFFELE, C.	2009	1-6	28	\N	2
2246	TC	Self Organizing Maps for AUVs Mapping	BOTELHO, S. S. C. ; HAFFELE, C. ; OLIVEIRA, G. L. ; FIGUEIREDO, M. ; DREWS JR, P. L. J.	2009	1-5	28	\N	2
2624	TC	A New Method to Minimize Harmonic Components on PWM Signals Based on Lagrange Multipliers	OBADOWSKI, V. N. ; RIECHEL, T. L. ; CRUZ, M. F. ; UGOSKI, P. E. M. ; RICHTER, C. M. ; SEVERO, S. L. S. ; A. P. Lerm ; OLIVEIRA, M. O. ; PAZ, M. C. R. ; BRETAS, A. S. ; FRANCO, D. T. ; CIARELLI, W. F.	2012		9	\N	3
2625	TC	Active Power Regulation of Auxiliary Generation Units in Hydroelectric Power Plants Using Power Electronic Switching	PAZ, M. C. R. ; OLIVEIRA, M. O. ; BRETAS, A. S. ; CRUZ, M. F. ; RIECHEL, T. L. ; OBADOWSKI, V. N. ; UGOSKI, P. E. M. ; RICHTER, C. M. ; A. P. Lerm ; SEVERO, S. L. S. ; FRANCO, D. T. ; CIARELLI, W. F.	2012		9	\N	3
2626	TC	Controle de Potência Ativa em Geradores Auxiliares de Usinas Hidrelétricas Através de sua Compensação Série	OLIVEIRA, M. O. ; PAZ, M. C. R. ; BRETAS, A. S. ; CRUZ, M. F. ; RIECHEL, T. L. ; OBADOWSKI, V. N. ; UGOSKI, P. E. M. ; RICHTER, C. M. ; SEVERO, S. L. S. ; A. P. Lerm ; FRANCO, D. T. ; CIARELLI, W. F.	2012		9	\N	3
2627	TC	Sistema Supervisório Voltado para Oscilografia em Tempo Real de Geradores Síncronos	CRUZ, M. F. ; RIECHEL, T. L. ; OBADOWSKI, V. N. ; UGOSKI, P. E. M. ; RICHTER, C. M. ; SEVERO, S. L. S. ; A. P. Lerm ; OLIVEIRA, M. O. ; PAZ, M. C. R. ; BRETAS, A. S. ; FRANCO, D. T. ; CIARELLI, W. F.	2012		9	\N	3
2628	TC	Um Novo Método para Minimização de Componentes Harmônicos em Sinais PWM Baseado em Multiplicadores de Lagrange Aplicados a HEPWM	OBADOWSKI, V. N. ; RIECHEL, T. L. ; CRUZ, M. F. ; UGOSKI, P. E. M. ; RICHTER, C. M. ; SEVERO, S. L. S. ; A. P. Lerm ; OLIVEIRA, M. O. ; PAZ, M. C. R. ; BRETAS, A. S. ; FRANCO, D. T. ; CIARELLI, W. F.	2012		9	\N	3
2629	TC	On evaluating the signal reliability of self-checking arithmetic circuits	FRANCO, D. T. ; VASCONCELOS, M ; NAVINER, L ; NAVINER, J	2010	109-114	9	\N	3
2253	TC	Controle em Profundidade de um Veículo Subaquático do Tipo ROV	CENTENO, M. L. ; GOMES, S. C. P. ; PEREIRA, I. M. ; DINIZ, Claudio Machado ; DREWS JR, P. L. J. ; BOTELHO, S. S. C.	2008	1-6	28	\N	2
2630	TC	A Software Tool for the Analysis of Reliability in Combinational Logic Circuits	BORGES, M. T. ; OLIVEIRA, R. F. ; FRANCO, D. T.	2010	83-86	9	\N	3
2255	AP	Lossless and near-lossless digital angiography coding using a two-stage motion compensation approach	SANTOS, Rafael Augusto Penna dos ; SCHARCANSKI, J	2008	379-387	29	\N	2
2631	TC	Methods and Metrics for Reliability Assessment	NAVINER, L ; NAVINER, J ; FRANCO, D. T. ; VASCONCELOS, M	2009	1-14	9	\N	3
2257	TC	Educação Ubíqua: A Tecnologia dando Suporte ao Processo de Ensino-aprendizagem em Qualquer Lugar, em Qualquer Instante	IAHNKE, S. L. P. ; BOTELHO, S. S. C. ; SANTOS, Rafael Augusto Penna dos ; OLIVEIRA, R. R. ; CARVALHO, J. T.	2010		29	\N	2
2258	AP	Uma ferramenta de autoria síncrona acessível para cegos: estudo de caso no curso PROINESP. RENOTE	BARWALDT, Regina ; SANTAROSA, Lucila Maria Conti ; PASSERINO, Liliana Maria	2009	01-10	30	\N	2
3019	RC	Geração de Carga para Processamento de Transações Online Usando TPC-C	MULLER, R. H. ; MENDIZABAL, O	2012		26	\N	3
2632	TC	Efficient computation of logic circuits reliability based on Probabilistic Transfer Matrix	NAVINER, L ; VASCONCELOS, M ; FRANCO, D. T. ; NAVINER, J	2008	01-04	9	\N	3
2633	TC	Reliability analysis of combinational circuits based on a probabilistic binomial model	VASCONCELOS, M ; FRANCO, D. T. ; NAVINER, L ; NAVINER, J	2008	310-313	9	\N	3
2265	TC	Recursos Acessíveis: uma alternativa para as PNEEs em EAD	BARWALDT, Regina ; SANTAROSA, Lucila Maria Costi	2010		30	\N	2
2266	TC	EVOC: uma solução para incluir as PNEEs em um curso na modalidade à distância	BARWALDT, Regina ; SANTAROSA, Lucila Maria Conti	2009		30	\N	2
2267	AP	Robustness of multimodal biometric fusion methods against spoof attacks	Rodrigues, Ricardo N. ; Ling, Lee Luan ; Govindaraju, Venu	2009	169-179	31	\N	2
2268	TC	Assessment of Biometric Robustness Against Spoof Attacks	Rodrigues, Ricardo N. ; Govindaraju, Venu	2010		31	\N	2
2269	TC	Evaluation of Biometric Spoofing in a Multimodal System	Rodrigues, Ricardo N. ; Niranjan Kamat ; Govindaraju, Venu	2010		31	\N	2
2270	TC	Generation of Handwriting by Active Shape Modeling and Global Local Approximation (GLA) Adaptation	CHOWRIAPPA, A. ; Rodrigues, Ricardo N. ; KESAVADAS, T. ; Govindaraju, Venu ; BISANTZ, A.	2010		31	\N	2
2271	TC	Uma Nova Abordagem Robusta de Fusão Biométrica	Ling, Lee Luan ; Rodrigues, Ricardo N. ; LEE, J. C.	2009		31	\N	2
2634	TC	Reliability of logic circuits under multiple simultaneous faults	FRANCO, D. T. ; VASCONCELOS, M ; NAVINER, L ; NAVINER, J	2008	265-268	9	\N	3
2273	TC	Fusão biométrica com lógica nebulosa	RODRIGUES, Ricardo Nagel ; LING, L. L.	2008		31	\N	2
2635	TC	Reliability analysis of logic circuits based on signal probability	FRANCO, D. T. ; VASCONCELOS, M ; NAVINER, L ; NAVINER, J	2008	670-673	9	\N	3
2275	TC	Visual Tracking Based on 3D Probabilistic Reconstruction	SIMAS, Gisele ; DE BEM, Rodrigo Andrade ; NOVELO, Lucas ; FICKEL, G. ; BOTELHO, Silvia Silva da Costa	2010	403-409	32	\N	2
2636	TC	On the output events in concurrent error detection schemes	VASCONCELOS, M ; FRANCO, D. T. ; NAVINER, L ; NAVINER, J	2008	978-981	9	\N	3
2637	TC	Evaluating signal reliability of logic circuits by signal probability	FRANCO, D. T. ; VASCONCELOS, M ; NAVINER, L ; NAVINER, J	2008	01-02	9	\N	3
2278	TC	Utilizando Visão Computacional para Reconstrução Probabilística 3D e Rastreamento de Movimentos	SIMAS, Gisele ; FICKEL, G. ; NOVELO, Lucas ; BOTELHO, Silvia Silva da Costa ; DE BEM, Rodrigo Andrade	2009	135-140	32	\N	2
2279	AP	Abordagem Geométrica para Modulação de Conversores três Braços no Acionamento de Máquinas de Indução Bifásicas Simétricas e Assimétricas	VIEIRA, R. P. ; GASTALDINI, Cristiane ; AZZOLIN, Rodrigo Zelir ; PINHEIRO, Humberto ; GRÜNDLING, Hilton Abílio	2012	14-24	33	\N	2
2280	AP	Discrete-time Sliding Mode Speed Observer for Sensorless Control of Induction Motor Drives	VIEIRA, R. P. ; GASTALDINI, Cristiane ; AZZOLIN, Rodrigo Zelir ; GRÜNDLING, Hilton Abílio	2012	1-8	33	\N	2
2281	CL	Electrical Parameter Identification of Single-Phase Induction Motor by RLS Algorithm. Induction Motor. Vienna	VIEIRA, R. P. ; AZZOLIN, Rodrigo Zelir ; GASTALDINI, Cristiane ; GRÜNDLING, Hilton Abílio	2012		33	\N	2
2282	CL	A RMRAC Parameter Identification Algorithm Applied to Induction Machines. Electric Machines and Drives. Vienna	AZZOLIN, Rodrigo Zelir ; GASTALDINI, Cristiane ; VIEIRA, R. P. ; GRÜNDLING, Hilton Abílio	2011		33	\N	2
2283	CL	Feedback Linearization of Speed-Sensorless Induction Motor Control with Torque Compensation. Electric Machines and Drives. Vienna	GASTALDINI, Cristiane ; AZZOLIN, Rodrigo Zelir ; VIEIRA, R. P. ; GRÜNDLING, Hilton Abílio	2011		33	\N	2
2284	TC	Discrete-time sliding mode approach for speed estimation of symmetrical and asymmetrical induction machines	VIEIRA, R. P. ; GASTALDINI, Cristiane ; AZZOLIN, Rodrigo Zelir ; GRÜNDLING, Hilton Abílio	2011	1819-1824	33	\N	2
2285	TC	Discrete-time sliding mode speed observer for induction machine drives	VIEIRA, R. P. ; GASTALDINI, Cristiane ; AZZOLIN, Rodrigo Zelir ; GRÜNDLING, Hilton Abílio	2011	213-218	33	\N	2
2286	TC	Simple PWM Approach for Modulation of Three-leg Inverters Driving Two-phase Symmetrical and Asymmetrical Machines	VIEIRA, R. P. ; AZZOLIN, Rodrigo Zelir ; GASTALDINI, Cristiane ; PINHEIRO, Humberto ; GRÜNDLING, Hilton Abílio	2010		33	\N	2
2287	TC	Electrical Parameters Identification of Hermetic Refrigeration Compressors with Single-Phase Induction Machines using RLS Algorithm	VIEIRA, R. P. ; AZZOLIN, Rodrigo Zelir ; GASTALDINI, Cristiane ; GRÜNDLING, Hilton Abílio	2010		33	\N	2
2288	TC	A RMRAC Parameter Identification Algorithm applied to SPIM	AZZOLIN, Rodrigo Zelir ; GASTALDINI, Cristiane ; VIEIRA, R. P. ; GRÜNDLING, Hilton Abílio	2010		33	\N	2
2289	TC	An Adaptive Feedback Linearization Control for Induction Motor	GASTALDINI, Cristiane ; AZZOLIN, Rodrigo Zelir ; VIEIRA, R. P. ; GRÜNDLING, Hilton Abílio	2010		33	\N	2
2290	TC	Uma Abordagem Geométrica para Modulação de Conversores Três Braços Acionando Máquinas de Duas Fases Simétricas e Assimétricas	VIEIRA, R. P. ; AZZOLIN, Rodrigo Zelir ; GASTALDINI, Cristiane ; PINHEIRO, Humberto ; GRÜNDLING, Hilton Abílio	2010		33	\N	2
2291	TC	Algoritmo RMRAC Aplicado na Identificação dos Parâmetros Elétricos de Motores de Indução Monofásicos	AZZOLIN, Rodrigo Zelir ; GASTALDINI, Cristiane ; VIEIRA, R. P. ; GRÜNDLING, Hilton Abílio	2010		33	\N	2
2292	TC	A MRAC Parameter Identification Algorithm for Three-Phase Induction Motors	AZZOLIN, Rodrigo Zelir ; GRÜNDLING, Hilton Abílio	2009	273-278	33	\N	2
2293	TC	A Comparison of Speed-Sensorless Induction Motor Control with Torque Compensation	GASTALDINI, Cristiane ; AZZOLIN, Rodrigo Zelir ; GRÜNDLING, Hilton Abílio	2009	1480-1485	33	\N	2
2294	TC	Parameter Identification of a Single-phase Induction Motor Using Rls Algorithm	VIEIRA, R. P. ; AZZOLIN, Rodrigo Zelir ; GRÜNDLING, Hilton Abílio	2009	517-523	33	\N	2
2295	TC	A RMRAC parameter identification algorithm for induction motors	AZZOLIN, Rodrigo Zelir ; GRÜNDLING, Hilton Abílio	2009	1171-1176	33	\N	2
2296	TC	A speed-sensorless induction motor servomechanism using feedback linearization control	GASTALDINI, Cristiane ; AZZOLIN, Rodrigo Zelir ; GRÜNDLING, Hilton Abílio	2009	493-497	33	\N	2
2297	TC	A Sensorless Single-Phase Induction Motor drive with a MRAC Controller	VIEIRA, R. P. ; AZZOLIN, Rodrigo Zelir ; GRÜNDLING, Hilton Abílio	2009		33	\N	2
2298	TC	Identificação dos Parâmetros Elétricos e Mecânicos de Motores de Indução Trifásicos para Acionamento Encoderless	EINLOFT, Diego ; AZZOLIN, Rodrigo Zelir ; GRÜNDLING, Hilton Abílio	2008		33	\N	2
2638	RE	A Dedicated Hardware Solution for the HEVC Interpolation Unit	AFONSO, V. ; CORREA, M. M. ; AGOSTINI, Luciano ; FRANCO, D. T.	2012		9	\N	3
2299	TC	Nova Modulação Space Vector para o Controle da Tensão do Ponto Central do Divisor Capacitivo do NPC	GRIGOLETTO, Felipe Bovolini ; GASTALDINI, Cristiane ; TOMM, Fabio ; BELTRAME, Fernando ; SARTORI, Hamilton ; MARTINS, Matheus ; DIAS, Milena ; AZZOLIN, Rodrigo Zelir ; BERNARDES, Thiago ; PINHEIRO, Humberto	2008		33	\N	2
2300	AP	Sistema baseado em Inteligência Artificial para Agrupamento e Classificação de Dados na Construção Naval	Souza, K ; Botelho, Silvia S. C.	2012	60-67	34	\N	2
2639	RE	Reliability Estimation Methods:Trade-Offs Between Complexity and Accuracy	PAGLIARINI, S. N. ; FRANCO, D. T. ; Lirida Naviner ; Jean-François Naviner	2012		9	\N	3
2302	AP	Artefatos educacionais com memória cinética Topobo: uma abordagem para o currículo dos anos iniciais. RENOTE	M, Santin ; da Silva Costa Botelho, S.	2012	1-9	34	\N	2
2640	RC	SPR Tool: Signal Reliability Analysis of Logic Circuits	FRANCO, D. T. ; VASCONCELOS, M ; NAVINER, L ; NAVINER, J	2009	01-02	9	\N	3
2304	AP	Exergames no ciberespaço: uma possibilidade para a educação física	VAGHETTI, C. A. O. ; MUSTARO, P. N. ; BOTELHO, S. S. C.	2011	32	34	\N	2
2641	AP	Utilização de Autômatos Celulares para Simulação de Impactos Ambientais	SILVA, F. N. ; ADAMATTI, D. F.	2012	1-10	10	\N	3
2306	AP	Ambientes virtuais de aprendizagem na educação física: uma revisão sobre a utilização de Exergames	VAGHETTI, C. A. ; BOTELHO, S. S. C.	2010	1-6	34	\N	2
2307	AP	Forecasting Electric Energy Demand using a Predictor Model based on Liquid State Machine	grando, n. ; CENTENO, T. M. ; BOTELHO, S. S. C. ; fontoura, f.	2010	40-53	34	\N	2
2308	AP	PRINCÍPIOS ERGONÔMICOS E USABILIDADE DE INTERFACES DE REALIDADE AUMENTADA EM AMBIENTES VIRTUAIS DE APRENDIZAGEM: VISÃO GERAL E TENDENCIAS	VAGHETTI, C. A. ; BOTELHO, S. S. C.	2010	1-6	34	\N	2
2642	AP	FURG Smart Games: a development enviroment to NPC decisions in games	MADSEN, C. ; LUCCA, G. ; DANIEL, G. B. ; ADAMATTI, D. F.	2012	47-61	10	\N	3
2310	AP	General Purpose Cave-like System for Visualization of Animated and 4D CAD Modeling	BOTELHO, S. S. C. ; DUARTE FILHO, Nelson Lopes ; Hax, V. A. ; Maffei, R. Q. ; Marcos, P. B. ; Ruas, R. R. ; Tyska, J. C ; Tyska Carvalho, Jonata	2010	1	34	\N	2
2643	AP	Usando a Metodologia Prometheus para Modelagem de um Sistema Multiagente	RODRIGUES, T. ; ADAMATTI, D. F.	2012	1-15	10	\N	3
2313	AP	DESENVOLVIMENTO DE UMA PLATAFORMA MULTIDISCIPLINAR PARA AUTORIA DE JOGOS 3D INTERATIVOS E EDUCATIVOS	PINTO, Ivete ; BOTELHO, S. S. C. ; Souza, R. ; Sonego, T. ; COLARES, R. ; CAMPOS, R. L.	2009	1-8	34	\N	2
2644	AP	Um Jogo de Estratégia Aplicando Técnicas de Inteligência Artificial	SILVA, F. V. ; ADAMATTI, D. F.	2012	1-10	10	\N	3
2315	AP	Sistema de predição de alarmes em processos industriais por classificação não-supervisionada	Braustein, S. ; A, Lerm ; Lerm, R. ; Werhli, A. ; BOTELHO, S. S. C. ; E, Lippe	2009	37-42	34	\N	2
2316	AP	Dimensional Reduction in the Protein Secondary Structure Prediction Nonlinear Method Improvements	SIMAS, G. ; BOTELHO, S. S. C. ; grando, n. ; COLARES, R.	2008	425-432	34	\N	2
2645	AP	NeuroFURG: uma ferramenta de apoio ao ensino de Redes Neurais Artificiais	MADSEN, C. ; ADAMATTI, D. F.	2011	14-24	10	\N	3
2646	AP	Simulação Baseada em Multiagentes como Ferramenta em Estudos Interdisciplinares. RENOTE	ADAMATTI, D. F.	2011	1-9	10	\N	3
2647	AP	Using Artificial Intelligence in Computational Games	MADSEN, C. ; ADAMATTI, D. F.	2011	60-67	10	\N	3
2320	AA	Internet of Things in Product-Service Systems - A Trend in Service Engineering	ESPÍNDOLA, D. ; DUARTE, N. ; BOTELHO, S. S. C. ; pereira, c. e.	2011		34	\N	2
2321	AA	Dimensional Reduction in the Protein Secondary Structure Prediction: Nonlinear Method Improvements	BOTELHO, S. S. C. ; SIMAS, G. ; COLARES, R.	2009		34	\N	2
2648	AP	Uso de Árvores de Decisão para Captura de Comportamentos de Agentes	SILVEIRA, J. A. ; PAES, T. L. ; ADAMATTI, D. F. ; EMMENDORFER, L. R.	2011	1-21	10	\N	3
2323	LP	Offshore and Marine Technology: Science and Innovation	DUARTE FILHO, N. L. (Org.) ; Botelho, Silvia S. C. (Org.) ; ESTEFEN, S. (Org.) ; E. C. PINTO (Org.) ; Giroldo, D (Org.)	2012		34	\N	2
2324	LP	Third Southern Conference on Computational Modeling	BOTELHO, S. S. C. (Org.) ; ROCHA, L. (Org.) ; D, Adamatti (Org.)	2010		34	\N	2
2325	LP	Simpósio de Modelagem Computacional do Sul	ROCHA, L. (Org.) ; BOTELHO, S. S. C. (Org.) ; D, Adamatti (Org.)	2009		34	\N	2
2326	LP	CONFERÊNCIA EM MODELAGEM COMPUTACIONAL DO SUL	BOTELHO, S. S. C. (Org.) ; ROCHA, L. (Org.) ; D, Adamatti (Org.)	2009		34	\N	2
2327	CL	Nonlinear Dimensional Reduction in Protein Secondary Structure Prediction. Forecasting Models - Methods and Applications	SIMAS, G. ; BOTELHO, S. S. C. ; COLARES, R. ; CORREA, U. B.	2010	65-81	34	\N	2
2328	CL	Using augmented state Kalman filter to localize multi autonomous underwater vehicles. Robot Localization and Map Building	BOTELHO, S. S. C. ; LEIVAS, G ; DREWS, P.	2010	33-41	34	\N	2
2649	AP	An analysis of the insertion of virtual players in GMABS methodology using the Vip-JogoMan prototype. JASSS	ADAMATTI, D. F. ; SICHMAN, Jaime Simão ; COELHO, Helder	2009	1-40	10	\N	3
2650	AP	Inserção de Jogadores Virtuais em Jogos de Papeis para uso em sistemas de apoio a decisão em Grupos: um Experimento no Domínio da Gestão dos Recursos Naturais. IP	ADAMATTI, D. F.	2008	115-116	10	\N	3
2651	LP	V Conferência Sul em Modelagem Computacional	SOUZA, J. A. (Org.) ; ADAMATTI, D. F. (Org.) ; RODRIGUES, R. G. (Org.) ; KRUSCHE, N. (Org.) ; EMMENDORFER, L. R. (Org.)	2012		10	\N	3
2652	LP	Advances in Social Simulation, 2010 Second Brazilian Workshop on Social Simulation, BWSS 2010, Post-Proceedings. Los Alamitos: IEEE	DIMURO, G. P. (Org.) ; COSTA, A. C. R. (Org.) ; SICHMAN, Jaime Simão (Org.) ; Tedesco, P. C. A. R. (Org.) ; ADAMATTI, D. F. (Org.) ; BALSA, J. (Org.) ; ANTUNES, L. (Org.)	2011		10	\N	3
2333	TC	Estaleiros Virtuais Imersivos - A Realidade Virtual a serviço da Indústria Naval e Offshore	Botelho, Silvia S. C. ; Amaral, M.	2012		34	\N	2
2312	AP	A VISUAL SYSTEM FOR DISTRIBUTED MOSAICS USING AUV FLEETS	DREWS, P. ; BOTELHO, S. S. C.	2009	1-8	34	2208	2
2654	LP	Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações - Artigos Selecionados das quatro primeiras edições. Rio Grande / RS: Edigraf- Editora e Gráfica da Universidade Federal do Rio Grande	ADAMATTI, D. F. (Org.)	2010		10	\N	3
2655	LP	Anais do Simpósio de Modelagem Computacional do Sul	ROCHA, L. A. O. (Org.) ; BOTELHO, S.S.C. (Org.) ; ADAMATTI, D. F. (Org.)	2009		10	\N	3
2335	TC	Utilizando Máquinas de Estado Líquido para Reconhecimento de Padrões Temporais	NOVELLO, L. ; Botelho, Silvia S. C.	2012	1-6	34	\N	2
2656	CL	An Agent-Based Decision Support System to Simulate Generated Impacts by Industries Installation	NUNES, G. ; THOMASI, C. D. ; JUGUEIRO, M. ; ADAMATTI, D. F.	2012	95	10	\N	3
2657	CL	A Proposal for Interoperability to Agent Communication Using Synonyms	SPEROTTO, F. A. ; ADAMATTI, D. F.	2012	1-5	10	\N	3
2658	CL	Modeling Role Interactions in a Social Organization for the Simulation of the Social Production and Management of Urban Ecosystems: the case of San Jernimo Vegetable Garden of Seville, Spain	SANTOS, F. C. P. ; RODRIGUES, T. ; ADAMATTI, D. F. ; DIMURO, G. ; DIMURO, G. P. ; COSTA, A. C. R. ; JEREZ, E. M.	2012	1-4	10	\N	3
2659	CL	Artificial Intelligence Applied to Natural Resources Management. Machine Learning: Concepts, Methodologies, Tools and Applications. New York	ADAMATTI, D. F. ; AGUIAR, M. S.	2011	1566-1582	10	\N	3
2340	TC	Artefatos educacionais com memória cinética Topobo: uma abordagem para o currículo dos anos iniciais	M, Santin ; Botelho, Silvia S. C. ; SILVA, J.	2012	1-6	34	\N	2
2660	CL	Artificial Intelligence Applied to Natural Resources Management	ADAMATTI, D. F. ; AGUIAR, M. S.	2010	313-330	10	\N	3
2661	CL	Simulação Baseada em Multiagentes em Atividades de Graduação	ADAMATTI, D. F.	2010	208-211	10	\N	3
2343	TC	Parallel High Dimensional Self Organizing Maps Using CUDA	MORAES, F. ; Botelho, Silvia S. C. ; DUARTE, N.	2012	1-6	34	\N	2
2344	TC	ADA-TOPOBO: Um Ambiente Dual de Aprendizagem Utilizando Kits Educacionais	MOTA, F. ; SANTOS, I. ; ROSA, V. ; Botelho, Silvia S. C. ; Amaral, M.	2012	1-6	34	\N	2
2345	TC	Using Exergames as Social Networks: Testing the Flow Theory in the Teaching of Physical Education	VAGHETTI, C. A. O. ; SOUZA, P. O. ; DUARTE, M. A. ; da Silva Costa Botelho, S.	2012	1-6	34	\N	2
2347	TC	Utilizando Propagação de Crença Não Paramétrica para Rastreamento de Movimento com Mínimo Uso de Informação a Priori	SIMAS, G. ; Botelho, Silvia S. C.	2012	1-6	34	\N	2
2348	TC	Exploring Creativity and Sociability with an Accessible Educational Robotic Kit	Botelho, Silvia S. C. ; Braz, L. ; NAGEL, R.	2012	1-6	34	\N	2
2663	CL	Design of an Artificial Decision Maker for a Human-Based Social Simulation - Experience of the SIMPARC ProjectDesign of an Artificial Decision Maker for a Human-Based Social Simulation - Experience of the SIMPARC Project	BRIOT, J. ; SORDONI, A. ; VASCONCELOS FILHO, J. E. ; PATTO, V. S. ; ADAMATTI, D. F. ; IRVING, M. ; MELLO, G. ; Lucena, C.	2010	17-35	10	\N	3
2350	TC	TOPOBO: UMA NOVA FERRAMENTA PEDAGÓGICA PARA A EXPERIMENTAÇÃO EM CIÊNCIAS	M, Santin ; BOTELHO, S. S. C.	2011		34	\N	2
2664	CL	A Inteligência Artificial e o Gerenciamento de Recursos Naturais	ADAMATTI, D. F. ; AGUIAR, M. S.	2009	67-86	10	\N	3
2665	TC	Using GIS for Impact Analysis from Industries Installation	THOMASI, C. D. ; NUNES, G. ; JUGUEIRO, M. ; ADAMATTI, D. F.	2012		10	\N	3
2666	TC	Experiências de Inclusão Digital em Escolas Municipais de Rio Grande	ADAMATTI, D. F. ; SILVA, D. ; FELIX, D. ; FLORES, E. ; ROCHANO, E. L. ; LINDENAU, G. ; CARVALHO, J. T. ; HAX, V. A. ; DJALO, M.	2012	1-10	10	\N	3
2354	TC	Ambientes virtuais de aprendizagem na Educaçao fisica: uma revisão sobre a utilização de exergames	VAGHETTI, C. A. ; BOTELHO, S. S. C.	2010	1-6	34	\N	2
2667	TC	FURG Smart Games: a Propose for a Environment to Game Development With Software Reuse and Artificial Intelligence	MADSEN, C. ; LUCCA, G. ; DANIEL, G. B. ; ADAMATTI, D. F.	2012	1-15	10	\N	3
2357	TC	Sistema de Predição de Alarmes em Plantas Industriais Baseado em Mapas Auto-Organizáveis	Braustein, S. ; A, Lerm ; Lerm, R. ; Werhli, A. ; BOTELHO, S. S. C. ; E, Lippe	2010	1-6	34	\N	2
2360	TC	A Visualização Mista nos Sistemas de Automação de Processos de Manutenção Preditiva de Máquinas da Indústria	ESPÍNDOLA, D. ; pereira, c. e. ; R, Henriques ; BOTELHO, S. S. C.	2010	1-6	34	\N	2
2671	TC	Inclusão Digital como Ferramenta para Mudanças Sociais	ADAMATTI, D. F. ; CARVALHO, J. T. ; HAX, V. A. ; KLUMB, A. ; DUARTE, B. T. ; MIRAPALHETA, B. ; SILVA, D. ; FLORES, E. ; ROCHANO, E. L. ; LUCCA, G. ; LINDENAU, G. ; MARTINAZZO, L. A. ; DJALO, M. ; GRILLO, T. ; LEAL, T.	2012	1-6	10	\N	3
2674	TC	Um Modelo para Comunicação de Agentes Tratando Informações Imprecisas Baseado em Sinônimos	SPEROTTO, F. A. ; ADAMATTI, D. F.	2012	1-6	10	\N	3
2675	TC	FSG-ANNBack: Proposal of an Environment to Insert Artificial Neural Networks to Game Development Using Software Reuse	MADSEN, C. ; LUCCA, G. ; DANIEL, G. B. ; ADAMATTI, D. F.	2012	1-6	10	\N	3
2676	TC	Definição de sistema de apoio à decisão baseado em agentes para simulação de impactos gerados pela instalação de indústrias	BASTOS, N. ; MARQUES, B. ; ADAMATTI, D. F.	2012	1-6	10	\N	3
2367	TC	Cultura digital e Educação Física: problematizando a inserção de Exergames no currículo	VAGHETTI, C. A. ; BOTELHO, S. S. C. ; R, Sperotto	2010	1-6	34	\N	2
2368	TC	Cultura digital e Educação Física	VAGHETTI, C. A. ; R, Sperotto ; BOTELHO, S. S. C.	2010		34	\N	2
2677	TC	Processamento e Classificação de Sinais Cerebrais para o Uso em Sistemas BCI	SILVEIRA, J. A. ; ADAMATTI, D. F.	2012	1-6	10	\N	3
2678	TC	A Model for Agent Communication Based on Imprecise Information Using Synonyms	SPEROTTO, F. A. ; ADAMATTI, D. F.	2012	1-6	10	\N	3
2373	TC	Odometry and Mapping for Underwater Autonoumous Vehicles	BOTELHO, S. S. C. ; LEIVAS, G ; DREWS, P.	2009	1-6	34	\N	2
2680	TC	Utilização do Simulador SUMO para Simulação de Dispersão de Poluentes	BORN, M. B. ; ADAMATTI, D. F.	2012	1-6	10	\N	3
2378	TC	Técnicas para redução de perturbações em imagens subaquáticas destinadas ao controle de AUVS	DUCHINSKI, M. ; CENTENO, T. M. ; BOTELHO, S. S. C.	2008	1-6	34	\N	2
2682	TC	Inclusão Digital em Escola de Ensino Básico em Rio Grande (RS)	ADAMATTI, D. F. ; CARVALHO, J. T. ; HAX, V. A. ; KLUMB, A. ; SILVA, D. ; FLORES, E. ; CAMACHO, P. M. ; DJALO, M.	2011		10	\N	3
2683	TC	Inclusão Digital em Escola de Ensino Básico em Rio Grande (RS)	ADAMATTI, D. F. ; CARVALHO, J. T. ; HAX, V. A. ; KLUMB, A. ; SILVA, D. ; FLORES, E. ; CAMACHO, P. M. ; DJALO, M.	2011		10	\N	3
2684	TC	Atividades para Inclusão Digital em Ensino Básico: Uma Experiência em Escola de Rio Grande (RS)	ADAMATTI, D. F. ; CARVALHO, J. T. ; HAX, V. A. ; KLUMB, A. ; SILVA, D. ; CAMACHO, P. M. ; DJALO, M.	2011		10	\N	3
2687	TC	A Framework for Intelligent Games	ADAMATTI, D. F.	2010	376-380	10	\N	3
2689	TC	Problemas de Sincronização em Massively Multiplayer Online Games: Um Experimento Sobre a Plataforma SIM3D	FELSKE, M. S. ; ADAMATTI, D. F.	2010	1-4 - CDROM	10	\N	3
2690	TC	Um Overview sobre a Utilização de Técnicas de Inteligência Artificial em Gerenciamento de Recursos Naturais	GULARTE, A. ; THOMASI, C. D. ; NUNES, G. ; ADAMATTI, D. F.	2010	1-4 - CDROM	10	\N	3
2389	AP	A hardware DC motor emulator	ROSA, V. S. ; GERVINI, V. I. ; GOMES, S. C. P. ; BAMPI, S.	2008	5-16	35	\N	2
2390	TC	HW/SW FPGA Design for Active Control of Flexible Structures	SOARES, L. B. ; TERRES, M. A. S. M. ; GOMES, S. C. P. ; GERVINI, V. I. ; ROSA, V. S.	2012	1-6	35	\N	2
2391	TC	Emulador de Motor DC em Hardware	SCHUCH, L. W. ; ROSA, V. S.	2012	1-4	35	\N	2
2392	TC	TANQUE BATEDOR: UM ROBÔ TELEOPERADO PARA INSPEÇÃO EM AMBIENTES INÓSPITOS	Nunez, A. F. ; VEIGA, F. F. ; LONGHI, J. P. C. ; ROSA, V. S. ; OLIVEIRA, V. M.	2011	1-6	35	\N	2
2393	TC	An H.264 Deblocking Filter in FPGA with RGB Video Output	ROSA, V. S. ; Silva, L. M. ; BAMPI, S.	2010		35	\N	2
2394	TC	A low-cost hardware architecture binarizer design for the H.264/AVC CABAC entropy coding	Martins, A. L. M. ; ROSA, V. S. ; BAMPI, S.	2010	392-396	35	\N	2
2395	TC	High Performance Architectures for the Arithmetic Encoder of the H.264/AVC CABAC Entropy Coder	ROSA, V. S. ; Silva, L. M. ; BAMPI, S.	2010		35	\N	2
2396	TC	A hardware DC Motor emulator	ROSA, V. S. ; GERVINI, V. I. ; GOMES, S. C. P. ; BAMPI, S.	2010		35	\N	2
2397	TC	Uma Análise sobre Leis de Controle para Veículos Subaquáticos Não Tripulados	GOMES, S. C. P. ; ZEILMANN, A. P ; TERRES, M. A. S. M. ; SOARES, L. B. ; ROSA, V. S.	2010	1-4	35	\N	2
2399	TC	A high performance H.264 Deblocking Filter	ROSA, V. S. ; Altamiro A. Susin ; BAMPI, S.	2009		35	\N	2
2400	TC	Data storage using Compact Flash card and Hardware/Software Interface for FPGA Embedded Systems	SOARES, L. B. ; GERVINI, V. I. ; GOMES, S. C. P. ; ROSA, V. S.	2009	153-156	35	\N	2
2401	TC	Design of Electronic Interfaces to Control Robotic Systems Using FPGA	ROSA, A. L. M. ; TADEO, G. ; GERVINI, V. I. ; GOMES, S. C. P. ; ROSA, V. S.	2009	91-94	35	\N	2
2402	TC	A High Performance H.264 Deblocking Filter Hardware Architecture	ROSA, V. S. ; Altamiro A. Susin ; BAMPI, S.	2009	255-258	35	\N	2
2403	TC	Design of Hardware/Software board for the Real Time Control of Robotic Systems	Cassel, D. ; GERVINI, V. I. ; GOMES, S. C. P. ; ROSA, V. S.	2009	157-160	35	\N	2
2404	TC	VHDL generation of optimized FIR filters	DAITX, F. F. ; ROSA, V. S. ; COSTA, E. ; BAMPI, S. ; FLORES, P. F.	2008	1-5	35	\N	2
2405	TC	A Novel Hardware Architecture Dedicated to Binary Arithmetic Decoder Engines for the H.264/AVC CABAD	DEPRA, D. A. ; ROSA, V. S. ; BAMPI, S.	2008		35	\N	2
2406	TC	Design and Implementation of a High-Performance Architecture for Binarization Methods of Defined by H.264/AVC Standard	DEPRA, D. A. ; ROSA, V. S. ; BAMPI, S.	2008		35	\N	2
2407	TC	FPGA Implementation of a AC Motor Controller with a hardware/software codesign approach	MOREIRA, T. G. ; GUIMARAES JR., D. S. ; DINIZ, C. M. ; ROSA, V. S. ; GOMES, S. C. P.	2008		35	\N	2
2408	TC	A Novel Hardware Architecture Design for Binary Arithmetic Decoder Engines Based on Bitstream Flow Analysis	DEPRA, D. A. ; ROSA, V. S. ; BAMPI, S.	2008		35	\N	2
2409	TC	Construção de um canal de testes para estudo de interação fluido-estrutura	COELHO, J. F. L. ; PINTO, W. T. ; GOMES, S. C. P. ; ROSA, V. S. ; GERVINI, V. I. ; ROSA, A. L. M. ; Cassel, D. ; HARTMANN, E.	2008		35	\N	2
2410	TC	Desenvolvimento de Controladores para uma Plataforma Móvel Destinada ao Estudo da Interação Fluido-Estrutura	Cassel, D. ; ROSA, A. L. M. ; HARTMANN, E. ; PEREIRA, I. M. ; MOREIRA, T. G. ; GUIMARAES JR., D. S. ; GERVINI, V. I. ; ROSA, V. S. ; GOMES, S. C. P. ; COELHO, J. F. L. ; PINTO, W. T.	2008		35	\N	2
2411	AA	A Hardware DC Motor Emulator	ROSA, V. S. ; GERVINI, V. I. ; GOMES, S.C.P. ; BAMPI, S.	2010		36	\N	2
2412	AA	Desenvolvimento de interfaces para operação de uma plataforma de ensaios de embarcações	MEDEIROS, M. M. ; GERVINI, V. I. ; ROSA, V. S. ; GOMES, S.C.P.	2010		36	\N	2
2692	TC	UMA FERRAMENTA DE SIMULAÇÃO PARA IMPACTOS AMBIENTAIS	NUNES, G. ; THOMASI, C. D. ; GULARTE, A. ; ADAMATTI, D. F.	2010		10	\N	3
2375	TC	Análise Exploratória de Dados para o Desenvolvimento de Sistemas de Previsão de Alarmes em Plantas Industriais	BOTELHO, S. S. C. ; Werhli, A. ; Braustein, S.	2009	1-6	34	1752	2
2414	TC	Controle de Alto Desempenho para uma Plataforma Móvel Destinada ao Estudo da Interação Fluido Estrutura	ROSA, A. L. R. ; CASSEL, D. P. ; MEDEIROS, M. M. ; PEREIRA, I. M. ; TADEU, G. ; SOARES, L. B. ; GERVINI, V. I. ; ROSA, V. S. ; GOMES, S.C.P. ; PINTO, W. T. ; Coelho, J. F. L.	2008		36	\N	2
2415	TC	Construção de um Canal de Testes para a Interação Fluido Estrutura	Coelho, J. F. L. ; PINTO, W. T. ; GOMES, S.C.P. ; ROSA, V. S. ; GERVINI, V. I. ; ROSA, A. L. R. ; CASSEL, D. P. ; HARTMANN, E.	2008		36	\N	2
2416	TC	CONTROLE DE ROBÔ COM UM ELO FLEXÍVEL USANDO REDES WAVELETS NEURAIS	GERVINI, V. I. ; HEMERLY, E. M. ; GOMES, S.C.P.	2008		36	\N	2
2417	TC	CONTROLE Hinf DE UM MANIPULADOR FLEXÍVEL COM COMPENSAÇÃO DE ATRITO	MACHADO, C. C. ; GOMES, S.C.P. ; GUIMARAES JR, D. S. ; GERVINI, V. I. ; BORTOLI, A. L.	2008		36	\N	2
2418	TC	FRICTION COMPENSATION IN ROBOTIC ACTUATORS	GOMES, S.C.P. ; MACHADO, C. C. ; GERVINI, V. I. ; DINIZ, C. M. ; ROSA, V. S.	2008		36	\N	2
2419	TC	A NEW SIMULATOR TO FLEXIBLE MANIPULATORS	HARTMANN, E. ; SHULTZ, T. P. ; CASTELLUBER, W. ; GERVINI, V. I. ; GOMES, S.C.P.	2008		36	\N	2
2420	AP	Redução do Tempo de Execução de Métodos Numéricos utilizando GNU/OCTAVE e GPGPU	Tibola, A. L. ; OLIVEIRA, V. M.	2010	59-66	37	\N	2
1745	LP	Anais do IV Workshop- Escola de Sistemas de Agentes, seus Ambientes e apliCações. Rio Grande: FURG	Adamatti, D. F. (Org.) ; LUGO, G.G (Org.) ; Emmendorfer, L. R. (Org.) ; WERHLI, A. V. (Org.)	2010		0	1745	2
2422	TC	Sistema de Navegação para um Robô de Inspeção de Linhas Subterrâneas de Distribuição	Estrada, E. ; Silveira L. ; OLIVEIRA, V. M. ; BOTELHO, S. S. C.	2010		37	\N	2
2423	TC	Control of a Brachiating Robot for Inspection of Aerial Power Lines	OLIVEIRA, V. M. ; LAGES, W. F.	2010		37	\N	2
1926	LP	Anais do IV Workshop- Escola de Sistemas de Agentes, seus Ambientes e apliCações. Rio Grande: FURG	ADAMATTI, D. F. (Org.) ; LUGO, G. G. (Org.) ; EMMENDORFER, L. R. (Org.) ; WERHLI, A. V. (Org.)	2010		10	1745	2
2425	TC	Real-Time Predictive Control of a Brachiation Robot	OLIVEIRA, V. M. ; LAGES, W. F.	2009	1-6	37	\N	2
2693	TC	Design of an Artificial Decision Maker for a Human-based Social Simulation - Experience of the SimParc Project	BRIOT, J. ; SORDONI, A. ; VASCONCELOS FILHO, J. E. ; PATTO, V. S. ; ADAMATTI, D. F. ; IRVING, M.	2009	1-16.CDROM	10	\N	3
2427	TC	Controle em Tempo Real de um Robô Bracejador Utilizando MPC	OLIVEIRA, V. M. ; LAGES, W. F.	2009		37	\N	2
2694	TC	A Computer-based Support for Participatory Management of Protected Areas: The SimParc Project	BRIOT, J. ; PATTO, V. S. ; VASCONCELOS FILHO, J. E. ; ADAMATTI, D. F. ; SORDONI, A. ; MELLO, G.	2009	1337-1346	10	\N	3
2695	TC	An Overview of the MABS and RPG Techniques in Natural Resources Management	ADAMATTI, D. F.	2009	538-542	10	\N	3
2696	TC	Desenvolvimento de agentes: Uma análise da utilização da metodologia Prometheus	BERNY, V. M. ; ADAMATTI, D. F. ; COSTA, A. C. R.	2009	1-10.CDROM	10	\N	3
2697	TC	A Framework to combine MDA and Ontology Learning	CANTELE, R. C. ; FERREIRA, M. A. G. V. ; ADAMATTI, D. F. ; ARAUJO, M.	2008	1-12.CDROM	10	\N	3
1752	TC	Análise Exploratória de Dados para o Desenvolvimento de Sistemas de Previsão de Alarmes em Plantas Industriais	Botelho, S. S. C. ; BRAUNSTEI, S. H. ; WERHLI, A. V.	2009		0	1752	2
1753	TC	Continuum Crowds with Local Control	Marcelo Paravisi ; WERHLI, A. V. ; Julio C. S. Jaques Jr. ; RODRIGUES, R. ; BICHO, A. ; JUNG, C. R. ; MUSSE, S. R.	2008	108-115	0	1753	2
1761	TC	Continuum Crowds with Local Control	PARAVISI, M. ; WERHLI, A. V. ; JACQUES JUNIOR, J. C. S. ; RODRIGUES, R. A. ; BICHO, A. L. ; JUNG, C. R. ; MUSSE, S. R.	2008	108-115	1	1753	2
1755	AP	Space D*: A Path-Planning Algorithm for Multiple Robots in Unknown Environments	SILVEIRA, L. ; MAFFEI, R. Q. ; BOTELHO, S. S. C. ; DREWS JUNIOR, P. L. J. ; BICHO, A. L. ; DUARTE FILHO, N. L.	2012	1-11	1	1755	2
2206	AP	Space D* - A path-planning algorithm for multiple robots in unknown environments	SILVEIRA, Luan ; MAFFEI, R. Q. ; BOTELHO, S. S. C. ; DREWS JR, P. L. J. ; BICHO, A. L. ; DUARTE FILHO, N. L.	2012	363-373	28	1755	2
1759	TC	Space D*: Um Algoritmo para Path Planning Multi-Robôs	MAFFEI, R. Q. ; BOTELHO, S. S. C. ; SILVEIRA, L. ; DREWS JUNIOR, P. L. J. ; DUARTE FILHO, N. L. ; BICHO, A. L. ; ALMEIDA, F. R. ; LONGARAY, M. M.	2011	607-618	1	1759	2
2148	TC	Space D*: Um Algoritmo para Path Planning Multi-Robôs	Silveira, L. ; Maffei, Renan ; BOTELHO, Silvia Silva ; Drews, Paulo Lilles ; DUARTE FILHO, Nelson Lopes ; BICHO, A.	2011	51-62	24	1759	2
1760	TC	D*-space: Planejando Caminhos para Sistemas Multi-robôs	MAFFEI, R. Q. ; BOTELHO, S. S. C. ; SILVEIRA, L. ; DREWS JUNIOR, P. L. J. ; DUARTE FILHO, N. L. ; BICHO, A. L. ; LONGARAY, M. M. ; ALMEIDA, F. R.	2011	1-6 CDROM	1	1760	2
2149	TC	D*-Space: planejando caminhos para sistemas multi-robôs	Silveira, L. ; Maffei, Renan ; BOTELHO, Silvia Silva da Costa ; DREWS, Paulo ; DUARTE FILHO, Nelson Lopes ; BICHO, A. ; LONGARAY, M.	2011		24	1760	2
1785	AP	Recognizing and learning models of social exchange strategies for the regulation of social interactions in open agent societies	DIMURO, Graçaliz Pereira ; COSTA, A. C. R. ; Gonçalves, L. V. ; Pereira, D. R.	2011	1-19	4	1785	2
2011	AP	Recognizing and learning models of social exchange strategies for the regulation of social interactions in open agent societies	DIMURO, G. P. ; COSTA, A. C. R. ; GONÇALVES, L. V. ; PEREIRA, D. R.	2011	143-161	18	1785	2
1788	AP	Interval-Valued Hidden Markov Models for Recognizing Personality Traits in Social Exchanges in Open Multiagent Systems. TEMA	DIMURO, Graçaliz Pereira ; COSTA, A. C. R. ; Gonçalves, L. V. ; Hübner, A.	2008	83-93	4	1788	2
2017	AP	Interval-Valued Hidden Markov Models for Recognizing Personality Traits in Social Exchanges in Open Multiagent Systems. TEMA	DIMURO, G. P. ; COSTA, A. C. R. ; GONÇALVES, L. V. ; HÜBNER, A.	2008	83-93	18	1788	2
1792	LP	Advances in Social Simulation, Post-Proceedings of the Brazilian Workshop on Social Simulation	DIMURO, Graçaliz Pereira (Org.) ; COSTA, A. C. R. (Org.) ; SICHMAN, J. S. (Org.) ; TEDESCO, P. (Org.) ; Adamatti, D. (Org.) ; BALSA, J. (Org.) ; Antunes, L. (Org.)	2011		4	1792	2
2698	TC	An Experiment on Knowledge Reuse: Standards Applied	CANTELE, R. C. ; FERREIRA, M. A. G. V. ; ADAMATTI, D. F. ; ARAUJO, M.	2008	1-12.CDROM	10	\N	3
2699	TC	A Computer-based Support for Participatory Management of Protected Areas: The SimParc Project	BRIOT, J. ; VASCONCELOS FILHO, J. E. ; ADAMATTI, D. F. ; PATTO, V. S. ; BARBOSA, S. ; FURTADO, V. ; IRVING, M. ; Lucena, C.	2008	1-15.CDROM	10	\N	3
2700	TC	Uso de Agentes e Ontologias na Integração de Sistemas de Informação em Saúde	WEBBER, C. G. ; ADAMATTI, D. F. ; SALVADORI, J. ; RIBEIRO, A. M. ; PINTO, L. F. ; FERLA, A.	2008	1-10.CDROM	10	\N	3
2021	LP	Advances in Social Simulation, Post-Proceedings of the Brazilian Workshop on Social Simulation	DIMURO, G. P. (Org.) ; COSTA, A. C. R. (Org.) ; Sichman, J. (Org.) ; TEDESCO, P. (Org.) ; ADAMATTI, D. F. (Org.) ; BALSA, J. (Org.) ; Antunes, L. (Org.)	2011		18	1792	2
1793	LP	Anais do WEIT 2011 - I Workshop-Escola de Informática Teórica	DIMURO, Graçaliz Pereira (Org.) ; FOSS, L. (Org.) ; AGUIAR, Marilton Sanchotene de (Org.) ; COSTA, S. A. (Org.) ; COSTA, A. C. R. (Org.)	2011		4	1793	2
2023	LP	Anais do WEIT 2011 - I Workshop-Escola de Informática Teórica	DIMURO, G. P. (Org.) ; FOSS, L. (Org.) ; AGUIAR, M. S. (Org.) ; COSTA, S. A. (Org.) ; COSTA, A. C. R. (Org.)	2011		18	1793	2
1794	LP	Post-Proceedings 2011 Workshop-School on Theoretical Computer Science - WEIT 2011	COSTA, S. A. (Org.) ; FOSS, L. (Org.) ; AGUIAR, Marilton Sanchotene de (Org.) ; DIMURO, Graçaliz Pereira (Org.) ; COSTA, A. C. R. (Org.)	2011		4	1794	2
2024	LP	Post-Proceedings 2011 Workshop-School on Theoretical Computer Science - WEIT 2011	CAVALHEIRO, S. A. C. (Org.) ; FOSS, L. (Org.) ; AGUIAR, M. S. (Org.) ; DIMURO, G. P. (Org.) ; COSTA, A. C. R. (Org.)	2011		18	1794	2
1797	CL	A Multiagent System-Based Solution for Shipment Operations with Priorities in a Container Terminal	Rodrigues, L. M. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R.	2012	28-36	4	1797	2
2025	CL	A Multiagent System-Based Solution for Shipment Operations with Priorities in a Container Terminal	RODRIGUES, L. M. ; DIMURO, G. P. ; COSTA, A. C. R. ; EMMENDORFER, L.	2012	28-36	18	1797	2
1798	CL	On the Problem of Recognizing and Learning Observable Social Exchange Strategies in Open Societies	DIMURO, Graçaliz Pereira ; COSTA, A. C. R. ; Gonçalves, L. V.	2011	66-73	4	1798	2
2027	CL	On the Problem of Recognizing and Learning Observable Social Exchange Strategies in Open Societies	DIMURO, G. P. ; COSTA, A. C. R. ; GONÇALVES, L. V.	2011	66-73	18	1798	2
2028	CL	An Interactional Characterization of Social Functions	COSTA, A. C. R. ; DIMURO, G. P.	2011	74-81	18	1799	2
1800	CL	An Analysis of Two Regulation Mechanisms for Personality-Based Social Exchange Processes	Pereira, D. R. ; Gonçalves, L. V. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R.	2011	96-102	4	1800	2
2029	CL	An Analysis of Two Regulation Mechanisms for Personality-Based Social Exchange Processes	PEREIRA, D. R. ; GONÇALVES, L. V. ; DIMURO, G. P. ; COSTA, A. C. R.	2011	96-102	18	1800	2
1806	CL	Agentes BDI com Percepção Fuzzy na Simulação de um Modelo Presa-Predador Fuzzy	Farias, G. P. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R.	2010	74-85	4	1806	2
2042	CL	Agentes BDI com Percepção Fuzzy na Simulação de um Modelo Presa-Predador Fuzzy	FARIAS, G. P. ; DIMURO, G. P. ; COSTA, A. C. R.	2010	74-85	18	1806	2
1807	CL	Analisando Trocas Sociais Baseadas em Personalidades Através de Cadeias de Markov Intervalares	Farias, G. P. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R.	2010	13-23	4	1807	2
2039	CL	Analisando Trocas Sociais Baseadas em Personalidades Através de Cadeias de Markov Intervalares	FARIAS, G. P. ; DIMURO, G. P. ; COSTA, A. C. R.	2010	13-23	18	1807	2
1808	CL	Introdução da Dimensão Dialógica no Moise+, com Aplicação na Modelagem de Processos de Gestão em uma Universidade Comunitária	Hübner, A. ; COSTA, A. C. R. ; DIMURO, Graçaliz Pereira ; MATTOS, V. ; HERNANDES, S.	2010	138-149	4	1808	2
2043	CL	Introdução da Dimensão Dialógica no Moise+, com Aplicação na Modelagem de Processos de Gestão em uma Universidade Comunitária	HÜBNER, A. ; COSTA, A. C. R. ; DIMURO, G. P. ; MATTOS, V. L. D. ; HERNANDES, S.	2010	138-149	18	1808	2
1809	CL	Uma arquitetura de Agentes BDI Híbridos para Auto-regulação de Trocas Sociais em Sistemas Multiagentes Abertos	Gonçalves, L. V. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R.	2010	-60	4	1809	2
2041	CL	Uma arquitetura de Agentes BDI Híbridos para Auto-regulação de Trocas Sociais em Sistemas Multiagentes Abertos	GONÇALVES, L. V. ; DIMURO, G. P. ; COSTA, A. C. R.	2010	60-73	18	1809	2
1813	CL	Extending the MOISE+ Organizational Model with the Dialogic Dimension	Hübner, A. ; COSTA, A. C. R. ; DIMURO, Graçaliz Pereira	2010	130-135	4	1813	2
2044	CL	Extending the MOISE+ Organizational Model with the Dialogic Dimension	HÜBNER, A. ; COSTA, A. C. R. ; DIMURO, G. P.	2010	130-135	18	1813	2
1815	CL	A Minimal Dynamical MAS Organization Model	COSTA, A. C. R. ; DIMURO, Graçaliz Pereira	2009	419-445	4	1815	2
2045	CL	A Minimal Dynamical MAS Organization Model	COSTA, A. C. R. ; DIMURO, G. P.	2009	419-445	18	1815	2
1816	CL	Semantical Concepts for a Formal Structural Dynamics of Situated Multiagent Systems	COSTA, A. C. R. ; DIMURO, Graçaliz Pereira	2008	139-154	4	1816	2
2046	CL	Semantical Concepts for a Formal Structural Dynamics of Situated Multiagent Systems	COSTA, A. C. R. ; DIMURO, G. P.	2008	139-154	18	1816	2
1818	TC	Modeling Role Interactions in a Social Organization for the Simulation of the Social Production and Management of Urban Ecosystems: the case of San Jerónimo Vegetable Garden of Seville, Spain	SANTOS, F. P. ; RODRIGUES, T. F. ; DIMURO, G. ; Adamatti, D. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R. ; MANUEL, E.	2012	1-16	4	1818	2
1952	TC	Modeling Role Interactions in a Social Organization for the Simulation of the Social Production and Management of Urban Ecosystems: the case of San Jeronimo Vegetable Garden of Seville, Spain	SANTOS, F. C. P. ; RODRIGUES, T. ; DIMURO, G. ; ADAMATTI, D. F. ; DIMURO, G. P. ; COSTA, A. C. R. ; JEREZ, E. M.	2012	1-6	10	1818	2
1819	TC	Analyzing the Evolution of Social Exchange Strategies in Social Preference-based MAS through an Evolutionary Spatial Approach of the Ultimatum Game	MACEDO, L. F. ; DIMURO, Graçaliz Pereira ; AGUIAR, Marilton Sanchotene de ; COSTA, A. C. R. ; COELHO, H. M. F. ; MATTOS, V.	2012	1-16	4	1819	2
2058	TC	Analyzing the Evolution of Social Exchange Strategies in Social Preference-based MAS through an Evolutionary Spatial Approach of the Ultimatum Game	MACEDO, L. F. K. ; DIMURO, G. P. ; AGUIAR, M. S. ; COSTA, A. C. R. ; COELHO, H. ; MATTOS, V. L. D.	2012	1-16	18	1819	2
1820	TC	Elementary Social Functions: Concept and Interrelation to Social Dependence Relations	COSTA, A. C. R. ; DIMURO, Graçaliz Pereira	2012	1-16	4	1820	2
2057	TC	Elementary Social Functions: Concept and Interrelation to Social Dependence Relations	COSTA, A. C. R. ; DIMURO, G. P.	2012	1-16	18	1820	2
1821	TC	Um Modelo de Agente BDI-Fuzzy para Trocas de Serviços Não-Econômicos Baseado na Teoria das Trocas Sociais de Piaget	Farias, G. P. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R.	2012	1-12	4	1821	2
2054	TC	Um Modelo de Agente BDI-Fuzzy para Trocas de Serviços Não-Econômicos Baseado na Teoria das Trocas Sociais de Piaget	FARIAS, G. P. ; DIMURO, G. P. ; COSTA, A. C. R.	2012	1-12	18	1821	2
1822	TC	Um framework para simulação de Políticas Públicas aplicado ao caso da Piracema, sob o olhar da Teoria dos Jogos	SANTOS, I. A. S. ; MOTA, F. P. ; COSTA, A. C. R. ; DIMURO, Graçaliz Pereira	2012	1-12	4	1822	2
2052	TC	Um framework para simulação de Políticas Públicas aplicado ao caso da Piracema, sob o olhar da Teoria dos Jogos	COSTA, A. C. R. ; MOTA, F. P. ; DIMURO, G. P. ; SANTOS, I.	2012	1-12	18	1822	2
1823	TC	Modelando a Organização Social de um SMA para Simulação dos Processos de Produção e Gestão Social de um Ecossistema Urbano: o caso da Horta San Jerónimo da cidade de Sevilla, Espanha	SANTOS, F. P. ; DIMURO, G. ; RODRIGUES, T. F. ; Adamatti, D. ; DIMURO, Graçaliz Pereira ; MANUEL, E. ; COSTA, A. C. R.	2012	93-104	4	1823	2
1941	TC	Modelando a Organização Social de um SMA para Simulação dos Processos de Produção e Gestão Social de um Ecossistema Urbano: o caso da Horta San Jerónimo da cidade de Sevilla, Espanha	SANTOS, F. C. P. ; RODRIGUES, T. ; DIMURO, G. ; ADAMATTI, D. F. ; JEREZ, E. M. ; DIMURO, G. P. ; COSTA, A. C. R.	2012	1-12	10	1823	2
1824	TC	Regulation of Social Exchanges in Open MAS: the problem of reciprocal conversions between POMDPs and HMMs	DIMURO, Graçaliz Pereira ; COSTA, A. C. R.	2012	1-8	4	1824	2
2047	TC	Regulation of Social Exchanges in Open MAS: the problem of reciprocal conversions between POMDPs and HMMs	DIMURO, G. P. ; COSTA, A. C. R.	2012	1-8	18	1824	2
1827	TC	Um Modelo Multiagente para Carregamento Compartilhado com Prioridades em um Terminal de Contêineres: Combinando o Problema da Mochila com PDMs	Rodrigues, L. M. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R.	2011	51-62	4	1827	2
2061	TC	Um Modelo Multiagente para Carregamento Compartilhado com Prioridades em um Terminal de Conêineres: Combinando o Problema da Mochila com PDMs	RODRIGUES, L. M. ; DIMURO, G. P. ; COSTA, A. C. R. ; EMMENDORFER, L.	2011	51-62	18	1827	2
1828	TC	Um Estudo para uma Proposta de Modelos de Tomada de Decisão em Interações Estratégicas para Sistemas Multiagentes em Ambientes de Informação Imperfeita	BRIAO, S. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R.	2011	190-200	4	1828	2
2066	TC	Um Estudo para uma Proposta de Modelos de Tomada de Decisão em Interações Estratégicas para Sistemas Multiagentes em Ambientes de Informação Imperfeita	BRIÃO, S. L. ; DIMURO, G. P. ; COSTA, A. C. R.	2011	190-200	18	1828	2
1829	TC	Towards Developmental Turing Machines	COSTA, S. A. ; COSTA, A. C. R. ; DIMURO, Graçaliz Pereira	2011	152-163	4	1829	2
2065	TC	Towards Developmental Turing Machines	COSTA, S. A. ; COSTA, A. C. R. ; DIMURO, G. P.	2011	152-163	18	1829	2
1831	TC	Agentes BDI com Percepção Fuzzy na Simulação de um Modelo Presa-Predador Fuzzy	Farias, G. P. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R.	2010	1-12	4	1831	2
2069	TC	Agentes BDI com Percepção Fuzzy na Simulação de um Modelo Presa-Predador Fuzzy	FARIAS, G. P. ; DIMURO, G. P. ; COSTA, A. C. R.	2010	1-12	18	1831	2
1832	TC	Introdução da Dimensão Dialógica no Moise+, com Aplicação na Modelagem de Processos de Gestão em uma Universidade Comunitária	Hübner, A. ; COSTA, A. C. R. ; DIMURO, Graçaliz Pereira ; MATTOS, V. ; HERNANDES, S. ; MAILANGE, M.	2010	65-76	4	1832	2
2070	TC	Introdução da Dimensão Dialógica no Moise+, com Aplicação na Modelagem de Processos de Gestão em uma Universidade Comunitária	HÜBNER, A. ; COSTA, A. C. R. ; DIMURO, G. P. ; MATTOS, V. L. D. ; HERNANDES, S. ; Mailange, M.	2010	65-76	18	1832	2
1836	TC	A Dialogic Dimension for the MOISE+ Organizational Model	Hübner, A. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R. ; MATTOS, V.	2010	23/21-23/26	4	1836	2
2071	TC	A Dialogic Dimension for the MOISE+ Organizational Model	HÜBNER, A. ; DIMURO, G. P. ; COSTA, A. C. R. ; MATTOS, V. L. D.	2010	23/21-23/26	18	1836	2
1837	TC	BDI Agents with Fuzzy Perception for Simulating Decision Making in Environments with Imperfect Information	Farias, G. P. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R.	2010	41/23-41/30	4	1837	2
2072	TC	BDI Agents with Fuzzy Perception for Simulating Decision Making in Environments with Imperfect Information	FARIAS, G. P. ; DIMURO, G. P. ; COSTA, A. C. R.	2010	41/23-41/30	18	1837	2
1838	TC	BDI Agents with Fuzzy Perception	Farias, G. P. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R.	2010	742-751	4	1838	2
2073	TC	BDI Agents with Fuzzy Perception	FARIAS, G. P. ; DIMURO, G. P. ; COSTA, A. C. R.	2010	742-751	18	1838	2
1839	TC	On the Problem of Recognizing and Learning Observable Social Exchange Strategies in Open Societies	DIMURO, Graçaliz Pereira ; COSTA, A. C. R. ; Gonçalves, L. V.	2010	140-152	4	1839	2
2074	TC	Recognizing and Learning Observable Social Exchange Strategies in Open Societies	DIMURO, G. P. ; COSTA, A. C. R. ; GONÇALVES, L. V.	2010	140-152	18	1839	2
1840	TC	An Interactional Characterization of Social Functions	COSTA, A. C. R. ; DIMURO, Graçaliz Pereira	2010	105-117	4	1840	2
2076	TC	An Interactional Characterization of Social Functions	COSTA, A. C. R. ; DIMURO, G. P.	2010	105-117	18	1840	2
1841	TC	Sobre Números Fuzzy Intervalares	DIMURO, Graçaliz Pereira ; COSTA, A. C. R. ; MUSSI, R. L.	2010	162-169	4	1841	2
2075	TC	Sobre Números Fuzzy Intervalares	DIMURO, G. P. ; COSTA, A. C. R. ; MUSSI, R. L.	2010	162-169	18	1841	2
1845	TC	Toward a Semantical Model of Organization Growth for Multiagent Systems	DIMURO, Graçaliz Pereira ; COSTA, A. C. R.	2009	120-129	4	1845	2
2081	TC	Toward a Semantical Model of Organization Growth for Multiagent Systems	DIMURO, G. P. ; COSTA, A. C. R.	2009	120-129	18	1845	2
1847	TC	Fuzzy Evaluation of Social Exchanges Between Personality-based Agents	DIMURO, Graçaliz Pereira ; SANTOS, André Vinícius dos ; BEDREGAL, Benjamin René Callejas ; COSTA, A. C. R.	2009	451-462	4	1847	2
2083	TC	Fuzzy Evaluation of Social Exchanges Between Personality-based Agents	DIMURO, G. P. ; SANTOS, A. V. ; BEDREGAL, B. R. C. ; COSTA, A. C. R.	2009	451-462	18	1847	2
1848	TC	A Formal Notion of Objective Expectations in the Context of Multiagent Systems Routines	COSTA, A. C. R. ; DIMURO, Graçaliz Pereira ; DUGDALE, J. ; DEMAZEAU, Y.	2009	367-378	4	1848	2
2084	TC	A Formal Notion of Objective Expectations in the Context of Multiagent Systems Routines	COSTA, A. C. R. ; DIMURO, G. P. ; DUGDALE, J. ; DEMAZEAU, Y.	2009	367-378	18	1848	2
1851	TC	Estendendo o Modelo Organizacional MOISE+ com a Dimensão Dialógica	Hübner, A. ; COSTA, A. C. R. ; DIMURO, Graçaliz Pereira	2009	1-6	4	1851	2
2086	TC	Estendendo o Modelo Organizacional MOISE+ com a Dimensão Dialógica	HÜBNER, A. ; COSTA, A. C. R. ; DIMURO, G. P.	2009	18-23	18	1851	2
1852	TC	Introducing Service Schemes and Systems Organization in the Theory of Interactive Computation	COSTA, A. C. R. ; DIMURO, Graçaliz Pereira	2008	87-96	4	1852	2
2087	TC	Introducing Service Schemes and Systems Organization in the Theory of Interactive Computation	COSTA, A. C. R. ; DIMURO, G. P.	2008	87-96	18	1852	2
1853	TC	Constructing BDI Plans from Optimal POMDP Policies, with an Application to AgentSpeak Programming	Pereira, D. R. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R.	2008	240-249	4	1853	2
2096	TC	Constructing BDI Plans from Optimal POMDP Policies, with an Application to AgentSpeak Programming	PEREIRA, D. R. ; GONÇALVES, L. V. ; DIMURO, G. P. ; COSTA, A. C. R.	2008	240-249	18	1853	2
1854	TC	Contrasting Two Regulation Mechanisms for Personality-based Social Exchange Processes	Pereira, D. R. ; Gonçalves, L. V. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R.	2008	1-12	4	1854	2
2097	TC	Contrasting Two Regulation Mechanisms for Personality-based Social Exchange Processes	PEREIRA, D. R. ; GONÇALVES, L. V. ; DIMURO, G. P. ; COSTA, A. C. R.	2008	1-12	18	1854	2
1856	TC	Towards the Self-regulation of Personality-based Social Exchange Processes in Multiagent Systems	Pereira, D. R. ; Gonçalves, L. V. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R.	2008	113-123	4	1856	2
2094	TC	Towards the Self-regulation of Personality-based Social Exchange Processes in Multiagent Systems	PEREIRA, D. R. ; GONÇALVES, L. V. ; DIMURO, G. P. ; COSTA, A. C. R.	2008	113-123	18	1856	2
1862	TC	TATUBOT Sistema Robótico de Inspeção para Linhas de Distribuição Elétrica Subterrâneas	BOTELHO, S. S. C. ; V. Oliveira ; N. D. Lopes Fº ; MELLO JÚNIOR, C. D. ; E. Estrada ; M. P. Galeriano ; U. B. Correa ; P. Drews Jr.	2008		6	1862	2
2006	TC	Tatubot - Sistema Robótico de Inspeção para Linhas de Distribuição Elétrica Subterrâneas	BOTELHO, S. S. C. ; DUARTE Filho, N. L. ; OLIVEIRA, V. M. ; MELLO JR., C. D. ; ESTRADA, E. S. D. ; GALERIANO, M. P. ; CORREA, U. B. ; DREWS JR., P.	2008		14	1862	2
1863	TC	TATUBOT ROBOTIC SYSTEM FOR INSPECTION OF UNDERGROUNDED CABLE SYSTEM	BOTELHO, S. S. C. ; GONÇALVES, E. M. N. ; MELLO JÚNIOR, C. D. ; ESTRADA, E. S. D. ; SOUTO Jr., H. D. ; SANTOS, T. S.	2008		6	1863	2
1985	TC	TATUBOT Robotic System for Inspection of Undergrounded Cable System	GONÇALVES, E. M. N. ; BOTELHO, S. S. C. ; OLIVEIRA, V. M. ; MELLO, C. ; ESTRADA, E.	2008		11	1863	2
1864	TC	TATUBOT Robotic System for Inspection of Undergrounded Cable	GONÇALVES, E. M. N. ; ESTRADA, E. S. D. ; SOUTO Jr., H. D. ; V. Oliveira ; BOTELHO, S. S. C. ; MELLO JÚNIOR, C. D.	2008		6	1864	2
2007	TC	TATUBOT ROBOTIC SYSTEM FOR INSPECTION OF UNDERGROUNDED CABLE SYSTEM	BOTELHO, S. S. C. ; Gonçalves, E. M. N. ; MELLO JR., C. D. ; ESTRADA, E. S. D. ; SOUTO JR., H. D. ; ALMEIDA, R. ; SANTOS, T. S.	2008		14	1864	2
1865	AP	Projeto de um Bloco de Memória SRAM em Tecnologias CMOS Nanométricas de 16nm	GOMES, I. A. C. ; MEINHARDT, Cristina ; BUTZEN, P. F.	2012	31-40	7	1865	2
1869	TC	Full Adders Architectures Evaluation for 32nm Technology	SILVA, A. N. ; MACHADO, I. ; MEINHARDT, Cristina ; BUTZEN, P. F.	2012	1-4	7	1869	2
2193	TC	Full Adders Architectures Evaluation for 32nm Technology	SILVA, A. N. ; MACHADO, I. ; MEINHARDT, C. ; BUTZEN, P. F.	2012	1-4	27	1869	2
1870	TC	Evaluating the Efficacy of Low Power Process to Design Low Power Circuits	NUNES, C. S. ; SILVA, A. N. ; GOMES, I. A. C. ; MEINHARDT, Cristina ; BUTZEN, P. F.	2012	1-4	7	1870	2
2194	TC	Evaluating the Efficacy of Low Power Process to Design Low Power Circuits	NUNES, C. S. ; SILVA, A. N. ; GOMES, I. A. C. ; MEINHARDT, C. ; BUTZEN, P. F.	2012	1-4	27	1870	2
1885	AP	An Adaption of OSA-CBM Architecture for Human-Computer Interaction through Mixed Interface	ESPÍNDOLA, Danúbia Bueno ; FUMAGALLI, L. ; GARETTI, M. ; BOTELHO, Silvia Silva da Costa ; PEREIRA, Carlos Eduardo	2011	485-490	8	1885	2
2303	AP	An Adaption of OSA-CBM Architecture for Human-Computer Interaction through Mixed Interface.	ESPÍNDOLA, D. ; FUMAGALLI ; GARETTI ; Carlos Eduardo ; BOTELHO, S. S. C.	2011	485-490	34	1885	2
1888	TC	A Engenharia de Serviço na Indústria Naval	BOTELHO, Silvia S da C ; DUARTE, Nelson ; ESPÍNDOLA, Danúbia Bueno ; Carvallho, J. T.	2012		8	1888	2
2146	TC	A Engenharia de Serviço na Indústria Naval	BOTELHO, Silvia Silva ; DUARTE FILHO, Nelson Lopes ; ESPINDOLA, Danubia ; OLIVEIRA, D. P. ; CARVALHO, J.	2012	1-6	24	1888	2
1889	TC	Internet of Things to Provide Scalability in Product-Service Systems	ESPÍNDOLA, Danúbia Bueno ; DUARTE, Nelson ; BOTELHO, Silvia S da C ; Carvallho, J. T. ; PEREIRA, Carlos Eduardo	2012	32-40	8	1889	2
2339	TC	Internet of Things to Provide Scalability in Product-Service Systems	ESPÍNDOLA, D. ; DUARTE FILHO, N. L. ; BOTELHO, S. S. C. ; Tyska, j. ; pereira, c. e.	2012	1-6	34	1889	2
1892	TC	Using Mixed Reality in the Visualization of Maintenance Processes	ESPÍNDOLA, Danúbia Bueno ; PEREIRA, Carlos Eduardo ; HENRIQUES, Renato Ventura Bayan ; BOTELHO, Silvia Silva da Costa	2010	35-40	8	1892	2
2363	TC	Using Mixed Reality in the Visualization of Maintenance Processes	ESPÍNDOLA, D. ; pereira, c. e. ; HENRIQUES, Renato Ventura Bayan ; BOTELHO, S. S. C.	2010	35-40	34	1892	2
1893	TC	Uma Proposta para Visualização Aumentada em Tempo_real Aplicada a Indústria. In:	ESPÍNDOLA, Danúbia Bueno ; PEREIRA, Carlos Eduardo ; HENRIQUES, Renato Ventura Bayan ; BOTELHO, Silvia Silva da Costa	2010	163-168	8	1893	2
2362	TC	Uma Proposta para Visualização Aumentada em Tempo_real Aplicada a Indústria	ESPÍNDOLA, D. ; pereira, c. e. ; HENRIQUES, Renato Ventura Bayan ; BOTELHO, S. S. C.	2010	163-168	34	1893	2
1935	CL	Detectando Padrões Comportamentais de Agentes Através de Árvores de Decisão	SILVEIRA, J. A. ; PAES, T. L. ; EMMENDORFER, L. R. ; ADAMATTI, D. F.	2010	204-208	10	1935	2
2120	CL	Detectando Padrões Comportamentais de Agentes Através de Árvores de Decisão	PAES, T. ; SILVEIRA, J. ; ADAMATTI, D. F. ; EMMENDORFER, L. R.	2010	204-208	22	1935	2
2049	TC	Modelando a Organização Social de um SMA para Simulação dos Processos de Produção e Gestão Social de um Ecossistema Urbano: o caso da Horta San Jerónimo da cidade de Sevilla, Espanha	SANTOS, F. C. P. ; DIMURO, G. ; RODRIGUES, T. F. ; ADAMATTI, D. F. ; DIMURO, G. P. ; Jerez, E. de M. ; COSTA, A. C. R.	2012	93-104	18	1823	2
1942	TC	Um Modelo de Ferramenta Computacional Aplicada ao Processo de Aprendizagem Especial: As Tecnologias Assistivas	LUZ JUNIOR, D. M. ; GUIMARAES, M. ; ADAMATTI, D. F. ; BARWALDT, R. ; FELIPE, C. I. M.	2012	1-10	10	1942	2
2259	TC	Um Modelo de Ferramenta Computacional Aplicada ao Processo de Aprendizagem Especial: As Tecnologias Assistivas	BARWALDT, Regina ; ADAMATTI, D. F. ; FELIPPE, C. I. M. ; GUIMARAES, M. ; LUZ JUNIOR, D. M.	2012	1-10	30	1942	2
1943	TC	Formação Continuada: Preparando Professores para o Atendimento Educacional Especializado Através das Salas de Recursos Multifuncionais	BARWALDT, R. ; ADAMATTI, D. F. ; FELIPE, C. I. M.	2012	1-10	10	1943	2
2260	TC	Formação Continuada: Preparando Professores para o Atendimento Educacional Especializado Através das Salas de Recursos Multifuncionais	FELIPPE, C. I. M. ; BARWALDT, Regina ; ADAMATTI, D. F.	2012	1-2	30	1943	2
1945	TC	The Accessibility at University by Assistive Technologies	ADAMATTI, D. F. ; BARWALDT, R. ; FELIPE, C. I. M.	2012	1-8	10	1945	2
2261	TC	The Accessibility at University by Assistive Technologies	ADAMATTI, D. ; BARWALDT, Regina ; FELIPPE, C. I. M.	2012		30	1945	2
1946	TC	Tecnologias Assistivas: Recursos e Serviços Utilizados para a Inclusão Sócio-Digital de Pessoas com Deficiências	LUZ JUNIOR, D. M. ; HECKLER, I. R. ; ADAMATTI, D. F. ; BARWALDT, R. ; FELIPE, C. I. M.	2012	1-6	10	1946	2
2262	TC	Tecnologias Assistivas: Recursos e Serviços Utilizados para a Inclusão Sócio-Digital de Pessoas com Deficiências	LUZ JUNIOR, D. M. ; SALOMAO, H. L. R. ; BARWALDT, Regina ; ADAMATTI, D. F. ; FELIPPE, C. I. M.	2012		30	1946	2
2059	TC	Modeling Role Interactions in a Social Organization for the Simulation of the Social Production and Management of Urban Ecosystems: the case of San Jerónimo Vegetable Garden of Seville, Spain	SANTOS, F. C. P. ; RODRIGUES, T. F. ; DIMURO, G. ; ADAMATTI, D. F. ; DIMURO, G. P. ; COSTA, A. C. R. ; Jerez, E. de M.	2012	1-16	18	1818	2
1954	TC	Um sistema para previsão de impactos gerados pela instalação de indústrias e sua influência sobre ecossistemas costeiros no extremo sul do Brasil	THOMASI, C. D. ; NUNES, G. ; TOLEGO, R. ; JUGUEIRO, M. ; TEIXEIRA, P. ; ADAMATTI, D. F. ; TAGLIANI, C.	2011	1-10	10	1954	2
2009	TC	Um sistema para previsão de impactos gerados pela instalação de indústrias e sua influência sobre ecossistemas costeiros no extremo sul do Brasil	THOMASI, C. D. ; NUNES, G. A. L. ; TOLEDO, R. G. A. ; JUGUEIRO, M. M. ; TEIXEIRA, P. S. ; TAGLIANI, C. R. A. ; ADAMATTI, D. F.	2011		16	1954	2
1958	TC	Tecnologias Assistivas e Pessoas com Necessidades Especiais: Desenvolvimento Sustentável	BARWALDT, R. ; ADAMATTI, D. F. ; FELIPE, C. I. M.	2011		10	1958	2
2263	TC	Tecnologias Assistivas e Pessoas com Necessidades Especiais: Desenvolvimento Sustentável	BARWALDT, Regina ; ADAMATTI, D. F. ; FELIPPE, C. I. M.	2011		30	1958	2
1959	TC	Tecnologias Assistivas e Acessibilidade para Pessoas com Necessidade Especiais em Rio Grande	BARWALDT, R. ; ADAMATTI, D. F. ; FELIPE, C. I. M.	2011		10	1959	2
2264	TC	Tecnologias Assistivas e Acessibilidade para Pessoas com Necessidade Especiais em Rio Grande	BARWALDT, Regina ; ADAMATTI, D. F. ; FELIPPE, C. I. M.	2011		30	1959	2
1961	TC	Poder de Captura das Árvores de Decisão para o Comportamento de Agentes	SILVEIRA, J. A. ; PAES, T. L. ; EMMENDORFER, L. R. ; ADAMATTI, D. F.	2010	1-4 - CDROM	10	1961	2
2123	TC	Poder de Captura das Árvores de Decisão para o Comportamento de Agentes	PAES, T. ; SILVEIRA, J. ; ADAMATTI, D. F. ; EMMENDORFER, L. R.	2010	1-6	22	1961	2
1964	TC	Effectiveness of Decision Trees for Detecting the Behavior of Agents	ADAMATTI, D. F. ; SILVEIRA, J. A. ; PAES, T. L. ; EMMENDORFER, L. R.	2010		10	1964	2
2124	TC	Effectiveness of Decision Trees for Detecting the Behavior of Agents	ADAMATTI, D. F. ; PAES, T. ; SILVEIRA, J. ; EMMENDORFER, L. R.	2010	1-6	22	1964	2
1982	TC	Autonomous navigation for underground energy line inspection robot	BOTELHO, S. S. C. ; ESTRADA, E. ; GONÇALVES, E. M. N. ; OLIVEIRA, V. M.	2010	1-6	11	1982	2
2000	TC	Autonomous navigation for underground energy line inspection robot	ESTRADA, E. S. D. ; Silveira, L. ; Gonçalves, E. M. N. ; OLIVEIRA, V. M. ; BOTELHO, S. S. C.	2010	1-6	14	1982	2
1983	TC	Uma Arquitetura para Navegação Autônoma de Robôs Reais e Simulados para Inspeção de Linhas de Distribuição de Energia Subterrâneas	GONÇALVES, E. M. N. ; ESTRADA, E. ; ALMEIDA, Renan Rosado de ; BOTELHO, S. S. C.	2009		11	1983	2
2003	TC	Uma arquitetura para navegação autônoma de robôs reais e simulados para inspeção de linhas de distribuição de energia subterrâneas	ESTRADA, E. S. D. ; ALMEIDA, R. ; BOTELHO, S. S. C. ; GULES, R. ; OLIVEIRA, V. M. ; Silveira, L. ; Gonçalves, E. M. N.	2009		14	1983	2
1984	TC	SIFT and Topologic Maps applied to robotic SLAM in Underwater Environment	DREWS JR., P. ; MEDEIROS, Mariane ; BOTELHO, S. S. C. ; GONÇALVES, E. M. N.	2008		11	1984	2
2250	TC	SIFT and Topologic Maps applied to robotic SLAM in Underwater Environment	DREWS JR, P. L. J. ; BOTELHO, S. S. C. ; MEDEIROS, M. M. ; GONCALVES, E. M. N.	2008	1-6	28	1984	2
2005	TC	TATUBOT - Robotic System for Inspection of Undergrounded Cable System	ESTRADA, E. S. D. ; MELLO JR., C. D. ; Gonçalves, E. M. N. ; Oliveira, G. L. ; ALMEIDA, R. ; BOTELHO, S. S. C.	2008		14	1863	2
1986	TC	Mixed Reality RoboCup Category - An Overview of FURGBOL-PV Contributions	MEDEIROS, Mariane ; COLARES, Rafael Gonçalves ; ALMEIDA, Renan Rosado de ; SIMAS, G. M. ; GONÇALVES, E. M. N. ; BOTELHO, S. S. C.	2008	3-7	11	1986	2
2386	TC	Mixed Reality RoboCup Category - An overview of FURGBOL-PV Contributions	MEDEIROS, M. M. ; COLARES, R. ; ALMEIDA, R. R. ; SIMAS, G. ; GONCALVES, E. ; BOTELHO, S. S. C.	2008	1-6	34	1986	2
1998	AP	Arquitetura de navegação autônoma de linhas subterrâneas de distribuição de energia	ESTRADA, E. S. D. ; Silveira, L. ; CORREA, U. B. ; OLIVEIRA, V. M. ; BOTELHO, S. S. C.	2008	32-45	14	1998	2
2318	AP	Arquitetura de navegação autônoma de linhas subterrâneas de distribuição de energia	Estrada, E. ; ALMEIDA, R. R. ; CORREA, U. B. ; OLIVEIRA, V. ; BOTELHO, S. S. C.	2008	32-45	34	1998	2
2154	TC	Autonomous navigation for underground energy line inspection robot	ESTRADA, Emanuel ; Silveira, L. ; Gonçalves, E. ; DUARTE FILHO, Nelson Lopes ; OLIVEIRA, V. ; BOTELHO, Silvia Silva	2010	1-6	24	1982	2
2001	TC	Sistema de Navegação para um Robô de Inspeção de Linhas Subterrâneas de Distribuição	ESTRADA, E. S. D. ; Silveira, L. ; OLIVEIRA, V. M. ; BOTELHO, S. S. C.	2010	2698-2705	14	2001	2
2359	TC	Sistema de Navegação para um Robô de Inspeção de Linhas Subterrâneas de Distribuição	Estrada, E. ; Silveira, L. ; OLIVEIRA, V. ; BOTELHO, S. S. C.	2010	1-6	34	2001	2
2374	TC	Uma arquitetura para navegação autônoma de robôs reais e simulados para inspeção de linhas de distribuição de energia subterrâneas	GONCALVES, E. ; Estrada, E. ; Gules, R. ; BOTELHO, S. S. C. ; Silveira, L. ; OLIVEIRA, V.	2009	1-6	34	1983	2
2004	TC	A Mobile System for Duct Inspection	BOTELHO, S. S. C. ; ESTRADA, E. S. D. ; Gonçalves, E. M. N. ; GULES, R. ; MELLO JR., C. D. ; OLIVEIRA, V. M. ; SANTOS, T. S. ; SOUTO JR., H. D. ; ALMEIDA, R.	2009		14	2004	2
2428	TC	A Mobile System for Duct Inspection	BOTELHO, S. S. C. ; Estrada, E. ; SOUTO JR., H. ; ALMEIDA, R. ; OLIVEIRA, V. M. ; Gonçalves, E. N. ; Mello Jr., C. D. ; Santos, T. ; Gules R.	2009		37	2004	2
2381	TC	Robotic System for Inspection of Undergrounded Cable System	Estrada, E. ; MELLO, C. ; GONCALVES, E. ; LEIVAS, G ; ALMEIDA, R. R. ; BOTELHO, S. S. C.	2008	1-6	34	1863	2
2156	TC	TATUBOT - Sistema Robótico de Inspeção para Linhas de Distribuição Elétrica Subterrâneas	BOTELHO, Silvia Silva ; DUARTE FILHO, Nelson Lopes ; OLIVEIRA, Vinícius Menezes de ; MELLO JR, Claudio Dornelles ; ESTRADA, Emanuel ; GALERIANO, Marcelo ; CORREA, Ulisses ; DREWS, Paulo	2008	100-105	24	1862	2
2385	TC	TATUBOT Robotic System for Inspection of Undergrounded Cable System	MELLO, C. ; GONÇALVES, L. ; Estrada, E. ; LEIVAS, G ; ALMEIDA, R. R. ; BOTELHO, S. S. C. ; THIAGO,S.	2008	1-6	34	1864	2
2101	TC	Unconstrained face recognition using MRF priors and manifold traversing	RODRIGUES, R. N. ; SCHROEDER, Greyce Nogueira ; Corso, J.J ; Govindaraju, Venu	2009		19	2101	2
2272	TC	Unconstrained face recognition using MRF priors and manifold traversing	Rodrigues, Ricardo N. ; Greyce N. Schroeder ; Corso, J.J ; Govindaraju, Venu	2009		31	2101	2
2102	TC	Desenvolvimento de uma Plataforma Multidisciplinar para Autoria de Jogos 3D Interativos e Educativos	PINTO, I. M. ; BOTELHO, Silvia da Costa ; SOUZA, R. C. ; GOULART, T. S. ; COLARES, R. ; CAMPOS, R. L.	2009		20	2102	2
2371	TC	DESENVOLVIMENTO DE UMA PLATAFORMA MULTIDISCIPLINAR PARA AUTORIA DE JOGOS 3D INTERATIVOS E EDUCATIVOS	PINTO, Ivete ; Sonego, T. ; Souza, R. ; COLARES, R. ; BOTELHO, S. S. C.	2009	1-6	34	2102	2
2103	TC	SABERLÂNDIA: Plataforma Lúdica integrando robótica e multimídia para educação	PINTO, I. M. ; BOTELHO, Silvia da Costa ; SOUZA, R. C. ; GOULART, T. S. ; COLARES, R. ; CAMPOS, R. L.	2008		20	2103	2
2388	TC	Saberlândia: plataforma lúdica integrando robótica e multimídia para educação	PINTO, Ivete ; BOTELHO, S. S. C. ; Souza, R. ; Sonego, T. ; COLARES, R.	2008	1-8	34	2103	2
2104	TC	Plataforma Saberlândia: Integrando Robótica e Multimídia no Desenvolvimento de Jogos Educacionais	PINTO, I. M. ; BOTELHO, Silvia da Costa ; SOUZA, R. C. ; GOULART, T. S. ; COLARES, R. ; CAMPOS, R. L.	2008		20	2104	2
2387	TC	Plataforma Saberlândia: Integrando Robótica e Multimídia no Desenvolvimento de Jogos Educacionais	PINTO, Ivete ; BOTELHO, S. S. C. ; Souza, R. ; COLARES, R. ; CAMPOS, R. L.	2008	177-186	34	2104	2
2139	AP	An immersive and collaborative visualization system for digital manufacturing	Duarte Filho, Nelson ; Costa Botelho, Silvia ; Tyska Carvalho, Jonata ; Botelho Marcos, Pedro ; Queiroz Maffei, Renan ; Remor Oliveira, Rodrigo ; Ruas Oliveira, Rodrigo ; Alves Hax, Vinicius ; DUARTE FILHO, Nelson Lopes	2010	1253-1261	24	2139	2
2305	AP	An Immersive and Collaborative Visualization Systems for Digital Manufacturing	DUARTE, N. ; BOTELHO, S. S. C. ; Tyska, j. ; P. botelho ; R. maffei ; R. Oliveira ; v. hax	2010	1	34	2139	2
2140	AP	Um Framework para Memória Compartilhada Distribuída e Eestudo de Caso em Aplicações de Geociências sobre Clusters de Computadores	VIEIRA, Jeison ; BOTELHO, Silvia Silva ; DUARTE FILHO, Nelson Lopes	2010	1-17	24	2140	2
2309	AP	Um Framework para Memória Compartilhada Distribuída e Eestudo de Caso em Aplicações de Geociências sobre Cluster de Computadores	Vieira, J. ; BOTELHO, S. S. C. ; DUARTE, N.	2010	1-6	34	2140	2
2141	AP	A general purpose cave-like system for visualization of animated and 4D cad modeling	DUARTE FILHO, Nelson Lopes ; BOTELHO, Silvia Silva ; CARVALHO, J. ; MARCOS, Pedro ; Maffei, Renan ; OLIVEIRA, Rodrigo Ruas ; HAX, V.	2008	5-19	24	2141	2
2317	AP	A general purpose cave-like system for visualization of animated and 4D cad modeling	DUARTE, N. ; BOTELHO, S. S. C. ; Tyska, j. ; P. botelho ; R. maffei ; R. Oliveira ; v. hax	2008	5-19	34	2141	2
2142	LP	ANAIS DO NAVTEC 2012 - Conferência Internacional em Tecnologia Naval e Offshore: Ciência e Inovação	PINTO, E.C. (Org.) ; GIROLDO, D. (Org.) ; DUARTE FILHO, Nelson Lopes (Org.) ; BOTELHO, Silvia Silva da Costa (Org.)	2012		24	2142	2
2322	LP	Conferência Internacional em Tecnologia Naval e Offshore: Ciência e Inovação	DUARTE, N. (Org.) ; Botelho, Silvia S. C. (Org.) ; ESTEFEN, S. (Org.) ; E. C. PINTO (Org.) ; Giroldo, D (Org.)	2012		34	2142	2
2143	CL	A General Purpose Cave-like System for Visualization of Animated and 4D CAD Modeling	DUARTE FILHO, Nelson Lopes ; CARVALHO, J. ; MARCOS, Pedro ; Maffei, Renan ; OLIVEIRA, Rodrigo Ruas ; HAX, V. ; BOTELHO, Silvia Silva da Costa	2010	82-87	24	2143	2
2329	CL	A General Purpose Cave-like System for Visualization of Animated and 4D CAD Modeling	Duarte Filho, Nelson L. ; Tyska, j. ; P. botelho ; R. maffei ; R. Oliveira ; v. hax ; Botelho, Silvia S. C.	2010	82-87	34	2143	2
2144	CL	A Framework for Distributed Shared Memory - Case Study in Geoscience Applications on Clusters of Computers	DUARTE FILHO, Nelson Lopes ; VIEIRA, Jeison ; BOTELHO, Silvia Silva da Costa	2010	88-93	24	2144	2
2330	CL	A Framework for Distributed Shared Memory - Case Study in Geoscience Applications on Clusters of Computers	DUARTE, N. ; Vieira, J. ; Botelho, Silvia S. C.	2010	88-93	34	2144	2
2145	CL	An Automated Platform for Immersive and Collaborative Visualization of Industrial Models. Engineering of Complex Computer Systems. 1ed	DUARTE FILHO, Nelson Lopes ; BOTELHO, Silvia Silva da Costa ; CARVALHO, J. ; MARCOS, Pedro ; Maffei, Renan ; OLIVEIRA, Rodrigo Ruas ; HAX, V.	2009	258-264	24	2145	2
2331	CL	An Automated Platform for Immersive and Collaborative Visualization of Industrial Models. Engineering of Complex Computer Systems	DUARTE, N. ; Botelho, Silvia S. C. ; Tyska, j. ; P. botelho ; R. maffei ; R. Oliveira	2009	258-264	34	2145	2
2332	TC	A Engenharia de Serviço na Indústria Naval	Botelho, Silvia S. C. ; DUARTE, N. ; ESPÍNDOLA, D. ; Oliveira, D. P. ; Tyska, j.	2012		34	1888	2
2147	TC	Um Sistema Integrado para Controle de Projetos na Construção Naval com Análise de Risco	PIRES, F. ; ASSIS, L. F. ; DUARTE FILHO, Nelson Lopes ; BOTELHO, S.	2012	1-4	24	2147	2
2334	TC	Um Sistema Integrado para Controle de Projetos na Construção Naval com Análise de Risco	Pires, F. ; Assis, L. F. ; DUARTE, N. ; Botelho, Silvia S. C.	2012		34	2147	2
2224	TC	Space D*: Um Algoritmo para Path Planning Multi-Robôs	SILVEIRA, Luan ; MAFFEI, R. Q. ; BOTELHO, S. S. C. ; DREWS JR, P. L. J. ; BICHO, A. L. ; DUARTE FILHO, N. L. ; LONGARAY, M. M. ; ALMEIDA, F. R.	2011		28	1759	2
2227	TC	D*-Space: planejando caminhos para sistemas multi-robôs	SILVEIRA, Luan ; MAFFEI, R. Q. ; BOTELHO, S. S. C. ; DREWS JR, P. L. J. ; DUARTE FILHO, N. L. ; BICHO, A. L. ; LONGARAY, M. M. ; ALMEIDA, F. R.	2011		28	1760	2
2150	TC	Hyper-Environments: A Different Way to Think about IoT	CARVALHO, J. ; SANTOS, Rafael ; BOTELHO, Silvia Silva ; Duarte Filho, Nelson L. ; OLIVEIRA, Rodrigo Ruas ; Santos, E.	2011	25-32	24	2150	2
2256	TC	Hyper-Environments: A Different Way to Think about IoT	CARVALHO, J. T. ; DOSSANTOS, R ; BOTELHO, S. S. C. ; DUARTE FILHO, Nelson Lopes ; OLIVEIRA, R. R. ; SANTOS, E.	2011	25-32	29	2150	2
2151	TC	SAP-RISCO4D Sistemas de Avaliação 4D para Projetos na Construção Naval	OLIVEIRA, D. P. ; BOTELHO, Silvia Silva ; DUARTE FILHO, Nelson Lopes	2010	1-6	24	2151	2
2365	TC	SAP-RISCO4D Sistemas de Avaliação 4D para Projetos na Construção Naval	Oliveira, D. P. ; BOTELHO, S. S. C. ; DUARTE, N.	2010	1-6	34	2151	2
2152	TC	Modelagem de um Sistema de Visualização 4D na Construção Naval	OLIVEIRA, D. P. ; BOTELHO, Silvia Silva ; DUARTE FILHO, Nelson Lopes	2010	1-6	24	2152	2
2364	TC	Modelagem de um Sistema de Visualização 4D na Construção Naval	Oliveira, D. P. ; BOTELHO, S. S. C. ; DUARTE, N.	2010	1-6	34	2152	2
2244	TC	Visual Odometry and Mapping for Underwater Autonomous Vehicles	BOTELHO, S. S. C. ; OLIVEIRA, G. L. ; DREWS JR, P. L. J. ; FIGUEIREDO, M.	2009	1-6	28	2244	2
2153	TC	SAP-RISCO4D: UM SISTEMA DE VISUALIZAÇÃO 4D PARA ACOMPANHAMENTO DE PROJETOS NA CONSTRUÇÃO NAVAL	OLIVEIRA, D. P. ; BOTELHO, Silvia Silva ; DUARTE FILHO, Nelson Lopes	2010	1-6	24	2153	2
2366	TC	SAP-RISCO4D: UM SISTEMA DE VISUALIZAÇÃO 4D PARA ACOMPANHAMENTO DE PROJETOS NA CONSTRUÇÃO NAVAL	Oliveira, D. P. ; BOTELHO, S. S. C. ; DUARTE, N.	2010	1-6	34	2153	2
2424	TC	Autonomous Navigation for Underground Energy Line Inspection Robot	Estrada, E. ; Silveira L. ; Gonçalves, E. N. ; DUARTE FILHO, N. L. ; BOTELHO, S. S. C. ; OLIVEIRA, V. M.	2010		37	1982	2
2155	TC	A Multi-Cave Visualization System for Digital Manufacturing	DUARTE FILHO, Nelson Lopes ; BOTELHO, Silvia Silva da Costa ; Tyska, J ; MARCOS, Pedro ; Maffei, Renan ; OLIVEIRA, R. R. ; OLIVEIRA, Rodrigo Ruas ; HAX, V.	2009	201-207	24	2155	2
2369	TC	A Multi-Cave Visualization System for Digital Manufacturing	DUARTE, N. ; Tyska, j. ; BOTELHO, S. S. C.	2009	1-6	34	2155	2
2248	TC	Sistema Robótico de Inspeção para Linhas de Distribuição Elétrica Subterrâneas	BOTELHO, S. S. C. ; OLIVEIRA, V. M. ; DUARTE FILHO, N. L. ; MELLO JÚNIOR, C. D. ; ESTRADA, E. D. ; GALERIANO, M. P. ; DREWS JR, P. L. J. ; CORREA, U. B.	2008	100-106	28	1862	2
2301	AP	Space D*: A Path-Planning Algorithm for Multiple Robots in Unknown Environments	SILVEIRA, L. ; MAFFEI, R. Q. ; BOTELHO, S. S. C. ; DREWS JUNIOR, P. L. J. ; BICHO, A. L. ; DUARTE FILHO, N. L.	2012	1-11	34	1755	2
2207	AP	Mapas auto-organizáveis em veículos autônomos subaquáticos	BOTELHO, S. S. C. ; HAFFELE, C. ; FIGUEIREDO, M. ; OLIVEIRA, G. L. ; DREWS JR, P. L. J.	2010	45-55	28	2207	2
2311	AP	Mapas auto-organizáveis em veículos autônomos subaquáticos	BOTELHO, S. S. C. ; HAFFELE, C. ; FIGUEIREDO, M. ; OLIVEIRA, G. L. ; DREWS JR, P. L. J. ; DREWS JR, P. L. J.	2010	45-55	34	2207	2
2208	AP	A Visual System For Distributed Mosaics Using AUV Fleets	DREWS JR, P. L. J. ; BOTELHO, S. S. C.	2009	8-10	28	2208	2
2209	AP	Appearance-based odometry and mapping with feature descriptors for underwater robots	BOTELHO, S. S. C. ; DREWS JR, P. L. J. ; FIGUEIREDO, M. ; HAFFELE, C. ; OLIVEIRA, G. L.	2009	47-54	28	2209	2
2314	AP	Appearance-based odometry and mapping with feature descriptors for underwater robots	BOTELHO, S. S. C. ; DREWS, P. ; m, figueiredo ; da Rocha, C. ; LEIVAS, G	2009	47-54	34	2209	2
2210	AP	Uma Abordagem Baseada em Visão Computacional para Localização e Mapeamento Simultâneos de Robôs Subaquáticos. REIC	DREWS JR, P. L. J. ; BOTELHO, S. S. C.	2008	6	28	2210	2
2319	AP	Uma Abordagem Baseada em Visão Computacional para Localização e Mapeamento Simultâneos de Robôs Subaquáticos. REIC	DREWS JR, P. L. J. ; BOTELHO, S. S. C.	2008	6	34	2210	2
2214	TC	Self-organizing mapping of robotic environments based on neural networks	FIGUEIREDO, M. ; BOTELHO, S. S. C. ; DREWS JR, P. L. J. ; HAFFELE, C.	2012		28	2214	2
2346	TC	Self-organizing mapping of robotic environments based on neural networks	FIGUEIREDO, M. ; Botelho, Silvia S. C. ; DREWS, P. ; HAFFELE, C.	2012	1-6	34	2214	2
2216	TC	Modelando Nuvens de Pontos Tridimensionais como Misturas de Gaussianas	SILVA FILHO, S. C. ; DREWS JR, P. L. J. ; BOTELHO, S. S. C. ; NUNEZ, P.	2012		28	2216	2
2336	TC	Modelando Nuvens de Pontos Tridimensionais como Misturas de Gaussianas	SILVA FILHO, S. ; Drews, Paulo L. ; Botelho, Silvia S. C. ; NUNEZ, P.	2012	1-6	34	2216	2
2217	TC	Utilizando Representações Multi-semânticas para Mapeamento Topológico em Robótica Móvel	FIGUEIREDO, M. ; HAFFELE, C. ; BOTELHO, S. S. C. ; DREWS JR, P. L. J. ; OLIVEIRA, G. L.	2012		28	2217	2
2337	TC	Utilizando Representações Multi-semânticas para Mapeamento Topológico em Robótica Móvel	FIGUEIREDO, M. ; Botelho, Silvia S. C. ; Drews, Paulo L. ; da Rocha, C. ; OLIVEIRA, G. L.	2012	1-6	34	2217	2
2218	TC	Modelando Head Direction Cells para Estimativa de Orientacão Idiotética de Robôs Móveis	SILVEIRA, Luan ; GUTH, F. A. ; FIGUEIREDO, M. ; BOTELHO, S. S. C. ; DREWS JR, P. L. J.	2012		28	2218	2
2338	TC	Modelando Head Direction Cells para Estimativa de Orientacão Idiotética de Robôs Móveis	Silveira, Luan ; Botelho, Silvia S. C. ; Drews, Paulo L. ; GUTH, F. ; FIGUEIREDO, M.	2012	1-6	34	2218	2
2221	TC	Spatial and Perceptive Mapping using Semantically Self-Organizing Maps applied to Mobile Robots	FIGUEIREDO, M. ; BOTELHO, S. S. C. ; DREWS JR, P. L. J. ; HAFFELE, C.	2012		28	2221	2
2341	TC	Spatial and Perceptive Mapping using Semantically Self-Organizing Maps applied to Mobile Robots	FIGUEIREDO, M. ; Botelho, Silvia S. C. ; DREWS, P. ; da Rocha, C.	2012	1-6	34	2221	2
2222	TC	Using Space D* for Crowded Real Robots Environments	ALMEIDA, F. R. ; BOTELHO, S. S. C. ; SILVEIRA, Luan ; DREWS JR, P. L. J. ; MAFFEI, R. Q. ; DUARTE FILHO, N. L. ; BICHO, A. L. ; LONGARAY, M. M.	2012		28	2222	2
2342	TC	Using Space D* for Crowded Real Robots Environments	Almeida, F ; Botelho, Silvia S. C. ; SILVEIRA, L. ; DREWS, P. ; Maffei, R. Q. ; DUARTE, N. ; BICHO, A. ; LONGARAY, M.	2012	1-6	34	2222	2
2349	TC	Space D*: Um Algoritmo para Path Planning Multi-Robôs	Silveira, L. ; R. maffei ; BOTELHO, S. S. C. ; DREWS, P. ; DUARTE, N. ; BICHO, A. ; Almeida, F ; LONGARAY, M.	2011	1-6	34	1759	2
2225	TC	Analyzing and Exploring Feature Detectors in Images	DREWS JR, P. L. J. ; BEM, R. A. ; MELO, A. S.	2011		28	2225	2
2274	TC	Analyzing and exploring feature detectors in images	DREWS JR, P. L. J. ; DE BEM, Rodrigo Andrade ; MELO, A. S.	2011	305-310	32	2225	2
2226	TC	Controle automático de um ROV para inspeção de estruturas submersas	KUHN, V. N. ; DREWS JR, P. L. J. ; GOMES, S. C. P. ; BOTELHO, S. S. C. ; CUNHA, M. A. B.	2011		28	2226	2
2351	TC	Controle automático de um ROV para inspeção de estruturas submersas	KUHN ; DREWS, P. ; Gomes ; BOTELHO, S. S. C. ; Cunha	2011		34	2226	2
2352	TC	D*-Space: planejando caminhos para sistemas multi-robôs	Silveira, L. ; R. maffei ; BOTELHO, S. S. C. ; DREWS, P. ; DUARTE, N. ; BICHO, A. ; LONGARAY, M. ; ALMEIDA	2011		34	1760	2
2232	TC	Sensor Fusion based on Multi-Self-Organizing Maps for SLAM	OLIVEIRA, G. L. ; BOTELHO, S. S. C. ; DREWS JR, P. L. J. ; FIGUEIREDO, M. ; HAFFELE, C.	2010	1-5	28	2232	2
2361	TC	Sensor Fusion based on Multi-Self-Organizing Maps for SLAM	m, figueiredo ; LEIVAS, G ; BOTELHO, S. S. C. ; DREWS, P. ; da Rocha, C.	2010	1-6	34	2232	2
2233	TC	Fusao Sensorial de Mapas Auto-Organizáveis para SLAM	OLIVEIRA, G. L. ; FIGUEIREDO, M. ; BOTELHO, S. S. C. ; DREWS JR, P. L. J. ; HAFFELE, C.	2010	1-6	28	2233	2
2356	TC	Fusão sensorial de mapas auto-organizáveis para SLAM	LEIVAS, G ; DREWS, P. ; BOTELHO, S. S. C. ; m, figueiredo ; da Rocha, C.	2010	1-6	34	2233	2
2243	TC	Localização de um Robô Subterrâneo Para Inspeção de Linhas de Transmissão	DREWS JR, P. L. J. ; BOTELHO, S. S. C. ; CAMPOS, M. F. M.	2009	1-6	28	2243	2
2372	TC	Localização de um Robô Subterrâneo Para Inspeção de Linhas de Transmissão	DREWS, P. ; BOTELHO, S. S. C. ; Campos, M.	2009	1-6	34	2243	2
2376	TC	Visual Odometry and Mapping for Underwater Autonomous Vehicles	BOTELHO, S. S. C. ; LEIVAS, G ; DREWS, P. ; m, figueiredo	2009	1-6	34	2244	2
2247	TC	A new approach for Visual Underwater Mapping using Topological Shell Maps	BOTELHO, S. S. C. ; OLIVEIRA, G. L. ; DREWS JR, P. L. J.	2009		28	2247	2
2370	TC	A new approach for Visual Underwater Mapping using Topological Shell Maps	LEIVAS, G ; DREWS, P. ; BOTELHO, S. S. C.	2009	1-8	34	2247	2
2377	TC	TATUBOT Sistema Robótico de Inspeção para Linhas de Distribuição Elétrica Subterrâneas	BOTELHO, S. S. C. ; OLIVEIRA, V. ; DUARTE, N. ; MELLO, C. ; Estrada, E. ; Galeriano, M. ; DREWS, P. ; CORREA, U. B.	2008	100-106	34	1862	2
2249	TC	Uma Abordagem Baseada em Visão Computacionalpara Localização e Mapeamento Simultâneos de Robôs Subaquáticos	DREWS JR, P. L. J. ; BOTELHO, S. S. C.	2008	81-90	28	2249	2
2382	TC	Uma Abordagem Baseada em Visão Computacional para Localização e Mapeamento Simultâneos de Robôs Subaquáticos	DREWS, P. ; BOTELHO, S. S. C.	2008	1-6	34	2249	2
2379	TC	SIFT and Topologic Maps applied to robotic SLAM in Underwater Environment	DREWS, P. ; MEDEIROS, M. M. ; GONCALVES, E. ; BOTELHO, S. S. C.	2008	1-6	34	1984	2
2251	TC	NLMAP - Visual-based Self Localization and Mapping for Autonomous Underwater Vehicles	DREWS JR, P. L. J. ; BOTELHO, S. S. C. ; OLIVEIRA, G. L.	2008	2050-2055	28	2251	2
2384	TC	NLMAP - Visual-based Self Localization and Mapping for Autonomous Underwater Vehicles	BOTELHO, S. S. C. ; DREWS, P. ; LEIVAS, G	2008	1-6	34	2251	2
2252	TC	Visão Computacional aplicada à Localização e Mapeamento Simultâneos de Robôs Subaquáticos	DREWS JR, P. L. J. ; BOTELHO, S. S. C.	2008	1-4	28	2252	2
2383	TC	Visão Computacional aplicada à Localização e Mapeamento Simultâneos de Robôs Subaquáticos	DREWS, P. ; BOTELHO, S. S. C.	2008	1-6	34	2252	2
2254	TC	SLAM in Underwater Environment using SIFT and Topologic Maps	DREWS JR, P. L. J. ; BOTELHO, S. S. C. ; GOMES, S. C. P.	2008	91-96	28	2254	2
2380	TC	SLAM in Underwater Environment using SIFT and Topologic Maps Accepted	DREWS, P. ; BOTELHO, S. S. C. ; GOMES, S.	2008	1-6	34	2254	2
2353	TC	Hyper-Environments: A Different Way to Think about IoT	Tyska, j. ; PENNA, R. ; Botelho, Silvia S. C. ; Duarte Filho, Nelson L. ; R. Oliveira ; SANTOS, E.	2011	25-32	34	2150	2
2276	TC	3D Motion Tracking Based on Probabilistic Volumetric Reconstruction and Optical Flow	SIMAS, Gisele ; FICKEL, G. ; NOVELO, Lucas ; DE BEM, Rodrigo Andrade ; BOTELHO, Silvia Silva da Costa	2010	279-286	32	2276	2
2355	TC	3D Motion Tracking Based on Probabilistic Volumetric Reconstruction and Optical Flow	SIMAS, G. ; FICKEL, G. ; l, novello ; BEM, R. ; BOTELHO, S. S. C.	2010	1-6	34	2276	2
2277	TC	Reconstrução Probabilística 3D Aplicada à Análise de Movimento: um Enfoque na Tele-Operação	SIMAS, Gisele ; FICKEL, G. ; NOVELO, Lucas ; DE BEM, Rodrigo Andrade ; BOTELHO, Silvia Silva da Costa	2010	3800-3807	32	2277	2
2358	TC	Reconstrução Probabilística 3D Aplicada à Análise de Movimento: um Enfoque na Tele-operação	SIMAS, G. ; FICKEL, G. ; l, novello ; BEM, R. DE ; BOTELHO, S. S. C.	2010	1-6	34	2277	2
2421	AP	Arquitetura de navegação autônoma de linhas subterrâneas de distribuição de energia	Estrada, E. ; Silveira L. ; BOTELHO, S. S. C. ; OLIVEIRA, V. M.	2008	32-45	37	1998	2
2426	TC	Uma arquitetura para navegação autônoma de robôs reais e simulados para inspeção de linhas de distribuição de energia subterrâneas	Estrada, E. ; Gonçalves, E. N. ; BOTELHO, S. S. C. ; OLIVEIRA, V. M. ; ALMEIDA, R. ; Gules R. ; Silveira L.	2009		37	1983	2
2429	TC	Tatubot - Sistema Robótico de Inspeção para Linhas de Distribuição Elétrica Subterrâneas	BOTELHO, S. S. C. ; DUARTE FILHO, N. L. ; OLIVEIRA, V. M. ; Mello Jr., C. D. ; Estrada, E. ; Galeriano, M. ; LILLES, P. D. ; CORREA, U. B.	2008	100-106	37	1862	2
2430	TC	TATUBOT ROBOTIC SYSTEM FOR INSPECTION OF UNDERGROUNDED CABLE SYSTEM	BOTELHO, S. S. C. ; OLIVEIRA, V. M. ; Gonçalves, E. N. ; Estrada, E. ; Mello Jr., C. D. ; LILLES, P. D. ; ALMEIDA, R. ; SOUTO JR., H. ; Santos, T.	2008	1-6	37	1863	2
2431	TC	TATUBOT - Robotic System for Inspection of Undergrounded Cable System	BOTELHO, S. S. C. ; OLIVEIRA, V. M. ; Mello Jr., C. D. ; Gonçalves, E. N. ; Estrada, E. ; ALMEIDA, R. ; Santos, T. ; SOUTO JR., H. ; OLIVEIRA, G.	2008	1-6	37	1864	2
2398	TC	Aquisição e Análise de Modos de Vibração em Estruturas Flexíveis	SOARES, L. B. ; GOMES, S. C. P. ; GERVINI, V. I. ; ROSA, V. S. ; BELLICANTA, L. S. ; ZEILMANN, A. P ; GOMES, S. S.	2010	1-4	35	2398	2
2413	TC	Aquisição e Análise de Modos de Vibração em Estruturas Flexíveis	SOARES, L. B. ; GOMES, S.C.P. ; GERVINI, V. I. ; ROSA, V. S.	2010	1-6	36	2398	2
2701	TC	ExML: um Curso de Nivelamento na Modalidade EAD	Falavigna, M.R. ; ADAMATTI, D. F. ; Kuyven, N. L.	2008	1-6.CDROM	10	\N	3
2702	TC	Inserção de Jogadores Virtuais em Jogos de Papéis para Uso em Sistemas de Apoio a Decisão em Grupos: Um Experimento no Domínio da Gestão de Recursos Naturais	ADAMATTI, D. F. ; SICHMAN, Jaime Simão	2008	1-10.CDROM	10	\N	3
2703	TC	Construção de Ontologias Iniciais a partir de Sistemas Legados	ADAMATTI, D. F.	2008	1-10.CDROM	10	\N	3
2704	TC	A Web Semântica e a Eduação	CANTELE, R. C. ; ADAMATTI, D. F. ; FERREIRA, M. A. G. V.	2008	1-1.CDROM	10	\N	3
2705	RE	Multiplicadores de Conhecimento em Projeto de Inclusão Digital	MARTINAZZO, L. A. ; GRILLO, T. ; CARVALHO, J. T. ; HAX, V. A. ; ADAMATTI, D. F.	2012	1-4	10	\N	3
2706	RE	Inclusão Digital Dentro da Universidade	BENEVIDES, L. ; RODRIGUES, A. S. P. ; OLIVEIRA, B. A. ; FERNANDES, L. ; GARCEZ, A. ; FIORI, D. ; CARVALHO, J. T. ; HAX, V. A. ; ADAMATTI, D. F.	2012	1-4	10	\N	3
2707	RE	Redes Sociais em Projeto de Inclusão Digital	LUCCA, G. ; KLUMB, A. ; CARVALHO, J. T. ; HAX, V. A. ; ADAMATTI, D. F.	2012	1-4	10	\N	3
2708	RE	Classification of Brain Signals in BCI Systems	SILVEIRA, J. A. ; ADAMATTI, D. F.	2012	1-4	10	\N	3
2709	RE	Pressupostos da Educação Básica na Formação Continuada do Professor no Atendimento Educacional Especializado para as Salas de Recursos Multifuncionais - Tecnologia Assistiiva	FELIPE, C. I. M. ; ADAMATTI, D. F. ; BARWALDT, R.	2012	1-10	10	\N	3
2710	RE	Um sistema de apoio à decisão baseado em agentes para simulação de impactos gerados pela instalação de indústrias	NUNES, G. ; THOMASI, C. D. ; JUGUEIRO, M. ; ADAMATTI, D. F.	2011	1-4 - CDROM	10	\N	3
2711	RE	Desenvolvimento de Técnicas de Classificação de Sinais em Sistemas BCI	SILVEIRA, J. A. ; DE BEM, R. A. ; ADAMATTI, D. F.	2011		10	\N	3
2712	RE	NeuroFURG: uma ferramenta de apoio ao ensino de Redes Neurais Artificiais	MADSEN, C. ; ADAMATTI, D. F.	2011		10	\N	3
2713	RE	Modelo para Virtualização de Ambientes Robóticos com Software Livre	AMARAL, M. ; ADAMATTI, D. F.	2011		10	\N	3
2714	RE	Simulação Baseada em Multiagentes em Atividades de Graduação	ADAMATTI, D. F.	2010	135-138	10	\N	3
2716	RC	Assistive Technologies: Accessibility to People with Disabilities	ADAMATTI, D. F. ; BARWALDT, R. ; FELIPE, C. I. M.	2012	1-2	10	\N	3
2717	RC	Multiplicadores de Conhecimento Para Continuidade de Projeto de Inclusão Digital	MARTINAZZO, L. A. ; GRILLO, T. ; CARVALHO, J. T. ; HAX, V. A. ; ADAMATTI, D. F.	2012	1-1	10	\N	3
2718	RC	Inclusão Digital nas Universidades	BENEVIDES, L. ; FELIX, D. ; RODRIGUES, A. S. P. ; OLIVEIRA, B. A. ; FIORI, D. ; FERNANDES, L. ; LINDENAU, G. ; GUEDES, R. C. ; ADAMATTI, D. F.	2012	1-1	10	\N	3
2719	RC	Dispersão de Poluentes utlizando o Simulador SUMO	BORN, M. B. ; ADAMATTI, D. F.	2012	1-1	10	\N	3
2720	RC	Alocação Dinâmica e Descentralizada de Tarefas em Sistemas Multiagente	GULARTE, A. ; ADAMATTI, D. F.	2012	1-1	10	\N	3
2721	RC	Um Modelo Para Comunicação de Agentes Tratando Informações Imprecisas Baseado em Sinônimos	SPEROTTO, F. A. ; ADAMATTI, D. F.	2012	1-1	10	\N	3
2722	RC	Definição de Sistema de Apoio à Decisão Baseado em Agentes para Simulação de Impactos Gerados pela Instalação de Indústrias	BASTOS, N. ; MARQUES, B. ; ADAMATTI, D. F.	2012	1-1	10	\N	3
2723	RC	Jogo Animal	PETTER, L. C. ; ADAMATTI, D. F. ; KRUSCHE, N.	2012	1-1	10	\N	3
2724	RC	Sistemas Multiagentes Baseados em Modelagem por Redes de Petri: Um Estudo de Caso	ROSA, A. M. ; SPEROTTO, F. A. ; ADAMATTI, D. F.	2012	1-1	10	\N	3
2725	RC	Inclusão Digital em Comunidades Carentes de Rio Grande	ROCHANO, E. L. ; LUCCA, G. ; SILVA, D. ; FLORES, E. ; KLUMB, A. ; DJALO, M. ; DUARTE, B. T. ; LEAL, T. ; CARVALHO, J. T. ; HAX, V. A. ; ADAMATTI, D. F.	2012	1-1	10	\N	3
2726	RC	Simulação e Análise da Malária Utilizando Sistemas Multiagentes	COSTA, L. M. ; ADAMATTI, D. F.	2012	1-1	10	\N	3
2727	RC	Implementação de um Protocolo de Roteamento Usando ACO	PEREIRA, L. ; ADAMATTI, D. F.	2012	1-1	10	\N	3
2728	RC	Criação de um Software para Reserva de Salas da FURG	SILVEIRA, G. ; BACELAR, E. ; SEUS, V. ; FERREIRA, D. ; CASSALES, V. ; OTERO, T. F. ; TREVISAN, G. ; CHAVES, T. ; ADAMATTI, D. F. ; BARWALDT, R.	2012	1-1	10	\N	3
2729	RC	Uma Proposta para Melhoria da Aquisição e Desenvolvimento de Habilidades em Disciplinas Básicas da Ciência da Computação	CUNHA, S. ; SILVEIRA, G. ; ADAMATTI, G. ; ADAMATTI, D. F.	2012	1-1	10	\N	3
2730	RC	Modelagem De Interações Em Uma Organização Social Para Simulação De Gestão E Produção Social De Ecosistemas Urbanos: O Caso Da Horta Urbana De San Jeronimo Em Sevilha, Espanha	SANTOS, F. C. P. ; RODRIGUES, T. ; DIMURO, G. ; ADAMATTI, D. F. ; DIMURO, G. P. ; JEREZ, E. M.	2012	1-1	10	\N	3
2731	RC	FURG Smart Games: Um ambiente para o Estudo e Desenvolvimento de de IA para Personagens em Jogos Eletrônicos	DANIEL, G. B. ; MADSEN, C. ; ADAMATTI, D. F.	2012	1-1	10	\N	3
2732	RC	Processamento e Classificação de Sinais Cerebrais para o Uso em Sistemas BCI	SILVEIRA, J. A. ; ADAMATTI, D. F.	2012	1-1	10	\N	3
2733	RC	Um Simulador para Previsão de Impactos Gerados pela Instalação de Indústrias	JUGUEIRO, M. ; THOMASI, C. D. ; NUNES, G. ; ADAMATTI, D. F.	2011		10	\N	3
2734	RC	Recuperação de Imagens Baseada em Conteúdo Utilizando Dispositivos Móveis	GULARTE, A. ; THOMASI, C. D. ; DE BEM, R. A. ; ADAMATTI, D. F.	2011		10	\N	3
2735	RC	Inclusão Digital em Escola de Ensino Básico em Rio Grande (RS)	DJALO, M. ; KLUMB, A. ; SILVA, D. ; FLORES, E. ; CAMACHO, P. M. ; CARVALHO, J. T. ; HAX, V. A. ; ADAMATTI, D. F.	2011		10	\N	3
2736	RC	Uma ferramenta para coleta e análise de dados do segmento naval	OTERO, T. F. ; BORGES, E. N. ; ADAMATTI, D. F.	2011		10	\N	3
2737	RC	SACI Sistema Avançado de Supervisão, Inspeção e Diagnóstico de Sistemas Elétricos: Geração, Transmissão e Distribuição Módulo de Interface e Visualização	COSTA, M. M. ; ADAMATTI, D. F.	2011		10	\N	3
2738	RC	Framework para Desenvolvimento de Jogos Inteligentes	LUCCA, G. ; MADSEN, C. ; ADAMATTI, D. F.	2011		10	\N	3
2739	RC	Proposta de Modelagem Baseada em Agentes de um Caso de Gestão Social de Ecossistemas Urbanos	RODRIGUES, T. ; SANTOS, F. C. P. ; SANTOS, I. ; DIMURO, G. ; ADAMATTI, D. F. ; DIMURO, G. P. ; COSTA, A. C. R.	2011		10	\N	3
2740	RC	Tecnologias Assistivas: Recursos e Serviços Utilizados para a Inclusão Sócio-Digital de Pessoas com Deficiências	SALOMAO, H. L. R. ; BARWALDT, R. ; ADAMATTI, D. F. ; FELIPE, C. I. M.	2011		10	\N	3
2741	RC	Modelagem do Sistema Multiagente para Simulação de Processos de Gestão Social de Ecossistemas Urbanos	SANTOS, F. C. P. ; ADAMATTI, D. F. ; DIMURO, G. P.	2011		10	\N	3
2742	RC	Árvores de Decisão para Descoberta de Detectando Padrões Comportamentais de Agentes Através de Árvores de Decisão	SILVEIRA, J. A. ; PAES, T. L. ; EMMENDORFER, L. R. ; ADAMATTI, D. F.	2010	1-1 - CDROM	10	\N	3
2743	RC	Modelagem da Dinâmica do Fluxo Granular Através de Autômatos Celulares e Simulação Baseada em Agentes	SILVEIRA, J. A. ; PAES, T. L. ; EMMENDORFER, L. R. ; ADAMATTI, D. F.	2010	1-1 - CDROM	10	\N	3
2744	RC	Sistemas Inteligentes no Gerenciamento de Recursos Naturais	GULARTE, A. ; THOMASI, C. D. ; NUNES, G. ; ADAMATTI, D. F.	2010	1-1 - CDROM	10	\N	3
2745	RC	Desenvolvimento da interface gráfica para um Framework de jogos inteligentes	PERRONE, F. R. ; ADAMATTI, D. F.	2010	1-1 - CDROM	10	\N	3
2746	RC	Identificação de Registros Duplicados nos Cadastros da ONIP	OTERO, T. F. ; BORGES, E. N. ; ADAMATTI, D. F.	2010	1-1 - CDROM	10	\N	3
2747	RC	Desenvolvimento de uma Interface Gráfica 3D para um RPG no domínio da Gestão dos Recursos Naturais	LEONARDI, L. ; ROCHA, M. ; ADAMATTI, D. F.	2008	1-2.CDROM	10	\N	3
2748	LP	Introdução à Educação a Distância	GONÇALVES, E. M. N. ; Vieira, Suzane R	0		11	\N	3
2749	TC	Modelagem de Função Avaliação para o Domínio de Futebol de Robôs em Simulação 2D	GONÇALVES, E. M. N. ; FOGAÇA, Mateus	2012	184-187	11	\N	3
2750	TC	Cálculo de parâmetros de chute para simulações de futebol de robôs 2D utilizando controle fuzzy	GONÇALVES, E. M. N. ; FOGAÇA, Mateus	2012	386-393	11	\N	3
2751	TC	Gerando Bases de Conhecimento no Formato XML para Sistemas Multiagentes utilizando Redes de Petri	GONÇALVES, E. M. N. ; SANTOS, M. M.	2011		11	\N	3
2752	TC	An Approach to Specify Knowledge in Multi-agent Systems using Petri Nets	GONÇALVES, E. M. N.	2010	456-461	11	\N	3
2758	TC	TATUBOT - Robotic System for Inspection of Undergrounded Cable System	MELLO, C. ; GONÇALVES, E. M. N. ; ESTRADA, E. ; ALMEIDA, Renan Rosado de ; BOTELHO, S. S. C. ; OLIVEIRA, V. M.	2008	170-175	11	\N	3
2759	RE	NLMAP - Localização e Navegação de Robôs Cooperativos para Inspeção	GONÇALVES, E. M. N. ; ESTRADA, E. ; LEIVAS, G. ; BOTELHO, S. S. C.	2008	243-249	11	\N	3
2760	AP	An unsupervised heuristic-based approach for bibliographic metadata deduplication	Borges, Eduardo N. ; de Carvalho, Moisés G. ; Galante, Renata ; GONÇALVES, Marcos André ; Laender, Alberto H.F.	2011	706-718	13	\N	3
2761	TC	Um sistema para análise de redes de pesquisa baseado na Plataforma Lattes	FARIAS, Lucas R. ; Vargas, André P. ; Borges, Eduardo N.	2012	1-10 CD-ROM	13	\N	3
2762	TC	Uma ferramenta para coleta e análise de dados do segmento naval	Otero, Tiago F. ; FARIAS, Lucas R. ; Vargas, André P. ; Borges, Eduardo N.	2012	1-4 CD-ROM	13	\N	3
2763	TC	ARGOsearch: an information retrieval system based on text similarity and extensible relevance criteria	Borges, Eduardo N. ; PEREIRA, Igor A. ; TOMASINI, C. ; Vargas, André P.	2012	1-8	13	\N	3
2764	TC	Um mecanismo de busca para sistemas de gerenciamento de bibliotecas baseado em critérios de relevância extensíveis	PEREIRA, Igor A. ; TOMASINI, C. ; Borges, Eduardo N. ; Vargas, André P.	2012	7-12	13	\N	3
2765	TC	CiênciaBrasil - The Brazilian Portal of Science and Technology	LAENDER, Alberto H. F. ; Moro, Mirella M. ; Silva, Altigran S. ; Davis Jr., Clodoveu A. ; GONÇALVES, Marcos André ; Galante, Renata ; Silva, Allan J. C. ; Bigonha, Carolina A. S. ; Dalip, Daniel Hasan ; Barbosa, Eduardo M. ; Borges, Eduardo N. ; Cortez, Eli ; Procópio Jr., Peterson ; de Alencar, Rafael Odon ; Cardoso, Thiago N. C. ; Salles, Thiago	2011	1366-1379	13	\N	3
2766	TC	An Automatic Approach for Duplicate Bibliographic Metadata Identification Using Classification	Borges, Eduardo N. ; Becker, Karin ; HEUSER, Carlos A. ; Galante, Renata	2011	1-7	13	\N	3
2767	TC	A Classification-based Approach for Bibliographic Metadata Deduplication	Borges, Eduardo N. ; Becker, Karin ; HEUSER, Carlos A. ; GALANTE, Renata de Matos	2011	221-228	13	\N	3
2768	TC	Uma Abordagem Efetiva e Eficiente para Deduplicação de Metadados Bibliográficos de Objetos Digitais	BORGES, Eduardo Nunes ; GALANTE, Renata de Matos ; GONÇALVES, Marcos André	2008	76-90	13	\N	3
2769	TC	XSimilarity : Uma Ferramenta para Consultas por Similaridade embutidas na Linguagem XQuery	SILVA, Maria Estela Vieira da ; BORGES, Eduardo Nunes ; GALANTE, Renata de Matos	2008	148-157	13	\N	3
2770	RE	Manutenção das Aplicações Web de Acesso e Gerência do Banco de Dados Meteorológicos da FURG	da Silva, Rafael S. ; BORGES, Eduardo Nunes ; Krusche, Nisia	2010		13	\N	3
2771	RE	Atualização do Sistema de Gerenciamento do Banco de Dados Meteorológicos da FURG	da Silva, Rafael S. ; BORGES, Eduardo Nunes ; Krusche, Nisia	2010		13	\N	3
2772	RE	Identificação de Registros Duplicados nos Cadastros da ONIP	Otero, Tiago F. ; BORGES, Eduardo Nunes ; Adamatti, Diana Francisca	2010		13	\N	3
2773	RC	Uma arquitetura para pesquisa por relevância baseada em critérios	PEREIRA, Igor A. ; Borges, Eduardo N. ; Vargas, André P.	2011		13	\N	3
2774	RC	Rede de pesquisa da FURG	FARIAS, Lucas R. ; Vargas, André P. ; Borges, Eduardo N.	2011		13	\N	3
2775	RC	Uma ferramenta para coleta e análise de dados do segmento naval	Otero, Tiago F. ; FARIAS, Lucas R. ; da Silva, Rafael S. ; Borges, Eduardo N. ; Vargas, André P. ; Adamatti, Diana Francisca	2011		13	\N	3
2776	RC	BorbRS 2: aperfeiçoamento de uma base de dados de borboletas (Lepidoptera: Papilionoidea e Hesperioidea) do Rio Grande do Sul	Scholem, Tyron Wittee Neetzow ; BORGES, Eduardo Nunes ; Marchiori, Maria Ostilia ; Romanowski, Helena Piccoli	2009		13	\N	3
2778	AA	Comparative Study of Genetic Algorithm and Exhaustive Search for Constructal Design Optimization of Y-Shaped Cavities	ESTRADA, E. S. D. ; Santos, E. D. ; Isoldi, L. A. ; ROCHA, L. A. O.	2012		14	\N	3
2779	TC	Genetic Algorithm and Constructal Design for Geometric Optimization of Y‐Shaped Cavities	ESTRADA, E. S. D. ; Santos, E. D. ; Isoldi, L. A. ; ROCHA, L. A. O.	2012	45-50	14	\N	3
2780	TC	UMA METODOLOGIA DE ENSINO COM O AUXÍLIO DA ROBÓTICA EDUCACIONAL	OLIVEIRA, S. A. ; ANTIQUEIRA, L. S. ; CAMPOS, R. L. ; ESTRADA, E. S. D.	2012	834-841	14	\N	3
2781	TC	Projeto Reuni: uma proposta da utilização de Modelagem Computacional no Ensino de Engenharia	LOPES, N. R. ; MACHADO, B. N. ; ESTRADA, E. S. D. ; Isoldi, L. A. ; Santos, E. D.	2011	252-264	14	\N	3
2784	TC	Navigation system for an underground distribution inspection platform using simulation	ESTRADA, E. S. D. ; Silveira, L. ; OLIVEIRA, V. M. ; BOTELHO, S. S. C.	2010	109-114	14	\N	3
2790	RE	Arquitetura de Navegação Autônoma para Ambientes Reais e Virtuais de Inspeção de Linhas Subterrâneas de Distribuição de Energia	ESTRADA, E. S. D. ; Silveira, L. ; CORREA, U. B. ; BOTELHO, S. S. C. ; OLIVEIRA, V. M.	2009		14	\N	3
2791	RC	SIMULAÇÃO COMPUTACIONAL DO COMPORTAMENTO MECÂNICO DE UMA TRELIÇA	BRUM, R. S. ; CORREIA, A. L. G. ; ESTRADA, E. S. D. ; OLIVEIRA, C. G. ; Santos, E. D. ; Isoldi, L. A.	2011		14	\N	3
2792	TC	Predição espacial de monóxido de carbono gerado pelo tráfego veicular urbano	SILVA, G. C. ; GOLDNER, L. G. ; Ridley, Ian ; Dalotto, Roque	2009		15	\N	3
2794	RE	Um sistema de apoio à decisão baseado em agentes para simulação de impactos gerados pela instalação de indústrias	NUNES, G. A. L. ; THOMASI, C. D. ; JUGUEIRO, M. M. ; ADAMATTI, D. F.	2011	1-4	16	\N	3
2795	RE	Um Overview sobre a Utilização de Técnicas de Inteligência Artificial em Gerenciamento de Recursos Naturais	GULARTE, A. R. ; THOMASI, C. D. ; NUNES, G. A. L. ; ADAMATTI, D. F.	2010		16	\N	3
2796	RE	UMA FERRAMENTA DE SIMULAÇÃO PARA IMPACTOS AMBIENTAIS	NUNES, G. A. L. ; THOMASI, C. D. ; GULARTE, A. R. ; ADAMATTI, D. F.	2010		16	\N	3
2797	RE	Análise do Desempenho de Sistemas de Comunicação Cooperativa em Canais SUI	NUNES, G. A. L. ; Melgarejo, Dick Carrillo ; Vargas, C. H. V.	2010		16	\N	3
2798	RC	Sistemas Inteligentes no Gerenciamento de Recursos Naturais	GULARTE, A. R. ; THOMASI, C. D. ; NUNES, G. A. L. ; ADAMATTI, D. F.	2010		16	\N	3
2799	AP	Interval Additive Generators of Interval T-Norms and Interval T-Conorms	Dimuro, Graçaliz Pereira ; Bedregal, Benjamín Callejas ; Santiago, Regivan Hugo Nunes ; Reiser, Renata Hax Sander	2011	3898-3916	18	\N	3
2801	AP	On interval fuzzy S-implications	BEDREGAL, B. R. C. ; Dimuro, G.P. ; Santiago, R.H.N. ; Reiser, R.H.S.	2010	1373-1389	18	\N	3
2802	AP	Analyzing the relationship between interval-valued D-Implications and interval-valued QL-Implications. TEMA	REISER, R. H. S. ; BEDREGAL, B. R. C. ; SANTIAGO, R. H. N. ; DIMURO, G. P.	2010	89-100	18	\N	3
2803	AP	Aplicação de Agentes BDI com Percepção Fuzzy no Modelo Presa-Predador	FARIAS, G. P. ; DIMURO, G. P. ; COSTA, A. C. R.	2010	299-324	18	\N	3
2804	AP	Xor-Implications and E-Implications: Classes of Fuzzy Implications Based on Fuzzy Xor	BEDREGAL, B. R. C. ; REISER, R. H. S. ; DIMURO, G. P.	2009	5-18	18	\N	3
2805	AP	Interval-Valued D-Implications. TEMA	REISER, R. H. S. ; BEDREGAL, B. R. C. ; SANTIAGO, R. H. N. ; DIMURO, G. P.	2009	63-74	18	\N	3
2807	AP	S-Implications on Bounded Lattices and the Interval Constructor. TEMA	REISER, R. H. S. ; DIMURO, G. P. ; BEDREGAL, B. R. C. ; SANTIAGO, R. H. N.	2008	143-154	18	\N	3
2808	AP	Incerteza de Dados em Fluxo de Potência: Uma abordagem com a Matemática Intervalar do C-XSC. TEMA	Vargas, R. ; FARIAS, C. M. ; BARBOZA, L. V. ; DIMURO, G. P.	2008	491-502	18	\N	3
2809	AA	Uma Abordagem para Jogos Bayesianos Fuzzy com base na Probabilidade Fuzzy de Buckley	ASMUS, T. C. ; DIMURO, G. P.	2012		18	\N	3
2811	LP	ENIA - VIII Encontro Nacional de Inteligência Artificial/CSBC 2011 - XXXI Congresso da Sociedade Brasileira de Computação	PRATI, R. (Org.) ; DIMURO, G. P. (Org.) ; CAMPOS, A. (Org.)	2011		18	\N	3
2815	CL	Towards the Modeling of the Social Organization of an Experiment of Social Management of Urban Vegetable Gardens	SANTOS, I. ; RODRIGUES, T. F. ; DIMURO, G. P. ; COSTA, A. C. R. ; DIMURO, G. ; Jerez, E. de M.	2012	98-101	18	\N	3
2819	CL	On Interval Fuzzy Numbers	DIMURO, G. P.	2011	1-6	18	\N	3
2820	CL	On Fuzzy Probabilities in Bayesian Games	ASMUS, T. C. ; DIMURO, G. P.	2011	20-26	18	\N	3
2821	CL	On Vector and Matrices of Fuzzy Numbers	RIBES, J. L. B. ; DIMURO, G. P. ; AGUIAR, M. S.	2011	34-40	18	\N	3
2822	CL	Measuring the Quality of Internet Shopping: An Experiment Using Fuzzy Logic	RODRIGUES, L. M. ; DIMURO, G. P.	2011	55-61	18	\N	3
2823	CL	Hand Skill Programming: Using Fuzzy Sets to Program Topobo Kinectis Memory Devices	SANTINI, M.M. ; BOTELHO, S. S. C. ; DIMURO, G. P. ; RODRIGUES, C. L. L.	2011	62-68	18	\N	3
2824	CL	Modeling Uncertainty and Decision Making in Strategic Interactions in Multiagent Systems: An Overview	BRIÃO, S. L. ; DIMURO, G. P. ; COSTA, A. C. R.	2011	115-121	18	\N	3
2825	CL	A Fuzzy-BDI Agent Model for Exchanges of Non-economic Services, Based on the Social Exchange Theory	FARIAS, G. P. ; DIMURO, G. P. ; COSTA, A. C. R.	2011	129-132	18	\N	3
2826	CL	Hybrid Intelligent Systems: A Study on Genetic Algorithms and Fuzzy Approaches	MACEDO, L. F. K. ; DIMURO, G. P. ; AGUIAR, M. S.	2011	133-139	18	\N	3
2827	CL	Towards Developmental Turing Machines	COSTA, S. A. ; COSTA, A. C. R. ; DIMURO, G. P.	2011	151-157	18	\N	3
2829	CL	Construção de Planos BDI a partir de Políticas Ótimas de POMDPs, com Aplicação na Programação em AgentSpeak usando o Jason	PEREIRA, D. R. ; GONÇALVES, L. V. ; DIMURO, G. P.	2010	24-30	18	\N	3
2837	TC	Simulação Multiagente de uma Abordagem Evolutiva e Espacial para o Jogo do Ultimato	MACEDO, L. F. K. ; RIBEIRO, M. ; BRIÃO, S. L. ; AGUIAR, M. S. ; DIMURO, G. P. ; FONSECA, C. N.	2012	35-46	18	\N	3
2839	TC	Planejamento de Rotas de Robôs Móveis: Estudo da Viabilidade de Uma Abordagem Baseada em Algoritmos Genéticos em um Ambiente Multiagente	CABREIRA, T. M. ; AGUIAR, M. S. ; DIMURO, G. P.	2012	253-264	18	\N	3
2840	TC	Proposta de modelo de avaliação da satisfação de usuários de transporte público usando lógica fuzzy	MATTOS, V. L. D. ; ROSA, S. E. ; Dimuro, G.P.	2012	1-10	18	\N	3
2842	TC	Uma Ordem Total para Números Fuzzy Intervalares Triangulares Simétricos	ASMUS, T. C. ; DIMURO, G. P.	2012	1-12	18	\N	3
2844	TC	Planejamento de Rotas de Robôs Móveis em Ambientes Dinâmicos: Uma Abordagem Utilizando Algoritmos Genéticos e Lógica Fuzzy	CABREIRA, T. M. ; DIMURO, G. P. ; AGUIAR, M. S.	2012	1-12	18	\N	3
2845	TC	Método de Ordenação de Números Fuzzy Intervalares: uma proposta	BRIÃO, S. L. ; DIMURO, G. P.	2012	1-12	18	\N	3
2849	TC	An Evolutionary Learning Approach for Robot Path Planning with Fuzzy Obstacle Detection and Avoidance in a Multi-agent Environment	CABREIRA, T. M. ; AGUIAR, M. S. ; DIMURO, G. P.	2012	1-16	18	\N	3
2851	TC	Interface Experimental de Fuzificação para o TOPOBO	SANTINI, M.M. ; BOTELHO, S. S. C. ; MOTA, F. P. ; RODRIGUES, C. L. L. ; DIMURO, G. P.	2011	74-82	18	\N	3
2852	TC	Probabilidade Fuzzy em Jogos Bayesianos	ASMUS, T. C. ; DIMURO, G. P.	2011	109-121	18	\N	3
2853	TC	Sobre Sistemas Híbridos: Algoritmos Genéticos e Abordagens Fuzzy	MACEDO, L. F. K. ; AGUIAR, M. S. ; DIMURO, G. P.	2011	140-151	18	\N	3
2856	TC	Um Estudo Sobre Vetores e Matrizes de Números Fuzzy	RIBES, J. L. B. ; DIMURO, G. P. ; AGUIAR, M. S.	2011	201-210	18	\N	3
2857	TC	Utilizando Lógica Fuzzy para Avaliar a Qualidade de uma Compra Via Internet	RODRIGUES, L. M. ; DIMURO, G. P.	2011	254-265	18	\N	3
2866	TC	Agentes Compartilhando Recursos Utilizando Processos de Decisão de Markov	RODRIGUES, L. M. ; DIMURO, G. P.	2010	107-110	18	\N	3
2867	TC	Simulação Baseada em Agentes de Processos de Gestão Social de Ecossistemas Urbanos: o caso das hortas urbanas da cidade de Sevilla	RODRIGUES, T. F. ; DIMURO, G. ; VON GROL, C. ; Pinheiro, T. V. ; DIMURO, G. P. ; COSTA, A. C. R.	2010	257-260	18	\N	3
2868	TC	Uma Proposta de Modelo Híbrido com Agentes Evolutivos BDI-Fuzzy-Intervalares	MACEDO, L. F. K. ; DIMURO, G. P. ; AGUIAR, M. S. ; COSTA, A. C. R. ; MATTOS, V. L. D.	2010	274-289	18	\N	3
2869	TC	Tomando Decisões em um Ambiente de Informação Imperfeita: introdução de probabilidades fuzzy (intervalares) em um modelo híbrido de agente BDI-MDP	RIBES, J. L. B. ; DIMURO, G. P. ; AGUIAR, M. S. ; COSTA, A. C. R. ; MATTOS, V. L. D.	2010	280-285	18	\N	3
2871	TC	An Approach to Interval-Valued R-Implications and Automorphisms	BEDREGAL, B. R. C. ; DIMURO, G. P. ; REISER, R. H. S.	2009	1-6	18	\N	3
2874	TC	Analyzing the Relations between Interval-valued D-Implications and Interval-valued QL-Implications	REISER, R. H. S. ; DIMURO, G. P. ; BEDREGAL, B. R. C. ; SANTIAGO, R. H. N.	2009	190-196	18	\N	3
2877	TC	Interval Additive Generators of Interval T-Norms	DIMURO, G. P. ; BEDREGAL, B. R. C. ; REISER, R. H. S. ; SANTIAGO, R. H. N.	2008	123-135	18	\N	3
2878	TC	Interval Valued D-Implications	REISER, R. H. S. ; DIMURO, G. P. ; BEDREGAL, B. R. C. ; SANTIAGO, R. H. N.	2008	203-209	18	\N	3
2879	TC	Avaliação Fuzzy de Trocas Sociais entre Agentes Baseados em Personalidades	SANTOS, A. V. ; DIMURO, G. P. ; BEDREGAL, B. R. C.	2008	176-182	18	\N	3
2880	TC	Avaliação Fuzzy de Trocas Sociais em Sistemas Multiagentes baseados em Personalidades	SANTOS, A. V. ; DIMURO, G. P. ; BEDREGAL, B. R. C.	2008	1-10	18	\N	3
2881	TC	Construção de Planos BDI a partir de Políticas Ótimas de POMDPs, com Aplicação na Programação em AgentSpeak usando o Jason	PEREIRA, D. R. ; GONÇALVES, L. V. ; DIMURO, G. P.	2008	1-10	18	\N	3
2882	TC	Auto-Regulação de Trocas Sociais Baseadas em Personalidades em Sistemas Multiagentes	GONÇALVES, L. V. ; PEREIRA, D. R. ; DIMURO, G. P.	2008	1-10	18	\N	3
2884	TC	Xor-Implications and E-Implications: Classes of fuzzy implications based on fuzzy Xor	BEDREGAL, B. R. C. ; REISER, R. H. S. ; DIMURO, G. P.	2008	8-20	18	\N	3
2887	TC	Valores de Trocas Sociais Fuzzy em Agentes com Personalidades	SANTOS, A. V. ; DIMURO, G. P. ; BEDREGAL, B. R. C.	2008	1-6	18	\N	3
2888	TC	Avaliação Fuzzy de Trocas Sociais em Sistemas Multiagentes baseados em Personalidades	SANTOS, A. V. ; DIMURO, G. P.	2008	1-10	18	\N	3
2889	TC	Building BDI Plans from POMDPs Optimal Policies, with an Application to the Self-Regulation of Social Exchanges in Multi-Agent Systems	PEREIRA, D. R. ; DIMURO, G. P.	2008	1-10	18	\N	3
2890	RE	Uma Ordem Total para Números Fuzzy Triangulares Simétricos	ASMUS, T. C. ; DIMURO, G. P.	2012	1-4	18	\N	3
2891	RE	Sobre Probabilidades Fuzzy Intervalares	RIBES, J. L. B. ; ASMUS, T. C. ; DIMURO, G. P.	2012	1-4	18	\N	3
2892	RE	Um Modelo de Agentes BDI-Fuzzy para Trocas de Serviços Não-Econômicos com Base na Teoria das Trocas Sociais	FARIAS, G. P. ; DIMURO, G. P. ; COSTA, A. C. R.	2012	1-6	18	\N	3
2893	RE	Modelando a Organização Social de um Experimento de Gestão Social de Hortas Urbanas	RODRIGUES, T. F. ; SANTOS, I. ; DIMURO, G. ; COSTA, A. C. R. ; DIMURO, G. P.	2011	163-166	18	\N	3
2894	RE	Um Modelo de Agentes BDI-Fuzzy para Trocas de Serviços Não-Econômicos com Base na Teoria das Trocas Sociais	FARIAS, G. P. ; DIMURO, G. P. ; COSTA, A. C. R.	2011	211-216	18	\N	3
2895	RE	Especificando Rotinas Organizacionais de Sistemas Multiagentes: Detecção de Desvios com Base no Conceito de Expectativas	SILVA, C. E. ; DIMURO, G. P. ; COSTA, A. C. R.	2010	139-142	18	\N	3
2896	RE	Estendendo o Modelo de Organização de Sistemas Multiagentes PopOrg com Unidades Organizacionais Recursivas	ROSA, S. E. ; DIMURO, G. P. ; COSTA, A. C. R.	2010	143-146	18	\N	3
2897	RE	Um Modelo Híbrido de Agente BDI-Fuzzy	FARIAS, G. P. ; DIMURO, G. P. ; COSTA, A. C. R.	2010	147-150	18	\N	3
2898	RE	Introducing Social Groups and Group Exchanges in the PopOrg Model	COSTA, A. C. R. ; DIMURO, G. P.	2009	1297-1298	18	\N	3
2899	RE	A Integração de HMMs e POMDPs, com aplicação na Simulação de Trocas Sociais em Sistemas Multiagentes	GONÇALVES, L. V. ; DIMURO, G. P. ; COSTA, A. C. R.	2009	1-2	18	\N	3
2900	RE	Números Fuzzy Intervalares	MUSSI, R. L. ; DIMURO, G. P. ; BEDREGAL, B. R. C.	2009	223-224	18	\N	3
2901	RE	Um Sistema Fuzzy para Auxílio ao Diagnóstico da Densidade Mineral Óssea	SILVA, F. ; DIMURO, G. P. ; AGUIAR, M. S.	2009	295-298	18	\N	3
2902	RE	Um Modelo de Percepção Fuzzy para Agentes BDI	FARIAS, G. P. ; DIMURO, G. P. ; COSTA, A. C. R.	2009	254-257	18	\N	3
2903	RE	Analyzing the Relations between Interval-valued D-Implications, QL-Implications and Automorphisms	DIMURO, G. P. ; REISER, R. H. S. ; BEDREGAL, B. R. C. ; SANTIAGO, R. H. N.	2008	1-2	18	\N	3
2908	AP	Mining flexible-receptor molecular docking data	MACHADO, K. S. ; WINCK, A. T. ; RUIZ, D. D. A. ; NORBERTO DE SOUZA, O	2011	n/a-n/a	21	\N	3
2909	AP	FReDoWS: a method to automate molecular docking simulations with explicit receptor flexibility and snapshots selection	MACHADO, K. S. ; Schroeder, Evelyn K ; Ruiz, Duncan D ; Cohen, Elisângela ML ; Norberto de Souza, Osmar	2011	S6	21	\N	3
2910	AP	Effect of the explicit flexibility of the InhA enzyme from Mycobacterium tuberculosis in molecular docking simulations	Cohen, Elisangela ML ; MACHADO, K. S. ; Cohen, Marcelo ; Norberto de Souza, Osmar	2011	S7	21	\N	3
2911	AP	Mining flexible-receptor docking experiments to select promising protein receptor snapshots	MACHADO, K. S. ; WINCK, A. T. ; RUIZ, D. D. A. ; NORBERTO DE SOUZA, O	2010	S6	21	\N	3
2912	AA	Automatic Design of Decision-Tree Induction Algorithms Tailored to Flexible-Receptor Docking Data	Barros, R. C. ; WINCK, A. T. ; MACHADO, K. S. ; BASGALUPP, M. P. ; CARVALHO, A. C. P. F. L. ; RUIZ, D. D. A. ; NORBERTO DE SOUZA, O	2012		21	\N	3
2913	CL	Processo de KDD aplicado à bioinformática	WINCK, A. T. ; MACHADO, K. S. ; RUIZ, D. D. A. ; NORBERTO DE SOUZA, O	2010	159-180	21	\N	3
2914	TC	A Comparative Analysis of Public Ligand Databases Based on Molecular Descriptors	WINCK, A. T. ; QUEVEDO, C. V. ; MACHADO, K. S. ; NORBERTO DE SOUZA, O ; RUIZ, D. D. A.	2012	156-167	21	\N	3
2915	TC	Association Rules to Identify Receptor and Ligands Structures thourgh Named Entities Recognition	Winck, A. ; MACHADO, K. S. ; RUIZ, D. D. A. ; STRUBE de LIMA, V. L.	2010	119-128	21	\N	3
2916	TC	Comparison of Discretization Methods of Flexible-Receptor Docking Data for Analyses by Decision Trees	MACHADO, K. S. ; WINCK, A. T. ; RUIZ, D. D. A. ; NORBERTO DE SOUZA, O	2010	223-229	21	\N	3
2917	TC	Supporting Intermolecular Interaction Analyses of Flexible-Receptor Docking Simulations	WINCK, A. T. ; MACHADO, K. S. ; NORBERTO DE SOUZA, O ; RUIZ, D. D. A.	2010	183-190	21	\N	3
2918	TC	Extracting Information from Flexible Receptor-Flexible Ligand Docking Experiments	MACHADO, K. S. ; SCHROEDER, E. K. ; RUIZ, D. D. A. ; Winck, A. ; NORBERTO DE SOUZA, O	2008	104-114	21	\N	3
2919	RE	Análise de Profilers para Programas em Java: Estudo de Caso Aplicado ao Algoritmo M5P do Software Weka	BERNARDI, C. A. C. ; MADALOSSO, O. M. ; CHARAO, A. S. ; WINCK, A. T. ; MACHADO, K. S.	2012		21	\N	3
2920	RE	Discretization of Flexible-Receptor Docking Data	MACHADO, K. S. ; WINCK, A. T. ; RUIZ, D. D. A. ; NORBERTO DE SOUZA, O	2010	75-79	21	\N	3
2921	RE	FReDD: supporting mining strategies though a flexible-receptor docking database	Winck, A. ; MACHADO, K. S. ; NORBERTO DE SOUZA, O ; RUIZ, D. D. A.	2009	143-146	21	\N	3
2922	RC	Application Of Data Mining To Select Promising Compounds Based on Molecular Descriptors	PERAZZO, G. X. ; WINCK, A. T. ; MACHADO, K. S.	2012		21	\N	3
2923	RC	A Scientific Workflow for Performing Molecular Dynamics Simulation	Cornetet, L. R. ; WERHLI, A. V. ; MACHADO, K. S.	2011	152-152	21	\N	3
2924	RC	Workflow Científico para Dinâmica Molecular	Cornetet, L. R. ; MACHADO, K. S.	2011		21	\N	3
2925	RC	A Context-Based Preprocessing on Flexible-Receptor Docking Data	WINCK, A. T. ; MACHADO, K. S. ; NORBERTO DE SOUZA, O ; RUIZ, D. D. A.	2010	68-68	21	\N	3
2926	RC	A Study of Molecular Descriptor to Rank Candidate Ligands to Inhibit the InhA Receptor	QUEVEDO, C. V. ; WINCK, A. T. ; MACHADO, K. S. ; NORBERTO DE SOUZA, O ; RUIZ, D. D. A.	2010	79-79	21	\N	3
2927	RC	Applying Model Trees on Flexible-Receptor Docking Experiments to select promising protein receptor snapshots	MACHADO, K. S. ; WINCK, A. T. ; RUIZ, D. D. A. ; NORBERTO DE SOUZA, O	2010	66-66	21	\N	3
2928	RC	The effect of InhA flexibility in docking simulations with ethionamide and triclosan	COHEN, E. M. L. ; MACHADO, K. S. ; NORBERTO DE SOUZA, O	2010	73-73	21	\N	3
2929	RC	FREDOWS: A METHOD TO AUTOMATE MOLECULAR DOCKING SIMULATIONS WITH EXPLICIT RECEPTOR FLEXIBILITY AND SNAPSHOTS SELECTION	MACHADO, K. S. ; SCHROEDER, E. K. ; RUIZ, D. D. A. ; COHEN, E. M. L. ; NORBERTO DE SOUZA, O	2010	90-90	21	\N	3
2930	RC	EFFECT OF THE EXPLICIT FLEXIBILITY OF THE INHA ENZYME FROM MYCOBACTERIUM TUBERCULOSIS IN MOLECULAR DOCKING SIMULATIONS	COHEN, E. M. L. ; MACHADO, K. S. ; COHEN, M. ; NORBERTO DE SOUZA, O	2010	44-44	21	\N	3
2931	AP	Uma Estratégia Híbrida para o Problema de Empacotamento	SANTOS, R. ; EMMENDORFER, L. R.	2011	1-7	22	\N	3
2932	AP	Modelagem Ambiental: Perspectivas e Contribuições	NEVES, C. ; BRUM, R. S. ; KIRINUS, E. ; SANTOS, R. ; EMMENDORFER, L. R.	2011	15-20	22	\N	3
2933	AP	Effective Linkage Learning Using Low-Order Statistics and Clustering	Emmendorfer, Leonardo Ramos ; POZO, Aurora Trinidad Ramirez	2009	1233-1246	22	\N	3
2934	LP	Anais do IV Workshop- Escola de Sistemas de Agentes, seus Ambientes e apliCações	ADAMATTI, D. F. ; WERHLI, A. V. ; LUGO. G. G. ; EMMENDORFER, L. R.	2010		22	\N	3
2936	CL	A Clustering-based Approach for Linkage Learning Applied to Multimodal Optimization	EMMENDORFER, L. R. ; POZO, Aurora Trinidad Ramirez	2008	225-248	22	\N	3
2937	TC	Detectando Padrões Comportamentais de Agentes Através de Árvores de Decisão	EMMENDORFER, L. R. ; ADAMATTI, D. F. ; SILVEIRA, J. ; PAES, T.	2010		22	\N	3
2940	TC	Selecting Software Reliability Models with a Neural Network Meta Classifier	CAIUTA, R. ; POZO, Aurora Trinidad Ramirez ; EMMENDORFER, L. R. ; VERGILIO, S.	2008	201-209	22	\N	3
2941	RE	Descoberta de conhecimento em bancos de dados aplicada ao caso de alunos com subsídio	LORENZ, W. ; WERHLI, A. V. ; EMMENDORFER, L. R.	2011		22	\N	3
2942	RE	On the design of populational clustering	EMMENDORFER, L. R.	2010		22	\N	3
2943	RC	Uma estratégia híbrida para o problema de empacotamento de duas elipses	SANTOS, R. ; EMMENDORFER, L. R.	2011		22	\N	3
3020	RC	Suprte a Comunicação em Grupo para Dispositivos Móveis Utilizando Wi-Fi	GIL, J. P. S. ; VARGAS, André Prisco ; MENDIZABAL, O	2012		26	\N	3
2944	RC	Data Mining aplicado ao caso de alunos com subsídio do núcleo de assistência estudantil da Universidade Federal do Rio Grande - FURG	LORENZ, W. ; WERHLI, A. V. ; EMMENDORFER, L. R.	2011		22	\N	3
2945	RC	Modelagem da Dinâmica do Fluxo Granular Através de Autômatos Celulares e Simulação Baseada em Agentes	SILVEIRA, J. ; PAES, T. ; ADAMATTI, D. F. ; EMMENDORFER, L. R.	2010		22	\N	3
2946	AP	EXPLORATION E EXPLOITATION: UM OLHAR NO SETOR DE REFINO DE PETRÓLEO SOB A DIMENSÃO DO APRENDIZADO ORGANIZACIONAL	SATT, Sergio ; RIBEIRO, Luciano Maciel	2012	25-35	23	\N	3
2947	AP	Gestão de projetos ambientais: responsabilidade social transformada em diferencial competitivo	PINTO, D. C. D. ; RIBEIRO, Luciano Maciel	2009	9-28	23	\N	3
2948	AP	A importância da TI para a competitividade das micro e pequenas empresas	RIBEIRO, Luciano Maciel ; SATT, Sergio	2008	11-24	23	\N	3
2949	TC	AVALIANDO A ESTRATÉGIA DO PARQUE TECNOLÓGICO OCEANTEC A PARTIR DA UTILIZAÇÃO DA FERRAMENTA ESTRATEGIGRAMA	RIBEIRO, Luciano Maciel ; BOTELHO, S. S. C. ; DUARTE FILHO, N. L.	2012		23	\N	3
2950	TC	REVISÃO DOS CONCEITOS DE EXPLORATION E EXPLOITATION ASSOCIADOS AO SETOR DE REFINO DE PETRÓLEO	RIBEIRO, Luciano Maciel ; SATT, Sergio	2012		23	\N	3
2951	TC	JAZZ E EDUCAÇÃO A DISTÂNCIA: OS DESAFIOS E RESPOSTAS NOS POLOS PRESENCIAIS. In:	RIBEIRO, Luciano Maciel ; Sperotto, Rosária Ilgenfritz	2011		23	\N	3
2952	TC	Analisando as interações realizas no Fórum de um curso ministrado na modalidade Educação a Distância	RIBEIRO, Luciano Maciel ; IRIONDO, WALTER RUBEN OTERO	2011		23	\N	3
2953	TC	JAZZ E EDUCAÇÃO A DISTÂNCIA: OS DESAFIOS E RESPOSTAS NOS POLOS PRESENCIAIS	RIBEIRO, Luciano Maciel ; Sperotto, Rosária Ilgenfritz	2011		23	\N	3
2954	TC	UMA ANÁLISE DAS DIFICULDADES DE INVESTIMENTO NAS MPEs PELA BAIXA UTILIZAÇÃO DE FERRAMENTAS DE GESTÃO	RIBEIRO, Luciano Maciel ; SATT, Sergio	2010		23	\N	3
2955	TC	Avaliação de interações assíncronas baseadas em texto em Ambientes Virtuais de Ensino Aprendizagem	IRIONDO, WALTER RUBEN OTERO ; RIBEIRO, Luciano Maciel	2010		23	\N	3
2956	TC	Avaliação de Fóruns de discussão nos cursos de Educação a Distância: desafios metodológicos e resultados empíricos	IRIONDO, WALTER RUBEN OTERO ; RIBEIRO, Luciano Maciel	2010		23	\N	3
2957	TC	Educação a Distância: resultados empíricos da avaliação de Fóruns de discussão	IRIONDO, WALTER RUBEN OTERO ; RIBEIRO, Luciano Maciel	2010		23	\N	3
2958	AP	Space D*	Silveira, Luan ; Maffei, Renan Q. ; Botelho, Silvia S. C. ; Drews, Paulo L. ; Bicho, Alessandro de L. ; DUARTE FILHO, Nelson Lopes	2012	1-11	24	\N	3
2977	TC	Estimando Atrasos em Redes de Computadores Através de Sistemas de Coordenadas - A Ferramenta Euclideana	MADRUGA, Felipe ; DUARTE FILHO, Nelson Lopes ; COELHO, Rafael ; PIAS, Marcelo	2008	51-58	24	\N	3
2978	TC	Using Game Engines in Digital Manufacturing through Immersive and Collaborative Visualization Systems	BOTELHO, Silvia Silva da Costa ; DUARTE FILHO, Nelson Lopes ; Tyska, J ; MARCOS, Pedro ; Maffei, Renan ; OLIVEIRA, Rodrigo Ruas ; OLIVEIRA, R. R. ; HAX, V.	2008	101-105	24	\N	3
2979	RE	Rastreamento e imersão 3d para visualização de estruturas navais e offshore	SCHROEDER, G. ; ESPINDOLA, Danubia ; BOTELHO, Silvia Silva ; DUARTE FILHO, Nelson Lopes	2012	1-4	24	\N	3
2980	RE	Rastreamento em Tempo Real em Ambientes de Construção e Montagem: o Caso da Indústria Naval	Santos, E. ; Duarte Filho, Nelson L. ; Botelho, Silvia S. C.	2012	1-4	24	\N	3
2981	RE	Interactive Virtual Worlds in Brazilian Digital Television	Tavares, D.C. ; BOTELHO, Silvia Silva ; Marube, N.N. ; DUARTE FILHO, Nelson Lopes	2010	1-4	24	\N	3
2982	RE	DSMDB: A Distributed Shared Memory Approach for Building Replicated Database Systems	DUARTE FILHO, Nelson Lopes ; PEDONE, Fernando Lopes	2008	41-44	24	\N	3
2983	RC	RFID in Shipbuilding - Proposed Case Study Involving Shipyard in Brazil	DUARTE FILHO, Nelson Lopes ; BOTELHO, Silvia Silva da Costa	2011	50-51	24	\N	3
2984	AP	Effects of RegCM3 parameterizations on simulated rainy season over South America	da Rocha, RP ; Cuadra, SV ; Reboita, MS ; Kruger, LF ; Ambrizzi, T ; KRUSCHE, N.	2012	253-265	25	\N	3
2985	AP	Entendendo o Tempo e o Clima na América do Sul	REBOITA, M. S. ; KRUSCHE, N. ; REBOITA, M. S. ; Ambrizzi, T ; DA ROCHA, R. P.	2012	18-29	25	\N	3
2986	AP	Diagnóstico Qualitativo da Poluição Atmosferica em Rio Grande -RS, 2000 a 2002	NÓBREGA, M. R. ; KRUSCHE, N.	2011	129-150	25	\N	3
2987	AP	Estimativa da altura da camada limite na região de Rio Grande, RS	SARAIVA, L. B. ; KRUSCHE, N.	2011	55-58	25	\N	3
2988	AP	Simulação de nevoeiros no litoral sul do Brasil	GOMES, C.S. ; KRUSCHE, N. ; ROCHA, R. P. da	2011	235-237	25	\N	3
2989	AP	Extreme Storm Surges in the south of Brazil: Atmospheric Conditions and shore erosion	PARISE, C. K. ; CALLIARI, L. J. ; KRUSCHE, N.	2009	175-188	25	\N	3
2990	CL	A Camada Limite Planetária	MORAES, O. L. L. ; Zimermann, H. R. ; TIECHRIEB, C. A. ; MAGNAGO, R. O. ; CARNEIRO, J. V. ; KRUSCHE, N. ; ALVES, R. ; DEGRAZIA, G. A. ; ACEVEDO, O. ; FISCH, G.	2010	7-238	25	\N	3
2991	TC	Aquecimento Global avaliado pela Comparação entre Modelo Climático Global Educacional e Reanálise NCEP/NCAR no período 1958 a 2010	Gambetá-Leite, M. R. S. ; Gomes, C. S. ; Krusche, N	2012	1-4 CDROM	25	\N	3
2992	TC	Estudo de Caso: Simulação Numérica das alterações causadas pelas Mudanças na Excentricidade e Obliquidade da Terra	SPOLAVORI, A. ; Krusche, N	2012	1-5-CDROM	25	\N	3
2993	TC	Simulação de Nevoeiros de Advecção em Rio Grande, RS, Brasil: Análise das Condições Iniciais e de Fronteira em Modelo de Mesoescala	Gomes, C. S. ; Gambetá-Leite, M. R. S. ; SPOLAVORI, A. ; Krusche, N ; ROCHA, R. P. da	2012	1-5-CDROM	25	\N	3
2994	TC	CARACTERIZAÇÃO DA PRECIPITAÇÃO DE RIO GRANDE, RS, ENTRE 1991 A 2010	KRUSCHE, N. ; Reboita, MS	2012	1 CD-ROM-5 CD-ROM	25	\N	3
2995	TC	A UTILIZAÇÃO DE SISTEMAS MULTIAGENTES PARA A MODELAGEM DE MUDANÇAS CLIMÁTICAS	Gonçalves, G. I. P. ; KRUSCHE, N. ; COSTA, A. C. R.	2012	1 CD-ROM-5 CD-ROM	25	\N	3
2996	TC	Padrões de Precipitação no Sul do Brasil: Comparação entre Observação e Reanálise	SANTOS, M. B. ; KRUSCHE, N.	2009	1-7	25	\N	3
2997	TC	Sistema Integrado de Monitoramento do Tempo e do Clima do Sul do Brasil	KRUSCHE, N. ; ALVES, R. ; MORAES, O. L. L.	2009	1-7	25	\N	3
2998	TC	Avaliação das Brisas Marítimas na região de Rio Grande, RS, na Primavera de 2006	SARAIVA, L. B. ; KRUSCHE, N.	2009	1-7	25	\N	3
2999	TC	Nevoeiros na Região Litorânea do Sul do Brasil	GOMES, C.S. ; KRUSCHE, N.	2009	1-7	25	\N	3
3000	TC	Simulação Climática para o Sul do Brasil com Diferentes Projeções Cartográficas	GOMES, C.S. ; REBOITA, M. S. ; KRUGER, L. F. ; KRUSCHE, N.	2009	1-7	25	\N	3
3001	TC	Validação de Simulação Climática da Camada Limite Planetária na Região Costeira do Sul do Brasil	KRUSCHE, N. ; ROCHA, R. P. da	2009	1-7	25	\N	3
3002	TC	Concepções dos Estudantes sobre Conceitos que embasam a Compreensão de Mudanças Climáticas	KRUSCHE, N. ; CAPPELLETTO, E. ; PEREIRA, N.	2009	1-7	25	\N	3
3003	TC	Previsão Climática de Ensemble utilizando o Modelo EDGCM	FRANZEN, M. ; MAIER, É. L. B. ; KRUSCHE, N.	2008	1-6	25	\N	3
3004	TC	Padrões Atmosféricos Sinóticos geradores de Marés Meteorológicas Intensas na Praia do Cassino, RS	PARISE, C. K. ; CALLIARI, L. J. ; KRUSCHE, N.	2008	1-6	25	\N	3
3005	TC	Estrutura e Manutenção do Banco de Dados Meteorológicos da Universidade Federal do Rio Grande	MENDOZA, M. ; KRUSCHE, N. ; LANAU, L.	2008	1-6	25	\N	3
3006	TC	Influência Climática na Safra de Penaeus (Farfantepenaeus) Paulensis Perez-Farfante, no períodoentre 1971 e 1972 no Estuário da Lagoa do Patos, Rio Grande do Sul, Brasil	MOREIRA, R. P. ; KRUSCHE, N.	2008	1-6	25	\N	3
3007	RC	Simulações de Mudanças Climáticas usando Sistemas Multiagentes	Gonçalves, G. I. P. ; ROCHA COSTA, A. C. ; Krusche, N	2012	1-1-CDROM	25	\N	3
3008	RC	Influência das oscilações sul sobre o perfil subaéreo da praia do Cassino, Rio Grande, RS	GUIMARAES, P. ; PEREIRA, P. S. ; CALLIARI, L. J. ; Krusche, N	2011	1-1-CDROM	25	\N	3
3009	RC	Rocks, Rain, and Climate: a GIFT Workshop for Teachers in Brazil	PASSOW, M. ; KRUSCHE, N. ; CARNEIRO, C. D. R.	2010	1-1	25	\N	3
3010	RC	Predictability of Precipitation in Southern Brazil, a non-linear approach	dos Santos Albuquerque, P. E. ; KRUSCHE, N. ; BOTELHO, S. S. C.	2010	A13C-24-A13C-24	25	\N	3
3011	RC	Fog in the coastal region of southern Brazil: seasonal	KRUSCHE, N. ; Gomes, C. S.	2009	GC23B-05-GC23B-05	25	\N	3
3012	RC	Atmospheric Wind Spectral Gap: Comparison between Fourier and Wavelet Spectra	KRUSCHE, N.	2009	A13B-08-A13B-08	25	\N	3
3013	RC	Nevoeiros de Advecção em Rio Grande, de 2005 a 2007	GOMES, C.S. ; GUIMARAES, P. ; KRUSCHE, N. ; CALLIARI, L. J. ; PEREIRA, P. S.	2009	1-7	25	\N	3
3014	RC	O Intervalo Espectral em uma Região Homogênea	KRUSCHE, N.	2009	1-7	25	\N	3
3015	AP	O Modelo de Computação em Nuvem e sua Aplicabilidade	JACOBI, E. ; POPIOLEK, P. ; HAX, V. A. ; Tyska, J. C ; DUARTE FILHO, Nelson Lopes ; MENDIZABAL, O	2012	31-40	26	\N	3
3016	TC	Monitoramento e Análise do Impacto no Desempenho em Ambientes Virtualizados	POPIOLEK, P. ; MENDIZABAL, O. M.	2012		26	\N	3
3017	TC	Estudo da Viabilidade do ROS como Plataforma para IoT	HAX, V. A. ; BOTELHO, S. ; DUARTE FILHO, Nelson Lopes ; MENDIZABAL, O. M.	2012		26	\N	3
3018	TC	Log-Based Approach for Performance Requirements Elicitation and Prioritization	MENDIZABAL, O. M. ; SPIER, M. ; SAAD, R.	2012	297-302	26	\N	3
3021	RC	Virtualização de Servidores: Monitoramento de Recursos e Análise de Desempenho	POPIOLEK, P. ; MENDIZABAL, O	2012		26	\N	3
3022	RC	Gerência Dinâmica de Máquinas Virtuais para Computação em Nuvem	POPIOLEK, P. ; MENDIZABAL, O. M.	2011		26	\N	3
3023	RC	Implementação de uma Infraestrutura para Nuvem Computacional	JACOBI, E. B. ; HAX, V. A. ; Tyska, J. C ; DUARTE FILHO, Nelson Lopes ; MENDIZABAL, O. M.	2011		26	\N	3
3024	RC	Elicitação de Requisitos para o Desenvolvimento de Ferramentas Educacionais para o Ensino de Organização e arquitetura de Computadores	WIECZOREK, I. A. ; MENDIZABAL, O. M. ; MEINHARDT, Cristina	2011		26	\N	3
3026	AP	An Array-Based Test Circuit for Fully Automated Gate Dielectric Breakdown Characterization	Keane, John ; Venkatraman, Shrinivas ; BUTZEN, P. F. ; KIM, C. H.	2011	787-895	27	\N	3
3027	AP	Leakage Analysis Considering the Effect of Inter-Cell Wire Resistance for Nanoscaled CMOS Circuits	BUTZEN, P. F. ; DAL BEM, V. ; REIS, A. I. ; RIBAS, R. P.	2010	192-200	27	\N	3
3028	AP	Standby Power Consumption Estimation by Interacting Leakage Current Mechanisms in Nanoscaled CMOS Digital Circuits	BUTZEN, P. F. ; ROSA JR, L. S. ; CHIAPPETTA F., E.J.D. ; REIS, A. I. ; REIS, A. I. ; RIBAS, R. P.	2010	247-255	27	\N	3
3029	AP	Transistor Network Restructuring Against NBTI Degradation	BUTZEN, P. F. ; Dal BEM, V. ; REIS, A. I. ; REIS, A. I. ; RIBAS, R. P.	2010	1298-1303	27	\N	3
3030	CL	Leakage Current in Sub-Micrometer CMOS Gates	BUTZEN, P. F. ; RIBAS, R. P.	2009	211-240	27	\N	3
3031	CL	Efeitos Físicos Nanométricos em Circuitos Integrados Digitais	BUTZEN, P. F. ; DAL BEM, V. ; REIS, A. I. ; RIBAS, R. P.	2009	225-244	27	\N	3
3035	TC	Logic Gates Design for Aging Enhancement	BUTZEN, P. F. ; DAL BEM, V. ; REIS, A. I. ; RIBAS, R. P.	2011	1-4	27	\N	3
3036	TC	Area Overhead and Performance Impact of Regular Transistor Layout Design in Digital Integrated Circuit	DAL BEM, V. ; BUTZEN, P. F. ; MARRANGHELLO, F. S. ; REIS, A. I. ; RIBAS, R. P.	2011	67-70	27	\N	3
3037	TC	Area impact analysis of via-configurable regular fabric for digital integrated circuit design	DAL BEM, V. ; BUTZEN, P. F. ; KLOCK, C. E. ; CALLEGARO, V. ; REIS, A. I. ; RIBAS, R. P.	2011	103-108	27	\N	3
3038	TC	Impact and optimization of lithography-aware regular layout in digital circuit design	DAL BEM, V. ; BUTZEN, P. F. ; MARRANGHELLO, F. S. ; REIS, A. I. ; RIBAS, R. P.	2011	279-284	27	\N	3
3039	TC	Designing NBTI Robust Gates	BUTZEN, P. F. ; DAL BEM, V. ; REIS, A. I. ; RIBAS, R. P.	2010	193-196	27	\N	3
3040	TC	Routing Resistance Influence in Loading Effect on Leakage Analysis	BUTZEN, P. F. ; REIS, A. I. ; RIBAS, R. P.	2009		27	\N	3
3041	TC	Loading Effect Analysis Considering Routing Resistance	BUTZEN, P. F. ; REIS, A. I. ; RIBAS, R. P.	2009		27	\N	3
3042	TC	Simple and Accurate Method for Fast Static Current Estimation in CMOS Complex Gates with Interaction of Leakage Mechanisms	BUTZEN, P. F. ; DA ROSA JUNIOR, L. S. ; CHIAPPETTA FILHO, E. J. D. ; MOURA, D. S. ; REIS, A. I. ; RIBAS, R. P.	2008	407-410	27	\N	3
3043	TC	Accurate Method for Subthreshold and Gate Leakage Current Estimation in CMOS Complex Gates	BUTZEN, P. F. ; DA ROSA JUNIOR, L. S. ; CHIAPPETTA FILHO, E. J. D. ; MOURA, D. S. ; REIS, A. I. ; RIBAS, R. P.	2008	23-26	27	\N	3
3044	TC	An array-based test circuit for fully automated gate dielectric breakdown characterization	Keane, John ; Venkatraman, Shrinivas ; BUTZEN, P. F. ; KIM, C. H.	2008		27	\N	3
3045	TC	Subthreshold and Gate Leakage Estimation in Complex Gates	BUTZEN, P. F. ; ROSA JR, L. S. ; CHIAPPETTA F., E.J.D. ; MOURA, D. S. ; REIS, A. I. ; RIBAS, R. P.	2008		27	\N	3
3046	RC	Projeto de um Somador Tolerante a Falhas com Baixo Consumo de Potência	ZIMPECK, A. L. ; AGUIAR, Y. Q. ; MACIEL, B. ; MEINHARDT, C. ; BUTZEN, P. F.	2011	1-1	27	\N	3
3047	RC	Avaliação do Desempenho e Consumo de Potência de Portas Lógicas CMOS em Tecnologias Nanométricas	STERZ, A. P. ; NUNES, C. S. ; MEINHARDT, C. ; BUTZEN, P. F.	2011	1-1	27	\N	3
3048	RC	Projeto de Flip-Flops tipo D com Baixo Consumo de Potência	BRUN, J. V. ; BUTZEN, P. F. ; MEINHARDT, C.	2011	1-1	27	\N	3
3049	RC	Otimização do Dimensionamento dos Transistores de um Circuito Somador para Redução de Atrasos e Consumo de Potência	AGUIAR, Y. Q. ; MACIEL, B. ; ZIMPECK, A. L. ; BUTZEN, P. F. ; MEINHARDT, C.	2011	1-1	27	\N	3
3050	RC	Avaliação de Famílias Lógicas para Circuitos com Baixo Consumo de Potência	NUNES, C. S. ; SILVA, A. N. ; MEINHARDT, C. ; BUTZEN, P. F.	2011	1-1	27	\N	3
3051	RC	Avaliação da Eficácia de Modelos de Transistores no Projeto de Circuitos com Baixo Consumo de Energia	SILVA, A. N. ; NUNES, C. S. ; MEINHARDT, C. ; BUTZEN, P. F.	2011	1-1	27	\N	3
3052	RC	Projeto de um Bloco de Memória SRAM na Tecnologia de 16nm	GOMES, I. A. C. ; BUTZEN, P. F. ; MEINHARDT, C.	2011	1-1	27	\N	3
3053	RC	Evaluation of Standard Cell Libraries with Different Templates and Gate design approaches	SILVA, D. C. ; BUTZEN, P. F. ; REIS, A. I. ; RIBAS, R. P.	2009		27	\N	3
3054	RC	A Simple Model to Estimate Intrinsic Power Consumption in CMOS Logic Gates	CHIAPPETTA F., E.J.D. ; BUTZEN, P. F. ; ROSA JR, L. S. ; REIS, A. I. ; RIBAS, R. P.	2008		27	\N	3
3055	RC	Fast Algorithm to Leakage Power Reduction by Input Vector Control	MOURA, D. S. ; BUTZEN, P. F. ; ROSA JR, L. S. ; REIS, A. I. ; RIBAS, R. P.	2008		27	\N	3
3061	CL	Self-Localization and Mapping for Underwater Autonomous Vehicles	BOTELHO, S. S. C. ; OLIVEIRA, G. L. ; DREWS JR, P. L. J. ; FIGUEIREDO, M. ; HAFFELE, C.	2010	365-382	28	\N	3
3062	TC	Efficient Change Detection in 3D Environment for Autonomous Surveillance Robots based on Implicit Volume	VIEIRA, A. W. ; DREWS JR, P. L. J. ; CAMPOS, M. F. M.	2012		28	\N	3
3063	TC	Tracking System for Underwater Inspection Using Computer Vision	DREWS JR, P. L. J. ; KUHN, V. N. ; GOMES, S. C. P.	2012		28	\N	3
3065	TC	Controlling a Inspection ROV Using Low Cost Sensors	KUHN, V. N. ; DREWS JR, P. L. J. ; GOMES, S. C. P.	2012		28	\N	3
3069	TC	Filtragem e Estimação de Estados com Restrições Aplicado ao SLAM Visual	OLIVEIRA, V. M. ; DREWS JR, P. L. J. ; OLIVEIRA	2012		28	\N	3
3070	TC	A Terrain-Based Path Planning for Mobile Robots with Bounded Curvature	DREWS JR, P. L. J. ; MACHARET, D. G. ; CAMPOS, M. F. M.	2012		28	\N	3
3073	TC	Aprendizado Ativo e Semi-Supervisionado na Classificacao de Microalgas	DREWS JR, P. L. J. ; COLARES, R. G. ; MACHADO, P. N. ; FARIA, M. F. ; DETONI, A. M. S. ; TAVANO, V. M.	2012		28	\N	3
3078	TC	Computer Vision Algorithm for Detecting Wear in Teeth	MEIRELES, A. B. ; CASAS, E. B. L ; CORNACCHIA, T. M. ; CAMPOS, M. F. M. ; ALVES NETO,A. ; DREWS JR, P. L. J.	2010	1-4	28	\N	3
3079	TC	Novelty Detection and 3D Shape Retrieval using Superquadrics and Multi-Scale Sampling for Autonomous Mobile Robots	DREWS JR, P. L. J. ; NUNEZ, P. ; ROCHA, R. P. P. ; CAMPOS, M. F. M. ; DIAS, J.	2010	3635-3640	28	\N	3
3080	TC	Detecção de Mudanças e Recuperação de Forma em Mapas 3D Baseados em Nuvens de Pontos	DREWS JR, P. L. J. ; CAMPOS, M. F. M.	2010	1-8	28	\N	3
3081	TC	Crowd Behavior Analysis under Cameras Network Fusion using Probabilistic Methods	DREWS JR, P. L. J. ; QUINTAS, J. ; DIAS, J. ; ANDERSSON, M. ; NYG RDS, J. ; RYDELL, J.	2010	1-8	28	\N	3
3084	TC	Detecção de Mudanças e Recuperação de Forma em Mapas 3D Baseados em Nuvens de Pontos	DREWS JR, P. L. J. ; ROCHA, R. P. P. ; DIAS, J. ; CAMPOS, M. F. M.	2010	1-7	28	\N	3
3085	TC	Probabilistic LMA-Based Classification of Human Behaviour Understanding Using Power Spectrum Techinique	KHOSHHAL, K. ; ALIAKBARPOUR, H. ; QUINTAS, J. ; DREWS JR, P. L. J. ; DIAS, J.	2010	1-7	28	\N	3
3086	TC	Change Detection in 3D Environments Based on Gaussian Mixture Model and Robust Structural Matching for Autonomous Robotic Applications	NUNEZ, P. ; DREWS JR, P. L. J. ; BANDERA, A. ; ROCHA, R. P. P. ; CAMPOS, M. F. M. ; DIAS, J.	2010	2633-2638	28	\N	3
3087	TC	Growing Cell Structures applied to Sensor Fusion and SLAM	BOTELHO, S. S. C. ; HAFFELE, C. ; FIGUEIREDO, M. ; DREWS JR, P. L. J. ; OLIVEIRA, G. L.	2010		28	\N	3
3088	TC	Methods for Assessing Dental Wear in Bruxism	MEIRELES, A. B. ; CORNACCHIA, T. M. ; CASAS, E. B. L ; BASTOS, F. S. ; GODOY, G. C. ; MARQUES, F. S. ; DREWS JR, P. L. J. ; ALVES NETO,A. ; CAMPOS, M. F. M.	2009	1-6	28	\N	3
3089	TC	Multidisciplinary Approach In Tooth Wear: Biomechanical Aspects And Computational View	MEIRELES, A. B. ; CORNACCHIA, T. M. ; CASAS, E. B. L ; GODOY, G. C. ; MARQUES, F. S. ; DREWS JR, P. L. J. ; ALVES NETO,A. ; CAMPOS, M. F. M.	2009	1-10	28	\N	3
3090	TC	Novelty Detection and 3D Shape Retrieval based on Gaussian Mixture Models for Autonomous Surveillance Robotics	NUNEZ, P. ; DREWS JR, P. L. J. ; ROCHA, R. P. P. ; CAMPOS, M. F. M. ; DIAS, J.	2009	4724-4730	28	\N	3
3091	TC	Data Fusion Calibration for a 3D Laser Range Finder and a Camera using Inertial Data	NUNEZ, P. ; DREWS JR, P. L. J. ; ROCHA, R. P. P. ; DIAS, J.	2009	1-6	28	\N	3
3092	TC	Object Shape Retrieval through Grasp Exploration	FARIA, D. R. ; PRADO, J. A. S. ; DREWS JR, P. L. J. ; DIAS, J.	2009	1-6	28	\N	3
3095	TC	Visual Odometry and Mapping for Underwater Autonomous Vehicles	BOTELHO, S. S. C. ; DREWS JR, P. L. J. ; OLIVEIRA, G. L. ; FIGUEIREDO, M. ; HAFFELE, C.	2009	1-6	28	\N	3
3096	TC	Self Organizing Maps for AUVs Mapping	BOTELHO, S. S. C. ; HAFFELE, C. ; OLIVEIRA, G. L. ; FIGUEIREDO, M. ; DREWS JR, P. L. J.	2009	1-5	28	\N	3
2540	TC	Sobre Números Fuzzy Intervalares	DIMURO, Graçaliz Pereira ; COSTA, A. C. R. ; MUSSI, R. L.	2010	162-169	4	2540	3
3103	TC	Controle em Profundidade de um Veículo Subaquático do Tipo ROV	CENTENO, M. L. ; GOMES, S. C. P. ; PEREIRA, I. M. ; DINIZ, Claudio Machado ; DREWS JR, P. L. J. ; BOTELHO, S. S. C.	2008	1-6	28	\N	3
3105	RC	The spatial change detection problem in robotics: A probabilistic approach based on Mixture of Gaussians	GUTIERREZ, M. A. ; MANSO, L. J. ; SILVA FILHO, S. C. ; DREWS JR, P. L. J. ; NUNEZ, P.	2012		28	\N	3
3106	RC	Self-Organizing Mapping of Robotic Environments Based on Neural Networks	FIGUEIREDO, M. ; BOTELHO, S. S. C. ; DREWS JR, P. L. J. ; HAFFELE, C.	2012		28	\N	3
3107	RC	Instrumentação Subaquática Utilizando Sonar	MORITA, L. Y. ; DREWS JR, P. L. J.	2011		28	\N	3
3108	RC	Inspeção de Cabos Subaquáticos Utilizando Visão Computacional	TURRA, T. A. ; DREWS JR, P. L. J.	2011		28	\N	3
3109	RC	Detecção de Mudanças em Nuvens de Pontos Tridimensionais	SILVA FILHO, S. C. ; DREWS JR, P. L. J.	2011		28	\N	3
3110	RC	Aprendizado Semi-Supervisionado na Classificação de Algas	MACHADO, P. N. ; DREWS JR, P. L. J.	2011		28	\N	3
3111	RC	Filtragem de Estados Com Restrições de Igualdade Seguindo a Técnica de Projeção Estimativa aplicada sobre o Filtro de KalmanTENDIDO	OLIVEIRA ; DREWS JR, P. L. J. ; OLIVEIRA, V. M.	2011		28	\N	3
3112	AP	Lossless and near-lossless digital angiography coding using a two-stage motion compensation approach	SANTOS, Rafael Augusto Penna dos ; SCHARCANSKI, J	2008	379-387	29	\N	3
3114	TC	Educação Ubíqua: A Tecnologia dando Suporte ao Processo de Ensino-aprendizagem em Qualquer Lugar, em Qualquer Instante	IAHNKE, S. L. P. ; BOTELHO, S. S. C. ; SANTOS, Rafael Augusto Penna dos ; OLIVEIRA, R. R. ; CARVALHO, J. T.	2010		29	\N	3
3115	RE	H-Env: An architecture to create intelligent hyper-environments using ubiquitous computing and virtual reality	CARVALHO, J. T. ; BOTELHO, S. S. C. ; OLIVEIRA, R. R. ; DOSSANTOS, R ; SANTOS, E.	2010		29	\N	3
3116	AP	Uma ferramenta de autoria síncrona acessível para cegos: estudo de caso no curso PROINESP. RENOTE	BARWALDT, Regina ; SANTAROSA, Lucila Maria Conti ; PASSERINO, Liliana Maria	2009	01-10	30	\N	3
3123	TC	Recursos Acessíveis: uma alternativa para as PNEEs em EAD	BARWALDT, Regina ; SANTAROSA, Lucila Maria Costi	2010		30	\N	3
3124	TC	EVOC: uma solução para incluir as PNEEs em um curso na modalidade à distância	BARWALDT, Regina ; SANTAROSA, Lucila Maria Conti	2009		30	\N	3
3125	RE	Proposta de um Modelo Fisioterápico para Ambientes Assistivos por Computação	JUNG, M. O. ; BARBOSA, R. M. ; BARWALDT, Regina	2012		30	\N	3
3126	RC	Assistive Technologies: Accessibility to People with Disabilities	ADAMATTI, D. F. ; BARWALDT, Regina ; FELIPPE, C. I. M.	2012	1-2	30	\N	3
3127	RC	Tecnologias Assistivas: Recursos e Serviços Utilizados para a Inclusão Sócio-Digital de Pessoas com Deficiências	BARWALDT, Regina ; ADAMATTI, D. F. ; FELIPPE, C. I. M. ; SALOMAO, H. L. R.	2011		30	\N	3
3128	AP	Robustness of multimodal biometric fusion methods against spoof attacks	Rodrigues, Ricardo N. ; Ling, Lee Luan ; Govindaraju, Venu	2009	169-179	31	\N	3
3130	TC	Assessment of Biometric Robustness Against Spoof Attacks	Rodrigues, Ricardo N. ; Govindaraju, Venu	2010		31	\N	3
3131	TC	Evaluation of Biometric Spoofing in a Multimodal System	Rodrigues, Ricardo N. ; Niranjan Kamat ; Govindaraju, Venu	2010		31	\N	3
3132	TC	Generation of Handwriting by Active Shape Modeling and Global Local Approximation (GLA) Adaptation	CHOWRIAPPA, A. ; Rodrigues, Ricardo N. ; KESAVADAS, T. ; Govindaraju, Venu ; BISANTZ, A.	2010		31	\N	3
3133	TC	Uma Nova Abordagem Robusta de Fusão Biométrica	Ling, Lee Luan ; Rodrigues, Ricardo N. ; LEE, J. C.	2009		31	\N	3
3135	TC	Fusão biométrica com lógica nebulosa	RODRIGUES, Ricardo Nagel ; LING, L. L.	2008		31	\N	3
2864	TC	Sobre Números Fuzzy Intervalares	DIMURO, G. P. ; COSTA, A. C. R. ; MUSSI, R. L.	2010	162-169	18	2540	3
3137	TC	Visual Tracking Based on 3D Probabilistic Reconstruction	SIMAS, Gisele ; DE BEM, Rodrigo Andrade ; NOVELO, Lucas ; FICKEL, G. ; BOTELHO, Silvia Silva da Costa	2010	403-409	32	\N	3
3140	TC	Utilizando Visão Computacional para Reconstrução Probabilística 3D e Rastreamento de Movimentos	SIMAS, Gisele ; FICKEL, G. ; NOVELO, Lucas ; BOTELHO, Silvia Silva da Costa ; DE BEM, Rodrigo Andrade	2009	135-140	32	\N	3
3141	RE	Projeto de um Sistema de Gerenciamento de Laboratórios de Ensino	CAMACHO, PABLO ; BIAZZI, M. ; Chaves, Talles ; FRAZON, Jesuane ; GOMES, Janine ; PARULLA, Bianca ; SCHOLLMEIER, Daniele ; SOUZA, Rosemery ; HAX, Vinícius ; DE BEM, Rodrigo Andrade	2010	1-3	32	\N	3
3142	RE	Remasterização do Sistema Operacional Ubuntu para Laboratórios de Ensino	MÜLLER, Rodrigo ; SILVEIRA, Gabriel ; PEREIRA, Lázaro ; AFONSO, Renato ; WEBER, Felipe ; DELEVEDOVE, Glauco ; DE BEM, Rodrigo Andrade	2010	1-2	32	\N	3
3143	RE	Utilizando Visão Computacional para Reconstrução Probabilística 3D e Rastreamento de Movimento	SIMAS, Gisele ; FICKEL, G. ; NOVELO, Lucas ; DE BEM, Rodrigo Andrade ; BOTELHO, Silvia Silva da Costa	2009	1-1	32	\N	3
3144	RE	Captura de Movimento Humano em Ambientes Sensoriados por Múltiplas Câmeras	SIMAS, Gisele ; BOTELHO, Silvia Silva da Costa ; DE BEM, Rodrigo Andrade ; NOVELO, Lucas ; SILVEIRA, L.	2008	1-1	32	\N	3
3145	RC	Recuperação de Imagens Baseada em Conteúdo Utilizando Dispositivos Móveis	GULARTE, A. ; THOMASI, C. ; DE BEM, Rodrigo Andrade ; ADAMATTI, D. F.	2011	1-1	32	\N	3
3146	RC	Rastreamento Visual baseado em Reconstrução Probabilística 3D	GOULART, M. G. ; DE BEM, Rodrigo Andrade ; SIMAS, Gisele ; BOTELHO, Silvia Silva da Costa	2011	1-1	32	\N	3
3147	AP	Abordagem Geométrica para Modulação de Conversores três Braços no Acionamento de Máquinas de Indução Bifásicas Simétricas e Assimétricas	VIEIRA, R. P. ; GASTALDINI, Cristiane ; AZZOLIN, Rodrigo Zelir ; PINHEIRO, Humberto ; GRÜNDLING, Hilton Abílio	2012	14-24	33	\N	3
3148	AP	Discrete-time Sliding Mode Speed Observer for Sensorless Control of Induction Motor Drives	VIEIRA, R. P. ; GASTALDINI, Cristiane ; AZZOLIN, Rodrigo Zelir ; GRÜNDLING, Hilton Abílio	2012	1-8	33	\N	3
3149	CL	Electrical Parameter Identification of Single-Phase Induction Motor by RLS Algorithm. Induction Motor. Vienna	VIEIRA, R. P. ; AZZOLIN, Rodrigo Zelir ; GASTALDINI, Cristiane ; GRÜNDLING, Hilton Abílio	2012		33	\N	3
3150	CL	A RMRAC Parameter Identification Algorithm Applied to Induction Machines. Electric Machines and Drives. Vienna	AZZOLIN, Rodrigo Zelir ; GASTALDINI, Cristiane ; VIEIRA, R. P. ; GRÜNDLING, Hilton Abílio	2011		33	\N	3
3151	CL	Feedback Linearization of Speed-Sensorless Induction Motor Control with Torque Compensation. Electric Machines and Drives. Vienna	GASTALDINI, Cristiane ; AZZOLIN, Rodrigo Zelir ; VIEIRA, R. P. ; GRÜNDLING, Hilton Abílio	2011		33	\N	3
3152	TC	Discrete-time sliding mode approach for speed estimation of symmetrical and asymmetrical induction machines	VIEIRA, R. P. ; GASTALDINI, Cristiane ; AZZOLIN, Rodrigo Zelir ; GRÜNDLING, Hilton Abílio	2011	1819-1824	33	\N	3
3153	TC	Discrete-time sliding mode speed observer for induction machine drives	VIEIRA, R. P. ; GASTALDINI, Cristiane ; AZZOLIN, Rodrigo Zelir ; GRÜNDLING, Hilton Abílio	2011	213-218	33	\N	3
3154	TC	Simple PWM Approach for Modulation of Three-leg Inverters Driving Two-phase Symmetrical and Asymmetrical Machines	VIEIRA, R. P. ; AZZOLIN, Rodrigo Zelir ; GASTALDINI, Cristiane ; PINHEIRO, Humberto ; GRÜNDLING, Hilton Abílio	2010		33	\N	3
3155	TC	Electrical Parameters Identification of Hermetic Refrigeration Compressors with Single-Phase Induction Machines using RLS Algorithm	VIEIRA, R. P. ; AZZOLIN, Rodrigo Zelir ; GASTALDINI, Cristiane ; GRÜNDLING, Hilton Abílio	2010		33	\N	3
3156	TC	A RMRAC Parameter Identification Algorithm applied to SPIM	AZZOLIN, Rodrigo Zelir ; GASTALDINI, Cristiane ; VIEIRA, R. P. ; GRÜNDLING, Hilton Abílio	2010		33	\N	3
3157	TC	An Adaptive Feedback Linearization Control for Induction Motor	GASTALDINI, Cristiane ; AZZOLIN, Rodrigo Zelir ; VIEIRA, R. P. ; GRÜNDLING, Hilton Abílio	2010		33	\N	3
3158	TC	Uma Abordagem Geométrica para Modulação de Conversores Três Braços Acionando Máquinas de Duas Fases Simétricas e Assimétricas	VIEIRA, R. P. ; AZZOLIN, Rodrigo Zelir ; GASTALDINI, Cristiane ; PINHEIRO, Humberto ; GRÜNDLING, Hilton Abílio	2010		33	\N	3
3159	TC	Algoritmo RMRAC Aplicado na Identificação dos Parâmetros Elétricos de Motores de Indução Monofásicos	AZZOLIN, Rodrigo Zelir ; GASTALDINI, Cristiane ; VIEIRA, R. P. ; GRÜNDLING, Hilton Abílio	2010		33	\N	3
3160	TC	A MRAC Parameter Identification Algorithm for Three-Phase Induction Motors	AZZOLIN, Rodrigo Zelir ; GRÜNDLING, Hilton Abílio	2009	273-278	33	\N	3
3161	TC	A Comparison of Speed-Sensorless Induction Motor Control with Torque Compensation	GASTALDINI, Cristiane ; AZZOLIN, Rodrigo Zelir ; GRÜNDLING, Hilton Abílio	2009	1480-1485	33	\N	3
3162	TC	Parameter Identification of a Single-phase Induction Motor Using Rls Algorithm	VIEIRA, R. P. ; AZZOLIN, Rodrigo Zelir ; GRÜNDLING, Hilton Abílio	2009	517-523	33	\N	3
3163	TC	A RMRAC parameter identification algorithm for induction motors	AZZOLIN, Rodrigo Zelir ; GRÜNDLING, Hilton Abílio	2009	1171-1176	33	\N	3
3164	TC	A speed-sensorless induction motor servomechanism using feedback linearization control	GASTALDINI, Cristiane ; AZZOLIN, Rodrigo Zelir ; GRÜNDLING, Hilton Abílio	2009	493-497	33	\N	3
3165	TC	A Sensorless Single-Phase Induction Motor drive with a MRAC Controller	VIEIRA, R. P. ; AZZOLIN, Rodrigo Zelir ; GRÜNDLING, Hilton Abílio	2009		33	\N	3
3166	TC	Identificação dos Parâmetros Elétricos e Mecânicos de Motores de Indução Trifásicos para Acionamento Encoderless	EINLOFT, Diego ; AZZOLIN, Rodrigo Zelir ; GRÜNDLING, Hilton Abílio	2008		33	\N	3
3167	TC	Nova Modulação Space Vector para o Controle da Tensão do Ponto Central do Divisor Capacitivo do NPC	GRIGOLETTO, Felipe Bovolini ; GASTALDINI, Cristiane ; TOMM, Fabio ; BELTRAME, Fernando ; SARTORI, Hamilton ; MARTINS, Matheus ; DIAS, Milena ; AZZOLIN, Rodrigo Zelir ; BERNARDES, Thiago ; PINHEIRO, Humberto	2008		33	\N	3
3168	RC	Projeto Pré Vestibular Popular Identidade Jovem. 2007. (Curso de curta duração ministrado/Outra)	AZZOLIN, Rodrigo Zelir	0		33	\N	3
3169	AP	Sistema baseado em Inteligência Artificial para Agrupamento e Classificação de Dados na Construção Naval	Souza, K ; Botelho, Silvia S. C.	2012	60-67	34	\N	3
3171	AP	Artefatos educacionais com memória cinética Topobo: uma abordagem para o currículo dos anos iniciais. RENOTE	M, Santin ; da Silva Costa Botelho, S.	2012	1-9	34	\N	3
3173	AP	Exergames no ciberespaço: uma possibilidade para a educação física	VAGHETTI, C. A. O. ; MUSTARO, P. N. ; BOTELHO, S. S. C.	2011	32	34	\N	3
3175	AP	Ambientes virtuais de aprendizagem na educação física: uma revisão sobre a utilização de Exergames	VAGHETTI, C. A. ; BOTELHO, S. S. C.	2010	1-6	34	\N	3
3176	AP	Forecasting Electric Energy Demand using a Predictor Model based on Liquid State Machine	grando, n. ; CENTENO, T. M. ; BOTELHO, S. S. C. ; fontoura, f.	2010	40-53	34	\N	3
3177	AP	PRINCÍPIOS ERGONÔMICOS E USABILIDADE DE INTERFACES DE REALIDADE AUMENTADA EM AMBIENTES VIRTUAIS DE APRENDIZAGEM: VISÃO GERAL E TENDENCIAS	VAGHETTI, C. A. ; BOTELHO, S. S. C.	2010	1-6	34	\N	3
3179	AP	General Purpose Cave-like System for Visualization of Animated and 4D CAD Modeling	BOTELHO, S. S. C. ; DUARTE FILHO, Nelson Lopes ; Hax, V. A. ; Maffei, R. Q. ; Marcos, P. B. ; Ruas, R. R. ; Tyska, J. C ; Tyska Carvalho, Jonata	2010	1	34	\N	3
3182	AP	DESENVOLVIMENTO DE UMA PLATAFORMA MULTIDISCIPLINAR PARA AUTORIA DE JOGOS 3D INTERATIVOS E EDUCATIVOS	PINTO, Ivete ; BOTELHO, S. S. C. ; Souza, R. ; Sonego, T. ; COLARES, R. ; CAMPOS, R. L.	2009	1-8	34	\N	3
3184	AP	Sistema de predição de alarmes em processos industriais por classificação não-supervisionada	Braustein, S. ; A, Lerm ; Lerm, R. ; Werhli, A. ; BOTELHO, S. S. C. ; E, Lippe	2009	37-42	34	\N	3
3185	AP	Dimensional Reduction in the Protein Secondary Structure Prediction Nonlinear Method Improvements	SIMAS, G. ; BOTELHO, S. S. C. ; grando, n. ; COLARES, R.	2008	425-432	34	\N	3
3189	AA	TOPOBO: Aspectos motivacionais do uso da robótica com crianças. RENOTE	M, Santin ; Botelho, Silvia S. C. ; SILVA, J.	2012		34	\N	3
3190	AA	Internet of Things in Product-Service Systems - A Trend in Service Engineering	ESPÍNDOLA, D. ; DUARTE, N. ; BOTELHO, S. S. C. ; pereira, c. e.	2011		34	\N	3
3191	AA	Dimensional Reduction in the Protein Secondary Structure Prediction: Nonlinear Method Improvements	BOTELHO, S. S. C. ; SIMAS, G. ; COLARES, R.	2009		34	\N	3
3193	LP	Offshore and Marine Technology: Science and Innovation	DUARTE FILHO, N. L. (Org.) ; Botelho, Silvia S. C. (Org.) ; ESTEFEN, S. (Org.) ; E. C. PINTO (Org.) ; Giroldo, D (Org.)	2012		34	\N	3
3194	LP	Third Southern Conference on Computational Modeling	BOTELHO, S. S. C. (Org.) ; ROCHA, L. (Org.) ; D, Adamatti (Org.)	2010		34	\N	3
3195	LP	Simpósio de Modelagem Computacional do Sul	ROCHA, L. (Org.) ; BOTELHO, S. S. C. (Org.) ; D, Adamatti (Org.)	2009		34	\N	3
3196	LP	CONFERÊNCIA EM MODELAGEM COMPUTACIONAL DO SUL	BOTELHO, S. S. C. (Org.) ; ROCHA, L. (Org.) ; D, Adamatti (Org.)	2009		34	\N	3
3197	CL	Nonlinear Dimensional Reduction in Protein Secondary Structure Prediction. Forecasting Models - Methods and Applications	SIMAS, G. ; BOTELHO, S. S. C. ; COLARES, R. ; CORREA, U. B.	2010	65-81	34	\N	3
3198	CL	Using augmented state Kalman filter to localize multi autonomous underwater vehicles. Robot Localization and Map Building	BOTELHO, S. S. C. ; LEIVAS, G ; DREWS, P.	2010	33-41	34	\N	3
3203	TC	Estaleiros Virtuais Imersivos - A Realidade Virtual a serviço da Indústria Naval e Offshore	Botelho, Silvia S. C. ; Amaral, M.	2012		34	\N	3
3205	TC	Utilizando Máquinas de Estado Líquido para Reconhecimento de Padrões Temporais	NOVELLO, L. ; Botelho, Silvia S. C.	2012	1-6	34	\N	3
2835	CL	Semantical Concepts for a Formal Structural Dynamics of Situated Multiagent Systems	COSTA, A. C. R. ; DIMURO, G. P.	2008	139-154	18	2515	3
3210	TC	Artefatos educacionais com memória cinética Topobo: uma abordagem para o currículo dos anos iniciais	M, Santin ; Botelho, Silvia S. C. ; SILVA, J.	2012	1-6	34	\N	3
3213	TC	Parallel High Dimensional Self Organizing Maps Using CUDA	MORAES, F. ; Botelho, Silvia S. C. ; DUARTE, N.	2012	1-6	34	\N	3
3214	TC	ADA-TOPOBO: Um Ambiente Dual de Aprendizagem Utilizando Kits Educacionais	MOTA, F. ; SANTOS, I. ; ROSA, V. ; Botelho, Silvia S. C. ; Amaral, M.	2012	1-6	34	\N	3
3215	TC	Using Exergames as Social Networks: Testing the Flow Theory in the Teaching of Physical Education	VAGHETTI, C. A. O. ; SOUZA, P. O. ; DUARTE, M. A. ; da Silva Costa Botelho, S.	2012	1-6	34	\N	3
3217	TC	Utilizando Propagação de Crença Não Paramétrica para Rastreamento de Movimento com Mínimo Uso de Informação a Priori	SIMAS, G. ; Botelho, Silvia S. C.	2012	1-6	34	\N	3
3220	TC	TOPOBO: UMA NOVA FERRAMENTA PEDAGÓGICA PARA A EXPERIMENTAÇÃO EM CIÊNCIAS	M, Santin ; BOTELHO, S. S. C.	2011		34	\N	3
3224	TC	Ambientes virtuais de aprendizagem na Educaçao fisica: uma revisão sobre a utilização de exergames	VAGHETTI, C. A. ; BOTELHO, S. S. C.	2010	1-6	34	\N	3
3227	TC	Sistema de Predição de Alarmes em Plantas Industriais Baseado em Mapas Auto-Organizáveis	Braustein, S. ; A, Lerm ; Lerm, R. ; Werhli, A. ; BOTELHO, S. S. C. ; E, Lippe	2010	1-6	34	\N	3
3230	TC	A Visualização Mista nos Sistemas de Automação de Processos de Manutenção Preditiva de Máquinas da Indústria	ESPÍNDOLA, D. ; pereira, c. e. ; R, Henriques ; BOTELHO, S. S. C.	2010	1-6	34	\N	3
3237	TC	Cultura digital e Educação Física: problematizando a inserção de Exergames no currículo	VAGHETTI, C. A. ; BOTELHO, S. S. C. ; R, Sperotto	2010	1-6	34	\N	3
3238	TC	Cultura digital e Educação Física	VAGHETTI, C. A. ; R, Sperotto ; BOTELHO, S. S. C.	2010		34	\N	3
3243	TC	Odometry and Mapping for Underwater Autonoumous Vehicles	BOTELHO, S. S. C. ; LEIVAS, G ; DREWS, P.	2009	1-6	34	\N	3
3248	TC	Técnicas para redução de perturbações em imagens subaquáticas destinadas ao controle de AUVS	DUCHINSKI, M. ; CENTENO, T. M. ; BOTELHO, S. S. C.	2008	1-6	34	\N	3
3259	RE	Estudo da viabilidade do ROS como plataforma para IoT	Hax, V. A. ; Botelho, Silvia S. C. ; DUARTE FILHO, N. L. ; MENDIZABAL, O.	2012	1-6	34	\N	3
3260	RE	RFID in Shipbuilding - Proposed Case Study Involving Shipyard in Brazil	DUARTE, N. ; BOTELHO, S. S. C.	2011	1-4	34	\N	3
3261	RE	Robótica Educacional como proposta de Ensino	CAMPOS, R. L. ; BOTELHO, S. S. C. ; ANTIQUEIRA, L. ; ACOSTA, S.	2011	404-406	34	\N	3
3262	RE	JOGO ELETRÔNICO EDUCATIVO: INOVAÇÃO PARA PROMOÇÃO DA CIDADANIA	CAMPOS, R. L. ; SILVA, G. ; BOTELHO, S. S. C.	2011	1-4	34	\N	3
3263	RE	Interactive Virtual Worlds in Brazilian Digital Television	Tavares, D. ; Nyamasege, N ; BOTELHO, S. S. C. ; DUARTE, N.	2010	1-4	34	\N	3
3264	RE	Jogo Eletrônico Educativo: Visitando a Dimensão Social da EJA	SILVA, G. ; CAMPOS, R. L. ; BOTELHO, S. S. C.	2010	1-4	34	\N	3
3265	AP	A hardware DC motor emulator	ROSA, V. S. ; GERVINI, V. I. ; GOMES, S. C. P. ; BAMPI, S.	2008	5-16	35	\N	3
3266	TC	HW/SW FPGA Design for Active Control of Flexible Structures	SOARES, L. B. ; TERRES, M. A. S. M. ; GOMES, S. C. P. ; GERVINI, V. I. ; ROSA, V. S.	2012	1-6	35	\N	3
3267	TC	Emulador de Motor DC em Hardware	SCHUCH, L. W. ; ROSA, V. S.	2012	1-4	35	\N	3
3268	TC	TANQUE BATEDOR: UM ROBÔ TELEOPERADO PARA INSPEÇÃO EM AMBIENTES INÓSPITOS	Nunez, A. F. ; VEIGA, F. F. ; LONGHI, J. P. C. ; ROSA, V. S. ; OLIVEIRA, V. M.	2011	1-6	35	\N	3
3269	TC	An H.264 Deblocking Filter in FPGA with RGB Video Output	ROSA, V. S. ; Silva, L. M. ; BAMPI, S.	2010		35	\N	3
3270	TC	A low-cost hardware architecture binarizer design for the H.264/AVC CABAC entropy coding	Martins, A. L. M. ; ROSA, V. S. ; BAMPI, S.	2010	392-396	35	\N	3
3271	TC	High Performance Architectures for the Arithmetic Encoder of the H.264/AVC CABAC Entropy Coder	ROSA, V. S. ; Silva, L. M. ; BAMPI, S.	2010		35	\N	3
3272	TC	A hardware DC Motor emulator	ROSA, V. S. ; GERVINI, V. I. ; GOMES, S. C. P. ; BAMPI, S.	2010		35	\N	3
3273	TC	Uma Análise sobre Leis de Controle para Veículos Subaquáticos Não Tripulados	GOMES, S. C. P. ; ZEILMANN, A. P ; TERRES, M. A. S. M. ; SOARES, L. B. ; ROSA, V. S.	2010	1-4	35	\N	3
3275	TC	A high performance H.264 Deblocking Filter	ROSA, V. S. ; Altamiro A. Susin ; BAMPI, S.	2009		35	\N	3
3276	TC	Data storage using Compact Flash card and Hardware/Software Interface for FPGA Embedded Systems	SOARES, L. B. ; GERVINI, V. I. ; GOMES, S. C. P. ; ROSA, V. S.	2009	153-156	35	\N	3
3277	TC	Design of Electronic Interfaces to Control Robotic Systems Using FPGA	ROSA, A. L. M. ; TADEO, G. ; GERVINI, V. I. ; GOMES, S. C. P. ; ROSA, V. S.	2009	91-94	35	\N	3
3278	TC	A High Performance H.264 Deblocking Filter Hardware Architecture	ROSA, V. S. ; Altamiro A. Susin ; BAMPI, S.	2009	255-258	35	\N	3
3279	TC	Design of Hardware/Software board for the Real Time Control of Robotic Systems	Cassel, D. ; GERVINI, V. I. ; GOMES, S. C. P. ; ROSA, V. S.	2009	157-160	35	\N	3
3280	TC	VHDL generation of optimized FIR filters	DAITX, F. F. ; ROSA, V. S. ; COSTA, E. ; BAMPI, S. ; FLORES, P. F.	2008	1-5	35	\N	3
3281	TC	A Novel Hardware Architecture Dedicated to Binary Arithmetic Decoder Engines for the H.264/AVC CABAD	DEPRA, D. A. ; ROSA, V. S. ; BAMPI, S.	2008		35	\N	3
3282	TC	Design and Implementation of a High-Performance Architecture for Binarization Methods of Defined by H.264/AVC Standard	DEPRA, D. A. ; ROSA, V. S. ; BAMPI, S.	2008		35	\N	3
3283	TC	FPGA Implementation of a AC Motor Controller with a hardware/software codesign approach	MOREIRA, T. G. ; GUIMARAES JR., D. S. ; DINIZ, C. M. ; ROSA, V. S. ; GOMES, S. C. P.	2008		35	\N	3
3284	TC	A Novel Hardware Architecture Design for Binary Arithmetic Decoder Engines Based on Bitstream Flow Analysis	DEPRA, D. A. ; ROSA, V. S. ; BAMPI, S.	2008		35	\N	3
3285	TC	Construção de um canal de testes para estudo de interação fluido-estrutura	COELHO, J. F. L. ; PINTO, W. T. ; GOMES, S. C. P. ; ROSA, V. S. ; GERVINI, V. I. ; ROSA, A. L. M. ; Cassel, D. ; HARTMANN, E.	2008		35	\N	3
3286	TC	Desenvolvimento de Controladores para uma Plataforma Móvel Destinada ao Estudo da Interação Fluido-Estrutura	Cassel, D. ; ROSA, A. L. M. ; HARTMANN, E. ; PEREIRA, I. M. ; MOREIRA, T. G. ; GUIMARAES JR., D. S. ; GERVINI, V. I. ; ROSA, V. S. ; GOMES, S. C. P. ; COELHO, J. F. L. ; PINTO, W. T.	2008		35	\N	3
3287	AA	A Hardware DC Motor Emulator	ROSA, V. S. ; GERVINI, V. I. ; GOMES, S.C.P. ; BAMPI, S.	2010		36	\N	3
3288	AA	Desenvolvimento de interfaces para operação de uma plataforma de ensaios de embarcações	MEDEIROS, M. M. ; GERVINI, V. I. ; ROSA, V. S. ; GOMES, S.C.P.	2010		36	\N	3
3290	TC	Controle de Alto Desempenho para uma Plataforma Móvel Destinada ao Estudo da Interação Fluido Estrutura	ROSA, A. L. R. ; CASSEL, D. P. ; MEDEIROS, M. M. ; PEREIRA, I. M. ; TADEU, G. ; SOARES, L. B. ; GERVINI, V. I. ; ROSA, V. S. ; GOMES, S.C.P. ; PINTO, W. T. ; Coelho, J. F. L.	2008		36	\N	3
3291	TC	Construção de um Canal de Testes para a Interação Fluido Estrutura	Coelho, J. F. L. ; PINTO, W. T. ; GOMES, S.C.P. ; ROSA, V. S. ; GERVINI, V. I. ; ROSA, A. L. R. ; CASSEL, D. P. ; HARTMANN, E.	2008		36	\N	3
3292	TC	CONTROLE DE ROBÔ COM UM ELO FLEXÍVEL USANDO REDES WAVELETS NEURAIS	GERVINI, V. I. ; HEMERLY, E. M. ; GOMES, S.C.P.	2008		36	\N	3
3293	TC	CONTROLE Hinf DE UM MANIPULADOR FLEXÍVEL COM COMPENSAÇÃO DE ATRITO	MACHADO, C. C. ; GOMES, S.C.P. ; GUIMARAES JR, D. S. ; GERVINI, V. I. ; BORTOLI, A. L.	2008		36	\N	3
3294	TC	FRICTION COMPENSATION IN ROBOTIC ACTUATORS	GOMES, S.C.P. ; MACHADO, C. C. ; GERVINI, V. I. ; DINIZ, C. M. ; ROSA, V. S.	2008		36	\N	3
3295	TC	A NEW SIMULATOR TO FLEXIBLE MANIPULATORS	HARTMANN, E. ; SHULTZ, T. P. ; CASTELLUBER, W. ; GERVINI, V. I. ; GOMES, S.C.P.	2008		36	\N	3
3296	RE	Controle em Tempo Real de uma Plataforma de Manobras através de um Dispositivo FPGA	CASSEL, D. P. ; GERVINI, V. I. ; ROSA, V. S. ; GOMES, S.C.P.	2009		36	\N	3
3297	RE	Interfaces Eletrônicas para o Controle de um Sistema Robótico	ROSA, A. L. R. ; TADEU, G. ; GERVINI, V. I. ; ROSA, V. S. ; GOMES, S.C.P.	2009		36	\N	3
3298	AP	Redução do Tempo de Execução de Métodos Numéricos utilizando GNU/OCTAVE e GPGPU	Tibola, A. L. ; OLIVEIRA, V. M.	2010	59-66	37	\N	3
3300	TC	Sistema de Navegação para um Robô de Inspeção de Linhas Subterrâneas de Distribuição	Estrada, E. ; Silveira L. ; OLIVEIRA, V. M. ; BOTELHO, S. S. C.	2010		37	\N	3
3301	TC	Control of a Brachiating Robot for Inspection of Aerial Power Lines	OLIVEIRA, V. M. ; LAGES, W. F.	2010		37	\N	3
3303	TC	Real-Time Predictive Control of a Brachiation Robot	OLIVEIRA, V. M. ; LAGES, W. F.	2009	1-6	37	\N	3
3305	TC	Controle em Tempo Real de um Robô Bracejador Utilizando MPC	OLIVEIRA, V. M. ; LAGES, W. F.	2009		37	\N	3
3310	RE	PARALELIZAÇÃO DA BLAS UTILIZANDO GPGPU	Tibola, A. L. ; OLIVEIRA, V. M.	2010		37	\N	3
3311	RE	MODELAGEM MATEMÁTICA E AUTOMAÇÃO DO PROCESSO DE BIOFIXAÇÃO DE CO2	SANTOS, J. V. ; CAMERINI, F. ; OLIVEIRA, V. M. ; COSTA, J. A. V.	2010		37	\N	3
3312	RE	DESENVOLVIMENTO E CONSTRUÇÃO DE UM ROBÔ PARA INSPEÇÃO DE LINHAS DE ALTA-TENSÃO	VEIGA, F. ; OLIVEIRA, V. M.	2010		37	\N	3
3313	RE	Comparação entre métodos para representação cinemática de robôs bracejadores	RODRIGUES, F. ; OLIVEIRA, V. M.	2010		37	\N	3
3314	RE	HARDWARE MULTICAMADAS PARA AUTOMAÇÃO RESIDENCIAL	CORREA, L. S. ; OLIVEIRA, V. M.	2010		37	\N	3
3315	RE	Redução do Tempo de Execução de Métodos Numéricos Utilizando GNU/Octave e GPGPU	Tibola, A. L. ; OLIVEIRA, V. M.	2009		37	\N	3
3316	RC	FILTRAGEM DE ESTADOS COM RESTRIÇÕES DE IGUALDADE SEGUINDO A TÉCNICA DE PROJEÇÃO DE ESTIMATIVA APLICADA SOBRE O FILTRO DE KALMAN ESTENDIDO	Oliveira, R. ; LILLES, P. D. ; OLIVEIRA, V. M.	2011		37	\N	3
3317	RC	Otimização de Tempo de Execução de Métodos Numéricos usando GNU/Octave com GPGPU e NVIDIA CUDA	Tibola, A. L. ; OLIVEIRA, V. M.	2009		37	\N	3
2434	LP	Anais do IV Workshop- Escola de Sistemas de Agentes, seus Ambientes e apliCações. Rio Grande: FURG	Adamatti, D. F. (Org.) ; LUGO, G.G (Org.) ; Emmendorfer, L. R. (Org.) ; WERHLI, A. V. (Org.)	0		0	2434	3
2653	LP	Anais do IV Workshop- Escola de Sistemas de Agentes, seus Ambientes e apliCações. Rio Grande: FURG	ADAMATTI, D. F. (Org.) ; LUGO, G. G. (Org.) ; EMMENDORFER, L. R. (Org.) ; WERHLI, A. V. (Org.)	0		10	2434	3
2441	TC	Análise Exploratória de Dados para o Desenvolvimento de Sistemas de Previsão de Alarmes em Plantas Industriais	Botelho, S. S. C. ; BRAUNSTEI, S. H. ; WERHLI, A. V.	2009		0	2441	3
3245	TC	Análise Exploratória de Dados para o Desenvolvimento de Sistemas de Previsão de Alarmes em Plantas Industriais	BOTELHO, S. S. C. ; Werhli, A. ; Braustein, S.	2009	1-6	34	2441	3
2442	TC	Continuum Crowds with Local Control	Marcelo Paravisi ; WERHLI, A. V. ; Julio C. S. Jaques Jr. ; RODRIGUES, R. ; BICHO, A. ; JUNG, C. R. ; MUSSE, S. R.	2008	108-115	0	2442	3
2456	TC	Continuum Crowds with Local Control	PARAVISI, M. ; WERHLI, A. V. ; JACQUES JUNIOR, J. C. S. ; RODRIGUES, R. A. ; BICHO, A. L. ; JUNG, C. R. ; MUSSE, S. R.	2008	108-115	1	2442	3
2450	AP	Space D*: A Path-Planning Algorithm for Multiple Robots in Unknown Environments	SILVEIRA, L. ; MAFFEI, R. Q. ; BOTELHO, S. S. C. ; DREWS JUNIOR, P. L. J. ; BICHO, A. L. ; DUARTE FILHO, N. L.	2012	1-11	1	2450	3
3056	AP	Space D* - A path-planning algorithm for multiple robots in unknown environments	SILVEIRA, Luan ; MAFFEI, R. Q. ; BOTELHO, S. S. C. ; DREWS JR, P. L. J. ; BICHO, A. L. ; DUARTE FILHO, N. L.	2012	363-373	28	2450	3
2454	TC	Space D*: Um Algoritmo para Path Planning Multi-Robôs	MAFFEI, R. Q. ; BOTELHO, S. S. C. ; SILVEIRA, L. ; DREWS JUNIOR, P. L. J. ; DUARTE FILHO, N. L. ; BICHO, A. L. ; ALMEIDA, F. R. ; LONGARAY, M. M.	2011	607-618	1	2454	3
2968	TC	Space D*: Um Algoritmo para Path Planning Multi-Robôs	Silveira, L. ; Maffei, Renan ; BOTELHO, Silvia Silva ; Drews, Paulo Lilles ; DUARTE FILHO, Nelson Lopes ; BICHO, A.	2011	51-62	24	2454	3
2455	TC	D*-space: Planejando Caminhos para Sistemas Multi-robôs	MAFFEI, R. Q. ; BOTELHO, S. S. C. ; SILVEIRA, L. ; DREWS JUNIOR, P. L. J. ; DUARTE FILHO, N. L. ; BICHO, A. L. ; LONGARAY, M. M. ; ALMEIDA, F. R.	2011	1-6 CDROM	1	2455	3
2969	TC	D*-Space: planejando caminhos para sistemas multi-robôs	Silveira, L. ; Maffei, Renan ; BOTELHO, Silvia Silva da Costa ; DREWS, Paulo ; DUARTE FILHO, Nelson Lopes ; BICHO, A. ; LONGARAY, M.	2011		24	2455	3
2484	AP	Recognizing and learning models of social exchange strategies for the regulation of social interactions in open agent societies	DIMURO, Graçaliz Pereira ; COSTA, A. C. R. ; Gonçalves, L. V. ; Pereira, D. R.	2011	1-19	4	2484	3
2800	AP	Recognizing and learning models of social exchange strategies for the regulation of social interactions in open agent societies	DIMURO, G. P. ; COSTA, A. C. R. ; GONÇALVES, L. V. ; PEREIRA, D. R.	2011	143-161	18	2484	3
2487	AP	Interval-Valued Hidden Markov Models for Recognizing Personality Traits in Social Exchanges in Open Multiagent Systems. TEMA	DIMURO, Graçaliz Pereira ; COSTA, A. C. R. ; Gonçalves, L. V. ; Hübner, A.	2008	83-93	4	2487	3
2806	AP	Interval-Valued Hidden Markov Models for Recognizing Personality Traits in Social Exchanges in Open Multiagent Systems. TEMA	DIMURO, G. P. ; COSTA, A. C. R. ; GONÇALVES, L. V. ; HÜBNER, A.	2008	83-93	18	2487	3
2491	LP	Advances in Social Simulation, Post-Proceedings of the Brazilian Workshop on Social Simulation	DIMURO, Graçaliz Pereira (Org.) ; COSTA, A. C. R. (Org.) ; SICHMAN, J. S. (Org.) ; TEDESCO, P. (Org.) ; Adamatti, D. (Org.) ; BALSA, J. (Org.) ; Antunes, L. (Org.)	2011		4	2491	3
2810	LP	Advances in Social Simulation, Post-Proceedings of the Brazilian Workshop on Social Simulation	DIMURO, G. P. (Org.) ; COSTA, A. C. R. (Org.) ; Sichman, J. (Org.) ; TEDESCO, P. (Org.) ; ADAMATTI, D. F. (Org.) ; BALSA, J. (Org.) ; Antunes, L. (Org.)	2011		18	2491	3
2492	LP	Anais do WEIT 2011 - I Workshop-Escola de Informática Teórica	DIMURO, Graçaliz Pereira (Org.) ; FOSS, L. (Org.) ; AGUIAR, Marilton Sanchotene de (Org.) ; COSTA, S. A. (Org.) ; COSTA, A. C. R. (Org.)	2011		4	2492	3
2812	LP	Anais do WEIT 2011 - I Workshop-Escola de Informática Teórica	DIMURO, G. P. (Org.) ; FOSS, L. (Org.) ; AGUIAR, M. S. (Org.) ; COSTA, S. A. (Org.) ; COSTA, A. C. R. (Org.)	2011		18	2492	3
2493	LP	Post-Proceedings 2011 Workshop-School on Theoretical Computer Science - WEIT 2011	COSTA, S. A. (Org.) ; FOSS, L. (Org.) ; AGUIAR, Marilton Sanchotene de (Org.) ; DIMURO, Graçaliz Pereira (Org.) ; COSTA, A. C. R. (Org.)	2011		4	2493	3
2813	LP	Post-Proceedings 2011 Workshop-School on Theoretical Computer Science - WEIT 2011	CAVALHEIRO, S. A. C. (Org.) ; FOSS, L. (Org.) ; AGUIAR, M. S. (Org.) ; DIMURO, G. P. (Org.) ; COSTA, A. C. R. (Org.)	2011		18	2493	3
2496	CL	A Multiagent System-Based Solution for Shipment Operations with Priorities in a Container Terminal	Rodrigues, L. M. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R.	2012	28-36	4	2496	3
2814	CL	A Multiagent System-Based Solution for Shipment Operations with Priorities in a Container Terminal	RODRIGUES, L. M. ; DIMURO, G. P. ; COSTA, A. C. R. ; EMMENDORFER, L.	2012	28-36	18	2496	3
2497	CL	On the Problem of Recognizing and Learning Observable Social Exchange Strategies in Open Societies	DIMURO, Graçaliz Pereira ; COSTA, A. C. R. ; Gonçalves, L. V.	2011	66-73	4	2497	3
2816	CL	On the Problem of Recognizing and Learning Observable Social Exchange Strategies in Open Societies	DIMURO, G. P. ; COSTA, A. C. R. ; GONÇALVES, L. V.	2011	66-73	18	2497	3
2498	CL	An Interactional Characterization of Social Functions	COSTA, A. C. R. ; DIMURO, Graçaliz Pereira	2011	74-81	4	2498	3
2817	CL	An Interactional Characterization of Social Functions	COSTA, A. C. R. ; DIMURO, G. P.	2011	74-81	18	2498	3
2499	CL	An Analysis of Two Regulation Mechanisms for Personality-Based Social Exchange Processes	Pereira, D. R. ; Gonçalves, L. V. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R.	2011	96-102	4	2499	3
2818	CL	An Analysis of Two Regulation Mechanisms for Personality-Based Social Exchange Processes	PEREIRA, D. R. ; GONÇALVES, L. V. ; DIMURO, G. P. ; COSTA, A. C. R.	2011	96-102	18	2499	3
2505	CL	Agentes BDI com Percepção Fuzzy na Simulação de um Modelo Presa-Predador Fuzzy	Farias, G. P. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R.	2010	74-85	4	2505	3
2831	CL	Agentes BDI com Percepção Fuzzy na Simulação de um Modelo Presa-Predador Fuzzy	FARIAS, G. P. ; DIMURO, G. P. ; COSTA, A. C. R.	2010	74-85	18	2505	3
2506	CL	Analisando Trocas Sociais Baseadas em Personalidades Através de Cadeias de Markov Intervalares	Farias, G. P. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R.	2010	13-23	4	2506	3
2828	CL	Analisando Trocas Sociais Baseadas em Personalidades Através de Cadeias de Markov Intervalares	FARIAS, G. P. ; DIMURO, G. P. ; COSTA, A. C. R.	2010	13-23	18	2506	3
2507	CL	Introdução da Dimensão Dialógica no Moise+, com Aplicação na Modelagem de Processos de Gestão em uma Universidade Comunitária	Hübner, A. ; COSTA, A. C. R. ; DIMURO, Graçaliz Pereira ; MATTOS, V. ; HERNANDES, S.	2010	138-149	4	2507	3
2832	CL	Introdução da Dimensão Dialógica no Moise+, com Aplicação na Modelagem de Processos de Gestão em uma Universidade Comunitária	HÜBNER, A. ; COSTA, A. C. R. ; DIMURO, G. P. ; MATTOS, V. L. D. ; HERNANDES, S.	2010	138-149	18	2507	3
2508	CL	Uma arquitetura de Agentes BDI Híbridos para Auto-regulação de Trocas Sociais em Sistemas Multiagentes Abertos	Gonçalves, L. V. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R.	2010	-60	4	2508	3
2830	CL	Uma arquitetura de Agentes BDI Híbridos para Auto-regulação de Trocas Sociais em Sistemas Multiagentes Abertos	GONÇALVES, L. V. ; DIMURO, G. P. ; COSTA, A. C. R.	2010	60-73	18	2508	3
2512	CL	Extending the MOISE+ Organizational Model with the Dialogic Dimension	Hübner, A. ; COSTA, A. C. R. ; DIMURO, Graçaliz Pereira	2010	130-135	4	2512	3
2833	CL	Extending the MOISE+ Organizational Model with the Dialogic Dimension	HÜBNER, A. ; COSTA, A. C. R. ; DIMURO, G. P.	2010	130-135	18	2512	3
2514	CL	A Minimal Dynamical MAS Organization Model	COSTA, A. C. R. ; DIMURO, Graçaliz Pereira	2009	419-445	4	2514	3
2834	CL	A Minimal Dynamical MAS Organization Model	COSTA, A. C. R. ; DIMURO, G. P.	2009	419-445	18	2514	3
2515	CL	Semantical Concepts for a Formal Structural Dynamics of Situated Multiagent Systems	COSTA, A. C. R. ; DIMURO, Graçaliz Pereira	2008	139-154	4	2515	3
2517	TC	Modeling Role Interactions in a Social Organization for the Simulation of the Social Production and Management of Urban Ecosystems: the case of San Jerónimo Vegetable Garden of Seville, Spain	SANTOS, F. P. ; RODRIGUES, T. F. ; DIMURO, G. ; Adamatti, D. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R. ; MANUEL, E.	2012	1-16	4	2517	3
2679	TC	Modeling Role Interactions in a Social Organization for the Simulation of the Social Production and Management of Urban Ecosystems: the case of San Jeronimo Vegetable Garden of Seville, Spain	SANTOS, F. C. P. ; RODRIGUES, T. ; DIMURO, G. ; ADAMATTI, D. F. ; DIMURO, G. P. ; COSTA, A. C. R. ; JEREZ, E. M.	2012	1-6	10	2517	3
2518	TC	Analyzing the Evolution of Social Exchange Strategies in Social Preference-based MAS through an Evolutionary Spatial Approach of the Ultimatum Game	MACEDO, L. F. ; DIMURO, Graçaliz Pereira ; AGUIAR, Marilton Sanchotene de ; COSTA, A. C. R. ; COELHO, H. M. F. ; MATTOS, V.	2012	1-16	4	2518	3
2847	TC	Analyzing the Evolution of Social Exchange Strategies in Social Preference-based MAS through an Evolutionary Spatial Approach of the Ultimatum Game	MACEDO, L. F. K. ; DIMURO, G. P. ; AGUIAR, M. S. ; COSTA, A. C. R. ; COELHO, H. ; MATTOS, V. L. D.	2012	1-16	18	2518	3
2519	TC	Elementary Social Functions: Concept and Interrelation to Social Dependence Relations	COSTA, A. C. R. ; DIMURO, Graçaliz Pereira	2012	1-16	4	2519	3
2846	TC	Elementary Social Functions: Concept and Interrelation to Social Dependence Relations	COSTA, A. C. R. ; DIMURO, G. P.	2012	1-16	18	2519	3
2520	TC	Um Modelo de Agente BDI-Fuzzy para Trocas de Serviços Não-Econômicos Baseado na Teoria das Trocas Sociais de Piaget	Farias, G. P. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R.	2012	1-12	4	2520	3
2843	TC	Um Modelo de Agente BDI-Fuzzy para Trocas de Serviços Não-Econômicos Baseado na Teoria das Trocas Sociais de Piaget	FARIAS, G. P. ; DIMURO, G. P. ; COSTA, A. C. R.	2012	1-12	18	2520	3
2521	TC	Um framework para simulação de Políticas Públicas aplicado ao caso da Piracema, sob o olhar da Teoria dos Jogos	SANTOS, I. A. S. ; MOTA, F. P. ; COSTA, A. C. R. ; DIMURO, Graçaliz Pereira	2012	1-12	4	2521	3
2841	TC	Um framework para simulação de Políticas Públicas aplicado ao caso da Piracema, sob o olhar da Teoria dos Jogos	COSTA, A. C. R. ; MOTA, F. P. ; DIMURO, G. P. ; SANTOS, I.	2012	1-12	18	2521	3
2522	TC	Modelando a Organização Social de um SMA para Simulação dos Processos de Produção e Gestão Social de um Ecossistema Urbano: o caso da Horta San Jerónimo da cidade de Sevilla, Espanha	SANTOS, F. P. ; DIMURO, G. ; RODRIGUES, T. F. ; Adamatti, D. ; DIMURO, Graçaliz Pereira ; MANUEL, E. ; COSTA, A. C. R.	2012	93-104	4	2522	3
2668	TC	Modelando a Organização Social de um SMA para Simulação dos Processos de Produção e Gestão Social de um Ecossistema Urbano: o caso da Horta San Jerónimo da cidade de Sevilla, Espanha	SANTOS, F. C. P. ; RODRIGUES, T. ; DIMURO, G. ; ADAMATTI, D. F. ; JEREZ, E. M. ; DIMURO, G. P. ; COSTA, A. C. R.	2012	1-12	10	2522	3
2523	TC	Regulation of Social Exchanges in Open MAS: the problem of reciprocal conversions between POMDPs and HMMs	DIMURO, Graçaliz Pereira ; COSTA, A. C. R.	2012	1-8	4	2523	3
2836	TC	Regulation of Social Exchanges in Open MAS: the problem of reciprocal conversions between POMDPs and HMMs	DIMURO, G. P. ; COSTA, A. C. R.	2012	1-8	18	2523	3
2526	TC	Um Modelo Multiagente para Carregamento Compartilhado com Prioridades em um Terminal de Contêineres: Combinando o Problema da Mochila com PDMs	Rodrigues, L. M. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R.	2011	51-62	4	2526	3
2850	TC	Um Modelo Multiagente para Carregamento Compartilhado com Prioridades em um Terminal de Conêineres: Combinando o Problema da Mochila com PDMs	RODRIGUES, L. M. ; DIMURO, G. P. ; COSTA, A. C. R. ; EMMENDORFER, L.	2011	51-62	18	2526	3
2527	TC	Um Estudo para uma Proposta de Modelos de Tomada de Decisão em Interações Estratégicas para Sistemas Multiagentes em Ambientes de Informação Imperfeita	BRIAO, S. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R.	2011	190-200	4	2527	3
2855	TC	Um Estudo para uma Proposta de Modelos de Tomada de Decisão em Interações Estratégicas para Sistemas Multiagentes em Ambientes de Informação Imperfeita	BRIÃO, S. L. ; DIMURO, G. P. ; COSTA, A. C. R.	2011	190-200	18	2527	3
2528	TC	Towards Developmental Turing Machines	COSTA, S. A. ; COSTA, A. C. R. ; DIMURO, Graçaliz Pereira	2011	152-163	4	2528	3
2854	TC	Towards Developmental Turing Machines	COSTA, S. A. ; COSTA, A. C. R. ; DIMURO, G. P.	2011	152-163	18	2528	3
2530	TC	Agentes BDI com Percepção Fuzzy na Simulação de um Modelo Presa-Predador Fuzzy	Farias, G. P. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R.	2010	1-12	4	2530	3
2858	TC	Agentes BDI com Percepção Fuzzy na Simulação de um Modelo Presa-Predador Fuzzy	FARIAS, G. P. ; DIMURO, G. P. ; COSTA, A. C. R.	2010	1-12	18	2530	3
2531	TC	Introdução da Dimensão Dialógica no Moise+, com Aplicação na Modelagem de Processos de Gestão em uma Universidade Comunitária	Hübner, A. ; COSTA, A. C. R. ; DIMURO, Graçaliz Pereira ; MATTOS, V. ; HERNANDES, S. ; MAILANGE, M.	2010	65-76	4	2531	3
2859	TC	Introdução da Dimensão Dialógica no Moise+, com Aplicação na Modelagem de Processos de Gestão em uma Universidade Comunitária	HÜBNER, A. ; COSTA, A. C. R. ; DIMURO, G. P. ; MATTOS, V. L. D. ; HERNANDES, S. ; Mailange, M.	2010	65-76	18	2531	3
2535	TC	A Dialogic Dimension for the MOISE+ Organizational Model	Hübner, A. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R. ; MATTOS, V.	2010	23/21-23/26	4	2535	3
2860	TC	A Dialogic Dimension for the MOISE+ Organizational Model	HÜBNER, A. ; DIMURO, G. P. ; COSTA, A. C. R. ; MATTOS, V. L. D.	2010	23/21-23/26	18	2535	3
2536	TC	BDI Agents with Fuzzy Perception for Simulating Decision Making in Environments with Imperfect Information	Farias, G. P. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R.	2010	41/23-41/30	4	2536	3
2861	TC	BDI Agents with Fuzzy Perception for Simulating Decision Making in Environments with Imperfect Information	FARIAS, G. P. ; DIMURO, G. P. ; COSTA, A. C. R.	2010	41/23-41/30	18	2536	3
2537	TC	BDI Agents with Fuzzy Perception	Farias, G. P. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R.	2010	742-751	4	2537	3
2862	TC	BDI Agents with Fuzzy Perception	FARIAS, G. P. ; DIMURO, G. P. ; COSTA, A. C. R.	2010	742-751	18	2537	3
2538	TC	On the Problem of Recognizing and Learning Observable Social Exchange Strategies in Open Societies	DIMURO, Graçaliz Pereira ; COSTA, A. C. R. ; Gonçalves, L. V.	2010	140-152	4	2538	3
2863	TC	Recognizing and Learning Observable Social Exchange Strategies in Open Societies	DIMURO, G. P. ; COSTA, A. C. R. ; GONÇALVES, L. V.	2010	140-152	18	2538	3
2539	TC	An Interactional Characterization of Social Functions	COSTA, A. C. R. ; DIMURO, Graçaliz Pereira	2010	105-117	4	2539	3
2865	TC	An Interactional Characterization of Social Functions	COSTA, A. C. R. ; DIMURO, G. P.	2010	105-117	18	2539	3
2544	TC	Toward a Semantical Model of Organization Growth for Multiagent Systems	DIMURO, Graçaliz Pereira ; COSTA, A. C. R.	2009	120-129	4	2544	3
2870	TC	Toward a Semantical Model of Organization Growth for Multiagent Systems	DIMURO, G. P. ; COSTA, A. C. R.	2009	120-129	18	2544	3
2546	TC	Fuzzy Evaluation of Social Exchanges Between Personality-based Agents	DIMURO, Graçaliz Pereira ; SANTOS, André Vinícius dos ; BEDREGAL, Benjamin René Callejas ; COSTA, A. C. R.	2009	451-462	4	2546	3
2872	TC	Fuzzy Evaluation of Social Exchanges Between Personality-based Agents	DIMURO, G. P. ; SANTOS, A. V. ; BEDREGAL, B. R. C. ; COSTA, A. C. R.	2009	451-462	18	2546	3
2547	TC	A Formal Notion of Objective Expectations in the Context of Multiagent Systems Routines	COSTA, A. C. R. ; DIMURO, Graçaliz Pereira ; DUGDALE, J. ; DEMAZEAU, Y.	2009	367-378	4	2547	3
2873	TC	A Formal Notion of Objective Expectations in the Context of Multiagent Systems Routines	COSTA, A. C. R. ; DIMURO, G. P. ; DUGDALE, J. ; DEMAZEAU, Y.	2009	367-378	18	2547	3
2550	TC	Estendendo o Modelo Organizacional MOISE+ com a Dimensão Dialógica	Hübner, A. ; COSTA, A. C. R. ; DIMURO, Graçaliz Pereira	2009	1-6	4	2550	3
2875	TC	Estendendo o Modelo Organizacional MOISE+ com a Dimensão Dialógica	HÜBNER, A. ; COSTA, A. C. R. ; DIMURO, G. P.	2009	18-23	18	2550	3
2551	TC	Introducing Service Schemes and Systems Organization in the Theory of Interactive Computation	COSTA, A. C. R. ; DIMURO, Graçaliz Pereira	2008	87-96	4	2551	3
2876	TC	Introducing Service Schemes and Systems Organization in the Theory of Interactive Computation	COSTA, A. C. R. ; DIMURO, G. P.	2008	87-96	18	2551	3
2552	TC	Constructing BDI Plans from Optimal POMDP Policies, with an Application to AgentSpeak Programming	Pereira, D. R. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R.	2008	240-249	4	2552	3
2885	TC	Constructing BDI Plans from Optimal POMDP Policies, with an Application to AgentSpeak Programming	PEREIRA, D. R. ; GONÇALVES, L. V. ; DIMURO, G. P. ; COSTA, A. C. R.	2008	240-249	18	2552	3
2553	TC	Contrasting Two Regulation Mechanisms for Personality-based Social Exchange Processes	Pereira, D. R. ; Gonçalves, L. V. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R.	2008	1-12	4	2553	3
2886	TC	Contrasting Two Regulation Mechanisms for Personality-based Social Exchange Processes	PEREIRA, D. R. ; GONÇALVES, L. V. ; DIMURO, G. P. ; COSTA, A. C. R.	2008	1-12	18	2553	3
2555	TC	Towards the Self-regulation of Personality-based Social Exchange Processes in Multiagent Systems	Pereira, D. R. ; Gonçalves, L. V. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R.	2008	113-123	4	2555	3
2883	TC	Towards the Self-regulation of Personality-based Social Exchange Processes in Multiagent Systems	PEREIRA, D. R. ; GONÇALVES, L. V. ; DIMURO, G. P. ; COSTA, A. C. R.	2008	113-123	18	2555	3
2569	TC	TATUBOT Sistema Robótico de Inspeção para Linhas de Distribuição Elétrica Subterrâneas	BOTELHO, S. S. C. ; V. Oliveira ; N. D. Lopes Fº ; MELLO JÚNIOR, C. D. ; E. Estrada ; M. P. Galeriano ; U. B. Correa ; P. Drews Jr.	2008		6	2569	3
2788	TC	Tatubot - Sistema Robótico de Inspeção para Linhas de Distribuição Elétrica Subterrâneas	BOTELHO, S. S. C. ; DUARTE Filho, N. L. ; OLIVEIRA, V. M. ; MELLO JR., C. D. ; ESTRADA, E. S. D. ; GALERIANO, M. P. ; CORREA, U. B. ; DREWS JR., P.	2008		14	2569	3
2570	TC	TATUBOT ROBOTIC SYSTEM FOR INSPECTION OF UNDERGROUNDED CABLE SYSTEM	BOTELHO, S. S. C. ; GONÇALVES, E. M. N. ; MELLO JÚNIOR, C. D. ; ESTRADA, E. S. D. ; SOUTO Jr., H. D. ; SANTOS, T. S.	2008		6	2570	3
2756	TC	TATUBOT Robotic System for Inspection of Undergrounded Cable System	GONÇALVES, E. M. N. ; BOTELHO, S. S. C. ; OLIVEIRA, V. M. ; MELLO, C. ; ESTRADA, E.	2008		11	2570	3
2571	TC	TATUBOT Robotic System for Inspection of Undergrounded Cable	GONÇALVES, E. M. N. ; ESTRADA, E. S. D. ; SOUTO Jr., H. D. ; V. Oliveira ; BOTELHO, S. S. C. ; MELLO JÚNIOR, C. D.	2008		6	2571	3
2789	TC	TATUBOT ROBOTIC SYSTEM FOR INSPECTION OF UNDERGROUNDED CABLE SYSTEM	BOTELHO, S. S. C. ; Gonçalves, E. M. N. ; MELLO JR., C. D. ; ESTRADA, E. S. D. ; SOUTO JR., H. D. ; ALMEIDA, R. ; SANTOS, T. S.	2008		14	2571	3
2572	AP	Projeto de um Bloco de Memória SRAM em Tecnologias CMOS Nanométricas de 16nm	GOMES, I. A. C. ; MEINHARDT, Cristina ; BUTZEN, P. F.	2012	31-40	7	2572	3
3025	AP	Projeto de um Bloco de Memória SRAM em Tecnologias CMOS Nanométricas de 16nm	GOMES, I. A. C. ; MEINHARDT, C. ; BUTZEN, P. F.	2012	31-40	27	2572	3
3032	TC	Design of 16nm SRAM Architecture	GOMES, I. A. C. ; MEINHARDT, C. ; BUTZEN, P. F.	2012	1-4	27	2575	3
2576	TC	Full Adders Architectures Evaluation for 32nm Technology	SILVA, A. N. ; MACHADO, I. ; MEINHARDT, Cristina ; BUTZEN, P. F.	2012	1-4	7	2576	3
3033	TC	Full Adders Architectures Evaluation for 32nm Technology	SILVA, A. N. ; MACHADO, I. ; MEINHARDT, C. ; BUTZEN, P. F.	2012	1-4	27	2576	3
2577	TC	Evaluating the Efficacy of Low Power Process to Design Low Power Circuits	NUNES, C. S. ; SILVA, A. N. ; GOMES, I. A. C. ; MEINHARDT, Cristina ; BUTZEN, P. F.	2012	1-4	7	2577	3
3034	TC	Evaluating the Efficacy of Low Power Process to Design Low Power Circuits	NUNES, C. S. ; SILVA, A. N. ; GOMES, I. A. C. ; MEINHARDT, C. ; BUTZEN, P. F.	2012	1-4	27	2577	3
2604	AP	An Adaption of OSA-CBM Architecture for Human-Computer Interaction through Mixed Interface	ESPÍNDOLA, Danúbia Bueno ; FUMAGALLI, L. ; GARETTI, M. ; BOTELHO, Silvia Silva da Costa ; PEREIRA, Carlos Eduardo	2011	485-490	8	2604	3
3172	AP	An Adaption of OSA-CBM Architecture for Human-Computer Interaction through Mixed Interface.	ESPÍNDOLA, D. ; FUMAGALLI ; GARETTI ; Carlos Eduardo ; BOTELHO, S. S. C.	2011	485-490	34	2604	3
2607	TC	A Engenharia de Serviço na Indústria Naval	BOTELHO, Silvia S da C ; DUARTE, Nelson ; ESPÍNDOLA, Danúbia Bueno ; Carvallho, J. T.	2012		8	2607	3
2966	TC	A Engenharia de Serviço na Indústria Naval	BOTELHO, Silvia Silva ; DUARTE FILHO, Nelson Lopes ; ESPINDOLA, Danubia ; OLIVEIRA, D. P. ; CARVALHO, J.	2012	1-6	24	2607	3
2608	TC	Internet of Things to Provide Scalability in Product-Service Systems	ESPÍNDOLA, Danúbia Bueno ; DUARTE, Nelson ; BOTELHO, Silvia S da C ; Carvallho, J. T. ; PEREIRA, Carlos Eduardo	2012	32-40	8	2608	3
3209	TC	Internet of Things to Provide Scalability in Product-Service Systems	ESPÍNDOLA, D. ; DUARTE FILHO, N. L. ; BOTELHO, S. S. C. ; Tyska, j. ; pereira, c. e.	2012	1-6	34	2608	3
2611	TC	Using Mixed Reality in the Visualization of Maintenance Processes	ESPÍNDOLA, Danúbia Bueno ; PEREIRA, Carlos Eduardo ; HENRIQUES, Renato Ventura Bayan ; BOTELHO, Silvia Silva da Costa	2010	35-40	8	2611	3
3233	TC	Using Mixed Reality in the Visualization of Maintenance Processes	ESPÍNDOLA, D. ; pereira, c. e. ; HENRIQUES, Renato Ventura Bayan ; BOTELHO, S. S. C.	2010	35-40	34	2611	3
2612	TC	Uma Proposta para Visualização Aumentada em Tempo_real Aplicada a Indústria. In:	ESPÍNDOLA, Danúbia Bueno ; PEREIRA, Carlos Eduardo ; HENRIQUES, Renato Ventura Bayan ; BOTELHO, Silvia Silva da Costa	2010	163-168	8	2612	3
3232	TC	Uma Proposta para Visualização Aumentada em Tempo_real Aplicada a Indústria	ESPÍNDOLA, D. ; pereira, c. e. ; HENRIQUES, Renato Ventura Bayan ; BOTELHO, S. S. C.	2010	163-168	34	2612	3
2662	CL	Detectando Padrões Comportamentais de Agentes Através de Árvores de Decisão	SILVEIRA, J. A. ; PAES, T. L. ; EMMENDORFER, L. R. ; ADAMATTI, D. F.	2010	204-208	10	2662	3
2935	CL	Detectando Padrões Comportamentais de Agentes Através de Árvores de Decisão	PAES, T. ; SILVEIRA, J. ; ADAMATTI, D. F. ; EMMENDORFER, L. R.	2010	204-208	22	2662	3
2838	TC	Modelando a Organização Social de um SMA para Simulação dos Processos de Produção e Gestão Social de um Ecossistema Urbano: o caso da Horta San Jerónimo da cidade de Sevilla, Espanha	SANTOS, F. C. P. ; DIMURO, G. ; RODRIGUES, T. F. ; ADAMATTI, D. F. ; DIMURO, G. P. ; Jerez, E. de M. ; COSTA, A. C. R.	2012	93-104	18	2522	3
2669	TC	Um Modelo de Ferramenta Computacional Aplicada ao Processo de Aprendizagem Especial: As Tecnologias Assistivas	LUZ JUNIOR, D. M. ; GUIMARAES, M. ; ADAMATTI, D. F. ; BARWALDT, R. ; FELIPE, C. I. M.	2012	1-10	10	2669	3
3117	TC	Um Modelo de Ferramenta Computacional Aplicada ao Processo de Aprendizagem Especial: As Tecnologias Assistivas	BARWALDT, Regina ; ADAMATTI, D. F. ; FELIPPE, C. I. M. ; GUIMARAES, M. ; LUZ JUNIOR, D. M.	2012	1-10	30	2669	3
2670	TC	Formação Continuada: Preparando Professores para o Atendimento Educacional Especializado Através das Salas de Recursos Multifuncionais	BARWALDT, R. ; ADAMATTI, D. F. ; FELIPE, C. I. M.	2012	1-10	10	2670	3
3118	TC	Formação Continuada: Preparando Professores para o Atendimento Educacional Especializado Através das Salas de Recursos Multifuncionais	FELIPPE, C. I. M. ; BARWALDT, Regina ; ADAMATTI, D. F.	2012	1-2	30	2670	3
2672	TC	The Accessibility at University by Assistive Technologies	ADAMATTI, D. F. ; BARWALDT, R. ; FELIPE, C. I. M.	2012	1-8	10	2672	3
3119	TC	The Accessibility at University by Assistive Technologies	ADAMATTI, D. ; BARWALDT, Regina ; FELIPPE, C. I. M.	2012		30	2672	3
2673	TC	Tecnologias Assistivas: Recursos e Serviços Utilizados para a Inclusão Sócio-Digital de Pessoas com Deficiências	LUZ JUNIOR, D. M. ; HECKLER, I. R. ; ADAMATTI, D. F. ; BARWALDT, R. ; FELIPE, C. I. M.	2012	1-6	10	2673	3
3120	TC	Tecnologias Assistivas: Recursos e Serviços Utilizados para a Inclusão Sócio-Digital de Pessoas com Deficiências	LUZ JUNIOR, D. M. ; SALOMAO, H. L. R. ; BARWALDT, Regina ; ADAMATTI, D. F. ; FELIPPE, C. I. M.	2012		30	2673	3
2848	TC	Modeling Role Interactions in a Social Organization for the Simulation of the Social Production and Management of Urban Ecosystems: the case of San Jerónimo Vegetable Garden of Seville, Spain	SANTOS, F. C. P. ; RODRIGUES, T. F. ; DIMURO, G. ; ADAMATTI, D. F. ; DIMURO, G. P. ; COSTA, A. C. R. ; Jerez, E. de M.	2012	1-16	18	2517	3
2681	TC	Um sistema para previsão de impactos gerados pela instalação de indústrias e sua influência sobre ecossistemas costeiros no extremo sul do Brasil	THOMASI, C. D. ; NUNES, G. ; TOLEGO, R. ; JUGUEIRO, M. ; TEIXEIRA, P. ; ADAMATTI, D. F. ; TAGLIANI, C.	2011	1-10	10	2681	3
2793	TC	Um sistema para previsão de impactos gerados pela instalação de indústrias e sua influência sobre ecossistemas costeiros no extremo sul do Brasil	THOMASI, C. D. ; NUNES, G. A. L. ; TOLEDO, R. G. A. ; JUGUEIRO, M. M. ; TEIXEIRA, P. S. ; TAGLIANI, C. R. A. ; ADAMATTI, D. F.	2011		16	2681	3
2685	TC	Tecnologias Assistivas e Pessoas com Necessidades Especiais: Desenvolvimento Sustentável	BARWALDT, R. ; ADAMATTI, D. F. ; FELIPE, C. I. M.	2011		10	2685	3
3121	TC	Tecnologias Assistivas e Pessoas com Necessidades Especiais: Desenvolvimento Sustentável	BARWALDT, Regina ; ADAMATTI, D. F. ; FELIPPE, C. I. M.	2011		30	2685	3
2686	TC	Tecnologias Assistivas e Acessibilidade para Pessoas com Necessidade Especiais em Rio Grande	BARWALDT, R. ; ADAMATTI, D. F. ; FELIPE, C. I. M.	2011		10	2686	3
3122	TC	Tecnologias Assistivas e Acessibilidade para Pessoas com Necessidade Especiais em Rio Grande	BARWALDT, Regina ; ADAMATTI, D. F. ; FELIPPE, C. I. M.	2011		30	2686	3
2688	TC	Poder de Captura das Árvores de Decisão para o Comportamento de Agentes	SILVEIRA, J. A. ; PAES, T. L. ; EMMENDORFER, L. R. ; ADAMATTI, D. F.	2010	1-4 - CDROM	10	2688	3
2938	TC	Poder de Captura das Árvores de Decisão para o Comportamento de Agentes	PAES, T. ; SILVEIRA, J. ; ADAMATTI, D. F. ; EMMENDORFER, L. R.	2010	1-6	22	2688	3
2691	TC	Effectiveness of Decision Trees for Detecting the Behavior of Agents	ADAMATTI, D. F. ; SILVEIRA, J. A. ; PAES, T. L. ; EMMENDORFER, L. R.	2010		10	2691	3
2939	TC	Effectiveness of Decision Trees for Detecting the Behavior of Agents	ADAMATTI, D. F. ; PAES, T. ; SILVEIRA, J. ; EMMENDORFER, L. R.	2010	1-6	22	2691	3
2753	TC	Autonomous navigation for underground energy line inspection robot	BOTELHO, S. S. C. ; ESTRADA, E. ; GONÇALVES, E. M. N. ; OLIVEIRA, V. M.	2010	1-6	11	2753	3
2782	TC	Autonomous navigation for underground energy line inspection robot	ESTRADA, E. S. D. ; Silveira, L. ; Gonçalves, E. M. N. ; OLIVEIRA, V. M. ; BOTELHO, S. S. C.	2010	1-6	14	2753	3
2754	TC	Uma Arquitetura para Navegação Autônoma de Robôs Reais e Simulados para Inspeção de Linhas de Distribuição de Energia Subterrâneas	GONÇALVES, E. M. N. ; ESTRADA, E. ; ALMEIDA, Renan Rosado de ; BOTELHO, S. S. C.	2009		11	2754	3
2785	TC	Uma arquitetura para navegação autônoma de robôs reais e simulados para inspeção de linhas de distribuição de energia subterrâneas	ESTRADA, E. S. D. ; ALMEIDA, R. ; BOTELHO, S. S. C. ; GULES, R. ; OLIVEIRA, V. M. ; Silveira, L. ; Gonçalves, E. M. N.	2009		14	2754	3
2755	TC	SIFT and Topologic Maps applied to robotic SLAM in Underwater Environment	DREWS JR., P. ; MEDEIROS, Mariane ; BOTELHO, S. S. C. ; GONÇALVES, E. M. N.	2008		11	2755	3
3100	TC	SIFT and Topologic Maps applied to robotic SLAM in Underwater Environment	DREWS JR, P. L. J. ; BOTELHO, S. S. C. ; MEDEIROS, M. M. ; GONCALVES, E. M. N.	2008	1-6	28	2755	3
2787	TC	TATUBOT - Robotic System for Inspection of Undergrounded Cable System	ESTRADA, E. S. D. ; MELLO JR., C. D. ; Gonçalves, E. M. N. ; Oliveira, G. L. ; ALMEIDA, R. ; BOTELHO, S. S. C.	2008		14	2570	3
2757	TC	Mixed Reality RoboCup Category - An Overview of FURGBOL-PV Contributions	MEDEIROS, Mariane ; COLARES, Rafael Gonçalves ; ALMEIDA, Renan Rosado de ; SIMAS, G. M. ; GONÇALVES, E. M. N. ; BOTELHO, S. S. C.	2008	3-7	11	2757	3
3256	TC	Mixed Reality RoboCup Category - An overview of FURGBOL-PV Contributions	MEDEIROS, M. M. ; COLARES, R. ; ALMEIDA, R. R. ; SIMAS, G. ; GONCALVES, E. ; BOTELHO, S. S. C.	2008	1-6	34	2757	3
2777	AP	Arquitetura de navegação autônoma de linhas subterrâneas de distribuição de energia	ESTRADA, E. S. D. ; Silveira, L. ; CORREA, U. B. ; OLIVEIRA, V. M. ; BOTELHO, S. S. C.	2008	32-45	14	2777	3
3187	AP	Arquitetura de navegação autônoma de linhas subterrâneas de distribuição de energia	Estrada, E. ; ALMEIDA, R. R. ; CORREA, U. B. ; OLIVEIRA, V. ; BOTELHO, S. S. C.	2008	32-45	34	2777	3
2974	TC	Autonomous navigation for underground energy line inspection robot	ESTRADA, Emanuel ; Silveira, L. ; Gonçalves, E. ; DUARTE FILHO, Nelson Lopes ; OLIVEIRA, V. ; BOTELHO, Silvia Silva	2010	1-6	24	2753	3
2783	TC	Sistema de Navegação para um Robô de Inspeção de Linhas Subterrâneas de Distribuição	ESTRADA, E. S. D. ; Silveira, L. ; OLIVEIRA, V. M. ; BOTELHO, S. S. C.	2010	2698-2705	14	2783	3
3229	TC	Sistema de Navegação para um Robô de Inspeção de Linhas Subterrâneas de Distribuição	Estrada, E. ; Silveira, L. ; OLIVEIRA, V. ; BOTELHO, S. S. C.	2010	1-6	34	2783	3
3244	TC	Uma arquitetura para navegação autônoma de robôs reais e simulados para inspeção de linhas de distribuição de energia subterrâneas	GONCALVES, E. ; Estrada, E. ; Gules, R. ; BOTELHO, S. S. C. ; Silveira, L. ; OLIVEIRA, V.	2009	1-6	34	2754	3
2786	TC	A Mobile System for Duct Inspection	BOTELHO, S. S. C. ; ESTRADA, E. S. D. ; Gonçalves, E. M. N. ; GULES, R. ; MELLO JR., C. D. ; OLIVEIRA, V. M. ; SANTOS, T. S. ; SOUTO JR., H. D. ; ALMEIDA, R.	2009		14	2786	3
3306	TC	A Mobile System for Duct Inspection	BOTELHO, S. S. C. ; Estrada, E. ; SOUTO JR., H. ; ALMEIDA, R. ; OLIVEIRA, V. M. ; Gonçalves, E. N. ; Mello Jr., C. D. ; Santos, T. ; Gules R.	2009		37	2786	3
3251	TC	Robotic System for Inspection of Undergrounded Cable System	Estrada, E. ; MELLO, C. ; GONCALVES, E. ; LEIVAS, G ; ALMEIDA, R. R. ; BOTELHO, S. S. C.	2008	1-6	34	2570	3
2976	TC	TATUBOT - Sistema Robótico de Inspeção para Linhas de Distribuição Elétrica Subterrâneas	BOTELHO, Silvia Silva ; DUARTE FILHO, Nelson Lopes ; OLIVEIRA, Vinícius Menezes de ; MELLO JR, Claudio Dornelles ; ESTRADA, Emanuel ; GALERIANO, Marcelo ; CORREA, Ulisses ; DREWS, Paulo	2008	100-105	24	2569	3
3255	TC	TATUBOT Robotic System for Inspection of Undergrounded Cable System	MELLO, C. ; GONÇALVES, L. ; Estrada, E. ; LEIVAS, G ; ALMEIDA, R. R. ; BOTELHO, S. S. C. ; THIAGO,S.	2008	1-6	34	2571	3
2904	TC	Unconstrained face recognition using MRF priors and manifold traversing	RODRIGUES, R. N. ; SCHROEDER, Greyce Nogueira ; Corso, J.J ; Govindaraju, Venu	2009		19	2904	3
3134	TC	Unconstrained face recognition using MRF priors and manifold traversing	Rodrigues, Ricardo N. ; Greyce N. Schroeder ; Corso, J.J ; Govindaraju, Venu	2009		31	2904	3
2905	TC	Desenvolvimento de uma Plataforma Multidisciplinar para Autoria de Jogos 3D Interativos e Educativos	PINTO, I. M. ; BOTELHO, Silvia da Costa ; SOUZA, R. C. ; GOULART, T. S. ; COLARES, R. ; CAMPOS, R. L.	2009		20	2905	3
3241	TC	DESENVOLVIMENTO DE UMA PLATAFORMA MULTIDISCIPLINAR PARA AUTORIA DE JOGOS 3D INTERATIVOS E EDUCATIVOS	PINTO, Ivete ; Sonego, T. ; Souza, R. ; COLARES, R. ; BOTELHO, S. S. C.	2009	1-6	34	2905	3
2906	TC	SABERLÂNDIA: Plataforma Lúdica integrando robótica e multimídia para educação	PINTO, I. M. ; BOTELHO, Silvia da Costa ; SOUZA, R. C. ; GOULART, T. S. ; COLARES, R. ; CAMPOS, R. L.	2008		20	2906	3
3258	TC	Saberlândia: plataforma lúdica integrando robótica e multimídia para educação	PINTO, Ivete ; BOTELHO, S. S. C. ; Souza, R. ; Sonego, T. ; COLARES, R.	2008	1-8	34	2906	3
2907	TC	Plataforma Saberlândia: Integrando Robótica e Multimídia no Desenvolvimento de Jogos Educacionais	PINTO, I. M. ; BOTELHO, Silvia da Costa ; SOUZA, R. C. ; GOULART, T. S. ; COLARES, R. ; CAMPOS, R. L.	2008		20	2907	3
3257	TC	Plataforma Saberlândia: Integrando Robótica e Multimídia no Desenvolvimento de Jogos Educacionais	PINTO, Ivete ; BOTELHO, S. S. C. ; Souza, R. ; COLARES, R. ; CAMPOS, R. L.	2008	177-186	34	2907	3
2959	AP	An immersive and collaborative visualization system for digital manufacturing	Duarte Filho, Nelson ; Costa Botelho, Silvia ; Tyska Carvalho, Jonata ; Botelho Marcos, Pedro ; Queiroz Maffei, Renan ; Remor Oliveira, Rodrigo ; Ruas Oliveira, Rodrigo ; Alves Hax, Vinicius ; DUARTE FILHO, Nelson Lopes	2010	1253-1261	24	2959	3
3174	AP	An Immersive and Collaborative Visualization Systems for Digital Manufacturing	DUARTE, N. ; BOTELHO, S. S. C. ; Tyska, j. ; P. botelho ; R. maffei ; R. Oliveira ; v. hax	2010	1	34	2959	3
2960	AP	Um Framework para Memória Compartilhada Distribuída e Eestudo de Caso em Aplicações de Geociências sobre Clusters de Computadores	VIEIRA, Jeison ; BOTELHO, Silvia Silva ; DUARTE FILHO, Nelson Lopes	2010	1-17	24	2960	3
3178	AP	Um Framework para Memória Compartilhada Distribuída e Eestudo de Caso em Aplicações de Geociências sobre Cluster de Computadores	Vieira, J. ; BOTELHO, S. S. C. ; DUARTE, N.	2010	1-6	34	2960	3
2961	AP	A general purpose cave-like system for visualization of animated and 4D cad modeling	DUARTE FILHO, Nelson Lopes ; BOTELHO, Silvia Silva ; CARVALHO, J. ; MARCOS, Pedro ; Maffei, Renan ; OLIVEIRA, Rodrigo Ruas ; HAX, V.	2008	5-19	24	2961	3
3186	AP	A general purpose cave-like system for visualization of animated and 4D cad modeling	DUARTE, N. ; BOTELHO, S. S. C. ; Tyska, j. ; P. botelho ; R. maffei ; R. Oliveira ; v. hax	2008	5-19	34	2961	3
2962	LP	ANAIS DO NAVTEC 2012 - Conferência Internacional em Tecnologia Naval e Offshore: Ciência e Inovação	PINTO, E.C. (Org.) ; GIROLDO, D. (Org.) ; DUARTE FILHO, Nelson Lopes (Org.) ; BOTELHO, Silvia Silva da Costa (Org.)	2012		24	2962	3
3192	LP	Conferência Internacional em Tecnologia Naval e Offshore: Ciência e Inovação	DUARTE, N. (Org.) ; Botelho, Silvia S. C. (Org.) ; ESTEFEN, S. (Org.) ; E. C. PINTO (Org.) ; Giroldo, D (Org.)	2012		34	2962	3
2963	CL	A General Purpose Cave-like System for Visualization of Animated and 4D CAD Modeling	DUARTE FILHO, Nelson Lopes ; CARVALHO, J. ; MARCOS, Pedro ; Maffei, Renan ; OLIVEIRA, Rodrigo Ruas ; HAX, V. ; BOTELHO, Silvia Silva da Costa	2010	82-87	24	2963	3
3199	CL	A General Purpose Cave-like System for Visualization of Animated and 4D CAD Modeling	Duarte Filho, Nelson L. ; Tyska, j. ; P. botelho ; R. maffei ; R. Oliveira ; v. hax ; Botelho, Silvia S. C.	2010	82-87	34	2963	3
2964	CL	A Framework for Distributed Shared Memory - Case Study in Geoscience Applications on Clusters of Computers	DUARTE FILHO, Nelson Lopes ; VIEIRA, Jeison ; BOTELHO, Silvia Silva da Costa	2010	88-93	24	2964	3
3200	CL	A Framework for Distributed Shared Memory - Case Study in Geoscience Applications on Clusters of Computers	DUARTE, N. ; Vieira, J. ; Botelho, Silvia S. C.	2010	88-93	34	2964	3
2965	CL	An Automated Platform for Immersive and Collaborative Visualization of Industrial Models. Engineering of Complex Computer Systems. 1ed	DUARTE FILHO, Nelson Lopes ; BOTELHO, Silvia Silva da Costa ; CARVALHO, J. ; MARCOS, Pedro ; Maffei, Renan ; OLIVEIRA, Rodrigo Ruas ; HAX, V.	2009	258-264	24	2965	3
3201	CL	An Automated Platform for Immersive and Collaborative Visualization of Industrial Models. Engineering of Complex Computer Systems	DUARTE, N. ; Botelho, Silvia S. C. ; Tyska, j. ; P. botelho ; R. maffei ; R. Oliveira	2009	258-264	34	2965	3
3202	TC	A Engenharia de Serviço na Indústria Naval	Botelho, Silvia S. C. ; DUARTE, N. ; ESPÍNDOLA, D. ; Oliveira, D. P. ; Tyska, j.	2012		34	2607	3
2967	TC	Um Sistema Integrado para Controle de Projetos na Construção Naval com Análise de Risco	PIRES, F. ; ASSIS, L. F. ; DUARTE FILHO, Nelson Lopes ; BOTELHO, S.	2012	1-4	24	2967	3
3204	TC	Um Sistema Integrado para Controle de Projetos na Construção Naval com Análise de Risco	Pires, F. ; Assis, L. F. ; DUARTE, N. ; Botelho, Silvia S. C.	2012		34	2967	3
3074	TC	Space D*: Um Algoritmo para Path Planning Multi-Robôs	SILVEIRA, Luan ; MAFFEI, R. Q. ; BOTELHO, S. S. C. ; DREWS JR, P. L. J. ; BICHO, A. L. ; DUARTE FILHO, N. L. ; LONGARAY, M. M. ; ALMEIDA, F. R.	2011		28	2454	3
3077	TC	D*-Space: planejando caminhos para sistemas multi-robôs	SILVEIRA, Luan ; MAFFEI, R. Q. ; BOTELHO, S. S. C. ; DREWS JR, P. L. J. ; DUARTE FILHO, N. L. ; BICHO, A. L. ; LONGARAY, M. M. ; ALMEIDA, F. R.	2011		28	2455	3
2970	TC	Hyper-Environments: A Different Way to Think about IoT	CARVALHO, J. ; SANTOS, Rafael ; BOTELHO, Silvia Silva ; Duarte Filho, Nelson L. ; OLIVEIRA, Rodrigo Ruas ; Santos, E.	2011	25-32	24	2970	3
3113	TC	Hyper-Environments: A Different Way to Think about IoT	CARVALHO, J. T. ; DOSSANTOS, R ; BOTELHO, S. S. C. ; DUARTE FILHO, Nelson Lopes ; OLIVEIRA, R. R. ; SANTOS, E.	2011	25-32	29	2970	3
2971	TC	SAP-RISCO4D Sistemas de Avaliação 4D para Projetos na Construção Naval	OLIVEIRA, D. P. ; BOTELHO, Silvia Silva ; DUARTE FILHO, Nelson Lopes	2010	1-6	24	2971	3
3235	TC	SAP-RISCO4D Sistemas de Avaliação 4D para Projetos na Construção Naval	Oliveira, D. P. ; BOTELHO, S. S. C. ; DUARTE, N.	2010	1-6	34	2971	3
2972	TC	Modelagem de um Sistema de Visualização 4D na Construção Naval	OLIVEIRA, D. P. ; BOTELHO, Silvia Silva ; DUARTE FILHO, Nelson Lopes	2010	1-6	24	2972	3
3234	TC	Modelagem de um Sistema de Visualização 4D na Construção Naval	Oliveira, D. P. ; BOTELHO, S. S. C. ; DUARTE, N.	2010	1-6	34	2972	3
2973	TC	SAP-RISCO4D: UM SISTEMA DE VISUALIZAÇÃO 4D PARA ACOMPANHAMENTO DE PROJETOS NA CONSTRUÇÃO NAVAL	OLIVEIRA, D. P. ; BOTELHO, Silvia Silva ; DUARTE FILHO, Nelson Lopes	2010	1-6	24	2973	3
3236	TC	SAP-RISCO4D: UM SISTEMA DE VISUALIZAÇÃO 4D PARA ACOMPANHAMENTO DE PROJETOS NA CONSTRUÇÃO NAVAL	Oliveira, D. P. ; BOTELHO, S. S. C. ; DUARTE, N.	2010	1-6	34	2973	3
3302	TC	Autonomous Navigation for Underground Energy Line Inspection Robot	Estrada, E. ; Silveira L. ; Gonçalves, E. N. ; DUARTE FILHO, N. L. ; BOTELHO, S. S. C. ; OLIVEIRA, V. M.	2010		37	2753	3
2975	TC	A Multi-Cave Visualization System for Digital Manufacturing	DUARTE FILHO, Nelson Lopes ; BOTELHO, Silvia Silva da Costa ; Tyska, J ; MARCOS, Pedro ; Maffei, Renan ; OLIVEIRA, R. R. ; OLIVEIRA, Rodrigo Ruas ; HAX, V.	2009	201-207	24	2975	3
3239	TC	A Multi-Cave Visualization System for Digital Manufacturing	DUARTE, N. ; Tyska, j. ; BOTELHO, S. S. C.	2009	1-6	34	2975	3
3098	TC	Sistema Robótico de Inspeção para Linhas de Distribuição Elétrica Subterrâneas	BOTELHO, S. S. C. ; OLIVEIRA, V. M. ; DUARTE FILHO, N. L. ; MELLO JÚNIOR, C. D. ; ESTRADA, E. D. ; GALERIANO, M. P. ; DREWS JR, P. L. J. ; CORREA, U. B.	2008	100-106	28	2569	3
3170	AP	Space D*: A Path-Planning Algorithm for Multiple Robots in Unknown Environments	SILVEIRA, L. ; MAFFEI, R. Q. ; BOTELHO, S. S. C. ; DREWS JUNIOR, P. L. J. ; BICHO, A. L. ; DUARTE FILHO, N. L.	2012	1-11	34	2450	3
3057	AP	Mapas auto-organizáveis em veículos autônomos subaquáticos	BOTELHO, S. S. C. ; HAFFELE, C. ; FIGUEIREDO, M. ; OLIVEIRA, G. L. ; DREWS JR, P. L. J.	2010	45-55	28	3057	3
3180	AP	Mapas auto-organizáveis em veículos autônomos subaquáticos	BOTELHO, S. S. C. ; HAFFELE, C. ; FIGUEIREDO, M. ; OLIVEIRA, G. L. ; DREWS JR, P. L. J. ; DREWS JR, P. L. J.	2010	45-55	34	3057	3
3058	AP	A Visual System For Distributed Mosaics Using AUV Fleets	DREWS JR, P. L. J. ; BOTELHO, S. S. C.	2009	8-10	28	3058	3
3181	AP	A VISUAL SYSTEM FOR DISTRIBUTED MOSAICS USING AUV FLEETS	DREWS, P. ; BOTELHO, S. S. C.	2009	1-8	34	3058	3
3059	AP	Appearance-based odometry and mapping with feature descriptors for underwater robots	BOTELHO, S. S. C. ; DREWS JR, P. L. J. ; FIGUEIREDO, M. ; HAFFELE, C. ; OLIVEIRA, G. L.	2009	47-54	28	3059	3
3183	AP	Appearance-based odometry and mapping with feature descriptors for underwater robots	BOTELHO, S. S. C. ; DREWS, P. ; m, figueiredo ; da Rocha, C. ; LEIVAS, G	2009	47-54	34	3059	3
3060	AP	Uma Abordagem Baseada em Visão Computacional para Localização e Mapeamento Simultâneos de Robôs Subaquáticos. REIC	DREWS JR, P. L. J. ; BOTELHO, S. S. C.	2008	6	28	3060	3
3188	AP	Uma Abordagem Baseada em Visão Computacional para Localização e Mapeamento Simultâneos de Robôs Subaquáticos. REIC	DREWS JR, P. L. J. ; BOTELHO, S. S. C.	2008	6	34	3060	3
3064	TC	Self-organizing mapping of robotic environments based on neural networks	FIGUEIREDO, M. ; BOTELHO, S. S. C. ; DREWS JR, P. L. J. ; HAFFELE, C.	2012		28	3064	3
3216	TC	Self-organizing mapping of robotic environments based on neural networks	FIGUEIREDO, M. ; Botelho, Silvia S. C. ; DREWS, P. ; HAFFELE, C.	2012	1-6	34	3064	3
3066	TC	Modelando Nuvens de Pontos Tridimensionais como Misturas de Gaussianas	SILVA FILHO, S. C. ; DREWS JR, P. L. J. ; BOTELHO, S. S. C. ; NUNEZ, P.	2012		28	3066	3
3206	TC	Modelando Nuvens de Pontos Tridimensionais como Misturas de Gaussianas	SILVA FILHO, S. ; Drews, Paulo L. ; Botelho, Silvia S. C. ; NUNEZ, P.	2012	1-6	34	3066	3
3067	TC	Utilizando Representações Multi-semânticas para Mapeamento Topológico em Robótica Móvel	FIGUEIREDO, M. ; HAFFELE, C. ; BOTELHO, S. S. C. ; DREWS JR, P. L. J. ; OLIVEIRA, G. L.	2012		28	3067	3
3207	TC	Utilizando Representações Multi-semânticas para Mapeamento Topológico em Robótica Móvel	FIGUEIREDO, M. ; Botelho, Silvia S. C. ; Drews, Paulo L. ; da Rocha, C. ; OLIVEIRA, G. L.	2012	1-6	34	3067	3
3068	TC	Modelando Head Direction Cells para Estimativa de Orientacão Idiotética de Robôs Móveis	SILVEIRA, Luan ; GUTH, F. A. ; FIGUEIREDO, M. ; BOTELHO, S. S. C. ; DREWS JR, P. L. J.	2012		28	3068	3
3208	TC	Modelando Head Direction Cells para Estimativa de Orientacão Idiotética de Robôs Móveis	Silveira, Luan ; Botelho, Silvia S. C. ; Drews, Paulo L. ; GUTH, F. ; FIGUEIREDO, M.	2012	1-6	34	3068	3
3071	TC	Spatial and Perceptive Mapping using Semantically Self-Organizing Maps applied to Mobile Robots	FIGUEIREDO, M. ; BOTELHO, S. S. C. ; DREWS JR, P. L. J. ; HAFFELE, C.	2012		28	3071	3
3211	TC	Spatial and Perceptive Mapping using Semantically Self-Organizing Maps applied to Mobile Robots	FIGUEIREDO, M. ; Botelho, Silvia S. C. ; DREWS, P. ; da Rocha, C.	2012	1-6	34	3071	3
3072	TC	Using Space D* for Crowded Real Robots Environments	ALMEIDA, F. R. ; BOTELHO, S. S. C. ; SILVEIRA, Luan ; DREWS JR, P. L. J. ; MAFFEI, R. Q. ; DUARTE FILHO, N. L. ; BICHO, A. L. ; LONGARAY, M. M.	2012		28	3072	3
3212	TC	Using Space D* for Crowded Real Robots Environments	Almeida, F ; Botelho, Silvia S. C. ; SILVEIRA, L. ; DREWS, P. ; Maffei, R. Q. ; DUARTE, N. ; BICHO, A. ; LONGARAY, M.	2012	1-6	34	3072	3
3219	TC	Space D*: Um Algoritmo para Path Planning Multi-Robôs	Silveira, L. ; R. maffei ; BOTELHO, S. S. C. ; DREWS, P. ; DUARTE, N. ; BICHO, A. ; Almeida, F ; LONGARAY, M.	2011	1-6	34	2454	3
3075	TC	Analyzing and Exploring Feature Detectors in Images	DREWS JR, P. L. J. ; BEM, R. A. ; MELO, A. S.	2011		28	3075	3
3136	TC	Analyzing and exploring feature detectors in images	DREWS JR, P. L. J. ; DE BEM, Rodrigo Andrade ; MELO, A. S.	2011	305-310	32	3075	3
3076	TC	Controle automático de um ROV para inspeção de estruturas submersas	KUHN, V. N. ; DREWS JR, P. L. J. ; GOMES, S. C. P. ; BOTELHO, S. S. C. ; CUNHA, M. A. B.	2011		28	3076	3
3221	TC	Controle automático de um ROV para inspeção de estruturas submersas	KUHN ; DREWS, P. ; Gomes ; BOTELHO, S. S. C. ; Cunha	2011		34	3076	3
3222	TC	D*-Space: planejando caminhos para sistemas multi-robôs	Silveira, L. ; R. maffei ; BOTELHO, S. S. C. ; DREWS, P. ; DUARTE, N. ; BICHO, A. ; LONGARAY, M. ; ALMEIDA	2011		34	2455	3
3082	TC	Sensor Fusion based on Multi-Self-Organizing Maps for SLAM	OLIVEIRA, G. L. ; BOTELHO, S. S. C. ; DREWS JR, P. L. J. ; FIGUEIREDO, M. ; HAFFELE, C.	2010	1-5	28	3082	3
3231	TC	Sensor Fusion based on Multi-Self-Organizing Maps for SLAM	m, figueiredo ; LEIVAS, G ; BOTELHO, S. S. C. ; DREWS, P. ; da Rocha, C.	2010	1-6	34	3082	3
3083	TC	Fusao Sensorial de Mapas Auto-Organizáveis para SLAM	OLIVEIRA, G. L. ; FIGUEIREDO, M. ; BOTELHO, S. S. C. ; DREWS JR, P. L. J. ; HAFFELE, C.	2010	1-6	28	3083	3
3226	TC	Fusão sensorial de mapas auto-organizáveis para SLAM	LEIVAS, G ; DREWS, P. ; BOTELHO, S. S. C. ; m, figueiredo ; da Rocha, C.	2010	1-6	34	3083	3
3093	TC	Localização de um Robô Subterrâneo Para Inspeção de Linhas de Transmissão	DREWS JR, P. L. J. ; BOTELHO, S. S. C. ; CAMPOS, M. F. M.	2009	1-6	28	3093	3
3242	TC	Localização de um Robô Subterrâneo Para Inspeção de Linhas de Transmissão	DREWS, P. ; BOTELHO, S. S. C. ; Campos, M.	2009	1-6	34	3093	3
3094	TC	Visual Odometry and Mapping for Underwater Autonomous Vehicles	BOTELHO, S. S. C. ; OLIVEIRA, G. L. ; DREWS JR, P. L. J. ; FIGUEIREDO, M.	2009	1-6	28	3094	3
3246	TC	Visual Odometry and Mapping for Underwater Autonomous Vehicles	BOTELHO, S. S. C. ; LEIVAS, G ; DREWS, P. ; m, figueiredo	2009	1-6	34	3094	3
3097	TC	A new approach for Visual Underwater Mapping using Topological Shell Maps	BOTELHO, S. S. C. ; OLIVEIRA, G. L. ; DREWS JR, P. L. J.	2009		28	3097	3
3240	TC	A new approach for Visual Underwater Mapping using Topological Shell Maps	LEIVAS, G ; DREWS, P. ; BOTELHO, S. S. C.	2009	1-8	34	3097	3
3247	TC	TATUBOT Sistema Robótico de Inspeção para Linhas de Distribuição Elétrica Subterrâneas	BOTELHO, S. S. C. ; OLIVEIRA, V. ; DUARTE, N. ; MELLO, C. ; Estrada, E. ; Galeriano, M. ; DREWS, P. ; CORREA, U. B.	2008	100-106	34	2569	3
3099	TC	Uma Abordagem Baseada em Visão Computacionalpara Localização e Mapeamento Simultâneos de Robôs Subaquáticos	DREWS JR, P. L. J. ; BOTELHO, S. S. C.	2008	81-90	28	3099	3
3252	TC	Uma Abordagem Baseada em Visão Computacional para Localização e Mapeamento Simultâneos de Robôs Subaquáticos	DREWS, P. ; BOTELHO, S. S. C.	2008	1-6	34	3099	3
3249	TC	SIFT and Topologic Maps applied to robotic SLAM in Underwater Environment	DREWS, P. ; MEDEIROS, M. M. ; GONCALVES, E. ; BOTELHO, S. S. C.	2008	1-6	34	2755	3
3101	TC	NLMAP - Visual-based Self Localization and Mapping for Autonomous Underwater Vehicles	DREWS JR, P. L. J. ; BOTELHO, S. S. C. ; OLIVEIRA, G. L.	2008	2050-2055	28	3101	3
3254	TC	NLMAP - Visual-based Self Localization and Mapping for Autonomous Underwater Vehicles	BOTELHO, S. S. C. ; DREWS, P. ; LEIVAS, G	2008	1-6	34	3101	3
3102	TC	Visão Computacional aplicada à Localização e Mapeamento Simultâneos de Robôs Subaquáticos	DREWS JR, P. L. J. ; BOTELHO, S. S. C.	2008	1-4	28	3102	3
3253	TC	Visão Computacional aplicada à Localização e Mapeamento Simultâneos de Robôs Subaquáticos	DREWS, P. ; BOTELHO, S. S. C.	2008	1-6	34	3102	3
3104	TC	SLAM in Underwater Environment using SIFT and Topologic Maps	DREWS JR, P. L. J. ; BOTELHO, S. S. C. ; GOMES, S. C. P.	2008	91-96	28	3104	3
3250	TC	SLAM in Underwater Environment using SIFT and Topologic Maps Accepted	DREWS, P. ; BOTELHO, S. S. C. ; GOMES, S.	2008	1-6	34	3104	3
3223	TC	Hyper-Environments: A Different Way to Think about IoT	Tyska, j. ; PENNA, R. ; Botelho, Silvia S. C. ; Duarte Filho, Nelson L. ; R. Oliveira ; SANTOS, E.	2011	25-32	34	2970	3
3129	TC	Exploring Creativity and Sociability with an Accessible Educational Robotic Kit	BOTELHO, S. S. C. ; BRAZ, L. G. ; Rodrigues, Ricardo N.	2012		31	3129	3
3218	TC	Exploring Creativity and Sociability with an Accessible Educational Robotic Kit	Botelho, Silvia S. C. ; Braz, L. ; NAGEL, R.	2012	1-6	34	3129	3
3138	TC	3D Motion Tracking Based on Probabilistic Volumetric Reconstruction and Optical Flow	SIMAS, Gisele ; FICKEL, G. ; NOVELO, Lucas ; DE BEM, Rodrigo Andrade ; BOTELHO, Silvia Silva da Costa	2010	279-286	32	3138	3
3225	TC	3D Motion Tracking Based on Probabilistic Volumetric Reconstruction and Optical Flow	SIMAS, G. ; FICKEL, G. ; l, novello ; BEM, R. ; BOTELHO, S. S. C.	2010	1-6	34	3138	3
3139	TC	Reconstrução Probabilística 3D Aplicada à Análise de Movimento: um Enfoque na Tele-Operação	SIMAS, Gisele ; FICKEL, G. ; NOVELO, Lucas ; DE BEM, Rodrigo Andrade ; BOTELHO, Silvia Silva da Costa	2010	3800-3807	32	3139	3
3228	TC	Reconstrução Probabilística 3D Aplicada à Análise de Movimento: um Enfoque na Tele-operação	SIMAS, G. ; FICKEL, G. ; l, novello ; BEM, R. DE ; BOTELHO, S. S. C.	2010	1-6	34	3139	3
3299	AP	Arquitetura de navegação autônoma de linhas subterrâneas de distribuição de energia	Estrada, E. ; Silveira L. ; BOTELHO, S. S. C. ; OLIVEIRA, V. M.	2008	32-45	37	2777	3
3304	TC	Uma arquitetura para navegação autônoma de robôs reais e simulados para inspeção de linhas de distribuição de energia subterrâneas	Estrada, E. ; Gonçalves, E. N. ; BOTELHO, S. S. C. ; OLIVEIRA, V. M. ; ALMEIDA, R. ; Gules R. ; Silveira L.	2009		37	2754	3
3307	TC	Tatubot - Sistema Robótico de Inspeção para Linhas de Distribuição Elétrica Subterrâneas	BOTELHO, S. S. C. ; DUARTE FILHO, N. L. ; OLIVEIRA, V. M. ; Mello Jr., C. D. ; Estrada, E. ; Galeriano, M. ; LILLES, P. D. ; CORREA, U. B.	2008	100-106	37	2569	3
3308	TC	TATUBOT ROBOTIC SYSTEM FOR INSPECTION OF UNDERGROUNDED CABLE SYSTEM	BOTELHO, S. S. C. ; OLIVEIRA, V. M. ; Gonçalves, E. N. ; Estrada, E. ; Mello Jr., C. D. ; LILLES, P. D. ; ALMEIDA, R. ; SOUTO JR., H. ; Santos, T.	2008	1-6	37	2570	3
3309	TC	TATUBOT - Robotic System for Inspection of Undergrounded Cable System	BOTELHO, S. S. C. ; OLIVEIRA, V. M. ; Mello Jr., C. D. ; Gonçalves, E. N. ; Estrada, E. ; ALMEIDA, R. ; Santos, T. ; SOUTO JR., H. ; OLIVEIRA, G.	2008	1-6	37	2571	3
3274	TC	Aquisição e Análise de Modos de Vibração em Estruturas Flexíveis	SOARES, L. B. ; GOMES, S. C. P. ; GERVINI, V. I. ; ROSA, V. S. ; BELLICANTA, L. S. ; ZEILMANN, A. P ; GOMES, S. S.	2010	1-4	35	3274	3
3289	TC	Aquisição e Análise de Modos de Vibração em Estruturas Flexíveis	SOARES, L. B. ; GOMES, S.C.P. ; GERVINI, V. I. ; ROSA, V. S.	2010	1-6	36	3274	3
\.


--
-- Data for Name: replica; Type: TABLE DATA; Schema: versionado; Owner: postgres
--

COPY replica (id1, id2, v_cont, f_cont, versao) FROM stdin;
1745	1926	0	0	2
1752	2375	0	0	2
1753	1761	0	0	2
1755	2206	0	0	2
1759	2148	0	0	2
1760	2149	0	0	2
1785	2011	0	0	2
1788	2017	0	0	2
1792	2021	0	0	2
1793	2023	0	0	2
1794	2024	0	0	2
1797	2025	0	0	2
1798	2027	0	0	2
1799	2028	0	0	2
1800	2029	0	0	2
1806	2042	0	0	2
1807	2039	0	0	2
1808	2043	0	0	2
1809	2041	0	0	2
1813	2044	0	0	2
1815	2045	0	0	2
1816	2046	0	0	2
1818	1952	0	0	2
1819	2058	0	0	2
1820	2057	0	0	2
1821	2054	0	0	2
1822	2052	0	0	2
1823	1941	0	0	2
1824	2047	0	0	2
1827	2061	0	0	2
1828	2066	0	0	2
1829	2065	0	0	2
1831	2069	0	0	2
1832	2070	0	0	2
1836	2071	0	0	2
1837	2072	0	0	2
1838	2073	0	0	2
1839	2074	0	0	2
1840	2076	0	0	2
1841	2075	0	0	2
1845	2081	0	0	2
1847	2083	0	0	2
1848	2084	0	0	2
1851	2086	0	0	2
1852	2087	0	0	2
1853	2096	0	0	2
1854	2097	0	0	2
1856	2094	0	0	2
1862	2006	0	0	2
1863	1985	0	0	2
1864	2007	0	0	2
1865	2185	0	0	2
1868	2192	0	0	2
1869	2193	0	0	2
1870	2194	0	0	2
1885	2303	0	0	2
1888	2146	0	0	2
1889	2339	0	0	2
1892	2363	0	0	2
1893	2362	0	0	2
1935	2120	0	0	2
1941	2049	0	0	2
1942	2259	0	0	2
1943	2260	0	0	2
1945	2261	0	0	2
1946	2262	0	0	2
1952	2059	0	0	2
1954	2009	0	0	2
1958	2263	0	0	2
1959	2264	0	0	2
1961	2123	0	0	2
1964	2124	0	0	2
1982	2000	0	0	2
1983	2003	0	0	2
1984	2250	0	0	2
1985	2005	0	0	2
1986	2386	0	0	2
1998	2318	0	0	2
2000	2154	0	0	2
2001	2359	0	0	2
2003	2374	0	0	2
2004	2428	0	0	2
2005	2381	0	0	2
2006	2156	0	0	2
2007	2385	0	0	2
2101	2272	0	0	2
2102	2371	0	0	2
2103	2388	0	0	2
2104	2387	0	0	2
2139	2305	0	0	2
2140	2309	0	0	2
2141	2317	0	0	2
2142	2322	0	0	2
2143	2329	0	0	2
2144	2330	0	0	2
2145	2331	0	0	2
2146	2332	0	0	2
2147	2334	0	0	2
2148	2224	0	0	2
2149	2227	0	0	2
2150	2256	0	0	2
2151	2365	0	0	2
2152	2364	0	0	2
2153	2366	0	0	2
2154	2424	0	0	2
2155	2369	0	0	2
2156	2248	0	0	2
2206	2301	0	0	2
2207	2311	0	0	2
2208	2312	0	0	2
2209	2314	0	0	2
2210	2319	0	0	2
2214	2346	0	0	2
2216	2336	0	0	2
2217	2337	0	0	2
2218	2338	0	0	2
2221	2341	0	0	2
2222	2342	0	0	2
2224	2349	0	0	2
2225	2274	0	0	2
2226	2351	0	0	2
2227	2352	0	0	2
2232	2361	0	0	2
2233	2356	0	0	2
2243	2372	0	0	2
2244	2376	0	0	2
2247	2370	0	0	2
2248	2377	0	0	2
2249	2382	0	0	2
2250	2379	0	0	2
2251	2384	0	0	2
2252	2383	0	0	2
2254	2380	0	0	2
2256	2353	0	0	2
2276	2355	0	0	2
2277	2358	0	0	2
2318	2421	0	0	2
2374	2426	0	0	2
2377	2429	0	0	2
2381	2430	0	0	2
2385	2431	0	0	2
2398	2413	0	0	2
2434	2653	0	0	3
2441	3245	0	0	3
2442	2456	0	0	3
2450	3056	0	0	3
2454	2968	0	0	3
2455	2969	0	0	3
2484	2800	0	0	3
2487	2806	0	0	3
2491	2810	0	0	3
2492	2812	0	0	3
2493	2813	0	0	3
2496	2814	0	0	3
2497	2816	0	0	3
2498	2817	0	0	3
2499	2818	0	0	3
2505	2831	0	0	3
2506	2828	0	0	3
2507	2832	0	0	3
2508	2830	0	0	3
2512	2833	0	0	3
2514	2834	0	0	3
2515	2835	0	0	3
2517	2679	0	0	3
2518	2847	0	0	3
2519	2846	0	0	3
2520	2843	0	0	3
2521	2841	0	0	3
2522	2668	0	0	3
2523	2836	0	0	3
2526	2850	0	0	3
2527	2855	0	0	3
2528	2854	0	0	3
2530	2858	0	0	3
2531	2859	0	0	3
2535	2860	0	0	3
2536	2861	0	0	3
2537	2862	0	0	3
2538	2863	0	0	3
2539	2865	0	0	3
2540	2864	0	0	3
2544	2870	0	0	3
2546	2872	0	0	3
2547	2873	0	0	3
2550	2875	0	0	3
2551	2876	0	0	3
2552	2885	0	0	3
2553	2886	0	0	3
2555	2883	0	0	3
2569	2788	0	0	3
2570	2756	0	0	3
2571	2789	0	0	3
2572	3025	0	0	3
2575	3032	0	0	3
2576	3033	0	0	3
2577	3034	0	0	3
2604	3172	0	0	3
2607	2966	0	0	3
2608	3209	0	0	3
2611	3233	0	0	3
2612	3232	0	0	3
2662	2935	0	0	3
2668	2838	0	0	3
2669	3117	0	0	3
2670	3118	0	0	3
2672	3119	0	0	3
2673	3120	0	0	3
2679	2848	0	0	3
2681	2793	0	0	3
2685	3121	0	0	3
2686	3122	0	0	3
2688	2938	0	0	3
2691	2939	0	0	3
2753	2782	0	0	3
2754	2785	0	0	3
2755	3100	0	0	3
2756	2787	0	0	3
2757	3256	0	0	3
2777	3187	0	0	3
2782	2974	0	0	3
2783	3229	0	0	3
2785	3244	0	0	3
2786	3306	0	0	3
2787	3251	0	0	3
2788	2976	0	0	3
2789	3255	0	0	3
2904	3134	0	0	3
2905	3241	0	0	3
2906	3258	0	0	3
2907	3257	0	0	3
2959	3174	0	0	3
2960	3178	0	0	3
2961	3186	0	0	3
2962	3192	0	0	3
2963	3199	0	0	3
2964	3200	0	0	3
2965	3201	0	0	3
2966	3202	0	0	3
2967	3204	0	0	3
2968	3074	0	0	3
2969	3077	0	0	3
2970	3113	0	0	3
2971	3235	0	0	3
2972	3234	0	0	3
2973	3236	0	0	3
2974	3302	0	0	3
2975	3239	0	0	3
2976	3098	0	0	3
3056	3170	0	0	3
3057	3180	0	0	3
3058	3181	0	0	3
3059	3183	0	0	3
3060	3188	0	0	3
3064	3216	0	0	3
3066	3206	0	0	3
3067	3207	0	0	3
3068	3208	0	0	3
3071	3211	0	0	3
3072	3212	0	0	3
3074	3219	0	0	3
3075	3136	0	0	3
3076	3221	0	0	3
3077	3222	0	0	3
3082	3231	0	0	3
3083	3226	0	0	3
3093	3242	0	0	3
3094	3246	0	0	3
3097	3240	0	0	3
3098	3247	0	0	3
3099	3252	0	0	3
3100	3249	0	0	3
3101	3254	0	0	3
3102	3253	0	0	3
3104	3250	0	0	3
3113	3223	0	0	3
3129	3218	0	0	3
3138	3225	0	0	3
3139	3228	0	0	3
3187	3299	0	0	3
3244	3304	0	0	3
3247	3307	0	0	3
3251	3308	0	0	3
3255	3309	0	0	3
3274	3289	0	0	3
\.


--
-- Data for Name: resumo; Type: TABLE DATA; Schema: versionado; Owner: postgres
--

COPY resumo (id_publicacao, doi, evento, volume, numero, versao) FROM stdin;
2444		Mostra de Produção Universitária, 2011, Rio Grande. Mostra de Produção Universitária			3
2445		Mostra de Produção Universitária - FURG, 2011, Rio Grande. Mostra de Produção Universitária - FURG			3
2446		Mostra de Produção Universitária - FURG, 2011, Rio Grande. Mostra de Produção Universitária - FURG			3
2447		9th European Conference on Computational Biology, 2010, Ghent. 9th European Conference on Computational Biology			3
2448		9th European Conference on Computational Biology, 2010, Ghent. 9th European Conference on Computational Biology			3
2457		X Mostra da Produção Universitária - FURG, 2011, Rio Grande/RS, Brasil. Anais da X Mostra da Produção Universitária - FURG. Rio Grande/RS: FURG			3
2458		10th International Conference on Intelligent Virtual Agents - IVA, 2010, Philadelphia/Pennsylvania-USA. Booklet of short/poster papers of 10th International Conference on Intelligent Virtual Agents	U		3
2479		I Encontro Internacional de Educação e IV Encontro Municipal de Educação, 2011, Piratini - RS. Escola:espaço de sonhos,construção e possibilidades			3
2480		VIII Mostra de Produção Universitária, 2009, Rio Grande. XI ENCONTRO DE PÓS-GRADUAÇÃO. Rio Grande	1		3
2567		WESAAC 2010: Workshop-Escola de Sistemas Multiagentes, seus Ambientes e Aplicações, 2010, Rio Grande. Anais do WESAAC 2010. Rio Grande: FURG	1		3
2568		WESAAC 2010: Workshop-Escola de Sistemas de Agentes, seus Ambientes e Aplicações, 2010, Rio Grande. Anais do WESAAC 2010. Rio Grande: FURG	1		3
2592		Mostra de Produção Universitária - MPU FURG, 2011, Rio Grande. Mostra de Produção Universitária - MPU FURG. Rio Grande: FURG			3
2593		Mostra de Produção Universitária - MPU FURG, 2011, Rio Grande. Mostra de Produção Universitária - MPU FURG. Rio Grande: FURG			3
2594		Mostra de Produção Universitária - MPU FURG, 2011, Rio Grande. Mostra de Produção Universitária - MPU FURG. Rio Grande: FURG			3
2595		Mostra de Produção Universitária - MPU FURG, 2011, Rio Grande. Mostra de Produção Universitária - MPU FURG. Rio Grande: FURG			3
2596		Mostra de Produção Universitária - MPU FURG, 2011, Rio Grande. Mostra de Produção Universitária - MPU FURG. Rio Grande: FURG			3
2597		Mostra de Produção Universitária - MPU FURG, 2011, Rio Grande. Mostra de Produção Universitária - MPU FURG. Rio Grande: FURG			3
2598		Mostra de Produção Universitária - MPU FURG, 2011, Rio Grande. Mostra de Produção Universitária - MPU FURG. Rio Grande: FURG			3
2599		Mostra de Produção Universitária - MPU FURG, 2011, Rio Grande. Mostra de Produção Universitária - MPU FURG. Rio Grande: FURG			3
2600		MPU - Mostra de Produção Universitaria, 2010, Rio Grande. MPU 2010			3
2601		MPU - Mostra de Produção Universitaria, 2010, Rio Grande. MPU 2010			3
2602		MPU - Mostra de Produção Universitaria, 2010, Rio Grande. MPU 2010			3
2603		SForum, 2008, Gramado - Brasil. SForum			3
2618		XVIII CONGRESSO BRASILEIRO DE AUTOMATICA CBA 2010, 2010, Bonito. Anais do XVIII CONGRESSO BRASILEIRO DE AUTOMATICA CBA 2010			3
2619		Proceedings of The 7th ACM SIGGRAPH International Conference on Virtual-Reality Continuum and Its Applications in Industry, 2008, Biopolis-Singapore. Proceedings of The 7th ACM SIGGRAPH International Conference on Virtual-Reality Continuum and Its Applications in Industry. Biopolis: ACM SIGGRAPH	1		3
2640		Design, Automation and Test in Europe, 2009, Nice. Proceedings of DATE 2009			3
2716		International Conference on Health and Social Care Information Systems and Technologies, 2012, Algarve / Portugal. HCIST 2012. Algarve / Portugal: HCSIT			3
2717		Mostra de Produção Universitária, 2012, Rio Grande / RS. MPU 2012. Rio Grande / RS: Editora FURG			3
2718		Mostra de Produção Universitária, 2012, Rio Grande / RS. MPU 2012. Rio Grande / RS: Editora FURG			3
2719		Mostra de Produção Universitária, 2012, Rio Grande / RS. MPU 2012. Rio Grande / RS: Editora FURG			3
2720		Mostra de Produção Universitária, 2012, Rio Grande / RS. MPU 2012. Rio Grande / RS: Editora FURG			3
2721		Mostra de Produção Universitária, 2012, Rio Grande / RS. MPU 2012. Rio Grande / RS: Editora FURG			3
2722		Mostra de Produção Universitária, 2012, Rio Grande / RS. MPU 2012. Rio Grande / RS: Editora FURG			3
2723		Mostra de Produção Universitária, 2012, Rio Grande / RS. MPU 2012. Rio Grande / RS: Editora FURG			3
2724		Mostra de Produção Universitária, 2012, Rio Grande / RS. MPU 2012. Rio Grande / RS: Editora FURG			3
2725		Mostra de Produção Universitária, 2012, Rio Grande / RS. MPU 2012. Rio Grande / RS: Editora FURG			3
2726		Mostra de Produção Universitária, 2012, Rio Grande / RS. MPU 2012. Rio Grande / RS: Editora FURG			3
2727		Mostra de Produção Universitária, 2012, Rio Grande / RS. MPU 2012. Rio Grande / RS: Editora FURG			3
2728		Mostra de Produção Universitária, 2012, Rio Grande / RS. MPU 2012. Rio Grande / RS: Editora FURG			3
2729		Mostra de Produção Universitária, 2012, Rio Grande / RS. MPU 2012. Rio Grande / RS: Editora FURG			3
2730		Mostra de Produção Universitária, 2012, Rio Grande / RS. MPU 2012. Rio Grande / RS: Editora FURG			3
2731		Mostra de Produção Universitária, 2012, Rio Grande / RS. MPU 2012. Rio Grande / RS: Editora FURG			3
2732		Mostra de Produção Universitária, 2012, Rio Grande / RS. MPU 2012. Rio Grande / RS: Editora FURG			3
2733		Mostra de Produção Universitária, 2011, Rio Grande RS. MPU 2011. Rio Grande RS: FURG			3
2734		Mostra de Produção Universitária, 2011, Rio Grande RS. MPU 2011. Rio Grande RS: FURG			3
2735		Mostra de Produção Universitária, 2011, Rio Grande RS. MPU 2011. Rio Grande RS: FURG			3
2736		Mostra de Produção Universitária, 2011, Rio Grande RS. MPU 2011. Rio Grande RS: FURG			3
2737		Mostra de Produção Universitária, 2011, Rio Grande RS. MPU 2011. Rio Grande RS: FURG			3
2738		Mostra de Produção Universitária, 2011, Rio Grande RS. MPU 2011. Rio Grande RS: FURG			3
2739		Mostra de Produção Universitária, 2011, Rio Grande RS. MPU 2011. Rio Grande RS: FURG			3
2740		Mostra de Produção Universitária, 2011, Rio Grande RS. MPU 2011. Rio Grande RS: FURG			3
2741		Mostra de Produção Universitária, 2011, Rio Grande RS. MPU 2011. Rio Grande RS: FURG			3
2742		Salão de Iniciação Científica da UFRGS, 2010, Porto Alegre/RS. SIC UFRGS			3
2743		Mostra de Produção Universitária, 2010, Rio Grande / RS. MPU 2010. Rio Grande			3
2744		Mostra de Produção Universitária, 2010, Rio Grande / RS. MPU 2010. Rio Grande			3
2745		Mostra de Produção Universitária, 2010, Rio Grande / RS. MPU 2010. Rio Grande			3
2746		Mostra de Produção Universitária, 2010, Rio Grande / RS. MPU 2010. Rio Grande			3
2747		Congresso de Iniciação Científica UCPel, 2008, Pelotas. CIC UCPel			3
2773		X Mostra de Produção Universitária da FURG, 2011, Rio Grande. Anais da X MPU / FURG			3
2774		X Mostra de Produção Universitária da FURG, 2011, Rio Grande. Anais da X MPU / FURG			3
2775		X Mostra de Produção Universitária da FURG, 2011, Rio Grande. Anais da X MPU / FURG			3
2776		Salão de Iniciação Científica, 2009, Porto Alegre. Anais do XXI Salão de Iniciação Científica			3
2791		Mostra de Produção Universitária, 2011, Rio Grande. 10a Mostra de Produção Universitária			3
2798		Mostra de Produção Universitária, 2010, Rio Grande / RS. Mostra de Produção Universitária			3
2922		8th International Conference of the Brazilian Association for Bioinformatics and Computational Biology, 2012, Campinhas-SP. X-Meeting 2012 -			3
2923		Xmeeting, 2011, Florianópolis. 2011 Abstract book			3
2924		10º Mostra da Produção Universitária, 2011, Rio Grande. 10º Mostra da Produção Universitária			3
2925		ISCB Latin America 2010, 2010, Montevideo. International Society for Computational Biology Latin America Conference			3
2926		ISCB Latin America 2010, 2010, Montevideo. International Society for Computational Biology Latin America Conference			3
2927		ISCB Latin America, 2010, Montevideo. International Society for Computational Biology Latin America Conference			3
2928		ISCB Latin America, 2010, Montevideo. International Society for Computational Biology Latin America Conference			3
2929		6th International Conference of the Brazilian Association for Bioinformatics and Computational Biology, 2010, Ouro Preto, MG. Abstracts Book			3
2930		6th International Conference of the Brazilian Association for Bioinformatics and Computational Biology, 2010, Ouro Preto. Abstracts Book			3
2943		XVII Encontro Regional de Estudantes de Matemática do Sul, 2011, Curitiba. Anais do XVII Encontro Regional de Estudantes de Matemática do Sul			3
2944		10a Mostra de Produção Universitária - MPU, 2011, Rio Grande. Anais			3
2945		MPU - Mostra de produção universitária, 2010, Rio Grande. Mostra de Produção Universitária 2010			3
2983		IEEE RFID 2011, 2011, Orlando. Anais do IEEE RFID 2011			3
3007		XI Congreso Argentino de Meteorologia, 2012, Mendoza. XI Congremet. Buenos Aires: Centro Argentino de Meteorologos	1		3
3008		IX Simpósio de Ondas, Marés, Engenharia Oceânica e Oceanografia por Satélite, 2011, Arraial do Cabo. Anais do IX OMAR-SAT. Arraial do Cabo: Instituto de Estudos do Mar Almirante Paulo Moreira	1		3
3009		AGU Fall Meeting 2010, 2010, San Francisco, Estados Unidos. 2010 Fall Meeting, AGU. San Francisco, Califoria: AGU	1		3
3010		AGU 2010 Meeting of the Americas, 2010, Foz do Iguaçu. Eos Trans. AGU	91		3
3011		2009 Joint Assembly - American Geophysical Union, 2009, Toronto. Eos Trans. AGU Jt. Assem. Suppl. Washington: AGU	90		3
3012		2009 Joint Assembly - American Geophysical Union, 2009, Toronto. Eos Trans. AGU Jt. Assem. Suppl. Washington: AGU	90		3
3013		VI Workshop Brasileiro de Micrometeorologia, 2009, Santa Maria. Anais. Santa Maria	1		3
3014		VI Workshop Brasileiro de Micrometeorologia, 2009, Santa Maria. Anais. Santa Maria	1`		3
3019		MPU - Mostra da Produção Universitária, 2012, Rio Grande. MPU - Mostra da Produção Universitária			3
3020		MPU - Mostra da Produção Universitária, 2012, Rio Grande. MPU - Mostra da Produção Universitária			3
3021		MPU - Mostra da Produção Universitária, 2012, Rio Grande. MPU - Mostra da Produção Universitária			3
3022		10ª Mostra de Produção Universitária, 2011, Rio Grande. 10ª Mostra de Produção Universitária			3
3023		10ª Mostra de Produção Universitária, 2011, Rio Grande. 10ª Mostra de Produção Universitária			3
3024		10ª Mostra de Produção Universitária, 2011, Rio Grande. 10ª Mostra de Produção Universitária			3
3046		Mostra de Produção Universitária - MPU FURG, 2011, Rio Grande. Anais da Mostra de Produção Universitária - MPU FURG			3
3047		Mostra de Produção Universitária - MPU FURG, 2011, Rio Grande. Anais da Mostra de Produção Universitária - MPU FURG			3
3048		Mostra de Produção Universitária - MPU FURG, 2011, Rio Grande. Anais da Mostra de Produção Universitária - MPU FURG			3
3049		Mostra de Produção Universitária - MPU FURG, 2011, Rio Grande. Anais da Mostra de Produção Universitária - MPU FURG			3
3050		Mostra de Produção Universitária - MPU FURG, 2011, Rio Grande. Anais da Mostra de Produção Universitária - MPU FURG			3
3051		Mostra de Produção Universitária - MPU FURG, 2011, Rio Grande. Anais da Mostra de Produção Universitária - MPU FURG			3
3052		Mostra de Produção Universitária - FURG, 2011, Rio Grande. Anais da Mostra de Produção Universitária - FURG			3
3053		IX Student Forum on Microelectronics, 2009, Natal. IX Student Forum on Microelectronics. Natal			3
3054		VIII Student Forum on Microelectronics, 2008, Gramado. VIII Student Forum on Microelectronics. Porto Alegre: SBC			3
3055		VIII Student Forum on Microelectronics, 2008, Gramado. VIII Student Forum on Microelectronics. Porto Alegre: SBC			3
3105		5th International Conference on Spatial Cognition, 2012, Roma, Italy. Proceedings of 5th International Conference on Spatial Cognition			3
3106		5th International Conference on Spatial Cognition, 2012, Roma, Italy. Proceedings of 5th International Conference on Spatial Cognition			3
3107		X Mostra de Produção Universitária, 2011, Rio Grande, Brazil. X Mostra de Produção Universitária - FURG			3
3108		X Mostra de Produção Universitária, 2011, Rio Grande, Brazil. X Mostra de Produção Universitária			3
3109		X Mostra de Produção Universitária, 2011, Rio Grande, Brazil. X Mostra de Produção Universitária - FURG			3
3110		X Mostra de Produção Universitária, 2011, Rio Grande, Brazil. X Mostra de Produção Universitária - FURG			3
3111		X Mostra de Produção Universitária, 2011, Rio Grande, Brazil. X Mostra de Produção Universitária - FURG			3
3126		International Conference on Health and Social Care Information Systems and Technologies, 2012, Algarve / PortugaL. HCIST 2012			3
3127		X Mostra de Produção Universitária, 2011, Rio Grande. MPU 2011			3
3145		X Mostra de Produção Universitária - MPU 2011, 2011, Rio Grande. Anais da X Mostra de Produção Universitária. Rio Grande: FURG			3
3146		X Mostra de Produção Universitária - MPU 2011, 2011, Rio Grande. Anais da X Mostra de Produção Universitária. Rio Grande: Furg			3
3168					3
3316		10a. Mostra da Produção Universitária da FURG, 2011, Rio Grande. Anais da 10a. Mostra da Produção Universitária da FURG			3
3317		XXIII Congresso Regional de Iniciação Científica e Tecnológica em Engenharia, 2009, Joinville. Anais do XXIII Congresso Regional de Iniciação Científica e Tecnológica em Engenharia			3
\.


--
-- Data for Name: resumo_exp; Type: TABLE DATA; Schema: versionado; Owner: postgres
--

COPY resumo_exp (id_publicacao, doi, evento, volume, versao) FROM stdin;
2443		XIX Seminário de Iniciação Científica da UNIJUÍ, 2011, Ijuí. Salão do Conhecimento - XIX Seminário de Iniciação Científica		3
2561		V Workshop-Escola de Sistemas de Agentes, seus Ambientes e Aplicações, 2011, Curitiba. Anais do WESAAC 2011. Curitiba: UTFPR	1	3
2562		Workshop-Escola de Sistemas de Agentes, seus Ambientes e Aplicações - WESAAC 2010, 2010, Rio Grande. Anais do WESAAC 2010. Rio Grande: FURG	1	3
2563		4th Southern Conference on Computational Modeling/IX Encontro Regional de Matemática Aplicada e Computacional, 2010, Rio Grande. Anais do 4MCSUL/IX ERMAC. Rio Grande: FURG	1	3
2564		The 8th International Conference on Autonomous Agents and Multiagent Systems, 2009, Budapest. Proceedings of AAMAS 2009. Richland: IFAAMAS	1	3
2565		3rd Southern Conference on Computational Modeling, 2009, Rio Grande. Proceedings of MCSUL 2009. Rio Grande: FURG	1	3
2566		7th International Joint Conference on Autonomous Agents and Multiagent Systems (AAMAS 2008), 2008, Estoril. Proceedings of AAMAS 2008. Estoril: IFAMAS	3	3
2616		Workshop em Sistemas Embarcados para Indústria de Óleo, Gás e Energia, 2012, Rio Grande. Proceedings of Workshop em Sistemas Embarcados para Indústria de Óleo, Gás e Energia	1	3
2617		X Symposium on Virtual and Augmented Reality, 2008, Joao Pessoa. Proceedings of the X Symposium on Virtual and Augmented Reality. Porto Alegre: Sociedade Brasileira de Computação	1	3
2638		XXVII South Symposium on Microeletronics, 2012, Ijuí e São Miguel da Missões. Proceedings of XXVII South Symposium on Microeletronics		3
2639		XXVII South Symposium on Microeletronics, 2012, Ijuí e São Miguel da Missões. Proceedings of XXVII South Symposium on Microeletronics		3
2705		1o. Seminário Nacional de Inclusão Digital e Software Livre, 2012, Passo Fundo / RS. SENID 2012. Passo Fundo / RS: Editora UPF		3
2706		1o. Seminário Nacional de Inclusão Digital e Software Livre, 2012, Passo Fundo / RS. SENID 2012. Passo Fundo / RS: Editora UPF		3
2707		1o. Seminário Nacional de Inclusão Digital e Software Livre, 2012, Passo Fundo / RS. SENID 2012. Passo Fundo / RS: Editora UPF		3
2708		IADIS International Conference on Cognition and Exploratory Learning in Digital Age 2012, 2012, Madrid / Espanha. CELDA 2012. Madrid / Espanha: IADIS		3
2709		V Seminário Nacional sobre Educação e Inclusão Social de Pessoas com Necessidades Educacionais Especiais, 2012, Natal / RN. V Seminário Nacional sobre Educação e Inclusão Social de Pessoas com Necessidades Educacionais Especiais. Natal / RN: Editora UFRN		3
2710		Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações, 2011, Curitiba / PR. WESAAC 2011		3
2711		Seminário Internacional de Educação em Ciências, 2011, Rio Grande RS. SINTEC 2011. Rio Grande RS: FURG		3
2712		Seminário Internacional de Educação em Ciências, 2011, Rio Grande RS. SINTEC 2011. Rio Grande RS: FURG		3
2713		Applications to Provide Learning and Teaching Support - APPLETS, 2011, Aracaju / SE. Simpósio Brasileiro de Informática na Educação - Workshop APPLETS. Aracaju / SE: SBIE		3
2714		IV Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações, 2010, Rio Grande. WESAAC 2010. Rio Grande: FURG		3
2715		IV Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações, 2010, Rio Grande. WESAAC 2010. Rio Grande: FURG		3
2759		4 Workshop de Visão Computacional, 2008, Bauru - SP. Anais do WVC´08		3
2770		Congresso Regional de Iniciação Científica e Tecnológica em Engenharia - CRICTE, 2010, Rio Grande. Anais do XXIV CRICTE		3
2771		IX Mostra de Produção Universitária da FURG, 2010, Rio Grande. Anais da IX MPU / FURG		3
2772		IX Mostra de Produção Universitária da FURG, 2010, Rio Grande. Anais da IX MPU / FURG		3
2790		The 3rd Southern Conference on Computational Modeling, 2009, Rio Grande. III MCSul		3
2794		Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações, 2011, Curitiba / PR. Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações		3
2795		Congresso Regional de Iniciação Científica e Tecnológica em Engenharia,, 2010, Rio Grande / RS. Congresso Regional de Iniciação Científica e Tecnológica em Engenharia,		3
2796		MCSul 2010 - Simpósio de Modelagem Computacional do Sul, 2010, Rio Grande / RS. MCSul 2010 - Simpósio de Modelagem Computacional do Sul		3
2797		Escola Regional de Redes de Computadores - ERRC 2010, 2010, Alegrete / RS. Escola Regional de Redes de Computadores - ERRC 2010		3
2890		CNMAC 2012 - XXXIV Congresso Brasileiro de Matemática Aplicada e Computacional, 2012, Águas de Lindóia. Anais do XXXIV CNMAC. São Carlos: SBMAC	1	3
2891		CNMAC 2012 - XXXIV Congresso Brasileiro de Matemática Aplicada e Computacional, 2012, Águas de Lindóia. Anais do XXXIV CNMAC. São Carlos: SBMAC	1	3
2892		2012 CONFERÊNCIA SUL EM MODELAGEM COMPUTACIONAL - MCSUL, 2012, Rio Grande. Anais do MCSUL 2012. Rio Grande: FURG	1	3
2893		V Workshop-Escola de Sistemas de Agentes, seus Ambientes e Aplicações, 2011, Curitiba. Gustavo A. G. Lugo, Jomi F- Hübner, Cesar A. Tacla (Eds.) Anais do WESAAC 2011. Curitiba: UTFPR	1	3
2894		WEIT 2011 - Workshop-Escola de Informática Teórica, 2011, Pelotas. G.P. Dimuro, L. Foss, M.S. Aguiar, S. Costa, A.C.R. Costa (Eds.) Anais do WEIT 2011. Rio Grande: FURG	1	3
2895		Workshop-Escola de Sistemas de Agentes, seus Ambientes e Aplicações, 2010, Rio Grande. Anais do WESAAC 2010. Rio Grande: FURG	1	3
2896		Workshop-Escola de Sistemas de Agentes, seus Ambientes e Aplicações, 2010, Rio Grande. Anais do WESAAC 2010. Rio Grande: FURG	1	3
2897		Workshop-Escola de Sistemas de Agentes, seus Ambientes e Aplicações, 2010, Rio Grande. Anais do WESAAC 2010. Rio Grande: FURG	1	3
2898		The 8th International Conference on Autonomous Agents and Multiagent Systems, 2009, Budapest. Proceedings of AAMAS 2009. Richland: IFAAMAS	1	3
2899		XXXII Congresso Nacional de Matemática Aplicada e Computacional, 2009, Cuiabá. Anais do CNMAC 2009. São Carlos: SBMAC	1	3
2900		XXXII Congresso Nacional de Matemática Aplicada e Computacional, 2009, Cuiabá. A. L. Bortoli et al. (Eds.) Anais do CNMAC. São Carlos: SBMAC	2	3
2901		The 3rd Southern Conference on Computational Modeling, 2009, Rio Grande. Proceedings of MCSUL 2009. Rio Grande: FURG	1	3
2902		The 3rd Southern Conference on Computational Modeling, 2009, Rio Grande. Proceedings of MCSUL 2009. Rio Grande: FURG	1	3
2903		13th GAMM - IMACS International Symposium on Scientific Computing, Computer Arithmetic and Verified Numerical Computations, 2008, El Paso. Proceedings of SCAN 2008. El Paso: University of Texas at El Paso	1	3
2919		XIII Simpósio em Sistemas Computacionais (WSCAD-SSC), 2012, Petrópolis, RJ. Anais do XIII Simpósio em Sistemas Computacionais		3
2920		Brazilian Symposium on Bioinformatics, 2010, Búzios. LNBI-LNCS. Advances in Bioinformatics and Computational Biology.. Berlin: Springer-Verlag	6268	3
2921		IV Brasilian Symposium on Bioinformatics, 2009, Porto Alegre. LNBI-LNCS. Advances in Bioinformatics and Computational Biology.. Berlin: Springer-Verlag	5676	3
2941		XIX Seminário de Iniciação Científica, 2011, Ijuí. Anais do XIX Seminário de Iniciação Científica		3
2942		International Conference on Evolutionary Computation, 2010, Valencia, Espanha. Proceedings		3
2979		WES - Workshop on Embedded Systems for Oil, Gas and Energy Industry, 2012, Rio Grande. Anais WES 2012	1	3
2980		WES - Workshop on Embedded Systems for Oil, Gas and Energy Industry, 2012, Rio Grande. Anais WES 2012	1	3
2981		EuroITV 2010		3
2982		EuroSys 2008, 2008, Glasgow. Anais do 2nd Workshop on Dependable Distributed Data (WDDDM'08)		3
3115		Simpósio Brasileiro de Games - SBGAMES, 2010, Florianópolis. Anais do SBGAMES		3
3125		Sintec 2012, 2012, Rio Grande, RS. II Seminário Internacional de Educação em Ciências		3
3141		IX Mostra de Produção Universitária da FURG - MPU, 2010, Rio Grande, Brasil. Anais da IX Mostra de Produção Universitária da FURG - MPU. Rio Grande, Brasil: FURG		3
3142		IX Mostra de Produção Universitária da FURG - MPU, 2010, Rio Grande, Brasil. Anais da IX Mostra de Produção Universitária da FURG - MPU. Rio Grande, Brasil: FURG		3
3143		XI Encontro de Pós-Graduação, 2009, Rio Grande. Anais da IX Mostra de produção universitária. Rio Grande: FURG		3
3144		VII Mostra de Produção Universitária, 2008, Rio Grande. Anais da VII Mostra de Produção Universitária. Rio Grande: FURG		3
3259		Escola Regional de Redes de Computadores, 2012. Escola Regional de Redes de Computadores	1	3
3260		IEEE RFID, 2011. IEEE RFID		3
3261		Seminário Internacional de Educação em Ciências, 2011. Seminário Internacional de Educação em Ciências		3
3262		29º Seminário de Extensão Universitária da Região Sul, 2011, Foz do Iguaçu. 29º Seminário de Extensão Universitária da Região Sul		3
3263		European Conference in Interative Tv and Video		3
3264		IX Mostra de Produção Universitária, 2010. 2010		3
3296		VIII Mostra da Produção Universitária da FURG, 2009, Rio Grande. VIII Mostra da Produção Universitária da FURG		3
3297		VIII Mostra da Produção Universitária da FUR, 2009, Rio Grande. VIII Mostra da Produção Universitária da FUR		3
3310		XXIV Congresso Regional de Iniciação Científica e Tecnológica em Engenharia -- CRICTE, 2010, Rio Grande. Anais do XXIV Congresso Regional de Iniciação Científica e Tecnológica em Engenharia -- CRICTE		3
3311		XXIV Congresso Regional de Iniciação Científica e Tecnológica em Engenharia -- CRICTE, 2010, Rio Grande. Anais do XXIV Congresso Regional de Iniciação Científica e Tecnológica em Engenharia -- CRICTE		3
3312		XXIV Congresso Regional de Iniciação Científica e Tecnológica em Engenharia -- CRICTE, 2010, Rio Grande. Anais do XXIV Congresso Regional de Iniciação Científica e Tecnológica em Engenharia -- CRICTE		3
3313		XXIV Congresso Regional de Iniciação Científica e Tecnológica em Engenharia -- CRICTE, 2010, Rio Grande. Anais do XXIV Congresso Regional de Iniciação Científica e Tecnológica em Engenharia -- CRICTE		3
3314		XXIV Congresso Regional de Iniciação Científica e Tecnológica em Engenharia -- CRICTE, 2010, Rio Grande. Anais do XXIV Congresso Regional de Iniciação Científica e Tecnológica em Engenharia -- CRICTE		3
3315		The 3rd Southern Conference on Comutational Modeling, 2009, Rio Grande. Annals of the 3rd Southern Conference on Comutational Modeling		3
\.


--
-- Data for Name: revista; Type: TABLE DATA; Schema: versionado; Owner: postgres
--

COPY revista (doi, revista, volume, numero, id_publicacao, versao) FROM stdin;
	BMC Genomics	13		1743	2
http://dx.doi.org/10.1142/S0219720008003539	Journal of Bioinformatics and Computational Biology (Print)	06		1744	2
http://dx.doi.org/10.1016/j.cag.2011.12.004	Computers Graphics	36		1754	2
http://dx.doi.org/10.1007/s13173-012-0071-9	Journal of The Brazilian Computer Society (Online)	18		1755	2
http://dx.doi.org/10.1080/08839514.2010.492167	Applied Artificial Intelligence	24		1756	2
http://dx.doi.org/10.1007/978-3-642-04380-2_39	Lecture Notes in Computer Science	5773		1757	2
	Online)	1		1762	2
	Revista de Informática Teórica e Aplicada (Impresso)	17		1783	2
	Revista de Informática Teórica e Aplicada (Impresso)	7		1784	2
	Journal of the Brazilian Computer Society (Impresso)	17		1785	2
	Pueblos y Fronteras Digital	6		1786	2
	Tendências em Matemática Aplicada e Computacional	10		1787	2
	Tendências em Matemática Aplicada e Computacional	9		1788	2
	Revista do CCEI	12		1789	2
	Electronic Notes in Theoretical Computer Science	210		1790	2
	ICCEEg - Revista Jr de Iniciação Científica em Ciências Exatas e Engenharia	4		1865	2
http://dx.doi.org/10.1109/TIE.2011.2134054	Print)	58		1866	2
http://dx.doi.org/10.1109/INDIN.2011.6034928	IEEE Transactions on Industrial Informatics	1		1885	2
http://dx.doi.org/10.1016/j.microrel.2008.07.002	Microelectronics and Reliability	48		1897	2
http://dx.doi.org/10.1016/j.microrel.2008.07.016	Microelectronics and Reliability	48		1898	2
	Revista Jr de Iniciação Científica em Ciências Exatas e Engenharia (ICCEEg)	4		1915	2
	Journal of Information Systems Management	2		1916	2
	Revista do CCEI	15		1917	2
	Revista Brasileira de Informação na Educação	19		1918	2
	Revista Novas Tecnologias na Educação	9		1919	2
	Journal of Information Systems Management	1		1920	2
	Cadernos de Simulação Social e Ambiental	1		1921	2
	Journal of Artificial Societies and Social Simulation	12		1922	2
	Informática Pública	10		1923	2
http://dx.doi.org/10.1016/j.ipm.2011.01.009	Information Processing Management	47		1988	2
	Vetor (FURG)	18		1998	2
http://dx.doi.org/10.1016/j.ins.2011.05.003	Information Sciences	181		2010	2
http://dx.doi.org/10.1007/s13173-011-0035-5	Journal of the Brazilian Computer Society (Impresso)	17		2011	2
http://dx.doi.org/10.1016/j.ins.2009.11.035	Information Sciences	180		2012	2
	Tendências em Matemática Aplicada e Computacional	11		2013	2
	Revista de Informática Teórica e Aplicada (Impresso)	17		2014	2
http://dx.doi.org/10.1016/j.entcs.2009.07.045	Electronic Notes in Theoretical Computer Science	247		2015	2
	Tendências em Matemática Aplicada e Computacional	10		2016	2
	Tendências em Matemática Aplicada e Computacional	9		2017	2
	Tendências em Matemática Aplicada e Computacional	9		2018	2
	Tendências em Matemática Aplicada e Computacional	9		2019	2
http://dx.doi.org/10.1002/widm.46	Wiley Interdisciplinary Reviews: Data Mining and Knowledge Discovery,			2105	2
http://dx.doi.org/10.1186/1471-2164-12-S4-S6	BMC Genomics	12		2106	2
http://dx.doi.org/10.1186/1471-2164-12-S4-S7	BMC Genomics	12		2107	2
http://dx.doi.org/10.1186/1471-2164-11-S5-S6	BMC Genomics	11		2108	2
	ICCEEg - Revista Jr de Iniciação Científica em Ciências Exatas e Engenharia,	1		2116	2
	Revista Jr de Iniciação Científica em Ciências Exatas e Engenharia	1		2117	2
http://dx.doi.org/10.1109/TEVC.2009.2025455	IEEE Transactions on Evolutionary Computation	13		2118	2
	Revista Eletrônica de Administração e Turismo	1		2126	2
	Anuário da Produção Científica dos Cursos de Pós-Graduação	4		2127	2
	Revista ANGRAD	9		2128	2
http://dx.doi.org/10.1007/s13173-012-0071-9	Journal of the Brazilian Computer Society (Impresso)	18		2138	2
http://dx.doi.org/10.1007/s00170-010-2548-z	International Journal, Advanced Manufacturing Technology	50		2139	2
	Vetor (FURG)	20		2140	2
	Vetor (FURG)	18		2141	2
http://dx.doi.org/10.3354/cr01065	Climate Research	52		2159	2
	Terrae Didatica (Impresso)	8		2160	2
	Geosul (UFSC)	25		2161	2
	Ciência e Natura	suplem		2162	2
	Ciência e Natura	suplem		2163	2
	Brazilian Journal of Oceanography (Impresso)	57		2164	2
	Revista Junior de Iniciação Científica em Ciências Exatas e Engenharia	1		2185	2
http://dx.doi.org/10.1109/TVLSI.2010.2041258	IEEE Transactions on Very Large Scale Integration (VLSI) Systems (Print)	19		2186	2
http://dx.doi.org/10.1166/jolpe.2010.1070	Journal of Low Power Electronics (Print)	6		2187	2
http://dx.doi.org/10.1016/j.mejo.2010.03.003	Microelectronics Journal	41		2188	2
http://dx.doi.org/10.1016/j.microrel.2010.07.140	Microelectronics and Reliability	50		2189	2
http://dx.doi.org/10.1007/s13173-012-0071-9	Journal of the Brazilian Computer Society (Impresso)	18		2206	2
	Vetor (FURG)	18		2207	2
	Sea Technology	50		2208	2
http://dx.doi.org/10.1590/S0104-65002009000300005	Journal of the Brazilian Computer Society (Impresso)	15		2209	2
	Revista Eletrônica de Iniciação Científica	VIII		2210	2
http://dx.doi.org/10.1016/j.compmedimag.2008.03.001	Computerized Medical Imaging and Graphics	32		2255	2
	Revista Novas Tecnologias na Educação	06		2258	2
http://dx.doi.org/10.1016/j.jvlc.2009.01.010	Journal of Visual Languages and Computing	20		2267	2
	Controle Automação (Impresso)	23		2279	2
	IET Electric Power Applications (Print)	1		2280	2
	Pesquisa Naval (SDM)	24		2300	2
http://dx.doi.org/10.1007/s13173-012-0071-9	Journal of The Brazilian Computer Society (Online)	18		2301	2
	Revista Novas Tecnologias na Educação	10		2302	2
	IEEE Transactions on Industrial Informatics	1		2303	2
	Tecnologia Educacional	40		2304	2
http://dx.doi.org/10.1007/s00170-010-2548-z	International Journal, Advanced Manufacturing Technology	48		2305	2
	Ciências Cognição (UFRJ)	15		2306	2
	International Journal of Artificial Intelligence and Expert Systems (IJAE)	1		2307	2
	Vetor (FURG)	20		2308	2
	Vetor (FURG)	19		2309	2
	Vetor (FURG)	22		2310	2
	Vetor (FURG)	18		2311	2
	Sea Technology	50		2312	2
	Enseñanza de las Ciencias	Extra		2313	2
	Journal of the Brazilian Computer Society (Impresso)	15		2314	2
	Vetor (FURG)	19		2315	2
http://dx.doi.org/10.1007/978-3-540-74972-1_55	Advances in Soft Computing	44		2316	2
	Vetor (FURG)	18		2317	2
	Vetor (FURG)	18		2318	2
	Revista Eletrônica de Iniciação Científica	VIII		2319	2
	Vetor (FURG)	18		2389	2
	Vetor (FURG)	20		2420	2
	Vetor (FURG)	18		2421	2
	BMC Genomics	13		2432	3
http://dx.doi.org/10.1142/S0219720008003539	Journal of Bioinformatics and Computational Biology (Print)	06		2433	3
http://dx.doi.org/10.1016/j.cag.2011.12.004	Computers Graphics	36		2449	3
http://dx.doi.org/10.1007/s13173-012-0071-9	Journal of The Brazilian Computer Society (Online)	18		2450	3
http://dx.doi.org/10.1080/08839514.2010.492167	Applied Artificial Intelligence	24		2451	3
http://dx.doi.org/10.1007/978-3-642-04380-2_39	Lecture Notes in Computer Science	5773		2452	3
	Online)	1		2459	3
	Revista de Informática Teórica e Aplicada (Impresso)	17		2482	3
	Revista de Informática Teórica e Aplicada (Impresso)	7		2483	3
	Journal of the Brazilian Computer Society (Impresso)	17		2484	3
	Pueblos y Fronteras Digital	6		2485	3
	Tendências em Matemática Aplicada e Computacional	10		2486	3
	Tendências em Matemática Aplicada e Computacional	9		2487	3
	Revista do CCEI	12		2488	3
	Electronic Notes in Theoretical Computer Science	210		2489	3
	ICCEEg - Revista Jr de Iniciação Científica em Ciências Exatas e Engenharia	4		2572	3
http://dx.doi.org/10.1109/TIE.2011.2134054	Print)	58		2573	3
http://dx.doi.org/10.1109/INDIN.2011.6034928	IEEE Transactions on Industrial Informatics	1		2604	3
http://dx.doi.org/10.1016/j.microrel.2008.07.002	Microelectronics and Reliability	48		2620	3
http://dx.doi.org/10.1016/j.microrel.2008.07.016	Microelectronics and Reliability	48		2621	3
	Revista Jr de Iniciação Científica em Ciências Exatas e Engenharia (ICCEEg)	4		2641	3
	Journal of Information Systems Management	2		2642	3
	Revista do CCEI	16		2643	3
	Revista Jr de Iniciação Científica em Ciências Exatas e Engenharia	5		2644	3
	Revista Brasileira de Informação na Educação	19		2645	3
	Revista Novas Tecnologias na Educação	9		2646	3
	Journal of Information Systems Management	1		2647	3
	Cadernos de Simulação Social e Ambiental	1		2648	3
	Journal of Artificial Societies and Social Simulation	12		2649	3
	Informática Pública	10		2650	3
http://dx.doi.org/10.1016/j.ipm.2011.01.009	Information Processing Management	47		2760	3
	Vetor (FURG)	18		2777	3
http://dx.doi.org/10.1016/j.ins.2011.05.003	Information Sciences	181		2799	3
http://dx.doi.org/10.1007/s13173-011-0035-5	Journal of the Brazilian Computer Society (Impresso)	17		2800	3
http://dx.doi.org/10.1016/j.ins.2009.11.035	Information Sciences	180		2801	3
	Tendências em Matemática Aplicada e Computacional	11		2802	3
	Revista de Informática Teórica e Aplicada (Impresso)	17		2803	3
http://dx.doi.org/10.1016/j.entcs.2009.07.045	Electronic Notes in Theoretical Computer Science	247		2804	3
	Tendências em Matemática Aplicada e Computacional	10		2805	3
	Tendências em Matemática Aplicada e Computacional	9		2806	3
	Tendências em Matemática Aplicada e Computacional	9		2807	3
	Tendências em Matemática Aplicada e Computacional	9		2808	3
http://dx.doi.org/10.1002/widm.46	Wiley Interdisciplinary Reviews: Data Mining and Knowledge Discovery,			2908	3
http://dx.doi.org/10.1186/1471-2164-12-S4-S6	BMC Genomics	12		2909	3
http://dx.doi.org/10.1186/1471-2164-12-S4-S7	BMC Genomics	12		2910	3
http://dx.doi.org/10.1186/1471-2164-11-S5-S6	BMC Genomics	11		2911	3
	ICCEEg - Revista Jr de Iniciação Científica em Ciências Exatas e Engenharia,	1		2931	3
	Revista Jr de Iniciação Científica em Ciências Exatas e Engenharia	1		2932	3
http://dx.doi.org/10.1109/TEVC.2009.2025455	IEEE Transactions on Evolutionary Computation	13		2933	3
	Revista Eletrônica de Administração e Turismo	1		2946	3
	Anuário da Produção Científica dos Cursos de Pós-Graduação	4		2947	3
	Revista ANGRAD	9		2948	3
http://dx.doi.org/10.1007/s13173-012-0071-9	Journal of the Brazilian Computer Society (Impresso)	18		2958	3
http://dx.doi.org/10.1007/s00170-010-2548-z	International Journal, Advanced Manufacturing Technology	50		2959	3
	Vetor (FURG)	20		2960	3
	Vetor (FURG)	18		2961	3
http://dx.doi.org/10.3354/cr01065	Climate Research	52		2984	3
	Terrae Didatica (Impresso)	8		2985	3
	Geosul (UFSC)	25		2986	3
	Ciência e Natura	suplem		2987	3
	Ciência e Natura	suplem		2988	3
	Brazilian Journal of Oceanography (Impresso)	57		2989	3
	ICCEEg - Revista Jr de Iniciação Científica em Ciências Exatas e Engenharia	5		3015	3
	Revista Junior de Iniciação Científica em Ciências Exatas e Engenharia	1		3025	3
http://dx.doi.org/10.1109/TVLSI.2010.2041258	IEEE Transactions on Very Large Scale Integration (VLSI) Systems (Print)	19		3026	3
http://dx.doi.org/10.1166/jolpe.2010.1070	Journal of Low Power Electronics (Print)	6		3027	3
http://dx.doi.org/10.1016/j.mejo.2010.03.003	Microelectronics Journal	41		3028	3
http://dx.doi.org/10.1016/j.microrel.2010.07.140	Microelectronics and Reliability	50		3029	3
http://dx.doi.org/10.1007/s13173-012-0071-9	Journal of the Brazilian Computer Society (Impresso)	18		3056	3
	Vetor (FURG)	18		3057	3
	Sea Technology	50		3058	3
http://dx.doi.org/10.1590/S0104-65002009000300005	Journal of the Brazilian Computer Society (Impresso)	15		3059	3
	Revista Eletrônica de Iniciação Científica	VIII		3060	3
http://dx.doi.org/10.1016/j.compmedimag.2008.03.001	Computerized Medical Imaging and Graphics	32		3112	3
	Revista Novas Tecnologias na Educação	06		3116	3
http://dx.doi.org/10.1016/j.jvlc.2009.01.010	Journal of Visual Languages and Computing	20		3128	3
	Controle Automação (Impresso)	23		3147	3
	IET Electric Power Applications (Print)	1		3148	3
	Pesquisa Naval (SDM)	24		3169	3
http://dx.doi.org/10.1007/s13173-012-0071-9	Journal of The Brazilian Computer Society (Online)	18		3170	3
	Revista Novas Tecnologias na Educação	10		3171	3
	IEEE Transactions on Industrial Informatics	1		3172	3
	Tecnologia Educacional	40		3173	3
http://dx.doi.org/10.1007/s00170-010-2548-z	International Journal, Advanced Manufacturing Technology	48		3174	3
	Ciências Cognição (UFRJ)	15		3175	3
	International Journal of Artificial Intelligence and Expert Systems (IJAE)	1		3176	3
	Vetor (FURG)	20		3177	3
	Vetor (FURG)	19		3178	3
	Vetor (FURG)	22		3179	3
	Vetor (FURG)	18		3180	3
	Sea Technology	50		3181	3
	Enseñanza de las Ciencias	Extra		3182	3
	Journal of the Brazilian Computer Society (Impresso)	15		3183	3
	Vetor (FURG)	19		3184	3
http://dx.doi.org/10.1007/978-3-540-74972-1_55	Advances in Soft Computing	44		3185	3
	Vetor (FURG)	18		3186	3
	Vetor (FURG)	18		3187	3
	Revista Eletrônica de Iniciação Científica	VIII		3188	3
	Vetor (FURG)	18		3265	3
	Vetor (FURG)	20		3298	3
	Vetor (FURG)	18		3299	3
\.


--
-- Data for Name: revista_aceito; Type: TABLE DATA; Schema: versionado; Owner: postgres
--

COPY revista_aceito (doi, revista, numero, id_publicacao, versao) FROM stdin;
	Journal of Logic and Computation (Print)		1791	2
	Computers in Industry		1886	2
	Revista de Informática Teórica e Aplicada: RITA		2020	2
	BMC Bioinformatics		2109	2
	Computers in Industry		2320	2
	International Journal: Computational Intelligence in Bioinformatics and Systems Biology		2321	2
	Vetor (FURG)		2411	2
	Vetor (FURG)		2412	2
	Journal of Logic and Computation (Print)		2490	3
	Computers in Industry		2605	3
	Revista de Informática Teórica e Aplicada: RITA		2778	3
	Revista de Informática Teórica e Aplicada: RITA		2809	3
	BMC Bioinformatics		2912	3
	Revista Novas Tecnologias na Educação		3189	3
	Computers in Industry		3190	3
	International Journal: Computational Intelligence in Bioinformatics and Systems Biology		3191	3
	Vetor (FURG)		3287	3
	Vetor (FURG)		3288	3
\.


SET search_path = public, pg_catalog;

--
-- Name: grupo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY rede
    ADD CONSTRAINT grupo_pkey PRIMARY KEY (id);


--
-- Name: membrosgrupo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY membrosrede
    ADD CONSTRAINT membrosgrupo_pkey PRIMARY KEY (idgrupo, idlattes);


--
-- Name: usuarios_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_email_key UNIQUE (email);


--
-- Name: usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- Name: versao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY versao
    ADD CONSTRAINT versao_pkey PRIMARY KEY (atual);


SET search_path = versionado, pg_catalog;

--
-- Name: adjacencia_pkey; Type: CONSTRAINT; Schema: versionado; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY adjacencia
    ADD CONSTRAINT adjacencia_pkey PRIMARY KEY (membro1, membro2, versao);


--
-- Name: capitulo_pkey; Type: CONSTRAINT; Schema: versionado; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY capitulo
    ADD CONSTRAINT capitulo_pkey PRIMARY KEY (id_publicacao);


--
-- Name: componente_pkey; Type: CONSTRAINT; Schema: versionado; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY componente
    ADD CONSTRAINT componente_pkey PRIMARY KEY (componente, vertice, versao);


--
-- Name: conferencia_pkey; Type: CONSTRAINT; Schema: versionado; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY conferencia
    ADD CONSTRAINT conferencia_pkey PRIMARY KEY (id_publicacao);


--
-- Name: diametro_pkey; Type: CONSTRAINT; Schema: versionado; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY diametro
    ADD CONSTRAINT diametro_pkey PRIMARY KEY (membro, versao);


--
-- Name: diametro_posicao_versao_key; Type: CONSTRAINT; Schema: versionado; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY diametro
    ADD CONSTRAINT diametro_posicao_versao_key UNIQUE (posicao, versao);


--
-- Name: grafo_pkey; Type: CONSTRAINT; Schema: versionado; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY grafo
    ADD CONSTRAINT grafo_pkey PRIMARY KEY (id, versao);


--
-- Name: id_publi; Type: CONSTRAINT; Schema: versionado; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY publicacao
    ADD CONSTRAINT id_publi PRIMARY KEY (id_publicacao);


--
-- Name: livro_pkey; Type: CONSTRAINT; Schema: versionado; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY livro
    ADD CONSTRAINT livro_pkey PRIMARY KEY (id_publicacao);


--
-- Name: membros_pkey; Type: CONSTRAINT; Schema: versionado; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY membros
    ADD CONSTRAINT membros_pkey PRIMARY KEY (id_membro, versao);


--
-- Name: replica_pkey; Type: CONSTRAINT; Schema: versionado; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY replica
    ADD CONSTRAINT replica_pkey PRIMARY KEY (id1, id2);


--
-- Name: resumo_exp_pkey; Type: CONSTRAINT; Schema: versionado; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY resumo_exp
    ADD CONSTRAINT resumo_exp_pkey PRIMARY KEY (id_publicacao);


--
-- Name: resumo_pkey; Type: CONSTRAINT; Schema: versionado; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY resumo
    ADD CONSTRAINT resumo_pkey PRIMARY KEY (id_publicacao);


--
-- Name: revista_aceito_pkey; Type: CONSTRAINT; Schema: versionado; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY revista_aceito
    ADD CONSTRAINT revista_aceito_pkey PRIMARY KEY (id_publicacao);


--
-- Name: revista_pkey; Type: CONSTRAINT; Schema: versionado; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY revista
    ADD CONSTRAINT revista_pkey PRIMARY KEY (id_publicacao);


SET search_path = public, pg_catalog;

--
-- Name: grupo_autor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rede
    ADD CONSTRAINT grupo_autor_fkey FOREIGN KEY (autor) REFERENCES usuarios(id);


SET search_path = versionado, pg_catalog;

--
-- Name: adjacencia_membro1_fkey; Type: FK CONSTRAINT; Schema: versionado; Owner: postgres
--

ALTER TABLE ONLY adjacencia
    ADD CONSTRAINT adjacencia_membro1_fkey FOREIGN KEY (membro1, versao) REFERENCES membros(id_membro, versao);


--
-- Name: adjacencia_membro2_fkey; Type: FK CONSTRAINT; Schema: versionado; Owner: postgres
--

ALTER TABLE ONLY adjacencia
    ADD CONSTRAINT adjacencia_membro2_fkey FOREIGN KEY (membro2, versao) REFERENCES membros(id_membro, versao);


--
-- Name: capitulo_id_publicacao_fkey; Type: FK CONSTRAINT; Schema: versionado; Owner: postgres
--

ALTER TABLE ONLY capitulo
    ADD CONSTRAINT capitulo_id_publicacao_fkey FOREIGN KEY (id_publicacao) REFERENCES publicacao(id_publicacao);


--
-- Name: componente_vertice_fkey; Type: FK CONSTRAINT; Schema: versionado; Owner: postgres
--

ALTER TABLE ONLY componente
    ADD CONSTRAINT componente_vertice_fkey FOREIGN KEY (vertice, versao) REFERENCES membros(id_membro, versao);


--
-- Name: conferencia_id_publicacao_fkey; Type: FK CONSTRAINT; Schema: versionado; Owner: postgres
--

ALTER TABLE ONLY conferencia
    ADD CONSTRAINT conferencia_id_publicacao_fkey FOREIGN KEY (id_publicacao) REFERENCES publicacao(id_publicacao);


--
-- Name: diametro_membro_fkey; Type: FK CONSTRAINT; Schema: versionado; Owner: postgres
--

ALTER TABLE ONLY diametro
    ADD CONSTRAINT diametro_membro_fkey FOREIGN KEY (membro, versao) REFERENCES membros(id_membro, versao);


--
-- Name: livro_id_publicacao_fkey; Type: FK CONSTRAINT; Schema: versionado; Owner: postgres
--

ALTER TABLE ONLY livro
    ADD CONSTRAINT livro_id_publicacao_fkey FOREIGN KEY (id_publicacao) REFERENCES publicacao(id_publicacao);


--
-- Name: publicacao_id_membro_fkey; Type: FK CONSTRAINT; Schema: versionado; Owner: postgres
--

ALTER TABLE ONLY publicacao
    ADD CONSTRAINT publicacao_id_membro_fkey FOREIGN KEY (id_membro, versao) REFERENCES membros(id_membro, versao);


--
-- Name: publicacao_replica_fkey; Type: FK CONSTRAINT; Schema: versionado; Owner: postgres
--

ALTER TABLE ONLY publicacao
    ADD CONSTRAINT publicacao_replica_fkey FOREIGN KEY (cluster) REFERENCES publicacao(id_publicacao);


--
-- Name: replica_id1_fkey; Type: FK CONSTRAINT; Schema: versionado; Owner: postgres
--

ALTER TABLE ONLY replica
    ADD CONSTRAINT replica_id1_fkey FOREIGN KEY (id1) REFERENCES publicacao(id_publicacao);


--
-- Name: replica_id2_fkey; Type: FK CONSTRAINT; Schema: versionado; Owner: postgres
--

ALTER TABLE ONLY replica
    ADD CONSTRAINT replica_id2_fkey FOREIGN KEY (id2) REFERENCES publicacao(id_publicacao);


--
-- Name: resumo_exp_id_publicacao_fkey; Type: FK CONSTRAINT; Schema: versionado; Owner: postgres
--

ALTER TABLE ONLY resumo_exp
    ADD CONSTRAINT resumo_exp_id_publicacao_fkey FOREIGN KEY (id_publicacao) REFERENCES publicacao(id_publicacao);


--
-- Name: resumo_id_publicacao_fkey; Type: FK CONSTRAINT; Schema: versionado; Owner: postgres
--

ALTER TABLE ONLY resumo
    ADD CONSTRAINT resumo_id_publicacao_fkey FOREIGN KEY (id_publicacao) REFERENCES publicacao(id_publicacao);


--
-- Name: revista_aceito_id_publicacao_fkey; Type: FK CONSTRAINT; Schema: versionado; Owner: postgres
--

ALTER TABLE ONLY revista_aceito
    ADD CONSTRAINT revista_aceito_id_publicacao_fkey FOREIGN KEY (id_publicacao) REFERENCES publicacao(id_publicacao);


--
-- Name: revista_id_publicacao_fkey; Type: FK CONSTRAINT; Schema: versionado; Owner: postgres
--

ALTER TABLE ONLY revista
    ADD CONSTRAINT revista_id_publicacao_fkey FOREIGN KEY (id_publicacao) REFERENCES publicacao(id_publicacao);


--
-- Name: versionado; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA versionado FROM PUBLIC;
REVOKE ALL ON SCHEMA versionado FROM postgres;
GRANT ALL ON SCHEMA versionado TO postgres;
GRANT ALL ON SCHEMA versionado TO PUBLIC;


--
-- PostgreSQL database dump complete
--

