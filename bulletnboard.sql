  
  CREATE TABLE "SCOTT"."BULLETINBOARD" 
   (	"BOARD_ID" NUMBER(8,0) NOT NULL ENABLE, 
	"TITLE" VARCHAR2(1000 CHAR) NOT NULL ENABLE, 
	"NICKNAME" VARCHAR2(100 CHAR), 
	"USER_ID" VARCHAR2(100 CHAR), 
	"TIME" DATE DEFAULT systimestamp, 
	"VIEWS" NUMBER(8,0) DEFAULT 0, 
	"RECOMMEND" NUMBER(8,0) DEFAULT 0, 
	"CONTENT" VARCHAR2(3000 CHAR) NOT NULL ENABLE, 
	"IMAGE" VARCHAR2(200 CHAR) DEFAULT NULL, 
	"CATEGORY" NUMBER(1,0) DEFAULT 1, 
	 CONSTRAINT "BULLETINBOARD_PK" PRIMARY KEY ("BOARD_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "SCOTT"."BULLETINBOARD_TRG1" 
BEFORE INSERT ON BULLETINBOARD 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "SCOTT"."BULLETINBOARD_TRG1" ENABLE;

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "SCOTT"."BULLETINBOARD_TRG" 
BEFORE INSERT ON BULLETINBOARD 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "SCOTT"."BULLETINBOARD_TRG" ENABLE;

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "SCOTT"."BULLETINBOARD_TRG2" 
BEFORE INSERT ON BULLETINBOARD 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "SCOTT"."BULLETINBOARD_TRG2" ENABLE;

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "SCOTT"."BULLETINBOARD_TRG3" 
BEFORE INSERT ON BULLETINBOARD 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.BOARD_ID IS NULL THEN
      SELECT BULLETINBOARD_SEQ3.NEXTVAL INTO :NEW.BOARD_ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "SCOTT"."BULLETINBOARD_TRG3" ENABLE;
