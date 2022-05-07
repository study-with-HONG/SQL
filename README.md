# ORACLE 환경설정

* 사용자 생성(12c부터는 계정 앞에 c##을 붙여야 한다.)

SQL> CREATE USER c##아이디 IDENTIFIED BY 비밀번호 DEFAULT TABLESPACE USERS;<br>
사용자가 생성되었습니다.<br>

* 사용자 권한 부여

SQL> GRANT DBA TO c##아이디;<br>
권한이 부여되었습니다.

-------------------------------------------------------
# SQL 사용자명 입력: system
비밀번호 입력: system

SQL> conn system/system
연결되었습니다.

SQL> ALTER SESSION SET "_ORACLE_SCRIPT"=true;
세션이 변경되었습니다.

SQL> @?/demo/schema/human_resources/hr_main.sql

specify password for HR as parameter 1:
1의 값을 입력하십시오: hr

specify default tablespeace for HR as parameter 2:
2의 값을 입력하십시오: users

specify temporary tablespace for HR as parameter 3:
3의 값을 입력하십시오: temp

specify log path as parameter 4:
4의 값을 입력하십시오: $ORACLE_HOME/demo/schema/log/

PL/SQL procedure successfully completed.
not spooling currently

SQL> ALTER USER HR ACCOUNT UNLOCK IDENTIFIED BY hr;
User altered.plus 환경설정 - hr 스키마 설치
