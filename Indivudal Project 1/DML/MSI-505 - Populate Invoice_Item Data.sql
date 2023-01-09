USE [MSI-505]
GO

----------------------------------------------------------------------
-- Author: Christian Oleson
-- Course: MSI-505
-- Individual Project 1
----------------------------------------------------------------------
-- Populate Invoice_Item Table
-----------------

INSERT INTO [dbo].[Invoice_Item]
           ([InvoiceNumber], [ItemNumber], [Item], [Quantity], [UnitPrice])
     VALUES
           (2013001, 1, 'Blouse', 2, 3.50),
           (2013001, 2, 'Dress Shirt', 5, 2.50),
           (2013001, 3, 'Formal Gowwn', 2, 10.00),
           (2013001, 4, 'Slacks-Mens', 10, 5.00),
           (2013001, 5, 'Slacks-Womens', 10, 6.00),
           (2013001, 6, 'Suit-Mens', 1, 9.00),
           (2013002, 1, 'Dress Shirt', 10, 2.50),
           (2013003, 1, 'Slacks-Mens', 5, 5.00),
           (2013003, 2, 'Slacks-Womens', 4, 6.00),
           (2013004, 1, 'Dress Shirt', 7, 2.50),
           (2013005, 1, 'Blouse', 2, 3.50),
           (2013005, 2, 'Dress Shirt', 2, 2.50),
           (2013006, 1, 'Blouse', 5, 3.50),
           (2013006, 2, 'Dress Shirt', 10, 2.50),
           (2013006, 3, 'Slacks-Mens', 10, 5.00),
           (2013006, 4, 'Slacks-Womens', 10, 6.00),
           (2013007, 1, 'Blouse', 2, 3.50),
           (2013008, 1, 'Blouse', 3, 3.50),
           (2013008, 2, 'Dress Shirt', 12, 2.50),
           (2013008, 3, 'Slacks-Mens', 8, 5.00),
           (2013008, 4, 'Slacks-Womens', 10, 6.00),
           (2013009, 1, 'Suit-Mens', 3, 9.00)
GO
