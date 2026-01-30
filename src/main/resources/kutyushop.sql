-- Table: public.admin

-- DROP TABLE public.admin;

CREATE TABLE public.admin
(
    id integer NOT NULL,
    nev character varying(32) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    password character varying(32) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    CONSTRAINT admin_pkey PRIMARY KEY (id),
    CONSTRAINT admin_id_key UNIQUE (id)
)

TABLESPACE pg_default;

ALTER TABLE public.admin
    OWNER to postgres;
    
-- Constraint: admin_id_key

-- ALTER TABLE public.admin DROP CONSTRAINT admin_id_key;

ALTER TABLE public.admin
    ADD CONSTRAINT admin_id_key UNIQUE (id);
    
-- Constraint: admin_pkey

-- ALTER TABLE public.admin DROP CONSTRAINT admin_pkey;

ALTER TABLE public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id);
    
-- Table: public.felh

-- DROP TABLE public.felh;

CREATE TABLE public.felh
(
    id integer NOT NULL,
    name character varying(32) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    email character varying(32) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    password character varying(32) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    isactive integer NOT NULL DEFAULT 1,
    hirlevele integer NOT NULL DEFAULT 1,
    telefonszam character varying(16) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    iranyitoszam character varying(8) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    telepules character varying(32) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    utca character varying(32) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    hazszam_ajto character varying(32) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    CONSTRAINT felh_pkey PRIMARY KEY (id),
    CONSTRAINT felh_id_key UNIQUE (id)
)

TABLESPACE pg_default;

ALTER TABLE public.felh
    OWNER to postgres;
    
-- Constraint: felh_id_key

-- ALTER TABLE public.felh DROP CONSTRAINT felh_id_key;

ALTER TABLE public.felh
    ADD CONSTRAINT felh_id_key UNIQUE (id);

-- Constraint: felh_pkey

-- ALTER TABLE public.felh DROP CONSTRAINT felh_pkey;

ALTER TABLE public.felh
    ADD CONSTRAINT felh_pkey PRIMARY KEY (id);

-- Table: public.hirlevel

-- DROP TABLE public.hirlevel;

