-- 1) List the count of emoloyees
select count(e.ssn)
from employee e ;


--  2)Retrieve  the average salary of sellers.
SELECT avg(e.Salary) as AvgSal
FROM employee e inner
JOIN seller s
on s.Employee_ssn=e.ssn;


-- 3) Retrieve the summation of both males' salaries and female'salaries.
SELECT sex, sum(salary)
FROM employee
GROUP BY sex;


--  4) List the count of atr_objects  that have been sold by sellers. 
 select e.fname , count(a.id) as 'Number Of art_objects'
from employee e , art_object a , seller s
where s.Employee_ssn = e.ssn and s.idseller = a.idseller
 group by e.fname;
 
 

-- 5) Retrieve the name, and salary of the seller who takes the smallest salary.
SELECT e.fname,e.salary
FROM employee e
WHERE e.salary=(select
min(e.salary) from employee e);

-- 6) Sort the art_objects according to their price.
SELECT  a.price
FROM art_object a
ORDER BY a.price;


-- 7)Retrieve the name of seller employees which have salaries greater than 30000
SELECT e.fname, e.salary
FROM Employee e , seller s
where e.ssn = s.Employee_ssn
and e.Salary >30000;


-- 8)Sort the tourguide names according to their paid salaries.
SELECT e.fname , e.Salary 
FROM employee e, tour_guide t
WHERE e.ssn=t.Employee_ssn
GROUP BY e.fname
ORDER BY 2 desc;





-- 9) List the count of visitors for each tourguide. 
select e.fname , count(v.ssn) as 'Number Of Visitors'
from employee e , visitor v , tour_guide t
where t.Employee_ssn = e.ssn and v.idguide = t.idTour_guide
group by e.fname;



-- 10) Retreive the name of visitors that begins with letter 'e' 

select v.fname
from visitor v
where v.fname like 'e%';


-- 11) Retrieve  the average salary of security employee.
SELECT avg(e.Salary) as AvgSal
FROM employee e 
JOIN security s
on s.Employee_ssn=e.ssn;



-- 12) Retreive the names of Artists who have
--     the same century that Artist 'Auguste Rodin' has

select a.name 
 from artist a
 where a.century=(select a.century
from artist a
where a.name = 'Auguste Rodin');

-- 13)Retreive sum of price for each  type of art_object (sculpture , painting , statue)
(SELECT  sum(a.price) 
FROM art_object a , sculpture s 
where a.id=s.Art_object_id
having sum(a.price) > 1963000 )
UNION
(SELECT  sum(a.price) 
FROM art_object a ,  statue st
where  a.id = st.Art_object_id
having sum(a.price) > 1963000)
UNION
(SELECT  sum(a.price) 
FROM art_object a ,  painting p 
where a.id=p.Art_object_id having sum(a.price) > 1963000 ) ;



-- Q Retrieve the price of all statues and their id
select price , Art_object_id 
from art_object , statue
where Art_object_id = id ;
-- Q show the resulting salaries for employees who works as security
select salary 
from employee , security
where Employee_ssn = ssn ;

-- Q Retrieve museum name and their art_object_id
select name , id 
from museum , borrowe_from , art_object
where name=Museum_name and Art_object_id=id ;

-- Q Retrieve Sculptures who weight is bigger than 200
select weight 
from Sculpture 
where weight>200;





-- Q1)Retrieve the ssn,and fname,and lname of the empoyees whose salary greater than or equal 20000 and less than or equal 30000.
 select e.ssn,e.fname,e.lname,e.salary
from project.Employee e
where salary Between 20000 and 40000;
-- Q2)Retrieve the name,and age,and style of the Artist whose name is 'pablo picasso'.
 select a.name,a.age,a.style,a.Birthdata as 'Data of birth'
 from project.Artist a 
 where name='Pablo Picasso';
 -- Q3)Retrieve the Artist_name,and id,and id of the Art_object whose price greater than 40000.
select A.Artist_name,A.id,A.price
from project.Art_object A
where price>40000;
-- Retrieve the name of all Painting who work for the 'pablo picasso'Art_object
select p.Name
from project.Painting p,project.Art_object A 
where p.Art_object_id=A.id and A.Artist_name='Pablo picasso';