
-- Make Sure To Use Your Database

CREATE SCHEMA TEM -- Textbook Exchange Management --
GO

CREATE TABLE TEM.Customers(
	CustomerID INT IDENTITY(1, 1) PRIMARY KEY,
	CustomerName VARCHAR(50) NOT NULL,
	CustomerPhone VARCHAR(15),
	CustomerStreetAddress VARCHAR(50),
	CustomerCity VARCHAR(50),
	CustomerState VARCHAR(50),
	CustomerZip VARCHAR(5),
	CustomerCountry VARCHAR(50)
	)

CREATE TABLE TEM.Qualities(
	QualityID INT IDENTITY(1, 1) PRIMARY KEY,
	QualityName VARCHAR(50) NOT NULL,
	QualitySpecDescription VARCHAR(50) NOT NULL
	)

CREATE TABLE TEM.Textbooks(
	TextbookID INT IDENTITY(1, 1) PRIMARY KEY,
	ISBN INT NOT NULL,
	Title VARCHAR(50) NOT NULL,
	Quality_FK INT NOT NULL REFERENCES TEM.QUALITIES(QualityID),
	ListingPrice MONEY NOT NULL DEFAULT 0,
	TextbookStatus BIT NOT NULL DEFAULT 0,
	)

CREATE TABLE TEM.Exchanges(
	ExchangeID INT IDENTITY(1, 1) PRIMARY KEY,
	CustomerID_FK INT NOT NULL REFERENCES TEM.Customers(CustomerID),
	GainedTextbookID_FK INT NOT NULL REFERENCES TEM.Textbooks(TextbookID),
	LostTextbookID_FK INT NOT NULL REFERENCES TEM.Textbooks(TextbookID),
	MonetaryAddition MONEY NOT NULL,
	ExchangeDate DATETIME NOT NULL
	)

CREATE TABLE TEM.Rentals(
	RentalID INT IDENTITY(1, 1) PRIMARY KEY,
	TextbookID_FK INT NOT NULL REFERENCES TEM.Textbooks(TextbookID),
	CustomerID_FK INT NOT NULL REFERENCES TEM.Customers(CustomerID),
	StartDate DATETIME NOT NULL,
	Due DATETIME NOT NULL,
	PenaltyAmount MONEY NOT NULL DEFAULT 0,
	RentalStatus BIT NOT NULL DEFAULT 0
	)