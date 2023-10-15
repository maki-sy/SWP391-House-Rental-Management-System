USE [master]
GO
/****** Object:  Database [SWP391]    Script Date: 10/15/2023 8:09:47 AM ******/
CREATE DATABASE [SWP391]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SWP391', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SWP391.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SWP391_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SWP391_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SWP391] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SWP391].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SWP391] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SWP391] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SWP391] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SWP391] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SWP391] SET ARITHABORT OFF 
GO
ALTER DATABASE [SWP391] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SWP391] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SWP391] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SWP391] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SWP391] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SWP391] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SWP391] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SWP391] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SWP391] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SWP391] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SWP391] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SWP391] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SWP391] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SWP391] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SWP391] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SWP391] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SWP391] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SWP391] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SWP391] SET  MULTI_USER 
GO
ALTER DATABASE [SWP391] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SWP391] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SWP391] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SWP391] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SWP391] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SWP391] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SWP391] SET QUERY_STORE = ON
GO
ALTER DATABASE [SWP391] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SWP391]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 10/15/2023 8:09:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[id] [int] NOT NULL,
	[first_name] [nvarchar](20) NULL,
	[last_name] [nvarchar](20) NULL,
	[Phone] [nvarchar](15) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Landlord]    Script Date: 10/15/2023 8:09:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Landlord](
	[id] [int] NOT NULL,
	[first_name] [nvarchar](20) NULL,
	[last_name] [nvarchar](20) NULL,
	[address] [nvarchar](255) NULL,
	[phone] [varchar](15) NULL,
	[civil_id] [varchar](50) NULL,
	[account_points] [int] NULL,
 CONSTRAINT [PK_Landlord] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 10/15/2023 8:09:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[tenant_id] [int] NULL,
	[landlord_id] [int] NULL,
	[post_id] [int] NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 10/15/2023 8:09:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[price] [int] NULL,
	[type] [int] NULL,
	[area] [int] NULL,
	[NumOfBedrooms] [int] NULL,
	[address] [nvarchar](255) NULL,
	[description] [nvarchar](2000) NULL,
	[landlord_id] [int] NULL,
	[location_id] [int] NULL,
	[status] [nvarchar](20) NULL,
	[promotion_id] [int] NULL,
	[post_start_date] [date] NULL,
	[post_end_date] [date] NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post_Image]    Script Date: 10/15/2023 8:09:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post_Image](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[post_id] [int] NULL,
	[img_url] [nvarchar](max) NULL,
	[img_type] [nvarchar](20) NULL,
 CONSTRAINT [PK_Post_image] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotions]    Script Date: 10/15/2023 8:09:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotions](
	[promotion_id] [int] IDENTITY(1,1) NOT NULL,
	[discount] [int] NULL,
	[descriptions] [nvarchar](255) NULL,
	[promotion_start_date] [date] NULL,
	[promotion_end_date] [date] NULL,
 CONSTRAINT [PK_Promotions] PRIMARY KEY CLUSTERED 
(
	[promotion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Property_Location]    Script Date: 10/15/2023 8:09:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Property_Location](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[location_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Property_type]    Script Date: 10/15/2023 8:09:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Property_type](
	[type_id] [int] IDENTITY(1,1) NOT NULL,
	[type_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_typeID] PRIMARY KEY CLUSTERED 
(
	[type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report]    Script Date: 10/15/2023 8:09:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[report_id] [int] IDENTITY(1,1) NOT NULL,
	[reporter_id] [int] NULL,
	[property_id] [int] NULL,
	[reported_id] [int] NULL,
	[report_date] [datetime] NULL,
	[categories] [nvarchar](100) NULL,
	[description] [text] NULL,
	[status] [nvarchar](20) NULL,
 CONSTRAINT [PK_Report] PRIMARY KEY CLUSTERED 
(
	[report_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 10/15/2023 8:09:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[review_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[property_id] [int] NULL,
	[review_date] [datetime] NULL,
	[rating] [smallint] NULL,
	[review] [nvarchar](300) NULL,
 CONSTRAINT [PK_Review] PRIMARY KEY CLUSTERED 
(
	[review_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tenant]    Script Date: 10/15/2023 8:09:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tenant](
	[id] [int] NOT NULL,
	[first_name] [nvarchar](20) NULL,
	[last_name] [nvarchar](20) NULL,
	[address] [nvarchar](255) NULL,
	[phone] [varchar](15) NULL,
	[civil_id] [varchar](50) NULL,
 CONSTRAINT [PK_Tenant] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Token]    Script Date: 10/15/2023 8:09:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Token](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[email] [varchar](100) NULL,
	[token] [varchar](255) NULL,
	[expired_date] [datetime] NULL,
	[type] [varchar](50) NULL,
 CONSTRAINT [PK_Token] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 10/15/2023 8:09:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[transaction_id] [int] IDENTITY(1,1) NOT NULL,
	[amount] [decimal](19, 0) NOT NULL,
	[payer_id] [int] NOT NULL,
	[receiver_id] [int] NOT NULL,
	[type] [varchar](20) NULL,
	[transaction_date] [date] NOT NULL,
	[post_id] [int] NULL,
 CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED 
(
	[transaction_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_banned]    Script Date: 10/15/2023 8:09:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_banned](
	[id] [int] NOT NULL,
	[email] [varchar](100) NULL,
	[ban_start_date] [datetime] NULL,
	[ban_end_date] [datetime] NULL,
	[status] [varchar](20) NULL,
 CONSTRAINT [PK_User_banned] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_role]    Script Date: 10/15/2023 8:09:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_User_Role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/15/2023 8:09:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](100) NULL,
	[hashed_password] [varbinary](80) NULL,
	[salt] [varbinary](50) NULL,
	[role_id] [int] NULL,
	[status] [nvarchar](20) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wishlist]    Script Date: 10/15/2023 8:09:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wishlist](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[property_id] [int] NULL,
 CONSTRAINT [PK_Wishlist] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Admin] ([id], [first_name], [last_name], [Phone]) VALUES (1, N'Truong', N'Sy', N'0942010101')
INSERT [dbo].[Admin] ([id], [first_name], [last_name], [Phone]) VALUES (3, N'Thang', N'Ha', N'0382721058')
INSERT [dbo].[Admin] ([id], [first_name], [last_name], [Phone]) VALUES (4, N'Thang', N'Ha', N'0382721058')
INSERT [dbo].[Admin] ([id], [first_name], [last_name], [Phone]) VALUES (11, N'Thang', N'Ha', N'0382721058')
GO
INSERT [dbo].[Landlord] ([id], [first_name], [last_name], [address], [phone], [civil_id], [account_points]) VALUES (2, N'Thang', N'Ha Quang', NULL, N'0382721058', NULL, 9919)
INSERT [dbo].[Landlord] ([id], [first_name], [last_name], [address], [phone], [civil_id], [account_points]) VALUES (5, N'Sy', N'Truong', N'259 Burbank Street, Texas', N'0942565656', NULL, 0)
INSERT [dbo].[Landlord] ([id], [first_name], [last_name], [address], [phone], [civil_id], [account_points]) VALUES (6, N'Hieu', N'Nguyen', N'259 Burbank Street, Texas', N'0942676767', NULL, 2000)
INSERT [dbo].[Landlord] ([id], [first_name], [last_name], [address], [phone], [civil_id], [account_points]) VALUES (7, N'Minh', N'Nguyen', N'159 Wall Street, New York City', N'0942434343', NULL, 13000)
INSERT [dbo].[Landlord] ([id], [first_name], [last_name], [address], [phone], [civil_id], [account_points]) VALUES (8, N'Thang', N'Ha', N'101 Plankton Street, Virginia', N'0944121212', NULL, 20)
INSERT [dbo].[Landlord] ([id], [first_name], [last_name], [address], [phone], [civil_id], [account_points]) VALUES (9, N'Thang', N'Ha Quang', NULL, N'0382721058', NULL, 9919)
INSERT [dbo].[Landlord] ([id], [first_name], [last_name], [address], [phone], [civil_id], [account_points]) VALUES (10, N'Thang', N'Ha Quang', NULL, N'0382721058', NULL, 9919)
INSERT [dbo].[Landlord] ([id], [first_name], [last_name], [address], [phone], [civil_id], [account_points]) VALUES (12, N'Tuan', N'Anh', N'Vinh Phuc', N'0326673227', NULL, 9807)
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([order_id], [tenant_id], [landlord_id], [post_id], [status]) VALUES (1, 1, 1, 1, N'Approved')
INSERT [dbo].[Orders] ([order_id], [tenant_id], [landlord_id], [post_id], [status]) VALUES (2, 2, 2, 2, N'Rejected')
INSERT [dbo].[Orders] ([order_id], [tenant_id], [landlord_id], [post_id], [status]) VALUES (3, 2, 2, 3, N'Rejected')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([id], [name], [price], [type], [area], [NumOfBedrooms], [address], [description], [landlord_id], [location_id], [status], [promotion_id], [post_start_date], [post_end_date]) VALUES (1, N'Nha Tro Hoa Hong', 2000, 1, 20, 2, N'270 Duong Lang, Dong Da, Ha Noi', N'Nhà trọ hiện đại với nội thất sang trọng, gần trung tâm thành phố, thuận lợi cho người làm việc.', 6, 1, N'basic', NULL, CAST(N'2022-07-25' AS Date), CAST(N'2022-08-25' AS Date))
INSERT [dbo].[Post] ([id], [name], [price], [type], [area], [NumOfBedrooms], [address], [description], [landlord_id], [location_id], [status], [promotion_id], [post_start_date], [post_end_date]) VALUES (2, N'Nha Tro Thai Binh', 800, 1, 10, 1, N'27 Duong Song Da, Long Bien, Ha Noi', N'Căn hộ dịch vụ tại trung tâm thương mại, sát bên các quán ăn và cửa hàng mua sắm.

', 6, 1, N'basic', NULL, CAST(N'2022-07-25' AS Date), CAST(N'2022-08-25' AS Date))
INSERT [dbo].[Post] ([id], [name], [price], [type], [area], [NumOfBedrooms], [address], [description], [landlord_id], [location_id], [status], [promotion_id], [post_start_date], [post_end_date]) VALUES (3, N'Nha Tro Co Loan', 1000, 1, 15, 2, N'210 Duong Hai Ba Trung, Cau Giay, Ha Noi', N'Phòng trọ sạch sẽ, thoáng mát, có ban công rộng rãi với tầm nhìn đẹp.

', 7, 1, N'basic', 2, CAST(N'2023-07-26' AS Date), CAST(N'2023-08-26' AS Date))
INSERT [dbo].[Post] ([id], [name], [price], [type], [area], [NumOfBedrooms], [address], [description], [landlord_id], [location_id], [status], [promotion_id], [post_start_date], [post_end_date]) VALUES (4, N'Nha Tro Co Hang', 1200, 1, 15, 1, N'120 Duong Ho Chi Minh, Cau Giay, Ha Noi', N'Nhà trọ gia đình, ấm cúng và yên tĩnh, phù hợp cho người muốn cảm giác như ở nhà.

', 7, 2, N'basic', 1, CAST(N'2023-07-26' AS Date), CAST(N'2023-08-26' AS Date))
INSERT [dbo].[Post] ([id], [name], [price], [type], [area], [NumOfBedrooms], [address], [description], [landlord_id], [location_id], [status], [promotion_id], [post_start_date], [post_end_date]) VALUES (5, N'Nha Tro FU', 1800, 1, 20, 2, N'20 Duong Thang Long, Dong Da, Ha Noi', N'Căn hộ studio cho người độc thân, tiện nghi và giá cả phải chăng.

', 7, 2, N'standard', NULL, CAST(N'2022-07-25' AS Date), CAST(N'2022-08-25' AS Date))
INSERT [dbo].[Post] ([id], [name], [price], [type], [area], [NumOfBedrooms], [address], [description], [landlord_id], [location_id], [status], [promotion_id], [post_start_date], [post_end_date]) VALUES (6, N'Chung cu Phenika', 1500, 2, 18, 1, N'75 Duong Giai Phong, Thanh Xuan, Ha Noi', N'Phòng trọ thích hợp cho sinh viên, gần các trường đại học và có wifi tốc độ cao.

', 8, 2, N'standard', NULL, CAST(N'2023-01-11' AS Date), CAST(N'2023-02-11' AS Date))
INSERT [dbo].[Post] ([id], [name], [price], [type], [area], [NumOfBedrooms], [address], [description], [landlord_id], [location_id], [status], [promotion_id], [post_start_date], [post_end_date]) VALUES (7, N'Chung cu Hoa Lac', 1200, 2, 14, 1, N'25 Duong Le Hong Phong, Hoan Kiem, Ha Noi', N'Nhà trọ dành cho người cao tuổi, với dịch vụ chăm sóc 24/7.

', 8, 3, N'standard', NULL, CAST(N'2023-06-24' AS Date), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[Post] ([id], [name], [price], [type], [area], [NumOfBedrooms], [address], [description], [landlord_id], [location_id], [status], [promotion_id], [post_start_date], [post_end_date]) VALUES (8, N'Chung cu HoLA', 1500, 2, 20, 1, N'234 Yen Lang, Dong Da, Ha Noi', N'Phòng trọ cho gia đình nhỏ, gần công viên và trường học.

', 6, 3, N'premium', 3, CAST(N'2023-06-24' AS Date), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[Post] ([id], [name], [price], [type], [area], [NumOfBedrooms], [address], [description], [landlord_id], [location_id], [status], [promotion_id], [post_start_date], [post_end_date]) VALUES (9, N'Chung cu Funfact', 2100, 2, 20, 3, N'250 Yen Lang, Dong Da, Ha Noi', N'Căn hộ dịch vụ 2 phòng ngủ, phù hợp cho cặp đôi hoặc gia đình nhỏ.

', 6, 4, N'premium', NULL, CAST(N'2023-06-02' AS Date), CAST(N'2023-07-02' AS Date))
INSERT [dbo].[Post] ([id], [name], [price], [type], [area], [NumOfBedrooms], [address], [description], [landlord_id], [location_id], [status], [promotion_id], [post_start_date], [post_end_date]) VALUES (10, N'Chung cu ABC', 900, 2, 20, 2, N'102 Pham Hung, Cau Giay, Ha Noi', N'Nhà trọ tiện nghi với bếp riêng, thích hợp cho người thích nấu ăn.

', 7, 4, N'premium', NULL, CAST(N'2023-06-21' AS Date), CAST(N'2023-07-21' AS Date))
INSERT [dbo].[Post] ([id], [name], [price], [type], [area], [NumOfBedrooms], [address], [description], [landlord_id], [location_id], [status], [promotion_id], [post_start_date], [post_end_date]) VALUES (11, N'Chung cu HLE', 1500, 2, 20, 1, N'234 Yen Lang, Dong Da, Ha Noi', N'Phòng trọ gần bãi biển, có hồ bơi và tiện ích nghỉ dưỡng.

', 6, 4, N'deleted', NULL, CAST(N'2023-06-24' AS Date), CAST(N'2023-06-30' AS Date))
INSERT [dbo].[Post] ([id], [name], [price], [type], [area], [NumOfBedrooms], [address], [description], [landlord_id], [location_id], [status], [promotion_id], [post_start_date], [post_end_date]) VALUES (15, N'Chung cu Tuan Anh', 9999, 2, 30, 4, N'Vinh Yen, Vinh Phuc', N'Căn hộ chung cư cao cấp, an ninh 24/7 và dịch vụ concierge.

', 6, 4, N'deleted', NULL, NULL, NULL)
INSERT [dbo].[Post] ([id], [name], [price], [type], [area], [NumOfBedrooms], [address], [description], [landlord_id], [location_id], [status], [promotion_id], [post_start_date], [post_end_date]) VALUES (17, N'Nha Tro Quang Thang', 9999, 2, 20, 10, N'Thai Nguyen', N'Nhà trọ cho người yêu thú cưng, có sân vườn lớn để chó con chơi đùa.

', 12, 1, N'deleted', NULL, NULL, NULL)
INSERT [dbo].[Post] ([id], [name], [price], [type], [area], [NumOfBedrooms], [address], [description], [landlord_id], [location_id], [status], [promotion_id], [post_start_date], [post_end_date]) VALUES (18, N'Nha Tro Quang Thang', 9999, 2, 20, 10, N'Thai Nguyen', N'Căn hộ chung cư mini với nội thất tiện ích và thiết kế thông minh.

', 12, 1, N'premium', NULL, CAST(N'2023-10-12' AS Date), CAST(N'2024-04-12' AS Date))
INSERT [dbo].[Post] ([id], [name], [price], [type], [area], [NumOfBedrooms], [address], [description], [landlord_id], [location_id], [status], [promotion_id], [post_start_date], [post_end_date]) VALUES (19, N'Nha Tro Tuan Anh', 1234, 2, 20, 2, N'Tam Duong, Vinh Phuc', N'Phòng trọ tại khu vực trung tâm kinh doanh, gần các công ty và văn phòng.

', 12, 60, N'premium', NULL, CAST(N'2023-10-12' AS Date), CAST(N'2024-04-12' AS Date))
INSERT [dbo].[Post] ([id], [name], [price], [type], [area], [NumOfBedrooms], [address], [description], [landlord_id], [location_id], [status], [promotion_id], [post_start_date], [post_end_date]) VALUES (20, N'Nha Tro Duc Hieu', 123, 2, 20, 3, N'Hung Yen, Viet Nam', N'Nhà trọ ở quê, gần vườn cây và không gian yên tĩnh.

', 12, 29, N'premium', NULL, CAST(N'2023-10-13' AS Date), CAST(N'2024-04-13' AS Date))
INSERT [dbo].[Post] ([id], [name], [price], [type], [area], [NumOfBedrooms], [address], [description], [landlord_id], [location_id], [status], [promotion_id], [post_start_date], [post_end_date]) VALUES (21, N'Nha Tro Hai Thinh', 1234, 2, 20, 2, N'Hung Yen, Viet Nam', N'Căn hộ chung cư với gara riêng, thuận lợi cho người có xe hơi.

', 12, 29, N'premium', NULL, CAST(N'2023-10-13' AS Date), CAST(N'2024-04-13' AS Date))
INSERT [dbo].[Post] ([id], [name], [price], [type], [area], [NumOfBedrooms], [address], [description], [landlord_id], [location_id], [status], [promotion_id], [post_start_date], [post_end_date]) VALUES (22, N'Nha Tro Anh Long', 1234, 1, 23, 15, N'Ha Noi, Viet Nam', N'Phòng trọ tại khu vực quận ẩm ướt với không gian xanh mát và dịch vụ phòng tắm xông hơi.




', 12, 1, N'deleted', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Post] OFF
GO
SET IDENTITY_INSERT [dbo].[Post_Image] ON 

INSERT [dbo].[Post_Image] ([id], [post_id], [img_url], [img_type]) VALUES (1, 1, N'./assets/img/property-1.jpg', N'thumbnails')
INSERT [dbo].[Post_Image] ([id], [post_id], [img_url], [img_type]) VALUES (2, 1, N'./assets/img/main1.jpg', N'main')
INSERT [dbo].[Post_Image] ([id], [post_id], [img_url], [img_type]) VALUES (3, 1, N'./assets/img/main2.jpg', N'main')
INSERT [dbo].[Post_Image] ([id], [post_id], [img_url], [img_type]) VALUES (4, 2, N'./assets/img/property-2.jpg', N'thumbnails')
INSERT [dbo].[Post_Image] ([id], [post_id], [img_url], [img_type]) VALUES (5, 2, N'./assets/img/main3.jpg', N'main')
INSERT [dbo].[Post_Image] ([id], [post_id], [img_url], [img_type]) VALUES (6, 2, N'./assets/img/main4.jpg', N'main')
INSERT [dbo].[Post_Image] ([id], [post_id], [img_url], [img_type]) VALUES (7, 3, N'./assets/img/property-3.jpg', N'thumbnails')
INSERT [dbo].[Post_Image] ([id], [post_id], [img_url], [img_type]) VALUES (8, 4, N'./assets/img/property-4.jpg', N'thumbnails')
INSERT [dbo].[Post_Image] ([id], [post_id], [img_url], [img_type]) VALUES (10, 6, N'./assets/img/property-6.jpg', N'thumbnails')
INSERT [dbo].[Post_Image] ([id], [post_id], [img_url], [img_type]) VALUES (11, 7, N'./assets/img/property-7.jpg', N'thumbnails')
INSERT [dbo].[Post_Image] ([id], [post_id], [img_url], [img_type]) VALUES (12, 8, N'./assets/img/property-8.jpg', N'thumbnails')
INSERT [dbo].[Post_Image] ([id], [post_id], [img_url], [img_type]) VALUES (13, 9, N'./assets/img/property-9.jpg', N'thumbnails')
INSERT [dbo].[Post_Image] ([id], [post_id], [img_url], [img_type]) VALUES (14, 10, N'./assets/img/property-10.jpg', N'thumbnails')
INSERT [dbo].[Post_Image] ([id], [post_id], [img_url], [img_type]) VALUES (15, 11, N'./assets/img/property-11.jpg', N'thumbnails')
INSERT [dbo].[Post_Image] ([id], [post_id], [img_url], [img_type]) VALUES (16, 5, N'./assets/img/property-5.jpg', N'thumbnails')
INSERT [dbo].[Post_Image] ([id], [post_id], [img_url], [img_type]) VALUES (17, 17, N'./assets/img/property-3.jpg', N'thumbnails')
INSERT [dbo].[Post_Image] ([id], [post_id], [img_url], [img_type]) VALUES (18, 18, N'./assets/img/property-12.jpg', N'thumbnails')
INSERT [dbo].[Post_Image] ([id], [post_id], [img_url], [img_type]) VALUES (19, 19, N'./assets/img/property-13.jpg', N'thumbnails')
INSERT [dbo].[Post_Image] ([id], [post_id], [img_url], [img_type]) VALUES (20, 19, N'./assets/img/property-3.jpg', N'main')
INSERT [dbo].[Post_Image] ([id], [post_id], [img_url], [img_type]) VALUES (21, 3, N'./assets/img/main5.jpg', N'main')
INSERT [dbo].[Post_Image] ([id], [post_id], [img_url], [img_type]) VALUES (22, 20, N'./assets/img/property-14.jpg', N'thumbnails')
INSERT [dbo].[Post_Image] ([id], [post_id], [img_url], [img_type]) VALUES (23, 20, N'./assets/img/property-15.jpg', N'main')
INSERT [dbo].[Post_Image] ([id], [post_id], [img_url], [img_type]) VALUES (24, 3, N'./assets/img/main6.jpg', N'main')
INSERT [dbo].[Post_Image] ([id], [post_id], [img_url], [img_type]) VALUES (25, 21, N'./assets/img/property-15.jpg', N'thumbnails')
INSERT [dbo].[Post_Image] ([id], [post_id], [img_url], [img_type]) VALUES (26, 4, N'./assets/img/main7.jpg', N'main')
INSERT [dbo].[Post_Image] ([id], [post_id], [img_url], [img_type]) VALUES (27, 4, N'./assets/img/main8.jpg', N'main')
INSERT [dbo].[Post_Image] ([id], [post_id], [img_url], [img_type]) VALUES (28, 5, N'./assets/img/main9.jpg', N'main')
INSERT [dbo].[Post_Image] ([id], [post_id], [img_url], [img_type]) VALUES (29, 5, N'./assets/img/main11.jpg', N'main')
INSERT [dbo].[Post_Image] ([id], [post_id], [img_url], [img_type]) VALUES (30, 6, N'./assets/img/main12.png', N'main')
INSERT [dbo].[Post_Image] ([id], [post_id], [img_url], [img_type]) VALUES (31, 6, N'./assets/img/main13.jpg', N'main')
INSERT [dbo].[Post_Image] ([id], [post_id], [img_url], [img_type]) VALUES (32, 7, N'./assets/img/main14.png', N'main')
INSERT [dbo].[Post_Image] ([id], [post_id], [img_url], [img_type]) VALUES (33, 7, N'./assets/img/main15.jpg', N'main')
INSERT [dbo].[Post_Image] ([id], [post_id], [img_url], [img_type]) VALUES (34, 8, N'./assets/img/main16.jpg', N'main')
INSERT [dbo].[Post_Image] ([id], [post_id], [img_url], [img_type]) VALUES (35, 8, N'./assets/img/main17.jpg', N'main')
SET IDENTITY_INSERT [dbo].[Post_Image] OFF
GO
SET IDENTITY_INSERT [dbo].[Promotions] ON 

INSERT [dbo].[Promotions] ([promotion_id], [discount], [descriptions], [promotion_start_date], [promotion_end_date]) VALUES (1, 20, N'20% discount for the first 3 months of rent', CAST(N'2023-06-21' AS Date), CAST(N'2023-07-21' AS Date))
INSERT [dbo].[Promotions] ([promotion_id], [discount], [descriptions], [promotion_start_date], [promotion_end_date]) VALUES (2, 10, N'10% discount for the first month of rent', CAST(N'2023-06-21' AS Date), CAST(N'2023-07-21' AS Date))
INSERT [dbo].[Promotions] ([promotion_id], [discount], [descriptions], [promotion_start_date], [promotion_end_date]) VALUES (3, 50, N'50% for the first month if the length of contract is more than 3 months', CAST(N'2023-06-21' AS Date), CAST(N'2023-07-21' AS Date))
SET IDENTITY_INSERT [dbo].[Promotions] OFF
GO
SET IDENTITY_INSERT [dbo].[Property_Location] ON 

INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (1, N'Hanoi')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (2, N'Haiphong')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (3, N'Da Nang')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (4, N'Ho Chi Minh City')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (5, N'Can Tho')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (6, N'An Giang')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (7, N'Bac Giang')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (8, N'Bac Kan')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (9, N'Bac Ninh')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (10, N'Ba Ria - Vung Tau')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (11, N'Ben Tre')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (12, N'Binh Dinh')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (13, N'Binh Duong')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (14, N'Binh Phuoc')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (15, N'Binh Thuan')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (16, N'Ca Mau')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (17, N'Cao Bang')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (18, N'Dak Lak')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (19, N'Dak Nong')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (20, N'Dien Bien')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (21, N'Dong Nai')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (22, N'Dong Thap')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (23, N'Gia Lai')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (24, N'Ha Giang')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (25, N'Ha Nam')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (26, N'Ha Tinh')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (27, N'Hai Duong')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (28, N'Hoa Binh')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (29, N'Hung Yen')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (30, N'Khanh Hoa')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (31, N'Kien Giang')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (32, N'Kon Tum')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (33, N'Lai Chau')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (34, N'Lam Dong')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (35, N'Lang Son')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (36, N'Lao Cai')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (37, N'Long An')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (38, N'Nam Dinh')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (39, N'Nghe An')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (40, N'Ninh Binh')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (41, N'Ninh Thuan')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (42, N'Phu Tho')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (43, N'Phu Yen')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (44, N'Quang Binh')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (45, N'Quang Nam')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (46, N'Quang Ngai')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (47, N'Quang Ninh')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (48, N'Quang Tri')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (49, N'Soc Trang')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (50, N'Son La')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (51, N'Tay Ninh')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (52, N'Thai Binh')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (53, N'Thai Nguyen')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (54, N'Thanh Hoa')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (55, N'Thua Thien Hue')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (56, N'Tien Giang')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (57, N'Tra Vinh')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (58, N'Tuyen Quang')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (59, N'Vinh Long')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (60, N'Vinh Phuc')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (61, N'Yen Bai')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (62, N'Bac Long Vi Island')
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (63, N'Phu Quy Islands')
SET IDENTITY_INSERT [dbo].[Property_Location] OFF
GO
SET IDENTITY_INSERT [dbo].[Property_type] ON 

INSERT [dbo].[Property_type] ([type_id], [type_name]) VALUES (1, N'Nha Tro')
INSERT [dbo].[Property_type] ([type_id], [type_name]) VALUES (2, N'Chung cu')
SET IDENTITY_INSERT [dbo].[Property_type] OFF
GO
INSERT [dbo].[Tenant] ([id], [first_name], [last_name], [address], [phone], [civil_id]) VALUES (1, N'Thang', N'Ha', N'Thai Nguyen', N'0382721058', NULL)
INSERT [dbo].[Tenant] ([id], [first_name], [last_name], [address], [phone], [civil_id]) VALUES (2, N'Thang', N'Ha', N'259 Burbank Street, Texas', N'0942121212', NULL)
INSERT [dbo].[Tenant] ([id], [first_name], [last_name], [address], [phone], [civil_id]) VALUES (3, N'Thang', N'Ha', N'259 Burbank Street, Texas', N'0942343434', NULL)
INSERT [dbo].[Tenant] ([id], [first_name], [last_name], [address], [phone], [civil_id]) VALUES (4, N'Thang', N'Ha', N'259 Burbank Street, Texas', N'0942454545', NULL)
INSERT [dbo].[Tenant] ([id], [first_name], [last_name], [address], [phone], [civil_id]) VALUES (5, N'Thang', N'Ha', N'Thai Nguyen', N'0382721058', NULL)
INSERT [dbo].[Tenant] ([id], [first_name], [last_name], [address], [phone], [civil_id]) VALUES (9, N'Thang', N'Ha', N'Thai Nguyen', N'0382721058', NULL)
GO
SET IDENTITY_INSERT [dbo].[Token] ON 

INSERT [dbo].[Token] ([id], [user_id], [email], [token], [expired_date], [type]) VALUES (1, 12, N'anhnthe176694@fpt.edu.vn', N'uuGvbYE0EBtQ9gQO4irjvQz0W7k', CAST(N'2023-10-12T00:57:05.297' AS DateTime), N'CONFIRMATION')
SET IDENTITY_INSERT [dbo].[Token] OFF
GO
SET IDENTITY_INSERT [dbo].[Transactions] ON 

INSERT [dbo].[Transactions] ([transaction_id], [amount], [payer_id], [receiver_id], [type], [transaction_date], [post_id]) VALUES (1, CAST(200 AS Decimal(19, 0)), 1, 2, N'PAY', CAST(N'2023-06-23' AS Date), NULL)
INSERT [dbo].[Transactions] ([transaction_id], [amount], [payer_id], [receiver_id], [type], [transaction_date], [post_id]) VALUES (2, CAST(200 AS Decimal(19, 0)), 1, 3, N'PAY', CAST(N'2022-05-23' AS Date), 1)
INSERT [dbo].[Transactions] ([transaction_id], [amount], [payer_id], [receiver_id], [type], [transaction_date], [post_id]) VALUES (3, CAST(200 AS Decimal(19, 0)), 2, 4, N'PAY', CAST(N'2023-05-23' AS Date), 4)
INSERT [dbo].[Transactions] ([transaction_id], [amount], [payer_id], [receiver_id], [type], [transaction_date], [post_id]) VALUES (4, CAST(48 AS Decimal(19, 0)), 12, 1, N'DEPOSIT', CAST(N'2023-12-10' AS Date), 18)
INSERT [dbo].[Transactions] ([transaction_id], [amount], [payer_id], [receiver_id], [type], [transaction_date], [post_id]) VALUES (5, CAST(48 AS Decimal(19, 0)), 12, 1, N'DEPOSIT', CAST(N'2023-12-10' AS Date), 19)
SET IDENTITY_INSERT [dbo].[Transactions] OFF
GO
SET IDENTITY_INSERT [dbo].[User_role] ON 

INSERT [dbo].[User_role] ([id], [role_name]) VALUES (1, N'Tenant')
INSERT [dbo].[User_role] ([id], [role_name]) VALUES (2, N'Landlord')
INSERT [dbo].[User_role] ([id], [role_name]) VALUES (3, N'Admin')
SET IDENTITY_INSERT [dbo].[User_role] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [email], [hashed_password], [salt], [role_id], [status]) VALUES (1, N'sytthe176623@fpt.edu.vn', 0x0001E240, 0x0001E240, 3, N'VER')
INSERT [dbo].[Users] ([id], [email], [hashed_password], [salt], [role_id], [status]) VALUES (2, N'tungdthe176669@fpt.edu.vn', 0x0001E240, 0x0001E240, 1, N'VER')
INSERT [dbo].[Users] ([id], [email], [hashed_password], [salt], [role_id], [status]) VALUES (3, N'antnthe176694@fpt.edu.vn', 0x0001E240, 0x0001E240, 1, N'VER')
INSERT [dbo].[Users] ([id], [email], [hashed_password], [salt], [role_id], [status]) VALUES (4, N'thanghq176429@fpt.edu.vn', 0x0001E240, 0x0001E240, 1, N'VER')
INSERT [dbo].[Users] ([id], [email], [hashed_password], [salt], [role_id], [status]) VALUES (5, N'khanhnbhe170920@fpt.edu.vn', 0x0001E240, 0x0001E240, 2, N'VER')
INSERT [dbo].[Users] ([id], [email], [hashed_password], [salt], [role_id], [status]) VALUES (6, N'tienpvhe163824@fpt.edu.vn', 0x0001E240, 0x0001E240, 2, N'VER')
INSERT [dbo].[Users] ([id], [email], [hashed_password], [salt], [role_id], [status]) VALUES (7, N'asd@gmail.com', 0x0001E240, 0x0001E240, 2, N'UNV')
INSERT [dbo].[Users] ([id], [email], [hashed_password], [salt], [role_id], [status]) VALUES (8, N'asds@gmail.com', 0x0001E240, 0x0001E240, 2, N'UNV')
INSERT [dbo].[Users] ([id], [email], [hashed_password], [salt], [role_id], [status]) VALUES (9, N'haquangthangtn@gmail.com', 0x1B64B376E2F7F76192B30D9C0F2063657877260814ECBAD00E80DB81DA839E00315E1EF3C211CF25069E419911D763F68BA285785C409FB4CBC31DB1B8150862, 0x150FDD9D4720E6E381499A31E6A50CD3, 1, N'VER')
INSERT [dbo].[Users] ([id], [email], [hashed_password], [salt], [role_id], [status]) VALUES (10, N'thanghqhe176429@fpt.edu.vn', 0x89AF5D5F67D758391EDE9A5FF03769CF610C7242935FD58F4F60F9A906CE2AED866D01EA428ECB497304823D20EA93030F7365BDC5E80391B1E47F09603AD196, 0x832A581B87B4C48D684AF2F1F0EA40BA, 2, N'VER')
INSERT [dbo].[Users] ([id], [email], [hashed_password], [salt], [role_id], [status]) VALUES (11, N'admin@gmail.com', 0xE2E9E7DE8386ED2B050DD584591CEBD045E3963BC0F67AA4BAE8C589F84F922403E507F88835E947306270037972AA1F4883FDF8692EF435D3C363A496F71443, 0x6DFE08FCD2DFCF273C64A52BD6B4F6C6, 3, N'VER')
INSERT [dbo].[Users] ([id], [email], [hashed_password], [salt], [role_id], [status]) VALUES (12, N'anhnthe176694@fpt.edu.vn', 0x645FC3DC25B326132FFA34EE71A134E2686E33174A26C21E683F6367DAB01468145093DA7B08E87308F8AF2474405D6F4E5F266EF589C8AC7A5878CE2A4040C1, 0xB1D974920AC7EFD0AC262C8B3689A88B, 2, N'VER')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Wishlist] ON 

INSERT [dbo].[Wishlist] ([id], [user_id], [property_id]) VALUES (1, 2, 1)
INSERT [dbo].[Wishlist] ([id], [user_id], [property_id]) VALUES (2, 2, 2)
INSERT [dbo].[Wishlist] ([id], [user_id], [property_id]) VALUES (3, 2, 3)
INSERT [dbo].[Wishlist] ([id], [user_id], [property_id]) VALUES (4, 3, 7)
INSERT [dbo].[Wishlist] ([id], [user_id], [property_id]) VALUES (5, 3, 8)
INSERT [dbo].[Wishlist] ([id], [user_id], [property_id]) VALUES (6, 3, 9)
SET IDENTITY_INSERT [dbo].[Wishlist] OFF
GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD  CONSTRAINT [FK_Admin_User] FOREIGN KEY([id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Admin] CHECK CONSTRAINT [FK_Admin_User]
GO
ALTER TABLE [dbo].[Landlord]  WITH CHECK ADD  CONSTRAINT [FK_Landlord_User] FOREIGN KEY([id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Landlord] CHECK CONSTRAINT [FK_Landlord_User]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Landlord] FOREIGN KEY([landlord_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Landlord]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Post] FOREIGN KEY([post_id])
REFERENCES [dbo].[Post] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Post]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Tenant] FOREIGN KEY([tenant_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Tenant]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Landlord] FOREIGN KEY([landlord_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Landlord]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Location] FOREIGN KEY([location_id])
REFERENCES [dbo].[Property_Location] ([id])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Location]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_PropertyType] FOREIGN KEY([type])
REFERENCES [dbo].[Property_type] ([type_id])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_PropertyType]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Promotions_Post] FOREIGN KEY([promotion_id])
REFERENCES [dbo].[Promotions] ([promotion_id])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Promotions_Post]
GO
ALTER TABLE [dbo].[Post_Image]  WITH CHECK ADD  CONSTRAINT [FK_Post_image_Post] FOREIGN KEY([post_id])
REFERENCES [dbo].[Post] ([id])
GO
ALTER TABLE [dbo].[Post_Image] CHECK CONSTRAINT [FK_Post_image_Post]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK_Report_Post] FOREIGN KEY([property_id])
REFERENCES [dbo].[Post] ([id])
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK_Report_Post]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK_Report_Tenant1] FOREIGN KEY([reporter_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK_Report_Tenant1]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK_Report_Tenant2] FOREIGN KEY([reported_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK_Report_Tenant2]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Post] FOREIGN KEY([property_id])
REFERENCES [dbo].[Post] ([id])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Post]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Tenant] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Tenant]
GO
ALTER TABLE [dbo].[Tenant]  WITH CHECK ADD  CONSTRAINT [FK_Tenant_User] FOREIGN KEY([id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Tenant] CHECK CONSTRAINT [FK_Tenant_User]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_Admin] FOREIGN KEY([receiver_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transaction_Admin]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_Landlord] FOREIGN KEY([payer_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transaction_Landlord]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_Post] FOREIGN KEY([post_id])
REFERENCES [dbo].[Post] ([id])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transaction_Post]
GO
ALTER TABLE [dbo].[User_banned]  WITH CHECK ADD  CONSTRAINT [FK_User_banned_id] FOREIGN KEY([id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[User_banned] CHECK CONSTRAINT [FK_User_banned_id]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Role] FOREIGN KEY([role_id])
REFERENCES [dbo].[User_role] ([id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Role]
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD  CONSTRAINT [FK_Wishlist_Post] FOREIGN KEY([property_id])
REFERENCES [dbo].[Post] ([id])
GO
ALTER TABLE [dbo].[Wishlist] CHECK CONSTRAINT [FK_Wishlist_Post]
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD  CONSTRAINT [FK_Wishlist_Tenant] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Wishlist] CHECK CONSTRAINT [FK_Wishlist_Tenant]
GO
USE [master]
GO
ALTER DATABASE [SWP391] SET  READ_WRITE 
GO
