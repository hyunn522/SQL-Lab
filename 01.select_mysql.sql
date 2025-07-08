/* 주의 사항
 * 단일 line 주석 작성시 -- 와 내용 사이에 blank 필수
 */
use fisa;

show tables;

select * from emp;
select * from dept;
desc emp;
desc dept;

-- 1. 해당 계정이 사용 가능한 모든 table 검색
show tables;

-- 2. emp table의 모든 내용(모든 사원(row), 속성(컬럼)) 검색
select * from emp;

-- 3. emp의 구조 검색
desc emp;

-- 4. emp의 사번(empno)만 검색
select empno from emp;
select empno from emp order by empno asc; -- 오름차순
select empno from emp order by empno desc; -- 내림차순

-- 5. emp의 사번(empno), 이름(ename)만 검색
select empno, ename from emp;

-- 6. emp의 사번(empno), 이름(ename)만 검색(별칭 적용)
-- "as 별칭" 문법 적용 : 여백이 포함된 별칭 사용 시 "" 표기로 하나의 문자열 의미
select empno as 사번, ename as "사원 명" from emp;

-- 7. 부서 번호(deptno) 검색
select deptno from emp;

-- 8. 중복 제거된 부서 번호 검색 / distinct
select DISTINCT deptno from emp; 

-- 9. 8 + 오름차순 정렬(order by)해서 검색
-- 오름 차순 : asc  / 내림차순 : desc
select DISTINCT deptno from emp order by deptno ASC;

-- 10. ? 사번(empno)과 이름(ename) 검색 단 사번은 내림차순(order by desc) 정렬
select empno, ename from emp order by empno DESC;

-- 11. ? dept table의 deptno 값만 검색 단 오름차순(asc)으로 검색
select deptno from dept order by deptno ASC;

-- 12. ? 입사일(hiredate) 검색, 
-- 입사일이 오래된 직원부터 검색되게 해 주세요
-- 고려사항 : date 타입도 정렬(order by) 가능 여부 확인 -> 가능
select hiredate from emp order by hiredate ASC;
desc emp;

-- 13. ?모든 사원의 이름과 월 급여(sal)와 연봉 검색
select ename as 사원명, sal as 월급여, sal * 12 as 연봉 from emp;

-- 14. ?모든 사원의 이름과 월급여(sal)와 연봉(sal*12) 검색
-- 단 comm 도 고려(+comm) = 연봉(sal*12) + comm
-- comm이 null인 사원인 경우에는 데이터 휘발됨
select ename as 사원명, sal as 월급여, (sal * 12 + comm) as 연봉 from emp;

-- solution : null을 0으로 치환해서 연산
select ename as 사원명, sal as 월급여, (sal * 12 + ifnull(comm, 0)) as 연봉 from emp;



-- *** 조건식 ***
-- 15. comm이 null인 사원들의 이름과 comm만 검색
-- where 절 : 조건식 의미
select ename, comm from emp where comm is null;

-- 16. comm이 null이 아닌 사원들의 이름과 comm만 검색
-- where 절 : 조건식 의미
-- 아니다 라는 부정 연산자 : not 
select ename, comm from emp where comm is not null;

-- ?모든 직원명, comm으로 내림 차순 정렬
select ename, comm from emp order by comm DESC;

-- null값 보유컬럼 오름차순 정렬인 경우 null 부터 검색 


-- 17. ? 사원명이 SMITH인 사원의 이름과 사번만 검색
-- = : db에선 동등비교 연산자
-- 참고 : 자바에선  == 동등비교 연산자 / = 대입연산자
select ename, empno from emp where ename = "SMITH";

-- 18. 부서번호가 10번 부서의 직원들 이름, 사번, 부서번호 검색
-- 단, 사번은 내림차순 검색
select ename, empno, deptno from emp where deptno = 10 order by empno DESC;

-- 19. ? 기본 syntax를 기반으로 
-- emp  table 사용하면서 문제 만들기

-- 1. 입사일이 1981/1/1 이후인 직원들의 이름, 입사일 출력
-- 2. 직업이 SALESMAN인 사람들의 평균 급여 출력
select ename, hiredate from emp where hiredate > '1981-1-1';
select avg(sal) from emp where job = 'SALESMAN';

-- 20. 급여(sal)가 900(>=)이상인 사원들 이름, 사번, 급여 검색 
select ename, empno, sal from emp where sal >= 900 order by ename ASC;
select ename, empno, sal from emp where sal >= 900 order by sal ASC;
select ename, empno, sal from emp where sal >= 900 order by sal ASC, ename ASC;

-- 21. deptno 10, job 은 manager(대문자로) 이름, 사번, deptno, job 검색
select ename, empno, deptno, job from emp where deptno = 10 and job = 'MANAGER';

-- ename은 대소문자 구분 설정을 alter 명령어로 사전 셋팅
-- 대소문자 구분
select job from emp where job = 'manager'; -- 검색 성공
select job from emp where job = binary('manager'); -- 검색 실패
select job from emp where job = binary('MANAGER'); -- 검색 성공

-- 대문자 : upper / 소문자 : lower   / uppercase (대문자의미)
select job from emp where job = upper('MANAGER');

-- smith 소문자를 대문자로 변경해서 비교
select ename from emp where ename = upper('smith');

-- 22.? deptno가 10 아닌 직원들 사번, 부서번호만 검색
-- 부정연산자 not ~ = / != / <>
select empno, deptno from emp where deptno != 10;
select empno, deptno from emp where not deptno = 10;

-- 23. sal이 2000이하(sal <= 2000) 이거나(or) 3000이상(sal >= 3000)인 사원명, 급여 검색
select ename, sal from emp where sal <= 2000 or sal >= 3000;

-- 24.  comm이 300 or 500 or 1400인
-- in 연산식 사용해서 좀더 개선된 코드
-- 25. ?  comm이 300 or 500 or 1400이 아닌 사원명 검색
-- null값 미포함!!!
select empno, comm from emp where comm in (300, 500, 1400);
select empno, comm from emp where comm not in (300, 500, 1400);
select empno, comm from emp where not comm in (300, 500, 1400);

-- 26. 81/09/28 날 입사한 사원 이름.사번 검색
-- date 타입 비교 학습
-- date 타입은 '' 표현식 가능 
-- yy/mm/dd 포멧은 차후에 변경 예정(함수)
select ename, empno from emp where hiredate = '1981-09-28';
select ename, empno from emp where hiredate = '81-09-28';
select ename, empno from emp where hiredate = '1981/09/28';
select ename, empno from emp where hiredate = '81/09/28';

-- 27. 날짜 타입의 범위를 기준으로 검색
-- 범위비교시 연산자 : between~and 1980-12-17~1981-09-28
select empno, ename, hiredate from emp where hiredate between '1980-12-17' and '1981-09-28';


-- 28. 검색시 포함된 모든 데이터 검색하는 기술
-- 실행 속도는 낮음 -> 빠른 검색을 위해서는 검색 엔진이 내장된 sw 사용 권장

-- 순수 sql문으로 검색
-- like 연산자 사용
-- % : 철자 개수 무관하게 검색 / _ : 철자 개수 하나를 의미

-- 29. 두번째 음절의 단어가 M(_M)인 모든 사원명 검색 
select ename from emp where ename like '_M%';

-- 30. 단어가 M을 포함한 모든 사원명 검색
select ename from emp where ename like '%M%'; 