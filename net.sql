﻿USE [master]
GO
/****** Object:  Database [QuanLyPhongNet]    Script Date: 24/5/2022 11:49:01 AM ******/
CREATE DATABASE [QuanLyPhongNet]
GO
ALTER DATABASE [QuanLyPhongNet] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyPhongNet].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyPhongNet] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyPhongNet] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyPhongNet] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyPhongNet] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyPhongNet] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyPhongNet] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyPhongNet] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyPhongNet] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyPhongNet] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyPhongNet] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyPhongNet] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyPhongNet] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyPhongNet] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyPhongNet] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyPhongNet] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QuanLyPhongNet] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyPhongNet] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyPhongNet] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyPhongNet] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyPhongNet] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyPhongNet] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyPhongNet] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyPhongNet] SET RECOVERY FULL 
GO
ALTER DATABASE [QuanLyPhongNet] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyPhongNet] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyPhongNet] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyPhongNet] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyPhongNet] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuanLyPhongNet] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuanLyPhongNet] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QuanLyPhongNet', N'ON'
GO
ALTER DATABASE [QuanLyPhongNet] SET QUERY_STORE = OFF
GO
USE [QuanLyPhongNet]
GO
/****** Object:  Table [dbo].[AfterPayClient]    Script Date: 24/5/2022 11:49:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AfterPayClient](
	[ClientName] [varchar](30) NOT NULL,
	[BillID] [int] NOT NULL,
	[StartTime] [time](7) NULL,
	[UseTime] [time](7) NULL,
	[PriceUnit] [float] NULL,
	[TotalMoney] [float] NULL,
 CONSTRAINT [PK__AfterPay__D49F2265B506120F] PRIMARY KEY CLUSTERED 
(
	[ClientName] ASC,
	[BillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BeforePayClient]    Script Date: 24/5/2022 11:49:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BeforePayClient](
	[ClientName] [varchar](30) NOT NULL,
	[BillID] [int] NOT NULL,
	[StartTime] [time](7) NULL,
	[UseTime] [time](7) NULL,
	[LeftTime] [time](7) NULL,
 CONSTRAINT [PK__BeforePa__D49F2265E685E762] PRIMARY KEY CLUSTERED 
(
	[ClientName] ASC,
	[BillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 24/5/2022 11:49:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[BillID] [int] IDENTITY(1,1) NOT NULL,
	[FoundedUser] [nvarchar](60) NULL,
	[FoundedDate] [date] NULL,
	[PriceTotal] [float] NULL,
 CONSTRAINT [PK__Bill__11F2FC4A977BCF23] PRIMARY KEY CLUSTERED 
(
	[BillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 24/5/2022 11:49:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryName] [nvarchar](60) NOT NULL,
 CONSTRAINT [PK__Category__8517B2E1AFD6FCE7] PRIMARY KEY CLUSTERED 
(
	[CategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 24/5/2022 11:49:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Client](
	[ClientName] [varchar](30) NOT NULL,
	[GroupClientName] [nvarchar](30) NULL,
	[StatusClient] [varchar](50) NULL,
	[Note] [nvarchar](100) NULL,
 CONSTRAINT [PK__Client__65800DA1FEE369FE] PRIMARY KEY CLUSTERED 
(
	[ClientName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Drink]    Script Date: 24/5/2022 11:49:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drink](
	[DrinkID] [int] IDENTITY(1,1) NOT NULL,
	[DrinkName] [nvarchar](100) NULL,
	[CategoryName] [nvarchar](60) NULL,
	[PriceUnit] [float] NULL,
	[UnitLot] [nvarchar](100) NULL,
	[InventoryNumber] [int] NULL,
 CONSTRAINT [PK__Drink__C094D3C8F9C03AB7] PRIMARY KEY CLUSTERED 
(
	[DrinkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Food]    Script Date: 24/5/2022 11:49:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food](
	[FoodID] [int] IDENTITY(1,1) NOT NULL,
	[FoodName] [nvarchar](100) NULL,
	[CategoryName] [nvarchar](60) NULL,
	[PriceUnit] [float] NULL,
	[UnitLot] [nvarchar](100) NULL,
	[InventoryNumber] [int] NULL,
 CONSTRAINT [PK__Food__856DB3CBF6829878] PRIMARY KEY CLUSTERED 
(
	[FoodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupClient]    Script Date: 24/5/2022 11:49:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupClient](
	[GroupName] [nvarchar](30) NOT NULL,
	[Discription] [nvarchar](120) NULL,
 CONSTRAINT [PK__GroupCli__6EFCD4352C33DF6E] PRIMARY KEY CLUSTERED 
(
	[GroupName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupClientAndGroupUser]    Script Date: 24/5/2022 11:49:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupClientAndGroupUser](
	[GroupUserName] [nvarchar](30) NOT NULL,
	[GroupClientName] [nvarchar](30) NOT NULL,
	[GiaDichVu] [float] NULL,
 CONSTRAINT [PK__GroupCli__21FE1C2BC679EAC4] PRIMARY KEY CLUSTERED 
(
	[GroupUserName] ASC,
	[GroupClientName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupUser]    Script Date: 24/5/2022 11:49:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GroupUser](
	[GroupName] [nvarchar](30) NOT NULL,
	[TypeName] [varchar](30) NULL,
 CONSTRAINT [PK__GroupUse__6EFCD4359AF7AE7E] PRIMARY KEY CLUSTERED 
(
	[GroupName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoginMember]    Script Date: 24/5/2022 11:49:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoginMember](
	[memberID] [int] NOT NULL,
	[ClientName] [varchar](30) NOT NULL,
	[StartTime] [time](7) NULL,
	[UseTime] [time](7) NULL,
	[LeftTime] [time](7) NULL,
 CONSTRAINT [PK__LoginMem__798FCF2CDC92FBC2] PRIMARY KEY CLUSTERED 
(
	[memberID] ASC,
	[ClientName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Member]    Script Date: 24/5/2022 11:49:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Member](
	[MemberID] [int] IDENTITY(1,1) NOT NULL,
	[AccountName] [varchar](30) NULL,
	[Password] [varchar](30) NULL,
	[GroupUser] [nvarchar](30) NULL,
	[CurrentTime] [time](7) NULL,
	[CurrentMoney] [float] NULL,
	[StatusAccount] [nvarchar](30) NULL,
 CONSTRAINT [PK__Member__0CF04B382652A470] PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MemberInformation]    Script Date: 24/5/2022 11:49:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MemberInformation](
	[memberID] [int] NOT NULL,
	[MemberName] [nvarchar](100) NULL,
	[FoundedDate] [date] NULL,
	[PhoneNumber] [varchar](11) NULL,
	[MemberAddress] [nvarchar](100) NULL,
	[Email] [varchar](100) NULL,
 CONSTRAINT [PK__MemberIn__7FD7CFF6ED10E3CF] PRIMARY KEY CLUSTERED 
(
	[memberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderCard]    Script Date: 24/5/2022 11:49:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderCard](
	[ClientName] [varchar](30) NOT NULL,
	[CardID] [int] NOT NULL,
	[Quantity] [int] NULL,
	[PriceTotal] [float] NULL,
 CONSTRAINT [PK__OrderCar__90DFE179BE878F64] PRIMARY KEY CLUSTERED 
(
	[ClientName] ASC,
	[CardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDrink]    Script Date: 24/5/2022 11:49:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderDrink](
	[ClientName] [varchar](30) NOT NULL,
	[DrinkID] [int] NOT NULL,
	[Quantity] [int] NULL,
	[PriceTotal] [float] NULL,
 CONSTRAINT [PK__OrderDri__F989409DFD691638] PRIMARY KEY CLUSTERED 
(
	[ClientName] ASC,
	[DrinkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderFood]    Script Date: 24/5/2022 11:49:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderFood](
	[ClientName] [varchar](30) NOT NULL,
	[FoodID] [int] NOT NULL,
	[Quantity] [int] NULL,
	[PriceTotal] [float] NULL,
 CONSTRAINT [PK__OrderFoo__CDD6D69DFB8E47F0] PRIMARY KEY CLUSTERED 
(
	[ClientName] ASC,
	[FoodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TheCard]    Script Date: 24/5/2022 11:49:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheCard](
	[CardID] [int] IDENTITY(1,1) NOT NULL,
	[CardName] [nvarchar](100) NULL,
	[CategoryName] [nvarchar](60) NULL,
	[PriceUnit] [float] NULL,
	[UnitLot] [nvarchar](100) NULL,
	[InventoryNumber] [int] NULL,
 CONSTRAINT [PK__TheCard__55FECD8E7246C322] PRIMARY KEY CLUSTERED 
(
	[CardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheUser]    Script Date: 24/5/2022 11:49:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TheUser](
	[UserName] [nvarchar](60) NOT NULL,
	[Type] [varchar](30) NULL,
	[GroupUser] [nvarchar](30) NULL,
	[PhoneNumber] [varchar](11) NULL,
	[Email] [varchar](100) NULL,
 CONSTRAINT [PK__TheUser__C9F284573AB56A79] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TransactionDiary]    Script Date: 24/5/2022 11:49:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionDiary](
	[UserName] [nvarchar](60) NULL,
	[memberID] [int] NULL,
	[TransacDate] [date] NULL,
	[AddTime] [time](7) NULL,
	[AddMoney] [float] NULL,
	[UseTime] [time](7) NULL,
	[Note] [nvarchar](120) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Category] ([CategoryName]) VALUES (N'Bia')
INSERT [dbo].[Category] ([CategoryName]) VALUES (N'Bún')
INSERT [dbo].[Category] ([CategoryName]) VALUES (N'Cơm')
INSERT [dbo].[Category] ([CategoryName]) VALUES (N'Mì gói')
INSERT [dbo].[Category] ([CategoryName]) VALUES (N'Nước ngọt')
INSERT [dbo].[Category] ([CategoryName]) VALUES (N'Phở')
INSERT [dbo].[Category] ([CategoryName]) VALUES (N'Rượu')
INSERT [dbo].[Category] ([CategoryName]) VALUES (N'Thẻ Điện Thoại')
INSERT [dbo].[Category] ([CategoryName]) VALUES (N'Thẻ Game')
INSERT [dbo].[Category] ([CategoryName]) VALUES (N'Trà')
GO
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY-1', N'Máy Lạnh', N'DISCONNECT', N'máy phòng máy lạnh')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY-10', N'Máy Lạnh', N'DISCONNECT', N'máy phòng máy lạnh')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY-11', N'Máy Lạnh', N'DISCONNECT', N'máy phòng máy lạnh')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY-12', N'Máy Lạnh', N'DISCONNECT', N'máy phòng máy lạnh')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY-13', N'Máy Lạnh', N'DISCONNECT', N'máy phòng máy lạnh')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY-14', N'Máy Lạnh', N'DISCONNECT', N'máy phòng máy lạnh')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY-15', N'Máy Lạnh', N'DISCONNECT', N'máy phòng máy lạnh')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY-16', N'Máy Lạnh', N'DISCONNECT', N'máy phòng máy lạnh')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY-17', N'Máy Lạnh', N'DISCONNECT', N'máy phòng máy lạnh')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY-18', N'Máy Lạnh', N'DISCONNECT', N'máy phòng máy lạnh')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY-19', N'Máy Lạnh', N'DISCONNECT', N'máy phòng máy lạnh')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY-2', N'Máy Lạnh', N'DISCONNECT', N'máy phòng máy lạnh')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY-20', N'Máy Lạnh', N'DISCONNECT', N'máy phòng máy lạnh')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY-3', N'Máy Lạnh', N'DISCONNECT', N'máy phòng máy lạnh')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY-4', N'Máy Lạnh', N'DISCONNECT', N'máy phòng máy lạnh')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY-5', N'Máy Lạnh', N'DISCONNECT', N'máy phòng máy lạnh')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY-6', N'Máy Lạnh', N'DISCONNECT', N'máy phòng máy lạnh')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY-7', N'Máy Lạnh', N'DISCONNECT', N'máy phòng máy lạnh')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY-8', N'Máy Lạnh', N'DISCONNECT', N'máy phòng máy lạnh')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY-9', N'Máy Lạnh', N'DISCONNECT', N'máy phòng máy lạnh')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY1', N'Mặc Định', N'DISCONNECT', N'máy phòng thường')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY10', N'Mặc Định', N'DISCONNECT', N'máy phòng thường')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY11', N'Mặc Định', N'DISCONNECT', N'máy phòng thường')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY12', N'Mặc Định', N'DISCONNECT', N'máy phòng thường')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY13', N'Mặc Định', N'DISCONNECT', N'máy phòng thường')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY14', N'Mặc Định', N'DISCONNECT', N'máy phòng thường')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY15', N'Mặc Định', N'DISCONNECT', N'máy phòng thường')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY16', N'Mặc Định', N'DISCONNECT', N'máy phòng thường')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY17', N'Mặc Định', N'DISCONNECT', N'máy phòng thường')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY18', N'Mặc Định', N'DISCONNECT', N'máy phòng thường')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY19', N'Mặc Định', N'DISCONNECT', N'máy phòng thường')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY2', N'Mặc Định', N'DISCONNECT', N'máy phòng thường')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY20', N'Mặc Định', N'DISCONNECT', N'máy phòng thường')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY3', N'Mặc Định', N'DISCONNECT', N'máy phòng thường')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY4', N'Mặc Định', N'DISCONNECT', N'máy phòng thường')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY5', N'Mặc Định', N'DISCONNECT', N'máy phòng thường')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY6', N'Mặc Định', N'DISCONNECT', N'máy phòng thường')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY7', N'Mặc Định', N'DISCONNECT', N'máy phòng thường')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY8', N'Mặc Định', N'DISCONNECT', N'máy phòng thường')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY9', N'Mặc Định', N'DISCONNECT', N'máy phòng thường')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAYVIP-1', N'VIP', N'DISCONNECT', N'máy phòng VIP')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAYVIP-10', N'VIP', N'DISCONNECT', N'máy phòng VIP')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAYVIP-11', N'VIP', N'DISCONNECT', N'máy phòng VIP')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAYVIP-12', N'VIP', N'DISCONNECT', N'máy phòng VIP')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAYVIP-13', N'VIP', N'DISCONNECT', N'máy phòng VIP')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAYVIP-14', N'VIP', N'DISCONNECT', N'máy phòng VIP')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAYVIP-15', N'VIP', N'DISCONNECT', N'máy phòng VIP')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAYVIP-2', N'VIP', N'DISCONNECT', N'máy phòng VIP')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAYVIP-3', N'VIP', N'DISCONNECT', N'máy phòng VIP')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAYVIP-4', N'VIP', N'DISCONNECT', N'máy phòng VIP')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAYVIP-5', N'VIP', N'DISCONNECT', N'máy phòng VIP')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAYVIP-6', N'VIP', N'DISCONNECT', N'máy phòng VIP')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAYVIP-7', N'VIP', N'DISCONNECT', N'máy phòng VIP')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAYVIP-8', N'VIP', N'DISCONNECT', N'máy phòng VIP')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAYVIP-9', N'VIP', N'DISCONNECT', N'máy phòng VIP')
GO
SET IDENTITY_INSERT [dbo].[Drink] ON 

INSERT [dbo].[Drink] ([DrinkID], [DrinkName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (1, N'7 UP', N'Nước ngọt', 10000, N'Chai', 35)
INSERT [dbo].[Drink] ([DrinkID], [DrinkName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (2, N'Pepsi', N'Nước ngọt', 10000, N'Chai', 25)
INSERT [dbo].[Drink] ([DrinkID], [DrinkName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (3, N'Coca', N'Nước ngọt', 10000, N'Chai', 40)
INSERT [dbo].[Drink] ([DrinkID], [DrinkName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (4, N'Trà xanh không độ', N'Trà', 12000, N'Chai', 21)
INSERT [dbo].[Drink] ([DrinkID], [DrinkName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (5, N'C2', N'Trà', 8000, N'Chai', 32)
INSERT [dbo].[Drink] ([DrinkID], [DrinkName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (6, N'Fanta', N'Nước ngọt', 10000, N'Chai', 22)
INSERT [dbo].[Drink] ([DrinkID], [DrinkName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (7, N'Mirinda xá xị', N'Nước ngọt', 10000, N'Chai', 20)
INSERT [dbo].[Drink] ([DrinkID], [DrinkName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (8, N'Rồng đỏ', N'Nước ngọt', 10000, N'Hủ', 45)
INSERT [dbo].[Drink] ([DrinkID], [DrinkName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (9, N'STING dâu', N'Nước ngọt', 10000, N'Chai', 48)
INSERT [dbo].[Drink] ([DrinkID], [DrinkName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (10, N'STING dâu promax', N'Nước ngọt', 12000, N'Lon', 35)
INSERT [dbo].[Drink] ([DrinkID], [DrinkName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (11, N'STING vàng', N'Nước ngọt', 12000, N'Chai', 47)
INSERT [dbo].[Drink] ([DrinkID], [DrinkName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (12, N'RED BULL', N'Nước ngọt', 12000, N'Lon', 50)
INSERT [dbo].[Drink] ([DrinkID], [DrinkName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (13, N'Trà đá', N'Trà', 12000, N'Ly', 100)
INSERT [dbo].[Drink] ([DrinkID], [DrinkName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (14, N'Trà đá ca', N'Trà', 12000, N'Ca', 100)
INSERT [dbo].[Drink] ([DrinkID], [DrinkName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (15, N'Bia Tiger', N'Bia', 15000, N'Lon', 42)
INSERT [dbo].[Drink] ([DrinkID], [DrinkName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (16, N'Rượu Đế', N'Rượu', 20000, N'Chai', 48)
SET IDENTITY_INSERT [dbo].[Drink] OFF
GO
SET IDENTITY_INSERT [dbo].[Food] ON 

INSERT [dbo].[Food] ([FoodID], [FoodName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (1, N'Phở gà', N'Phở', 20000, N'Tô', 8)
INSERT [dbo].[Food] ([FoodID], [FoodName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (2, N'Mì xào bò', N'Mì gói', 15000, N'Dĩa', 20)
INSERT [dbo].[Food] ([FoodID], [FoodName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (3, N'Mì xào bò trứng', N'Mì gói', 20000, N'Dĩa', 11)
INSERT [dbo].[Food] ([FoodID], [FoodName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (4, N'Cơm chiên trứng', N'Cơm', 12000, N'Dĩa', 12)
INSERT [dbo].[Food] ([FoodID], [FoodName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (5, N'Cơm chiên thịt heo', N'Cơm', 15000, N'Dĩa', 14)
INSERT [dbo].[Food] ([FoodID], [FoodName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (6, N'Cơm xào bò', N'Cơm', 20000, N'Dĩa', 16)
INSERT [dbo].[Food] ([FoodID], [FoodName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (7, N'Bún xào', N'Bún', 12000, N'Dĩa', 13)
INSERT [dbo].[Food] ([FoodID], [FoodName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (8, N'Phở gà đá', N'Phở', 25000, N'Tô', 15)
INSERT [dbo].[Food] ([FoodID], [FoodName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (9, N'Phở bò', N'Phở', 22000, N'Tô', 6)
SET IDENTITY_INSERT [dbo].[Food] OFF
GO
INSERT [dbo].[GroupClient] ([GroupName], [Discription]) VALUES (N'Mặc Định', N'Phòng máy thường')
INSERT [dbo].[GroupClient] ([GroupName], [Discription]) VALUES (N'Máy Lạnh', N'Phòng máy lạnh')
INSERT [dbo].[GroupClient] ([GroupName], [Discription]) VALUES (N'Thi Đấu', N'Phòng máy dành cho giải đấu Game')
INSERT [dbo].[GroupClient] ([GroupName], [Discription]) VALUES (N'VIP', N'Phòng vip')
GO
INSERT [dbo].[GroupUser] ([GroupName], [TypeName]) VALUES (N'Hội viên', N'Member')
INSERT [dbo].[GroupUser] ([GroupName], [TypeName]) VALUES (N'Khách vãng lai', N'Guest')
INSERT [dbo].[GroupUser] ([GroupName], [TypeName]) VALUES (N'Nhân viên', N'Staff')
INSERT [dbo].[GroupUser] ([GroupName], [TypeName]) VALUES (N'Quản lý', N'Manager')
GO
SET IDENTITY_INSERT [dbo].[Member] ON 

INSERT [dbo].[Member] ([MemberID], [AccountName], [Password], [GroupUser], [CurrentTime], [CurrentMoney], [StatusAccount]) VALUES (2, N'Seraphim', N'123', N'Hội viên', CAST(N'07:00:00' AS Time), 70000, N'Cho Phép')
INSERT [dbo].[Member] ([MemberID], [AccountName], [Password], [GroupUser], [CurrentTime], [CurrentMoney], [StatusAccount]) VALUES (3, N'0961563202', N'123', N'Hội viên', CAST(N'03:00:00' AS Time), 30000, N'Cho Phép')
INSERT [dbo].[Member] ([MemberID], [AccountName], [Password], [GroupUser], [CurrentTime], [CurrentMoney], [StatusAccount]) VALUES (4, N'heavenhell8899', N'123', N'Hội viên', CAST(N'10:00:00' AS Time), 100000, N'Cho Phép')
INSERT [dbo].[Member] ([MemberID], [AccountName], [Password], [GroupUser], [CurrentTime], [CurrentMoney], [StatusAccount]) VALUES (5, N'abc', N'123', N'Hội viên', CAST(N'01:00:00' AS Time), 10000, N'Cho Phép')
INSERT [dbo].[Member] ([MemberID], [AccountName], [Password], [GroupUser], [CurrentTime], [CurrentMoney], [StatusAccount]) VALUES (6, N'xyz', N'123', N'Hội viên', CAST(N'15:00:00' AS Time), 150000, N'Cho Phép')
INSERT [dbo].[Member] ([MemberID], [AccountName], [Password], [GroupUser], [CurrentTime], [CurrentMoney], [StatusAccount]) VALUES (7, N'tikitaka', N'123', N'Hội viên', CAST(N'01:00:00' AS Time), 10000, N'Cho Phép')
INSERT [dbo].[Member] ([MemberID], [AccountName], [Password], [GroupUser], [CurrentTime], [CurrentMoney], [StatusAccount]) VALUES (8, N'barca', N'123', N'Hội viên', CAST(N'00:00:00' AS Time), 0, N'Hết Thời Gian')
INSERT [dbo].[Member] ([MemberID], [AccountName], [Password], [GroupUser], [CurrentTime], [CurrentMoney], [StatusAccount]) VALUES (9, N'realmadrid', N'123', N'Hội viên', CAST(N'00:00:00' AS Time), 0, N'Hết Thời Gian')
INSERT [dbo].[Member] ([MemberID], [AccountName], [Password], [GroupUser], [CurrentTime], [CurrentMoney], [StatusAccount]) VALUES (11, N'haivl', N'123', N'Hội viên', CAST(N'05:00:00' AS Time), 50000, N'Cho Phép')
INSERT [dbo].[Member] ([MemberID], [AccountName], [Password], [GroupUser], [CurrentTime], [CurrentMoney], [StatusAccount]) VALUES (12, N'xemvn', N'123', N'Hội viên', CAST(N'08:00:00' AS Time), 80000, N'Cho Phép')
INSERT [dbo].[Member] ([MemberID], [AccountName], [Password], [GroupUser], [CurrentTime], [CurrentMoney], [StatusAccount]) VALUES (13, N'facebook', N'123', N'Hội viên', CAST(N'03:00:00' AS Time), 30000, N'Cho Phép')
INSERT [dbo].[Member] ([MemberID], [AccountName], [Password], [GroupUser], [CurrentTime], [CurrentMoney], [StatusAccount]) VALUES (23, N'loganz', N'123', N'Hội viên', CAST(N'09:28:56' AS Time), 94666, N'Cho Phép')
INSERT [dbo].[Member] ([MemberID], [AccountName], [Password], [GroupUser], [CurrentTime], [CurrentMoney], [StatusAccount]) VALUES (24, N'taynguyen', N'123', N'Hội viên', CAST(N'05:00:00' AS Time), 50000, N'Cho phép')
INSERT [dbo].[Member] ([MemberID], [AccountName], [Password], [GroupUser], [CurrentTime], [CurrentMoney], [StatusAccount]) VALUES (26, N'quangbao', N'123', N'Hội viên', CAST(N'02:30:00' AS Time), 25000, N'Cho phép')
SET IDENTITY_INSERT [dbo].[Member] OFF
GO
SET IDENTITY_INSERT [dbo].[TheCard] ON 

INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (1, N'GATE 20K', N'Thẻ Game', 20000, N'Thẻ', 51)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (2, N'GATE 30K', N'Thẻ Game', 30000, N'Thẻ', 60)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (3, N'GATE 50K', N'Thẻ Game', 50000, N'Thẻ', 42)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (4, N'GATE 100K', N'Thẻ Game', 100000, N'Thẻ', 22)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (5, N'VINAGAME 20K', N'Thẻ Game', 20000, N'Thẻ', 35)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (6, N'VINAGAME 50K', N'Thẻ Game', 50000, N'Thẻ', 39)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (7, N'VINAGAME 100K', N'Thẻ Game', 100000, N'Thẻ', 21)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (8, N'ZING 20K', N'Thẻ Game', 20000, N'Thẻ', 36)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (9, N'ZING 50K', N'Thẻ Game', 50000, N'Thẻ', 25)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (10, N'ZING 100K', N'Thẻ Game', 100000, N'Thẻ', 19)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (11, N'VTC ONLINE 20K', N'Thẻ Game', 20000, N'Thẻ', 62)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (12, N'VTC ONLINE 50K', N'Thẻ Game', 50000, N'Thẻ', 35)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (13, N'VTC ONLINE 100K', N'Thẻ Game', 100000, N'Thẻ', 26)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (14, N'VTC ONLINE 200K', N'Thẻ Game', 200000, N'Thẻ', 12)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (15, N'GARENA 20K', N'Thẻ Game', 20000, N'Thẻ', 80)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (16, N'GARENA 30K', N'Thẻ Game', 30000, N'Thẻ', 120)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (17, N'GARENA 50K', N'Thẻ Game', 50000, N'Thẻ', 110)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (18, N'GARENA 100K', N'Thẻ Game', 100000, N'Thẻ', 40)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (19, N'GARENA 200K', N'Thẻ Game', 200000, N'Thẻ', 25)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (20, N'Mobifone 10K', N'Thẻ Điện Thoại', 10000, N'Thẻ', 76)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (21, N'Mobifone 20K', N'Thẻ Điện Thoại', 20000, N'Thẻ', 80)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (22, N'Mobifone 50K', N'Thẻ Điện Thoại', 50000, N'Thẻ', 56)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (23, N'Mobifone 100K', N'Thẻ Điện Thoại', 100000, N'Thẻ', 40)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (24, N'Mobifone 200K', N'Thẻ Điện Thoại', 200000, N'Thẻ', 21)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (25, N'Vinaphone 10K', N'Thẻ Điện Thoại', 10000, N'Thẻ', 54)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (26, N'Vinaphone 20K', N'Thẻ Điện Thoại', 20000, N'Thẻ', 60)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (27, N'Vinaphone 50K', N'Thẻ Điện Thoại', 50000, N'Thẻ', 32)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (28, N'Vinaphone 100K', N'Thẻ Điện Thoại', 100000, N'Thẻ', 16)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (29, N'Viettel 10K', N'Thẻ Điện Thoại', 10000, N'Thẻ', 84)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (30, N'Viettel 20K', N'Thẻ Điện Thoại', 20000, N'Thẻ', 69)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (31, N'Viettel 50K', N'Thẻ Điện Thoại', 50000, N'Thẻ', 54)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (32, N'Viettel 100K', N'Thẻ Điện Thoại', 100000, N'Thẻ', 32)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (33, N'VietNamMobile 10K', N'Thẻ Điện Thoại', 10000, N'Thẻ', 45)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (34, N'VietNamMobile 20K', N'Thẻ Điện Thoại', 20000, N'Thẻ', 54)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (35, N'VietNamMobile 50K', N'Thẻ Điện Thoại', 50000, N'Thẻ', 25)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (36, N'VietNamMobile 100K', N'Thẻ Điện Thoại', 100000, N'Thẻ', 14)
SET IDENTITY_INSERT [dbo].[TheCard] OFF
GO
INSERT [dbo].[TheUser] ([UserName], [Type], [GroupUser], [PhoneNumber], [Email]) VALUES (N'Hoàng Hải', N'Manager', N'Quản lý', N'0961563202', N'hoanghai@gmail.com')
INSERT [dbo].[TheUser] ([UserName], [Type], [GroupUser], [PhoneNumber], [Email]) VALUES (N'Huyền Trang', N'Staff', N'Nhân viên', N'0123456789', N'trang@gmail.com')
INSERT [dbo].[TheUser] ([UserName], [Type], [GroupUser], [PhoneNumber], [Email]) VALUES (N'Văn Tiến', N'Staff', N'Nhân viên', N'097851364', N'tien@gmail.com')
GO
ALTER TABLE [dbo].[AfterPayClient]  WITH CHECK ADD  CONSTRAINT [FK__AfterPayC__BillI__5812160E] FOREIGN KEY([BillID])
REFERENCES [dbo].[Bill] ([BillID])
GO
ALTER TABLE [dbo].[AfterPayClient] CHECK CONSTRAINT [FK__AfterPayC__BillI__5812160E]
GO
ALTER TABLE [dbo].[AfterPayClient]  WITH CHECK ADD  CONSTRAINT [FK__AfterPayC__Clien__571DF1D5] FOREIGN KEY([ClientName])
REFERENCES [dbo].[Client] ([ClientName])
GO
ALTER TABLE [dbo].[AfterPayClient] CHECK CONSTRAINT [FK__AfterPayC__Clien__571DF1D5]
GO
ALTER TABLE [dbo].[BeforePayClient]  WITH CHECK ADD  CONSTRAINT [FK__BeforePay__BillI__5BE2A6F2] FOREIGN KEY([BillID])
REFERENCES [dbo].[Bill] ([BillID])
GO
ALTER TABLE [dbo].[BeforePayClient] CHECK CONSTRAINT [FK__BeforePay__BillI__5BE2A6F2]
GO
ALTER TABLE [dbo].[BeforePayClient]  WITH CHECK ADD  CONSTRAINT [FK__BeforePay__Clien__5AEE82B9] FOREIGN KEY([ClientName])
REFERENCES [dbo].[Client] ([ClientName])
GO
ALTER TABLE [dbo].[BeforePayClient] CHECK CONSTRAINT [FK__BeforePay__Clien__5AEE82B9]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK__Bill__FoundedUse__5441852A] FOREIGN KEY([FoundedUser])
REFERENCES [dbo].[TheUser] ([UserName])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK__Bill__FoundedUse__5441852A]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK__Client__GroupCli__2F10007B] FOREIGN KEY([GroupClientName])
REFERENCES [dbo].[GroupClient] ([GroupName])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK__Client__GroupCli__2F10007B]
GO
ALTER TABLE [dbo].[Drink]  WITH CHECK ADD  CONSTRAINT [FK__Drink__CategoryN__33D4B598] FOREIGN KEY([CategoryName])
REFERENCES [dbo].[Category] ([CategoryName])
GO
ALTER TABLE [dbo].[Drink] CHECK CONSTRAINT [FK__Drink__CategoryN__33D4B598]
GO
ALTER TABLE [dbo].[Food]  WITH CHECK ADD  CONSTRAINT [FK__Food__CategoryNa__36B12243] FOREIGN KEY([CategoryName])
REFERENCES [dbo].[Category] ([CategoryName])
GO
ALTER TABLE [dbo].[Food] CHECK CONSTRAINT [FK__Food__CategoryNa__36B12243]
GO
ALTER TABLE [dbo].[GroupClientAndGroupUser]  WITH CHECK ADD  CONSTRAINT [FK__GroupClie__Group__2B3F6F97] FOREIGN KEY([GroupUserName])
REFERENCES [dbo].[GroupUser] ([GroupName])
GO
ALTER TABLE [dbo].[GroupClientAndGroupUser] CHECK CONSTRAINT [FK__GroupClie__Group__2B3F6F97]
GO
ALTER TABLE [dbo].[GroupClientAndGroupUser]  WITH CHECK ADD  CONSTRAINT [FK__GroupClie__Group__2C3393D0] FOREIGN KEY([GroupClientName])
REFERENCES [dbo].[GroupClient] ([GroupName])
GO
ALTER TABLE [dbo].[GroupClientAndGroupUser] CHECK CONSTRAINT [FK__GroupClie__Group__2C3393D0]
GO
ALTER TABLE [dbo].[LoginMember]  WITH CHECK ADD  CONSTRAINT [FK__LoginMemb__Clien__4BAC3F29] FOREIGN KEY([ClientName])
REFERENCES [dbo].[Client] ([ClientName])
GO
ALTER TABLE [dbo].[LoginMember] CHECK CONSTRAINT [FK__LoginMemb__Clien__4BAC3F29]
GO
ALTER TABLE [dbo].[LoginMember]  WITH CHECK ADD  CONSTRAINT [FK__LoginMemb__membe__4AB81AF0] FOREIGN KEY([memberID])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[LoginMember] CHECK CONSTRAINT [FK__LoginMemb__membe__4AB81AF0]
GO
ALTER TABLE [dbo].[Member]  WITH CHECK ADD  CONSTRAINT [FK__Member__GroupUse__47DBAE45] FOREIGN KEY([GroupUser])
REFERENCES [dbo].[GroupUser] ([GroupName])
GO
ALTER TABLE [dbo].[Member] CHECK CONSTRAINT [FK__Member__GroupUse__47DBAE45]
GO
ALTER TABLE [dbo].[MemberInformation]  WITH CHECK ADD  CONSTRAINT [FK__MemberInf__membe__4E88ABD4] FOREIGN KEY([memberID])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[MemberInformation] CHECK CONSTRAINT [FK__MemberInf__membe__4E88ABD4]
GO
ALTER TABLE [dbo].[OrderCard]  WITH CHECK ADD  CONSTRAINT [FK__OrderCard__CardI__44FF419A] FOREIGN KEY([CardID])
REFERENCES [dbo].[TheCard] ([CardID])
GO
ALTER TABLE [dbo].[OrderCard] CHECK CONSTRAINT [FK__OrderCard__CardI__44FF419A]
GO
ALTER TABLE [dbo].[OrderCard]  WITH CHECK ADD  CONSTRAINT [FK__OrderCard__Clien__440B1D61] FOREIGN KEY([ClientName])
REFERENCES [dbo].[Client] ([ClientName])
GO
ALTER TABLE [dbo].[OrderCard] CHECK CONSTRAINT [FK__OrderCard__Clien__440B1D61]
GO
ALTER TABLE [dbo].[OrderDrink]  WITH CHECK ADD  CONSTRAINT [FK__OrderDrin__Clien__3C69FB99] FOREIGN KEY([ClientName])
REFERENCES [dbo].[Client] ([ClientName])
GO
ALTER TABLE [dbo].[OrderDrink] CHECK CONSTRAINT [FK__OrderDrin__Clien__3C69FB99]
GO
ALTER TABLE [dbo].[OrderDrink]  WITH CHECK ADD  CONSTRAINT [FK__OrderDrin__Drink__3D5E1FD2] FOREIGN KEY([DrinkID])
REFERENCES [dbo].[Drink] ([DrinkID])
GO
ALTER TABLE [dbo].[OrderDrink] CHECK CONSTRAINT [FK__OrderDrin__Drink__3D5E1FD2]
GO
ALTER TABLE [dbo].[OrderFood]  WITH CHECK ADD  CONSTRAINT [FK__OrderFood__Clien__403A8C7D] FOREIGN KEY([ClientName])
REFERENCES [dbo].[Client] ([ClientName])
GO
ALTER TABLE [dbo].[OrderFood] CHECK CONSTRAINT [FK__OrderFood__Clien__403A8C7D]
GO
ALTER TABLE [dbo].[OrderFood]  WITH CHECK ADD  CONSTRAINT [FK__OrderFood__FoodI__412EB0B6] FOREIGN KEY([FoodID])
REFERENCES [dbo].[Food] ([FoodID])
GO
ALTER TABLE [dbo].[OrderFood] CHECK CONSTRAINT [FK__OrderFood__FoodI__412EB0B6]
GO
ALTER TABLE [dbo].[TheCard]  WITH CHECK ADD  CONSTRAINT [FK__TheCard__Categor__398D8EEE] FOREIGN KEY([CategoryName])
REFERENCES [dbo].[Category] ([CategoryName])
GO
ALTER TABLE [dbo].[TheCard] CHECK CONSTRAINT [FK__TheCard__Categor__398D8EEE]
GO
ALTER TABLE [dbo].[TheUser]  WITH CHECK ADD  CONSTRAINT [FK__TheUser__GroupUs__286302EC] FOREIGN KEY([GroupUser])
REFERENCES [dbo].[GroupUser] ([GroupName])
GO
ALTER TABLE [dbo].[TheUser] CHECK CONSTRAINT [FK__TheUser__GroupUs__286302EC]
GO
ALTER TABLE [dbo].[TransactionDiary]  WITH CHECK ADD  CONSTRAINT [FK__Transacti__membe__5165187F] FOREIGN KEY([memberID])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[TransactionDiary] CHECK CONSTRAINT [FK__Transacti__membe__5165187F]
GO
ALTER TABLE [dbo].[TransactionDiary]  WITH CHECK ADD  CONSTRAINT [FK__Transacti__UserN__5070F446] FOREIGN KEY([UserName])
REFERENCES [dbo].[TheUser] ([UserName])
GO
ALTER TABLE [dbo].[TransactionDiary] CHECK CONSTRAINT [FK__Transacti__UserN__5070F446]
GO
USE [master]
GO
ALTER DATABASE [QuanLyPhongNet] SET  READ_WRITE 
GO
