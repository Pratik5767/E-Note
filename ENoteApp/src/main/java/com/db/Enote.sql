CREATE DATABASE enote;

USE enote;

CREATE TABLE users (
id INT AUTO_INCREMENT PRIMARY KEY,
fname VARCHAR(45),
email VARCHAR(45),
password VARCHAR(45)
);

SELECT id,fname,email,password FROM users;

CREATE TABLE post(
id INT AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(40),
content VARCHAR(200),
date TIMESTAMP NULL DEFAULT now(),
uid INT,
CONSTRAINT uid FOREIGN KEY(uid) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE
);

SELECT * FROM post;