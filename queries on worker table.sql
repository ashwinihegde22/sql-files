CREATE TABLE Worker (
	WORKER_ID int NOT NULL PRIMARY KEY ,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY int,
	JOINING_DATE CHAR(25),
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');


		/*1*/
select * from worker where SALARY in (select salary from worker w where worker.worker_id<>w.worker_id);



/*2*/
SELECT *
FROM worker
WHERE worker_id IN
(SELECT worker_id
FROM worker  
WHERE salary =
(SELECT MAX(salary)
FROM worker
WHERE salary <
(SELECT MAX(salary)
FROM worker)));

/*3*/
select top 50 percent * from worker;

/*4*/
SELECT department as "department name", COUNT(worker_id) as "no of emp" FROM worker GROUP BY department;


--5--
select department, SUM(salary)
from worker group by department

--6--
SELECT  first_name,last_name FROM worker where salary = (SELECT MAX(salary) FROM worker)


--7--

SELECT TOP 1 * FROM [worker] ORDER BY worker_id DESC

--8--

SELECT DISTINCT salary 
FROM worker a 
WHERE  3 >= (SELECT COUNT(DISTINCT salary) 
FROM worker b 
WHERE a.salary >= b.salary) 
ORDER BY a.salary DESC;

--9--
  SELECT first_name,DEPARTMENt,
SALARY FROM worker WHERE
SALARY IN (SELECT Max(SALARY) FROM
worker GROUP BY DEPARTMENT);
  