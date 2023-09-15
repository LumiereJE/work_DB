-- 문자 함수 : 문자 데이터를 가공하는 것
SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME)
FROM EMP;

SELECT *
FROM EMP
WHERE UPPER(ENAME) = UPPER('james')

-- LENGTH : 문자열 길이를 반환
-- LENGTHB : 문자열의 바이트 수 반환
SELECT LENGTH('한글'), LENGTHB('한글')
FROM DUAL;

-- SUBSTR( , , ) : 문자열을 자름
-- SUBSTRB( , , ) : 
-- 데이터베이스는 0번째부터 시작하지 않음.
-- 2번째 매개변수는 길이를 의미, 3번째 매개변수를 생략하면 끝까지 범위잡음
SELECT JOB, SUBSTR(JOB, 1, 2), SUBSTR(JOB, 3, 2), SUBSTR(JOB, 5)
FROM EMP;

SELECT JOB,
    SUBSTR(JOB, -LENGTH(JOB)), -- 음수는 뒤에서부터 계산, 길이에 대한 음수값으로 역순으로 접근
    SUBSTR(JOB, -LENGTH(JOB), 2), -- SALESMAN, -8이면 S위치에서 길이가 2만큼 출력
    SUBSTR(JOB, -3)
FROM EMP;

-- INSTR : 문자열 데이터 안에 특정 문자나 문자열이 어디에 포함되어 있는지 알고자 할 때 사용
SELECT INSTR('HELLO, ORACLE!', 'L') AS INSTR_1,
    INSTR('HELLO, ORACLE!', 'L', 5) AS INSTR_2, -- 3번째 인자로 찾을 시작 위치 지정
    INSTR('HELLO, ORACLE!', 'L', 2, 2) AS INSTR_3 -- 3번째 인자는 시작위치, 4번째 인자는 몇번째인지
FROM DUAL;

-- 특정 문자가 포함된 행 찾기
SELECT *
FROM EMP
WHERE INSTR(ENAME, 'S') > 0;

SELECT *
FROM EMP
WHERE ENAME LIKE '%S%';

-- REPLACE : 특정 문자열 데이터에 포함된 문자를 다른 문자로 대체 할 경우에 사용
-- 대체할 문자를 넣지 않으면 해당 문자를 삭제함
SELECT '010-1234-5678' AS REPLACE_BEFORE,
    REPLACE('010-1234-5678', '-', ' ') AS REPLACE_1, -- '-'빼고 공백으로 대체
    REPLACE('010-1234-5678', '-') AS REPLACE_2 -- '-' 삭제
FROM DUAL;

-- LPAD / RPAD : 기준 공간의 칸 수를 특정 문자로 채우는 함수
SELECT LPAD('ORACLE', 10, '+')  -- 모자란 공간은 L쪽에 +로 채움
FROM DUAL;
SELECT RPAD('ORACLE', 10, '+')  -- 모자란 공간은 R쪽에 +로 채움
FROM DUAL;

SELECT 'ORACLE',
    LPAD('ORACLE', 10, '#') AS LPAD_1,
    RPAD('ORACLE', 10, '#') AS RPAD_1,
    LPAD('ORACLE', 10) AS LPAD_2,
    RPAD('ORACLE', 10) AS RPAD_2
FROM DUAL;

-- 개인정보 뒷자리 *표시로 출력하기
SELECT
    RPAD('971225-', 14, '*') AS RPAD_JMNO,
    RPAD('010-1234-', 13, '*') AS RPAD_PHONE
FROM DUAL;

-- 두 문자열을 합치는 CONCAT 함수
SELECT CONCAT(EMPNO, ENAME),
    CONCAT(EMPNO, CONCAT(':', ENAME))
FROM EMP
WHERE ENAME = 'JAMES';

-- TRIM / LTRIM / RTRIM : 문자열 내에서 특정 문자열을 지우기 위해 사용
-- TRIM : 양쪽 다 지움
-- 삭제할 문자를 지정하지 않으면 공백 제거
SELECT '[' || TRIM('  _Oracle_  ') || ']' AS TRIM, -- 공백을 지움
 '[' || LTRIM('  _Oracle_  ') || ']' AS LTRIM,    -- 왼쪽 공백 지움
 '[' || LTRIM('<_Oracle_>', '<_') || ']' AS LTRIM_2, -- 왼쪽 <_ 지움
 '[' || RTRIM('  _Oracle_  ') || ']' AS RTRIM,    -- 오른쪽 공백 지움
 '[' || RTRIM('<_Oracle_>', '_>') || ']' AS RTRIM_2 -- 오른쪽 _> 지움
