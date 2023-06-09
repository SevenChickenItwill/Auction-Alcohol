--------------------------------------------------------
--  파일이 생성됨 - 금요일-6월-09-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table COMMENDUP
--------------------------------------------------------

  CREATE TABLE "SCOTT"."COMMENDUP" 
   (	"BOARD_ID" NUMBER(8,0), 
	"RECOMMENDER_ID" VARCHAR2(100 CHAR)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
REM INSERTING into SCOTT.COMMENDUP
SET DEFINE OFF;
--------------------------------------------------------
--  Ref Constraints for Table COMMENDUP
--------------------------------------------------------

  ALTER TABLE "SCOTT"."COMMENDUP" ADD CONSTRAINT "COMMEND_BOARD_ID_FK" FOREIGN KEY ("BOARD_ID")
	  REFERENCES "SCOTT"."BULLETINBOARD" ("BOARD_ID") ENABLE;
