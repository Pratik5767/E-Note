# E Note App

## 📚 Project Overview

E-Note is a web-based note-taking application built using **Java**, **JDBC**, **Servlets**, and **JSP**. This project supports **CRUD (Create, Read, Update, Delete)** operations for managing notes and includes user authentication features such as login and signup.

## 🚀 Features

- **User Authentication:** Secure login and signup functionality.
- **Create Notes:** Users can create and store notes in the database.
- **Read Notes:** View a list of saved notes.
- **Update Notes:** Edit existing notes.
- **Delete Notes:** Remove notes when no longer needed.
- **Session Management:** Maintains user sessions for a personalized experience.
- **Responsive UI:** Built using JSP for a dynamic and user-friendly interface.
- **Database Integration:** Uses JDBC to interact with MySQL.

## 🛠️ Technologies Used

- **Java** (Servlets & JSP)
- **JDBC** (Database Connectivity)
- **MySQL** (Database)
- **Tomcat Server** (Web Deployment)
- **HTML, CSS, Bootstrap** (Front-end UI)

## ⚙️ Setup Instructions

### 1. Prerequisites
- Java Development Kit (JDK) installed.
- Apache Tomcat Server installed and configured.
- MySQL installed and running.
- A MySQL database with the required tables.

### 2. Database Configuration
Create a MySQL database and execute the following SQL script:

```sql
CREATE DATABASE enote_db;
USE enote_db;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    password VARCHAR(255)
);

CREATE TABLE notes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    title VARCHAR(255),
    content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);
```

### 3. Project Setup

1. Clone the repository:  
   ```bash
   git clone https://github.com/Pratik5767/E-Note.git
   ```
2. Import the project into your IDE (Eclipse/IntelliJ).
3. Configure the MySQL database:
   - Create a database (e.g., ```e_note```).
   - Execute the provided SQL script to create necessary tables.
4. Update database connection details in ```DBConnection.java:```
   ```
   String url = "jdbc:mysql://localhost:3306/e_note";
   String user = "root";
   String password = "yourpassword";
   ```
5. Deploy the project on Apache Tomcat.
6. Run the application and access it via ```http://localhost:8080/E-Note/```.

## 📸 Screenshots
- *[Include images of your login page, user dashboard, and CRUD operations]*

## 👤 Author
- **Pratik Salunkhe**
- **Email:** pratikvsalunkhe924@gmail.com
- **LinkedIn:** [click here](https://www.linkedin.com/in/pratik-salunkhe-84157a269/)

**Show your support by giving a ⭐ if you liked this project!**