FROM DUAL;

SELECT LTRIM('SSKLJDFLSKFSLJ                 ','S') -- 앞에 공백있으면 S못찾음.. 첫글자여야 지워짐
FROM DUAL;

-- 날짜 데이터를 다루는 날짜 함수
-- SYSDATE : 운영체제의 현재 날짜와 시간을 가져옴
-- 날짜 데이터는 정수값으로 +, - 가능
SELECT SYSDATE FROM DUAL;

SELECT SYSDATE AS 오늘,
    SYSDATE-1 AS 어제,
    SYSDATE+1 AS 내일
FROM DUAL;

-- 몇 개월 이후 날짜 구하는 ADD_MONTH 함수
-- 특정 날짜에 지정한 개월 수 이후의 날짜 데이터를 반환하는 함수
SELECT SYSDATE,
    ADD_MONTHS(SYSDATE, 3) -- 2번째 인자는 개월 수를 의미, 3개월 이후
FROM DUAL;

-- EMP TABLE에서 입사 10주년이 되는 사원들 데이터 출력
SELECT EMPNO, ENAME, HIREDATE,
    ADD_MONTHS(HIREDATE, 120) AS 입사10주년
FROM EMP;

-- SYSDATE와 ADD_MONTHS 함수를 사용하여 현재날짜와 6개월 후 날짜를 출력
SELECT SYSDATE,
    ADD_MONTHS(SYSDATE, 6)
FROM DUAL;

-- MONTHS_BETWEEN : 두 날짜 간의 개월 수 차이를 구함
SELECT EMPNO, ENAME, HIREDATE, SYSDATE,
    MONTHS_BETWEEN(HIREDATE, SYSDATE) AS MONTHS1,   -- (-)로 표시됨.
    MONTHS_BETWEEN(SYSDATE, HIREDATE) AS MONTHS2,
    TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS MONTH3  -- 소수점 내림
FROM EMP;

-- 날짜 정보 추출 함수
-- EXTRACT 함수는 날짜 유형의 데이터로 부터 날짜 정보를 분리하여 
-- 새로운 컬럼 형태로 추출
SELECT EXTRACT(YEAR FROM DATE '2023-09-15') AS 년도추출
FROM DUAL;

SELECT * FROM EMP
WHERE EXTRACT(MONTH FROM HIREDATE) = 12;


-- 문제 풀이 --

-- 오늘 날짜에 대한 정보 조회
SELECT SYSDATE
FROM DUAL;
-- EMP테이블에서 사번, 사원명, 급여 조회
--(급여는 100단위까지의 값만 출력, 금여 - 내림차순)
SELECT EMPNO, ENAME, ROUND(SAL, -2)
FROM EMP
ORDER BY SAL DESC;

-- EMP테이블에서 사원번호가 홀수인 사원들을 조회
SELECT *
FROM EMP
WHERE MOD(EMPNO, 2) = 1;    -- MOD : 나누기 한 나머지

-- EMP테이블에서 사원명, 입사일 조회 (입사일은 년도와 월을 분리 해서 출력)
SELECT ENAME, EXTRACT(YEAR FROM HIREDATE), EXTRACT(MONTH FROM HIREDATE)
FROM EMP;
-- EMP테이블에서 9월에 입사한 직원의 정보 조회
SELECT *
FROM EMP
WHERE EXTRACT(MONTH FROM HIREDATE) = 9;
-- EMP테이블에서 81년도에 입사한 직원 조회
SELECT *
FROM EMP
WHERE EXTRACT(YEAR FROM HIREDATE) = 1981;
-- EMP테이블에서 이름이 'E'로 끝나는 직원 조회
SELECT * FROM EMP
WHERE ENAME LIKE '%E';
-- EMP테이블에서 이름의 세번째 글자가 'R'인 직원의 정보 조회
SELECT *
FROM EMP
WHERE ENAME LIKE '__R%';
-- EMP테이블에서 사번, 사원명, 입사일, 입사일로부터 40년 되는 날짜 조회
SELECT EMPNO, ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 40*12)
FROM EMP;
-- EMP테이블에서 입사일로부터 38년 이상 근무한 직원의 정보 조회
SELECT *
FROM EMP
WHERE MONTHS_BETWEEN(SYSDATE, HIREDATE) / 12 >= 38;
-- 오늘 날짜에서 년도만 추출
SELECT EXTRACT(YEAR FROM SYSDATE)
FROM DUAL;


