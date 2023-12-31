USE [master]
GO
/****** Object:  Database [RentVideoSystem]    Script Date: 12/27/2023 11:59:14 PM ******/
CREATE DATABASE [RentVideoSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RentVideoSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\RentVideoSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RentVideoSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\RentVideoSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [RentVideoSystem] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RentVideoSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RentVideoSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RentVideoSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RentVideoSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RentVideoSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RentVideoSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [RentVideoSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RentVideoSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RentVideoSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RentVideoSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RentVideoSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RentVideoSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RentVideoSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RentVideoSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RentVideoSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RentVideoSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RentVideoSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RentVideoSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RentVideoSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RentVideoSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RentVideoSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RentVideoSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RentVideoSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RentVideoSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [RentVideoSystem] SET  MULTI_USER 
GO
ALTER DATABASE [RentVideoSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RentVideoSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RentVideoSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RentVideoSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RentVideoSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RentVideoSystem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'RentVideoSystem', N'ON'
GO
ALTER DATABASE [RentVideoSystem] SET QUERY_STORE = ON
GO
ALTER DATABASE [RentVideoSystem] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [RentVideoSystem]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 12/27/2023 11:59:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[ID] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[DOB] [date] NULL,
	[Phone] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[DateCreated] [date] NULL,
	[StatusRent] [bit] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetailTransaction]    Script Date: 12/27/2023 11:59:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailTransaction](
	[IDRent] [int] NOT NULL,
	[IDVid] [nvarchar](50) NOT NULL,
	[Amount] [int] NULL,
	[RentalFee] [int] NULL,
 CONSTRAINT [PK_DetailTransaction] PRIMARY KEY CLUSTERED 
(
	[IDRent] ASC,
	[IDVid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RentalTransaction]    Script Date: 12/27/2023 11:59:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RentalTransaction](
	[IDRent] [int] IDENTITY(1,1) NOT NULL,
	[DateOfBorrow] [date] NULL,
	[DateOfReturn] [date] NULL,
	[TotalPrice] [int] NULL,
	[ID] [nvarchar](50) NULL,
 CONSTRAINT [PK_RentalTransaction] PRIMARY KEY CLUSTERED 
(
	[IDRent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Video]    Script Date: 12/27/2023 11:59:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Video](
	[ID] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL,
	[Author] [nvarchar](50) NULL,
	[YearOfRelease] [nvarchar](50) NULL,
	[Amount] [int] NULL,
	[PriceOfDay] [int] NULL,
 CONSTRAINT [PK_Video] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Customers] ([ID], [Name], [DOB], [Phone], [Address], [DateCreated], [StatusRent], [IsActive]) VALUES (N'2011061154', N'Toan', CAST(N'2002-09-22' AS Date), N'0985876967', N'BH', CAST(N'2023-12-22' AS Date), 0, 1)
INSERT [dbo].[Customers] ([ID], [Name], [DOB], [Phone], [Address], [DateCreated], [StatusRent], [IsActive]) VALUES (N'2011063378', N'Gia', CAST(N'2002-12-07' AS Date), N'09000101', N'VT', CAST(N'2023-10-20' AS Date), 0, 1)
INSERT [dbo].[Customers] ([ID], [Name], [DOB], [Phone], [Address], [DateCreated], [StatusRent], [IsActive]) VALUES (N'2011064187
', N'Danh', CAST(N'2002-10-20' AS Date), N'090010202', N'BD', CAST(N'2023-07-03' AS Date), 0, 1)
GO
SET IDENTITY_INSERT [dbo].[RentalTransaction] ON 

INSERT [dbo].[RentalTransaction] ([IDRent], [DateOfBorrow], [DateOfReturn], [TotalPrice], [ID]) VALUES (1, CAST(N'2023-12-01' AS Date), CAST(N'2023-12-06' AS Date), 500, N'2011061154')
SET IDENTITY_INSERT [dbo].[RentalTransaction] OFF
GO
INSERT [dbo].[Video] ([ID], [Name], [Type], [Author], [YearOfRelease], [Amount], [PriceOfDay]) VALUES (N'123', N'Titanic', N'
Romantic', N'James Cameron', N'1997', 1, 3000)
INSERT [dbo].[Video] ([ID], [Name], [Type], [Author], [YearOfRelease], [Amount], [PriceOfDay]) VALUES (N'2345', N'Romeo and Julier', N'Romantic', N'Baz Luhrmann', N'1996', 5, 9000)
GO
ALTER TABLE [dbo].[DetailTransaction]  WITH CHECK ADD  CONSTRAINT [FK_DetailTransaction_RentalTransaction] FOREIGN KEY([IDRent])
REFERENCES [dbo].[RentalTransaction] ([IDRent])
GO
ALTER TABLE [dbo].[DetailTransaction] CHECK CONSTRAINT [FK_DetailTransaction_RentalTransaction]
GO
ALTER TABLE [dbo].[DetailTransaction]  WITH CHECK ADD  CONSTRAINT [FK_DetailTransaction_Video] FOREIGN KEY([IDVid])
REFERENCES [dbo].[Video] ([ID])
GO
ALTER TABLE [dbo].[DetailTransaction] CHECK CONSTRAINT [FK_DetailTransaction_Video]
GO
ALTER TABLE [dbo].[RentalTransaction]  WITH CHECK ADD  CONSTRAINT [FK_RentalTransaction_Customers] FOREIGN KEY([ID])
REFERENCES [dbo].[Customers] ([ID])
GO
ALTER TABLE [dbo].[RentalTransaction] CHECK CONSTRAINT [FK_RentalTransaction_Customers]
GO
USE [master]
GO
ALTER DATABASE [RentVideoSystem] SET  READ_WRITE 
GO
