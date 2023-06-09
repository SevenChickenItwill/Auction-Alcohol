--------------------------------------------------------
--  파일이 생성됨 - 금요일-6월-02-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table KAKAOPAYRESPONSE
--------------------------------------------------------

  CREATE TABLE "SCOTT"."KAKAOPAYRESPONSE" 
   (	"TID" VARCHAR2(50 BYTE), 
	"NEXT_REDIRECT_PC_URL" VARCHAR2(300 BYTE), 
	"CREATED_AT" TIMESTAMP (6)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
REM INSERTING into SCOTT.KAKAOPAYRESPONSE
SET DEFINE OFF;
--------------------------------------------------------
--  Constraints for Table KAKAOPAYRESPONSE
--------------------------------------------------------

  ALTER TABLE "SCOTT"."KAKAOPAYRESPONSE" MODIFY ("TID" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."KAKAOPAYRESPONSE" MODIFY ("NEXT_REDIRECT_PC_URL" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."KAKAOPAYRESPONSE" MODIFY ("CREATED_AT" NOT NULL ENABLE);
