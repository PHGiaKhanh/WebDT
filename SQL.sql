use fptshop1;
CREATE TABLE [dbo].[Category] (  
    [CatID]				INT   IDENTITY (1, 1) NOT NULL,
    [NameCate]			NVARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([CatID] ASC)
);
--Bang Supplier
CREATE TABLE [dbo].[Supplier]
(
    [SupID]				INT IDENTITY (1, 1) NOT NULL,
    [SupName]			NVARCHAR(MAX) NOT NULL, 
    [Address]			NVARCHAR(MAX) NOT NULL,
    PRIMARY KEY CLUSTERED ([SupID] ASC)
)
--Bang Color
CREATE TABLE [dbo].[Color]
(
    [ColorID]			INT IDENTITY (1, 1) NOT NULL,
    [ColorName]			NVARCHAR(MAX) NOT NULL, 
    [RGB]				NCHAR(10) NOT NULL,
    PRIMARY KEY CLUSTERED ([ColorID] ASC)
)
--Bang Product
CREATE TABLE [dbo].[Product] (
    [ProID]				INT  IDENTITY (1, 1) NOT NULL,
    [ProName]			NVARCHAR (MAX)  NULL,
    [CatID]				int not NULL,
    [ProImage]			NVARCHAR (MAX)  NULL,
	[NameDecription]	NVARCHAR (MAX)  NULL,
	[CreatedDate]		DATE NOT NULL,
    PRIMARY KEY CLUSTERED ([ProID] ASC),
    CONSTRAINT [FK_Pro_Category] FOREIGN KEY ([CatID]) REFERENCES [dbo].[Category] ([CatID])
);
CREATE TABLE [dbo].[ProDetail] (
    [ProDeID]			INT IDENTITY (1, 1) NOT NULL,
    [ProID]				INT NOT NULL,
    [SupID]				INT NOT NULL,
	[ColorID]			INT NOT NULL,
	[Price]				FLOAT (53) NOT NULL,
	[RemainQuantity]	INT NOT NULL,
	[SoldQuantity]		INT NULL DEFAULT 0,
	[ViewQuantity]		INT NULL DEFAULT 0,
    PRIMARY KEY CLUSTERED ([ProDeID] ASC),
    FOREIGN KEY ([ProID]) REFERENCES [dbo].[Product] ([ProID]) ON DELETE CASCADE,
    FOREIGN KEY ([SupID]) REFERENCES [dbo].[Supplier] ([SupID]) ON DELETE CASCADE,
	FOREIGN KEY ([ColorID]) REFERENCES [dbo].[Color] ([ColorID]) ON DELETE CASCADE
)
-- Bang AdminUser
CREATE TABLE [dbo].[AdminUser] (
    [Username]			NVARCHAR (50) PRIMARY KEY NOT NULL,
    [Password]			NVARCHAR (50)     NOT NULL,
	[Role]				NVARCHAR (50) NOT NULL--,
);
--Bang Customer
CREATE TABLE [dbo].[Customer] (
	[CusPhone]			NVARCHAR (15) PRIMARY KEY NOT NULL,
	[CusPassword]		NVARCHAR(50) NOT NULL,
	[CusName]			NVARCHAR (MAX) NULL,
    [CusEmail]			NVARCHAR (MAX) NULL,
);
--Bang Order
CREATE TABLE [dbo].[Order] (
    [OrderID]			INT            IDENTITY (1, 1) NOT NULL,
    [OrderDate]			DATE           NULL,
	[CusPhone]			NVARCHAR (15) NOT NULL,
    [AddressDeliverry]	NVARCHAR (MAX) NULL,
	[TotalValue]		FLOAT (53) NULL,
    PRIMARY KEY CLUSTERED ([OrderID] ASC),
    FOREIGN KEY ([CusPhone]) REFERENCES [dbo].[Customer] ([CusPhone])
);
--Bang OrderDetail
CREATE TABLE [dbo].[OrderDetail] (
    [OrderDetailID]		INT        IDENTITY (1, 1) NOT NULL,
    [ProSupID]			INT        NULL,
    [OrderID]			INT        NULL,
    [Quantity]			INT        NULL,
    [UnitPrice]			FLOAT (53) NULL,
    PRIMARY KEY CLUSTERED ([OrderDetailID] ASC),
    FOREIGN KEY ([ProSupID]) REFERENCES [dbo].[ProDetail] ([ProDeID]),
    FOREIGN KEY ([OrderID]) REFERENCES [dbo].[Order] ([OrderID])
);

use fptshop1

INSERT INTO Supplier (SupName, Address)
VALUES ('Samsung Store', 'Số 76 Thái Hà, phường Trung Liệt, quận Đống Đa, thành phố Hà Nội, Việt Nam');
INSERT INTO Supplier (SupName, Address)
VALUES ('Apple Store', '261 - 263 Khánh Hội, P2, Q4, TP. Hồ Chí Minh');
INSERT INTO Supplier (SupName, Address)
VALUES ('CellphoneS', '203 CMT8, P7, Q3, TP. Hồ Chí Minh');

