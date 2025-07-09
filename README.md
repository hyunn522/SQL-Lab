# SQL-Query Project

MySQL과 Oracle의 문법 실습을 위한 팀 프로젝트입니다.

## 👥 팀 소개

| 정서현 | 최홍석 | 홍윤기 |
| :---: | :---: | :---: |
| <img width="160px" src="https://github.com/user-attachments/assets/5ab2d270-ed42-4a31-8d07-9d14ecf6c98d"/>   | <img width="160px" src="https://github.com/user-attachments/assets/86fe4892-da4d-474d-b793-c89f4756b0f6"/> | <img width="160px" src="https://github.com/user-attachments/assets/8a15a7e7-6fff-45f3-903d-b82a4ec3c2bf"/> | <img width="160px" src="https://github.com/user-attachments/assets/029daed9-0514-45ed-98ed-ed4ec8b3384d"/> |
| [@hyunn522](https://github.com/hyunn522) | [@ChatHongPT](https://github.com/ChatHongPT) | [@yunkihong-dev](https://github.com/yunkihong-dev) |

## 📁 예제 테이블 구조

<img width="629" alt="image" src="https://github.com/user-attachments/assets/9781656f-c2c1-46bd-8d9e-1297b3e5f8ff" />

## ❓ 추가한 문제

아래 문제들에 대한 답은 Oracle 기준입니다.

> 💡 emp 테이블과 dept 테이블 간의 관계를 이용한 다음 SQL문을 통해, 전체 데이터의 양상을 파악합니다.
> ```
> SELECT * FROM emp e JOIN dept d ON d.deptno = e.deptno;
> ```

![image](https://github.com/user-attachments/assets/16df4a3d-6226-4f73-b959-9e309162e99b)

### Q1. 급여에 따라 다음과 같이 등급을 나누어 조회하기

> 3000 이상: 'A'
> 
> 2000 이상: 'B'
> 
> 1000 이상: 'C'
> 
> 1000 미만: 'D'

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

✔️ 결과

![image](https://github.com/user-attachments/assets/209c0b5a-66fd-4d3a-8b01-633ecd4944c3)

### Q2. 본인 상사 이름 조회하기

```
SELECT e.ename AS "사원 이름", g.ename AS "상사 이름"
  FROM emp e
    JOIN emp g ON e.mgr= g.empno;
```

✔️ 결과

![image](https://github.com/user-attachments/assets/0d7ec729-225d-4488-8487-5cc2e0a2e29d)

### Q3. 부서당 평균 연봉 조회하기

```
SELECT  d.DNAME "부서 명" ,AVG(sal * 12) AS "평균 연봉"
  FROM emp e
    JOIN dept d ON e.deptno = d.deptno
  GROUP BY d.DNAME;
```

✔️ 결과

![image](https://github.com/user-attachments/assets/968d934a-ebbd-4a63-b32a-8b8df8d9bfe9)

### Q4. 입사 연도별 평균 연봉 조회하기

```
SELECT TO_CHAR(hiredate,'YYYY') FROM emp;
```

`TO_CHAR(date, 'YYYY')`를 통해 Date 타입에서 연도만을 추출할 수 있다.

```
SELECT TO_CHAR(hiredate,'YYYY') AS "입사 연도", avg(sal * 12) AS "평균 연봉"
FROM emp
GROUP BY TO_CHAR(hiredate,'YYYY');
```

✔️ 결과

![image](https://github.com/user-attachments/assets/80a63644-36fe-4a47-bf07-1aeee1e1b6ca)
