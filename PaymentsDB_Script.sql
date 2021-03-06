USE [master]
GO
/****** Object:  Database [PaymentsDB]    Script Date: 6/10/2022 6:41:19 PM ******/
CREATE DATABASE [PaymentsDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PaymentsDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PaymentsDB.mdf' , SIZE = 40960KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PaymentsDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PaymentsDB_log.ldf' , SIZE = 20480KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PaymentsDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PaymentsDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PaymentsDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PaymentsDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PaymentsDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PaymentsDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PaymentsDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [PaymentsDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PaymentsDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PaymentsDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PaymentsDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PaymentsDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PaymentsDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PaymentsDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PaymentsDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PaymentsDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PaymentsDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PaymentsDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PaymentsDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PaymentsDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PaymentsDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PaymentsDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PaymentsDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PaymentsDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PaymentsDB] SET RECOVERY FULL 
GO
ALTER DATABASE [PaymentsDB] SET  MULTI_USER 
GO
ALTER DATABASE [PaymentsDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PaymentsDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PaymentsDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PaymentsDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PaymentsDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PaymentsDB', N'ON'
GO
ALTER DATABASE [PaymentsDB] SET QUERY_STORE = OFF
GO
USE [PaymentsDB]
GO
/****** Object:  Table [dbo].[CategoryTax]    Script Date: 6/10/2022 6:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryTax](
	[CategoryTaxID] [int] IDENTITY(1,1) NOT NULL,
	[PaymentCategoryID] [int] NULL,
	[TaxID] [int] NULL,
 CONSTRAINT [PK_CategoryTax] PRIMARY KEY CLUSTERED 
(
	[CategoryTaxID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvoiceItem]    Script Date: 6/10/2022 6:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceItem](
	[InvoiceItemID] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceID] [int] NULL,
 CONSTRAINT [PK_InvoiceItem] PRIMARY KEY CLUSTERED 
(
	[InvoiceItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentCategory]    Script Date: 6/10/2022 6:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentCategory](
	[PaymentCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryType] [varchar](100) NULL,
	[CategoryDescription] [varchar](200) NULL,
 CONSTRAINT [PK_PaymentCategory] PRIMARY KEY CLUSTERED 
(
	[PaymentCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentInvoice]    Script Date: 6/10/2022 6:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentInvoice](
	[InvoiceID] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceNo] [varchar](50) NULL,
	[InvoiceDate] [date] NULL,
	[PaymentCategoryID] [int] NULL,
	[Beneficiary] [varchar](200) NULL,
	[InitiatedBy] [varchar](max) NULL,
	[Requestee] [varchar](max) NULL,
	[RequestedDate] [date] NULL,
	[InvoiceDescription] [varchar](max) NULL,
	[InvoiceAmt] [numeric](18, 2) NULL,
 CONSTRAINT [PK_PaymentInvoice] PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentInvoiceDoc]    Script Date: 6/10/2022 6:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentInvoiceDoc](
	[InvoiceDocID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_PaymentInvoiceDoc] PRIMARY KEY CLUSTERED 
(
	[InvoiceDocID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaxDictionary]    Script Date: 6/10/2022 6:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaxDictionary](
	[TaxID] [int] IDENTITY(1,1) NOT NULL,
	[TaxName] [varchar](50) NULL,
	[TaxDescription] [varchar](200) NULL,
	[TaxRate] [numeric](9, 2) NULL,
 CONSTRAINT [PK_TaxDictionary] PRIMARY KEY CLUSTERED 
(
	[TaxID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CategoryTax]  WITH CHECK ADD  CONSTRAINT [FK_CategoryTax_PaymentCategory] FOREIGN KEY([PaymentCategoryID])
REFERENCES [dbo].[PaymentCategory] ([PaymentCategoryID])
GO
ALTER TABLE [dbo].[CategoryTax] CHECK CONSTRAINT [FK_CategoryTax_PaymentCategory]
GO
ALTER TABLE [dbo].[CategoryTax]  WITH CHECK ADD  CONSTRAINT [FK_CategoryTax_TaxDictionary] FOREIGN KEY([TaxID])
REFERENCES [dbo].[TaxDictionary] ([TaxID])
GO
ALTER TABLE [dbo].[CategoryTax] CHECK CONSTRAINT [FK_CategoryTax_TaxDictionary]
GO
ALTER TABLE [dbo].[PaymentInvoice]  WITH CHECK ADD  CONSTRAINT [FK_PaymentInvoice_PaymentCategory] FOREIGN KEY([PaymentCategoryID])
REFERENCES [dbo].[PaymentCategory] ([PaymentCategoryID])
GO
ALTER TABLE [dbo].[PaymentInvoice] CHECK CONSTRAINT [FK_PaymentInvoice_PaymentCategory]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'primary key' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PaymentInvoice', @level2type=N'COLUMN',@level2name=N'InvoiceID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'invoice number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PaymentInvoice', @level2type=N'COLUMN',@level2name=N'InvoiceNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'date of invoicing' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PaymentInvoice', @level2type=N'COLUMN',@level2name=N'InvoiceDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'category of payment (services, contract, etc)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PaymentInvoice', @level2type=N'COLUMN',@level2name=N'PaymentCategoryID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the customer or person being paid or BENEFITTING' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PaymentInvoice', @level2type=N'COLUMN',@level2name=N'Beneficiary'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'if the invoice is generated via API, this equates to the user initiating the request from the other system' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PaymentInvoice', @level2type=N'COLUMN',@level2name=N'InitiatedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the payment officer approving this request (from the payment system)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PaymentInvoice', @level2type=N'COLUMN',@level2name=N'Requestee'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the description of the invoice or PURPOSE' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PaymentInvoice', @level2type=N'COLUMN',@level2name=N'InvoiceDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the total amount of the invoice (tax inclusive)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PaymentInvoice', @level2type=N'COLUMN',@level2name=N'InvoiceAmt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the ID of the tax..auto incremented' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TaxDictionary', @level2type=N'COLUMN',@level2name=N'TaxID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the name of the tax (eg VAT, NHIL, etc)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TaxDictionary', @level2type=N'COLUMN',@level2name=N'TaxName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'a longer description of the tax' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TaxDictionary', @level2type=N'COLUMN',@level2name=N'TaxDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the rate to apply to the amount payable' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TaxDictionary', @level2type=N'COLUMN',@level2name=N'TaxRate'
GO
USE [master]
GO
ALTER DATABASE [PaymentsDB] SET  READ_WRITE 
GO
