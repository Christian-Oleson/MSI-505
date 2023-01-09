USE [MSI-505]
GO

----------------------------------------------------------------------
-- Author: Christian Oleson
-- Course: MSI-505
-- Individual Project 1
----------------------------------------------------------------------
-- Marcia Wilson owns and operates Marcia’s Dry Cleaning, which is an upscale dry cleaner in a well-to-do suburban neighborhood. 
--	Marcia makes her business stand out from the competition by providing superior customer service. She wants to keep track of each of her customers and their orders. 
--	Ultimately, she wants to notify them that their clothes are ready via e-mail. To provide this service, she has developed an initial database with several tables.
-- Create a Microsoft Access 2013 database named MDC-CH02.accdb using the database schema, column characteristics, and data shown on pages 102-104 of the textbook
-- Use the database you created to test your solutions to questions A-T starting on page 102 of the textbook and report your results
-- Submit both the database you created and the results of your database test to the course site
----------------------------------------------------------------------

-- Part A: Show all data in each table
----------------------------------------------------------------------
SELECT 'Part A: Show all data in each table';
----------------------------------------------------------------------
-- Author's Note: Here I use explicit column names and full table name qualification. This is not required, but is a good syntactic start to T-SQL.
--	Explicit column names in real queries are always better than a SELECT *. There can be performance implications as well as affects as tables change, either
--		via DML or DDL. I will not fully qualify all table names, though.
	-- SELECT Query for Customer Table
	SELECT CustomerID, FirstName, LastName, Phone, Email
		FROM [MSI-505].[dbo].[Customer];

	-- SELECT Query for Invoice Table
	SELECT InvoiceNumber, CustomerNumber, DateIn, DateOut, TotalAmount
		FROM Invoice;

	-- SELECT Query for Invoice_Item table
	SELECT InvoiceNumber, ItemNumber, Item, Quantity, UnitPrice
		FROM Invoice_Item;

-- Author's Note: The semi-colon on the end of the statement is not a requirement in T-SQL. Many other DBMSes also allow the non-ANSI version of this as well.
-- Part B: List the LastName, FirstName, and Phone of all Customers
----------------------------------------------------------------------
SELECT 'Part B: List the LastName, FirstName, and Phone of all Customers';
----------------------------------------------------------------------
	SELECT LastName, FirstName, Phone
		FROM [MSI-505].[dbo].[Customer];

-- Part C: List the LastName, FirstName, and Phone for all customers with a FirstName of 'Nikki'
----------------------------------------------------------------------
SELECT 'Part C: List the LastName, FirstName, and Phone for all customers with a FirstName of ''Nikki''';
----------------------------------------------------------------------
	SELECT LastName, FirstName, Phone
		FROM [MSI-505].[dbo].[Customer]
		WHERE FirstName = 'Nikki';

-- Part D: List the LastName, FirstName, Phone, DateIn, and DateOut of all orders in excess of $100.00
----------------------------------------------------------------------
SELECT 'Part D: List the LastName, FirstName, Phone, DateIn, and DateOut of all orders in excess of $100.00';
----------------------------------------------------------------------
	SELECT LastName, FirstName, Phone, DateIn, DateOut
		FROM Customer
		JOIN Invoice
			ON CustomerID = CustomerNumber
		WHERE TotalAmount > 100.00;

-- Part E: List the LastName, FirstName, and Phone of all customers whose first name starts with 'B'
----------------------------------------------------------------------
SELECT 'Part E: List the LastName, FirstName, and Phone of all customers whose first name starts with ''B''';
----------------------------------------------------------------------
	SELECT LastName, FirstName, Phone
		FROM [MSI-505].[dbo].[Customer]
		WHERE FirstName LIKE 'B%';

-- Part F: List the LastName, FirstName, and Phone of all customers whose last name includes the characters 'cat'
----------------------------------------------------------------------
SELECT 'Part F: List the LastName, FirstName, and Phone of all customers whose last name includes the characters ''cat''';
----------------------------------------------------------------------
	SELECT LastName, FirstName, Phone
		FROM [MSI-505].[dbo].[Customer]
		WHERE LastName LIKE '%cat%';

-- Part G: List the LastName, FirstName, and Phone for all customers whose second and third numbers (from the right) of their phone number are 23
----------------------------------------------------------------------
SELECT 'Part G: List the LastName, FirstName, and Phone for all customers whose second and third numbers (from the right) of their phone number are 23';
----------------------------------------------------------------------
	SELECT LastName, FirstName, Phone
		FROM [MSI-505].[dbo].[Customer]
		WHERE Phone LIKE '%23_';

