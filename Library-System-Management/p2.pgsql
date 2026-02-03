CREATE TABLE books(
    isbn VARCHAR(20),
    book_title VARCHAR(100),
    category VARCHAR(50),
    rental_price DECIMAL(10,2),
    status VARCHAR(20),
    author VARCHAR(100),
    publisher VARCHAR(100),
    PRIMARY KEY (isbn)
);

CREATE TABLE branch(
    branch_id VARCHAR(20),
    manager_id VARCHAR(20),
    branch_address VARCHAR(100),
    contact_no VARCHAR(15),
    PRIMARY KEY (branch_id)
);

CREATE TABLE employee(
    emp_id VARCHAR(20),
    emp_name VARCHAR(100),
    position VARCHAR(50),
    salary DECIMAL(10,2),
    branch_id VARCHAR(20),
    PRIMARY KEY (emp_id),
    FOREIGN KEY (branch_id) REFERENCES branch(branch_id)
);
DROP TABLE IF EXISTS member;
CREATE TABLE member(
member_id VARCHAR(20),
member_name VARCHAR(100),
member_address VARCHAR(200),
reg_date DATE,
PRIMARY KEY (member_id)
);

create table issued(
    issued_id VARCHAR(20),
    issued_member_id VARCHAR(20),
    issued_book_name VARCHAR(100),
    issued_date DATE,
    issued_book_isbn VARCHAR(20),
    issued_emp_id VARCHAR(20),
    PRIMARY KEY (issued_id)
);

CREATE TABLE RETURN_STATUS(
    return_id VARCHAR(20),
    issued_id VARCHAR(20),
    return_book_name VARCHAR(100),
    return_date DATE,
    return_book_isbn VARCHAR(20),
    PRIMARY KEY (return_id)
);

--Foreign Key Constraints
ALTER TABLE issued
ADD CONSTRAINT fk_issued_member
FOREIGN KEY (issued_member_id) 
REFERENCES member(member_id);

Alter table issued
add CONSTRAINT fk_issue_book
FOREIGN KEY (issued_book_isbn)
REFERENCES books(isbn);

ALTER TABLE issued
ADD CONSTRAINT fk_issued_emp
FOREIGN KEY (issued_emp_id)
REFERENCES employee(emp_id);

ALTER TABLE employee
ADD CONSTRAINT fk_emp_branch
FOREIGN KEY (branch_id)
REFERENCES branch(branch_id);

Alter table RETURN_STATUS
ADD CONSTRAINT fk_return_issued
FOREIGN KEY (issued_id)
REFERENCES issued(issued_id);

select * from employee;
select * from books;
Select * from member;
select * from branch;
select * from issued;
select * from RETURN_STATUS;