-- 자료형을 변환하는 형 변환 함수
-- 자동 형 변환 : NUMBER 타입 + 문자타입 → 넘버타입으로 자동 변환됨
SELECT EMPNO, ENAME, EMPNO + '500'
FROM EMP
WHERE ENAME = 'FORD';

SELECT EMPNO, ENAME, EMPNO + 'ABCD' -- → 에러 남. 타입변환 안됨
FROM ENP
WHERE ENAME = 'FORD';

-- 날짜, 숫자를 문자로 변환하는 TO_CHAR 함수
-- 주로 날짜 데이터를 문자 데이터로 변환하는데에 사용함
-- 자바의 SimpleDateFormat과 유사함(데이터 포멧을 바꿀 때 사용)
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS "현재 날짜 시간"
FROM DUAL;      -- 별칭에 공백 넣을 땐 "" 이용해야 함


SELECT SYSDATE,
    TO_CHAR(SYSDATE, 'CC') AS 세기,
    TO_CHAR(SYSDATE, 'YY') AS 연도,
    TO_CHAR(SYSDATE, 'YYYY/MM/DD PM HH:MI:SS ') AS "년/월/일 시:분:초",
    TO_CHAR(SYSDATE, 'Q') AS 쿼터,
    TO_CHAR(SYSDATE, 'DD') AS 일,
    TO_CHAR(SYSDATE, 'DDD') AS 경과일,
    TO_CHAR(SYSDATE, 'HH') AS "12시간제",
    TO_CHAR(SYSDATE, 'HH12') AS "12시간제",
    TO_CHAR(SYSDATE, 'HH24') AS "24시간제",
    TO_CHAR(SYSDATE, 'W') AS 몇주차
FROM DUAL;

-- MM을 MON으로 쓰면 영어로 달을 표현해 줌, SEP ...
SELECT SYSDATE,
     TO_CHAR(SYSDATE, 'MM') AS MM,
     TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = KOREAN' ) AS MON_KOR,
     TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = JAPANESE') AS MON_JPN,
     TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = ENGLISH' ) AS MON_ENG,
     TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = KOREAN' ) AS MONTH_KOR,
     TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = JAPANESE') AS MONTH_JPN,
     TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = ENGLISH' ) AS MONTH_ENG
FROM DUAL;

-- 여러 언어로 날짜(요일) 출력하기
SELECT SYSDATE,
     TO_CHAR(SYSDATE, 'MM') AS MM,
     TO_CHAR(SYSDATE, 'DD') AS DD,
     TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = KOREAN' ) AS DY_KOR,
     TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = JAPANESE') AS DY_JPN,
     TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = ENGLISH' ) AS DY_ENG,
     TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = KOREAN' ) AS DAY_KOR,
     TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = JAPANESE') AS DAY_JPN,
     TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = ENGLISH' ) AS DAY_ENG
FROM DUAL;

-- 시간 형식 지정하여 출력하기
SELECT SYSDATE,
     TO_CHAR(SYSDATE, 'HH24:MI:SS') AS HH24MISS,
     TO_CHAR(SYSDATE, 'HH12:MI:SS AM') AS HHMISS_AM,
     TO_CHAR(SYSDATE, 'HH:MI:SS P.M.') AS HHMISS_PM
FROM DUAL;

-- 숫자 데이터 형식을 지정하여 출력하기
SELECT SAL,
    TO_CHAR(SAL, '$999,999') AS SAL_$,
    TO_CHAR(SAL, 'L9999,999') AS SAL_L,
    TO_CHAR(SAL, '999,999.00') AS SAL_1,
    TO_CHAR(SAL, '000,999,999,00') AS SAL_2,
    TO_CHAR(SAL, '000999999.99') AS SAL_3,
    TO_CHAR(SAL, '999,999,00') AS SAL_4
FROM EMP;

-- TO_NUMBER() : NUMBER 타입으로 형 변환
SELECT TO_NUMBER('1300') - '1500'
FROM DUAL;

--TO_DATE() : 문자열로 명시된 날짜를 날짜타입으로 형 변환
-- 한 괄호 안에 있는 요소끼리 타입이 일치해야 정상적으로 작동함
-- SELECT TO_DATE('22/08/29', 'YY/MM/DD') → O
-- SELECT TO_DATE('22/08/29', 'YYYY/MM/DD') → X
SELECT TO_DATE('22/08/29', 'YY/MM/DD')
FROM DUAL;

-- 1981년 6월 1일 이후에 입사한 사원 정보 출력하기
SELECT *
FROM EMP
-- WHERE HIREDATE > TO_DATE('1981/06/01', 'YYYY/MM/DD')
WHERE HIREDATE > '01-JUN-81' --→ 이렇게 해도 됨

