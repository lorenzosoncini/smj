--
CREATE TABLE [dbo].[EnumLookup] (
  [Name] varchar(255) not null primary key,
  [Code] varchar(20) null,
  [Value] int not null,
  [ShortDescription] varchar (60),
  [Description] varchar(255)
)
GO
-- GENERAL LEDGER
CREATE TABLE [dbo].[GLAccounts] (
  [Code] varchar(20) not null primary key,
  [Name] varchar(255) not null,
  [Type] int not null,
  [Level] int not null
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


-- Data seed
INSERT INTO [dbo].[EnumLookup] ([Name], [Code], [Value], [ShortDescription], [Description])
VALUES ('GLAccountType','P-A',1,'Attivo patrimoniale','Attivo patrimoniale'),
       ('GLAccountType','P-P',2,'Passivo patrimoniale','Passivo patrimoniale'),
       ('GLAccountType','PN',3,'Patrimonio netto','Patrimonio netto'),
       ('GLAccountType','E-R',4,'Ricavi','Economico ricavi'),
       ('GLAccountType','E-C',5,'Costi','Economico costi')