-- Part H: Determine the maximum and minumum total amount
----------------------------------------------------------------------
SELECT 'Part H: Determine the maximum and minumum total amount';
----------------------------------------------------------------------
	SELECT MAX(TotalAmount) [MaxTotalAmount], MIN(TotalAmount) [MinTotalAmount]
		FROM Invoice;

-- Part I: Determine the average Total Amount
----------------------------------------------------------------------
SELECT 'Part I: Determine the average Total Amount';
----------------------------------------------------------------------
	SELECT AVG(TotalAmount) [MaxTotalAmount]
		FROM Invoice;

-- Part J: Count the number of customers
----------------------------------------------------------------------
SELECT 'Part J: Count the number of customers';
----------------------------------------------------------------------
	SELECT COUNT(*) [CountOfCustomers]
		FROM Customer;

-- Part K: Group customers by LastName and then FirstName
----------------------------------------------------------------------
SELECT 'Part K: Group customers by LastName and then FirstName';
----------------------------------------------------------------------
	SELECT LastName, FirstName
		FROM Customer
		GROUP BY LastName, FirstName;

-- Part L: Count the number of customers having each combination of LastName and FirstName
----------------------------------------------------------------------
SELECT 'Part L: Count the number of customers having each combination of LastName and FirstName';
----------------------------------------------------------------------
	SELECT LastName, FirstName, COUNT(*) [Count Occurrence of Full Name]
		FROM Customer
		GROUP BY LastName, FirstName;

-- Part M: Show the LastName, FirstName, and Phone of all customers who have had an order with TotalAmount greater than $100.00. Use a subquery. Present the results sorted by LastName in ascending order and then FirstName in descending order
----------------------------------------------------------------------
SELECT 'Part M: Show the LastName, FirstName, and Phone of all customers who have had an order with TotalAmount greater than $100.00. Use a subquery. Present the results sorted by LastName in ascending order and then FirstName in descending order';
----------------------------------------------------------------------
	SELECT LastName, FirstName, Phone
		FROM Customer [C]
		WHERE C.CustomerID IN (
			SELECT CustomerNumber	
				FROM Invoice
				WHERE TotalAmount > 100.00
		)
		ORDER BY LastName ASC, FirstName DESC;

-- Part N: Show the LastName, FirstName, and Phone of all customers who have had an order with TotalAmount greater than $100. Use a join, but do not use JOIN ON syntax. Present results sorted by LastName in ascending order and then FirstName in descending order
----------------------------------------------------------------------
SELECT 'Part N: Show the LastName, FirstName, and Phone of all customers who have had an order with TotalAmount greater than $100. Use a join, but do not use JOIN ON syntax. Present results sorted by LastName in ascending order and then FirstName in descending order';
----------------------------------------------------------------------
	SELECT LastName, FirstName, Phone
		FROM Customer [C], Invoice [I]
		WHERE TotalAmount > 100.00
			AND C.CustomerID = I.CustomerNumber
		ORDER BY LastName ASC, FirstName DESC

-- Part O: Show the LastName, FirstName, and Phone of all customers who have had an order with TotalAmount greater than $100. Use a join using JOIN ON syntax. present results sorted by LastName in ascedning order and then FirstName in descenging order
----------------------------------------------------------------------
SELECT 'Part O: Show the LastName, FirstName, and Phone of all customers who have had an order with TotalAmount greater than $100. Use a join using JOIN ON syntax. present results sorted by LastName in ascedning order and then FirstName in descenging order';
----------------------------------------------------------------------
	SELECT LastName, FirstName, Phone
		FROM Customer [C]
		JOIN Invoice [I]
			ON C.CustomerID = I.CustomerNumber
		WHERE TotalAmount > 100.00
		ORDER BY LastName ASC, FirstName DESC;

-- Part P: Show the LastName, FirstName, and Phone of all customers who have had an order with an Item named 'Dress Shirt'. Use a subquery. Present results sorted by LastName in ascending order and then FirstName in descending order
----------------------------------------------------------------------
SELECT 'Part P: Show the LastName, FirstName, and Phone of all customers who have had an order with an Item named ''Dress Shirt''. Use a subquery. Present results sorted by LastName in ascending order and then FirstName in descending order';
----------------------------------------------------------------------
WITH InvoiceItemCTE AS (
	SELECT CustomerNumber
		FROM Invoice
		WHERE InvoiceNumber IN (
			SELECT InvoiceNumber
				FROM Invoice_Item
				WHERE Item = 'Dress Shirt'
		)
)

	SELECT LastName, FirstName, Phone
		FROM Customer [C]
		WHERE C.CustomerID IN (
			SELECT CustomerNumber
				FROM InvoiceItemCTE
			)
		ORDER BY LastName ASC, FirstName DESC;

