create database Library;
drop database LBMS;
use Library;
 #It keeps track of all information about books in the library, their cost, status and total number of books available in the library. Create a database named library and following TABLES in the database: 
 #1. Branch 
	#	1. Branch Branch_no - Set as PRIMARY KEY Manager_Id Branch_address Contact_no
 create table Branch(
				Branch_no varchar(7) PRIMARY KEY,
				Manager_Id int,
                Branch_address varchar(255),
                Contact_no varchar(15)
                );
insert into Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
values 
('SBI001', 00101, '123 Main Nadakavu', '1234567890'),
('SBI002', 00102, '456 Elm St, Kochin', '0987654321'),
('SBI003', 00103, '789 Oak Kattapana', '1122334455'),
('SBI004', 00104, '321 Main Kannur', '1238874890'),
('SBI005', 00105, '456 marayoor st ;Munnar', '0998764321'),
('SBI006', 00106, '789 Oak thrissur', '3213234455');

select * from branch;

 #2. Employee 
		
        
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(100),
    Position VARCHAR(100),
    Salary DECIMAL(10, 2),
    Branch_no varchar(15),
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);
insert into Employee(Emp_Id,Emp_name,Position,Salary,Branch_no)values
(00101, 'Alphen Leabey', 'Manager', 75000, 'SBI001'),
(00102, 'Eclairs Thomas', 'Manager', 80000, 'SBI002'),
(00103, 'Candy Man', 'Manager', 70000, 'SBI003'),
(00104, 'poppins Kuttappan', 'Librarian', 45000,'SBI001'),
(00105, 'coffee Toffee', 'Librarian', 46000, 'SBI002'),
(00106, 'Silk Smith', 'Assistant', 35000, 'SBI003');

select * from employee;

 #3. Books 
		#3. Books ISBN - Set as PRIMARY KEY Book_title Category Rental_Price Status [Give yes if book available and no if book not available] Author Publisher
 CREATE TABLE Books (
    ISBN VARCHAR(20) PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10, 2),
    Status VARCHAR(10),  
    Author VARCHAR(100),
    Publisher VARCHAR(100)
);
drop table Books;


INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES 
('978-3-16-148410-0', 'The Great Gatsby', 'Fiction', 20.50, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
('978-1-40-289462-6', '1984', 'Dystopian', 18.75, 'no', 'George Orwell', 'Secker & Warburg'),
('978-0-14-017739-8', 'The Catcher in the Rye', 'Classic', 15.30, 'yes', 'J.D. Salinger', 'Little, Brown and Company'),
('978-0-06-112008-4', 'To Kill a Mockingbird', 'Classic', 22.00, 'no', 'Harper Lee', 'J.B. Lippincott & Co.'),
('978-0-7432-7356-5', 'A Brief History of Time', 'Science', 25.00, 'yes', 'Stephen Hawking', 'Bantam Books'),
('978-0-394-52320-4', 'The History of the Ancient World', 'History', 30.00, 'yes', 'Susan Wise Bauer', 'W.W. Norton & Company');

select * from books;
 #4. Customer 
		#4. Customer Customer_Id - Set as PRIMARY KEY Customer_name Customer_address Reg_date
create table customer(
		customer_id int primary key,
        Customer_name varchar(30),
        customer_address varchar(400),
        Reg_date date
        );
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES 
(100201, 'Poovalli Indhu', '12 Pine St, Ottapalam', '2021-05-15'),
(100202, 'Memana Namboothiri', '34 Maple St, Mannarkkad', '2022-10-22'),
(100203, 'Pappan Shaji', '56 Cedar St, HIghrange', '2023-01-30'),
(100204, 'Malar Miss', '78 Birch St, Coimbatore', '2021-12-10'),
(100205, 'Varun chakravarthi', '90 Spruce St, Chennai', '2020-07-25');

select * from customer;

 #5. IssueStatus 
		#5. IssueStatus Issue_Id - Set as PRIMARY KEY  in CUSTOMER table  – Set as FOREIGN KEY and it should refer isbn in BOOKS table
create table IssueStatus(
		Issue_Id int PRIMARY KEY,
        Issued_cust int ,
        Issued_book_name varchar(50),
        Issue_date date,
        Isbn_book varchar(20),
        foreign key(Isbn_book) references Books (ISBN), 
        FOREIGN KEY (Issued_cust) references customer(customer_id)
        );
drop table issuestatus;
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES 
(11301, 100201, 'The Great Gatsby', '2023-06-10', '978-3-16-148410-0'),
(11302, 100203, 'A Brief History of Time', '2023-06-20', '978-0-7432-7356-5'),
(11303, 100204, '1984', '2022-12-15', '978-1-40-289462-6'),
(11304, 100205,'The History of the Ancient World','2022-12-15','978-0-394-52320-4');
select * from issuestatus;

		
 #6. ReturnStatus
		#6. ReturnStatus Return_Id - Set as PRIMARY KEY  - Set as FOREIGN KEY and it should refer isbn in BOOKS table Display all the tables and Write the queries for the following 
 create table ReturnStatus(
		Return_Id int primary key,
        Return_cust int,
        Return_book_name varchar(255),
        Return_date date,
        Isbn_book2 varchar(20),
        foreign key(Return_cust) references customer(customer_Id),
        foreign key(Isbn_book2) references Books(ISBN)
        ); 
        
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES 
(00401, 100201, 'The Great Gatsby', '2023-06-25', '978-3-16-148410-0'),
(00402, 100204, '1984', '2023-01-15', '978-1-40-289462-6'),
(00403, 100203, 'A Brief HIstory of time', '2023-01-15', '978-1-40-289462-6');

select * from returnstatus;

#1. Retrieve the book title, category, and rental price of all available books. 

select Book_title,Category,Rental_Price 
from books 
where status='yes';

#2. List the employee names and their respective salaries in descending order of salary. 

select emp_name,Salary 
from Employee 
order by  Salary desc;

#3. Retrieve the book titles and the corresponding customers who have issued those books. 

select books.book_title,customer.customer_name
from issuestatus join books on issuestatus.isbn_book=books.isbn
join Customer on IssueStatus.Issued_cust = Customer.Customer_Id; 



#4. Display the total count of books in each category.

select category, count(*) 
from Books 
group by Category; 

#5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.

select emp_name,Position 
from employee 
where salary> 50000;

 
#6. List the customer names who registered before 2022-01-01 and have not issued any books yet. 

select  Customer_name 
from Customer 
where Reg_date<'2022-01-01'
and 
customer_id not in(
					select 
					issued_cust 
					from 
					IssueStatus
					);





#7. Display the branch numbers and the total count of employees in each branch. 

select branch_no,count(*) 
from employee 
group by branch_no;

#8. Display the names of customers who have issued books in the month of June 2023.

SELECT Customer.Customer_name,
IssueStatus.Issued_book_name
FROM 
IssueStatus JOIN Customer 
ON IssueStatus.Issued_cust = Customer.Customer_Id
WHERE Issue_date BETWEEN '2023-06-01' AND '2023-06-30';
 
#9. Retrieve book_title from book table containing history. 

#select book_title from books where category='History';
select book_title from books where book_title like '%history%';
select * from books;


#10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees 

select branch_no,count(*) from employee group by branch_no having count(*)>5;

#select branch_no,count(*) from employee group by branch_no having count(*)>1;

#11. Retrieve the names of employees who manage branches and their respective branch addresses.


select 
employee.emp_name as Name ,
branch.branch_address as Address 
from 
employee join branch 
on employee.emp_id=branch.manager_id;



 
#12. Display the names of customers who have issued books with a rental price higher than Rs. 25. 
select customer.customer_name
from IssueStatus join books on Books.ISBN=IssueStatus.isbn_book 
join customer on IssueStatus.Issued_cust = Customer.Customer_Id
where books.rental_price > 25;
/*select customer.customer_name,IssueStatus.Issued_cust
from IssueStatus join books on Books.ISBN=IssueStatus.isbn_book 
join customer on IssueStatus.Issued_cust = Customer.Customer_Id
where books.rental_price > 20;*/
select * from books;