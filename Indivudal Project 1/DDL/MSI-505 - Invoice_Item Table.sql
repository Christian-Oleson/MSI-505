USE [MSI-505]
GO

----------------------------------------------------------------------
-- Author: Christian Oleson
-- Course: MSI-505
-- Individual Project 1
----------------------------------------------------------------------
-- Create Invoice_Item Table
----------------------------------------------------------------------

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Invoice_Item](
	[InvoiceNumber] [int] NOT NULL,
	[ItemNumber] [int] NOT NULL,
	[Item] [varchar](50) NOT NULL,
	[Quantity] [int] NULL,
	[UnitPrice] [money] NULL,
 CONSTRAINT [PK_Invoice_Item] PRIMARY KEY CLUSTERED 
(
	[InvoiceNumber] ASC,
	[ItemNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Invoice_Item]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Item_Invoice_Item] FOREIGN KEY([InvoiceNumber])
REFERENCES [dbo].[Invoice] ([InvoiceNumber])
GO

ALTER TABLE [dbo].[Invoice_Item] CHECK CONSTRAINT [FK_Invoice_Item_Invoice_Item]
GO