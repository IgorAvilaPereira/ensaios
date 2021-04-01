--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: adjacencia; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE adjacencia (
    membro1 integer NOT NULL,
    membro2 integer NOT NULL,
    colaboracao integer
);


ALTER TABLE public.adjacencia OWNER TO postgres;

--
-- Name: capitulo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE capitulo (
    livro character varying,
    edicao character varying,
    editora character varying,
    volume character varying,
    id_publicacao integer NOT NULL
);


ALTER TABLE public.capitulo OWNER TO postgres;

--
-- Name: conferencia; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE conferencia (
    volume character varying,
    evento character varying,
    id_publicacao integer NOT NULL
);


ALTER TABLE public.conferencia OWNER TO postgres;

--
-- Name: livro; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE livro (
    edicao character varying,
    volume character varying,
    id_publicacao integer NOT NULL
);


ALTER TABLE public.livro OWNER TO postgres;

--
-- Name: membros; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE membros (
    id_membro integer NOT NULL,
    nome character varying,
    id_lattes character varying,
    centralidade real DEFAULT 0,
    pagerank real DEFAULT 0
);


ALTER TABLE public.membros OWNER TO postgres;

--
-- Name: matriz_adjacencia; Type: VIEW; Schema: public; Owner: lucas
--

CREATE VIEW matriz_adjacencia AS
    SELECT membro1.nome AS membro1, membro2.nome AS membro2, adj.colaboracao FROM ((adjacencia adj JOIN membros membro1 ON ((adj.membro1 = membro1.id_membro))) JOIN membros membro2 ON ((adj.membro2 = membro2.id_membro)));


ALTER TABLE public.matriz_adjacencia OWNER TO lucas;

--
-- Name: publicacao; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE publicacao (
    id_publicacao integer NOT NULL,
    tipo character varying(2),
    titulo character varying,
    autores character varying,
    ano integer,
    paginas character varying,
    id_membro integer,
    cluster integer
);


ALTER TABLE public.publicacao OWNER TO postgres;

--
-- Name: publicacao_id_publicacao_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE publicacao_id_publicacao_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.publicacao_id_publicacao_seq OWNER TO postgres;

--
-- Name: publicacao_id_publicacao_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE publicacao_id_publicacao_seq OWNED BY publicacao.id_publicacao;


--
-- Name: publicacao_id_publicacao_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('publicacao_id_publicacao_seq', 293, true);


--
-- Name: replica; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE replica (
    id1 integer NOT NULL,
    id2 integer NOT NULL,
    v_cont integer DEFAULT 0 NOT NULL,
    f_cont integer DEFAULT 0 NOT NULL,
    CONSTRAINT replica_check CHECK ((id1 < id2))
);


ALTER TABLE public.replica OWNER TO postgres;

--
-- Name: publicacoes_com_replica; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW publicacoes_com_replica AS
    SELECT pub.id_publicacao, pub.titulo, pub.autores, pub.ano, membros.nome AS membro, membros.id_membro, pub.cluster, pub.tipo FROM (publicacao pub JOIN membros ON ((pub.id_membro = membros.id_membro))) WHERE ((pub.cluster IN (SELECT replica.id1 FROM replica)) OR (pub.cluster IN (SELECT replica.id2 FROM replica))) ORDER BY pub.cluster, membros.id_membro;


ALTER TABLE public.publicacoes_com_replica OWNER TO postgres;

--
-- Name: revista; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE revista (
    doi character varying,
    revista character varying,
    volume character varying,
    numero character varying,
    id_publicacao integer NOT NULL
);


ALTER TABLE public.revista OWNER TO postgres;

--
-- Name: revista_aceito; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE revista_aceito (
    doi character varying,
    revista character varying,
    numero character varying,
    id_publicacao integer NOT NULL
);


ALTER TABLE public.revista_aceito OWNER TO postgres;

--
-- Name: id_publicacao; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY publicacao ALTER COLUMN id_publicacao SET DEFAULT nextval('publicacao_id_publicacao_seq'::regclass);


--
-- Data for Name: adjacencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY adjacencia (membro1, membro2, colaboracao) FROM stdin;
0	1	1
0	6	1
0	12	1
0	17	1
3	10	24
4	7	2
4	9	3
4	13	1
4	15	1
4	17	3
4	18	3
5	17	2
6	12	4
6	17	1
7	9	4
7	13	1
7	15	1
7	17	5
7	18	4
9	13	2
9	15	1
9	17	6
9	18	7
11	17	3
13	15	1
13	17	8
13	18	2
15	17	14
15	18	1
16	17	2
17	18	5
\.


--
-- Data for Name: capitulo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY capitulo (livro, edicao, editora, volume, id_publicacao) FROM stdin;
Frank Emmert-Streib; Matthias Dehmer. (Org.). Analysis of Microarray Data - A Network-Based Approach. 1 ed. Weinheim		Wiley-VCH Verlag GmbH Co. KGaA	1	4
D. F. Adamatti. (Org.). Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações - Artigos Selecionados das quatro primeiras edições. Rio Grande		Edigraf- Editora e Gráfica da Universidade Federal do Rio Grande	1	20
D. F. Adamatti. (Org.). Analisando Trocas Sociais Baseadas em Personalidades Através de Cadeias de Markov Intervalares. Rio Grande		Edigraf- Editora e Gráfica da Universidade Federal do Rio Grande	1	21
D.F. Adamatti. (Org.). Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações - Artigos Selecionados das quatro primeiras edições. Rio Grande		Edigraf- Editora e Gráfica da Universidade Federal do Rio Grande	1	22
D.F. Adamatti. (Org.). Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações - Artigos Selecionados das quatro primeiras edições. 73 ed. Rio Grande		Edigraf- Editora e Gráfica da Universidade Federal do Rio Grande	1	23
		Edigraf- Editora e Gráfica da Universidade Federal do Rio Grande	1	24
D.F. Adamatti. (Org.). Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações - Artigos Selecionados das quatro primeiras edições. Rio Grande		Edigraf- Editora e Gráfica da Universidade Federal do Rio Grande	1	25
D.F. Adamatti. (Org.). Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações - Artigos Selecionados das quatro primeiras edições. Rio Grande		Edigraf- Editora e Gráfica da Universidade Federal do Rio Grande	1	26
Botelho, S. S. C., Adamatti, D. and Rocha, L. A. O.. (Org.). Third Southern Conference on Computational Modeling (MCSUL), 2009 (Post-Proceedings, Revised Selected Papers). Los Alamitos		IEEE	1	27
R. Trappl. (Org.). Cybernetics and Systems 2010 (Track: From Agent Theory to Agent Implementation AT2AI-7). 1 ed. Vienna		OFAI	1	28
Virginia Dignum. (Org.). Multiagent Systems - Semantics and Dynamics of Organization Models. 1 ed. Hershey		IGI Global	1	29
Sichman, J.; Noriega, P.; Padget, J.; Ossowski, S.. (Org.). Coordination, Organizations, Institutions and Norms in Multi-Agent Systems III. Revised selected papers of COIN Workshops 2007 (lecture Notes in Artificial Intelilgence). Berlin		Springer-Verlag	4870	30
Matteo Baldoni;Tran Cao Son; M. Birna van Riemsdijk;Michael Winikoff. (Org.). Declarative Agent Languages and Technologies VI - DALT 2008 (LNCS 5397). Berlin		Springer	1	31
Marcos Gestal Pose; Daniel Rivero Cebrián. (Org.). Soft Computing Methods for Practical Environmental Solutions: Techniques and Studies		Information Science Reference		76
Adamatti, D. .F.. (Org.). Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações - Artigos Selecionados das quatro primeiras edições. Rio Grande / RS		FURG	1	77
Adamatti, D. .F.. (Org.). Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações - Artigos Selecionados das quatro primeiras edições. Rio Grande / RS		FURG	1	78
David R.C. Hill; Alexandre Muzy;Bernard P. Zeigle. (Org.). Activity-Based Modeling and Simulation. 1 ed. Paris - France		Presses Universitaires Blaise-Pascal	1	79
J. Mattos, L. Rosa Jr, M. Pilla. (Org.). Desafios e Avanços em Computação: o estado da arte. 1 ed. Pelotas RS		Editora e Gráfica Universitária	1	80
D. F. ADAMATTI. (Org.). Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações - Artigos Selecionados das quatro primeiras edições. Rio Grande		Edigraf- Editora e Gráfica da Universidade Federal do Rio Grande	1	125
D. F. Adamatti. (Org.). Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações - Artigos Selecionados das quatro primeiras edições. Rio Grande		Edigraf- Editora e Gráfica da Universidade Federal do Rio Grande	1	126
D. F. Adamatti. (Org.). Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações - Artigos Selecionados das quatro primeiras edições. Rio Grande		Edigraf- Editora e Gráfica da Universidade Federal do Rio Grande	1	127
D. F. Adamatti. (Org.). Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações - Artigos Selecionados das quatro primeiras edições. Rio Grande		Edigraf- Editora e Gráfica da Universidade Federal do Rio Grande	1	128
D. F. Adamatti. (Org.). Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações - Artigos Selecionados das quatro primeiras edições. Rio Grande		Edigraf- Editora e Gráfica da Universidade Federal do Rio Grande	1	129
Botelho, S. S. C., Adamatti, D. and Rocha, L. A. O.. (Org.). Third Southern Conference on Computational Modeling (MCSUL), 2009 (Post-Proceedings, Revised Selected Papers). Los Alamitos		IEEE	1	130
Virginia Dignum. (Org.). Handbook of Research on Multi-Agent Systems: Semantics and Dynamics of Organizational Models. Hershey		IGI Global	1	131
Sichman, J.; Padget, J.; Ossowski, S.; Noriega, P.. (Org.). Coordination, Organizations, Institutions and Norms in Multi-Agent Systems III. Revised selected papers of COIN Workshops 2007 (Lecture Notes in Artificial Intelligence Series). Springer-Verlag		Berlin	4870	132
Adamatti, D. .F... (Org.). Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações - Artigos Selecionados das quatro primeiras edições.. Rio Grande			1	170
Ying-ping Chen,; Meng-Hiot Lim. (Org.). Linkage in evolutionary computation. Studies in Computational Intelligence. New York		Springer	157	171
ROCHA, L. A. O. (Org.) ; Botelho, S.S.C. (Org.) ; ADAMATTI, D. F. (Org.). (Org.). Simpósio de Modelagem Computacional do Sul. 1 ed		IEEE Xplore	1	179
ROCHA, L. A. O. (Org.) ; Botelho, S.S.C. (Org.) ; ADAMATTI, D. F. (Org.). (Org.). Simpósio de Modelagem Computacional do Sul. 1 ed		IEEE Xplore	1	180
		IEEE Xplore	1	181
Hanafiah Yussof. (Org.). Robot Localization and Map Building. Vienna, Austria		Intech	19	194
		iConcept Press	1	242
			1	243
\.


--
-- Data for Name: conferencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY conferencia (volume, evento, id_publicacao) FROM stdin;
	Brazilian Symposium on Artificial Intelligence, 2010, São Bernardo do Campo. Lecture Notes in Artificial Intelligence, subseries of Lecture Notes in Computer Science. Berlim : Springer-Verlag	5
	Brazilian Symposium on Neural network, 2010, São Bernardo do Campo. 2010 Eleventh Brazilian Symposium on Neural Networks (SBRN 2010). California : Conference Publishing Services (CPS)	6
9	Simposio Brasileiro de Automação Inteligente, 2009, Brasília. Anais do IX Simpósio Brasileiro de Automação Inteligente,	7
	Computer Graphics International, 2008, Istanbul. Proceedings of Computer Graphics International	8
	26th Computer Graphics International Conference, 2008, Istambul , Turquia. Proceedings of the 26th Computer Graphics International Conference	11
1	WESAAC 2010: Workshop-Escola de Sistemas de Agentes, seus Ambientes e Aplicações, 2010, Rio Grande. Anais do WESAAC 2010. Porto Alegre : FURG	32
1	WESAAC 2010: Workshop-Escola de Sistemas de Agentes, seus Ambientes e Aplicações, 2010, Rio Grande. Anais do WESACC 2010. Rio Grande : FURG	33
1	WESAAC 2010: Workshop-Escola de Sistemas de Agentes, seus Ambientes e Aplicações, 2010, Rio Grande. Anais do WESAAC 2010. Rio Grande : FURG	34
1	WESAAC 2010: Workshop-Escola de Sistemas de Agentes, seus Ambientes e Aplicações, 2010, Rio Grande. Anais do WESAAC 2010. Rio Grande : FURG	35
1	WESAAC 2010: Workshop-Escola de Sistemas Multiagentes, seus Ambientes e Aplicações, 2010, Rio Grande. Anais do WESAAC 2010. Rio Grande : FURG	36
627	The Multi-Agent Logics, Languages, and Organisations Federated Workshops (MALLOW 2010)/LAnguages, methodologies and Development tools for multi-agent systemS (LADS 2010), 2010, Lyon. Olivier Boissier, Amal El Fallah Seghrouchni, Salima Hassas and Nicolas Maudet (Eds.), MALLOW 2010 - The Multi-Agent Logics, Languages, and Organisations Federated Workshops, CEUR-WS Workshop Proceedings Series. Aachen : Sun SITE Central Europe/ RWTH Aachen University/Tilburg University	37
627	The Multi-Agent Logics, Languages, and Organisations Federated Workshops (MALLOW 2010)/Workshop on Multi-Agent Systems and Simulation (MASS 2010), 2010, Lyon. Olivier Boissier, Amal El Fallah Seghrouchni, Salima Hassas and Nicolas Maudet (Eds.), MALLOW 2010 - The Multi-Agent Logics, Languages, and Organisations Federated Workshops, CEUR-WS Workshop Proceedings Series. Aachen : Sun SITE Central Europe/ RWTH Aachen University/Tilburg University	38
1	V Workshop on MSc Dissertation and PhD Thesis in Artificial Intelligence, 2010, São Bernardo do Campo. Anais do V Workshop on MSc Dissertation and PhD Thesis in Artificial Intelligence/Joint Conference SBIA/SBRN/JRI 2010. Porto Alegre : SBC	39
1	Second Brazilian Workshop on Social Simulation (BWSS 2010) at Joint Conferences XX SBIA/XI SBRN/IV JRI, 2010, São Bernardo do Campo. (P. T. Aquino Junior, Ed.) Workshop Proceedings/Joint Conference 2010. Porto Alegre : SBC	40
1	Second Brazilian Workshop on Social Simulation - BWSS 2010 at Joint Conference SBIA/SBRN/JRI 2010, 2010, São Bernardo do Campo. (P. T. Aquino Junior, Ed.) Workshop Proceedings/Joint Conference 2010. Porto Alegre : SBC	41
1	Congresso Brasileiro de Sistemas Fuzzy, 2010, Sorocaba. Anais do CBSF 2010. São Carlos : UFSCar	42
1	Second Brazilian Workshop on Social Simulation (BWSS 2010) at Joint Conferences XX SBIA/XI SBRN/IV JRI, 2010, São Bernardo do Campo. (P. T. Aquino Junior, Ed.) Workshop Proceedings/Joint Conference 2010. Porto Alegre : SBC	43
6433	12th Ibero-American Conference on AI, 2010, Bahia Blanca. Angel Morales and Guillerno Simari (Eds.) Advances in Artificial Inteligence - IBERAMIA 2010, Lecture Notes In Artificial Intelligence. Berlin : Springer	44
1	INFORUM - Simpósio de Informática, 2010, Braga. INFORUM Proceedings. Braga : Universidade do Minho	45
1	Computability in Europe 2009: Mathematical Theory and Computational Practice, 2009, Heidelberg. Proceedings of CiE 2009. Heidelberg : Universität Heidelberg	46
1	V Simpósio Brasileiro de Sistemas de Informação, 2009, Brasília. Anais do V Simpósio Brasileiro de Sistemas de Informação. Porto Alegre : SBC	47
1	14th Portuguese Conference on Artificial Intelligence - EPIA'2009/Social Simulation and Modelling - SSM, 2009, 2009, Aveiro. L.S. Lopes, N. Lau, P. Mariano, L.M. Rocha (Eds.) New Trends in Artificial Intelligence. Aveiro : Universidade de Aveiro	48
1	14th Portuguese Conference on Artificial Intelligence - EPIA'2009/Multi-Agent Systems: Theory and Applications - MASTA 2009, 2009, Aveiro. L.S. Lopes, N. Lau, P. Mariano, L.M. Rocha (Eds.) New Trends in Artificial Intelligence. Aveiro : Universidade de Aveiro	49
1	14th Portuguese Conference on Artificial Intelligence - EPIA'2009/Social Simulation and Modelling - SSM 2009, 2009, Aveiro. L.S. Lopes, N. Lau, P. Mariano, L.M. Rocha (Eds.) New Trends in Artificial Intelligence. Aveiro : Universidade de Aveiro	50
1	14th Portuguese Conference on Artificial Intelligence - EPIA'2009/Social Simulation and Modelling - SSM 2009, 2009, Aveiro. Proceedings of EPIA 2009. Aveiro, Portugal : APPIA/Universidade de Aveiro	51
1	3rd Southern Conference on Computational Modeling, 2009, Rio Grande. Proceedings of MCSUL 2009. Rio Grande : FURG	52
1	Fourth Conference on Computability in Europe: Logic and Theory of Algorithms, 2008, Atenas. Logic and Theory of Algorithms, Proceedings of CiE 2008. Atenas : Univ. Athens	53
1	XXXIV Conferência Latinoamericano de Informática, 2008, Buenos Aires. Anales CLEI 2008. Buenos Aires : SADIO	54
1	1st Brazilian Workshop on Social Simulation, 2008, Salvador. Proceedings of the BWSS 2008. Porto Alegre : SBC	55
1	Workshop-Escola de Sistemas de Agentes para Ambientes Colaborativos	56
5249	19th Brazilian Symposium on Artificial Intelligence, 2008, Salvador. G. Zaverucha and A. L. Costa (Eds.) Advances in Artificial Intelligence - SBIA 2008 Proceedings (Lecture Notes in Artificial Intelligence). Berlin : Springer	57
1	Congresso de Matemática Aplicada e Computacional, 2008, 2008, Belém. Anais do CNMAC 2008. Belém : SBMAC	58
1	19th Brazilian Symposium on Artificial Intelligence - Workshop on Social Simulation (SBIA - BWSS 2008), 2008, Salvador. Proceedings of BWSS 2009. Porto Alegre : SBC	59
1	SEGeT 2008 - V Simpósio de Excelência em Gestão e Tecnologia, 2008, Resende, RJ. Anais do SEGeT 2008 - V Simpósio de Excelência em Gestão e Tecnologia. Resende, RJ : Associação Educacional Dom Bosco	60
1	Jornadas Chilenas de Computación 2008 - Workshop en Agentes y Sistemas Colaborativos, 2008, Punta Arenas. Anales de las Jornadas Chilenas de Computación 2008. Santiago, Chile : Sociedad Chilena de Computación	61
1	BWSS 2008 - Brazilian Workshop on Social Simulation, 2008, Salvador. Proceedings of the BWSS 2008 - Brazilian Workshop on Social Simulation. Pelotas : UCPel/SBC	62
	Simpósio Brasileiro de Sistemas Elétricos, 2008, Belo Horizonte. Anais do SBSE 2008	63
	Congresso Brasileiro de Automática, 2008, 2008, Juiz de Fora. Anais eletrônicos do CBA 2008	64
	LARS 2008 - 5º Simpósio Latino-Americano de Robótica, 2008, Salvador/Brasil. Anais do 5º Simpósio Latino-Americano de Robótica	65
	1st IFAC Workshop on Advanced Maintenance Engineering, Services and Technology - IFAC A-MEST'10, 2010, 2010, Lisboa. Proceedings of the 1st IFAC Workshop on Advanced Maintenance Engineering, Services and Technology - IFAC A-MEST'10, 2010	66
	12th Brazilian Workshop on Real-Time and Embedded Systems, 2010, Gramado. . Anais do 12th Brazilian Workshop on Real-Time and Embedded Systems	67
	14º Congresso Internacional e Exposição Sul-Americana de Automação, Sistemas e Instrumentação, 2010, 2010, São Paulo. Anais do Brazil Automation ISA 2010	68
