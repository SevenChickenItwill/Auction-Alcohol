-------------------------------------------------------- 
--  파일이 생성됨 - 화요일-6월-20-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table COMMENDDOWN
--------------------------------------------------------

  CREATE TABLE "SCOTT"."COMMENDDOWN" 
   (	"BOARD_ID" NUMBER(8,0), 
	"RECOMMENDER_ID" VARCHAR2(100 CHAR)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
  
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Ref Constraints for Table COMMENDDOWN
--------------------------------------------------------

  ALTER TABLE "SCOTT"."COMMENDDOWN" ADD CONSTRAINT "COMMENDERDOWN_BOARD_ID_FK" FOREIGN KEY ("BOARD_ID")
	  REFERENCES "SCOTT"."BULLETINBOARD" ("BOARD_ID") ENABLE;
  ALTER TABLE "SCOTT"."COMMENDDOWN" ADD CONSTRAINT "RECOMMENDDOWN_RECOMMENDER_ID_FK" FOREIGN KEY ("RECOMMENDER_ID")
	  REFERENCES "SCOTT"."USERS" ("USERNICKNAME") DISABLE;
