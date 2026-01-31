🏦 Indian Spring Bank – Spring 6 JDBC Web Application

Indian Spring Bank is a Spring 6 MVC + Spring JDBC web application that simulates core banking operations with role-based authentication for Admin and Customer users.

The project demonstrates a real-world banking workflow, including authentication, transactions, account management, and role-specific dashboards using a clean layered architecture.
🚀 Project Status

Actively Developed – Core Features Implemented
✅ Completed Features

    Admin & Customer based login

    Role-based dashboard access

    Customer signup

    Secure authentication flow

    Spring JDBC integration using JdbcTemplate

    Admin dashboard with customer management

    Customer dashboard with account operations

    Deposit & Withdraw functionality

    Balance check

    Transaction history

    Account details update

    UI improvements with icons and styling

    Client-side validation

🎯 Project Goals

    Build a realistic banking web application

    Practice Spring 6 MVC + Spring JDBC

    Implement role-based access

    Apply DAO pattern using JdbcTemplate

    Strengthen backend concepts (auth, transactions)

    Improve frontend integration with JSP, CSS & JS

✨ Key Features
👨‍💼 Admin Module

    Admin login

    View all customers

    View individual customer details

    Monitor customer accounts

    Manage customer data

👤 Customer Module

    Customer signup

    Customer login

    View account balance

    Deposit money

    Withdraw money

    View transaction history

    Update account details

🛠 Tech Stack
Backend

    Java

    Spring Framework 6

    Spring JDBC

    JdbcTemplate

Frontend

    JSP

    HTML

    CSS

    JavaScript

Build Tool

    Maven

Server

    Apache Tomcat 10+

Database

    Relational DB (MySQL / PostgreSQL configurable)

📁 Project Structure

```
spring6Jdbc2/
├─ pom.xml
├─ src/
│  ├─ main/
│  │  ├─ java/
│  │  │  └─ com/koushik/spring6Jdbc2/
│  │  │     ├─ config/
│  │  │     │  ├─ DbConfig.java
│  │  │     │  ├─ WebConfig.java
│  │  │     │  └─ WebInitializer.java
│  │  │     ├─ controller/
│  │  │     │  └─ HomeController.java
│  │  │     ├─ dao/
│  │  │     │  ├─ UserDao.java
│  │  │     │  └─ UserDaoImpl.java
│  │  │     └─ model/
│  │  │        ├─ Admin.java
│  │  │        ├─ User.java
│  │  │        └─ Transactions.java
│  │  ├─ webapp/
│  │  │  ├─ css/
│  │  │  ├─ img/
│  │  │  ├─ js/
│  │  │  └─ WEB-INF/view/
│  │  │     ├─ auth/
│  │  │     ├─ dashboard/
│  │  │     │  ├─ admin/
│  │  │     │  └─ customer/
│  │  │     └─ index.jsp
│  └─ test/
└─ target/

```

▶️ How the Application Works

    WebInitializer.java bootstraps the Spring MVC application

    WebConfig.java handles MVC setup and view resolution

    DbConfig.java configures:

        DataSource

        JdbcTemplate

    HomeController.java manages routing and request handling

    UserDaoImpl.java performs all DB operations using JdbcTemplate

    JSP pages render role-specific dashboards

🚀 How to Run the Project
Prerequisites

    Java JDK 17+

    Maven

    Apache Tomcat 10+

    MySQL / PostgreSQL database

    IDE (Eclipse / IntelliJ / NetBeans)

Steps

    Clone the repository

    Import as a Maven Project

    Configure Tomcat in your IDE

    Update database credentials in:

com/koushik/spring6Jdbc2/config/DbConfig.java

    Start the database server

    Deploy the project (Run / Deploy)

    Open the URL shown by your IDE

⚠️ Deployment & Access Note

This project runs on a local Apache Tomcat server.

    Port number may vary (8080, 8081, etc.)

    Always use the exact URL shown after deployment

    The app works only on your local machine unless hosted

Example:

http://localhost:8080/SpringBankManagement/

🧠 Concepts Demonstrated

    Spring 6 MVC architecture

    Spring JDBC with JdbcTemplate

    DAO pattern

    Role-based authentication

    Transaction handling

    MVC separation of concerns

    Real-world banking workflow

    JSP-based UI integration

🔮 Planned Enhancements

    Improved exception handling (404 / 500)

    Centralized error pages

    Enhanced security (sessions, access control)

    Logging & monitoring

    Pagination for transaction history

    UI/UX refinements

👤 Author

Koushik Karmakar
Java Backend Developer (Learning)
Spring Framework • JDBC • MVC • Web Applications
📌 Notes

This project is part of my backend-focused Java learning journey.
It reflects progressive improvements as I learn new Spring and database concepts.
