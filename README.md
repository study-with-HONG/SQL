# ORACLE 환경설정

-- 사용자 생성(12c부터는 계정 앞에 c##을 붙여야 한다.)<br>
SQL> CREATE USER c##hong IDENTIFIED BY hong DEFAULT TABLESPACE USERS;<br>
사용자가 생성되었습니다.<br>

-- 사용자 권한 부여<br>
SQL> GRANT DBA TO c##hong;<br>
권한이 부여되었습니다.
