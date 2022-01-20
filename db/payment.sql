--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

-- Started on 2022-01-19 21:27:40

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
-- TOC entry 209 (class 1259 OID 16623)
-- Name: Accounts; Type: TABLE; Schema: public; Owner: postgres
--
DROP TABLE IF EXISTS public."Accounts" CASCADE;
CREATE TABLE public."Accounts" (
    "AccID" integer NOT NULL,
    "Password" character varying(255),
    "Balance" double precision NOT NULL
);


ALTER TABLE public."Accounts" OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16626)
-- Name: Transactions; Type: TABLE; Schema: public; Owner: postgres
--
DROP TABLE IF EXISTS public."Transactions" CASCADE;
CREATE TABLE public."Transactions" (
    "TraID" integer NOT NULL,
    "Money" double precision NOT NULL,
    "Date" date NOT NULL,
    "AccID" integer NOT NULL
);


ALTER TABLE public."Transactions" OWNER TO postgres;

--
-- TOC entry 3311 (class 0 OID 16623)
-- Dependencies: 209
-- Data for Name: Accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Accounts" VALUES (1003, NULL, 0);
INSERT INTO public."Accounts" VALUES (1002, '$2b$10$44rnYfO6.YBut9ztXiqxgOwT9zzMMkpBq3aYqiUBAEJmPkgdo84pe', 1314002);
INSERT INTO public."Accounts" VALUES (1000, '$2a$10$YyOImvcTmE1eHB415oSgZOi60lHtJN4uQ/2SyQVr5p5f6bsOsujwC', 0);
INSERT INTO public."Accounts" VALUES (1001, '$2b$10$NXo0tv2HCV4.6AibwxN4SOOHdsxKKRBRSUysq3bqeJuZOpfI4J3EK', 1086000);


--
-- TOC entry 3312 (class 0 OID 16626)
-- Dependencies: 210
-- Data for Name: Transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Transactions" VALUES (1000001, 1000, '2022-01-18', 1001);
INSERT INTO public."Transactions" VALUES (1000002, 4000, '2021-02-18', 1001);
INSERT INTO public."Transactions" VALUES (1000003, 2000, '2021-01-17', 1001);
INSERT INTO public."Transactions" VALUES (1000004, 3000, '2022-02-18', 1001);
INSERT INTO public."Transactions" VALUES (1000005, 5000, '2020-01-18', 1001);
INSERT INTO public."Transactions" VALUES (1000006, 1000, '2022-01-18', 1001);
INSERT INTO public."Transactions" VALUES (1000007, 2000, '2022-01-18', 1001);


--
-- TOC entry 3168 (class 2606 OID 16698)
-- Name: Accounts Accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Accounts"
    ADD CONSTRAINT "Accounts_pkey" PRIMARY KEY ("AccID");


--
-- TOC entry 3170 (class 2606 OID 16700)
-- Name: Transactions Transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Transactions"
    ADD CONSTRAINT "Transactions_pkey" PRIMARY KEY ("TraID");


--
-- TOC entry 3171 (class 2606 OID 16706)
-- Name: Transactions FK_Tra_Acc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Transactions"
    ADD CONSTRAINT "FK_Tra_Acc" FOREIGN KEY ("AccID") REFERENCES public."Accounts"("AccID") NOT VALID;


-- Completed on 2022-01-19 21:27:41

--
-- PostgreSQL database dump complete
--

