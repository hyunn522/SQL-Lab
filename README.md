# SQL-Lab

MySQL과 Oracle의 문법 실습을 위한 예제 스크립트이다.

`01.emp_dept_mysql.sql`, `01.emp_dept_oracle.sql` : 예제 테이블 생성을 위한 데이터 삽입 스크립트

`01.select_mysql.sql`, `01.select_oracle.sql` : SQL문 예제 

## 📁 예제 테이블 구조

<img width="629" alt="image" src="https://github.com/user-attachments/assets/9781656f-c2c1-46bd-8d9e-1297b3e5f8ff" />

## ❓ 추가한 문제

아래 문제들에 대한 답은 Oracle 기준이다.

> 💡 emp 테이블과 dept 테이블 간의 관계를 이용한 다음 SQL문을 통해, 전체 데이터의 양상을 파악한다.
> ```
> SELECT * FROM emp e JOIN dept d ON d.deptno = e.deptno;
> ```

### Q1. 급여에 따라 다음과 같이 등급을 나누어 조회하세요.
-- - 3000 이상: 'A'
-- - 2000 이상: 'B'
-- - 1000 이상: 'C'
-- - 1000 미만: 'D'

```
select ename ,(
    case
        when sal>=3000 then 'A'
        when sal>=2000 then 'B'
        when sal>=1000 then 'C'
        when sal<1000  then 'D'
    end
    ) as 급여 from emp;
```

### Q2. 본인 상사 이름 찾아오기

```
SELECT e.ename AS "사원 이름", g.ename AS "상사 이름"
  FROM emp e
    JOIN emp g ON e.mgr= g.empno;
```

### Q3. 부서당 연봉 평균

```
SELECT  d.DNAME "부서 명" ,AVG(sal)*12 AS "평균 연봉"
  FROM emp e
    JOIN dept d ON e.deptno = d.deptno
  GROUP BY d.DNAME;
```

### Q4. 입사 연도별 평균 연봉

```
SELECT TO_CHAR(hiredate,'YYYY') FROM emp;
```

`TO_CHAR(date, 'YYYY')`를 통해 Date 타입에서 연도만을 추출할 수 있다.

```
SELECT TO_CHAR(hiredate,'YYYY') AS "입사 연도", avg(sal)*12 AS "평균 연봉"
FROM emp
GROUP BY TO_CHAR(hiredate,'YYYY');
```
