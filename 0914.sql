-- ? ? ¬? ?? ORDER BY ? 
SELECT * FROM EMP
ORDER BY SAL ASC;   -- ASC? ?€λ¦μ°¨?

-- ?¬?λ²νΈ κΈ°μ??Όλ‘? ?€λ¦μ°¨? ? ? ¬
SELECT * FROM EMP
ORDER BY SAL DESC;

-- ?¬?¬ μ»¬λΌ κΈ°μ??Όλ‘? ? ? ¬?κΈ?
-- ? ? ¬ μ‘°κ±΄?΄ ??Όλ©? κΈ°λ³Έ? ?Όλ‘? ?€λ¦μ°¨?
-- κΈμ¬??Όλ‘? ? ? ¬?κ³? κΈμ¬κ°? κ°μ? κ²½μ° ?΄λ¦μ ? ? ¬
-- ? ? ¬μ‘°κ±΄?? ?€? ?μΉν¨
SELECT * FROM EMP
ORDER BY SAL, ENAME DESC;   -- ?€λ¦μ°¨? ? ? ¬ ?΄? ?΄λ¦? κΈ°μ? ?΄λ¦Όμ°¨?

-- ?°κ²? ?°?°? : SELECT λ¬? μ‘°ν? μ»¬λΌ ?¬?΄? ?Ή? ? λ¬Έμλ₯? ?£κ³? ?Ά? ? ?¬?©
SELECT ENAME || 'S JOB IS ' || JOB as EMPLOYEE
FROM EMP;

---------------------------- ?€?΅λ¬Έμ  ----------------------------
-- 1. ?¬? ?΄λ¦μ΄ Sλ‘? ??? ?¬? ?°?΄?° μΆλ ₯
SELECT * FROM EMP
WHERE ENAME LIKE '%S'; 

-- 2. 30λ²? λΆ???? κ·Όλ¬΄?? ?¬? μ€? μ§μ±?΄ SALESMAN?Έ ?¬?? 
--    ?¬?λ²νΈ, ?΄λ¦?, μ§μ±, κΈμ¬, λΆ??λ²νΈ μΆλ ₯
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 30 AND JOB = 'SALESMAN';


-- 3. 20λ²? 30λ²? λΆ??? κ·Όλ¬΄?? ?¬? μ€? κΈμ¬κ°? 2000 μ΄κ³Ό?Έ ?¬??
--    ?¬?λ²νΈ, ?΄λ¦?, κΈμ¬, λΆ?? λ²νΈ μΆλ ₯
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE SAL > 2000 AND DEPTNO IN (20, 30);

-- 4. BETWEEN ?°?°? ??΄ 
--    κΈμ¬κ°? 2000?΄? 3000?΄? λͺ¨λ  ?°?΄?° μΆλ ₯
SELECT * FROM EMP
WHERE 2000 <= SAL AND SAL <= 3000;

-- 5. ?¬? ?΄λ¦μ Eκ°? ?¬?¨??΄ ?? 30λ²? λΆ??? ?¬? μ€? κΈμ¬κ°? 
--    1000 ~ 2000 ?¬?΄κ°? ?? ?¬? ?΄λ¦?, ?¬?λ²νΈ, κΈμ¬, λΆ??λ²νΈ μΆλ ₯
SELECT ENAME, EMPNO, SAL, DEPTNO
FROM EMP
WHERE ENAME LIKE '%E%'
AND DEPTNO = 30 
AND (SAL NOT BETWEEN 1000 AND 2000);

-- 6. μΆκ? ??Ή?΄ μ‘΄μ¬?μ§? ?κ³? ?κΈμκ°? ?κ³? μ§μ±?΄ MANAGER, CLERK?Έ ?¬?μ€?
--    ?¬? ?΄λ¦μ ?λ²μ§Έ κΈ??κ°? L?΄ ?? ?¬?? ? λ³΄λ?? μΆλ ₯
SELECT *
FROM EMP
WHERE  
COMM IS NULL
AND MGR IS NOT NULL 
AND JOB IN ('MANAGER','CLERK')
AND ENAME NOT LIKE '_L%';

