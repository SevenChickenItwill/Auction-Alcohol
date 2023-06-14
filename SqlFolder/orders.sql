--------------------------------------------------------
--  파일이 생성됨 - 수요일-6월-14-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table ORDERS
--------------------------------------------------------

  CREATE TABLE "SCOTT"."ORDERS" 
   (	"PAYMENTID" NUMBER, 
	"PRODUCTID" NUMBER, 
	"QUANTITY" NUMBER, 
	"PRICE" NUMBER, 
	"TOTALAMOUNT" NUMBER, 
	"USERNICKNAME" VARCHAR2(20 BYTE), 
	"BASKETID" NUMBER
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
REM INSERTING into SCOTT.ORDERS
SET DEFINE OFF;
--------------------------------------------------------
--  Constraints for Table ORDERS
--------------------------------------------------------

  ALTER TABLE "SCOTT"."ORDERS" MODIFY ("PAYMENTID" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."ORDERS" MODIFY ("PRODUCTID" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."ORDERS" MODIFY ("QUANTITY" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."ORDERS" MODIFY ("PRICE" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."ORDERS" MODIFY ("TOTALAMOUNT" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."ORDERS" MODIFY ("USERNICKNAME" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."ORDERS" MODIFY ("BASKETID" NOT NULL ENABLE);
