create database LiberyManagementSystem;
use LiberyManagementSystem;

-- table:tbl_publisher
create table tbl_Publisher(
Publisher_PublisherName varchar(225) primary Key,
Publisher_PublisherAddress text not null,
Publisher_PublisherPhone varChar(15)
);
select * from tbl_Publisher;

-- tbl_book
create table tbl_Book(
Book_BookID int primary key auto_increment,
Book_Title varchar(255) not null,
Book_PublisherName varchar(255) not null,
foreign key (Book_PublisherName) references tbl_Publisher (Publisher_PublisherName)
 on update cascade on delete cascade
);
select * from tbl_Book;

-- table: tbl_book_authors
create table tbl_Book_Author(
Book_Authors_AuthorID int primary key auto_increment,
Book_Authors_BookID int not null,
Book_Authors_AuthorName varchar(255) not null,
foreign key (Book_Authors_BookID) references tbl_Book(Book_BookID)
on update cascade on delete cascade
);
select* from tbl_Book_Author;

-- table: tbl_library_branch
create table tbl_Library_Branch (
Library_Branch_BranchID int primary key auto_increment,
Library_Branch_BranchName varchar(255) not null unique,
Library_Branch_BranchAddress text not null
);
select* from tbl_Library_Branch;

-- Table: tbl_book_copies
create table tbl_Book_Copies (
    Book_Copies_CopiesID int primary key auto_increment,
    Book_Copies_BookID int not null,
    Book_Copies_BranchID int not null,
    Book_Copies_No_Of_Copies int not null default 1 check (Book_Copies_No_Of_Copies >= 0),
    foreign key (Book_Copies_BookID) references Tbl_Book(Book_BookID)
        on update cascade on delete cascade,
    foreign key (Book_Copies_BranchID) references Tbl_Library_Branch(Library_Branch_BranchID)
        on update cascade on delete cascade
        );
select * from   tbl_Book_Copies ;  

-- Table: tbl_Borrower
create table tbl_Borrower (
Borrower_CardNo int primary key auto_increment,
Borrower_BorrowerName varchar(255) not null,
Borrower_BorrowerAddress text not null,
Borrower_BorrowerPhone varchar(15) unique
);
select * from tbl_Borrower;

-- Table: Tbl_Book_Loans
create table tbl_bookloans (
Book_Loans_LoansID int primary key auto_increment,
Book_Loans_BookID int not null,
Book_Loans_BranchID int not null,
Book_Loans_CardNo int not null,
Book_Loans_DateOut varchar(225) not null,
Book_Loans_DueDate varchar(225) not null ,
foreign key (Book_Loans_BookID) references tbl_Book(Book_BookID)
        on update cascade on delete cascade,
foreign key (Book_Loans_BranchID) references tbl_Library_Branch(Library_Branch_BranchID)
        on update cascade on delete cascade,
foreign key (Book_Loans_CardNo) references tbl_Borrower(Borrower_CardNo)
        on update cascade on delete cascade
);
select * from tbl_Bookloans;

-- How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"
select bc.Book_Copies_No_Of_Copies
from tbl_Book b
join tbl_Book_Copies bc on b.Book_BookID = bc.Book_Copies_BookID
join tbl_Library_Branch lb on bc.Book_Copies_BranchID = lb.Library_Branch_BranchID
where b.Book_Title = 'The Lost Tribe'
anD lb.Library_Branch_BranchName = 'Sharpstown';

-- How many copies of the book titled "The Lost Tribe" are owned by each library branch
select lb.Library_Branch_BranchName, bc.Book_Copies_no_Of_Copies
from tbl_Book b
join tbl_Book_Copies bc on b.Book_BookID = bc.Book_Copies_BookID
join tbl_Library_Branch lb on bc.Book_Copies_BranchID = lb.Library_Branch_BranchID
wheRe b.Book_Title ='the lost tribe';

-- Retrieve the names of all borrowers who do not have any books checked out
select br.Borrower_BorrowerName
FROM tbl_Borrower br
leFt join tbl_bookloans bl on br.Borrower_CardNo = bl.Book_Loans_CardNo
where bl.Book_Loans_CardNo is null;

-- For each book loaned out from "Sharpstown" branch and whose DueDate is '2018-02-03', 
-- retrieve the book title, borrower's name, and address. 
select b.Book_Title, br.Borrower_BorrowerName, br.Borrower_BorrowerAddress
from tbl_bookloans bl
join tbl_Book b on bl.Book_Loans_BookID = b.Book_BookID
join tbl_Borrower br on bl.Book_Loans_CardNo = br.Borrower_CardNo
join tbl_Library_Branch lb on bl.Book_Loans_BranchID = lb.Library_Branch_BranchID
where lb.Library_Branch_BranchName = 'Sharpstown'
  and bl.Book_Loans_DueDate = '2018-02-03' or 3-2-18;
  
  
-- For each library branch, retrieve the branch name and total number of books loaned out from that branch. 
 select lb.Library_Branch_BranchName, count(bl.Book_loans_LoansID) as Total_Book_Loaned 
from tbl_Library_Branch lb
left join tbl_bookloans bl on lb.Library_Branch_BranchID =bl.Book_Loans_BranchID
group by lb.Library_Branch_BranchName;

/*Retrieve the names, addresses, 
and number of books checked out for all borrowers who have more than five books checked out*/
select br.Borrower_BorrowerName,br.Borrower_BorrowerAddress, count(bl.Book_Loans_LoansID) as Book_Checked_Out
from tbl_Borrower br
join tbl_bookloans bl on br.Borrower_CardNO = bl.Book_Loans_CardNO
group by br.Borrower_BorrowerName, br.Borrower_BorrowerAddress
having count(bl.Book_LOans_LoansID) >5;

   /*For each book authored by "Stephen King",
   retrieve the title and the number of copies owned by the library branch whose name is "Central" */
   
   select b.Book_Title, bc.Book_Copies_No_Of_Copies
from tbl_Book_Author ba
join tbl_Book b on ba.Book_Authors_BookID = b.Book_BookID
join tbl_Book_Copies bc on b.Book_BookID = bc.Book_Copies_BookID
join tbl_Library_Branch lb on bc.Book_Copies_BranchID = lb.Library_Branch_BranchID
where ba.Book_Authors_AuthorName = 'Stephen King'
  And lb.Library_Branch_BranchName = 'Central';

        
        