-- Part Q: Show the LastName, FirstName, and Phone of all customers who have had an order with an Item named 'Dress Shirt'. Use a join, but do not use JOIN ON syntax. Present results sorted by LastName in ascending order and then FirstName in descending order.
----------------------------------------------------------------------
SELECT 'Part Q: Show the LastName, FirstName, and Phone of all customers who have had an order with an Item named ''Dress Shirt''. Use a join, but do not use JOIN ON syntax. Present results sorted by LastName in ascending order and then FirstName in descending order.';
----------------------------------------------------------------------
	SELECT LastName, FirstName, Phone
		FROM Customer [C], Invoice [I], Invoice_Item [II]
		WHERE C.CustomerID = I.CustomerNumber
			AND I.InvoiceNumber = II.InvoiceNumber
			AND II.Item = 'Dress Shirt'
		ORDER BY LastName ASC, FirstName DESC;

-- Part R: Show the LastName, FirstName, and Phone of all customers who have had an order with an item named 'Dress Shirt'. Use a join using JOIN ON syntax. Present results sorted by LastName in ascending order and then FirstName in descending order
----------------------------------------------------------------------
SELECT 'Part R: Show the LastName, FirstName, and Phone of all customers who have had an order with an item named ''Dress Shirt''. Use a join using JOIN ON syntax. Present results sorted by LastName in ascending order and then FirstName in descending order';
----------------------------------------------------------------------
	SELECT LastName, FirstName, Phone
		FROM Customer [C]
		JOIN Invoice [I]
			ON C.CustomerID = I.CustomerNumber
		JOIN Invoice_Item [II]
			ON I.InvoiceNumber = II.InvoiceNumber
		WHERE II.Item = 'Dress Shirt'
		ORDER BY LastName ASC, FirstName DESC;

-- Part S: Show the LastName, FirstName, Phone, and TotalAmount of all customers who have had an order with an Item named 'Dress Shirt'. Use a comdination of a join and a subquery. Present results sorted by LastName in ascending order and then FirstName in descending order
----------------------------------------------------------------------
SELECT 'Part S: Show the LastName, FirstName, Phone, and TotalAmount of all customers who have had an order with an Item named ''Dress Shirt''. Use a comdination of a join and a subquery. Present results sorted by LastName in ascending order and then FirstName in descending order';
----------------------------------------------------------------------
	SELECT LastName, FirstName, Phone, TotalAmount
		FROM Customer [C], Invoice [I]
		WHERE C.CustomerID = I.CustomerNumber
			AND InvoiceNumber IN (
				SELECT InvoiceNumber
					FROM Invoice_Item
					WHERE Item = 'Dress Shirt'
			)
		ORDER BY LastName ASC, FirstName DESC;

-- Part T: Show the LastName, FirstName, Phone, and TotalAmount of all customers who have had an order with an Item named 'Dress Shirt'. Also show the LastName, FirstName, and Phone of all other customers. Present results sorted by LastName in ascending order, and then FirstName in descending order
----------------------------------------------------------------------
SELECT 'Part T: Show the LastName, FirstName, Phone, and TotalAmount of all customers who have had an order with an Item named ''Dress Shirt''. Also show the LastName, FirstName, and Phone of all other customers. Present results sorted by LastName in ascending order, and then FirstName in descending order';
----------------------------------------------------------------------
	WITH DressShirtCTE AS (
		SELECT LastName, FirstName, Phone, TotalAmount, CustomerID
			FROM Customer [C]
			JOIN Invoice [I]
				ON C.CustomerID = I.CustomerNumber
			JOIN Invoice_Item [II]
				ON I.InvoiceNumber = II.InvoiceNumber
			WHERE II.Item = 'Dress Shirt'
	)

	SELECT LastName, FirstName, Phone, TotalAmount
		FROM DressShirtCTE
	UNION
	SELECT LastName, FirstName, Phone, NULL
		FROM Customer [C]
		JOIN Invoice [I]
			ON C.CustomerID = I.CustomerNumber
		WHERE CustomerID NOT IN (
			SELECT CustomerID
				FROM DressShirtCTE
			)
		ORDER BY LastName ASC, FirstName DESC;