1	World Congress on Engineering Asset Management 2009, 2009, Athens. WCEAM2009 - World Congress on Engineering Asset Management 2009. London : Springer-Verlag London Ltd	69
1	The Modern Information Technology in the Innovation Processes of the Industrial Enterprises - MITIP2009, 2009, Bergamo. 11th International Conference on The Modern Information Technology in the Innovation Processes of the Industrial Enterprises. Bergamo : Università degli Studi di Bergamo	70
	The Second International Conference on Networked Digital Technologies, 2010, Praga - República Tcheca. NDT 2010 - LNCS 7899. Heidelberg - Alemanha : Springer	81
	Congresso Regional de Iniciação Científica e Tecnológica em Engenharia, 2010, Rio Grande / RS. CRICTE 2010. Rio Grande	82
	Congresso Regional de Iniciação Científica e Tecnológica em Engenharia, 2010, Rio Grande / RS. CRICTE 2010. Rio Grande	83
	Congresso Regional de Iniciação Científica e Tecnológica em Engenharia, 2010, Rio Grande / RS. CRICTE 2010. Rio Grande	84
	MCSul 2010 - Simpósio de Modelagem Computacional do Sul, 2010, Rio Grande / RS. MCSul 2010. Rio Grande : FURG	85
	MCSul 2010 - Simpósio de Modelagem Computacional do Sul, 2010, Rio Grande / RS. MCSul 2010. Rio Grande : FURG	86
	Cargese Interdisciplinar Seminar 2009, 2009, Cargese. Modeling Simulation of Evolutionary Agents in Virtual Worlds	87
	WCAMA - Workshop de Computação Aplicada ao Meio Ambiente, 2009, Bento Gonçalves. WCAMA	88
02	International Conference on Computer Engineering and Technology, 2009. International Conference on Computer Engineering and Technolog	89
	III Worshop Escola de Sistemas de Agentes para Ambientes Colaborativos, 2009, Caxias do Sul. WESAAC	90
	MDEIS 2008 joint to 10th International Conference on Enterprise Information Systems (ICEIS 2008), 2008, Barcelona. The 4th International Workshop on Model-Driven Enterprise Information Systems	91
	KRRSW 2008 joint to 5th European Semantic Web Conference (ESWC 2008), 2008, Tenerife. 1st International Workshop on Knowledge Reuse and Reengineering over the Semantic Web	92
	SEMISH, 2008, Belém. Seminário Integrado de Software e Hardware (SEMISH 2008)	93
	WESAAC, 2008, Santa Cruz do Sul. Workshop-Escola de Sistemas de Agentes para Ambientes Colaborativos	94
	Seminário de Tecnologia da Informação Aplicada (STIA), 2008, Chapecó / SC. Seminário de Tecnologia da Informação Aplicada	95
	Simpósio Brasileiro de Inteligência Artificial - Concurso de Teses e Dissertações em Inteligência Artificial, 2008, Salvador. SBIA/CTDIA2008	96
	Congresso Sul Brasileiro de Computação, 2008, Criciúma / SC. Sulcomp 2008	97
	Congresso Sul Brasileiro de Computação, 2008, Criciúma / SC. Sulcomp 2008	98
	2010 Fourth International Conference on Network and System Security, 2010, Melbourne. Proceedings of International Conference on Data and Knowledge Engineering 2010	99
	1st International Conference on Applied Robotics for the Power Industry (CARPI), 2010, Montreal. Proceedings of 1st International Conference on Applied Robotics for the Power Industry (CARPI)	100
9	Simpósio Brasileiro de Automação Inteligente - SBAI, 2009, Brasília. ANAIS DO IX SIMPÓSIO BRASILEIRO DE AUTOMAÇÃO INTELIGENTE"	101
	Congresso Brasileiro de Automática, 2008, Juiz de Fora. Anais XVII do Congresso Brasileiro de Automática	102
	Congresso Brasileiro de Automática, 2008, Juiz de Fora. Anais do XVII Congresso Brasileiro de Automática	103
	5th IEEE Latin American Robotics Symposium, 2008, Salvador. Proceedings of 5th Latin American Robotics Symposium	104
	5th IEEE Latin American Robotics Symposium, 2008, Salvador. Proceedings of 5th Latin American Robotics Symposium	105
	XXIII Simpósio Brasileiro de Bancos de Dados - SBBD, 2008, Campinas. Anais do XXIII Simpósio Brasileiro de Bancos de Dados	106
	IV Escola Regional de Bancos de Dados - ERBD, 2008, Florianópolis. Anais da IV Escola Regional de Bancos de Dados	107
	1st International Conference on Applied Robotics for the Power Industry (CARPI), 2010, Montreal. 1st International Conference on Applied Robotics for the Power Industry (CARPI)	109
	CBA 2010 - XVIII Congresso Brasileiro de Automática, 2010, Bonito. CBA 2010 - XVIII Congresso Brasileiro de Automática	110
	Latin American Robotics Symposium and Intelligent Robotics Meeting, 2010, São Bernardo do Campo. Latin American Robotics Symposium and Intelligent Robotics Meeting	111
	IX Simpósio Brasileiro de Automação Inteligente, 2009, Brasilia. IX Simpósio Brasileiro de Automação Inteligente	112
	Rio Pipeline 2009 Conference and Exhibition, 2009, Rio de Janeiro. Rio Pipeline 2009 Conference and Exhibition	113
	5th Latin American Robotics Symposium, 2008, Slavador. IEEE Latin American Robotics Symposium	114
	Simpósio Brasileiro de Sistemas Elétricos, 2008, Belo Horizonte. Simpósio Brasileiro de Sistemas Elétricos	115
	Congresso Brasileiro de Automática, 2008, Juiz de Fora. Congresso Brasileiro de Automática	116
1	Workshop-Escola de Sistemas de Agentes, seus Ambientes e Aplicações, 2010, Rio Grande. Anais do WESAAC 2010. Rio Grande : FURG	133
1	Workshop-Escola de Sistemas de Agentes, seus Ambientes e Aplicações, 2010, Rio Grande. Anais do WESAAC 2010. Rio Grande : FURG	134
627	The Multi-Agent Logics, Languages, and Organisations Federated Workshops (MALLOW 2010)/LAnguages, methodologies and Development tools for multi-agent systemS (LADS 2010), 2010, Lyon. Olivier Boissier, Amal El Fallah Seghrouchni, Salima Hassas and Nicolas Maudet (Eds.), MALLOW 2010 - The Multi-Agent Logics, Languages, and Organisations Federated Workshops, CEUR-WS Workshop Proceedings Series. Aachen : Sun SITE Central Europe/ RWTH Aachen University/Tilburg University	135
	IV MCSUL - Southern Conference in Computational Modeling, 2010. IV MCSUL	255
	IV Seminário e Workshop em Engenharia Oceânica, 2010. SEMENGO 2010	256
627	The Multi-Agent Logics, Languages, and Organisations Federated Workshops (MALLOW 2010)/Workshop on Multi-Agent Systems and Simulation (MASS), 2010, Lyon. Olivier Boissier, Amal El Fallah Seghrouchni, Salima Hassas and Nicolas Maudet (Eds.), MALLOW 2010 - The Multi-Agent Logics, Languages, and Organisations Federated Workshops, CEUR-WS Workshop Proceedings Series. Aachen : Sun SITE Central Europe/ RWTH Aachen University/Tilburg University	136
1	V Workshop on MSc Dissertation and PhD Thesis in Artificial Intelligence/Joint Cinference SBIA/SBRN/JRI 2010, 2010, São Bernardo do Campo. (P. T. Aquino, Ed.) Workshop Proceedings/Joint Conference 2010. Porto Alegre : SBC	137
1	Second Brazilian Workshop on Social Simulation (BWSS 2010) at Joint Conferences XX SBIA/XI SBRN/IV JRI, 2010, São Bernardo do Campos. (P. T. Aquino Junior, Ed.) Workshop Proceedings/Joint Conference 2010. Porto Alegre : SBC	138
1	Congresso Brasileiro de Sistemas Fuzzy, 2010, Sorocaba. Anais do CBSF 2010. São Carlos : UFSCar	139
1	Second Brazilian Workshop on Social Simulation - BWSS 2010 at Joint Conference SBIA/SBRN/JRI 2010, 2010, São Bernardo do Campo. (P. T. Aquino Junior, Ed.) Workshop Proceedings/Joint Conference 2010. Porto Alegre : SBC	140
1	4th Southern Conference on Computational Modeling/IX Encontro Regional de Matemática Aplicada e Computacional, 2010, Rio Grande. Anais do 4 MCSUL/IX ERMAC. Rio Grande : FURG	141
1	4th Southern Conference on Computational Modeling/IX Encontro Regional de Matemática Aplicada e Computacional, 2010, Rio Grande. Anais do 4MCSUL/IX ERMAC. Rio Grande : FURG	142
1	4th Southern Conference on Computational Modeling/IX Encontro Regional de Matemática Aplicada e Computacional, 2010, Rio Grande. Anais do 4MCSUL/IX ERMAC. Rio Grande : FURG	143
1	4th Southern Conference on Computational Modeling/IX Encontro Regional de Matemática Aplicada e Computacional, 2010, Rio Grande. Anais do 4 MCSUL/IX ERMAC. Rio Grande : FURG	144
1	Computability in Europe 2009: Mathematical Theory and Computational Practice, 2009, Heidelberg. Klaus Ambos-Spies, Benedikt Löwe, Wolfgang Merkle (Editors) Mathematical Theory and Computational Practice. Heidelberg : University of Heidelberg	145
1	International Fuzzy Systems Association World Congress/European Society for Fuzzy Logic and Technonoly Conference 2009, 2009, Lisboa. Proceedings of 2009 ISFA World Congress/2009 EUSFLAT Conference. Lisboa : ISFA/EUSFLAT	146
1	14th Portuguese Conference on Artificial Intelligence - EPIA'2009/Social Simulation and Modelling - SSM, 2009, Aveiro. L.S. Lopes, N. Lau, P. Mariano, L.M. Rocha (eds.) New Trends In Artificial Intelligence. Aveiro : Universidade de Aveiro	147
1	14th Portuguese Conference on Artificial Intelligence - EPIA'2009/Multi-Agent Systems: Theory and Applications - MASTA 2009, 2009, Aveiro. L.S. Lopes, N. Lau, P. Mariano, L.M. Rocha (eds.) New Trends In Artificial Intelligence. Aveiro : Universidade de Aveiro	148
2	XXXII Congresso Nacional de Matemática Aplicada e Computacional, 2009, Cuiabá. A. L. Bortoli et al. (Eds.) Anais do CNMAC. São Carlos : SBMAC	149
1	The 3rd Southern Conference on Computational Modeling, 2009, Rio Grande. Proceedings of MCSUL 2009. Rio Grande : FURG	150
1	Fourth Conference on Computability in Europe: Logic and Theory of Algorithms, 2008, Athens. Arnold Beckmann, Costas Dimitracopoulos and Benedikt Löwe (eds.) Logic and Theory of Algorithms, Proceedings of CiE 2008. Athens : University of Athens	151
5110	15th Workshop on Logic, Information, Language and Computation, 2008, Edinburgh. Wilfrid Hodges and Ruy de Queiroz (Eds.) Logic, Language, Information and Computation15th International Workshop, WoLLIC 2008 Edinburgh, UK, July 1-4, 2008 Proceedings (Lecture Notes in Artificial Intelligence). Berlin : Springer-Verlag	152
1	XXXI Congresso Nacional de Matemática Aplicada e Computacional, 2008, Belém. E. C. Abreu et al. Anais do CNMAC. São Carlos : SBMAC	153
1	XXXI Congresso Nacional de Matemática Aplicada e Computacional, 2008, Belém. E. C. Abreu et al. (Eds.) Anais do CNMAC. São Carlos : SBMAC	154
1	II Workshop-Escola de Sistemas de Agentes para Sistemas Colaborativos, 2008, Santa Cruz. R. Frozza e A. A. Kozen (Org.) Anais do WESAAC 2008. Santa Cruz do Sil : EDUNISC	155
1	II Workshop Escola de Sistemas de Agentes para Ambientes Colaborativos, 2008, Santa Cruz. R. Frozza e A. A. Konzen (Org.) Anais do WESAAC 2008. Santa Cruz do Sul : EDUNIISC	156
1	II Workshop-Escola de Sistemas de Agentes para Ambientes Colaborativos, 2008, Santa Cruz. R. Frozza e A. A. Konzen (Org.) Anais do WESAAC 2008. Santa Cruz so Sul : EDUNISC	157
5249	19th Brazilian Symposium on Artificial Intelligence, 2008, Salvador. G. Zaverucha and A. L. Costa (Eds.) Advances in Artificial Intelligence - SBIA 2008 Proceedings (Lecture Notes in Artificial Intelligence). Berlin : Springer	158
1	Third Workshop on Logical and Semantic Frameworks, with Applications, 2008, Salvador. Mario Benevides and Elaine Pimentel (eds.), Pré-Proceedings of LSFA 2008. Porto Alegre : SBC	159
1	(G. P. Henning, M. R. Galli y S. Goneet, eds.) XXXIV Conferência Latinoamericano de Informática, 2008, Santa Fe. Anales CLEI 2008. Buenos Aires : Sadio	160
1	SBIA 2008 / BWSS 2008 - 1st Brazilian Workshop on Social Simulation, 2008, Salvador. Proceedings of SBIA 2008 / BWSS 2008. Porto Alegre : SBC	161
1	VII Simpósio de Informática da Região Centro do RS, 2008, Santa Maria. Anais do SIRC 2008. Santa Maria : UNIFRA	162
1	IV Workshop on MSc Dissertation and PhD Thesis in Artificial Intelligence (WTDIA), 2008, Salvador. Proceedings of IV WTDIA. Porto Alegre : SBC	163
1	VI Best MSc Dissertation/PhD Thesis Contest (CTDIA), 2008, Salvador. Proceedings of VI CTDIA. Porto Alegre : SBC	164
	VIII Congreso Internacional sobre Investigación en la Didáctica de las Ciencias, 2009, Barcelona. Enseñanza de las Ciencias - VIII Congreso Internacional sobre Investigación en la Didáctica de las Ciencias	165
	IV Seminário Jogos Eletrônicos, Educação e Comunicação - construindo novas trilhas, 2008, Bahia. IV Seminário Jogos Eletrônicos, Educação e Comunicação - construindo novas trilhas	166
	Simpósio Brasileiro de Jogos e Entretenimento Digital, 2008, Belo Horizonte. SBGAMES 2008	167
	IV Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações, 2010, Rio Grande. Anais do IV Wesaac	172
