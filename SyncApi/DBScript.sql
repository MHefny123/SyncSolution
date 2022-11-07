USE [Aqua_V808]
GO
/****** Object:  Table [dbo].[Branch]    Script Date: 07/11/2022 12:37:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branch](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[ServiceRate] [decimal](18, 5) NULL,
	[Email] [nvarchar](max) NULL,
	[Country] [nvarchar](max) NOT NULL,
	[Street] [nvarchar](max) NULL,
	[State] [nvarchar](max) NULL,
	[ZipCode] [nvarchar](max) NULL,
	[Phone1] [nvarchar](max) NULL,
	[phone2] [nvarchar](max) NULL,
	[Phone3] [nvarchar](max) NULL,
	[phone4] [nvarchar](max) NULL,
	[RegistrationID] [nvarchar](max) NOT NULL,
	[Message1] [nvarchar](max) NULL,
	[Message2] [nvarchar](max) NULL,
	[Message3] [nvarchar](max) NULL,
	[Message4] [nvarchar](max) NULL,
	[Message5] [nvarchar](max) NULL,
	[Logo] [nvarchar](max) NULL,
	[AccountingDeptID] [int] NULL,
	[VATNO] [nvarchar](max) NULL,
	[DefaultCurency1ID] [int] NOT NULL,
	[DefaultCurency2ID] [int] NULL,
 CONSTRAINT [PK_Branch] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BranchItemPrice]    Script Date: 07/11/2022 12:37:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BranchItemPrice](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BranchID] [int] NOT NULL,
	[SalesItemID] [int] NOT NULL,
	[PriceModeID] [int] NOT NULL,
	[Value] [decimal](18, 5) NOT NULL,
 CONSTRAINT [PK_BranchItemPrice] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BranchItemPrinterlog]    Script Date: 07/11/2022 12:37:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BranchItemPrinterlog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BranchID] [int] NULL,
	[SalesItemID] [int] NULL,
	[PrinterLogID] [int] NULL,
	[LogOrder] [int] NULL,
 CONSTRAINT [PK_BranchItemPrinterlog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BranchPaymentAllowed]    Script Date: 07/11/2022 12:37:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BranchPaymentAllowed](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BranchID] [int] NOT NULL,
	[PaymentID] [int] NOT NULL,
 CONSTRAINT [PK_BranchPaymentAllowed] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BranchPOSConfig]    Script Date: 07/11/2022 12:37:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BranchPOSConfig](
	[ID] [uniqueidentifier] NOT NULL,
	[BranchID] [int] NOT NULL,
	[RecordID] [int] NOT NULL,
	[RecordText1] [nvarchar](max) NULL,
	[RecordText2] [nvarchar](max) NULL,
	[RecordDate] [datetime] NULL,
	[Status] [bit] NULL,
	[Discription] [nvarchar](max) NOT NULL,
	[SpareText] [nvarchar](max) NULL,
	[UIControl] [nvarchar](max) NOT NULL,
	[BranchPOSExpanderID] [int] NOT NULL,
 CONSTRAINT [PK_BranchConfig] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BranchZone]    Script Date: 07/11/2022 12:37:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BranchZone](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BranchID] [int] NOT NULL,
	[ZoneID] [int] NOT NULL,
	[DeliveryRate] [decimal](18, 5) NULL,
 CONSTRAINT [PK_BranchZone] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 07/11/2022 12:37:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BranchID] [int] NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 07/11/2022 12:37:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[ID] [uniqueidentifier] NOT NULL,
	[BranchID] [int] NOT NULL,
	[Fname] [nvarchar](max) NOT NULL,
	[Lname] [nvarchar](max) NOT NULL,
	[TitleID] [int] NULL,
	[GenderID] [int] NULL,
	[CompanyName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Mobile1] [nvarchar](max) NOT NULL,
	[Mobile2] [nvarchar](max) NULL,
	[Phone1] [nvarchar](max) NULL,
	[Phone2] [nvarchar](max) NULL,
	[Fax] [nvarchar](max) NULL,
	[CustomerGroupID] [int] NOT NULL,
	[Nationality] [nvarchar](max) NULL,
	[Code] [nvarchar](max) NULL,
	[MembershipCode] [nvarchar](max) NULL,
	[Remarks] [nvarchar](max) NULL,
	[BlackList] [bit] NULL,
	[Birthdate] [date] NULL,
	[PriceModeID] [int] NULL,
	[Picture] [nvarchar](max) NULL,
	[CardCreationDate] [date] NULL,
	[CardExpireDate] [date] NULL,
	[DisContinued] [bit] NULL,
	[DiscountFlag] [bit] NULL,
	[DiscountID] [int] NULL,
	[AccNumber] [nvarchar](max) NULL,
	[CreditLimit] [decimal](18, 5) NULL,
	[PrepaidTicket] [nvarchar](max) NULL,
	[Active] [bit] NULL,
	[IsCloud] [bit] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_AccountStatement]    Script Date: 07/11/2022 12:37:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_AccountStatement](
	[ID] [uniqueidentifier] NOT NULL,
	[BranchID] [int] NOT NULL,
	[CustomerID] [uniqueidentifier] NOT NULL,
	[POS_TempSalesID] [uniqueidentifier] NULL,
	[InvoiceNumber] [int] NOT NULL,
	[RecordDate] [datetime] NOT NULL,
	[PaymentID] [int] NOT NULL,
	[DebitAmount] [decimal](18, 5) NOT NULL,
	[CreditAmount] [decimal](18, 5) NOT NULL,
	[NewBalance] [decimal](18, 5) NOT NULL,
	[PreviousBalance] [decimal](18, 5) NOT NULL,
	[IsInvoice] [bit] NOT NULL,
 CONSTRAINT [PK_Customer_AccountStatement] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerGroup]    Script Date: 07/11/2022 12:37:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerGroup](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BranchID] [int] NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_CustomerGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerTitle]    Script Date: 07/11/2022 12:37:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerTitle](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_CustomerTitle] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerZoneAddress]    Script Date: 07/11/2022 12:37:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerZoneAddress](
	[ID] [uniqueidentifier] NOT NULL,
	[CustomerID] [uniqueidentifier] NOT NULL,
	[State] [nvarchar](max) NULL,
	[Street] [nvarchar](max) NULL,
	[Building] [nvarchar](max) NULL,
	[Floor] [int] NULL,
	[Nearby] [nvarchar](max) NULL,
	[ZipCode] [nvarchar](max) NULL,
	[ZoneID] [int] NULL,
	[Appartment] [nvarchar](max) NULL,
	[Comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_CustomerZoneAddress] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_Sales]    Script Date: 07/11/2022 12:37:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_Sales](
	[ID] [uniqueidentifier] NOT NULL,
	[CounterTypeID] [int] NOT NULL,
	[CustomerZoneAddressID] [uniqueidentifier] NULL,
	[BranchID] [int] NOT NULL,
	[InvoiceNumber] [int] NOT NULL,
	[BranchInvoiceNumber] [int] NULL,
	[OrderNumber] [int] NOT NULL,
	[OrderOpenDate] [datetime] NOT NULL,
	[CustomerNumber] [int] NULL,
	[CustomerID] [uniqueidentifier] NULL,
	[Amount] [decimal](18, 5) NOT NULL,
	[AmountTaxable] [decimal](18, 5) NOT NULL,
	[DiscoutSum] [decimal](18, 5) NOT NULL,
	[TaxExep] [bit] NULL,
	[TaxExemptionDescription] [nvarchar](max) NULL,
	[ServiceAmount] [decimal](18, 5) NOT NULL,
	[OpenByID] [int] NOT NULL,
	[CloseByID] [int] NULL,
	[OredrCloseDate] [datetime] NULL,
	[MenuID] [int] NOT NULL,
	[PriceModeID] [int] NOT NULL,
	[FunctionID] [int] NOT NULL,
	[WorkStationID] [int] NOT NULL,
	[NumberOfPrints] [int] NULL,
	[FirstPrintTime] [datetime] NULL,
	[DeliveryTime] [datetime] NULL,
	[PickedByCustomer] [bit] NULL,
	[EOD] [datetime] NULL,
	[Hold] [bit] NULL,
	[InvoiceRemark] [nvarchar](max) NULL,
	[KitchenRemark] [nvarchar](max) NULL,
	[SplitNo] [int] NULL,
	[IsVoid] [bit] NULL,
	[VoidRefrence] [uniqueidentifier] NULL,
	[ClosedByWorkStationId] [int] NULL,
 CONSTRAINT [PK_POS_Sales] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_SalesDetail]    Script Date: 07/11/2022 12:37:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_SalesDetail](
	[ID] [uniqueidentifier] NOT NULL,
	[BranchID] [int] NULL,
	[POS_SalesID] [uniqueidentifier] NOT NULL,
	[DetailID] [int] NOT NULL,
	[PriceMode] [int] NOT NULL,
	[SalesItemID] [int] NOT NULL,
	[GroupID] [int] NOT NULL,
	[DivisionID] [int] NOT NULL,
	[QTY] [decimal](18, 5) NOT NULL,
	[SalesItemMenuDiscribtion] [nvarchar](max) NOT NULL,
	[SalesItemKichenDiscribtion] [nvarchar](max) NOT NULL,
	[SalesItemDiscribtion] [nvarchar](max) NOT NULL,
	[UnitPrice] [decimal](18, 5) NOT NULL,
	[UnitPriceTaxable] [decimal](18, 5) NOT NULL,
	[TotalPrice] [decimal](18, 5) NOT NULL,
	[TotalPriceTaxable] [decimal](18, 5) NOT NULL,
	[TotalPriceAfterDiscount] [decimal](18, 5) NULL,
	[ItemRemark] [nvarchar](max) NULL,
	[WorkStationID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[IsVoid] [bit] NULL,
	[SeatNumber] [int] NULL,
	[SplitOrderCustomer] [int] NULL,
	[LinkID] [uniqueidentifier] NULL,
	[RelatedItem] [bit] NULL,
	[CourseNumber] [int] NULL,
	[Fire] [bit] NULL,
	[LinkFormula] [int] NULL,
	[PromotionPosCounterID] [int] NULL,
	[Promotion] [bit] NULL,
	[ISPrinted] [bit] NULL,
	[ISkitchenMonitored] [bit] NULL,
	[IsServed] [bit] NULL,
	[ByTime] [bit] NOT NULL,
	[CategoryID] [int] NOT NULL,
 CONSTRAINT [PK_POS_SalesDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_TempSales]    Script Date: 07/11/2022 12:37:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_TempSales](
	[ID] [uniqueidentifier] NOT NULL,
	[CounterTypeID] [int] NOT NULL,
	[CustomerZoneAddressID] [uniqueidentifier] NULL,
	[BranchID] [int] NOT NULL,
	[InvoiceNumber] [int] NOT NULL,
	[BranchInvoiceNumber] [int] NULL,
	[OrderNumber] [int] NOT NULL,
	[OrderOpenDate] [datetime] NOT NULL,
	[CustomerNumber] [int] NULL,
	[CustomerID] [uniqueidentifier] NULL,
	[Amount] [decimal](18, 5) NOT NULL,
	[AmountTaxable] [decimal](18, 5) NOT NULL,
	[DiscoutSum] [decimal](18, 5) NOT NULL,
	[TaxExep] [bit] NULL,
	[TaxExemptionDescription] [nvarchar](max) NULL,
	[ServiceAmount] [decimal](18, 5) NOT NULL,
	[OpenByID] [int] NOT NULL,
	[CloseByID] [int] NULL,
	[OredrCloseDate] [datetime] NULL,
	[MenuID] [int] NOT NULL,
	[PriceModeID] [int] NOT NULL,
	[FunctionID] [int] NOT NULL,
	[WorkStationID] [int] NOT NULL,
	[NumberOfPrints] [int] NULL,
	[FirstPrintTime] [datetime] NULL,
	[DeliveryTime] [datetime] NULL,
	[PickedByCustomer] [bit] NULL,
	[EOD] [datetime] NULL,
	[Hold] [bit] NULL,
	[InvoiceRemark] [nvarchar](max) NULL,
	[KitchenRemark] [nvarchar](max) NULL,
	[SplitNo] [int] NULL,
	[IsVoid] [bit] NULL,
	[VoidRefrence] [uniqueidentifier] NULL,
	[ClosedByWorkStationId] [int] NULL,
 CONSTRAINT [PK_POS_TempSales] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_TempSalesDetail]    Script Date: 07/11/2022 12:37:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_TempSalesDetail](
	[ID] [uniqueidentifier] NOT NULL,
	[BranchID] [int] NULL,
	[POS_TempSalesID] [uniqueidentifier] NOT NULL,
	[DetailID] [int] NOT NULL,
	[PriceMode] [int] NOT NULL,
	[SalesItemID] [int] NOT NULL,
	[GroupID] [int] NOT NULL,
	[DivisionID] [int] NOT NULL,
	[QTY] [decimal](18, 5) NOT NULL,
	[SalesItemMenuDiscribtion] [nvarchar](max) NOT NULL,
	[SalesItemKichenDiscribtion] [nvarchar](max) NOT NULL,
	[SalesItemDiscribtion] [nvarchar](max) NOT NULL,
	[UnitPrice] [decimal](18, 5) NOT NULL,
	[UnitPriceTaxable] [decimal](18, 5) NOT NULL,
	[TotalPrice] [decimal](18, 5) NOT NULL,
	[TotalPriceTaxable] [decimal](18, 5) NOT NULL,
	[TotalPriceAfterDiscount] [decimal](18, 5) NULL,
	[ItemRemark] [nvarchar](max) NULL,
	[WorkStationID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[IsVoid] [bit] NULL,
	[SeatNumber] [int] NULL,
	[SplitOrderCustomer] [int] NULL,
	[LinkID] [uniqueidentifier] NULL,
	[RelatedItem] [bit] NULL,
	[CourseNumber] [int] NULL,
	[Fire] [bit] NULL,
	[LinkFormula] [int] NULL,
	[PromotionPosCounterID] [int] NULL,
	[Promotion] [bit] NULL,
	[ISPrinted] [bit] NULL,
	[ISkitchenMonitored] [bit] NULL,
	[IsServed] [bit] NULL,
	[ByTime] [bit] NOT NULL,
	[CategoryID] [int] NOT NULL,
 CONSTRAINT [PK_POS_TempSalesDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zone]    Script Date: 07/11/2022 12:37:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zone](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CityID] [int] NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Zone] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[POS_SalesDetail] ADD  DEFAULT ((1)) FOR [CategoryID]
GO
ALTER TABLE [dbo].[POS_TempSalesDetail] ADD  DEFAULT ((1)) FOR [CategoryID]
GO
ALTER TABLE [dbo].[BranchItemPrice]  WITH CHECK ADD  CONSTRAINT [FK_BranchItemPrice_Branch] FOREIGN KEY([BranchID])
REFERENCES [dbo].[Branch] ([ID])
GO
ALTER TABLE [dbo].[BranchItemPrice] CHECK CONSTRAINT [FK_BranchItemPrice_Branch]
GO
ALTER TABLE [dbo].[BranchItemPrinterlog]  WITH CHECK ADD  CONSTRAINT [FK_BranchItemPrinterlog_Branch] FOREIGN KEY([BranchID])
REFERENCES [dbo].[Branch] ([ID])
GO
ALTER TABLE [dbo].[BranchItemPrinterlog] CHECK CONSTRAINT [FK_BranchItemPrinterlog_Branch]
GO
ALTER TABLE [dbo].[BranchPaymentAllowed]  WITH CHECK ADD  CONSTRAINT [FK_BranchPaymentAllowed_Branch] FOREIGN KEY([BranchID])
REFERENCES [dbo].[Branch] ([ID])
GO
ALTER TABLE [dbo].[BranchPaymentAllowed] CHECK CONSTRAINT [FK_BranchPaymentAllowed_Branch]
GO
ALTER TABLE [dbo].[BranchPOSConfig]  WITH CHECK ADD  CONSTRAINT [FK_BranchConfig_Branch] FOREIGN KEY([BranchID])
REFERENCES [dbo].[Branch] ([ID])
GO
ALTER TABLE [dbo].[BranchPOSConfig] CHECK CONSTRAINT [FK_BranchConfig_Branch]
GO
ALTER TABLE [dbo].[BranchZone]  WITH CHECK ADD  CONSTRAINT [FK_BranchZone_Branch] FOREIGN KEY([BranchID])
REFERENCES [dbo].[Branch] ([ID])
GO
ALTER TABLE [dbo].[BranchZone] CHECK CONSTRAINT [FK_BranchZone_Branch]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_CustomerGroup] FOREIGN KEY([CustomerGroupID])
REFERENCES [dbo].[CustomerGroup] ([ID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_CustomerGroup]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_CustomerTitle] FOREIGN KEY([TitleID])
REFERENCES [dbo].[CustomerTitle] ([ID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_CustomerTitle]
GO
ALTER TABLE [dbo].[Customer_AccountStatement]  WITH CHECK ADD  CONSTRAINT [FK_Customer_AccountStatement_Branch] FOREIGN KEY([BranchID])
REFERENCES [dbo].[Branch] ([ID])
GO
ALTER TABLE [dbo].[Customer_AccountStatement] CHECK CONSTRAINT [FK_Customer_AccountStatement_Branch]
GO
ALTER TABLE [dbo].[Customer_AccountStatement]  WITH CHECK ADD  CONSTRAINT [FK_Customer_AccountStatement_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([ID])
GO
ALTER TABLE [dbo].[Customer_AccountStatement] CHECK CONSTRAINT [FK_Customer_AccountStatement_Customer]
GO
ALTER TABLE [dbo].[CustomerZoneAddress]  WITH CHECK ADD  CONSTRAINT [FK_CustomerZoneAddress_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([ID])
GO
ALTER TABLE [dbo].[CustomerZoneAddress] CHECK CONSTRAINT [FK_CustomerZoneAddress_Customer]
GO
ALTER TABLE [dbo].[POS_Sales]  WITH CHECK ADD  CONSTRAINT [FK_POS_Sales_Branch] FOREIGN KEY([BranchID])
REFERENCES [dbo].[Branch] ([ID])
GO
ALTER TABLE [dbo].[POS_Sales] CHECK CONSTRAINT [FK_POS_Sales_Branch]
GO
ALTER TABLE [dbo].[POS_Sales]  WITH CHECK ADD  CONSTRAINT [FK_POS_Sales_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([ID])
GO
ALTER TABLE [dbo].[POS_Sales] CHECK CONSTRAINT [FK_POS_Sales_Customer]
GO
ALTER TABLE [dbo].[POS_Sales]  WITH CHECK ADD  CONSTRAINT [FK_POS_Sales_CustomerZoneAddress] FOREIGN KEY([CustomerZoneAddressID])
REFERENCES [dbo].[CustomerZoneAddress] ([ID])
GO
ALTER TABLE [dbo].[POS_Sales] CHECK CONSTRAINT [FK_POS_Sales_CustomerZoneAddress]
GO
ALTER TABLE [dbo].[POS_Sales]  WITH CHECK ADD  CONSTRAINT [FK_POS_Sales_POS_Sales] FOREIGN KEY([ID])
REFERENCES [dbo].[POS_Sales] ([ID])
GO
ALTER TABLE [dbo].[POS_Sales] CHECK CONSTRAINT [FK_POS_Sales_POS_Sales]
GO
ALTER TABLE [dbo].[POS_SalesDetail]  WITH CHECK ADD  CONSTRAINT [FK_POS_SalesDetail_POS_Sales] FOREIGN KEY([POS_SalesID])
REFERENCES [dbo].[POS_Sales] ([ID])
GO
ALTER TABLE [dbo].[POS_SalesDetail] CHECK CONSTRAINT [FK_POS_SalesDetail_POS_Sales]
GO
ALTER TABLE [dbo].[POS_SalesDetail]  WITH CHECK ADD  CONSTRAINT [FK_POS_SalesDetail_POS_SalesDetail] FOREIGN KEY([LinkID])
REFERENCES [dbo].[POS_SalesDetail] ([ID])
GO
ALTER TABLE [dbo].[POS_SalesDetail] CHECK CONSTRAINT [FK_POS_SalesDetail_POS_SalesDetail]
GO
ALTER TABLE [dbo].[POS_TempSales]  WITH CHECK ADD  CONSTRAINT [FK_POS_TempSales_Branch] FOREIGN KEY([BranchID])
REFERENCES [dbo].[Branch] ([ID])
GO
ALTER TABLE [dbo].[POS_TempSales] CHECK CONSTRAINT [FK_POS_TempSales_Branch]
GO
ALTER TABLE [dbo].[POS_TempSales]  WITH CHECK ADD  CONSTRAINT [FK_POS_TempSales_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([ID])
GO
ALTER TABLE [dbo].[POS_TempSales] CHECK CONSTRAINT [FK_POS_TempSales_Customer]
GO
ALTER TABLE [dbo].[POS_TempSales]  WITH CHECK ADD  CONSTRAINT [FK_POS_TempSales_CustomerZoneAddress] FOREIGN KEY([CustomerZoneAddressID])
REFERENCES [dbo].[CustomerZoneAddress] ([ID])
GO
ALTER TABLE [dbo].[POS_TempSales] CHECK CONSTRAINT [FK_POS_TempSales_CustomerZoneAddress]
GO
ALTER TABLE [dbo].[POS_TempSales]  WITH CHECK ADD  CONSTRAINT [FK_POS_TempSales_POS_TempSales] FOREIGN KEY([ID])
REFERENCES [dbo].[POS_TempSales] ([ID])
GO
ALTER TABLE [dbo].[POS_TempSales] CHECK CONSTRAINT [FK_POS_TempSales_POS_TempSales]
GO
ALTER TABLE [dbo].[POS_TempSalesDetail]  WITH CHECK ADD  CONSTRAINT [FK_POS_TempSalesDetail_POS_TempSales] FOREIGN KEY([POS_TempSalesID])
REFERENCES [dbo].[POS_TempSales] ([ID])
GO
ALTER TABLE [dbo].[POS_TempSalesDetail] CHECK CONSTRAINT [FK_POS_TempSalesDetail_POS_TempSales]
GO
ALTER TABLE [dbo].[POS_TempSalesDetail]  WITH CHECK ADD  CONSTRAINT [FK_POS_TempSalesDetail_POS_TempSalesDetail] FOREIGN KEY([LinkID])
REFERENCES [dbo].[POS_TempSalesDetail] ([ID])
GO
ALTER TABLE [dbo].[POS_TempSalesDetail] CHECK CONSTRAINT [FK_POS_TempSalesDetail_POS_TempSalesDetail]
GO
ALTER TABLE [dbo].[Zone]  WITH CHECK ADD  CONSTRAINT [FK_Zone_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([ID])
GO
ALTER TABLE [dbo].[Zone] CHECK CONSTRAINT [FK_Zone_City]
GO
