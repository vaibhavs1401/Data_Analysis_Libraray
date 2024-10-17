use library_management;
DROP TABLE branch
create table branch(
branch_id VARCHAR(5) PRIMARY KEY,
manager_id VARCHAR(5),
branch_address VARCHAR(12),
contact_no VARCHAR(15)
)

DROP TABLE books
create table books(
isbn VARCHAR(20) PRIMARY KEY,
book_title VARCHAR(60),
category VARCHAR(20),
rental_price FLOAT,
statuss VARCHAR(5),	
author VARCHAR(25),
publisher VARCHAR(30)
)

DROP TABLE if exists employees;
create table employees(
emp_id VARCHAR(5) PRIMARY KEY,
emp_name VARCHAR(18),	
position VARCHAR(10),
salary INT,
branch_id VARCHAR(5)
)

drop table if exists issued_status;
create table issued_status(
issued_id VARCHAR(10) PRIMARY KEY,	
issued_member_id VARCHAR(5),
issued_book_name VARCHAR(60),
issued_date DATE,
issued_book_isbn VARCHAR(20),
issued_emp_id VARCHAR(5)
)

drop table if exists members;
create table members(
member_id VARCHAR(5) PRIMARY KEY,
member_name VARCHAR(20),
member_address VARCHAR(20),
reg_date DATE
)

drop table if exists return_status;
create table return_status(
return_id VARCHAR(10) PRIMARY KEY,
issued_id VARCHAR(10),
return_book_name VARCHAR(60),
return_date DATE,
return_book_isbn VARCHAR(20) 
)

select*from branch;
select*from books;
select*from employees;
select*from issued_status;
select*from members;
select*from return_status;

-- First Foreign Key
ALTER TABLE issued_status
ADD CONSTRAINT fk_members
FOREIGN KEY (issued_member_id)
REFERENCES members(member_id); 	

ALTER TABLE issued_status
ADD CONSTRAINT fk_books
FOREIGN KEY (issued_book_isbn)
REFERENCES books(isbn); 	

ALTER TABLE issued_status
ADD CONSTRAINT fk_employees
FOREIGN KEY (issued_emp_id)
REFERENCES employees(emp_id);

ALTER TABLE employees
ADD CONSTRAINT fk_branch
FOREIGN KEY (branch_id)
REFERENCES branch(branch_id);

ALTER TABLE return_status
ADD CONSTRAINT fk_issued_status
FOREIGN KEY (issued_id)
REFERENCES issued_status(issued_id);