1	Congresso Regional de Iniciação Científica e Tecnológica em Engenharia - CRICTE, 2010, Rio Grande. Anais	173
	IV Conferência Sul de Modelagem Computacional, 2010, Rio Grande. Anais	174
	International Joint Conference on Neural Networks (IJCNN2008), 2008, Hong Kong. International Joint Conference on Neural Networks (IJCNN2008)	175
	IV Seminário e workshop em Engenharia Oceânica, 2010, Rio Grande. Anais do IV Seminário e workshop em Engenharia Oceânica	182
	4MCSUL, 2010, Rio Grande. Anais do 4MCSUL	183
	23 Congresso Nacional de Transporte Aquaviário, Construção Naval e Offshore, 2010, Rio de Janeiro. Anais do 23 Congresso Nacional de Transporte Aquaviário, Construção Naval e Offshore	184
	1st International Conference on Applied Robotics for the Power Industry (CARPI), 2010, Montreal. Anais do 1st International Conference on Applied Robotics for the Power Industry (CARPI)	185
	INCOM 2009, 2009, Moscou. Anais di 13th IFAC Symposium on Information Control Problems in Manufacturing	186
CD-ROM	Simpósio Brasileiro de Sistemas Elétricos, 2008, Belo Horizonte. Anais do SBSE 2008. Belo Horizonte : Editora da Universidade Federal de Minas Gerais	187
cd-rom	Simpósio Brasileiro de Redes de Computadores - Salão de Ferramentas, 2008, Rio de Janeiro. Anais do SBRC 2008	188
	VII SBGames, 2008, Belo Horizonte. Anais do Simpósio Brasileial ro de Jogos para Computador e Entretenimento Digital - 2008	189
	The 17th International Conference on Systems, Signals and Image Processing (IWSSIP 2010), 2010, Niteroi, Brazil. Proceedings of the 17th International Conference on Systems, Signals and Image Processing. Niteroi, RJ, Brazil : Editora da Universidade Federal Fluminense	195
	IEEE International Conference on Robotics and Automation (ICRA), 2010, Anchorage, USA. Proceedings of the IEEE Int. Conf. on Robotics and Automation	196
	XXII Concurso de Teses e Dissertações da SBC - CSBC, 2010, Belo Horizonte. Anais do Congresso da SBC (CSBC)	197
	13th International Conference on Information Fusion (FUSION), 2010, Edinburgh, UK. Proceedings of 13th International Conference on Information Fusion	198
	IEEE International Conference on Multisensor Fusion and Integration, 2010, Salt Lake, USA. Proceedings of the 2010 IEEE International Conference on Multisensor Fusion and Integration	199
	Congresso Brasileiro de Automática, 2010, Bonito - Brazil. Anais do XVIII Congresso Brasileiro de Automática	200
	Congresso Brasileiro de Automática, 2010, Bonito - Brazil. Anais do XVIII Congresso Brasileiro de Automática	201
	13th International Conference on Information Fusion (FUSION), 2010, Edinburg, UK. Proceedings of 13th International Conference on Information Fusion (FUSION)	202
	IEEE/RSJ International Conference on Intelligent Robots and Systems, 2010, Taipei - Taiwan. Proceedings of IEEE/RSJ International Conference on Intelligent Robots and Systems	203
	Latin American Robotics Symposium, 2010, São Bernardo do Campo - Brazil. Proceedings of VII Latin American Robotics Symposium	204
	I International Conference on Biodental Engineering, 2009, Porto - Portugal. I International Conference on Biodental Engineering	205
	International Congress of Mechanical Engineering (COBEM), 2009, Gramado - Brazil. Anais do COBEM 2009	206
	The 2009 IEEE/RSJ International Conference on Intelligent Robots and Systems (IROS), 2009, St. Louis USA. The 2009 IEEE/RSJ International Conference on Intelligent Robots and Systems (IROS)	207
	European Conference on Mobile Robots, 2009, Dubrovnik. Proceedings of the 4th European Conference on Mobile Robots	208
	European Conference on Mobile Robots, 2009, Dubrovnik. Proceedings of the 4th European Conference on Mobile Robots	209
	IX Simpósio Brasileiro de Automação Inteligente, 2009, Brasilia. Anais do IX Simpósio Brasileiro de Automação Inteligente	210
	IEEE Latin American Robotics Symposium (LARS), 2009, Valparaiso - Chile. Proceedings of IEEE Latin American Robotics Symposium	211
	Simpósio Brasileiro de Automação Inteligente (SBAI), 2009, Brasilia. Anais do Simpósio Brasileiro de Automação Inteligente (SBAI)	212
	III MCSUL - 3rd Southern Conference on Computational Modelling, 2009, Rio Grande - Brazil. Anais do III MCSUL	213
	IEEE/OES Oceans, 2009, Bremen, Germany. Proceedings of IEEE/OES Oceans	214
1	Simposio Brasileiro de Sistemas Elétricos, 2008, Belo Horizonte. Anais do SBSE 2008	215
	Congresso da Sociedade Brasileira de Computação - Concurso de Trabalhos de Iniciação Científica, 2008, Belem. Anais do XXVIII Congresso da Sociedade Brasileira de Computação	216
	XVII Congresso Brasileiro de Automática, 2008, Juiz de Fora - MG - Brazil. Anais do XVII Congresso Brasileiro de Automática	217
1-4	MTS/IEEE Oceans, 2008, Quebec. Proc. of the MTS/IEEE Oceans	218
	Workshop of Undergraduate Work - Brazilian Symposium on Computer Graphics and Image Processing (SIBGRAPI), 2008, Campo Grande. Proceedings of the XXI Brazilian Symposium on Computer Graphics and Image Processing (SIBGRAPI)	219
	III Seminário e Workshop de Engenharia Oceânica, 2008, Rio Grande. Anais do III Seminário e Workshop de Engenharia Oceânica	220
	5th Latin American Robotics Symposium - LARS, 2008, Salvador. Proceedings of the 5th Latin American Robotics Symposium	221
Único	2010 17th IEEE International Conference and Workshops on Engineering of Computer Based Systems (ECBS), 2010, Rio de Janeiro. Proceeding of 2010 17th IEEE International Conference and Workshops on Engineering of Computer Based Systems (ECBS). Oxfor, England : IEEE	222
	2010 23rd SIBGRAPI Conference on Graphics, Patterns and Images (SIBGRAPI), 2010, Gramado, Brazil. Proceedings 23rd SIBGRAPI Conference on Graphics, Patterns and Images. Los Alamitos, California : IEEE Computer Society	223
	XVIII Congresso Brasileiro de Automática, 2010, Bonito, Brasil. Anais do XVIII Congresso Brasileiro de Automática	224
Único	The 3rd South Conference on Computational Modeling III MCSUL, 2009, Rio Grande. Anais do III Simpósio de Modelagem Computacional do Sul 3MCSul	225
	XXIX Simpósio Nacional de Educação Física, 2010. XXIX Simpósio Nacional de Educação Física	244
	IX Seminário de Pesquisa Qualitativa, 2010. IX Seminário de Pesquisa Qualitativa	245
	SIBIGRAPI, 2010. SIBIGRAPI	246
	Congresso Brasileiro de Automática, 2010. CBA 2010	247
	Congresso Brasileiro de Automática, 2010. CBA 2010	248
	Congresso Brasileiro de Automática, 2010. CBA 2010	249
	Congresso Brasileiro de Automática, 2010. CBA 2010	250
	Congresso Brasileiro de Automática, 2010. CBA 2010	251
	IEEE International Conference on Multisensor Fusion and Integration, 2010. IEEE International Conference on Multisensor Fusion and Integration	252
	12th Brazilian Workshop on Real-Time and Embedded Systems, 2010, Gramado. Anais do 12th Brazilian Workshop on Real-Time and Embedded Systems	253
	1st IFAC Workshop on Advanced Maintenance Engineering, Services and Technology - IFAC A-MEST'10, 2010, Lisboa. Proceedings of the 1st IFAC Workshop on Advanced Maintenance Engineering, Services and Technology - IFAC A-MEST'10	254
	23 Congresso Nacional de Transporte Aquaviário, Construção Naval e Offshore, 2010. SOBENA 2010	257
	SBGames, 2010. Simpósio Brasileiro de Jogos	258
	Seminário de Pesquisa Qualitativa, 2010. Seminário de Pesquisa Qualitativa	259
1	Simpósio Nacional de Educação Física, 2010. Simpósio Nacional de Educação Física	260
	INCOM 2009	261
	IEEE International Conference on Engineering of Complex Computer Systems, 2009. IEEE International Conference on Engineering of Complex Computer Systems	262
	IEEE Oceans 2009, 2009, Bremem. CD IEEE Oceans 2009	263
	VIII Congreso Internacional sobre Investigación en Didáctica de las Ciencias, 2009	264
	Simposio Brasileiro de Automação Inteligente, 2009, Brasilia. Simposio Brasileiro de Automação Inteligente	265
	Simpósio Brasileiro de Automação Inteligente, 2009, Brasília. Simpósio Brasileiro de Automação Inteligente	266
	Simpósio Brasileiro de Automação Inteligente, 2009, Brasilia. Simpósio Brasileiro de Automação Inteligente	267
	Simposio Brasileiro de Automação Inteligente, 2009, Brasilia. Simposio Brasileiro de Automação Inteligente	268
	IEEE Latin American Robotic Symposium, 2009. IEEE LARS	269
1	Simposio Brasileiro de Sistemas Elétricos, 2008, Belo Horizonte. Simposio Brasileiro de Sistemas Elétricos	270
	Congresso Brasileiro de Automática, 2008, Jiuz de Fora. Congresso Brasileiro de Automática	271
	Congresso Brasileiro de Automática, 2008, Jiuz de Fora. Congresso Brasileiro de Automática	272
	Latin American Robotic System - LARS, 2008, Salvador. Latin American Robotic Systems	273
	Latin American Robotic System - LARS, 2008, Salvador. Latin American Robotic Systems	274
	Congresso da Sociedade Brasileira de Computação, 2008. Concurso de Iniciação Científica	275
	Workshop in Under-graduated Work, 2008. SIBGRAPI 2008	276
	IEEE Oceans, 2008, Quebec. IEEE Oceans	277
	IEEE Latin American Robotic Symposium, 2008, Salvador. IEEE Latin American Robotic Symposium	278
	IEEE Latin American Robotic Symposium, 2008, Salvador. IEEE Latin American Robotic Symposium	279
	SBGames, 2008, Belo Horizionte. SBGames	280
	IV Seminário Jogos Eletrônicos, Educação e Comunicação construindo novas trilhas, 2008. IV Seminário Jogos Eletrônicos, Educação e Comunicação construindo novas trilhas	281
	XVIII Congresso Brasileiro de Automática - CBA 2010, 2010, Bonito / MS. Anais do XVIII Congresso Brasileiro de Automática - CBA 2010	284
	The 2010 1st International Conference on Applied Robotics for the Power Industry, 2010, Montreal. Proceedings of The 2010 1st International Conference on Applied Robotics for the Power industry	285
	The 2010 1st International Conference on Applied Robotics for the Power industry, 2010, Montreal. Proceedings of The 2010 1st International Conference on Applied Robotics for the Power industry	286
	14th IEEE International Conference on Emerging Technology and Factory Automation, 2009, Palma de Mallorca. Proceedings of the 14th IEEE International Conference on Emerging Technologies and Factory Automation (ETFA)	287
	IX Simpósio Brasileiro de Automação Inteligente, 2009, Brasília. Anais do IX Simpósio Brasileiro de Automação Inteligente	288
	IX Simpósio Brasileiro de Automação Inteligente, 2009, Brasília. Anais do IX Simpósio Brasileiro de Automação Inteligente	289
	Rio Pipeline 2009 Conference and Exhibition, 2009, Rio de Janeiro. Anais do Rio Pipeline 2009 Conference and Exhibition	290
	Simpósio Brasileiro de Sistemas Elétricos, 2008, Belo Horizonte. Anais do Simpósio Brasileiro de Sistemas Elétricos 2008	291
	Congresso Brasileiro de Automática, 2008, Juiz de Fora. Anais do XVII Congresso Brasileiro de Automática	292
	Simpósio Latino-Americano de Robótica, 2008, Salvador. Anais do 5o. Simpósio Latino-Americano de Robótica	293
\.


--
-- Data for Name: livro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY livro (edicao, volume, id_publicacao) FROM stdin;
		2
		3
		12
1	1	18
	1	19
		73
	1	74
1	1	75
		169
1	1	239
1	1	240
1	1	241
\.


--
-- Data for Name: membros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY membros (id_membro, nome, id_lattes, centralidade, pagerank) FROM stdin;
0	Adriano Velasque Werhli	4393367734853964	0	0
1	Alessandro de Lima Bicho	6965119196945931	0	0
2	Andre Prisco Vargas	0243625998325831	0	0
3	Antonio Carlos da Rocha Costa	5601943285331545	0	0
4	Cláudio Dornelles Mello Júnior	5464430592929387	0	0
5	Danúbia Bueno Espíndola	9582755594379866	0	0
6	Diana Francisca Adamatti	4984043849101331	0	0
7	Eder Mateus Nunes Gonçalves	8560050240967369	0	0
8	Eduardo Nunes Borges	5851601274050374	0	0
9	Emanuel da Silva Diaz Estrada	3463902649683230	0	0
10	Graçaliz Pereira Dimuro	9414212573217453	0	0
11	Ivete Martins Pinto	8740785327180983	0	0
12	Leonardo Ramos Emmendorfer	1129100746134234	0	0
13	Nelson Lopes Duarte Filho	5369672706522008	0	0
14	Odorico Machado Mendizabal	6058299964884859	0	0
15	Paulo Lilles Jorge Drews Junior	5551697165370587	0	0
16	Rodrigo Andrade de Bem	3935196239515458	0	0
17	Silvia Silva da Costa Botelho	8800859024101679	0	0
18	Vinícius Menezes de Oliveira	9262132256691648	0	0
\.