CREATE TABLE public.hirlevel
(
    id integer NOT NULL,
    cim character varying(64) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    szerzo integer,
    megjelenes_ideje date,
    tartalom text COLLATE pg_catalog."default",
    CONSTRAINT hirlevel_pkey PRIMARY KEY (id),
    CONSTRAINT hirlevel_id_key UNIQUE (id),
    CONSTRAINT hirlevel_szerzo_fkey FOREIGN KEY (szerzo)
        REFERENCES public.admin (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE public.hirlevel
    OWNER to postgres;
    
-- Constraint: hirlevel_id_key

-- ALTER TABLE public.hirlevel DROP CONSTRAINT hirlevel_id_key;

ALTER TABLE public.hirlevel
    ADD CONSTRAINT hirlevel_id_key UNIQUE (id);
    
-- Constraint: hirlevel_pkey

-- ALTER TABLE public.hirlevel DROP CONSTRAINT hirlevel_pkey;

ALTER TABLE public.hirlevel
    ADD CONSTRAINT hirlevel_pkey PRIMARY KEY (id);
    
-- Constraint: hirlevel_szerzo_fkey

-- ALTER TABLE public.hirlevel DROP CONSTRAINT hirlevel_szerzo_fkey;

ALTER TABLE public.hirlevel
    ADD CONSTRAINT hirlevel_szerzo_fkey FOREIGN KEY (szerzo)
    REFERENCES public.admin (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
    
-- Table: public.kikuld

-- DROP TABLE public.kikuld;

CREATE TABLE public.kikuld
(
    id integer NOT NULL,
    melyik_hirlevel integer,
    melyik_user integer,
    CONSTRAINT kikuld_pkey PRIMARY KEY (id),
    CONSTRAINT kikuld_id_key UNIQUE (id),
    CONSTRAINT kikuld_melyik_hirlevel_fkey FOREIGN KEY (melyik_hirlevel)
        REFERENCES public.hirlevel (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT kikuld_melyik_user_fkey FOREIGN KEY (melyik_user)
        REFERENCES public.felh (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE public.kikuld
    OWNER to postgres;
    
-- Constraint: kikuld_id_key

-- ALTER TABLE public.kikuld DROP CONSTRAINT kikuld_id_key;

ALTER TABLE public.kikuld
    ADD CONSTRAINT kikuld_id_key UNIQUE (id);
    
-- Constraint: kikuld_melyik_hirlevel_fkey

-- ALTER TABLE public.kikuld DROP CONSTRAINT kikuld_melyik_hirlevel_fkey;

ALTER TABLE public.kikuld
    ADD CONSTRAINT kikuld_melyik_hirlevel_fkey FOREIGN KEY (melyik_hirlevel)
    REFERENCES public.hirlevel (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
    
-- Constraint: kikuld_melyik_user_fkey

-- ALTER TABLE public.kikuld DROP CONSTRAINT kikuld_melyik_user_fkey;

ALTER TABLE public.kikuld
    ADD CONSTRAINT kikuld_melyik_user_fkey FOREIGN KEY (melyik_user)
    REFERENCES public.felh (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
    
-- Constraint: kikuld_pkey

-- ALTER TABLE public.kikuld DROP CONSTRAINT kikuld_pkey;

ALTER TABLE public.kikuld
    ADD CONSTRAINT kikuld_pkey PRIMARY KEY (id);
    
-- Table: public.panaszok

-- DROP TABLE public.panaszok;

CREATE TABLE public.panaszok
(
    id integer NOT NULL,
    user_id integer,
    szamla_id integer,
    kelte date,
    tartalom text COLLATE pg_catalog."default",
    CONSTRAINT panaszok_pkey PRIMARY KEY (id),
    CONSTRAINT panaszok_id_key UNIQUE (id),
    CONSTRAINT panaszok_szamla_id_fkey FOREIGN KEY (szamla_id)
        REFERENCES public.szamla (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT panaszok_user_id_fkey FOREIGN KEY (user_id)
        REFERENCES public.felh (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE public.panaszok
    OWNER to postgres;
    
-- Constraint: panaszok_id_key

-- ALTER TABLE public.panaszok DROP CONSTRAINT panaszok_id_key;

ALTER TABLE public.panaszok
    ADD CONSTRAINT panaszok_id_key UNIQUE (id);
    
-- Constraint: panaszok_pkey

-- ALTER TABLE public.panaszok DROP CONSTRAINT panaszok_pkey;

ALTER TABLE public.panaszok
    ADD CONSTRAINT panaszok_pkey PRIMARY KEY (id);
    
-- Constraint: panaszok_szamla_id_fkey

-- ALTER TABLE public.panaszok DROP CONSTRAINT panaszok_szamla_id_fkey;

ALTER TABLE public.panaszok
    ADD CONSTRAINT panaszok_szamla_id_fkey FOREIGN KEY (szamla_id)
    REFERENCES public.szamla (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
    
-- Constraint: panaszok_user_id_fkey

-- ALTER TABLE public.panaszok DROP CONSTRAINT panaszok_user_id_fkey;

ALTER TABLE public.panaszok
    ADD CONSTRAINT panaszok_user_id_fkey FOREIGN KEY (user_id)
    REFERENCES public.felh (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
    
-- Table: public.szamla

-- DROP TABLE public.szamla;

CREATE TABLE public.szamla
(
    id integer NOT NULL,
    melyik_user integer,
    melyik_termek integer,
    kelte date,
    termek_darabszama integer,
    osszeg integer,
    statusz character varying(64) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    fiz_mod character varying(64) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    CONSTRAINT szamla_pkey PRIMARY KEY (id),
    CONSTRAINT szamla_id_key UNIQUE (id),
    CONSTRAINT szamla_melyik_termek_fkey FOREIGN KEY (melyik_termek)
        REFERENCES public.termek (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT szamla_melyik_user_fkey FOREIGN KEY (melyik_user)
        REFERENCES public.felh (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE public.szamla
    OWNER to postgres;
    
-- Constraint: szamla_id_key

-- ALTER TABLE public.szamla DROP CONSTRAINT szamla_id_key;

ALTER TABLE public.szamla
    ADD CONSTRAINT szamla_id_key UNIQUE (id);
    
-- Constraint: szamla_melyik_termek_fkey

-- ALTER TABLE public.szamla DROP CONSTRAINT szamla_melyik_termek_fkey;

ALTER TABLE public.szamla
    ADD CONSTRAINT szamla_melyik_termek_fkey FOREIGN KEY (melyik_termek)
    REFERENCES public.termek (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
    
-- Constraint: szamla_melyik_user_fkey

-- ALTER TABLE public.szamla DROP CONSTRAINT szamla_melyik_user_fkey;

ALTER TABLE public.szamla
    ADD CONSTRAINT szamla_melyik_user_fkey FOREIGN KEY (melyik_user)
    REFERENCES public.felh (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
    
-- Constraint: szamla_pkey

-- ALTER TABLE public.szamla DROP CONSTRAINT szamla_pkey;

ALTER TABLE public.szamla
    ADD CONSTRAINT szamla_pkey PRIMARY KEY (id);
    
-- Table: public.termek

-- DROP TABLE public.termek;

CREATE TABLE public.termek
(
    id integer NOT NULL,
    nev character varying(128) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    kategoria character varying(32) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    leiras text COLLATE pg_catalog."default",
    raktarone integer NOT NULL DEFAULT 1,
    ar integer,
    akcio character varying(8) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    erkezett date,
    CONSTRAINT termek_pkey PRIMARY KEY (id),
    CONSTRAINT termek_id_key UNIQUE (id)
)

TABLESPACE pg_default;

ALTER TABLE public.termek
    OWNER to postgres;
    
-- Constraint: termek_id_key

-- ALTER TABLE public.termek DROP CONSTRAINT termek_id_key;

ALTER TABLE public.termek
    ADD CONSTRAINT termek_id_key UNIQUE (id);
    
-- Constraint: termek_pkey

-- ALTER TABLE public.termek DROP CONSTRAINT termek_pkey;

ALTER TABLE public.termek
    ADD CONSTRAINT termek_pkey PRIMARY KEY (id);

INSERT INTO admin (id, nev, password) VALUES
(1, 'Becskei Denisz', NULL),
(2, 'Barna Tibor', NULL),
(3, 'Kertész-Farkas Gábor', NULL),
(4, 'Almási Dániel', NULL),
(5, 'Dr. Kertész Attila', NULL);

INSERT INTO hirlevel (id, cim, szerzo, megjelenes_ideje, tartalom) VALUES
(1, '25%-os akció', 4, '2020-10-28', 'Kedves Vásárlóink!\r\n\r\nEzen a pénteken minden termékünkre 25%-os kedvezményt adunk a törzsvásárlói kártyával rendelkezők részére\r\n\r\nTisztelettel,\r\na Kütyüshop csapata'),
(2, 'Megnyitottunk', 4, '2020-10-28', 'Tisztelt Vásárlóink!\r\n\r\nEzúton szeretnénk értesíteni Önöket, hogy üzletünk a mai napon elkezdte működését.\r\n\r\nÜdvözlettel,\r\na Kütyüshop csapata'),
(3, 'Hűségkártya', 4, '2020-10-31', 'Kedves Vásárlóink!\r\n\r\nA mai naptól igényelhető nálunk a Kütyüshop hűségkártya, amelyre gyűjthetik a pontokat. Minden elköltött 1000 forint után 1 pontot írunk jóvá, amely aztán beváltható az akcióban meghatározott termékek vásárlásakor (1 pont = 100 Ft).\r\n\r\nÜdvözlettel,\r\na Kütyüshop csapata'),
(4, 'Már elfogadunk American Express kártyát is', 4, '2020-10-31', 'Kedves American Express kártyatulajdonosok!\r\n\r\nEzúton szeretnénk tájékoztatni Önöket, hogy webshopunk 2020. november 1-jétől elfogad American Express hitel- illetve bankkártyát is.\r\n\r\nÜdvözlettel,\r\na Kütyüshop csapata'),
(5, 'Karbantartás', 4, '2020-11-05', 'Kedves Vásárlóink!\r\n\r\nÉrtesítjük Önöket, hogy webshopunk 2020. november 06-án 23:00 és 24:00 között rendszerkarbantartás miatt korlátozottan lesz elérhető.\r\n\r\nÜdvözlettel,\r\na Kütyüshop csapata'),
(6, 'Gamer gépek', 4, '2020-11-03', 'Kedves Gamer Vásárlóink!\r\n\r\nSzeretnénk figyelmükbe ajánlani, hogy üzletünkbe új gamer gépek érkeztek, amelyeket most házhozszállítási díj nélkül kiviszünk Önöknek.\r\n\r\nÜdvözlettel,\r\na Kütyüshop csapata');

INSERT INTO kikuld (id, melyik_hirlevel, melyik_user) VALUES
(1, 2, 1),
(2, 2, 3),
(3, 1, 1),
(4, 1, 4),
(5, 1, 3),
(6, 1, 5),
(7, 1, 6),
(8, 2, 4),
(10, 2, 5),
(12, 2, 6),
(13, 3, 1),
(14, 3, 3),
(15, 3, 4),
(16, 3, 5),
(17, 3, 6),
(18, 4, 1),
(19, 4, 3),
(20, 4, 5),
(21, 4, 6),
(22, 5, 1),
(23, 5, 3),
(24, 5, 4),
(25, 5, 5),
(26, 5, 6),
(27, 6, 1),
(28, 6, 3),
(29, 6, 4),
(30, 6, 5),
(31, 6, 6);

INSERT INTO panaszok (id, user_id, szamla_id, kelte, tartalom) VALUES
(1, 1, 1, '2020-10-28', 'Tisztelt Kütyüshop Ügyfélszolgálata!\r\n\r\nSzeretném tudatni Önökkel, hogy mégsem kérem a terméket.\r\n\r\nÜdvözlettel,\r\nTeszt Elek'),
(2, 6, 6, '2020-11-01', 'Tisztelt Ügyfélszolgálat!\r\n\r\nA megrendelt termékem egyáltalán nem működik. Kérem, a visszavételét!'),
(3, 7, 7, '2020-11-01', 'Tisztelt Kütyüshop csapata!\r\n\r\nMeggondoltam magam, mégsem kérem a terméket.\r\n\r\nÜdvözletem mindenkinek!');

INSERT INTO szamla (id, melyik_user, melyik_termek, kelte, termek_darabszama, osszeg, statusz, fiz_mod) VALUES
(1, 1, 2, '2020-10-28', 1, 153990, 'szállítás alatt', 'bankkártya'),
(2, 2, 2, '2020-10-28', 1, 153990, 'új, még visszavonható', 'online utalás'),
(4, 3, 7, '2020-11-01', 1, 29990, 'szállítás alatt', 'bankkártya'),
(5, 8, 17, '2020-11-01', 1, 16990, 'szállítás alatt', 'bankkártya'),
(6, 6, 8, '2020-10-30', 1, 10500, 'átvéve', 'bankkártya'),
(7, 7, 22, '2020-11-01', 1, 79990, 'új, még visszavonható', 'online utalás');

INSERT INTO termek (id, nev, kategoria, leiras, raktaronE, ar, akcio, erkezett) VALUES
(1, 'MSI B450 TOMAHAWK MAX ATX AM4 Motherboard', 'Alaplap', 'Manufacturer: MSI\r\nPart #: B450 TOMAHAWK MAX\r\nSocket / CPU: AM4\r\nForm Factor: ATX\r\nChipset: AMD B450\r\nMemory Max: 64 GB\r\nMemory Type: DDR4\r\nMemory Slots: 4\r\nMemory Speed:\r\n    DDR4-1866\r\n    DDR4-2133\r\n    DDR4-2400\r\n    DDR4-2666\r\n    DDR4-2800\r\n    DDR4-2933\r\n    DDR4-3000\r\n    DDR4-3200\r\n    DDR4-3466\r\n    DDR4-3600\r\n    DDR4-3733\r\n    DDR4-3866\r\n    DDR4-4000\r\n    DDR4-4133\r\nColor: Black\r\nSLI/CrossFire: CrossFire Capable\r\nPCI-E x16 Slots: 2\r\nPCI-E x8 Slots: 0\r\nPCI-E x4 Slots: 0\r\nPCI-E x1 Slots: 3\r\nPCI Slots: 0\r\nM.2 Slots: 2242/2260/2280/22110 M-key\r\nmSATA Slots: 0\r\nOnboard Ethernet: 1 x 1000 Mbit/s\r\nSATA 6 Gb/s: 6\r\nOnboard Video: Depends on CPU\r\nUSB 2.0 Headers: 2\r\nUSB 3.2 Gen 1 Headers: 1\r\nUSB 3.2 Gen 2 Headers: 0\r\nUSB 3.2 Gen 2x2 Headers: 0\r\nSupports ECC: No\r\nWireless Networking: None\r\nRAID Support: Yes\r\n', 1, 20000, '10%', '2020-10-25'),
(2, 'Intel Core i9-9900K Coffee Lake-R processzor, 3.60GHz, Socket 1151, Box', 'Processzor', 'Gyártó: Intel\r\nProcessszorcsalád: Intel Core i9\r\nFoglalat: LGA-1151\r\nProcesszor órajel: 3.6 GHz\r\nTurbo órajel (max): 5 GHz\r\nMagok száma: 8 db\r\nFeldolgozó szálak száma: 16 db\r\nCsomagolás: Dobozos (hűtő nélkül)\r\nGrafikus mag: Igen\r\nGrafikus mag típus: Intel UHD Graphics 630\r\nEnergiafelvétel: 95 W\r\nIntel Core i9-9900K felhasználási területe: Asztali PC', 1, 153990, NULL, '2020-10-25'),
(3, 'AMD Ryzen 5 2600X AM4 3,6GHz BOX processzor', 'Processzor', 'Extra    Wraith Spire hűtő\r\nGyártó    AMD\r\nProcessszorcsalád    AMD Ryzen\r\nFoglalat    Socket AM4\r\nProcesszor órajel    3,6 GHz\r\nTurbo órajel (max)    4,2 GHz\r\nMagok száma    6 db\r\nFeldolgozó szálak száma    12 db\r\nCsomagolás    Dobozos (hűtővel)\r\nCache memória    16 MB\r\nGrafikus mag    Nem\r\nUtasításkészlet    64-bit\r\nTechnológia    12 nm\r\nAMD Ryzen 5 2600X energiafelvétele    95 W\r\nFelhasználási terület    Asztali PC', 1, 50000, NULL, '2020-10-31'),
(4, 'Intel Core i5-10400 2,90GHz processzor', 'Processzor', 'Architektúra: 64 bit\r\nCsalád: Intel Core i5\r\nFogyasztás: 65 W\r\nGyártási technológia: Intel 14 nm\r\nHűtőborda: van\r\nHűtőventilátor: van\r\nIntel Core i5-10400 2,90 GHz processzor gyorsítótára: 12 MB\r\nMagok száma: 6\r\nSzálak száma: 12\r\nProcesszor órajele (alap): 2.90 GHz\r\nProcesszor órajele (turbo): 4.30 GHz\r\nPCI Express® Version: PCIe 3.0 x16\r\nRendszermemória típus: DDR4\r\nRendszermemória órajel: 2666 MHz\r\nRendszermemória csatorna: 2\r\nProcesszor foglalat: LGA 1200\r\nGrafikus meghajtó: Intel® UHD Graphics 630\r\n', 1, 64890, NULL, '2020-10-31'),
(5, 'ASUS PRIME H310M-R R2.0', 'Alaplap', 'Alaplap - Intel H310, DDR4 2666 MHz, 1x PCIe x16, SATA III, USB 3.1, GLAN, 8 csatornás hang, VGA, DVI, HDMI, mATX, 1151-es foglalat', 1, 18990, '10%', '2020-10-30'),
(6, 'ASUS TUF GAMING B550M-PLUS', 'Alaplap', 'Alaplap - AMD B550, 4x DDR4 4400(OC)MHz, PCIe x16 4.0, 4x SATA III, 2x M.2, DP, HDMI, USB-C 3.2 Gen 2, 2.5GLAN, 8ch audio, mATX, scAM4', 1, 42900, NULL, '2020-10-30'),
(7, 'GIGABYTE B365 M AORUS ELITE ', 'Alaplap', 'Alaplap - Intel B365, DDR4 2666MHz, 2x PCIe x16, USB 3.1 Gen 1, M.2, GLAN, HDMI, DisplayPort, DVI, 8 csatornás alaplapi hangvezérlő, RGB, mATX, 8. és 9. generációs Intel', 1, 29990, NULL, '2020-10-30'),
(8, 'Intel Core i7-9700', 'Processzor', 'Processzor - 8 magos, 8-szálas, 3 GHz, Turbo Boost technológiával akár 4,7 GHz, 12 MB L3 cache, TDP 65 W, Intel UHD Graphics 630, 1,2 GHz, Coffee Lake refresh, hűtő, Intel 1151 foglalat ', 1, 105000, NULL, '2020-10-29'),
(9, 'Kingston HyperX Predator 16GB (2x8GB) DDR4 3200MHz HX432C16PB3K2/16 ', 'RAM', 'Kapacitás	16 GB\r\nKiszerelés	2x8GB\r\nMemória típusa	DDR4\r\nSebesség	3200 MHz\r\nTöbbcsatornás kiszerelés\r\nDual-channel kiszerelés\r\nMemóriakésleltetés 	CL 16\r\nHűtőborda 	Van\r\nFeszültség	1.35 V', 1, 29000, NULL, '2020-10-29'),
(10, 'Kingston HyperX FURY 32GB (2x16GB) DDR4 3200MHz HX432C16FB3K2/32 ', 'RAM', 'Kapacitás	32 GB\r\nKiszerelés	2x16GB\r\nMemória típusa	DDR4\r\nSebesség	3200 MHz\r\nTöbbcsatornás kiszerelés\r\nDual-channel kiszerelés\r\nMemóriakésleltetés 	CL 16\r\nHűtőborda 	Van\r\nFeszültség	1.2 V', 1, 49990, NULL, '2020-10-28'),
(11, 'Crucial Ballistix 16GB (2x8GB) DDR4 3200MHz BL2K8G32C16U4B/R/W ', 'RAM', 'Kapacitás	16 GB\r\nKiszerelés	2x8GB\r\nMemória típusa	DDR4\r\nSebesség	3200 MHz\r\nTöbbcsatornás kiszerelés\r\nDual-channel kiszerelés\r\nMemóriakésleltetés 	CL 16\r\nHűtőborda 	Van\r\nFeszültség	1.3 V', 1, 22000, '10%', '2020-10-29'),
(12, 'Kingston HyperX FURY 128GB (4x32GB) DDR4 3200MHz HX432C16FB3K4/128 ', 'RAM', 'Kapacitás	128 GB\r\nKiszerelés	4x32GB\r\nMemória típusa	DDR4\r\nSebesség	3200 MHz\r\nTöbbcsatornás kiszerelés\r\nQuad-channel kiszerelés\r\nMemóriakésleltetés 	CL 16\r\nHűtőborda 	Van\r\nFeszültség	1.35 V', 0, 175000, NULL, NULL),
(13, 'ASUS Radeon RX 570 ROG STRIX GAMING Videokártya, 8GB GDDR5, 256-bit', 'Videókártya', 'A DirectCU II hűtés a szabadalmaztatott lapátformájú 0 dB-es ventilátorokkal a lehető legjobb légáramlást biztosítja, ezzel 30%-kal hűvösebben és háromszor halkabban biztosítja a teljesítményt.\r\nAz IP5X tanúsítvánnyal rendelkező ventilátorok porvédettek, emiatt hosszabb élettartamúak.\r\nAz ASUS FanConnect II hibrid vezérlésű ventilátorcsatlakozóval segíti az optimális rendszerhűtést.\r\nAz iparági különlegesség Auto-Extreme technológia és a Super Alloy Power II biztosítja a kiemelkedő minőséget és csúcskategóriás megbízhatóságot.\r\nAura RGB megvilágítás a személyes játékstílus hirdetéséhez.\r\nA GPU Tweak II és XSplit Gamecaster intuitív teljesítményhangolási szolgáltatásokat kínál és valós idejű közvetítéseket tesz lehetővé.\r\n', 1, 60990, '10%', '2020-10-29'),
(14, 'MSI Videokártya PCI-Ex16x nVIDIA RTX 2080 SUPER GAMING X TRIO 8GB DDR6', 'Videókártya', 'Kártya típus\r\nGaming	\r\nSLI támogatás\r\nNVLink	\r\nSzéria\r\nRTX 2000	\r\nGyártó\r\nnVIDIA	\r\nGyártási technológia (nanométer)\r\n12	\r\nPixel Shader verzió\r\n5.0	\r\nVertex Shader verzió\r\n5.0	\r\nRender vezetékek (db)\r\n2944	\r\nMemória kapacitás (MB)\r\n8 GB	\r\nMemória típus\r\nGDDR6	\r\nBUS memória\r\n256	\r\nMemória frekvencia (MHz)\r\n14000	\r\nSávszélesség (GB/s)\r\n448	\r\nDirect X támogatás (verzió)\r\n12	\r\nOpenGL támogatás (verzió)\r\n4.5	\r\nDisplayPort csatlakozó\r\n3	\r\nHDMI csatlakozó\r\n1	\r\nTápcsatlakozó\r\n2 x 8-pin	\r\nHűtés típus (aktív / passzív)\r\nAktív	\r\nCooler\r\nIgen	\r\nHűtő\r\nIgen', 0, 320000, NULL, NULL),
(15, 'Sapphire Radeon RX 550 Pulse Videokártya, 4GB GDDR5, 128-bit', 'Videókártya', 'Általános Slot: PCI Express 3.0 \r\nVideó processzor: Radeon RX 550 \r\nKártyatípus:                          Gaming\r\nProcesszor széria: AMD Radeon RX 500 \r\nGyártó: AMD \r\nGyártási technológia (nanométer): 14 \r\nPixel Shader verzió: 5.0 \r\nVertex Shader verzió: 5.0 \r\nProcesszor frekvencia (MHz): 1206 \r\nMemória kapacitás: 4 GB \r\nMemória típus: GDDR5 \r\nBUS memória: 128 \r\nMemória frekvencia (MHz): 7000 \r\nSávszélesség (GB/s): 112 \r\nDirect X támogatás (verzió): 12.1 \r\nOpenGL támogatás (verzió): 4.5     Technológiák:\r\nAMD Eyefinity\r\nAMD FreeSync Technology\r\nAMD CrossFire (bridgeless)\r\nXConnect™ technology\r\nHigh Dynamic Range (HDR) support \r\nCsatlakozók\r\nDisplayPort csatlakozó\r\n1 x Display Port \r\nDVI csatlakozó\r\n1 x DL-DVI-D \r\nHDMI csatlakozó\r\n1 x HDMI \r\nHűtés típus (aktív / passzív)\r\nAktív', 1, 29990, '10%', '2020-10-29'),
(16, 'MSI nVIDIA GT 710 2GB DDR3 Passzív videókártya (GT 710 2GD3H LP)', 'Videókártya', 'MSI nVIDIA GT 710 2GB DDR3 passzív videókártya\r\nÓrajel: 1600 MHz\r\nMemória: 2 GB DDR3 RAM\r\nHátoldali portok: HDMI, DVI, D-SUB\r\nMéret: 146 x 69 x 19 mm', 1, 16000, NULL, '2020-10-29'),
(17, 'Zalman 700W ZM700-LXII tápegység', 'Tápegység', 'Teljesítmény: 700W\r\nZalman 700W ZM700-LXII tápegység hatásfoka: 92%\r\n80 Plus minősítés: 80 Plus\r\nPFC: Aktív\r\nHűtőventilátor: 14 cm\r\n', 1, 16990, '10%', '2020-10-29'),
(18, 'Cooler Master MasterWatt Lite tápegység', 'Tápegység', 'Teljesítménye: 600 W\r\nVentilátor átmérője: 12 cm\r\nPFC: aktív\r\nHatásfok: 85%\r\nMéret: 150 x 140 x 86 mm\r\nCsatlakozók:\r\nMolex: 3 x\r\nSATA: 6 x\r\nFloppy: 1 x\r\n20+4 ATX csatlakozó: 1 x\r\n6+2 PCI-e csatlakozó: 2 x\r\n', 1, 23990, NULL, '2020-10-29'),
(19, 'Kingston A400 2,5\" 240GB SATA3 SSD (SA400S37/240G)', 'SSD', 'Méret: 2,5\"\r\nCsatlakozás: SATA3 (6Gb/s)\r\nKapacitás: 240GB\r\nTípus: TLC\r\nSebesség: akár 500MB/s olvasás és 350MB/s írás\r\nMéretek: 100.0mm x 69.9mm x 7.0mm\r\nSúly: 41g\r\nTBW: 80TB\r\n', 1, 10990, '10%', '2020-10-29'),
(20, 'Samsung 860 EVO 500GB SATA 2.5\" belső Solid State Drive (SSD) (MZ-76E500)', 'SSD', 'Megérkezett a Samsung legkelendőbb* SATA SSD szériájának legújabb tagja, a Samsung 860 EVO. A speciálisan PC-re és laptopra kifejlesztett SSD a legutóbbi V-NAND technológiát és robusztus irányítási algoritmust használ, emellett több méretben is elérhető.\r\nDolgozz zökkenőmentesen nagy méretű 4K videókkal és 3D adatokkal, és tárold őket biztonságosan. A legújabb alkalmazásoknak köszönhetően a 860 EVO akár nyolcszor nagyobb TBW-t (írott terabájtot)* biztosít, mint az előző széria. A legújabb V-NAND technológiával akár elérheted a 2,400 TBW-t is, vagy 5 év korlátozott garanciát!', 1, 23990, NULL, '2020-10-29'),
(21, 'PC Maxi Tower322 Intel® Core™I3 3,3GHz, 4GB RAM, 120 SSD, Noir', 'Asztali PC', 'Otthoni felhasználásra javasolt PC\r\nOperációs rendszer: Ubuntu\r\nCPU: Intel i3 3,3 GHz\r\nRAM: DDR3 GB\r\nSSD: 120 GB\r\nVideókártya: alaplapra integrált Intel HD Graphics 2500\r\nTápegység: 450 W\r\nOptikai meghajtó nélkül\r\nHűtés típusa: levegő ', 1, 49990, '10%', '2020-11-01'),
(22, 'GeFors Asztali PC Intel® i3-4130 3.40Ghz, RAM 8GB, HDD 500GB, VIDEO HD Graphics, DVD RW + Egér billentyűzet ', 'Asztali PC', 'Irodai felhasználásra ajánlott\r\nOperációs rendszer: Free DOS\r\nCPU: Intel i3 3,4 GHz\r\nAlaplap: ASRock Intel H81 chipset\r\nRAM: DDR3 8 GB 1600 MHz\r\nHDD: 500 GB SATA3\r\nVideókártya: alaplapra integrált Intel HD Graphics DDR3\r\nTápegység: ATX 500 W\r\nOptikai meghajtó: DVD-RW\r\nHűtés: levegő', 1, 79990, '5%', '2020-11-02'),
(23, 'GeFors Office i7 Asztali PC Intel® Core™ i7-4770 3.90 Ghz, RAM 16GB, HDD 1000GB, VGA Intel® HD Graphics, DVD RW', 'Asztali PC', 'Gamer felhasználásra\r\nOperációs rendszer: Free DOS\r\nCPU: Intel i7 3,1 GHz\r\nAlaplap: Intel H81\r\nRAM: DDR3 16 GB 1600 MHz\r\nHDD: 1TB SATA3\r\nSSD: 512 GB\r\nVideókártya: Intel HD Graphics DDR3\r\nTápegység: ATX 500 W\r\nOptikai meghajtó: DVD-RW\r\nHűtés: levegő', 1, 155990, NULL, '2020-11-01'),
(24, 'GeFors OFFICE PRIME Asztali PC Intel® Core™ i3-6100 3.20 Ghz, RAM 8GB, HDD 500GB, Video Intel®HD Graphics 530, DVD RW', 'Asztali PC', 'Otthoni és irodai felhasználásra ajánlott\r\nOperációs rendszer: Free DOS\r\nCPU: Intel i3 3,2 GHz\r\nAlaplap: Biostar Intel H110 chipset\r\nRAM: DDR3 8 GB 1600 MHz\r\nHDD: 500 GB SATA3\r\nVideókártya: alaplapra integrált ntel HD Graphics 530 DDR3\r\nTápegység: ATX 500 W\r\nOptikai meghajtó: DVD-RW\r\nHútés_ levegő', 0, 99990, NULL, NULL),
(25, 'SmartPC Cronos 610 Asztali PC Intel Core i5-9600KF 3,7 GHz, 16 GB DDR4 RAM, 256 GB NVMe SSD, 1 TB SATA HDD', 'Asztali PC', 'Gamer számítógép\r\nCPU: Intel i5\r\nAlaplap: Gigabyte Intel Z390 chipset\r\nRAM: DDR4 16 GB 3000 MHz\r\nHDD: 1 TB SATA3\r\nSSD: 256 GB\r\nVideókártya: dedikált nVidia GeForce RTX GDDR6\r\nTápegység: ATX 700 W\r\nOptikai meghajtó nélkül\r\nHűtés típusa: víz', 0, 550000, NULL, NULL),
(26, 'Asus E402YA-GA002TS 14\" HD notebook, kék + Windows 10 operációs rendszer', 'Laptop', 'Garancia\r\n2 éves\r\nGyártó\r\nASUS\r\nProcesszor típus\r\nAMD Dual Core E2-7015\r\nProcesszor frekvencia\r\n1,5 GHz\r\nMemória\r\n4 GB DDR3\r\nMemória típusa\r\nDDR3\r\nHáttértár kapacitás\r\n64 GB\r\nKijelző méret\r\n14 \"\r\nKijelző típusa\r\nLED\r\nKijelző felbontás\r\n1366 x 768 Pixel\r\nOptikai meghajtó\r\nnincs\r\nWLAN típusa\r\n802.11ac\r\nKártyaolvasó\r\nSD\r\nBillentyűzet kiosztás\r\nMagyar\r\nSzín\r\nKék\r\nMéret (Hossz x Vastagság x Szélesség)\r\n235 x 21.9 x 339 mm\r\nSúly\r\n1,65 kg\r\nExtrák\r\nbeépített webkamera, bluetooth 4.1, ASUS Sonic Master\r\nCsatlakozók\r\nHDMI, 1x USB 3.0, Fülhallgató kimenet, 1x USB 2.0, 1x USB Type-C\r\nAudio csatlakozók\r\nfülhallgató kimenet\r\nOperációs rendszer\r\nWindows 10 Home S\r\nOp. rendszer kompatibilitás\r\nWindows 10', 1, 10990, NULL, '2020-11-01'),
(27, 'HP 14S-DQ1003NH 8BT90EA#AKC notebook, fehér + Windows10', 'Laptop', 'Garancia\r\n3 éves\r\nGyártó\r\nHP\r\nProcesszor típus\r\nIntel® Core™ i3-1005G1\r\nProcesszor frekvencia\r\n1,2 GHz\r\nProcesszor FSB frekvencia\r\n2666 MHz\r\nChipkészlet\r\nIntel® SoC\r\nGrafikus vezérlő\r\nIntel® UHD Graphics\r\nGrafikus vezérlő memória\r\nmegosztott\r\nMemória\r\n4 GB DDR4\r\nMemóriahelyek száma\r\n2 db\r\nMemória max. bővíthetőség\r\n16 GB\r\nMemória típusa\r\nDDR4\r\nHáttértár kapacitás\r\n256 GB SSD\r\nMerevlemez fordulatszám\r\nM.2 SSD\r\nKijelző méret\r\n14 \"\r\nKijelző típusa\r\nAntiglare, FHD IPS WLED\r\nKijelző felbontás\r\n1920 x 1080 Pixel\r\nOptikai meghajtó\r\nnincs\r\nHálózat\r\nWiFi, 10/100/1000 LAN, Bluetooth 4.2, IEEE 802.11a/b/g/n/ac\r\nWLAN típusa\r\n802.11ac, 802.11b/g/n\r\nKártyaolvasó\r\nSD\r\nBillentyűzet kiosztás\r\nMagyar\r\nSzín\r\nFehér\r\nMéret (Hossz x Vastagság x Szélesség)\r\n32,4 x 22,5 x 1,79 cm\r\nSúly\r\n1,46 kg\r\nTartozékok\r\nakkumulátor, hálózati töltő, szoftverek, felhasználói útmutató\r\nExtrák\r\n16:9-es képarány, beépített mikrofon, beépített hangszóró, Full HD felbontású LED kijelző, Bluetooth 4.2, matt kijelző, HD webkamera\r\nCsatlakozók\r\nHDMI, 1x USB 3.1 Type-C, 2 x USB 3.1, COMBO audio jack\r\nAudio csatlakozók\r\nfülhallgató kimenet/mikrofon bemenet\r\nOperációs rendszer\r\nWindows 10 Home\r\nAkkumulátor típus\r\nLi-ion\r\nAkkumulátor teljesítmény\r\n41 Wh\r\nAkkumulátor cellaszám\r\n3', 1, 189000, NULL, '2020-11-01'),
(28, 'Lenovo IdeaPad 3-15IIL05 81WE008NHV notebook, szürke + Windows10 Home S', 'Laptop', 'Garancia\r\n2 éves\r\nGyártó\r\nLENOVO\r\nProcesszor típus\r\nIntel® Core™ i3-1005G1\r\nProcesszor frekvencia\r\n1,2 GHz\r\nChipkészlet\r\nIntel® SoC\r\nGrafikus vezérlő\r\nIntel® UHD Graphics\r\nGrafikus vezérlő memória\r\nmegosztott\r\nMemória\r\n4 GB DDR4\r\nMemóriahelyek száma\r\n1 db, alaplapra szerelt memória\r\nMemória max. bővíthetőség\r\n12 GB\r\nMemória típusa\r\nDDR4\r\nHáttértár kapacitás\r\n128 GB SSD\r\nMerevlemez fordulatszám\r\nM.2 SSD\r\nKijelző méret\r\n15,6 \"\r\nKijelző típusa\r\nFullHD, Antiglare\r\nKijelző felbontás\r\n1920 x 1080 Pixel\r\nOptikai meghajtó\r\nnincs\r\nHálózat\r\nWireless 802.11ac, Bluetooth 5.0\r\nWLAN típusa\r\n802.11ac\r\nKártyaolvasó\r\n4in1\r\nBillentyűzet kiosztás\r\nMagyar\r\nSzín\r\nSzürke\r\nMéret (Hossz x Vastagság x Szélesség)\r\n253,4 x 19,99 x 362,2 mm\r\nSúly\r\n1,85 kg\r\nTartozékok\r\nakkumulátor, hálózati töltő, szoftverek, felhasználói útmutató\r\nExtrák\r\nTPM, beépített mikrofon, Full HD felbontású LED kijelző, matt kijelző, 16:9-es képarány, teljes billentyűzet, beépített sztereó hangszórók, HD webkamera, ujjlenyomat olvasó\r\nCsatlakozók\r\nHDMI, COMBO audio jack, többformátumú SD memóriakártya-olvasó, 1x USB 2.0, 2 x USB 3.1\r\nAudio csatlakozók\r\nfülhallgató kimenet/mikrofon bemenet\r\nOperációs rendszer\r\nWindows 10 Home S\r\nAkkumulátor típus\r\nLi-Polymer 35 Wh\r\nAkkumulátor teljesítmény\r\nmax. 7,3 óra\r\nAkkumulátor cellaszám\r\n2', 1, 159000, NULL, '2020-11-02'),
(29, 'Xiaomi Redmi Note 9 Pro 6GB/128GB Dual SIM kártyafüggetlen okostelefon, Tropical Green', 'Telefon', 'Gyártó\r\nXIAOMI\r\nGarancia\r\n2 éves\r\nProcesszor sebesség\r\n2,3 GHz Octa-Core (nyolcmagos)\r\nKialakítás\r\nérintőképernyős\r\nElőlapi Kamera\r\n16 megapixel\r\nHátlapi Kamera\r\n2 megapixel, 5 megapixel, 8 megapixel, 64 megapixel\r\nSIM foglalat\r\nNano\r\nCsatlakozó\r\nBluetooth, 3,5 mm Jack, NFC, WIFI, USB Type-C\r\nDoboz tartalma\r\ntok, felhasználói útmutató, jótállási jegy, USB-C típusú kábel, hálózati adapter, SIM tű\r\nMemóriakártya-foglalat\r\nmicroSD\r\nWLAN típusa\r\n802.11a/b/g/n, 802.11ac\r\nOperációs rendszer\r\nAndroid MIUI 11\r\nMemória bővíthetősége\r\n512 GB\r\nHátlap anyaga\r\nÜveg\r\nMéret\r\n165,75 x 76,68 x 8,8 mm\r\nSúly\r\n209 g\r\nAkkumulátor típus\r\nLi-polimer\r\nKijelzőméret\r\n6,67 \"\r\nKijelző felbontása\r\n1080 x 2400 Pixel\r\nMemória\r\n6 GB RAM/ 128 GB ROM\r\nHálózat\r\nAdatátvitel\r\nWCDMA, USB, Bluetooth, WiFi, LTE, GSM, NFC\r\nBeépített GPS-vevő\r\nvan\r\nAkkumulátor\r\nLi-Polymer, 5020 mAh\r\nBeszélgetési idő\r\n33 óra\r\nKészenléti idő\r\n147 óra zenelejátszás, 16 óra folyamatos navigáció, 13 óra játékidő', 1, 99990, NULL, '2020-11-01'),
(30, 'Apple iPhone 11 64GB (mwlt2gh/a), fekete', 'Telefon', 'Gyártó\r\nApple\r\nGarancia\r\n1 éves\r\nKialakítás\r\nérintőképernyős\r\nElőlapi Kamera\r\n12 megapixel\r\nHátlapi Kamera\r\n12 megapixel\r\nSIM foglalat\r\nNano, eSIM\r\nCsatlakozó\r\nLightning, Bluetooth, NFC, WIFI, AirPlay™\r\nDoboz tartalma\r\nmobilkészülék, töltő, EarPods Lightning csatlakozóval, Lightning–USB átalakító kábel\r\nWLAN típusa\r\n802.11ax, 802.11ac\r\nOperációs rendszer\r\niOS 13\r\nHátlap anyaga\r\nÜveg\r\nMéret\r\n75,7 x 8,3 x 150,9 mm\r\nSúly\r\n194 g\r\nAkkumulátor típus\r\nLi-ion\r\nKijelzőméret\r\n6,1 \"\r\nKijelző felbontása\r\n1792 x 828 Pixel\r\nMemória\r\n4 GB RAM / 64 GB ROM\r\nHálózat\r\nAdatátvitel\r\nBluetooth, WiFi, NFC, 4G LTE\r\nBeépített GPS-vevő\r\nvan\r\nÜzemidő\r\nAkkumulátor\r\nLi-ion, 3110 mAh', 0, 250000, NULL, NULL),
(31, 'pple iPhone SE 2020 128GB okostelefon, piros', 'Telefon', 'Gyártó\r\nApple\r\nGarancia\r\n1 éves\r\nProcesszor sebesség\r\nHexa-core (2x2.65 GHz + 4x1.8 GHz)\r\nKialakítás\r\nérintőképernyős\r\nElőlapi Kamera\r\n7 megapixel\r\nHátlapi Kamera\r\n12 megapixel\r\nSIM foglalat\r\nNano\r\nCsatlakozó\r\nLightning\r\nDoboz tartalma\r\nadatkábel, EarPods Lightning csatlakozóval, hálózati adapter\r\nWLAN típusa\r\n802.11ax, 802.11a/b/g/n\r\nOperációs rendszer\r\niOS 13\r\nHátlap anyaga\r\nÜveg\r\nMéret\r\n138,4 x 67,3 x 7,3 mm\r\nSúly\r\n148 gramm\r\nAkkumulátor típus\r\nLi-ion\r\nKijelzőméret\r\n4,7 \"\r\nKijelző felbontása\r\n1334 x 750 Pixel\r\nKijelző színmélysége\r\n16 millió színű\r\nMemória\r\n3 GB RAM / 128 GB ROM\r\nHálózat\r\nMűködési frekvencia\r\n900 MHz, 1 800 MHz, 1 900 MHz, 2 100 MHz, 850 MHz, 1 700 MHz, 800 MHz\r\nAdatátvitel\r\nUSB, Bluetooth, WiFi, NFC, 4G\r\nBeépített GPS-vevő\r\nvan\r\nÜzemidő\r\nAkkumulátor\r\n1821 mAh (Li-Ion)', 0, 185000, NULL, NULL),
(32, 'Huawei P smart 2019 Dual SIM kártyafüggetlen okostelefon, Aurora Blue (Android)', 'Telefon', 'Gyártó\r\nHUAWEI\r\nGarancia\r\n2 éves\r\nProcesszor sebesség\r\nOcta Core (4 x 2,2 GHz + 4 x 1,7 GHz)\r\nKialakítás\r\nérintőképernyős\r\nElőlapi Kamera\r\n8 megapixel\r\nHátlapi Kamera\r\n2 megapixel, 13 megapixel\r\nSIM foglalat\r\nNano\r\nCsatlakozó\r\nBluetooth, Micro USB, 3,5 mm Jack, NFC, WIFI, USB-OTG\r\nDoboz tartalma\r\nUSB kábel, felhasználói útmutató, töltő, SIM tű\r\nMemóriakártya-foglalat\r\nmicroSD\r\nWLAN típusa\r\n802.11a/b/g/n, 802.11ac\r\nOperációs rendszer\r\nAndroid™ 9.0 Pie\r\nMemória bővíthetősége\r\n512 GB\r\nMéret\r\n155,2 x 73,4 x 7,95 mm\r\nSúly\r\nKb. 160 g\r\nAkkumulátor típus\r\nLi-polimer\r\nKijelzőméret\r\n6,21 \"\r\nKijelző felbontása\r\n2340 x 1080 Pixel\r\nKijelző színmélysége\r\n6,7 millió színű\r\nMemória\r\n3 GB RAM / 64 GB ROM\r\nHálózat\r\nAdatátvitel\r\n3G, WCDMA, USB, Bluetooth, WiFi, 2G, GSM, NFC, 4G LTE\r\nBeépített GPS-vevő\r\nvan\r\nÜzemidő\r\nAkkumulátor\r\nLi-Polymer, 3400 mAh\r\nBeszélgetési idő\r\nLegfeljebb 25 óra (3G)\r\nKészenléti idő\r\nLTE FDD: 653 óra, WCDMA: 800 óra, GSM: 738 óra', 1, 52990, '10%', '2020-11-01');

INSERT INTO felh (id, name, email, password, isActive, hirlevelE, telefonszam, iranyitoszam, telepules, utca, hazszam_ajto) VALUES
(1, 'Teszt Elek', 'tesztelek@gmail.com', '123456', 1, 1, '+36/30-111-1111', '6722', 'Szeged', 'Nevesincs u.', '1.'),
(2, 'Teszt Enikő', 'teszteniko@gmail.com', '654321', 1, 0, '+36/20/222-2222', '6723', 'Szeged', 'Sosevolt u.', '1.'),
(3, 'Kiss István', 'kiss@yahoo.com', '55555', 1, 1, '+36/20-999-9999', '6723', 'Szeged', 'Nevesincs u.', '3. 3. em. 3. a.'),
(4, 'Erős István', 'erospista@freemail.hu', '4444', 1, 1, '+36/30/555-5555', '6725', 'Szeged', 'Londoni krt.', '1.'),
(5, 'Ebéd Elek', 'elek@gmail.com', '1234567890', 1, 1, '+36/40-667-8888', '6720', 'Szeged', 'Dóm tér', '1.'),
(6, 'Mekk Elek', 'mekk@gmail.com', 'mekk-mekk', 1, 1, '+36/20/000-0000', '6730', 'Szeged', 'Sosevolt u.', '3. 9. em. 6. a.'),
(7, 'Pesti István', 'pestipista@gmail.com', 'pestipista', 1, 0, '+36/20/555-5555', '1007', 'Budapest', 'Pesti u.', '1.'),
(8, 'Pesti Péter', 'pestipeti@gmail.com', 'pp000000', 1, 0, '+36/20/000-00000', '1007', 'Budapest', 'Pesti u.', '2. 2. em. 2. a.');