-- them vao bang Category
INSERT INTO Category ([NameCate]) VALUES ('IPhone');
INSERT INTO Category ([NameCate]) VALUES ('Samsung');
INSERT INTO Category ([NameCate]) VALUES ('Asus');
INSERT INTO Category ([NameCate]) VALUES ('Realme');

--them vao bang Color
INSERT INTO [dbo].[Color]  ([ColorName],[RGB]) VALUES ('Dark Red', '#441717');
INSERT INTO [dbo].[Color]  ([ColorName],[RGB]) VALUES ('Green', '#207e4d');
INSERT INTO [dbo].[Color]  ([ColorName],[RGB]) VALUES ('Yellow', '#cbe40c');
INSERT INTO [dbo].[Color]  ([ColorName],[RGB]) VALUES ('Red', '#df0707');

-- them vao bang Customer
INSERT INTO [dbo].[Customer] ([CusPhone],[CusPassword],[CusName],[CusEmail])
     VALUES('0956123432','12345','Nguyễn Văn A','nva@gmail.com');
INSERT INTO [dbo].[Customer] ([CusPhone],[CusPassword],[CusName],[CusEmail])
     VALUES('0956123323','123abc','Nguyễn Văn B','nvb@gmail.com');
INSERT INTO [dbo].[Customer] ([CusPhone],[CusPassword],[CusName],[CusEmail])
     VALUES('0976123462','12345','Lê Thị C','ltc@gmail.com');
INSERT INTO [dbo].[Customer] ([CusPhone],[CusPassword],[CusName],[CusEmail])
     VALUES('0978673439','abc123','Mai Thị Lựu','mtl@gmail.com');

-- bang Product
INSERT INTO [dbo].[Product] ([ProName],[CatID],[ProImage],[NameDecription],[CreatedDate])
     VALUES('iPhone15',1,'iPhone15',
	 'Màn hình 5.1inc, cảm ứng vân tay. Hiệu suất mạnh mẽ, phiên bản giới hạn. 03 camera trước sau, chụp hình sắc nét',CONVERT(date, '17/09/2023', 105));
INSERT INTO [dbo].[Product] ([ProName],[CatID],[ProImage],[NameDecription],[CreatedDate])
     VALUES('iPhone15 Pro',1,'iPhone15pro',
	 'Màn hình 5.3inc, cảm ứng vân tay. Hiệu suất mạnh mẽ, phiên bản giới hạn. 03 camera trước sau, chụp hình sắc nét',CONVERT(date, '17/09/2023', 105));
INSERT INTO [dbo].[Product] ([ProName],[CatID],[ProImage],[NameDecription],[CreatedDate])
     VALUES('iPhone15 Promax',1,'iPhone15promax',
	 'Màn hình 5.6inc, cảm ứng vân tay. Hiệu suất mạnh mẽ, phiên bản giới hạn. 03 camera trước sau, chụp hình sắc nét',CONVERT(date, '17/09/2023', 105));

-- bang ProDetail
INSERT INTO [dbo].[ProDetail] ([ProID],[SupID],[ColorID],[Price],[RemainQuantity],[SoldQuantity],[ViewQuantity])
     VALUES(1,1,3,99.9,23,100,1500);
INSERT INTO [dbo].[ProDetail] ([ProID],[SupID],[ColorID],[Price],[RemainQuantity],[SoldQuantity],[ViewQuantity])
     VALUES(1,2,4,99.75,35,70,5000);
INSERT INTO [dbo].[ProDetail] ([ProID],[SupID],[ColorID],[Price],[RemainQuantity],[SoldQuantity],[ViewQuantity])
     VALUES(2,3,2,99.8,35,70,5000);

-- bang Order
INSERT INTO [dbo].[Order] ([OrderDate],[CusPhone],[AddressDeliverry],[TotalValue])
     VALUES(CONVERT(date, '20/09/2023', 105) ,'0956123432', '282 Sư Vạn Hạnh, P12, Q10, tpHCM',299.55);
INSERT INTO [dbo].[Order] ([OrderDate],[CusPhone],[AddressDeliverry],[TotalValue])
     VALUES(CONVERT(date, '23/09/2023', 105) ,'0976123462', '512 CMT8, P11, Q10, tpHCM',299.55);
-- bảng Order Detail
INSERT INTO [dbo].[OrderDetail] ([ProSupID] ,[OrderID],[Quantity] ,[UnitPrice])
     VALUES(1,1,2,99.9);
INSERT INTO [dbo].[OrderDetail] ([ProSupID] ,[OrderID],[Quantity] ,[UnitPrice])
     VALUES(2,1,1,99.75);
INSERT INTO [dbo].[OrderDetail] ([ProSupID] ,[OrderID],[Quantity] ,[UnitPrice])
     VALUES(3,2,1,99.8);
INSERT INTO [dbo].[OrderDetail] ([ProSupID] ,[OrderID],[Quantity] ,[UnitPrice])
     VALUES(2,2,1,99.75)