--
-- Data for Name: publicacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY publicacao (id_publicacao, tipo, titulo, autores, ano, paginas, id_membro, cluster) FROM stdin;
1	AP	GENE REGULATORY NETWORK RECONSTRUCTION BY BAYESIAN INTEGRATION OF PRIOR KNOWLEDGE AND/OR DIFFERENT EXPERIMENTAL CONDITIONS	WERHLI, ADRIANO V. ; HUSMEIER, DIRK	2008	543	0	\N
3	LP	IV MCSUL Southern Conference on Computational Modeling / IX ERMAC Encontro regional de Matemática Aplicada e Computacional	WERHLI, A. V. (Org.) ; Emmendorfer, L. R. (Org.) ; COSTA, A. C. R. (Org.) ; Retamoso, M. (Org.)	2010		0	\N
4	CL	Reverse Engineering Gene Regulatory Networks with Various Machine	Grzegorczyk, Marco ; Husmeier, D. ; WERHLI, A. V.	2008	101-142	0	\N
5	TC	Bayesian Network Structure Inference with an Hierarchical Bayesian Model	WERHLI, A. V.	2010	92-101	0	\N
6	TC	Inferring Genetic Regulatory Networks with an Hierarchical Bayesian Model and a Parallel Sampling Algorithm	Mendoza, M. R. ; WERHLI, A. V.	2010	91-96	0	\N
9	AP	An Interactive Model for Steering Behaviors of Groups of Characters	RODRIGUES, R. A. ; BICHO, A. L. ; PARAVISI, M. ; JUNG, C. R. ; MAGALHÃES, L. P. ; MUSSE, S. R.	2010	594-616	1	\N
10	AP	Tree Paths: A New Model for Steering Behaviors. Proceedings of the 9th International Conference on Intelligent Virtual Agents	RODRIGUES, R. A. ; BICHO, A. L. ; PARAVISI, M. ; JUNG, C. R. ; MAGALHÃES, L. P. ; MUSSE, S. R.	2009	358-371	1	\N
12	LP	Caderno de Atividades Práticas Supervisionadas. Anhanguera Publicações e Comércio de Material Didático Ltda	CAVALHEIRO, Rafael Fagundes ; VARGAS, A. P. ; DEVINCENZI, Sam da Silva	2008		2	\N
13	AP	Exchange Values and Social Power Supporting the Choice of Partners	FRANCO, M. H. I. ; COSTA, A. C. R. ; COELHO, H.	2010	art_02	3	\N
14	AP	Interpretações do Interferômetro de Mach-Zehnder no Modelo qMG. TEMA	AMARAL, R. B. ; REISER, Renata Hax Sander ; COSTA, A. C. R.	2009	111-124	3	\N
16	AP	Capacitação de Gestores de Universidades através da Utilização de Jogos de Empresas Baseados em Instituições Eletrônicas	BERNARDI, Giliane ; COSTA, A. C. R.	2008	53-59	3	\N
17	AP	Quantum Arrows in Haskell	VIZZOTO, Juliana Kaiser ; COSTA, A. C. R. ; Sabry, A.	2008	139-152	3	\N
18	LP	Advance in Artificial Intelligence - SBIA 2010	COSTA, A. C. R. ; Vicari, R. M. ; Tonidandel, F.	2010	313	3	\N
19	LP	Proceedings of BWSS - Brazilian Workshop on Social Simulation. Porto Alegre: SBC	COSTA, A. C. R. (Org.)	2008		3	\N
24	CL	Uso de CSP na Especificação Formal do Nível Micro-Organizacional de SMAs. Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações - Artigos Selecionados das quatro primeiras edições. Rio Grande	BARBOSA, R. M. ; COSTA, A. C. R. ; TEDESCO, P. ; Mota, A.	2010	86-94	3	\N
25	CL	Modelo de Agente Econômico Cognitivo com Base no Conceito de Agentes BDI	JEANNES, F. M. ; COSTA, A. C. R.	2010	126-137	3	\N
26	CL	Teoria dos Jogos aplicada à coordenação de agentes, utilizando Teoria dos Valores de Troca	Pereira, D. R. ; COSTA, A. C. R.	2010	150-161	3	\N
28	CL	Using CSP in the Formal Specification of the Micro-organizational level of Multiagent Systems	BARBOSA, R. M. ; COSTA, A. C. R.	2010	459-464	3	\N
31	CL	A Distributed Normative Infrastructure for Situated Multi-Agent Organisations	OKUYAMA, Fabio Yoshimitsu ; BORDINI, Rafael Heitor ; COSTA, A. C. R.	2008	29-46	3	\N
34	TC	Uso de CSP na Especificação Formal do Nível Micro-Organizacional de Sistemas Multiagentes	BARBOSA, R. M. ; COSTA, A. C. R.	2010	13-21	3	\N
35	TC	Um Modelo de Agente Econômico Cognitivo com Base no Conceito de Agentes BDI	JEANNES, F. M. ; COSTA, A. C. R.	2010	53-64	3	\N
36	TC	Teoria dos Jogos aplicada à coordenação de agentes, utilizando Teoria dos Valores de Troca	Pereira, D. R. ; COSTA, A. C. R.	2010	77-88	3	\N
29	CL	A Minimal Dynamical MAS Organization Model	COSTA, A. C. R. ; DIMURO, Graçaliz Pereira	2009	419-445	3	29
43	TC	On the Operationality of Moral-Sense Decision Making	COELHO, H. ; COSTA, A. C. R. ; TRIGO, P.	2010	11-22	3	\N
44	TC	Moral Minds as Multiple-Layer Organizations	COELHO, H. ; COSTA, A. C. R. ; TRIGO, P.	2010	254-263	3	\N
45	TC	Decision Making for Agent Moral Conducts	COELHO, H. ; COSTA, A. C. R. ; TRIGO, P.	2010	1-12	3	\N
47	TC	Aprendizagem Organizacional através de Simulação baseada em Instituições Eletrônicas e Agentes de Software	BERNARDI, Giliane ; COSTA, A. C. R.	2009		3	\N
50	TC	A Critical Study of the Coherence between EBMs and ABMs in the Simulation of the Hawks-Doves-LawAbiders Society	JEANNES, F. M. ; COSTA, A. C. R.	2009	475-486	3	\N
51	TC	On the Intelligence of Moral Agency	COELHO, H. ; COSTA, A. C. R.	2009	439-450	3	\N
56	TC	Capacitação de Gestores de Instituições de Ensino Superior através da Simulação de Processos Administrativos utilizando a Abordagem de Instituições Eletrônicas	BERNARDI, Giliane ; COSTA, A. C. R.	2008	1-12	3	\N
58	TC	Interpretações do Interferômetro de Mach-Zehnder no Modelo qMG	AMARAL, R. B. ; REISER, Renata Hax Sander ; COSTA, A. C. R.	2008	1-10	3	\N
59	TC	Simulating Argumentation about Exchange Values in Multi-Agents Interactions	ISLABÃO, Márcia Hafelle ; COSTA, A. C. R.	2009	1-12	3	\N
60	TC	Jogos de Empresa e Aprendizagem Organizacional: um Estudo de Caso de Simulação de Processos Organizacionais de uma Instituição de Educação Superior	BERNARDI, Giliane ; COSTA, A. C. R.	2008		3	\N
61	TC	Jogo de Empresa baseado em Agentes de Software e Instituições Eletrônicas para Aprendizagem Organizacional de Gestores de Instituições de Educação Superior	BERNARDI, Giliane ; COSTA, A. C. R.	2008		3	\N
62	TC	Equation based Models as Formal Specifications of Agent-based Models for Social Simulation: preliminary issues	COSTA, A. C. R. ; JEANNES, F. M. ; CAVA, U. A.	2008	1-12	3	\N
68	TC	Detecção de falhas em atuadores nas linhas de transporte de petróleo e/ou derivados	HENRIQUES, Renato Ventura Bayan ; PEREIRA, Carlos Eduardo ; SCHNEIDER, Eduardo Luis ; GONÇALVES, Luiz Fernando ; ESPÍNDOLA, Danúbia Bueno	2010		5	\N
69	TC	IM:MR - A Tool for integration of data from different formats	ESPÍNDOLA, Danúbia Bueno ; PEREIRA, Carlos Eduardo ; PINHO, Marcio	2009	620-626	5	\N
70	TC	A solution for integration of IM and MR data	ESPÍNDOLA, Danúbia Bueno ; PEREIRA, Carlos Eduardo	2009	423-430	5	\N
71	AP	An analysis of the insertion of virtual players in GMABS methodology using the Vip-JogoMan prototype. JASSS	ADAMATTI, D. F. ; SICHMAN, Jaime Simão ; COELHO, Helder	2009	1-40	6	\N
72	AP	Inserção de Jogadores Virtuais em Jogos de Papeis para uso em sistemas de apoio a decisão em Grupos: um Experimento no Domínio da Gestão dos Recursos Naturais. IP	ADAMATTI, D. F.	2008	115-116	6	\N
74	LP	Workshop-Escola de Sistemas de Agentes, seus Ambientes e apliCações - Artigos Selecionados das quatro primeiras edições. Rio Grande / RS: Edigraf- Editora e Gráfica da Universidade Federal do Rio Grande	ADAMATTI, D. F. (Org.)	2010	247	6	\N
76	CL	Artificial Intelligence Applied to Natural Resources Management	ADAMATTI, D. F. ; AGUIAR, M. S.	2010	313-330	6	\N
77	CL	Simulação Baseada em Multiagentes em Atividades de Graduação	ADAMATTI, D. F.	2010	208-211	6	\N
79	CL	Design of an Artificial Decision Maker for a Human-Based Social Simulation - Experience of the SIMPARC ProjectDesign of an Artificial Decision Maker for a Human-Based Social Simulation - Experience of the SIMPARC Project	BRIOT, J. ; SORDONI, A. ; VASCONCELOS FILHO, J. E. ; PATTO, V. S. ; ADAMATTI, D. F. ; IRVING, M. ; MELLO, G. ; Lucena, C.	2010	17-35	6	\N
80	CL	A Inteligência Artificial e o Gerenciamento de Recursos Naturais	ADAMATTI, D. F. ; AGUIAR, M. S.	2009	67-86	6	\N
81	TC	A Framework for Intelligent Games	ADAMATTI, D. F.	2010	376-380	6	\N
83	TC	Problemas de Sincronização em Massively Multiplayer Online Games: Um Experimento Sobre a Plataforma SIM3D	FELSKE, M. S. ; ADAMATTI, D. F.	2010	1-4 - CDROM	6	\N
84	TC	Um Overview sobre a Utilização de Técnicas de Inteligência Artificial em Gerenciamento de Recursos Naturais	GULARTE, A. ; THOMASI, C. D. ; NUNES, G. ; ADAMATTI, D. F.	2010	1-4 - CDROM	6	\N
86	TC	UMA FERRAMENTA DE SIMULAÇÃO PARA IMPACTOS AMBIENTAIS	NUNES, G. ; THOMASI, C. D. ; GULARTE, A. ; ADAMATTI, D. F.	2010		6	\N
87	TC	Design of an Artificial Decision Maker for a Human-based Social Simulation - Experience of the SimParc Project	BRIOT, J. ; SORDONI, A. ; VASCONCELOS FILHO, J. E. ; PATTO, V. S. ; ADAMATTI, D. F. ; IRVING, M.	2009	1-16.CDROM	6	\N
88	TC	A Computer-based Support for Participatory Management of Protected Areas: The SimParc Project	BRIOT, J. ; PATTO, V. S. ; VASCONCELOS FILHO, J. E. ; ADAMATTI, D. F. ; SORDONI, A. ; MELLO, G.	2009	1337-1346	6	\N
89	TC	An Overview of the MABS and RPG Techniques in Natural Resources Management	ADAMATTI, D. F.	2009	538-542	6	\N
90	TC	Desenvolvimento de agentes: Uma análise da utilização da metodologia Prometheus	BERNY, V. M. ; ADAMATTI, D. F. ; COSTA, A. C. R.	2009	1-10.CDROM	6	\N
91	TC	A Framework to combine MDA and Ontology Learning	CANTELE, R. C. ; FERREIRA, M. A. G. V. ; ADAMATTI, D. F. ; ARAUJO, M.	2008	1-12.CDROM	6	\N
92	TC	An Experiment on Knowledge Reuse: Standards Applied	CANTELE, R. C. ; FERREIRA, M. A. G. V. ; ADAMATTI, D. F. ; ARAUJO, M.	2008	1-12.CDROM	6	\N
93	TC	A Computer-based Support for Participatory Management of Protected Areas: The SimParc Project	BRIOT, J. ; VASCONCELOS FILHO, J. E. ; ADAMATTI, D. F. ; PATTO, V. S. ; BARBOSA, S. ; FURTADO, V. ; IRVING, M. ; Lucena, C.	2008	1-15.CDROM	6	\N
94	TC	Uso de Agentes e Ontologias na Integração de Sistemas de Informação em Saúde	WEBBER, C. G. ; ADAMATTI, D. F. ; SALVADORI, J. ; RIBEIRO, A. M. ; PINTO, L. F. ; FERLA, A.	2008	1-10.CDROM	6	\N
95	TC	ExML: um Curso de Nivelamento na Modalidade EAD	Falavigna, M.R. ; ADAMATTI, D. F. ; Kuyven, N. L.	2008	1-6.CDROM	6	\N
96	TC	Inserção de Jogadores Virtuais em Jogos de Papéis para Uso em Sistemas de Apoio a Decisão em Grupos: Um Experimento no Domínio da Gestão de Recursos Naturais	ADAMATTI, D. F. ; SICHMAN, Jaime Simão	2008	1-10.CDROM	6	\N
97	TC	Construção de Ontologias Iniciais a partir de Sistemas Legados	ADAMATTI, D. F.	2008	1-10.CDROM	6	\N
98	TC	A Web Semântica e a Eduação	CANTELE, R. C. ; ADAMATTI, D. F. ; FERREIRA, M. A. G. V.	2008	1-1.CDROM	6	\N
99	TC	An Approach to Specify Knowledge in Multi-agent Systems using Petri Nets	GONÇALVES, Eder Mateus Nunes	2010	456-461	7	\N
106	TC	Uma Abordagem Efetiva e Eficiente para Deduplicação de Metadados Bibliográficos de Objetos Digitais	BORGES, Eduardo Nunes ; GALANTE, Renata de Matos ; GONÇALVES, Marcos André	2008	76-90	8	\N
107	TC	XSimilarity : Uma Ferramenta para Consultas por Similaridade embutidas na Linguagem XQuery	SILVA, Maria Estela Vieira da ; BORGES, Eduardo Nunes ; GALANTE, Renata de Matos	2008	148-157	8	\N
111	TC	Navigation system for an underground distribution inspection platform using simulation	ESTRADA, E. S. D. ; Silveira, L. ; OLIVEIRA, V. M. ; BOTELHO, S. S. C.	2010	109-114	9	\N
117	AP	On interval fuzzy S-implications	BEDREGAL, B. R. C. ; Dimuro, G.P. ; Santiago, R.H.N. ; Reiser, R.H.S.	2010	1373-1389	10	\N
118	AP	Analyzing the relationship between interval-valued D-Implications and interval-valued QL-Implications. TEMA	REISER, R. H. S. ; BEDREGAL, B. R. C. ; SANTIAGO, R. H. N. ; DIMURO, G. P.	2010	89-100	10	\N
119	AP	Aplicação de Agentes BDI com Percepção Fuzzy no Modelo Presa-Predador	FARIAS, G. P. ; DIMURO, G. P. ; COSTA, A. C. R.	2010	299-324	10	\N
120	AP	Xor-Implications and E-Implications: Classes of Fuzzy Implications Based on Fuzzy Xor	BEDREGAL, B. R. C. ; REISER, R. H. S. ; DIMURO, G. P.	2009	5-18	10	\N
121	AP	Interval-Valued D-Implications. TEMA	REISER, R. H. S. ; BEDREGAL, B. R. C. ; SANTIAGO, R. H. N. ; DIMURO, G. P.	2009	63-74	10	\N
123	AP	S-Implications on Bounded Lattices and the Interval Constructor. TEMA	REISER, R. H. S. ; DIMURO, G. P. ; BEDREGAL, B. R. C. ; SANTIAGO, R. H. N.	2008	143-154	10	\N
124	AP	Incerteza de Dados em Fluxo de Potência: Uma abordagem com a Matemática Intervalar do C-XSC. TEMA	Vargas, R. ; FARIAS, C. M. ; BARBOZA, L. V. ; DIMURO, G. P.	2008	491-502	10	\N
126	CL	Construção de Planos BDI a partir de Políticas Ótimas de POMDPs, com Aplicação na Programação em AgentSpeak usando o Jason	PEREIRA, D. R. ; GONÇALVES, L. V. ; DIMURO, G. P.	2010	24-30	10	\N
141	TC	Agentes Compartilhando Recursos Utilizando Processos de Decisão de Markov	RODRIGUES, L. M. ; DIMURO, G. P.	2010	107-110	10	\N
142	TC	Simulação Baseada em Agentes de Processos de Gestão Social de Ecossistemas Urbanos: o caso das hortas urbanas da cidade de Sevilla	RODRIGUES, T. F. ; DIMURO, G. ; VON GROL, C. ; Pinheiro, T. V. ; DIMURO, G. P. ; COSTA, A. C. R.	2010	257-260	10	\N
143	TC	Uma Proposta de Modelo Híbrido com Agentes Evolutivos BDI-Fuzzy-Intervalares	MACEDO, L. F. K. ; DIMURO, G. P. ; AGUIAR, M. S. ; COSTA, A. C. R. ; MATTOS, V. L. D.	2010	274-289	10	\N
144	TC	Tomando Decisões em um Ambiente de Informação Imperfeita: introdução de probabilidades fuzzy (intervalares) em um modelo híbrido de agente BDI-MDP	RIBES, J. L. B. ; DIMURO, G. P. ; AGUIAR, M. S. ; COSTA, A. C. R. ; MATTOS, V. L. D.	2010	280-285	10	\N
146	TC	An Approach to Interval-Valued R-Implications and Automorphisms	BEDREGAL, B. R. C. ; DIMURO, G. P. ; REISER, R. H. S.	2009	1-6	10	\N
149	TC	Analyzing the Relations between Interval-valued D-Implications and Interval-valued QL-Implications	REISER, R. H. S. ; DIMURO, G. P. ; BEDREGAL, B. R. C. ; SANTIAGO, R. H. N.	2009	190-196	10	\N
152	TC	Interval Additive Generators of Interval T-Norms	DIMURO, G. P. ; BEDREGAL, B. R. C. ; REISER, R. H. S. ; SANTIAGO, R. H. N.	2008	123-135	10	\N
153	TC	Interval Valued D-Implications	REISER, R. H. S. ; DIMURO, G. P. ; BEDREGAL, B. R. C. ; SANTIAGO, R. H. N.	2008	203-209	10	\N
154	TC	Avaliação Fuzzy de Trocas Sociais entre Agentes Baseados em Personalidades	SANTOS, A. V. ; DIMURO, G. P. ; BEDREGAL, B. R. C.	2008	176-182	10	\N
155	TC	Avaliação Fuzzy de Trocas Sociais em Sistemas Multiagentes baseados em Personalidades	SANTOS, A. V. ; DIMURO, G. P. ; BEDREGAL, B. R. C.	2008	1-10	10	\N
128	CL	Agentes BDI com Percepção Fuzzy na Simulação de um Modelo Presa-Predador Fuzzy	FARIAS, G. P. ; DIMURO, G. P. ; COSTA, A. C. R.	2010	74-85	10	20
156	TC	Construção de Planos BDI a partir de Políticas Ótimas de POMDPs, com Aplicação na Programação em AgentSpeak usando o Jason	PEREIRA, D. R. ; GONÇALVES, L. V. ; DIMURO, G. P.	2008	1-10	10	\N
157	TC	Auto-Regulação de Trocas Sociais Baseadas em Personalidades em Sistemas Multiagentes	GONÇALVES, L. V. ; PEREIRA, D. R. ; DIMURO, G. P.	2008	1-10	10	\N
159	TC	Xor-Implications and E-Implications: Classes of fuzzy implications based on fuzzy Xor	BEDREGAL, B. R. C. ; REISER, R. H. S. ; DIMURO, G. P.	2008	8-20	10	\N
162	TC	Valores de Trocas Sociais Fuzzy em Agentes com Personalidades	SANTOS, A. V. ; DIMURO, G. P. ; BEDREGAL, B. R. C.	2008	1-6	10	\N
163	TC	Avaliação Fuzzy de Trocas Sociais em Sistemas Multiagentes baseados em Personalidades	SANTOS, A. V. ; DIMURO, G. P.	2008	1-10	10	\N
164	TC	Building BDI Plans from POMDPs Optimal Policies, with an Application to the Self-Regulation of Social Exchanges in Multi-Agent Systems	PEREIRA, D. R. ; DIMURO, G. P.	2008	1-10	10	\N
168	AP	![CDATA[Effective Linkage Learning Using Low-Order Statistics and Clustering]]	Emmendorfer, Leonardo Ramos ; POZO, Aurora Trinidad Ramirez	2009	1233-1246	12	\N
171	CL	A Clustering-based Approach for Linkage Learning Applied to Multimodal Optimization	EMMENDORFER, L. R. ; POZO, Aurora Trinidad Ramirez	2008	225-248	12	\N
172	TC	Detectando Padrões Comportamentais de Agentes Através de Árvores de Decisão	EMMENDORFER, L. R. ; ADAMATTI, D. F. ; SILVEIRA, J. ; PAES, T.	2010		12	\N
175	TC	Selecting Software Reliability Models with a Neural Network Meta Classifier	CAIUTA, R. ; POZO, Aurora Trinidad Ramirez ; EMMENDORFER, L. R. ; VERGILIO, S.	2008	201-209	12	\N
179	CL	A General Purpose Cave-like System for Visualization of Animated and 4D CAD Modeling	DUARTE FILHO, Nelson Lopes ; CARVALHO, J. ; MARCOS, Pedro ; Maffei, Renan ; OLIVEIRA, Rodrigo Ruas ; HAX, V. ; BOTELHO, Silvia Silva da Costa	2010	82-87	13	\N
180	CL	A Framework for Distributed Shared Memory - Case Study in Geoscience Applications on Clusters of Computers	DUARTE FILHO, Nelson Lopes ; VIEIRA, Jeison ; BOTELHO, Silvia Silva da Costa	2010	88-93	13	\N
181	CL	An Automated Platform for Immersive and Collaborative Visualization of Industrial Models. Engineering of Complex Computer Systems. 1 ed	DUARTE FILHO, Nelson Lopes ; BOTELHO, Silvia Silva da Costa ; CARVALHO, J. ; MARCOS, Pedro ; Maffei, Renan ; OLIVEIRA, Rodrigo Ruas ; HAX, V.	2009	258-264	13	\N
188	TC	Estimando Atrasos em Redes de Computadores Através de Sistemas de Coordenadas - A Ferramenta Euclideana	MADRUGA, Felipe ; DUARTE FILHO, Nelson Lopes ; COELHO, Rafael ; PIAS, Marcelo	2008	51-58	13	\N
189	TC	Using Game Engines in Digital Manufacturing through Immersive and Collaborative Visualization Systems	BOTELHO, Silvia Silva da Costa ; DUARTE FILHO, Nelson Lopes ; Tyska, J ; MARCOS, Pedro ; Maffei, Renan ; OLIVEIRA, Rodrigo Ruas ; OLIVEIRA, R. R. ; HAX, V.	2008	101-105	13	\N
190	AP	Mapas auto-organizáveis em veículos autônomos subaquáticos	BOTELHO, S. S. C. ; HAFFELE, C. ; FIGUEIREDO, M. ; OLIVEIRA, G. L. ; DREWS JR, P. L. J.	2010	45-55	15	\N
193	AP	Uma Abordagem Baseada em Visão Computacional para Localização e Mapeamento Simultâneos de Robôs Subaquáticos. REIC	DREWS JR, P. L. J. ; BOTELHO, S. S. C.	2008	6	15	\N
194	CL	Self-Localization and Mapping for Underwater Autonomous Vehicles	BOTELHO, S. S. C. ; DREWS JR, P. L. J. ; OLIVEIRA, G. L.	2010	365-382	15	\N
195	TC	Computer Vision Algorithm for Detecting Wear in Teeth	MEIRELES, A. B. ; CASAS, E. B. L ; CORNACCHIA, T. M. ; CAMPOS, M. F. M. ; ALVES NETO,A. ; DREWS JR, P. L. J.	2010	1-4	15	\N
196	TC	Novelty Detection and 3D Shape Retrieval using Superquadrics and Multi-Scale Sampling for Autonomous Mobile Robots	DREWS JR, P. L. J. ; NUNEZ, P. ; ROCHA, R. P. P. ; CAMPOS, M. F. M. ; DIAS, J.	2010	3635-3640	15	\N
197	TC	Detecção de Mudanças e Recuperação de Forma em Mapas 3D Baseados em Nuvens de Pontos	DREWS JR, P. L. J. ; CAMPOS, M. F. M.	2010	1-8	15	\N
198	TC	Crowd Behavior Analysis under Cameras Network Fusion using Probabilistic Methods	DREWS JR, P. L. J. ; QUINTAS, J. ; DIAS, J. ; ANDERSSON, M. ; NYG RDS, J. ; RYDELL, J.	2010	1-8	15	\N
201	TC	Detecção de Mudanças e Recuperação de Forma em Mapas 3D Baseados em Nuvens de Pontos	DREWS JR, P. L. J. ; ROCHA, R. P. P. ; DIAS, J. ; CAMPOS, M. F. M.	2010	1-7	15	\N
202	TC	Probabilistic LMA-Based Classification of Human Behaviour Understanding Using Power Spectrum Techinique	KHOSHHAL, K. ; ALIAKBARPOUR, H. ; QUINTAS, J. ; DREWS JR, P. L. J. ; DIAS, J.	2010	1-7	15	\N
203	TC	Change Detection in 3D Environments Based on Gaussian Mixture Model and Robust Structural Matching for Autonomous Robotic Applications	NUNEZ, P. ; DREWS JR, P. L. J. ; BANDERA, A. ; ROCHA, R. P. P. ; CAMPOS, M. F. M. ; DIAS, J.	2010	2633-2638	15	\N
204	TC	Growing Cell Structures applyed to Sensor Fusion and SLAM	BOTELHO, S. S. C. ; HAFFELE, C. ; FIGUEIREDO, M. ; DREWS JR, P. L. J. ; OLIVEIRA, G. L.	2010		15	\N
205	TC	Methods for Assessing Dental Wear in Bruxism	MEIRELES, A. B. ; CORNACCHIA, T. M. ; CASAS, E. B. L ; BASTOS, F. S. ; GODOY, G. C. ; MARQUES, F. S. ; DREWS JR, P. L. J. ; ALVES NETO,A. ; CAMPOS, M. F. M.	2009	1-6	15	\N
206	TC	Multidisciplinary Approach In Tooth Wear: Biomechanical Aspects And Computational View	MEIRELES, A. B. ; CORNACCHIA, T. M. ; CASAS, E. B. L ; GODOY, G. C. ; MARQUES, F. S. ; DREWS JR, P. L. J. ; ALVES NETO,A. ; CAMPOS, M. F. M.	2009	1-10	15	\N
207	TC	Novelty Detection and 3D Shape Retrieval based on Gaussian Mixture Models for Autonomous Surveillance Robotics	NUNEZ, P. ; DREWS JR, P. L. J. ; ROCHA, R. P. P. ; CAMPOS, M. F. M. ; DIAS, J.	2009	4724-4730	15	\N
208	TC	Data Fusion Calibration for a 3D Laser Range Finder and a Camera using Inertial Data	NUNEZ, P. ; DREWS JR, P. L. J. ; ROCHA, R. P. P. ; DIAS, J.	2009	1-6	15	\N
209	TC	Object Shape Retrieval through Grasp Exploration	FARIA, D. R. ; PRADO, J. A. S. ; DREWS JR, P. L. J. ; DIAS, J.	2009	1-6	15	\N
213	TC	Self Organizing Maps for AUVs Mapping	BOTELHO, S. S. C. ; HAFFELE, C. ; OLIVEIRA, G. L. ; FIGUEIREDO, M. ; DREWS JR, P. L. J.	2009	1-5	15	\N
220	TC	Controle em Profundidade de um Veículo Subaquático do Tipo ROV	CENTENO, M. L. ; GOMES, S. C. P. ; PEREIRA, I. M. ; DINIZ, Claudio Machado ; DREWS JR, P. L. J. ; BOTELHO, S. S. C.	2008	1-6	15	\N
222	TC	Visual Tracking Based on 3D Probabilistic Reconstruction	SIMAS, Gisele ; DE BEM, Rodrigo Andrade ; NOVELO, Lucas ; FICKEL, G. ; BOTELHO, Silvia Silva da Costa	2010	403-409	16	\N
225	TC	Utilizando Visão Computacional para Reconstrução Probabilística 3D e Rastreamento de Movimentos	SIMAS, Gisele ; FICKEL, G. ; NOVELO, Lucas ; BOTELHO, Silvia Silva da Costa ; DE BEM, Rodrigo Andrade	2009	135-140	16	\N
191	AP	A Visual System For Distributed Mosaics Using AUV Fleets	DREWS JR, P. L. J. ; BOTELHO, S. S. C.	2009	8-10	15	191
227	AP	Ambientes virtuais de aprendizagem na educação física: uma revisão sobre a utilização de Exergames	VAGHETTI, C. A. ; BOTELHO, S. S. C.	2010	1-6	17	\N
228	AP	Forecasting Electric Energy Demand using a Predictor Model based on Liquid State Machine	grando, n. ; CENTENO, T. M. ; BOTELHO, S. S. C. ; fontoura, f.	2010	40-53	17	\N
229	AP	PRINCÍPIOS ERGONÔMICOS E USABILIDADE DE INTERFACES DE REALIDADE AUMENTADA EM AMBIENTES VIRTUAIS DE APRENDIZAGEM: VISÃO GERAL E TENDENCIAS	VAGHETTI, C. A. ; BOTELHO, S. S. C.	2010	1-6	17	\N
232	AP	DESENVOLVIMENTO DE UMA PLATAFORMA MULTIDISCIPLINAR PARA AUTORIA DE JOGOS 3D INTERATIVOS E EDUCATIVOS	PINTO, Ivete ; BOTELHO, S. S. C. ; Souza, R. ; Sonego, T. ; COLARES, R. ; CAMPOS, R. L.	2009	1-8	17	\N
234	AP	Sistema de predição de alarmes em processos industriais por classificação não-supervisionada	Braustein, S. ; A, Lerm ; Lerm, R. ; Werhli, A. ; BOTELHO, S. S. C. ; E, Lippe	2009	37-42	17	\N
235	AP	Dimensional Reduction in the Protein Secondary Structure Prediction Nonlinear Method Improvements	SIMAS, G. ; BOTELHO, S. S. C. ; grando, n. ; COLARES, R.	2008	425-432	17	\N
238	AA	Dimensional Reduction in the Protein Secondary Structure Prediction: Nonlinear Method Improvements	BOTELHO, S. S. C. ; SIMAS, G. ; COLARES, R.	2009		17	\N
239	LP	Third Southern Conference on Computational Modeling	BOTELHO, S. S. C. (Org.) ; ROCHA, L. (Org.) ; D, Adamatti (Org.)	2010	157	17	\N
241	LP	CONFERÊNCIA EM MODELAGEM COMPUTACIONAL DO SUL	BOTELHO, S. S. C. (Org.) ; ROCHA, L. (Org.) ; D, Adamatti (Org.)	2009	145	17	\N
242	CL	Nonlinear Dimensional Reduction in Protein Secondary Structure Prediction. Forecasting Models - Methods and Applications	SIMAS, G. ; BOTELHO, S. S. C. ; COLARES, R. ; CORREA, U. B.	2010	65-81	17	\N
243	CL	Using augmented state Kalman filter to localize multi autonomous underwater vehicles. Robot Localization and Map Building	BOTELHO, S. S. C. ; LEIVAS, G ; DREWS, P.	2010	33-41	17	\N
244	TC	Ambientes virtuais de aprendizagem na Educaçao fisica: uma revisão sobre a utilização de exergames	VAGHETTI, C. A. ; BOTELHO, S. S. C.	2010	1-6	17	\N
245	TC	Cultura digital e Educação Física	VAGHETTI, C. A. ; R, Sperotto ; BOTELHO, S. S. C.	2010	1-6	17	\N
248	TC	Sistema de Predição de Alarmes em Plantas Industriais Baseado em Mapas Auto-Organizáveis	Braustein, S. ; A, Lerm ; Lerm, R. ; Werhli, A. ; BOTELHO, S. S. C. ; E, Lippe	2010	1-6	17	\N
251	TC	A Visualização Mista nos Sistemas de Automação de Processos de Manutenção Preditiva de Máquinas da Indústria	ESPÍNDOLA, D. ; pereira, c. e. ; R, Henriques ; BOTELHO, S. S. C.	2010	1-6	17	\N
258	TC	Cultura digital e Educação Física: problematizando a inserção de Exergames no currículo	VAGHETTI, C. A. ; BOTELHO, S. S. C. ; R, Sperotto	2010	1-6	17	\N
259	TC	Cultura digital e Educação Física: problematizando a inserção de Exergames no currículo	VAGHETTI, C. A. ; R, Sperotto ; BOTELHO, S. S. C.	2010		17	\N
260	TC	Ambientes virtuais de aprendizagem na Educação Física: uma revisão sobre a utilização de Exergames	VAGHETTI, C. A. ; BOTELHO, S. S. C.	2010	1-6	17	\N
262	TC	An Automated Platform for Immersive and Collaborative Visualization of Industrial Models	DUARTE, N. ; BOTELHO, S. S. C. ; Tyska, j. ; R. maffei ; R. Oliveira	2009	1-6	17	\N
254	TC	Using Mixed Reality in the Visualization of Maintenance Processes	ESPÍNDOLA, D. ; pereira, c. e. ; HENRIQUES, Renato Ventura Bayan ; BOTELHO, S. S. C.	2010	35-40	17	66
271	TC	Técnicas para redução de perturbações em imagens subaquáticas destinadas ao controle de AUVS	DUCHINSKI, M. ; CENTENO, T. M. ; BOTELHO, S. S. C.	2008	1-6	17	\N
282	AP	Redução do Tempo de Execução de Métodos Numéricos utilizando GNU/OCTAVE e GPGPU	Tibola, A. L. ; OLIVEIRA, V. M.	2010	59-66	18	\N
284	TC	Sistema de Navegac#807;a#771;o para um Robo#770; de Inspec#807;a#771;o de Linhas Subterra#770;neas de Distribuic#807;a#771;o	Estrada, E. ; Silveira L. ; OLIVEIRA, V. M. ; BOTELHO, S. S. C.	2010		18	\N
285	TC	Control of a Brachiating Robot for Inspection of Aerial Power Lines	OLIVEIRA, V. M. ; LAGES, W. F.	2010		18	\N
287	TC	Real-Time Predictive Control of a Brachiation Robot	OLIVEIRA, V. M. ; LAGES, W. F.	2009	1-6	18	\N
289	TC	Controle em Tempo Real de um Robô Bracejador Utilizando MPC	OLIVEIRA, V. M. ; LAGES, W. F.	2009		18	\N
2	LP	Anais do IV Workshop- Escola de Sistemas de Agentes, seus Ambientes e apliCações. Rio Grande: FURG	Adamatti, D. F. (Org.) ; LUGO, G.G (Org.) ; Emmendorfer, L. R. (Org.) ; WERHLI, A. V. (Org.)	2010	174	0	2
73	LP	Anais do IV Workshop- Escola de Sistemas de Agentes, seus Ambientes e apliCações. Rio Grande: FURG	ADAMATTI, D. F. (Org.) ; LUGO, G. G. (Org.) ; EMMENDORFER, L. R. (Org.) ; WERHLI, A. V. (Org.)	2010	174	6	2
7	TC	Análise Exploratória de Dados para o Desenvolvimento de Sistemas de Previsão de Alarmes em Plantas Industriais	Botelho, S. S. C. ; BRAUNSTEI, S. H. ; WERHLI, A. V.	2009		0	7
268	TC	Análise Exploratória de Dados para o Desenvolvimento de Sistemas de Previsão de Alarmes em Plantas Industriais	BOTELHO, S. S. C. ; Werhli, A. ; Braustein, S.	2009	1-6	17	7
8	TC	Continuum Crowds with Local Control	Marcelo Paravisi ; WERHLI, A. V. ; Julio C. S. Jaques Jr. ; RODRIGUES, R. ; BICHO, A. ; JUNG, C. R. ; MUSSE, S. R.	2008	108-115	0	8
11	TC	Continuum Crowds with Local Control	PARAVISI, M. ; WERHLI, A. V. ; JACQUES JUNIOR, J. C. S. ; RODRIGUES, R. A. ; BICHO, A. L. ; JUNG, C. R. ; MUSSE, S. R.	2008	108-115	1	8
15	AP	Interval-Valued Hidden Markov Models for Recognizing Personality Traits in Social Exchanges in Open Multiagent Systems. TEMA	DIMURO, Graçaliz Pereira ; COSTA, A. C. R. ; Gonçalves, L. V. ; Hübner, A.	2008	83-93	3	15
122	AP	Interval-Valued Hidden Markov Models for Recognizing Personality Traits in Social Exchanges in Open Multiagent Systems. TEMA	DIMURO, G. P. ; COSTA, A. C. R. ; GONÇALVES, L. V. ; HÜBNER, A.	2008	83-93	10	15
20	CL	Agentes BDI com Percepção Fuzzy na Simulação de um Modelo Presa-Predador Fuzzy	Farias, G. P. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R.	2010	74-85	3	20
21	CL	Analisando Trocas Sociais Baseadas em Personalidades Através de Cadeias de Markov Intervalares	Farias, G. P. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R.	2010	13-23	3	21
125	CL	Analisando Trocas Sociais Baseadas em Personalidades Através de Cadeias de Markov Intervalares	FARIAS, G. P. ; DIMURO, G. P. ; COSTA, A. C. R.	2010	13-23	10	21
22	CL	Introdução da Dimensão Dialógica no Moise+, com Aplicação na Modelagem de Processos de Gestão em uma Universidade Comunitária	Hübner, A. ; COSTA, A. C. R. ; DIMURO, Graçaliz Pereira ; MATTOS, V. ; HERNANDES, S.	2010	138-149	3	22
129	CL	Introdução da Dimensão Dialógica no Moise+, com Aplicação na Modelagem de Processos de Gestão em uma Universidade Comunitária	HÜBNER, A. ; COSTA, A. C. R. ; DIMURO, G. P. ; MATTOS, V. L. D. ; HERNANDES, S.	2010	138-149	10	22
23	CL	Uma arquitetura de Agentes BDI Híbridos para Auto-regulação de Trocas Sociais em Sistemas Multiagentes Abertos	Gonçalves, L. V. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R.	2010	-60	3	23
127	CL	Uma arquitetura de Agentes BDI Híbridos para Auto-regulação de Trocas Sociais em Sistemas Multiagentes Abertos	GONÇALVES, L. V. ; DIMURO, G. P. ; COSTA, A. C. R.	2010	60-73	10	23
27	CL	Extending the MOISE+ Organizational Model with the Dialogic Dimension	Hübner, A. ; COSTA, A. C. R. ; DIMURO, Graçaliz Pereira	2010	130-135	3	27
130	CL	Extending the MOISE+ Organizational Model with the Dialogic Dimension	HÜBNER, A. ; COSTA, A. C. R. ; DIMURO, G. P.	2010	130-135	10	27
131	CL	A Minimal Dynamical MAS Organization Model	COSTA, A. C. R. ; DIMURO, G. P.	2009	419-445	10	29
30	CL	Semantical Concepts for a Formal Structural Dynamics of Situated Multiagent Systems	COSTA, A. C. R. ; DIMURO, Graçaliz Pereira	2008	139-154	3	30
132	CL	Semantical Concepts for a Formal Structural Dynamics of Situated Multiagent Systems	COSTA, A. C. R. ; DIMURO, G. P.	2008	139-154	10	30
32	TC	Agentes BDI com Percepção Fuzzy na Simulação de um Modelo Presa-Predador Fuzzy	Farias, G. P. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R.	2010	1-12	3	32
133	TC	Agentes BDI com Percepção Fuzzy na Simulação de um Modelo Presa-Predador Fuzzy	FARIAS, G. P. ; DIMURO, G. P. ; COSTA, A. C. R.	2010	1-12	10	32
33	TC	Introdução da Dimensão Dialógica no Moise+, com Aplicação na Modelagem de Processos de Gestão em uma Universidade Comunitária	Hübner, A. ; COSTA, A. C. R. ; DIMURO, Graçaliz Pereira ; MATTOS, V. ; HERNANDES, S. ; MAILANGE, M.	2010	65-76	3	33
134	TC	Introdução da Dimensão Dialógica no Moise+, com Aplicação na Modelagem de Processos de Gestão em uma Universidade Comunitária	HÜBNER, A. ; COSTA, A. C. R. ; DIMURO, G. P. ; MATTOS, V. L. D. ; HERNANDES, S. ; Mailange, M.	2010	65-76	10	33
37	TC	A Dialogic Dimension for the MOISE+ Organizational Model	Hübner, A. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R. ; MATTOS, V.	2010	23/21-23/26	3	37
135	TC	A Dialogic Dimension for the MOISE+ Organizational Model	HÜBNER, A. ; DIMURO, G. P. ; COSTA, A. C. R. ; MATTOS, V. L. D.	2010	23/21-23/26	10	37
38	TC	BDI Agents with Fuzzy Perception for Simulating Decision Making in Environments with Imperfect Information	Farias, G. P. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R.	2010	41/23-41/30	3	38
136	TC	BDI Agents with Fuzzy Perception for Simulating Decision Making in Environments with Imperfect Information	FARIAS, G. P. ; DIMURO, G. P. ; COSTA, A. C. R.	2010	41/23-41/30	10	38
39	TC	BDI Agents with Fuzzy Perception	Farias, G. P. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R.	2010	742-751	3	39
137	TC	BDI Agents with Fuzzy Perception	FARIAS, G. P. ; DIMURO, G. P. ; COSTA, A. C. R.	2010	742-751	10	39
40	TC	On the Problem of Recognizing and Learning Observable Social Exchange Strategies in Open Societies	DIMURO, Graçaliz Pereira ; COSTA, A. C. R. ; Gonçalves, L. V.	2010	140-152	3	40
138	TC	Recognizing and Learning Observable Social Exchange Strategies in Open Societies	DIMURO, G. P. ; COSTA, A. C. R. ; GONÇALVES, L. V.	2010	140-152	10	40
41	TC	An Interactional Characterization of Social Functions	COSTA, A. C. R. ; DIMURO, Graçaliz Pereira	2010	105-117	3	41
140	TC	An Interactional Characterization of Social Functions	COSTA, A. C. R. ; DIMURO, G. P.	2010	105-117	10	41
42	TC	Sobre Números Fuzzy Intervalares	DIMURO, Graçaliz Pereira ; COSTA, A. C. R. ; MUSSI, R. L.	2010	162-169	3	42
139	TC	Sobre Números Fuzzy Intervalares	DIMURO, G. P. ; COSTA, A. C. R. ; MUSSI, R. L.	2010	162-169	10	42
46	TC	Toward a Semantical Model of Organization Growth for Multiagent Systems	DIMURO, Graçaliz Pereira ; COSTA, A. C. R.	2009	120-129	3	46
145	TC	Toward a Semantical Model of Organization Growth for Multiagent Systems	DIMURO, G. P. ; COSTA, A. C. R.	2009	120-129	10	46
48	TC	Fuzzy Evaluation of Social Exchanges Between Personality-based Agents	DIMURO, Graçaliz Pereira ; SANTOS, André Vinícius dos ; BEDREGAL, Benjamin René Callejas ; COSTA, A. C. R.	2009	451-462	3	48
147	TC	Fuzzy Evaluation of Social Exchanges Between Personality-based Agents	DIMURO, G. P. ; SANTOS, A. V. ; BEDREGAL, B. R. C. ; COSTA, A. C. R.	2009	451-462	10	48
49	TC	A Formal Notion of Objective Expectations in the Context of Multiagent Systems Routines	COSTA, A. C. R. ; DIMURO, Graçaliz Pereira ; DUGDALE, J. ; DEMAZEAU, Y.	2009	367-378	3	49
148	TC	A Formal Notion of Objective Expectations in the Context of Multiagent Systems Routines	COSTA, A. C. R. ; DIMURO, G. P. ; DUGDALE, J. ; DEMAZEAU, Y.	2009	367-378	10	49
52	TC	Estendendo o Modelo Organizacional MOISE+ com a Dimensão Dialógica	Hübner, A. ; COSTA, A. C. R. ; DIMURO, Graçaliz Pereira	2009	1-6	3	52
150	TC	Estendendo o Modelo Organizacional MOISE+ com a Dimensão Dialógica	HÜBNER, A. ; COSTA, A. C. R. ; DIMURO, G. P.	2009	18-23	10	52
53	TC	Introducing Service Schemes and Systems Organization in the Theory of Interactive Computation	COSTA, A. C. R. ; DIMURO, Graçaliz Pereira	2008	87-96	3	53
151	TC	Introducing Service Schemes and Systems Organization in the Theory of Interactive Computation	COSTA, A. C. R. ; DIMURO, G. P.	2008	87-96	10	53
54	TC	Constructing BDI Plans from Optimal POMDP Policies, with an Application to AgentSpeak Programming	Pereira, D. R. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R.	2008	240-249	3	54
160	TC	Constructing BDI Plans from Optimal POMDP Policies, with an Application to AgentSpeak Programming	PEREIRA, D. R. ; GONÇALVES, L. V. ; DIMURO, G. P. ; COSTA, A. C. R.	2008	240-249	10	54
55	TC	Contrasting Two Regulation Mechanisms for Personality-based Social Exchange Processes	Pereira, D. R. ; Gonçalves, L. V. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R.	2008	1-12	3	55
161	TC	Contrasting Two Regulation Mechanisms for Personality-based Social Exchange Processes	PEREIRA, D. R. ; GONÇALVES, L. V. ; DIMURO, G. P. ; COSTA, A. C. R.	2008	1-12	10	55
57	TC	Towards the Self-regulation of Personality-based Social Exchange Processes in Multiagent Systems	Pereira, D. R. ; Gonçalves, L. V. ; DIMURO, Graçaliz Pereira ; COSTA, A. C. R.	2008	113-123	3	57
158	TC	Towards the Self-regulation of Personality-based Social Exchange Processes in Multiagent Systems	PEREIRA, D. R. ; GONÇALVES, L. V. ; DIMURO, G. P. ; COSTA, A. C. R.	2008	113-123	10	57
63	TC	TATUBOT Sistema Robótico de Inspeção para Linhas de Distribuição Elétrica Subterrâneas	BOTELHO, S. S. C. ; V. Oliveira ; N. D. Lopes Fº ; MELLO JÚNIOR, C. D. ; E. Estrada ; M. P. Galeriano ; U. B. Correa ; P. Drews Jr.	2008		4	63
115	TC	Tatubot - Sistema Robótico de Inspeção para Linhas de Distribuição Elétrica Subterrâneas	BOTELHO, S. S. C. ; DUARTE Filho, N. L. ; OLIVEIRA, V. M. ; MELLO JR., C. D. ; ESTRADA, E. S. D. ; GALERIANO, M. P. ; CORREA, U. B. ; DREWS JR., P.	2008		9	63
64	TC	TATUBOT ROBOTIC SYSTEM FOR INSPECTION OF UNDERGROUNDED CABLE SYSTEM	BOTELHO, S. S. C. ; GONÇALVES, E. M. N. ; MELLO JÚNIOR, C. D. ; ESTRADA, E. S. D. ; SOUTO Jr., H. D. ; SANTOS, T. S.	2008		4	64
103	TC	TATUBOT Robotic System for Inspection of Undergrounded Cable System	GONÇALVES, Eder Mateus Nunes ; BOTELHO, S. S. C. ; OLIVEIRA, V. M. ; MELLO, C. ; ESTRADA, E.	2008		7	64
65	TC	TATUBOT Robotic System for Inspection of Undergrounded Cable	GONÇALVES, E. M. N. ; ESTRADA, E. S. D. ; SOUTO Jr., H. D. ; V. Oliveira ; BOTELHO, S. S. C. ; MELLO JÚNIOR, C. D.	2008		4	65
105	TC	TATUBOT - Robotic System for Inspection of Undergrounded Cable System	MELLO, C. ; GONÇALVES, Eder Mateus Nunes ; ESTRADA, E. ; ALMEIDA, Renan Rosado de ; BOTELHO, S. S. C. ; OLIVEIRA, V. M.	2008	170-175	7	65
66	TC	Using Mixed Reality in the Visualization of Maintenance Processes	ESPÍNDOLA, Danúbia Bueno ; PEREIRA, Carlos Eduardo ; HENRIQUES, Renato Ventura Bayan ; BOTELHO, Silvia Silva da Costa	2010	35-40	5	66
67	TC	Uma Proposta para Visualização Aumentada em Tempo_real Aplicada a Indústria. In:	ESPÍNDOLA, Danúbia Bueno ; PEREIRA, Carlos Eduardo ; HENRIQUES, Renato Ventura Bayan ; BOTELHO, Silvia Silva da Costa	2010	163-168	5	67
253	TC	Uma Proposta para Visualização Aumentada em Tempo_real Aplicada a Indústria	ESPÍNDOLA, D. ; pereira, c. e. ; HENRIQUES, Renato Ventura Bayan ; BOTELHO, S. S. C.	2010	163-168	17	67
169	LP	Anais do IV Workshop- Escola de Sistemas de Agentes, seus Ambientes e apliCações	ADAMATTI, D. F. ; WERHLI, A. V. ; LUGO. G. G. ; EMMENDORFER, L. R.	2010		12	2
75	LP	Anais do Simpósio de Modelagem Computacional do Sul	ROCHA, L. A. O. (Org.) ; Botelho, S.S.C. (Org.) ; ADAMATTI, D. F. (Org.)	2009	401	6	75
240	LP	Simpósio de Modelagem Computacional do Sul	ROCHA, L. (Org.) ; BOTELHO, S. S. C. (Org.) ; D, Adamatti (Org.)	2009	401	17	75
78	CL	Detectando Padrões Comportamentais de Agentes Através de Árvores de Decisão	SILVEIRA, J. A. ; PAES, T. L. ; EMMENDORFER, L. R. ; ADAMATTI, D. F.	2010	204-208	6	78
170	CL	Detectando Padrões Comportamentais de Agentes Através de Árvores de Decisão	PAES, T. ; SILVEIRA, J. ; ADAMATTI, D. F. ; EMMENDORFER, L. R.	2010	204-208	12	78
82	TC	Poder de Captura das Árvores de Decisão para o Comportamento de Agentes	SILVEIRA, J. A. ; PAES, T. L. ; EMMENDORFER, L. R. ; ADAMATTI, D. F.	2010	1-4 - CDROM	6	82
173	TC	Poder de Captura das Árvores de Decisão para o Comportamento de Agentes	PAES, T. ; SILVEIRA, J. ; ADAMATTI, D. F. ; EMMENDORFER, L. R.	2010	1-6	12	82
85	TC	Effectiveness of Decision Trees for Detecting the Behavior of Agents	ADAMATTI, D. F. ; SILVEIRA, J. A. ; PAES, T. L. ; EMMENDORFER, L. R.	2010		6	85
174	TC	Effectiveness of Decision Trees for Detecting the Behavior of Agents	ADAMATTI, D. F. ; PAES, T. ; SILVEIRA, J. ; EMMENDORFER, L. R.	2010	1-6	12	85
100	TC	Autonomous navigation for underground energy line inspection robot	BOTELHO, S. S. C. ; ESTRADA, E. ; GONÇALVES, Eder Mateus Nunes ; OLIVEIRA, V. M.	2010	1-6	7	100
109	TC	Autonomous navigation for underground energy line inspection robot	ESTRADA, E. S. D. ; Silveira, L. ; Gonçalves, E. M. N. ; OLIVEIRA, V. M. ; BOTELHO, S. S. C.	2010	1-6	9	100
101	TC	Uma Arquitetura para Navegação Autônoma de Robôs Reais e Simulados para Inspeção de Linhas de Distribuição de Energia Subterrâneas	GONÇALVES, Eder Mateus Nunes ; ESTRADA, E. ; ALMEIDA, Renan Rosado de ; BOTELHO, S. S. C.	2009		7	101
112	TC	Uma arquitetura para navegação autônoma de robôs reais e simulados para inspeção de linhas de distribuição de energia subterrâneas	ESTRADA, E. S. D. ; ALMEIDA, R. ; BOTELHO, S. S. C. ; GULES, R. ; OLIVEIRA, V. M. ; Silveira, L. ; Gonçalves, E. M. N.	2009		9	101
102	TC	SIFT and Topologic Maps applied to robotic SLAM in Underwater Environment	DREWS JR., P. ; MEDEIROS, Mariane ; BOTELHO, S. S. C. ; GONÇALVES, Eder Mateus Nunes	2008		7	102
217	TC	SIFT and Topologic Maps applied to robotic SLAM in Underwater Environment	DREWS JR, P. L. J. ; BOTELHO, S. S. C. ; MEDEIROS, M. M. ; GONCALVES, E. M. N.	2008	1-6	15	102
114	TC	TATUBOT - Robotic System for Inspection of Undergrounded Cable System	ESTRADA, E. S. D. ; MELLO JR., C. D. ; Gonçalves, E. M. N. ; Oliveira, G. L. ; ALMEIDA, R. ; BOTELHO, S. S. C.	2008		9	64
104	TC	Mixed Reality RoboCup Category - An Overview of FURGBOL-PV Contributions	MEDEIROS, Mariane ; COLARES, Rafael Gonçalves ; ALMEIDA, Renan Rosado de ; SIMAS, G. M. ; GONÇALVES, Eder Mateus Nunes ; BOTELHO, S. S. C.	2008	3-7	7	104
279	TC	Mixed Reality RoboCup Category - An overview of FURGBOL-PV Contributions	MEDEIROS, M. M. ; COLARES, R. ; ALMEIDA, R. R. ; SIMAS, G. ; GONCALVES, E. ; BOTELHO, S. S. C.	2008	1-6	17	104
116	TC	TATUBOT ROBOTIC SYSTEM FOR INSPECTION OF UNDERGROUNDED CABLE SYSTEM	BOTELHO, S. S. C. ; Gonçalves, E. M. N. ; MELLO JR., C. D. ; ESTRADA, E. S. D. ; SOUTO JR., H. D. ; ALMEIDA, R. ; SANTOS, T. S.	2008		9	65
108	AP	Arquitetura de navegação autônoma de linhas subterrâneas de distribuição de energia	ESTRADA, E. S. D. ; Silveira, L. ; CORREA, U. B. ; OLIVEIRA, V. M. ; BOTELHO, S. S. C.	2008	32-45	9	108
237	AP	Arquitetura de navegação autônoma de linhas subterrâneas de distribuição de energia	Estrada, E. ; ALMEIDA, R. R. ; CORREA, U. B. ; OLIVEIRA, V. ; BOTELHO, S. S. C.	2008	32-45	17	108
185	TC	Autonomous navigation for underground energy line inspection robot	ESTRADA, Emanuel ; Silveira, L. ; Gonçalves, E. ; DUARTE FILHO, Nelson Lopes ; OLIVEIRA, V. ; BOTELHO, Silvia Silva	2010	1-6	13	100
110	TC	Sistema de Navegação para um Robô de Inspeção de Linhas Subterrâneas de Distribuição	ESTRADA, E. S. D. ; Silveira, L. ; OLIVEIRA, V. M. ; BOTELHO, S. S. C.	2010	2698-2705	9	110
250	TC	Sistema de Navegação para um Robô de Inspeção de Linhas Subterrâneas de Distribuição	Estrada, E. ; Silveira, L. ; OLIVEIRA, V. ; BOTELHO, S. S. C.	2010	1-6	17	110
267	TC	Uma arquitetura para navegação autônoma de robôs reais e simulados para inspeção de linhas de distribuição de energia subterrâneas	GONCALVES, E. ; Estrada, E. ; Gules, R. ; BOTELHO, S. S. C. ; Silveira, L. ; OLIVEIRA, V.	2009	1-6	17	101
113	TC	A Mobile System for Duct Inspection	BOTELHO, S. S. C. ; ESTRADA, E. S. D. ; Gonçalves, E. M. N. ; GULES, R. ; MELLO JR., C. D. ; OLIVEIRA, V. M. ; SANTOS, T. S. ; SOUTO JR., H. D. ; ALMEIDA, R.	2009		9	113
290	TC	A Mobile System for Duct Inspection	BOTELHO, S. S. C. ; Estrada, E. ; SOUTO JR., H. ; ALMEIDA, R. ; OLIVEIRA, V. M. ; Gonçalves, E. N. ; Mello Jr., C. D. ; Santos, T. ; Gules R.	2009		18	113
274	TC	Robotic System for Inspection of Undergrounded Cable System	Estrada, E. ; MELLO, C. ; GONCALVES, E. ; LEIVAS, G ; ALMEIDA, R. R. ; BOTELHO, S. S. C.	2008	1-6	17	64
187	TC	TATUBOT - Sistema Robótico de Inspeção para Linhas de Distribuição Elétrica Subterrâneas	BOTELHO, Silvia Silva ; DUARTE FILHO, Nelson Lopes ; OLIVEIRA, Vinícius Menezes de ; MELLO JR, Claudio Dornelles ; ESTRADA, Emanuel ; GALERIANO, Marcelo ; CORREA, Ulisses ; DREWS, Paulo	2008	100-105	13	63
278	TC	TATUBOT Robotic System for Inspection of Undergrounded Cable System	MELLO, C. ; GONÇALVES, L. ; Estrada, E. ; LEIVAS, G ; ALMEIDA, R. R. ; BOTELHO, S. S. C. ; THIAGO,S.	2008	1-6	17	65
165	TC	Desenvolvimento de uma Plataforma Multidisciplinar para Autoria de Jogos 3D Interativos e Educativos	PINTO, I. M. ; BOTELHO, Silvia da Costa ; SOUZA, R. C. ; GOULART, T. S. ; COLARES, R. ; CAMPOS, R. L.	2009		11	165
264	TC	DESENVOLVIMENTO DE UMA PLATAFORMA MULTIDISCIPLINAR PARA AUTORIA DE JOGOS 3D INTERATIVOS E EDUCATIVOS	PINTO, Ivete ; Sonego, T. ; Souza, R. ; COLARES, R. ; BOTELHO, S. S. C.	2009	1-6	17	165
166	TC	SABERLÂNDIA: Plataforma Lúdica integrando robótica e multimídia para educação	PINTO, I. M. ; BOTELHO, Silvia da Costa ; SOUZA, R. C. ; GOULART, T. S. ; COLARES, R. ; CAMPOS, R. L.	2008		11	166
281	TC	Saberlândia: plataforma lúdica integrando robótica e multimídia para educação	PINTO, Ivete ; BOTELHO, S. S. C. ; Souza, R. ; Sonego, T. ; COLARES, R.	2008	1-8	17	166
167	TC	Plataforma Saberlândia: Integrando Robótica e Multimídia no Desenvolvimento de Jogos Educacionais	PINTO, I. M. ; BOTELHO, Silvia da Costa ; SOUZA, R. C. ; GOULART, T. S. ; COLARES, R. ; CAMPOS, R. L.	2008		11	167
280	TC	Plataforma Saberlândia: Integrando Robótica e Multimídia no Desenvolvimento de Jogos Educacionais	PINTO, Ivete ; BOTELHO, S. S. C. ; Souza, R. ; COLARES, R. ; CAMPOS, R. L.	2008	177-186	17	167
176	AP	An immersive and collaborative visualization system for digital manufacturing	Duarte Filho, Nelson ; Costa Botelho, Silvia ; Tyska Carvalho, Jonata ; Botelho Marcos, Pedro ; Queiroz Maffei, Renan ; Remor Oliveira, Rodrigo ; Ruas Oliveira, Rodrigo ; Alves Hax, Vinicius ; DUARTE FILHO, Nelson Lopes	2010	1253-1261	13	176
226	AP	An Immersive and Collaborative Visualization Systems for Digital Manufacturing	DUARTE, N. ; BOTELHO, S. S. C. ; Tyska, j. ; P. botelho ; R. maffei ; R. Oliveira ; v. hax	2010	1	17	176
177	AP	Um Framework para Memória Compartilhada Distribuída e Eestudo de Caso em Aplicações de Geociências sobre Clusters de Computadores	VIEIRA, Jeison ; BOTELHO, Silvia Silva ; DUARTE FILHO, Nelson Lopes	2010	1-17	13	177
230	AP	Um Framework para Memória Compartilhada Distribuída e Eestudo de Caso em Aplicações de Geociências sobre Cluster de Computadores	Vieira, J. ; BOTELHO, S. S. C. ; DUARTE, N.	2010	1-6	17	177
178	AP	A general purpose cave-like system for visualization of animated and 4D cad modeling	DUARTE FILHO, Nelson Lopes ; BOTELHO, Silvia Silva ; CARVALHO, J. ; MARCOS, Pedro ; Maffei, Renan ; OLIVEIRA, Rodrigo Ruas ; HAX, V.	2008	5-19	13	178
236	AP	A general purpose cave-like system for visualization of animated and 4D cad modeling	DUARTE, N. ; BOTELHO, S. S. C. ; Tyska, j. ; P. botelho ; R. maffei ; R. Oliveira ; v. hax	2008	5-19	17	178
182	TC	SAP-RISCO4D Sistemas de Avaliação 4D para Projetos na Construção Naval	OLIVEIRA, D. P. ; BOTELHO, Silvia Silva ; DUARTE FILHO, Nelson Lopes	2010	1-6	13	182
256	TC	SAP-RISCO4D Sistemas de Avaliação 4D para Projetos na Construção Naval	Oliveira, D. P. ; BOTELHO, S. S. C. ; DUARTE, N.	2010	1-6	17	182
183	TC	Modelagem de um Sistema de Visualização 4D na Construção Naval	OLIVEIRA, D. P. ; BOTELHO, Silvia Silva ; DUARTE FILHO, Nelson Lopes	2010	1-6	13	183
255	TC	Modelagem de um Sistema de Visualização 4D na Construção Naval	Oliveira, D. P. ; BOTELHO, S. S. C. ; DUARTE, N.	2010	1-6	17	183
184	TC	SAP-RISCO4D: UM SISTEMA DE VISUALIZAÇÃO 4D PARA ACOMPANHAMENTO DE PROJETOS NA CONSTRUÇÃO NAVAL	OLIVEIRA, D. P. ; BOTELHO, Silvia Silva ; DUARTE FILHO, Nelson Lopes	2010	1-6	13	184
257	TC	SAP-RISCO4D: UM SISTEMA DE VISUALIZAÇÃO 4D PARA ACOMPANHAMENTO DE PROJETOS NA CONSTRUÇÃO NAVAL	Oliveira, D. P. ; BOTELHO, S. S. C. ; DUARTE, N.	2010	1-6	17	184
286	TC	Autonomous Navigation for Underground Energy Line Inspection Robot	Estrada, E. ; Silveira L. ; Gonçalves, E. N. ; DUARTE FILHO, N. L. ; BOTELHO, S. S. C. ; OLIVEIRA, V. M.	2010		18	100
186	TC	A Multi-Cave Visualization System for Digital Manufacturing	DUARTE FILHO, Nelson Lopes ; BOTELHO, Silvia Silva da Costa ; Tyska, J ; MARCOS, Pedro ; Maffei, Renan ; OLIVEIRA, R. R. ; OLIVEIRA, Rodrigo Ruas ; HAX, V.	2009	201-207	13	186
261	TC	A Multi-Cave Visualization System for Digital Manufacturing	DUARTE, N. ; Tyska, j. ; BOTELHO, S. S. C.	2009	1-6	17	186
215	TC	Sistema Robótico de Inspeção para Linhas de Distribuição Elétrica Subterrâneas	BOTELHO, S. S. C. ; OLIVEIRA, V. M. ; DUARTE FILHO, N. L. ; MELLO JÚNIOR, C. D. ; ESTRADA, E. D. ; GALERIANO, M. P. ; DREWS JR, P. L. J. ; CORREA, U. B.	2008	100-106	15	63
231	AP	A VISUAL SYSTEM FOR DISTRIBUTED MOSAICS USING AUV FLEETS	DREWS, P. ; BOTELHO, S. S. C.	2009	1-8	17	191
192	AP	Appearance-based odometry and mapping with feature descriptors for underwater robots	BOTELHO, S. S. C. ; DREWS JR, P. L. J. ; FIGUEIREDO, M. ; HAFFELE, C. ; OLIVEIRA, G. L.	2009	47-54	15	192
233	AP	Appearance-based odometry and mapping with feature descriptors for underwater robots	BOTELHO, S. S. C. ; DREWS, P. ; m, figueiredo ; da Rocha, C. ; LEIVAS, G	2009	47-54	17	192
199	TC	Sensor Fusion based on Multi-Self-Organizing Maps for SLAM	OLIVEIRA, G. L. ; BOTELHO, S. S. C. ; DREWS JR, P. L. J. ; FIGUEIREDO, M. ; HAFFELE, C.	2010	1-5	15	199
252	TC	Sensor Fusion based on Multi-Self-Organizing Maps for SLAM	m, figueiredo ; LEIVAS, G ; BOTELHO, S. S. C. ; DREWS, P. ; da Rocha, C.	2010	1-6	17	199
200	TC	Fusao Sensorial de Mapas Auto-Organizáveis para SLAM	OLIVEIRA, G. L. ; FIGUEIREDO, M. ; BOTELHO, S. S. C. ; DREWS JR, P. L. J. ; HAFFELE, C.	2010	1-6	15	200
247	TC	Fusão sensorial de mapas auto-organizáveis para SLAM	LEIVAS, G ; DREWS, P. ; BOTELHO, S. S. C. ; m, figueiredo ; da Rocha, C.	2010	1-6	17	200
210	TC	Localização de um Robô Subterrâneo Para Inspeção de Linhas de Transmissão	DREWS JR, P. L. J. ; BOTELHO, S. S. C. ; CAMPOS, M. F. M.	2009	1-6	15	210
265	TC	Localização de um Robô Subterrâneo Para Inspeção de Linhas de Transmissão	DREWS, P. ; BOTELHO, S. S. C. ; Campos, M.	2009	1-6	17	210
211	TC	Visual Odometry and Mapping for Underwater Autonomous Vehicles	BOTELHO, S. S. C. ; OLIVEIRA, G. L. ; DREWS JR, P. L. J. ; FIGUEIREDO, M.	2009	1-6	15	211
266	TC	Odometry and Mapping for Underwater Autonoumous Vehicles	BOTELHO, S. S. C. ; LEIVAS, G ; DREWS, P.	2009	1-6	17	211
212	TC	Visual Odometry and Mapping for Underwater Autonomous Vehicles	BOTELHO, S. S. C. ; DREWS JR, P. L. J. ; OLIVEIRA, G. L. ; FIGUEIREDO, M. ; HAFFELE, C.	2009	1-6	15	212
269	TC	Visual Odometry and Mapping for Underwater Autonomous Vehicles	BOTELHO, S. S. C. ; LEIVAS, G ; DREWS, P. ; m, figueiredo	2009	1-6	17	212
214	TC	A new approach for Visual Underwater Mapping using Topological Shell Maps	BOTELHO, S. S. C. ; OLIVEIRA, G. L. ; DREWS JR, P. L. J.	2009		15	214
263	TC	A new approach for Visual Underwater Mapping using Topological Shell Maps	LEIVAS, G ; DREWS, P. ; BOTELHO, S. S. C.	2009	1-8	17	214
270	TC	TATUBOT Sistema Robótico de Inspeção para Linhas de Distribuição Elétrica Subterrâneas	BOTELHO, S. S. C. ; OLIVEIRA, V. ; DUARTE, N. ; MELLO, C. ; Estrada, E. ; Galeriano, M. ; DREWS, P. ; CORREA, U. B.	2008	100-106	17	63
216	TC	Uma Abordagem Baseada em Visão Computacionalpara Localização e Mapeamento Simultâneos de Robôs Subaquáticos	DREWS JR, P. L. J. ; BOTELHO, S. S. C.	2008	81-90	15	216
275	TC	Uma Abordagem Baseada em Visão Computacional para Localização e Mapeamento Simultâneos de Robôs Subaquáticos	DREWS, P. ; BOTELHO, S. S. C.	2008	1-6	17	216
272	TC	SIFT and Topologic Maps applied to robotic SLAM in Underwater Environment	DREWS, P. ; MEDEIROS, M. M. ; GONCALVES, E. ; BOTELHO, S. S. C.	2008	1-6	17	102
218	TC	NLMAP - Visual-based Self Localization and Mapping for Autonomous Underwater Vehicles	DREWS JR, P. L. J. ; BOTELHO, S. S. C. ; OLIVEIRA, G. L.	2008	2050-2055	15	218
277	TC	NLMAP - Visual-based Self Localization and Mapping for Autonomous Underwater Vehicles	BOTELHO, S. S. C. ; DREWS, P. ; LEIVAS, G	2008	1-6	17	218
219	TC	Visão Computacional aplicada à Localização e Mapeamento Simultâneos de Robôs Subaquáticos	DREWS JR, P. L. J. ; BOTELHO, S. S. C.	2008	1-4	15	219
276	TC	Visão Computacional aplicada à Localização e Mapeamento Simultâneos de Robôs Subaquáticos	DREWS, P. ; BOTELHO, S. S. C.	2008	1-6	17	219
221	TC	SLAM in Underwater Environment using SIFT and Topologic Maps	DREWS JR, P. L. J. ; BOTELHO, S. S. C. ; GOMES, S. C. P.	2008	91-96	15	221
273	TC	SLAM in Underwater Environment using SIFT and Topologic Maps Accepted	DREWS, P. ; BOTELHO, S. S. C. ; GOMES, S.	2008	1-6	17	221
223	TC	3D Motion Tracking Based on Probabilistic Volumetric Reconstruction and Optical Flow	SIMAS, Gisele ; FICKEL, G. ; NOVELO, Lucas ; DE BEM, Rodrigo Andrade ; BOTELHO, Silvia Silva da Costa	2010	279-286	16	223
246	TC	3D Motion Tracking Based on Probabilistic Volumetric Reconstruction and Optical Flow	SIMAS, G. ; FICKEL, G. ; l, novello ; BEM, R. ; BOTELHO, S. S. C.	2010	1-6	17	223
224	TC	Reconstrução Probabilística 3D Aplicada à Análise de Movimento: um Enfoque na Tele-Operação	SIMAS, Gisele ; FICKEL, G. ; NOVELO, Lucas ; DE BEM, Rodrigo Andrade ; BOTELHO, Silvia Silva da Costa	2010	3800-3807	16	224
249	TC	Reconstrução Probabilística 3D Aplicada à Análise de Movimento: um Enfoque na Tele-operação	SIMAS, G. ; FICKEL, G. ; l, novello ; BEM, R. DE ; BOTELHO, S. S. C.	2010	1-6	17	224
283	AP	Arquitetura de navegação autônoma de linhas subterrâneas de distribuição de energia	Estrada, E. ; Silveira L. ; BOTELHO, S. S. C. ; OLIVEIRA, V. M.	2008	32-45	18	108
288	TC	Uma arquitetura para navegação autônoma de robôs reais e simulados para inspeção de linhas de distribuição de energia subterrâneas	Estrada, E. ; Gonçalves, E. N. ; BOTELHO, S. S. C. ; OLIVEIRA, V. M. ; ALMEIDA, R. ; Gules R. ; Silveira L.	2009		18	101
291	TC	Tatubot - Sistema Robótico de Inspeção para Linhas de Distribuição Elétrica Subterrâneas	BOTELHO, S. S. C. ; DUARTE FILHO, N. L. ; OLIVEIRA, V. M. ; Mello Jr., C. D. ; Estrada, E. ; Galeriano, M. ; LILLES, P. D. ; CORREA, U. B.	2008	100-106	18	63
292	TC	TATUBOT ROBOTIC SYSTEM FOR INSPECTION OF UNDERGROUNDED CABLE SYSTEM	BOTELHO, S. S. C. ; OLIVEIRA, V. M. ; Gonçalves, E. N. ; Estrada, E. ; Mello Jr., C. D. ; LILLES, P. D. ; ALMEIDA, R. ; SOUTO JR., H. ; Santos, T.	2008	1-6	18	64
293	TC	TATUBOT - Robotic System for Inspection of Undergrounded Cable System	BOTELHO, S. S. C. ; OLIVEIRA, V. M. ; Mello Jr., C. D. ; Gonçalves, E. N. ; Estrada, E. ; ALMEIDA, R. ; Santos, T. ; SOUTO JR., H. ; OLIVEIRA, G.	2008	1-6	18	65
\.


