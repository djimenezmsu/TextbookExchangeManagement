
-- Textbook Exchange Management --
GO
	USE VR_jholder7 -- REPLACE WITH PERSONAL DB

GO

	DROP TABLE IF EXISTS TEM.Rentals
	DROP TABLE IF EXISTS TEM.Courses
	DROP TABLE IF EXISTS TEM.Customers
	DROP TABLE IF EXISTS TEM.RentalPeriods
	DROP TABLE IF EXISTS TEM.Textbooks
	DROP SCHEMA IF EXISTS TEM

GO

	CREATE SCHEMA TEM

GO

	CREATE TABLE TEM.Customers(
		CustomerID INT IDENTITY(1, 1) PRIMARY KEY,
		CustomerFirstName VARCHAR(50) NOT NULL,
		CustomerMiddleInitial VARCHAR(50) NOT NULL,
		CustomerLastName VARCHAR(50) NOT NULL,
		CustomerPhone VARCHAR(15),
		CustomerStreetAddress VARCHAR(50),
		CustomerCity VARCHAR(50),
		CustomerState VARCHAR(2),
		CustomerZip VARCHAR(5),
		CustomerCountry VARCHAR(50)
		)

	CREATE TABLE TEM.RentalPeriods(
		PeriodID INT IDENTITY(1, 1) PRIMARY KEY,
		PeriodDays INT NOT NULL,
		PeriodTitle VARCHAR(50) NOT NULL,
		PeriodCost MONEY NOT NULL
		)

	CREATE TABLE TEM.Textbooks(
		TextbookID INT IDENTITY(1, 1) PRIMARY KEY,
		ISBN INT NOT NULL,
		Title VARCHAR(50) NOT NULL,
		TextDesc VARCHAR(100) NOT NULL,
		BaseRentalPrice MONEY NOT NULL DEFAULT 0,
		InventoryCount INT NOT NULL DEFAULT 0,
		CHECK(ISBN Like '[0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9]' 
			AND InventoryCount >= 0
			AND BaseRentalPrice >= 0)
		)

GO

	CREATE TABLE TEM.Rentals(
		RentalID INT IDENTITY(1, 1) PRIMARY KEY,
		TextbookID INT NOT NULL REFERENCES TEM.Textbooks(TextbookID),
		CustomerID INT NOT NULL REFERENCES TEM.Customers(CustomerID),
		StartDate DATETIME NOT NULL DEFAULT GETDATE(),
		RentalPeriodID INT NOT NULL REFERENCES TEM.RentalPeriods(PeriodID),
		ReturnCharges MONEY NOT NULL DEFAULT 0,
		Status VARCHAR(20) NOT NULL DEFAULT 0,
		CHECK(ReturnCharges >= 0)
		)

	CREATE TABLE TEM.Courses(
		CourseID INT IDENTITY(1, 1) PRIMARY KEY,
		CourseName VARCHAR(50) NOT NULL,
		Instructor VARCHAR(100) NOT NULL,
		TextBookID INT NOT NULL REFERENCES TEM.Textbooks (TextbookID),
		CHECK(CourseName Like '[A-Z][A-Z][A-Z] [0-9][0-9][0-9]-[0-9][0-9]')
		)
