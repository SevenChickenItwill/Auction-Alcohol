--------------------------------------------------------
--  파일이 생성됨 - 수요일-6월-14-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table PRODUCTPHOTO
--------------------------------------------------------

  CREATE TABLE "SCOTT"."PRODUCTPHOTO" 
   (	"PRODUCTID" NUMBER(8,0), 
	"PHOTOPATH" VARCHAR2(999 CHAR)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into SCOTT.PRODUCTPHOTO
SET DEFINE OFF;
Insert into SCOTT.PRODUCTPHOTO (PRODUCTID,PHOTOPATH) values (24,'C:\mid-pj\middlePj\alcohol\src\main\webapp\static\image\a89543a5-2c38-4044-ae74-904278a104bcdefaultimg.jpg');
Insert into SCOTT.PRODUCTPHOTO (PRODUCTID,PHOTOPATH) values (1,'C:\mid-pj\middlePj\alcohol\src\main\webapp\static\image\f88ef493-6c1e-42fb-8e16-1264411f386ddefaultimg.jpg');
