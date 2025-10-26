-- Nom du fichier : alx_book_store.sql
-- Script de création de la base de données et des tables pour la librairie en ligne.

-- 1. CREATION DE LA BASE DE DONNEES
CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

-- 2. CREATION DE LA TABLE 'Authors'
CREATE TABLE IF NOT EXISTS Authors (
    author_id INT NOT NULL PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- 3. CREATION DE LA TABLE 'Books'
CREATE TABLE IF NOT EXISTS Books (
    book_id INT NOT NULL PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT NOT NULL,
    price DOUBLE NOT NULL,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- 4. CREATION DE LA TABLE 'Customers'
CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT NOT NULL PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL UNIQUE,
    address TEXT
);

-- 5. CREATION DE LA TABLE 'Orders'
CREATE TABLE IF NOT EXISTS Orders (
    order_id INT NOT NULL PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- 6. CREATION DE LA TABLE 'Order_Details'
CREATE TABLE IF NOT EXISTS Order_Details (
    orderdetailid INT NOT NULL PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity DOUBLE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);