--
-- Data for Name: replica; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY replica (id1, id2, v_cont, f_cont) FROM stdin;
2	73	0	0
7	268	0	0
8	11	0	0
15	122	0	0
20	128	0	0
21	125	0	0
22	129	0	0
23	127	0	0
27	130	0	0
29	131	0	0
30	132	0	0
32	133	0	0
33	134	0	0
37	135	0	0
38	136	0	0
39	137	0	0
40	138	0	0
41	140	0	0
42	139	0	0
46	145	0	0
48	147	0	0
49	148	0	0
52	150	0	0
53	151	0	0
54	160	0	0
55	161	0	0
57	158	0	0
63	115	0	0
64	103	0	0
65	105	0	0
66	254	0	0
67	253	0	0
73	169	0	0
75	240	0	0
78	170	0	0
82	173	0	0
85	174	0	0
100	109	0	0
101	112	0	0
102	217	0	0
103	114	0	0
104	279	0	0
105	116	0	0
108	237	0	0
109	185	0	0
110	250	0	0
112	267	0	0
113	290	0	0
114	274	0	0
115	187	0	0
116	278	0	0
165	264	0	0
166	281	0	0
167	280	0	0
176	226	0	0
177	230	0	0
178	236	0	0
182	256	0	0
183	255	0	0
184	257	0	0
185	286	0	0
186	261	0	0
187	215	0	0
191	231	0	0
192	233	0	0
199	252	0	0
200	247	0	0
210	265	0	0
211	266	0	0
212	269	0	0
214	263	0	0
215	270	0	0
216	275	0	0
217	272	0	0
218	277	0	0
219	276	0	0
221	273	0	0
223	246	0	0
224	249	0	0
237	283	0	0
267	288	0	0
270	291	0	0
274	292	0	0
278	293	0	0
\.


