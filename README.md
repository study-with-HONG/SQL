# 누구나 쉽게 SQL
### ORACLE 환경설정

* 사용자 생성(12c부터는 계정 앞에 c##을 붙여야 한다.)<br>
SQL> CREATE USER c##아이디 IDENTIFIED BY 비밀번호 DEFAULT TABLESPACE USERS;<br>
사용자가 생성되었습니다.<br>


* 사용자 권한 부여<br>
SQL> GRANT DBA TO c##아이디;<br>
권한이 부여되었습니다.

-------------------------------------------------------
### SQL plus 환경설정(hr스키마 설치)
##### 굵고 기울임체 되어 있는 부분 작성
사용자명 입력: system<br>
비밀번호 입력: system

SQL><b><i> conn system/system</i></b><br>
연결되었습니다.

SQL><b><i> ALTER SESSION SET "_ORACLE_SCRIPT"=true;</i></b><br>
--> 계정 앞에 c##작성 안해도 됨.<br>
세션이 변경되었습니다.

SQL><b><i> @?/demo/schema/human_resources/hr_main.sql</i></b>

specify password for HR as parameter 1:<br>
1의 값을 입력하십시오: <b><i> hr </i></b>

specify default tablespeace for HR as parameter 2:<br>
2의 값을 입력하십시오: <b><i> users </i></b>

specify temporary tablespace for HR as parameter 3:<br>
3의 값을 입력하십시오: <b><i> temp </i></b>

specify log path as parameter 4:<br>
4의 값을 입력하십시오: <b><i> $ORACLE_HOME/demo/schema/log/ </i></b>

PL/SQL procedure successfully completed.<br>
not spooling currently

SQL> <b><i> ALTER USER HR ACCOUNT UNLOCK IDENTIFIED BY hr;</i></b><br>
User altered.
