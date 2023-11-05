USE [master]
GO
/****** Object:  Database [SWP391]    Script Date: 05-Nov-23 8:34:11 PM ******/
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
/****** Object:  Table [dbo].[Admin]    Script Date: 05-Nov-23 8:34:11 PM ******/
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
/****** Object:  Table [dbo].[Landlord]    Script Date: 05-Nov-23 8:34:11 PM ******/
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
/****** Object:  Table [dbo].[Orders]    Script Date: 05-Nov-23 8:34:11 PM ******/
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
/****** Object:  Table [dbo].[Post]    Script Date: 05-Nov-23 8:34:11 PM ******/
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
/****** Object:  Table [dbo].[Post_Image]    Script Date: 05-Nov-23 8:34:11 PM ******/
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
/****** Object:  Table [dbo].[Promotions]    Script Date: 05-Nov-23 8:34:11 PM ******/
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
/****** Object:  Table [dbo].[Property_Location]    Script Date: 05-Nov-23 8:34:11 PM ******/
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
/****** Object:  Table [dbo].[Property_type]    Script Date: 05-Nov-23 8:34:11 PM ******/
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
/****** Object:  Table [dbo].[Report]    Script Date: 05-Nov-23 8:34:11 PM ******/
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
/****** Object:  Table [dbo].[Review]    Script Date: 05-Nov-23 8:34:11 PM ******/
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
/****** Object:  Table [dbo].[Tenant]    Script Date: 05-Nov-23 8:34:11 PM ******/
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
/****** Object:  Table [dbo].[Token]    Script Date: 05-Nov-23 8:34:11 PM ******/
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
/****** Object:  Table [dbo].[Transactions]    Script Date: 05-Nov-23 8:34:11 PM ******/
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
/****** Object:  Table [dbo].[User_banned]    Script Date: 05-Nov-23 8:34:11 PM ******/
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
/****** Object:  Table [dbo].[User_role]    Script Date: 05-Nov-23 8:34:11 PM ******/
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
/****** Object:  Table [dbo].[UserAvatar]    Script Date: 05-Nov-23 8:34:11 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 05-Nov-23 8:34:11 PM ******/
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
/****** Object:  Table [dbo].[Wishlist]    Script Date: 05-Nov-23 8:34:11 PM ******/
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
/****** Object:  Trigger [dbo].[trg_UpdateUserAvatar]    Script Date: 05-Nov-23 8:34:11 PM ******/
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

--==================================== INSERT DATA ================================

--SET IDENTITY_INSERT [dbo].[Property_Location] ON 

--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (1, N'Ha Noi')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (2, N'Hai Phong')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (3, N'Da Nang')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (4, N'Ho Chi Minh City')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (5, N'Can Tho')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (6, N'An Giang')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (7, N'Bac Giang')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (8, N'Bac Kan')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (9, N'Bac Ninh')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (10, N'Ba Ria - Vung Tau')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (11, N'Ben Tre')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (12, N'Binh Dinh')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (13, N'Binh Duong')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (14, N'Binh Phuoc')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (15, N'Binh Thuan')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (16, N'Ca Mau')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (17, N'Cao Bang')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (18, N'Dak Lak')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (19, N'Dak Nong')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (20, N'Dien Bien')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (21, N'Dong Nai')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (22, N'Dong Thap')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (23, N'Gia Lai')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (24, N'Ha Giang')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (25, N'Ha Nam')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (26, N'Ha Tinh')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (27, N'Hai Duong')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (28, N'Hoa Binh')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (29, N'Hung Yen')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (30, N'Khanh Hoa')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (31, N'Kien Giang')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (32, N'Kon Tum')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (33, N'Lai Chau')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (34, N'Lam Dong')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (35, N'Lang Son')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (36, N'Lao Cai')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (37, N'Long An')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (38, N'Nam Dinh')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (39, N'Nghe An')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (40, N'Ninh Binh')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (41, N'Ninh Thuan')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (42, N'Phu Tho')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (43, N'Phu Yen')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (44, N'Quang Binh')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (45, N'Quang Nam')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (46, N'Quang Ngai')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (47, N'Quang Ninh')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (48, N'Quang Tri')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (49, N'Soc Trang')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (50, N'Son La')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (51, N'Tay Ninh')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (52, N'Thai Binh')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (53, N'Thai Nguyen')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (54, N'Thanh Hoa')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (55, N'Thua Thien Hue')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (56, N'Tien Giang')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (57, N'Tra Vinh')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (58, N'Tuyen Quang')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (59, N'Vinh Long')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (60, N'Vinh Phuc')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (61, N'Yen Bai')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (62, N'Bac Long Vi Island')
--INSERT [dbo].[Property_Location] ([id], [location_name]) VALUES (63, N'Phu Quy Islands')
--SET IDENTITY_INSERT [dbo].[Property_Location] OFF

--SET IDENTITY_INSERT [dbo].[User_role] ON 
--INSERT [dbo].[User_role] ([id], [role_name]) VALUES (1, N'Tenant')
--INSERT [dbo].[User_role] ([id], [role_name]) VALUES (2, N'Landlord')
--INSERT [dbo].[User_role] ([id], [role_name]) VALUES (3, N'Admin')
--SET IDENTITY_INSERT [dbo].[User_role] OFF

--SET IDENTITY_INSERT [dbo].[Property_type] ON 

--INSERT [dbo].[Property_type] ([type_id], [type_name]) VALUES (1, N'Nha Tro')
--INSERT [dbo].[Property_type] ([type_id], [type_name]) VALUES (2, N'Chung cu')
--SET IDENTITY_INSERT [dbo].[Property_type] OFF

--INSERT [dbo].[Users] ([email], [hashed_password], [salt], [role_id], [status]) VALUES (N'thanghqhe176429@fpt.edu.vn', 0x32F43D2BBD2668A0493890E89D76CBF9FE34D635C49727CD31065BA06745C04A2D319982E2B4656DD426610A787831F0C3B2BE78CC1667E95ABCC1F8D704E8B5, 0xD719ECEEF0CEA9DFFA1653A02C1F032D, 3, N'VER')
--INSERT [dbo].[Admin] ([id], [first_name], [last_name], [Phone]) VALUES (1, N'Thắng', N'Hà', N'0382721058')



--Xóa toàn bộ Post + Post image
--DELETE FROM Post_Image;
--DELETE FROM Review;
--DELETE FROM Transactions;
--DELETE FROM Wishlist;
--DELETE FROM Post;

--USE master;
--DROP DATABASE SWP391;
--USE SWP391;