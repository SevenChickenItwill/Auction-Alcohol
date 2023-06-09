--------------------------------------------------------
--  파일이 생성됨 - 금요일-6월-09-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table COMMENDDOWN
--------------------------------------------------------

  CREATE TABLE "SCOTT"."COMMENDDOWN" 
   (	"BOARD_ID" NUMBER(8,0), 
	"RECOMMENDER_ID" VARCHAR2(100 CHAR)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
REM INSERTING into SCOTT.COMMENDDOWN
SET DEFINE OFF;
--------------------------------------------------------
--  Ref Constraints for Table COMMENDDOWN
--------------------------------------------------------

  ALTER TABLE "SCOTT"."COMMENDDOWN" ADD CONSTRAINT "COMMENDERDOWN_BOARD_ID_FK" FOREIGN KEY ("BOARD_ID")
	  REFERENCES "SCOTT"."BULLETINBOARD" ("BOARD_ID") ENABLE;
