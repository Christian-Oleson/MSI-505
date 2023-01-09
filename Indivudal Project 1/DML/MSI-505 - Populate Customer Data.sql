USE [MSI-505]
GO

----------------------------------------------------------------------
-- Author: Christian Oleson
-- Course: MSI-505
-- Individual Project 1
----------------------------------------------------------------------
-- Populate Customer Table
----------------------------------------------------------------------

SET IDENTITY_INSERT Customer ON

INSERT INTO [dbo].[Customer]
           ([CustomerID], [FirstName], [LastName], [Phone], [Email])
     VALUES (1, 'Nikki', 'Kaccaton', '723-543-1233', 'Nikki.Kaccaton@somewhere.com'),
			(2, 'Brenda', 'Catnazaro', '723-543-2344', 'Brenda.Catnazaro@somewhere.com'),
			(3, 'Bruce', 'LeCat', '723-543-3455', 'Bruce.LeCat@somewhere.com'),
			(4, 'Betsy', 'Miller', '725-654-3211', 'Betsy.Miller@somewhere.com'),
			(5, 'George', 'Miller', '723-543-1233', 'George.Miller@somewhere.com'),
			(6, 'Kathy', 'Miller', '723-543-1233', 'Kathy.Miller@somewhere.com'),
			(7, 'Betsy', 'Miller', '723-543-1233', 'Betsy.Miller@somewhere.com')
GO

SET IDENTITY_INSERT Customer OFF