--------------------------------------------------------
--  파일이 생성됨 - 금요일-6월-09-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table KAKAOPAY
--------------------------------------------------------

  CREATE TABLE "SCOTT"."KAKAOPAY" 
   (	"CID" VARCHAR2(100 BYTE), 
	"PARTNER_ORDER_ID" VARCHAR2(100 BYTE), 
	"PARTNER_USER_ID" VARCHAR2(100 BYTE), 
	"ITEM_NAME" VARCHAR2(100 BYTE), 
	"QUANTITY" NUMBER(*,0), 
	"TOTAL_AMOUNT" NUMBER(10,0), 
	"TEX_FREE_AMOUNT" NUMBER(10,0), 
	"APPROVAL_URL" VARCHAR2(300 BYTE), 
	"CANCEL_URL" VARCHAR2(300 BYTE), 
	"FAIL_URL" VARCHAR2(300 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
REM INSERTING into SCOTT.KAKAOPAY
SET DEFINE OFF;
--------------------------------------------------------
--  Constraints for Table KAKAOPAY
--------------------------------------------------------

  ALTER TABLE "SCOTT"."KAKAOPAY" MODIFY ("CID" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."KAKAOPAY" MODIFY ("PARTNER_ORDER_ID" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."KAKAOPAY" MODIFY ("PARTNER_USER_ID" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."KAKAOPAY" MODIFY ("ITEM_NAME" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."KAKAOPAY" MODIFY ("QUANTITY" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."KAKAOPAY" MODIFY ("TOTAL_AMOUNT" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."KAKAOPAY" MODIFY ("TEX_FREE_AMOUNT" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."KAKAOPAY" MODIFY ("APPROVAL_URL" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."KAKAOPAY" MODIFY ("CANCEL_URL" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."KAKAOPAY" MODIFY ("FAIL_URL" NOT NULL ENABLE);
