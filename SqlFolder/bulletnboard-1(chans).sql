--------------------------------------------------------
--  파일이 생성됨 - 금요일-6월-09-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table BULLETINBOARD
--------------------------------------------------------

  CREATE TABLE "SCOTT"."BULLETINBOARD" 
   (	"BOARD_ID" NUMBER(8,0), 
	"TITLE" VARCHAR2(1000 CHAR), 
	"NICKNAME" VARCHAR2(100 CHAR), 
	"USER_ID" VARCHAR2(100 CHAR), 
	"TIME" DATE DEFAULT systimestamp, 
	"VIEWS" NUMBER(8,0) DEFAULT 0, 
	"RECOMMEND" NUMBER(8,0) DEFAULT 0, 
	"CONTENT" VARCHAR2(3000 CHAR), 
	"CATEGORY" NUMBER(1,0) DEFAULT 1, 
	"IMAGE" BLOB
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("IMAGE") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW 4000 CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 262144 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
REM INSERTING into SCOTT.BULLETINBOARD
SET DEFINE OFF;
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1124,'수정하기','타락파워전사','wooooa',to_date('2023/06/09 12:00:22','YYYY/MM/DD HH24:MI:SS'),8,0,'수정하기',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1126,'<공지사항> 이미지','타락파워전사','wooooa',to_date('2023/06/09 12:06:26','YYYY/MM/DD HH24:MI:SS'),1,0,'이미지 테스트입니다.',1);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1125,'<공지> 이미지테스트','타락파워전사','wooooa',to_date('2023/06/09 12:03:04','YYYY/MM/DD HH24:MI:SS'),1,0,'이미지 테스티입니다.',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1007,'test0','test0','test0',to_date('2023/06/02 12:16:45','YYYY/MM/DD HH24:MI:SS'),2,2,'test0',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1008,'test1','test1','test1',to_date('2023/06/02 12:16:45','YYYY/MM/DD HH24:MI:SS'),0,0,'test1',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1009,'test2','test2','test2',to_date('2023/06/02 12:16:45','YYYY/MM/DD HH24:MI:SS'),0,0,'test2',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1010,'test3','test3','test3',to_date('2023/06/02 12:16:45','YYYY/MM/DD HH24:MI:SS'),0,0,'test3',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1011,'test4','test4','test4',to_date('2023/06/02 12:16:45','YYYY/MM/DD HH24:MI:SS'),0,0,'test4',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1012,'test5','test5','test5',to_date('2023/06/02 12:16:45','YYYY/MM/DD HH24:MI:SS'),0,0,'test5',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1013,'test6','test6','test6',to_date('2023/06/02 12:16:45','YYYY/MM/DD HH24:MI:SS'),0,0,'test6',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1014,'test7','test7','test7',to_date('2023/06/02 12:16:45','YYYY/MM/DD HH24:MI:SS'),0,0,'test7',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1015,'test8','test8','test8',to_date('2023/06/02 12:16:45','YYYY/MM/DD HH24:MI:SS'),0,0,'test8',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1016,'test9','test9','test9',to_date('2023/06/02 12:16:45','YYYY/MM/DD HH24:MI:SS'),0,0,'test9',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1017,'test10','test10','test10',to_date('2023/06/02 12:16:45','YYYY/MM/DD HH24:MI:SS'),0,0,'test10',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1018,'test11','test11','test11',to_date('2023/06/02 12:16:45','YYYY/MM/DD HH24:MI:SS'),0,0,'test11',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1019,'test12','test12','test12',to_date('2023/06/02 12:16:45','YYYY/MM/DD HH24:MI:SS'),0,0,'test12',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1020,'test13','test13','test13',to_date('2023/06/02 12:16:45','YYYY/MM/DD HH24:MI:SS'),0,0,'test13',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1021,'test14','test14','test14',to_date('2023/06/02 12:16:45','YYYY/MM/DD HH24:MI:SS'),0,0,'test14',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1022,'test15','test15','test15',to_date('2023/06/02 12:16:45','YYYY/MM/DD HH24:MI:SS'),0,0,'test15',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1023,'test16','test16','test16',to_date('2023/06/02 12:16:45','YYYY/MM/DD HH24:MI:SS'),0,0,'test16',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1024,'test17','test17','test17',to_date('2023/06/02 12:16:45','YYYY/MM/DD HH24:MI:SS'),3,0,'test17',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1025,'test18','test18','test18',to_date('2023/06/02 12:16:45','YYYY/MM/DD HH24:MI:SS'),0,0,'test18',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1026,'test19','test19','test19',to_date('2023/06/02 12:16:45','YYYY/MM/DD HH24:MI:SS'),0,0,'test19',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1027,'test20','test20','test20',to_date('2023/06/02 12:16:45','YYYY/MM/DD HH24:MI:SS'),0,0,'test20',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1028,'test21','test21','test21',to_date('2023/06/02 12:16:45','YYYY/MM/DD HH24:MI:SS'),0,0,'test21',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1029,'test22','test22','test22',to_date('2023/06/02 12:16:45','YYYY/MM/DD HH24:MI:SS'),0,0,'test22',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1030,'test23','test23','test23',to_date('2023/06/02 12:16:45','YYYY/MM/DD HH24:MI:SS'),0,0,'test23',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1031,'test24','test24','test24',to_date('2023/06/02 12:16:45','YYYY/MM/DD HH24:MI:SS'),0,0,'test24',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1032,'test25','test25','test25',to_date('2023/06/02 12:16:45','YYYY/MM/DD HH24:MI:SS'),0,0,'test25',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1033,'test26','test26','test26',to_date('2023/06/02 12:16:45','YYYY/MM/DD HH24:MI:SS'),0,0,'test26',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1034,'test27','test27','test27',to_date('2023/06/02 12:16:45','YYYY/MM/DD HH24:MI:SS'),0,0,'test27',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1035,'test28','test28','test28',to_date('2023/06/02 12:16:45','YYYY/MM/DD HH24:MI:SS'),0,0,'test28',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1036,'test29','test29','test29',to_date('2023/06/02 12:16:45','YYYY/MM/DD HH24:MI:SS'),0,0,'test29',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1037,'test30','test30','test30',to_date('2023/06/02 12:16:45','YYYY/MM/DD HH24:MI:SS'),0,0,'test30',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1038,'test31','test31','test31',to_date('2023/06/02 12:16:45','YYYY/MM/DD HH24:MI:SS'),0,0,'test31',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1039,'test32','test32','test32',to_date('2023/06/02 12:16:45','YYYY/MM/DD HH24:MI:SS'),0,0,'test32',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1040,'test33','test33','test33',to_date('2023/06/02 12:16:45','YYYY/MM/DD HH24:MI:SS'),0,0,'test33',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1041,'test34','test34','test34',to_date('2023/06/02 12:16:45','YYYY/MM/DD HH24:MI:SS'),0,0,'test34',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1042,'test35','test35','test35',to_date('2023/06/02 12:16:46','YYYY/MM/DD HH24:MI:SS'),0,0,'test35',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1043,'test36','test36','test36',to_date('2023/06/02 12:16:46','YYYY/MM/DD HH24:MI:SS'),0,0,'test36',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1044,'test37','test37','test37',to_date('2023/06/02 12:16:46','YYYY/MM/DD HH24:MI:SS'),0,0,'test37',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1045,'test38','test38','test38',to_date('2023/06/02 12:16:46','YYYY/MM/DD HH24:MI:SS'),0,0,'test38',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1046,'test39','test39','test39',to_date('2023/06/02 12:16:46','YYYY/MM/DD HH24:MI:SS'),0,0,'test39',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1047,'test40','test40','test40',to_date('2023/06/02 12:16:46','YYYY/MM/DD HH24:MI:SS'),0,0,'test40',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1048,'test41','test41','test41',to_date('2023/06/02 12:16:46','YYYY/MM/DD HH24:MI:SS'),0,0,'test41',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1049,'test42','test42','test42',to_date('2023/06/02 12:16:46','YYYY/MM/DD HH24:MI:SS'),0,0,'test42',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1050,'test43','test43','test43',to_date('2023/06/02 12:16:46','YYYY/MM/DD HH24:MI:SS'),0,0,'test43',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1051,'test44','test44','test44',to_date('2023/06/02 12:16:46','YYYY/MM/DD HH24:MI:SS'),0,0,'test44',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1052,'test45','test45','test45',to_date('2023/06/02 12:16:46','YYYY/MM/DD HH24:MI:SS'),0,0,'test45',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1053,'test46','test46','test46',to_date('2023/06/02 12:16:46','YYYY/MM/DD HH24:MI:SS'),0,0,'test46',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1054,'test47','test47','test47',to_date('2023/06/02 12:16:46','YYYY/MM/DD HH24:MI:SS'),0,0,'test47',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1055,'test48','test48','test48',to_date('2023/06/02 12:16:46','YYYY/MM/DD HH24:MI:SS'),0,0,'test48',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1056,'test49','test49','test49',to_date('2023/06/02 12:16:46','YYYY/MM/DD HH24:MI:SS'),0,0,'test49',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1057,'test50','test50','test50',to_date('2023/06/02 12:16:46','YYYY/MM/DD HH24:MI:SS'),0,0,'test50',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1058,'test51','test51','test51',to_date('2023/06/02 12:16:46','YYYY/MM/DD HH24:MI:SS'),0,0,'test51',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1059,'test52','test52','test52',to_date('2023/06/02 12:16:46','YYYY/MM/DD HH24:MI:SS'),0,0,'test52',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1060,'test53','test53','test53',to_date('2023/06/02 12:16:46','YYYY/MM/DD HH24:MI:SS'),0,0,'test53',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1061,'test54','test54','test54',to_date('2023/06/02 12:16:46','YYYY/MM/DD HH24:MI:SS'),0,0,'test54',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1062,'test55','test55','test55',to_date('2023/06/02 12:16:46','YYYY/MM/DD HH24:MI:SS'),0,0,'test55',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1063,'test56','test56','test56',to_date('2023/06/02 12:16:46','YYYY/MM/DD HH24:MI:SS'),0,0,'test56',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1064,'test57','test57','test57',to_date('2023/06/02 12:16:46','YYYY/MM/DD HH24:MI:SS'),0,0,'test57',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1065,'test58','test58','test58',to_date('2023/06/02 12:16:46','YYYY/MM/DD HH24:MI:SS'),0,0,'test58',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1066,'test59','test59','test59',to_date('2023/06/02 12:16:46','YYYY/MM/DD HH24:MI:SS'),0,0,'test59',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1067,'test60','test60','test60',to_date('2023/06/02 12:16:46','YYYY/MM/DD HH24:MI:SS'),0,0,'test60',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1068,'test61','test61','test61',to_date('2023/06/02 12:16:46','YYYY/MM/DD HH24:MI:SS'),0,0,'test61',0);
Insert into SCOTT.BULLETINBOARD (BOARD_ID,TITLE,NICKNAME,USER_ID,TIME,VIEWS,RECOMMEND,CONTENT,CATEGORY) values (1069,'test62','test62','test62',to_date('2023/06/02 12:16:46','YYYY/MM/DD HH24:MI:SS'),0,0,'test62',0);
--------------------------------------------------------
--  DDL for Index BULLETINBOARD_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."BULLETINBOARD_PK" ON "SCOTT"."BULLETINBOARD" ("BOARD_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Trigger BULLETINBOARD_TRG1
--------------------------------------------------------

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
--------------------------------------------------------
--  DDL for Trigger BULLETINBOARD_TRG
--------------------------------------------------------

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
--------------------------------------------------------
--  DDL for Trigger BULLETINBOARD_TRG2
--------------------------------------------------------

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
--------------------------------------------------------
--  DDL for Trigger BULLETINBOARD_TRG3
--------------------------------------------------------

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
--------------------------------------------------------
--  Constraints for Table BULLETINBOARD
--------------------------------------------------------

  ALTER TABLE "SCOTT"."BULLETINBOARD" MODIFY ("BOARD_ID" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."BULLETINBOARD" MODIFY ("TITLE" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."BULLETINBOARD" MODIFY ("CONTENT" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."BULLETINBOARD" ADD CONSTRAINT "BULLETINBOARD_PK" PRIMARY KEY ("BOARD_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;