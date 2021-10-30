CREATE TABLE [dbo].[Table]
(
    [customerID] INT  NOT NULL IDENTITY(1, 1), 
    [customerName] NCHAR(10) NULL, 
    [address] NCHAR(10) NULL, 
    [phone] NCHAR(10) NULL, 
    [menuID] NCHAR(10) NULL, 
    CONSTRAINT [PK_Table]  PRIMARY KEY ([customerID]) 
)
