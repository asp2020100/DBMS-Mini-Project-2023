DROP TABLE IF EXISTS account;
CREATE TABLE `account` (
  `Month` varchar(18) NOT NULL,
  `Cus_ID` int(5) NOT NULL,
  `Allocated_Units` int(4) NOT NULL,
  `Used_Units` int(4) NOT NULL,
  PRIMARY KEY (`Month`,`Cus_ID`),
  KEY `Cus_ID` (`Cus_ID`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`Cus_ID`) REFERENCES `customer` (`Cus_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS approves;
CREATE TABLE `approves` (
  `Req_ID` int(5) NOT NULL,
  `Mgr_ID` int(5) NOT NULL,
  `Date` date NOT NULL,
  KEY `Mgr_ID` (`Mgr_ID`),
  KEY `Req_ID` (`Req_ID`),
  CONSTRAINT `approves_ibfk_1` FOREIGN KEY (`Mgr_ID`) REFERENCES `manager` (`Emp_ID`),
  CONSTRAINT `approves_ibfk_2` FOREIGN KEY (`Req_ID`) REFERENCES `new_connection` (`Req_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS complaint;
CREATE TABLE `complaint` (
  `Comp_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Cus_ID` int(5) NOT NULL,
  `Date` date NOT NULL,
  `Description` varchar(300) NOT NULL,
  `Status` varchar(50) NOT NULL,
  PRIMARY KEY (`Comp_ID`),
  KEY `Cus_ID` (`Cus_ID`),
  CONSTRAINT `complaint_ibfk_1` FOREIGN KEY (`Cus_ID`) REFERENCES `customer` (`Cus_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56800 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS customer;
CREATE TABLE `customer` (
  `Cus_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Req_ID` int(5) NOT NULL,
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `Phone` int(10) NOT NULL,
  `Address` varchar(100) NOT NULL,
  PRIMARY KEY (`Cus_ID`),
  KEY `Req_ID` (`Req_ID`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`Req_ID`) REFERENCES `new_connection` (`Req_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=40001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO customer VALUES('40000','36000','Gunapala','Malalasekara','785245145','No98,Hokandara');
DROP TABLE IF EXISTS employee;
CREATE TABLE `employee` (
  `Emp_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Password` varchar(10) NOT NULL,
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `DoB` date NOT NULL,
  `Sex` varchar(7) NOT NULL,
  PRIMARY KEY (`Emp_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14770 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO employee VALUES('14761','password','Kasun','Kariyawasam','No. 14, Temple Rd, Kegalle','1997-04-14','Male');
INSERT INTO employee VALUES('14762','password','Nimani','Dilsha','No. 14, Samagi Mw, Habarakada,Homagama','2000-08-06','Female');
INSERT INTO employee VALUES('14763','password','Supipi','Samarasena','No. 12/34, Homagama South, Homagama','1997-06-02','Female');
INSERT INTO employee VALUES('14764','password','Saheli','Gamage','No. 11, Church Rd, Pettah','1999-11-14','Female');
INSERT INTO employee VALUES('14765','password','Gunadasa ','Kapuge','No. 78, Pahala Diwulgaslanda, Anuradhapura','1977-02-16','Male');
INSERT INTO employee VALUES('14766','password','Sanka','Dineth','No. 7855, Govt. Houses, Rathmalana','2000-06-02','Male');
INSERT INTO employee VALUES('14767','password','Rohana','Samantha','No. 794/A, Batapola','1978-07-18','Male');
INSERT INTO employee VALUES('14768','password','Gamini','Perera','No. 147/1/A, School Lane, Mawathagama','1982-05-21','Male');
INSERT INTO employee VALUES('14769','password','Lahiru','Perera','No. 67/23, Wellawaththa, Mathara','1998-07-23','Male');
DROP TABLE IF EXISTS establishes;
CREATE TABLE `establishes` (
  `Req_ID` int(5) NOT NULL,
  `Emp_ID` int(5) NOT NULL,
  `Date` date NOT NULL,
  KEY `Emp_ID` (`Emp_ID`),
  KEY `Req_ID` (`Req_ID`),
  CONSTRAINT `establishes_ibfk_1` FOREIGN KEY (`Emp_ID`) REFERENCES `service_personnal` (`Emp_ID`),
  CONSTRAINT `establishes_ibfk_2` FOREIGN KEY (`Req_ID`) REFERENCES `new_connection` (`Req_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS feedback;
CREATE TABLE `feedback` (
  `Feedback_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Cus_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  `Description` varchar(300) NOT NULL,
  PRIMARY KEY (`Feedback_ID`),
  KEY `Cus_ID` (`Cus_ID`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`Cus_ID`) REFERENCES `customer` (`Cus_ID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=60000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS manager;
CREATE TABLE `manager` (
  `Emp_ID` int(5) NOT NULL,
  `Grade` int(1) NOT NULL,
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`Emp_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO manager VALUES('14761','2');
INSERT INTO manager VALUES('14762','1');
INSERT INTO manager VALUES('14763','3');
INSERT INTO manager VALUES('14769','1');
DROP TABLE IF EXISTS manipulates;
CREATE TABLE `manipulates` (
  `Email` varchar(50) DEFAULT NULL,
  `Emp_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  UNIQUE KEY `Emp_ID` (`Emp_ID`),
  KEY `Email` (`Email`),
  CONSTRAINT `manipulates_ibfk_1` FOREIGN KEY (`Email`) REFERENCES `sys_admin` (`Email`) ON DELETE CASCADE,
  CONSTRAINT `manipulates_ibfk_2` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`Emp_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO manipulates VALUES('hansisew@gmail.com','14761','2023-03-05');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14762','2023-03-05');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14763','2023-03-05');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14764','2023-03-05');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14765','2023-03-05');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14766','2023-03-05');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14767','2023-03-05');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14768','2023-03-05');
INSERT INTO manipulates VALUES('sithumij@gmail.com','14769','2023-03-05');
DROP TABLE IF EXISTS new_connection;
CREATE TABLE `new_connection` (
  `Req_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Area` varchar(20) NOT NULL,
  `Status` varchar(14) DEFAULT 'Pending',
  PRIMARY KEY (`Req_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=36001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO new_connection VALUES('36000','2023-02-13','Pitipana','Approved');
DROP TABLE IF EXISTS notice_board;
CREATE TABLE `notice_board` (
  `Notice_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Emp_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  `Description` varchar(300) NOT NULL,
  PRIMARY KEY (`Notice_ID`),
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `notice_board_ibfk_1` FOREIGN KEY (`Emp_ID`) REFERENCES `staff` (`Emp_ID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=16000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS payment_history;
CREATE TABLE `payment_history` (
  `Month` varchar(18) NOT NULL,
  `Cus_ID` int(5) NOT NULL,
  `Paid_Date` date NOT NULL,
  `Paid_Amount` double(5,2) NOT NULL,
  PRIMARY KEY (`Month`,`Cus_ID`),
  KEY `Cus_ID` (`Cus_ID`),
  CONSTRAINT `payment_history_ibfk_1` FOREIGN KEY (`Cus_ID`) REFERENCES `customer` (`Cus_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO payment_history VALUES('2023-01','40000','2023-02-20','100.00');
INSERT INTO payment_history VALUES('2023-02','40000','2023-02-20','100.00');
DROP TABLE IF EXISTS reviews;
CREATE TABLE `reviews` (
  `Feedback_ID` int(5) NOT NULL,
  `Emp_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  KEY `Feedback_ID` (`Feedback_ID`),
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`Feedback_ID`) REFERENCES `feedback` (`Feedback_ID`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`Emp_ID`) REFERENCES `staff` (`Emp_ID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS salary;
CREATE TABLE `salary` (
  `Payment_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Mgr_ID` int(5) NOT NULL,
  `Emp_ID` int(5) NOT NULL,
  `Date` date NOT NULL,
  `Amount_Paid` double(5,2) NOT NULL,
  PRIMARY KEY (`Payment_ID`),
  KEY `Mgr_ID` (`Mgr_ID`),
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `salary_ibfk_1` FOREIGN KEY (`Mgr_ID`) REFERENCES `manager` (`Emp_ID`),
  CONSTRAINT `salary_ibfk_2` FOREIGN KEY (`Emp_ID`) REFERENCES `staff` (`Emp_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=28000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS service_personnal;
CREATE TABLE `service_personnal` (
  `Emp_ID` int(5) NOT NULL,
  `Area` varchar(20) NOT NULL,
  `Type` varchar(15) NOT NULL,
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `service_personnal_ibfk_2` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`Emp_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO service_personnal VALUES('14767','Kandy','Plumberr');
INSERT INTO service_personnal VALUES('14768','Nuwara Eliya','Driver');
DROP TABLE IF EXISTS solves;
CREATE TABLE `solves` (
  `Comp_ID` int(5) NOT NULL,
  `Emp_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  KEY `Comp_ID` (`Comp_ID`),
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `solves_ibfk_1` FOREIGN KEY (`Comp_ID`) REFERENCES `complaint` (`Comp_ID`) ON DELETE CASCADE,
  CONSTRAINT `solves_ibfk_2` FOREIGN KEY (`Emp_ID`) REFERENCES `service_personnal` (`Emp_ID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS staff;
CREATE TABLE `staff` (
  `Emp_ID` int(5) NOT NULL,
  `Area` varchar(20) NOT NULL,
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `staff_ibfk_2` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`Emp_ID`) ON DELETE CASCADE,
  CONSTRAINT `staff_ibfk_3` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`Emp_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO staff VALUES('14764','Colombo');
INSERT INTO staff VALUES('14765','Anuradhapura');
INSERT INTO staff VALUES('14766','Kalutara');
DROP TABLE IF EXISTS sys_admin;
CREATE TABLE `sys_admin` (
  `Email` varchar(50) NOT NULL,
  `Password` varchar(10) NOT NULL,
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `Address` varchar(100) NOT NULL,
  PRIMARY KEY (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO sys_admin VALUES('hansisew@gmail.com','abcd1234','Hansi','Weerawardana','No.457/10, Mihindu Mw, Anuradhapura');
INSERT INTO sys_admin VALUES('kamalperera@gmail.com','abcd1234','Kamal','Perera','No.10, Temple Road, Meegoda');
INSERT INTO sys_admin VALUES('razor423@gmail.com','abcd1234','Lasiru','Dodamgoda','No.847, Katayamwaththa, Udahamulla');
INSERT INTO sys_admin VALUES('samanperera@gmail.com','abcd1234','Saman','Perera','No.10, Temple Road, Meegoda');
INSERT INTO sys_admin VALUES('sithumij@gmail.com','abcd1234','Sithumi','Gunasekara','\"Sithumi\", Yaya Road, Homagama South, Homagama');
DROP TABLE IF EXISTS account;
CREATE TABLE `account` (
  `Month` varchar(18) NOT NULL,
  `Cus_ID` int(5) NOT NULL,
  `Allocated_Units` int(4) NOT NULL,
  `Used_Units` int(4) NOT NULL,
  PRIMARY KEY (`Month`,`Cus_ID`),
  KEY `Cus_ID` (`Cus_ID`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`Cus_ID`) REFERENCES `customer` (`Cus_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS approves;
CREATE TABLE `approves` (
  `Req_ID` int(5) NOT NULL,
  `Mgr_ID` int(5) NOT NULL,
  `Date` date NOT NULL,
  KEY `Mgr_ID` (`Mgr_ID`),
  KEY `Req_ID` (`Req_ID`),
  CONSTRAINT `approves_ibfk_1` FOREIGN KEY (`Mgr_ID`) REFERENCES `manager` (`Emp_ID`),
  CONSTRAINT `approves_ibfk_2` FOREIGN KEY (`Req_ID`) REFERENCES `new_connection` (`Req_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS complaint;
CREATE TABLE `complaint` (
  `Comp_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Cus_ID` int(5) NOT NULL,
  `Date` date NOT NULL,
  `Description` varchar(300) NOT NULL,
  `Status` varchar(50) NOT NULL,
  PRIMARY KEY (`Comp_ID`),
  KEY `Cus_ID` (`Cus_ID`),
  CONSTRAINT `complaint_ibfk_1` FOREIGN KEY (`Cus_ID`) REFERENCES `customer` (`Cus_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56800 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS customer;
CREATE TABLE `customer` (
  `Cus_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Req_ID` int(5) NOT NULL,
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `Phone` int(10) NOT NULL,
  `Address` varchar(100) NOT NULL,
  PRIMARY KEY (`Cus_ID`),
  KEY `Req_ID` (`Req_ID`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`Req_ID`) REFERENCES `new_connection` (`Req_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=40001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO customer VALUES('40000','36000','Gunapala','Malalasekara','785245145','No98,Hokandara');
DROP TABLE IF EXISTS employee;
CREATE TABLE `employee` (
  `Emp_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Password` varchar(10) NOT NULL,
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `DoB` date NOT NULL,
  `Sex` varchar(7) NOT NULL,
  PRIMARY KEY (`Emp_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14770 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO employee VALUES('14761','password','Kasun','Kariyawasam','No. 14, Temple Rd, Kegalle','1997-04-14','Male');
INSERT INTO employee VALUES('14762','password','Nimani','Dilsha','No. 14, Samagi Mw, Habarakada,Homagama','2000-08-06','Female');
INSERT INTO employee VALUES('14763','password','Supipi','Samarasena','No. 12/34, Homagama South, Homagama','1997-06-02','Female');
INSERT INTO employee VALUES('14764','password','Saheli','Gamage','No. 11, Church Rd, Pettah','1999-11-14','Female');
INSERT INTO employee VALUES('14765','password','Gunadasa ','Kapuge','No. 78, Pahala Diwulgaslanda, Anuradhapura','1977-02-16','Male');
INSERT INTO employee VALUES('14766','password','Sanka','Dineth','No. 7855, Govt. Houses, Rathmalana','2000-06-02','Male');
INSERT INTO employee VALUES('14767','password','Rohana','Samantha','No. 794/A, Batapola','1978-07-18','Male');
INSERT INTO employee VALUES('14768','password','Gamini','Perera','No. 147/1/A, School Lane, Mawathagama','1982-05-21','Male');
INSERT INTO employee VALUES('14769','password','Lahiru','Perera','No. 67/23, Wellawaththa, Mathara','1998-07-23','Male');
DROP TABLE IF EXISTS establishes;
CREATE TABLE `establishes` (
  `Req_ID` int(5) NOT NULL,
  `Emp_ID` int(5) NOT NULL,
  `Date` date NOT NULL,
  KEY `Emp_ID` (`Emp_ID`),
  KEY `Req_ID` (`Req_ID`),
  CONSTRAINT `establishes_ibfk_1` FOREIGN KEY (`Emp_ID`) REFERENCES `service_personnal` (`Emp_ID`),
  CONSTRAINT `establishes_ibfk_2` FOREIGN KEY (`Req_ID`) REFERENCES `new_connection` (`Req_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS feedback;
CREATE TABLE `feedback` (
  `Feedback_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Cus_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  `Description` varchar(300) NOT NULL,
  PRIMARY KEY (`Feedback_ID`),
  KEY `Cus_ID` (`Cus_ID`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`Cus_ID`) REFERENCES `customer` (`Cus_ID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=60000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS manager;
CREATE TABLE `manager` (
  `Emp_ID` int(5) NOT NULL,
  `Grade` int(1) NOT NULL,
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`Emp_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO manager VALUES('14761','2');
INSERT INTO manager VALUES('14762','1');
INSERT INTO manager VALUES('14763','3');
INSERT INTO manager VALUES('14769','1');
DROP TABLE IF EXISTS manipulates;
CREATE TABLE `manipulates` (
  `Email` varchar(50) DEFAULT NULL,
  `Emp_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  UNIQUE KEY `Emp_ID` (`Emp_ID`),
  KEY `Email` (`Email`),
  CONSTRAINT `manipulates_ibfk_1` FOREIGN KEY (`Email`) REFERENCES `sys_admin` (`Email`) ON DELETE CASCADE,
  CONSTRAINT `manipulates_ibfk_2` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`Emp_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO manipulates VALUES('hansisew@gmail.com','14761','2023-03-05');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14762','2023-03-05');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14763','2023-03-05');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14764','2023-03-05');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14765','2023-03-05');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14766','2023-03-05');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14767','2023-03-05');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14768','2023-03-05');
INSERT INTO manipulates VALUES('sithumij@gmail.com','14769','2023-03-05');
DROP TABLE IF EXISTS new_connection;
CREATE TABLE `new_connection` (
  `Req_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Area` varchar(20) NOT NULL,
  `Status` varchar(14) DEFAULT 'Pending',
  PRIMARY KEY (`Req_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=36004 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO new_connection VALUES('36000','2023-02-13','Pitipana','Approved');
INSERT INTO new_connection VALUES('36001','0000-00-00','Godagama','Pending');
INSERT INTO new_connection VALUES('36002','2023-03-05','Godagama','Pending');
INSERT INTO new_connection VALUES('36003','2023-03-05','Godagama','Pending');
DROP TABLE IF EXISTS notice_board;
CREATE TABLE `notice_board` (
  `Notice_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Emp_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  `Description` varchar(300) NOT NULL,
  PRIMARY KEY (`Notice_ID`),
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `notice_board_ibfk_1` FOREIGN KEY (`Emp_ID`) REFERENCES `staff` (`Emp_ID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=16000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS payment_history;
CREATE TABLE `payment_history` (
  `Month` varchar(18) NOT NULL,
  `Cus_ID` int(5) NOT NULL,
  `Paid_Date` date NOT NULL,
  `Paid_Amount` double(5,2) NOT NULL,
  PRIMARY KEY (`Month`,`Cus_ID`),
  KEY `Cus_ID` (`Cus_ID`),
  CONSTRAINT `payment_history_ibfk_1` FOREIGN KEY (`Cus_ID`) REFERENCES `customer` (`Cus_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO payment_history VALUES('2023-01','40000','2023-02-20','100.00');
INSERT INTO payment_history VALUES('2023-02','40000','2023-02-20','100.00');
DROP TABLE IF EXISTS reviews;
CREATE TABLE `reviews` (
  `Feedback_ID` int(5) NOT NULL,
  `Emp_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  KEY `Feedback_ID` (`Feedback_ID`),
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`Feedback_ID`) REFERENCES `feedback` (`Feedback_ID`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`Emp_ID`) REFERENCES `staff` (`Emp_ID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS salary;
CREATE TABLE `salary` (
  `Payment_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Mgr_ID` int(5) NOT NULL,
  `Emp_ID` int(5) NOT NULL,
  `Date` date NOT NULL,
  `Amount_Paid` double(5,2) NOT NULL,
  PRIMARY KEY (`Payment_ID`),
  KEY `Mgr_ID` (`Mgr_ID`),
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `salary_ibfk_1` FOREIGN KEY (`Mgr_ID`) REFERENCES `manager` (`Emp_ID`),
  CONSTRAINT `salary_ibfk_2` FOREIGN KEY (`Emp_ID`) REFERENCES `staff` (`Emp_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=28000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS service_personnal;
CREATE TABLE `service_personnal` (
  `Emp_ID` int(5) NOT NULL,
  `Area` varchar(20) NOT NULL,
  `Type` varchar(15) NOT NULL,
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `service_personnal_ibfk_2` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`Emp_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO service_personnal VALUES('14767','Kandy','Plumberr');
INSERT INTO service_personnal VALUES('14768','Nuwara Eliya','Driver');
DROP TABLE IF EXISTS solves;
CREATE TABLE `solves` (
  `Comp_ID` int(5) NOT NULL,
  `Emp_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  KEY `Comp_ID` (`Comp_ID`),
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `solves_ibfk_1` FOREIGN KEY (`Comp_ID`) REFERENCES `complaint` (`Comp_ID`) ON DELETE CASCADE,
  CONSTRAINT `solves_ibfk_2` FOREIGN KEY (`Emp_ID`) REFERENCES `service_personnal` (`Emp_ID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS staff;
CREATE TABLE `staff` (
  `Emp_ID` int(5) NOT NULL,
  `Area` varchar(20) NOT NULL,
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `staff_ibfk_2` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`Emp_ID`) ON DELETE CASCADE,
  CONSTRAINT `staff_ibfk_3` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`Emp_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO staff VALUES('14764','Colombo');
INSERT INTO staff VALUES('14765','Anuradhapura');
INSERT INTO staff VALUES('14766','Kalutara');
DROP TABLE IF EXISTS sys_admin;
CREATE TABLE `sys_admin` (
  `Email` varchar(50) NOT NULL,
  `Password` varchar(10) NOT NULL,
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `Address` varchar(100) NOT NULL,
  PRIMARY KEY (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO sys_admin VALUES('hansisew@gmail.com','abcd1234','Hansi','Weerawardana','No.457/10, Mihindu Mw, Anuradhapura');
INSERT INTO sys_admin VALUES('kamalperera@gmail.com','abcd1234','Kamal','Perera','No.10, Temple Road, Meegoda');
INSERT INTO sys_admin VALUES('razor423@gmail.com','abcd1234','Lasiru','Dodamgoda','No.847, Katayamwaththa, Udahamulla');
INSERT INTO sys_admin VALUES('samanperera@gmail.com','abcd1234','Saman','Perera','No.10, Temple Road, Meegoda');
INSERT INTO sys_admin VALUES('sithumij@gmail.com','abcd1234','Sithumi','Gunasekara','\"Sithumi\", Yaya Road, Homagama South, Homagama');
DROP TABLE IF EXISTS account;
CREATE TABLE `account` (
  `Month` varchar(18) NOT NULL,
  `Cus_ID` int(5) NOT NULL,
  `Allocated_Units` int(4) NOT NULL,
  `Used_Units` int(4) NOT NULL,
  PRIMARY KEY (`Month`,`Cus_ID`),
  KEY `Cus_ID` (`Cus_ID`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`Cus_ID`) REFERENCES `customer` (`Cus_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO account VALUES('2023-03','40004','0','0');
INSERT INTO account VALUES('2023-03','40010','0','0');
INSERT INTO account VALUES('2023-03','40011','0','0');
INSERT INTO account VALUES('2023-03','40012','100','100');
INSERT INTO account VALUES('2023-03','40013','0','0');
INSERT INTO account VALUES('2023-03','40014','0','0');
INSERT INTO account VALUES('2023-03','40015','0','0');
DROP TABLE IF EXISTS approves;
CREATE TABLE `approves` (
  `Req_ID` int(5) NOT NULL,
  `Mgr_ID` int(5) NOT NULL,
  `Date` date NOT NULL,
  KEY `Mgr_ID` (`Mgr_ID`),
  KEY `Req_ID` (`Req_ID`),
  CONSTRAINT `approves_ibfk_1` FOREIGN KEY (`Mgr_ID`) REFERENCES `manager` (`Emp_ID`),
  CONSTRAINT `approves_ibfk_2` FOREIGN KEY (`Req_ID`) REFERENCES `new_connection` (`Req_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO approves VALUES('36006','14763','2023-03-06');
INSERT INTO approves VALUES('36005','14763','2023-03-06');
INSERT INTO approves VALUES('36010','14763','2023-03-06');
INSERT INTO approves VALUES('36008','14763','2023-03-06');
INSERT INTO approves VALUES('36007','14762','2023-03-07');
INSERT INTO approves VALUES('36009','14761','2023-03-07');
INSERT INTO approves VALUES('36013','14761','2023-03-08');
INSERT INTO approves VALUES('36012','14761','2023-03-11');
INSERT INTO approves VALUES('36015','14761','2023-03-11');
INSERT INTO approves VALUES('36017','14761','2023-03-11');
INSERT INTO approves VALUES('36016','14761','2023-03-11');
INSERT INTO approves VALUES('36018','14761','2023-03-12');
INSERT INTO approves VALUES('36019','14761','2023-03-13');
INSERT INTO approves VALUES('36020','14761','2023-03-13');
DROP TABLE IF EXISTS complaint;
CREATE TABLE `complaint` (
  `Comp_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Cus_ID` int(5) NOT NULL,
  `Date` date NOT NULL,
  `Description` varchar(300) NOT NULL,
  `Status` varchar(50) DEFAULT 'Pending',
  PRIMARY KEY (`Comp_ID`),
  KEY `Cus_ID` (`Cus_ID`),
  CONSTRAINT `complaint_ibfk_1` FOREIGN KEY (`Cus_ID`) REFERENCES `customer` (`Cus_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56824 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO complaint VALUES('56801','40001','2023-03-11','I have problems in my water connection. Water pressure is slow','Pending');
INSERT INTO complaint VALUES('56802','40001','2023-03-11','My connection is not working since Friday','Pending');
INSERT INTO complaint VALUES('56803','40009','2023-03-11','Some children have broken my pipes','Pending');
INSERT INTO complaint VALUES('56804','40000','2023-03-11','Water Pressure is slow','Pending');
INSERT INTO complaint VALUES('56805','40001','2023-03-11','Plumbers have forgotten to fix the pressure pipe','Pending');
INSERT INTO complaint VALUES('56806','40000','2023-03-12','I need some high pressure','Pending');
INSERT INTO complaint VALUES('56807','40000','2023-03-12','I need some high pressure(2)','Pending');
INSERT INTO complaint VALUES('56810','40011','2023-03-12','JoJOJOJOJOJOJJ','Pending');
INSERT INTO complaint VALUES('56823','40012','2023-03-13','Fittings are not that quality, could you please change them to better ones?','Pending');
DROP TABLE IF EXISTS customer;
CREATE TABLE `customer` (
  `Cus_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Req_ID` int(5) NOT NULL,
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `Phone` int(10) NOT NULL,
  `Address` varchar(100) NOT NULL,
  PRIMARY KEY (`Cus_ID`),
  KEY `Req_ID` (`Req_ID`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`Req_ID`) REFERENCES `new_connection` (`Req_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=40016 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO customer VALUES('40000','36000','Gunapala','Malalasekara','785245145','No98,Hokandara');
INSERT INTO customer VALUES('40001','36007','Kamal','Suraweera','789452784','No Address');
INSERT INTO customer VALUES('40003','36009','Malindu','Liyanage','795247856','No. 90, Mal Para, Malwaththa');
INSERT INTO customer VALUES('40004','36010','Malindu','Liyanage','795247856','No. 90, Mal Para, Malwaththa');
INSERT INTO customer VALUES('40005','36011','Madumadawa','Aravinda','2147483647','No. 89, Park Road, Lipton Roundabout');
INSERT INTO customer VALUES('40006','36012','Saman','Kumara','1178541963','No.78, School Lane, PeraWaththa');
INSERT INTO customer VALUES('40007','36013','Haritha','Fernando','78451245','No. 14, Meda Mw, Gammadda');
INSERT INTO customer VALUES('40008','36014','Sandun','Perera','1148574852','School Lane, Maho');
INSERT INTO customer VALUES('40009','36015','Gayan','Kamalasiri','784517458','No. 80/A, School Lane, Meegoda');
INSERT INTO customer VALUES('40010','36016','Gimhan','Warnasooriya','119451248','No. 765, Maho, Kurunegala');
INSERT INTO customer VALUES('40011','36017','Wasana','Madushani','114857496','No. 874/A, Dextor Ave, Narahenpita');
INSERT INTO customer VALUES('40012','36018','Madara','Kelum','117854215','No.78, Upali Mw, Panagoda');
INSERT INTO customer VALUES('40013','36019','Naveen','Rathnasekara','2147483647','No.89, Dedunu Rd, Kubuka');
INSERT INTO customer VALUES('40014','36020','Jinadasa','Samarasinghe','344355346','No address');
INSERT INTO customer VALUES('40015','36021','Sandun','Janakantha','34544356','No address');
DROP TABLE IF EXISTS employee;
CREATE TABLE `employee` (
  `Emp_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Password` varchar(10) NOT NULL,
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `DoB` date NOT NULL,
  `Sex` varchar(7) NOT NULL,
  PRIMARY KEY (`Emp_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14775 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO employee VALUES('14761','password','Kasun','Kariyawasam','No. 14, Temple Rd, Kegalle','1997-04-14','Male');
INSERT INTO employee VALUES('14762','password','Nimani','Dilsha','No. 14, Samagi Mw, Habarakada,Homagama','2000-08-06','Female');
INSERT INTO employee VALUES('14763','password','Supipi','Samarasena','No. 12/34, Homagama South, Homagama','1997-06-02','Female');
INSERT INTO employee VALUES('14764','password','Saheli','Gamage','No. 11, Church Rd, Pettah','1999-11-14','Female');
INSERT INTO employee VALUES('14765','password','Gunadasa ','Kapuge','No. 78, Pahala Diwulgaslanda, Anuradhapura','1977-02-16','Male');
INSERT INTO employee VALUES('14766','password','Sanka','Dineth','No. 7855, Govt. Houses, Rathmalana','2000-06-02','Male');
INSERT INTO employee VALUES('14767','password','Rohana','Samantha','No. 794/A, Batapola','1978-07-18','Male');
INSERT INTO employee VALUES('14768','password','Gamini','Perera','No. 147/1/A, School Lane, Mawathagama','1982-05-21','Male');
INSERT INTO employee VALUES('14769','password','Lahiru','Perera','No. 67/23, Wellawaththa, Mathara','1998-07-23','Male');
INSERT INTO employee VALUES('14770','password','Kalana','Gunasekara','Bo. 78, Main St, Habarakada','1987-05-03','Male');
INSERT INTO employee VALUES('14771','password','Hasitha','Wiljesundara','No.78/23, Godagama, Homagama','1977-03-03','Male');
INSERT INTO employee VALUES('14772','password','Mohommed','Farukh','No.112, Salmal Uyana, Padukka','1998-12-07','Male');
INSERT INTO employee VALUES('14773','password','Kumara','Dharmasena','No. 90, Meda Mawatha, Athugala','1978-09-12','Male');
INSERT INTO employee VALUES('14774','password','Dimanthi','Apsara','37/20 Dematagoda Place, 09','1997-06-17','Female');
DROP TABLE IF EXISTS establishes;
CREATE TABLE `establishes` (
  `Req_ID` int(5) NOT NULL,
  `Emp_ID` int(5) NOT NULL,
  `Date` date NOT NULL,
  KEY `Emp_ID` (`Emp_ID`),
  KEY `Req_ID` (`Req_ID`),
  CONSTRAINT `establishes_ibfk_1` FOREIGN KEY (`Emp_ID`) REFERENCES `service_personnal` (`Emp_ID`),
  CONSTRAINT `establishes_ibfk_2` FOREIGN KEY (`Req_ID`) REFERENCES `new_connection` (`Req_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO establishes VALUES('36013','14767','2023-03-11');
INSERT INTO establishes VALUES('36007','14770','2023-03-11');
INSERT INTO establishes VALUES('36015','14770','2023-03-11');
INSERT INTO establishes VALUES('36000','14771','2023-03-11');
INSERT INTO establishes VALUES('36017','14770','2023-03-11');
INSERT INTO establishes VALUES('36009','14773','2023-03-12');
INSERT INTO establishes VALUES('36010','14773','2023-03-12');
INSERT INTO establishes VALUES('36016','14773','2023-03-12');
INSERT INTO establishes VALUES('36018','14770','2023-03-12');
DROP TABLE IF EXISTS feedback;
CREATE TABLE `feedback` (
  `Feedback_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Cus_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  `Description` varchar(300) NOT NULL,
  PRIMARY KEY (`Feedback_ID`),
  KEY `Cus_ID` (`Cus_ID`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`Cus_ID`) REFERENCES `customer` (`Cus_ID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=60010 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO feedback VALUES('60000','40009','2023-03-11','Service is so good');
INSERT INTO feedback VALUES('60001','40009','2023-03-11','Loved it');
INSERT INTO feedback VALUES('60002','40009','2023-03-11','5 star rating!');
INSERT INTO feedback VALUES('60003','40009','2023-03-11','Service is so good');
INSERT INTO feedback VALUES('60005','40011','2023-03-12','This is a test22');
INSERT INTO feedback VALUES('60009','40012','2023-03-13','Very good service. Water is clear and natural. Thank you for the service!');
DROP TABLE IF EXISTS manager;
CREATE TABLE `manager` (
  `Emp_ID` int(5) NOT NULL,
  `Grade` int(1) NOT NULL,
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`Emp_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO manager VALUES('14761','2');
INSERT INTO manager VALUES('14762','1');
INSERT INTO manager VALUES('14763','3');
INSERT INTO manager VALUES('14769','1');
DROP TABLE IF EXISTS manipulates;
CREATE TABLE `manipulates` (
  `Email` varchar(50) DEFAULT NULL,
  `Emp_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  UNIQUE KEY `Emp_ID` (`Emp_ID`),
  KEY `Email` (`Email`),
  CONSTRAINT `manipulates_ibfk_1` FOREIGN KEY (`Email`) REFERENCES `sys_admin` (`Email`) ON DELETE CASCADE,
  CONSTRAINT `manipulates_ibfk_2` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`Emp_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO manipulates VALUES('hansisew@gmail.com','14761','2023-03-05');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14762','2023-03-05');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14763','2023-03-05');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14764','2023-03-05');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14765','2023-03-05');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14766','2023-03-05');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14767','2023-03-05');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14768','2023-03-05');
INSERT INTO manipulates VALUES('sithumij@gmail.com','14769','2023-03-05');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14770','2023-03-11');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14771','2023-03-11');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14772','2023-03-11');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14773','2023-03-12');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14774','2023-03-13');
DROP TABLE IF EXISTS new_connection;
CREATE TABLE `new_connection` (
  `Req_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Area` varchar(20) NOT NULL,
  `Req_Status` varchar(14) DEFAULT 'Pending',
  PRIMARY KEY (`Req_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=36022 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO new_connection VALUES('36000','2023-03-06','Colombo','Approved');
INSERT INTO new_connection VALUES('36001','2023-03-06','Galle','Approved');
INSERT INTO new_connection VALUES('36002','2023-03-06','Homagama','Approved');
INSERT INTO new_connection VALUES('36003','2023-03-06','Godagama','Rejected');
INSERT INTO new_connection VALUES('36004','2023-03-06','Katharagama','Rejected');
INSERT INTO new_connection VALUES('36005','2023-03-06','Panagoda','Approved');
INSERT INTO new_connection VALUES('36006','2023-03-06','Town','Approved');
INSERT INTO new_connection VALUES('36007','2023-03-06','Colombo','Approved');
INSERT INTO new_connection VALUES('36008','2023-03-06','Gampaha','Approved');
INSERT INTO new_connection VALUES('36009','2023-03-06','Kurunegala','Approved');
INSERT INTO new_connection VALUES('36010','2023-03-06','Kurunegala','Approved');
INSERT INTO new_connection VALUES('36011','2023-03-06','Colombo','Rejected');
INSERT INTO new_connection VALUES('36012','2023-03-06','Monaragala','Approved');
INSERT INTO new_connection VALUES('36013','2023-03-06','Mannar','Approved');
INSERT INTO new_connection VALUES('36014','2023-03-06','Kurunegala','Rejected');
INSERT INTO new_connection VALUES('36015','2023-03-11','Colombo','Approved');
INSERT INTO new_connection VALUES('36016','2023-03-11','Kurunegala','Approved');
INSERT INTO new_connection VALUES('36017','2023-03-11','Colombo','Approved');
INSERT INTO new_connection VALUES('36018','2023-03-12','Colombo','Approved');
INSERT INTO new_connection VALUES('36019','2023-03-13','Colombo','Approved');
INSERT INTO new_connection VALUES('36020','2023-03-13','Hambantota','Approved');
INSERT INTO new_connection VALUES('36021','2023-03-13','Ampara','Pending');
DROP TABLE IF EXISTS notice_board;
CREATE TABLE `notice_board` (
  `Notice_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Emp_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  `Description` varchar(300) NOT NULL,
  PRIMARY KEY (`Notice_ID`),
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `notice_board_ibfk_1` FOREIGN KEY (`Emp_ID`) REFERENCES `staff` (`Emp_ID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=16005 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO notice_board VALUES('16002','14764','2023-03-11','There will be a service interruption from 2023-03-11 to 2023-03-12');
INSERT INTO notice_board VALUES('16004','14764','2023-03-11','Yeah');
DROP TABLE IF EXISTS payment_history;
CREATE TABLE `payment_history` (
  `Month` varchar(18) NOT NULL,
  `Cus_ID` int(5) NOT NULL,
  `Paid_Date` date NOT NULL,
  `Paid_Amount` double(7,2) NOT NULL,
  PRIMARY KEY (`Month`,`Cus_ID`),
  KEY `Cus_ID` (`Cus_ID`),
  CONSTRAINT `payment_history_ibfk_1` FOREIGN KEY (`Cus_ID`) REFERENCES `customer` (`Cus_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO payment_history VALUES('2023-01','40012','2023-03-12','4500.00');
INSERT INTO payment_history VALUES('2023-02','40012','2023-03-12','4500.00');
INSERT INTO payment_history VALUES('2023-03','40012','2023-03-13','4500.00');
DROP TABLE IF EXISTS reviews;
CREATE TABLE `reviews` (
  `Feedback_ID` int(5) NOT NULL,
  `Emp_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  KEY `Feedback_ID` (`Feedback_ID`),
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`Feedback_ID`) REFERENCES `feedback` (`Feedback_ID`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`Emp_ID`) REFERENCES `staff` (`Emp_ID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO reviews VALUES('60000','14764','2023-03-11');
INSERT INTO reviews VALUES('60002','14764','2023-03-11');
INSERT INTO reviews VALUES('60005','14764','2023-03-12');
DROP TABLE IF EXISTS salary;
CREATE TABLE `salary` (
  `Payment_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Mgr_ID` int(5) NOT NULL,
  `Emp_ID` int(5) NOT NULL,
  `Date` date NOT NULL,
  `Amount_Paid` double(7,2) NOT NULL,
  PRIMARY KEY (`Payment_ID`),
  KEY `Mgr_ID` (`Mgr_ID`),
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `salary_ibfk_1` FOREIGN KEY (`Mgr_ID`) REFERENCES `manager` (`Emp_ID`),
  CONSTRAINT `salary_ibfk_2` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`Emp_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=28018 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO salary VALUES('28001','14761','14765','2023-03-08','60000.00');
INSERT INTO salary VALUES('28002','14761','14767','2023-03-08','45000.00');
INSERT INTO salary VALUES('28003','14761','14766','2023-03-08','60000.00');
INSERT INTO salary VALUES('28005','14761','14768','2023-02-08','45000.00');
INSERT INTO salary VALUES('28008','14761','14768','2023-03-09','45000.00');
INSERT INTO salary VALUES('28012','14761','14770','2023-01-11','45000.00');
INSERT INTO salary VALUES('28013','14761','14770','2023-02-11','45000.00');
INSERT INTO salary VALUES('28014','14761','14770','2023-03-11','45000.00');
INSERT INTO salary VALUES('28015','14761','14764','2023-03-12','60000.00');
INSERT INTO salary VALUES('28016','14761','14774','2023-03-13','60000.00');
INSERT INTO salary VALUES('28017','14761','14772','2023-03-13','45000.00');
DROP TABLE IF EXISTS service_personnal;
CREATE TABLE `service_personnal` (
  `Emp_ID` int(5) NOT NULL,
  `Area` varchar(20) NOT NULL,
  `Type` varchar(15) NOT NULL,
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `service_personnal_ibfk_2` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`Emp_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO service_personnal VALUES('14767','Kandy','Plumberr');
INSERT INTO service_personnal VALUES('14768','Nuwara Eliya','Driver');
INSERT INTO service_personnal VALUES('14770','Colombo','Driver');
INSERT INTO service_personnal VALUES('14771','Colombo','Plumber');
INSERT INTO service_personnal VALUES('14772','Colombo','Plumber');
INSERT INTO service_personnal VALUES('14773','Kurunegala','Plumber');
DROP TABLE IF EXISTS solves;
CREATE TABLE `solves` (
  `Comp_ID` int(5) NOT NULL,
  `Emp_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  KEY `Comp_ID` (`Comp_ID`),
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `solves_ibfk_1` FOREIGN KEY (`Comp_ID`) REFERENCES `complaint` (`Comp_ID`) ON DELETE CASCADE,
  CONSTRAINT `solves_ibfk_2` FOREIGN KEY (`Emp_ID`) REFERENCES `service_personnal` (`Emp_ID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO solves VALUES('56801','14770','2023-03-11');
INSERT INTO solves VALUES('56802','14771','2023-03-11');
INSERT INTO solves VALUES('56803','14770','2023-03-11');
INSERT INTO solves VALUES('56804','14770','2023-03-11');
INSERT INTO solves VALUES('56805','14770','2023-03-11');
INSERT INTO solves VALUES('56806','14770','2023-03-12');
INSERT INTO solves VALUES('56810','14770','2023-03-12');
DROP TABLE IF EXISTS staff;
CREATE TABLE `staff` (
  `Emp_ID` int(5) NOT NULL,
  `Area` varchar(20) NOT NULL,
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `staff_ibfk_2` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`Emp_ID`) ON DELETE CASCADE,
  CONSTRAINT `staff_ibfk_3` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`Emp_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO staff VALUES('14764','Colombo');
INSERT INTO staff VALUES('14765','Anuradhapura');
INSERT INTO staff VALUES('14766','Kalutara');
INSERT INTO staff VALUES('14774','Anuradhapura');
DROP TABLE IF EXISTS sys_admin;
CREATE TABLE `sys_admin` (
  `Email` varchar(50) NOT NULL,
  `Password` varchar(10) NOT NULL,
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `Address` varchar(100) NOT NULL,
  PRIMARY KEY (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO sys_admin VALUES('hansisew@gmail.com','abcd1234','Hansi','Weerawardana','No.457/10, Mihindu Mw, Anuradhapura');
INSERT INTO sys_admin VALUES('kamalperera@gmail.com','abcd1234','Kamal','Perera','No.10, Temple Road, Meegoda');
INSERT INTO sys_admin VALUES('razor423@gmail.com','abcd1234','Lasiru','Dodamgoda','No.847, Katayamwaththa, Udahamulla');
INSERT INTO sys_admin VALUES('samanperera@gmail.com','abcd1234','Saman','Perera','No.10, Temple Road, Meegoda');
INSERT INTO sys_admin VALUES('sithumij@gmail.com','abcd1234','Sithumi','Gunasekara','\"Sithumi\", Yaya Road, Homagama South, Homagama');
DROP TABLE IF EXISTS account;
CREATE TABLE `account` (
  `Month` varchar(18) NOT NULL,
  `Cus_ID` int(5) NOT NULL,
  `Allocated_Units` int(4) NOT NULL,
  `Used_Units` int(4) NOT NULL,
  PRIMARY KEY (`Month`,`Cus_ID`),
  KEY `Cus_ID` (`Cus_ID`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`Cus_ID`) REFERENCES `customer` (`Cus_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS approves;
CREATE TABLE `approves` (
  `Req_ID` int(5) DEFAULT NULL,
  `Mgr_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  KEY `Mgr_ID` (`Mgr_ID`),
  KEY `Req_ID` (`Req_ID`),
  CONSTRAINT `approves_ibfk_1` FOREIGN KEY (`Mgr_ID`) REFERENCES `manager` (`Emp_ID`) ON DELETE SET NULL,
  CONSTRAINT `approves_ibfk_2` FOREIGN KEY (`Req_ID`) REFERENCES `new_connection` (`Req_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS complaint;
CREATE TABLE `complaint` (
  `Comp_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Cus_ID` int(5) NOT NULL,
  `Date` date NOT NULL,
  `Description` varchar(300) NOT NULL,
  `Status` varchar(50) DEFAULT 'Pending',
  PRIMARY KEY (`Comp_ID`),
  KEY `Cus_ID` (`Cus_ID`),
  CONSTRAINT `complaint_ibfk_1` FOREIGN KEY (`Cus_ID`) REFERENCES `customer` (`Cus_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56824 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO complaint VALUES('56801','40001','2023-03-11','I have problems in my water connection. Water pressure is slow','Pending');
INSERT INTO complaint VALUES('56802','40001','2023-03-11','My connection is not working since Friday','Pending');
INSERT INTO complaint VALUES('56803','40009','2023-03-11','Some children have broken my pipes','Pending');
INSERT INTO complaint VALUES('56804','40000','2023-03-11','Water Pressure is slow','Pending');
INSERT INTO complaint VALUES('56805','40001','2023-03-11','Plumbers have forgotten to fix the pressure pipe','Pending');
INSERT INTO complaint VALUES('56806','40000','2023-03-12','I need some high pressure','Pending');
INSERT INTO complaint VALUES('56807','40000','2023-03-12','I need some high pressure(2)','Pending');
INSERT INTO complaint VALUES('56810','40011','2023-03-12','JoJOJOJOJOJOJJ','Pending');
INSERT INTO complaint VALUES('56823','40012','2023-03-13','Fittings are not that quality, could you please change them to better ones?','Pending');
DROP TABLE IF EXISTS customer;
CREATE TABLE `customer` (
  `Cus_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Req_ID` int(5) NOT NULL,
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `Phone` int(10) NOT NULL,
  `Address` varchar(100) NOT NULL,
  PRIMARY KEY (`Cus_ID`),
  KEY `Req_ID` (`Req_ID`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`Req_ID`) REFERENCES `new_connection` (`Req_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=40022 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO customer VALUES('40000','36000','Gunapala','Malalasekara','785245145','No98,Hokandara');
INSERT INTO customer VALUES('40001','36007','Kamal','Suraweera','789452784','No Address');
INSERT INTO customer VALUES('40003','36009','Malindu','Liyanage','795247856','No. 90, Mal Para, Malwaththa');
INSERT INTO customer VALUES('40004','36010','Malindu','Liyanage','795247856','No. 90, Mal Para, Malwaththa');
INSERT INTO customer VALUES('40005','36011','Madumadawa','Aravinda','2147483647','No. 89, Park Road, Lipton Roundabout');
INSERT INTO customer VALUES('40006','36012','Saman','Kumara','1178541963','No.78, School Lane, PeraWaththa');
INSERT INTO customer VALUES('40007','36013','Haritha','Fernando','78451245','No. 14, Meda Mw, Gammadda');
INSERT INTO customer VALUES('40008','36014','Sandun','Perera','1148574852','School Lane, Maho');
INSERT INTO customer VALUES('40009','36015','Gayan','Kamalasiri','784517458','No. 80/A, School Lane, Meegoda');
INSERT INTO customer VALUES('40010','36016','Gimhan','Warnasooriya','119451248','No. 765, Maho, Kurunegala');
INSERT INTO customer VALUES('40011','36017','Wasana','Madushani','114857496','No. 874/A, Dextor Ave, Narahenpita');
INSERT INTO customer VALUES('40012','36018','Madara','Kelum','117854215','No.78, Upali Mw, Panagoda');
INSERT INTO customer VALUES('40013','36019','Naveen','Rathnasekara','2147483647','No.89, Dedunu Rd, Kubuka');
INSERT INTO customer VALUES('40014','36020','Jinadasa','Samarasinghe','344355346','No address');
INSERT INTO customer VALUES('40015','36021','Sandun','Janakantha','34544356','No address');
INSERT INTO customer VALUES('40016','36022','Nirosha','Perera','112178596','No.89, Hena Rd, Kubuka');
INSERT INTO customer VALUES('40018','36024','Hasini','Kavya','112457856','No.8, Samagi Mw, Panagoda');
INSERT INTO customer VALUES('40019','36025','Sapumal','Rathnayake','112457812','No. 254, Technical Rd, Homagama');
INSERT INTO customer VALUES('40020','36026','Susantha','Herath','717895321','No.20, Manathunga Mw, Pera Uyana');
INSERT INTO customer VALUES('40021','36027','Nomin','Mindula','1125458545','Tholangamuwa Central College');
DROP TABLE IF EXISTS employee;
CREATE TABLE `employee` (
  `Emp_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Password` varchar(10) NOT NULL,
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `DoB` date NOT NULL,
  `Sex` varchar(7) NOT NULL,
  PRIMARY KEY (`Emp_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14776 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO employee VALUES('14775','password','Rasika','Gamage','No.67/2, Mal Uyana, Padukka','1989-01-09','Male');
DROP TABLE IF EXISTS establishes;
CREATE TABLE `establishes` (
  `Req_ID` int(5) NOT NULL,
  `Emp_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  KEY `Emp_ID` (`Emp_ID`),
  KEY `Req_ID` (`Req_ID`),
  CONSTRAINT `establishes_ibfk_1` FOREIGN KEY (`Emp_ID`) REFERENCES `service_personnal` (`Emp_ID`) ON DELETE SET NULL,
  CONSTRAINT `establishes_ibfk_2` FOREIGN KEY (`Req_ID`) REFERENCES `new_connection` (`Req_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS feedback;
CREATE TABLE `feedback` (
  `Feedback_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Cus_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  `Description` varchar(300) NOT NULL,
  PRIMARY KEY (`Feedback_ID`),
  KEY `Cus_ID` (`Cus_ID`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`Cus_ID`) REFERENCES `customer` (`Cus_ID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=60010 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO feedback VALUES('60000','40009','2023-03-11','Service is so good');
INSERT INTO feedback VALUES('60001','40009','2023-03-11','Loved it');
INSERT INTO feedback VALUES('60002','40009','2023-03-11','5 star rating!');
INSERT INTO feedback VALUES('60003','40009','2023-03-11','Service is so good');
INSERT INTO feedback VALUES('60005','40011','2023-03-12','This is a test22');
INSERT INTO feedback VALUES('60009','40012','2023-03-13','Very good service. Water is clear and natural. Thank you for the service!');
DROP TABLE IF EXISTS manager;
CREATE TABLE `manager` (
  `Emp_ID` int(5) NOT NULL,
  `Grade` int(1) NOT NULL,
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`Emp_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO manager VALUES('14775','1');
DROP TABLE IF EXISTS manipulates;
CREATE TABLE `manipulates` (
  `Email` varchar(50) DEFAULT NULL,
  `Emp_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  UNIQUE KEY `Emp_ID` (`Emp_ID`),
  KEY `Email` (`Email`),
  CONSTRAINT `manipulates_ibfk_1` FOREIGN KEY (`Email`) REFERENCES `sys_admin` (`Email`) ON DELETE CASCADE,
  CONSTRAINT `manipulates_ibfk_2` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`Emp_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS new_connection;
CREATE TABLE `new_connection` (
  `Req_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Area` varchar(20) NOT NULL,
  `Req_Status` varchar(14) DEFAULT 'Pending',
  PRIMARY KEY (`Req_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=36028 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO new_connection VALUES('36000','2023-03-06','Colombo','Approved');
INSERT INTO new_connection VALUES('36001','2023-03-06','Galle','Approved');
INSERT INTO new_connection VALUES('36002','2023-03-06','Homagama','Approved');
INSERT INTO new_connection VALUES('36003','2023-03-06','Godagama','Rejected');
INSERT INTO new_connection VALUES('36004','2023-03-06','Katharagama','Rejected');
INSERT INTO new_connection VALUES('36005','2023-03-06','Panagoda','Approved');
INSERT INTO new_connection VALUES('36006','2023-03-06','Town','Approved');
INSERT INTO new_connection VALUES('36007','2023-03-06','Colombo','Approved');
INSERT INTO new_connection VALUES('36008','2023-03-06','Gampaha','Approved');
INSERT INTO new_connection VALUES('36009','2023-03-06','Kurunegala','Approved');
INSERT INTO new_connection VALUES('36010','2023-03-06','Kurunegala','Approved');
INSERT INTO new_connection VALUES('36011','2023-03-06','Colombo','Rejected');
INSERT INTO new_connection VALUES('36012','2023-03-06','Monaragala','Approved');
INSERT INTO new_connection VALUES('36013','2023-03-06','Mannar','Approved');
INSERT INTO new_connection VALUES('36014','2023-03-06','Kurunegala','Rejected');
INSERT INTO new_connection VALUES('36015','2023-03-11','Colombo','Approved');
INSERT INTO new_connection VALUES('36016','2023-03-11','Kurunegala','Approved');
INSERT INTO new_connection VALUES('36017','2023-03-11','Colombo','Approved');
INSERT INTO new_connection VALUES('36018','2023-03-12','Colombo','Approved');
INSERT INTO new_connection VALUES('36019','2023-03-13','Colombo','Approved');
INSERT INTO new_connection VALUES('36020','2023-03-13','Hambantota','Approved');
INSERT INTO new_connection VALUES('36021','2023-03-13','Ampara','Pending');
INSERT INTO new_connection VALUES('36022','2023-03-14','Galle','Pending');
INSERT INTO new_connection VALUES('36023','2023-03-14','Ampara','Rejected');
INSERT INTO new_connection VALUES('36024','2023-03-14','Colombo','Pending');
INSERT INTO new_connection VALUES('36025','2023-03-14','Colombo','Pending');
INSERT INTO new_connection VALUES('36026','2023-03-15','Vavuniya','Approved');
INSERT INTO new_connection VALUES('36027','2023-04-29','Kegalle','Pending');
DROP TABLE IF EXISTS notice_board;
CREATE TABLE `notice_board` (
  `Notice_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Emp_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  `Description` varchar(300) NOT NULL,
  PRIMARY KEY (`Notice_ID`),
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `notice_board_ibfk_1` FOREIGN KEY (`Emp_ID`) REFERENCES `staff` (`Emp_ID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS payment_history;
CREATE TABLE `payment_history` (
  `Month` varchar(18) NOT NULL,
  `Cus_ID` int(5) NOT NULL,
  `Paid_Date` date NOT NULL,
  `Paid_Amount` double(7,2) NOT NULL,
  PRIMARY KEY (`Month`,`Cus_ID`),
  KEY `Cus_ID` (`Cus_ID`),
  CONSTRAINT `payment_history_ibfk_1` FOREIGN KEY (`Cus_ID`) REFERENCES `customer` (`Cus_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS reviews;
CREATE TABLE `reviews` (
  `Feedback_ID` int(5) NOT NULL,
  `Emp_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  KEY `Feedback_ID` (`Feedback_ID`),
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`Feedback_ID`) REFERENCES `feedback` (`Feedback_ID`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`Emp_ID`) REFERENCES `staff` (`Emp_ID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS salary;
CREATE TABLE `salary` (
  `Payment_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Mgr_ID` int(5) DEFAULT NULL,
  `Emp_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  `Amount_Paid` double(7,2) NOT NULL,
  PRIMARY KEY (`Payment_ID`),
  KEY `Mgr_ID` (`Mgr_ID`),
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `salary_ibfk_1` FOREIGN KEY (`Mgr_ID`) REFERENCES `manager` (`Emp_ID`) ON DELETE SET NULL,
  CONSTRAINT `salary_ibfk_2` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`Emp_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS service_personnal;
CREATE TABLE `service_personnal` (
  `Emp_ID` int(5) NOT NULL,
  `Area` varchar(20) NOT NULL,
  `Type` varchar(15) NOT NULL,
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `service_personnal_ibfk_2` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`Emp_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS solves;
CREATE TABLE `solves` (
  `Comp_ID` int(5) NOT NULL,
  `Emp_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  KEY `Comp_ID` (`Comp_ID`),
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `solves_ibfk_1` FOREIGN KEY (`Comp_ID`) REFERENCES `complaint` (`Comp_ID`) ON DELETE CASCADE,
  CONSTRAINT `solves_ibfk_2` FOREIGN KEY (`Emp_ID`) REFERENCES `service_personnal` (`Emp_ID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS staff;
CREATE TABLE `staff` (
  `Emp_ID` int(5) NOT NULL,
  `Area` varchar(20) NOT NULL,
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `staff_ibfk_2` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`Emp_ID`) ON DELETE CASCADE,
  CONSTRAINT `staff_ibfk_3` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`Emp_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS sys_admin;
CREATE TABLE `sys_admin` (
  `Email` varchar(50) NOT NULL,
  `Password` varchar(10) NOT NULL,
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `Address` varchar(100) NOT NULL,
  PRIMARY KEY (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO sys_admin VALUES('hansisew@gmail.com','abcd1234','Hansi','Weerawardana','No.457/10, Mihindu Mw, Anuradhapura');
INSERT INTO sys_admin VALUES('kamalperera@gmail.com','abcd1234','Kamal','Perera','No.10, Temple Road, Meegoda');
INSERT INTO sys_admin VALUES('razor423@gmail.com','abcd1234','Lasiru','Dodamgoda','No.847, Katayamwaththa, Udahamulla');
INSERT INTO sys_admin VALUES('samanperera@gmail.com','abcd1234','Saman','Perera','No.10, Temple Road, Meegoda');
INSERT INTO sys_admin VALUES('sithumij@gmail.com','abcd1234','Sithumi','Gunasekara','\"Sithumi\", Yaya Road, Homagama South, Homagama');
DROP TABLE IF EXISTS account;
CREATE TABLE `account` (
  `Month` varchar(18) NOT NULL,
  `Cus_ID` int(5) NOT NULL,
  `Allocated_Units` int(4) NOT NULL,
  `Used_Units` int(4) NOT NULL,
  PRIMARY KEY (`Month`,`Cus_ID`),
  KEY `Cus_ID` (`Cus_ID`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`Cus_ID`) REFERENCES `customer` (`Cus_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS approves;
CREATE TABLE `approves` (
  `Req_ID` int(5) DEFAULT NULL,
  `Mgr_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  KEY `Mgr_ID` (`Mgr_ID`),
  KEY `Req_ID` (`Req_ID`),
  CONSTRAINT `approves_ibfk_1` FOREIGN KEY (`Mgr_ID`) REFERENCES `manager` (`Emp_ID`) ON DELETE SET NULL,
  CONSTRAINT `approves_ibfk_2` FOREIGN KEY (`Req_ID`) REFERENCES `new_connection` (`Req_ID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS complaint;
CREATE TABLE `complaint` (
  `Comp_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Cus_ID` int(5) NOT NULL,
  `Date` date NOT NULL,
  `Description` varchar(300) NOT NULL,
  `Status` varchar(50) DEFAULT 'Pending',
  PRIMARY KEY (`Comp_ID`),
  KEY `Cus_ID` (`Cus_ID`),
  CONSTRAINT `complaint_ibfk_1` FOREIGN KEY (`Cus_ID`) REFERENCES `customer` (`Cus_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56824 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS customer;
CREATE TABLE `customer` (
  `Cus_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Req_ID` int(5) NOT NULL,
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `Phone` int(10) NOT NULL,
  `Address` varchar(100) NOT NULL,
  PRIMARY KEY (`Cus_ID`),
  KEY `Req_ID` (`Req_ID`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`Req_ID`) REFERENCES `new_connection` (`Req_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS employee;
CREATE TABLE `employee` (
  `Emp_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Password` varchar(10) NOT NULL,
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `DoB` date NOT NULL,
  `Sex` varchar(7) NOT NULL,
  PRIMARY KEY (`Emp_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14778 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS establishes;
CREATE TABLE `establishes` (
  `Req_ID` int(5) NOT NULL,
  `Emp_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  KEY `Emp_ID` (`Emp_ID`),
  KEY `Req_ID` (`Req_ID`),
  CONSTRAINT `establishes_ibfk_1` FOREIGN KEY (`Emp_ID`) REFERENCES `service_personnal` (`Emp_ID`) ON DELETE SET NULL,
  CONSTRAINT `establishes_ibfk_2` FOREIGN KEY (`Req_ID`) REFERENCES `new_connection` (`Req_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS feedback;
CREATE TABLE `feedback` (
  `Feedback_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Cus_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  `Description` varchar(300) NOT NULL,
  PRIMARY KEY (`Feedback_ID`),
  KEY `Cus_ID` (`Cus_ID`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`Cus_ID`) REFERENCES `customer` (`Cus_ID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=60010 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS manager;
CREATE TABLE `manager` (
  `Emp_ID` int(5) NOT NULL,
  `Grade` int(1) NOT NULL,
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`Emp_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS manipulates;
CREATE TABLE `manipulates` (
  `Email` varchar(50) DEFAULT NULL,
  `Emp_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  UNIQUE KEY `Emp_ID` (`Emp_ID`),
  KEY `Email` (`Email`),
  CONSTRAINT `manipulates_ibfk_1` FOREIGN KEY (`Email`) REFERENCES `sys_admin` (`Email`) ON DELETE CASCADE,
  CONSTRAINT `manipulates_ibfk_2` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`Emp_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS new_connection;
CREATE TABLE `new_connection` (
  `Req_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Area` varchar(20) NOT NULL,
  `Req_Status` varchar(14) DEFAULT 'Pending',
  PRIMARY KEY (`Req_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=36028 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS notice_board;
CREATE TABLE `notice_board` (
  `Notice_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Emp_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  `Description` varchar(300) NOT NULL,
  PRIMARY KEY (`Notice_ID`),
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `notice_board_ibfk_1` FOREIGN KEY (`Emp_ID`) REFERENCES `staff` (`Emp_ID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS payment_history;
CREATE TABLE `payment_history` (
  `Month` varchar(18) NOT NULL,
  `Cus_ID` int(5) NOT NULL,
  `Paid_Date` date NOT NULL,
  `Paid_Amount` double(7,2) NOT NULL,
  PRIMARY KEY (`Month`,`Cus_ID`),
  KEY `Cus_ID` (`Cus_ID`),
  CONSTRAINT `payment_history_ibfk_1` FOREIGN KEY (`Cus_ID`) REFERENCES `customer` (`Cus_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS reviews;
CREATE TABLE `reviews` (
  `Feedback_ID` int(5) NOT NULL,
  `Emp_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  KEY `Feedback_ID` (`Feedback_ID`),
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`Feedback_ID`) REFERENCES `feedback` (`Feedback_ID`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`Emp_ID`) REFERENCES `staff` (`Emp_ID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS salary;
CREATE TABLE `salary` (
  `Payment_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Mgr_ID` int(5) DEFAULT NULL,
  `Emp_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  `Amount_Paid` double(7,2) NOT NULL,
  PRIMARY KEY (`Payment_ID`),
  KEY `Mgr_ID` (`Mgr_ID`),
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `salary_ibfk_1` FOREIGN KEY (`Mgr_ID`) REFERENCES `manager` (`Emp_ID`) ON DELETE SET NULL,
  CONSTRAINT `salary_ibfk_2` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`Emp_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS service_personnal;
CREATE TABLE `service_personnal` (
  `Emp_ID` int(5) NOT NULL,
  `Area` varchar(20) NOT NULL,
  `Type` varchar(15) NOT NULL,
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `service_personnal_ibfk_2` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`Emp_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS solves;
CREATE TABLE `solves` (
  `Comp_ID` int(5) NOT NULL,
  `Emp_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  KEY `Comp_ID` (`Comp_ID`),
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `solves_ibfk_1` FOREIGN KEY (`Comp_ID`) REFERENCES `complaint` (`Comp_ID`) ON DELETE CASCADE,
  CONSTRAINT `solves_ibfk_2` FOREIGN KEY (`Emp_ID`) REFERENCES `service_personnal` (`Emp_ID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS staff;
CREATE TABLE `staff` (
  `Emp_ID` int(5) NOT NULL,
  `Area` varchar(20) NOT NULL,
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`Emp_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS sys_admin;
CREATE TABLE `sys_admin` (
  `Email` varchar(50) NOT NULL,
  `Password` varchar(10) NOT NULL,
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `Address` varchar(100) NOT NULL,
  PRIMARY KEY (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO sys_admin VALUES('hansisew@gmail.com','abcd1234','Hansi','Weerawardana','No.457/10, Mihindu Mw, Anuradhapura');
INSERT INTO sys_admin VALUES('kamalperera@gmail.com','abcd1234','Kamal','Perera','No.10, Temple Road, Meegoda');
INSERT INTO sys_admin VALUES('samanperera@gmail.com','abcd1234','Saman','Perera','No.10, Temple Road, Meegoda');
INSERT INTO sys_admin VALUES('sithumij@gmail.com','abcd1234','Sithumi','Gunasekara','\"Sithumi\", Yaya Road, Homagama South, Homagama');
DROP TABLE IF EXISTS account;
CREATE TABLE `account` (
  `Month` varchar(18) NOT NULL,
  `Cus_ID` int(5) NOT NULL,
  `Allocated_Units` int(4) NOT NULL,
  `Used_Units` int(4) NOT NULL,
  PRIMARY KEY (`Month`,`Cus_ID`),
  KEY `Cus_ID` (`Cus_ID`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`Cus_ID`) REFERENCES `customer` (`Cus_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO account VALUES('2023-04','40000','0','0');
INSERT INTO account VALUES('2023-04','40001','0','0');
INSERT INTO account VALUES('2023-04','40002','0','0');
INSERT INTO account VALUES('2023-04','40003','0','0');
INSERT INTO account VALUES('2023-04','40004','0','0');
INSERT INTO account VALUES('2023-04','40005','0','0');
INSERT INTO account VALUES('2023-04','40006','0','0');
DROP TABLE IF EXISTS approves;
CREATE TABLE `approves` (
  `Req_ID` int(5) DEFAULT NULL,
  `Mgr_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  KEY `Mgr_ID` (`Mgr_ID`),
  KEY `Req_ID` (`Req_ID`),
  CONSTRAINT `approves_ibfk_1` FOREIGN KEY (`Mgr_ID`) REFERENCES `manager` (`Emp_ID`) ON DELETE SET NULL,
  CONSTRAINT `approves_ibfk_2` FOREIGN KEY (`Req_ID`) REFERENCES `new_connection` (`Req_ID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS complaint;
CREATE TABLE `complaint` (
  `Comp_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Cus_ID` int(5) NOT NULL,
  `Date` date NOT NULL,
  `Description` varchar(300) NOT NULL,
  `Status` varchar(50) DEFAULT 'Pending',
  PRIMARY KEY (`Comp_ID`),
  KEY `Cus_ID` (`Cus_ID`),
  CONSTRAINT `complaint_ibfk_1` FOREIGN KEY (`Cus_ID`) REFERENCES `customer` (`Cus_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56824 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS customer;
CREATE TABLE `customer` (
  `Cus_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Req_ID` int(5) NOT NULL,
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `Phone` int(10) NOT NULL,
  `Address` varchar(100) NOT NULL,
  PRIMARY KEY (`Cus_ID`),
  KEY `Req_ID` (`Req_ID`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`Req_ID`) REFERENCES `new_connection` (`Req_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40007 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO customer VALUES('40000','36028','Kasun','Rukshan','717852142','No.42, Kusum Mw, Panagoda');
INSERT INTO customer VALUES('40001','36029','Meena','Kariyawasam','112854525','No. 254, Technical Rd, Homagama');
INSERT INTO customer VALUES('40002','36030','Jayantha','Mallawa','778596123','No. 874/B, Dextor Ave, Narahenpita');
INSERT INTO customer VALUES('40003','36031','Malik','Samarathunga','112748591','Namal Uyana, Kaduwela');
INSERT INTO customer VALUES('40004','36032','Ransith','Suranga','758545123','No. 89, Boralugoda Mw, Hettigoda');
INSERT INTO customer VALUES('40005','36033','Gayani','Govinna','705241785','78, Govinna Rd, Athurugiriya');
INSERT INTO customer VALUES('40006','36034','Kalum','Perera','784512751','No.46/B, Pahala Galgoda, Nittambuwa');
DROP TABLE IF EXISTS employee;
CREATE TABLE `employee` (
  `Emp_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Password` varchar(10) NOT NULL,
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `DoB` date NOT NULL,
  `Sex` varchar(7) NOT NULL,
  PRIMARY KEY (`Emp_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14839 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO employee VALUES('14778','password','Tharaka','Jayasinghe','25, Ananda Mawatha, Kandy','1975-05-14','Male');
INSERT INTO employee VALUES('14779','password','Isuru','Sampath','16, Havelock Road, Colombo','1978-07-22','Male');
INSERT INTO employee VALUES('14780','password','Malsha','Weerasinghe','3, Mahamevnawa Mawatha, Homagama','1987-10-07','Female');
INSERT INTO employee VALUES('14781','password','Madara','Srimal','52, Temple Road, Kalutara','1990-01-18','Male');
INSERT INTO employee VALUES('14782','password','Rohitha','Dissanayake','27, Hospital Road, Horowpathana','1987-12-02','Male');
INSERT INTO employee VALUES('14783','password','Darsha','Wimalasena','36, Station Road, Kelaniya','1995-06-09','Female');
INSERT INTO employee VALUES('14784','password','Mohammed','Shiraz','77, Hill Street, Dehiwala-Mount Lavinia','1998-03-17','Male');
INSERT INTO employee VALUES('14785','password','Nimal','Amarasena','40, Galle Face Terrace, Colombo','1972-09-25','Male');
INSERT INTO employee VALUES('14786','password','Amaa','Ketagoda','6, Hospital Road, Kalutara','1995-06-17','Female');
INSERT INTO employee VALUES('14787','password','Sandaruwan','Silva','72/A, Station Road, Homagama','1998-07-19','Male');
INSERT INTO employee VALUES('14788','password','Madhavi','Ganegoda','61, Temple Road, Panadura','2000-08-17','Female');
INSERT INTO employee VALUES('14789','password','Sivakumaran','Ramanadan','B9,Kantalai,Jaffna','1991-08-01','Male');
INSERT INTO employee VALUES('14790','password','Thushara','Perera','10/A, Nelum Pedesa, Ampara','1998-05-15','Male');
INSERT INTO employee VALUES('14791','password','Kasun','Sandakelum','No.15, School Rd, Wewpokuna, Ampara','1999-08-07','Male');
INSERT INTO employee VALUES('14792','password','Diluka','Sanjeewa','45A, Ihala Hanwella, Hanwella','1995-07-14','Male');
INSERT INTO employee VALUES('14793','password','Pubudu','Geethika','56/C, Mal Para, Kahatagasdigiliya','1995-08-14','Male');
INSERT INTO employee VALUES('14794','password','Sineth','Malaka','No. 874/A, Dextor Ave, Narahenpita','1995-07-23','Male');
INSERT INTO employee VALUES('14795','password','Sachin','Weerasooriya','87, Ukuwela, Mathale','1998-03-07','Male');
INSERT INTO employee VALUES('14796','password','Chamath','Hasaranga','No.89, Obesekarapura, Rajagiriya','1998-01-01','Male');
INSERT INTO employee VALUES('14797','password','Ishara','Deshan','7, Raigama, Bandaragama','1994-06-13','Male');
INSERT INTO employee VALUES('14798','password','Sudheera','Fonseka','T.R. de Silva Ave, Wilegoda','1998-07-28','Male');
INSERT INTO employee VALUES('14799','password','Mindula','Ekanayake','34, Manamgoda, Ukuwela','1996-07-03','Male');
INSERT INTO employee VALUES('14800','password','Niluka','Pabasara','465/A, Galborella, Kelaniya','1995-07-09','Male');
INSERT INTO employee VALUES('14801','password','Chathura','Kavishka','A46, Imbulana, Ruwanwella','1998-07-03','Male');
INSERT INTO employee VALUES('14802','password','Janaka','Atapattu','756, Thalwila, Marawila','1995-07-25','Male');
INSERT INTO employee VALUES('14803','password','Sudesh','Gamage','475, Mal Para, Piliyandala','1993-07-08','Male');
INSERT INTO employee VALUES('14804','password','Mahesh','Nishshanka','47, Hosptal Rd, Dankotuwa','1995-08-05','Male');
INSERT INTO employee VALUES('14805','password','Praneeth','Amarasinghe','3/A, Bogahawatta, Haliela','1998-07-12','Male');
INSERT INTO employee VALUES('14806','password','Tivon','Jesudas','475, Nallur, Jaffna','1996-05-08','Male');
INSERT INTO employee VALUES('14807','password','Harendran','Nishagar','757. Sunnaham South, Jaffna','1995-12-08','Male');
INSERT INTO employee VALUES('14808','password','Gamini','Uyanwatte','485, Meegahakiwula, Badulla','1978-06-15','Male');
INSERT INTO employee VALUES('14809','password','Nimali','Liyanage','676, Galle Rd, Waskaduwa','1980-02-27','Female');
INSERT INTO employee VALUES('14810','password','Imalka','Senewirathna','385, Godahena, Dolapihilla','1985-09-25','Female');
INSERT INTO employee VALUES('14811','password','Prabhashi','Weerawardane','No.78, Upali Mw, Panagoda','1992-08-09','Female');
INSERT INTO employee VALUES('14812','password','Sakuni','Suraweera','No. 57, Maligawa Rd, Kandy','1995-03-14','Female');
INSERT INTO employee VALUES('14813','password','Upeksha','Darshani','School Rd, Atalugama, Bandaragama','1999-06-20','Female');
INSERT INTO employee VALUES('14814','password','Anne','Fathima','68, Kandy Rd, Narammala','1997-03-16','Female');
INSERT INTO employee VALUES('14815','password','Yoshitha','Rajapaksha','89, Ballapana, Galigamuwa','1996-03-11','Male');
INSERT INTO employee VALUES('14816','password','Azra','Mohammed','34, Kovil Rd, Mannar','1999-01-16','Female');
INSERT INTO employee VALUES('14817','password','Ridmika','Kotuwegoda','65, Jamburegoda, Weligama','1993-06-17','Male');
INSERT INTO employee VALUES('14818','password','Udara','Wijesooriya','44, Fort Rd, Galle','1996-09-09','Male');
INSERT INTO employee VALUES('14819','password','Neelaka','Kasun','No. 47, E.R De Mel Rd, Kalutara','1997-05-08','Male');
INSERT INTO employee VALUES('14820','password','Suranga','Lakmal','No.89, Dedunu Rd, Kubuka','1997-11-15','Male');
INSERT INTO employee VALUES('14821','password','Frank','Perera','No. 46, Malwana Road, Katugasthota','1997-06-17','Male');
INSERT INTO employee VALUES('14822','password','Dasun','Wanigasekara','No. 67, Agalawaththa','1999-03-17','Male');
INSERT INTO employee VALUES('14823','password','Kavindu','Randima','47, Mahawihara Rd, Ahangama','1999-07-09','Male');
INSERT INTO employee VALUES('14824','password','Lasith','Deeshaka','645, Keselwatta, Panadura','1997-03-14','Male');
INSERT INTO employee VALUES('14825','password','Thilina','Sandaruwan','34, Ukuwela, Mathale','1998-06-14','Male');
INSERT INTO employee VALUES('14826','password','Ravindu','Induwara','74, Kobeigane, Kurunegala','1996-04-14','Male');
INSERT INTO employee VALUES('14827','password','Surendra','Weerawansha','No36, Govinda Ave, Kurunegala','1997-06-04','Male');
INSERT INTO employee VALUES('14828','password','Chanuka','Sumathipala','23/A, Kandy Rd, Gampola','1999-02-04','Male');
INSERT INTO employee VALUES('14829','password','David','Prabakaran','No. 56, Kovil Rd, Mannar','1996-05-01','Male');
INSERT INTO employee VALUES('14830','password','Jeygan','Manoharan','No. 67, Balalla','1999-04-07','Male');
INSERT INTO employee VALUES('14831','password','Dinuka','Pushpakumara','No. 57, Kimbulgoda, Yakkala','1998-02-04','Male');
INSERT INTO employee VALUES('14832','password','Ishara','Hansika','Paragala, Matara','1995-05-04','Male');
INSERT INTO employee VALUES('14833','password','Hiruna','Sanjeewa','Roman Mawatha, Pittugala, Malabe','1999-05-04','Male');
INSERT INTO employee VALUES('14834','password','Neelaka','Liyanage','Jayanthigama, Kanthale','1997-02-04','Male');
INSERT INTO employee VALUES('14835','password','Sumali','Silva','No. 78, Galpatha Road, Kelaniya','1987-05-17','Female');
INSERT INTO employee VALUES('14836','password','Dimantha','Sapumal','No. 89, Sir Edward Perera Mw, Ja Ela','1987-03-14','Male');
INSERT INTO employee VALUES('14837','password','Supun','Hettiarachchi','Namal Rd, Homagama','1972-05-12','Male');
INSERT INTO employee VALUES('14838','password','Chalani','Walgama','No. 78, Negombo Road, Wattala','1997-07-18','Female');
DROP TABLE IF EXISTS establishes;
CREATE TABLE `establishes` (
  `Req_ID` int(5) NOT NULL,
  `Emp_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  KEY `Emp_ID` (`Emp_ID`),
  KEY `Req_ID` (`Req_ID`),
  CONSTRAINT `establishes_ibfk_1` FOREIGN KEY (`Emp_ID`) REFERENCES `service_personnal` (`Emp_ID`) ON DELETE SET NULL,
  CONSTRAINT `establishes_ibfk_2` FOREIGN KEY (`Req_ID`) REFERENCES `new_connection` (`Req_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS feedback;
CREATE TABLE `feedback` (
  `Feedback_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Cus_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  `Description` varchar(300) NOT NULL,
  PRIMARY KEY (`Feedback_ID`),
  KEY `Cus_ID` (`Cus_ID`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`Cus_ID`) REFERENCES `customer` (`Cus_ID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=60010 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS manager;
CREATE TABLE `manager` (
  `Emp_ID` int(5) NOT NULL,
  `Grade` int(1) NOT NULL,
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`Emp_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO manager VALUES('14778','1');
INSERT INTO manager VALUES('14779','2');
INSERT INTO manager VALUES('14780','3');
INSERT INTO manager VALUES('14808','1');
INSERT INTO manager VALUES('14809','2');
INSERT INTO manager VALUES('14810','3');
INSERT INTO manager VALUES('14835','1');
INSERT INTO manager VALUES('14836','2');
INSERT INTO manager VALUES('14837','3');
DROP TABLE IF EXISTS manipulates;
CREATE TABLE `manipulates` (
  `Email` varchar(50) DEFAULT NULL,
  `Emp_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  UNIQUE KEY `Emp_ID` (`Emp_ID`),
  KEY `Email` (`Email`),
  CONSTRAINT `manipulates_ibfk_1` FOREIGN KEY (`Email`) REFERENCES `sys_admin` (`Email`) ON DELETE CASCADE,
  CONSTRAINT `manipulates_ibfk_2` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`Emp_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO manipulates VALUES('hansisew@gmail.com','14778','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14779','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14780','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14781','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14782','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14783','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14784','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14785','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14786','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14787','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14788','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14789','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14790','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14791','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14792','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14793','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14794','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14795','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14796','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14797','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14798','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14799','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14800','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14801','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14802','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14803','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14804','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14805','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14806','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14807','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14808','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14809','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14810','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14811','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14812','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14813','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14814','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14815','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14816','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14817','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14818','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14819','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14820','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14821','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14822','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14823','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14824','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14825','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14826','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14827','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14828','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14829','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14830','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14831','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14832','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14833','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14834','2023-04-30');
INSERT INTO manipulates VALUES('samanperera@gmail.com','14835','2023-04-30');
INSERT INTO manipulates VALUES('samanperera@gmail.com','14836','2023-04-30');
INSERT INTO manipulates VALUES('samanperera@gmail.com','14837','2023-04-30');
INSERT INTO manipulates VALUES('samanperera@gmail.com','14838','2023-04-30');
DROP TABLE IF EXISTS new_connection;
CREATE TABLE `new_connection` (
  `Req_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Area` varchar(20) NOT NULL,
  `Req_Status` varchar(14) DEFAULT 'Pending',
  PRIMARY KEY (`Req_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=36035 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO new_connection VALUES('36028','2023-04-30','Colombo','Pending');
INSERT INTO new_connection VALUES('36029','2023-04-30','Colombo','Pending');
INSERT INTO new_connection VALUES('36030','2023-04-30','Colombo','Pending');
INSERT INTO new_connection VALUES('36031','2023-04-30','Colombo','Pending');
INSERT INTO new_connection VALUES('36032','2023-04-30','Colombo','Pending');
INSERT INTO new_connection VALUES('36033','2023-04-30','Colombo','Pending');
INSERT INTO new_connection VALUES('36034','2023-04-30','Gampaha','Pending');
DROP TABLE IF EXISTS notice_board;
CREATE TABLE `notice_board` (
  `Notice_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Emp_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  `Description` varchar(300) NOT NULL,
  PRIMARY KEY (`Notice_ID`),
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `notice_board_ibfk_1` FOREIGN KEY (`Emp_ID`) REFERENCES `staff` (`Emp_ID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS payment_history;
CREATE TABLE `payment_history` (
  `Month` varchar(18) NOT NULL,
  `Cus_ID` int(5) NOT NULL,
  `Paid_Date` date NOT NULL,
  `Paid_Amount` double(7,2) NOT NULL,
  PRIMARY KEY (`Month`,`Cus_ID`),
  KEY `Cus_ID` (`Cus_ID`),
  CONSTRAINT `payment_history_ibfk_1` FOREIGN KEY (`Cus_ID`) REFERENCES `customer` (`Cus_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS reviews;
CREATE TABLE `reviews` (
  `Feedback_ID` int(5) NOT NULL,
  `Emp_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  KEY `Feedback_ID` (`Feedback_ID`),
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`Feedback_ID`) REFERENCES `feedback` (`Feedback_ID`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`Emp_ID`) REFERENCES `staff` (`Emp_ID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS salary;
CREATE TABLE `salary` (
  `Payment_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Mgr_ID` int(5) DEFAULT NULL,
  `Emp_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  `Amount_Paid` double(7,2) NOT NULL,
  PRIMARY KEY (`Payment_ID`),
  KEY `Mgr_ID` (`Mgr_ID`),
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `salary_ibfk_1` FOREIGN KEY (`Mgr_ID`) REFERENCES `manager` (`Emp_ID`) ON DELETE SET NULL,
  CONSTRAINT `salary_ibfk_2` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`Emp_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS service_personnal;
CREATE TABLE `service_personnal` (
  `Emp_ID` int(5) NOT NULL,
  `Area` varchar(20) NOT NULL,
  `Type` varchar(15) NOT NULL,
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `service_personnal_ibfk_2` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`Emp_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO service_personnal VALUES('14790','Ampara','Plumber');
INSERT INTO service_personnal VALUES('14791','Ampara','Driver');
INSERT INTO service_personnal VALUES('14792','Anuradhapura','Plumber');
INSERT INTO service_personnal VALUES('14793','Anuradhapura','Driver');
INSERT INTO service_personnal VALUES('14794','Badulla','Plumber');
INSERT INTO service_personnal VALUES('14795','Badulla','Driver');
INSERT INTO service_personnal VALUES('14796','Batticaloa','Plumber');
INSERT INTO service_personnal VALUES('14797','Batticaloa','Driver');
INSERT INTO service_personnal VALUES('14798','Colombo','Plumber');
INSERT INTO service_personnal VALUES('14799','Colombo','Driver');
INSERT INTO service_personnal VALUES('14800','Galle','Plumber');
INSERT INTO service_personnal VALUES('14801','Galle','Driver');
INSERT INTO service_personnal VALUES('14802','Gampaha','Plumber');
INSERT INTO service_personnal VALUES('14803','Gampaha','Driver');
INSERT INTO service_personnal VALUES('14804','Hambantota','Plumber');
INSERT INTO service_personnal VALUES('14805','Hambantota','Driver');
INSERT INTO service_personnal VALUES('14806','Jaffna','Plumber');
INSERT INTO service_personnal VALUES('14807','Jaffna','Driver');
INSERT INTO service_personnal VALUES('14819','Kalutara','Plumber');
INSERT INTO service_personnal VALUES('14820','Kalutara','Driver');
INSERT INTO service_personnal VALUES('14821','Kandy','Plumber');
INSERT INTO service_personnal VALUES('14822','Kandy','Driver');
INSERT INTO service_personnal VALUES('14823','Kegalle','Plumber');
INSERT INTO service_personnal VALUES('14824','Kegalle','Driver');
INSERT INTO service_personnal VALUES('14825','Kilinochchi','Plumber');
INSERT INTO service_personnal VALUES('14826','Kilinochchi','Driver');
INSERT INTO service_personnal VALUES('14827','Kurunegala','Plumber');
INSERT INTO service_personnal VALUES('14828','Kurunegala','Driver');
INSERT INTO service_personnal VALUES('14829','Mannar','Plumber');
INSERT INTO service_personnal VALUES('14830','Mannar','Driver');
INSERT INTO service_personnal VALUES('14831','Matale','Plumber');
INSERT INTO service_personnal VALUES('14832','Matale','Driver');
INSERT INTO service_personnal VALUES('14833','Matara','Plumber');
INSERT INTO service_personnal VALUES('14834','Matara','Driver');
DROP TABLE IF EXISTS solves;
CREATE TABLE `solves` (
  `Comp_ID` int(5) NOT NULL,
  `Emp_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  KEY `Comp_ID` (`Comp_ID`),
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `solves_ibfk_1` FOREIGN KEY (`Comp_ID`) REFERENCES `complaint` (`Comp_ID`) ON DELETE CASCADE,
  CONSTRAINT `solves_ibfk_2` FOREIGN KEY (`Emp_ID`) REFERENCES `service_personnal` (`Emp_ID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS staff;
CREATE TABLE `staff` (
  `Emp_ID` int(5) NOT NULL,
  `Area` varchar(20) NOT NULL,
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`Emp_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO staff VALUES('14781','Ampara');
INSERT INTO staff VALUES('14782','Anuradhapura');
INSERT INTO staff VALUES('14783','Badulla');
INSERT INTO staff VALUES('14784','Batticaloa');
INSERT INTO staff VALUES('14785','Colombo');
INSERT INTO staff VALUES('14786','Galle');
INSERT INTO staff VALUES('14787','Gampaha');
INSERT INTO staff VALUES('14788','Hambantota');
INSERT INTO staff VALUES('14789','Jaffna');
INSERT INTO staff VALUES('14811','Kalutara');
INSERT INTO staff VALUES('14812','Kandy');
INSERT INTO staff VALUES('14813','Kegalle');
INSERT INTO staff VALUES('14814','Kilinochchi');
INSERT INTO staff VALUES('14815','Kurunegala');
INSERT INTO staff VALUES('14816','Mannar');
INSERT INTO staff VALUES('14817','Matale');
INSERT INTO staff VALUES('14818','Matara');
INSERT INTO staff VALUES('14838','Monaragala');
DROP TABLE IF EXISTS sys_admin;
CREATE TABLE `sys_admin` (
  `Email` varchar(50) NOT NULL,
  `Password` varchar(10) NOT NULL,
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `Address` varchar(100) NOT NULL,
  PRIMARY KEY (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO sys_admin VALUES('hansisew@gmail.com','abcd1234','Hansi','Weerawardana','No.457/10, Mihindu Mw, Anuradhapura');
INSERT INTO sys_admin VALUES('kamalperera@gmail.com','abcd1234','Kamal','Perera','No.10, Temple Road, Meegoda');
INSERT INTO sys_admin VALUES('samanperera@gmail.com','abcd1234','Saman','Perera','No.10, Temple Road, Meegoda');
INSERT INTO sys_admin VALUES('sithumij@gmail.com','abcd1234','Sithumi','Gunasekara','\"Sithumi\", Yaya Road, Homagama South, Homagama');
DROP TABLE IF EXISTS account;
CREATE TABLE `account` (
  `Month` varchar(18) NOT NULL,
  `Cus_ID` int(5) NOT NULL,
  `Allocated_Units` int(4) NOT NULL,
  `Used_Units` int(4) NOT NULL,
  PRIMARY KEY (`Month`,`Cus_ID`),
  KEY `Cus_ID` (`Cus_ID`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`Cus_ID`) REFERENCES `customer` (`Cus_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO account VALUES('2023-04','40000','0','0');
INSERT INTO account VALUES('2023-04','40001','0','0');
INSERT INTO account VALUES('2023-04','40002','100','22');
INSERT INTO account VALUES('2023-04','40003','0','0');
INSERT INTO account VALUES('2023-04','40004','0','0');
INSERT INTO account VALUES('2023-04','40005','0','0');
INSERT INTO account VALUES('2023-04','40006','100','38');
DROP TABLE IF EXISTS approves;
CREATE TABLE `approves` (
  `Req_ID` int(5) DEFAULT NULL,
  `Mgr_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  KEY `Mgr_ID` (`Mgr_ID`),
  KEY `Req_ID` (`Req_ID`),
  CONSTRAINT `approves_ibfk_1` FOREIGN KEY (`Mgr_ID`) REFERENCES `manager` (`Emp_ID`) ON DELETE SET NULL,
  CONSTRAINT `approves_ibfk_2` FOREIGN KEY (`Req_ID`) REFERENCES `new_connection` (`Req_ID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO approves VALUES('36034','14778','2023-04-30');
INSERT INTO approves VALUES('36030','14778','2023-04-30');
DROP TABLE IF EXISTS complaint;
CREATE TABLE `complaint` (
  `Comp_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Cus_ID` int(5) NOT NULL,
  `Date` date NOT NULL,
  `Description` varchar(300) NOT NULL,
  `Status` varchar(50) DEFAULT 'Pending',
  PRIMARY KEY (`Comp_ID`),
  KEY `Cus_ID` (`Cus_ID`),
  CONSTRAINT `complaint_ibfk_1` FOREIGN KEY (`Cus_ID`) REFERENCES `customer` (`Cus_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56826 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO complaint VALUES('56824','40006','2023-04-30','Low water pressure','Pending');
INSERT INTO complaint VALUES('56825','40002','2023-04-30','Low water pressure','Pending');
DROP TABLE IF EXISTS customer;
CREATE TABLE `customer` (
  `Cus_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Req_ID` int(5) NOT NULL,
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `Phone` int(10) NOT NULL,
  `Address` varchar(100) NOT NULL,
  PRIMARY KEY (`Cus_ID`),
  KEY `Req_ID` (`Req_ID`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`Req_ID`) REFERENCES `new_connection` (`Req_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40007 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO customer VALUES('40000','36028','Kasun','Rukshan','717852142','No.42, Kusum Mw, Panagoda');
INSERT INTO customer VALUES('40001','36029','Meena','Kariyawasam','112854525','No. 254, Technical Rd, Homagama');
INSERT INTO customer VALUES('40002','36030','Jayantha','Mallawa','778596123','No. 874/B, Dextor Ave, Narahenpita');
INSERT INTO customer VALUES('40003','36031','Malik','Samarathunga','112748591','Namal Uyana, Kaduwela');
INSERT INTO customer VALUES('40004','36032','Ransith','Suranga','758545123','No. 89, Boralugoda Mw, Hettigoda');
INSERT INTO customer VALUES('40005','36033','Gayani','Govinna','705241785','78, Govinna Rd, Athurugiriya');
INSERT INTO customer VALUES('40006','36034','Kalum','Perera','784512751','No.46/B, Pahala Galgoda, Nittambuwa');
DROP TABLE IF EXISTS employee;
CREATE TABLE `employee` (
  `Emp_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Password` varchar(10) NOT NULL,
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `DoB` date NOT NULL,
  `Sex` varchar(7) NOT NULL,
  PRIMARY KEY (`Emp_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14839 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO employee VALUES('14778','password','Tharaka','Jayasinghe','25, Ananda Mawatha, Kandy','1975-05-14','Male');
INSERT INTO employee VALUES('14779','password','Isuru','Sampath','16, Havelock Road, Colombo','1978-07-22','Male');
INSERT INTO employee VALUES('14780','password','Malsha','Weerasinghe','3, Mahamevnawa Mawatha, Homagama','1987-10-07','Female');
INSERT INTO employee VALUES('14781','password','Madara','Srimal','52, Temple Road, Kalutara','1990-01-18','Male');
INSERT INTO employee VALUES('14782','password','Rohitha','Dissanayake','27, Hospital Road, Horowpathana','1987-12-02','Male');
INSERT INTO employee VALUES('14783','password','Darsha','Wimalasena','36, Station Road, Kelaniya','1995-06-09','Female');
INSERT INTO employee VALUES('14784','password','Mohammed','Shiraz','77, Hill Street, Dehiwala-Mount Lavinia','1998-03-17','Male');
INSERT INTO employee VALUES('14785','password','Nimal','Amarasena','40, Galle Face Terrace, Colombo','1972-09-25','Male');
INSERT INTO employee VALUES('14786','password','Amaa','Ketagoda','6, Hospital Road, Kalutara','1995-06-17','Female');
INSERT INTO employee VALUES('14787','password','Sandaruwan','Silva','72/A, Station Road, Homagama','1998-07-19','Male');
INSERT INTO employee VALUES('14788','password','Madhavi','Ganegoda','61, Temple Road, Panadura','2000-08-17','Female');
INSERT INTO employee VALUES('14789','password','Sivakumaran','Ramanadan','B9,Kantalai,Jaffna','1991-08-01','Male');
INSERT INTO employee VALUES('14790','password','Thushara','Perera','10/A, Nelum Pedesa, Ampara','1998-05-15','Male');
INSERT INTO employee VALUES('14791','password','Kasun','Sandakelum','No.15, School Rd, Wewpokuna, Ampara','1999-08-07','Male');
INSERT INTO employee VALUES('14792','password','Diluka','Sanjeewa','45A, Ihala Hanwella, Hanwella','1995-07-14','Male');
INSERT INTO employee VALUES('14793','password','Pubudu','Geethika','56/C, Mal Para, Kahatagasdigiliya','1995-08-14','Male');
INSERT INTO employee VALUES('14794','password','Sineth','Malaka','No. 874/A, Dextor Ave, Narahenpita','1995-07-23','Male');
INSERT INTO employee VALUES('14795','password','Sachin','Weerasooriya','87, Ukuwela, Mathale','1998-03-07','Male');
INSERT INTO employee VALUES('14796','password','Chamath','Hasaranga','No.89, Obesekarapura, Rajagiriya','1998-01-01','Male');
INSERT INTO employee VALUES('14797','password','Ishara','Deshan','7, Raigama, Bandaragama','1994-06-13','Male');
INSERT INTO employee VALUES('14798','password','Sudheera','Fonseka','T.R. de Silva Ave, Wilegoda','1998-07-28','Male');
INSERT INTO employee VALUES('14799','password','Mindula','Ekanayake','34, Manamgoda, Ukuwela','1996-07-03','Male');
INSERT INTO employee VALUES('14800','password','Niluka','Pabasara','465/A, Galborella, Kelaniya','1995-07-09','Male');
INSERT INTO employee VALUES('14801','password','Chathura','Kavishka','A46, Imbulana, Ruwanwella','1998-07-03','Male');
INSERT INTO employee VALUES('14802','password','Janaka','Atapattu','756, Thalwila, Marawila','1995-07-25','Male');
INSERT INTO employee VALUES('14803','password','Sudesh','Gamage','475, Mal Para, Piliyandala','1993-07-08','Male');
INSERT INTO employee VALUES('14804','password','Mahesh','Nishshanka','47, Hosptal Rd, Dankotuwa','1995-08-05','Male');
INSERT INTO employee VALUES('14805','password','Praneeth','Amarasinghe','3/A, Bogahawatta, Haliela','1998-07-12','Male');
INSERT INTO employee VALUES('14806','password','Tivon','Jesudas','475, Nallur, Jaffna','1996-05-08','Male');
INSERT INTO employee VALUES('14807','password','Harendran','Nishagar','757. Sunnaham South, Jaffna','1995-12-08','Male');
INSERT INTO employee VALUES('14808','password','Gamini','Uyanwatte','485, Meegahakiwula, Badulla','1978-06-15','Male');
INSERT INTO employee VALUES('14809','password','Nimali','Liyanage','676, Galle Rd, Waskaduwa','1980-02-27','Female');
INSERT INTO employee VALUES('14810','password','Imalka','Senewirathna','385, Godahena, Dolapihilla','1985-09-25','Female');
INSERT INTO employee VALUES('14811','password','Prabhashi','Weerawardane','No.78, Upali Mw, Panagoda','1992-08-09','Female');
INSERT INTO employee VALUES('14812','password','Sakuni','Suraweera','No. 57, Maligawa Rd, Kandy','1995-03-14','Female');
INSERT INTO employee VALUES('14813','password','Upeksha','Darshani','School Rd, Atalugama, Bandaragama','1999-06-20','Female');
INSERT INTO employee VALUES('14814','password','Anne','Fathima','68, Kandy Rd, Narammala','1997-03-16','Female');
INSERT INTO employee VALUES('14815','password','Yoshitha','Rajapaksha','89, Ballapana, Galigamuwa','1996-03-11','Male');
INSERT INTO employee VALUES('14816','password','Azra','Mohammed','34, Kovil Rd, Mannar','1999-01-16','Female');
INSERT INTO employee VALUES('14817','password','Ridmika','Kotuwegoda','65, Jamburegoda, Weligama','1993-06-17','Male');
INSERT INTO employee VALUES('14818','password','Udara','Wijesooriya','44, Fort Rd, Galle','1996-09-09','Male');
INSERT INTO employee VALUES('14819','password','Neelaka','Kasun','No. 47, E.R De Mel Rd, Kalutara','1997-05-08','Male');
INSERT INTO employee VALUES('14820','password','Suranga','Lakmal','No.89, Dedunu Rd, Kubuka','1997-11-15','Male');
INSERT INTO employee VALUES('14821','password','Frank','Perera','No. 46, Malwana Road, Katugasthota','1997-06-17','Male');
INSERT INTO employee VALUES('14822','password','Dasun','Wanigasekara','No. 67, Agalawaththa','1999-03-17','Male');
INSERT INTO employee VALUES('14823','password','Kavindu','Randima','47, Mahawihara Rd, Ahangama','1999-07-09','Male');
INSERT INTO employee VALUES('14824','password','Lasith','Deeshaka','645, Keselwatta, Panadura','1997-03-14','Male');
INSERT INTO employee VALUES('14825','password','Thilina','Sandaruwan','34, Ukuwela, Mathale','1998-06-14','Male');
INSERT INTO employee VALUES('14826','password','Ravindu','Induwara','74, Kobeigane, Kurunegala','1996-04-14','Male');
INSERT INTO employee VALUES('14827','password','Surendra','Weerawansha','No36, Govinda Ave, Kurunegala','1997-06-04','Male');
INSERT INTO employee VALUES('14828','password','Chanuka','Sumathipala','23/A, Kandy Rd, Gampola','1999-02-04','Male');
INSERT INTO employee VALUES('14829','password','David','Prabakaran','No. 56, Kovil Rd, Mannar','1996-05-01','Male');
INSERT INTO employee VALUES('14830','password','Jeygan','Manoharan','No. 67, Balalla','1999-04-07','Male');
INSERT INTO employee VALUES('14831','password','Dinuka','Pushpakumara','No. 57, Kimbulgoda, Yakkala','1998-02-04','Male');
INSERT INTO employee VALUES('14832','password','Ishara','Hansika','Paragala, Matara','1995-05-04','Male');
INSERT INTO employee VALUES('14833','password','Hiruna','Sanjeewa','Roman Mawatha, Pittugala, Malabe','1999-05-04','Male');
INSERT INTO employee VALUES('14834','password','Neelaka','Liyanage','Jayanthigama, Kanthale','1997-02-04','Male');
INSERT INTO employee VALUES('14835','password','Sumali','Silva','No. 78, Galpatha Road, Kelaniya','1987-05-17','Female');
INSERT INTO employee VALUES('14836','password','Dimantha','Sapumal','No. 89, Sir Edward Perera Mw, Ja Ela','1987-03-14','Male');
INSERT INTO employee VALUES('14837','password','Supun','Hettiarachchi','Namal Rd, Homagama','1972-05-12','Male');
INSERT INTO employee VALUES('14838','password','Chalani','Walgama','No. 78, Negombo Road, Wattala','1997-07-18','Female');
DROP TABLE IF EXISTS establishes;
CREATE TABLE `establishes` (
  `Req_ID` int(5) NOT NULL,
  `Emp_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  KEY `Emp_ID` (`Emp_ID`),
  KEY `Req_ID` (`Req_ID`),
  CONSTRAINT `establishes_ibfk_1` FOREIGN KEY (`Emp_ID`) REFERENCES `service_personnal` (`Emp_ID`) ON DELETE SET NULL,
  CONSTRAINT `establishes_ibfk_2` FOREIGN KEY (`Req_ID`) REFERENCES `new_connection` (`Req_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO establishes VALUES('36034','14802','2023-04-30');
INSERT INTO establishes VALUES('36030','14798','2023-04-30');
DROP TABLE IF EXISTS feedback;
CREATE TABLE `feedback` (
  `Feedback_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Cus_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  `Description` varchar(300) NOT NULL,
  PRIMARY KEY (`Feedback_ID`),
  KEY `Cus_ID` (`Cus_ID`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`Cus_ID`) REFERENCES `customer` (`Cus_ID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=60012 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO feedback VALUES('60010','40006','2023-04-30','I love your service, it is great!!!');
INSERT INTO feedback VALUES('60011','40002','2023-04-30','A reliable water supply. Thank you for that!');
DROP TABLE IF EXISTS manager;
CREATE TABLE `manager` (
  `Emp_ID` int(5) NOT NULL,
  `Grade` int(1) NOT NULL,
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`Emp_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO manager VALUES('14778','1');
INSERT INTO manager VALUES('14779','2');
INSERT INTO manager VALUES('14780','3');
INSERT INTO manager VALUES('14808','1');
INSERT INTO manager VALUES('14809','2');
INSERT INTO manager VALUES('14810','3');
INSERT INTO manager VALUES('14835','1');
INSERT INTO manager VALUES('14836','2');
INSERT INTO manager VALUES('14837','3');
DROP TABLE IF EXISTS manipulates;
CREATE TABLE `manipulates` (
  `Email` varchar(50) DEFAULT NULL,
  `Emp_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  UNIQUE KEY `Emp_ID` (`Emp_ID`),
  KEY `Email` (`Email`),
  CONSTRAINT `manipulates_ibfk_1` FOREIGN KEY (`Email`) REFERENCES `sys_admin` (`Email`) ON DELETE CASCADE,
  CONSTRAINT `manipulates_ibfk_2` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`Emp_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO manipulates VALUES('hansisew@gmail.com','14778','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14779','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14780','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14781','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14782','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14783','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14784','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14785','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14786','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14787','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14788','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14789','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14790','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14791','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14792','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14793','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14794','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14795','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14796','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14797','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14798','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14799','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14800','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14801','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14802','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14803','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14804','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14805','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14806','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14807','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14808','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14809','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14810','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14811','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14812','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14813','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14814','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14815','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14816','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14817','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14818','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14819','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14820','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14821','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14822','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14823','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14824','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14825','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14826','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14827','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14828','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14829','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14830','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14831','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14832','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14833','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14834','2023-04-30');
INSERT INTO manipulates VALUES('samanperera@gmail.com','14835','2023-04-30');
INSERT INTO manipulates VALUES('samanperera@gmail.com','14836','2023-04-30');
INSERT INTO manipulates VALUES('samanperera@gmail.com','14837','2023-04-30');
INSERT INTO manipulates VALUES('samanperera@gmail.com','14838','2023-04-30');
DROP TABLE IF EXISTS new_connection;
CREATE TABLE `new_connection` (
  `Req_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Area` varchar(20) NOT NULL,
  `Req_Status` varchar(14) DEFAULT 'Pending',
  PRIMARY KEY (`Req_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=36035 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO new_connection VALUES('36028','2023-04-30','Colombo','Pending');
INSERT INTO new_connection VALUES('36029','2023-04-30','Colombo','Pending');
INSERT INTO new_connection VALUES('36030','2023-04-30','Colombo','Approved');
INSERT INTO new_connection VALUES('36031','2023-04-30','Colombo','Pending');
INSERT INTO new_connection VALUES('36032','2023-04-30','Colombo','Pending');
INSERT INTO new_connection VALUES('36033','2023-04-30','Colombo','Rejected');
INSERT INTO new_connection VALUES('36034','2023-04-30','Gampaha','Approved');
DROP TABLE IF EXISTS notice_board;
CREATE TABLE `notice_board` (
  `Notice_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Emp_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  `Description` varchar(300) NOT NULL,
  PRIMARY KEY (`Notice_ID`),
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `notice_board_ibfk_1` FOREIGN KEY (`Emp_ID`) REFERENCES `staff` (`Emp_ID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO notice_board VALUES('1','14781','2023-04-30','Diyaluma website is now online!');
DROP TABLE IF EXISTS payment_history;
CREATE TABLE `payment_history` (
  `Month` varchar(18) NOT NULL,
  `Cus_ID` int(5) NOT NULL,
  `Paid_Date` date NOT NULL,
  `Paid_Amount` double(7,2) NOT NULL,
  PRIMARY KEY (`Month`,`Cus_ID`),
  KEY `Cus_ID` (`Cus_ID`),
  CONSTRAINT `payment_history_ibfk_1` FOREIGN KEY (`Cus_ID`) REFERENCES `customer` (`Cus_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO payment_history VALUES('2023-04','40002','2023-04-30','4000.00');
INSERT INTO payment_history VALUES('2023-04','40006','2023-04-30','4000.00');
DROP TABLE IF EXISTS reviews;
CREATE TABLE `reviews` (
  `Feedback_ID` int(5) NOT NULL,
  `Emp_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  KEY `Feedback_ID` (`Feedback_ID`),
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`Feedback_ID`) REFERENCES `feedback` (`Feedback_ID`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`Emp_ID`) REFERENCES `staff` (`Emp_ID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO reviews VALUES('60011','14785','2023-04-30');
DROP TABLE IF EXISTS salary;
CREATE TABLE `salary` (
  `Payment_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Mgr_ID` int(5) DEFAULT NULL,
  `Emp_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  `Amount_Paid` double(7,2) NOT NULL,
  PRIMARY KEY (`Payment_ID`),
  KEY `Mgr_ID` (`Mgr_ID`),
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `salary_ibfk_1` FOREIGN KEY (`Mgr_ID`) REFERENCES `manager` (`Emp_ID`) ON DELETE SET NULL,
  CONSTRAINT `salary_ibfk_2` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`Emp_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS service_personnal;
CREATE TABLE `service_personnal` (
  `Emp_ID` int(5) NOT NULL,
  `Area` varchar(20) NOT NULL,
  `Type` varchar(15) NOT NULL,
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `service_personnal_ibfk_2` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`Emp_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO service_personnal VALUES('14790','Ampara','Plumber');
INSERT INTO service_personnal VALUES('14791','Ampara','Driver');
INSERT INTO service_personnal VALUES('14792','Anuradhapura','Plumber');
INSERT INTO service_personnal VALUES('14793','Anuradhapura','Driver');
INSERT INTO service_personnal VALUES('14794','Badulla','Plumber');
INSERT INTO service_personnal VALUES('14795','Badulla','Driver');
INSERT INTO service_personnal VALUES('14796','Batticaloa','Plumber');
INSERT INTO service_personnal VALUES('14797','Batticaloa','Driver');
INSERT INTO service_personnal VALUES('14798','Colombo','Plumber');
INSERT INTO service_personnal VALUES('14799','Colombo','Driver');
INSERT INTO service_personnal VALUES('14800','Galle','Plumber');
INSERT INTO service_personnal VALUES('14801','Galle','Driver');
INSERT INTO service_personnal VALUES('14802','Gampaha','Plumber');
INSERT INTO service_personnal VALUES('14803','Gampaha','Driver');
INSERT INTO service_personnal VALUES('14804','Hambantota','Plumber');
INSERT INTO service_personnal VALUES('14805','Hambantota','Driver');
INSERT INTO service_personnal VALUES('14806','Jaffna','Plumber');
INSERT INTO service_personnal VALUES('14807','Jaffna','Driver');
INSERT INTO service_personnal VALUES('14819','Kalutara','Plumber');
INSERT INTO service_personnal VALUES('14820','Kalutara','Driver');
INSERT INTO service_personnal VALUES('14821','Kandy','Plumber');
INSERT INTO service_personnal VALUES('14822','Kandy','Driver');
INSERT INTO service_personnal VALUES('14823','Kegalle','Plumber');
INSERT INTO service_personnal VALUES('14824','Kegalle','Driver');
INSERT INTO service_personnal VALUES('14825','Kilinochchi','Plumber');
INSERT INTO service_personnal VALUES('14826','Kilinochchi','Driver');
INSERT INTO service_personnal VALUES('14827','Kurunegala','Plumber');
INSERT INTO service_personnal VALUES('14828','Kurunegala','Driver');
INSERT INTO service_personnal VALUES('14829','Mannar','Plumber');
INSERT INTO service_personnal VALUES('14830','Mannar','Driver');
INSERT INTO service_personnal VALUES('14831','Matale','Plumber');
INSERT INTO service_personnal VALUES('14832','Matale','Driver');
INSERT INTO service_personnal VALUES('14833','Matara','Plumber');
INSERT INTO service_personnal VALUES('14834','Matara','Driver');
DROP TABLE IF EXISTS solves;
CREATE TABLE `solves` (
  `Comp_ID` int(5) NOT NULL,
  `Emp_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  KEY `Comp_ID` (`Comp_ID`),
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `solves_ibfk_1` FOREIGN KEY (`Comp_ID`) REFERENCES `complaint` (`Comp_ID`) ON DELETE CASCADE,
  CONSTRAINT `solves_ibfk_2` FOREIGN KEY (`Emp_ID`) REFERENCES `service_personnal` (`Emp_ID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
DROP TABLE IF EXISTS staff;
CREATE TABLE `staff` (
  `Emp_ID` int(5) NOT NULL,
  `Area` varchar(20) NOT NULL,
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`Emp_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO staff VALUES('14781','Ampara');
INSERT INTO staff VALUES('14782','Anuradhapura');
INSERT INTO staff VALUES('14783','Badulla');
INSERT INTO staff VALUES('14784','Batticaloa');
INSERT INTO staff VALUES('14785','Colombo');
INSERT INTO staff VALUES('14786','Galle');
INSERT INTO staff VALUES('14787','Gampaha');
INSERT INTO staff VALUES('14788','Hambantota');
INSERT INTO staff VALUES('14789','Jaffna');
INSERT INTO staff VALUES('14811','Kalutara');
INSERT INTO staff VALUES('14812','Kandy');
INSERT INTO staff VALUES('14813','Kegalle');
INSERT INTO staff VALUES('14814','Kilinochchi');
INSERT INTO staff VALUES('14815','Kurunegala');
INSERT INTO staff VALUES('14816','Mannar');
INSERT INTO staff VALUES('14817','Matale');
INSERT INTO staff VALUES('14818','Matara');
INSERT INTO staff VALUES('14838','Monaragala');
DROP TABLE IF EXISTS sys_admin;
CREATE TABLE `sys_admin` (
  `Email` varchar(50) NOT NULL,
  `Password` varchar(10) NOT NULL,
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `Address` varchar(100) NOT NULL,
  PRIMARY KEY (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO sys_admin VALUES('hansisew@gmail.com','abcd1234','Hansi','Weerawardana','No.457/10, Mihindu Mw, Anuradhapura');
INSERT INTO sys_admin VALUES('kamalperera@gmail.com','abcd1234','Kamal','Perera','No.10, Temple Road, Meegoda');
INSERT INTO sys_admin VALUES('samanperera@gmail.com','abcd1234','Saman','Perera','No.10, Temple Road, Meegoda');
INSERT INTO sys_admin VALUES('sithumij@gmail.com','abcd1234','Sithumi','Gunasekara','\"Sithumi\", Yaya Road, Homagama South, Homagama');
DROP TABLE IF EXISTS account;
CREATE TABLE `account` (
  `Month` varchar(18) NOT NULL,
  `Cus_ID` int(5) NOT NULL,
  `Allocated_Units` int(4) NOT NULL,
  `Used_Units` int(4) NOT NULL,
  PRIMARY KEY (`Month`,`Cus_ID`),
  KEY `Cus_ID` (`Cus_ID`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`Cus_ID`) REFERENCES `customer` (`Cus_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO account VALUES('2023-04','40000','0','0');
INSERT INTO account VALUES('2023-04','40001','0','0');
INSERT INTO account VALUES('2023-04','40002','100','45');
INSERT INTO account VALUES('2023-04','40003','0','0');
INSERT INTO account VALUES('2023-04','40004','0','0');
INSERT INTO account VALUES('2023-04','40005','0','0');
INSERT INTO account VALUES('2023-04','40006','100','61');
DROP TABLE IF EXISTS approves;
CREATE TABLE `approves` (
  `Req_ID` int(5) DEFAULT NULL,
  `Mgr_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  KEY `Mgr_ID` (`Mgr_ID`),
  KEY `Req_ID` (`Req_ID`),
  CONSTRAINT `approves_ibfk_1` FOREIGN KEY (`Mgr_ID`) REFERENCES `manager` (`Emp_ID`) ON DELETE SET NULL,
  CONSTRAINT `approves_ibfk_2` FOREIGN KEY (`Req_ID`) REFERENCES `new_connection` (`Req_ID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO approves VALUES('36034','14778','2023-04-30');
INSERT INTO approves VALUES('36030','14778','2023-04-30');
DROP TABLE IF EXISTS complaint;
CREATE TABLE `complaint` (
  `Comp_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Cus_ID` int(5) NOT NULL,
  `Date` date NOT NULL,
  `Description` varchar(300) NOT NULL,
  `Status` varchar(50) DEFAULT 'Pending',
  PRIMARY KEY (`Comp_ID`),
  KEY `Cus_ID` (`Cus_ID`),
  CONSTRAINT `complaint_ibfk_1` FOREIGN KEY (`Cus_ID`) REFERENCES `customer` (`Cus_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56826 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO complaint VALUES('56825','40002','2023-04-30','Low water pressure','Pending');
DROP TABLE IF EXISTS customer;
CREATE TABLE `customer` (
  `Cus_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Req_ID` int(5) NOT NULL,
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `Phone` int(10) NOT NULL,
  `Address` varchar(100) NOT NULL,
  PRIMARY KEY (`Cus_ID`),
  KEY `Req_ID` (`Req_ID`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`Req_ID`) REFERENCES `new_connection` (`Req_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40007 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO customer VALUES('40000','36028','Kasun','Rukshan','717852142','No.42, Kusum Mw, Panagoda');
INSERT INTO customer VALUES('40001','36029','Meena','Kariyawasam','112854525','No. 254, Technical Rd, Homagama');
INSERT INTO customer VALUES('40002','36030','Jayantha','Mallawa','778596123','No. 874/B, Dextor Ave, Narahenpita');
INSERT INTO customer VALUES('40003','36031','Malik','Samarathunga','112748591','Namal Uyana, Kaduwela');
INSERT INTO customer VALUES('40004','36032','Ransith','Suranga','758545123','No. 89, Boralugoda Mw, Hettigoda');
INSERT INTO customer VALUES('40005','36033','Gayani','Govinna','705241785','78, Govinna Rd, Athurugiriya');
INSERT INTO customer VALUES('40006','36034','Kalum','Perera','784512751','No.46/B, Pahala Galgoda, Nittambuwa');
DROP TABLE IF EXISTS employee;
CREATE TABLE `employee` (
  `Emp_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Password` varchar(10) NOT NULL,
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `DoB` date NOT NULL,
  `Sex` varchar(7) NOT NULL,
  PRIMARY KEY (`Emp_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14839 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO employee VALUES('14778','password','Tharaka','Jayasinghe','25, Ananda Mawatha, Kandy','1975-05-14','Male');
INSERT INTO employee VALUES('14779','password','Isuru','Sampath','16, Havelock Road, Colombo','1978-07-22','Male');
INSERT INTO employee VALUES('14780','password','Malsha','Weerasinghe','3, Mahamevnawa Mawatha, Homagama','1987-10-07','Female');
INSERT INTO employee VALUES('14781','password','Madara','Srimal','52, Temple Road, Kalutara','1990-01-18','Male');
INSERT INTO employee VALUES('14782','password','Rohitha','Dissanayake','27, Hospital Road, Horowpathana','1987-12-02','Male');
INSERT INTO employee VALUES('14783','password','Darsha','Wimalasena','36, Station Road, Kelaniya','1995-06-09','Female');
INSERT INTO employee VALUES('14784','password','Mohammed','Shiraz','77, Hill Street, Dehiwala-Mount Lavinia','1998-03-17','Male');
INSERT INTO employee VALUES('14785','password','Nimal','Amarasena','40, Galle Face Terrace, Colombo','1972-09-25','Male');
INSERT INTO employee VALUES('14786','password','Amaa','Ketagoda','6, Hospital Road, Kalutara','1995-06-17','Female');
INSERT INTO employee VALUES('14787','password','Sandaruwan','Silva','72/A, Station Road, Homagama','1998-07-19','Male');
INSERT INTO employee VALUES('14788','password','Madhavi','Ganegoda','61, Temple Road, Panadura','2000-08-17','Female');
INSERT INTO employee VALUES('14789','password','Sivakumaran','Ramanadan','B9,Kantalai,Jaffna','1991-08-01','Male');
INSERT INTO employee VALUES('14790','password','Thushara','Perera','10/A, Nelum Pedesa, Ampara','1998-05-15','Male');
INSERT INTO employee VALUES('14791','password','Kasun','Sandakelum','No.15, School Rd, Wewpokuna, Ampara','1999-08-07','Male');
INSERT INTO employee VALUES('14792','password','Diluka','Sanjeewa','45A, Ihala Hanwella, Hanwella','1995-07-14','Male');
INSERT INTO employee VALUES('14793','password','Pubudu','Geethika','56/C, Mal Para, Kahatagasdigiliya','1995-08-14','Male');
INSERT INTO employee VALUES('14794','password','Sineth','Malaka','No. 874/A, Dextor Ave, Narahenpita','1995-07-23','Male');
INSERT INTO employee VALUES('14795','password','Sachin','Weerasooriya','87, Ukuwela, Mathale','1998-03-07','Male');
INSERT INTO employee VALUES('14796','password','Chamath','Hasaranga','No.89, Obesekarapura, Rajagiriya','1998-01-01','Male');
INSERT INTO employee VALUES('14797','password','Ishara','Deshan','7, Raigama, Bandaragama','1994-06-13','Male');
INSERT INTO employee VALUES('14798','password','Sudheera','Fonseka','T.R. de Silva Ave, Wilegoda','1998-07-28','Male');
INSERT INTO employee VALUES('14799','password','Mindula','Ekanayake','34, Manamgoda, Ukuwela','1996-07-03','Male');
INSERT INTO employee VALUES('14800','password','Niluka','Pabasara','465/A, Galborella, Kelaniya','1995-07-09','Male');
INSERT INTO employee VALUES('14801','password','Chathura','Kavishka','A46, Imbulana, Ruwanwella','1998-07-03','Male');
INSERT INTO employee VALUES('14802','password','Janaka','Atapattu','756, Thalwila, Marawila','1995-07-25','Male');
INSERT INTO employee VALUES('14803','password','Sudesh','Gamage','475, Mal Para, Piliyandala','1993-07-08','Male');
INSERT INTO employee VALUES('14804','password','Mahesh','Nishshanka','47, Hosptal Rd, Dankotuwa','1995-08-05','Male');
INSERT INTO employee VALUES('14805','password','Praneeth','Amarasinghe','3/A, Bogahawatta, Haliela','1998-07-12','Male');
INSERT INTO employee VALUES('14806','password','Tivon','Jesudas','475, Nallur, Jaffna','1996-05-08','Male');
INSERT INTO employee VALUES('14807','password','Harendran','Nishagar','757. Sunnaham South, Jaffna','1995-12-08','Male');
INSERT INTO employee VALUES('14808','password','Gamini','Uyanwatte','485, Meegahakiwula, Badulla','1978-06-15','Male');
INSERT INTO employee VALUES('14809','password','Nimali','Liyanage','676, Galle Rd, Waskaduwa','1980-02-27','Female');
INSERT INTO employee VALUES('14810','password','Imalka','Senewirathna','385, Godahena, Dolapihilla','1985-09-25','Female');
INSERT INTO employee VALUES('14811','password','Prabhashi','Weerawardane','No.78, Upali Mw, Panagoda','1992-08-09','Female');
INSERT INTO employee VALUES('14812','password','Sakuni','Suraweera','No. 57, Maligawa Rd, Kandy','1995-03-14','Female');
INSERT INTO employee VALUES('14813','password','Upeksha','Darshani','School Rd, Atalugama, Bandaragama','1999-06-20','Female');
INSERT INTO employee VALUES('14814','password','Anne','Fathima','68, Kandy Rd, Narammala','1997-03-16','Female');
INSERT INTO employee VALUES('14815','password','Yoshitha','Rajapaksha','89, Ballapana, Galigamuwa','1996-03-11','Male');
INSERT INTO employee VALUES('14816','password','Azra','Mohammed','34, Kovil Rd, Mannar','1999-01-16','Female');
INSERT INTO employee VALUES('14817','password','Ridmika','Kotuwegoda','65, Jamburegoda, Weligama','1993-06-17','Male');
INSERT INTO employee VALUES('14818','password','Udara','Wijesooriya','44, Fort Rd, Galle','1996-09-09','Male');
INSERT INTO employee VALUES('14819','password','Neelaka','Kasun','No. 47, E.R De Mel Rd, Kalutara','1997-05-08','Male');
INSERT INTO employee VALUES('14820','password','Suranga','Lakmal','No.89, Dedunu Rd, Kubuka','1997-11-15','Male');
INSERT INTO employee VALUES('14821','password','Frank','Perera','No. 46, Malwana Road, Katugasthota','1997-06-17','Male');
INSERT INTO employee VALUES('14822','password','Dasun','Wanigasekara','No. 67, Agalawaththa','1999-03-17','Male');
INSERT INTO employee VALUES('14823','password','Kavindu','Randima','47, Mahawihara Rd, Ahangama','1999-07-09','Male');
INSERT INTO employee VALUES('14824','password','Lasith','Deeshaka','645, Keselwatta, Panadura','1997-03-14','Male');
INSERT INTO employee VALUES('14825','password','Thilina','Sandaruwan','34, Ukuwela, Mathale','1998-06-14','Male');
INSERT INTO employee VALUES('14826','password','Ravindu','Induwara','74, Kobeigane, Kurunegala','1996-04-14','Male');
INSERT INTO employee VALUES('14827','password','Surendra','Weerawansha','No36, Govinda Ave, Kurunegala','1997-06-04','Male');
INSERT INTO employee VALUES('14828','password','Chanuka','Sumathipala','23/A, Kandy Rd, Gampola','1999-02-04','Male');
INSERT INTO employee VALUES('14829','password','David','Prabakaran','No. 56, Kovil Rd, Mannar','1996-05-01','Male');
INSERT INTO employee VALUES('14830','password','Jeygan','Manoharan','No. 67, Balalla','1999-04-07','Male');
INSERT INTO employee VALUES('14831','password','Dinuka','Pushpakumara','No. 57, Kimbulgoda, Yakkala','1998-02-04','Male');
INSERT INTO employee VALUES('14832','password','Ishara','Hansika','Paragala, Matara','1995-05-04','Male');
INSERT INTO employee VALUES('14833','password','Hiruna','Sanjeewa','Roman Mawatha, Pittugala, Malabe','1999-05-04','Male');
INSERT INTO employee VALUES('14834','password','Neelaka','Liyanage','Jayanthigama, Kanthale','1997-02-04','Male');
INSERT INTO employee VALUES('14835','password','Sumali','Silva','No. 78, Galpatha Road, Kelaniya','1987-05-17','Female');
INSERT INTO employee VALUES('14836','password','Dimantha','Sapumal','No. 89, Sir Edward Perera Mw, Ja Ela','1987-03-14','Male');
INSERT INTO employee VALUES('14837','password','Supun','Hettiarachchi','Namal Rd, Homagama','1972-05-12','Male');
INSERT INTO employee VALUES('14838','password','Chalani','Walgama','No. 78, Negombo Road, Wattala','1997-07-18','Female');
DROP TABLE IF EXISTS establishes;
CREATE TABLE `establishes` (
  `Req_ID` int(5) NOT NULL,
  `Emp_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  KEY `Emp_ID` (`Emp_ID`),
  KEY `Req_ID` (`Req_ID`),
  CONSTRAINT `establishes_ibfk_1` FOREIGN KEY (`Emp_ID`) REFERENCES `service_personnal` (`Emp_ID`) ON DELETE SET NULL,
  CONSTRAINT `establishes_ibfk_2` FOREIGN KEY (`Req_ID`) REFERENCES `new_connection` (`Req_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO establishes VALUES('36034','14802','2023-04-30');
INSERT INTO establishes VALUES('36030','14798','2023-04-30');
DROP TABLE IF EXISTS feedback;
CREATE TABLE `feedback` (
  `Feedback_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Cus_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  `Description` varchar(300) NOT NULL,
  PRIMARY KEY (`Feedback_ID`),
  KEY `Cus_ID` (`Cus_ID`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`Cus_ID`) REFERENCES `customer` (`Cus_ID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=60013 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO feedback VALUES('60011','40002','2023-04-30','A reliable water supply. Thank you for that!');
DROP TABLE IF EXISTS manager;
CREATE TABLE `manager` (
  `Emp_ID` int(5) NOT NULL,
  `Grade` int(1) NOT NULL,
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`Emp_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO manager VALUES('14778','1');
INSERT INTO manager VALUES('14779','2');
INSERT INTO manager VALUES('14780','3');
INSERT INTO manager VALUES('14808','1');
INSERT INTO manager VALUES('14809','2');
INSERT INTO manager VALUES('14810','3');
INSERT INTO manager VALUES('14835','1');
INSERT INTO manager VALUES('14836','2');
INSERT INTO manager VALUES('14837','3');
DROP TABLE IF EXISTS manipulates;
CREATE TABLE `manipulates` (
  `Email` varchar(50) DEFAULT NULL,
  `Emp_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  UNIQUE KEY `Emp_ID` (`Emp_ID`),
  KEY `Email` (`Email`),
  CONSTRAINT `manipulates_ibfk_1` FOREIGN KEY (`Email`) REFERENCES `sys_admin` (`Email`) ON DELETE CASCADE,
  CONSTRAINT `manipulates_ibfk_2` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`Emp_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO manipulates VALUES('hansisew@gmail.com','14778','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14779','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14780','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14781','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14782','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14783','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14784','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14785','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14786','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14787','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14788','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14789','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14790','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14791','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14792','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14793','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14794','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14795','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14796','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14797','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14798','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14799','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14800','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14801','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14802','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14803','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14804','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14805','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14806','2023-04-30');
INSERT INTO manipulates VALUES('hansisew@gmail.com','14807','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14808','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14809','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14810','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14811','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14812','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14813','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14814','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14815','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14816','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14817','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14818','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14819','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14820','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14821','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14822','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14823','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14824','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14825','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14826','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14827','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14828','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14829','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14830','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14831','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14832','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14833','2023-04-30');
INSERT INTO manipulates VALUES('kamalperera@gmail.com','14834','2023-04-30');
INSERT INTO manipulates VALUES('samanperera@gmail.com','14835','2023-04-30');
INSERT INTO manipulates VALUES('samanperera@gmail.com','14836','2023-04-30');
INSERT INTO manipulates VALUES('samanperera@gmail.com','14837','2023-04-30');
INSERT INTO manipulates VALUES('samanperera@gmail.com','14838','2023-04-30');
DROP TABLE IF EXISTS new_connection;
CREATE TABLE `new_connection` (
  `Req_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Area` varchar(20) NOT NULL,
  `Req_Status` varchar(14) DEFAULT 'Pending',
  PRIMARY KEY (`Req_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=36035 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO new_connection VALUES('36028','2023-04-30','Colombo','Pending');
INSERT INTO new_connection VALUES('36029','2023-04-30','Colombo','Pending');
INSERT INTO new_connection VALUES('36030','2023-04-30','Colombo','Approved');
INSERT INTO new_connection VALUES('36031','2023-04-30','Colombo','Pending');
INSERT INTO new_connection VALUES('36032','2023-04-30','Colombo','Pending');
INSERT INTO new_connection VALUES('36033','2023-04-30','Colombo','Rejected');
INSERT INTO new_connection VALUES('36034','2023-04-30','Gampaha','Approved');
DROP TABLE IF EXISTS notice_board;
CREATE TABLE `notice_board` (
  `Notice_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Emp_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  `Description` varchar(300) NOT NULL,
  PRIMARY KEY (`Notice_ID`),
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `notice_board_ibfk_1` FOREIGN KEY (`Emp_ID`) REFERENCES `staff` (`Emp_ID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO notice_board VALUES('1','14781','2023-04-30','Diyaluma website is now online!');
INSERT INTO notice_board VALUES('2','14785','2023-04-30','Now we are accepting online payments through Diyaluma Website! Feel free to use that service!!');
DROP TABLE IF EXISTS payment_history;
CREATE TABLE `payment_history` (
  `Month` varchar(18) NOT NULL,
  `Cus_ID` int(5) NOT NULL,
  `Paid_Date` date NOT NULL,
  `Paid_Amount` double(7,2) NOT NULL,
  PRIMARY KEY (`Month`,`Cus_ID`),
  KEY `Cus_ID` (`Cus_ID`),
  CONSTRAINT `payment_history_ibfk_1` FOREIGN KEY (`Cus_ID`) REFERENCES `customer` (`Cus_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO payment_history VALUES('2023-04','40002','2023-04-30','4000.00');
INSERT INTO payment_history VALUES('2023-04','40006','2023-04-30','4000.00');
DROP TABLE IF EXISTS reviews;
CREATE TABLE `reviews` (
  `Feedback_ID` int(5) NOT NULL,
  `Emp_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  KEY `Feedback_ID` (`Feedback_ID`),
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`Feedback_ID`) REFERENCES `feedback` (`Feedback_ID`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`Emp_ID`) REFERENCES `staff` (`Emp_ID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO reviews VALUES('60011','14785','2023-04-30');
DROP TABLE IF EXISTS salary;
CREATE TABLE `salary` (
  `Payment_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Mgr_ID` int(5) DEFAULT NULL,
  `Emp_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  `Amount_Paid` double(7,2) NOT NULL,
  PRIMARY KEY (`Payment_ID`),
  KEY `Mgr_ID` (`Mgr_ID`),
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `salary_ibfk_1` FOREIGN KEY (`Mgr_ID`) REFERENCES `manager` (`Emp_ID`) ON DELETE SET NULL,
  CONSTRAINT `salary_ibfk_2` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`Emp_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO salary VALUES('1','14778','14798','2023-04-30','45000.00');
INSERT INTO salary VALUES('2','14778','14785','2023-04-30','60000.00');
DROP TABLE IF EXISTS service_personnal;
CREATE TABLE `service_personnal` (
  `Emp_ID` int(5) NOT NULL,
  `Area` varchar(20) NOT NULL,
  `Type` varchar(15) NOT NULL,
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `service_personnal_ibfk_2` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`Emp_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO service_personnal VALUES('14790','Ampara','Plumber');
INSERT INTO service_personnal VALUES('14791','Ampara','Driver');
INSERT INTO service_personnal VALUES('14792','Anuradhapura','Plumber');
INSERT INTO service_personnal VALUES('14793','Anuradhapura','Driver');
INSERT INTO service_personnal VALUES('14794','Badulla','Plumber');
INSERT INTO service_personnal VALUES('14795','Badulla','Driver');
INSERT INTO service_personnal VALUES('14796','Batticaloa','Plumber');
INSERT INTO service_personnal VALUES('14797','Batticaloa','Driver');
INSERT INTO service_personnal VALUES('14798','Colombo','Plumber');
INSERT INTO service_personnal VALUES('14799','Colombo','Driver');
INSERT INTO service_personnal VALUES('14800','Galle','Plumber');
INSERT INTO service_personnal VALUES('14801','Galle','Driver');
INSERT INTO service_personnal VALUES('14802','Gampaha','Plumber');
INSERT INTO service_personnal VALUES('14803','Gampaha','Driver');
INSERT INTO service_personnal VALUES('14804','Hambantota','Plumber');
INSERT INTO service_personnal VALUES('14805','Hambantota','Driver');
INSERT INTO service_personnal VALUES('14806','Jaffna','Plumber');
INSERT INTO service_personnal VALUES('14807','Jaffna','Driver');
INSERT INTO service_personnal VALUES('14819','Kalutara','Plumber');
INSERT INTO service_personnal VALUES('14820','Kalutara','Driver');
INSERT INTO service_personnal VALUES('14821','Kandy','Plumber');
INSERT INTO service_personnal VALUES('14822','Kandy','Driver');
INSERT INTO service_personnal VALUES('14823','Kegalle','Plumber');
INSERT INTO service_personnal VALUES('14824','Kegalle','Driver');
INSERT INTO service_personnal VALUES('14825','Kilinochchi','Plumber');
INSERT INTO service_personnal VALUES('14826','Kilinochchi','Driver');
INSERT INTO service_personnal VALUES('14827','Kurunegala','Plumber');
INSERT INTO service_personnal VALUES('14828','Kurunegala','Driver');
INSERT INTO service_personnal VALUES('14829','Mannar','Plumber');
INSERT INTO service_personnal VALUES('14830','Mannar','Driver');
INSERT INTO service_personnal VALUES('14831','Matale','Plumber');
INSERT INTO service_personnal VALUES('14832','Matale','Driver');
INSERT INTO service_personnal VALUES('14833','Matara','Plumber');
INSERT INTO service_personnal VALUES('14834','Matara','Driver');
DROP TABLE IF EXISTS solves;
CREATE TABLE `solves` (
  `Comp_ID` int(5) NOT NULL,
  `Emp_ID` int(5) DEFAULT NULL,
  `Date` date NOT NULL,
  KEY `Comp_ID` (`Comp_ID`),
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `solves_ibfk_1` FOREIGN KEY (`Comp_ID`) REFERENCES `complaint` (`Comp_ID`) ON DELETE CASCADE,
  CONSTRAINT `solves_ibfk_2` FOREIGN KEY (`Emp_ID`) REFERENCES `service_personnal` (`Emp_ID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO solves VALUES('56825','14798','2023-04-30');
DROP TABLE IF EXISTS staff;
CREATE TABLE `staff` (
  `Emp_ID` int(5) NOT NULL,
  `Area` varchar(20) NOT NULL,
  KEY `Emp_ID` (`Emp_ID`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`Emp_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO staff VALUES('14781','Ampara');
INSERT INTO staff VALUES('14782','Anuradhapura');
INSERT INTO staff VALUES('14783','Badulla');
INSERT INTO staff VALUES('14784','Batticaloa');
INSERT INTO staff VALUES('14785','Colombo');
INSERT INTO staff VALUES('14786','Galle');
INSERT INTO staff VALUES('14787','Gampaha');
INSERT INTO staff VALUES('14788','Hambantota');
INSERT INTO staff VALUES('14789','Jaffna');
INSERT INTO staff VALUES('14811','Kalutara');
INSERT INTO staff VALUES('14812','Kandy');
INSERT INTO staff VALUES('14813','Kegalle');
INSERT INTO staff VALUES('14814','Kilinochchi');
INSERT INTO staff VALUES('14815','Kurunegala');
INSERT INTO staff VALUES('14816','Mannar');
INSERT INTO staff VALUES('14817','Matale');
INSERT INTO staff VALUES('14818','Matara');
INSERT INTO staff VALUES('14838','Monaragala');
DROP TABLE IF EXISTS sys_admin;
CREATE TABLE `sys_admin` (
  `Email` varchar(50) NOT NULL,
  `Password` varchar(10) NOT NULL,
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `Address` varchar(100) NOT NULL,
  PRIMARY KEY (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO sys_admin VALUES('hansisew@gmail.com','abcd1234','Hansi','Weerawardana','No.457/10, Mihindu Mw, Anuradhapura');
INSERT INTO sys_admin VALUES('kamalperera@gmail.com','abcd1234','Kamal','Perera','No.10, Temple Road, Meegoda');
INSERT INTO sys_admin VALUES('samanperera@gmail.com','abcd1234','Saman','Perera','No.10, Temple Road, Meegoda');
INSERT INTO sys_admin VALUES('sithumij@gmail.com','abcd1234','Sithumi','Gunasekara','\"Sithumi\", Yaya Road, Homagama South, Homagama');
