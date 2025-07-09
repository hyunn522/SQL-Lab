-- Q1. 급여에 따라 등급을 나누어 조회하세요.
-- - 3000 이상: 'A'
-- - 2000 이상: 'B'
-- - 1000 이상: 'C'
-- - 1000 미만: 'D'
select ename ,(
    case
        when sal>=3000 then 'A'
        when sal>=2000 then 'B'
        when sal>=1000 then 'C'
        when sal<1000  then 'D'
    end
) as 급여 from emp;

-- Q2. 본인 상사 이름 찾아오기
SELECT e.ename AS "사원 이름", g.ename AS "상사 이름"
FROM emp e
JOIN emp g
ON e.mgr= g.empno;

-- Q3. 부서당 연봉 평균
SELECT  d.DNAME "부서 명" ,AVG(sal)*12 AS "평균 연봉"
FROM emp e
JOIN dept d ON e.deptno = d.deptno
GROUP BY d.DNAME;

-- Q4. 입사 연도별 평균 연봉
SELECT TO_CHAR(hiredate,'YYYY') AS "입사 연도", avg(sal)*12 AS "평균 연봉"
FROM emp
GROUP BY TO_CHAR(hiredate,'YYYY');
SELECT * FROM emp e JOIN dept d ON d.deptno = e.deptno;
SELECT TO_CHAR(hiredate,'YYYY') FROM emp;
SELECT * FROM dept;

--
