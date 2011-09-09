
drop table PRINCIPAL_LANGUAGE_3 cascade constraints purge;
drop table PRINCIPAL_LANGUAGE_2 cascade constraints purge;
drop table PRINCIPAL_LANGUAGE_1 cascade constraints purge;
drop table TOURIST_ATTRACION_3 cascade constraints purge;
drop table TOURIST_ATTRACION_2 cascade constraints purge;
drop table REGION cascade constraints purge;
drop table OFFICIAL_LANGUAGE cascade constraints purge;
drop table COUNTRY cascade constraints purge;
drop table POPULATION cascade constraints purge;
drop table TOURIST_ATTRACION_1 cascade constraints purge;
drop table CITY cascade constraints purge;
drop table FLIGHT_DETAIL cascade constraints purge;
drop table FLIGHT_STATUS cascade constraints purge;

CREATE TABLE ass2-schema.Principal_language_3 (
                Princ_lang_code3 CHAR(2) NOT NULL,
                Princ_lang_name3 VARCHAR2(20) NOT NULL,
                CONSTRAINT PRINC_LANG_NAME3 PRIMARY KEY (Princ_lang_code3)
);

CREATE TABLE ass2-schema.Principal_language_2 (
                Princ_lang_code2 CHAR(2) NOT NULL,
                Princ_lang_name2 VARCHAR2(20) NOT NULL,
                CONSTRAINT PRINC_LANG_CODE2 PRIMARY KEY (Princ_lang_code2)
);

CREATE TABLE ass2-schema.Principal_language_1 (
                Princ_lang_code1 CHAR(2) NOT NULL,
                Princ_lang_name1 VARCHAR2(20) NOT NULL,
                CONSTRAINT PRINC_LANG_CODE1 PRIMARY KEY (Princ_lang_code1)
);

CREATE TABLE ass2-schema.Tourist_attraction_3 (
                Attrac_name3 VARCHAR2(60) NOT NULL,
                Attrac_type3 CHAR(2) NOT NULL,
                Phone3 VARCHAR2(20) NOT NULL,
                Address3 VARCHAR2(100) NOT NULL,
                Character_desc3 VARCHAR2(200) NOT NULL,
                CONSTRAINT ATTRACT_NAME3 PRIMARY KEY (Attrac_name3)
);

CREATE TABLE ass2-schema.Tourist_attraction_2 (
                Attrac_name2 VARCHAR2(60) NOT NULL,
                Attrac_type2 CHAR(2) NOT NULL,
                Phone2 VARCHAR2(20) NOT NULL,
                Address2 VARCHAR2(100) NOT NULL,
                Character_desc2 VARCHAR2(200) NOT NULL,
                CONSTRAINT ATTRAC_NAME2 PRIMARY KEY (Attrac_name2)
);

CREATE TABLE ass2-schema.Region (
                Region_code CHAR(6) NOT NULL,
                Region_name VARCHAR2(40) NOT NULL,
                CONSTRAINT REGION_CODE PRIMARY KEY (Region_code)
);

CREATE TABLE ass2-schema.Official_language (
                Offic_lang_code CHAR(2) NOT NULL,
                Offic_lang_name VARCHAR2(20) NOT NULL,
                CONSTRAINT OFFICE_LANG_CODE PRIMARY KEY (Offic_lang_code)
);

CREATE TABLE ass2-schema.Country (
                Country_code CHAR(2) NOT NULL,
                Country_name VARCHAR2(30) NOT NULL,
                Country_land_area NUMBER(8) NOT NULL,
                Currency_code CHAR(3) NOT NULL,
                Capital_city VARCHAR2(40) NOT NULL,
                Offic_lang_code CHAR(2) NOT NULL,
                Princ_lang_code1 CHAR(2) NOT NULL,
                Princ_lang_code2 CHAR(2) NOT NULL,
                Princ_lang_code3 CHAR(2) NOT NULL,
                CONSTRAINT COUNTRY_CODE PRIMARY KEY (Country_code)
);

CREATE TABLE ass2-schema.Population (
                Pop_count NUMBER NOT NULL,
                Census_date DATE NOT NULL,
                Source VARCHAR2(150) NOT NULL,
                CONSTRAINT POPULATION_COUNT PRIMARY KEY (Pop_count)
);

CREATE TABLE ass2-schema.Tourist_attraction_1 (
                Attrac_name1 VARCHAR2(60) NOT NULL,
                Phone1 VARCHAR2(20) NOT NULL,
                Attrac_type1 CHAR(2) NOT NULL,
                Address1 VARCHAR2(100) NOT NULL,
                Character_desc1 VARCHAR2(200) NOT NULL,
                CONSTRAINT ATTRAC_NAME1 PRIMARY KEY (Attrac_name1)
);

