USE [master]
GO
/****** Object:  Database [SWP391]    Script Date: 12-Nov-23 9:56:06 PM ******/
CREATE DATABASE [SWP391]
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
/****** Object:  Table [dbo].[Admin]    Script Date: 12-Nov-23 9:56:06 PM ******/
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
/****** Object:  Table [dbo].[Landlord]    Script Date: 12-Nov-23 9:56:06 PM ******/
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
/****** Object:  Table [dbo].[Orders]    Script Date: 12-Nov-23 9:56:06 PM ******/
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
	[order_date] [datetime] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 12-Nov-23 9:56:06 PM ******/
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
/****** Object:  Table [dbo].[Post_Image]    Script Date: 12-Nov-23 9:56:06 PM ******/
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
/****** Object:  Table [dbo].[Promotions]    Script Date: 12-Nov-23 9:56:06 PM ******/
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
/****** Object:  Table [dbo].[Property_Location]    Script Date: 12-Nov-23 9:56:06 PM ******/
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
/****** Object:  Table [dbo].[Property_type]    Script Date: 12-Nov-23 9:56:06 PM ******/
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
/****** Object:  Table [dbo].[Report]    Script Date: 12-Nov-23 9:56:06 PM ******/
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
/****** Object:  Table [dbo].[Review]    Script Date: 12-Nov-23 9:56:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[review_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[property_id] [int] NULL,
	[review_date] [date] NULL,
	[rating] [smallint] NULL,
	[review] [nvarchar](300) NULL,
 CONSTRAINT [PK_Review] PRIMARY KEY CLUSTERED 
(
	[review_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tenant]    Script Date: 12-Nov-23 9:56:06 PM ******/
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
/****** Object:  Table [dbo].[Token]    Script Date: 12-Nov-23 9:56:06 PM ******/
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
/****** Object:  Table [dbo].[Transactions]    Script Date: 12-Nov-23 9:56:06 PM ******/
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
/****** Object:  Table [dbo].[User_banned]    Script Date: 12-Nov-23 9:56:06 PM ******/
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
/****** Object:  Table [dbo].[User_role]    Script Date: 12-Nov-23 9:56:06 PM ******/
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
/****** Object:  Table [dbo].[UserAvatar]    Script Date: 12-Nov-23 9:56:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAvatar](
	[user_id] [int] NOT NULL,
	[avatar_url] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12-Nov-23 9:56:07 PM ******/
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
/****** Object:  Table [dbo].[Wishlist]    Script Date: 12-Nov-23 9:56:07 PM ******/
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
INSERT [dbo].[Admin] ([id], [first_name], [last_name], [Phone]) VALUES (1, N'Thắng', N'Hà', N'0382721058')
GO
INSERT [dbo].[Admin] ([id], [first_name], [last_name], [Phone]) VALUES (4, N'Quan', N'Tri Vien', N'0382721058')
GO
INSERT [dbo].[Landlord] ([id], [first_name], [last_name], [address], [phone], [civil_id], [account_points]) VALUES (2, N'Thang', N'Ha Quang', N'Thai Nguyen', N'0382721058', N'019203003134', 9798)
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([order_id], [tenant_id], [landlord_id], [post_id], [status], [order_date]) VALUES (1, 3, 2, 3, N'approved', CAST(N'2023-11-12T21:39:21.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Post] ON 
GO
INSERT [dbo].[Post] ([id], [name], [price], [type], [area], [NumOfBedrooms], [address], [description], [landlord_id], [location_id], [status], [promotion_id], [post_start_date], [post_end_date]) VALUES (1, N'Nhà trọ giá rẻ', 120, 1, 200, 4, N'34 Hoàng Văn Thụ', N'Nhà trọ đẹp, giá rẻ phù hợp với đối tượng sinh viên hoặc người lao động có thu nhập thấp', 2, 1, N'standard', 1, CAST(N'2023-11-12' AS Date), CAST(N'2024-02-12' AS Date))
GO
INSERT [dbo].[Post] ([id], [name], [price], [type], [area], [NumOfBedrooms], [address], [description], [landlord_id], [location_id], [status], [promotion_id], [post_start_date], [post_end_date]) VALUES (2, N'Căn hộ cao cấp', 999, 1, 300, 8, N'Thanh Xuân, Hà Nội', N'Căn hộ chung cư cao cấp, có view sông, tựa núi. Đảm bảo đem lại trải nghiệm cao cấp nhất cho mọi người', 2, 1, N'premium', NULL, CAST(N'2023-11-12' AS Date), CAST(N'2024-05-12' AS Date))
GO
INSERT [dbo].[Post] ([id], [name], [price], [type], [area], [NumOfBedrooms], [address], [description], [landlord_id], [location_id], [status], [promotion_id], [post_start_date], [post_end_date]) VALUES (3, N'Chung cư mini', 300, 1, 100, 3, N'Đống Đa, Hà Nội', N'Chung cư mini phù hợp với gia đình từ 3 đến 4 người, có hầm để xe, cạnh trường học và trung tâm mua sắm. Phù hợp với gia đình hoặc sinh viên có điều kiện', 2, 1, N'basic', NULL, CAST(N'2023-11-12' AS Date), CAST(N'2023-12-12' AS Date))
GO
INSERT [dbo].[Post] ([id], [name], [price], [type], [area], [NumOfBedrooms], [address], [description], [landlord_id], [location_id], [status], [promotion_id], [post_start_date], [post_end_date]) VALUES (4, N'Nha tro Tuan Anh', 123, 1, 30, 1, N'394 Thach Hoa', N'Nhà trọ giá rẻ, phù hợp cho các bạn sinh viên FPT, Đại học Quốc Gia Hà Nội', 2, 1, N'basic', NULL, CAST(N'2023-11-12' AS Date), CAST(N'2023-12-12' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Post] OFF
GO
SET IDENTITY_INSERT [dbo].[Post_Image] ON 
GO
INSERT [dbo].[Post_Image] ([id], [post_id], [img_url], [img_type]) VALUES (1, 1, N'./assets/img/post-id-1-thumbnails(1).jpg', N'thumbnails')
GO
INSERT [dbo].[Post_Image] ([id], [post_id], [img_url], [img_type]) VALUES (2, 1, N'./assets/img/post-id-1-main(2).jpg', N'main')
GO
INSERT [dbo].[Post_Image] ([id], [post_id], [img_url], [img_type]) VALUES (3, 2, N'./assets/img/post-id-2-thumbnails(1).png', N'thumbnails')
GO
INSERT [dbo].[Post_Image] ([id], [post_id], [img_url], [img_type]) VALUES (4, 2, N'./assets/img/post-id-2-main(2).png', N'main')
GO
INSERT [dbo].[Post_Image] ([id], [post_id], [img_url], [img_type]) VALUES (5, 2, N'./assets/img/post-id-2-main(3).png', N'main')
GO
INSERT [dbo].[Post_Image] ([id], [post_id], [img_url], [img_type]) VALUES (6, 3, N'./assets/img/post-id-3-thumbnails(1).png', N'thumbnails')
GO
INSERT [dbo].[Post_Image] ([id], [post_id], [img_url], [img_type]) VALUES (7, 3, N'./assets/img/post-id-3-main(2).png', N'main')
GO
INSERT [dbo].[Post_Image] ([id], [post_id], [img_url], [img_type]) VALUES (8, 3, N'./assets/img/post-id-3-main(3).png', N'main')
GO
INSERT [dbo].[Post_Image] ([id], [post_id], [img_url], [img_type]) VALUES (9, 4, N'./assets/img/post-id-4-thumbnails(1).png', N'thumbnails')
GO
INSERT [dbo].[Post_Image] ([id], [post_id], [img_url], [img_type]) VALUES (10, 4, N'./assets/img/post-id-4-main(2).png', N'main')
GO
SET IDENTITY_INSERT [dbo].[Post_Image] OFF
GO
SET IDENTITY_INSERT [dbo].[Promotions] ON 
GO
INSERT [dbo].[Promotions] ([promotion_id], [discount], [descriptions], [promotion_start_date], [promotion_end_date]) VALUES (1, 10, N'Sales bất ngờ', CAST(N'2023-11-02' AS Date), CAST(N'2023-11-17' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Promotions] OFF
GO
SET IDENTITY_INSERT [dbo].[Property_Location] ON 
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (1, N'Ha Noi')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (2, N'Hai Phong')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (3, N'Da Nang')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (4, N'Ho Chi Minh City')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (5, N'Can Tho')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (6, N'An Giang')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (7, N'Bac Giang')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (8, N'Bac Kan')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (9, N'Bac Ninh')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (10, N'Ba Ria - Vung Tau')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (11, N'Ben Tre')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (12, N'Binh Dinh')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (13, N'Binh Duong')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (14, N'Binh Phuoc')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (15, N'Binh Thuan')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (16, N'Ca Mau')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (17, N'Cao Bang')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (18, N'Dak Lak')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (19, N'Dak Nong')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (20, N'Dien Bien')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (21, N'Dong Nai')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (22, N'Dong Thap')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (23, N'Gia Lai')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (24, N'Ha Giang')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (25, N'Ha Nam')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (26, N'Ha Tinh')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (27, N'Hai Duong')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (28, N'Hoa Binh')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (29, N'Hung Yen')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (30, N'Khanh Hoa')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (31, N'Kien Giang')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (32, N'Kon Tum')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (33, N'Lai Chau')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (34, N'Lam Dong')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (35, N'Lang Son')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (36, N'Lao Cai')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (37, N'Long An')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (38, N'Nam Dinh')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (39, N'Nghe An')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (40, N'Ninh Binh')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (41, N'Ninh Thuan')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (42, N'Phu Tho')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (43, N'Phu Yen')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (44, N'Quang Binh')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (45, N'Quang Nam')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (46, N'Quang Ngai')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (47, N'Quang Ninh')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (48, N'Quang Tri')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (49, N'Soc Trang')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (50, N'Son La')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (51, N'Tay Ninh')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (52, N'Thai Binh')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (53, N'Thai Nguyen')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (54, N'Thanh Hoa')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (55, N'Thua Thien Hue')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (56, N'Tien Giang')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (57, N'Tra Vinh')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (58, N'Tuyen Quang')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (59, N'Vinh Long')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (60, N'Vinh Phuc')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (61, N'Yen Bai')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (62, N'Bac Long Vi Island')
GO
INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (63, N'Phu Quy Islands')
GO
SET IDENTITY_INSERT [dbo].[Property_Location] OFF
GO
SET IDENTITY_INSERT [dbo].[Property_type] ON 
GO
INSERT [dbo].[Property_type] ([type_id], [type_name]) VALUES (1, N'Nha Tro')
GO
INSERT [dbo].[Property_type] ([type_id], [type_name]) VALUES (2, N'Chung cu')
GO
SET IDENTITY_INSERT [dbo].[Property_type] OFF
GO
SET IDENTITY_INSERT [dbo].[Review] ON 
GO
INSERT [dbo].[Review] ([review_id], [user_id], [property_id], [review_date], [rating], [review]) VALUES (1, 3, 3, CAST(N'2023-11-12' AS Date), 4, N'Nhà đúng như quảng cáo, tuy nhiên giá điện hơi cao ')
GO
SET IDENTITY_INSERT [dbo].[Review] OFF
GO
INSERT [dbo].[Tenant] ([id], [first_name], [last_name], [address], [phone], [civil_id]) VALUES (3, N'Truong', N'Tien Sy', N'Ha Noi', N'0382721058', NULL)
GO
SET IDENTITY_INSERT [dbo].[Token] ON 
GO
INSERT [dbo].[Token] ([id], [user_id], [email], [token], [expired_date], [type]) VALUES (1, 2, N'haquangthangtn@gmail.com', N'S0rDF1ouv1neSBTmleV1dfa659w', CAST(N'2023-11-12T21:23:03.430' AS DateTime), N'CONFIRMATION')
GO
INSERT [dbo].[Token] ([id], [user_id], [email], [token], [expired_date], [type]) VALUES (2, 3, N'sytt@gmail.com', N'vaGLiOW8URbo_SyZMCtUmupQq8M', CAST(N'2023-11-12T21:45:20.190' AS DateTime), N'CONFIRMATION')
GO
INSERT [dbo].[Token] ([id], [user_id], [email], [token], [expired_date], [type]) VALUES (3, 3, N'sytt@gmail.com', N'8Y46Dfi3fzw9Sw-kceC6MDxIsGc', CAST(N'2023-11-12T21:45:45.233' AS DateTime), N'CONFIRMATION')
GO
SET IDENTITY_INSERT [dbo].[Token] OFF
GO
SET IDENTITY_INSERT [dbo].[Transactions] ON 
GO
INSERT [dbo].[Transactions] ([transaction_id], [amount], [payer_id], [receiver_id], [type], [transaction_date], [post_id]) VALUES (1, CAST(10000 AS Decimal(19, 0)), 1, 2, N'DEPOSIT', CAST(N'2023-11-12' AS Date), NULL)
GO
INSERT [dbo].[Transactions] ([transaction_id], [amount], [payer_id], [receiver_id], [type], [transaction_date], [post_id]) VALUES (2, CAST(48 AS Decimal(19, 0)), 2, 1, N'PAY', CAST(N'2023-11-12' AS Date), 1)
GO
INSERT [dbo].[Transactions] ([transaction_id], [amount], [payer_id], [receiver_id], [type], [transaction_date], [post_id]) VALUES (3, CAST(48 AS Decimal(19, 0)), 2, 1, N'PAY', CAST(N'2023-11-12' AS Date), 2)
GO
INSERT [dbo].[Transactions] ([transaction_id], [amount], [payer_id], [receiver_id], [type], [transaction_date], [post_id]) VALUES (4, CAST(48 AS Decimal(19, 0)), 2, 1, N'PAY', CAST(N'2023-11-12' AS Date), 2)
GO
INSERT [dbo].[Transactions] ([transaction_id], [amount], [payer_id], [receiver_id], [type], [transaction_date], [post_id]) VALUES (5, CAST(32 AS Decimal(19, 0)), 2, 1, N'PAY', CAST(N'2023-11-12' AS Date), 1)
GO
INSERT [dbo].[Transactions] ([transaction_id], [amount], [payer_id], [receiver_id], [type], [transaction_date], [post_id]) VALUES (6, CAST(13 AS Decimal(19, 0)), 2, 1, N'PAY', CAST(N'2023-11-12' AS Date), 3)
GO
INSERT [dbo].[Transactions] ([transaction_id], [amount], [payer_id], [receiver_id], [type], [transaction_date], [post_id]) VALUES (7, CAST(13 AS Decimal(19, 0)), 2, 1, N'PAY', CAST(N'2023-11-12' AS Date), 4)
GO
SET IDENTITY_INSERT [dbo].[Transactions] OFF
GO
SET IDENTITY_INSERT [dbo].[User_role] ON 
GO
INSERT [dbo].[User_role] ([id], [role_name]) VALUES (1, N'Tenant')
GO
INSERT [dbo].[User_role] ([id], [role_name]) VALUES (2, N'Landlord')
GO
INSERT [dbo].[User_role] ([id], [role_name]) VALUES (3, N'Admin')
GO
SET IDENTITY_INSERT [dbo].[User_role] OFF
GO
INSERT [dbo].[UserAvatar] ([user_id], [avatar_url]) VALUES (1, N'./assets/img/default-avt.png')
GO
INSERT [dbo].[UserAvatar] ([user_id], [avatar_url]) VALUES (2, N'./assets/img/user-id-2-avatar.jpg')
GO
INSERT [dbo].[UserAvatar] ([user_id], [avatar_url]) VALUES (3, N'./assets/img/user-id-3-avatar.jpg')
GO
INSERT [dbo].[UserAvatar] ([user_id], [avatar_url]) VALUES (4, N'./assets/img/default-avt.png')
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([id], [email], [hashed_password], [salt], [role_id], [status]) VALUES (1, N'thanghqhe176429@fpt.edu.vn', 0x32F43D2BBD2668A0493890E89D76CBF9FE34D635C49727CD31065BA06745C04A2D319982E2B4656DD426610A787831F0C3B2BE78CC1667E95ABCC1F8D704E8B5, 0xD719ECEEF0CEA9DFFA1653A02C1F032D, 3, N'VER')
GO
INSERT [dbo].[Users] ([id], [email], [hashed_password], [salt], [role_id], [status]) VALUES (2, N'haquangthangtn@gmail.com', 0x80BFCED61B491D2D59F6AFBC57137DE05B35B5C67BD3E65D75B9F44B28B6F9A0CAC99B284EE79760FD4B602189AAB24CB5BF4897145694E89D4865A0DEB07094, 0x348202F9512FFA2FC82A1977CA25C3BD, 2, N'VER')
GO
INSERT [dbo].[Users] ([id], [email], [hashed_password], [salt], [role_id], [status]) VALUES (3, N'sytt@gmail.com', 0xA8A110D0079B07BE5557CF8E793DABA3C4B46F01FFD7817E655416EDBD3CD90F1E495C363A7AC5B3F382CFD54D8AC7048CA9BF6BEC177BD8831EE1F54330DA44, 0xD023D1B76417B5BD139E579DBADD9050, 1, N'VER')
GO
INSERT [dbo].[Users] ([id], [email], [hashed_password], [salt], [role_id], [status]) VALUES (4, N'admin@gmail.com', 0x3F7B2AB5261067FBD4BDA640F165A088B2FC031E14EB9D37DC830FA05CC48B12B64D4589B221AEB6FF1CAD77DCDDD18E41478115EEBE9C385006C095B1143765, 0x4E15277E4E98793382551B3E7D6C6E39, 3, N'VER')
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Wishlist] ON 
GO
INSERT [dbo].[Wishlist] ([id], [user_id], [property_id]) VALUES (2, 3, 3)
GO
SET IDENTITY_INSERT [dbo].[Wishlist] OFF
GO
ALTER TABLE [dbo].[UserAvatar] ADD  DEFAULT ('./assets/img/default-avt.png') FOR [avatar_url]
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
ALTER TABLE [dbo].[Token]  WITH CHECK ADD  CONSTRAINT [fk_userId] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Token] CHECK CONSTRAINT [fk_userId]
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
ALTER TABLE [dbo].[UserAvatar]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([id])
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
/****** Object:  Trigger [dbo].[trg_UpdateUserAvatar]    Script Date: 12-Nov-23 9:56:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_UpdateUserAvatar]
ON [dbo].[Users]
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Insert a new record into UserAvatar for the newly inserted User
    INSERT INTO [dbo].[UserAvatar] ([user_id], [avatar_url])
    SELECT [id], './assets/img/default-avt.png'
    FROM inserted;
END;
GO
ALTER TABLE [dbo].[Users] ENABLE TRIGGER [trg_UpdateUserAvatar]
GO
USE [master]
GO
ALTER DATABASE [SWP391] SET  READ_WRITE 
GO