--
-- Data for Name: revista; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY revista (doi, revista, volume, numero, id_publicacao) FROM stdin;
http://dx.doi.org/10.1142/S0219720008003539	Journal of Bioinformatics and Computational Biology (Print)	06		1
http://dx.doi.org/10.1080/08839514.2010.492167	Applied Artificial Intelligence	24		9
http://dx.doi.org/10.1007/978-3-642-04380-2_39	Lecture Notes in Computer Science	5773		10
	Pueblos y Fronteras Digital	6		13
	Tendências em Matemática Aplicada e Computacional	10		14
	Tendências em Matemática Aplicada e Computacional	9		15
	Revista do CCEI	12		16
	Electronic Notes in Theoretical Computer Science	210		17
	Journal of Artificial Societies and Social Simulation	12		71
	Informática Pública	10		72
	Vetor (FURG)	18		108
http://dx.doi.org/10.1016/j.ins.2009.11.035	Information Sciences	180		117
	Tendências em Matemática Aplicada e Computacional	11		118
	Revista de Informática Teórica e Aplicada (Impresso)	17		119
http://dx.doi.org/10.1016/j.entcs.2009.07.045	Electronic Notes in Theoretical Computer Science	247		120
	Tendências em Matemática Aplicada e Computacional	10		121
	Tendências em Matemática Aplicada e Computacional	9		122
	Tendências em Matemática Aplicada e Computacional	9		123
	Tendências em Matemática Aplicada e Computacional	9		124
