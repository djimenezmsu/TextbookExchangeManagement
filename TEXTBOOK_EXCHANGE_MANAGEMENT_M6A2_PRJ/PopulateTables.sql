-- Textbook Exchange Management --
GO
	USE VR_jholder7 -- REPLACE WITH PERSONAL DB

GO

	INSERT INTO TEM.RentalPeriods VALUES
		(30, '30 Day Rental', 50),
		(115, 'Semester Rental', 100),
		(365, 'Year Rental', 180),
		(60, 'Grad Semester Rental', 65)
	
	INSERT INTO TEM.Textbooks VALUES
		('103-23-63982-34-9', 'Intro To Data Structures', 'A simple introduction to data structures.', 130, 100),
		('123-53-12232-81-3', 'Intro To Calc 1', 'Introductive text to Calculus,', 240, 100),
		('133-22-56386-44-7', 'World Liturature 5th Edition', 'Compilation of early world text.', 430, 100),
		('678-36-22314-74-4', 'STATS: Data and Models', 'Essential text on data and models related to stats.', 50, 100),
		('103-93-09562-87-2', 'Cosmic Perspective', 'Desc unlisted', 234, 100),
		('143-12-78952-43-9', 'Essential SQL', 'Learn SQL.', 190.99, 100),
		('403-63-56724-43-9', 'Programming Languages', 'Desc unlisted.', 180, 100)

	INSERT INTO TEM.Customers VALUES
		('Justin', 'L', 'Holder', '12702446368', '1400 Main St', 'Murray', 'KY', '42071', 'US'),
		('John', 'H', 'Carter', '12702444365', '1500 South St', 'Murray', 'KY', '42071', 'US')

GO

	INSERT INTO TEM.Courses VALUES
		('MAT 250-01', 'John Smith', 2),
		('CIS 407-01', 'Victor Raj', 6),
		('CSC 325-01', 'Marcum Scum', 1)

	INSERT INTO TEM.Rentals VALUES
		(1, 1, DEFAULT, 1, 0, 'Active'),
		(4, 2, DEFAULT, 2, 25, 'Closed')