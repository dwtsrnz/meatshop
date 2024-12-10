CREATE DATABASE meatshop;
drop database meatshop;
USE meatshop;

-- Users table
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'user') DEFAULT 'user'
);

-- Meats table
CREATE TABLE meats (
    meat_id INT PRIMARY KEY AUTO_INCREMENT,
    meat_type VARCHAR(50) NOT NULL,
    meat_name VARCHAR(50) NOT NULL,
    meat_image mediumblob,
    price DECIMAL(10 , 2 ) NOT NULL
);

-- Cart table
CREATE TABLE carts (
    cart_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id)
        REFERENCES users (id)
        ON DELETE CASCADE
);

-- Cart Items table
CREATE TABLE cart_items (
    cart_item_id INT PRIMARY KEY AUTO_INCREMENT,
    cart_id INT NOT NULL,
    meat_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    FOREIGN KEY (cart_id)
        REFERENCES carts (cart_id)
        ON DELETE CASCADE,
    FOREIGN KEY (meat_id)
        REFERENCES meats (meat_id)
        ON DELETE CASCADE
);


select * from users
