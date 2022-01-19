--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

-- Started on 2022-01-19 08:18:34

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

DROP DATABASE "covid-webapp";
--
-- TOC entry 3365 (class 1262 OID 16394)
-- Name: covid-webapp; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "covid-webapp" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Vietnamese_Vietnam.1258';


ALTER DATABASE "covid-webapp" OWNER TO postgres;

\connect -reuse-previous=on "dbname='covid-webapp'"

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
-- TOC entry 209 (class 1259 OID 16395)
-- Name: Cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Cities" (
    "f_ID" integer NOT NULL,
    "f_Name" character varying(256) NOT NULL
);


ALTER TABLE public."Cities" OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16398)
-- Name: Districts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Districts" (
    "f_ID" integer NOT NULL,
    "f_Name" character varying(256) NOT NULL,
    "f_City" integer NOT NULL
);


ALTER TABLE public."Districts" OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16401)
-- Name: Packages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Packages" (
    "f_ID" integer NOT NULL,
    "f_Products" integer[] NOT NULL,
    "f_MaxPerPerson" smallint,
    "f_MaxPerProducts" smallint[] NOT NULL,
    "f_Time" smallint NOT NULL,
    "f_Name" character varying(256) NOT NULL
);


ALTER TABLE public."Packages" OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16406)
-- Name: Packages_f_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Packages" ALTER COLUMN "f_ID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Packages_f_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 213 (class 1259 OID 16407)
-- Name: Products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Products" (
    "f_ID" integer NOT NULL,
    "f_Name" character varying(256) NOT NULL,
    "f_Price" integer NOT NULL,
    "f_Unit" character varying(10) NOT NULL,
    "f_Images" character varying[]
);


ALTER TABLE public."Products" OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16412)
-- Name: Products_f_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Products" ALTER COLUMN "f_ID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Products_f_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 215 (class 1259 OID 16413)
-- Name: QuarantineLocations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."QuarantineLocations" (
    "f_ID" integer NOT NULL,
    "f_Address" character varying,
    "f_Capacity" integer,
    "f_CurrentCapacity" integer
);


ALTER TABLE public."QuarantineLocations" OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16418)
-- Name: QuarantineLocations_f_Quarantine_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."QuarantineLocations" ALTER COLUMN "f_ID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."QuarantineLocations_f_Quarantine_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 217 (class 1259 OID 16419)
-- Name: Users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Users" (
    "f_ID" integer NOT NULL,
    "f_Username" character varying(256) NOT NULL,
    "f_Password" character varying(256) NOT NULL,
    "f_Permission" smallint NOT NULL,
    "f_Fullname" character varying(256),
    "f_NatID" character(12),
    "f_DOB" date,
    "f_Fx" smallint,
    "f_QuarantineID" integer,
    "f_Ward" integer,
    "f_RelatedID" integer[],
    "f_History" character varying[]
);


ALTER TABLE public."Users" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16424)
-- Name: Users_f_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Users" ALTER COLUMN "f_ID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Users_f_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 219 (class 1259 OID 16425)
-- Name: Wards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Wards" (
    "f_ID" integer NOT NULL,
    "f_Name" character varying NOT NULL,
    "f_District" integer NOT NULL
);


ALTER TABLE public."Wards" OWNER TO postgres;

--
-- TOC entry 3349 (class 0 OID 16395)
-- Dependencies: 209
-- Data for Name: Cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Cities" ("f_ID", "f_Name") FROM stdin;
15	Tỉnh Yên Bái
1	Thành phố Hà Nội
4	Tỉnh Cao Bằng
11	Tỉnh Điện Biên
20	Tỉnh Lạng Sơn
14	Tỉnh Sơn La
17	Tỉnh Hoà Bình
12	Tỉnh Lai Châu
8	Tỉnh Tuyên Quang
27	Tỉnh Bắc Ninh
22	Tỉnh Quảng Ninh
35	Tỉnh Hà Nam
25	Tỉnh Phú Thọ
19	Tỉnh Thái Nguyên
45	Tỉnh Quảng Trị
6	Tỉnh Bắc Kạn
33	Tỉnh Hưng Yên
40	Tỉnh Nghệ An
42	Tỉnh Hà Tĩnh
2	Tỉnh Hà Giang
24	Tỉnh Bắc Giang
30	Tỉnh Hải Dương
37	Tỉnh Ninh Bình
34	Tỉnh Thái Bình
38	Tỉnh Thanh Hóa
31	Thành phố Hải Phòng
10	Tỉnh Lào Cai
26	Tỉnh Vĩnh Phúc
46	Tỉnh Thừa Thiên Huế
48	Thành phố Đà Nẵng
49	Tỉnh Quảng Nam
36	Tỉnh Nam Định
51	Tỉnh Quảng Ngãi
44	Tỉnh Quảng Bình
52	Tỉnh Bình Định
54	Tỉnh Phú Yên
56	Tỉnh Khánh Hòa
58	Tỉnh Ninh Thuận
60	Tỉnh Bình Thuận
62	Tỉnh Kon Tum
64	Tỉnh Gia Lai
66	Tỉnh Đắk Lắk
67	Tỉnh Đắk Nông
68	Tỉnh Lâm Đồng
70	Tỉnh Bình Phước
72	Tỉnh Tây Ninh
74	Tỉnh Bình Dương
75	Tỉnh Đồng Nai
77	Tỉnh Bà Rịa - Vũng Tàu
79	Thành phố Hồ Chí Minh
80	Tỉnh Long An
82	Tỉnh Tiền Giang
83	Tỉnh Bến Tre
84	Tỉnh Trà Vinh
86	Tỉnh Vĩnh Long
87	Tỉnh Đồng Tháp
89	Tỉnh An Giang
91	Tỉnh Kiên Giang
92	Thành phố Cần Thơ
93	Tỉnh Hậu Giang
94	Tỉnh Sóc Trăng
95	Tỉnh Bạc Liêu
96	Tỉnh Cà Mau
\.


--
-- TOC entry 3350 (class 0 OID 16398)
-- Dependencies: 210
-- Data for Name: Districts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Districts" ("f_ID", "f_Name", "f_City") FROM stdin;
3	Quận Tây Hồ	1
5	Quận Cầu Giấy	1
9	Quận Thanh Xuân	1
2	Quận Hoàn Kiếm	1
1	Quận Ba Đình	1
14	Huyện Sóc Sơn	1
7	Quận Hai Bà Trưng	1
8	Quận Hoàng Mai	1
20	Thành phố Hà Giang	2
22	Huyện Đồng Văn	2
23	Huyện Mèo Vạc	2
28	Huyện Yên Minh	2
29	Huyện Quản Bạ	2
24	Huyện Vị Xuyên	2
25	Huyện Bắc Mê	2
26	Huyện Hoàng Su Phì	2
6	Quận Đống Đa	1
280	Huyện Phú Xuyên	1
272	Huyện Phúc Thọ	1
275	Huyện Quốc Oai	1
250	Huyện Mê Linh	1
4	Quận Long Biên	1
16	Huyện Thanh Trì	1
279	Huyện Thường Tín	1
18	Huyện Gia Lâm	1
271	Huyện Ba Vì	1
268	Quận Hà Đông	1
273	Huyện Đan Phượng	1
19	Quận Nam Từ Liêm	1
15	Huyện Đông Anh	1
17	Quận Bắc Từ Liêm	1
274	Huyện Hoài Đức	1
282	Huyện Mỹ Đức	1
277	Huyện Chương Mỹ	1
269	Thị xã Sơn Tây	1
276	Huyện Thạch Thất	1
278	Huyện Thanh Oai	1
281	Huyện Ứng Hòa	1
27	Huyện Xín Mần	2
32	Thành phố Cao Bằng	4
34	Huyện Bảo Lâm	4
35	Huyện Bảo Lạc	4
37	Huyện Hà Quảng	4
39	Huyện Trùng Khánh	4
48	Huyện Hạ Lang	4
49	Huyện Quảng Hòa	4
41	Huyện Hoà An	4
42	Huyện Nguyên Bình	4
43	Huyện Thạch An	4
58	Thành Phố Bắc Kạn	6
50	Huyện Ngân Sơn	6
51	Huyện Bạch Thông	6
52	Huyện Chợ Đồn	6
53	Huyện Chợ Mới	6
54	Huyện Na Rì	6
56	Thành phố Tuyên Quang	8
57	Huyện Lâm Bình	8
59	Huyện Chiêm Hóa	8
60	Huyện Hàm Yên	8
61	Huyện Yên Sơn	8
62	Huyện Sơn Dương	8
80	Thành phố Lào Cai	10
82	Huyện Bát Xát	10
83	Huyện Mường Khương	10
84	Huyện Si Ma Cai	10
85	Huyện Bắc Hà	10
86	Huyện Bảo Thắng	10
87	Huyện Bảo Yên	10
88	Thị xã Sa Pa	10
89	Huyện Văn Bàn	10
94	Thành phố Điện Biên Phủ	11
95	Thị Xã Mường Lay	11
96	Huyện Mường Nhé	11
97	Huyện Mường Chà	11
98	Huyện Tủa Chùa	11
99	Huyện Tuần Giáo	11
100	Huyện Điện Biên	11
101	Huyện Điện Biên Đông	11
102	Huyện Mường Ảng	11
103	Huyện Nậm Pồ	11
105	Thành phố Lai Châu	12
106	Huyện Tam Đường	12
107	Huyện Mường Tè	12
108	Huyện Sìn Hồ	12
109	Huyện Phong Thổ	12
110	Huyện Than Uyên	12
111	Huyện Tân Uyên	12
112	Huyện Nậm Nhùn	12
116	Thành phố Sơn La	14
118	Huyện Quỳnh Nhai	14
119	Huyện Thuận Châu	14
120	Huyện Mường La	14
121	Huyện Bắc Yên	14
122	Huyện Phù Yên	14
123	Huyện Mộc Châu	14
124	Huyện Yên Châu	14
125	Huyện Mai Sơn	14
126	Huyện Sông Mã	14
127	Huyện Sốp Cộp	14
128	Huyện Vân Hồ	14
132	Thành phố Yên Bái	15
133	Thị xã Nghĩa Lộ	15
135	Huyện Lục Yên	15
136	Huyện Văn Yên	15
137	Huyện Mù Căng Chải	15
138	Huyện Trấn Yên	15
139	Huyện Trạm Tấu	15
140	Huyện Văn Chấn	15
141	Huyện Yên Bình	15
148	Thành phố Hòa Bình	17
150	Huyện Đà Bắc	17
152	Huyện Lương Sơn	17
153	Huyện Kim Bôi	17
154	Huyện Cao Phong	17
155	Huyện Tân Lạc	17
156	Huyện Mai Châu	17
157	Huyện Lạc Sơn	17
158	Huyện Yên Thủy	17
159	Huyện Lạc Thủy	17
164	Thành phố Thái Nguyên	19
165	Thành phố Sông Công	19
167	Huyện Định Hóa	19
168	Huyện Phú Lương	19
169	Huyện Đồng Hỷ	19
170	Huyện Võ Nhai	19
181	Huyện Bình Gia	20
217	Huyện Lạng Giang	24
227	Thành phố Việt Trì	25
173	Huyện Phú Bình	19
244	Thành phố Phúc Yên	26
291	Huyện Nam Sách	30
296	Huyện Bình Giang	30
329	Huyện Ân Thi	33
336	Thành phố Thái Bình	34
372	Huyện Nho Quan	37
377	Huyện Yên Mô	37
406	Huyện Quảng Xương	38
414	Thị xã Thái Hoà	40
444	Huyện Hương Khê	42
448	Huyện Lộc Hà	42
481	Huyện A Lưới	46
491	Quận Thanh Khê	48
524	Huyện Bình Sơn	51
529	Huyện Sơn Hà	51
563	Huyện Phú Hoà	54
570	Huyện Cam Lâm	56
611	Huyện Ngọc Hồi	62
614	Huyện Kon Rẫy	62
648	Huyện Cư M'gar	66
651	Huyện Ea Kar	66
688	Thị xã Phước Long	70
691	Huyện Bù Gia Mập	70
732	Thành phố Long Khánh	75
736	Huyện Định Quán	75
774	Quận 5	79
777	Quận Bình Tân	79
820	Huyện Cai Lậy	82
823	Huyện Gò Công Tây	82
862	Huyện Trà Ôn	86
867	Thành phố Sa Đéc	87
905	Huyện Châu Thành	91
908	Huyện An Biên	91
944	Huyện Mỹ Tú	94
947	Huyện Mỹ Xuyên	94
196	Thành phố Uông Bí	22
218	Huyện Lục Nam	24
228	Thị xã Phú Thọ	25
180	Huyện Tràng Định	20
247	Huyện Tam Dương	26
290	Thành phố Chí Linh	30
305	Quận Lê Chân	31
328	Thị xã Mỹ Hào	33
344	Huyện Vũ Thư	34
370	Thành phố Tam Điệp	37
385	Huyện Quan Hóa	38
405	Huyện Đông Sơn	38
419	Huyện Nghĩa Đàn	40
443	Huyện Can Lộc	42
454	Huyện Quảng Trạch	44
480	Thị xã Hương Trà	46
497	Huyện Hòa Vang	48
522	Thành phố Quảng Ngãi	51
534	Thị xã Đức Phổ	51
562	Huyện Tây Hoà	54
575	Huyện Khánh Sơn	56
610	Huyện Đắk Glei	62
615	Huyện Đắk Hà	62
647	Huyện Buôn Đôn	66
652	Huyện M'Đrắk	66
683	Huyện Cát Tiên	68
692	Huyện Lộc Ninh	70
731	Thành phố Biên Hòa	75
737	Huyện Trảng Bom	75
773	Quận 4	79
778	Quận 7	79
819	Huyện Cái Bè	82
824	Huyện Gò Công Đông	82
861	Thị xã Bình Minh	86
868	Thành phố Hồng Ngự	87
904	Huyện Tân Hiệp	91
909	Huyện An Minh	91
943	Huyện Kế Sách	94
948	Thị xã Ngã Năm	94
199	Huyện Tiên Yên	22
219	Huyện Lục Ngạn	24
231	Huyện Hạ Hoà	25
182	Huyện Văn Lãng	20
252	Huyện Vĩnh Tường	26
293	Huyện Kim Thành	30
312	Huyện An Dương	31
332	Huyện Tiên Lữ	33
353	Huyện Lý Nhân	35
375	Huyện Yên Khánh	37
393	Huyện Vĩnh Lộc	38
412	Thành phố Vinh	40
427	Huyện Đô Lương	40
446	Huyện Cẩm Xuyên	42
465	Huyện Hướng Hóa	45
483	Huyện Nam Đông	46
508	Huyện Duy Xuyên	49
527	Huyện Sơn Tịnh	51
546	Huyện Vĩnh Thạnh	52
568	Thành phố Nha Trang	56
593	Thành phố Phan Thiết	60
622	Thành phố Pleiku	64
632	Huyện Chư Prông	64
656	Huyện Lắk	66
672	Thành phố Đà Lạt	68
696	Huyện Bù Đăng	70
711	Huyện Bến Cầu	72
741	Huyện Xuân Lộc	75
760	Quận 1	79
786	Huyện Nhà Bè	79
802	Huyện Đức Hòa	80
832	Huyện Chợ Lách	83
846	Huyện Tiểu Cần	84
872	Huyện Tháp Mười	87
888	Huyện Phú Tân	89
913	Huyện U Minh Thượng	91
927	Huyện Thới Lai	92
954	Thành phố Bạc Liêu	95
968	Huyện Trần Văn Thời	96
185	Huyện Bắc Sơn	20
220	Huyện Sơn Động	24
234	Huyện Yên Lập	25
183	Huyện Cao Lộc	20
258	Huyện Yên Phong	27
297	Huyện Gia Lộc	30
315	Huyện Tiên Lãng	31
338	Huyện Quỳnh Phụ	34
359	Huyện Vụ Bản	36
380	Thành phố Thanh Hóa	38
396	Huyện Thường Xuân	38
415	Huyện Quế Phong	40
430	Huyện Nam Đàn	40
449	Thị xã Kỳ Anh	42
468	Huyện Cam Lộ	45
492	Quận Hải Châu	48
511	Huyện Phước Sơn	49
530	Huyện Sơn Tây	51
549	Thị xã An Nhơn	52
571	Huyện Vạn Ninh	56
596	Huyện Bắc Bình	60
623	Thị xã An Khê	64
635	Huyện Ia Pa	64
657	Huyện Cư Kuin	66
675	Huyện Lạc Dương	68
697	Huyện Chơn Thành	70
719	Huyện Bàu Bàng	74
742	Huyện Nhơn Trạch	75
765	Quận Bình Thạnh	79
787	Huyện Cần Giờ	79
805	Huyện Tân Trụ	80
833	Huyện Mỏ Cày Nam	83
849	Huyện Trà Cú	84
873	Huyện Cao Lãnh	87
891	Huyện Tri Tôn	89
914	Huyện Giang Thành	91
932	Huyện Châu Thành A	93
956	Huyện Hồng Dân	95
971	Huyện Năm Căn	96
200	Huyện Đầm Hà	22
221	Huyện Yên Dũng	24
236	Huyện Tam Nông	25
184	Huyện Văn Quan	20
260	Huyện Tiên Du	27
294	Huyện Thanh Hà	30
317	Huyện Cát Hải	31
331	Huyện Kim Động	33
361	Huyện Nghĩa Hưng	36
374	Huyện Hoa Lư	37
397	Huyện Triệu Sơn	38
407	Thị xã Nghi Sơn	38
431	Huyện Hưng Nguyên	40
445	Huyện Thạch Hà	42
469	Huyện Triệu Phong	45
482	Huyện Phú Lộc	46
512	Huyện Hiệp Đức	49
525	Huyện Trà Bồng	51
550	Huyện Tuy Phước	52
564	Thị xã Đông Hòa	54
597	Huyện Hàm Thuận Bắc	60
612	Huyện Đắk Tô	62
637	Huyện Krông Pa	64
649	Huyện Krông Búk	66
676	Huyện Lâm Hà	68
689	Thành phố Đồng Xoài	70
720	Huyện Dầu Tiếng	74
734	Huyện Tân Phú	75
766	Quận Tân Bình	79
775	Quận 6	79
806	Huyện Cần Đước	80
821	Huyện Châu Thành	82
850	Huyện Duyên Hải	84
863	Huyện Bình Tân	86
892	Huyện Châu Thành	89
906	Huyện Giồng Riềng	91
933	Huyện Châu Thành	93
945	Huyện Cù Lao Dung	94
972	Huyện Phú Tân	96
201	Huyện Hải Hà	22
222	Huyện Việt Yên	24
239	Huyện Thanh Thuỷ	25
186	Huyện Hữu Lũng	20
263	Huyện Gia Bình	27
295	Huyện Cẩm Giàng	30
325	Huyện Văn Lâm	33
330	Huyện Khoái Châu	33
365	Huyện Giao Thủy	36
373	Huyện Gia Viễn	37
398	Huyện Thiệu Hóa	38
402	Huyện Như Xuân	38
432	Thị xã Hoàng Mai	40
440	Huyện Đức Thọ	42
470	Huyện Hải Lăng	45
477	Huyện Quảng Điền	46
513	Huyện Thăng Bình	49
517	Huyện Núi Thành	49
551	Huyện Vân Canh	52
559	Huyện Tuy An	54
598	Huyện Hàm Thuận Nam	60
601	Huyện Hàm Tân	60
638	Huyện Phú Thiện	64
644	Thị Xã Buôn Hồ	66
677	Huyện Đơn Dương	68
680	Huyện Bảo Lâm	68
721	Thị xã Bến Cát	74
724	Thành phố Dĩ An	74
767	Quận Tân Phú	79
770	Quận 3	79
807	Huyện Cần Giuộc	80
816	Thị xã Gò Công	82
851	Thị xã Duyên Hải	84
858	Huyện Mang Thít	86
893	Huyện Chợ Mới	89
900	Thành phố Hà Tiên	91
934	Huyện Phụng Hiệp	93
937	Thị xã Long Mỹ	93
973	Huyện Ngọc Hiển	96
205	Thị xã Đông Triều	22
223	Huyện Hiệp Hòa	24
240	Huyện Tân Sơn	25
187	Huyện Chi Lăng	20
264	Huyện Lương Tài	27
299	Huyện Ninh Giang	30
326	Huyện Văn Giang	33
341	Huyện Thái Thụy	34
366	Huyện Hải Hậu	36
384	Huyện Mường Lát	38
403	Huyện Như Thanh	38
418	Huyện Tương Dương	40
441	Huyện Vũ Quang	42
453	Huyện Tuyên Hóa	44
478	Huyện Phú Vang	46
495	Quận Cẩm Lệ	48
518	Huyện Phú Ninh	49
533	Huyện Mộ Đức	51
560	Huyện Sơn Hòa	54
574	Huyện Diên Khánh	56
602	Huyện Phú Quí	60
613	Huyện Kon Plông	62
645	Huyện Ea H'leo	66
650	Huyện Krông Năng	66
681	Huyện Đạ Huoai	68
690	Thị xã Bình Long	70
725	Thành phố Thuận An	74
735	Huyện Vĩnh Cửu	75
771	Quận 10	79
776	Quận 8	79
817	Thị xã Cai Lậy	82
822	Huyện Chợ Gạo	82
859	Huyện  Vũng Liêm	86
866	Thành phố Cao Lãnh	87
902	Huyện Kiên Lương	91
907	Huyện Gò Quao	91
941	Thành phố Sóc Trăng	94
946	Huyện Long Phú	94
213	Thành phố Bắc Giang	24
230	Huyện Đoan Hùng	25
188	Huyện Lộc Bình	20
248	Huyện Tam Đảo	26
298	Huyện Tứ Kỳ	30
306	Quận Hải An	31
339	Huyện Hưng Hà	34
347	Thành phố Phủ Lý	35
381	Thị xã Bỉm Sơn	38
388	Huyện Lang Chánh	38
416	Huyện Quỳ Châu	40
422	Huyện Con Cuông	40
450	Thành Phố Đồng Hới	44
457	Huyện Lệ Thủy	44
493	Quận Sơn Trà	48
503	Thành phố Hội An	49
531	Huyện Minh Long	51
540	Thành phố Quy Nhơn	52
572	Thị xã Ninh Hòa	56
585	Huyện Ninh Sơn	58
616	Huyện Sa Thầy	62
627	Huyện Chư Păh	64
653	Huyện Krông Bông	66
663	Huyện Đắk Mil	67
693	Huyện Bù Đốp	70
706	Huyện Tân Châu	72
738	Huyện Thống Nhất	75
751	Huyện Xuyên Mộc	77
783	Huyện Củ Chi	79
797	Huyện Vĩnh Hưng	80
825	Huyện Tân Phú Đông	82
837	Huyện Thạnh Phú	83
869	Huyện Tân Hồng	87
877	Huyện Châu Thành	87
910	Huyện Vĩnh Thuận	91
919	Quận Cái Răng	92
949	Huyện Thạnh Trị	94
960	Huyện Đông Hải	95
216	Huyện Tân Yên	24
232	Huyện Thanh Ba	25
178	Thành phố Lạng Sơn	20
253	Huyện Sông Lô	26
304	Quận Ngô Quyền	31
313	Huyện An Lão	31
343	Huyện Kiến Xương	34
356	Thành phố Nam Định	36
386	Huyện Bá Thước	38
394	Huyện Yên Định	38
420	Huyện Quỳ Hợp	40
428	Huyện Thanh Chương	40
455	Huyện Bố Trạch	44
466	Huyện Gio Linh	45
498	Huyện Hoàng Sa	48
509	Huyện Quế Sơn	49
535	Huyện Ba Tơ	51
547	Huyện Tây Sơn	52
576	Huyện Trường Sa	56
594	Thị xã La Gi	60
624	Thị xã Ayun Pa	64
633	Huyện Chư Sê	64
660	Thành phố Gia Nghĩa	67
673	Thành phố Bảo Lộc	68
698	Huyện Phú Riềng	70
712	Thị xã Trảng Bàng	72
747	Thành phố Vũng Tàu	77
761	Quận 12	79
794	Thành phố Tân An	80
803	Huyện Bến Lức	80
834	Huyện Giồng Trôm	83
847	Huyện Châu Thành	84
874	Huyện Thanh Bình	87
889	Huyện Châu Phú	89
916	Quận Ninh Kiều	92
930	Thành phố Vị Thanh	93
957	Huyện Phước Long	95
969	Huyện Cái Nước	96
198	Huyện Bình Liêu	22
235	Huyện Cẩm Khê	25
193	Thành phố Hạ Long	22
259	Huyện Quế Võ	27
303	Quận Hồng Bàng	31
316	Huyện Vĩnh Bảo	31
340	Huyện Đông Hưng	34
360	Huyện Ý Yên	36
363	Huyện Trực Ninh	36
382	Thành phố Sầm Sơn	38
400	Huyện Hậu Lộc	38
417	Huyện Kỳ Sơn	40
437	Thị xã Hồng Lĩnh	42
452	Huyện Minh Hóa	44
474	Thành phố Huế	46
494	Quận Ngũ Hành Sơn	48
515	Huyện Bắc Trà My	49
532	Huyện Nghĩa Hành	51
557	Thị xã Sông Cầu	54
573	Huyện Khánh Vĩnh	56
600	Huyện Đức Linh	60
618	Huyện Ia H' Drai	62
643	Thành phố Buôn Ma Thuột	66
655	Huyện Krông A Na	66
679	Huyện Di Linh	68
695	Huyện Đồng Phú	70
723	Thị xã Tân Uyên	74
740	Huyện Long Thành	75
769	Thành phố Thủ Đức	79
785	Huyện Bình Chánh	79
815	Thành phố Mỹ Tho	82
831	Huyện Châu Thành	83
857	Huyện Long Hồ	86
871	Huyện Tam Nông	87
899	Thành phố Rạch Giá	91
912	Huyện Kiên Hải	91
936	Huyện Long Mỹ	93
951	Huyện Trần Đề	94
194	Thành phố Móng Cái	22
233	Huyện Phù Ninh	25
172	Thị xã Phổ Yên	19
256	Thành phố Bắc Ninh	27
308	Quận Đồ Sơn	31
314	Huyện Kiến Thuỵ	31
350	Huyện Kim Bảng	35
358	Huyện Mỹ Lộc	36
390	Huyện Cẩm Thủy	38
395	Huyện Thọ Xuân	38
424	Huyện Anh Sơn	40
429	Huyện Nghi Lộc	40
461	Thành phố Đông Hà	45
467	Huyện Đa Krông	45
505	Huyện Đông Giang	49
510	Huyện Nam Giang	49
543	Thị xã Hoài Nhơn	52
548	Huyện Phù Cát	52
587	Huyện Ninh Phước	58
595	Huyện Tuy Phong	60
629	Huyện Mang Yang	64
634	Huyện Đăk Pơ	64
665	Huyện Đắk Song	67
674	Huyện Đam Rông	68
708	Huyện Châu Thành	72
718	Thành phố Thủ Dầu Một	74
753	Huyện Đất Đỏ	77
764	Quận Gò Vấp	79
799	Huyện Tân Thạnh	80
804	Huyện Thủ Thừa	80
842	Thành phố Trà Vinh	84
848	Huyện Cầu Ngang	84
884	Thành phố Châu Đốc	89
890	Huyện Tịnh Biên	89
924	Huyện Vĩnh Thạnh	92
931	Thành phố Ngã Bảy	93
964	Thành phố Cà Mau	96
970	Huyện Đầm Dơi	96
206	Thị xã Quảng Yên	22
237	Huyện Lâm Thao	25
189	Huyện Đình Lập	20
261	Thị xã Từ Sơn	27
307	Quận Kiến An	31
318	Huyện Bạch Long Vĩ	31
349	Thị xã Duy Tiên	35
362	Huyện Nam Trực	36
389	Huyện Ngọc Lặc	38
399	Huyện Hoằng Hóa	38
423	Huyện Tân Kỳ	40
436	Thành phố Hà Tĩnh	42
458	Thị xã Ba Đồn	44
471	Huyện Cồn Cỏ	45
504	Huyện Tây Giang	49
514	Huyện Tiên Phước	49
542	Huyện An Lão	52
555	Thành phố Tuy Hoà	54
586	Huyện Ninh Hải	58
599	Huyện Tánh Linh	60
625	Huyện KBang	64
639	Huyện Chư Pưh	64
661	Huyện Đăk Glong	67
678	Huyện Đức Trọng	68
703	Thành phố Tây Ninh	72
722	Huyện Phú Giáo	74
748	Thành phố Bà Rịa	77
768	Quận Phú Nhuận	79
795	Thị xã Kiến Tường	80
808	Huyện Châu Thành	80
835	Huyện Bình Đại	83
855	Thành phố Vĩnh Long	86
875	Huyện Lấp Vò	87
894	Huyện Thoại Sơn	89
917	Quận Ô Môn	92
935	Huyện Vị Thuỷ	93
958	Huyện Vĩnh Lợi	95
195	Thành phố Cẩm Phả	22
238	Huyện Thanh Sơn	25
262	Huyện Thuận Thành	27
323	Thành phố Hưng Yên	33
364	Huyện Xuân Trường	36
401	Huyện Nga Sơn	38
439	Huyện Hương Sơn	42
476	Huyện Phong Điền	46
516	Huyện Nam Trà My	49
558	Huyện Đồng Xuân	54
584	Huyện Bác Ái	58
626	Huyện Đăk Đoa	64
662	Huyện Cư Jút	67
705	Huyện Tân Biên	72
750	Huyện Châu Đức	77
796	Huyện Tân Hưng	80
836	Huyện Ba Tri	83
876	Huyện Lai Vung	87
918	Quận Bình Thuỷ	92
959	Thị xã Giá Rai	95
203	Huyện Vân Đồn	22
243	Thành phố Vĩnh Yên	26
292	Thị xã Kinh Môn	30
333	Huyện Phù Cừ	33
376	Huyện Kim Sơn	37
413	Thị xã Cửa Lò	40
447	Huyện Kỳ Anh	42
490	Quận Liên Chiểu	48
528	Huyện Tư Nghĩa	51
569	Thành phố Cam Ranh	56
617	Huyện Tu Mơ Rông	62
654	Huyện Krông Pắc	66
694	Huyện Hớn Quản	70
739	Huyện Cẩm Mỹ	75
784	Huyện Hóc Môn	79
829	Thành phố Bến Tre	83
870	Huyện Hồng Ngự	87
911	Thành phố Phú Quốc	91
950	Thị xã Vĩnh Châu	94
215	Huyện Yên Thế	24
246	Huyện Lập Thạch	26
300	Huyện Thanh Miện	30
342	Huyện Tiền Hải	34
387	Huyện Quan Sơn	38
421	Huyện Quỳnh Lưu	40
456	Huyện Quảng Ninh	44
502	Thành phố Tam Kỳ	49
536	Huyện Lý Sơn	51
582	Thành phố Phan Rang-Tháp Chàm	58
628	Huyện Ia Grai	64
664	Huyện Krông Nô	67
707	Huyện Dương Minh Châu	72
752	Huyện Long Điền	77
798	Huyện Mộc Hóa	80
838	Huyện Mỏ Cày Bắc	83
883	Thành phố Long Xuyên	89
923	Quận Thốt Nốt	92
961	Huyện Hoà Bình	95
207	Huyện Cô Tô	22
249	Huyện Bình Xuyên	26
309	Quận Dương Kinh	31
351	Huyện Thanh Liêm	35
391	Huyện Thạch Thành	38
425	Huyện Diễn Châu	40
462	Thị xã Quảng Trị	45
506	Huyện Đại Lộc	49
544	Huyện Hoài Ân	52
588	Huyện Thuận Bắc	58
630	Huyện Kông Chro	64
666	Huyện Đắk R'Lấp	67
709	Thị xã Hòa Thành	72
754	Thị xã Phú Mỹ	77
800	Huyện Thạnh Hóa	80
844	Huyện Càng Long	84
886	Huyện An Phú	89
925	Huyện Cờ Đỏ	92
966	Huyện U Minh	96
202	Huyện Ba Chẽ	22
251	Huyện Yên Lạc	26
311	Huyện Thuỷ Nguyên	31
352	Huyện Bình Lục	35
392	Huyện Hà Trung	38
426	Huyện Yên Thành	40
464	Huyện Vĩnh Linh	45
507	Thị xã Điện Bàn	49
545	Huyện Phù Mỹ	52
589	Huyện Thuận Nam	58
631	Huyện Đức Cơ	64
667	Huyện Tuy Đức	67
710	Huyện Gò Dầu	72
755	Huyện Côn Đảo	77
801	Huyện Đức Huệ	80
845	Huyện Cầu Kè	84
887	Thị xã Tân Châu	89
926	Huyện Phong Điền	92
967	Huyện Thới Bình	96
171	Huyện Đại Từ	19
288	Thành phố Hải Dương	30
327	Huyện Yên Mỹ	33
369	Thành phố Ninh Bình	37
404	Huyện Nông Cống	38
442	Huyện Nghi Xuân	42
479	Thị xã Hương Thủy	46
519	Huyện Nông Sơn	49
561	Huyện Sông Hinh	54
608	Thành phố Kon Tum	62
646	Huyện Ea Súp	66
682	Huyện Đạ Tẻh	68
726	Huyện Bắc Tân Uyên	74
772	Quận 11	79
818	Huyện Tân Phước	82
860	Huyện Tam Bình	86
903	Huyện Hòn Đất	91
942	Huyện Châu Thành	94
\.


--
-- TOC entry 3351 (class 0 OID 16401)
-- Dependencies: 211
-- Data for Name: Packages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Packages" ("f_ID", "f_Products", "f_MaxPerPerson", "f_MaxPerProducts", "f_Time", "f_Name") FROM stdin;
3	{1,2}	3	{1,1}	7	Gói A
4	{3,4,5}	2	{1,1,1}	14	Gói B
\.


--
-- TOC entry 3353 (class 0 OID 16407)
-- Dependencies: 213
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Products" ("f_ID", "f_Name", "f_Price", "f_Unit", "f_Images") FROM stdin;
3	Bánh mì tiện lợi	6000	1000	\N
4	Mì kokomi	3000	2000	\N
6	Bánh ngọt	7000	500	\N
1	Sữa vinamilk	10000	2	{https://product.hstatic.net/1000074072/product/sua-bich-vinamilk-co-duong-b_eeaab361818e4c66ac34ee6c4e03193f.jpg,https://www.sieuthianhduong.com/upload/files/sua-tuoi4.jpg}
2	Socola	5000	10	{https://cdn.tgdd.vn/Files/2020/04/28/1252335/cach-lam-socola-nhan-ruou-rhum-tan-chay-don-gian-n-4-760x367.jpg}
5	Nước uống đóng chai Lavie	5000	2000	{https://www.laviewater.com/wp-content/uploads/2016/08/350ml-blue-2-1.png,https://cf.shopee.vn/file/519091a7b86cf414f5c8a09a92a8bf5f}
7	Lương khô	4000	30	\N
\.


--
-- TOC entry 3355 (class 0 OID 16413)
-- Dependencies: 215
-- Data for Name: QuarantineLocations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."QuarantineLocations" ("f_ID", "f_Address", "f_Capacity", "f_CurrentCapacity") FROM stdin;
2	Trung tam y te Quang Ngai	50	500
3	Ký túc xá khu B ĐHQG, Tô Vĩnh Diện, Đông Hòa, Dĩ An, Thủ Đức	2000	500
1	Bệnh viện Đa khoa khu vực Phúc Yên, Vĩnh Phúc	10	100
4	Phòng Y tế Quận 2	1677	218
6	Phòng Y tế Quận 7	756	395
5	Phòng Y tế Quận 3	2092	931
7	Phòng Y tế Quận 1 	849	80
8	Phòng Y tế Quận 10	2187	498
9	Phòng Y tế Quận 5	2036	253
10	Phòng Y tế Quận 11	1539	700
11	Phòng Y tế Quận 4	1229	418
12	Phòng Y tế Quận 6	1357	88
13	Phòng Y tế Huyện Cần Giờ 	1311	695
14	Phòng Y tế Quận Bình Thạnh 	2732	820
15	Phòng Y tế Huyện Củ Chi	1307	480
16	Phòng Y tế Quận Gò Vấp	1422	121
17	Phòng Y tế Quận 12	1142	517
18	Phòng Y tế Quận 8	1385	900
19	Phòng Y tế Huyện Nhà Bè 	2442	713
20	Phòng Y tế Huyện Hóc Môn	2073	321
21	Bệnh viện Đa khoa khu vực Hóc Môn	1941	165
22	Phòng Y tế Quận Phú Nhuận	2440	759
23	Phòng Y tế Quận 9	1093	238
24	Bệnh viện An Bình	2533	959
25	Phòng Y tế Quận Tân Bình 	1981	496
26	Bệnh viện Cấp cứu Trưng Vương	2066	550
27	Bệnh viện Đa khoa khu vực Thủ Đức	1899	772
28	Bệnh viện Nhân dân 115	475	396
29	Phòng Y tế Huyện Bình Chánh 	2714	916
35	Bệnh viện Nhân dân Gia Định	1185	192
32	Phòng Y tế Quận Bình Tân 	1894	596
30	Phòng Y tế Quận Thủ Đức 	1345	267
33	Bệnh viện Đa khoa khu vực Củ Chi	1660	348
36	Bệnh viện Nguyễn Trãi	1145	943
34	Phòng Y tế Quận Tân Phú 	1725	733
37	Bệnh viện Nguyễn Tri Phương	2104	984
31	Bệnh viện Đa Khoa Sài Gòn	1369	440
38	Bệnh viện Bệnh Nhiệt Đới	2476	505
39	Bệnh viện Bình Dân	1623	331
40	Bệnh viện Chấn thương Chỉnh hình	2084	452
41	Bệnh viện Da Liễu	899	337
42	Bệnh viện Phục hồi chức năng và Điều trị bệnh nghề nghiệp	739	663
43	Bệnh viện Hùng Vương	1844	983
44	Bệnh viện Mắt	2001	182
45	Bệnh viện Nhân Ái	2435	572
46	Bệnh viện Nhi Đồng 1	658	276
47	Bệnh viện Nhi Đồng 2	1017	630
48	Bệnh viện Nhi Đồng Thành phố	2170	875
49	Bệnh viện Phạm Ngọc Thạch	2260	589
50	Bệnh viện Răng Hàm Mặt	1087	748
51	Bệnh viện Tâm Thần	1438	673
52	Bệnh viện Tai Mũi Họng	2692	847
53	Bệnh viện Từ Dũ	1216	64
54	Bệnh viện Truyền máu Huyết học	1598	975
55	Bệnh viện Ung Bướu	546	368
56	Bệnh viện Y học Cổ truyền	1541	212
57	Khu Điều trị Phong Bến Sắn	2391	570
58	Viện Tim	1893	403
59	Viện Y dược học Dân tộc	2004	398
60	Bệnh viện Quận 1	1198	888
61	Bệnh viện Quận 2	2318	568
62	Bệnh viện Quận 3	1351	410
63	Bệnh viện Quận 4	1774	949
64	Bệnh viện Quận 5	978	259
65	Bệnh viện Quận 6	1022	419
66	Bệnh viện Quận 7	2254	907
67	Bệnh viện Quận 8	906	177
68	Bệnh viện Quận 9	1746	144
69	Bệnh viện Quận 10	1807	265
70	Bệnh viện Quận 11	1567	662
71	Bệnh viện Quận 12	1099	456
72	Bệnh viện Huyện Bình Chánh	2053	400
73	Bệnh viện Quận Bình Tân	2165	336
74	Bệnh viện Quận Bình Thạnh	2862	965
75	Bệnh viện Huyện Cần Giờ	914	102
76	Bệnh viện Huyện Củ Chi	2172	249
77	Bệnh viện Quận Gò Vấp	814	349
78	Bệnh viện Huyện Nhà Bè	610	62
79	Bệnh viện Quận Phú Nhuận	1463	818
80	Bệnh viện QuậnTân Bình	1789	736
81	Bệnh viện Quận Tân Phú	1409	617
82	Bệnh viện Quận Thủ Đức	1373	539
83	Bệnh viện An Sinh	1300	627
84	Bệnh viện Chấn thương chỉnh hình Sài Gòn - ITO	931	597
85	Bệnh viện Đa khoa Fortis - Hoàn Mỹ Sài Gòn	461	192
86	Bệnh viện Đa khoa Mắt Sài Gòn	1768	993
87	Bệnh viện Hồng Đức III	2665	756
88	Bệnh viện Đức Khang	786	508
89	Bệnh viện Gaya Việt Hàn	2162	935
90	Bệnh viện Mắt Cao Thắng	2182	982
91	Bệnh viện Mắt Sài Gòn II	1052	676
92	Bệnh viện Mắt Việt - Hàn	1273	511
93	Bệnh viện Chuyên khoa Ngoại Minh Anh	755	691
94	Bệnh viện Mỹ Đức	1345	417
95	Bệnh viện Ngoại khoa và Chấn thương chỉnh hình Phương Đông	1780	383
96	Bệnh viện Ngoại thần Kinh Quốc tế	1381	827
97	Bệnh viện Ngọc Linh	1995	327
98	Bệnh viện Việt Pháp ( FV. Hospital )	655	407
99	Bệnh viện Phụ Sản Mekong	1586	764
100	Bệnh viện Phụ Sản Quốc Tế	2356	940
117	Bệnh viện Giải phẩu thẩm mỹ Sài Gòn	1559	239
131	Trung tâm Bảo vệ Sức khoẻ lao động và Môi trường	1131	409
144	Trung tâm Y tế dự phòng Quận 4	1061	930
104	Bệnh viện Tai Mũi Họng Sài Gòn	1604	850
160	Trung tâm Y tế dự phòng Huyện Nhà Bè 	2389	445
173	Trạm Y tế Phường Tân Định	1774	618
190	Trạm Y tế Phường 6	2083	91
203	Trạm Y tế Phường 5	1060	143
220	Trạm Y tế Phường 7	1891	94
233	Trạm Y tế Phường 5	1194	81
250	Trạm Y tế Phường Tân Quy	1188	478
263	Trạm Y tế Phường 11	1105	378
280	Trạm Y tế Phường Tăng Nhơn Phú B	325	175
293	Trạm Y tế Phường 12	1099	977
310	Trạm Y tế Phường 14	1360	986
323	Trạm Y tế Phường Tân Hưng Thuận	2341	596
340	Trạm Y tế Phường Bình Trị Đông	1973	437
353	Trạm Y tế Xã Bình Mỹ	1843	915
370	Trạm Y tế Xã Trung Lập Thượng	795	130
383	Trạm Y tế Phường 14	1620	782
400	Trạm Y tế Phường 8	828	136
413	Trạm Y tế Phường 5	1148	738
430	Trạm Y tế Phường Phú Thạnh	1318	288
442	Trạm Y tế Phường 12	1407	761
460	Trạm Y tế Xã Tân Xuân	2050	284
472	Trạm Y tế Phường Linh Đông	1156	607
118	Bệnh viện Giải phẩu thẩm mỹ Thanh Vân	2053	247
132	Trung tâm Chăm sóc sức khỏe sinh sản	2105	948
143	Trung tâm Y tế dự phòng Quận 3	1053	941
105	Bệnh viện Tân Sơn Nhất	1223	567
159	Trung tâm Y tế dự phòng Huyện Hóc Môn	561	191
172	Trạm Y tế Phường Phạm Ngũ Lão	2979	986
189	Trạm Y tế Phường 5	2365	729
202	Trạm Y tế Phường 4	2261	467
219	Trạm Y tế Phường 6	789	525
232	Trạm Y tế Phường 4	288	227
249	Trạm Y tế Phường Tân Phú	2843	858
262	Trạm Y tế Phường 10	2580	678
279	Trạm Y tế Phường Tăng Nhơn Phú A	2491	508
292	Trạm Y tế Phường 11	1741	799
309	Trạm Y tế Phường 13	366	272
322	Trạm Y tế Phường Thạnh Lộc	2416	425
339	Trạm Y tế Xã Vĩnh Lộc B	2524	766
352	Trạm Y tế Xã An Phú	1594	506
369	Trạm Y tế Xã Trung Lập Hạ	472	154
382	Trạm Y tế Phường 13	2125	312
399	Trạm Y tế Phường 7	184	87
412	Trạm Y tế Phường 4	926	607
429	Trạm Y tế Phường Phú Thọ Hòa	747	300
443	Trạm Y tế Phường 13	1410	50
459	Trạm Y tế Xã Xuân Thới Sơn	2667	696
473	Trạm Y tế Phường Linh Tây	2414	604
115	Bệnh viện Đa khoa Tân Hưng	1574	301
133	Trung tâm Dinh Dưỡng	2401	862
147	Trung tâm Y tế dự phòng Quận 7	1312	68
107	Bệnh viện Triều An	1071	583
163	Trung tâm Y tế dự phòng Quận Tân Phú 	2756	911
176	Trạm Y tế Phường An Khánh	752	550
193	Trạm Y tế Phường 9	2259	264
206	Trạm Y tế Phường 9	2121	126
223	Trạm Y tế Phường 10	936	431
236	Trạm Y tế Phường 8	1129	184
253	Trạm Y tế Phường 1	1269	186
266	Trạm Y tế Phường 14	2024	163
283	Trạm Y tế Phường 2	2144	464
296	Trạm Y tế Phường 15	1516	855
313	Trạm Y tế Phường An Phú Đông	2131	395
326	Trạm Y tế Xã Bình Chánh	1061	565
343	Trạm Y tế Phường Tân Tạo	1911	975
356	Trạm Y tế Xã Phạm Văn Cội	560	63
373	Trạm Y tế Phường 4	834	227
386	Trạm Y tế Phường 17	527	338
403	Trạm Y tế Phường 11	763	574
416	Trạm Y tế Phường 8	1071	94
433	Trạm Y tế Phường Hiệp Tân	1165	778
446	Trạm Y tế Phường 17	2317	380
463	Trạm Y tế Xã Đông Thạnh	2002	439
476	Trạm Y tế Phường Tam Bình	1231	869
120	Bệnh viện Phẫu thuật tạo hình thẩm mỹ AVA Văn Lang	1479	798
134	Trung tâm Giám định Y khoa	716	186
146	Trung tâm Y tế dự phòng Quận 6	2486	747
108	Bệnh viện Vạn Hạnh	268	133
162	Trung tâm Y tế dự phòng Quận Tân Bình 	1670	368
175	Trạm Y tế Liên Phường Bình An - Bình Khánh	2133	202
192	Trạm Y tế Phường 8	783	53
205	Trạm Y tế Phường 8	2385	591
222	Trạm Y tế Phường 9	1117	777
235	Trạm Y tế Phường 7	1999	920
252	Trạm Y tế Phường Tân Thuận Tây	829	550
265	Trạm Y tế Phường 13	2345	837
282	Trạm Y tế Phường 1	1992	991
295	Trạm Y tế Phường 14	1442	762
312	Trạm Y tế Phường 16	1693	816
325	Trạm Y tế Xã An Phú Tây	2425	543
342	Trạm Y tế Phường Bình Trị Đông B	1916	859
355	Trạm Y tế Xã Nhuận Đức	1707	107
372	Trạm Y tế Phường 3	1329	597
385	Trạm Y tế Phường 16	1504	796
402	Trạm Y tế Phường 10	1729	135
415	Trạm Y tế Phường 7	766	523
432	Trạm Y tế Phường Hòa Thạnh	2084	573
440	Trạm Y tế Phường 7	1777	696
462	Trạm Y tế Xã Bà Điểm	2324	781
470	Trạm Y tế Phường Hiệp Bình Chánh	1706	186
116	Bệnh viện Đa khoa Quốc tế Vinmec Central Park 	2180	594
135	Trung tâm Kiểm chuẩn Xét nghiệm	479	169
149	Trung tâm Y tế dự phòng Quận 9	1381	461
109	Bệnh viện Vũ Anh	357	174
165	Trạm Y tế Phường Bến Nghé	2036	259
179	Trạm Y tế Phường Bình Trưng Đông	2677	964
195	Trạm Y tế Phường 11	2778	901
209	Trạm Y tế Phường 13	1492	67
225	Trạm Y tế Phường 12	1487	115
239	Trạm Y tế Phường 11	2249	999
255	Trạm Y tế Phường 3	1329	578
269	Trạm Y tế Phường Hiệp Phú	1300	388
285	Trạm Y tế Phường 4	2098	401
299	Trạm Y tế Phường 3	1504	277
315	Trạm Y tế Phường Hiệp Thành	464	102
329	Trạm Y tế Xã Đa Phước	2064	387
345	Trạm Y tế Phường Bình Hưng Hoà	2348	898
359	Trạm Y tế Xã Phước Hiệp	2128	438
375	Trạm Y tế Phường 6	444	218
389	Trạm Y tế Xã Long Thới	320	59
405	Trạm Y tế Phường 13	2449	765
419	Trạm Y tế Phường 11	906	335
435	Trạm Y tế Phường 1	836	286
449	Trạm Y tế Phường 22	1708	948
465	Trạm Y tế Xã Xuân Thới Đông	2601	641
479	Trạm Y tế Xã An Thới Đông	1735	539
122	Bệnh viện Thẩm mỹ EMCAS	1715	929
136	Trung tâm Kiểm dịch Y tế Quốc tế	1344	950
151	Trung tâm Y tế dự phòng Quận 11	2664	923
102	Bệnh viện Quốc tế Columbia Asia Gia Định	1036	497
167	Trạm Y tế Phường Cầu ông Lãnh	2614	655
178	Trạm Y tế Phường An Phú	1249	152
197	Trạm Y tế Phường 13	1567	927
208	Trạm Y tế Phường 12	639	120
227	Trạm Y tế Phường 14	1055	556
238	Trạm Y tế Phường 10	742	237
257	Trạm Y tế Phường 5	1588	766
268	Trạm Y tế Phường 16	1814	621
287	Trạm Y tế Phường 6	418	273
298	Trạm Y tế Phường 2	2788	989
317	Trạm Y tế Phường Tân Thới Nhất	1384	880
328	Trạm Y tế Xã Bình Lợi	1696	132
347	Trạm Y tế Phường Bình Hưng Hoà B	2082	588
358	Trạm Y tế Xã Phú Mỹ Hưng	1761	56
377	Trạm Y tế Phường 8	1227	991
388	Trạm Y tế Xã Hiệp Phước	1528	872
407	Trạm Y tế Phường 15	1682	52
418	Trạm Y tế Phường 10	1085	659
437	Trạm Y tế Phường 3	2829	845
448	Trạm Y tế Phường 21	1315	251
467	Trạm Y tế Phường Bình Chiểu	650	100
478	Trạm Y tế Phường Trường Thọ	652	218
124	Bệnh viện Thẩm mỹ Kangnam 	510	282
137	Trung tâm Kiểm nghiệm Thuốc, Mỹ phẩm, Thực phẩm	1109	692
153	Trung tâm Y tế dự phòng Huyện Bình Chánh 	625	419
111	Bệnh viện Quốc tế Phúc An Khang	839	184
169	Trạm Y tế Phường Đa Kao	1834	937
181	Trạm Y tế Phường Cát Lái	1112	318
199	Trạm Y tế Phường 1	2433	667
211	Trạm Y tế Phường 15	738	682
229	Trạm Y tế Phường 1	487	88
241	Trạm Y tế Phường 13	1428	746
259	Trạm Y tế Phường 7	1403	631
271	Trạm Y tế Phường Long Phước	2536	544
289	Trạm Y tế Phường 8	1475	551
301	Trạm Y tế Phường 5	816	670
319	Trạm Y tế Phường Thới An	565	307
331	Trạm Y tế Xã Phạm Văn Hai	852	765
349	Trạm Y tế Phường Phường An Lạc A	2056	496
361	Trạm Y tế Xã Phước Vĩnh An	1076	553
379	Trạm Y tế Phường 10	1113	948
391	Trạm Y tế Xã Phú Xuân	626	352
409	Trạm Y tế Phường 1	1721	273
421	Trạm Y tế Phường 13	967	542
445	Trạm Y tế Phường 15	2163	224
451	Trạm Y tế Phường 25	2079	85
475	Trạm Y tế Phường Linh Xuân	1842	882
481	Trạm Y tế Xã Cần Thạnh	1997	298
125	Bệnh viện Thẩm mỹ Kỳ Hòa-Medika	2068	174
138	Trung tâm Pháp Y 	1345	313
154	Trung tâm Y tế dự phòng Quận Bình Tân 	1239	752
112	Bệnh viện Đa khoa Tâm Trí Sài Gòn	602	115
170	Trạm Y tế Phường Nguyễn Cư Trinh	1796	648
180	Trạm Y tế Phường Bình Trưng Tây	1469	431
200	Trạm Y tế Phường 2	2143	320
210	Trạm Y tế Phường 14	564	116
230	Trạm Y tế Phường 2	2412	554
240	Trạm Y tế Phường 12	1733	994
260	Trạm Y tế Phường 8	2162	258
270	Trạm Y tế Phường Long Bình	2004	113
290	Trạm Y tế Phường 9	531	109
300	Trạm Y tế Phường 4	2611	703
320	Trạm Y tế Phường Trung Mỹ Tây	1963	101
330	Trạm Y tế Xã Hưng Long	1353	413
350	Trạm Y tế Thị trấn Củ Chi	757	272
360	Trạm Y tế Xã Phước Thạnh	2252	386
380	Trạm Y tế Phường 11	1166	90
390	Trạm Y tế Xã Nhơn Đức	1678	323
410	Trạm Y tế Phường 2	1601	127
420	Trạm Y tế Phường 12	551	154
439	Trạm Y tế Phường 6	954	280
450	Trạm Y tế Phường 24	1717	737
469	Trạm Y tế Phường Hiệp Bình Phước	2954	964
480	Trạm Y tế Xã Bình Khánh	2599	782
126	Bệnh viện Phẩu thuật thẩm mỹ Hàn Quốc Kim Hospital 	2056	700
139	Trung tâm Truyền thông Giáo dục sức khỏe	1647	302
155	Trung tâm Y tế dự phòng Quận Bình Thạnh 	1884	292
113	Bệnh viện Mắt kỹ thuật cao Phương Nam	1814	739
174	Trạm Y tế Phường Bến Thành	1526	985
183	Trạm Y tế Phường Thảo Điền	698	291
204	Trạm Y tế Phường 6	2122	379
213	Trạm Y tế Phường 18	1763	895
234	Trạm Y tế Phường 6	750	349
243	Trạm Y tế Phường Bình Thuận	1282	711
264	Trạm Y tế Phường 12	1687	138
273	Trạm Y tế Phường Long Trường	2683	910
294	Trạm Y tế Phường 13	1576	563
303	Trạm Y tế Phường 7	1368	354
324	Trạm Y tế Xã Lê Minh Xuân	2050	782
333	Trạm Y tế Xã Quy Đức	645	376
354	Trạm Y tế Xã Hòa Phú	934	172
363	Trạm Y tế Xã Tân Phú trung	710	410
384	Trạm Y tế Phường 15	735	548
393	Trạm Y tế Xã Phước Lộc	2112	271
414	Trạm Y tế Phường 6	2068	97
423	Trạm Y tế Phường 15	529	112
441	Trạm Y tế Phường 11	709	85
453	Trạm Y tế Phường 27	1609	72
471	Trạm Y tế Phường Linh Chiểu	738	321
483	Trạm Y tế Xã Lý Nhơn	2210	499
127	Bệnh viện CKPT thẩm mỹ quốc tế Thảo Điền	1966	651
141	Trung tâm Y tế dự phòng Quận 1 	2317	393
106	Bệnh viện Tim Tâm Đức	2001	985
157	Trung tâm Y tế dự phòng Huyện Củ Chi	2397	915
182	Trạm Y tế Phường Thạnh Mỹ Lợi	2429	812
184	Trạm Y tế Phường Thủ Thiêm	1388	593
212	Trạm Y tế Phường 16	2465	968
214	Trạm Y tế Phường 1	1233	234
242	Trạm Y tế Phường 14	1257	466
244	Trạm Y tế Phường Phú Mỹ	2234	745
272	Trạm Y tế Phường Long Thạnh Mỹ	1993	522
274	Trạm Y tế Phường Phú Hữu	2781	927
302	Trạm Y tế Phường 6	990	911
304	Trạm Y tế Phường 8	2511	567
332	Trạm Y tế Xã Phong phú	1479	887
334	Trạm Y tế Xã Tân Kiên	2484	681
362	Trạm Y tế Xã Tân An Hội	1289	384
364	Trạm Y tế Xã Tân Thạnh Đông	692	295
392	Trạm Y tế Xã Phước Kiển	1343	998
394	Trạm Y tế Phường 1	1491	302
422	Trạm Y tế Phường 14	1408	383
424	Trạm Y tế Phường Tân Sơn Nhì	1480	836
452	Trạm Y tế Phường 26	2699	932
454	Trạm Y tế Phường 28	1085	477
482	Trạm Y tế Xã Long Hoà	1227	957
484	Trạm Y tế Xã Tam Thôn Hiệp	294	181
123	Bệnh viện Thẩm mỹ Việt - Mỹ	2074	125
140	Trung tâm Y tế dự phòng TP. Hồ Chí Minh	1891	840
156	Trung tâm Y tế dự phòng Huyện Cần Giờ 	1132	268
110	Bệnh viện Xuyên Á	680	537
177	Trạm Y tế Phường An Lợi Đông	1985	923
185	Trạm Y tế Phường 1	879	799
207	Trạm Y tế Phường 10	2564	781
215	Trạm Y tế Phường 2	1163	219
237	Trạm Y tế Phường 9	633	368
245	Trạm Y tế Phường Phú Thuận	582	475
267	Trạm Y tế Phường 15	1668	210
275	Trạm Y tế Phường Phước Bình	1581	755
297	Trạm Y tế Phường 1	647	578
305	Trạm Y tế Phường 9	2271	575
327	Trạm Y tế Xã Bình Hưng	971	818
335	Trạm Y tế Xã Tân Nhựt	736	505
357	Trạm Y tế Xã Phú Hoà Đông	1062	792
365	Trạm Y tế Xã Tân Thạnh Tây	601	259
387	Trạm Y tế Thị trấn Nhà Bè	2321	883
395	Trạm Y tế Phường 2	2410	878
417	Trạm Y tế Phường 9	1263	553
425	Trạm Y tế Phường Tây Thạnh	1338	126
447	Trạm Y tế Phường 19	2377	636
455	Trạm Y tế Thị Trấn Hóc Môn	738	504
477	Trạm Y tế Phường Tam Phú	2785	871
485	Trạm Y tế Xã Thạnh An	1665	337
119	Bệnh viện Phẫu thuật tạo hình thẩm mỹ Á - Âu	1619	247
142	Trung tâm Y tế dự phòng Quận 2	1817	312
114	Bệnh viện Sài Gòn – ITO Phú Nhuận	1338	375
158	Trung tâm Y tế dự phòng Quận Gò Vấp	2498	779
186	Trạm Y tế Phường 2	1847	817
188	Trạm Y tế Phường 4	1121	96
216	Trạm Y tế Phường 3	839	666
218	Trạm Y tế Phường 5	1742	925
246	Trạm Y tế Phường Tân Hưng	2651	833
248	Trạm Y tế Phường Tân Phong	1885	596
276	Trạm Y tế Phường Phước Long A	760	282
278	Trạm Y tế Phường Tân Phú	2161	743
306	Trạm Y tế Phường 10	911	478
308	Trạm Y tế Phường 12	1758	384
336	Trạm Y tế Xã Tân Quý Tây	756	277
338	Trạm Y tế Xã Vĩnh Lộc A	1871	953
366	Trạm Y tế Xã Tân Thông Hội	808	295
368	Trạm Y tế Xã Trung An	1305	409
396	Trạm Y tế Phường 3	890	614
398	Trạm Y tế Phường 5	1703	390
426	Trạm Y tế Phường Tân Quý	2454	955
428	Trạm Y tế Phường Tân Thành	2099	562
456	Trạm Y tế Xã Xuân Thới Thượng	2125	966
458	Trạm Y tế Xã Thới Tam Thôn	2104	799
130	Trung tâm Phòng chống HIV-AIDS	1473	909
145	Trung tâm Y tế dự phòng Quận 5	1849	213
103	Bệnh viện Quốc tế Thành Đô	941	278
161	Trung tâm Y tế dự phòng Quận Phú Nhuận	847	517
187	Trạm Y tế Phường 3	2030	334
191	Trạm Y tế Phường 7	484	298
217	Trạm Y tế Phường 4	1645	196
221	Trạm Y tế Phường 8	1205	523
247	Trạm Y tế Phường Tân Kiểng	1021	246
251	Trạm Y tế Phường Tân Thuận Đông	2199	633
277	Trạm Y tế Phường Phước Long B	1725	384
281	Trạm Y tế Phường Trường Thạnh	2063	484
307	Trạm Y tế Phường 11	2654	882
311	Trạm Y tế Phường 15	2528	687
337	Trạm Y tế Xã Tân Túc	463	186
341	Trạm Y tế Phường Bình Trị Đông A	2342	868
367	Trạm Y tế Xã Thái Mỹ	1075	526
371	Trạm Y tế Phường 1	1134	688
397	Trạm Y tế Phường 4	2211	597
401	Trạm Y tế Phường 9	538	392
427	Trạm Y tế Phường Sơn Kỳ	1589	466
431	Trạm Y tế Phường Phú Trung	799	237
457	Trạm Y tế Xã Tân Hiệp	943	667
461	Trạm Y tế Xã Tân Thới Nhì	2346	482
128	Bệnh viện thẩm mỹ Hàn Quốc JW	2101	887
148	Trung tâm Y tế dự phòng Quận 8	1625	770
164	Trung tâm Y tế dự phòng Quận Thủ Đức 	1502	90
194	Trạm Y tế Phường 10	1366	834
224	Trạm Y tế Phường 11	1688	230
254	Trạm Y tế Phường 2	1953	401
284	Trạm Y tế Phường 3	761	664
314	Trạm Y tế Phường Đông Hưng Thuận	1014	471
344	Trạm Y tế Phường Tân Tạo A	402	293
374	Trạm Y tế Phường 5	803	733
404	Trạm Y tế Phường 12	711	656
434	Trạm Y tế Phường Tân Thới Hoà	2043	890
464	Trạm Y tế Xã Nhị Bình	1611	632
121	Bệnh viện Phẫu thuật Tạo hình thẩm mỹ Hiệp Lợi	1360	267
150	Trung tâm Y tế dự phòng Quận 10	2139	295
166	Trạm Y tế Phường Cầu Kho	1824	575
196	Trạm Y tế Phường 12	1108	424
226	Trạm Y tế Phường 13	2458	559
256	Trạm Y tế Phường 4	2326	710
286	Trạm Y tế Phường 5	1402	835
316	Trạm Y tế Phường Tân Thới Hiệp	1816	380
346	Trạm Y tế Phường Bình Hưng Hoà A	757	393
376	Trạm Y tế Phường 7	346	157
406	Trạm Y tế Phường 14	2750	808
436	Trạm Y tế Phường 2	1363	946
466	Trạm Y tế Trung Chánh	1638	646
129	Trung tâm Chẩn đoán Y khoa Medic	499	96
152	Trung tâm Y tế dự phòng Quận 12	1535	997
168	Trạm Y tế Phường Cô Giang	2108	560
198	Trạm Y tế Phường 14	1352	870
228	Trạm Y tế Phường 15	2111	285
258	Trạm Y tế Phường 6	1644	697
288	Trạm Y tế Phường 7	1711	201
318	Trạm Y tế Phường Thạnh Xuân	1311	815
348	Trạm Y tế Phường An Lạc	244	171
378	Trạm Y tế Phường 9	2266	319
408	Trạm Y tế Phường 17	1837	215
438	Trạm Y tế Phường 5	838	707
468	Trạm Y tế Phường Bình Thọ	205	151
101	Bệnh viện Quốc Ánh	1407	879
171	Trạm Y tế Phường Nguyễn Thái Bình	2185	600
201	Trạm Y tế Phường 3	1071	464
231	Trạm Y tế Phường 3	980	596
261	Trạm Y tế Phường 9	1883	214
291	Trạm Y tế Phường 10	285	72
321	Trạm Y tế Phường Tân Chánh Hiệp	659	412
351	Trạm Y tế Xã An Nhơn Tây	1863	507
381	Trạm Y tế Phường 12	782	76
411	Trạm Y tế Phường 3	2215	809
444	Trạm Y tế Phường 14	2420	743
474	Trạm Y tế Phường Linh Trung	2354	585
\.


--
-- TOC entry 3357 (class 0 OID 16419)
-- Dependencies: 217
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Users" ("f_ID", "f_Username", "f_Password", "f_Permission", "f_Fullname", "f_NatID", "f_DOB", "f_Fx", "f_QuarantineID", "f_Ward", "f_RelatedID", "f_History") FROM stdin;
1	khai	khai	2	\N	\N	\N	\N	\N	\N	\N	{"1/2022 22:6  Create User","1/2022 23:6  Unlock User","1/2022 23:6  Lock User","1/2022 23:16  Unlock User","1/2022 23:16  Lock User"}
2	thang	thang	2	\N	\N	\N	\N	\N	\N	\N	{"1/2022 0:4  Create User"}
3	tuan anh	anh	2	asfd123	\N	\N	\N	\N	\N	\N	\N
5	khanh	khanh	1	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3359 (class 0 OID 16425)
-- Dependencies: 219
-- Data for Name: Wards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Wards" ("f_ID", "f_Name", "f_District") FROM stdin;
4	Phường Trúc Bạch	1
7	Phường Cống Vị	1
11	Phường Quán Thánh	1
85	Phường Phan Chu Trinh	2
88	Phường Hàng Bài	2
8	Phường Nguyễn Trung Trực	1
18	Phường Đội Cấn	1
6	Phường Vĩnh Phúc	1
49	Phường Hàng Đào	2
32	Phường Đồng Xuân	2
31	Phường Phúc Tân	2
35	Phường Hàng Mã	2
19	Phường Điện Biên	1
1	Phường Phúc Xá	1
28	Phường Thành Công	1
52	Phường Hàng Gai	2
14	Phường Ngọc Hà	1
56	Phường Hàng Trống	2
91	Phường Phú Thượng	3
21	Phường Ngọc Khánh	1
62	Phường Hàng Bông	2
38	Phường Hàng Buồm	2
58	Phường Lý Thái Tổ	2
25	Phường Giảng Võ	1
55	Phường Chương Dương	2
59	Phường Cửa Nam	2
45	Phường Cửa Đông	2
94	Phường Nhật Tân	3
42	Phường Hàng Bồ	2
79	Phường Tràng Tiền	2
97	Phường Tứ Liên	3
82	Phường Trần Hưng Đạo	2
64	Phường Quảng An	3
67	Phường Xuân La	3
70	Phường Yên Phụ	3
109	Phường Bưởi	3
74	Phường Thụy Khuê	3
77	Phường Thượng Thanh	4
118	Phường Ngọc Thụy	4
81	Phường Giang Biên	4
84	Phường Đức Giang	4
87	Phường Việt Hưng	4
139	Phường Bồ Đề	4
98	Phường Sài Đồng	4
101	Phường Long Biên	4
148	Phường Thạch Bàn	4
105	Phường Phúc Đồng	4
108	Phường Cự Khối	4
111	Phường Nghĩa Đô	5
112	Phường Nghĩa Tân	5
115	Phường Mai Dịch	5
119	Phường Dịch Vọng Hậu	5
169	Phường Quan Hoa	5
122	Phường Yên Hoà	5
125	Phường Trung Hoà	5
178	Phường Cát Linh	6
181	Phường Văn Miếu	6
184	Phường Quốc Tử Giám	6
187	Phường Láng Thượng	6
190	Phường Ô Chợ Dừa	6
193	Phường Văn Chương	6
196	Phường Hàng Bột	6
199	Phường Láng Hạ	6
130	Phường Khâm Thiên	6
133	Phường Thổ Quan	6
208	Phường Nam Đồng	6
137	Phường Trung Phụng	6
140	Phường Quang Trung	6
143	Phường Trung Liệt	6
144	Phường Phương Liên	6
147	Phường Thịnh Quang	6
150	Phường Trung Tự	6
229	Phường Kim Liên	6
154	Phường Phương Mai	6
157	Phường Ngã Tư Sở	6
238	Phường Khương Thượng	6
161	Phường Nguyễn Du	7
164	Phường Bạch Đằng	7
167	Phường Phạm Đình Hổ	7
174	Phường Lê Đại Hành	7
259	Phường Đồng Nhân	7
268	Phường Thanh Lương	7
185	Phường Thanh Nhàn	7
188	Phường Cầu Dền	7
191	Phường Bách Khoa	7
280	Phường Đồng Tâm	7
283	Phường Vĩnh Tuy	7
286	Phường Bạch Mai	7
289	Phường Quỳnh Mai	7
292	Phường Quỳnh Lôi	7
295	Phường Minh Khai	7
298	Phường Trương Định	7
200	Phường Mai Động	8
203	Phường Tương Mai	8
206	Phường Đại Kim	8
319	Phường Tân Mai	8
210	Phường Hoàng Văn Thụ	8
213	Phường Giáp Bát	8
328	Phường Lĩnh Nam	8
217	Phường Thịnh Liệt	8
220	Phường Trần Phú	8
223	Phường Hoàng Liệt	8
224	Phường Yên Sở	8
227	Phường Nhân Chính	9
230	Phường Thượng Đình	9
349	Phường Khương Trung	9
234	Phường Khương Mai	9
237	Phường Thanh Xuân Trung	9
358	Phường Phương Liệt	9
241	Phường Hạ Đình	9
244	Phường Khương Đình	9
247	Phường Thanh Xuân Bắc	9
248	Phường Thanh Xuân Nam	9
251	Phường Kim Giang	9
254	Thị trấn Sóc Sơn	14
379	Xã Bắc Sơn	14
382	Xã Minh Trí	14
385	Xã Hồng Kỳ	14
388	Xã Nam Sơn	14
279	Xã Mai Đình	14
439	Xã Kim Lũ	14
290	Xã Phú Cường	14
293	Xã Phú Minh	14
448	Xã Phù Lỗ	14
297	Xã Xuân Thu	14
300	Thị trấn Đông Anh	15
303	Xã Xuân Nộn	15
304	Xã Thuỵ Lâm	15
307	Xã Bắc Hồng	15
310	Xã Nguyên Khê	15
391	Xã Trung Giã	14
273	Xã Việt Long	14
499	Xã Đại Mạch	15
405	Phường Mỹ Đình 1	19
395	Phường Minh Khai	17
9553	Phường Phúc La	268
9640	Xã Phong Vân	271
9733	Xã Sen Phương	272
9826	Xã Đồng Tháp	273
9916	Xã Thạch Thán	275
9997	Xã Phùng Xá	276
10090	Xã Thượng Vực	277
10186	Xã Ninh Sở	279
10276	Xã Hồng Minh	280
10369	Xã Trường Thịnh	281
10459	Xã Bột Xuyên	282
472	Xã Thài Phìn Tủng	22
817	Xã Niêm Sơn	23
910	Xã Thái An	29
997	Xã Yên Phong	25
1090	Xã Thông Nguyên	26
1189	Xã Quang Minh	28
1693	Xã Vĩnh Quang	32
1359	Xã Sơn Lập	35
1480	Xã Ngọc Khê	39
1594	Xã Độc Lập	49
1738	Xã Ca Thành	42
1858	Xã Bằng Thành	48
1951	Xã Đức Vân	50
1067	Xã Ngọc Phái	52
1137	Xã Sơn Thành	54
2296	Xã Thổ Bình	57
1255	Xã Trung Hòa	59
2449	Xã Xuân Vân	61
1402	Xã Đông Thọ	62
1465	Phường Nam Cường	80
1524	Xã Dìn Chin	83
2872	Xã Tà Chải	85
2965	Xã Tân Dương	87
1591	Xã Nậm Mả	89
1750	Xã Pá Khoang	94
1686	Xã Tả Sìn Thàng	98
3328	Xã Thanh Luông	100
3385	Xã Háng Lìa	101
3390	Thị trấn Tam Đường	106
3592	Xã Sin Suối Hồ	109
3598	Thị trấn Tân Uyên	111
3688	Xã Chiềng Khay	118
3796	Xã Co Tòng	119
3890	Xã Hua Nhàn	121
3979	Thị trấn Mộc Châu	123
2117	Thị trấn Hát Lót	125
4195	Xã Chiềng Sơ	126
4058	Xã Tân Xuân	128
4309	Xã Lâm Thượng	135
2306	Xã Phong Dụ Hạ	136
4498	Thị trấn Cổ Phúc	138
2442	Xã Bản Công	139
4828	Phường Thống Nhất	148
4888	Xã Tiền Phong	150
2623	Xã Cuối Hạ	153
2694	Xã Sơn Thủy	156
2781	Xã Vũ Bình	157
5449	Phường Phan Đình Phùng	164
2897	Phường Phố Cò	165
2970	Xã Phủ Lý	168
3046	Xã Tràng Xá	170
5845	Xã Ký Phú	171
5938	Xã Nhã Lộng	173
6028	Xã Tân Minh	180
3156	Thị trấn Na Sầm	182
3222	Xã Hợp Thành	183
3316	Xã Chiến Thắng	185
3445	Xã Khuất Xá	188
6595	Xã Minh Hiệp	188
6694	Phường Bạch Đằng	193
6856	Xã Lục Hồn	198
6892	Xã Đồng Rui	199
6997	Xã Đài Xuyên	203
3670	Phường Hưng Đạo	205
7219	Phường Lê Lợi	213
3786	Xã Đại Hóa	216
3845	Xã Hương Lạc	217
3918	Xã Vũ Xá	218
3998	Xã Giáo Liêm	220
7768	Xã Minh Đức	222
7867	Xã Đoan Bái	223
7948	Phường Âu Cơ	228
8056	Xã Đại Phạm	231
8206	Xã Chí Tiên	232
8308	Xã Xuân Thủy	234
8416	Xã Hùng Việt	235
8563	Xã Sơn Hùng	238
8548	Xã Thạch Kiệt	240
8749	Xã Ngọc Thanh	244
8887	Xã An Hòa	247
9028	Xã Đồng Cương	251
9124	Xã Tân Phú	252
9163	Phường Vũ Ninh	256
9232	Xã Long Châu	258
9343	Xã Lạc Vệ	260
9427	Xã Thanh Khương	262
9517	Xã Trừng Xá	264
11011	Phường Tân Hưng	288
10633	Xã Nam Trung	291
10741	Phường Thái Thịnh	292
10846	Xã Thanh Hải	294
10942	Xã Cẩm Đoài	295
11059	Xã Thống Kênh	297
11161	Xã Ứng Hoè	299
11275	Xã Ngũ Hùng	300
11374	Phường Lam Sơn	305
11455	Phường Ngọc Xuyên	308
11524	Xã Đông Sơn	311
11614	Xã Đặng Cương	312
11719	Xã Thuỵ Hương	314
11821	Xã Vinh Quang	315
11914	Thị trấn Cát Bà	317
11986	Thị trấn Như Quỳnh	325
12082	Xã Việt Cường	327
12175	Xã Văn Nhuệ	329
12262	Xã Đại Tập	330
12358	Xã Đức Thắng	332
12820	Xã Đông Thọ	336
12553	Xã Quỳnh Hưng	338
12643	Xã Thống Nhất	339
12730	Xã Nguyên Xá	340
12853	Xã Thụy Hưng	341
12976	Xã Đông Trà	342
13069	Xã Nam Hải	342
13174	Xã Vũ Bình	343
13267	Xã Vũ Vinh	344
13330	Phường Châu Giang	349
13441	Thị trấn Kiện Khê	351
13555	Xã La Sơn	352
13630	Xã Hòa Hậu	353
13714	Xã Mỹ Tiến	358
13801	Xã Yên Thành	360
13894	Thị trấn Rạng Đông	361
13987	Xã Tân Thịnh	362
394	Xã Tân Hưng	14
487	Xã Việt Hùng	15
383	Xã Đa Tốn	18
595	Phường Thượng Cát	17
9538	Phường Nguyễn Trãi	268
9625	Xã Phú Cường	271
9718	Xã Vân Hà	272
9814	Xã Thượng Mỗ	273
9904	Xã Yên Sơn	275
9985	Xã Chàng Sơn	276
10078	Xã Hoàng Diệu	277
10174	Xã Cao Dương	278
10264	Xã Vạn Điểm	279
10357	Xã Viên An	281
10447	Xã Thượng Lâm	282
718	Xã Má Lé	22
808	Xã Tát Ngà	23
898	Xã Quản Bạ	29
985	Xã Giáp Trung	25
573	Xã Nậm Dịch	26
639	Xã Hữu Sản	28
1279	Phường Ngọc Xuân	32
745	Xã Hưng Đạo	35
821	Xã Quang Trung	39
894	Thị trấn Quảng Uyên	49
969	Xã Bình Dương	41
1837	Phường Sông Cầu	58
1936	Thị trấn Nà Phặc	50
2038	Xã Quảng Bạch	52
1123	Xã Lương Thượng	54
1193	Xã Khuôn Hà	57
1242	Xã Phú Bình	59
1298	Xã Đức Ninh	60
2539	Xã Trung Yên	62
1444	Phường Cốc Lếu	80
1503	Xã Pa Cheo	82
2842	Xã Lùng Cải	85
2938	Xã Sơn Hà	86
1567	Xã Mường Hoa	88
1627	Phường Tân Thanh	94
3196	Xã Huổi Lèng	97
3284	Xã Mường Khong	99
1673	Xã Chiềng Sơ	101
3187	Xã Chà Nưa	103
1839	Xã Nậm Khao	107
1850	Xã Mường Mô	112
1976	Phường Chiềng Cơi	116
3781	Xã Co Mạ	119
3877	Xã Chim Vàn	121
3964	Xã Mường Bang	122
4090	Xã Chiềng Khoi	124
2175	Xã Chiềng Phung	126
4039	Xã Mường Men	128
2483	Xã Phù Nham	133
4396	Xã Đông An	136
4492	Xã Púng Luông	137
2438	Xã Pá Hu	139
2511	Thị trấn Thác Bà	141
4819	Phường Dân Chủ	148
4960	Xã Cư Yên	152
2645	Xã Thạch Yên	154
2739	Xã Vạn Mai	156
5488	Xã Phúc Xuân	164
5539	Xã Linh Thông	167
5758	Xã Bình Long	170
5815	Xã La Bằng	171
5905	Xã Thuận Thành	172
3073	Xã Đoàn Kết	180
6097	Xã Thiện Long	181
3202	Xã Xuất Lễ	183
3275	Xã Tri Lễ	184
6418	Xã Nhật Tiến	186
6529	Thị trấn Lộc Bình	188
6658	Phường Cao Xanh	193
3530	Phường Trần Phú	194
6811	Phường Thanh Sơn	196
6910	Xã Dực Yên	200
3594	Xã Hạ Long	203
3687	Xã Hiệp Hòa	206
7696	Xã Đồng Sơn	213
3800	Xã Hợp Đức	216
3939	Xã Hộ Đáp	219
3981	Thị trấn An Châu	220
4072	Xã Đồng Phúc	221
7858	Xã Hợp Thịnh	223
8503	Xã Hy Cương	227
8044	Xã Minh Phú	230
8179	Xã Ninh Dân	232
8299	Xã Lương Sơn	234
8404	Xã Tạ Xá	235
8539	Xã Bản Nguyên	237
8674	Thị trấn Thanh Thủy	239
8728	Phường Khai Quang	243
8863	Xã Triệu Đề	246
8953	Xã Tam Hợp	249
9094	Xã Việt Xuân	252
8809	Xã Phương Khoan	253
9193	Thị trấn Chờ	258
9304	Xã Yên Giả	259
9397	Phường Phù Chẩn	261
9487	Xã Đông Cứu	263
10540	Phường Tứ Minh	288
10603	Phường Tân Dân	290
10708	Xã Hiệp Hòa	292
10807	Xã Liên Hòa	293
10912	Xã Đức Chính	295
11035	Xã Gia Khánh	297
11140	Xã Cộng Lạc	298
11251	Xã Đoàn Tùng	300
11353	Phường Cầu Đất	304
11429	Phường Lãm Hà	307
11497	Xã Gia Đức	311
11590	Xã An Hoà	312
11680	Thị trấn Núi Đối	314
11791	Xã Quang Phục	315
11887	Xã Tam Cường	316
11974	Xã Liên Phương	323
12046	Xã Thắng Lợi	326
12136	Xã Ngọc Lâm	328
12226	Xã Tứ Dân	330
12316	Xã Đức Hợp	331
12418	Xã Tiền Tiến	333
12487	Xã Quỳnh Thọ	338
12580	Xã An Tràng	338
12667	Xã Hồng Lĩnh	339
12760	Xã Phú Châu	340
12889	Xã Thụy Liên	341
13003	Xã Đông Minh	342
13102	Xã Lê Lợi	343
13204	Xã Hiệp Hòa	344
13297	Phường Hai Bà Trưng	347
13357	Phường Hoàng Đông	349
13480	Xã Liêm Túc	351
13585	Xã Văn Lý	353
13678	Phường Trần Quang Khải	356
13768	Xã Quang Trung	359
13861	Xã Yên Tiến	360
13954	Xã Nghĩa Lợi	361
14044	Xã Việt Hùng	363
397	Xã Minh Phú	14
276	Xã Xuân Giang	14
322	Xã Vĩnh Ngọc	15
406	Phường Mỹ Đình 2	19
398	Phường Cổ Nhuế 1	17
9556	Phường Hà Cầu	268
9643	Xã Phú Đông	271
9739	Xã Võng Xuyên	272
9829	Xã Song Phượng	273
9919	Xã Đồng Quang	275
10000	Xã Tân Xã	276
10093	Xã Hồng Phong	277
10189	Xã Nhị Khê	279
10279	Xã Phượng Dực	280
10372	Xã Cao Thành	281
10462	Xã An Mỹ	282
475	Xã Sủng Là	22
820	Thị trấn Yên Minh	28
451	Xã Kim Thạch	24
512	Xã Lạc Nông	25
1093	Xã Nậm Khòa	26
1192	Xã Liên Hiệp	28
965	Xã Hưng Đạo	32
752	Xã Sơn Lộ	35
1481	Xã Ngọc Côn	39
1597	Xã Cai Bộ	49
996	Xã Vũ Nông	42
1861	Xã Nhạn Môn	48
1954	Xã Vân Tùng	50
2059	Xã Đồng Thắng	52
1144	Xã Văn Minh	54
2299	Xã Phúc Sơn	57
1256	Xã Kim Bình	59
1322	Xã Phúc Ninh	61
2578	Xã Hợp Hòa	62
1471	Xã Tả Phời	80
1528	Xã Nậm Chảy	83
2875	Xã Na Hối	85
2968	Xã Thượng Hà	87
1592	Xã Tân Thượng	89
3148	Phường Sông Đà	95
3229	Xã Lao Xả Phình	98
1753	Xã Thanh Hưng	100
1710	Thị trấn Mường Ảng	102
3394	Xã Thèn Sin	106
3508	Xã Ma Quai	108
3595	Thị trấn Than Uyên	110
3739	Xã Liệp Tè	119
2042	Xã Tông Lạnh	119
3869	Xã Háng Đồng	121
3955	Xã Tường Phong	122
4081	Xã Mường Lựm	124
4168	Thị trấn Sông Mã	126
4018	Xã Tô Múa	128
4294	Xã Nghĩa Lợi	133
2301	Thị trấn Mậu A	136
2361	Xã Chế Cu Nha	137
4585	Thị trấn Trạm Tấu	139
4696	Xã Tân Thịnh	140
4789	Phường Thái Bình	148
4870	Xã Trung Thành	150
5038	Xã Hợp Tiến	153
5197	Xã Gia Mô	155
2768	Xã Định Cư	157
5428	Xã An Bình	159
5509	Phường Châu Sơn	165
2949	Xã Bình Thành	167
3015	Xã Nam Hòa	169
5824	Xã An Khánh	171
5917	Xã Tân Khánh	173
3083	Xã Chí Minh	180
6109	Xã Tân Hòa	181
3209	Xã Lộc Yên	183
3362	Xã Tân Thành	186
6490	Xã Thượng Cường	187
3477	Xã Kiên Mộc	189
6784	Phường Cẩm Thủy	195
6805	Xã Dương Huy	195
6904	Xã Tân Bình	200
7009	Xã Đoàn Kết	203
3677	Phường Đông Mai	206
7228	Phường Đa Mai	213
3852	Xã Yên Mỹ	217
3935	Xã Phong Vân	219
3978	Xã Phượng Sơn	219
4071	Xã Đồng Việt	221
7855	Xã Thường Thắng	223
8506	Xã Chu Hóa	227
8041	Xã Minh Tiến	230
8170	Xã Đồng Xuân	232
8278	Xã Phù Ninh	233
8389	Xã Xương Thịnh	235
8512	Xã Thạch Sơn	237
8662	Xã Đào Xá	239
8716	Phường Đống Đa	243
8842	Xã Tiên Lữ	246
8944	Thị trấn Bá Hiến	249
9091	Xã Yên Lập	252
8818	Xã Tân Lập	253
9199	Xã Tam Đa	258
9313	Xã Chi Lăng	259
9403	Xã Hoài Thượng	262
9493	Xã Quỳnh Phú	263
10660	Phường Ái Quốc	288
10606	Thị trấn Nam Sách	291
10720	Xã Lạc Long	292
10819	Xã Việt Hồng	294
10927	Xã Cao An	295
11047	Xã Hoàng Diệu	297
11149	Xã Hà Kỳ	298
11263	Xã Đoàn Kết	300
11368	Phường Cát Dài	305
11446	Phường Văn Đẩu	307
11512	Xã Kênh Giang	311
11599	Xã An Hưng	312
11701	Xã Hữu Bằng	314
11803	Xã Bắc Hưng	315
11896	Xã Vĩnh Phong	316
11980	Xã Quảng Châu	323
12058	Xã Nghĩa Hiệp	327
12151	Xã Bãi Sậy	329
12241	Xã Đồng Tiến	330
12328	Xã Hiệp Cường	331
12430	Xã Tống Trân	333
12505	Xã Quỳnh Hồng	338
12598	Xã Dân Chủ	339
12685	Xã Hồng Minh	339
12784	Xã Trọng Quan	340
12904	Xã Thụy Phong	341
13018	Xã Đông Cơ	342
13123	Xã Đình Phùng	343
13219	Xã Việt Hùng	344
13309	Phường Liêm Chính	347
13390	Xã Đại Cương	350
13495	Xã Thanh Nguyên	351
13606	Xã Nhân Khang	353
13696	Xã Nam Phong	356
13783	Xã Liên Minh	359
13879	Xã Yên Đồng	360
13975	Xã Nghĩa An	362
256	Xã Phù Linh	14
490	Xã Kim Nỗ	15
583	Xã Bát Tràng	18
9544	Phường Vạn Phúc	268
9886	Phường Dương Nội	268
9658	Xã Phú Sơn	271
9754	Xã Tích Giang	272
9844	Xã Di Trạch	274
9934	Xã Tân Phú	275
10015	Thị trấn Chúc Sơn	277
10108	Xã Hòa Chính	277
10204	Xã Hiền Giang	279
10297	Xã Văn Hoàng	280
10387	Xã Trung Tú	281
10477	Xã Phù Lưu Tế	282
748	Xã Sính Lủng	22
841	Xã Hữu Vinh	28
928	Xã Thanh Thủy	24
532	Xã Bản Máy	26
651	Xã Vĩnh Phúc	28
727	Xã Thượng Hà	35
1393	Xã Lũng Nặm	37
863	Xã Lý Quốc	48
1783	Xã Hưng Đạo	42
1828	Xã Lê Lợi	43
1927	Xã Mỹ Phương	49
2029	Xã Đồng Lạc	52
1113	Xã Quảng Chu	53
1364	Phường Đội Cấn	56
1235	Xã Bình Phú	59
1371	Xã Đội Bình	61
1391	Xã Lương Thiện	62
2659	Xã Thống Nhất	80
1514	Xã Pha Long	83
2857	Xã Thải Giàng Phố	85
2953	Xã Nghĩa Đô	87
1578	Xã Liên Minh	88
1637	Xã Thanh Minh	94
1666	Xã Mường Mươn	97
1732	Xã Tênh Phông	99
3379	Xã Luân Giới	101
3389	Phường Đoàn Kết	105
3487	Xã Chăn Nưa	108
3583	Xã Khổng Lào	109
3481	Xã Lê Lợi	112
3823	Xã Mường Trai	120
3847	Xã Mường Bú	120
3934	Xã Mường Lang	122
2096	Thị trấn Yên Châu	124
2151	Xã Chiềng Dong	125
2207	Xã Nậm Lạnh	127
2406	Phường Hợp Minh	132
2277	Xã Vĩnh Lạc	135
4438	Xã Yên Phú	136
2420	Xã Việt Cường	138
4768	Xã Đại Đồng	141
4816	Phường Quỳnh Lâm	148
4954	Xã Nhuận Trạch	152
2632	Xã Tây Phong	154
2729	Xã Mai Hạ	156
2805	Xã Bảo Hiệu	158
2871	Phường Cam Giá	164
2924	Xã Bảo Linh	167
2994	Thị trấn Trại Cau	169
3060	Thị trấn Quân Chu	171
5860	Phường Ba Hàng	172
5953	Xã Lương Phú	173
3110	Xã Đề Thám	180
3180	Xã Bắc Việt	182
3243	Thị trấn Văn Quan	184
6385	Thị trấn Hữu Lũng	186
6481	Xã Chiến Thắng	187
3467	Thị trấn Đình Lập	189
3526	Phường Đại Yên	193
3578	Phường Cẩm Phú	195
6871	Xã Phong Dụ	199
6976	Xã Thanh Lâm	202
3653	Phường Xuân Sơn	205
7198	Xã Thanh Lân	207
7285	Xã An Thượng	215
7384	Xã Quang Thịnh	217
7492	Xã Bình Sơn	218
7582	Xã Phì Điền	219
7690	Xã Hương Gián	221
7822	Xã Hoàng Vân	223
7921	Xã Phượng Lâu	227
8014	Xã Hợp Nhất	230
8134	Xã Văn Lang	231
8251	Xã Hạ Giáp	233
8347	Xã Tuy Lộc	235
8476	Xã Tề Lễ	236
8635	Xã Khả Cửu	238
8590	Xã Xuân Đài	240
8770	Xã Hợp Lý	246
8902	Xã Vân Hội	247
9046	Xã Yên Đồng	251
9136	Xã Tuân Chính	252
9175	Phường Vệ An	256
9247	Thị trấn Phố Mới	259
9352	Xã Tân Chi	260
9436	Xã Hà Mãn	262
9526	Xã Minh Tân	264
10546	Phường Phả Lại	290
10642	Xã Thái Tân	291
10750	Thị trấn Phú Thái	293
10855	Xã Thanh Xuân	294
10966	Xã Tân Việt	296
11083	Xã Đại Sơn	298
11188	Xã Đông Xuyên	299
11296	Phường Quán Toan	303
11398	Phường Niệm Nghĩa	305
11686	Phường Hưng Đạo	309
11545	Xã Tam Hưng	311
11632	Xã Bát Trang	313
11743	Xã Tân Trào	314
11842	Xã Vĩnh An	316
11932	Xã Phù Long	317
12001	Xã Tân Quang	325
12094	Xã Trung Hưng	327
12181	Xã Cẩm Ninh	329
12271	Xã Thuần Hưng	330
12367	Xã Thủ Sỹ	332
13084	Xã Vũ Đông	336
12556	Xã Quỳnh Bảo	338
12646	Xã Tiến Đức	339
12733	Xã Phong Châu	340
12856	Xã Thụy Việt	341
12970	Thị trấn Tiền Hải	342
13066	Xã Nam Hưng	342
13177	Xã Minh Tân	343
13270	Xã Vũ Đoài	344
13333	Phường Bạch Thượng	349
13438	Xã Thanh Sơn	350
13552	Xã An Đổ	352
13633	Phường Hạ Long	356
13726	Xã Mỹ Phúc	358
13819	Xã Yên Phương	360
262	Xã Tân Minh	14
493	Xã Kim Chung	15
589	Xã Văn Đức	18
9547	Phường Yết Kiêu	268
10117	Phường Đồng Mai	268
9661	Xã Minh Châu	271
9757	Xã Thanh Đa	272
9847	Xã Đức Giang	274
9937	Xã Đại Thành	275
10018	Thị trấn Xuân Mai	277
10111	Xã Phú Nam An	277
10207	Xã Hồng Vân	279
10300	Xã Hồng Thái	280
10390	Xã Đồng Tân	281
10480	Xã Đại Hưng	282
489	Xã Sảng Tủng	22
844	Xã Lao Và Chải	28
931	Xã Thanh Đức	24
535	Xã Thàng Tín	26
654	Xã Đồng Yên	28
1258	Xã Nà Khương	29
731	Xã Bảo Toàn	35
797	Xã Mã Ba	37
881	Xã Vinh Quý	48
1696	Xã Hoàng Tung	41
1807	Xã Vân Trình	43
1900	Xã Cao Thượng	49
1029	Xã Quân Hà	51
1089	Xã Thanh Mai	53
2218	Phường Hưng Thành	56
2308	Xã Tân Mỹ	59
1281	Xã Tân Thành	60
1350	Xã Mỹ Bằng	61
1427	Xã Hào Phú	62
1493	Xã Bản Xèo	82
2824	Xã Sín Chéng	84
2926	Xã Xuân Quang	86
1550	Phường Hàm Rồng	88
1617	Xã Nậm Xây	89
3190	Xã Hừa Ngài	97
1724	Xã Quài Nưa	99
3368	Xã Phu Luông	100
3169	Xã Nà Hỳ	103
1895	Xã Nậm Hăn	108
3638	Xã Tà Mung	110
3679	Phường Chiềng Sinh	116
3787	Xã Chiềng Pấc	119
3883	Xã Song Pe	121
3970	Xã Tân Phong	122
4096	Xã Lóng Phiêng	124
4183	Xã Mường Lầm	126
4681	Xã Phúc Sơn	133
2347	Xã Nà Hẩu	136
2393	Xã Y Can	138
4648	Xã Nậm Lành	140
4759	Xã Phúc An	141
4840	Xã Giáp Đắt	150
2565	Xã Vĩnh Tiến	153
2679	Xã Thanh Hối	155
5287	Xã Tân Lập	157
5695	Xã Cao Ngạn	164
3026	Xã Nghinh Tường	170
5800	Xã Bản Ngoại	171
5893	Xã Tân Hương	172
5989	Xã Quảng Lạc	178
6085	Xã Thiện Hòa	181
6190	Xã Bảo Lâm	183
3265	Xã Tràng Các	184
3338	Xã Yên Vượng	186
3411	Xã Chi Lăng	187
6649	Phường Hà Khánh	193
3635	Xã Sơn Dương	193
6799	Xã Cộng Hòa	195
6895	Thị trấn Đầm Hà	200
3584	Xã Bình Dân	203
3674	Phường Quảng Yên	206
3733	Phường Xương Giang	213
7318	Xã Phúc Sơn	216
3932	Xã Phong Minh	219
7609	Xã Đèo Gia	219
7738	Xã Cảnh Thụy	221
7852	Xã Đại Thành	223
8281	Xã Kim Đức	227
8035	Xã Vân Đồn	230
8161	Xã Đại An	232
8266	Xã Phú Nham	233
8380	Xã Văn Bán	235
8500	Xã Xuân Lũng	237
8656	Xã Yên Sơn	238
8707	Phường Tích Sơn	243
8815	Xã Tử Du	246
8932	Xã Minh Quang	248
9073	Xã Trung Hà	251
8776	Xã Quang Yên	253
9256	Phường Kim Chân	256
9289	Xã Ngọc Xá	259
9382	Phường Đồng Kỵ	261
9469	Xã Đại Lai	263
10528	Phường Trần Phú	288
10582	Phường Chí Minh	290
10687	Xã Hoành Sơn	292
10783	Xã Kim Liên	293
10894	Xã Cẩm Hưng	295
10999	Thị trấn Gia Lộc	297
11119	Xã Đại Hợp	298
11227	Xã Hiệp Lực	299
11323	Phường Phan Bội Châu	303
11413	Phường Đằng Lâm	306
11479	Xã An Sơn	311
11569	Xã Lâm Động	311
11656	Thị trấn Trường Sơn	313
11770	Xã Quyết Tiến	315
11866	Xã Tam Đa	316
11956	Phường An Tảo	323
12034	Xã Long Hưng	326
12127	Phường Minh Đức	328
12214	Xã Dạ Trạch	330
12304	Xã Chính Nghĩa	331
12406	Xã Đoàn Đào	333
12481	Xã Quỳnh Hoa	338
12574	Xã Đông Hải	338
12661	Xã Hồng An	339
12754	Xã Thăng Long	340
12874	Xã Thụy Chính	341
12994	Xã Tây Ninh	342
13093	Xã Hồng Thái	343
13201	Xã Xuân Hòa	344
13294	Phường Minh Khai	347
13360	Xã Yên Nam	349
13477	Xã Thanh Tân	351
13576	Xã Chân Lý	353
13666	Phường Trần Hưng Đạo	356
13753	Xã Hợp Hưng	359
13846	Xã Yên Phong	360
13936	Thị trấn Quỹ Nhất	361
14026	Thị trấn Cổ Lễ	363
14116	Xã Xuân Ngọc	364
266	Xã Hiền Ninh	14
496	Xã Dục Tú	15
402	Phường Xuân Phương	19
392	Phường Xuân Đỉnh	17
9551	Phường La Khê	268
9634	Xã Vạn Thắng	271
9715	Thị trấn Phúc Thọ	272
9811	Xã Phương Đình	273
9901	Xã Phượng Cách	275
9982	Xã Bình Yên	276
10075	Xã Hoàng Văn Thụ	277
10171	Xã Liên Châu	278
10261	Xã Văn Tự	279
10354	Thị trấn Vân Đình	281
10444	Xã Đồng Tâm	282
461	Xã Lũng Cú	22
805	Xã Lũng Chinh	23
895	Xã Đông Hà	29
982	Xã Minh Sơn	25
570	Xã Tả Sử Choóng	26
1168	Xã Đồng Tâm	28
696	Phường Sông Bằng	32
1609	Xã Tự Do	49
1843	Phường Phùng Chí Kiên	58
1906	Xã Khang Ninh	49
2008	Xã Cẩm Giàng	51
1092	Xã Cao Kỳ	53
2497	Xã Kim Phú	56
1225	Xã Hà Lang	59
1284	Xã Bình Xa	60
2518	Xã Hoàng Khai	61
1430	Xã Tam Đa	62
2728	Xã Mường Hum	82
2827	Xã Quan Hồ Thẩn	84
2929	Xã Sơn Hải	86
3019	Xã Hoàng Liên	88
1620	Phường Noong Bua	94
3191	Xã Huổi Mí	97
1727	Xã Mường Thín	99
1667	Thị trấn Điện Biên Đông	101
1656	Xã Nà Bủng	103
3439	Xã Ka Lăng	107
3391	Xã Lả Nhì Thàng	109
3697	Xã Pá Ma Pha Khinh	118
3865	Xã Xím Vàng	121
3910	Xã Quang Huy	122
2051	Xã Tà Lai	123
2134	Xã Mường Bon	125
2190	Xã Mường Cai	126
2231	Phường Hồng Hà	132
2264	Xã Minh Xuân	135
2320	Xã Yên Thái	136
2382	Xã Minh Quán	138
2462	Xã Gia Hội	140
4921	Xã Độc Lập	148
4891	Xã Vầy Nưa	150
5068	Xã Nam Thượng	153
2688	Thị trấn Mai Châu	156
2778	Xã Hương Nhượng	157
2847	Phường Túc Duyên	164
5518	Phường Thắng Lợi	165
5629	Xã Động Đạt	168
3039	Xã Cúc Đường	170
5836	Xã Mỹ Yên	171
5929	Xã Bảo Lý	173
3090	Xã Tân Yên	180
6118	Xã Bình La	181
3215	Xã Bình Trung	183
3309	Xã Vũ Sơn	185
3375	Xã Minh Hòa	186
3442	Xã Tú Đoạn	188
3518	Phường Cao Thắng	193
3554	Phường Hải Hoà	194
6841	Xã Hoành Mô	198
6940	Xã Quảng Minh	201
7081	Xã Bình Khê	205
3708	Phường Phong Hải	206
3761	Xã Tam Hiệp	215
7468	Xã Tiên Nha	218
3929	Xã Tân Sơn	219
4005	Xã An Lạc	220
4089	Xã Hương Mai	222
7864	Xã Mai Trung	223
7942	Phường Hùng Vương	228
8050	Xã Ca Đình	230
8197	Xã Khải Xuân	232
8293	Xã Mỹ Lung	234
8398	Xã Yên Tập	235
8521	Xã Phùng Nguyên	237
8686	Xã Đồng Trung	239
8740	Phường Trưng Nhị	244
8872	Xã Hoàng Hoa	247
8962	Thị trấn Đạo Đức	249
9103	Xã Tân Tiến	252
8827	Xã Như Thụy	253
9208	Xã Thụy Hòa	258
9319	Thị trấn Lim	260
9412	Xã Song Hồ	262
9502	Xã Trung Kênh	264
10822	Xã Quyết Thắng	288
10627	Xã Nam Chính	291
10738	Phường Long Xuyên	292
10840	Xã Tân An	294
10945	Thị trấn Kẻ Sặt	296
11062	Xã Quang Minh	297
11173	Xã An Đức	299
11287	Xã Thanh Giang	300
11386	Phường Trại Cau	305
11461	Phường Vạn Hương	308
11527	Xã Hoà Bình	311
11617	Xã Đồng Thái	312
11722	Xã Thanh Sơn	314
11815	Xã Đông Hưng	315
11908	Xã Vĩnh Tiến	316
12388	Xã Hoàng Hanh	323
12073	Xã Tân Lập	327
12160	Xã Vân Du	329
12247	Xã Tân Châu	330
12343	Xã Ngô Quyền	332
12445	Phường Quang Trung	336
12517	Xã Quỳnh Ngọc	338
12610	Xã Tân Tiến	339
12697	Xã Liên Giang	340
12799	Xã Đông Xuân	340
12925	Xã Sơn Hà	341
13039	Xã Vân Trường	342
13141	Xã Vũ Quí	343
13240	Xã Tân Lập	344
13426	Xã Kim Bình	347
13411	Xã Tân Sơn	350
13522	Xã Hưng Công	352
13660	Phường Phan Đình Phùng	356
13750	Xã Tân Khánh	359
13843	Xã Yên Khánh	360
13933	Xã Nghĩa Bình	361
14029	Xã Phương Định	363
14119	Xã Xuân Bắc	364
325	Xã Cổ Loa	15
559	Xã Phú Thị	18
436	Xã Vĩnh Quỳnh	16
9001	Xã Vạn Yên	250
9601	Phường Trung Hưng	269
9694	Xã Tản Lĩnh	271
9790	Xã Thọ An	273
9880	Xã An Thượng	274
9961	Xã Cẩm Yên	276
10054	Xã Đại Yên	277
10156	Xã Kim An	278
10246	Xã Thắng Lợi	279
10339	Xã Phú Yên	280
10429	Xã Phù Lưu	281
697	Phường Minh Khai	20
790	Xã Sủng Máng	23
883	Xã Cán Tỷ	29
970	Xã Ngọc Linh	24
560	Xã Sán Xả Hồ	26
678	Xã Bằng Lang	29
1339	Xã Xuân Trường	35
770	Xã Cải Viên	37
867	Xã Đồng Loan	48
944	Xã Nam Tuấn	41
1792	Xã Kim Đồng	43
1888	Thị trấn Chợ Rã	49
1990	Xã Lục Bình	51
2089	Xã Tân Sơn	53
2209	Xã Tràng Đà	56
2281	Xã Năng Khả	58
2389	Xã Minh Dân	60
2488	Xã Trung Môn	61
1417	Xã Phú Lương	62
1476	Xã Cốc Mỳ	82
2797	Xã Bản Sen	83
2908	Thị trấn Tằng Loỏng	86
1538	Phường Sa Pả	88
1603	Xã Khánh Yên Hạ	89
1651	Xã Mường Toong	96
1714	Xã Mùn Chung	99
3358	Xã Núa Ngam	100
1739	Xã Mường Lạn	102
1812	Xã Bản Bo	106
1878	Xã Nậm Cha	108
1946	Xã Hua Nà	110
3658	Xã Chiềng Cọ	116
2045	Xã Tông Cọ	119
3871	Xã Pắc Ngà	121
3958	Xã Tường Hạ	122
4084	Xã Chiềng On	124
2169	Xã Bó Sinh	126
2065	Xã Mường Tè	128
2452	Xã Nghĩa Lộ	133
4384	Xã Châu Quế Thượng	136
4480	Xã Cao Phạ	137
4594	Xã Xà Hồ	139
2501	Xã Thượng Bằng La	140
4795	Phường Thịnh Lang	148
4879	Xã Toàn Sơn	150
5086	Xã Nuông Dăm	153
2705	Xã Đồng Tân	156
5392	Thị trấn Chi Nê	159
2928	Xã Phúc Chu	167
2960	Xã Yên Đổ	168
3036	Xã Phú Thượng	170
5833	Xã Lục Ba	171
5926	Xã Đào Xá	173
3086	Xã Tri Phương	180
3146	Thị trấn Bình Gia	181
3212	Xã Phú Xá	183
6349	Xã Hưng Vũ	185
6448	Xã Minh Sơn	186
3435	Xã Đồng Bục	188
3511	Phường Hà Trung	193
3547	Xã Hải Tiến	194
6829	Xã Thượng Yên Công	196
6928	Xã Quảng Sơn	201
3642	Phường Đông Triều	205
7168	Phường Hà An	206
7249	Xã Xuân Lương	215
7339	Thị trấn Cao Thượng	216
3876	Thị trấn Đồi Ngô	218
4012	Xã Lệ Viễn	220
4044	Xã Xuân Phú	221
7837	Xã Hòa Sơn	223
7930	Xã Trưng Vương	227
8029	Xã Hùng Long	230
8158	Xã Đông Lĩnh	232
8272	Xã An Đạo	233
8383	Xã Cấp Dẫn	235
8509	Xã Xuân Huy	237
8659	Xã Tinh Nhuệ	238
8710	Phường Liên Bảo	243
8833	Xã Bàn Giản	246
8936	Thị trấn Gia Khánh	249
9079	Xã Kim Xá	252
8779	Xã Bạch Lưu	253
9271	Phường Vân Dương	256
9283	Xã Việt Hùng	259
9383	Phường Trang Hạ	261
9475	Xã Bình Dương	263
10531	Phường Thanh Bình	288
10588	Phường Thái Học	290
10699	Phường Tân Dân	292
10798	Xã Bình Dân	293
10900	Xã Cẩm Văn	295
11020	Xã Yết Kiêu	297
11125	Xã An Thanh	298
11239	Thị trấn Thanh Miện	300
11356	Phường Lê Lợi	304
11434	Phường Bắc Sơn	307
11503	Xã Phù Ninh	311
11593	Xã Hồng Phong	312
11695	Xã Đông Phương	314
11800	Xã Tiên Minh	315
11899	Xã Cộng Hiền	316
12331	Xã Phú Cường	323
12061	Xã Đồng Than	327
12148	Xã Bắc Sơn	329
12235	Xã Bình Kiều	330
12325	Xã Vũ Xá	331
12433	Phường Lê Hồng Phong	336
12502	Xã An Cầu	338
12595	Xã Cộng Hòa	339
12682	Xã Minh Hòa	339
12778	Xã Hồng Bạch	340
12907	Xã Thái Thượng	341
13024	Xã Đông Lâm	342
13126	Xã Vũ Ninh	343
13228	Xã Minh Khai	344
13318	Phường Châu Sơn	347
13396	Xã Tượng Lĩnh	350
13498	Xã Thanh Hải	351
13600	Xã Nhân Thịnh	353
13693	Phường Lộc Hòa	356
13786	Xã Đại Thắng	359
13882	Xã Yên Khang	360
13972	Xã Điền Xá	362
14059	Xã Trực Thanh	363
409	Xã Quang Tiến	14
508	Xã Hải Bối	15
628	Phường Tây Mỗ	19
399	Phường Cổ Nhuế 2	17
9562	Phường Yên Nghĩa	268
9646	Xã Phú Phương	271
9742	Xã Thọ Lộc	272
9832	Thị trấn Trạm Trôi	274
9922	Xã Phú Cát	275
10003	Xã Thạch Xá	276
10096	Xã Đồng Phú	277
10192	Xã Duyên Thái	279
10282	Xã Nam Tiến	280
10375	Xã Liên Bạt	281
10465	Xã Hồng Sơn	282
823	Xã Thắng Mố	28
832	Xã Bạch Đích	28
919	Xã Minh Tân	24
525	Xã Đường Hồng	25
1108	Xã Xín Mần	27
647	Xã Tiên Kiều	28
1296	Xã Nam Cao	34
765	Xã Đa Thông	37
1498	Xã Khâm Thành	39
926	Xã Cách Linh	49
1020	Xã Tam Kim	42
1879	Xã Cổ Linh	48
1978	Xã Sĩ Bình	51
2080	Xã Bình Trung	52
2191	Xã Xuân Dương	54
2368	Xã Linh Phú	59
1311	Xã Kiến Thiết	61
2569	Xã Phúc Ứng	62
2668	Phường Bắc Cường	80
1521	Thị trấn Mường Khương	83
2869	Xã Bản Liền	85
2962	Xã Xuân Hoà	87
1588	Xã Sơn Thuỷ	89
1749	Xã Mường Phăng	94
1683	Xã Xín Chải	98
1747	Xã Hua Thanh	100
3384	Xã Tìa Dình	101
3409	Xã San Thàng	105
3499	Xã Hồng Thu	108
3589	Xã Mường So	109
3488	Xã Nậm Pì	112
2014	Xã Chiềng Ngàm	119
3829	Xã Chiềng Muôn	120
3916	Xã Huy Thượng	122
2061	Xã Hua Păng	123
2138	Xã Chiềng Mai	125
2235	Phường Nam Cường	132
4297	Xã Nghĩa Phúc	133
4378	Xã Lang Thíp	136
2364	Xã Lao Chải	137
4588	Xã Túc Đán	139
4699	Xã Chấn Thịnh	140
4792	Phường Tân Hòa	148
4876	Xã Cao Sơn	150
5080	Xã Sào Báy	153
5209	Xã Pà Cò	156
2904	Xã Bình Sơn	165
5728	Xã Vũ Chấn	170
5803	Xã Tiên Hội	171
5896	Xã Đông Cao	172
5992	Xã Mai Pha	178
6088	Xã Quang Trung	181
6193	Xã Thanh Lòa	183
6298	Xã Bình Phúc	184
6589	Xã Sàn Viên	188
6679	Phường Hùng Thắng	193
3557	Xã Hải Xuân	194
6838	Thị trấn Bình Liêu	198
6937	Xã Quảng Thịnh	201
7078	Xã Tràng Lương	205
3705	Xã Cẩm La	206
3757	Xã Đồng Vương	215
7348	Xã Ngọc Châu	216
3893	Xã Thanh Lâm	218
3953	Xã Hồng Giang	219
4019	Xã Tuấn Đạo	220
7786	Xã Tiên Sơn	222
7876	Xã Hương Lâm	223
7954	Xã Phú Hộ	228
8065	Xã Hà Lương	231
8209	Xã Đông Thành	232
8311	Xã Trung Sơn	234
8419	Xã Văn Khúc	235
8575	Xã Giáp Lai	238
8551	Xã Thu Ngạc	240
8747	Phường Đồng Xuân	244
8884	Xã Đạo Tú	247
8971	Xã Phú Xuân	249
9112	Thị Trấn Thổ Tang	252
8848	Xã Đồng Thịnh	253
9220	Xã Yên Phụ	258
9328	Xã Nội Duệ	260
9418	Xã An Bình	262
9508	Xã Mỹ Hương	264
11002	Phường Thạch Khôi	288
10618	Xã Hiệp Cát	291
10723	Phường An Sinh	292
10825	Xã Tân Việt	294
10933	Xã Cẩm Phúc	295
11050	Xã Hồng Hưng	297
11152	Xã Hà Thanh	298
11269	Xã Tứ Cường	300
11377	Phường An Dương	305
11452	Phường Tràng Minh	307
11518	Xã Cao Nhân	311
11608	Xã Nam Sơn	312
11710	Xã Ngũ Phúc	314
11809	Xã Hùng Thắng	315
11902	Xã Cao Minh	316
12382	Xã Phương Chiểu	323
12067	Xã Liêu Xá	327
12157	Xã Tân Phúc	329
12250	Xã Liên Khê	330
12346	Xã Nhật Tân	332
12442	Phường Kỳ Bá	336
12514	Xã An Ninh	338
12607	Xã Hùng Dũng	339
12694	Xã Đông Phương	340
12796	Xã Đông Quang	340
12916	Xã Dương Hồng  Thủy	341
13027	Xã Phương Công	342
13129	Xã Vũ An	343
13222	Xã Minh Lãng	344
13315	Phường Thanh Châu	347
13399	Xã Nhật Tựu	350
13504	Xã Bình Nghĩa	352
13615	Xã Nhân Chính	353
13702	Xã Lộc An	356
13789	Xã Tam Thanh	359
13876	Xã Yên Bằng	360
13969	Xã Nam Mỹ	362
14062	Xã Trực Khang	363
418	Xã Tiên Dược	14
332	Xã Võng La	15
619	Phường Phú Diễn	17
8980	Xã Thạch Đà	250
9580	Phường Ngô Quyền	269
9673	Xã Cẩm Lĩnh	271
9769	Xã Phụng Thượng	272
9859	Xã Sơn Đồng	274
9949	Xã Hòa Thạch	275
10030	Xã Đông Phương Yên	277
10129	Xã Mỹ Hưng	278
10219	Xã Tự Nhiên	279
10312	Xã Nam Triều	280
10402	Xã Hòa Lâm	281
10492	Xã Hùng Tiến	282
856	Xã Ngam La	28
709	Xã Kim Linh	24
518	Xã Yên Cường	25
1099	Xã Nàn Xỉn	27
1198	Xã Việt Hồng	28
1290	Thị trấn Pác Miầu	34
758	Xã Cần Yên	37
1483	Xã Phong Nậm	39
899	Xã Phúc Sen	49
999	Xã Minh Tâm	42
1864	Xã Bộc Bố	48
1957	Xã Thượng Quan	50
1074	Xã Lương Bằng	52
1147	Xã Côn Minh	54
1218	Xã Minh Quang	57
1262	Xã Vinh Quang	59
2458	Xã Trung Sơn	61
2584	Xã Quyết Thắng	62
2680	Xã Hợp Thành	80
1531	Xã Nấm Lư	83
2878	Xã Cốc Ly	85
2971	Xã Kim Sơn	87
1595	Xã Nậm Rạng	89
1641	Phường Na Lay	95
1690	Xã Tả Phìn	98
1759	Xã Thanh Chăn	100
3286	Xã Mường Đăng	102
3509	Xã Lùng Thàng	108
3538	Xã Căn Co	108
1925	Xã Trung Đồng	111
3799	Xã Muổi Nọi	119
3841	Xã Tạ Bú	120
3928	Xã Huy Hạ	122
2075	Xã Phiêng Luông	123
2145	Xã Chiềng Nơi	125
2201	Xã Sốp Cộp	127
2400	Xã Âu Lâu	132
4339	Xã Yên Thắng	135
4429	Xã Đại Sơn	136
2399	Xã Lương Thịnh	138
2473	Xã Sơn Lương	140
2546	Xã Bạch Hà	141
4846	Xã Mường Chiềng	150
4999	Xã Tú Sơn	153
2676	Xã Tử Nê	155
5290	Xã Nhân Nghĩa	157
5419	Xã Đồng Tâm	159
3016	Phường Đồng Bẩm	164
5596	Xã Bộc Nhiêu	167
5698	Xã Hợp Tiến	169
5821	Xã Khôi Kỳ	171
5911	Xã Bàn Đạt	173
6139	Xã Bắc Hùng	182
3226	Xã Công Sơn	183
3376	Xã Hòa Thắng	186
6493	Xã Bằng Mạc	187
3474	Xã Bính Xá	189
7039	Xã Tân Dân	193
6787	Phường Cẩm Thạch	195
6883	Xã Đông Hải	199
6988	Xã Đồn Đạc	202
3663	Phường Yên Thọ	205
3720	Phường Hoàng Văn Thụ	213
3779	Xã Lan Giới	216
7396	Xã An Hà	217
3911	Xã Trường Sơn	218
3968	Xã Mỹ An	219
7729	Xã Tiến Dũng	221
7846	Xã Lương Phong	223
7936	Xã Sông Lô	227
8032	Xã Vụ Quang	230
8164	Xã Hanh Cù	232
8275	Xã Bình Phú	233
8392	Xã Phú Khê	235
8518	Xã Sơn Vi	237
8680	Xã Bảo Yên	239
8731	Xã Thanh Trù	243
8866	Xã Sơn Đông	246
8959	Xã Sơn Lôi	249
9100	Xã Đại Đồng	252
8824	Thị trấn Tam Sơn	253
9202	Xã Tam Giang	258
9310	Xã Đức Long	259
9406	Xã Đại Đồng Thành	262
9496	Thị trấn Thứa	264
10663	Xã An Thượng	288
10612	Xã Nam Tân	291
10714	Phường Phú Thứ	292
10816	Xã Hồng Lạc	294
10930	Xã Tân Trường	295
11044	Xã Toàn Thắng	297
11143	Xã Tiên Động	298
11257	Xã Tân Trào	300
11365	Phường Đổng Quốc Bình	304
11440	Phường Ngọc Sơn	307
11506	Xã Quảng Thanh	311
11596	Xã Tân Tiến	312
11698	Xã Thuận Thiên	314
11797	Xã Tiên Thắng	315
11890	Xã Hoà Bình	316
11977	Xã Hồng Nam	323
12052	Thị trấn Yên Mỹ	327
12145	Xã Phù Ủng	329
12238	Xã Dân Tiến	330
12340	Xã Hưng Đạo	332
12439	Phường Đề Thám	336
12511	Xã Quỳnh Minh	338
12604	Xã Hòa Tiến	339
12691	Xã Đô Lương	340
12793	Xã Đông Quan	340
12919	Xã Thái Giang	341
13033	Xã Tây Tiến	342
13132	Xã Quang Lịch	343
13231	Xã Dũng Nghĩa	344
13366	Xã Tiên Tân	347
13393	Xã Lê Hồ	350
13501	Thị trấn Bình Mỹ	352
13609	Xã Nhân Mỹ	353
13699	Phường Mỹ Xá	356
13792	Xã Vĩnh Hào	359
13888	Xã Yên Trị	360
13984	Xã Hồng Quang	362
14074	Xã Trực Cường	363
269	Xã Tân Dân	14
339	Xã Đông Hội	15
412	Phường Đại Mỗ	19
8973	Thị trấn Chi Đông	250
9568	Phường Phú Lãm	268
9652	Xã Thái Hòa	271
9748	Xã Thượng Cốc	272
9838	Xã Minh Khai	274
9928	Xã Nghĩa Hương	275
10009	Xã Hạ Bằng	276
10102	Xã Văn Võ	277
10198	Xã Hòa Bình	279
10291	Xã Đại Thắng	280
10381	Xã Đồng Tiến	281
10471	Xã Xuy Xá	282
482	Xã Tả Lủng	22
835	Xã Na Khê	28
922	Xã Thuận Hoà	24
1018	Xã Phiêng Luông	25
588	Xã Thèn Phàng	27
648	Xã Vĩnh Hảo	28
1297	Xã Nam Quang	34
1378	Xã Ngọc Động	37
833	Xã Chí Viễn	39
933	Xã Tiên Thành	49
1780	Xã Thịnh Vượng	42
1885	Xã Cao Tân	48
1984	Xã Đôn Phong	51
2086	Thị trấn Đồng Tâm	53
1158	Phường Tân Quang	56
1213	Xã Sơn Phú	58
2386	Xã Yên Lâm	60
2485	Xã Công Đa	61
2608	Xã Hồng Lạc	62
1473	Xã Y Tý	82
2794	Xã Tả Thàng	83
2899	Xã Bản Cái	85
2992	Xã Lương Sơn	87
3094	Xã Làng Giàng	89
1707	Thị trấn Tuần Giáo	99
3299	Xã Chiềng Đông	99
1790	Xã Keo Lôm	101
3388	Phường Quyết Tiến	105
3478	Thị trấn Sìn Hồ	108
3580	Xã Hoang Thèn	109
1853	Xã Nậm Hàng	112
2007	Xã Mường é	119
3820	Xã Ngọc Chiến	120
3907	Xã Mường Cơi	122
2048	Xã Nà Mường	123
2131	Xã Chiềng Mung	125
2187	Xã Mường Sai	126
2228	Phường Nguyễn Phúc	132
2263	Xã An Lạc	135
2319	Xã An Thịnh	136
2379	Xã Hòa Cuông	138
2456	Xã Tú Lệ	140
2535	Xã Mông Sơn	141
4918	Phường Trung Minh	148
4984	Xã Đú Sáng	153
5269	Xã Quý Hòa	157
5278	Xã Tuân Đạo	157
5395	Xã Phú Nghĩa	159
2987	Xã Sơn Cẩm	164
5584	Xã Trung Lương	167
5686	Xã Khe Mo	169
5791	Xã Phú Thịnh	171
5881	Xã Thành Công	172
5977	Phường Vĩnh Trại	178
3131	Xã Hoa Thám	181
6178	Xã  Hoàng Văn Thụ	182
6283	Xã An Sơn	184
6388	Xã Hữu Liên	186
6499	Xã Lâm Sơn	187
3621	Xã Hòa Bình	193
6718	Phường Hoà Lạc	194
6817	Phường Quang Trung	196
6916	Xã Đầm Hà	200
7018	Xã Bản Sen	203
7687	Xã Tân Mỹ	213
7258	Xã Đồng Hưu	215
3971	Xã Nam Dương	219
4034	Xã Quỳnh Sơn	221
7825	Xã Hoàng Thanh	223
7915	Phường Bến Gót	227
8005	Xã Phúc Lai	230
8131	Xã Vô Tranh	231
8245	Xã Trung Giáp	233
8350	Xã Ngô Xá	235
8479	Xã Thọ Văn	236
8638	Xã Đông Cửu	238
8596	Xã Văn Luông	240
8788	Xã Thái Hòa	246
8917	Xã Yên Dương	248
9061	Xã Trung Kiên	251
9154	Xã Vĩnh Thịnh	252
9226	Phường Vạn An	256
9295	Xã Bồng Lai	259
9391	Phường Tân Hồng	261
9481	Xã Nhân Thắng	263
10534	Phường Lê Thanh Nghị	288
10594	Phường An Lạc	290
10702	Phường Minh Tân	292
10804	Xã Đồng Cẩm	293
10906	Xã Thạch Lỗi	295
11032	Xã Tân Tiến	297
11134	Xã Quang Trung	298
11248	Xã Ngô Quyền	300
11338	Phường Cầu Tre	304
11425	Phường Tràng Cát	306
11494	Xã Gia Minh	311
11584	Xã Lê Thiện	312
11668	Xã Mỹ Đức	313
11785	Xã Đoàn Lập	315
11878	Xã Thanh Lương	316
11962	Phường Minh Khai	323
12037	Xã Vĩnh Khúc	326
12124	Phường Bạch Sam	328
12217	Xã Hàm Tử	330
12307	Xã Nhân La	331
12412	Xã Đình Cao	333
12484	Xã Quỳnh Lâm	338
12577	Xã Quỳnh Trang	338
12664	Xã Kim Chung	339
12757	Xã Đông Các	340
12877	Xã Thụy Dân	341
13000	Xã Đông Hoàng	342
13111	Xã Vũ Lễ	343
13207	Xã Phúc Thành	344
13300	Phường Trần Hưng Đạo	347
13363	Xã Tiên Ngoại	349
13486	Xã Thanh Hương	351
13591	Xã Đức Lý	353
13684	Phường Lộc Hạ	356
13771	Xã Minh Tân	359
13864	Xã Yên Thắng	360
13951	Xã Phúc Thắng	361
469	Xã Nam Hồng	15
377	Xã Dương Xá	18
682	Xã Liên Ninh	16
9019	Xã Tiền Phong	250
9616	Xã Cổ Đông	269
9709	Xã Yên Bài	271
9805	Xã Hạ Mỗ	273
9895	Thị trấn Quốc Oai	275
9976	Xã Kim Quan	276
10069	Xã Nam Phương Tiến	277
10147	Xã Thanh Mai	278
10237	Xã Chương Dương	279
10330	Xã Vân Từ	280
10420	Xã Đội Bình	281
691	Phường Trần Phú	20
781	Xã Pả Vi	23
874	Thị trấn Tam Sơn	29
961	Xã Linh Hồ	24
553	Xã Tân Tiến	26
615	Xã Nà Chì	27
672	Xã Tân Trịnh	29
1519	Xã Cao Thăng	39
902	Xã Chí Thảo	49
1000	Xã Thể Dục	42
1867	Xã Công Bằng	48
1960	Xã Hiệp Lực	50
1077	Xã Bằng Lãng	52
1150	Xã Cư Lễ	54
1169	Thị trấn Na Hang	58
2359	Xã Tri Phú	59
1329	Xã Tân Tiến	61
2587	Xã Đồng Quý	62
1510	Xã Cốc San	80
1534	Xã Lùng Khấu Nhin	83
2881	Xã Nậm Mòn	85
2974	Xã Cam Cọn	87
1598	Xã Nậm Chầy	89
3184	Xã Lay Nưa	95
1756	Xã Thanh Xương	100
1676	Xã Mường Luân	101
3198	Xã Phìn Hồ	103
3568	Xã Mù Sang	109
1952	Xã Tà Gia	110
3682	Xã Mường Chiên	118
3790	Xã Nậm Lầu	119
3886	Xã Hồng Ngài	121
3973	Xã Nam Phong	122
4099	Xã Phiêng Khoài	124
4186	Xã Nậm Ty	126
4684	Xã Thạch Lương	133
2288	Xã Trúc Lâu	135
2350	Thị trấn Mù Căng Chải	137
2424	Xã Hồng Ca	138
2486	Xã Nghĩa Sơn	140
2553	Xã Vĩnh Kiên	141
4852	Xã Đồng Chum	150
2575	Xã Xuân Thủy	153
5182	Xã Nhân Mỹ	155
2757	Xã Yên Phú	157
2834	Xã Yên Bồng	159
5593	Xã Phú Tiến	167
2963	Xã Yên Lạc	168
3043	Xã Lâu Thượng	170
5842	Xã Văn Yên	171
5932	Xã Thượng Đình	173
3093	Xã Đội Cấn	180
3153	Xã Tân Văn	181
3219	Xã Hòa Cư	183
6358	Xã Chiêu Vũ	185
3372	Xã Sơn Hà	186
6559	Xã Tam Gia	188
3515	Phường Bãi Cháy	193
3550	Phường Hải Yên	194
6832	Phường Phương Đông	196
6922	Thị trấn Quảng Hà	201
3607	Xã Ngọc Vừng	203
7159	Phường Tân An	206
3747	Xã Đồng Tiến	215
3806	Xã Cao Xá	216
3942	Xã Sơn Hải	219
4065	Xã Tư Mại	221
7804	Xã Vân Hà	222
7900	Phường Gia Cẩm	227
7984	Xã Vân Du	230
8113	Xã Yên Kỳ	231
8233	Xã Phú Mỹ	233
8332	Xã Minh Hòa	234
8446	Xã Thanh Uyên	236
8611	Xã Văn Miếu	238
8557	Xã Đồng Sơn	240
8752	Xã Cao Minh	244
8890	Xã Thanh Vân	247
9034	Xã Bình Định	251
9127	Xã Thượng Trưng	252
9166	Phường Đáp Cầu	256
9241	Xã Đông Thọ	258
9346	Xã Việt Đoàn	260
9433	Xã Xuân Lâm	262
9520	Xã Lai Hạ	264
11077	Xã Ngọc Sơn	288
10636	Xã An Sơn	291
10747	Xã Minh Hòa	292
10852	Xã Thanh Xá	294
10963	Xã Long Xuyên	296
11074	Thị trấn Tứ Kỳ	298
11185	Xã Vĩnh Hòa	299
11299	Phường Hùng Vương	303
11395	Phường Đông Hải	305
11683	Phường Đa Phúc	309
11539	Xã Ngũ Lão	311
11626	Xã Hồng Thái	312
11728	Xã Đại Hà	314
11827	Xã Dũng Tiến	316
11917	Thị trấn Cát Hải	317
11989	Xã Lạc Đạo	325
12079	Xã Yên Phú	327
12166	Xã Xuân Trúc	329
12253	Xã Phùng Hưng	330
12349	Xã Dị Chế	332
12448	Phường Phú Khánh	336
12523	Thị trấn An Bài	338
12616	Xã Đoan Hùng	339
12703	Xã Đông Sơn	340
12808	Xã Đông Hoàng	340
12937	Xã Thái Hưng	341
13045	Xã Nam Chính	342
13150	Xã Vũ Trung	343
13246	Xã Tự Tân	344
13447	Xã Liêm Tiết	347
13414	Xã Thụy Lôi	350
13525	Xã Đồn Xá	352
13648	Phường Cửa Bắc	356
13738	Xã Mỹ Thành	358
13825	Xã Yên Bình	360
13918	Xã Nghĩa Sơn	361
14008	Xã Nam Lợi	362
14098	Xã Xuân Thành	364
14188	Xã Giao Châu	365
317	Xã Vân Hà	15
380	Xã Đông Dư	18
685	Xã Đông Mỹ	16
9022	Xã Tráng Việt	250
9619	Thị trấn Tây Đằng	271
9712	Xã Khánh Thượng	271
9808	Xã Liên Trung	273
9898	Xã Sài Sơn	275
9979	Xã Dị Nậu	276
10072	Xã Hợp Đồng	277
10153	Xã Đỗ Động	278
10243	Xã Lê Lợi	279
10336	Xã Đại Xuyên	280
10426	Xã Đông Lỗ	281
694	Phường Nguyễn Trãi	20
787	Xã Sủng Trà	23
880	Xã Nghĩa Thuận	29
967	Xã Việt Lâm	24
622	Thị trấn Vĩnh Tuy	28
636	Xã Thượng Bình	28
702	Phường Tân Giang	32
1348	Xã Hồng An	35
818	Xã Xuân Nội	39
828	Xã Quốc Toản	49
1708	Xã Bạch Đằng	41
1816	Xã Trọng Con	43
1918	Xã Yến Dương	49
1040	Thị trấn Bằng Lũng	52
1354	Phường An Tường	56
2239	Xã Thượng Nông	58
1273	Xã Bình Nhân	59
1336	Xã Tân Long	61
2596	Xã Văn Phú	62
2689	Xã Nậm Chạc	82
2785	Xã Lùng Vai	83
2890	Xã Bảo Nhai	85
2983	Xã Việt Tiến	87
3085	Xã Nậm Xé	89
1647	Xã Chung Chải	96
1700	Xã Sáng Nhè	98
1766	Xã Thanh Yên	100
1802	Xã Bình Lư	106
1824	Xã Tá Bạ	107
3490	Xã Huổi Luông	109
1928	Xã Nậm Cần	111
1987	Xã Mường Giàng	118
3802	Xã Pá Lông	119
3892	Xã Phiêng Côn	121
3982	Thị trấn NT Mộc Châu	123
4108	Xã Chiềng Sung	125
4198	Xã Nà Nghịu	126
4249	Phường Yên Thịnh	132
2250	Xã Khánh Thiện	135
2309	Xã Mậu Đông	136
2369	Xã Tân Đồng	138
2445	Xã Bản Mù	139
4729	Xã Ngọc Chấn	141
4894	Phường Kỳ Sơn	148
4969	Xã Liên Sơn	152
5119	Xã Nam Phong	154
2735	Xã Mai Hịch	156
5482	Phường Tân Long	164
2910	Thị trấn Chợ Chu	167
5749	Xã Phương Giao	170
5812	Xã Hà Thượng	171
5902	Xã Tân Phú	172
5998	Xã Khánh Long	180
6094	Xã Minh Khai	181
6199	Xã Thạch Đạn	183
3278	Xã Tràng Phái	184
3341	Xã Minh Tiến	186
3491	Xã Đồng Thắng	189
6685	Phường Trần Hưng Đạo	193
3564	Xã Vĩnh Trung	194
6853	Xã Vô Ngại	198
6949	Xã Đường Hoa	201
7090	Xã Bình Dương	205
7183	Phường Phong Cốc	206
3768	Xã Đồng Lạc	215
3830	Xã Quế Nham	216
7483	Xã Cương Sơn	218
3960	Xã Giáp Sơn	219
4026	Xã Long Sơn	220
7789	Xã Tăng Tiến	222
7885	Xã Mai Đình	223
7963	Xã Hà Thạch	228
8089	Xã Phương Viên	231
8218	Xã Thanh Hà	232
8317	Xã Nga Hoàng	234
8428	Xã Điêu Lương	235
8581	Xã Thục Luyện	238
8545	Xã Thu Cúc	240
8746	Phường Xuân Hoà	244
8881	Xã Hướng Đạo	247
9025	Thị trấn Yên Lạc	251
9115	Xã Vĩnh Sơn	252
8860	Xã Cao Phong	253
9229	Xã Đông Phong	258
9337	Xã Hiên Vân	260
9424	Xã Gia Đông	262
9511	Xã Tân Lãng	264
11005	Xã Liên Hồng	288
10621	Xã Thanh Quang	291
10732	Phường An Phụ	292
10834	Xã Thanh Lang	294
10954	Xã Hùng Thắng	296
11065	Xã Đồng Quang	297
11167	Xã Hồng Đức	299
11278	Xã Cao Thắng	300
11383	Phường Hồ Nam	305
11465	Phường Minh Đức	308
11530	Xã Trung Hà	311
11620	Xã Quốc Tuấn	312
11725	Xã Minh Tân	314
11830	Xã Giang Biên	316
11923	Xã Đồng Bài	317
11995	Xã Đại Đồng	325
12091	Xã Minh Châu	327
12184	Xã Nguyễn Trãi	329
12277	Xã Nhuế Dương	330
12373	Xã Thụy Lôi	332
12452	Phường Trần Hưng Đạo	336
12529	Xã Quỳnh Hội	338
12622	Xã Tân Hòa	339
12709	Xã Phú Lương	340
12823	Xã Minh Phú	340
12940	Xã Thái Đô	341
13048	Xã Bắc Hải	342
13153	Xã Vũ Thắng	343
13249	Xã Song An	344
13459	Phường Thanh Tuyền	347
13420	Xã Khả Phong	350
13528	Xã An Ninh	352
13645	Phường Quang Trung	356
13732	Xã Mỹ Thuận	358
13822	Xã Yên Chính	360
13915	Xã Nghĩa Trung	361
14005	Xã Nam Thanh	362
481	Xã Vân Nội	15
580	Xã Kiêu Kỵ	18
598	Phường Liên Mạc	17
9541	Phường Mộ Lao	268
9628	Xã Cổ Đô	271
9727	Xã Xuân Đình	272
9823	Xã Đan Phượng	273
9913	Xã Liệp Tuyết	275
9994	Xã Hữu Bằng	276
10087	Xã Mỹ Lương	277
10183	Thị trấn Thường Tín	279
10273	Thị trấn Phú Xuyên	280
10366	Xã Quảng Phú Cầu	281
10456	Xã Mỹ Thành	282
471	Xã Phố Là	22
815	Xã Niêm Tòng	23
907	Xã Tả Ván	29
994	Xã Minh Ngọc	25
1087	Xã Nậm Tỵ	26
1186	Xã Bằng Hành	28
1288	Phường Duyệt Trung	32
751	Xã Đình Phùng	35
825	Xã Cao Chương	39
1582	Xã Quảng Hưng	49
1846	Phường Huyền Tụng	58
1909	Xã Nam Mẫu	49
1033	Xã Mỹ Thanh	51
1095	Xã Nông Hạ	53
1347	Xã An Khang	56
1287	Xã Thái Sơn	60
1312	Xã Trung Minh	61
1395	Xã Cấp Tiến	62
1458	Xã Đồng Tuyển	80
1517	Xã Tả Ngải Chồ	83
2863	Xã Hoàng Thu Phố	85
2956	Xã Vĩnh Yên	87
1581	Thị trấn Khánh Yên	89
1742	Xã Nà Tấu	94
1679	Thị trấn Tủa Chùa	98
3319	Xã Mường Pồn	100
3382	Xã Phình Giàng	101
3493	Xã Pa Tần	108
1922	Xã Phúc Khoa	111
1972	Xã Chiềng Xôm	116
3778	Xã Bó Mười	119
3874	Xã Làng Chếu	121
3961	Xã Kim Bon	122
4087	Xã Yên Sơn	124
2172	Xã Pú Pẩu	126
2078	Xã Chiềng Khoa	128
2480	Xã Sơn A	133
4387	Xã Châu Quế Hạ	136
4483	Xã La Pán Tẩn	137
4597	Xã Phình Hồ	139
4708	Xã Minh An	140
4801	Phường Tân Thịnh	148
4924	Thị trấn Lương Sơn	152
5092	Xã Bình Thanh	154
2708	Xã Cun Pheo	156
2907	Xã Bá Xuyên	165
3033	Xã Thượng Nung	170
5809	Xã Cù Vân	171
5899	Xã Trung Thành	172
5995	Thị trấn Thất Khê	180
6091	Xã Thiện Thuật	181
6196	Xã Cao Lâu	183
3271	Xã Tân Đoàn	184
3334	Xã Thiện Tân	186
3407	Xã Quan Sơn	187
3494	Xã Bắc Lãng	189
3632	Xã Thống Nhất	193
6793	Phường Cẩm Trung	195
6889	Xã Tiên Lãng	199
6994	Thị trấn Cái Rồng	203
3664	Phường Hồng Phong	205
3726	Phường Mỹ Độ	213
3782	Thị trấn Nhã Nam	216
3842	Xã Mỹ Hà	217
3912	Xã Lục Sơn	218
7759	Xã Thượng Lan	222
7807	Xã Quang Châu	222
7903	Phường Tiên Cát	227
7987	Xã Phú Lâm	230
8119	Xã Minh Hạc	231
8236	Xã Liên Hoa	233
8341	Thị trấn Cẩm Khê	235
8470	Xã Quang Húc	236
8623	Xã Thắng Sơn	238
8578	Xã Tân Sơn	240
8767	Xã Ngọc Mỹ	246
8905	Xã Hợp Thịnh	247
9049	Xã Văn Tiến	251
9142	Xã Tam Phúc	252
9181	Phường Đại Phúc	256
9259	Xã Nhân Hòa	259
9361	Xã Minh Đạo	260
9448	Xã Nghĩa Đạo	262
10510	Phường Bình Hàn	288
10564	Xã Lê Lợi	290
10654	Xã Hồng Phong	291
10768	Xã Tuấn Việt	293
10879	Xã Thanh Hồng	294
10978	Xã Hồng Khê	296
11095	Xã Chí Minh	298
11203	Xã Đồng Tâm	299
11311	Phường Minh Khai	303
11407	Phường Vĩnh Niệm	305
11740	Phường Tân Thành	309
11554	Xã Kiền Bái	311
11644	Xã Quang Hưng	313
11758	Xã Đại Thắng	315
11854	Xã An Hoà	316
11941	Xã Trân Châu	317
12013	Xã Trưng Trắc	325
12109	Xã Cẩm Xá	328
12199	Xã Hồng Quang	329
12286	Xã Toàn Thắng	331
12391	Thị trấn Trần Cao	333
12466	Xã Vũ Phúc	336
12547	Xã An Vũ	338
12637	Xã Liên Hiệp	339
12724	Xã Đông Xá	340
12847	Xã An Tân	341
12964	Xã Thuần Thành	341
13063	Xã Nam Hồng	342
13171	Xã Minh Quang	343
13264	Xã Việt Thuận	344
13327	Xã Mộc Bắc	349
13432	Xã Liên Sơn	350
13540	Xã An Nội	352
13672	Phường Năng Tĩnh	356
13765	Xã Trung Thành	359
13858	Xã Yên Quang	360
13948	Xã Nghĩa Thành	361
14038	Xã Liêm Hải	363
14128	Xã Xuân Phú	364
484	Xã Liên Hà	15
586	Xã Kim Lan	18
386	Phường Đức Thắng	17
9542	Phường Văn Quán	268
9631	Xã Tản Hồng	271
9724	Xã Vân Nam	272
9820	Xã Tân Lập	273
9910	Xã Ngọc Mỹ	275
9991	Xã Cần Kiệm	276
10084	Xã Quảng Bị	277
10180	Xã Hồng Dương	278
10270	Thị trấn Phú Minh	280
10363	Xã Hoa Sơn	281
10453	Xã Phúc Lâm	282
468	Xã Lũng Táo	22
814	Xã Khâu Vai	23
904	Xã Quyết Tiến	29
991	Thị trấn Yên Phú	25
1084	Xã Nam Sơn	26
1183	Xã Việt Vinh	28
1285	Phường Hoà Chung	32
831	Thị trấn Trùng Khánh	39
1648	Thị trấn Hoà Thuận	49
1729	Thị trấn Tĩnh Túc	42
1849	Xã Dương Quang	58
1942	Xã Bằng Vân	50
1060	Xã Yên Thịnh	52
1130	Xã Cường Lợi	54
2269	Xã Thượng Lâm	57
2338	Xã Phúc Thịnh	59
1305	Xã Quí Quân	61
1447	Phường Kim Tân	80
2719	Xã Mường Vi	82
2818	Xã Lùng Thẩn	84
2920	Xã Phong Niên	86
1544	Xã Trung Chải	88
1613	Xã Thẩm Dương	89
3178	Xã Xá Tổng	97
3269	Xã Pú Xi	99
1781	Xã Na Tông	100
1655	Xã Na Cô Sa	103
1892	Xã Nậm Cuổi	108
1982	Xã Hua La	116
2032	Xã Mường Bám	119
3859	Xã Phiêng Ban	121
3946	Xã Sập Xa	122
2106	Xã Chiềng Pằn	124
4159	Xã Phiêng Pằn	125
2214	Xã Mường Lạn	127
4285	Phường Trung Tâm	133
2344	Xã Mỏ Vàng	136
4528	Xã Nga Quán	138
2469	Xã An Lương	140
2542	Xã Tân Hương	141
4834	Xã Nánh Nghê	150
4990	Xã Bình Sơn	153
5158	Xã Phong Phú	155
5284	Xã Văn Sơn	157
2820	Xã Hưng Thi	159
3009	Xã Linh Sơn	164
5590	Xã Điềm Mặc	167
5692	Xã Hóa Thượng	169
5794	Xã Phục Linh	171
5887	Xã Vạn Phái	172
5983	Phường Chi Lăng	178
6079	Xã Hồng Phong	181
6184	Thị trấn Đồng Đăng	183
6292	Xã Lương Năng	184
6397	Xã Hòa Bình	186
6508	Xã Hòa Bình	187
3540	Xã Hải Sơn	194
6802	Xã Cẩm Hải	195
6898	Xã Quảng Lâm	200
3587	Xã Vạn Yên	203
7129	Xã Yên Đức	205
3730	Xã Song Mai	213
3789	Xã Quang Tiến	216
3849	Xã Tân Thanh	217
7519	Xã Cẩm Lý	218
3992	Xã Phúc Sơn	220
4085	Xã Nghĩa Trung	222
7861	Xã Danh Thắng	223
8515	Xã Thanh Đình	227
8047	Xã Chân Mộng	230
8194	Xã Võ Lao	232
8296	Xã Mỹ Lương	234
8401	Xã Hương Lung	235
8533	Xã Vĩnh Lại	237
8554	Xã Kiệt Sơn	240
8755	Phường Nam Viêm	244
8896	Xã Hoàng Đan	247
9040	Xã Tề Lỗ	251
9133	Xã Lý Nhân	252
9169	Phường Thị Cầu	256
9238	Xã Văn Môn	258
9349	Xã Phật Tích	260
9439	Xã Ngũ Thái	262
9532	Xã Phú Lương	264
10555	Xã Hoàng Hoa Thám	290
10645	Xã An Lâm	291
10756	Xã Cộng Hòa	293
10864	Xã An Phượng	294
10975	Xã Bình Minh	296
11092	Xã Bình Lăng	298
11206	Xã Tân Quang	299
11308	Phường Hạ Lý	303
11405	Phường Kênh Dương	305
11692	Phường Hải Thành	309
11551	Xã Lập Lễ	311
11641	Xã An Tiến	313
11752	Xã Đại Hợp	314
11851	Xã Hùng Tiến	316
11944	Xã Việt Hải	317
12016	Xã Lạc Hồng	325
12106	Phường Phan Đình Phùng	328
12196	Xã Hồng Vân	329
12289	Xã Vĩnh Xá	331
12397	Xã Phan Sào Nam	333
13225	Xã Tân Bình	336
12562	Xã Quỳnh Nguyên	338
12652	Xã Thái Phương	339
12739	Xã Hồng Việt	340
12859	Xã Thụy Văn	341
12979	Xã Đông Long	342
13075	Thị trấn Kiến Xương	343
13183	Xã Bình Thanh	343
13276	Xã Vũ Vân	344
13342	Phường Duy Hải	349
13456	Xã Liêm Cần	351
13570	Xã Nguyên Lý	353
13669	Phường Trần Đăng Ninh	356
13762	Xã Cộng Hòa	359
13855	Xã Yên Hồng	360
13942	Xã Nghĩa Hùng	361
14035	Xã Trung Đông	363
14125	Xã Thọ Nghiệp	364
478	Xã Uy Nỗ	15
592	Phường Cầu Diễn	19
9550	Phường Quang Trung	268
10123	Phường Biên Giang	268
9664	Xã Vật Lại	271
9760	Xã Trạch Mỹ Lộc	272
9850	Xã Cát Quế	274
9940	Xã Phú Mãn	275
10021	Xã Phụng Châu	277
10114	Thị trấn Kim Bài	278
10210	Xã Vân Tảo	279
10303	Xã Hoàng Long	280
10393	Xã Tảo Dương Văn	281
10483	Xã Vạn Kim	282
492	Xã Lũng Thầu	22
847	Xã Mậu Duệ	28
934	Xã Phong Quang	24
536	Xã Thèn Chu Phìn	26
1219	Xã Đông Thành	28
689	Xã Tiên Yên	29
734	Xã Khánh Xuân	35
1438	Xã Ngọc Đào	37
884	Xã Thống Nhất	48
1699	Xã Nguyễn Huệ	41
1810	Xã Thụy Hùng	43
1912	Xã Thượng Giáo	49
1036	Xã Dương Phong	51
2509	Phường Mỹ Lâm	56
1176	Xã Thượng Giáp	58
1269	Xã Yên Nguyên	59
1335	Xã Đạo Viện	61
2593	Xã Vân Sơn	62
2686	Xã A Mú Sung	82
2782	Xã Cao Sơn	83
2887	Xã Nậm Khánh	85
2980	Xã Xuân Thượng	87
3082	Xã Khánh Yên Thượng	89
1645	Xã Sen Thượng	96
1697	Xã Sính Phình	98
1763	Xã Thanh An	100
3292	Xã Ẳng Tở	102
1798	Xã Hồ Thầu	106
1868	Xã Sà Dề Phìn	108
3619	Xã Mường Than	110
1958	Phường Chiềng Lề	116
2021	Xã Phổng Lập	119
3850	Xã Chiềng Hoa	120
3937	Xã Suối Bau	122
2099	Xã Chiềng Đông	124
2152	Xã Chiềng Kheo	125
2211	Xã Mường Và	127
4282	Phường Pú Trạng	133
2343	Xã Viễn Sơn	136
2466	Xã Nậm Mười	140
2525	Xã Phúc Ninh	141
4903	Xã Hợp Thành	148
2652	Xã Suối Hoa	155
5293	Xã Thượng Cốc	157
5383	Xã Phú Lai	158
5494	Xã Phúc Trìu	164
3001	Xã Hòa Bình	169
3029	Xã Thần Xa	170
5830	Xã Bình Thuận	171
5920	Xã Tân Kim	173
3080	Xã Cao Minh	180
3142	Xã Mông Ân	181
6208	Xã Thụy Hùng	183
3282	Xã Hữu Lễ	184
3348	Xã Đồng Tân	186
3501	Phường Hà Khẩu	193
6688	Phường Hồng Hải	193
3561	Phường Bình Ngọc	194
6847	Xã Đồng Văn	198
6946	Xã Quảng Long	201
7084	Xã Việt Dân	205
3711	Phường Yên Hải	206
3764	Xã Tiến Thắng	215
3827	Xã Ngọc Lý	216
3903	Xã Phương Sơn	218
3963	Xã Biển Động	219
7682	Thị trấn Tân An	221
7798	Xã Ninh Sơn	222
7894	Phường Nông Trang	227
7975	Xã Hùng Xuyên	230
8104	Xã Hương Xạ	231
8227	Xã Lương Lỗ	232
8323	Xã Thượng Long	234
8434	Thị trấn Hưng Hoá	236
8587	Xã Thạch Khoán	238
8701	Xã Tu Vũ	239
8743	Phường Phúc Thắng	244
8878	Xã Kim Long	247
8968	Thị trấn Thanh Lãng	249
9109	Xã Cao Đại	252
8851	Xã Tứ Yên	253
9217	Xã Đông Tiến	258
9334	Xã Liên Bão	260
9421	Xã Trí Quả	262
9514	Xã Quảng Phú	264
11017	Xã Gia Xuyên	288
10630	Xã An Bình	291
10735	Phường Hiệp An	292
10843	Xã Liên Mạc	294
10951	Xã Vĩnh Hưng	296
11068	Xã Nhật Tân	297
11179	Xã Tân Hương	299
11293	Xã Hồng Phong	300
11392	Phường Hàng Kênh	305
11737	Phường Hợp Đức	308
11542	Xã Phục Lễ	311
11635	Xã Trường Thọ	313
11749	Xã Tú Sơn	314
11845	Xã Vĩnh Long	316
11935	Xã Gia Luận	317
12004	Xã Đình Dù	325
12097	Xã Lý Thường Kiệt	327
12187	Xã Đa Lộc	329
12274	Xã Thành Công	330
12370	Xã Thiện Phiến	332
12817	Xã Đông Mỹ	336
12550	Xã An Lễ	338
12640	Xã Tây Đô	339
12727	Xã Chương Dương	340
12850	Xã Thụy Ninh	341
12967	Xã Thái Thọ	341
13072	Xã Nam Phú	342
13180	Xã Nam Bình	343
13273	Xã Vũ Tiến	344
13336	Phường Duy Minh	349
13453	Xã Thanh Hà	351
13558	Xã Tiêu Động	352
13627	Xã Tiến Thắng	353
13717	Xã Mỹ Thắng	358
13807	Xã Yên Lợi	360
13900	Xã Nghĩa Thịnh	361
314	Xã Tiên Dương	15
403	Phường Phương Canh	19
393	Phường Xuân Tảo	17
9552	Phường Phú La	268
9637	Xã Châu Sơn	271
9721	Xã Vân Phúc	272
9817	Xã Tân Hội	273
9907	Xã Ngọc Liệp	275
9988	Xã Thạch Hoà	276
10081	Xã Hữu Văn	277
10177	Xã Xuân Dương	278
10267	Xã Minh Cường	279
10360	Xã Viên Nội	281
10450	Xã Tuy Lai	282
465	Thị trấn Đồng Văn	22
811	Xã Nậm Ban	23
901	Xã Lùng Tám	29
988	Xã Yên Định	25
1081	Xã Hồ Thầu	26
1180	Xã Kim Ngọc	28
1282	Phường Đề Thám	32
746	Xã Hưng Thịnh	35
1468	Xã Quang Vinh	39
1579	Xã Phi Hải	49
972	Xã Lê Chung	41
1840	Phường Đức Xuân	58
1939	Xã Thượng Ân	50
1057	Xã Bằng Phúc	52
1126	Xã Kim Hỷ	54
1206	Thị trấn Lăng Can	57
1245	Xã Hòa Phú	59
1301	Xã Hùng Đức	60
1448	Phường Bắc Lệnh	80
1490	Xã Dền Thàng	82
2821	Xã Cán Cấu	84
2923	Xã Gia Phú	86
1547	Xã Tả Phìn	88
3118	Xã Liêm Phú	89
3181	Xã Mường Tùng	97
1721	Xã Pú Nhung	99
3168	Xã Nà Khoa	103
1660	Xã Nậm Khăn	103
3448	Xã Pa Vệ Sử	107
1899	Xã Mồ Sì San	109
1938	Xã Tà Mít	111
1994	Xã Nậm ét	118
3808	Thị trấn Ít Ong	120
3895	Xã Chiềng Sại	121
3985	Xã Chiềng Sơn	123
2121	Xã Mường Bằng	125
2177	Xã Nậm Mằn	126
2253	Xã Minh Chuẩn	135
2294	Xã Phan Thanh	135
2354	Xã Nậm Có	137
4579	Xã Việt Hồng	138
4690	Xã Đồng Khê	140
4783	Xã Phú Thịnh	141
4867	Xã Tú Lý	150
2613	Xã Kim Bôi	153
4882	Xã Tân Thành	156
5329	Xã Ngọc Sơn	157
2844	Phường Quang Vinh	164
5608	Thị trấn Giang Tiên	168
2966	Xã Ôn Lương	168
3040	Xã La Hiên	170
5839	Xã Vạn Thọ	171
5935	Xã Tân Hòa	173
3170	Xã Tân Tác	182
3313	Xã Tân Hương	185
3331	Xã Yên Sơn	186
3404	Xã Hữu Kiên	187
3631	Xã Bằng Cả	193
3543	Xã Bắc Sơn	194
6823	Phường Nam Khê	196
6919	Xã Đại Bình	200
3604	Xã Quan Lạn	203
7699	Xã Tân Tiến	213
3760	Xã Đồng Tâm	215
7528	Xã Cấm Sơn	219
3974	Xã Tân Mộc	219
4061	Xã Đức Giang	221
7849	Xã Hùng Sơn	223
8287	Xã Hùng Lô	227
8038	Xã Tiêu Sơn	230
8173	Xã Quảng Yên	232
8290	Thị trấn Yên Lập	234
8395	Xã Sơn Tình	235
8527	Xã Cao Xá	237
8671	Xã Tân Phương	239
8722	Phường Đồng Tâm	243
8845	Xã Văn Quán	246
8947	Xã Thiện Kế	249
9088	Xã Nghĩa Hưng	252
8806	Xã Đôn Nhân	253
9196	Xã Dũng Liệt	258
9307	Xã Mộ Đạo	259
9400	Thị trấn Hồ	262
9490	Xã Đại Bái	263
10543	Phường Việt Hoà	288
10609	Xã Nam Hưng	291
10717	Xã Thăng Long	292
10813	Thị trấn Thanh Hà	294
10924	Xã Lương Điền	295
11038	Xã Gia Lương	297
11137	Xã Phượng Kỳ	298
11254	Xã Hồng Quang	300
11359	Phường Đằng Giang	304
11437	Phường Nam Sơn	307
11509	Xã Chính Mỹ	311
11602	Xã An Hồng	312
11704	Xã Đại Đồng	314
11806	Xã Nam Hưng	315
11893	Xã Tiền Phong	316
11983	Xã Bảo Khê	323
12055	Xã Giai Phạm	327
12142	Thị trấn Ân Thi	329
12232	Xã Đông Kết	330
12322	Xã Ngọc Thanh	331
12424	Xã Minh Tiến	333
12493	Xã Quỳnh Hoàng	338
12586	Thị trấn Hưng Hà	339
12673	Xã Văn Lang	339
12769	Xã Đông Tân	340
12898	Xã Thụy Thanh	341
13021	Xã Tây Giang	342
13120	Xã Nam Cao	343
13216	Xã Tân Hòa	344
13312	Xã Liêm Chung	347
13387	Xã Nguyễn Úy	350
13492	Xã Thanh Tâm	351
13597	Thị trấn Vĩnh Trụ	353
13687	Phường Lộc Vượng	356
13780	Xã Kim Thái	359
13873	Xã Yên Lộc	360
13963	Xã Nam Điền	361
329	Xã Xuân Canh	15
410	Phường Phú Đô	19
400	Phường Phúc Diễn	17
9565	Phường Kiến Hưng	268
9649	Xã Phú Châu	271
9745	Xã Long Xuyên	272
9835	Xã Đức Thượng	274
9925	Xã Tuyết Nghĩa	275
10006	Xã Bình Phú	276
10099	Xã Trần Phú	277
10195	Xã Khánh Hà	279
10288	Xã Tri Trung	280
10378	Xã Sơn Công	281
10468	Xã Lê Thanh	282
739	Xã Tả Phìn	22
826	Xã Phú Lũng	28
913	Thị trấn Vị Xuyên	24
1009	Xã Thượng Tân	25
578	Xã Bản Díu	27
641	Xã Hùng An	28
1291	Xã Đức Hạnh	34
759	Xã Cần Nông	37
1489	Xã Đình Phong	39
1639	Xã Đại Sơn	49
1023	Xã Thành Công	42
1882	Xã Nghiên Loan	48
1981	Xã Vũ Muộn	51
2083	Xã Yên Phong	52
1155	Phường Minh Xuân	56
1203	Xã Khau Tinh	58
2383	Xã Minh Khương	60
2482	Xã Phú Thịnh	61
1413	Xã Thiện Kế	62
2695	Xã Trịnh Tường	82
2791	Xã La Pan Tẩn	83
2896	Xã Cốc Lầu	85
2989	Xã Bảo Hà	87
3091	Xã Chiềng Ken	89
3159	Xã Pá Mỳ	96
1704	Xã Mường Báng	98
1770	Xã Noọng Hẹt	100
1735	Xã Ẳng Nưa	102
1805	Xã Nùng Nàng	106
1872	Xã Tả Ngảo	108
3628	Xã Pha Mu	110
1962	Phường Quyết Thắng	116
2025	Xã Chiềng Ly	119
3856	Thị trấn Bắc Yên	121
3943	Xã Mường Do	122
4069	Xã Chiềng Sàng	124
2054	Xã Song Khủa	128
2082	Xã Quang Minh	128
2493	Xã Thanh Lương	133
4393	Xã Quang Minh	136
4489	Xã Chế Tạo	137
2435	Xã Tà Si Láng	139
2508	Thị trấn Yên Bình	141
4807	Phường Phương Lâm	148
4945	Xã Hòa Sơn	152
2625	Xã Thu Phong	154
2725	Xã Săm Khóe	156
2798	Xã Lạc Sỹ	158
2865	Phường Gia Sàng	164
5548	Xã Tân Thịnh	167
2984	Xã Cổ Lũng	168
3057	Thị trấn Hùng Sơn	171
5854	Phường Bãi Bông	172
5947	Xã Tân Đức	173
3104	Xã Đại Đồng	180
6148	Xã Thanh Long	182
3236	Xã Tân Liên	183
3323	Xã Vũ Lễ	185
6469	Xã Vân An	187
3463	Xã Xuân Dương	188
3523	Phường Việt Hưng	193
6769	Phường Cẩm Đông	195
6865	Xã Hà Lâu	199
6973	Xã Thanh Sơn	202
3650	Xã Thủy An	205
7195	Xã Đồng Tiến	207
7282	Xã Đồng Kỳ	215
7387	Xã Hương Sơn	217
7495	Xã Lan Mẫu	218
7591	Xã Đồng Cốc	219
4051	Xã Lãng Sơn	221
7840	Thị trấn Thắng	223
7927	Phường Minh Phương	227
8017	Xã Sóc Đăng	230
8143	Xã Vĩnh Chân	231
8257	Xã Phú Lộc	233
8356	Xã Phượng Vĩ	235
8491	Xã Dân Quyền	236
8641	Xã Tân Lập	238
8599	Xã Xuân Sơn	240
8789	Thị trấn Hoa Sơn	246
8914	Xã Đạo Trù	248
9058	Xã Hồng Phương	251
9148	Xã Ngũ Kiên	252
9190	Phường Võ Cường	256
9268	Xã Quế Tân	259
9370	Phường Tam Sơn	261
9457	Xã Vạn Ninh	263
10514	Phường Nhị Châu	288
10567	Phường Hoàng Tiến	290
10666	Xã Minh Tân	291
10774	Xã Phúc Thành A	293
10888	Thị trấn Cẩm Giang	295
10993	Xã Thái Hòa	296
11113	Xã Tân Kỳ	298
11218	Xã Văn Hội	299
11332	Phường Máy Tơ	304
11414	Phường Thành Tô	306
11476	Xã Lại Xuân	311
11566	Xã Hoàng Động	311
11653	Xã An Thắng	313
11764	Xã Tự Cường	315
11860	Xã Tân Liên	316
11950	Phường Lam Sơn	323
12025	Xã Cửu Cao	326
12115	Xã Hòa Phong	328
12208	Xã Đông Tảo	330
12298	Xã Đồng Thanh	331
12403	Xã Minh Hoàng	333
12475	Xã An Khê	338
12568	Xã Quỳnh Xá	338
12656	Xã Chi Lăng	339
12748	Xã Đông Kinh	340
12868	Xã Thụy Trình	341
12985	Xã Vũ Lăng	342
13081	Xã Quốc Tuấn	343
13186	Xã Bình Định	343
13279	Xã Duy Nhất	344
13339	Xã Mộc Nam	349
13450	Xã Liêm Phong	351
13561	Xã An Lão	352
13642	Phường Vị Xuyên	356
13735	Xã Mỹ Thịnh	358
13828	Xã Yên Phú	360
13921	Xã Nghĩa Lạc	361
14011	Xã Bình Minh	362
14101	Xã Xuân Thượng	364
14191	Xã Giao Tân	365
14284	Xã Hải An	366
14374	Phường Yên Bình	370
14458	Xã Phú Long	372
335	Xã Tàm Xá	15
370	Xã Kim Sơn	18
9004	Xã Chu Phan	250
9571	Phường Phú Lương	268
9655	Xã Đồng Thái	271
9751	Xã Hát Môn	272
9841	Xã Dương Liễu	274
9931	Xã Cộng Hòa	275
10012	Xã Đồng Trúc	276
10105	Xã Đồng Lạc	277
10201	Xã Văn Bình	279
10294	Xã Phú Túc	280
10384	Xã Phương Tú	281
10474	Xã Phùng Xá	282
485	Xã Phố Cáo	22
838	Xã Sủng Thài	28
925	Xã Tùng Bá	24
591	Xã Trung Thịnh	27
633	Xã Tân Quang	28
699	Phường Hợp Giang	32
741	Xã Phan Thanh	35
891	Xã Thị Hoa	48
909	Xã Hồng Quang	49
1006	Xã Mai Long	42
1870	Xã Giáo Hiệu	48
1963	Xã Thuần Mang	50
2068	Xã Đại Sảo	52
2179	Xã Trần Phú	54
1175	Xã Sinh Long	58
1266	Xã Nhân Lý	59
1332	Xã Tứ Quận	61
2590	Xã Tân Thanh	62
2683	Thị trấn Bát Xát	82
2779	Xã Thanh Bình	83
2884	Xã Nậm Đét	85
2977	Xã Minh Tân	87
3079	Xã Tân An	89
1644	Xã Sín Thầu	96
3238	Xã Trung Thu	98
1760	Xã Pa Thơm	100
3287	Xã Ngối Cáy	102
1797	Xã Giang Ma	106
1865	Xã Tả Phìn	108
3618	Xã Phúc Than	110
1859	Xã Trung Chải	112
2018	Xã é Tòng	119
3832	Xã Chiềng Ân	120
3919	Xã Tân Lang	122
2141	Xã Hát Lót	125
4189	Xã Đứa Mòn	126
2094	Xã Chiềng Xuân	128
2243	Thị trấn Yên Thế	135
4399	Xã Đông Cuông	136
4495	Xã Nậm Khắt	137
4609	Xã Làng Nhì	139
2512	Xã Xuân Long	141
4825	Xã Hòa Bình	148
4957	Xã Cao Sơn	152
2638	Xã Dũng Phong	154
2732	Xã Thành Sơn	156
5368	Xã Đa Phúc	158
5485	Xã Phúc Hà	164
2934	Xã Phượng Tiến	167
3004	Xã Quang Sơn	169
3070	Xã Đức Lương	171
5869	Xã Hồng Tiến	172
5965	Xã Dương Thành	173
6058	Xã Quốc Việt	180
6268	Xã Liên Hội	184
6328	Xã Long Đống	185
3428	Xã Khánh Xuân	188
6592	Xã Đông Quan	188
6691	Phường Hồng Gai	193
3567	Xã Vĩnh Thực	194
6859	Xã Húc Động	198
6952	Xã Quảng Phong	201
7096	Phường Tràng An	205
7186	Xã Liên Vị	206
3771	Xã Đông Sơn	215
7378	Xã Nghĩa Hòa	217
7486	Xã Nghĩa Phương	218
3966	Xã Quý Sơn	219
7681	Thị trấn Nham Biền	221
7795	Thị trấn Nếnh	222
7891	Phường Vân Cơ	227
7969	Thị trấn Đoan Hùng	230
8095	Xã Ấm Hạ	231
8230	Thị trấn Phong Châu	233
8329	Xã Phúc Khánh	234
8443	Xã Bắc Sơn	236
8605	Xã Tất Thắng	238
8560	Xã Lai Đồng	240
8758	Phường Tiền Châu	244
8893	Xã Duy Phiên	247
9037	Xã Trung Nguyên	251
9130	Xã Vũ Di	252
9172	Phường Kinh Bắc	256
9250	Xã Việt Thống	259
9358	Xã Tri Phương	260
9445	Xã Ninh Xá	262
9535	Xã Lâm Thao	264
10558	Xã Bắc An	290
10651	Xã Nam Hồng	291
10759	Xã Thượng Vũ	293
10867	Xã Thanh Sơn	294
10972	Xã Tân Hồng	296
11089	Xã Ngọc Kỳ	298
11200	Xã Ninh Hải	299
11305	Phường Thượng Lý	303
11404	Phường Dư Hàng Kênh	305
11707	Phường Hoà Nghĩa	309
11557	Xã Thiên Hương	311
11647	Xã Quang Trung	313
11755	Thị trấn Tiên Lãng	315
11848	Xã Hiệp Hoà	316
11938	Xã Hiền Hào	317
12010	Xã Lương Tài	325
12100	Xã Tân Việt	327
12190	Xã Hồ Tùng Mậu	329
12280	Thị trấn Lương Bằng	331
12379	Xã Minh Phượng	332
12457	Xã Đông Hòa	336
12532	Xã Châu Sơn	338
12628	Xã Bắc Sơn	339
12715	Xã Lô Giang	340
12826	Thị trấn Diêm Điền	341
12943	Xã Thái Xuyên	341
13051	Xã Nam Thịnh	342
13156	Xã Vũ Công	343
13252	Xã Trung An	344
13507	Xã Đinh Xá	347
13417	Xã Văn Xá	350
13531	Xã Bồ Đề	352
13657	Phường Trường Thi	356
13741	Thị trấn Gôi	359
13831	Xã Yên Mỹ	360
13927	Xã Nghĩa Phong	361
14020	Xã Nam Hải	362
14110	Xã Xuân Tân	364
14200	Xã Giao Thịnh	365
336	Xã Mai Lâm	15
373	Thị trấn Trâu Quỳ	18
440	Xã Duyên Hà	16
9007	Xã Tiến Thịnh	250
9604	Xã Thanh Mỹ	269
9697	Xã Ba Trại	271
9793	Xã Thọ Xuân	273
9883	Xã Vân Côn	274
9964	Xã Lại Thượng	276
10057	Xã Thụy Hương	277
10162	Xã Phương Trung	278
10252	Xã Thống Nhất	279
10345	Xã Quang Lãng	280
10435	Xã Lưu Hoàng	281
946	Xã Phương Độ	20
796	Xã Tả Lủng	23
886	Xã Cao Mã Pờ	29
973	Xã Ngọc Minh	24
563	Xã Bản Luốc	26
1159	Xã Tân Lập	28
1249	Xã Yên Hà	29
724	Xã Cốc Pàng	35
794	Xã Quý Quân	37
1558	Thị trấn Thanh Nhật	48
1687	Xã Hồng Việt	41
1804	Xã Thái Cường	43
1897	Xã Hà Hiệu	49
1026	Xã Cao Sơn	51
2098	Xã Hoà Mục	53
1166	Phường Tân Hà	56
1221	Xã Trung Hà	59
2398	Xã Yên Phú	60
1344	Xã Tiến Bộ	61
1424	Xã Sơn Nam	62
2806	Xã Bản Mế	84
2902	Thị trấn N.T Phong Hải	86
2998	Xã Phúc Khánh	87
3097	Xã Hoà Mạc	89
1649	Xã Nậm Vì	96
3259	Xã Phình Sáng	99
1773	Xã Sam Mứn	100
1736	Xã Ẳng Cang	102
3418	Xã Bản Giang	106
1875	Xã Pu Sam Cáp	108
1965	Phường Quyết Tâm	116
1979	Xã Chiềng Ngần	116
3784	Xã Púng Tra	119
3880	Xã Mường Khoa	121
3967	Xã Đá Đỏ	122
4093	Xã Tú Nang	124
4180	Xã Chiềng En	126
4048	Xã Vân Hồ	128
4678	Xã Hạnh Sơn	133
4390	Xã An Bình	136
4486	Xã Dế Su Phình	137
2432	Xã Trạm Tấu	139
2505	Xã Nghĩa Tâm	140
4804	Phường Đồng Tiến	148
4942	Xã Lâm Sơn	152
5098	Xã Bắc Phong	154
2722	Xã Nà Phòn	156
2795	Thị trấn Hàng Trạm	158
5458	Phường Đồng Quang	164
5528	Phường Bách Quang	165
5638	Xã Hợp Thành	168
3050	Xã Liên Minh	170
5848	Xã Cát Nê	171
5944	Xã Xuân Phương	173
3103	Xã Trung Thành	180
3166	Xã Thụy Hùng	182
3233	Xã Xuân Long	183
3326	Xã Nhất Hòa	185
3460	Xã Nam Quan	188
6682	Phường Yết Kiêu	193
6748	Xã Vạn Ninh	194
6844	Xã Đồng Tâm	198
6943	Xã Quảng Chính	201
7087	Xã Tân Việt	205
7180	Xã Liên Hòa	206
3767	Xã Hồng Kỳ	215
3824	Xã Ngọc Thiện	216
3897	Xã Trường Giang	218
3956	Xã Kim Sơn	219
4022	Xã Dương Hưu	220
7783	Xã Hồng Thái	222
7879	Xã Đông Lỗ	223
7957	Xã Văn Lung	228
8071	Xã Tứ Hiệp	231
8215	Xã Sơn Cương	232
8314	Xã Hưng Long	234
8422	Xã Yên Dưỡng	235
8572	Xã Địch Quả	238
8668	Xã Xuân Lộc	239
8719	Phường Ngô Quyền	243
8839	Xã Đồng Ích	246
8938	Xã Trung Mỹ	249
9085	Xã Chấn Hưng	252
8800	Xã Đồng Quế	253
9286	Phường Nam Sơn	256
9292	Xã Châu Phong	259
9385	Phường Đồng Nguyên	261
9472	Xã Song Giang	263
10525	Phường Trần Hưng Đạo	288
10585	Phường Văn Đức	290
10693	Phường Phạm Thái	292
10792	Xã Kim Đính	293
10903	Xã Ngọc Liên	295
11008	Xã Thống Nhất	297
11128	Xã Minh Đức	298
11242	Xã Thanh Tùng	300
11341	Phường Lạc Viên	304
11422	Phường Cát Bi	306
11485	Xã Liên Khê	311
11575	Xã Tân Dương	311
11665	Xã Tân Viên	313
11776	Xã Tiên Thanh	315
11869	Xã Hưng Nhân	316
11953	Phường Hiến Nam	323
12028	Xã Phụng Công	326
12121	Phường Dị Sử	328
12211	Xã Bình Minh	330
12301	Xã Song Mai	331
12409	Xã Tống Phan	333
12478	Xã An Đồng	338
12571	Xã An Dục	338
12658	Xã Minh Khai	339
12751	Xã Đông Hợp	340
12871	Xã Thụy Bình	341
12991	Xã Tây Lương	342
13087	Xã An Bình	343
13192	Thị trấn Vũ Thư	344
13285	Phường Quang Trung	347
13348	Phường Yên Bắc	349
13465	Xã Liêm Thuận	351
13567	Xã Hợp Lý	353
13663	Phường Ngô Quyền	356
13756	Xã Đại An	359
13849	Xã Yên Ninh	360
13939	Xã Nghĩa Tân	361
14032	Xã Trực Chính	363
14122	Xã Xuân Phương	364
14212	Xã Giao Phong	365
342	Thị trấn Yên Viên	18
568	Xã Dương Quang	18
446	Xã Vạn Phúc	16
9013	Xã Văn Khê	250
9610	Xã Kim Sơn	269
9703	Xã Ba Vì	271
9799	Xã Liên Hồng	273
9892	Xã Đông La	274
9970	Xã Hương Ngải	276
10063	Xã Lam Điền	277
10150	Xã Thanh Văn	278
10240	Xã Tân Minh	279
10333	Xã Tri Thủy	280
10423	Xã Đại Hùng	281
692	Phường Ngọc Hà	20
784	Xã Giàng Chu Phìn	23
877	Xã Bát Đại Sơn	29
964	Xã Quảng Ngần	24
556	Xã Nàng Đôn	26
616	Xã Khuôn Lùng	27
675	Xã Tân Bắc	29
1318	Xã Yên Thổ	34
783	Xã Sóc Hà	37
954	Xã Ngũ Lão	41
986	Xã Yên Lạc	42
1852	Xã Nông Thượng	58
1945	Xã Cốc Đán	50
1063	Xã Yên Thượng	52
1133	Thị trấn Yến Lạc	54
2290	Xã Bình An	57
1308	Xã Lực Hành	61
1315	Xã Chiêu Yên	61
1398	Xã Hợp Thành	62
1461	Xã Vạn Hoà	80
2758	Xã Tung Chung Phố	83
2866	Xã Bản Phố	85
2959	Xã Điện Quan	87
1585	Xã Võ Lao	89
1743	Xã Nà Nhạn	94
1680	Xã Huổi Só	98
1746	Xã Thanh Nưa	100
3383	Xã Pú Hồng	101
3408	Phường Đông Phong	105
3496	Xã Phìn Hồ	108
3586	Xã Nậm Xe	109
3484	Xã Pú Đao	112
2011	Xã Chiềng La	119
3826	Xã Nậm Păm	120
3913	Xã Huy Bắc	122
2058	Xã Chiềng Hắc	123
4129	Xã Chiềng Chung	125
4219	Xã Mường Hung	126
2232	Xã Minh Bảo	132
2267	Xã Tô Mậu	135
2323	Xã Phong Dụ Thượng	136
4519	Xã Quy Mông	138
2459	Xã Nậm Búng	140
2536	Xã Cảm Ân	141
4831	Thị trấn Đà Bắc	150
4987	Xã Hùng Sơn	153
2666	Xã Quyết Chiến	155
5281	Xã Văn Nghĩa	157
5398	Xã Phú Thành	159
5659	Phường Chùa Hang	164
5587	Xã Bình Yên	167
5689	Xã Cây Thị	169
5788	Xã Tân Linh	171
5884	Xã Tiên Phong	172
5980	Phường Đông Kinh	178
3134	Xã Quý Hòa	181
6181	Xã Nhạc Kỳ	182
6286	Xã Khánh Khê	184
6391	Xã Yên Bình	186
6496	Xã Nhân Lý	187
6628	Xã Đình Lập	189
7048	Xã Vũ Oai	193
6790	Phường Cẩm Thành	195
6886	Xã Hải Lạng	199
6991	Xã Minh Cầm	202
3667	Phường Kim Sơn	205
3723	Phường Trần Phú	213
7309	Xã Tân Trung	216
7408	Xã Dương Đức	217
3915	Xã Bắc Lũng	218
4082	Xã Việt Tiến	222
7813	Xã Đồng Tân	223
7906	Phường Thọ Sơn	227
7993	Xã Minh Lương	230
8122	Xã Lang Sơn	231
8242	Xã Trị Quận	233
8338	Xã Ngọc Đồng	234
8467	Xã Vạn Xuân	236
8629	Xã Tân Minh	238
8569	Xã Mỹ Thuận	240
8761	Thị trấn Lập Thạch	246
8899	Xã Hoàng Lâu	247
9043	Xã Tam Hồng	251
9139	Xã Vân Xuân	252
9178	Phường Tiền An	256
9253	Xã Đại Xuân	259
9355	Xã Đại Đồng	260
9442	Xã Nguyệt Đức	262
9529	Xã Bình Định	264
10552	Phường Bến Tắm	290
10648	Xã Phú Điền	291
10753	Xã Lai Vu	293
10861	Xã Thanh Thủy	294
10969	Xã Thúc Kháng	296
11086	Xã Hưng Đạo	298
11197	Xã Tân Phong	299
11302	Phường Sở Dầu	303
11401	Phường Nghĩa Xá	305
11689	Phường Anh Dũng	309
11548	Xã Phả Lễ	311
11638	Xã Trường Thành	313
11746	Xã Đoàn Xá	314
11839	Xã Việt Tiến	316
11929	Xã Văn Phong	317
12007	Xã Minh Hải	325
12103	Phường Bần Yên Nhân	328
12193	Xã Tiền Phong	329
12283	Xã Nghĩa Dân	331
12376	Xã Cương Chính	332
13108	Xã Vũ Lạc	336
12559	Xã An Mỹ	338
12649	Xã Thái Hưng	339
12736	Xã Hợp Tiến	340
12862	Xã Thụy Xuân	341
12982	Xã Đông Quí	342
13078	Xã Trà Giang	343
13189	Xã Hồng Tiến	343
13282	Xã Hồng Phong	344
13345	Xã Chuyên Ngoại	349
13471	Xã Thanh Phong	351
13579	Xã Đạo Lý	353
13651	Phường Nguyễn Du	356
13744	Xã Minh Thuận	359
13834	Xã Yên Dương	360
13924	Xã Nghĩa Hồng	361
14017	Xã Nam Tiến	362
14107	Xã Xuân Đài	364
14197	Xã Giao Xuân	365
14290	Xã Hải Lý	366
529	Xã Yên Thường	18
415	Phường Trung Văn	19
8974	Xã Đại Thịnh	250
9574	Phường Lê Lợi	269
9667	Xã Chu Minh	271
9763	Xã Phúc Hòa	272
9853	Xã Kim Chung	274
9943	Xã Cấn Hữu	275
10024	Xã Tiên Phương	277
10120	Xã Cự Khê	278
10213	Xã Liên Phương	279
10306	Xã Quang Trung	280
10396	Xã Vạn Thái	281
10486	Xã Đốc Tín	282
495	Xã Hố Quáng Phìn	22
850	Xã Đông Minh	28
937	Xã Xín Chải	24
539	Xã Pố Lồ	26
1129	Xã Nàn Ma	27
704	Xã Vĩnh Quang	34
721	Thị trấn Bảo Lạc	35
1429	Xã Hồng Sỹ	37
957	Xã Trương Lương	41
989	Xã Triệu Nguyên	42
1855	Phường Xuất Hóa	58
1948	Xã Trung Hoà	50
1064	Xã Phương Viên	52
2158	Xã Kim Lư	54
2293	Xã Hồng Quang	57
1252	Xã Tân Thịnh	59
1437	Phường Duyên Hải	80
1486	Xã Bản Qua	82
2812	Xã Sán Chải	84
2917	Xã Thái Niên	86
1542	Phường Phan Si Păng	88
1610	Xã Minh Lương	89
1658	Thị Trấn Mường Chà	97
3268	Xã Mường Mùn	99
1654	Xã Chà Cang	103
1659	Xã Nậm Chua	103
1829	Xã Mường Tè	107
1896	Xã Sì Lở Lầu	109
1934	Xã Pắc Ta	111
3709	Xã Mường Sại	118
3811	Xã Nậm Giôn	120
3898	Thị trấn Phù Yên	122
3988	Xã Tân Hợp	123
2124	Xã Chiềng Chăn	125
2180	Xã Chiềng Khoong	126
2221	Phường Minh Tân	132
4318	Xã Mai Sơn	135
4408	Xã Ngòi A	136
2372	Xã Báo Đáp	138
4618	Xã Hát Lìu	139
4738	Xã Bảo Ái	141
4906	Xã Quang Tiến	148
2655	Xã Phú Vinh	155
5299	Xã Quyết Thắng	157
5386	Xã Yên Trị	158
5497	Xã Thịnh Đức	164
2941	Xã Định Biên	167
3007	Xã Minh Lập	169
5779	Xã Phú Cường	171
5872	Xã Minh Đức	172
5971	Phường Hoàng Văn Thụ	178
3127	Xã Hưng Đạo	181
3263	Xã Tú Xuyên	184
3355	Xã Vân Nham	186
6487	Xã Bằng Hữu	187
3470	Thị trấn NT Thái Bình	189
3611	Xã Kỳ Thượng	193
6781	Phường Cẩm Thịnh	195
6880	Xã Yên Than	199
6985	Xã Lương Mông	202
3660	Phường Hoàng Quế	205
3719	Phường Ngô Quyền	213
7294	Thị trấn Bố Hạ	215
7399	Thị trấn Kép	217
3908	Xã Huyền Sơn	218
7597	Xã Phú Nhuận	219
7831	Xã Ngọc Sơn	223
7882	Xã Châu Minh	223
7960	Xã Thanh Minh	228
8080	Xã Hiền Lương	231
8221	Xã Đỗ Sơn	232
8320	Xã Đồng Lạc	234
8431	Xã Đồng Lương	235
8584	Xã Võ Miếu	238
8665	Xã Thạch Đồng	239
8713	Phường Hội Hợp	243
8836	Xã Xuân Lôi	246
8935	Thị trấn Hương Canh	249
9082	Xã Yên Bình	252
8803	Xã Nhân Đạo	253
9331	Phường Hạp Lĩnh	256
9298	Xã Cách Bi	259
9388	Phường Châu Khê	261
9478	Xã Lãng Ngâm	263
10532	Phường Tân Bình	288
10591	Xã Nhân Huệ	290
10696	Phường Duy Tân	292
10801	Xã Tam Kỳ	293
10909	Xã Cẩm Vũ	295
11029	Xã Gia Tân	297
11131	Xã Văn Tố	298
11245	Xã Phạm Kha	300
11347	Phường Gia Viên	304
11428	Phường Quán Trữ	307
11491	Xã Lưu Kỳ	311
11581	Thị trấn An Dương	312
11671	Xã Chiến Thắng	313
11782	Xã Kiến Thiết	315
11872	Xã Vinh Quang	316
11959	Phường Lê Lợi	323
12031	Xã Nghĩa Trụ	326
12118	Phường Nhân Hòa	328
12205	Thị trấn Khoái Châu	330
12295	Xã Thọ Vinh	331
12400	Xã Quang Hưng	333
12472	Thị trấn Quỳnh Côi	338
12565	Xã An Vinh	338
12655	Xã Hòa Bình	339
12745	Xã Hà Giang	340
12865	Xã Dương Phúc	341
12988	Xã Đông Xuyên	342
13090	Xã Tây Sơn	343
13195	Xã Hồng Lý	344
13288	Phường Lương Khánh Thiện	347
13351	Xã Trác Văn	349
13468	Xã Thanh Thủy	351
13573	Xã Chính Lý	353
13621	Xã Phú Phúc	353
13720	Xã Mỹ Trung	358
13813	Xã Yên Nghĩa	360
346	Xã Yên Viên	18
416	Thị trấn Văn Điển	16
8977	Xã Kim Hoa	250
9577	Phường Phú Thịnh	269
9670	Xã Tòng Bạt	271
9766	Xã Ngọc Tảo	272
9856	Xã Yên Sở	274
9946	Xã Tân Hòa	275
10027	Xã Đông Sơn	277
10126	Xã Bích Hòa	278
10216	Xã Văn Phú	279
10309	Xã Nam Phong	280
10399	Xã Minh Đức	281
10489	Xã Hương Sơn	282
853	Xã Mậu Long	28
454	Xã Phú Linh	24
515	Xã Phú Nam	25
1096	Thị trấn Cốc Pài	27
1195	Xã Vô Điếm	28
755	Thị trấn Thông Nông	37
777	Xã Nội Thôn	37
870	Xã Đức Quang	48
950	Xã Đại Tiến	41
1795	Xã Minh Khai	43
1891	Xã Bành Trạch	49
1993	Xã Tân Tú	51
2092	Xã Thanh Vận	53
1162	Phường Nông Tiến	56
2284	Xã Thanh Tương	58
2392	Xã Phù Lưu	60
2491	Xã Chân Sơn	61
1420	Xã Ninh Lai	62
1479	Xã Dền Sáng	82
2803	Xã Thào Chư Phìn	84
2914	Xã Bản Cầm	86
1540	Xã Ngũ Chỉ Sơn	88
3109	Xã Nậm Tha	89
1663	Xã Huổi Lếnh	96
1717	Xã Ta Ma	99
1777	Xã Na Ư	100
1653	Xã Pa Tần	103
3529	Xã Làng Mô	108
1889	Xã Tủa Sín Chải	108
3694	Xã Mường Giôn	118
2035	Xã Long Hẹ	119
3862	Xã Hang Chú	121
3949	Xã Tường Thượng	122
2109	Xã Viêng Lán	124
2162	Xã Nà Ơt	125
3994	Xã Suối Bàng	128
4288	Phường Tân An	133
4369	Xã An Phú	135
2357	Xã Khao Mang	137
2430	Xã Hưng Khánh	138
4687	Xã Đại Lịch	140
4786	Xã Đại Minh	141
4873	Xã Yên Hòa	150
5095	Xã Thung Nai	154
2715	Xã Tòng Đậu	156
2792	Xã Ngọc Lâu	157
2861	Phường Thịnh Đán	164
2903	Xã Tân Quang	165
2973	Xã Phú Đô	168
3053	Xã Dân Tiến	170
5851	Xã Quân Chu	171
5941	Xã Điềm Thụy	173
3100	Xã Chi Lăng	180
3163	Xã Bắc La	182
6238	Xã Mẫu Sơn	183
3320	Xã Trấn Yên	185
3452	Xã Tĩnh Bắc	188
6598	Xã Hữu Lân	188
6697	Phường Hồng Hà	193
3571	Phường Cửa Ông	195
6862	Thị trấn Tiên Yên	199
6967	Xã Cái Chiên	201
7093	Phường Đức Chính	205
7189	Xã Tiền Phong	206
7279	Xã Hương Vĩ	215
7381	Xã Nghĩa Hưng	217
7489	Xã Vô Tranh	218
7579	Xã Trù Hựu	219
7684	Xã Lão Hộ	221
7819	Xã Hoàng Lương	223
7912	Phường Bạch Hạc	227
7999	Xã Chí Đám	230
8128	Xã Yên Luật	231
8248	Xã Tiên Phú	233
8353	Xã Minh Tân	235
8482	Xã Dị Nậu	236
8644	Xã Yên Lãng	238
8608	Xã Long Cốc	240
8791	Xã Liễn Sơn	246
8920	Xã Bồ Lý	248
9067	Xã Đại Tự	251
9160	Xã Vĩnh Ninh	252
9235	Phường Khúc Xuyên	256
9277	Xã Phù Lãng	259
9376	Phường Tương Giang	261
9466	Xã Cao Đức	263
10522	Phường Phạm Ngũ Lão	288
10579	Phường Văn An	290
10684	Xã Lê Ninh	292
10786	Xã Kim Tân	293
10897	Xã Cẩm Hoàng	295
10996	Xã Bình Xuyên	296
11122	Xã Quảng Nghiệp	298
11233	Xã Hưng Long	299
11350	Phường Đông Khê	304
11431	Phường Đồng Hoà	307
11500	Xã Minh Tân	311
11587	Xã Đại Bản	312
11677	Xã An Thái	313
11794	Xã Toàn Thắng	315
11884	Xã Lý Học	316
11971	Xã Trung Nghĩa	323
12049	Xã Mễ Sở	326
12139	Xã Hưng Long	328
12229	Xã An Vĩ	330
12319	Xã Hùng An	331
12427	Xã Nguyên Hòa	333
12499	Xã An Thái	338
12592	Xã Tân Lễ	339
12679	Xã Chí Hòa	339
12775	Xã Đông Động	340
12901	Xã Thụy Sơn	341
13012	Xã An Ninh	342
13114	Xã Thanh Tân	343
13210	Xã Tân Phong	344
13303	Phường Lam Hạ	347
13369	Xã Tiên Sơn	349
13483	Xã Liêm Sơn	351
13588	Xã Bắc Lý	353
13681	Phường Thống Nhất	356
13774	Xã Liên Bảo	359
13870	Xã Yên Cường	360
13957	Xã Nghĩa Hải	361
14053	Xã Trực Nội	363
14140	Xã Xuân Tiến	364
14230	Xã Hải Vân	366
14323	Phường Tân Thành	369
14410	Xã Đức Long	372
419	Xã Tân Triều	16
422	Xã Thanh Liệt	16
8983	Xã Tiến Thắng	250
9583	Phường Quang Trung	269
9676	Xã Sơn Đà	271
9772	Xã Tam Thuấn	272
9862	Xã Vân Canh	274
9952	Xã Đông Yên	275
10033	Xã Phú Nghĩa	277
10132	Xã Cao Viên	278
10222	Xã Tiền Phong	279
10315	Xã Tân Dân	280
10405	Xã Hòa Xá	281
10495	Xã An Tiến	282
502	Xã Sủng Trái	22
859	Xã Ngọc Long	28
940	Xã Phương Tiến	24
542	Xã Bản Phùng	26
602	Xã Tả Nhìu	27
661	Xã Tiên Nguyên	29
707	Xã Quảng Lâm	34
1381	Xã Yên Sơn	37
836	Xã Lăng Hiếu	39
1768	Xã Phan Thanh	42
1822	Xã Đức Long	43
1924	Xã Quảng Khê	49
1046	Xã Nam Cường	52
1109	Xã Bình Văn	53
1361	Xã Thái Long	56
1232	Xã Tân An	59
1368	Xã Nhữ Khê	61
1388	Xã Bình Yên	62
2658	Phường Bình Minh	80
2749	Xã Tòng Sành	82
2854	Xã Tả Củ Tỷ	85
2950	Xã Tân Tiến	87
1574	Xã Bản Hồ	88
1634	Phường Thanh Trường	94
1665	Xã Na Sang	97
3298	Xã Chiềng Sinh	99
1787	Xã Xa Dung	101
3387	Phường Tân Phong	105
3469	Xã Kan Hồ	107
1919	Xã Bản Lang	109
2001	Thị trấn Thuận Châu	119
3769	Xã Thôm Mòn	119
3868	Xã Tà Xùa	121
3952	Xã Tường Tiến	122
4078	Xã Chiềng Hặc	124
2165	Xã Tà Hộc	125
4009	Xã Liên Hoà	128
4291	Phường Cầu Thia	133
2298	Xã Trung Tâm	135
4468	Xã Mồ Dề	137
4582	Xã Vân Hội	138
4693	Xã Cát Thịnh	140
2559	Xã Thịnh Hưng	141
4858	Xã Đoàn Kết	150
2589	Xã Kim Lập	153
5194	Xã Ngổ Luông	155
2771	Xã Chí Đạo	157
2841	Phường Quán Triều	164
2886	Phường Lương Sơn	165
2946	Xã Phú Đình	167
3022	Thị trấn Đình Cả	170
5827	Xã Tân Thái	171
5923	Xã Tân Thành	173
6019	Xã Tân Tiến	180
3149	Xã Hồng Thái	181
3216	Xã Hải Yến	183
3306	Xã Tân Lập	185
3369	Xã Hồ Sơn	186
3432	Xã Hữu Khánh	188
3512	Phường Hà Lầm	193
6739	Xã Quảng Nghĩa	194
6835	Phường Phương Nam	196
6931	Xã Quảng Thành	201
3645	Xã An Sinh	205
3701	Phường Nam Hoà	206
3754	Xã Tam Tiến	215
3813	Xã Song Vân	216
7459	Xã Bảo Sơn	218
7558	Xã Kiên Thành	219
4016	Xã An Bá	220
7780	Xã Trung Sơn	222
7873	Xã Xuân Cẩm	223
7951	Xã Hà Lộc	228
8062	Xã Đan Thượng	231
8203	Xã Hoàng Cương	232
8305	Xã Xuân Viên	234
8407	Xã Phú Lạc	235
8536	Xã Tứ Xã	237
8677	Xã Sơn Thủy	239
8725	Xã Định Trung	243
8857	Xã Đình Chu	246
8950	Xã Hương Sơn	249
9031	Xã Đồng Văn	251
9118	Xã Bình Dương	252
8854	Xã Đức Bác	253
9223	Xã Trung Nghĩa	258
9340	Xã Hoàn Sơn	260
9430	Xã Trạm Lộ	262
9523	Xã Trung Chính	264
10549	Phường Sao Đỏ	290
10639	Xã Cộng Hòa	291
10744	Phường Hiến Thành	292
10849	Xã Thanh Khê	294
10960	Xã Vĩnh Hồng	296
11071	Xã Đức Xương	297
11176	Xã Vạn Phúc	299
11284	Xã Chi Lăng Nam	300
11389	Phường Dư Hàng	305
11467	Phường Bàng La	308
11536	Xã Thuỷ Triều	311
11629	Thị trấn An Lão	313
11734	Xã Tân Phong	314
11833	Xã Thắng Thuỷ	316
11920	Xã Nghĩa Lộ	317
11992	Xã Chỉ Đạo	325
12085	Xã Trung Hòa	327
12172	Xã Quảng Lãng	329
12265	Xã Chí Tân	330
12364	Xã Hải Triều	332
12454	Phường Trần Lãm	336
12526	Xã An Ấp	338
12619	Xã Duyên Hải	339
12706	Xã Đông Cường	340
12811	Xã Đông Dương	340
12934	Xã Thái Phúc	341
13036	Xã Nam Cường	342
13138	Xã Bình Minh	343
13237	Xã Tam Quang	344
13381	Xã Tiên Hải	347
13402	Xã Nhật Tân	350
13510	Xã Tràng An	352
13612	Xã Nhân Nghĩa	353
13705	Xã Nam Vân	356
13798	Xã Yên Trung	360
13891	Thị trấn Liễu Đề	361
13981	Xã Nam Toàn	362
14071	Xã Trực Đại	363
14161	Xã Giao Thiện	365
538	Xã Đình Xuyên	18
649	Xã Tả Thanh Oai	16
8986	Xã Tự Lập	250
9586	Phường Sơn Lộc	269
9679	Xã Đông Quang	271
9775	Xã Tam Hiệp	272
9865	Xã Đắc Sở	274
4927	Xã Yên Trung	276
10039	Xã Trường Yên	277
10135	Xã Bình Minh	278
10225	Xã Hà Hồi	279
10318	Xã Sơn Hà	280
10408	Xã Trầm Lộng	281
10498	Xã Hợp Tiến	282
769	Thị trấn Mèo Vạc	23
862	Xã Đường Thượng	28
943	Xã Lao Chải	24
1039	Xã Túng Sán	26
605	Xã Bản Ngò	27
1228	Xã Tân Nam	29
708	Xã Thạch Lâm	34
1384	Xã Lương Can	37
839	Xã Phong Châu	39
1013	Xã Hoa Thám	42
1819	Xã Lê Lai	43
1921	Xã Chu Hương	49
1043	Xã Xuân Lạc	52
1106	Xã Như Cố	53
1357	Xã Lưỡng Vượng	56
1231	Xã Yên Lập	59
1367	Xã Nhữ Hán	61
1385	Xã Thượng Ấm	62
1454	Phường Xuân Tăng	80
1507	Xã Phìn Ngan	82
2851	Xã Tả Van Chư	85
2947	Thị trấn Phố Ràng	87
1571	Xã Mường Bo	88
3139	Phường Nam Thanh	94
1664	Xã Ma Thì Hồ	97
3295	Xã Quài Tở	99
1785	Xã Nong U	101
3386	Phường Quyết Thắng	105
1847	Xã Vàng San	107
1916	Xã Ma Ly Pho	109
1851	Xã Nậm Chà	112
2004	Xã Phổng Lái	119
3817	Xã Hua Trai	120
3904	Xã Mường Thải	122
3997	Xã Tân Lập	123
2128	Xã Chiềng Ban	125
2184	Xã Huổi Một	126
2225	Phường Đồng Tâm	132
2260	Xã Mường Lai	135
2316	Xã Tân Hợp	136
2376	Xã Việt Thành	138
2455	Thị trấn NT Trần Phú	140
2532	Xã Xuân Lai	141
4912	Xã Mông Hóa	148
4978	Thị trấn Bo	153
2656	Xã Phú Cường	155
2746	Xã Miền Đồi	157
4981	Thị trấn Ba Hàng Đồi	159
2883	Xã Tân Cương	164
5581	Xã Trung Hội	167
5683	Xã Hóa Trung	169
5785	Xã Phú Lạc	171
5878	Phường Đồng Tiến	172
5974	Phường Tam Thanh	178
3128	Xã Vĩnh Yên	181
6280	Xã Điềm He	184
3296	Xã Tân Tri	185
3365	Xã Hòa Sơn	186
3431	Xã Tú Mịch	188
6709	Phường Ka Long	194
3544	Xã Hải Đông	194
6826	Phường Yên Thanh	196
6925	Xã Quảng Đức	201
7069	Phường Mạo Khê	205
3698	Phường Yên Giang	206
3750	Xã Canh Nậu	215
3810	Xã Việt Ngọc	216
7708	Xã Nội Hoàng	221
7801	Xã Vân Trung	222
7897	Phường Tân Dân	227
7981	Xã Bằng Luân	230
8110	Xã Xuân Áng	231
8234	Xã Lệ Mỹ	233
8335	Xã Ngọc Lập	234
8461	Xã Lam Sơn	236
8614	Xã Cự Đồng	238
8566	Xã Tân Phú	240
8764	Xã Quang Sơn	246
8908	Thị trấn Tam Đảo	248
9052	Xã Nguyệt Đức	251
9145	Thị trấn Tứ Trưng	252
9184	Phường Ninh Xá	256
9262	Xã Bằng An	259
9364	Xã Cảnh Hưng	260
9451	Xã Song Liễu	262
10507	Phường Cẩm Thượng	288
10561	Xã Hưng Đạo	290
10657	Xã Đồng Lạc	291
10762	Xã Cổ Dũng	293
10876	Xã Thanh Quang	294
10981	Xã Thái Học	296
11098	Xã Tái Sơn	298
11215	Xã Hồng Dụ	299
11320	Phường Hoàng Văn Thụ	303
11410	Phường Đông Hải 1	306
11470	Thị trấn Núi Đèo	311
11560	Xã Thuỷ Sơn	311
11650	Xã Quốc Tuấn	313
11761	Xã Tiên Cường	315
11857	Xã Tân Hưng	316
11947	Xã Xuân Đám	317
12022	Xã Xuân Quan	326
12112	Xã Dương Quang	328
12202	Xã Hạ Lễ	329
12292	Xã Phạm Ngũ Lão	331
12394	Xã Minh Tân	333
12463	Xã Phú Xuân	336
12535	Xã Quỳnh Mỹ	338
12625	Xã Văn Cẩm	339
12712	Xã Mê Linh	340
12832	Xã Thụy Trường	341
12958	Xã Tân Học	341
13057	Xã Nam Thanh	342
13165	Xã Quang Trung	343
13261	Xã Nguyên Xá	344
13324	Phường Hòa Mạc	349
13435	Xã Thi Sơn	350
13546	Xã Trung Lương	352
13654	Phường Bà Triệu	356
13747	Xã Hiển Khánh	359
13840	Xã Yên Hưng	360
13930	Xã Nghĩa Phú	361
14023	Xã Nam Thái	362
14113	Xã Xuân Thủy	364
353	Xã Dương Hà	18
426	Xã Hữu Hoà	16
8989	Thị trấn Quang Minh	250
9589	Phường Xuân Khanh	269
9682	Xã Tiên Phong	271
9778	Xã Hiệp Thuận	272
9868	Xã Lại Yên	274
4930	Xã Yên Bình	276
10042	Xã Ngọc Hòa	277
10138	Xã Tam Hưng	278
10228	Xã Thư Phú	279
10321	Xã Chuyên Mỹ	280
10411	Xã Kim Đường	281
10501	Xã Hợp Thanh	282
506	Xã Thượng Phùng	23
865	Xã Lũng Hồ	28
952	Xã Cao Bồ	24
546	Xã Chiến Phố	26
1138	Xã Chế Là	27
665	Xã Bản Rịa	29
1309	Xã Vĩnh Phong	34
1387	Xã Thanh Long	37
846	Xã Trung Phúc	39
1618	Xã Ngọc Động	49
1010	Xã Vũ Minh	42
1873	Xã Xuân La	48
1969	Thị trấn Phủ Thông	51
2185	Xã Quang Phong	54
2197	Xã Liêm Thuỷ	54
1196	Xã Hồng Thái	58
1342	Xã Kim Quan	61
2548	Xã Vĩnh Lợi	62
1451	Phường Pom Hán	80
1504	Xã Nậm Pung	82
2848	Xã Lùng Phình	85
2944	Xã Phú Nhuận	86
1568	Xã Tả Van	88
1630	Phường Mường Thanh	94
3197	Xã Sa Lông	97
3289	Xã Quài Cang	99
1784	Xã Pú Nhi	101
3199	Xã Si Pa Phìn	103
1913	Xã Dào San	109
1955	Xã Khoen On	110
3685	Xã Cà Nàng	118
3793	Xã Bon Phặng	119
3889	Xã Tạ Khoa	121
3976	Xã Bắc Phong	122
2114	Xã Chiềng Tương	124
4192	Xã Yên Hưng	126
2246	Xã Tân Phượng	135
2291	Xã Phúc Lợi	135
4459	Xã Hồ Bốn	137
2427	Xã Hưng Thịnh	138
2490	Thị trấn Sơn Thịnh	140
4780	Xã Hán Đà	141
4861	Xã Đồng Ruộng	150
5089	Thị trấn Cao Phong	154
2711	Xã Bao La	156
2858	Phường Tân Thịnh	164
5479	Phường Tân Thành	164
2931	Xã Tân Dương	167
2997	Xã Văn Lăng	169
3064	Xã Minh Tiến	171
5863	Xã Phúc Tân	172
5956	Xã Nga My	173
5959	Xã Kha Sơn	173
6049	Xã Kháng Chiến	180
3183	Xã Hoàng Việt	182
3240	Xã Tân Thành	183
6379	Xã Tân Thành	185
3455	Xã Thống Nhất	188
3457	Xã Lợi Bác	188
3520	Phường Tuần Châu	193
3574	Phường Cẩm Sơn	195
6868	Xã Đại Dực	199
6970	Thị trấn Ba Chẽ	202
7099	Xã Nguyễn Huệ	205
7192	Thị trấn Cô Tô	207
3774	Xã Tân Hiệp	215
3837	Thị trấn Vôi	217
7480	Xã Chu Điện	218
3959	Xã Tân Hoa	219
7678	Xã Thanh Luận	220
7792	Xã Quảng Minh	222
7888	Phường Dữu Lâu	227
7966	Phường Thanh Vinh	228
8092	Xã Gia Điền	231
8224	Xã Đỗ Xuyên	232
8326	Xã Đồng Thịnh	234
8440	Xã Hiền Quan	236
8602	Xã Cự Thắng	238
8689	Xã Hoàng Xá	239
8737	Phường Hùng Vương	244
8875	Xã Đồng Tĩnh	247
8965	Xã Tân Phong	249
9106	Xã Lũng Hoà	252
8830	Xã Yên Thạch	253
9211	Xã Hòa Tiến	258
9322	Xã Phú Lâm	260
9415	Xã Đình Tổ	262
9505	Xã Phú Hòa	264
10837	Xã Tiền Tiến	288
10624	Xã Quốc Tuấn	291
10729	Xã Thượng Quận	292
10831	Xã Thanh An	294
10939	Xã Cẩm Đông	295
11053	Xã Phạm Trấn	297
11155	Thị trấn Ninh Giang	299
11266	Xã Lê Hồng	300
11371	Phường An Biên	305
11449	Phường Phù Liễn	307
11521	Xã Mỹ Đồng	311
11611	Xã Lê Lợi	312
11716	Xã Du Lễ	314
11824	Thị trấn Vĩnh Bảo	316
11911	Xã Trấn Dương	316
12385	Xã Tân Hưng	323
12076	Xã Thanh Long	327
12169	Xã Hoàng Hoa Thám	329
12259	Xã Đông Ninh	330
12352	Xã Lệ Xá	332
12451	Phường Tiền Phong	336
12520	Xã Quỳnh Hải	338
12613	Thị trấn Hưng Nhân	339
12700	Xã An Châu	340
12802	Xã Đông Á	340
12922	Xã Hòa An	341
13042	Xã Nam Thắng	342
13144	Xã Quang Bình	343
13243	Xã Bách Thuận	344
13444	Xã Liêm Tuyền	347
13408	Xã Hoàng Tây	350
13519	Xã Ngọc Lũ	352
13639	Phường Vị Hoàng	356
13729	Xã Mỹ Hưng	358
13816	Xã Yên Minh	360
13906	Xã Nghĩa Thái	361
13999	Xã Nam Hoa	362
14089	Thị trấn Xuân Trường	364
356	Xã Phù Đổng	18
429	Xã Tam Hiệp	16
8992	Xã Thanh Lâm	250
9592	Xã Đường Lâm	269
9685	Xã Thụy An	271
9781	Xã Liên Hiệp	272
9871	Xã Tiền Yên	274
4936	Xã Tiến Xuân	276
10045	Xã Thủy Xuân Tiên	277
10141	Xã Thanh Cao	278
10231	Xã Nguyễn Trãi	279
10324	Xã Khai Thái	280
10414	Xã Hòa Nam	281
10504	Xã An Phú	282
509	Xã Pải Lủng	23
868	Xã Du Tiến	28
955	Xã Đạo Đức	24
549	Xã Đản Ván	26
609	Xã Nấm Dẩn	27
668	Xã Yên Thành	29
714	Xã Mông Ân	34
1392	Thị trấn Xuân Hòa	37
860	Xã Minh Long	48
1786	Thị trấn Đông Khê	43
1831	Xã Đức Xuân	43
1930	Xã Hoàng Trĩ	49
1050	Xã Tân Lập	52
1119	Xã Văn Vũ	54
1179	Xã Phúc Yên	57
1238	Xã Xuân Quang	59
2419	Xã Thái Hòa	60
1374	Thị trấn Sơn Dương	62
1434	Xã Trường Sinh	62
1497	Xã Trung Lèng Hồ	82
2836	Xã Nàn Xín	84
2932	Xã Xuân Giao	86
1554	Xã Thanh Bình	88
1623	Phường Him Lam	94
3193	Xã Pa Ham	97
3280	Xã Tỏa Tình	99
1657	Xã Nậm Nhừ	103
1661	Xã Chà Tở	103
1833	Xã Mù Cả	107
3559	Xã Pa Vây Sử	109
1820	Thị trấn Nậm Nhùn	112
3718	Xã Chiềng Khoang	118
3814	Xã Chiềng Lao	120
3901	Xã Suối Tọ	122
3991	Xã Qui Hướng	123
2127	Xã Mương Chanh	125
2183	Xã Chiềng Cang	126
4258	Phường Nguyễn Thái Học	132
2257	Xã Khai Trung	135
2313	Xã Xuân Tầm	136
2375	Xã Đào Thịnh	138
2529	Xã Mỹ Gia	141
4813	Xã Yên Mông	148
4951	Xã Tân Vinh	152
2628	Xã Hợp Phong	154
5248	Xã Chiềng Châu	156
2802	Xã Lạc Lương	158
2868	Phường Tân Lập	164
2921	Xã Kim Phượng	167
2990	Thị trấn Sông Cầu	169
3063	Xã Phúc Lương	171
5857	Phường Bắc Sơn	172
5950	Xã Úc Kỳ	173
3107	Xã Đào Viên	180
3177	Xã Hội Hoan	182
3239	Xã Yên Trạch	183
6382	Xã Nhất Tiến	185
6478	Xã Bắc Thủy	187
3464	Xã Ái Quốc	188
3608	Phường Hoành Bồ	193
6778	Phường Quang Hanh	195
6877	Xã Đông Ngũ	199
6979	Xã Đạp Thanh	202
7108	Xã Hồng Thái Tây	205
3716	Phường Trần Nguyên Hãn	213
7291	Xã Tân Sỏi	215
7393	Xã Tiên Lục	217
3905	Xã Khám Lạng	218
7594	Xã Tân Lập	219
4054	Xã Yên Lư	221
7843	Xã Quang Minh	223
7933	Phường Minh Nông	227
8026	Xã Yên Kiện	230
8156	Xã Vân Lĩnh	232
8260	Xã Gia Thanh	233
8377	Xã Tam Sơn	235
8498	Thị trấn Hùng Sơn	237
8653	Xã Lương Nha	238
8626	Xã Vinh Tiền	240
8797	Xã Vân Trục	246
8926	Xã Tam Quan	248
9070	Xã Hồng Châu	251
8773	Xã Lãng Công	253
9244	Phường Phong Khê	256
9280	Xã Phượng Mao	259
9379	Phường Phù Khê	261
9463	Xã Giang Sơn	263
10519	Phường Nguyễn Trãi	288
10576	Phường Cổ Thành	290
10681	Phường Thất Hùng	292
10780	Xã Kim Anh	293
10891	Thị trấn Lai Cách	295
10990	Xã Thái Dương	296
11116	Xã Quang Khải	298
11230	Xã Hồng Phúc	299
11335	Phường Vạn Mỹ	304
11419	Phường Nam Hải	306
11488	Xã Lưu Kiếm	311
11578	Xã Dương Quan	311
11674	Xã An Thọ	313
11788	Xã Bạch Đằng	315
11881	Xã Liên Am	316
11968	Phường Hồng Châu	323
12043	Xã Tân Tiến	326
12130	Phường Phùng Chí Kiên	328
12223	Xã Tân Dân	330
12310	Xã Phú Thịnh	331
12415	Xã Nhật Quang	333
12490	Xã An Hiệp	338
12583	Xã Đồng Tiến	338
12670	Xã Minh Tân	339
12763	Xã Liên Hoa	340
12880	Xã Thụy Hải	341
12997	Xã Đông Trung	342
13096	Xã Bình Nguyên	343
13198	Xã Đồng Thanh	344
13291	Phường Lê Hồng Phong	347
13354	Phường Tiên Nội	349
13474	Thị trấn Tân Thanh	351
13582	Xã Công Lý	353
13675	Phường Văn Miếu	356
13759	Xã Tân Thành	359
13852	Xã Yên Lương	360
13945	Xã Nghĩa Lâm	361
14041	Xã Trực Tuấn	363
14131	Xã Xuân Trung	364
14221	Thị trấn Thịnh Long	366
359	Xã Trung Mầu	18
658	Xã Tứ Hiệp	16
8995	Xã Tam Đồng	250
9595	Phường Viên Sơn	269
9688	Xã Cam Thượng	271
9784	Thị trấn Phùng	273
9874	Xã Song Phương	274
9955	Thị trấn Liên Quan	276
10048	Xã Thanh Bình	277
10144	Xã Thanh Thùy	278
10234	Xã Quất Động	279
10327	Xã Phúc Tiến	280
10417	Xã Hòa Phú	281
688	Phường Quang Trung	20
778	Xã Xín Cái	23
871	Xã Du Già	28
958	Xã Thượng Sơn	24
1048	Xã Tụ Nhân	26
612	Xã Quảng Nguyên	27
671	Thị trấn Yên Bình	29
717	Xã Thái Học	34
780	Xã Tổng Cọt	37
1549	Xã Kim Loan	48
1669	Xã Đức Long	41
1801	Xã Đức Thông	43
1894	Xã Phúc Lộc	49
1999	Xã Nguyên Phúc	51
2095	Xã Mai Lạp	53
1165	Phường Ỷ La	56
2287	Thị trấn Vĩnh Lộc	59
2395	Xã Minh Hương	60
2494	Xã Thái Bình	61
1423	Xã Đại Phú	62
2809	Thị trấn Si Ma Cai	84
2905	Thị trấn Phố Lu	86
1537	Phường Sa Pa	88
1600	Xã Khánh Yên Trung	89
1650	Xã Nậm Kè	96
1712	Xã Rạng Đông	99
1774	Xã Pom Lót	100
1809	Xã Bản Hon	106
1826	Xã Pa ủ	107
3549	Thị trấn Phong Thổ	109
1931	Xã Nậm Sỏ	111
3805	Xã Bản Lầm	119
3844	Xã Chiềng San	120
3931	Xã Huy Tân	122
2085	Xã Lóng Sập	123
2148	Xã Phiêng Cằm	125
2204	Xã Dồm Cang	127
2403	Xã Giới Phiên	132
2274	Xã Khánh Hoà	135
2333	Xã Đại Phác	136
2417	Xã Bảo Hưng	138
2476	Xã Suối Quyền	140
2549	Xã Vũ Linh	141
4849	Xã Tân Pheo	150
2572	Xã Đông Bắc	153
2754	Xã Xuất Hóa	157
5389	Xã Ngọc Lương	158
2880	Phường Tích Lương	164
5578	Xã Thanh Định	167
5680	Xã Văn Hán	169
5782	Xã Na Mao	171
5875	Xã Đắc Sơn	172
5968	Xã Hà Châu	173
3121	Xã Hùng Việt	180
3260	Xã Hòa Bình	184
3352	Xã Hòa Lạc	186
6484	Xã Mai Sao	187
6619	Xã Bắc Xa	189
3614	Xã Đồng Sơn	193
3581	Phường Cẩm Tây	195
6874	Xã Điền Xá	199
6982	Xã Nam Sơn	202
3657	Xã Hồng Thái Đông	205
3713	Phường Thọ Xương	213
7288	Thị trấn Phồn Xương	215
7390	Xã Đào Mỹ	217
7498	Xã Yên Sơn	218
7588	Xã Tân Quang	219
4047	Xã Tân Liễu	221
7834	Xã Thái Sơn	223
7924	Xã Thụy Vân	227
8023	Xã Tây Cốc	230
8152	Thị trấn Thanh Ba	232
8263	Xã Tiên Du	233
8374	Xã Tùng Khê	235
8497	Xã Tiên Kiên	237
8650	Xã Thượng Cửu	238
8617	Xã Kim Thượng	240
8794	Xã Xuân Hòa	246
8923	Thị trấn Đại Đình	248
9064	Xã Liên Châu	251
9157	Xã Phú Đa	252
9214	Phường Hòa Long	256
9274	Xã Phù Lương	259
9373	Phường Hương Mạc	261
9460	Xã Thái Bảo	263
10516	Phường Quang Trung	288
10573	Phường Hoàng Tân	290
10675	Phường An Lưu	292
10771	Xã Kim Xuyên	293
10885	Xã Vĩnh Lập	294
10987	Xã Nhân Quyền	296
11101	Xã Quang Phục	298
11209	Xã Kiến Quốc	299
11314	Phường Trại Chuối	303
11411	Phường Đông Hải 2	306
11473	Thị trấn Minh Đức	311
11563	Xã Thuỷ Đường	311
11659	Xã Tân Dân	313
11773	Xã Khởi Nghĩa	315
11863	Xã Nhân Hoà	316
12019	Thị trấn Văn Giang	326
12070	Xã Hoàn Long	327
12163	Xã Quang Vinh	329
12256	Xã Việt Hòa	330
12355	Xã An Viên	332
12469	Xã Vũ Chính	336
12541	Xã An Thanh	338
12634	Xã Phúc Khánh	339
12721	Xã Minh Tân	340
12844	Xã Thụy Quỳnh	341
12961	Xã Thái Thịnh	341
13054	Xã Nam Hà	342
13159	Xã Vũ Hòa	343
13255	Xã Vũ Hội	344
13513	Xã Trịnh Xá	347
13429	Thị trấn Ba Sao	350
13543	Xã Vũ Bản	352
13624	Xã Xuân Khê	353
13711	Xã Mỹ Hà	358
13804	Xã Yên Tân	360
13897	Xã Nghĩa Đồng	361
13990	Xã Nam Cường	362
14080	Xã Trực Thái	363
14170	Xã Bình Hòa	365
14260	Xã Hải Đường	366
366	Xã Đặng Xá	18
433	Xã Yên Mỹ	16
8998	Xã Liên Mạc	250
9598	Xã Xuân Sơn	269
9691	Xã Thuần Mỹ	271
9787	Xã Trung Châu	273
9877	Xã An Khánh	274
9958	Xã Đại Đồng	276
10051	Xã Trung Hòa	277
10159	Xã Kim Thư	278
10249	Xã Dũng Tiến	279
10342	Xã Bạch Hạ	280
10432	Xã Đại Cường	281
793	Xã Sơn Vĩ	23
829	Xã Sủng Tráng	28
916	Thị trấn Nông Trường Việt Lâm	24
522	Xã Đường Âm	25
581	Xã Chí Cà	27
644	Xã Đức Xuân	28
1294	Xã Lý Bôn	34
762	Xã Lương Thông	37
1495	Xã Đàm Thuỷ	39
920	Xã Bế Văn Đàn	49
1017	Xã Quang Thành	42
1876	Xã An Thắng	48
1975	Xã Vi Hương	51
2188	Xã Dương Sơn	54
1152	Phường Phan Thiết	56
1200	Xã Đà Vị	58
2380	Xã Bạch Xa	60
2479	Xã Lang Quán	61
1410	Xã Đông Lợi	62
2692	Xã A Lù	82
2788	Xã Bản Lầu	83
2893	Xã Nậm Lúc	85
2986	Xã Yên Sơn	87
3088	Xã Dần Thàng	89
3158	Xã Leng Su Sìn	96
1703	Xã Mường Đun	98
3349	Xã Noong Luống	100
1730	Xã Xuân Lao	102
1803	Xã Sơn Bình	106
1871	Xã Nậm Tăm	108
1941	Xã Mường Mít	110
3649	Phường Tô Hiệu	116
3748	Xã Phổng Lăng	119
3853	Xã Mường Chùm	120
3940	Xã Huy Tường	122
2102	Xã Sập Vạt	124
2155	Xã Chiềng Ve	125
2208	Xã Mường Lèo	127
4558	Xã Văn Phú	132
4348	Xã Liễu Đô	135
2337	Xã Xuân Ái	136
2423	Xã Minh Quân	138
4669	Xã Suối Bu	140
2556	Xã Yên Bình	141
4855	Xã Tân Minh	150
2582	Xã Vĩnh Đồng	153
5191	Xã Lỗ Sơn	155
5308	Xã Bình Hẻm	157
2837	Xã Thống Nhất	159
5914	Xã Đồng Liên	164
5599	Xã Sơn Phú	167
3012	Xã Tân Lợi	169
5818	Xã Hoàng Nông	171
5908	Thị trấn Hương Sơn	173
3076	Xã Quốc Khánh	180
3136	Xã Hoàng Văn Thụ	181
3205	Xã Hồng Phong	183
6319	Xã Yên Phúc	184
3345	Xã Thanh Sơn	186
3414	Thị trấn Na Dương	188
3498	Phường Hà Phong	193
6796	Phường Cẩm Bình	195
6808	Phường Vàng Danh	196
6901	Xã Quảng An	200
3590	Xã Minh Châu	203
7138	Phường Minh Thành	206
3737	Phường Dĩnh Kế	213
3855	Xã Tân Hưng	217
7429	Xã Xuân Hương	217
3936	Xã Xa Lý	219
7648	Xã Vĩnh An	220
4095	Thị trấn Bích Động	222
7870	Xã Bắc Lý	223
7945	Phường Phong Châu	228
8053	Thị trấn Hạ Hoà	231
8200	Xã Mạn Lạn	232
8302	Xã Xuân An	234
8413	Xã Chương Xá	235
8542	Thị trấn Thanh Sơn	238
8683	Xã Đoan Hạ	239
8734	Phường Trưng Trắc	244
8869	Thị trấn Hợp Hòa	247
8956	Xã Quất Lưu	249
9097	Xã Bồ Sao	252
8821	Xã Nhạo Sơn	253
9205	Xã Yên Trung	258
9316	Xã Hán Quảng	259
9409	Xã Mão Điền	262
9499	Xã An Thịnh	264
10672	Phường Nam Đồng	288
10615	Xã Hợp Tiến	291
10726	Phường Hiệp Sơn	292
10828	Xã Cẩm Chế	294
10936	Xã Cẩm Điền	295
11056	Xã Đoàn Thượng	297
11164	Xã Nghĩa An	299
11281	Xã Chi Lăng Bắc	300
11380	Phường Trần Nguyên Hãn	305
11458	Phường Hải Sơn	308
11533	Xã An Lư	311
11623	Xã An Đồng	312
11731	Xã Ngũ Đoan	314
11836	Xã Trung Lập	316
11926	Xã Hoàng Châu	317
11998	Xã Việt Hưng	325
12088	Xã Yên Hòa	327
12178	Xã Đặng Lễ	329
12268	Xã Đại Hưng	330
12361	Xã Trung Dũng	332
12460	Phường Hoàng Diệu	336
12538	Xã An Quí	338
12631	Xã Đông Đô	339
12718	Xã Đông La	340
12841	Xã Hồng Dũng	341
12949	Xã  Mỹ Lộc	341
13060	Xã Nam Trung	342
13162	Xã Quang Minh	343
13258	Xã Hòa Bình	344
13321	Phường Đồng Văn	349
13423	Xã Ngọc Sơn	350
13534	Xã Bối Cầu	352
13636	Phường Trần Tế Xương	356
13723	Xã Mỹ Tân	358
13810	Xã Yên Thọ	360
13903	Xã Nghĩa Minh	361
13996	Xã Nam Hùng	362
14086	Xã Trực Thắng	363
14176	Xã Giao Hà	365
363	Xã Cổ Bi	18
443	Xã Ngọc Hồi	16
9010	Xã Mê Linh	250
9607	Phường Trung Sơn Trầm	269
9700	Xã Minh Quang	271
9796	Xã Hồng Hà	273
9889	Xã La Phù	274
9967	Xã Phú Kim	276
10060	Xã Tốt Động	277
10165	Xã Tân Ước	278
10255	Xã Nghiêm Xuyên	279
10348	Xã Châu Can	280
10438	Xã Hồng Quang	281
949	Xã Phương Thiện	20
799	Xã Cán Chu Phìn	23
889	Xã Thanh Vân	29
976	Xã Bạch Ngọc	24
566	Xã Ngàm Đăng Vài	26
626	Xã Tân Thành	28
728	Xã Cô Ba	35
1399	Xã Trường Hà	37
864	Xã Thắng Lợi	48
1789	Xã Canh Tân	43
1834	Phường Nguyễn Thị Minh Khai	58
1933	Xã Đồng Phúc	49
1053	Xã Bản Thi	52
1120	Xã Văn Lang	54
2329	Xã Ngọc Hội	59
1259	Xã Hòa An	59
1325	Xã Hùng Lợi	61
1405	Xã Kháng Nhật	62
1527	Xã Tả Gia Khâu	83
2800	Xã Nàn Sán	84
2911	Xã Bản Phiệt	86
1539	Phường Ô Quý Hồ	88
1606	Xã Dương Quỳ	89
1652	Xã Quảng Lâm	96
1715	Xã Nà Tòng	99
3359	Xã Hẹ Muông	100
1646	Xã Nậm Tin	103
1815	Xã Nà Tăm	106
2028	Xã Noong Lay	119
3835	Xã Pi Toong	120
3922	Xã Gia Phù	122
2071	Xã Mường Sang	123
2142	Xã Nà Pó	125
2238	Xã Tuy Lộc	132
2240	Xã Nghĩa An	133
4381	Xã Lâm Giang	136
2367	Xã Kim Nọi	137
4591	Xã Pá Lau	139
2498	Xã Bình Thuận	140
4798	Phường Hữu Nghị	148
4885	Xã Hiền Lương	150
5083	Xã Mi Hòa	153
2698	Xã Hang Kia	156
5338	Xã Tự Do	157
5719	Xã Sảng Mộc	170
5797	Xã Phú Xuyên	171
5890	Xã Nam Tiến	172
5986	Xã Hoàng Đồng	178
6082	Xã Yên Lỗ	181
6187	Thị trấn Cao Lộc	183
6295	Xã Đồng Giáp	184
6394	Xã Quyết Thắng	186
3397	Xã Vạn Linh	187
3625	Xã Dân Chủ	193
3537	Phường Trà Cổ	194
6820	Phường Trưng Vương	196
6917	Xã Tân Lập	200
3601	Xã Thắng Lợi	203
3691	Xã Tiền An	206
4037	Xã Song Khê	213
3803	Xã Lam Cốt	216
7438	Xã Thái Đào	217
7549	Xã Thanh Hải	219
4092	Xã Tự Lạn	222
7816	Xã Thanh Vân	223
7909	Phường Thanh Miếu	227
7996	Xã Bằng Doãn	230
8125	Xã Bằng Giã	231
8239	Xã Trạm Thản	233
8344	Xã Tiên Lương	235
8473	Xã Hương Nộn	236
8632	Xã Hương Cần	238
8593	Xã Minh Đài	240
8785	Xã Bắc Bình	246
8911	Thị trấn Hợp Châu	248
9055	Xã Yên Phương	251
9151	Xã An Tường	252
9187	Phường Suối Hoa	256
9265	Xã Phương Liễu	259
9367	Phường Đông Ngàn	261
9454	Thị trấn Gia Bình	263
10513	Phường Ngọc Châu	288
10570	Phường Cộng Hoà	290
10678	Xã Bạch Đằng	292
10777	Xã Ngũ Phúc	293
10882	Xã Thanh Cường	294
10984	Xã Cổ Bì	296
11110	Xã Dân Chủ	298
11224	Xã Hồng Phong	299
11329	Phường Máy Chai	304
11416	Phường Đằng Hải	306
11482	Xã Kỳ Sơn	311
11572	Xã Hoa Động	311
11662	Xã Thái Sơn	313
11779	Xã Cấp Tiến	315
11875	Xã Đồng Minh	316
11965	Phường Quang Trung	323
12040	Xã Liên Nghĩa	326
12133	Xã Xuân Dục	328
12220	Xã Ông Đình	330
12313	Xã Mai Động	331
12421	Xã Tam Đa	333
12496	Xã Quỳnh Giao	338
12589	Xã Điệp Nông	339
12676	Xã Độc Lập	339
12772	Xã Đông Vinh	340
12892	Xã Thụy Duyên	341
13009	Xã Đông Phong	342
13117	Xã Thượng Hiền	343
13213	Xã Song Lãng	344
13306	Xã Phù Vân	347
13384	Thị trấn Quế	350
13489	Xã Thanh Nghị	351
13594	Xã Trần Hưng Đạo	353
13690	Phường Cửa Nam	356
13777	Xã Thành Lợi	359
360	Xã Lệ Chi	18
679	Xã Đại áng	16
9016	Xã Hoàng Kim	250
9613	Xã Sơn Đông	269
9706	Xã Vân Hòa	271
9802	Xã Liên Hà	273
4939	Xã Đông Xuân	275
9973	Xã Canh Nậu	276
10066	Xã Tân Tiến	277
10168	Xã Dân Hòa	278
10258	Xã Tô Hiệu	279
10351	Xã Minh Tân	280
10441	Thị trấn Đại Nghĩa	282
458	Thị trấn Phó Bảng	22
802	Xã Lũng Pù	23
892	Xã Tùng Vài	29
979	Xã Trung Thành	24
1069	Xã Bản Nhùng	26
629	Xã Đồng Tiến	28
695	Phường Sông Hiến	32
738	Xã Hồng Trị	35
807	Thị trấn Trà Lĩnh	39
887	Xã Cô Ngân	48
962	Xã Quang Trung	41
1813	Xã Quang Trọng	43
1915	Xã Địa Linh	49
1102	Xã Yên Hân	53
2194	Xã Đổng Xá	54
2248	Xã Yên Hoa	58
1276	Thị trấn Tân Yên	60
2599	Xã Chi Thiết	62
1441	Phường Lào Cai	80
1500	Xã Quang Kim	82
2839	Thị trấn Bắc Hà	85
2935	Xã Trì Quang	86
3028	Phường Cầu Mây	88
1624	Phường Thanh Bình	94
3194	Xã Nậm Nèn	97
3283	Xã Nà Sáy	99
3208	Xã Phì Nhừ	101
1662	Xã Vàng Đán	103
1836	Xã Bum Tở	107
2031	Xã Mường Khiêng	119
3838	Xã Chiềng Công	120
3925	Xã Tường Phù	122
2072	Xã Đông Sang	123
4138	Xã Cò  Nòi	125
4228	Xã Púng Bánh	127
4279	Xã Tân Thịnh	132
2270	Xã Tân Lĩnh	135
2326	Xã Yên Hợp	136
4639	Xã Sùng Đô	140
2522	Xã Tân Nguyên	141
4897	Xã Thịnh Minh	148
5008	Xã Cao Dương	152
5128	Thị trấn Mãn Đức	155
2742	Thị trấn Vụ Bản	157
5380	Xã Đoàn Kết	158
5491	Xã Quyết Thắng	164
5569	Xã Bảo Cường	167
5668	Xã Tân Long	169
3067	Xã Yên Lãng	171
5866	Xã Phúc Thuận	172
5962	Xã Thanh Ninh	173
3117	Xã Hùng Sơn	180
3246	Xã Trấn Ninh	184
3285	Thị trấn Bắc Sơn	185
3351	Xã Cai Kinh	186
3425	Xã Yên Khoái	188
3505	Phường Giếng Đáy	193
3533	Phường Ninh Dương	194
6814	Phường Bắc Sơn	196
6913	Xã Quảng Tân	200
3597	Xã Đông Xá	203
3684	Xã Sông Khoai	206
3873	Xã Dĩnh Trì	213
3866	Xã Tân Dĩnh	217
4002	Xã Cẩm Đàn	220
4041	Xã Tiền Phong	221
7828	Xã Hoàng An	223
7918	Phường Vân Phú	227
8008	Xã Ngọc Quan	230
8140	Xã Minh Côi	231
8254	Xã Bảo Thanh	233
8362	Xã Thụy Liễu	235
8494	Thị trấn Lâm Thao	237
8647	Xã Yên Lương	238
8620	Xã Tam Thanh	240
8812	Xã Liên Hòa	246
8929	Xã Hồ Sơn	248
9076	Thị trấn Vĩnh Tường	252
8782	Xã Hải Lựu	253
9325	Phường Khắc Niệm	256
9301	Xã Đào Viên	259
9394	Phường Đình Bảng	261
9484	Xã Xuân Lai	263
10537	Phường Hải Tân	288
10600	Phường Đồng Lạc	290
10705	Xã Quang Thành	292
10810	Xã Đại Đức	293
10918	Xã Định Sơn	295
11041	Xã Lê Lợi	297
11146	Xã Nguyên Giáp	298
11260	Xã Lam Sơn	300
11362	Phường Lạch Tray	304
11443	Phường Trần Thành Ngọ	307
11515	Xã Hợp Thành	311
11605	Xã Bắc Sơn	312
11713	Xã Kiến Quốc	314
11812	Xã Tây Hưng	315
11905	Xã Cổ Am	316
12334	Xã Hùng Cường	323
12064	Xã Ngọc Long	327
12154	Xã Đào Dương	329
12244	Xã Hồng Tiến	330
12337	Thị trấn Vương	332
12436	Phường Bồ Xuyên	336
12508	Xã Quỳnh Khê	338
12601	Xã Canh Tân	339
12688	Thị trấn Đông Hưng	340
12790	Xã Hồng Giang	340
12910	Xã Thái Nguyên	341
13030	Xã Tây Phong	342
13135	Xã Hòa Bình	343
13234	Xã Minh Quang	344
13372	Xã Tiên Hiệp	347
13405	Xã Đồng Hóa	350
13516	Xã Đồng Du	352
13618	Xã Nhân Bình	353
13708	Thị trấn Mỹ Lộc	358
13795	Thị trấn Lâm	360
13885	Xã Yên Nhân	360
13978	Xã Nam Thắng	362
14068	Xã Trực Mỹ	363
14155	Xã Giao Hương	365
14248	Xã Hải Thanh	366
13867	Xã Yên Phúc	360
13966	Thị trấn Nam Giang	362
14056	Thị trấn Cát Thành	363
14143	Xã Xuân Ninh	364
14233	Xã Hải Minh	366
14326	Phường Thanh Bình	369
14413	Xã Lạc Vân	372
14500	Xã Gia Phương	373
14590	Xã Khánh Trung	375
14689	Xã Cồn Thoi	376
14779	Phường Ngọc Trạo	380
14821	Phường Đông Sơn	381
14902	Xã Nam Tiến	385
15007	Xã Tam Thanh	387
15103	Xã Ngọc Trung	389
15205	Xã Thạch Cẩm	391
15313	Xã Hà Sơn	392
15421	Xã Yên Trường	394
15535	Xã Xuân Hưng	395
15655	Xã Ngọc Phụng	396
15751	Xã Thọ Ngọc	397
15847	Xã Tân Châu	398
15991	Xã Hoằng Hải	399
16096	Xã Ba Đình	401
16204	Xã Bình Lương	402
16309	Xã Tế Thắng	404
16414	Xã Đông Thịnh	405
16555	Xã Quảng Thạch	406
16654	Phường Hải Thượng	407
16723	Phường Thu Thuỷ	413
16789	Xã Châu Nga	416
16879	Xã Mai Sơn	418
16981	Xã Nghĩa Trung	419
17101	Xã Quỳnh Thắng	421
17224	Xã Tân Thắng	421
17314	Xã Kỳ Sơn	423
17398	Xã Diễn Trường	425
17494	Xã Diễn Lộc	425
17569	Xã Bắc Thành	426
17656	Xã Nam Sơn	427
17752	Xã Thanh Đồng	428
17839	Xã Nghi Hưng	429
17947	Xã Nam Thái	430
18052	Xã Châu Nhân	431
18121	Phường Trung Lương	437
18235	Xã Quang Vĩnh	440
18355	Xã Xuân Hội	442
18484	Thị trấn Đồng Lộc	443
18595	Xã Đỉnh Bàn	445
18727	Xã Cẩm Hà	446
18412	Xã Hồng Lộc	448
18880	Phường Đức Ninh Đông	450
18970	Xã Lê Hóa	453
19114	Thị trấn NT Việt Trung	455
19207	Xã Lương Ninh	456
19300	Xã Xuân Thủy	457
19342	Phường 2	461
19432	Thị trấn Lao Bảo	465
19525	Xã Gio Châu	466
19627	Xã Triệu An	469
19735	Xã Hải Sơn	470
19924	Xã Phú Thanh	474
19882	Xã Quảng Phước	477
19996	Phường Tứ Hạ	480
20116	Xã Vinh Hưng	482
20207	Phường Thanh Khê Đông	491
20285	Phường Khuê Mỹ	494
20362	Xã Tam Thăng	502
20476	Xã Jơ Ngây	505
20562	Xã Điện Thắng Nam	507
20647	Xã Quế Xuân 2	509
20701	Xã Zuôich	510
20788	Xã Bình Sơn	512
20875	Xã Tiên Hiệp	514
20962	Xã Trà Vinh	516
20656	Xã Quế Trung	519
21049	Xã Bình Đông	524
21145	Xã Trà Thanh	525
21286	Xã Nghĩa Mỹ	528
21364	Thị trấn Chợ Chùa	532
21457	Xã Phổ Nhơn	534
21553	Phường Nhơn Phú	540
21640	Phường Bồng Sơn	543
21733	Thị trấn Bình Dương	545
21817	Xã Bình Thuận	547
21910	Phường Đập Đá	549
22000	Xã Canh Hiệp	551
22072	Xã Xuân Phương	557
22159	Xã An Thọ	559
22273	Xã Hòa Tân Tây	562
22339	Phường Vĩnh Thọ	568
22429	Phường Cam Lợi	569
22513	Xã Vạn Lương	571
22606	Xã Ninh Vân	572
22696	Xã Bình Lộc	574
22786	Xã Phước Hòa	584
22876	Xã Phước Thái	587
22945	Phường Lạc Đạo	593
23014	Xã Bình An	596
23107	Xã Đa Mi	597
23200	Xã Sùng Nhơn	600
23308	Phường Trần Hưng Đạo	608
23398	Xã Sa Loong	611
23509	Xã Đắk Ui	615
23537	Xã Ia Dom	618
23629	Xã Cửu An	623
23683	Xã Đăk Sơmei	626
23764	Thị trấn Ia Kha	628
23843	Xã Đăk Pling	630
23926	Xã Ia Pia	632
24016	Xã Chư Răng	635
24060	Xã Chrôh Pơnan	638
24172	Xã Hòa Phú	643
24220	Xã Ya Tờ Mốt	646
24307	Xã Cư Né	649
24401	Xã Cư Prông	651
24487	Xã Yang Mao	653
24595	Xã Buôn Tría	656
24640	Thị trấn Ea T'Ling	662
24718	Xã Đắk Môl	665
24793	Phường 4	672
24850	Xã Đưng KNớ	675
24961	Xã Hiệp An	678
25048	Xã Sơn Điền	679
25138	Xã Quảng Trị	682
25325	Phường Phú Thịnh	690
25310	Xã Phước Thiện	693
25398	Xã Đường 10	696
25255	Xã Long Hà	698
25534	Xã Suối Dây	706
25624	Xã Ninh Điền	708
25714	Xã Hưng Thuận	712
25789	Xã Định An	720
25915	Phường Hội Nghĩa	723
25907	Xã Đất Cuốc	726
26068	Phường Hóa An	731
26149	Xã Phú Xuân	734
26239	Xã Túc Trưng	736
26329	Xã Sông Nhạn	739
26437	Xã Xuân Thọ	741
26524	Phường 7	747
26599	Xã Cù Bị	750
26686	Xã Phước Hội	753
13909	Xã Hoàng Nam	361
14002	Xã Nam Dương	362
14092	Xã Xuân Châu	364
14182	Xã Giao An	365
14272	Xã Hải Sơn	366
14362	Phường Bắc Sơn	370
14446	Xã Phú Lộc	372
14539	Xã Ninh Mỹ	374
14638	Xã Ân Hòa	376
14734	Xã Yên Thành	377
15925	Xã Hoằng Quang	380
14854	Xã Mường Lý	384
14947	Xã Lương Nội	386
15043	Xã Giao Thiện	388
15139	Xã Cẩm Lương	390
15232	Xã Thành Minh	391
15349	Thị trấn Vĩnh Lộc	393
15454	Xã Định Công	394
15559	Xã Xuân Thiên	395
15676	Xã Hợp Lý	397
15772	Thị trấn Thiệu Hóa	398
15886	Xã Hoằng Quỳ	399
16006	Xã Hoằng Trường	399
16114	Xã Nga Phượng	401
16210	Xã Thanh Xuân	402
16315	Xã Tế Lợi	404
16417	Xã Đông Văn	405
16561	Phường Hải Hòa	407
16660	Xã Hải Hà	407
16729	Phường Nghi Hải	413
16792	Xã Châu Tiến	416
16882	Xã Nhôn Mai	418
16984	Xã Nghĩa Hội	419
17098	Thị trấn Cầu Giát	421
17218	Xã Quỳnh Thuận	421
17305	Xã Tân An	423
17386	Xã Cao Sơn	424
17485	Xã Minh Châu	425
17575	Xã Trung Thành	426
17662	Xã Yên Sơn	427
17749	Xã Đại Đồng	428
17836	Xã Nghi Tiến	429
17944	Xã Nam Xuân	430
18055	Xã Xuân Lam	431
18127	Phường Đậu Liêu	437
18244	Xã Trường Sơn	440
18373	Thị trấn Tiên Điền	442
18502	Xã Hà Linh	444
18628	Xã Tượng Sơn	445
18748	Xã Cẩm Lạc	446
18580	Xã Thạch Kim	448
18910	Xã Hóa Phúc	452
19015	Xã Quảng Kim	454
19156	Xã Hưng Trạch	455
19246	Thị trấn NT Lệ Ninh	457
19075	Xã Quảng Trung	458
19375	Xã Vĩnh Chấp	464
19480	Xã Thanh	465
19588	Xã Tà Rụt	467
19687	Xã Hải Ba	470
19804	Phường Hương Sơ	474
19855	Xã Phong Mỹ	476
19969	Phường Thủy Dương	479
20098	Xã Đông Sơn	481
20195	Phường Hòa Hiệp Nam	490
20272	Phường An Hải Bắc	493
20350	Phường An Sơn	502
20467	Thị trấn P Rao	505
20554	Xã Điện Tiến	507
20632	Xã Duy Vinh	508
20722	Thị trấn Khâm Đức	511
20812	Xã Bình Minh	513
20899	Thị trấn Trà My	515
20984	Xã Tam Anh Nam	517
21022	Phường Trần Hưng Đạo	522
21073	Xã Bình Phước	524
21181	Xã Tịnh Phong	527
21310	Xã Sơn Trung	529
21394	Xã Hành Tín Tây	532
21487	Xã Ba Điền	535
21583	Phường Lê Lợi	540
21667	Phường Hoài Thanh	543
21757	Xã Mỹ Trinh	545
21838	Xã Tây Vinh	547
21931	Xã Nhơn Phúc	549
22024	Phường 9	555
22093	Xã Xuân Long	558
22186	Xã Sơn Xuân	560
22294	Xã Hòa Thịnh	562
22354	Phường Phương Sơn	568
22480	Xã Cam Thịnh Đông	569
22531	Xã Ninh Sơn	572
22618	Xã Khánh Trung	573
22717	Xã Thành Sơn	575
22798	Xã Phước Thành	584
22912	Xã Phước Vinh	587
22957	Xã Thiện Nghiệp	593
23020	Xã Hải Ninh	596
23113	Xã Mỹ Thạnh	598
23206	Xã Nam Chính	600
23305	Phường Nguyễn Trãi	608
23392	Xã Đắk Kan	611
23500	Thị trấn Đắk Hà	615
23446	Xã Tê Xăng	617
23623	Phường An Tân	623
23677	Thị trấn Đăk Đoa	626
23755	Xã Nghĩa Hòa	627
23851	Xã Chơ Long	630
23929	Xã Ia Ga	632
24022	Xã Kim Tân	635
23972	Xã Ia Rong	639
24308	Phường An Bình	644
24226	Xã Cư KBang	646
24314	Xã Ea Sin	649
24409	Xã Cư Jang	651
24496	Xã Ea Kly	654
24604	Xã Krông Nô	656
24655	Xã Tâm Thắng	662
24721	Xã Nam Bình	665
24781	Phường 2	672
24846	Thị trấn Lạc Dương	675
24958	Thị trấn Liên Nghĩa	678
25039	Xã Hòa Trung	679
25135	Xã Mỹ Đức	682
25324	Phường An Lộc	690
25309	Xã Hưng Phước	693
25396	Thị trấn Đức Phong	696
25252	Xã Bù Nho	698
25531	Xã Suối Ngô	706
25618	Xã Thanh Điền	708
25711	Xã Đôn Thuận	712
25777	Thị trấn Dầu Tiếng	720
25888	Phường Uyên Hưng	723
25900	Thị trấn Tân Bình	726
26056	Phường Long Bình Tân	731
26137	Xã Phú Sơn	734
26230	Xã Gia Canh	736
26320	Xã Lộ 25	738
26425	Thị trấn Gia Ray	741
26509	Phường 2	747
26584	Xã Xuân Sơn	750
26677	Xã Phước Hưng	752
26761	Phường Cầu Kho	760
13912	Xã Nghĩa Châu	361
14014	Xã Đồng Sơn	362
14104	Xã Xuân Phong	364
14194	Xã Giao Yến	365
14287	Xã Hải Tây	366
14369	Phường Tây Sơn	370
14455	Xã Sơn Hà	372
14551	Xã Ninh Thắng	374
14650	Xã Như Hòa	376
14752	Xã Yên Lâm	377
16441	Phường Quảng Thịnh	380
14869	Thị trấn Hồi Xuân	385
14962	Xã Hạ Trung	386
15052	Xã Lâm Phú	388
15148	Xã Cẩm Giang	390
15250	Xã Thành An	391
15361	Xã Vĩnh Long	393
15460	Xã Định Tiến	394
15571	Xã Quảng Phú	395
15688	Xã Hợp Thắng	397
15784	Xã Thiệu Tiến	398
15907	Xã Hoằng Cát	399
16027	Xã Tiến Lộc	400
16138	Xã Nga Hải	401
16228	Thị trấn Bến Sung	403
16330	Xã Trường Trung	404
16447	Xã Quảng Trạch	406
16576	Phường Hải Ninh	407
16684	Phường Đội Cung	412
17014	Xã Nghĩa Thuận	414
16825	Xã Đoọc Mạy	417
16924	Xã Tam Thái	418
17044	Xã Châu Hồng	420
17161	Xã Quỳnh Mỹ	421
17251	Xã Chi Khê	422
17338	Xã Bình Sơn	424
17425	Xã Diễn Liên	425
17518	Xã Đức Thành	426
17605	Xã Bảo Thành	426
17689	Xã Xuân Sơn	427
17776	Xã Thanh Chi	428
17866	Xã Nghi Long	429
17986	Xã Khánh Sơn	430
17107	Xã Quỳnh Lộc	432
18136	Thị trấn  Tây Sơn	439
18259	Xã Tùng Ảnh	440
18388	Xã Xuân Hồng	442
18520	Xã Lộc Yên	444
18637	Xã Thạch Thắng	445
18757	Xã Kỳ Xuân	447
18583	Xã Thạch Châu	448
18901	Thị trấn Quy Đạt	452
18997	Xã Tiến Hóa	453
19138	Xã Phúc Trạch	455
19231	Xã Hiền Ninh	456
19321	Xã Trường Thủy	457
19361	Phường 3	462
19456	Xã Tân Thành	465
19558	Xã Mò Ó	467
19651	Xã Triệu Lăng	469
19768	Phường Đông Ba	474
19822	Xã Điền Hương	476
19921	Xã Phú Diên	478
20047	Xã Hồng Vân	481
20146	Xã Lộc Thủy	482
20225	Phường Hòa Khê	491
20293	Xã Hòa Bắc	497
20413	Phường Cẩm Châu	503
20506	Xã Đại Lãnh	506
20581	Phường Điện Dương	507
20680	Xã Quế Châu	509
20764	Xã Quế Thọ	512
20851	Xã Bình Nam	513
20938	Xã Trà Dơn	516
20374	Xã Tam Đàn	518
21211	Xã Tịnh Khê	522
21115	Thị trấn Trà Xuân	525
21241	Xã Nghĩa Lâm	528
21338	Xã Sơn Màu	530
21421	Xã Đức Thạnh	533
21508	Xã Ba Khâm	535
21607	Xã Nhơn Châu	540
21690	Xã Ân Hảo Tây	544
21787	Xã Vĩnh Sơn	546
21874	Xã Cát Thành	548
21961	Xã Phước Hưng	550
22045	Xã Bình Kiến	555
22117	Xã An Dân	559
22213	Xã Đức Bình Tây	561
22246	Phường Hòa Hiệp Bắc	564
22387	Xã Vĩnh Phương	568
22459	Xã Cam Phước Tây	570
22561	Phường Ninh Diêm	572
22651	Thị trấn Diên Khánh	574
22744	Phường Bảo An	582
22834	Thị trấn Khánh Hải	586
22906	Xã Phước Minh	589
22972	Thị trấn Phan Rí Cửa	595
23065	Xã La Dạ	597
23158	Xã Nghị Đức	599
23257	Xã Tân Hà	601
23350	Xã Đắk Nhoong	610
23464	Xã Ngok Tem	613
23539	Xã Sa Sơn	616
23579	Phường Đống Đa	622
24065	Xã Chư Băh	624
23710	Xã A Dơk	626
23791	Xã Ia Pếch	628
23848	Xã Ya Ma	630
23932	Xã Ia Lâu	632
24025	Xã Chư Mố	635
23971	Xã Ia Hrú	639
24311	Phường Thiện An	644
24229	Xã Ea Bung	646
24316	Xã Pơng Drang	649
24406	Xã Cư Bông	651
24493	Xã KRông Búk	654
24601	Xã Đắk Nuê	656
24646	Xã Ea Pô	662
24719	Xã Đắk Hòa	665
24799	Phường 11	672
24865	Xã Đạ Sar	675
24967	Xã Hiệp Thạnh	678
25054	Thị trấn Lộc Thắng	680
25147	Xã Triệu Hải	682
25326	Phường Phú Đức	690
25312	Xã Thiện Hưng	693
25399	Xã Đak Nhau	696
25258	Xã Long Tân	698
25537	Xã Tân Hiệp	706
25627	Xã Long Vĩnh	708
25717	Phường Lộc Hưng	712
25786	Xã Minh Tân	720
25912	Phường Vĩnh Tân	723
25903	Xã Tân Lập	726
26065	Phường Hiệp Hòa	731
26140	Xã Phú Thịnh	734
26227	Xã La Ngà	736
26314	Xã Bàu Hàm 2	738
26419	Xã Tân Hiệp	740
26508	Phường Thắng Tam	747
26581	Xã Suối Nghệ	750
26671	Xã An Nhứt	752
26755	Phường Cô Giang	760
13993	Xã Nam Hồng	362
14083	Xã Trực Hùng	363
14173	Xã Giao Tiến	365
14263	Xã Hải Lộc	366
14353	Xã Ninh Phúc	369
14437	Xã Sơn Lai	372
14527	Thị trấn Thiên Tôn	374
14623	Thị trấn Bình Minh	376
14722	Xã Yên Hòa	377
15856	Phường Thiệu Khánh	380
16531	Phường Quảng Châu	382
14935	Xã Điền Trung	386
15037	Xã Trí Nang	388
15133	Xã Cẩm Thành	390
15235	Xã Thành Công	391
15343	Xã Hà Hải	392
15451	Xã Định Thành	394
15568	Xã Thọ Lập	395
15682	Xã Hợp Thành	397
15778	Xã Thiệu Vũ	398
15889	Xã Hoằng Kim	399
16003	Xã Hoằng Phụ	399
16102	Xã Nga Văn	401
16207	Xã Thanh Quân	402
16318	Xã Tế Nông	404
16420	Xã Đông Phú	405
16564	Phường Hải Châu	407
16666	Phường Hà Huy Tập	412
16732	Phường Nghi Hương	413
16798	Xã Châu Thắng	416
16900	Xã Yên Tĩnh	418
16996	Xã Nghĩa Hiếu	419
17122	Xã Quỳnh Châu	421
17233	Xã Lạng Khê	422
17323	Xã Phú Sơn	423
17404	Xã Diễn Hoàng	425
17500	Xã Diễn An	425
17584	Xã Nam Thành	426
17671	Xã Lạc Sơn	427
17759	Xã Ngọc Lâm	428
17851	Xã Nghi Quang	429
17959	Xã Xuân Hòa	430
18079	Phường Tân Giang	436
18184	Xã Quang Diệm	439
18319	Xã Đức Giang	441
18439	Xã Thường Nga	443
18556	Xã Hương Lâm	444
18694	Xã Cẩm Thành	446
18802	Xã Kỳ Hải	447
18853	Phường Hải Thành	450
18952	Xã Hương Hóa	453
19045	Xã Quảng Xuân	454
19192	Xã Tân Trạch	455
19285	Xã Liên Thủy	457
19330	Phường Đông Giang	461
19420	Xã Vĩnh Sơn	464
19519	Xã Gio Hải	466
19621	Xã Cam Nghĩa	468
19717	Xã Hải Lâm	470
19906	Xã Phú Dương	474
19876	Xã Quảng Lợi	477
19990	Xã Phú Sơn	479
20110	Thị trấn Lăng Cô	482
20203	Phường Tam Thuận	491
20278	Phường An Hải Tây	493
20356	Phường An Phú	502
20470	Xã Tà Lu	505
20560	Xã Điện Thắng Bắc	507
20638	Xã Duy Hải	508
20725	Xã Phước Xuân	511
20815	Xã Bình Lãnh	513
20900	Xã Trà Sơn	515
20986	Xã Tam Hòa	517
21019	Phường Nghĩa Chánh	522
21070	Xã Bình Dương	524
21184	Xã Tịnh Hiệp	527
21316	Xã Sơn Cao	529
21397	Xã Hành Tín  Đông	532
21484	Thị trấn Ba Tơ	535
21580	Phường Lý Thường Kiệt	540
21670	Phường Hoài Hương	543
21754	Xã Mỹ Phong	545
21841	Xã Vĩnh An	547
21928	Xã Nhơn An	549
22015	Phường 1	555
22084	Xã Đa Lộc	558
22177	Xã Sơn Long	560
22285	Xã Hòa Mỹ Đông	562
22357	Phường Phước Hải	568
22483	Xã Cam Lập	569
22537	Xã Ninh Thượng	572
22624	Xã Khánh Thượng	573
22723	Xã Sơn Hiệp	575
22804	Xã Phước Chính	584
22843	Xã Phước Kháng	588
22966	Xã Tiến Thành	593
23032	Thị trấn Lương Sơn	596
23119	Xã Mương Mán	598
23212	Xã Đức Hạnh	600
23314	Xã Kroong	608
23401	Thị trấn Đắk Tô	612
23510	Xã Đăk Ngọk	615
23557	Phường Yên Đỗ	622
23630	Phường An Phước	623
23684	Xã Đăk Krong	626
23767	Xã Ia Sao	628
23869	Xã Ia Kla	631
23950	Xã Ia Glai	633
24085	Xã Chư Gu	637
24124	Phường Tân An	643
24340	Xã Cư Bao	644
24253	Xã Ea Nuôl	647
24359	Xã Ea Puk	650
24436	Xã Cư M'ta	652
24523	Xã Hòa Tiến	654
24553	Xã Ea Hu	657
24676	Xã Đức Mạnh	663
24754	Xã Kiến Thành	666
24823	Phường 1	673
24907	Xã Tân Thanh	676
24997	Xã Ninh Loan	678
25084	Xã Lộc An	680
25192	Xã Đồng Nai Thượng	683
25270	Thị trấn Lộc Ninh	692
25351	Xã Phước An	694
25424	Xã Nghĩa Bình	696
25480	Phường Ninh Sơn	703
25570	Xã Chà Là	707
25660	Xã Cẩm Giang	710
25756	Phường Chánh Nghĩa	718
25840	Xã An Điền	721
25945	Phường Tân Bình	724
26008	Phường Tân Hiệp	731
26083	Phường Xuân Hoà	732
26176	Xã Trị An	735
26269	Xã Bắc Sơn	737
26359	Xã Xuân Đông	739
26467	Xã Lang Minh	741
26548	Phường Phước Hưng	748
26629	Xã Xuyên Mộc	751
26716	Phường Tân Phước	754
26878	Phường 16	764
26953	Phường 21	765
27046	Phường 05	768
14047	Xã Trực Đạo	363
14137	Xã Xuân Kiên	364
14227	Xã Hải Trung	366
14320	Phường Đông Thành	369
14404	Xã Cúc Phương	372
14491	Xã Gia Vượng	373
14584	Xã Khánh Thiện	375
14683	Xã Kim Tân	376
14776	Phường Ba Đình	380
14818	Phường Ngọc Trạo	381
14896	Xã Hiền Chung	385
15001	Xã Trung Hạ	387
15100	Xã Cao Thịnh	389
15199	Xã Thạch Quảng	391
15304	Xã Hà Ngọc	392
15415	Xã Yên Thọ	394
15526	Xã Xuân Giang	395
15646	Thị trấn Thường Xuân	396
15739	Xã Xuân Lộc	397
15832	Xã Thiệu Viên	398
15955	Xã Hoằng Thái	399
16066	Xã Liên Lộc	400
16165	Xã Nga Thạch	401
16267	Xã Yên Lạc	403
16366	Xã Tượng Sơn	404
16492	Xã Quảng Trung	406
16618	Phường Bình Minh	407
16702	Xã Nghi Phú	412
16747	Xã Hạnh Dịch	415
16834	Xã Na Loi	417
16936	Xã Tam Hợp	418
17053	Xã Liên Hợp	420
17176	Xã Quỳnh Lương	421
17266	Thị trấn Tân Kỳ	423
17356	Xã Tường Sơn	424
17440	Xã Diễn Thái	425
17527	Xã Đô Thành	426
17617	Thị trấn Đô Lương	427
17701	Xã Hiến Sơn	427
17794	Xã Thanh Long	428
17890	Xã Nghi Thạch	429
18004	Xã Hưng Trung	431
17137	Xã Quỳnh Liên	432
18163	Xã An Hòa Thịnh	439
18304	Xã Đức Đồng	440
18415	Xã Thiên Lộc	443
18544	Xã Hương Xuân	444
18679	Xã Yên Hòa	446
18787	Xã Kỳ Trung	447
18832	Phường Kỳ Phương	449
18934	Xã Tân Hóa	452
19033	Xã Quảng Tùng	454
19174	Xã Phú Định	455
19267	Xã Phong Thủy	457
19099	Xã Quảng Văn	458
19405	Xã Vĩnh Lâm	464
19501	Xã Trung Hải	466
19606	Xã Cam Thủy	468
19708	Xã Hải Thượng	470
19815	Phường An Đông	474
19873	Xã Quảng Ngạn	477
19987	Xã Thủy Phù	479
20104	Xã Hồng Thủy	481
20194	Phường Hòa Hiệp Bắc	490
20269	Phường Mân Thái	493
20344	Phường Hòa Hương	502
20464	Xã Dang	504
20551	Phường Vĩnh Điện	507
20629	Xã Duy Thành	508
20729	Xã Phước Hoà	511
20821	Xã Bình Định Bắc	513
20908	Xã Trà Đông	515
20995	Xã Tam Giang	517
21031	Phường Chánh Lộ	522
21085	Xã Bình Minh	524
21205	Xã Tịnh Bắc	527
21319	Xã Sơn Hải	529
21400	Thị trấn Mộ Đức	533
21490	Xã Ba Vinh	535
21586	Phường Trần Phú	540
21676	Xã Hoài Hải	543
21763	Xã Mỹ Hòa	545
21850	Xã Tây Phú	547
21940	Xã Nhơn Lộc	549
22030	Phường 4	555
22096	Xã Xuân Quang 1	558
22192	Xã Eachà Rang	560
22315	Xã Hòa An	563
22372	Phường Phước Hòa	568
22444	Xã Cam Hải Tây	570
22516	Xã Vạn Thắng	571
22603	Xã Ninh Ích	572
22690	Xã Diên Toàn	574
22780	Phường Mỹ Hải	582
22837	Xã Phước Chiến	588
22963	Xã Tiến Lợi	593
23026	Xã Phan Tiến	596
23116	Xã Hàm Cần	598
23215	Xã Đức Tín	600
23317	Xã Ngọk Bay	608
23428	Xã Ngọk Tụ	612
23515	Xã Ngok Wang	615
23560	Phường Diên Hồng	622
23633	Phường Ngô Mây	623
23695	Xã Nam Yang	626
23776	Xã Ia KRai	628
23857	Thị trấn Chư Ty	631
23941	Thị trấn Chư Sê	633
24037	Xã Ia Trok	635
23980	Xã Chư Don	639
24325	Xã Ea Blang	644
24238	Xã Ea Huar	647
24343	Thị trấn Krông Năng	650
24421	Xã Ea Lai	652
24511	Xã Hòa An	654
24544	Xã Ea Ktur	657
24667	Xã  Đắk Lao	663
24730	Xã Trường Xuân	665
24814	Phường Lộc Phát	673
24892	Xã Mê Linh	676
24979	Xã Tân Thành	678
25063	Xã Lộc Phú	680
25162	Xã Tiên Hoàng	683
25228	Xã Đức Hạnh	691
25330	Xã An Khương	694
25408	Xã Minh Hưng	696
25462	Phường 4	703
25552	Thị trấn Dương Minh Châu	707
25642	Xã Trường Đông	709
25735	Phường An Hòa	712
25804	Xã Long Tân	720
25930	Xã Bạch Đằng	723
25918	Xã Tân Mỹ	726
26380	Xã Long Hưng	731
26158	Xã Phú Bình	734
26251	Xã Thanh Bình	737
26344	Xã Xuân Mỹ	739
26446	Xã Xuân Hưng	741
26533	Phường Thắng Nhất	747
26614	Xã Đá Bạc	750
26707	Xã Tân Hoà	754
26788	Phường Đông Hưng Thuận	761
26932	Phường 06	765
27022	Phường Tân Thành	767
26824	Phường Bình Thọ	769
14065	Xã Trực Thuận	363
14077	Thị trấn Ninh Cường	363
14152	Thị trấn Quất Lâm	365
14167	Xã Hoành Sơn	365
14242	Xã Hải Bắc	366
14257	Xã Hải Phương	366
14335	Phường Phúc Thành	369
14350	Xã Ninh Tiến	369
14375	Phường Tân Bình	370
14422	Xã Lạng Phong	372
14428	Xã Văn Phong	372
14467	Xã Gia Hòa	373
14515	Xã Gia Lạc	373
14518	Xã Gia Tiến	373
14554	Xã Ninh Vân	374
14608	Xã Khánh Thành	375
14611	Xã Khánh Nhạc	375
14653	Xã Chất Bình	376
14704	Xã Khánh Thượng	377
14707	Xã Khánh Dương	377
14749	Xã Yên Thái	377
14797	Phường Đông Hải	380
14800	Phường Quảng Hưng	380
16435	Phường An Hưng	380
14839	Phường Quảng Cư	382
14842	Phường Quảng Tiến	382
14866	Xã Mường Chanh	384
14917	Xã Nam Động	385
14923	Thị trấn Cành Nàng	386
14965	Xã Cổ Lũng	386
15013	Xã Na Mèo	387
15022	Xã Sơn Điện	387
15064	Xã Lam Sơn	389
15109	Xã Phùng Minh	389
15118	Xã Kiên Thọ	389
15160	Xã Cẩm Châu	390
15208	Xã Thạch Sơn	391
15220	Xã Thạch Long	391
15259	Xã Thành Long	391
15316	Xã Hà Lĩnh	392
15331	Xã Hà Lai	392
15367	Xã Vĩnh Hưng	393
15430	Xã Yên Thái	394
15442	Xã Yên Lạc	394
15475	Xã Định Hải	394
15538	Xã Thọ Diên	395
15553	Thị trấn Sao Vàng	395
15592	Xã Xuân Minh	395
15658	Xã Xuân Chinh	396
15673	Xã Thọ Tiến	397
15691	Xã Minh Sơn	397
15757	Xã Thọ Phú	397
15769	Xã Bình Sơn	397
15793	Xã Thiệu Long	398
15853	Xã Thiệu Giao	398
15883	Xã Hoằng Phú	399
15919	Xã Hoằng Hợp	399
15997	Xã Hoằng Đông	399
16000	Xã Hoằng Thanh	399
16036	Xã Thành Lộc	400
16105	Xã Nga Thiện	401
16108	Xã Nga Tiến	401
16141	Xã Nga Thành	401
16213	Xã Thanh Hòa	402
16216	Xã Thanh Phong	402
16243	Xã Mậu Lâm	403
16321	Xã Minh Nghĩa	404
16324	Xã Minh Khôi	404
16348	Xã Trường Sơn	404
16423	Xã Đông Nam	405
16426	Xã Đông Quang	405
16468	Xã Quảng Bình	406
16567	Xã Thanh Thủy	407
16570	Xã Thanh Sơn	407
16600	Xã Định Hải	407
16663	Phường Đông Vĩnh	412
16669	Phường Lê Lợi	412
16672	Phường Hưng Bình	412
16735	Phường Nghi Thu	413
16939	Phường Hoà Hiếu	414
16994	Phường Quang Tiến	414
16795	Xã Châu Hạnh	416
16804	Xã Châu Bình	416
16807	Xã Châu Hoàn	416
16885	Xã Hữu Khuông	418
16904	Xã Xiêng My	418
16906	Xã Lưỡng Minh	418
16987	Xã Nghĩa Thành	419
17023	Xã Nghĩa An	419
17029	Xã Nghĩa Lộc	419
17119	Xã Quỳnh Tân	421
17146	Xã Ngọc Sơn	421
17149	Xã Quỳnh Tam	421
17221	Xã Quỳnh Long	421
17230	Xã Bình Chuẩn	422
17242	Xã Đôn Phục	422
17311	Xã Tân Long	423
17320	Xã Kỳ Tân	423
17329	Thị trấn Anh Sơn	424
17392	Xã Diễn Lâm	425
17401	Xã Diễn Yên	425
17416	Xã Diễn Phong	425
17491	Xã Diễn Lợi	425
17497	Xã Diễn Trung	425
17510	Xã Tiến Thành	426
17578	Xã Long Thành	426
17581	Xã Minh Thành	426
17596	Xã Viên Thành	426
17665	Xã Văn Sơn	427
17668	Xã Đà Sơn	427
17683	Xã Thịnh Sơn	427
17758	Xã Thanh Hương	428
17761	Xã Thanh Lĩnh	428
17773	Xã Thanh An	428
17842	Xã Nghi Đồng	429
17848	Xã Nghi Lâm	429
17863	Xã Nghi Thuận	429
17953	Xã Nam Lĩnh	430
17956	Xã Nam Giang	430
17968	Xã Thượng Tân Lộc	430
17104	Xã Quỳnh Vinh	432
17110	Phường Quỳnh Thiện	432
18070	Phường Trần Phú	436
18130	Xã Thuận Lộc	437
18133	Thị trấn Phố Châu	439
18172	Xã Sơn Tây	439
18247	Xã Liên Minh	440
18253	Xã Yên Hồ	440
18307	Xã Đức Lạng	440
18379	Xã Xuân Mỹ	442
18382	Xã Xuân Thành	442
18406	Thị trấn Nghèn	443
18505	Xã Hương Thủy	444
18508	Xã Hòa Hải	444
18535	Xã Phú Phong	444
18622	Xã Thạch Lạc	445
18625	Xã Thạch Ngọc	445
18658	Xã Thạch Xuân	445
18742	Xã Cẩm Trung	446
18745	Xã Cẩm Sơn	446
18772	Xã Kỳ Giang	447
18568	Thị trấn Lộc Hà	448
18577	Xã Thạch Mỹ	448
18808	Xã Kỳ Hà	449
14095	Xã Xuân Hồng	364
14185	Xã Giao Lạc	365
14275	Xã Hải Tân	366
14368	Phường Nam Sơn	370
14452	Xã Quỳnh Lưu	372
14503	Xã Gia Tân	373
14542	Xã Ninh Hòa	374
14593	Xã Khánh Mậu	375
14635	Xã Kim Định	376
14692	Xã Kim Hải	376
14731	Xã Yên Hưng	377
14785	Phường Đông Sơn	380
15922	Phường Long Anh	380
14824	Xã Quang Trung	381
14848	Xã Tam Chung	384
14911	Xã Phú Nghiêm	385
14950	Xã Điền Lư	386
15010	Xã Sơn Thủy	387
15049	Xã Tam Văn	388
15106	Xã Phùng Giáo	389
15142	Xã Cẩm Thạch	390
15211	Xã Thạch Bình	391
15241	Xã Thành Trực	391
15319	Xã Hà Đông	392
15355	Xã Vĩnh Yên	393
15427	Xã Yên Phong	394
15463	Xã Định Long	394
15532	Xã Xuân Sinh	395
15577	Xã Phú Xuân	395
15661	Xã Tân Thành	396
15709	Xã An Nông	397
15754	Xã Thọ Cường	397
15799	Xã Thiệu Duy	398
15841	Xã Thiệu Trung	398
15928	Xã Hoằng Đức	399
15988	Xã Hoằng Tiến	399
16033	Xã Cầu Lộc	400
16084	Xã Hải Lộc	400
16144	Xã Nga An	401
16183	Xã Xuân Bình	402
16240	Xã Phượng Nghi	403
16285	Xã Tân Thọ	404
16345	Xã Trường Minh	404
16384	Xã Đông Ninh	405
16471	Xã Quảng Hợp	406
16519	Xã Quảng Giao	406
16597	Phường Hải Lĩnh	407
16639	Xã Tùng Lâm	407
16673	Phường Hưng Phúc	412
17920	Xã Nghi Kim	412
17005	Xã Nghĩa Tiến	414
16771	Xã Quang Phong	415
16813	Thị trấn Mường Xén	417
16858	Xã Mường Típ	417
16912	Xã Yên Na	418
16954	Xã Nghĩa Sơn	419
17035	Thị trấn Quỳ Hợp	420
17074	Xã Nghĩa Xuân	420
17158	Xã Quỳnh Bảng	421
17194	Xã Quỳnh Hưng	421
17248	Xã Châu Khê	422
17284	Xã Nghĩa Đồng	423
17332	Xã Thọ Sơn	424
17371	Xã Thạch Sơn	424
17419	Xã Diễn Hải	425
17464	Xã Diễn Thành	425
17512	Xã Lăng Thành	426
17557	Xã Văn Thành	426
17602	Xã Liên Thành	426
17641	Xã Tràng Sơn	427
17692	Xã Minh Sơn	427
17728	Xã Phong Thịnh	428
17785	Xã Thanh Lương	428
17827	Thị trấn Quán Hành	429
17881	Xã Nghi Thịnh	429
17938	Xã Nam Thanh	430
18001	Thị trấn Hưng Nguyên	431
18040	Xã Hưng Phúc	431
17113	Xã Quỳnh Lập	432
18112	Xã Thạch Bình	436
18139	Xã Sơn Hồng	439
18223	Xã Sơn Trường	439
18262	Xã Bùi La Nhân	440
18364	Xã Xuân Phổ	442
18385	Xã Xuân Viên	442
18496	Thị trấn Hương Khê	444
18514	Xã Phúc Đồng	444
18607	Xã Thạch Long	445
18631	Xã Thạch Văn	445
18736	Xã Cẩm Thịnh	446
18751	Xã Cẩm Minh	446
18457	Xã Ích Hậu	448
18598	Xã Hộ Độ	448
18889	Xã Bảo Ninh	450
18907	Xã Trọng Hóa	452
18985	Xã Thạch Hóa	453
19000	Xã Châu Hóa	453
19126	Xã Bắc Trạch	455
19141	Xã Cự Nẫm	455
19225	Xã Gia Ninh	456
19237	Xã Xuân Ninh	456
19318	Xã Kim Thủy	457
19060	Phường Quảng Long	458
19360	Phường 2	462
19366	Thị trấn Bến Quan	464
19459	Xã Tân Long	465
19468	Xã Húc	465
19570	Xã Ba Lòng	467
19579	Xã Tà Long	467
19672	Xã Triệu Thượng	469
19675	Xã Triệu Giang	469
19783	Phường Vĩnh Ninh	474
19789	Phường Phú Nhuận	474
19834	Xã Điền Hòa	476
19840	Xã Phong Hải	476
19936	Xã Vinh Xuân	478
19948	Xã Vinh An	478
20056	Xã Trung Sơn	481
20068	Xã A Ngo	481
20158	Xã Xuân Lộc	482
20164	Xã Hương Phú	483
20233	Phường Thạch Thang	492
20246	Phường Hòa Thuận Đông	492
20302	Xã Hòa Sơn	497
20320	Xã Hòa Phong	497
20419	Phường Cẩm An	503
20428	Phường Cẩm Nam	503
20512	Xã Đại Hồng	506
20521	Xã Đại Nghĩa	506
20587	Xã Điện Trung	507
20599	Thị trấn Nam Phước	508
20695	Thị trấn Thạnh Mỹ	510
20731	Xã Phước Đức	511
20773	Xã Phước Trà	512
20824	Xã Bình Quý	513
20860	Xã Tiên Hà	514
20911	Xã Trà Dương	515
20947	Xã Trà Cang	516
20998	Xã Tam Quang	517
20383	Xã Tam Vinh	518
21034	Xã Nghĩa Dũng	522
21232	Xã Tịnh An	522
21088	Xã Bình Long	524
21127	Xã Trà Bình	525
14134	Xã Xuân Vinh	364
14224	Xã Hải Nam	366
14317	Xã Hải Hòa	366
14401	Xã Gia Tường	372
14494	Xã Gia Trấn	373
14548	Xã Ninh Hải	374
14581	Xã Khánh Cư	375
14647	Xã Quang Thiện	376
14680	Xã Văn Hải	376
14737	Xã Yên Nhân	377
14770	Phường Phú Sơn	380
15970	Xã Hoằng Đại	380
14812	Phường Ba Đình	381
14860	Xã Quang Chiểu	384
14887	Xã Phú Sơn	385
14953	Xã Lương Trung	386
14995	Xã Trung Xuân	387
15058	Xã Đồng Lương	388
15091	Xã Ngọc Liên	389
15163	Xã Cẩm Tâm	390
15196	Xã Thạch Lâm	391
15265	Xã Thành Hưng	391
15292	Xã Hà Giang	392
15379	Xã Vĩnh Hùng	393
15406	Xã Yên Tâm	394
15493	Xã Xuân Hồng	395
15511	Xã Thọ Lộc	395
15598	Xã Trường Xuân	395
15628	Xã Lương Sơn	396
15631	Xã Xuân Cao	396
15724	Xã Đồng Tiến	397
15727	Xã Đồng Thắng	397
15814	Xã Thiệu Thành	398
15817	Xã Thiệu Toán	398
15946	Xã Hoằng Đạo	399
15961	Xã Hoằng Thành	399
16048	Xã Thuần Lộc	400
16072	Xã Phú Lộc	400
16153	Xã Nga Tân	401
16171	Xã Nga Trường	401
16252	Xã Hải Long	403
16279	Thị trấn Nông Cống	404
16360	Xã Thăng Thọ	404
16381	Xã Đông Hoàng	405
16483	Xã Quảng Hòa	406
16510	Xã Quảng Phúc	406
16612	Xã Hải Nhân	407
16630	Phường Trúc Lâm	407
16699	Phường Trung Đô	412
16714	Phường Vinh Tân	412
16750	Xã Tiền Phong	415
16768	Xã Nậm Nhoóng	415
16840	Xã Bảo Nam	417
16861	Xã Hữu Kiệm	417
16941	Thị trấn Nghĩa Đàn	419
16963	Xã Nghĩa Thọ	419
17056	Xã Châu Lộc	420
17080	Xã Châu Đình	420
17173	Xã Quỳnh Đôi	421
17188	Xã Quỳnh Minh	421
17260	Xã Lục Dạ	422
17281	Xã Nghĩa Bình	423
17350	Xã Cẩm Sơn	424
17365	Xã Lạng Sơn	424
17434	Xã Diễn Kỷ	425
17458	Xã Diễn Nguyên	425
17525	Xã Hùng Thành	426
17548	Xã Phú Thành	426
17614	Xã Sơn Thành	426
17635	Xã Ngọc Sơn	427
17704	Xã Mỹ Sơn	427
17725	Xã Thanh Hòa	428
17791	Xã Võ Liệt	428
17818	Xã Thanh Mai	428
17884	Xã Nghi Công Bắc	429
17926	Xã Nghi Thái	429
17998	Xã Nam Kim	430
18031	Xã Hưng Tân	431
17116	Xã Quỳnh Trang	432
18103	Xã Đồng Môn	436
18142	Xã Sơn Tiến	439
18211	Xã Kim Hoa	439
18274	Xã Thanh Bình Thịnh	440
18352	Thị trấn Xuân An	442
18391	Xã Cỗ Đạm	442
18478	Xã Thượng Lộc	443
18517	Xã Hương Giang	444
18592	Xã Thạch Liên	445
18634	Xã Lưu Vĩnh Sơn	445
18721	Xã Cẩm Lĩnh	446
18763	Xã Kỳ Phú	447
18409	Xã Tân Lộc	448
18670	Xã Mai Phụ	448
18877	Phường Bắc Nghĩa	450
18904	Xã Dân Hóa	452
18973	Xã Sơn Hóa	453
19003	Xã Cao Quảng	453
19117	Xã Xuân Trạch	455
19147	Xã Thượng Trạch	455
19216	Xã Hải Ninh	456
19243	Xã Vạn Ninh	456
19306	Xã Ngư Thủy 	457
19066	Phường Quảng Thọ	458
19351	Phường Đông Lương	461
19369	Xã Vĩnh Thái	464
19444	Xã Hướng Sơn	465
19471	Xã Thuận	465
19549	Xã Linh Hải	466
19567	Xã Triệu Nguyên	467
19645	Xã Triệu Đại	469
19666	Xã Triệu Trung	469
19756	Phường Gia Hội	474
19780	Phường Phường Đúc	474
20014	Phường Hương Vinh	474
19825	Xã Điền Môn	476
19897	Xã Quảng Phú	477
19933	Xã Phú Hồ	478
20020	Phường Hương Chữ	480
20053	Xã Hồng Kim	481
20137	Xã Lộc Vĩnh	482
20155	Xã Lộc Hòa	482
20224	Phường An Khê	491
20236	Phường Hải Châu  I	492
20314	Phường Hòa Xuân	495
20299	Xã Hòa Ninh	497
20410	Phường Sơn Phong	503
20422	Xã Cẩm Hà	503
20509	Xã Đại Hưng	506
20518	Xã Đại Quang	506
20584	Xã Điện Quang	507
20593	Xã Điện Minh	507
20686	Xã Quế An	509
20689	Xã Quế Minh	509
20767	Xã Bình Lâm	512
20776	Xã Phước Gia	512
20857	Xã Tiên Sơn	514
20863	Xã Tiên Cẩm	514
20944	Xã Trà Mai	516
20950	Xã Trà Linh	516
20386	Xã Tam Thái	518
20387	Xã Tam Đại	518
21256	Xã Nghĩa Hà	522
21262	Xã Nghĩa An	522
21133	Xã Trà Lâm	525
14146	Xã Xuân Hòa	364
14236	Xã Hải Anh	366
14329	Phường Vân Giang	369
14407	Xã Phú Sơn	372
14497	Xã Gia Thịnh	373
14587	Xã Khánh Hải	375
14686	Xã Kim Mỹ	376
14782	Phường Đông Vệ	380
14823	Phường Phú Sơn	381
14899	Xã Hiền Kiệt	385
14999	Xã Trung Tiến	387
15094	Xã Ngọc Sơn	389
15190	Thị trấn Vân Du	391
15298	Xã Lĩnh Toại	392
15412	Thị trấn Quý Lộc	394
15520	Xã Thọ Hải	395
15643	Xã Xuân Lộc	396
15736	Xã Xuân Thịnh	397
15823	Xã Thiệu Hòa	398
15976	Xã Hoằng Lưu	399
16081	Xã Hưng Lộc	400
16177	Xã Bãi Trành	402
16282	Xã Tân Phúc	404
16390	Xã Đông Hòa	405
16540	Xã Quảng Hải	406
16636	Xã Tân Trường	407
17908	Xã Nghi Liên	412
16765	Xã Châu Thôn	415
16855	Xã Chiêu Lưu	417
16957	Xã Nghĩa Lợi	419
17071	Xã Minh Hợp	420
17200	Xã Quỳnh Ngọc	421
17290	Xã Nghĩa Thái	423
17374	Xã Phúc Sơn	424
17461	Xã Diễn Hoa	425
17551	Xã Hoa Thành	426
17638	Xã Bắc Sơn	427
17723	Xã Thanh Sơn	428
17815	Xã Thanh Lâm	428
17911	Xã Nghi Vạn	429
18025	Xã Hưng Lĩnh	431
18097	Phường Văn Yên	436
18202	Xã Sơn Trà	439
18334	Xã Đức Liên	441
18466	Xã Khánh Vĩnh Yên	443
18565	Xã Ngọc Sơn	445
18706	Xã Cẩm Thạch	446
18805	Xã Kỳ Thư	447
18856	Phường Đồng Phú	450
18892	Xã Nghĩa Ninh	450
18949	Thị trấn Đồng Lê	453
18994	Xã Mai Hóa	453
19048	Xã Cảnh Hóa	454
19132	Xã Thanh Trạch	455
19189	Xã Nhân Trạch	455
19228	Xã Trường Xuân	456
19273	Xã Ngân Thủy	457
19327	Xã Lâm Thủy	457
19105	Xã Quảng Hòa	458
19705	Xã Hải Lệ	462
19417	Xã Vĩnh Hà	464
19462	Xã Tân Lập	465
19507	Xã Phong Bình	466
19564	Xã Đa Krông	467
19615	Xã Cam Hiếu	468
19660	Xã Triệu Tài	469
19711	Xã Hải Dương	470
19774	Phường Kim Long	474
19813	Phường Thuỷ Xuân	474
19819	Thị trấn Phong Điền	476
19864	Xã Phong Sơn	476
19918	Xã Phú Xuân	478
19978	Phường Thủy Lương	479
20041	Xã Bình Thành	480
20101	Xã Lâm Đớt	481
20140	Xã Lộc An	482
20197	Phường Hòa Khánh Bắc	490
20221	Phường Thạc Gián	491
20275	Phường Phước Mỹ	493
20311	Phường Hòa Thọ Tây	495
20347	Phường An Xuân	502
20404	Phường Cẩm Phô	503
20461	Xã A Vương	504
20497	Xã Ka Dăng	505
20548	Xã Đại Hòa	506
20575	Phường Điện An	507
20626	Xã Duy Phước	508
20659	Xã Quế Hiệp	509
20737	Xã Phước Mỹ	511
20743	Xã Phước Công	511
20830	Xã Bình Chánh	513
20833	Xã Bình Tú	513
20917	Xã Trà Bui	515
20920	Xã Trà Đốc	515
21004	Xã Tam Mỹ Tây	517
21007	Xã Tam Trà	517
21187	Xã Tịnh Hòa	522
21199	Xã Tịnh Thiện	522
21103	Xã Bình Hiệp	524
21109	Xã Bình Tân Phú	524
21226	Xã Tịnh Giang	527
21235	Thị trấn La Hà	528
21331	Xã Sơn Bua	530
21334	Xã Sơn Mùa	530
21409	Xã Đức Nhuận	533
21415	Xã Đức Hiệp	533
21499	Xã Ba Dinh	535
21502	Xã Ba Liên	535
21589	Phường Bùi Thị Xuân	540
21598	Xã Nhơn Lý	540
21673	Phường Hoài Tân	543
21688	Thị trấn Tăng Bạt Hổ	544
21760	Xã Mỹ Thọ	545
21775	Xã Mỹ Hiệp	545
21844	Xã Tây Xuân	547
21859	Xã Cát Minh	548
21937	Xã Nhơn Khánh	549
21952	Thị trấn Tuy Phước	550
22027	Phường 3	555
22041	Phường Phú Đông	555
22099	Xã Xuân Sơn Bắc	558
22114	Thị trấn Chí Thạnh	559
22195	Xã Krông Pa	560
22210	Xã Ea Lâm	561
22312	Xã Hòa Trị	563
22243	Xã Hòa Thành	564
22366	Phường Phước Tiến	568
22390	Xã Vĩnh Ngọc	568
22438	Xã Cam Hòa	570
22462	Xã Cam Thành Bắc	570
22540	Xã Ninh An	572
22564	Xã Ninh Đông	572
22633	Xã Giang Ly	573
22654	Xã Diên Lâm	574
22729	Xã Sơn Trung	575
22741	Phường Phước Mỹ	582
22810	Thị trấn Tân Sơn	585
22825	Xã Hòa Sơn	585
22849	Xã Lợi Hải	588
22903	Xã Phước Dinh	589
23234	Phường Tân Thiện	594
23268	Xã Tân Phước	594
23041	Xã Hồng Thái	596
23062	Thị trấn Phú Long	597
14149	Thị trấn Ngô Đồng	365
14239	Xã Hải Hưng	366
14332	Phường Bích Đào	369
14416	Xã Đồng Phong	372
14509	Xã Gia Trung	373
14602	Xã Khánh Công	375
14701	Thị trấn Yên Thịnh	377
14794	Phường Đông Hương	380
14836	Phường Trường Sơn	382
16534	Phường Quảng Vinh	382
14941	Xã Lương Ngoại	386
15040	Xã Giao An	388
15136	Xã Cẩm Quý	390
15229	Xã Thành Vinh	391
15340	Xã Hà Thái	392
15448	Xã Định Hòa	394
15556	Thị trấn Lam Sơn	395
15679	Xã Hợp Tiến	397
15775	Xã Thiệu Ngọc	398
15892	Xã Hoằng Trung	399
16012	Thị trấn Hậu Lộc	400
16120	Xã Nga Bạch	401
16219	Xã Thanh Lâm	402
16327	Xã Vạn Hòa	404
16438	Thị trấn Tân Phong	406
16579	Xã Anh Sơn	407
16678	Phường Cửa Nam	412
17011	Xã Tây Hiếu	414
16819	Xã Bắc Lý	417
16915	Xã Lưu Kiền	418
17032	Xã Nghĩa Khánh	419
17152	Xã Quỳnh Hoa	421
17239	Xã Thạch Ngàn	422
17326	Xã Nghĩa Hành	423
17413	Xã Diễn Hồng	425
17509	Xã Mã Thành	426
17593	Xã Khánh Thành	426
17680	Xã Quang Sơn	427
17770	Xã Thanh Thịnh	428
17857	Xã Nghi Mỹ	429
17971	Xã Kim Liên	430
18076	Phường Bắc Hà	436
18178	Xã Sơn Châu	439
18313	Thị trấn Vũ Quang	441
18418	Xã Thuần Thiện	443
18541	Xã Hương Vĩnh	444
18682	Xã Cẩm Dương	446
18790	Xã Kỳ Thọ	447
18835	Phường Kỳ Long	449
18898	Xã Đức Ninh	450
18937	Xã Hóa Sơn	452
18988	Xã Đức Hóa	453
19036	Xã Cảnh Dương	454
19129	Xã Lâm Trạch	455
19180	Xã Tây Trạch	455
19222	Xã Duy Ninh	456
19270	Xã Cam Thủy	457
19315	Xã Thái Thủy	457
19096	Xã Quảng Thủy	458
19358	Phường An Đôn	462
19408	Xã Hiền Thành	464
19453	Xã Hướng Tân	465
19498	Xã Trung Giang	466
19555	Thị trấn Krông Klang	467
19603	Xã Thanh An	468
19654	Xã Triệu Sơn	469
19699	Xã Hải Hưng	470
19762	Phường Thuận Hòa	474
19810	Phường Hương Long	474
20032	Xã Hương Thọ	474
19861	Xã Phong Xuân	476
19912	Xã Phú An	478
19972	Phường Thủy Phương	479
20026	Xã Hương Bình	480
20095	Xã A Roàng	481
20134	Xã Lộc Bình	482
20188	Xã Thượng Long	483
20215	Phường Chính Gián	491
20266	Phường Nại Hiên Đông	493
20305	Phường Hòa Phát	495
20341	Phường An Mỹ	502
20398	Phường Minh An	503
20452	Xã A Nông	504
20491	Xã Za Hung	505
20545	Xã Đại Cường	506
20572	Xã Điện Phước	507
20617	Xã Duy Trinh	508
20662	Xã Quế Thuận	509
20728	Xã Phước Hiệp	511
20752	Xã Phước Thành	511
20818	Xã Bình Trị	513
20842	Xã Bình Quế	513
20902	Xã Trà Kót	515
20929	Xã Trà Giáp	515
20989	Xã Tam Hiệp	517
20368	Xã Tam An	518
21028	Phường Nghĩa Lộ	522
21208	Xã Tịnh Châu	522
21079	Xã Bình Hòa	524
21118	Xã Trà Giang	525
21196	Xã Tịnh Đông	527
21250	Xã Nghĩa Kỳ	528
21322	Xã Sơn Thủy	529
21343	Xã Sơn Tinh	530
21406	Xã Đức Thắng	533
21433	Xã Đức Phong	533
21493	Xã Ba Thành	535
21511	Xã Ba Cung	535
21592	Phường Nguyễn Văn Cừ	540
21991	Xã Phước Mỹ	540
21682	Xã Hoài Mỹ	543
21694	Xã Ân Sơn	544
21766	Xã Mỹ Thành	545
21786	Thị trấn Vĩnh Thạnh	546
21847	Xã Bình Nghi	547
21868	Xã Cát Lâm	548
21934	Phường Nhơn Hưng	549
21955	Thị trấn Diêu Trì	550
22033	Phường 5	555
22042	Xã Hòa Kiến	555
22102	Xã Xuân Quang 2	558
22120	Xã An Ninh Tây	559
22198	Xã Suối Bạc	560
22219	Xã Sơn Giang	561
22319	Thị Trấn Phú Hoà	563
22258	Phường Hoà Vinh	564
22381	Phường Vĩnh Trường	568
22393	Xã Vĩnh Thạnh	568
22453	Thị trấn Cam Đức	570
22465	Xã Cam An Bắc	570
22558	Xã Ninh Thân	572
22567	Phường Ninh Thủy	572
22648	Xã Sơn Thái	573
22657	Xã Diên Điền	574
22739	Xã Sinh Tồn	576
22747	Phường Phủ Hà	582
22822	Xã Mỹ Sơn	585
22831	Xã Nhơn Sơn	585
22897	Xã Phước Nam	589
22909	Xã Phước Diêm	589
23245	Xã Tân Hải	594
22969	Thị trấn Liên Hương	595
14164	Xã Giao Thanh	365
14254	Xã Hải Long	366
14344	Phường Ninh Khánh	369
14434	Xã Thanh Lạc	372
14524	Xã Gia Phong	373
14614	Xã Khánh Thủy	375
14710	Xã Mai Sơn	377
14803	Phường Quảng Thắng	380
16513	Xã Quảng Minh	382
14929	Xã Điền Hạ	386
15025	Xã Mường Mìn	387
15124	Xã Minh Sơn	389
15226	Xã Thành Yên	391
15334	Xã Hà Châu	392
15445	Xã Định Tăng	394
15550	Xã Xuân Phú	395
15667	Xã Thọ Sơn	397
15766	Xã Nông Trường	397
15877	Xã Hoằng Xuân	399
15994	Xã Hoằng Ngọc	399
16099	Xã Nga Vịnh	401
16201	Xã Tân Bình	402
16303	Xã Trung Thành	404
16408	Xã Đông Khê	405
16558	Xã Quảng Thái	406
16657	Xã Nghi Sơn	407
16726	Phường Nghi Hòa	413
16786	Xã Châu Hội	416
16873	Xã Nậm Càn	417
16975	Xã Nghĩa Hồng	419
17095	Xã Bắc Sơn	420
17215	Xã Quỳnh Thọ	421
17308	Xã Nghĩa Dũng	423
17395	Xã Diễn Đoài	425
17482	Xã Diễn Tân	425
17566	Xã Xuân Thành	426
17653	Xã Đông Sơn	427
17743	Xã Thanh Liên	428
17833	Xã Nghi Yên	429
17941	Xã Nam Anh	430
18043	Xã Long Xá	431
18118	Phường Nam Hồng	437
18229	Thị trấn Đức Thọ	440
18367	Xã Xuân Hải	442
18490	Xã Sơn Lộc	443
18604	Xã Thạch Khê	445
18733	Xã Cẩm Hưng	446
18430	Xã Bình An	448
18886	Xã Lộc Ninh	450
18922	Xã Hóa Hợp	452
18979	Xã Ngư Hóa	453
19021	Xã Quảng Phú	454
19120	Xã Mỹ Trạch	455
19162	Xã Đức Trạch	455
19213	Xã Võ Ninh	456
19252	Xã Hồng Thủy	457
19303	Xã Mỹ Thủy	457
19084	Xã Quảng Tân	458
19348	Phường 5	461
19384	Xã Kim Thạch	464
19438	Xã Hướng Việt	465
19489	Xã Lìa	465
19534	Xã Linh Trường	466
19591	Xã A Bung	467
19630	Xã Triệu Vân	469
19684	Xã Hải An	470
19738	Xã Hải Chánh	470
19798	Phường Phước Vĩnh	474
19981	Xã Thủy Bằng	474
19843	Xã Điền Hải	476
19894	Xã Quảng Thọ	477
19954	Xã Phú Gia	478
20011	Phường Hương Văn	480
20080	Xã Hương Phong	481
20131	Xã Lộc Sơn	482
20182	Xã Hương Hữu	483
20218	Phường Vĩnh Trung	491
20258	Phường Hòa Cường Nam	492
20306	Phường Hòa An	495
20335	Phường Tân Thạnh	502
20401	Phường Tân An	503
20449	Xã Lăng	504
20488	Xã A Rooi	505
20539	Xã Đại Minh	506
20569	Xã Điện Thọ	507
20608	Xã Duy Tân	508
20650	Xã Quế Phú	509
20716	Xã Đắc Pre	510
20719	Xã Đắc Pring	510
20806	Xã Bình Triều	513
20809	Xã Bình Đào	513
20893	Xã Tiên Lộc	514
20896	Xã Tiên Lập	514
20980	Xã Tam Thạnh	517
20983	Xã Tam Anh Bắc	517
21013	Phường Trần Phú	522
21016	Phường Quảng Phú	522
21064	Xã Bình An	524
21067	Xã Bình Hải	524
21175	Xã Tịnh Thọ	527
21178	Xã Tịnh Trà	527
21301	Xã Sơn Bao	529
21307	Xã Sơn Giang	529
21382	Xã Hành Minh	532
21388	Xã Hành Thiện	532
21475	Xã Phổ Khánh	534
21478	Phường Phổ Thạnh	534
21571	Phường Lê Hồng Phong	540
21574	Phường Trần Hưng Đạo	540
21658	Phường Tam Quan Nam	543
21661	Phường Hoài Hảo	543
21745	Xã Mỹ Lộc	545
21751	Xã Mỹ An	545
21826	Xã Tây An	547
21832	Xã Tây Bình	547
21916	Phường Nhơn Thành	549
21922	Xã Nhơn Hậu	549
22006	Xã Canh Hiển	551
22018	Phường 8	555
22075	Xã Xuân Thọ 1	557
22087	Xã Phú Mỡ	558
22156	Xã An Chấn	559
22183	Xã Sơn Phước	560
22252	Xã Hòa Bình 1	562
22306	Xã Hòa Quang Nam	563
22336	Phường Ngọc Hiệp	568
22363	Phường Lộc Thọ	568
22426	Phường Cam Thuận	569
22435	Xã Cam Tân	570
22510	Xã Vạn Phú	571
22543	Phường Ninh Hải	572
22600	Xã Ninh Lộc	572
22630	Xã Sông Cầu	573
22693	Xã Diên An	574
22732	Xã Ba Cụm Bắc	575
22779	Phường Mỹ Bình	582
22807	Xã Phước Trung	584
22888	Xã An Hải	587
22853	Xã Bắc Sơn	588
22951	Phường Hưng Long	593
23232	Phường Phước Lộc	594
23017	Xã Phan Điền	596
23038	Xã Phan Thanh	596
23104	Xã Hàm Thắng	597
14179	Xã Giao Nhân	365
14269	Xã Hải Đông	366
14365	Phường Trung Sơn	370
14449	Xã Kỳ Phú	372
14536	Xã Ninh Khang	374
14629	Xã Hồi Ninh	376
14725	Xã Yên Thắng	377
15859	Phường Thiệu Dương	380
16537	Xã Quảng Đại	382
14938	Xã Thành Sơn	386
15031	Xã Yên Khương	388
15121	Xã Minh Tiến	389
15223	Xã Thành Mỹ	391
15325	Xã Hà Tiến	392
15436	Xã Yên Thịnh	394
15541	Xã Thọ Lâm	395
15664	Thị trấn Triệu Sơn	397
15760	Xã Thọ Vực	397
15865	Thị trấn Bút Sơn	399
15937	Xã Hoằng Hà	399
16039	Xã Tuy Lộc	400
16150	Xã Nga Điền	401
16246	Xã Xuân Khang	403
16354	Xã Công Liêm	404
16477	Xã Quảng Long	406
16603	Xã Phú Sơn	407
16693	Phường Bến Thủy	412
16744	Xã Đồng Văn	415
16837	Xã Nậm Cắn	417
16942	Xã Nghĩa Mai	419
17062	Xã Châu Cường	420
17182	Xã Quỳnh Yên	421
17269	Xã Tân Hợp	423
17353	Xã Đức Sơn	424
17443	Xã Diễn Đồng	425
17533	Xã Quang Thành	426
17620	Xã Giang Sơn Tây	427
17713	Thị trấn Thanh Chương	428
17806	Xã Thanh Hà	428
17899	Xã Nghi Diên	429
18010	Xã Hưng Tây	431
18085	Phường Hà Huy Tập	436
18190	Xã Sơn Bằng	439
18325	Xã Thọ Điền	441
18436	Xã Kim Song Trường	443
18547	Xã Phúc Trạch	444
18676	Thị trấn Thiên Cầm	446
18778	Xã Kỳ Khang	447
18823	Phường Kỳ Thịnh	449
18931	Xã Minh Hóa	452
19030	Xã Quảng Lưu	454
19177	Xã Trung Trạch	455
19264	Xã An Thủy	457
19093	Xã Quảng Lộc	458
19393	Xã Vĩnh Khê	464
19492	Xã Xy	465
19594	Xã A Ngo	467
19696	Xã Hải Quế	470
19801	Phường An Cựu	474
19852	Xã Phong Hiền	476
19960	Phường Phú Bài	479
20074	Xã Phú Vinh	481
20170	Xã Hương Lộc	483
20251	Phường Bình Hiên	492
20326	Xã Hòa Tiến	497
20434	Xã Tân Hiệp	503
20524	Xã Đại Hiệp	506
20596	Xã Điện Phương	507
20699	Xã Chơ Chun	510
20785	Xã Thăng Phước	512
20869	Xã Tiên Lãnh	514
20953	Xã Trà Nam	516
20395	Xã Tam Lãnh	518
21040	Thị Trấn Châu Ổ	524
21136	Xã Trà Tân	525
21139	Xã Trà Sơn	525
21274	Xã Nghĩa Thương	528
21283	Xã Nghĩa Phương	528
21352	Xã Long Mai	531
21367	Xã Hành Thuận	532
21445	Xã Phổ Phong	534
21454	Phường Phổ Quang	534
21535	Xã Ba Nam	535
21550	Phường Nhơn Bình	540
21634	Xã An Nghĩa	542
21637	Phường Tam Quan	543
21721	Xã Ân Tường Tây	544
21724	Xã Ân Tường Đông	544
21805	Xã Vĩnh Quang	546
21808	Thị trấn Phú Phong	547
21895	Xã Cát Tân	548
21898	Thị trấn Cát Tiến	548
21985	Xã Phước An	550
21988	Xã Phước Thành	550
22060	Xã Xuân Bình	557
22069	Xã Xuân Thịnh	557
22153	Xã An Mỹ	559
22165	Thị trấn Củng Sơn	560
22255	Thị trấn Phú Thứ	562
22270	Xã Hòa Phú	562
22333	Phường Vĩnh Phước	568
22345	Phường Vạn Thắng	568
22423	Phường Ba Ngòi	569
22468	Xã Cam Thành Nam	569
22507	Xã Vạn Khánh	571
22522	Xã Xuân Sơn	571
22597	Xã Ninh Hưng	572
22609	Thị trấn Khánh Vĩnh	573
22687	Xã Diên Thạnh	574
22702	Xã Suối Hiệp	574
22774	Xã Thành Hải	582
22783	Xã Phước Bình	584
22870	Thị trấn Phước Dân	587
22894	Xã Phước Hải	587
22936	Phường Thanh Hải	593
22960	Xã Phong Nẫm	593
22999	Xã Bình Thạnh	595
23029	Xã Sông Bình	596
23092	Xã Hàm Đức	597
23122	Xã Hàm Thạnh	598
23185	Xã Đức Thuận	599
23218	Xã Vũ Hoà	600
23290	Phường Trường Chinh	608
23323	Xã Đắk Blà	608
23380	Xã Đắk Ang	611
23430	Xã Đắk Trăm	612
23497	Xã Tân Lập	614
23534	Xã Hơ Moong	616
23425	Xã Đắk Hà	617
23575	Phường Tây Sơn	622
23617	Phường Tây Sơn	623
24045	Phường Sông Bờ	624
23671	Xã Kông Pla	625
23704	Xã Tân Bình	626
23749	Xã Ia Ka	627
23782	Xã Ia O	628
23824	Thị trấn Kông Chro	630
23863	Xã Ia Krêl	631
23905	Xã Ia Băng	632
23946	Xã Bar Măih	633
23995	Thị trấn Đak Pơ	634
24079	Xã Ia RSai	637
24048	Xã Ayun Hạ	638
23983	Xã Ia Phang	639
14203	Xã Giao Hải	365
14296	Xã Hải Giang	366
14377	Xã Quang Sơn	370
14464	Thị trấn Me	373
14557	Xã Ninh An	374
14662	Xã Thượng Kiệm	376
14758	Phường Đông Thọ	380
16507	Phường Quảng Cát	380
14875	Xã Trung Sơn	385
14971	Xã Ban Công	386
15067	Xã Mỹ Tân	389
15169	Xã Cẩm Ngọc	390
15268	Xã Ngọc Trạo	391
15382	Xã Minh Tân	393
15478	Xã Định Bình	394
15607	Xã Bát Mọt	396
15712	Xã Văn Sơn	397
15802	Xã Thiệu Nguyên	398
15967	Xã Hoằng Trạch	399
16075	Xã Hòa Lộc	400
16168	Xã Nga Thắng	401
16273	Xã Thanh Tân	403
16378	Thị trấn Rừng Thông	405
16498	Xã Quảng Ngọc	406
16624	Xã Phú Lâm	407
16705	Xã Hưng Đông	412
16753	Xã Nậm Giải	415
16843	Xã Phà Đánh	417
16945	Xã Nghĩa Yên	419
17059	Xã Tam Hợp	420
17179	Xã Quỳnh Hồng	421
17272	Xã Tân Phú	423
17357	Xã Hoa Sơn	424
17446	Xã Diễn Bích	425
17539	Xã Phúc Thành	426
17626	Xã Bồi Sơn	427
17710	Xã Đại Sơn	427
17803	Xã Thanh Yên	428
17896	Xã Nghi Trường	429
18016	Xã Hưng Đạo	431
18091	Phường Thạch Quý	436
18196	Xã Sơn Kim 1	439
18328	Xã Đức Hương	441
18463	Xã Gia Hanh	443
18562	Thị trấn Thạch Hà	445
18709	Xã Cẩm Nhượng	446
18814	Xã Kỳ Tân	447
18868	Phường Đồng Hải	450
18958	Xã Thanh Hóa	453
19057	Xã Quảng Phương	454
19198	Xã Lý Trạch	455
19288	Xã Hưng Thủy	457
19339	Phường Đông Thanh	461
19435	Xã Hướng Lập	465
19537	Xã Gio Sơn	466
19636	Xã Triệu Độ	469
19750	Phường Tây Lộc	474
19999	Xã Hải Dương	474
19891	Xã Quảng Thành	477
20017	Phường Hương Xuân	480
20128	Xã Lộc Bổn	482
20209	Phường Xuân Hà	491
20260	Phường Khuê Trung	495
20375	Phường Hoà Thuận	502
20494	Xã Mà Cooi	505
20578	Phường Điện Nam Bắc	507
20665	Xã Quế Mỹ	509
20761	Xã Hiệp Thuận	512
20845	Xã Bình An	513
20935	Xã Trà Leng	516
20377	Xã Tam Lộc	518
21214	Xã Tịnh Long	522
21124	Xã Trà Hiệp	525
21220	Xã Tịnh Hà	527
21259	Xã Nghĩa Sơn	528
21325	Xã Sơn Kỳ	529
21346	Xã Sơn Lập	530
21403	Xã Đức Lợi	533
21439	Phường Nguyễn Nghiêm	534
21496	Xã Ba Động	535
21526	Xã Ba Bích	535
21595	Phường Ghềnh Ráng	540
21613	Xã An Trung	542
21679	Phường Hoài Xuân	543
21706	Xã Ân Thạnh	544
21769	Xã Mỹ Chánh	545
21796	Xã Vĩnh Hiệp	546
21856	Xã Cát Sơn	548
21880	Xã Cát Hải	548
21946	Xã Nhơn Tân	549
21970	Xã Phước Sơn	550
22039	Phường 6	555
22052	Xã Xuân Lâm	557
22108	Xã Xuân Quang 3	558
22132	Xã An Nghiệp	559
22207	Thị trấn Hai Riêng	561
22228	Xã EaBia	561
22324	Xã Hòa Thắng	563
22291	Xã Hòa Xuân Đông	564
22384	Xã Vĩnh Lương	568
22408	Phường Cam Nghĩa	569
22456	Xã Cam Hiệp Nam	570
22492	Xã Đại Lãnh	571
22555	Xã Ninh Xuân	572
22582	Xã Ninh Phú	572
22642	Xã Khánh Thành	573
22672	Xã Diên Thọ	574
22737	Xã Song Tử Tây	576
22762	Phường Đạo Long	582
22813	Xã Lâm Sơn	585
22873	Xã Phước Sơn	587
22856	Xã Bắc Phong	588
22939	Phường Bình Hưng	593
23235	Phường Tân An	594
23008	Xã Phan Sơn	596
23044	Xã Phan Hiệp	596
23098	Xã Hàm Chính	597
23134	Xã Tân Lập	598
23188	Xã Suối Kiết	599
23230	Thị trấn Tân Minh	601
23296	Phường Ngô Mây	608
23332	Xã Chư Hreng	608
23383	Xã Đắk Dục	611
23443	Xã Pô Kô	612
23494	Xã Đắk Tờ Re	614
23524	Xã Đắk La	615
23417	Xã Đắk Rơ Ông	617
23566	Phường Hội Thương	622
23614	Phường An Bình	623
24042	Phường Hòa Bình	624
23665	Xã Tơ Tung	625
23698	Xã K' Dang	626
23743	Xã Hòa Phú	627
23779	Xã Ia Tô	628
23821	Xã Đăk Trôi	629
23845	Xã Yang Trung	630
23896	Xã Thăng Hưng	632
23924	Xã Ia Bang	632
23989	Xã Hà Tam	634
24019	Xã Ia KDăm	635
24043	Thị trấn Phú Thiện	638
24067	Xã Ia Yeng	638
24148	Phường Tự An	643
24178	Xã Hòa Xuân	643
24194	Xã Cư A Mung	645
14206	Xã Bạch Long	365
14299	Xã Hải Cường	366
14383	Thị trấn Nho Quan	372
14473	Xã Liên Sơn	373
14569	Xã Khánh Hòa	375
14671	Xã Yên Lộc	376
14755	Phường Hàm Rồng	380
16459	Phường Quảng Đông	380
14872	Xã Thành Sơn	385
14974	Xã Kỳ Tân	386
15076	Xã Vân Âm	389
15175	Xã Cẩm Yên	390
15277	Xã Hà Vinh	392
15397	Thị trấn Thống Nhất	394
15508	Xã Xuân Phong	395
15634	Xã Luận Thành	396
15730	Xã Tiến Nông	397
15820	Xã Thiệu Chính	398
15952	Xã Hoằng Đồng	399
16057	Xã Xuân Lộc	400
16162	Xã Nga Thái	401
16264	Xã Yên Thọ	403
16369	Xã Công Chính	404
16495	Xã Quảng Chính	406
16627	Phường Xuân Lâm	407
16711	Xã Hưng Hòa	412
16759	Xã Châu Kim	415
16849	Xã Hữu Lập	417
16948	Xã Nghĩa Lạc	419
17068	Xã Thọ Hợp	420
17197	Xã Quỳnh Giang	421
17287	Xã Đồng Văn	423
17368	Xã Hội Sơn	424
17455	Xã Diễn Quảng	425
17545	Xã Đồng Thành	426
17632	Xã Bài Sơn	427
17719	Xã Thanh Nho	428
17812	Xã Thanh Tùng	428
17902	Xã Nghi Phong	429
18019	Xã Hưng Mỹ	431
18088	Xã Thạch Trung	436
18193	Xã Sơn Bình	439
18331	Xã Đức Bồng	441
18454	Xã Phú Lộc	443
18559	Xã Hương Liên	444
18697	Xã Cẩm Quang	446
18811	Xã Kỳ Châu	447
18859	Phường Bắc Lý	450
18955	Xã Kim Hóa	453
19051	Xã Liên Trường	454
19201	Thị trấn Quán Hàu	456
19291	Xã Dương Thủy	457
19333	Phường 1	461
19426	Xã Vĩnh Ô	464
19522	Xã Gio An	466
19624	Thị Trấn Ái Tử	469
19729	Xã Hải Trường	470
19909	Xã Phú Mậu	474
19867	Thị trấn Sịa	477
19975	Phường Thủy Châu	479
20089	Xã Hồng Thái	481
20191	Xã Thượng Nhật	483
20263	Phường Thọ Quang	493
20338	Phường Phước Hòa	502
20455	Xã A Tiêng	504
20542	Xã Đại Thắng	506
20620	Xã Duy Sơn	508
20734	Xã Phước Năng	511
20822	Xã Bình Định Nam	513
20905	Xã Trà Nú	515
20992	Xã Tam Hải	517
21025	Phường Nguyễn Nghiêm	522
21082	Xã Bình Trung	524
21193	Xã Tịnh Bình	527
21268	Xã Nghĩa Hòa	528
21313	Xã Sơn Thượng	529
21349	Xã Long Sơn	531
21391	Xã Hành Thịnh	532
21436	Xã Đức Lân	533
21481	Xã Phổ Châu	534
21529	Xã Ba Vì	535
21577	Phường Ngô Mây	540
21619	Xã An Vinh	542
21664	Phường Hoài Thanh Tây	543
21712	Xã Ân Đức	544
21748	Xã Mỹ Lợi	545
21799	Xã Vĩnh Hảo	546
21835	Xã Bình Tường	547
21886	Xã Cát Nhơn	548
21925	Xã Nhơn Phong	549
21976	Xã Phước Lộc	550
22021	Phường 2	555
22054	Xã Xuân Hải	557
22090	Xã Xuân Lãnh	558
22141	Xã An Xuân	559
22189	Xã Sơn Nguyên	560
22234	Xã Sông Hinh	561
22309	Xã Hòa Hội	563
22300	Xã Hòa Xuân Nam	564
22369	Phường Tân Lập	568
22414	Phường Cam Phúc Nam	569
22441	Xã Cam Hải Đông	570
22498	Xã Vạn Long	571
22546	Xã Ninh Thọ	572
22591	Phường Ninh Giang	572
22639	Xã Liên Sang	573
22684	Xã Diên Hòa	574
22735	Xã Ba Cụm Nam	575
22777	Phường Văn Hải	582
22819	Xã Quảng Sơn	585
22882	Xã Phước Thuận	587
22898	Xã Phước Ninh	589
22948	Phường Đức Thắng	593
23246	Xã Tân Tiến	594
23011	Xã Phan Lâm	596
23053	Xã Hòa Thắng	596
23101	Xã Hàm Hiệp	597
23137	Xã Hàm Minh	598
23194	Thị trấn Đức Tài	600
23236	Thị trấn Tân Nghĩa	601
23299	Phường Thống Nhất	608
23329	Xã Đoàn Kết	608
23386	Xã Đắk Nông	611
23437	Xã Tân Cảnh	612
23504	Xã Đăk Long	615
23545	Xã Sa Bình	616
23449	Xã Văn Xuôi	617
23586	Phường Chi Lăng	622
23627	Xã Xuân An	623
23644	Xã Đăk Roong	625
23686	Xã Hải Yang	626
23725	Xã Hà Tây	627
23771	Xã Ia Bă	628
23799	Xã Đak Ta Ley	629
23827	Xã Chư Krêy	630
23875	Xã Ia Lang	631
23902	Xã Ia Phìn	632
23954	Xã Kông HTok	633
23992	Xã An Thành	634
24094	Xã Chư Drăng	637
24115	Xã Krông Năng	637
24127	Phường Thống Nhất	643
24151	Phường Ea Tam	643
24181	Thị trấn Ea Drăng	645
24202	Xã Ea Khal	645
14209	Xã Giao Long	365
14302	Xã Hải Ninh	366
14386	Xã Xích Thổ	372
14470	Xã Gia Hưng	373
14560	Thị trấn Yên Ninh	375
14656	Xã Đồng Hướng	376
14764	Phường Trường Thi	380
16525	Phường Quảng Tâm	380
14878	Xã Phú Thanh	385
14977	Xã Văn Nho	386
15073	Xã Thạch Lập	389
15178	Xã Cẩm Tân	390
15274	Xã Hà Long	392
15388	Xã Vĩnh Thịnh	393
15505	Xã Nam Giang	395
15619	Xã Xuân Lẹ	396
15718	Thị trấn Nưa	397
15811	Xã Thiệu Quang	398
15949	Xã Hoằng Thắng	399
16045	Xã Mỹ Lộc	400
16156	Xã Nga Thủy	401
16258	Xã Xuân Thái	403
16357	Xã Tượng Văn	404
16480	Xã Quảng Yên	406
16609	Phường Nguyên Bình	407
16696	Phường Hồng Sơn	412
16741	Xã Thông Thụ	415
16831	Xã Mường Lống	417
16930	Xã Yên Thắng	418
17047	Xã Đồng Hợp	420
17170	Xã Quỳnh Lâm	421
17263	Xã Môn Sơn	422
17347	Xã Hùng Sơn	424
17437	Xã Diễn Xuân	425
17530	Xã Thọ Thành	426
17619	Xã Giang Sơn Đông	427
17707	Xã Trù Sơn	427
17797	Xã Thanh Thủy	428
17887	Xã Nghi Công Nam	429
18007	Xã Hưng Yên	431
18077	Phường Nguyễn Du	436
18181	Xã Tân Mỹ Hà	439
18316	Xã Ân Phú	441
18433	Xã Thanh Lộc	443
18550	Xã Hương Trà	444
18685	Xã Cẩm Bình	446
18793	Xã Kỳ Tây	447
18841	Phường Kỳ Liên	449
18946	Xã Thượng Hóa	452
19039	Xã Quảng Tiến	454
19183	Xã Hòa Trạch	455
19276	Xã Sơn Thủy	457
19102	Phường Quảng Phúc	458
19414	Thị trấn Cửa Tùng	464
19504	Xã Trung Sơn	466
19618	Xã Cam Chính	468
19726	Xã Hải Phong	470
19900	Phường Thuận An	474
19870	Xã Quảng Thái	477
19984	Xã Thủy Tân	479
20107	Thị trấn Phú Lộc	482
20198	Phường Hòa Khánh Nam	490
20284	Phường Mỹ An	494
20359	Xã Tam Thanh	502
20479	Xã A Ting	505
20561	Xã Điện Thắng Trung	507
20641	Thị trấn Đông Phú	509
20713	Xã Cà Dy	510
20797	Xã Bình Giang	513
20881	Xã Tiên Mỹ	514
20965	Thị trấn Núi Thành	517
20671	Xã Quế Lộc	519
21052	Xã Bình Chánh	524
21157	Xã Hương Trà	525
21277	Xã Nghĩa Trung	528
21298	Xã Sơn Nham	529
21361	Xã Long Hiệp	531
21376	Xã Hành Nhân	532
21448	Xã Phổ Thuận	534
21469	Phường Phổ Hòa	534
21562	Phường Hải Cảng	540
21625	Xã An Tân	542
21628	Xã An Hòa	542
21649	Xã Hoài Châu	543
21715	Xã Ân Hữu	544
21736	Xã Mỹ Đức	545
21802	Xã Vĩnh Thịnh	546
21820	Xã Tây Giang	547
21892	Xã Cát Tường	548
21907	Phường Bình Định	549
21979	Xã Phước Nghĩa	550
22003	Xã Canh Vinh	551
22053	Phường Xuân Thành	557
22076	Phường Xuân Đài	557
22144	Xã An Lĩnh	559
22174	Xã Sơn Định	560
22237	Xã Ealy	561
22288	Xã Hòa Mỹ Tây	562
22297	Xã Hòa Tâm	564
22351	Phường Phương Sài	568
22405	Xã Phước Đồng	568
22477	Xã Cam Thịnh Tây	569
22489	Thị trấn Vạn Giã	571
22528	Phường Ninh Hiệp	572
22579	Xã Ninh Phước	572
22621	Xã Khánh Đông	573
22666	Xã Diên Đồng	574
22720	Xã Sơn Lâm	575
22756	Phường Tấn Tài	582
22795	Xã Phước Thắng	584
22855	Xã Tân Hải	586
22864	Xã Tri Hải	586
22921	Phường Phú Hài	593
22924	Phường Phú Thủy	593
22984	Xã Vĩnh Tân	595
22987	Xã Phú Lạc	595
23077	Xã Hàm Phú	597
23083	Xã Thuận Minh	597
23167	Xã Măng Tố	599
23176	Xã Gia An	599
23272	Xã Ngũ Phụng	602
23281	Phường Quang Trung	608
23356	Xã Đắk Choong	610
23365	Xã Ngọc Linh	610
23470	Xã Măng Cành	613
23482	Xã Đắk Kôi	614
23554	Xã Ya ly	616
23410	Xã Măng Ri	617
23596	Xã Trà Đa	622
23602	Xã An Phú	622
23650	Xã KRong	625
23659	Xã Đông	625
23728	Xã Ia Khươl	627
23738	Xã Ia Kreng	627
23803	Xã Đăk Yă	629
23812	Xã Kon Thụp	629
23884	Xã Ia Nan	631
23887	Thị trấn Chư Prông	632
23959	Xã Ia HLốp	633
23965	Xã Dun	633
24097	Xã Phú Cần	637
24106	Xã Chư Ngọc	637
24130	Phường Thành Nhất	643
24136	Phường Tân Lợi	643
24184	Xã Ea H'leo	645
14215	Thị trấn Yên Định	366
14308	Xã Hải Xuân	366
14392	Xã Gia Sơn	372
14482	Xã Gia Phú	373
14572	Xã Khánh Lợi	375
14668	Xã Tân Thành	376
14761	Phường Nam Ngạn	380
16522	Phường Quảng Phú	380
14884	Xã Phú Lệ	385
14986	Xã Thiết Kế	386
15085	Xã Quang Trung	389
15187	Thị trấn Kim Tân	391
15286	Xã Yên Dương	392
15409	Xã Yên Phú	394
15517	Xã Xuân Hòa	395
15637	Xã Luận Khê	396
15733	Xã Khuyến Nông	397
15829	Xã Minh Tâm	398
15958	Xã Hoằng Thịnh	399
16063	Xã Hoa Lộc	400
16159	Xã Nga Liên	401
16261	Xã Xuân Phúc	403
16363	Xã Tượng Lĩnh	404
16489	Xã Quảng Khê	406
16621	Phường Hải Thanh	407
16708	Xã Hưng Lộc	412
16756	Xã Tri Lễ	415
16846	Xã Bảo Thắng	417
16951	Xã Nghĩa Lâm	419
17065	Xã Châu Quang	420
17191	Xã Quỳnh Diễn	421
17278	Xã Giai Xuân	423
17359	Xã Tào Sơn	424
17449	Xã Diễn Hạnh	425
17536	Xã Tây Thành	426
17623	Xã Lam Sơn	427
17716	Xã Cát Văn	428
17800	Xã Thanh Khai	428
17893	Xã Nghi Trung	429
18008	Xã Hưng Yên Bắc	431
18082	Phường Đại Nài	436
18187	Xã Sơn Trung	439
18322	Xã Đức Lĩnh	441
18445	Xã Tùng Lộc	443
18553	Xã Hương Trạch	444
18691	Xã Cẩm Vĩnh	446
18799	Xã Kỳ Thượng	447
18847	Xã Kỳ Nam	449
18943	Xã Trung Hóa	452
19042	Xã Quảng Hưng	454
19186	Xã Đại Trạch	455
19279	Xã Lộc Thủy	457
19108	Xã Quảng Minh	458
19423	Xã Vĩnh Giang	464
19510	Xã Gio Mỹ	466
19612	Xã Cam Thành	468
19714	Xã Hải Định	470
19816	Phường An Tây	474
19879	Xã Quảng Công	477
19993	Xã Dương Hòa	479
20113	Xã Vinh Mỹ	482
20200	Phường Hòa Minh	490
20281	Phường An Hải Đông	493
20353	Phường Trường Xuân	502
20473	Xã Sông Kôn	505
20557	Xã Điện Hòa	507
20635	Xã Duy Nghĩa	508
20746	Xã Phước Kim	511
20839	Xã Bình Hải	513
20923	Xã Trà Tân	515
21005	Xã Tam Mỹ Đông	517
21172	Phường Trương Quang Trọng	522
21091	Xã Bình Thanh 	524
21217	Xã Tịnh Sơn	527
21328	Xã Sơn Ba	529
21412	Xã Đức Chánh	533
21500	Xã Ba Giang	535
21601	Xã Nhơn Hội	540
21685	Phường Hoài Đức	543
21772	Xã Mỹ Quang	545
21853	Thị trấn Ngô Mây	548
21943	Phường Nhơn Hoà	549
22036	Phường 7	555
22105	Xã Xuân Sơn Nam	558
22201	Xã Sơn Hà	560
22318	Xã Hòa Định Đông	563
22378	Phường Phước Long	568
22450	Xã Cam Hiệp Bắc	570
22552	Xã Ninh Sim	572
22645	Xã Khánh Phú	573
22738	Phường Đô Vinh	582
22828	Xã Ma Nới	585
22900	Xã Nhị Hà	589
23248	Xã Tân Bình	594
23047	Xã Bình Tân	596
23056	Xã Hồng Phong	596
23140	Xã Thuận Quí	598
23146	Xã Tân Thành	598
23239	Xã Sông Phan	601
23254	Xã Tân Thắng	601
23335	Xã Đắk Rơ Wa	608
23344	Xã Đắk Blô	610
23440	Xã Diên Bình	612
23458	Xã Măng Buk	613
23521	Xã Hà Mòn	615
23551	Xã Ya Tăng	616
23569	Phường Hội Phú	622
23590	Xã Biển Hồ	622
23635	Xã Thành An	623
23647	Xã Sơn Lang	625
23692	Xã Hà Bầu	626
23731	Xã Ia Phí	627
23773	Xã Ia Khai	628
23806	Xã Đăk Djrăng	629
23854	Xã Yang Nam	630
23890	Xã Bình Giáo	632
23938	Xã Ia Mơ	632
23968	Xã H Bông	633
24031	Xã Ia Ma Rơn	635
24109	Xã Uar	637
23974	Xã Ia Dreng	639
24142	Phường Tân Thành	643
24322	Phường Đoàn Kết	644
24196	Xã Cư Mốt	645
24235	Xã Krông Na	647
24259	Thị trấn Quảng Phú	648
24271	Xã Cư Dliê M'nông	648
24317	Xã Tân Lập	649
24360	Xã Ea Dăh	650
24373	Thị trấn Ea Kar	651
24412	Thị trấn M'Đrắk	652
24439	Xã Cư K Róa	652
24451	Xã Dang Kang	653
24499	Xã Ea Kênh	654
24529	Xã Vụ Bổn	654
24559	Xã Ea Na	655
24607	Xã Nam Ka	656
24562	Xã Hòa Hiệp	657
24618	Xã Đăk R'Moan	660
24652	Xã Đắk DRông	662
24679	Xã Đắk Sắk	663
24688	Thị trấn Đắk Mâm	664
24722	Xã Thuận Hà	665
24757	Xã Đạo Nghĩa	666
24763	Xã Đắk Ru	666
24808	Xã Tà Nung	672
14218	Thị trấn Cồn	366
14311	Xã Hải Châu	366
14398	Xã Gia Thủy	372
14485	Xã Gia Xuân	373
14575	Xã Khánh An	375
14674	Xã Lai Thành	376
14746	Xã Yên Đồng	377
16432	Phường Đông Tân	380
14863	Xã Pù Nhi	384
14959	Xã Lũng Cao	386
15061	Thị Trấn Ngọc Lặc	389
15154	Xã Cẩm Tú	390
15253	Xã Thành Thọ	391
15364	Xã Vĩnh Phúc	393
15469	Thị trấn Quán Lào	394
15583	Xã Xuân Lai	395
15703	Xã Dân Lý	397
15787	Xã Thiệu Công	398
15901	Xã Hoằng Sơn	399
16018	Xã Đại Lộc	400
16132	Xã Nga Yên	401
16234	Xã Xuân Du	403
16342	Xã Thăng Long	404
16462	Xã Quảng Nhân	406
16594	Phường Tân Dân	407
16681	Phường Quang Trung	412
17008	Xã Nghĩa Mỹ	414
16816	Xã Mỹ Lý	417
16921	Xã Xá Lượng	418
17038	Xã Yên Hợp	420
17155	Xã Quỳnh Thạch	421
17245	Xã Mậu Đức	422
17335	Xã Thành Sơn	424
17422	Xã Diễn Tháp	425
17515	Xã Tân Thành	426
17599	Xã Đại Thành	426
17686	Xã Trung Sơn	427
17779	Xã Xuân Tường	428
17869	Xã Nghi Xá	429
17983	Xã Nam Cát	430
17131	Phường Quỳnh Xuân	432
18157	Xã Sơn Giang	439
18283	Xã Tân Dân	440
18400	Xã Xuân Lam	442
18532	Xã Gia Phố	444
18667	Xã Nam Điền	445
18784	Xã Kỳ Văn	447
18829	Xã Kỳ Hoa	449
18928	Xã Yên Hóa	452
19024	Xã Quảng Châu	454
19165	Thị trấn Phong Nha	455
19258	Xã Hoa Thủy	457
19087	Xã Quảng Hải	458
19396	Xã Vĩnh Hòa	464
19495	Thị trấn Gio Linh	466
19597	Thị trấn Cam Lộ	468
19693	Xã Hải Quy	470
19803	Phường An Hòa	474
19849	Xã Phong Thu	476
19957	Xã Vinh Hà	478
20083	Xã Quảng Nhâm	481
20179	Xã Hương Xuân	483
20254	Phường Bình Thuận	492
20440	Xã Ga Ri	504
20458	Xã Bha Lê	504
20547	Xã Đại An	506
20623	Xã Duy Trung	508
20707	Xã Chà Vàl	510
20800	Xã Bình Nguyên	513
20890	Xã Tiên An	514
20977	Xã Tam Sơn	517
21010	Phường Lê Hồng Phong	522
21061	Xã Bình Trị	524
21163	Xã Trà Xinh	525
21295	Xã Sơn Thành	529
21379	Xã Hành Đức	532
21466	Phường Phổ Vinh	534
21565	Phường Quang Trung	540
21652	Xã Hoài Phú	543
21742	Xã Mỹ Thắng	545
21829	Xã Bình Hòa	547
21919	Xã Nhơn Hạnh	549
22012	Xã Canh Hòa	551
22078	Xã Xuân Thọ 2	557
22171	Xã Sơn Hội	560
22276	Xã Hòa Đồng	562
22348	Phường Vạn Thạnh	568
22474	Xã Cam Phước Đông	569
22525	Xã Vạn Hưng	571
22615	Xã Khánh Bình	573
22705	Xã Suối Tiên	574
22792	Xã Phước Tiến	584
22891	Xã Phước Hữu	587
22954	Phường Đức Long	593
23023	Xã Sông Lũy	596
23059	Thị trấn Ma Lâm	597
23110	Thị trấn Thuận Nam	598
23149	Thị trấn Lạc Tánh	599
23203	Xã Mê Pu	600
23251	Xã Tân Đức	601
23311	Xã Đắk Cấm	608
23341	Thị trấn Đắk Glei	610
23395	Xã Bờ Y	611
23452	Xã Đắk Nên	613
23506	Xã Đắk HRing	615
23527	Thị trấn Sa Thầy	616
23535	Xã Ia Đal	618
23570	Phường Phù Đổng	622
23626	Xã Tú An	623
24044	Phường Đoàn Kết	624
23680	Xã Hà Đông	626
23707	Xã Glar	626
23768	Xã Ia Yok	628
23785	Xã Ia Dêr	628
23846	Xã Đăk Pơ Pho	630
23860	Xã Ia Dơk	631
23935	Xã Ia Piơr	632
23944	Xã Ia Tiêm	633
24028	Xã Ia Tul	635
24034	Xã Ia Broăi	635
23942	Thị trấn Nhơn Hoà	639
23978	Xã Ia Hla	639
24305	Phường An Lạc	644
24318	Phường Đạt Hiếu	644
24221	Xã Ia RVê	646
24232	Xã Cư M'Lan	646
24264	Xã Ea Kuêh	648
24313	Xã Cư Pơng	649
24319	Xã Ea Ngai	649
24361	Xã Ea Hồ	650
24403	Xã Ea Ô	651
24415	Xã Cư Prao	652
24442	Xã Krông Á	652
24484	Xã Cư Drăm	653
24505	Xã Ea KNuec	654
24526	Xã Tân Tiến	654
24592	Xã Buôn Triết	656
24540	Xã Ea Ning	657
24611	Phường Nghĩa Đức	660
24643	Xã Đắk Wil	662
24658	Xã Cư Knia	662
24677	Xã Đắk N'Drót	663
24717	Thị trấn Đức An	665
24728	Xã Nâm N'Jang	665
24751	Xã Nhân Cơ	666
24778	Phường 9	672
14251	Xã Hải Hà	366
14347	Xã Ninh Nhất	369
14431	Xã Văn Phương	372
14521	Xã Gia Sinh	373
14617	Xã Khánh Hồng	375
14713	Xã Khánh Thịnh	377
14806	Phường Quảng Thành	380
16516	Xã Quảng Hùng	382
14926	Xã Điền Thượng	386
15019	Xã Tam Lư	387
15112	Xã Phúc Thịnh	389
15217	Xã Thạch Đồng	391
15328	Xã Hà Bình	392
15439	Xã Yên Ninh	394
15547	Xã Xuân Bái	395
15670	Xã Thọ Bình	397
15763	Xã Thọ Thế	397
15880	Xã Hoằng Phượng	399
15985	Xã Hoằng Yến	399
16093	Thị trấn Nga Sơn	401
16195	Xã Cát Vân	402
16291	Xã Tân Khang	404
16402	Xã Đông Thanh	405
16552	Xã Quảng Nham	406
16651	Xã Hải Yến	407
16720	Phường Nghi Tân	413
16780	Xã Châu Bính	416
16870	Xã Na Ngoi	417
16966	Xã Nghĩa Minh	419
17083	Xã Văn Lợi	420
17203	Xã Quỳnh Nghĩa	421
17296	Xã Nghĩa Hoàn	423
17377	Xã Long Sơn	424
17467	Xã Diễn Phúc	425
17563	Xã Hợp Thành	426
17650	Xã Đặng Sơn	427
17737	Xã Thanh Tiên	428
17830	Xã Nghi Văn	429
17935	Xã Nam Nghĩa	430
18037	Xã Hưng Nghĩa	431
18115	Phường Bắc Hồng	437
18217	Xã Sơn Phú	439
18370	Xã Xuân Giang	442
18487	Xã Mỹ Lộc	443
18601	Xã Việt Tiến	445
18730	Xã Cẩm Lộc	446
18421	Xã Thịnh Lộc	448
18883	Xã Quang Phú	450
18976	Xã Đồng Hóa	453
19123	Xã Hạ Trạch	455
19219	Xã Hàm Ninh	456
19312	Xã Sen Thủy	457
19357	Phường 1	462
19450	Xã Tân Hợp	465
19546	Xã Hải Thái	466
19648	Xã Triệu Hòa	469
19759	Phường Phú Hậu	474
20023	Phường Hương An	474
19915	Xã Phú Hải	478
20044	Thị trấn A Lưới	481
20149	Xã Lộc Trì	482
20230	Phường Thuận Phước	492
20296	Xã Hòa Liên	497
20416	Phường Cửa Đại	503
20503	Xã Đại Sơn	506
20580	Phường Điện Nam Đông	507
20683	Xã Quế Phong	509
20770	Xã Sông Trà	512
20854	Thị trấn Tiên Kỳ	514
20941	Xã Trà Tập	516
20380	Xã Tam Phước	518
21223	Xã Tịnh Ấn Tây	522
21121	Xã Trà Thủy	525
21247	Xã Nghĩa Thuận	528
21341	Xã Sơn Long	530
21430	Xã Đức Phú	533
21517	Xã Ba Tiêu	535
21609	Thị trấn An Lão	542
21700	Xã Đak Mang	544
21784	Xã Mỹ Chánh Tây	545
21871	Xã Cát Hanh	548
21964	Xã Phước Quang	550
22240	Phường Phú Lâm	555
22126	Xã An Thạch	559
22222	Xã Đức Bình Đông	561
22279	Phường Hòa Xuân Tây	564
22402	Xã Vĩnh Thái	568
22711	Xã Suối Tân	570
22573	Xã Ninh Phụng	572
22663	Xã Diên Sơn	574
22750	Phường Thanh Sơn	582
22846	Xã Vĩnh Hải	586
22910	Xã Cà Ná	589
22978	Xã Phong Phú	595
23071	Xã Thuận Hòa	597
23128	Xã Hàm Cường	598
23161	Xã La Ngâu	599
23221	Xã Tân Hà	600
23260	Xã Tân Xuân	601
23320	Xã Vinh Quang	608
23353	Xã Đắk Pék	610
23427	Xã Đắk Rơ Nga	612
23461	Xã Đắk Tăng	613
23512	Xã Đắk Mar	615
23533	Xã Sa Nhơn	616
23538	Xã Ia Tơi	618
23578	Phường Thống Nhất	622
23632	Xã Song An	623
24070	Xã Ia RTô	624
23689	Xã Kon Gang	626
23716	Xã Ia Pết	626
23770	Xã Ia Hrung	628
23794	Thị trấn Kon Dơng	629
23833	Xã Kông Yang	630
23866	Xã Ia Din	631
23908	Xã Ia Tôr	632
23945	Xã Chư Pơng	633
24001	Xã Cư An	634
24076	Thị trấn Phú Túc	637
24049	Xã Ia Ake	638
23986	Xã Ia Le	639
24163	Xã Ea Tu	643
24328	Xã Ea Drông	644
24211	Thị trấn Ea Súp	646
24241	Xã Ea Wer	647
24274	Xã Ea H'đinh	648
24292	Xã Ea D'Rơng	648
24346	Xã ĐLiê Ya	650
24379	Xã Ea Sô	651
24394	Xã Ea Kmút	651
24418	Xã Ea Pil	652
24454	Xã Cư KTy	653
24478	Xã Cư Pui	653
24502	Xã Ea Phê	654
24556	Xã Dray Sáp	655
24586	Xã Bông Krang	656
24541	Xã Cư Ê Wi	657
24617	Phường Nghĩa Trung	660
24637	Xã Đắk Som	661
24664	Thị trấn Đắk Mil	663
24691	Xã Đắk Sôr	664
24712	Xã Quảng Phú	664
24733	Thị trấn Kiến Đức	666
24766	Xã Nhân Đạo	666
24796	Phường 10	672
24802	Phường 3	672
24832	Xã Đạm Bri	673
14266	Xã Hải Quang	366
14359	Phường Ninh Phong	369
14443	Xã Văn Phú	372
14530	Xã Ninh Giang	374
14620	Thị trấn Phát Diệm	376
14719	Xã Yên Phong	377
15850	Xã Thiệu Vân	380
16528	Phường Quảng Thọ	382
14932	Xã Điền Quang	386
15034	Xã Yên Thắng	388
15127	Thị trấn Phong Sơn	390
15238	Xã Thành Tân	391
15352	Xã Vĩnh Quang	393
15457	Xã Định Tân	394
15565	Xã Thuận Minh	395
15685	Xã Triệu Thành	397
15781	Xã Thiệu Phúc	398
15895	Xã Hoằng Trinh	399
16015	Xã Đồng Lộc	400
16117	Xã Nga Trung	401
16222	Xã Thanh Sơn	402
16333	Xã Vạn Thắng	404
16453	Xã Quảng Đức	406
16582	Xã Ngọc Lĩnh	407
16687	Phường Lê Mao	412
16738	Thị trấn Kim Sơn	415
16828	Xã Huồi Tụ	417
16933	Xã Tam Quang	418
17050	Xã Châu Thành	420
17167	Xã Quỳnh Hậu	421
17257	Xã Yên Khê	422
17344	Xã Đỉnh Sơn	424
17431	Xã Diễn Kim	425
17524	Xã Hậu Thành	426
17611	Xã Công Thành	426
17698	Xã Nhân Sơn	427
17788	Xã Thanh Khê	428
17878	Xã Khánh Hợp	429
17989	Xã Trung Phúc Cường	430
18073	Phường Nam Hà	436
18175	Xã Sơn Ninh	439
18310	Xã Tân Hương	440
18427	Xã Vượng Lộc	443
18538	Xã Hương Đô	444
18673	Thị trấn Cẩm Xuyên	446
18775	Xã Kỳ Đồng	447
18820	Phường Kỳ Trinh	449
18925	Xã Xuân Hóa	452
19027	Xã Quảng Thạch	454
19168	Xã Vạn Trạch	455
19261	Xã Thanh Thủy	457
19081	Phường Quảng Thuận	458
19387	Xã Vĩnh Long	464
19483	Xã  A Dơi	465
19582	Xã Húc Nghì	467
19678	Xã Triệu Thành	469
19795	Phường Trường An	474
19846	Xã Phong Hòa	476
19945	Xã Vinh Thanh	478
20071	Xã Sơn Thủy	481
20173	Xã Thượng Quảng	483
20248	Phường Nam Dương	492
20329	Xã Hòa Phước	497
20443	Xã A Xan	504
20533	Xã Đại Tân	506
20611	Xã Duy Hòa	508
20705	Xã Đắc Tôi	510
20794	Xã Bình Dương	513
20884	Xã Tiên Phong	514
20971	Xã Tam Xuân II	517
20692	Xã Quế Lâm	519
21055	Xã Bình Nguyên	524
21154	Xã Trà Phong	525
21289	Thị trấn Di Lăng	529
21370	Xã Hành Dũng	532
21463	Phường Phổ Minh	534
21559	Phường Trần Quang Diệu	540
21643	Xã Hoài Sơn	543
21727	Xã Ân Nghĩa	544
21814	Xã Tây Thuận	547
21901	Xã Cát Thắng	548
21997	Xã Canh Liên	551
22073	Phường Xuân Yên	557
22168	Xã Phước Tân	560
22264	Xã Hòa Phong	562
22342	Phường Xương Huân	568
22432	Phường Cam Linh	569
22519	Xã Vạn Thạnh	571
22612	Xã Khánh Hiệp	573
22714	Thị trấn Tô Hạp	575
22789	Xã Phước Tân	584
22861	Xã Hộ Hải	586
22927	Phường Phú Tài	593
22990	Xã Phước Thể	595
23080	Xã Hồng Liêm	597
23131	Xã Hàm Mỹ	598
23173	Xã Đồng Kho	599
23227	Xã Trà Tân	600
23278	Xã Tam Thanh	602
23327	Xã Đăk Năng	608
23368	Xã Đắk Long	610
23431	Xã Văn Lem	612
23479	Thị trấn Đắk Rve	614
23518	Xã Ngok Réo	615
23407	Xã Đắk Na	617
23563	Phường Ia Kring	622
23599	Xã Chư Á	622
24041	Phường Cheo Reo	624
23656	Xã Lơ Ku	625
23701	Xã H' Neng	626
23734	Thị trấn Ia Ly	627
23778	Xã Ia Grăng	628
23809	Xã Lơ Pang	629
23840	Xã Đắk Kơ Ning	630
23888	Xã Ia Kly	632
23920	Xã Ia Me	632
23962	Xã Ia Blang	633
24010	Xã Ya Hội	634
24100	Xã Ia HDreh	637
24052	Xã Ia Sol	638
24133	Phường Thắng Lợi	643
24160	Xã Cư ÊBur	643
24187	Xã Ea Sol	645
24208	Xã Ea Nam	645
24262	Xã Quảng Tiến	648
24280	Xã Ea KPam	648
24289	Xã Cư M'gar	648
24364	Xã Phú Xuân	650
24376	Thị trấn Ea Knốp	651
24385	Xã Cư Huê	651
24444	Xã Cư San	652
24457	Xã Hòa Thành	653
24469	Xã Yang Reh	653
24535	Xã Ea Yiêng	654
24568	Xã Băng A Drênh	655
24577	Xã Quảng Điền	655
24615	Phường Nghĩa Tân	660
24616	Xã Quảng Sơn	661
24620	Xã Quảng Hoà	661
24692	Xã Nam Xuân	664
24699	Xã Tân Thành	664
24700	Xã Đắk Drô	664
24736	Xã Quảng Trực	667
24740	Xã Quảng Tâm	667
14281	Xã Hải Phong	366
14371	Xã Yên Sơn	370
14461	Xã Quảng Lạc	372
14545	Xã Ninh Xuân	374
14641	Xã Hùng Tiến	376
14740	Xã Yên Mỹ	377
16396	Phường Đông Lĩnh	380
14857	Xã Trung Lý	384
14956	Xã Lũng Niêm	386
15055	Thị trấn Lang Chánh	388
15151	Xã Cẩm Bình	390
15256	Xã Thành Tiến	391
15376	Xã Vĩnh Hòa	393
15472	Xã Định Hưng	394
15586	Xã Xuân Lập	395
15700	Xã Dân Lực	397
15790	Xã Thiệu Phú	398
15910	Xã Hoằng Xuyên	399
16021	Xã Triệu Lộc	400
16123	Xã Nga Thanh	401
16225	Xã Thượng Ninh	402
16336	Xã Trường Giang	404
16456	Xã Quảng Định	406
16591	Xã Các Sơn	407
16670	Phường Quán Bàu	412
16993	Phường Quang Phong	414
16801	Xã Châu Phong	416
16903	Xã Nga My	418
17020	Xã Nghĩa Đức	419
17140	Xã Tân Sơn	421
17227	Thị trấn Con Cuông	422
17317	Xã Hương Sơn	423
17407	Xã Diễn Hùng	425
17503	Xã Diễn Phú	425
17587	Xã Vĩnh Thành	426
17674	Xã Tân Sơn	427
17767	Xã Ngọc Sơn	428
17860	Xã Nghi Phương	429
17977	Xã Hồng Long	430
17134	Phường Quỳnh Phương	432
18160	Xã Sơn Lĩnh	439
18298	Xã An Dũng	440
18403	Xã Cương Gián	442
18529	Xã Phú Gia	444
18652	Xã Tân Lâm Hương	445
18769	Xã Kỳ Tiến	447
18796	Xã Kỳ Lợi	449
18919	Xã Hóa Tiến	452
19018	Xã Quảng Đông	454
19159	Xã Đồng Trạch	455
19255	Xã Ngư Thủy Bắc	457
19090	Xã Quảng Sơn	458
19402	Xã Vĩnh Thủy	464
19496	Thị trấn Cửa Việt	466
19600	Xã Cam Tuyền	468
19702	Xã Hải Phú	470
19807	Phường Thuỷ Biều	474
19858	Xã Phong An	476
19966	Xã Thủy Thanh	479
20086	Xã Hồng Thượng	481
20185	Xã Thượng Lộ	483
20257	Phường Hòa Cường Bắc	492
20332	Xã Hòa Khương	497
20446	Xã Tr'Hy	504
20536	Xã Đại Phong	506
20614	Xã Duy Châu	508
20749	Xã Phước Lộc	511
20836	Xã Bình Sa	513
20926	Xã Trà Giác	515
20365	Xã Tam Thành	518
21190	Xã Tịnh Kỳ	522
21106	Xã Bình Mỹ	524
21238	Thị trấn Sông Vệ	528
21337	Xã Sơn Tân	530
21424	Xã Đức Hòa	533
21523	Xã Ba Tô	535
21616	Xã An Dũng	542
21703	Xã Ân Tín	544
21790	Xã Vĩnh Kim	546
21877	Xã Cát Trinh	548
21967	Xã Phước Hòa	550
22162	Xã An Phú	555
22129	Xã An Định	559
22231	Xã EaTrol	561
22282	Phường Hòa Hiệp Nam	564
22411	Phường Cam Phúc Bắc	569
22495	Xã Vạn Phước	571
22585	Xã Ninh Tân	572
22675	Xã Diên Phước	574
22768	Phường Đông Hải	582
22868	Xã Thanh Hải	586
22930	Phường Phú Trinh	593
22996	Xã Chí Công	595
23086	Xã Hồng Sơn	597
23152	Xã Bắc Ruộng	599
23182	Xã Gia Huynh	599
23255	Xã Thắng Hải	601
23287	Phường Quyết Thắng	608
23347	Xã Đắk Man	610
23374	Xã Đắk Môn	610
23467	Xã Pờ Ê	613
23488	Xã Đắk Ruồng	614
23542	Xã Sa Nghĩa	616
23413	Xã Ngọc Yêu	617
23582	Phường Thắng Lợi	622
23605	Xã Diên Phú	622
23638	Thị trấn KBang	625
23662	Xã Nghĩa An	625
23722	Thị trấn Phú Hòa	627
23746	Xã Chư Đăng Ya	627
23800	Xã Hra	629
23830	Xã An Trung	630
23881	Xã Ia Pnôn	631
23911	Xã Ia Boòng	632
23956	Xã AYun	633
23998	Xã Yang Bắc	634
24091	Xã Ia Mláh	637
24046	Xã Chư A Thai	638
24118	Phường Tân Lập	643
24157	Xã Hòa Thuận	643
24332	Phường Bình Tân	644
24207	Xã Ea Tir	645
24247	Xã Cuôr KNia	647
24286	Xã Quảng Hiệp	648
24352	Xã Ea Tam	650
24388	Xã Ea Tih	651
24427	Xã Krông Jing	652
24472	Xã Ea Trul	653
24514	Xã Ea Kuăng	654
24583	Xã Yang Tao	656
24550	Xã Ea BHốk	657
24625	Xã Đắk R'Măng	661
24670	Xã Đắk R'La	663
24703	Xã Nâm Nung	664
24750	Xã Đắk Wer	666
24746	Xã Đắk Ngo	667
24748	Xã Quảng Tân	667
24817	Phường Lộc Tiến	673
24844	Xã Đại Lào	673
24853	Xã Đạ Tông	674
24874	Xã Liêng Srônh	674
24898	Xã Phúc Thọ	676
24922	Xã Đan Phượng	676
24931	Thị trấn Thạnh Mỹ	677
24934	Xã Lạc Xuân	677
24989	Xã Đa Quyn	678
14293	Xã Hải Phú	366
14380	Xã Đông Sơn	370
14476	Xã Gia Thanh	373
14566	Xã Khánh Phú	375
14665	Xã Lưu Phương	376
14773	Phường Lam Sơn	380
14815	Phường Lam Sơn	381
14890	Xã Phú Xuân	385
14998	Xã Trung Thượng	387
15088	Xã Đồng Thịnh	389
15184	Xã Cẩm Vân	390
15280	Xã Hà Bắc	392
15391	Xã Vĩnh An	393
15502	Xã Bắc Lương	395
15622	Xã Vạn Xuân	396
15721	Xã Đồng Lợi	397
15808	Xã Thiệu Thịnh	398
15964	Xã Hoằng Lộc	399
16069	Xã Quang Lộc	400
16174	Thị trấn Yên Cát	402
16276	Xã Thanh Kỳ	403
16375	Xã Yên Mỹ	404
16501	Xã Quảng Trường	406
16633	Phường Hải Bình	407
17914	Xã Nghi Ân	412
16763	Xã Mường Nọc	415
16852	Xã Tà Cạ	417
16960	Xã Nghĩa Bình	419
17077	Xã Châu Thái	420
17185	Xã Quỳnh Bá	421
17275	Xã Tân Xuân	423
17362	Xã Vĩnh Sơn	424
17452	Xã Diễn Ngọc	425
17542	Xã Hồng Thành	426
17629	Xã Hồng Sơn	427
17722	Xã Hạnh Lâm	428
17809	Xã Thanh Giang	428
17905	Xã Nghi Xuân	429
18022	Xã Hưng Thịnh	431
18094	Phường Thạch Linh	436
18199	Xã Sơn Kim 2	439
18340	Xã Hương Minh	441
18475	Xã Xuân Lộc	443
18571	Xã Thạch Hải	445
18715	Xã Cẩm Duệ	446
18838	Xã Lâm Hợp	447
18865	Phường Nam Lý	450
18961	Xã Thanh Thạch	453
19063	Xã Phù Hóa	454
19195	Xã Nam Trạch	455
19294	Xã Tân Thủy	457
19336	Phường Đông Lễ	461
19429	Thị trấn Khe Sanh	465
19531	Xã Gio Việt	466
19633	Xã Triệu Phước	469
19741	Xã Hải Khê	470
19963	Phường Thủy Vân	474
19885	Xã Quảng Vinh	477
20005	Xã Hương Toàn	480
20125	Xã Vinh Hiền	482
20212	Phường Tân Chính	491
20287	Phường Hoà Quý	494
20371	Xã Tam Phú	502
20482	Xã  Tư	505
20566	Xã Điện Hồng	507
20651	Thị trấn Hương An	509
20710	Xã Tà Bhinh	510
20803	Xã Bình Phục	513
20887	Xã Tiên Thọ	514
20974	Xã Tam Tiến	517
20672	Xã Sơn Viên	519
21058	Xã Bình Khương	524
21166	Xã Trà Tây	525
21304	Xã Sơn Linh	529
21385	Xã Hành Phước	532
21472	Xã Phổ Cường	534
21568	Phường Thị Nại	540
21655	Phường Tam Quan Bắc	543
21739	Xã Mỹ Châu	545
21823	Xã Bình Thành	547
21913	Xã Nhơn Mỹ	549
22009	Xã Canh Thuận	551
22081	Thị trấn La Hai	558
22180	Xã Cà Lúi	560
22303	Xã Hòa Quang Bắc	563
22360	Phường Phước Tân	568
22486	Xã Cam Bình	569
22534	Xã Ninh Tây	572
22627	Xã Khánh Nam	573
22726	Xã Sơn Bình	575
22801	Xã Phước Đại	584
22858	Xã Xuân Hải	586
22918	Phường Hàm Tiến	593
22981	Xã Vĩnh Hảo	595
23074	Xã Đông Giang	597
23170	Xã Đức Phú	599
23197	Xã Đa Kai	600
23275	Xã Long Hải	602
23302	Phường Lê Lợi	608
23362	Xã Mường Hoong	610
23389	Xã Đắk Xú	611
23476	Xã Hiếu	613
23503	Xã Đắk PXi	615
23404	Xã Ngọc Lây	617
23422	Xã Tu Mơ Rông	617
23593	Xã Tân Sơn	622
23620	Phường An Phú	623
23653	Xã Sơ Pai	625
23674	Xã Đăk HLơ	625
23737	Xã Ia Mơ Nông	627
23761	Xã Nghĩa Hưng	627
23815	Xã Đê Ar	629
23839	Xã SRó	630
23893	Xã Ia Drăng	632
23923	Xã Ia Vê	632
23966	Xã Ia Pal	633
24007	Xã Phú An	634
24103	Xã Ia RMok	637
24058	Xã Ia Peng	638
24139	Phường Thành Công	643
24169	Xã Ea Kao	643
24190	Xã Ea Ral	645
24215	Xã Ia JLơi	646
24268	Xã Ea Tar	648
24295	Xã Ea M'nang	648
24367	Xã Cư Klông	650
24391	Xã Ea Đar	651
24448	Thị trấn Krông Kmar	653
24466	Xã Hòa Lễ	653
24538	Thị trấn Buôn Trấp	655
24571	Xã Dur KMăl	655
24614	Phường Nghĩa Phú	660
24628	Xã Đắk Nia	660
24682	Xã Thuận An	663
24694	Xã Buôn Choah	664
24760	Xã Đắk Sin	666
24739	Xã Đắk Búk So	667
24787	Phường 6	672
24820	Phường 2	673
24838	Xã Lộc Nga	673
24877	Xã Rô Men	674
24848	Xã Đạ Nhim	675
24901	Xã Đông Thanh	676
24916	Xã Tân Hà	676
24940	Xã Lạc Lâm	677
24952	Xã Tu Tra	677
24991	Xã Tà Hine	678
14305	Xã Hải Chính	366
14389	Xã Gia Lâm	372
14479	Xã Gia Vân	373
14563	Xã Khánh Tiên	375
14659	Xã Kim Chính	376
14743	Xã Yên Mạc	377
16429	Xã Đông Vinh	380
14864	Xã Nhi Sơn	384
14968	Xã Thành Lâm	386
15070	Xã Thúy Sơn	389
15172	Xã Cẩm Long	390
15271	Thị trấn Hà Trung	392
15385	Xã Ninh Khang	393
15499	Thị trấn Thọ Xuân	395
15610	Xã Yên Nhân	396
15715	Xã Thái Hòa	397
15805	Xã Thiệu Hợp	398
15940	Xã Hoằng Đạt	399
16042	Xã Phong Lộc	400
16147	Xã Nga Phú	401
16249	Xã Phú Nhuận	403
16351	Xã Thăng Bình	404
16474	Xã Quảng Văn	406
16606	Phường Ninh Hải	407
16690	Phường Trường Thi	412
17017	Xã Đông Hiếu	414
16822	Xã Keng Đu	417
16927	Xã Tam Đình	418
17041	Xã Châu Tiến	420
17164	Xã Quỳnh Thanh	421
17254	Xã Bồng Khê	422
17341	Xã Tam Sơn	424
17428	Xã Diễn Vạn	425
17521	Xã Kim Thành	426
17608	Xã Mỹ Thành	426
17695	Xã Thuận Sơn	427
17782	Xã Thanh Dương	428
17875	Xã Nghi Hoa	429
17980	Xã Xuân Lâm	430
17125	Phường Mai Hùng	432
18145	Xã Sơn Lâm	439
18277	Xã Lâm Trung Thủy	440
18397	Xã Xuân Lĩnh	442
18523	Xã Hương Bình	444
18649	Xã Thạch Hội	445
18760	Xã Kỳ Bắc	447
18781	Xã Kỳ Ninh	449
18916	Xã Hóa Thanh	452
19012	Xã Quảng Hợp	454
19150	Xã Sơn Lộc	455
19249	Thị trấn Kiến Giang	457
19078	Phường Quảng Phong	458
19378	Xã Trung Nam	464
19477	Xã Ba Tầng	465
19585	Xã A Vao	467
19681	Thị trấn Diên Sanh	470
19792	Phường Xuân Phú	474
19837	Xã Phong Chương	476
19942	Thị trấn Phú Đa	478
20065	Xã Hồng Bắc	481
20167	Xã Hương Sơn	483
20245	Phường Hòa Thuận Tây	492
20323	Xã Hòa Châu	497
20437	Xã Ch'ơm	504
20530	Xã Đại Chánh	506
20605	Xã Duy Phú	508
20704	Xã La Dêê	510
20791	Thị trấn Hà Lam	513
20878	Xã Tiên Cảnh	514
20968	Xã Tam Xuân I	517
20669	Xã Phước Ninh	519
21043	Xã Bình Thuận	524
21142	Xã Trà Bùi	525
21280	Xã Nghĩa Hiệp	528
21358	Xã Long Môn	531
21451	Phường Phổ Văn	534
21538	Xã Ba Xa	535
21631	Xã An Quang	542
21718	Xã Bok Tới	544
21804	Xã Vĩnh Thuận	546
21889	Xã Cát Hưng	548
21982	Xã Phước Thuận	550
22057	Xã Xuân Lộc	557
22147	Xã An Hòa Hải	559
22250	Xã Sơn Thành Đông	562
22327	Phường Vĩnh Hòa	568
22417	Phường Cam Lộc	569
22501	Xã Vạn Bình	571
22588	Xã Ninh Quang	572
22678	Xã Diên Lạc	574
22765	Phường Đài Sơn	582
22840	Xã Công Hải	588
23231	Phường Phước Hội	594
23035	Xã Phan Hòa	596
23125	Xã Hàm Kiệm	598
23224	Xã Đông Hà	600
23326	Xã Ia Chim	608
23434	Xã Kon Đào	612
23536	Xã Mô Rai	616
23581	Phường Trà Bá	622
24073	Xã Ia Sao	624
23714	Xã HNol	626
23797	Xã Ayun	629
23872	Xã Ia Dom	631
23947	Xã Bờ Ngoong	633
24082	Xã Ia RSươm	637
23987	Xã Ia BLứ	639
24154	Phường Khánh Xuân	643
24334	Xã Ea Siên	644
24205	Xã Dliê Yang	645
24250	Xã Ea Bar	647
24277	Xã Ea Tul	648
24355	Xã Phú Lộc	650
24380	Xã Ea Sar	651
24433	Xã Ea Riêng	652
24463	Xã Hòa Phong	653
24520	Xã Ea Hiu	654
24574	Xã Bình Hòa	655
24561	Xã Dray Bhăng	657
24622	Xã Đắk Ha	661
24678	Xã Long Sơn	663
24706	Xã Đức Xuyên	664
24756	Xã Nghĩa Thắng	666
24772	Phường 8	672
24784	Phường 1	672
24811	Xã Xuân Trường	672
24875	Xã Đạ Rsal	674
24889	Xã Đạ K' Nàng	674
24862	Xã Lát	675
24895	Xã Đạ Đờn	676
24946	Xã Quảng Lập	677
24949	Xã Ka Đơn	677
24964	Xã Liên Hiệp	678
24985	Xã Ninh Gia	678
25006	Xã Tân Thượng	679
25021	Xã Tam Bố	679
25030	Xã Gung Ré	679
25036	Xã Hòa Ninh	679
25045	Xã Hòa Bắc	679
25066	Xã Lộc Bắc	680
25096	Thị trấn Đạ M'ri	681
25114	Xã Đạ Ploa	681
25126	Thị trấn Đạ Tẻh	682
25129	Xã An Nhơn	682
25141	Xã Đạ Lây	682
25165	Xã Phước Cát 2	683
25201	Phường Tân Bình	689
14314	Xã Hải Triều	366
14395	Xã Thạch Bình	372
14488	Xã Gia Lập	373
14578	Xã Khánh Cường	375
14677	Xã Định Hóa	376
14767	Phường Điện Biên	380
14809	Phường Bắc Sơn	381
14881	Xã Trung Thành	385
14980	Xã Thiết Ống	386
15079	Xã Cao Ngọc	389
15181	Xã Cẩm Phú	390
15283	Xã Hoạt Giang	392
15403	Thị trấn Yên Lâm	394
15514	Xã Xuân Trường	395
15640	Xã Xuân Thắng	396
15742	Xã Thọ Dân	397
15838	Xã Thiệu Vận	398
15982	Xã Hoằng Tân	399
16087	Xã Đa Lộc	400
16186	Xã Hóa Quỳ	402
16294	Xã Hoàng Giang	404
16399	Xã Đông Minh	405
16546	Xã Quảng Lộc	406
16648	Xã Trường Lâm	407
18013	Xã Hưng Chính	412
16777	Thị trấn Tân Lạc	416
16864	Xã Tây Sơn	417
16969	Xã Nghĩa Phú	419
17086	Xã Nam Sơn	420
17206	Xã An Hòa	421
17293	Xã Nghĩa Hợp	423
17380	Xã Khai Sơn	424
17476	Xã Diễn Cát	425
17560	Xã Thịnh Thành	426
17647	Xã Hòa Sơn	427
17731	Xã Thanh Phong	428
17821	Xã Thanh Xuân	428
17917	Xã Phúc Thọ	429
18028	Xã Hưng Thông	431
18109	Xã Thạch Hưng	436
18214	Xã Sơn Hàm	439
18358	Xã Đan Trường	442
18481	Xã Quang Lộc	443
18589	Xã Thạch Sơn	445
18724	Xã Cẩm Quan	446
18850	Xã Kỳ Lạc	447
18874	Phường Phú Hải	450
18967	Xã Lâm Hóa	453
19111	Thị trấn Hoàn Lão	455
19210	Xã Vĩnh Ninh	456
19309	Xã Mai Thủy	457
19354	Phường 3	461
19447	Xã Hướng Linh	465
19552	Xã Gio Quang	466
19642	Xã Triệu Thuận	469
19753	Phường Thuận Lộc	474
20029	Phường Hương Hồ	474
19903	Xã Phú Thuận	478
20035	Xã Bình Tiến	480
20143	Xã Lộc Điền	482
20227	Phường Thanh Bình	492
20312	Phường Hòa Thọ Đông	495
20407	Phường Thanh Hà	503
20500	Thị Trấn Ái Nghĩa	506
20579	Phường Điện Nam Trung	507
20677	Xã Quế Long	509
20758	Xã Hiệp Hòa	512
20848	Xã Bình Trung	513
20932	Xã Trà Ka	515
20364	Thị trấn Phú Thịnh	518
21202	Xã Tịnh Ấn Đông	522
21112	Xã Bình Châu	524
21244	Xã Nghĩa Thắng	528
21340	Xã Sơn Dung	530
21427	Xã Đức Tân	533
21520	Xã Ba Trang	535
21610	Xã An Hưng	542
21697	Xã Ân Mỹ	544
21781	Xã Mỹ Cát	545
21865	Xã Cát Tài	548
21958	Xã Phước Thắng	550
22048	Xã Bình Ngọc	555
22123	Xã An Ninh Đông	559
22216	Xã Ea Bá	561
22261	Phường Hoà Hiệp Trung	564
22399	Xã Vĩnh Hiệp	568
22708	Xã Suối Cát	570
22576	Xã Ninh Bình	572
22669	Xã Diên Phú	574
22759	Phường Kinh Dinh	582
22867	Xã Nhơn Hải	586
22933	Phường Xuân An	593
22993	Xã Hòa Minh	595
23089	Xã Hàm Trí	597
23179	Xã Đức Bình	599
23284	Phường Duy Tân	608
23371	Xã Đắk KRoong	610
23485	Xã Đắk Tơ Lung	614
23416	Xã Đắk Sao	617
23608	Xã Ia Kênh	622
23660	Xã Đak SMar	625
23740	Xã Đăk Tơ Ver	627
23818	Xã Kon Chiêng	629
23899	Xã Bàu Cạn	632
23977	Xã Ia Ko	633
24112	Xã Chư Rcăm	637
24145	Phường Tân Tiến	643
24331	Phường Thống Nhất	644
24199	Xã Ea Hiao	645
24244	Xã Tân Hoà	647
24283	Xã Ea M'DRóh	648
24349	Xã Ea Tóh	650
24382	Xã Xuân Phú	651
24424	Xã Ea H'MLay	652
24460	Xã Hòa Tân	653
24508	Xã Ea Yông	654
24565	Xã Ea Bông	655
24610	Xã Ea R'Bin	656
24619	Phường Quảng Thành	660
24661	Xã Trúc Sơn	662
24697	Xã Nam Đà	664
24727	Xã Đắk N'Dung	665
24742	Xã Đắk R'Tíh	667
24805	Xã Xuân Thọ	672
24826	Phường B'lao	673
24856	Xã Đạ Long	674
24868	Thị trấn Nam Ban	676
24871	Thị trấn Đinh Văn	676
24904	Xã Gia Lâm	676
24928	Thị trấn D'Ran	677
24973	Xã N'Thol Hạ	678
24976	Xã Tân Hội	678
24988	Xã Tà Năng	678
25009	Xã Tân Châu	679
25012	Xã Tân Nghĩa	679
25033	Xã Bảo Thuận	679
25057	Xã Lộc Bảo	680
25060	Xã Lộc Lâm	680
25075	Xã Lộc Quảng	680
25099	Thị trấn Ma Đa Guôi	681
25105	Xã Hà Lâm	681
25123	Xã Phước Lộc	681
25156	Xã Đạ Pal	682
25159	Thị trấn Cát Tiên	683
25183	Xã Đức Phổ	683
14341	Phường Nam Thành	369
14425	Xã Thượng Hòa	372
14512	Xã Gia Minh	373
14596	Xã Khánh Vân	375
14695	Xã Kim Trung	376
14788	Phường Tân Sơn	380
14830	Phường Trung Sơn	382
14908	Xã Thiên Phủ	385
15004	Xã Sơn Hà	387
15097	Xã Lộc Thịnh	389
15202	Xã Thạch Tượng	391
15307	Xã Yến Sơn	392
15418	Xã Yên Trung	394
15523	Xã Tây Hồ	395
15649	Xã Xuân Dương	396
15748	Xã Thọ Tân	397
15871	Xã Hoằng Giang	399
15979	Xã Hoằng Châu	399
16090	Xã Ngư Lộc	400
16198	Xã Cát Tân	402
16297	Xã Trung Chính	404
16405	Xã Đông Tiến	405
16549	Xã Tiên Trang	406
16642	Phường Tĩnh Hải	407
17923	Xã Nghi Đức	412
16774	Xã Căm Muộn	415
16867	Xã Mường Ải	417
16972	Xã Nghĩa Hưng	419
17089	Xã Châu Lý	420
17212	Xã Sơn Hải	421
17299	Xã Nghĩa Phúc	423
17383	Xã Lĩnh Sơn	424
17488	Xã Diễn Thọ	425
17554	Xã Tăng Thành	426
17644	Xã Thượng Sơn	427
17734	Xã Thanh Mỹ	428
17824	Xã Thanh Đức	428
17932	Xã Nam Hưng	430
18034	Xã Hưng Lợi	431
18100	Xã Thạch Hạ	436
18205	Xã Sơn Long	439
18343	Xã Quang Thọ	441
18472	Xã Trung Lộc	443
18586	Xã Thạch Kênh	445
18712	Xã Nam Phúc Thăng	446
18844	Xã Kỳ Sơn	447
18871	Phường Đồng Sơn	450
18964	Xã Thuận Hóa	453
19072	Xã Quảng Thanh	454
19204	Xã Trường Sơn	456
19297	Xã Phú Thủy	457
19345	Phường 4	461
19441	Xã Hướng Phùng	465
19543	Xã Gio Mai	466
19639	Xã Triệu Trạch	469
19930	Phường Phú Thượng	474
20002	Xã Hương Phong	474
19888	Xã Quảng An	477
20008	Phường Hương Vân	480
20122	Xã Giang Hải	482
20206	Phường Thanh Khê Tây	491
20290	Phường Hoà Hải	494
20389	Xã Tam Ngọc	502
20485	Xã Ba	505
20563	Phường Điện Ngọc	507
20644	Xã Quế Xuân 1	509
20740	Xã Phước Chánh	511
20827	Xã Bình Phú	513
20914	Xã Trà Giang	515
21001	Xã Tam Nghĩa	517
21037	Xã Nghĩa Dõng	522
21100	Xã Bình Chương	524
21229	Xã Tịnh Minh	527
21335	Xã Sơn Liên	530
21418	Xã Đức Minh	533
21505	Xã Ba Ngạc	535
21604	Xã Nhơn Hải	540
21691	Xã Ân Hảo Đông	544
21778	Xã Mỹ Tài	545
21862	Xã Cát Khánh	548
21949	Xã Nhơn Thọ	549
22040	Phường Phú Thạnh	555
22111	Xã Xuân Phước	558
22204	Xã Suối Trai	560
22321	Xã Hòa Định Tây	563
22375	Phường Vĩnh Nguyên	568
22447	Xã Sơn Tân	570
22549	Xã Ninh Trung	572
22636	Xã Cầu Bà	573
22736	Thị trấn Trường Sa	576
22816	Xã Lương Sơn	585
22885	Xã Phước Hà	589
23237	Phường Bình Tân	594
23050	Xã Phan Rí Thành	596
23143	Xã Tân Thuận	598
23242	Xã Tân Phúc	601
23338	Xã Hòa Bình	608
23455	Xã Đắk Ring	613
23530	Xã Rơ Kơi	616
23572	Phường Hoa Lư	622
24064	Xã Ia RBol	624
23713	Xã Trang	626
23788	Xã Ia Chia	628
23842	Xã Đăk Song	630
23917	Xã Ia Púch	632
24004	Xã Tân An	634
24055	Xã Ia Piar	638
24166	Xã Hòa Thắng	643
24193	Xã Ea Wy	645
24214	Xã Ia Lốp	646
24265	Xã Ea Kiết	648
24298	Xã Cư Suê	648
24370	Xã Ea Tân	650
24400	Xã Ea Păl	651
24445	Xã Ea Trang	652
24481	Xã Hòa Sơn	653
24532	Xã Ea Uy	654
24589	Xã Đắk Liêng	656
24612	Phường Nghĩa Thành	660
24634	Xã Đắk Plao	661
24685	Xã Đức Minh	663
24715	Xã Nâm N'Đir	664
24761	Xã Hưng Bình	666
24775	Phường 12	672
24829	Phường Lộc Sơn	673
24835	Xã Lộc Thanh	673
24886	Xã Phi Liêng	674
24883	Xã Phi Tô	676
24910	Xã Tân Văn	676
24919	Xã Liên Hà	676
24943	Xã Ka Đô	677
24982	Xã Phú Hội	678
24994	Xã Đà Loan	678
25003	Xã Đinh Trang Thượng	679
25015	Xã Gia Hiệp	679
25027	Xã Liên Đầm	679
25069	Xã B' Lá	680
25072	Xã Lộc Ngãi	680
25087	Xã Tân Lạc	680
25090	Xã Lộc Thành	680
25111	Xã Đạ Oai	681
25117	Xã Ma Đa Guôi	681
25168	Xã Gia Viễn	683
25171	Xã Nam Ninh	683
25189	Xã Quảng Ngãi	683
25217	Phường Long Thủy	688
25229	Xã Phú Văn	691
14356	Phường Ninh Sơn	369
14440	Xã Sơn Thành	372
14533	Xã Trường Yên	374
14632	Xã Xuân Chính	376
14728	Xã Yên Từ	377
15913	Phường Tào Xuyên	380
14845	Thị trấn Mường Lát	384
14944	Xã Ái Thượng	386
15046	Xã Tân Phúc	388
15145	Xã Cẩm Liên	390
15247	Xã Thành Tâm	391
15358	Xã Vĩnh Tiến	393
15466	Xã Định Liên	394
15574	Xã Xuân Tín	395
15706	Xã Dân Quyền	397
15796	Xã Thiệu Giang	398
15916	Xã Hoằng Quý	399
16030	Xã Lộc Sơn	400
16135	Xã Nga Giáp	401
16231	Xã Cán Khê	403
16339	Xã Vạn Thiện	404
16465	Xã Quảng Ninh	406
16585	Phường Hải An	407
16675	Phường Hưng Dũng	412
17003	Phường Long Sơn	414
16810	Xã Diên Lãm	416
16909	Xã Yên Hòa	418
17026	Xã Nghĩa Long	419
17143	Xã Quỳnh Văn	421
17236	Xã Cam Lâm	422
17325	Xã Tân Hương	423
17410	Xã Diễn Mỹ	425
17506	Thị trấn Yên Thành	426
17590	Xã Lý Thành	426
17677	Xã Thái Sơn	427
17764	Xã Đồng Văn	428
17854	Xã Nghi Kiều	429
17962	Xã Hùng Tiến	430
17128	Phường Quỳnh Dị	432
18148	Xã Sơn Lễ	439
18280	Xã Hòa Lạc	440
18394	Xã Xuân Liên	442
18526	Xã Hương Long	444
18643	Xã Thạch Đài	445
18766	Xã Kỳ Phong	447
18754	Phường Hưng Trí	449
18913	Xã Hồng Hóa	452
19006	Xã Văn Hóa	453
19144	Xã Hải Phú	455
19240	Xã An Ninh	456
19069	Xã Quảng Tiên	458
19372	Xã Vĩnh Tú	464
19474	Xã Hướng Lộc	465
19561	Xã Hướng Hiệp	467
19657	Xã Triệu Long	469
19777	Phường Vỹ Dạ	474
19828	Xã Điền Lộc	476
19927	Xã Phú Mỹ	478
20050	Xã Hồng Hạ	481
20152	Xã Lộc Tiến	482
20239	Phường Hải Châu II	492
20317	Xã Hòa Phú	497
20431	Xã Cẩm Thanh	503
20527	Xã Đại Thạnh	506
20602	Xã Duy Thu	508
20702	Xã Tà Pơơ	510
20782	Xã Quế Lưu	512
20872	Xã Tiên Ngọc	514
20959	Xã Trà Vân	516
20668	Xã Ninh Phước	519
21046	Xã Bình Thạnh	524
21148	Xã Sơn Trà	525
21292	Xã Sơn Hạ	529
21373	Xã Hành Trung	532
21460	Phường Phổ Ninh	534
21556	Phường Đống Đa	540
21646	Xã Hoài Châu Bắc	543
21730	Thị trấn Phù Mỹ	545
21811	Xã Bình Tân	547
21904	Xã Cát Chánh	548
21994	Thị trấn Vân Canh	551
22066	Xã Xuân Cảnh	557
22150	Xã An Hiệp	559
22249	Xã Sơn Thành Tây	562
22330	Phường Vĩnh Hải	568
22420	Phường Cam Phú	569
22504	Xã Vạn Thọ	571
22594	Phường Ninh Hà	572
22681	Xã Diên Tân	574
22771	Phường Mỹ Đông	582
22879	Xã Phước Hậu	587
22942	Phường Đức Nghĩa	593
23005	Thị trấn Chợ Lầu	596
23095	Xã Hàm Liêm	597
23191	Thị trấn Võ Xu	600
23293	Phường Thắng Lợi	608
23377	Thị trấn Plei Kần	611
23491	Xã Đắk Pne	614
23419	Xã Đắk Tờ Kan	617
23611	Xã Gào	622
23668	Xã Kông Lơng Khơng	625
23752	Xã Ia Nhin	627
23836	Xã Đăk Tơ Pang	630
23914	Xã Ia O	632
24013	Xã Pờ Tó	635
24061	Xã Ia Hiao	638
24175	Xã Hòa Khánh	643
24217	Xã Ea Rốk	646
24223	Xã Ea Lê	646
24301	Xã Cuor Đăng	648
24310	Xã Chư KBô	649
24397	Xã Cư Ni	651
24404	Xã Cư ELang	651
24475	Xã Khuê Ngọc Điền	653
24490	Thị trấn Phước An	654
24580	Thị trấn Liên Sơn	656
24598	Xã Đắk Phơi	656
24631	Xã Quảng Khê	661
24649	Xã Nam Dong	662
24709	Xã Đắk Nang	664
24724	Xã Thuận Hạnh	665
24769	Phường 7	672
24810	Xã Trạm Hành	672
24841	Xã Lộc Châu	673
24859	Xã Đạ M' Rong	674
24880	Xã Phú Sơn	676
24913	Xã Hoài Đức	676
24925	Xã Nam Hà	676
24937	Xã Đạ Ròn	677
24970	Xã Bình Thạnh	678
25000	Thị trấn Di Linh	679
25007	Xã Tân Lâm	679
25018	Xã Đinh Lạc	679
25024	Xã Đinh Trang Hòa	679
25051	Xã Gia Bắc	679
25078	Xã Lộc Tân	680
25081	Xã Lộc Đức	680
25093	Xã Lộc Nam	680
25108	Xã Đạ Tồn	681
25120	Xã Đoàn Kết	681
25153	Xã Đạ Kho	682
25180	Thị trấn Phước Cát 	683
25216	Phường Thác Mơ	688
25219	Phường Phước Bình	688
14050	Xã Trực Hưng	363
14158	Xã Hồng Thuận	365
14245	Xã Hải Phúc	366
14338	Phường Nam Bình	369
14419	Xã Yên Quang	372
14506	Xã Gia Thắng	373
14599	Xã Khánh Hội	375
14698	Xã Kim Đông	376
14791	Phường Đông Cương	380
14833	Phường Bắc Sơn	382
14914	Xã Nam Xuân	385
15016	Thị trấn Sơn Lư	387
15115	Xã Nguyệt Ấn	389
15214	Xã Thạch Định	391
15322	Xã Hà Tân	392
15433	Xã Yên Hùng	394
15544	Xã Thọ Xương	395
15652	Xã Thọ Thanh	396
15745	Xã Xuân Thọ	397
15835	Xã Thiệu Lý	398
15973	Xã Hoằng Phong	399
16078	Xã Minh Lộc	400
16180	Xã Xuân Hòa	402
16288	Xã Hoàng Sơn	404
16393	Xã Đông Yên	405
16543	Xã Quảng Lưu	406
16645	Phường Mai Lâm	407
16717	Phường Nghi Thuỷ	413
16783	Xã Châu Thuận	416
16876	Thị trấn Thạch Giám	418
16978	Xã Nghĩa Thịnh	419
17092	Xã Hạ Sơn	420
17209	Xã Tiến Thủy	421
17302	Xã Tiên Kỳ	423
17389	Thị trấn Diễn Châu	425
17479	Xã Diễn Thịnh	425
17572	Xã Nhân Thành	426
17659	Xã Lưu Sơn	427
17755	Xã Thanh Ngọc	428
17845	Xã Nghi Thiết	429
17950	Thị trấn Nam Đàn	430
18064	Xã Hưng Thành	431
18124	Phường Đức Thuận	437
18241	Xã Tùng Châu	440
18376	Xã Xuân Yên	442
18499	Xã Điền Mỹ	444
18619	Xã Thạch Trị	445
18739	Xã Cẩm Mỹ	446
18493	Xã Phù Lưu	448
18895	Xã Thuận Đức	450
18991	Xã Phong Hóa	453
19135	Xã Liên Trạch	455
19234	Xã Tân Ninh	456
19009	Phường Ba Đồn	458
19363	Thị trấn Hồ Xá	464
19465	Xã Tân Liên	465
19576	Xã Ba Nang	467
19669	Xã Triệu Ái	469
19786	Phường Phú Hội	474
19831	Xã Phong Bình	476
19939	Xã Phú Lương	478
20059	Xã Hương Nguyên	481
20161	Thị trấn Khe Tre	483
20242	Phường Phước Ninh	492
20308	Xã Hòa Nhơn	497
20425	Xã Cẩm Kim	503
20515	Xã Đại Đồng	506
20590	Xã Điện Phong	507
20698	Xã Laêê	510
20779	Thị trấn Tân Bình	512
20866	Xã Tiên Châu	514
20956	Xã Trà Don	516
20392	Xã Tam Dân	518
21253	Xã Nghĩa Phú	522
21130	Xã Trà Phú	525
21271	Xã Nghĩa Điền	528
21355	Xã Thanh An	531
21442	Xã Phổ An	534
21532	Xã Ba Lế	535
21622	Xã An Toàn	542
21709	Xã Ân Phong	544
21801	Xã Vĩnh Hòa	546
21883	Xã Cát Hiệp	548
21973	Xã Phước Hiệp	550
22051	Phường Xuân Phú	557
22138	Xã An Cư	559
22225	Xã EaBar	561
22267	Xã Hòa Tân Đông	564
22396	Xã Vĩnh Trung	568
22471	Xã Cam An Nam	570
22570	Phường Ninh Đa	572
22660	Xã Diên Xuân	574
22753	Phường Mỹ Hương	582
22852	Xã Phương Hải	586
22915	Phường Mũi Né	593
22975	Xã Phan Dũng	595
23068	Xã Đông Tiến	597
23164	Xã Huy Khiêm	599
23266	Xã Sơn Mỹ	601
23359	Xã Xốp	610
23473	Thị trấn Măng Đen	613
23548	Xã Ya Xiêr	616
23584	Phường Yên Thế	622
23641	Xã Kon Pne	625
23719	Xã Ia Băng	626
23798	Xã Đak Jơ Ta	629
23878	Xã Ia Kriêng	631
23953	Xã AL Bá	633
24088	Xã Đất Bằng	637
24121	Phường Tân Hòa	643
24337	Xã Bình Thuận	644
24256	Thị trấn Ea Pốk	648
24358	Xã Tam Giang	650
24430	Xã Ea M' Doal	652
24517	Xã Hòa Đông	654
24547	Xã Ea Tiêu	657
24673	Xã Đắk Gằn	663
24745	Xã Quảng Tín	666
24790	Phường 5	672
24847	Xã Đạ Chais	675
24955	Xã Pró	677
25042	Xã Hòa Nam	679
25132	Xã Quốc Oai	682
25213	Xã Tiến Hưng	689
25305	Xã Lộc Thịnh	692
25387	Xã Thuận Phú	695
25244	Xã Bình Sơn	698
25522	Xã Tân Đông	706
25612	Xã Hòa Hội	708
25702	Xã Long Thuận	711
25828	Xã Long Nguyên	719
25873	Xã Tân Hiệp	722
25981	Xã An Sơn	725
26041	Phường Quyết Thắng	731
26122	Xã Nam Cát Tiên	734
26212	Xã Phú Tân	736
26302	Xã Gia Tân 2	738
26410	Xã Bàu Cạn	740
26500	Xã Phước Khánh	742
26574	Xã Bàu Chinh	750
26659	Thị trấn Long Điền	752
26743	Phường Bến Thành	760
26897	Phường 9	764
26986	Phường 07	766
27076	Phường 17	768
25220	Phường Long Phước	688
25280	Xã Lộc Thạnh	692
25361	Xã Tân Hiệp	694
25433	Xã Thành Tâm	697
25492	Xã Thạnh Bắc	705
25582	Xã Truông Mít	707
25672	Xã Phước Đông	710
25760	Phường Hoà Phú	718
25849	Phường Hòa Lợi	721
25954	Phường Bình Thắng	724
26017	Phường Tam Hiệp	731
26098	Phường Bảo Vinh	732
26188	Xã Thạnh Phú	735
26281	Xã Trung Hoà	737
26368	Thị trấn Long Thành	740
26470	Xã Phước Thiền	742
26554	Phường Phước Nguyên	748
26632	Xã Bông Trang	751
26725	Phường Hắc Dịch	754
26881	Phường 12	764
26947	Phường 03	765
27037	Phường Hiệp Tân	767
26839	Phường Hiệp Phú	769
27157	Phường 02	770
27253	Phường 16	772
27352	Phường 09	775
27442	Phường Bình Hưng Hoà B	777
27529	Xã Phước Hiệp	783
27622	Xã Phong Phú	785
27709	Xã Lợi Bình Nhơn	794
27775	Xã Vĩnh Bình	797
27883	Xã Thủy Đông	800
27988	Xã Hựu Thạnh	802
28084	Xã Quê Mỹ Thạnh	805
28177	Xã Mỹ Lộc	807
28267	Phường 8	815
28459	Xã Tân Phú	817
28393	Xã Hậu Thành	819
28522	Xã Tân Hội Đông	821
28618	Xã Quơn Long	822
28723	Xã Tân Tây	824
28813	Xã Giao Long	831
28940	Xã Tân Hội	833
29044	Xã Hưng Nhượng	834
29119	Xã Tân Xuân	836
29206	Xã Hòa Lợi	837
29260	Phường 9	842
29356	Xã Long Thới	846
29449	Xã Trường Thọ	848
29516	Phường 2	851
29617	Xã Hòa Phú	857
29713	Xã Hiếu Thành	859
29833	Xã Thới Hòa	862
29890	Xã Tân Thuận Tây	866
29950	Xã An Phước	869
30058	Xã Mỹ Đông	872
30148	Xã Bình Tấn	874
30238	Xã Định Hòa	876
30328	Phường Vĩnh Ngươn	884
30412	Phường Long Sơn	887
30496	Xã Bình Phú	889
30586	Xã Ô Lâm	891
30676	Xã Hòa Bình	893
30766	Phường Tô Châu	900
30856	Xã Tân Thành	904
30931	Xã Ngọc Thuận	906
31009	Xã Đông Yên	908
31111	Xã Lại Sơn	912
31159	Phường Thới An	917
31234	Xã Thạnh Mỹ	924
31282	Xã Đông Thuận	927
31360	Xã Thạnh Xuân	932
31453	Xã Vĩnh Thuận Tây	935
31516	Phường 4	941
31863	Xã Ninh Thạnh Lợi A	956
31981	Xã Long Điền	960
32038	Xã Hòa Thành	964
32119	Xã Khánh Hải	968
32194	Xã Hàm Rồng	971
25245	Xã Long Giang	688
25205	Phường Tân Thiện	689
25282	Xã Lộc Hiệp	692
25300	Xã Lộc Điền	692
25438	Xã Tân Quan	694
25381	Xã Tân Lập	695
25435	Xã Minh Lập	697
25240	Xã Long Bình	698
25495	Xã Tân Bình	705
25516	Thị trấn Tân Châu	706
25585	Thị trấn Châu Thành	708
25606	Xã Hòa Thạnh	708
25675	Xã Phước Trạch	710
25696	Xã Long Khánh	711
25763	Phường Phú Tân	718
25819	Xã Cây Trường II	719
25852	Phường Tân Định	721
25870	Xã An Bình	722
25957	Phường Đông Hòa	724
25972	Phường Thuận Giao	725
26014	Phường Tân Tiến	731
26035	Phường Tam Hòa	731
26089	Xã Bình Lộc	732
26116	Thị trấn Tân Phú	734
26179	Xã Tân An	735
26209	Xã Thanh Sơn	736
26266	Xã Đông Hoà	737
26296	Xã An Viễn	737
26356	Xã Xuân Tây	739
26398	Xã Tam An	740
26461	Xã Xuân Định	741
26497	Xã Vĩnh Thanh	742
26539	Phường 11	747
26569	Xã Long Phước	748
26617	Xã Nghĩa Thành	750
26653	Xã Bưng Riềng	751
26704	Phường Phú Mỹ	754
26740	Phường Bến Nghé	760
26791	Phường Tân Thới Nhất	761
26898	Phường 8	764
26950	Phường 17	765
26983	Phường 11	766
27040	Phường Tân Thới Hòa	767
27070	Phường 10	768
26845	Phường Tăng Nhơn Phú B	769
26848	Phường Phước Long B	769
27088	Phường Thảo Điền	769
27166	Phường 13	771
27169	Phường 14	771
27187	Phường 08	771
27262	Phường 09	773
27265	Phường 06	773
27286	Phường 03	773
27358	Phường 12	775
27361	Phường 05	775
27379	Phường 03	775
27445	Phường Bình Trị Đông	777
27454	Phường Tân Tạo	777
27472	Phường Tân Kiểng	778
27535	Xã Phước Vĩnh An	783
27544	Xã Hòa Phú	783
27562	Xã Tân Hiệp	784
27625	Xã An Phú Tây	785
27634	Xã Tân Quý Tây	785
27652	Xã Nhơn Đức	786
27706	Xã Nhơn Thạnh Trung	794
27718	Xã An Vĩnh Ngãi	794
27806	Phường 3	795
27772	Xã Thái Bình Trung	797
27781	Xã Tuyên Bình	797
27826	Thị trấn Tân Thạnh	799
27880	Xã Thuận Nghĩa Hòa	800
27886	Xã Thủy Tây	800
27919	Xã Bình Hòa Bắc	801
27967	Xã Đức Hòa Thượng	802
27994	Xã Thạnh Lợi	803
28003	Xã Lương Hòa	803
28057	Xã Nhị Thành	804
28090	Xã Bình Trinh Đông	805
28102	Xã Đức Tân	805
28156	Xã Tân Chánh	806
28180	Xã Phước Lại	807
28204	Xã Đông Thạnh	807
28252	Phường 4	815
28273	Phường 9	815
28591	Xã Thới Sơn	815
28439	Phường 4	817
28453	Xã Mỹ Hạnh Trung	817
28321	Thị trấn Mỹ Phước	818
28372	Xã Hậu Mỹ Trinh	819
28387	Xã Mỹ Hội	819
28414	Xã An Thái Đông	819
28501	Xã Hiệp Đức	820
28516	Xã Ngũ Hiệp	820
28537	Xã Tam Hiệp	821
28594	Thị trấn Chợ Gạo	822
28615	Xã Thanh Bình	822
28636	Xã Long Bình Điền	822
28684	Xã Vĩnh Hựu	823
28726	Xã Kiểng Phước	824
28744	Xã Phước Trung	824
28783	Xã Sơn Đông	829
28810	Xã An Khánh	831
28825	Xã Phú An Hòa	831
28879	Xã Vĩnh Bình	832
28900	Xã Hưng Khánh Trung B	832
28945	Xã Bình Khánh 	833
29008	Xã Châu Bình	834
29029	Xã Tân Hào	834
29038	Xã Tân Lợi Thạnh	834
29098	Xã Đại Hòa Lộc	835
29122	Xã Mỹ Chánh	836
29131	Xã Mỹ Thạnh	836
29191	Xã Quới Điền	837
29215	Xã An Thuận	837
29221	Xã Thạnh Hải	837
29239	Phường 1	842
29269	Xã Mỹ Cẩm	844
29272	Xã An Trường A	844
29329	Xã Phong Thạnh	845
29359	Xã Hùng Hòa	846
29365	Xã Tập Ngãi	846
29422	Xã Mỹ Long Bắc	848
29452	Xã Hiệp Mỹ Đông	848
29455	Xã Hiệp Mỹ Tây	848
29497	Xã Đôn Xuân	850
29515	Xã Long Toàn	851
29524	Xã Dân Thành	851
29590	Xã Thanh Đức	857
29614	Xã Thạnh Quới	857
29626	Xã Mỹ Phước	858
29680	Xã Trung Thành Tây	859
29704	Xã Trung Nghĩa	859
29716	Xã Hiếu Nghĩa	859
29771	Phường Thành Phước	861
29815	Xã Mỹ Hòa	861
29830	Xã Hòa Bình	862
29794	Xã Mỹ Thuận	863
29881	Xã Mỹ Ngãi	866
29887	Xã Mỹ Trà	866
29965	Xã Tân Hội	868
29941	Xã Tân Thành B	869
30049	Xã Tân Kiều	872
25249	Xã Phước Tín	688
25207	Xã Tân Thành	689
25285	Xã Lộc Thiện	692
25297	Xã Lộc Thái	692
25363	Thị trấn Tân Phú	695
25378	Xã Tân Lợi	695
25439	Xã Quang Minh	697
25453	Xã Minh Thắng	697
25498	Xã Thạnh Bình	705
25513	Xã Trà Vong	705
25588	Xã Hảo Đước	708
25600	Xã An Cơ	708
25678	Xã Thanh Phước	710
25690	Xã Long Giang	711
25765	Phường Tân An	718
25774	Phường Chánh Mỹ	718
25855	Xã Phú An	721
25864	Xã Phước Sang	722
25963	Phường An Thạnh	725
25969	Phường Bình Chuẩn	725
26020	Phường Long Bình	731
26026	Phường Tân Mai	731
26095	Phường Suối Tre	732
26104	Phường Bàu Sen	732
26182	Xã Vĩnh Tân	735
26194	Xã Tân Bình	735
26275	Xã Tây Hoà	737
26287	Xã Hưng Thịnh	737
26383	Xã An Phước	740
26386	Xã Bình An	740
26476	Xã Đại Phước	742
26479	Thị trấn Hiệp Phước	742
26557	Phường Long Toàn	748
26558	Phường Long Tâm	748
26638	Xã Bàu Lâm	751
26641	Xã Hòa Bình	751
26728	Xã Châu Pha	754
26882	Phường 14	764
26884	Phường 10	764
26896	Phường 01	764
26968	Phường 04	766
26980	Phường 03	766
27058	Phường 01	768
27073	Phường 11	768
26860	Phường Long Trường	769
27097	Phường Bình Trưng Đông	769
27100	Phường Bình Trưng Tây	769
27184	Phường 01	771
27196	Phường 07	771
27202	Phường 06	771
27283	Phường 04	773
27295	Phường 15	773
27298	Phường 01	773
27376	Phường 08	775
27385	Phường 10	775
27391	Phường 02	776
27466	Phường Tân Thuận Đông	778
27478	Phường Bình Thuận	778
27481	Phường Tân Quy	778
27556	Xã Tân Thông Hội	783
27565	Xã Nhị Bình	784
27574	Xã Thới Tam Thôn	784
27646	Xã Phước Kiển	786
27658	Xã Long Thới	786
27661	Xã Hiệp Phước	786
27799	Xã Bình Tân	795
27817	Xã Thạnh Hưng	795
27724	Xã Hưng Hà	796
27811	Xã Bình Hòa Đông	798
27823	Xã Tân Thành	798
27832	Xã Hậu Thạnh Tây	799
27907	Xã Mỹ Quý Tây	801
27910	Xã Mỹ Thạnh Tây	801
27925	Xã Bình Hòa Nam	801
27979	Xã Hòa Khánh Nam	802
27991	Thị trấn Bến Lức	803
28006	Xã Tân Hòa	803
28066	Xã Mỹ Phú	804
28087	Xã Lạc Tấn	805
28099	Xã Bình Tịnh	805
28165	Xã Long Thượng	807
28183	Xã Phước Lâm	807
28195	Xã Phước Vĩnh Đông	807
28258	Phường 3	815
28276	Phường 10	815
28282	Xã Đạo Thạnh	815
28437	Phường 3	817
28468	Xã Tân Hội	817
28480	Xã Thanh Hòa	817
28375	Xã Hậu Mỹ Phú	819
28399	Xã Hòa Khánh	819
28405	Xã Mỹ Đức Đông	819
28498	Xã Long Tiên	820
28528	Xã Tân Lý Đông	821
28534	Xã Thân Cửu Nghĩa	821
28597	Xã Trung Hòa	822
28624	Xã Đăng Hưng Phước	822
28630	Xã Song Bình	822
28702	Thị trấn Tân Hòa	824
28735	Xã Bình Ân	824
28738	Xã Tân Điền	824
28789	Xã Bình Phú	829
28819	Xã Phú Túc	831
28822	Xã Phú Đức	831
28888	Xã Phú Sơn	832
28939	Xã Đa Phước Hội	833
28942	Xã Phước Hiệp	833
29014	Xã Sơn Phú	834
29035	Xã Tân Thanh	834
29041	Xã Thạnh Phú Đông	834
29107	Xã Thới Thuận	835
29125	Xã Bảo Thạnh	836
29128	Xã An Phú Trung	836
29203	Xã Thới Thạnh	837
29218	Xã An Quy	837
29224	Xã An Nhơn	837
29251	Phường 6	842
29266	Thị trấn Càng Long	844
29275	Xã An Trường	844
29338	Xã Thạnh Phú	845
29353	Xã Hiếu Trung	846
29362	Xã Tân Hùng	846
29425	Xã Mỹ Long Nam	848
29443	Xã Long Sơn	848
29446	Xã Nhị Trường	848
29500	Xã Đôn Châu	850
29512	Phường 1	851
29518	Xã Long Hữu	851
29596	Xã Phước Hậu	857
29611	Xã Phú Quới	857
29623	Xã Mỹ An	858
29686	Xã Hiếu Phụng	859
29707	Xã Trung An	859
29710	Xã Hiếu Nhơn	859
29806	Xã Thuận An	861
29824	Xã Xuân Hiệp	862
29827	Xã Nhơn Bình	862
29866	Phường 1	866
29878	Phường 6	866
29888	Phường Mỹ Phú	866
29989	Phường An Bình A	868
29938	Xã Tân Thành A	869
29956	Xã Thường Phước 1	870
30028	Xã Phú Ninh	871
25195	Phường Tân Phú	689
25210	Phường Tiến Thành	689
25288	Xã Lộc Thuận	692
25306	Xã Lộc Khánh	692
25366	Xã Thuận Lợi	695
25390	Xã Đồng Tiến	695
25441	Xã Minh Hưng	697
25246	Xã Long Hưng	698
25501	Xã Thạnh Tây	705
25525	Xã Tân Hội	706
25591	Xã Phước Vinh	708
25615	Xã An Bình	708
25681	Thị trấn Bến Cầu	711
25705	Xã An Thạnh	711
25771	Phường Tương Bình Hiệp	718
25831	Xã Hưng Hòa	719
25861	Xã An Linh	722
25882	Xã Vĩnh Hoà	722
25966	Phường Lái Thiêu	725
25990	Phường Vĩnh Phú	725
26029	Phường Thống Nhất	731
26053	Phường Bửu Hòa	731
26107	Xã Bàu Trâm	732
26131	Xã Tà Lài	734
26200	Xã Mã Đà	735
26221	Xã Phú Hòa	736
26284	Xã Đồi 61	737
26311	Xã Quang Trung	738
26389	Xã Long Đức	740
26413	Xã Long Phước	740
26485	Xã Phú Hội	742
26503	Xã Phước An	742
26563	Phường Long Hương	748
26575	Thị trấn Ngãi Giao	750
26650	Xã Hòa Hội	751
26668	Xã Tam Phước	752
26737	Phường Đa Kao	760
26758	Phường Nguyễn Cư Trinh	760
26893	Phường 04	764
26914	Phường 26	765
26974	Phường 13	766
27004	Phường 14	766
27061	Phường 02	768
26806	Phường Tam Phú	769
26857	Phường Long Phước	769
27127	Phường 14	770
27145	Phường 10	770
27178	Phường 10	771
27220	Phường 03	772
27238	Phường 07	772
27277	Phường 18	773
27313	Phường 02	774
27334	Phường 05	774
27370	Phường 01	775
27406	Phường 10	776
27421	Phường 14	776
27460	Phường  An Lạc	777
27496	Thị trấn Củ Chi	783
27511	Xã Nhuận Đức	783
27553	Xã Tân Phú Trung	783
27583	Xã Xuân Thới Đông	784
27604	Xã Vĩnh Lộc B	785
27643	Thị trấn Nhà Bè	786
27676	Xã Thạnh An	787
27692	Phường Tân Khánh	794
27790	Xã Thạnh Trị	795
27736	Xã Hưng Thạnh	796
27751	Xã Vĩnh Châu A	796
27802	Xã Bình Thạnh	798
27844	Xã Nhơn Hoà	799
27859	Xã Nhơn Ninh	799
27898	Thị trấn Đông Thành	801
27937	Thị trấn Đức Hòa	802
27952	Xã Hiệp Hòa	802
28012	Xã An Thạnh	803
28027	Xã Thạnh Đức	803
28045	Xã Long Thuận	804
28105	Xã Nhựt Ninh	805
28126	Xã Long Cang	806
28144	Xã Long Hựu Đông	806
28201	Xã Long Phụng	807
28225	Xã Thuận Mỹ	808
28237	Xã Dương Xuân Hội	808
28567	Xã Phước Thạnh	815
28312	Xã Long Thuận	816
28717	Xã Bình Xuân	816
28324	Xã Tân Hòa Đông	818
28348	Xã Tân Hòa Tây	818
28363	Xã Hậu Mỹ Bắc B	819
28417	Xã Tân Hưng	819
28444	Xã Phú Cường	820
28471	Xã Bình Phú	820
28543	Xã Nhị Bình	821
28564	Xã Bình Trưng	821
28579	Xã Bình Đức	821
28639	Xã An Thạnh Thủy	822
28663	Xã Thành Công	823
28672	Xã Thạnh Trị	823
28690	Xã Tân Thới	825
28762	Phường 6	829
28768	Phường 5	829
28831	Xã Tam Phước	831
28861	Xã Tiên Thủy	831
28864	Xã Sơn Hòa	831
28951	Xã An Thạnh	833
28984	Thị trấn Giồng Trôm	834
28996	Xã Châu Hòa	834
29050	Thị trấn Bình Đại	835
29080	Xã Định Trung	835
29083	Xã Thới Lai	835
29137	Xã Phước Ngãi	836
29173	Xã An Đức	836
29176	Xã An Hòa Tây	836
29227	Xã Giao Thạnh	837
28921	Xã Thành An	838
28933	Xã Tân Bình	838
29278	Xã Huyền Hội	844
29305	Xã Đức Mỹ	844
29320	Xã Hoà Tân	845
29368	Xã Ngãi Hùng	846
29398	Xã Hòa Thuận	847
29413	Xã Long Hòa	847
29461	Thị trấn Trà Cú	849
29482	Xã Kim Sơn	849
29494	Xã Định An	849
29542	Phường 9	855
29563	Phường Tân Ngãi	855
29578	Xã Đồng Phú	857
29635	Xã Long Mỹ	858
29653	Xã Tân Long	858
29671	Xã Trung Chánh	859
29725	Xã Phú Thịnh	860
29743	Xã Hòa Hiệp	860
29761	Xã Loan Mỹ	860
29842	Xã Hựu Thành	862
29860	Xã Tích Thiện	862
29791	Xã Thành Lợi	863
29896	Xã Tân Thuận Đông	866
29911	Phường 2	867
29959	Xã Bình Thạnh	868
29977	Xã Thường Lạc	870
29995	Xã Phú Thuận B	870
30019	Xã An Hòa	871
30073	Xã Thanh Mỹ	872
25198	Phường Tân Đồng	689
25320	Phường Hưng Chiến	690
25292	Xã Lộc Phú	692
25308	Thị trấn Thanh Bình	693
25372	Xã Tân Phước	695
25393	Xã Tân Tiến	695
25447	Xã Minh Thành	697
25250	Xã Phước Tân	698
25507	Xã Tân Phong	705
25528	Xã Tân Hòa	706
25597	Xã Thái Bình	708
25621	Xã Thành Long	708
25687	Xã Long Phước	711
25708	Phường Trảng Bàng	712
25816	Xã Trừ Văn Thố	719
25834	Xã Lai Hưng	719
25865	Xã An Thái	722
25879	Xã Tân Long	722
25975	Phường An Phú	725
25984	Phường Bình Nhâm	725
26032	Phường Trung Dũng	731
26044	Phường Thanh Bình	731
26110	Phường Xuân Tân	732
26119	Xã Dak Lua	734
26197	Xã Bình Hòa	735
26206	Thị trấn Định Quán	736
26290	Xã Quảng Tiến	737
26299	Xã Gia Tân 1	738
26395	Xã Bình Sơn	740
26401	Xã Cẩm Đường	740
26488	Xã Phú Thạnh	742
26494	Xã Long Thọ	742
26567	Xã Tân Hưng	748
26572	Xã Hoà Long	748
26656	Xã Bình Châu	751
26662	Thị trấn Long Hải	752
26746	Phường Nguyễn Thái Bình	760
26752	Phường Cầu Ông Lãnh	760
26899	Phường 11	764
26908	Phường 11	765
26989	Phường 05	766
26998	Phường 08	766
27085	Phường 13	768
26800	Phường Linh Trung	769
27094	Phường An Khánh	769
27118	Phường Thủ Thiêm	769
27199	Phường 05	771
27217	Phường 11	772
27301	Phường 04	774
27316	Phường 08	774
27394	Phường 01	776
27409	Phường 04	776
27484	Phường Phú Thuận	778
27493	Phường Phú Mỹ	778
27571	Xã Tân Thới Nhì	784
27586	Xã Trung Chánh	784
27664	Thị trấn Cần Thạnh	787
27673	Xã An Thới Đông	787
27721	Thị trấn Tân Hưng	796
27733	Xã Thạnh Hưng	796
27829	Xã Bắc Hòa	799
27841	Xã Hậu Thạnh Đông	799
27916	Xã Bình Thành	801
27928	Xã Mỹ Bình	801
27973	Xã Hòa Khánh Đông	802
28015	Xã Bình Đức	803
28060	Xã Mỹ An	804
28111	Xã Long Trạch	806
28153	Xã Long Hựu Tây	806
28210	Thị trấn Tầm Vu	808
28246	Xã Thanh Vĩnh Đông	808
28297	Phường 2	816
28435	Phường 1	817
28336	Xã Phú Mỹ	818
28369	Xã Mỹ Trung	819
28429	Xã An Hữu	819
28492	Xã Phú An	820
28561	Xã Long Hưng	821
28588	Xã Phú Phong	821
28657	Xã Bình Phú	823
28681	Xã Bình Tân	823
28756	Phường Phú Khương	829
28786	Xã Phú Hưng	829
28849	Xã An Hóa	831
28885	Xã Long Thới	832
28975	Xã Ngãi Đăng	833
29011	Xã Thuận Điền	834
29071	Xã Châu Hưng	835
29101	Xã Thừa Đức	835
29161	Xã An Hiệp	836
29194	Xã Tân Phong	837
28909	Xã Thạnh Ngãi	838
29245	Phường 2	842
29293	Xã Đại Phúc	844
29335	Xã Thông Hòa	845
29386	Xã Lương Hoà A	847
29428	Xã Mỹ Hòa	848
29479	Xã Ngãi Xuyên	849
29513	Thị trấn Long Thành	850
29560	Phường 8	855
29593	Xã Tân Hạnh	857
29656	Xã Tân Long Hội	858
29689	Xã Trung Thành Đông	859
29746	Xã Mỹ Lộc	860
29809	Xã Đông Thạnh	861
29773	Xã Tân Hưng	863
29863	Phường 11	866
29919	Phường An Hoà	867
29926	Thị trấn Sa Rài	869
29944	Xã Tân Phước	869
30004	Xã Hoà Bình	871
30034	Xã Phú Thành A	871
30052	Xã Mỹ Hòa	872
30097	Xã Nhị Mỹ	873
30127	Xã Bình Thạnh	873
30145	Xã Tân Mỹ	874
30187	Xã Vĩnh Thạnh	875
30217	Xã Long Hậu	876
30235	Xã Tân Hòa	876
30274	Xã Tân Phú	877
30307	Phường Mỹ Hòa	883
30319	Phường Châu Phú A	884
30358	Xã Phước Hưng	886
30388	Xã Tân An	887
30394	Phường Long Phú	887
30439	Xã Phú Xuân	888
30478	Thị trấn Vĩnh Thạnh Trung	889
30481	Xã Thạnh Mỹ Tây	889
30532	Xã Vĩnh Trung	890
30565	Xã Lương Phi	891
30571	Xã Tà Đảnh	891
30619	Xã Vĩnh Nhuận	892
30658	Xã Nhơn Mỹ	893
30664	Xã Long Kiến	893
30700	Xã Phú Thuận	894
30742	Phường Vĩnh Bảo	899
30751	Phường An Bình	899
30790	Xã Kiên Bình	902
30832	Xã Mỹ Hiệp Sơn	903
30841	Xã Thổ Sơn	903
30880	Thị trấn Minh Lương	905
30910	Xã Thạnh Phước	906
30917	Xã Thạnh Bình	906
30958	Xã Định Hòa	907
25204	Phường Tân Xuân	689
25333	Xã Thanh Lương	690
25294	Xã Lộc Thành	692
25315	Xã Thanh Hòa	693
25375	Xã Tân Hưng	695
25400	Xã Phú Sơn	696
25450	Xã Nha Bích	697
25261	Xã Phú Trung	698
25510	Xã Mỏ Công	705
25540	Xã Thạnh Đông	706
25603	Xã Biên Giới	708
25630	Phường Long Hoa	709
25693	Xã Tiên Thuận	711
25720	Phường Gia Lộc	712
25822	Thị trấn Lai Uyên	719
25783	Xã Minh Thạnh	720
25867	Xã An Long	722
25891	Phường Tân Phước Khánh	723
25978	Phường Hưng Định	725
25897	Xã Bình Mỹ	726
26038	Phường Hòa Bình	731
26059	Phường Tân Vạn	731
26113	Xã Hàng Gòn	732
26134	Xã Phú Lập	734
26203	Xã Hiếu Liêm	735
26224	Xã Ngọc Định	736
26293	Xã Giang Điền	737
26317	Xã Hưng Lộc	738
26392	Xã Lộc An	740
26422	Xã Phước Thái	740
26482	Xã Phú Hữu	742
26512	Phường 3	747
26560	Phường Phước Trung	748
26587	Xã Sơn Bình	750
26644	Xã Hòa Hưng	751
26674	Xã Phước Tỉnh	752
26731	Xã Tóc Tiên	754
26764	Phường Thạnh Xuân	761
26887	Phường 05	764
26917	Phường 12	765
26971	Phường 12	766
27010	Phường Tân Sơn Nhì	767
27064	Phường 08	768
26812	Phường Hiệp Bình Chánh	769
26866	Phường Phú Hữu	769
27130	Phường 12	770
27190	Phường 02	771
27223	Phường 10	772
27289	Phường 16	773
27322	Phường 07	774
27382	Phường 07	775
27418	Phường 05	776
27469	Phường Tân Thuận Tây	778
27505	Xã Trung Lập Thượng	783
27559	Thị trấn Hóc Môn	784
27592	Xã Bà Điểm	784
27649	Xã Phước Lộc	786
27682	Xã Lý Nhơn	787
27793	Xã Bình Hiệp	795
27745	Xã Vĩnh Lợi	796
27814	Thị trấn Bình Phong Thạnh	798
27853	Xã Tân Bình	799
27904	Xã Mỹ Thạnh Bắc	801
27940	Xã Lộc Giang	802
27982	Xã Đức Hòa Đông	802
28033	Xã Nhựt Chánh	803
28075	Thị trấn Tân Trụ	805
28129	Xã Long Sơn	806
28168	Xã Long Hậu	807
28222	Xã Vĩnh Công	808
28264	Phường 2	815
28303	Phường 1	816
28450	Xã Mỹ Hạnh Đông	817
28333	Xã Thạnh Hoà	818
28384	Xã Thiện Trung	819
28426	Xã An Thái Trung	819
28510	Xã Tân Phong	820
28552	Xã Long Định	821
28606	Xã Tân Bình Thạnh	822
28648	Xã Bình Ninh	822
28705	Xã Tăng Hoà	824
28699	Xã Tân Thạnh	825
28795	Xã Nhơn Thạnh	829
28846	Xã Phước Thạnh	831
28894	Xã Vĩnh Thành	832
28972	Xã Minh Đức	833
29023	Xã Hưng Phong	834
29065	Xã Vang Quới Tây	835
29113	Xã Tân Mỹ	836
29158	Xã An Ngãi Tây	836
29212	Xã Bình Thạnh	837
28912	Xã Tân Phú Tây	838
29263	Xã Long Đức	842
29299	Xã Nhị Long Phú	844
29350	Xã Hiếu Tử	846
29392	Xã Song Lộc	847
29437	Xã Hiệp Hòa	848
29473	Xã An Quảng Hữu	849
29536	Xã Đông Hải	850
29557	Phường 3	855
29608	Xã Long An	857
29650	Xã Tân An Hội	858
29701	Xã Hiếu Thuận	859
29740	Xã Song Phú	860
29818	Xã Đông Thành	861
29854	Xã Thiện Mỹ	862
29875	Phường 3	866
29905	Phường 1	867
29935	Xã Bình Phú	869
29980	Xã Long Khánh A	870
30025	Xã Phú Cường	871
30040	Xã Thạnh Lợi	872
30076	Thị trấn Mỹ Thọ	873
30115	Xã Mỹ Long	873
30133	Xã Tân Quới	874
30154	Xã Tân Bình	874
30208	Thị trấn Lai Vung	876
30223	Xã Hòa Long	876
30247	Xã An Hiệp	877
30298	Phường Mỹ Quý	883
30304	Phường Mỹ Thạnh	883
30331	Xã Vĩnh Tế	884
30378	Phường Long Châu	887
30382	Xã Vĩnh Xương	887
30406	Thị trấn Phú Mỹ	888
30466	Xã Khánh Hòa	889
30472	Xã Mỹ Phú	889
30502	Thị trấn Nhà Bàng	890
30556	Xã Vĩnh Gia	891
30559	Xã Vĩnh Phước	891
30589	Thị trấn An Châu	892
30643	Xã Tấn Mỹ	893
30646	Xã Long Điền B	893
30679	Xã Hòa An	893
30730	Phường Vĩnh Thanh Vân	899
30733	Phường Vĩnh Thanh	899
30763	Xã Phi Thông	899
30826	Xã Bình Giang	903
30828	Xã Mỹ Thái	903
30853	Xã Tân Hội	904
30895	Xã Minh Hòa	905
30898	Xã Bình An	905
30934	Xã Hòa Hưng	906
30976	Xã Vĩnh Phước B	907
25336	Xã Thanh Phú	690
25318	Xã Tân Thành	693
25402	Xã Thọ Sơn	696
25264	Xã Phú Riềng	698
25543	Xã Tân Thành	706
25633	Phường Hiệp Tân	709
25723	Phường Gia Bình	712
25798	Xã Định Hiệp	720
25920	Phường Tân Hiệp	723
25906	Thị trấn Tân Thành	726
26062	Phường Tân Hạnh	731
26143	Xã Thanh Sơn	734
26236	Xã Phú Cường	736
26326	Thị trấn Dầu Giây	738
26428	Xã Xuân Bắc	741
26518	Phường 5	747
26590	Xã Bình Giã	750
26683	Xã Phước Long Thọ	753
26767	Phường Thạnh Lộc	761
26926	Phường 07	765
27019	Phường Tân Quý	767
26821	Phường Linh Đông	769
27142	Phường 09	770
27235	Phường 12	772
27337	Phường 06	774
27424	Phường 06	776
27514	Xã Phạm Văn Cội	783
27601	Xã Vĩnh Lộc A	785
27691	Phường 4	794
27754	Xã Vĩnh Bửu	796
27856	Xã Tân Ninh	799
27946	Xã An Ninh Tây	802
28039	Xã Long Thạnh	804
28132	Xã Tân Trạch	806
28231	Xã Phước Tân Hưng	808
28318	Xã Long Hòa	816
28357	Xã Phước Lập	818
28456	Xã Mỹ Thành Nam	820
28576	Xã Vĩnh Kim	821
28675	Xã Thạnh Nhựt	823
28777	Phường An Hội	829
28876	Xã Sơn Định	832
29005	Xã Lương Phú	834
29095	Xã Thạnh Trị	835
29188	Xã Đại Điền	837
29242	Phường 3	842
29332	Xã Tam Ngãi	845
29419	Thị trấn Mỹ Long	848
29509	Xã Tân Hiệp	849
29581	Xã Bình Hòa Phước	857
29677	Xã Thanh Bình	859
29767	Xã Bình Ninh	860
29797	Xã Tân Bình	863
29978	Phường An Lạc	868
30022	Xã An Long	871
30046	Xã Trường Xuân	872
30112	Xã Mỹ Hiệp	873
30139	Xã An Phong	874
30190	Xã Long Hưng B	875
30226	Xã Tân Thành	876
30280	Phường Mỹ Bình	883
30316	Phường Châu Phú B	884
30364	Xã Vĩnh Hậu	886
30397	Xã Châu Phong	887
30445	Xã Phú Bình	888
30493	Xã Đào Hữu Cảnh	889
30535	Xã Tân Lợi	890
30583	Xã Tân Tuyến	891
30625	Xã Vĩnh Thành	892
30670	Xã An Thạnh Trung	893
30712	Xã Mỹ Phú Đông	894
30760	Phường Vĩnh Thông	899
30809	Xã Bình Trị	902
30844	Xã Mỹ Lâm	903
30883	Xã Mong Thọ A	905
30922	Xã Bàn Tân Định	906
30955	Xã Vĩnh Hòa Hưng Bắc	907
31006	Xã Đông Thái	908
31060	Xã Vĩnh Bình Bắc	910
31105	Xã Thổ Châu	911
30797	Xã Phú Lợi	914
31156	Phường Thới Long	917
31195	Phường Ba Láng	919
31211	Xã Vĩnh Bình	924
31274	Xã Đông Thắng	925
31268	Xã Tân Thạnh	927
31339	Xã Hoả Tiến	930
31357	Xã Nhơn Nghĩa A	932
31417	Xã Phụng Hiệp	934
31450	Xã Vị Thắng	935
31475	Phường Vĩnh Tường	937
31519	Phường 3	941
31546	Xã Ba Trinh	943
31633	Xã An Thạnh 3	945
31729	Xã Hòa Tú II	947
31759	Xã Lâm Tân	949
31792	Xã Vĩnh Hiệp	950
31681	Xã Trung Bình	951
31831	Phường Nhà Mát	954
31834	Xã Vĩnh Trạch	954
31948	Xã Phong Thạnh Đông	959
31951	Phường Láng Tròn	959
32008	Phường 5	964
32011	Phường 2	964
32083	Xã Tân Lộc Bắc	967
32089	Xã Tân Lộc Đông	967
32167	Xã Tân Thuận	970
32173	Xã Tân Duyệt	970
32242	Xã Viên An	973
32248	Xã Đất Mũi	973
25222	Xã Bù Gia Mập	691
25321	Xã Tân Tiến	693
25404	Xã Bình Minh	696
25456	Phường 1	703
25546	Xã Tân Phú	706
25636	Phường Long Thành Bắc	709
25732	Phường An Tịnh	712
25801	Xã An Lập	720
25933	Phường Tân Vĩnh Hiệp	723
25927	Xã Thường Tân	726
26071	Phường Xuân Trung	732
26167	Xã Phú Điền	734
26260	Xã Sông Thao	737
26347	Xã Thừa Đức	739
26455	Xã Xuân Hiệp	741
26535	Phường Rạch Dừa	747
26611	Xã Suối Rao	750
26698	Xã Láng Dài	753
26785	Phường Trung Mỹ Tây	761
26962	Phường 28	765
27055	Phường 03	768
26863	Phường Phước Bình	769
27181	Phường 09	771
27280	Phường 14	773
27373	Phường 04	775
27463	Phường An Lạc A	777
27550	Xã Bình Mỹ	783
27640	Xã Quy Đức	785
27787	Phường 1	795
27796	Xã Bình Hòa Tây	798
27892	Xã Tân Đông	800
27970	Xã Hòa Khánh Tây	802
28063	Xã Bình Thạnh	804
28159	Thị trấn Cần Giuộc	807
28255	Phường 7	815
28440	Phường 5	817
28378	Xã Mỹ Tân	819
28504	Xã Long Trung	820
28600	Xã Hòa Tịnh	822
28687	Xã Long Bình	823
28792	Xã Mỹ Thạnh An	829
28882	Xã Hòa Nghĩa	832
29002	Xã Lương Quới	834
29089	Xã Phú Long	835
29182	Thị trấn Thạnh Phú	837
28948	Xã Khánh Thạnh Tân	838
29326	Xã Phong Phú	845
29416	Thị trấn Cầu Ngang	848
29506	Xã Long Hiệp	849
29587	Xã An Bình	857
29683	Xã Trung Hiệp	859
29770	Phường Cái Vồn	861
29800	Thị trấn Tân Quới	863
29986	Phường An Bình B	868
30031	Xã Phú Thọ	871
30061	Xã Đốc Binh Kiều	872
30118	Xã Bình Hàng Trung	873
30169	Thị trấn Lấp Vò	875
30211	Xã Tân Dương	876
30262	Xã Phú Long	877
30295	Phường Mỹ Phước	883
30349	Xã Nhơn Hội	886
30379	Xã Phú Lộc	887
30430	Xã Hoà Lạc	888
30463	Thị trấn Cái Dầu	889
30520	Thị trấn Tịnh Biên	890
30550	Xã Lạc Quới	891
30610	Xã Vĩnh An	892
30637	Xã Mỹ Hội Đông	893
30697	Xã Vĩnh Trạch	894
30724	Xã Bình Thành	894
30787	Thị trấn Kiên Lương	902
30823	Xã Bình Sơn	903
30871	Xã Tân An	904
30901	Xã Thạnh Lộc	905
30949	Xã  Hòa Thuận	906
30982	Xã Vĩnh Thắng	907
31042	Xã Vân Khánh	909
31078	Phường Dương Đông	911
30791	Xã Vĩnh Phú	914
31144	Phường Xuân Khánh	916
31183	Phường Long Tuyền	918
31217	Phường Thạnh Hoà	923
31255	Xã Trung Hưng	925
31309	Xã Trường Long	926
31330	Phường VII	930
31411	Xã Đại Thành	931
31396	Thị trấn Cây Dương	934
31429	Xã Hiệp Hưng	934
31493	Xã Lương Nghĩa	936
31480	Xã Long Phú	937
31534	Xã Xuân Hòa	943
31579	Xã Long Hưng	944
31621	Xã An Thạnh Tây	945
31657	Xã Phú Hữu	946
31720	Xã Gia Hòa 1	947
31753	Xã Mỹ Quới	948
31789	Phường Khánh Hòa	950
31675	Xã Liêu Tú	951
31819	Phường 5	954
31879	Xã Hưng Phú	957
31912	Xã Châu Thới	958
31993	Xã Định Thành	960
31936	Xã Vĩnh Thịnh	961
32053	Xã Nguyễn Phích	966
32072	Xã Trí Lực	967
32130	Xã Thạnh Phú	969
32152	Thị trấn Đầm Dơi	970
32201	Xã Lâm Hải	971
32228	Xã Rạch Chèo	972
25225	Xã Đak Ơ	691
25327	Xã Thanh An	694
25405	Xã Bom Bo	696
25459	Phường 3	703
25549	Xã Tân Hưng	706
25639	Xã Trường Hòa	709
25729	Xã Phước Bình	712
25792	Xã Long Hoà	720
25921	Phường Khánh Bình	723
25909	Xã Lạc An	726
26374	Phường Tam Phước	731
26155	Xã Phú Lâm	734
26248	Thị trấn Trảng Bom	737
26332	Xã Xuân Quế	739
26434	Xã Xuân Thành	741
26521	Phường Thắng Nhì	747
26596	Xã Xà Bang	750
26689	Xã Long Mỹ	753
26779	Phường An Phú Đông	761
26935	Phường 14	765
27028	Phường Phú Thạnh	767
26830	Phường Long Bình	769
27154	Phường 03	770
27247	Phường 01	772
27346	Phường 14	775
27439	Phường Bình Hưng Hoà A	777
27532	Xã Tân An Hội	783
27619	Xã Bình Hưng	785
27703	Xã Hướng Thọ Phú	794
27766	Xã Thái Trị	797
27877	Xã Thạnh Phú	800
27976	Xã Mỹ Hạnh Nam	802
28072	Xã Tân Long	804
28162	Xã Phước Lý	807
28261	Phường 1	815
28447	Xã Mỹ Phước Tây	817
28381	Xã Mỹ Lợi B	819
28507	Xã Hội Xuân	820
28603	Xã Mỹ Tịnh An	822
28711	Xã Tân Phước	824
28798	Xã Phú Nhuận	829
28891	Xã Tân Thiềng	832
29017	Xã Bình Hoà	834
29104	Xã Thạnh Phước	835
29197	Xã Mỹ Hưng	837
29248	Phường 5	842
29344	Thị trấn Cầu Quan	846
29431	Xã Vĩnh Kim	848
29530	Xã Ngũ Lạc	850
29599	Xã Long Phước	857
29692	Xã Trung Thành	859
29813	Phường Đông Thuận	861
29869	Phường 2	866
29932	Xã Thông Bình	869
30043	Xã Hưng Thạnh	872
30088	Xã Phong Mỹ	873
30130	Thị trấn Thanh Bình	874
30172	Xã Mỹ An Hưng A	875
30220	Xã Tân Phước	876
30256	Xã Tân Bình	877
30310	Xã Mỹ Khánh	883
30343	Xã Khánh Bình	886
30387	Xã Tân Thạnh	887
30421	Xã Phú Lâm	888
30475	Xã Ô Long Vỹ	889
30514	Xã An Phú	890
30568	Xã Lương An Trà	891
30607	Xã Bình Hòa	892
30655	Xã Mỹ An	893
30692	Xã An Bình	894
30745	Phường Vĩnh Lạc	899
30778	Phường Mỹ Đức	900
30838	Xã Mỹ Thuận	903
30868	Xã Tân Hiệp A	904
30913	Xã Thạnh Lộc	906
30946	Xã Vĩnh Thạnh	906
30994	Xã Nam Yên	908
31033	Xã Đông Hưng	909
31093	Xã Hàm Ninh	911
31015	Xã Thạnh Yên A	913
31149	Phường An Khánh	916
31169	Phường Trà An	918
31216	Phường Trung Nhứt	923
31244	Xã Thạnh Lợi	924
31312	Xã Mỹ Khánh	926
31321	Phường III	930
31345	Xã Tân Hoà	932
31379	Xã Phú Tân	933
31433	Thị trấn Búng Tàu	934
31484	Xã Thuận Hòa	936
31498	Phường 5	941
31585	Xã Thiện Mỹ	942
31588	Xã Hưng Phú	944
31606	Xã Thuận Hưng	944
31660	Xã Tân Hưng	946
31684	Thị trấn Mỹ Xuyên	947
31732	Phường 1	948
31762	Xã Thạnh Tân	949
31795	Xã Vĩnh Hải	950
31679	Thị trấn Lịch Hội Thượng	951
31837	Xã Vĩnh Trạch Đông	954
31867	Thị trấn Phước Long	957
31945	Phường Hộ Phòng	959
31984	Xã Long Điền Tây	960
32002	Phường 4	964
32035	Xã Định Bình	964
32077	Xã Thới Bình	967
32110	Xã Khánh Bình	968
32155	Xã Tạ An Khương	970
32185	Xã Thanh Tùng	970
32227	Xã Tân Hưng Tây	972
25231	Xã Đa Kia	691
25342	Xã Tân Lợi	694
25414	Xã Đồng Nai	696
25468	Phường 2	703
25558	Xã Phan	707
25648	Xã Trường Tây	709
25744	Phường Phú Lợi	718
25807	Xã Thanh An	720
25937	Xã Thạnh Hội	723
25999	Phường Tân Biên	731
26077	Phường Xuân Bình	732
26164	Xã Trà Cổ	734
26254	Xã Cây Gáo	737
26341	Thị trấn Long Giao	739
26449	Xã Xuân Tâm	741
26530	Phường 9	747
26608	Xã Kim Long	750
26701	Xã Lộc An	753
26787	Phường Tân Hưng Thuận	761
26965	Phường 02	766
27052	Phường 07	768
26854	Phường Trường Thạnh	769
27172	Phường 12	771
27268	Phường 08	773
27364	Phường 11	775
27451	Phường Bình Trị Đông B	777
27541	Xã Tân Thạnh Tây	783
27628	Xã Hưng Long	785
27715	Phường Khánh Hậu	794
27784	Xã Tuyên Bình Tây	797
27895	Xã Thạnh An	800
28000	Xã Thạnh Hòa	803
28096	Xã Bình Lãng	805
28189	Xã Thuận Thành	807
28279	Phường Tân Long	815
28477	Xã Nhị Quý	817
28396	Xã Mỹ Lợi A	819
28519	Thị trấn Tân Hiệp	821
28612	Xã Lương Hòa Lạc	822
28714	Xã Gia Thuận	824
28801	Thị trấn Châu Thành	831
28897	Xã Vĩnh Hòa	832
29020	Xã Phước Long	834
29110	Thị trấn Ba Tri	836
29200	Xã An Thạnh	837
29254	Phường 7	842
29341	Thị trấn Tiểu Cần	846
29434	Xã Kim Hòa	848
29521	Xã Long Khánh	850
29602	Xã Phú Đức	857
29695	Xã Trung Hiếu	859
29812	Xã Đông Bình	861
29872	Phường 4	866
29929	Xã Tân Hộ Cơ	869
30037	Thị trấn Mỹ An	872
30106	Xã An Bình	873
30124	Xã Bình Hàng Tây	873
30178	Xã Mỹ An Hưng B	875
30214	Xã Hòa Thành	876
30265	Xã An Phú Thuận	877
30301	Phường Mỹ Thới	883
30352	Xã Phú Hữu	886
30385	Xã Vĩnh Hòa	887
30436	Xã Phú An	888
30469	Xã Mỹ Đức	889
30526	Xã An Cư	890
30562	Xã Châu Lăng	891
30613	Xã Hòa Bình Thạnh	892
30652	Xã Mỹ Hiệp	893
30706	Xã Định Mỹ	894
30739	Phường Vĩnh Hiệp	899
30802	Xã Hòa Điền	902
30835	Xã Sơn Kiên	903
30874	Xã Thạnh Đông A	904
30907	Xã Thạnh Hưng	906
30952	Thị trấn Gò Quao	907
30988	Xã Tây Yên	908
31051	Thị trấn Vĩnh Thuận	910
31084	Xã Cửa Cạn	911
30799	Xã Phú Mỹ	914
31147	Phường Hưng Lợi	916
31207	Phường Thốt Nốt	923
31210	Phường Thới Thuận	923
31277	Xã Thới Xuân	925
31303	Xã Giai Xuân	926
31340	Phường Ngã Bảy	931
31343	Phường Hiệp Thành	931
31408	Xã Long Thạnh	934
31426	Xã Phương Bình	934
31471	Phường Thuận An	937
31477	Xã Long Trị	937
31540	Xã An Lạc Tây	943
31552	Xã Nhơn Mỹ	943
31624	Xã An Thạnh Đông	945
31636	Xã An Thạnh Nam	945
31714	Xã Thạnh Quới	947
31726	Xã Gia Hòa 2	947
31747	Phường 3	948
31757	Thị trấn Hưng Lợi	949
31777	Xã Vĩnh Lợi	949
31783	Phường 1	950
31810	Xã Lai Hòa	950
31673	Thị trấn Trần Đề	951
31705	Xã Viên Bình	951
31816	Phường 3	954
31897	Xã Vĩnh Hưng A	958
31906	Xã Hưng Thành	958
31924	Xã Vĩnh Mỹ B	961
31927	Xã Vĩnh Hậu	961
32062	Xã Khánh Hội	966
32069	Xã Tân Bằng	967
32137	Xã Tân Hưng	969
32143	Xã Đông Thới	969
32214	Xã Phú Thuận	972
32221	Xã Tân Hải	972
25232	Xã Phước Minh	691
25345	Xã Tân Hưng	694
25417	Xã Đức Liễu	696
25471	Xã Thạnh Tân	703
25561	Xã Phước Ninh	707
25651	Xã Long Thành Nam	709
25741	Phường Hiệp Thành	718
25780	Xã Minh Hoà	720
25885	Xã Phước Hoà	722
25894	Xã Tân Định	726
26050	Phường An Bình	731
26125	Xã Phú An	734
26215	Xã Phú Vinh	736
26305	Xã Gia Tân 3	738
26404	Xã Long An	740
26491	Xã Phú Đông	742
26566	Phường Kim Dinh	748
26647	Xã Hòa Hiệp	751
26734	Phường Tân Định	760
26890	Phường 07	764
26977	Phường 01	766
27067	Phường 15	768
27091	Phường An Phú	769
27193	Phường 04	771
27292	Phường 02	773
27388	Phường 08	776
27475	Phường Tân Hưng	778
27568	Xã Đông Thạnh	784
27655	Xã Phú Xuân	786
27805	Xã Tuyên Thạnh	795
27820	Xã Tân Lập	798
27913	Xã Mỹ Thạnh Đông	801
28009	Xã Tân Bửu	803
28108	Thị trấn Cần Đước	806
28198	Xã Long An	807
28288	Xã Mỹ Phong	815
28486	Xã Long Khánh	817
28411	Xã Đông Hòa Hiệp	819
28540	Xã Điềm Hy	821
28633	Xã Bình Phan	822
28747	Xã Tân Thành	824
28834	Xã Thành Triệu	831
28963	Xã Tân Trung	833
29056	Xã Long Định	835
29149	Xã An Bình Tây	836
28901	Xã Hưng Khánh Trung A	838
29290	Xã Phương Thạnh	844
29380	Xã Mỹ Chánh	847
29470	Xã Tân Sơn	849
29548	Phường 1	855
29638	Xã Hòa Tịnh	858
29728	Xã Hậu Lộc	860
29845	Xã Vĩnh Xuân	862
29902	Phường 3	867
29983	Xã Long Khánh B	870
30082	Xã Phương Thịnh	873
30121	Xã Mỹ Xương	873
30181	Xã Tân  Khánh Trung	875
30202	Xã Hội An Đông	875
30271	Xã An Khánh	877
30292	Phường Bình Khánh	883
30355	Xã Phú Hội	886
30377	Phường Long Hưng	887
30433	Xã Phú Thành	888
30460	Xã Tân Trung	888
30523	Xã Văn Giáo	890
30553	Xã Lê Trì	891
30616	Xã Vĩnh Lợi	892
30649	Xã Kiến Thành	893
30703	Xã Vĩnh Chánh	894
30736	Phường Vĩnh Quang	899
30805	Xã Dương Hòa	902
30829	Xã Nam Thái Sơn	903
30877	Xã Thạnh Trị	904
30904	Thị Trấn Giồng Riềng	906
30950	Xã Ngọc Hoà	906
30991	Xã Tây Yên A	908
31045	Xã Vân Khánh Đông	909
31087	Xã Gành Dầu	911
30796	Xã Tân Khánh Hòa	914
31153	Phường Châu Văn Liêm	917
31189	Phường Hưng Phú	919
31212	Phường Thuận An	923
31261	Thị trấn Cờ Đỏ	925
31300	Xã Nhơn Ái	926
31333	Xã Vị Tân	930
31344	Phường Hiệp Lợi	931
31393	Thị trấn Kinh Cùng	934
31423	Xã Hòa An	934
31492	Xã Lương Tâm	936
31478	Xã Long Trị A	937
31528	Thị trấn Kế Sách	943
31567	Thị trấn Huỳnh Hữu Nghĩa	944
31612	Xã Phú Mỹ	944
31654	Xã Trường Khánh	946
31690	Xã Đại Tâm	947
31735	Phường 2	948
31765	Xã Lâm Kiết	949
31801	Phường 2	950
31702	Xã Thạnh Thới Thuận	951
31828	Phường 8	954
31900	Thị trấn Châu Hưng	958
31942	Phường 1	959
31918	Xã Vĩnh Bình	961
32005	Phường 1	964
32065	Thị trấn Thới Bình	967
32080	Xã Tân Phú	967
32141	Xã Hoà Mỹ	969
32149	Xã Trần Thới	969
32218	Xã Phú Tân	972
32224	Xã Việt Thắng	972
25234	Xã Bình Thắng	691
25348	Xã Minh Đức	694
25420	Xã Thống Nhất	696
25474	Xã Tân Bình	703
25567	Xã Bàu Năng	707
25657	Xã Thạnh Đức	710
25750	Phường Phú Hòa	718
25837	Phường Chánh Phú Hòa	721
25939	Phường Thái Hòa	723
25996	Phường Tân Phong	731
26074	Phường Xuân Thanh	732
26161	Xã Phú Thanh	734
26245	Xã Suối Nho	736
26335	Xã Nhân Nghĩa	739
26443	Xã Xuân Hòa	741
26526	Phường Nguyễn An Ninh	747
26602	Xã Láng Lớn	750
26695	Xã Long Tân	753
26782	Phường Tân Thới Hiệp	761
26941	Phường 02	765
27031	Phường Phú Trung	767
26836	Phường Tân Phú	769
27160	Phường 01	770
27250	Phường 02	772
27349	Phường 13	775
27436	Phường Bình Hưng Hòa	777
27526	Xã Phước Thạnh	783
27616	Xã Tân Kiên	785
27700	Phường 6	794
27769	Xã Vĩnh Trị	797
27874	Xã Thạnh Phước	800
27964	Xã Mỹ Hạnh Bắc	802
28054	Xã Bình An	804
28147	Xã Tân Ân	806
28243	Xã Long Trì	808
28729	Xã Tân Trung	816
28360	Thị trấn Cái Bè	819
28489	Xã Cẩm Sơn	820
28582	Xã Song Thuận	821
28669	Xã Yên Luông	823
28765	Phường 4	829
28870	Thị trấn Chợ Lách	832
28993	Xã Mỹ Thạnh	834
29086	Xã Bình Thới	835
29179	Xã An Thủy	836
28936	Xã Nhuận Phú Tân	838
29317	Xã An Phú Tân	845
29410	Xã Hòa Minh	847
29503	Xã Ngọc Biên	849
29584	Xã Hòa Ninh	857
29674	Xã Tân An Luông	859
29764	Xã Ngãi Tứ	860
29788	Xã Nguyễn Văn Thảnh	863
29954	Phường An Lộc	868
30013	Xã Phú Đức	871
30100	Xã Mỹ Thọ	873
30136	Xã Tân Hòa	874
30166	Xã Tân Long	874
30229	Xã Long Thắng	876
30259	Xã Tân Phú Trung	877
30313	Xã Mỹ Hoà Hưng	883
30341	Thị Trấn Long Bình	886
30391	Xã Long An	887
30424	Xã Phú Hiệp	888
30484	Xã Bình Long	889
30511	Xã Nhơn Hưng	890
30574	Xã Núi Tô	891
30598	Xã Vĩnh Hanh	892
30661	Xã Long Giang	893
30685	Thị trấn Phú Hoà	894
30748	Phường An Hòa	899
30772	Phường Bình San	900
30836	Xã Sơn Bình	903
30850	Thị trấn Tân Hiệp	904
30916	Xã Thạnh Hòa	906
30925	Xã Ngọc Thành	906
30997	Xã Hưng Yên	908
31021	Xã Thuận Hoà	909
31096	Xã Dương Tơ	911
31115	Xã Nam Du	912
31154	Phường Thới Hòa	917
31165	Phường Trường Lạc	917
31231	Thị trấn Thanh An	924
31240	Xã Thạnh An	924
31270	Xã Xuân Thắng	927
31288	Xã Định Môn	927
31351	Xã Trường Long A	932
31369	Xã Đông Thạnh	933
31438	Xã Tân Long	934
31462	Xã Vị Đông	935
31504	Phường 8	941
31570	Xã Hồ Đắc Kiện	942
31564	Xã An Mỹ	943
31648	Xã Hậu Thạnh	946
31855	Xã Lộc Ninh	956
31858	Xã Vĩnh Lộc	956
31966	Xã Phong Thạnh Tây	959
31975	Xã Long Điền Đông	960
32023	Xã An Xuyên	964
32029	Xã Tắc Vân	964
32098	Thị trấn Sông Đốc	968
32107	Xã Trần Hợi	968
32170	Xã Tạ An Khương  Nam	970
32179	Xã Quách Phẩm Bắc	970
32244	Thị trấn Rạch Gốc	973
25267	Xã Phú Nghĩa	691
25349	Xã Minh Tâm	694
25423	Xã Nghĩa Trung	696
25477	Xã Bình Minh	703
25564	Xã Phước Minh	707
25654	Thị trấn Gò Dầu	710
25747	Phường Phú Cường	718
25810	Xã Thanh Tuyền	720
25936	Phường Thạnh Phước	723
25993	Phường Trảng Dài	731
26377	Phường Phước Tân	731
26152	Xã Phú Lộc	734
26242	Xã Phú Túc	736
26338	Xã Xuân Đường	739
26440	Xã Xuân Trường	741
26527	Phường 8	747
26605	Xã Quảng Thành	750
26692	Thị trấn Phước Hải	753
26776	Phường Tân Chánh Hiệp	761
26929	Phường 24	765
27016	Phường Sơn Kỳ	767
26818	Phường Linh Tây	769
27139	Phường Võ Thị Sáu	770
27229	Phường 08	772
27331	Phường 14	774
27427	Phường 15	776
27520	Xã Trung Lập Hạ	783
27613	Xã Tân Nhựt	785
27697	Phường 3	794
27757	Thị trấn Vĩnh Hưng	797
27865	Thị trấn Thạnh Hóa	800
27955	Xã Đức Lập Thượng	802
28042	Xã Tân Thành	804
28138	Xã Tân Lân	806
28234	Xã Thanh Phú Long	808
28315	Xã Long Chánh	816
28345	Xã Tân Lập 1	818
28438	Xã Thạnh Lộc	820
28555	Xã Hữu Đạo	821
28654	Xã Đồng Sơn	823
28753	Xã Phú Tân	825
28852	Xã Tiên Long	831
28978	Xã Cẩm Sơn	833
29074	Xã Phú Vang	835
29167	Xã Tân Thủy	836
28924	Xã Hòa Lộc	838
29311	Xã Hòa Ân	845
29401	Xã Hòa Lợi	847
29488	Xã Hàm Giang	849
29566	Phường Tân Hòa	855
29662	Xã Tân Quới Trung	859
29755	Xã Mỹ Thạnh Trung	860
29776	Xã Tân Thành	863
29917	Phường Tân Quy Đông	867
30001	Thị trấn Tràm Chim	871
30091	Xã Tân Nghĩa	873
30157	Xã Tân Thạnh	874
30205	Xã Bình Thạnh Trung	875
30244	Thị trấn Cái Tàu Hạ	877
30289	Phường Bình Đức	883
30334	Xã Vĩnh Châu	884
30376	Phường Long Thạnh	887
30415	Xã Long Hoà	888
30454	Xã Bình Thạnh Đông	888
30508	Xã Núi Voi	890
30547	Thị trấn Ba Chúc	891
30601	Xã Bình Thạnh	892
30640	Xã Long Điền A	893
30694	Xã Vĩnh Phú	894
30727	Xã Vọng Thê	894
30784	Xã Thuận Yên	900
30820	Thị trấn Sóc Sơn	903
30865	Xã Thạnh Đông	904
30893	Xã Vĩnh Hoà Phú	905
30947	Xã Vĩnh Phú	906
30970	Xã Vĩnh Hòa Hưng Nam	907
31039	Xã Đông Hưng B	909
31074	Xã Phong Đông	910
31057	Xã Hoà Chánh	913
31135	Phường Tân An	916
31178	Phường Bùi Hữu Nghĩa	918
31219	Phường Trung Kiên	923
31225	Xã Trung Thạnh	925
31315	Xã Nhơn Nghĩa	926
31294	Xã Trường Xuân	927
31342	Thị trấn Một Ngàn	932
31378	Xã Phú Hữu	933
31435	Xã Phương Phú	934
31483	Xã Thuận Hưng	936
31507	Phường 6	941
31576	Xã Thuận Hòa	942
31603	Xã Mỹ Phước	944
31669	Xã Long Phú	946
31861	Xã Vĩnh Lộc A	956
31864	Xã Ninh Thạnh Lợi	956
31972	Thị trấn Gành Hào	960
31978	Xã Long Điền Đông A	960
32025	Phường Tân Thành	964
32032	Xã Lý Văn Lâm	964
32104	Xã Khánh Bình Tây	968
32113	Xã Khánh Hưng	968
32174	Xã Tân Dân	970
32188	Xã Nguyễn Huân	970
25273	Xã Lộc Hòa	692
25354	Xã Thanh Bình	694
25426	Xã Đăng Hà	696
25483	Phường Ninh Thạnh	703
25576	Xã Bến Củi	707
25666	Xã Bàu Đồn	710
25759	Phường Định Hoà	718
25846	Phường Thới Hòa	721
25948	Phường Tân Đông Hiệp	724
26005	Phường Tân Hòa	731
26086	Phường Phú Bình	732
26173	Xã Phú Lý	735
26263	Xã Sông Trầu	737
26353	Xã Xuân Bảo	739
26458	Xã Xuân Phú	741
26542	Phường 12	747
26626	Xã Phước Tân	751
26713	Phường Phước Hoà	754
26869	Phường 15	764
26956	Phường 22	765
27043	Phường 04	768
26842	Phường Tăng Nhơn Phú A	769
27163	Phường 15	771
27259	Phường 13	773
27355	Phường 06	775
27448	Phường Bình Trị Đông A	777
27538	Xã Thái Mỹ	783
27631	Xã Đa Phước	785
27712	Xã Bình Tâm	794
27778	Xã Vĩnh Thuận	797
27889	Xã Tân Tây	800
27985	Xã Đức Hòa Hạ	802
28078	Xã Tân Bình	805
28174	Xã Phước Hậu	807
28270	Phường 6	815
28462	Xã Tân Bình	817
28390	Xã An Cư	819
28513	Xã Tam Bình	820
28609	Xã Phú Kiết	822
28720	Thị trấn Vàm Láng	824
28804	Xã Tân Thạch	831
28930	Xã Định Thủy	833
29032	Xã Bình Thành	834
29134	Xã Mỹ Nhơn	836
29230	Xã Thạnh Phong	837
29281	Xã Tân An	844
29371	Xã Tân Hòa	846
29458	Xã Thạnh Hòa Sơn	848
29539	Xã Hiệp Thạnh	851
29629	Xã An Phước	858
29722	Xã Tân Lộc	860
29836	Xã Trà Côn	862
29892	Phường Hoà Thuận	866
29971	Thị trấn Thường Thới Tiền	870
30064	Xã Mỹ An	872
30151	Xã Tân Huề	874
30241	Xã Phong Hòa	876
30325	Phường Núi Sam	884
30400	Xã Phú Vĩnh	887
30490	Xã Bình Thủy	889
30577	Xã An Tức	891
30667	Xã Bình Phước Xuân	893
30754	Phường Rạch Sỏi	899
30840	Xã Lình Huỳnh	903
30919	Xã Bàn Thạch	906
30979	Xã Vĩnh Tuy	907
31000	Xã Nam Thái	908
31081	Phường An Thới	911
31102	Xã Bãi Thơm	911
31141	Phường An Phú	916
31157	Phường Long Hưng	917
31228	Phường Thuận Hưng	923
31232	Thị trấn Vĩnh Thạnh	924
31258	Thị trấn Thới Lai	927
31279	Xã Đông Bình	927
31348	Xã Trường Long Tây	932
31359	Thị trấn Rạch Gòi	932
31444	Xã Vị Trung	935
31447	Xã Vị Thuỷ	935
31510	Phường 2	941
31513	Phường 1	941
31561	Xã Đại Hải	943
31651	Xã Long Đức	946
31852	Xã Ninh Hòa	956
31885	Xã Phong Thạnh Tây A	957
31969	Xã Tân Thạnh	959
31996	Xã Định Thành A	960
32026	Xã Tân Thành	964
32050	Xã Khánh Tiến	966
32108	Xã Khánh Lộc	968
32128	Thị trấn Cái Nước	969
32182	Xã Quách Phẩm	970
32203	Xã Hàng Vịnh	971
25276	Xã Lộc An	692
25357	Thị trấn Tân Khai	694
25429	Xã Phước Sơn	696
25486	Thị trấn Tân Biên	705
25573	Xã Cầu Khởi	707
25663	Xã Hiệp Thạnh	710
25753	Phường Phú Thọ	718
25813	Phường Mỹ Phước	721
25942	Phường Dĩ An	724
26002	Phường Hố Nai	731
26080	Phường Xuân An	732
26170	Thị trấn Vĩnh An	735
26257	Xã Bàu Hàm	737
26350	Xã Bảo Bình	739
26452	Xã Suối Cát	741
26536	Phường 10	747
26620	Thị trấn Phước Bửu	751
26710	Xã Tân Hải	754
26872	Phường 13	764
26959	Phường 19	765
27049	Phường 09	768
26851	Phường Phước Long A	769
27175	Phường 11	771
27271	Phường 10	773
27367	Phường 02	775
27457	Phường Tân Tạo A	777
27547	Xã Tân Thạnh Đông	783
27637	Xã Bình Chánh	785
27788	Phường 2	795
27808	Xã Bình Hòa Trung	798
27901	Xã Mỹ Quý Đông	801
27997	Xã Lương Bình	803
28093	Xã Tân Phước Tây	805
28192	Xã Phước Vĩnh Tây	807
28285	Xã Trung An	815
28474	Phường Nhị Mỹ	817
28402	Xã Thiện Trí	819
28525	Xã Tân Hương	821
28621	Xã Bình Phục Nhứt	822
28732	Xã Tân Đông	824
28807	Xã Qưới Sơn	831
28903	Thị trấn Mỏ Cày	833
29026	Xã Long Mỹ	834
29116	Xã Mỹ Hòa	836
29209	Xã An Điền	837
29257	Phường 8	842
29347	Xã Phú Cần	846
29440	Xã Thuận Hòa	848
29533	Xã Long Vĩnh	850
29605	Xã Lộc Hòa	857
29698	Xã Trung Ngãi	859
29821	Thị trấn Trà Ôn	862
29884	Xã Mỹ Tân	866
29947	Xã Tân Công Chí	869
30055	Xã Mỹ Quý	872
30142	Xã Phú Lợi	874
30232	Xã Vĩnh Thới	876
30322	Phường Vĩnh Mỹ	884
30403	Xã Lê Chánh	887
30487	Xã Bình Mỹ	889
30580	Thị trấn Cô Tô	891
30673	Xã Hội An	893
30757	Phường Vĩnh Lợi	899
30847	Xã Mỹ Phước	903
30928	Xã Ngọc Chúc	906
30985	Thị trấn Thứ Ba	908
31018	Thị trấn Thứ Mười Một	909
31090	Xã Cửa Dương	911
31114	Xã An Sơn	912
31150	Phường An Bình	916
31168	Phường Bình Thủy	918
31192	Phường Hưng Thạnh	919
31241	Xã Thạnh Tiến	924
31264	Xã Thới Hưng	925
31291	Xã Trường Thành	927
31324	Phường IV	930
31366	Thị Trấn Ngã Sáu	933
31387	Xã Đông Phước A	933
31459	Xã Vĩnh Tường	935
31490	Xã Vĩnh Viễn A	936
31522	Phường 9	941
31594	Xã An Hiệp	942
31609	Xã Mỹ Thuận	944
31693	Xã Tham Đôn	947
31741	Xã Tân Long	948
31771	Xã Vĩnh Thành	949
31804	Phường Vĩnh Phước	950
31699	Xã Thạnh Thới An	951
31888	Xã Phong Thạnh Tây B	957
31894	Xã Vĩnh Hưng	958
31891	Thị trấn Hòa Bình	961
31915	Xã Minh Diệu	961
32056	Xã Khánh Lâm	966
32059	Xã Khánh An	966
32131	Xã Lương Thế Trân	969
32134	Xã Phú Hưng	969
32206	Xã Tam Giang	971
32209	Xã Tam Giang Đông	971
25279	Xã Lộc Tấn	692
25360	Xã Đồng Nơ	694
25432	Thị trấn Chơn Thành	697
25489	Xã Tân Lập	705
25579	Xã Lộc Ninh	707
25669	Xã Phước Thạnh	710
25762	Phường Phú Mỹ	718
25843	Xã An Tây	721
25951	Phường Bình An	724
26011	Phường Bửu Long	731
26092	Xã Bảo Quang	732
26185	Xã Bình Lợi	735
26272	Xã Hố Nai 3	737
26362	Xã Sông Ray	739
26464	Xã Bảo Hoà	741
26545	Xã Long Sơn	747
26623	Xã Phước Thuận	751
26719	Phường Mỹ Xuân	754
26876	Phường 6	764
26938	Phường 15	765
27025	Phường Phú Thọ Hòa	767
26827	Phường Trường Thọ	769
27148	Phường 04	770
27241	Phường 06	772
27340	Phường 10	774
27433	Phường 07	776
27523	Xã Trung An	783
27610	Xã Lê Minh Xuân	785
27698	Phường 7	794
27763	Xã Khánh Hưng	797
27868	Xã Tân Hiệp	800
27958	Xã Đức Lập Hạ	802
28051	Xã Mỹ Thạnh	804
28150	Xã Phước Đông	806
28249	Phường 5	815
28436	Phường 2	817
28366	Xã Hậu Mỹ Bắc A	819
28495	Xã Mỹ Long	820
28585	Xã Kim Sơn	821
28678	Xã Long Vĩnh	823
28780	Phường 7	829
28873	Xã Phú Phụng	832
28999	Xã Lương Hòa	834
29092	Xã Bình Thắng	835
29185	Xã Phú Khánh	837
29236	Phường 4	842
29323	Xã Ninh Thới	845
29407	Xã Hưng Mỹ	847
29491	Xã Đại An	849
29575	Thị trấn Long Hồ	857
29665	Xã Quới Thiện	859
29752	Xã Long Phú	860
29782	Xã Tân An Thạnh	863
29920	Xã Tân Quy Tây	867
30010	Xã Phú Hiệp	871
30103	Xã Tân Hội Trung	873
30163	Xã Bình Thành	874
30250	Xã An Nhơn	877
30340	Xã Khánh An	886
30418	Xã Phú Long	888
30505	Thị trấn Chi Lăng	890
30595	Xã Cần Đăng	892
30688	Thị Trấn Óc Eo	894
30775	Phường Pháo Đài	900
30860	Xã Tân Hoà	904
30940	Xã Hoà An	906
31003	Xã Nam Thái A	908
31031	Xã Tân Thạnh	909
31108	Xã Hòn Tre	912
31027	Xã An Minh Bắc	913
31162	Phường Phước Thới	917
31177	Phường An Thới	918
31237	Xã Vĩnh Trinh	924
31252	Xã Thạnh Lộc	924
31285	Xã Thới Tân	927
31297	Xã Trường Xuân A	927
31363	Xã Tân Phú Thạnh	932
31375	Xã Đông Phú	933
31465	Xã Vị Thanh	935
31468	Xã Vị Bình	935
31569	Thị trấn Châu Thành	942
31573	Xã Phú Tâm	942
31555	Xã Kế Thành	943
31558	Xã Kế An	943
31642	Xã Song Phụng	946
31645	Thị trấn Đại Ngãi	946
31840	Xã Hiệp Thành	954
31846	Xã Ninh Quới	956
31954	Xã Phong Tân	959
31957	Xã Tân Phong	959
32014	Phường 8	964
32022	Phường Tân Xuyên	964
32086	Xã Tân Lộc	967
32101	Xã Khánh Bình Tây Bắc	968
32161	Xã Trần Phán	970
32176	Xã Tân Tiến	970
32230	Xã Nguyễn Việt Khái	972
32245	Xã Tân Ân	973
25291	Xã Lộc Quang	692
25369	Xã Đồng Tâm	695
25444	Xã Minh Long	697
25504	Xã Hòa Hiệp	705
25594	Xã Đồng Khởi	708
25684	Xã Long Chữ	711
25768	Phường Hiệp An	718
25858	Thị trấn Phước Vĩnh	722
25960	Phường An Bình	724
26023	Phường Quang Vinh	731
26101	Phường Xuân Lập	732
26191	Xã Thiện Tân	735
26278	Xã Bình Minh	737
26365	Xã Lâm San	739
26473	Xã Long Tân	742
26551	Phường Phước Hiệp	748
26635	Xã Tân Lâm	751
26722	Xã Sông Xoài	754
26875	Phường 17	764
26944	Phường 01	765
27034	Phường Hòa Thạnh	767
26833	Phường Long Thạnh Mỹ	769
27151	Phường 05	770
27244	Phường 04	772
27343	Phường 13	774
27430	Phường 16	776
27517	Xã Phú Hòa Đông	783
27607	Xã Bình Lợi	785
27694	Phường 1	794
27760	Xã Hưng Điền A	797
27871	Xã Thuận Bình	800
27961	Xã Tân Phú	802
28048	Xã Mỹ Lạc	804
28141	Xã Phước Tuy	806
28240	Xã An Lục Long	808
28708	Xã Bình Đông	816
28354	Xã Tân Lập 2	818
28465	Xã Phú Nhuận	820
28573	Xã Bàn Long	821
28660	Xã Đồng Thạnh	823
28757	Phường Phú Tân	829
28858	Xã Hữu Định	831
28987	Xã Phong Nẫm	834
29077	Xã Lộc Thuận	835
29170	Xã Vĩnh An	836
28927	Xã Tân Thanh Tây	838
29314	Xã Châu Điền	845
29404	Xã Phước Hảo	847
29489	Xã Hàm Tân	849
29572	Phường Trường An	855
29668	Xã Quới An	859
29758	Xã Tường Lộc	860
29785	Xã Tân Lược	863
29955	Phường An Thạnh	868
30016	Xã Phú Thành B	871
30109	Xã Mỹ Hội	873
30199	Xã Định Yên	875
30285	Phường Đông Xuyên	883
30367	Xã Vĩnh Trường	886
30451	Xã Phú Hưng	888
30544	Thị trấn Tri Tôn	891
30631	Thị trấn Mỹ Luông	893
30715	Xã Vọng Đông	894
30811	Xã Sơn Hải	902
30889	Xã Giục Tượng	905
30967	Xã Thủy Liễu	907
31024	Xã Đông Hòa	909
31069	Xã Vĩnh Thuận	910
31012	Xã Thạnh Yên	913
31123	Phường Thới Bình	916
31171	Phường Trà Nóc	918
31201	Phường Phú Thứ	919
31243	Xã Thạnh Thắng	924
31273	Xã Đông Hiệp	925
31286	Xã Trường Thắng	927
31338	Xã Tân Tiến	930
31362	Thị trấn Cái Tắc	932
31402	Xã Bình Thành	934
31456	Xã Vĩnh Trung	935
31473	Phường Bình Thạnh	937
31525	Phường 10	941
31549	Xã Thới An Hội	943
31639	Thị trấn Long Phú	946
31825	Phường 1	954
31849	Xã Ninh Quới A	956
31921	Xã Long Thạnh	958
31963	Xã Phong Thạnh A	959
31999	Phường 9	964
32020	Phường 7	964
32074	Xã Biển Bạch Đông	967
32095	Thị trấn Trần Văn Thời	968
32146	Xã Tân Hưng Đông	969
32158	Xã Tạ An Khương  Đông	970
32164	Xã Tân Đức	970
32233	Xã Tam Giang Tây	973
32239	Xã Viên An Đông	973
25339	Xã An Phú	694
25411	Xã Đoàn Kết	696
25465	Phường Hiệp Ninh	703
25555	Xã Suối Đá	707
25645	Phường Long Thành Trung	709
25738	Xã Phước Chỉ	712
25795	Xã Định Thành	720
25924	Phường Phú Chánh	723
25908	Xã Hiếu Liêm	726
26371	Phường An Hòa	731
26146	Xã Phú Trung	734
26233	Xã Phú Ngọc	736
26323	Xã Xuân Thiện	738
26431	Xã Suối Cao	741
26515	Phường 4	747
26593	Xã Bình Trung	750
26680	Thị trấn Đất Đỏ	753
26770	Phường Hiệp Thành	761
26923	Phường 05	765
27013	Phường Tây Thạnh	767
26815	Phường Linh Chiểu	769
27136	Phường 13	770
27232	Phường 09	772
27328	Phường 11	774
27412	Phường 13	776
27502	Xã An Phú	783
27595	Thị trấn Tân Túc	785
27685	Phường 5	794
27748	Xã Vĩnh Đại	796
27862	Xã Tân Hòa	799
27949	Xã Tân Mỹ	802
28036	Thị trấn Thủ Thừa	804
28135	Xã Mỹ Lệ	806
28228	Xã Hiệp Thạnh	808
28309	Xã Long Hưng	816
28339	Xã Tân Hòa Thành	818
28432	Xã Hòa Hưng	819
28558	Xã Long An	821
28651	Thị trấn Vĩnh Bình	823
28750	Xã Phú Đông	825
28843	Xã Quới Thành	831
28966	Xã An Thới	833
29062	Xã Phú Thuận	835
29155	Xã Tân Hưng	836
28915	Xã Phước Mỹ Trung	838
29302	Xã Nhị Long	844
29389	Xã Lương Hòa	847
29476	Xã Lưu Nghiệp Anh	849
29554	Phường 4	855
29644	Xã Bình Phước	858
29731	Xã Hòa Thạnh	860
29851	Xã Phú Thành	862
29908	Phường 4	867
29992	Xã Long Thuận	870
30079	Xã Gáo Giồng	873
30160	Xã Tân Phú	874
30253	Xã Tân Nhuận Đông	877
30337	Thị trấn An Phú	886
30409	Thị trấn Chợ Vàm	888
30499	Xã Bình Chánh	889
30592	Xã An Hòa	892
30682	Thị trấn Núi Sập	894
30769	Phường Đông Hồ	900
30859	Xã Tân Hiệp B	904
30937	Xã Hoà Lợi	906
31030	Xã Đông Thạnh	909
31048	Xã Vân Khánh Tây	909
31054	Xã Vĩnh Hòa	913
30793	Xã Vĩnh Điều	914
31174	Phường Thới An Đông	918
31186	Phường Lê Bình	919
31246	Xã Thạnh Qưới	924
31249	Xã Thạnh Phú	925
31298	Xã Trường Xuân B	927
31327	Phường V	930
31381	Thị trấn Mái Dầm	933
31399	Xã Tân Bình	934
31489	Thị trấn Vĩnh Viễn	936
31495	Xã Xà Phiên	936
31600	Xã An Ninh	942
31531	Thị trấn An Lạc Thôn	943
31615	Thị trấn Cù Lao Dung	945
31618	Xã An Thạnh 1	945
31708	Xã Thạnh Phú	947
31711	Xã Ngọc Đông	947
31738	Xã Vĩnh Quới	948
31750	Xã Mỹ Bình	948
31768	Xã Tuân Tức	949
31780	Xã Châu Hưng	949
31798	Xã Lạc Hòa	950
31672	Xã Đại Ân  2	951
31687	Xã Tài Văn	951
31813	Phường 2	954
31876	Xã Phước Long	957
31903	Xã Châu Hưng A	958
31987	Xã An Trạch	960
31930	Xã Vĩnh Hậu A	961
32041	Xã Hòa Tân	964
32068	Xã Biển Bạch	967
32116	Xã Khánh Bình Đông	968
32140	Xã Hưng Mỹ	969
32186	Xã Ngọc Chánh	970
32212	Thị trấn Cái Đôi Vàm	972
26773	Phường Thới An	761
26920	Phường 25	765
27007	Phường 15	766
26809	Phường Hiệp Bình Phước	769
27133	Phường 11	770
27226	Phường 13	772
27325	Phường 01	774
27415	Phường 12	776
27508	Xã An Nhơn Tây	783
27598	Xã Phạm Văn Hai	785
27688	Phường 2	794
27739	Xã Vĩnh Thạnh	796
27850	Xã Tân Thành	799
27943	Xã An Ninh Đông	802
28030	Xã Phước Lợi	803
28120	Xã Phước Vân	806
28219	Xã Phú Ngãi Trị	808
28306	Phường 5	816
28342	Xã Hưng Thạnh	818
28441	Xã Mỹ Thành Bắc	820
28570	Xã Thạnh Phú	821
28666	Xã Bình Nhì	823
28759	Phường 8	829
28855	Xã An Hiệp	831
28981	Xã Hương Mỹ	833
29068	Xã Vang Quới Đông	835
29164	Xã Vĩnh Hòa	836
28918	Xã Tân Thành Bình	838
29308	Thị trấn Cầu Kè	845
29395	Xã Nguyệt Hóa	847
29485	Xã Thanh Sơn	849
29569	Phường Tân Hội	855
29659	Thị trấn Vũng Liêm	859
29749	Xã Tân Phú	860
29779	Xã Thành Trung	863
29923	Xã Tân Phú Đông	867
30007	Xã Tân Công Sính	871
30094	Xã Phương Trà	873
30193	Xã Bình Thành	875
30283	Phường Mỹ Long	883
30370	Xã Vĩnh Hội Đông	886
30448	Xã Phú Thọ	888
30538	Xã An Hảo	890
30628	Thị trấn Chợ Mới	893
30718	Xã Vĩnh Khánh	894
30814	Xã Hòn Nghệ	902
30892	Xã Vĩnh Hòa Hiệp	905
30973	Xã Vĩnh Phước A	907
31072	Xã Tân Thuận	910
31075	Xã Vĩnh Phong	910
31126	Phường An Nghiệp	916
31129	Phường An Cư	916
31213	Phường Tân Lộc	923
31227	Phường Tân Hưng	923
31306	Xã Tân Thới	926
31267	Xã Thới Thạnh	927
31414	Xã Tân Thành	931
31346	Thị trấn Bảy Ngàn	932
31432	Xã Tân Phước Hưng	934
31441	Thị trấn Nàng Mau	935
31481	Xã Tân Phú	937
31501	Phường 7	941
31591	Xã Mỹ Hương	944
31663	Xã Châu Khánh	946
31843	Thị trấn Ngan Dừa	956
31882	Xã Vĩnh Thanh	957
31960	Xã Phong Thạnh	959
31990	Xã An Phúc	960
32017	Phường 6	964
32048	Xã Khánh Thuận	966
32092	Xã Hồ Thị Kỷ	967
32125	Xã Phong Lạc	968
32162	Xã Tân Trung	970
32197	Xã Hiệp Tùng	971
32236	Xã Tân Ân Tây	973
26905	Phường 13	765
26995	Phường 06	766
26797	Phường Bình Chiểu	769
27112	Phường Thạnh Mỹ Lợi	769
27211	Phường 05	772
27307	Phường 03	774
27397	Phường 03	776
27490	Phường Tân Phong	778
27577	Xã Xuân Thới Sơn	784
27670	Xã Tam Thôn Hiệp	787
27727	Xã Hưng Điền B	796
27838	Xã Tân Lập	799
27931	Thị trấn Hậu Nghĩa	802
28021	Xã Thanh Phú	803
28123	Xã Long Hòa	806
28216	Xã Hòa Phú	808
28300	Phường 4	816
28330	Xã Thạnh Mỹ	818
28423	Xã Tân Thanh	819
28546	Xã Dưỡng Điềm	821
28642	Xã Xuân Đông	822
28696	Xã Phú Thạnh	825
28840	Xã Tân Phú	831
28969	Xã Thành Thới A	833
29059	Xã Long Hòa	835
29152	Xã Bảo Thuận	836
28906	Xã Thanh Tân	838
29296	Xã Đại Phước	844
29383	Xã Thanh Mỹ	847
29467	Xã Tập Sơn	849
29551	Phường 2	855
29647	Xã Chánh An	858
29737	Xã Phú Lộc	860
29857	Xã Lục Sỹ Thành	862
29914	Xã Tân Khánh Đông	867
29998	Xã Phú Thuận A	870
30085	Xã Ba Sao	873
30196	Xã Định An	875
30286	Phường Mỹ Xuyên	883
30373	Xã Đa Phước	886
30457	Xã Tân Hòa	888
30541	Xã Tân Lập	890
30634	Xã Kiến An	893
30721	Xã Thoại Giang	894
30817	Thị trấn Hòn Đất	903
30887	Xã Mong Thọ	905
30961	Xã Thới Quản	907
31063	Xã Vĩnh Bình Nam	910
31117	Phường Cái Khế	916
31204	Phường Tân Phú	919
31299	Thị trấn Phong Điền	926
31341	Phường Lái Hiếu	931
31420	Xã Hòa Mỹ	934
31474	Xã Long Bình	937
31543	Xã Trinh Phú	943
31630	Xã An Thạnh 2	945
31723	Xã Ngọc Tố	947
31756	Thị trấn Phú Lộc	949
31786	Xã Hòa Đông	950
31678	Xã Lịch Hội Thượng	951
31822	Phường 7	954
31909	Xã Hưng Hội	958
31933	Xã Vĩnh Mỹ A	961
32071	Xã Trí Phải	967
32142	Xã Đông Hưng	969
32215	Xã Phú Mỹ	972
26911	Phường 27	765
27001	Phường 09	766
26803	Phường Tam Bình	769
27115	Phường An Lợi Đông	769
27214	Phường 14	772
27310	Phường 12	774
27403	Phường 09	776
27499	Xã Phú Mỹ Hưng	783
27589	Xã Xuân Thới Thượng	784
27679	Xã Long Hòa	787
27742	Xã Vĩnh Châu B	796
27847	Xã Kiến Bình	799
27934	Thị trấn Hiệp Hòa	802
28024	Xã Long Hiệp	803
28117	Xã Long Định	806
28213	Xã Bình Quới	808
28294	Phường 3	816
28327	Xã Thạnh Tân	818
28420	Xã Mỹ Lương	819
28549	Xã Đông Hòa	821
28645	Xã Hòa Định	822
28693	Xã Tân Phú	825
28837	Xã Tường Đa	831
28960	Xã Thành Thới B	833
29053	Xã Tam Hiệp	835
29146	Xã Phú Lễ	836
29233	Xã Mỹ An	837
29287	Xã Bình Phú	844
29374	Thị trấn Châu Thành	847
29464	Xã Phước Hưng	849
29545	Phường 5	855
29641	Thị trấn Cái Nhum	858
29734	Xã Hoà Lộc	860
29848	Xã Thuận Thới	862
29899	Xã Tịnh Thới	866
29974	Xã Thường Phước 2	870
30070	Xã Láng Biển	872
30175	Xã Tân Mỹ	875
30268	Xã Phú Hựu	877
30346	Xã Quốc Thái	886
30427	Xã Phú Thạnh	888
30517	Xã Thới Sơn	890
30604	Thị trấn Vĩnh Bình	892
30691	Xã Tây Phú	894
30781	Xã Tiên Hải	900
30862	Xã Thạnh Đông B	904
30943	Xã Long Thạnh	906
31036	Xã Đông Hưng A	909
31066	Xã Minh Thuận	913
31180	Phường Long Hòa	918
31222	Xã Trung An	925
31318	Phường I	930
31384	Xã Đông Phước	933
31486	Xã Vĩnh Thuận Đông	936
31582	Xã Phú Tân	942
31597	Xã Mỹ Tú	944
31666	Xã Tân Thạnh	946
31873	Xã Vĩnh Phú Tây	957
31988	Xã An Trạch A	960
32047	Xã Khánh Hòa	966
32122	Xã Lợi An	968
32191	Thị Trấn Năm Căn	971
25237	Phường Sơn Giang	688
25303	Xã Lộc Hưng	692
25384	Xã Tân Hòa	695
25243	Xã Bình Tân	698
25519	Xã Tân Hà	706
25609	Xã Trí Bình	708
25699	Xã Lợi Thuận	711
25825	Xã Tân Hưng	719
25876	Xã Tam Lập	722
25987	Phường Bình Hòa	725
26047	Phường Bình Đa	731
26128	Xã Núi Tượng	734
26218	Xã Phú Lợi	736
26308	Xã Gia Kiệm	738
26416	Xã Phước Bình	740
26506	Phường 1	747
26578	Xã Bình Ba	750
26665	Xã An Ngãi	752
26749	Phường Phạm Ngũ Lão	760
26902	Phường 03	764
26992	Phường 10	766
26794	Phường Linh Xuân	769
27109	Phường Cát Lái	769
27208	Phường 15	772
27304	Phường 09	774
27400	Phường 11	776
27487	Phường Tân Phú	778
27580	Xã Tân Xuân	784
27667	Xã Bình Khánh	787
27730	Xã Hưng Điền	796
27835	Xã Nhơn Hòa Lập	799
27922	Xã Bình Hòa Hưng	801
28018	Xã Mỹ Yên	803
28114	Xã Long Khê	806
28207	Xã Tân Tập	807
28291	Xã Tân Mỹ Chánh	815
28483	Xã Phú Quý	817
28408	Xã Mỹ Đức Tây	819
28531	Xã Tân Lý Tây	821
28627	Xã Tân Thuận Bình	822
28741	Xã Bình Nghị	824
28828	Xã An Phước	831
28957	Xã An Định	833
29047	Xã Hưng Lễ	834
29143	Xã An Ngãi Trung	836
28889	Xã Phú Mỹ	838
29284	Xã Tân Bình	844
29377	Xã Đa Lộc	847
29462	Thị trấn Định An	849
29527	Xã Trường Long Hòa	851
29632	Xã Nhơn Phú	858
29719	Thị trấn Tam Bình	860
29839	Xã Tân Mỹ	862
29893	Xã Hòa An	866
29962	Xã Thường Thới Hậu A	870
30067	Xã Phú Điền	872
30184	Xã Long Hưng A	875
30277	Xã Hòa Tân	877
30361	Xã Vĩnh Lộc	886
30442	Xã Hiệp Xương	888
30529	Xã An Nông	890
30622	Xã Tân Phú	892
30709	Xã Định Thành	894
30808	Xã Bình An	902
30886	Xã Mong Thọ B	905
30964	Xã Định An	907
31064	Xã Bình Minh	910
31120	Phường An Hòa	916
31198	Phường Thường Thạnh	919
31276	Xã Thới Đông	925
31336	Xã Hoả Lựu	930
31405	Xã Thạnh Hòa	934
31472	Phường Trà Lồng	937
31537	Xã Phong Nẫm	943
31627	Xã Đại Ân 1	945
31717	Xã Hòa Tú 1	947
31744	Xã Long Bình	948
31774	Xã Thạnh Trị	949
31807	Xã Vĩnh Tân	950
31696	Xã Viên An	951
31870	Xã Vĩnh Phú Đông	957
31985	Xã Điền Hải	960
32044	Thị trấn U Minh	966
32124	Xã Phong Điền	968
32200	Xã Đất Mới	971
\.


--
-- TOC entry 3366 (class 0 OID 0)
-- Dependencies: 212
-- Name: Packages_f_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Packages_f_ID_seq"', 4, true);


--
-- TOC entry 3367 (class 0 OID 0)
-- Dependencies: 214
-- Name: Products_f_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Products_f_ID_seq"', 7, true);


--
-- TOC entry 3368 (class 0 OID 0)
-- Dependencies: 216
-- Name: QuarantineLocations_f_Quarantine_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."QuarantineLocations_f_Quarantine_seq"', 485, true);


--
-- TOC entry 3369 (class 0 OID 0)
-- Dependencies: 218
-- Name: Users_f_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Users_f_ID_seq"', 5, true);


--
-- TOC entry 3192 (class 2606 OID 16431)
-- Name: Cities Cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cities"
    ADD CONSTRAINT "Cities_pkey" PRIMARY KEY ("f_ID");


--
-- TOC entry 3194 (class 2606 OID 16433)
-- Name: Districts Districts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Districts"
    ADD CONSTRAINT "Districts_pkey" PRIMARY KEY ("f_ID");


--
-- TOC entry 3196 (class 2606 OID 16435)
-- Name: Packages Packages_PKey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Packages"
    ADD CONSTRAINT "Packages_PKey" PRIMARY KEY ("f_ID");


--
-- TOC entry 3198 (class 2606 OID 16437)
-- Name: Products Products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_pkey" PRIMARY KEY ("f_ID");


--
-- TOC entry 3200 (class 2606 OID 16439)
-- Name: QuarantineLocations QuarantineLocations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."QuarantineLocations"
    ADD CONSTRAINT "QuarantineLocations_pkey" PRIMARY KEY ("f_ID");


--
-- TOC entry 3202 (class 2606 OID 16441)
-- Name: Users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY ("f_ID");


--
-- TOC entry 3206 (class 2606 OID 16443)
-- Name: Wards Wards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Wards"
    ADD CONSTRAINT "Wards_pkey" PRIMARY KEY ("f_ID");


--
-- TOC entry 3204 (class 2606 OID 16445)
-- Name: Users f_Username; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "f_Username" UNIQUE ("f_Username");


--
-- TOC entry 3207 (class 2606 OID 16446)
-- Name: Districts Cities; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Districts"
    ADD CONSTRAINT "Cities" FOREIGN KEY ("f_City") REFERENCES public."Cities"("f_ID") ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3208 (class 2606 OID 16451)
-- Name: Users Cities; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Cities" FOREIGN KEY ("f_Ward") REFERENCES public."Wards"("f_ID") NOT VALID;


--
-- TOC entry 3209 (class 2606 OID 16456)
-- Name: Wards Districts; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Wards"
    ADD CONSTRAINT "Districts" FOREIGN KEY ("f_District") REFERENCES public."Districts"("f_ID") ON DELETE CASCADE;


-- Completed on 2022-01-19 08:18:34

--
-- PostgreSQL database dump complete
--