-- EMP ??΄λΈμ?
-- 1. COMM? κ°μ΄ NULL?΄ ?? ? λ³? μ‘°ν
SELECT * FROM EMP
WHERE COMM IS NOT NULL;
-- 2. μ»€λ?Έμ? λ°μ? λͺ»ν? μ§μ μ‘°ν
SELECT * FROM EMP
WHERE COMM IS NULL OR COMM = 0;
-- 3. κ΄?λ¦¬μκ°? ?? μ§μ ? λ³? μ‘°ν
SELECT * FROM EMP
WHERE MGR IS NULL;
-- 4. κΈμ¬λ₯? λ§μ΄ λ°λ μ§μ ??Όλ‘? μ‘°ν
SELECT * FROM EMP
ORDER BY SAL DESC;
-- 5. κΈμ¬κ°? κ°μ κ²½μ° μ»€λ?Έμ? ?΄λ¦Όμ°¨? ? ? ¬λ‘? μ‘°ν
SELECT * FROM EMP
ORDER BY SAL DESC, COMM DESC;
-- 6. ?¬?λ²νΈ, ?¬?λͺ?, μ§κΈ, ??¬?Ό μ‘°ν(??¬?Ό?? ?€λ¦μ°¨?)
SELECT EMPNO, ENAME, JOB, HIREDATE
FROM EMP
ORDER BY HIREDATE ASC;
-- 7. ?¬?λ²νΈ, ?¬?λͺ? μ‘°ν (?¬?λ²νΈ κΈ°μ? ?΄λ¦Όμ°¨?)
SELECT EMPNO, ENAME
FROM EMP
ORDER BY EMPNO DESC;
-- 8. ?¬?λ²νΈ, ??¬?Ό, ?¬?λͺ?, κΈμ¬ μ‘°ν
--    (λΆ??λ²νΈκ°? λΉ λ₯Έ ??Όλ‘?, κ°μ? λΆ??λ²νΈ?Ό ?? μ΅κ·Ό ??¬?Ό ??Όλ‘? μ²λ¦¬)
SELECT EMPNO, HIREDATE, ENAME, SAL, DEPTNO
FROM EMP
ORDER BY DEPTNO ASC, HIREDATE DESC; 

-- ?¨? --
-- ?€?Ό?΄?? ?¨?? ?΄?₯ ?¨? / ?¬?©? ? ? ?¨?λ‘? ??¨.
-- ?΄?₯?¨?? ?¨?Ό? ?¨? / ?€μ€ν(μ§κ³)?¨?λ‘? ??¨.
-- DUAL ??΄λΈ? : ?€?Ό?΄? SYS(κ΄?λ¦¬μ) κ³μ ?? ? κ³΅ν? ??΄λΈλ‘
--              ?¨?? κ³μ°??? ??΄λΈ? μ°Έμ‘°??΄ ?€??΄ λ³΄κΈ° ??΄ ? κ³? ?¨
--              (DUMMY??΄λΈ?)

-- ABS : ? ??κ°μ κ΅¬ν? ?¨?
SELECT -10, ABS(-10) FROM DUAL;

-- ROUND : λ°μ¬λ¦Όν κ²°κ³Όλ₯? λ°ν?? ?¨? : ROUND(?«?, λ°μ¬λ¦? ?μΉ?), 
--         ?μΉλ ??κ°λ μ€? ? ?? -> ?? ??­κΉμ? ?¬?Ό?΄
SELECT ROUND(1234.5678) AS ROUND,
    ROUND(1234.5678, 0) AS ROUND_0,
    ROUND(1234.5678, 1) AS ROUND_1,
    ROUND(1234.5678, 2) AS ROUND_2,
    ROUND(1234.5678, -1) AS ROUND_MINUS1,
    ROUND(1234.5678, -2) AS ROUND_MINUS2
FROM DUAL;

-- TRUNC : λ²λ¦Ό? κ²°κ³Όλ₯? λ°ν?? ?¨?
SELECT TRUNC(1234.5678) AS TRUNC,
    TRUNC(1234.5678, 0) AS TRUNC_0,
    TRUNC(1234.5678, 1) AS TRUNC_1,
    TRUNC(1234.5678, 2) AS TRUNC_2,
    TRUNC(1234.5678, -1) AS TRUNC_MINUS1,
    TRUNC(1234.5678, -2) AS TRUNC_MINUS2
FROM DUAL;

-- MOD : ??κΈ°ν ?λ¨Έμ?λ₯? μΆλ ₯?? ?¨?
SELECT MOD(21, 5) FROM DUAL;

-- CEIL : ???  ?΄?λ₯? λ¬΄μ‘°κ±? ?¬λ¦?
SELECT CEIL(12.0000001) FROM DUAL;

-- FLOOR : ???  ?΄?λ₯? λ¬΄μ‘°κ±? ?΄λ¦?
SELECT FLOOR(12.99999999) FROM DUAL;

-- POWER : ? ?Aλ₯? ? ?Bλ§νΌ ? κ³±ν? ?¨?
--   EX  : (3, 4)
SELECT POWER(3, 4) FROM DUAL;


------------------------------------------------------------------------------

SELECT * FROM DEPT_TEMP2;


SELECT * FROM DEPT_TCL;

INSERT INTO DEPT_TCL VALUES(70, 'BACKEND', 'INCHUN');

UPDATE DEPT_TCL SET LOC = 'BUSAN';

ROLLBACK;





