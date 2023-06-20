--------------------------------------------------------
--  파일이 생성됨 - 화요일-6월-20-2023   
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
