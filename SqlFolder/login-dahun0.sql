--------------------------------------------------------
--  파일이 생성됨 - 금요일-6월-09-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table LOGIN
--------------------------------------------------------

  CREATE TABLE "SCOTT"."LOGIN" 
   (	"USEREMAIL" VARCHAR2(20 CHAR), 
	"USERPASSWORD" VARCHAR2(20 CHAR), 
	"USERNICKNAME" VARCHAR2(20 CHAR)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into SCOTT.LOGIN
SET DEFINE OFF;
Insert into SCOTT.LOGIN (USEREMAIL,USERPASSWORD,USERNICKNAME) values ('대한','1234','지대한');
Insert into SCOTT.LOGIN (USEREMAIL,USERPASSWORD,USERNICKNAME) values ('찬희','1234','이찬희');
Insert into SCOTT.LOGIN (USEREMAIL,USERPASSWORD,USERNICKNAME) values ('태욱','1234','위태욱');
Insert into SCOTT.LOGIN (USEREMAIL,USERPASSWORD,USERNICKNAME) values ('다한','1234','유다한');
Insert into SCOTT.LOGIN (USEREMAIL,USERPASSWORD,USERNICKNAME) values ('다훈','1234','김다훈');
Insert into SCOTT.LOGIN (USEREMAIL,USERPASSWORD,USERNICKNAME) values ('도현','1234','김도현');
Insert into SCOTT.LOGIN (USEREMAIL,USERPASSWORD,USERNICKNAME) values ('효남','1234','강효남');
Insert into SCOTT.LOGIN (USEREMAIL,USERPASSWORD,USERNICKNAME) values ('ekgns@naver.com','ekgns12345','test');
Insert into SCOTT.LOGIN (USEREMAIL,USERPASSWORD,USERNICKNAME) values ('kimkasi@google.com','ekgks12345','이붕이');
Insert into SCOTT.LOGIN (USEREMAIL,USERPASSWORD,USERNICKNAME) values ('answer@naver.com','gsshekq123','노답');
--------------------------------------------------------
--  DDL for Index SYS_C008422
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."SYS_C008422" ON "SCOTT"."LOGIN" ("USEREMAIL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table LOGIN
--------------------------------------------------------

  ALTER TABLE "SCOTT"."LOGIN" ADD PRIMARY KEY ("USEREMAIL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;