-- NULL 처리 함수 : NULL → 값이 없음, 할당되지 않음을 의미함
-- NULL은 0이나 공백과는 다른 의미임, 연산 불가능
-- NVL(NULL인지를 검사 할 열 넣어주는 자리, 앞의 열 데이터가 NULL인경우 반환 할 데이터)
SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM,
    NVL(COMM, 0), SAL+NVL(COMM,0) --COMM 자리가 NULL이면 0으로 대체함
FROM EMP;

-- NVL2() : NULL이 아닌 경우와 NULL인 경우 모두에 대해 값을 지정할 수 있음
SELECT EMPNO, ENAME, COMM, SAL,
    NVL2(COMM, 'O', 'X') AS 성과급유무,
    NVL2(COMM, SAL*12+COMM, SAL*12) AS 연봉
FROM EMP;

-- NULLIF() : 두 값이 동일하면 NULL 반환, 아니면 첫번째 값을 반환
SELECT NULLIF(10, 10), NULLIF('A', 'B')
FROM DUAL;

-- DECODE : 주어진 데이터 값이 조건 값과 일치하는 값 출력
-- 일치하는 값이 없으면 기본값 출력
SELECT EMPNO, ENAME, JOB, SAL,
    DECODE(JOB, 
        'MANAGER', SAL*1.1,
        'SALESMAN', SAL*1.05, 
        'ANALYST', SAL,
        SAL*1.03) AS 연봉인상
FROM EMP;

-- CASE 문 VER
SELECT EMPNO, ENAME, JOB, SAL, 
    CASE JOB
        WHEN 'MANAGER' THEN SAL*1.1
        WHEN 'SALESMAN' THEN SAL*1.05
        WHEN 'ANALYST' THEN SAL
        ELSE SAL * 1.03 
    END AS "연봉인상"
FROM EMP;

-- 열 값에 따라서 출력 값이 달라지는 CASE문
SELECT EMPNO, ENAME,
    CASE
        WHEN COMM IS NULL THEN '해당사항 없음'
        WHEN COMM = 0 THEN '수당없음'
        WHEN COMM > 0 THEN '수당 : '|| COMM
    END AS "성과급기준"
FROM EMP;

-- 문제 1 --
-- 사원 이름이 5글자 이상 ~ 여섯글자 미만인 사원 정보 출력
-- MASKING_EMPNO 열에는 사원번호를 EX)56** 로 출력
SELECT EMPNO,
    RPAD(SUBSTR(EMPNO, 1, 2), 4, '*') AS MASKING_EMPNO,
    ENAME,
    RPAD(SUBSTR(ENAME, 1, 1), LENGTH(ENAME), '*') AS MASKING_ENAME
FROM EMP
WHERE LENGTH(ENAME) = 5;

-- 문제 2
-- 하루 8시간 근무했을때, 일급과 시급
SELECT EMPNO, ENAME, SAL,
    TRUNC(SAL / 21.5, 2) AS 일급,
    ROUND(SAL / 21.5 / 8, 1) AS 시급 
FROM EMP;

-- 문제 3
-- NEXT_DAY(기준일자, 찾을 요일) : 기존일자 다음에 오는 날짜 구하는 함수
SELECT EMPNO, ENAME, HIREDATE,
    TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE, 3), 'MON'), 'YYYY/MM/DD') AS 정직원진급,
    NVL(TO_CHAR(COMM), 'N/A') AS COMM
FROM EMP;

-- 문제 4
SELECT EMPNO, ENAME, MGR,
    CASE
        WHEN MGR IS NULL THEN 0000
        WHEN SUBSTR(MGR, 1, 2) = '78' THEN 8888
        WHEN SUBSTR(MGR, 1, 2) = '77' THEN 7777
        WHEN SUBSTR(MGR, 1, 2) = '76' THEN 6666
        WHEN SUBSTR(MGR, 1, 2) = '75' THEN 5555
        ELSE MGR
    END AS CHG_MGR
FROM EMP;

-- 다중행 함수 : 여러행에 대해 함수가 적용되어 하나의 결과를 나타내는 함수
-- 여러 행이 입력되어 결화가 하나의 행으로 출력
SELECT SUM(SAL)
    FROM EMP;

SELECT  ENAME, SUM(SAL)
    FROM EMP;

SELECT EMPNO, SUM(SAL), COUNT(*), ROUND(AVG(SAL),2), MAX(SAL), MIN(SAL)
FROM ENP
GROUP BY DEPTNO,;

-- GROUP BY : 그룹으로 





