--------------------------------------------------------
--  파일이 생성됨 - 화요일-6월-20-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table USERAUCTION
--------------------------------------------------------

  CREATE TABLE "SCOTT"."USERAUCTION" 
   (	"CID" NUMBER(8,0), 
	"CHATROOM" VARCHAR2(20 CHAR), 
	"MEMBETCOUNT" NUMBER(10,0) DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CI_UA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."CI_UA_PK" ON "SCOTT"."USERAUCTION" ("CID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Trigger USERAUCTION_TRG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "SCOTT"."USERAUCTION_TRG" 
BEFORE INSERT ON USERAUCTION 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;

/
ALTER TRIGGER "SCOTT"."USERAUCTION_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger USERAUCTION_TRG2
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "SCOTT"."USERAUCTION_TRG2" 
BEFORE INSERT ON USERAUCTION 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "SCOTT"."USERAUCTION_TRG2" ENABLE;
--------------------------------------------------------
--  DDL for Trigger USERAUCTION_TRG1
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "SCOTT"."USERAUCTION_TRG1" 
BEFORE INSERT ON USERAUCTION 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "SCOTT"."USERAUCTION_TRG1" ENABLE;
--------------------------------------------------------
--  Constraints for Table USERAUCTION
--------------------------------------------------------

  ALTER TABLE "SCOTT"."USERAUCTION" ADD CONSTRAINT "CI_UA_PK" PRIMARY KEY ("CID")
  USING INDEX "SCOTT"."CI_UA_PK"  ENABLE;
  ALTER TABLE "SCOTT"."USERAUCTION" MODIFY ("CHATROOM" NOT NULL ENABLE);