CREATE TABLE ass2-schema.City (
                City_name VARCHAR2(40) NOT NULL,
                Latitude VARCHAR2(5) NOT NULL,
                Longitude VARCHAR2(5) NOT NULL,
                Elevation NUMBER NOT NULL,
                GMT_time_zone CHAR(9) NOT NULL,
                City_land_area NUMBER(5,3) NOT NULL,
                Pop_count NUMBER NOT NULL,
                Region_code CHAR(6) NOT NULL,
                Country_code CHAR(2) NOT NULL,
                Attrac_name1 VARCHAR2(60) NOT NULL,
                Attrac_name2 VARCHAR2(60) NOT NULL,
                Attrac_name3 VARCHAR2(60) NOT NULL,
                CONSTRAINT CITY_NAME PRIMARY KEY (City_name)
);

CREATE TABLE ass2-schema.Flight_detail (
                Destination VARCHAR2(80) NOT NULL,
                City_name VARCHAR2(40) NOT NULL,
                Flight_no VARCHAR2(8) NOT NULL,
                CONSTRAINT FLIGHT_NO PRIMARY KEY (Destination, City_name)
);

CREATE TABLE ass2-schema.Flight_status (
                Flight_no VARCHAR2(8) NOT NULL,
                Scheduled_depart DATE NOT NULL,
                Actual_depart DATE,
                Scheduled_arrive DATE NOT NULL,
                Actual_arrive DATE,
                City_name VARCHAR2(40) NOT NULL,
                Destination VARCHAR2(80) NOT NULL,
                CONSTRAINT FLIGHT_NO__SCHEDULED_DEPART PRIMARY KEY (Flight_no, Scheduled_depart)
);

ALTER TABLE ass2-schema.Country ADD CONSTRAINT PRINCIPAL_LANGUAGE_3_COUNTR104
FOREIGN KEY (Princ_lang_code3)
REFERENCES ass2-schema.Principal_language_3 (Princ_lang_code3)
NOT DEFERRABLE;

ALTER TABLE ass2-schema.Country ADD CONSTRAINT PRINCIPAL_LANGUAGE_2_COUNTR385
FOREIGN KEY (Princ_lang_code2)
REFERENCES ass2-schema.Principal_language_2 (Princ_lang_code2)
NOT DEFERRABLE;

ALTER TABLE ass2-schema.Country ADD CONSTRAINT PRINCIPAL_LANGUAGE1_COUNTRY_FK
FOREIGN KEY (Princ_lang_code1)
REFERENCES ass2-schema.Principal_language_1 (Princ_lang_code1)
NOT DEFERRABLE;

ALTER TABLE ass2-schema.City ADD CONSTRAINT TOURIST_ATTRACTION_3_CITY_FK
FOREIGN KEY (Attrac_name3)
REFERENCES ass2-schema.Tourist_attraction_3 (Attrac_name3)
NOT DEFERRABLE;

ALTER TABLE ass2-schema.City ADD CONSTRAINT TOURIST_ATTRACTION_2_CITY_FK
FOREIGN KEY (Attrac_name2)
REFERENCES ass2-schema.Tourist_attraction_2 (Attrac_name2)
NOT DEFERRABLE;

ALTER TABLE ass2-schema.City ADD CONSTRAINT REGION_CITY_FK
FOREIGN KEY (Region_code)
REFERENCES ass2-schema.Region (Region_code)
NOT DEFERRABLE;

ALTER TABLE ass2-schema.Country ADD CONSTRAINT OFFICIAL_LANGUAGE_COUNTRY_FK
FOREIGN KEY (Offic_lang_code)
REFERENCES ass2-schema.Official_language (Offic_lang_code)
NOT DEFERRABLE;

ALTER TABLE ass2-schema.City ADD CONSTRAINT COUNTRY_CITY_FK
FOREIGN KEY (Country_code)
REFERENCES ass2-schema.Country (Country_code)
NOT DEFERRABLE;

ALTER TABLE ass2-schema.City ADD CONSTRAINT POPULATION_CITY_FK
FOREIGN KEY (Pop_count)
REFERENCES ass2-schema.Population (Pop_count)
NOT DEFERRABLE;

ALTER TABLE ass2-schema.City ADD CONSTRAINT TOURIST_ATTRACTION_1_CITY_FK
FOREIGN KEY (Attrac_name1)
REFERENCES ass2-schema.Tourist_attraction_1 (Attrac_name1)
NOT DEFERRABLE;

ALTER TABLE ass2-schema.Flight_detail ADD CONSTRAINT CITY_FLIGHT_DETAIL_FK
FOREIGN KEY (City_name)
REFERENCES ass2-schema.City (City_name)
NOT DEFERRABLE;

ALTER TABLE ass2-schema.Flight_status ADD CONSTRAINT FLIGHT_DETAIL_FLIGHT_STATUS_FK
FOREIGN KEY (Destination, City_name)
REFERENCES ass2-schema.Flight_detail (Destination, City_name)
NOT DEFERRABLE;
