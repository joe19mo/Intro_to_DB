-- File: task_2.sql
-- Creates all tables for the alx_book_store database

USE alx_book_store;

-- AUTHORS table
CREATE TABLE IF NOT EXISTS Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;

-- BOOKS table
CREATE TABLE IF NOT EXISTS Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;

-- CUSTOMERS table
CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215),
    address TEXT
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;

-- ORDERS table
CREATE TABLE IF NOT EXISTS Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;

-- ORDER_DETAILS table
CREATE TABLE IF NOT EXISTS Order_Details (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DOUBLE,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;
