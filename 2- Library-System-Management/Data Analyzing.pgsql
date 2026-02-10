select * from issued;
select * from member;
select * from books;
select * from return_status;


-- Project tasks: 
-- Task 1. Create a New Book Record -- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"
insert into books(isbn,book_title,category,rental_price,status,author,publisher)
values('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');

select * from books where isbn = '978-1-60129-456-2';


-- Task 2. Update Member Address with Audit Logging
-- Ensure log_audit table exists before inserting
CREATE TABLE IF NOT EXISTS log_audit(
    audit_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    member_id VARCHAR(20),
    previous_address TEXT,
    new_address TEXT,
    change_date DATE
);
BEGIN;

    insert into log_audit(member_id, previous_address, new_address, change_date)
    values('M001', '123 Old St', '456 Brigton Ave', CURRENT_DATE);

    UPDATE member
    SET member_address = '123 New Street, New City, NY 10001'
    WHERE member_id = 'M001';
COMMIT;

select * from log_audit ;

-- Task 3. safely delete an issued record only if it has already been returned?
-- ّ use soft delete by updating the status to 'deleted' instead of physically removing the record from the database. This way, you can maintain a history of issued records while marking them as deleted.
select * from issued where issued_id = 'IS108';

ALTER TABLE issued ADD COLUMN is_deleted BOOLEAN DEFAULT false;
UPDATE issued i
SET is_deleted = true
WHERE i.issued_id = 'IS108'
AND EXISTS (
    SELECT 1
    FROM return_status r
    WHERE r.issued_id = i.issued_id
);

select * from issued where issued_id = 'IS108';

--Task4. rank employees based on the number of books they have issued
select issued_member_id, count(*) as total_issued
from issued
where is_deleted = false
group by issued_member_id
order by total_issued desc;

-- using Rank() function to rank employees based on the number of books they have issued
SELECT
    e.emp_id,
    e.emp_name,
    COUNT(i.issued_id) AS total_issued,
    RANK() OVER (ORDER BY COUNT(i.issued_id) DESC) AS rank_no
FROM employee e
LEFT JOIN issued i ON i.issued_emp_id = e.emp_id
GROUP BY e.emp_id, e.emp_name;


--find members who have issued more books than the average member
with total_issued as (
    select issued_member_id, count(*) as total_issued
    from issued
    where is_deleted = false
    group by issued_member_id
),
average_issued as (
    select avg(total_issued) as avg_issued
    from total_issued
)
select issued_member_id, total_issued
from total_issued
where total_issued > (select avg_issued from average_issued);


--create a summary table showing how many times each book has been issued
with book_issue_summary as(
select *
from books b
full OUTER join issued i on b.isbn = i.issued_book_isbn
)
select issued_book_name, count(issued_book_name) as total_issued
from book_issue_summary
group by issued_book_name
ORDER BY total_issued DESC
;

--analyze book inventory by category, including pricing statistics
select category, count(*) as total_books, to_char(avg(rental_price), '999.99') as avg_price
from books
group by category; abbrev


--calculate monthly rental revenue
select date_trunc('month', issued_date) as issued_month, sum(rental_price) as monthly_revenue
from issued
group by issued_month
order by issued_month;