http://dx.doi.org/10.1109/TEVC.2009.2025455	IEEE Transactions on Evolutionary Computation	13		168
http://dx.doi.org/10.1007/s00170-010-2548-z	International Journal, Advanced Manufacturing Technology	50		176
	Vetor (FURG)	20		177
	Vetor (FURG)	18		178
	Vetor (FURG)	18		190
	Sea Technology	50		191
http://dx.doi.org/10.1590/S0104-65002009000300005	Journal of the Brazilian Computer Society (Impresso)	15		192
	Revista Eletrônica de Iniciação Científica	VIII		193
http://dx.doi.org/10.1007/s00170-010-2548-z	International Journal, Advanced Manufacturing Technology	48		226
	Ciências Cognição (UFRJ)	15		227
	International Journal of Artificial Intelligence and Expert Systems (IJAE)	1		228
	Vetor (FURG)	20		229
	Vetor (FURG)	19		230
	Sea Technology	50		231
	Enseñanza de las Ciencias	Extra		232
	Journal of the Brazilian Computer Society (Impresso)	15		233
	Vetor (FURG)	19		234
http://dx.doi.org/10.1007/978-3-540-74972-1_55	Advances in Soft Computing	44		235
	Vetor (FURG)	18		236
	Vetor (FURG)	18		237
	Vetor (FURG)	20		282
	Vetor (FURG)	18		283
