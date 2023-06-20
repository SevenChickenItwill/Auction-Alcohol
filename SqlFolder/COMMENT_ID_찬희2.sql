--------------------------------------------------------
--  파일이 생성됨 - 화요일-6월-20-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table COMMENTS
--------------------------------------------------------

  CREATE TABLE "SCOTT"."COMMENTS" 
   (	"COMMENT_ID" NUMBER(8,0), 
	"BOARD_ID" NUMBER(8,0), 
	"NICKNAME" VARCHAR2(20 CHAR), 
	"CONTENT" VARCHAR2(500 CHAR), 
	"TIME" DATE DEFAULT systimestamp
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index COMMENTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."COMMENTS_PK" ON "SCOTT"."COMMENTS" ("COMMENT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Trigger COMMENTS_TRG1
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "SCOTT"."COMMENTS_TRG1" 
BEFORE INSERT ON COMMENTS 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;

/
ALTER TRIGGER "SCOTT"."COMMENTS_TRG1" ENABLE;
--------------------------------------------------------
--  DDL for Trigger COMMENTS_TRG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "SCOTT"."COMMENTS_TRG" 
BEFORE INSERT ON COMMENTS 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;

/
ALTER TRIGGER "SCOTT"."COMMENTS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger COMMENTS_TRG2
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "SCOTT"."COMMENTS_TRG2" 
BEFORE INSERT ON COMMENTS 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;

/
ALTER TRIGGER "SCOTT"."COMMENTS_TRG2" ENABLE;
--------------------------------------------------------
--  DDL for Trigger COMMENTS_TRG3
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "SCOTT"."COMMENTS_TRG3" 
BEFORE INSERT ON COMMENTS 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "SCOTT"."COMMENTS_TRG3" ENABLE;
--------------------------------------------------------
--  DDL for Trigger COMMENTS_TRG4
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "SCOTT"."COMMENTS_TRG4" 
BEFORE INSERT ON COMMENTS 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.COMMENT_ID IS NULL THEN
      SELECT COMMENTS_SEQ1.NEXTVAL INTO :NEW.COMMENT_ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "SCOTT"."COMMENTS_TRG4" ENABLE;
--------------------------------------------------------
--  Constraints for Table COMMENTS
--------------------------------------------------------

  ALTER TABLE "SCOTT"."COMMENTS" MODIFY ("CONTENT" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."COMMENTS" MODIFY ("COMMENT_ID" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."COMMENTS" ADD CONSTRAINT "COMMENTS_PK" PRIMARY KEY ("COMMENT_ID")
  USING INDEX "SCOTT"."COMMENTS_PK"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table COMMENTS
--------------------------------------------------------

  ALTER TABLE "SCOTT"."COMMENTS" ADD CONSTRAINT "BULLETINBOARD_BOARD_ID_FK" FOREIGN KEY ("BOARD_ID")
	  REFERENCES "SCOTT"."BULLETINBOARD" ("BOARD_ID") ENABLE;
