-- File: alx_book_store.sql
-- Create database and tables for the online bookstore

CREATE DATABASE IF NOT EXISTS alx_book_store
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;
USE alx_book_store;

-- Authors table
CREATE TABLE IF NOT EXISTS Authors (
  author_id INT AUTO_INCREMENT PRIMARY KEY,
  author_name VARCHAR(215) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Books table
CREATE TABLE IF NOT EXISTS Books (
  book_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(130) NOT NULL,
  author_id INT,
  price DOUBLE,
  publication_date DATE,
  CONSTRAINT fk_books_author
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
    ON DELETE SET NULL
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Customers table
CREATE TABLE IF NOT EXISTS Customers (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_name VARCHAR(215) NOT NULL,
  email VARCHAR(215),
  address TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Orders table
CREATE TABLE IF NOT EXISTS Orders (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  CONSTRAINT fk_orders_customer
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
    ON DELETE SET NULL
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Order_Details table
CREATE TABLE IF NOT EXISTS Order_Details (
  orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT,
  book_id INT,
  quantity DOUBLE,
  CONSTRAINT fk_orderdetails_order
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_orderdetails_book
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
    ON DELETE SET NULL
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Optional: sample data to test
INSERT INTO Authors (author_name) VALUES ('Naguib Mahfouz'), ('Paulo Coelho');
INSERT INTO Books (title, author_id, price, publication_date) VALUES
  ('Palace Walk', 1, 12.50, '1956-01-01'),
  ('The Alchemist', 2, 9.99, '1988-05-01');

INSERT INTO Customers (customer_name, email, address) VALUES
  ('Ali Hassan', 'ali@example.com', 'Cairo, Egypt'),
  ('Sara Ahmed', 'sara@example.com', 'Alexandria, Egypt');

INSERT INTO Orders (customer_id, order_date) VALUES
  (1, CURDATE()),
  (2, CURDATE());

INSERT INTO Order_Details (order_id, book_id, quantity) VALUES
  (1, 1, 1),
  (1, 2, 2),
  (2, 2, 1);

-- Quick checks
SELECT COUNT(*) AS total_authors FROM Authors;
SELECT * FROM Books LIMIT 5;
SELECT * FROM Orders LIMIT 5;
SELECT od.orderdetailid, o.order_id, c.customer_name, b.title, od.quantity
FROM Order_Details od
LEFT JOIN Orders o ON od.order_id = o.order_id
LEFT JOIN Customers c ON o.customer_id = c.customer_id
LEFT JOIN Books b ON od.book_id = b.book_id;