\.


--
-- Data for Name: revista_aceito; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY revista_aceito (doi, revista, numero, id_publicacao) FROM stdin;
	International Journal: Computational Intelligence in Bioinformatics and Systems Biology		238
\.


--
-- Name: adjacencia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY adjacencia
    ADD CONSTRAINT adjacencia_pkey PRIMARY KEY (membro1, membro2);


--
-- Name: capitulo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY capitulo
    ADD CONSTRAINT capitulo_pkey PRIMARY KEY (id_publicacao);


--
-- Name: conferencia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY conferencia
    ADD CONSTRAINT conferencia_pkey PRIMARY KEY (id_publicacao);


--
-- Name: id_membros; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY membros
    ADD CONSTRAINT id_membros PRIMARY KEY (id_membro);


--
-- Name: id_publi; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY publicacao
    ADD CONSTRAINT id_publi PRIMARY KEY (id_publicacao);


--
-- Name: livro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY livro
    ADD CONSTRAINT livro_pkey PRIMARY KEY (id_publicacao);


--
-- Name: replica_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY replica
    ADD CONSTRAINT replica_pkey PRIMARY KEY (id1, id2);


--
-- Name: revista_aceito_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY revista_aceito
    ADD CONSTRAINT revista_aceito_pkey PRIMARY KEY (id_publicacao);


--
-- Name: revista_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY revista
    ADD CONSTRAINT revista_pkey PRIMARY KEY (id_publicacao);


--
-- Name: adjacencia_membro1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY adjacencia
    ADD CONSTRAINT adjacencia_membro1_fkey FOREIGN KEY (membro1) REFERENCES membros(id_membro);


--
-- Name: adjacencia_membro2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY adjacencia
    ADD CONSTRAINT adjacencia_membro2_fkey FOREIGN KEY (membro2) REFERENCES membros(id_membro);


--
-- Name: capitulo_id_publicacao_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY capitulo
    ADD CONSTRAINT capitulo_id_publicacao_fkey FOREIGN KEY (id_publicacao) REFERENCES publicacao(id_publicacao);


--
-- Name: conferencia_id_publicacao_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY conferencia
    ADD CONSTRAINT conferencia_id_publicacao_fkey FOREIGN KEY (id_publicacao) REFERENCES publicacao(id_publicacao);


--
-- Name: livro_id_publicacao_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY livro
    ADD CONSTRAINT livro_id_publicacao_fkey FOREIGN KEY (id_publicacao) REFERENCES publicacao(id_publicacao);


--
-- Name: publicacao_autor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY publicacao
    ADD CONSTRAINT publicacao_autor_fkey FOREIGN KEY (id_membro) REFERENCES membros(id_membro);


--
-- Name: publicacao_replica_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY publicacao
    ADD CONSTRAINT publicacao_replica_fkey FOREIGN KEY (cluster) REFERENCES publicacao(id_publicacao);


--
-- Name: replica_id1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY replica
    ADD CONSTRAINT replica_id1_fkey FOREIGN KEY (id1) REFERENCES publicacao(id_publicacao);


--
-- Name: replica_id2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY replica
    ADD CONSTRAINT replica_id2_fkey FOREIGN KEY (id2) REFERENCES publicacao(id_publicacao);


--
-- Name: revista_aceito_id_publicacao_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY revista_aceito
    ADD CONSTRAINT revista_aceito_id_publicacao_fkey FOREIGN KEY (id_publicacao) REFERENCES publicacao(id_publicacao);


--
-- Name: revista_id_publicacao_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY revista
    ADD CONSTRAINT revista_id_publicacao_fkey FOREIGN KEY (id_publicacao) REFERENCES publicacao(id_publicacao);


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

