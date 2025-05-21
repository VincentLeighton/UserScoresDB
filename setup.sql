-- Create DB
CREATE DATABASE `Users` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
-- Create tables
CREATE TABLE Users.UserTypes (
	ID INTEGER auto_increment NOT NULL PRIMARY KEY,
	Name varchar(100) NOT NULL,
	CONSTRAINT UserTypes_UNIQUE UNIQUE KEY (Name)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE Users.Users (
	ID INTEGER auto_increment NOT NULL PRIMARY KEY,
	UserTypeID INTEGER NOT NULL,
	Username varchar(100) NOT NULL,
	LastUpdated TIMESTAMP DEFAULT current_timestamp on update current_timestamp NOT NULL,
	CONSTRAINT Users_UNIQUE UNIQUE KEY (Username),
	CONSTRAINT Users_UserTypes_FK FOREIGN KEY (UserTypeID) REFERENCES Users.UserTypes(ID)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE Users.Scores (
	UserID INTEGER auto_increment NOT NULL,
	GameName varchar(100) NOT NULL,
	Score INTEGER NOT NULL,
	LastUpdated TIMESTAMP DEFAULT current_timestamp on update current_timestamp NOT NULL,
	CONSTRAINT PrimaryKey PRIMARY KEY (UserID,GameName),
	CONSTRAINT NewTable_Users_FK FOREIGN KEY (UserID) REFERENCES Users.Users(ID)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;

-- Populate Tables
INSERT INTO Users.UserTypes (Name) VALUES
	 ('Admin'),
	 ('User');
     
INSERT INTO Users.Users (UserTypeID,Username,LastUpdated) VALUES
	 (1,'Zorven','2025-05-21 04:25:41'),
	 (1,'Wolven','2025-05-21 04:25:53'),
	 (1,'Merlin','2025-05-21 04:26:01'),
	 (1,'Roughnick','2025-05-21 04:26:10'),
	 (2,'Joe','2025-05-21 04:26:27');


