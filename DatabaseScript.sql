-- GENERAL LEDGER
--
CREATE TABLE [dbo].[GLAccounts] (
  [Code] varchar(20) not null primary key
)
GO
CREATE TABLE [dbo].[GLTransactions] (
  [GLTransactionId] int not null identity(1,1) primary key
)
GO
CREATE TABLE [dbo].[GLTransactionLines] (
  [GLTransactionLineId] int not null identity(1,1) primary key,
  [GLTransactionId] int not null
)
GO
ALTER TABLE [dbo].[GLTransactionLines]  WITH CHECK ADD  CONSTRAINT [FK_GLTransactions_GLTransactionLines] FOREIGN KEY([GLTransactionId])
REFERENCES [dbo].[GLTransactions] ([GLTransactionId])
GO

ALTER TABLE [dbo].[GLTransactionLines] CHECK CONSTRAINT [FK_GLTransactions_GLTransactionLines]
GO
