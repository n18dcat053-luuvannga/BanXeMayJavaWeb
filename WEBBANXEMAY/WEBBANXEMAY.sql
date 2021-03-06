USE [master]
GO
/****** Object:  Database [WEBBANXEMAY]    Script Date: 7/12/2019 2:11:00 PM ******/
CREATE DATABASE [WEBBANXEMAY]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WEBBANXEMAY', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.DUY\MSSQL\DATA\WEBBANXEMAY.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WEBBANXEMAY_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.DUY\MSSQL\DATA\WEBBANXEMAY_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WEBBANXEMAY] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WEBBANXEMAY].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WEBBANXEMAY] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WEBBANXEMAY] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WEBBANXEMAY] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WEBBANXEMAY] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WEBBANXEMAY] SET ARITHABORT OFF 
GO
ALTER DATABASE [WEBBANXEMAY] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WEBBANXEMAY] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [WEBBANXEMAY] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WEBBANXEMAY] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WEBBANXEMAY] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WEBBANXEMAY] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WEBBANXEMAY] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WEBBANXEMAY] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WEBBANXEMAY] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WEBBANXEMAY] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WEBBANXEMAY] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WEBBANXEMAY] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WEBBANXEMAY] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WEBBANXEMAY] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WEBBANXEMAY] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WEBBANXEMAY] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WEBBANXEMAY] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WEBBANXEMAY] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WEBBANXEMAY] SET RECOVERY FULL 
GO
ALTER DATABASE [WEBBANXEMAY] SET  MULTI_USER 
GO
ALTER DATABASE [WEBBANXEMAY] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WEBBANXEMAY] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WEBBANXEMAY] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WEBBANXEMAY] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'WEBBANXEMAY', N'ON'
GO
USE [WEBBANXEMAY]
GO
/****** Object:  Table [dbo].[Advertisements]    Script Date: 7/12/2019 2:11:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Advertisements](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Advertisements] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Brands]    Script Date: 7/12/2019 2:11:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[Id] [nvarchar](5) NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
	[Logo] [nvarchar](50) NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 7/12/2019 2:11:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[IdOrder] [int] IDENTITY(1,1) NOT NULL,
	[DeliveryAddress] [nvarchar](500) NOT NULL,
	[UserId] [nvarchar](20) NOT NULL,
	[ProductId] [nvarchar](100) NOT NULL,
	[Date] [date] NOT NULL,
	[Note] [nvarchar](500) NULL,
	[Amount] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[IdOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 7/12/2019 2:11:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Image] [nvarchar](200) NOT NULL,
	[Type] [nvarchar](10) NOT NULL,
	[Price] [int] NOT NULL,
	[Weight] [float] NOT NULL,
	[Length] [int] NOT NULL,
	[Width] [int] NOT NULL,
	[Height] [int] NOT NULL,
	[EngineCapacity] [int] NOT NULL,
	[TankCapacity] [float] NOT NULL,
	[EngineType] [nvarchar](200) NOT NULL,
	[BrandId] [nvarchar](5) NOT NULL,
	[Amount] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/12/2019 2:11:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[USERNAME] [nvarchar](20) NOT NULL,
	[PASSWORD] [nvarchar](15) NOT NULL,
	[HO] [nvarchar](50) NOT NULL,
	[TEN] [nvarchar](10) NOT NULL,
	[EMAIL] [nvarchar](50) NOT NULL,
	[PHONE] [nvarchar](12) NOT NULL,
	[ADDRESS] [nvarchar](200) NOT NULL,
	[ROLE] [bit] NOT NULL,
 CONSTRAINT [PK_USER] PRIMARY KEY CLUSTERED 
(
	[USERNAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Advertisements] ON 

INSERT [dbo].[Advertisements] ([Id], [Image]) VALUES (12, N'honda2.jpg')
INSERT [dbo].[Advertisements] ([Id], [Image]) VALUES (13, N'honda5.jpg')
INSERT [dbo].[Advertisements] ([Id], [Image]) VALUES (14, N'yamaha1.jpg')
INSERT [dbo].[Advertisements] ([Id], [Image]) VALUES (15, N'yamaha3.png')
INSERT [dbo].[Advertisements] ([Id], [Image]) VALUES (16, N'ymaha4.png')
SET IDENTITY_INSERT [dbo].[Advertisements] OFF
INSERT [dbo].[Brands] ([Id], [Name], [Logo]) VALUES (N'HND', N'HONDA', N'honda.jpg')
INSERT [dbo].[Brands] ([Id], [Name], [Logo]) VALUES (N'SZK', N'SUZUKI', N'suzuki.png')
INSERT [dbo].[Brands] ([Id], [Name], [Logo]) VALUES (N'YMH', N'YAMAHA', N'yamaha.png')
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([IdOrder], [DeliveryAddress], [UserId], [ProductId], [Date], [Note], [Amount]) VALUES (1, N'100/88 Thích Quảng Đức, P5, Quận Phú Nhuận', N'nhatduy1103', N'air-blade-125cc', CAST(0x5E400B00 AS Date), N'', 1)
INSERT [dbo].[Orders] ([IdOrder], [DeliveryAddress], [UserId], [ProductId], [Date], [Note], [Amount]) VALUES (2, N'100/88 Thích Quảng Đức, P5, Quận Phú Nhuận', N'nhatduy1103', N'lead-125cc', CAST(0x5E400B00 AS Date), N'', 1)
INSERT [dbo].[Orders] ([IdOrder], [DeliveryAddress], [UserId], [ProductId], [Date], [Note], [Amount]) VALUES (48, N'100/88 Thích Quảng Đức, P5, Quận Phú Nhuận', N'nhatduy1103', N'pcx-hibrid', CAST(0x68400B00 AS Date), N'Số ĐT mới: 0908035903', 1)
INSERT [dbo].[Orders] ([IdOrder], [DeliveryAddress], [UserId], [ProductId], [Date], [Note], [Amount]) VALUES (50, N'100/88 Thích Quảng Đức, P5, Quận Phú Nhuận', N'nhatduy1103', N'address-110', CAST(0x6A400B00 AS Date), N'', 1)
INSERT [dbo].[Orders] ([IdOrder], [DeliveryAddress], [UserId], [ProductId], [Date], [Note], [Amount]) VALUES (52, N'21/32 Cầm Bá Thước, P7, Quận Phú Nhuận', N'nhatduy1103', N'address-110', CAST(0x6A400B00 AS Date), N'Giao trước 15h', 1)
INSERT [dbo].[Orders] ([IdOrder], [DeliveryAddress], [UserId], [ProductId], [Date], [Note], [Amount]) VALUES (53, N'248 Lã Xuân Oai', N'nhatduy1103', N'address-110', CAST(0x6A400B00 AS Date), N'', 1)
INSERT [dbo].[Orders] ([IdOrder], [DeliveryAddress], [UserId], [ProductId], [Date], [Note], [Amount]) VALUES (54, N'100/88 Thích Quảng Đức, P5, Quận Phú Nhuận', N'nhatduy1103', N'exciter-rc', CAST(0x6A400B00 AS Date), N'', 4)
INSERT [dbo].[Orders] ([IdOrder], [DeliveryAddress], [UserId], [ProductId], [Date], [Note], [Amount]) VALUES (55, N'21/32 Cầm Bá Thước, P7, Quận Phú Nhuận', N'nhatduy1103', N'vision-110cc', CAST(0x6A400B00 AS Date), N'', 2)
INSERT [dbo].[Orders] ([IdOrder], [DeliveryAddress], [UserId], [ProductId], [Date], [Note], [Amount]) VALUES (56, N'100/88 Thích Quảng Đức, P5, Quận Phú Nhuận', N'nhatduy1103', N'air-blade-125cc', CAST(0x6B400B00 AS Date), N'', 2)
INSERT [dbo].[Orders] ([IdOrder], [DeliveryAddress], [UserId], [ProductId], [Date], [Note], [Amount]) VALUES (57, N'100/88 Thích Quảng Đức, P5, Quận Phú Nhuận', N'nhatduy1103', N'air-blade-125cc', CAST(0x6B400B00 AS Date), N'', 2)
INSERT [dbo].[Orders] ([IdOrder], [DeliveryAddress], [UserId], [ProductId], [Date], [Note], [Amount]) VALUES (58, N'100/88 Thích Quảng Đức, P5, Quận Phú Nhuận', N'nhatduy1103', N'lead-125cc', CAST(0x6C400B00 AS Date), N'', 3)
INSERT [dbo].[Orders] ([IdOrder], [DeliveryAddress], [UserId], [ProductId], [Date], [Note], [Amount]) VALUES (59, N'100/88 Thích Quảng Đức, P5, Quận Phú Nhuận', N'duyvip1103', N'lead-125cc', CAST(0x6C400B00 AS Date), N'ABC', 1)
INSERT [dbo].[Orders] ([IdOrder], [DeliveryAddress], [UserId], [ProductId], [Date], [Note], [Amount]) VALUES (60, N'100/88 Thích Quảng Đức, P5, Quận Phú Nhuận', N'nhatduy1103', N'air-blade-125cc', CAST(0x6C400B00 AS Date), N'', 2)
SET IDENTITY_INSERT [dbo].[Orders] OFF
INSERT [dbo].[Products] ([Id], [Name], [Image], [Type], [Price], [Weight], [Length], [Width], [Height], [EngineCapacity], [TankCapacity], [EngineType], [BrandId], [Amount]) VALUES (N'address-110', N'ADDRESS 110 FI', N'address.jpg', N'Xe tay ga', 28790000, 97, 1845, 665, 1095, 110, 4.6, N'PGM-FI, xăng, 4 kỳ, 1 xy-lanh, làm mát bằng dung dịch', N'SZK', 12)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Type], [Price], [Weight], [Length], [Width], [Height], [EngineCapacity], [TankCapacity], [EngineType], [BrandId], [Amount]) VALUES (N'air-blade-125cc', N'AIR BLADE 125CC', N'air-blade-125cc.png', N'Xe tay ga', 37990000, 110, 1881, 687, 1111, 125, 4.4, N'PGM-FI, xăng, 4 kỳ, 1 xy-lanh, làm mát bằng dung dịch', N'HND', 11)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Type], [Price], [Weight], [Length], [Width], [Height], [EngineCapacity], [TankCapacity], [EngineType], [BrandId], [Amount]) VALUES (N'axelo-125', N'AXELO 125', N'axelo.jpg', N'Xe côn tay', 27790000, 108, 1895, 715, 1075, 125, 4.6, N'PGM-FI, xăng, 4 kỳ, 1 xy-lanh', N'SZK', 15)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Type], [Price], [Weight], [Length], [Width], [Height], [EngineCapacity], [TankCapacity], [EngineType], [BrandId], [Amount]) VALUES (N'cub-125cc', N'SUPER CUB C125', N'cub.png', N'Xe số', 84990000, 108, 1910, 718, 1002, 125, 3.7, N'PGM-FI, SOHC 4 kỳ, 1 xy lanh,làm mát bằng không khí', N'HND', 14)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Type], [Price], [Weight], [Length], [Width], [Height], [EngineCapacity], [TankCapacity], [EngineType], [BrandId], [Amount]) VALUES (N'exciter-motogp', N'EXCITER 150 MOTOGP VERSION', N'Exciter-MotoGP.png', N'Xe côn tay', 48990000, 117, 1985, 670, 1100, 150, 5.2, N'4 thì, 4 van, SOHC, làm mát bằng dung dịch', N'YMH', 15)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Type], [Price], [Weight], [Length], [Width], [Height], [EngineCapacity], [TankCapacity], [EngineType], [BrandId], [Amount]) VALUES (N'exciter-rc', N'EXCITER 150 RC VERSION', N'Exciter-Mat-Black.png', N'Xe côn tay', 46990000, 117, 1985, 670, 1100, 150, 5.2, N'4 thì, 4 van, SOHC, làm mát bằng dung dịch', N'YMH', 15)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Type], [Price], [Weight], [Length], [Width], [Height], [EngineCapacity], [TankCapacity], [EngineType], [BrandId], [Amount]) VALUES (N'future-125cc', N'FUTURE 125CC', N'future-125cc.png', N'Xe số', 31390000, 106, 1931, 711, 1087, 125, 4.6, N'Xăng, 4 kỳ, 1 xy-lanh, làm mát bằng không khí', N'HND', 15)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Type], [Price], [Weight], [Length], [Width], [Height], [EngineCapacity], [TankCapacity], [EngineType], [BrandId], [Amount]) VALUES (N'grande-blue-core-hybrid-girl-version', N'GRANDE BLUE CORE HYBRID (GIRL VERSION)', N'grande-girl.png', N'Xe tay ga', 50000000, 101, 1820, 685, 1150, 110, 5.2, N'Blue Core, 4 thì, 2 van, xy-lanh đơn', N'YMH', 15)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Type], [Price], [Weight], [Length], [Width], [Height], [EngineCapacity], [TankCapacity], [EngineType], [BrandId], [Amount]) VALUES (N'grande-blue-core-hybrid-phien-ban-tieu-chuan', N'GRANDE BLUE CORE HYBRID TIÊU CHUẨN', N'grande.png', N'Xe tay ga', 45500000, 100, 1820, 685, 1150, 110, 5.2, N'Blue Core, 4 thì, 2 van, xy-lanh đơn', N'YMH', 15)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Type], [Price], [Weight], [Length], [Width], [Height], [EngineCapacity], [TankCapacity], [EngineType], [BrandId], [Amount]) VALUES (N'grande-hybird-moi-phien-ban-ky-niem-20-nam', N'GRANDE BLUE CORE HYBRID KỶ NIỆM 20 NĂM', N'grande-20nam.png', N'Xe tay ga', 52000000, 101, 1820, 685, 1150, 110, 5.2, N'Blue Core, 4 thì, 2 van, xy-lanh đơn', N'YMH', 15)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Type], [Price], [Weight], [Length], [Width], [Height], [EngineCapacity], [TankCapacity], [EngineType], [BrandId], [Amount]) VALUES (N'honda-blade-110', N'HONDA BLADE 110CC', N'blade-110cc.png', N'Xe số', 21690000, 98, 1101, 890, 760, 110, 4.3, N'PGM-FI, làm mát bằng dung dịch', N'HND', 15)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Type], [Price], [Weight], [Length], [Width], [Height], [EngineCapacity], [TankCapacity], [EngineType], [BrandId], [Amount]) VALUES (N'impulse', N'IMPULSE 125 FI', N'impulse-den-mo.jpg', N'Xe tay ga', 30790000, 114, 1920, 680, 1065, 125, 4.6, N'Xăng, 4 kỳ, 1 xy-lanh, làm mát bằng không khí', N'SZK', 15)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Type], [Price], [Weight], [Length], [Width], [Height], [EngineCapacity], [TankCapacity], [EngineType], [BrandId], [Amount]) VALUES (N'janus-limited-phien-ban-gioi-han', N'JANUS PHIÊN BẢN GIỚI HẠN (LIMITED)', N'janus-limit.png', N'Xe tay ga', 31990000, 97, 1850, 705, 1150, 125, 4.6, N'Blue Core, 4 thì, SOHC', N'YMH', 15)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Type], [Price], [Weight], [Length], [Width], [Height], [EngineCapacity], [TankCapacity], [EngineType], [BrandId], [Amount]) VALUES (N'jupiter', N'JUPITER FI PHIÊN BẢN RC', N'Jupiter-Den-Cam-004.png', N'Xe số', 29400000, 104, 1935, 680, 1065, 110, 4.1, N'4 thì, 2 van, SOHC', N'YMH', 15)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Type], [Price], [Weight], [Length], [Width], [Height], [EngineCapacity], [TankCapacity], [EngineType], [BrandId], [Amount]) VALUES (N'jupiter-fi-gp', N'JUPITER FI PHIÊN BẢN GP', N'Jupiter-GP-004.png', N'Xe số', 30000000, 104, 1935, 680, 1065, 110, 4.1, N'4 thì, 2 van, SOHC', N'YMH', 15)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Type], [Price], [Weight], [Length], [Width], [Height], [EngineCapacity], [TankCapacity], [EngineType], [BrandId], [Amount]) VALUES (N'latte', N'LATTE PHIÊN BẢN TIÊU CHUẨN', N'latte.png', N'Xe tay ga', 37490000, 100, 1820, 680, 1160, 125, 4.2, N'Blue Core 4 kỳ, SOHC, làm mát bằng không khí', N'YMH', 15)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Type], [Price], [Weight], [Length], [Width], [Height], [EngineCapacity], [TankCapacity], [EngineType], [BrandId], [Amount]) VALUES (N'lead-125cc', N'LEAD 125CC', N'lead-125cc.png', N'Xe tay ga', 41490000, 113, 1842, 680, 1130, 125, 6, N'PGM-FI, xăng, 4 kỳ, 1 xi-lanh,làm mát bằng dung dịch', N'HND', 11)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Type], [Price], [Weight], [Length], [Width], [Height], [EngineCapacity], [TankCapacity], [EngineType], [BrandId], [Amount]) VALUES (N'monkey', N'MONKEY', N'monkey.png', N'Xe côn tay', 84990000, 101.3, 1710, 755, 1030, 150, 5.6, N'PGM-FI, SOHC 4 kỳ, 1 xy-lanh,làm mát bằng không khí', N'HND', 15)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Type], [Price], [Weight], [Length], [Width], [Height], [EngineCapacity], [TankCapacity], [EngineType], [BrandId], [Amount]) VALUES (N'msx-125', N'MSX 125 2019', N'msx.png', N'Xe côn tay', 57260000, 106, 1000, 680, 1075, 125, 5.2, N'PGM-FI, xăng, 4 kỳ, 1 xy-lanh, làm mát bằng dung dịch', N'HND', 15)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Type], [Price], [Weight], [Length], [Width], [Height], [EngineCapacity], [TankCapacity], [EngineType], [BrandId], [Amount]) VALUES (N'nvx-155-abs-phien-ban-ky-niem-20-nam', N'NVX 155 ABS PHIÊN BẢN KỶ NIỆM 20 NĂM', N'nvx-20nam.png', N'Xe tay ga', 52740000, 118, 1990, 700, 1125, 155, 4.6, N'4 thì, làm mát dung dịch, SOHC, xy lanh đơn', N'YMH', 15)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Type], [Price], [Weight], [Length], [Width], [Height], [EngineCapacity], [TankCapacity], [EngineType], [BrandId], [Amount]) VALUES (N'nvx-155-phien-ban-doxou', N'NVX 155 ABS PHIÊN BẢN DOXOU', N'nvx-doxou.png', N'Xe tay ga', 52740000, 116, 1990, 700, 1125, 155, 4.6, N'4 thì, làm mát dung dịch, SOHC, xy lanh đơn', N'YMH', 15)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Type], [Price], [Weight], [Length], [Width], [Height], [EngineCapacity], [TankCapacity], [EngineType], [BrandId], [Amount]) VALUES (N'nvx-standard', N'NVX 155 STANDARD VERSION', N'nvx.png', N'Xe tay ga', 46240000, 116, 1990, 700, 1125, 155, 4.6, N'4 thì, làm mát bằng dung dịch, SOHC, xy-lanh đơn', N'YMH', 15)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Type], [Price], [Weight], [Length], [Width], [Height], [EngineCapacity], [TankCapacity], [EngineType], [BrandId], [Amount]) VALUES (N'pcx', N'PCX 125CC', N'pcx.png', N'Xe tay ga', 70490000, 130, 1923, 745, 1017, 125, 8, N'PGM-FI, xăng, 4 kỳ, 1 xy-lanh, làm mát bằng dung dịch', N'HND', 15)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Type], [Price], [Weight], [Length], [Width], [Height], [EngineCapacity], [TankCapacity], [EngineType], [BrandId], [Amount]) VALUES (N'pcx-hibrid', N'PCX HIBRID', N'pcx_hybrid.png', N'Xe tay ga', 89990000, 134, 1923, 745, 1107, 125, 8.2, N'PGM-FI, Xăng, 4 kỳ, 1 xy lanh,làm mát bằng dung dịch', N'HND', 15)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Type], [Price], [Weight], [Length], [Width], [Height], [EngineCapacity], [TankCapacity], [EngineType], [BrandId], [Amount]) VALUES (N'raider-r150', N'RAIDER R150 FI', N'den-do-new.png', N'Xe côn tay', 49190000, 109, 1960, 675, 980, 150, 4.3, N'4 thì, làm mát bằng dung dịch', N'SZK', 15)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Type], [Price], [Weight], [Length], [Width], [Height], [EngineCapacity], [TankCapacity], [EngineType], [BrandId], [Amount]) VALUES (N'sh-300cc', N'SH 300CC', N'sh-300cc.png', N'Xe tay ga', 278990000, 169, 2130, 730, 1195, 300, 9.1, N'SOHC, 4 kỳ, xy-lanh đơn 4 van, làm mát bằng chất lỏng; đáp ứng tiêu chuẩn khí thải Euro 4', N'HND', 15)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Type], [Price], [Weight], [Length], [Width], [Height], [EngineCapacity], [TankCapacity], [EngineType], [BrandId], [Amount]) VALUES (N'sh-mode-125cc', N'SH MODE 125CC', N'sh-mode-125cc.png', N'Xe tay ga', 51690000, 117, 1930, 669, 1105, 125, 5.5, N'PGM-FI, xăng, 4 kỳ, 1 xi-lanh,làm mát bằng dung dịch', N'HND', 15)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Type], [Price], [Weight], [Length], [Width], [Height], [EngineCapacity], [TankCapacity], [EngineType], [BrandId], [Amount]) VALUES (N'sirius-phanh-co', N'SIRIUS PHIÊN BẢN PHANH CƠ', N'sirius-do-den.png', N'Xe số', 18800000, 96, 1940, 715, 1075, 110, 4.2, N'4 thì, 2 van SOHC, làm mát bằng không khí', N'YMH', 15)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Type], [Price], [Weight], [Length], [Width], [Height], [EngineCapacity], [TankCapacity], [EngineType], [BrandId], [Amount]) VALUES (N'sirius-rc-vanh-duc', N'SIRIUS PHIÊN BẢN RC VÀNH ĐÚC', N'Sirius-RC-Xam-den.jpg', N'Xe số', 21300000, 96, 1890, 665, 1035, 110, 4.2, N'4 thì, 2 van SOHC, làm mát bằng không khí', N'YMH', 15)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Type], [Price], [Weight], [Length], [Width], [Height], [EngineCapacity], [TankCapacity], [EngineType], [BrandId], [Amount]) VALUES (N'vision-110cc', N'VISION 110CC', N'vision.png', N'Xe tay ga', 30790000, 96, 1863, 686, 1088, 110, 5.2, N'Cháy cưỡng bức, làm mát bằng không khí, 4 kỳ, 1 xy-lanh', N'HND', 15)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Type], [Price], [Weight], [Length], [Width], [Height], [EngineCapacity], [TankCapacity], [EngineType], [BrandId], [Amount]) VALUES (N'viva-125', N'VIVA 125 FI', N'viva.jpg', N'Xe số', 22690000, 96, 1910, 690, 1085, 125, 4.5, N'PGM-FI, Xăng, 4 kỳ, 1 xy lanh,làm mát bằng dung dịch', N'SZK', 15)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Type], [Price], [Weight], [Length], [Width], [Height], [EngineCapacity], [TankCapacity], [EngineType], [BrandId], [Amount]) VALUES (N'wave-rsx', N'WAVE RSX FI 110CC', N'ware-rsx.png', N'Xe số', 21690000, 99, 1921, 709, 1081, 110, 4.1, N'Xăng, 4 kỳ, 1 xy-lanh, làm mát bằng không khí', N'HND', 15)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Type], [Price], [Weight], [Length], [Width], [Height], [EngineCapacity], [TankCapacity], [EngineType], [BrandId], [Amount]) VALUES (N'winner-x', N'WINNER X', N'winner-150cc.png', N'Xe côn tay', 45990000, 123, 2019, 727, 1088, 150, 4.5, N'PGM-FI, 4 kỳ, DOHC, xy-lanh đơn, côn 6 số, làm mát bằng dung dịch', N'HND', 15)
INSERT [dbo].[Users] ([USERNAME], [PASSWORD], [HO], [TEN], [EMAIL], [PHONE], [ADDRESS], [ROLE]) VALUES (N'admin', N'admin', N'Đặng Nhật', N'Duy', N'nhatduy9798@gmail.com', N'0908035903', N'TP.Hồ Chí Minh', 1)
INSERT [dbo].[Users] ([USERNAME], [PASSWORD], [HO], [TEN], [EMAIL], [PHONE], [ADDRESS], [ROLE]) VALUES (N'duyvip1103', N'1', N'Đặng', N'Nhật Duy', N'nhatduy.education@gmail.com', N'0908035903', N'100/88 Thích Quảng Đức, Phường 5, Quận Phú Nhuận, TP Hồ Chí Minh', 0)
INSERT [dbo].[Users] ([USERNAME], [PASSWORD], [HO], [TEN], [EMAIL], [PHONE], [ADDRESS], [ROLE]) VALUES (N'gin9x', N'111111', N'Nguyễn Tiến', N'Đạt', N'n16dccn039@student.ptithcm.edu.vn', N'0967009460', N'248 Lã Xuân Oai', 0)
INSERT [dbo].[Users] ([USERNAME], [PASSWORD], [HO], [TEN], [EMAIL], [PHONE], [ADDRESS], [ROLE]) VALUES (N'nhatduy1103', N'1', N'Đặng Nhật', N'Duy', N'nhatduy.education@gmail.com', N'0366850859', N'100/88 Thích Quảng Đức, Phường 5, Quận Phú Nhuận, TP Hồ Chí Minh', 0)
INSERT [dbo].[Users] ([USERNAME], [PASSWORD], [HO], [TEN], [EMAIL], [PHONE], [ADDRESS], [ROLE]) VALUES (N'thanhbinh', N'123456', N'Trịnh Thanh', N'Bình', N'trinhthanhbinh.ttb@gmail.com', N'0366791517', N'248 Lã Xuân Oai', 0)
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([USERNAME])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Brands] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brands] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Brands]
GO
USE [master]
GO
ALTER DATABASE [WEBBANXEMAY] SET  READ_WRITE 
GO
