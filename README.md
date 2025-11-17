# LiberyManagementSystem
This project is a fully structured SQL-based Library Management System designed to manage books, borrowers, authors, branches, and book loans efficiently. It includes complete database creation, table design, relationships using foreign keys, and real-world SQL queries used in library operations.
# 📑 Table of Contents

1. [Project Description]
2. [Database Schema Overview](#database-schema-overview)
   * [Publisher](#1-publisher--tbl_publisher)
   * [Book](#2-book--tbl_book)
   * [Book Author](#3-book-author--tbl_book_author)
   * [Library Branch](#4-library-branch--tbl_library_branch)
   * [Book Copies](#5-book-copies--tbl_book_copies)
   * [Borrower](#6-borrower--tbl_borrower)
   * [Book Loans](#7-book-loans--tbl_bookloans)
3. [ER Diagram](#er-diagram)
4. [SQL Queries Included](#sql-queries-included)
5. [How to Run](#how-to-run)
6. [Features](#features)
7. [Future Enhancements](#future-enhancements)


#  Project Description

This SQL project represents a fully functional **Library Management System**.
It manages:

* Books and publishers
* Authors
* Multiple library branches
* Book copies at each branch
* Borrowers
* Book borrowing and due dates

This project demonstrates SQL features like:

* Joins (INNER, LEFT)
* Aggregations (COUNT, GROUP BY)
* Cascading foreign key constraints
* Integrity checks
* Well-normalized table structure


#  Database Schema Overview

## **1. Publisher – `tbl_Publisher`**

Stores publisher details.

* Publisher Name *(PK)*
* Address
* Phone


## **2. Book – `tbl_Book`**

Stores book details and links to publishers.

* Book ID *(PK)*
* Book Title
* Publisher Name *(FK → Publisher)*



## **3. Book Author – `tbl_Book_Author`**

Supports multiple authors per book.

* Author ID *(PK)*
* Book ID *(FK → Book)*
* Author Name

---

## **4. Library Branch – `tbl_Library_Branch`**

Stores details about library branches.

* Branch ID *(PK)*
* Name *(Unique)*
* Address

---

## **5. Book Copies – `tbl_Book_Copies`**

Tracks available copies at each branch.

* Copies ID *(PK)*
* Book ID *(FK)*
* Branch ID *(FK)*
* Number of Copies *(CHECK ≥ 0)*

---

## **6. Borrower – `tbl_Borrower`**

Holds borrower information.

* Card Number *(PK)*
* Name
* Address
* Phone Number *(Unique)*

---

## **7. Book Loans – `tbl_BookLoans`**

Tracks book borrowing activity.

* Loan ID *(PK)*
* Book ID *(FK)*
* Branch ID *(FK)*
* Card No *(FK)*
* Date Out
* Due Date


---

# SQL Queries Included

The project contains several practical SQL queries:

* Number of copies of a book in a specific branch
* Copies of a book across all branches
* Borrowers with no checked-out books
* Loans from a specific branch on a specific date
* Total books loaned per branch
* Borrowers with more than 5 books checked out
* Stephen King's books available in the Central branch

---

#  How to Run

1. Install: MySQL / MariaDB / XAMPP
2. Open MySQL Workbench or phpMyAdmin
3. Copy & run the SQL script
4. Execute the provided queries for testing

---

#  Features

* Clean relational database structure
* Cascading foreign key relationships
* Real-world SQL practice
* Beginner-friendly yet industry applicable
* Well-structured queries

---

#  Future Enhancements

* Add sample data (INSERT queries)
* Add stored procedures
* Add triggers for book returns
* Build a frontend (Python / Java / web)
* Add stored functions

