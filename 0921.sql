-- 데이터 사전에는 데이터베이스 메모리, 성능, 사용자, 권한,
-- 객체 등 오라클 데이터베이스 운영에 중요한 데이터가 보관 됨


SELECT * FROM DICT;

SELECT table_name FROM user_tables;

-- 인덱스란?
-- : 검색 성능을 개선하기 위해 별도의 색인 테이블로 관리
-- 삽입/삭제/변경이 잦은 경우는 오히려 성능 저하가 될 수 있음
-- 기본키와 유일키의 경우는 인덱스가 자동생성 됨

SELECT ROWID, EMPNO, ENAME FROM EMP;

-- EMP 테이블의 SAL열에 인덱스 생성하기 (색인테이블 등록)
CREATE INDEX IDX_EMP_SAL ON EMP(SAL);

SELECT * FROM USER_IND_COLUMNS;         -- 확인하는 방법임

-- 복합 인덱스 생성
CREATE INDEX IDX_EMP_TUPLE ON EMP(JOB, DEPTNO);

-- 인덱스 삭제
DROP INDEX IDX_EMP_SAL;
DROP INDEX IDX_EMP_TUPLE;

------------------------------------------------------------------

-- VIEW
-- : 하나 이상의 테이블을 조회하는 SELECT문을 저장한 객체
-- : 복잡한 테이블을 단순화하기 위한 목적
-- : 보안성 목적 → 노출되면 안되는 정보가 있다면 일정부분만 제약을 걸어서 사용

-- : 뷰를 생성하기 위해서는 권한이 필요함 → 터미널에서 풀어줌
CREATE VIEW VW_EMP20 
AS (SELECT EMPNO, ENAME, JOB, DEPTNO
    FROM EMP
    WHERE DEPTNO = 20);

SELECT * FROM Vw_EMP20;














