--create database SWP391;
--use SWP391;
--drop database SWP391;
--use master;

CREATE TABLE Users(
	id int IDENTITY NOT NULL,
	email varchar(100) NULL,
	hashed_password varbinary(80) NULL, 
	salt varbinary(50) NULL,
	role_id int NULL,
	status nvarchar(20) NULL, 
);
CREATE TABLE Landlord (
	id int NOT NULL, 
	first_name nvarchar(20) NULL,
	last_name nvarchar(20) NULL,
	address nvarchar(255) NULL, 
	phone varchar(15) NULL, 
	civil_id varchar(50) NULL, 
	account_points int NULL, 
);

CREATE TABLE Tenant (
	id int NOT NULL, 
	first_name nvarchar(20) NULL,
	last_name nvarchar(20) NULL,
	address nvarchar(255) NULL, 
	phone varchar(15) NULL, 
	civil_id varchar(50) NULL, 
);

CREATE TABLE Admin (
	id int NOT NULL, 
	first_name nvarchar(20) NULL,
	last_name nvarchar(20) NULL,
	Phone nvarchar(15) null,
);

CREATE TABLE [Orders] (
	order_id int IDENTITY NOT NULL, 
	tenant_id int NULL, 
	landlord_id int NULL, -- ??? Liệu có cần khi đã có post_id?
	post_id int NULL, 
	status nvarchar(50) NULL, 
);

CREATE TABLE Post_Image(
	id int IDENTITY NOT NULL,
	post_id int NULL,
	img_url nvarchar(50) NULL,
	img_type nvarchar(20) NULL,
);

CREATE TABLE Post (
	id int IDENTITY NOT NULL, 
	name nvarchar(255) NULL, 
	price int NULL, 
	type int NULL, 
	area int NULL, 
	NumOfBedrooms int NULL, 
	address nvarchar(255) NULL, 
	description nvarchar(2000) NULL, 
	landlord_id int NULL, 
	location_id int NULL,
	status nvarchar(20) NULL, 
	promotion_id int NULL, 
	post_start_date date NULL, 
	post_end_date date NULL, 
);

CREATE TABLE Property_Location (
	id int IDENTITY NOT NULL, 
	location_name nvarchar(50) NULL, 
);

CREATE TABLE Property_type (
	type_id int IDENTITY NOT NULL, 
	type_name nvarchar(50) NULL, 
);

CREATE TABLE Promotions(
	promotion_id int IDENTITY NOT NULL, 
	discount int null,
	descriptions nvarchar(255) null,
	promotion_start_date date null,
	promotion_end_date date null,
);

CREATE TABLE Report (
	[report_id] int IDENTITY NOT NULL, 
	reporter_id int NULL, 
	property_id int NULL, 
	reported_id int NULL, 
	categories nvarchar(100) NULL, -- ?? nếu là title thì còn được, chứ tick thì phải có bảng khác ref chứ
	description text NULL, 
	status nvarchar(20) NULL, 
);

CREATE TABLE Review (
	review_id int IDENTITY NOT NULL, 
	user_id int NULL, 
	property_id int NULL, 
	rating smallint NULL, 
	review nvarchar(300) NULL, 
);

CREATE TABLE Transactions (
	transaction_id int IDENTITY NOT NULL, 
	amount decimal(19, 0) NOT NULL, 
	payer_id int NOT NULL, -- rất vấn đề chỗ này, vì chỉ thể hiện người bị ảnh hưởng bởi giao dịch, không có người thực hiện giao dịch
	receiver_id INT NOT NULL,
	type VARCHAR(20) NULL, --Recharge=Nạp tiền/Transfer=Chuyển tiền
	transaction_date date NOT NULL, 
	post_id int NULL, 
);

CREATE TABLE Wishlist (
	id int IDENTITY NOT NULL, 
	user_id int NULL, 
	property_id int NULL, 
);

CREATE TABLE User_banned(
	id int NOT NULL,
	email varchar(100) NULL,
	ban_start_date DATETIME NULL,
	ban_end_date DATETIME null,
	status VARCHAR(20)
);

CREATE TABLE Token(
	id int IDENTITY NOT NULL,
	user_id INT NOT NULL,
	email varchar(100) NULL, -- thực ra cột này bị thừa
	token varchar(255) NULL,
	expired_date DATETIME NULL,
	type varchar(50) NULL,
);

CREATE TABLE User_role(
	id int IDENTITY NOT NULL,
	role_name varchar(20) NOT NULL,
);

alter table Property_location add constraint PK_Location
PRIMARY KEY (id);
alter table Users add constraint PK_Users
PRIMARY KEY (id);
alter table Admin add constraint PK_Admin
PRIMARY KEY (id);
alter table Landlord add constraint PK_Landlord
PRIMARY KEY (id);
alter table Tenant add constraint PK_Tenant
PRIMARY KEY (id);
alter table Orders add constraint PK_Orders
PRIMARY KEY (order_id);
alter table Post add constraint PK_Post
PRIMARY KEY (id);
alter table Promotions add constraint PK_Promotions
PRIMARY KEY (promotion_id);
alter table Property_type add constraint PK_typeID
PRIMARY KEY (type_id);
alter table Report add constraint PK_Report
PRIMARY KEY ([report_id]);
alter table Review add constraint PK_Review
PRIMARY KEY (review_id);
alter table Transactions add constraint PK_Transaction PRIMARY KEY (transaction_id);
alter table Wishlist add constraint PK_Wishlist
PRIMARY KEY (id);
alter table Post_image add constraint PK_Post_image
PRIMARY KEY (id);
alter table User_banned add constraint PK_User_banned
PRIMARY KEY (id);
alter table Token add constraint PK_Token
PRIMARY KEY (id);
alter table User_role add constraint PK_User_Role
PRIMARY KEY (id);
alter table User_banned add constraint FK_User_banned_id foreign key(id) references Users(id);
alter table Tenant add constraint FK_Tenant_User foreign key(id) references Users(id);
alter table Landlord add constraint FK_Landlord_User foreign key(id) references Users(id);
alter table Admin add constraint FK_Admin_User foreign key(id) references Users(id);
ALTER TABLE Post ADD CONSTRAINT FK_Post_Landlord FOREIGN KEY (landlord_id) REFERENCES Users (id);
ALTER TABLE Post ADD CONSTRAINT FK_Promotions_Post FOREIGN KEY (promotion_id) REFERENCES Promotions(promotion_id);
ALTER TABLE Post ADD CONSTRAINT FK_Post_PropertyType FOREIGN KEY (type) REFERENCES Property_type (type_id);
ALTER TABLE Orders ADD CONSTRAINT FK_Orders_Post FOREIGN KEY (post_id) REFERENCES Post (id);
ALTER TABLE Orders ADD CONSTRAINT FK_Orders_Landlord FOREIGN KEY (landlord_id) REFERENCES Users(id);
ALTER TABLE Orders ADD CONSTRAINT FK_Orders_Tenant FOREIGN KEY (tenant_id) REFERENCES Users(id);
ALTER TABLE Transactions ADD CONSTRAINT FK_Transaction_Landlord FOREIGN KEY (payer_id) REFERENCES Users(id);
ALTER TABLE Transactions ADD CONSTRAINT FK_Transaction_Post FOREIGN KEY (post_id) REFERENCES Post (id);
ALTER TABLE Transactions ADD CONSTRAINT FK_Transaction_Admin FOREIGN KEY (receiver_id) REFERENCES Users(id);
ALTER TABLE Review ADD CONSTRAINT FK_Review_Post FOREIGN KEY (property_id) REFERENCES Post (id);
ALTER TABLE Review ADD CONSTRAINT FK_Review_Tenant FOREIGN KEY (user_id) REFERENCES Users (id);
ALTER TABLE Report ADD CONSTRAINT FK_Report_Tenant1 FOREIGN KEY (reporter_id) REFERENCES Users (id);
ALTER TABLE Report ADD CONSTRAINT FK_Report_Tenant2 FOREIGN KEY (reported_id) REFERENCES Users (id);
ALTER TABLE Report ADD CONSTRAINT FK_Report_Post FOREIGN KEY (property_id) REFERENCES Post (id);
ALTER TABLE Wishlist ADD CONSTRAINT FK_Wishlist_Post FOREIGN KEY (property_id) REFERENCES Post (id);
ALTER TABLE Wishlist ADD CONSTRAINT FK_Wishlist_Tenant FOREIGN KEY (user_id) REFERENCES Users (id);
ALTER TABLE Post_image ADD CONSTRAINT FK_Post_image_Post FOREIGN KEY (post_id) REFERENCES Post(id);
ALTER TABLE Users ADD CONSTRAINT FK_Users_Role FOREIGN KEY(role_id) REFERENCES User_role(id);
ALTER TABLE Post ADD CONSTRAINT FK_Post_Location FOREIGN KEY(location_id) REFERENCES Property_location(id);
------------------------------DROP TABLE/CONSTRAINT-------------------------------------
--ALTER TABLE Post DROP CONSTRAINT FK_Post_Landlord;--1
--ALTER TABLE [Order] DROP CONSTRAINT FK_Order_Post;--2
--ALTER TABLE [Order] DROP CONSTRAINT FK_Order_Tenant;--3
--ALTER TABLE Review DROP CONSTRAINT FK_Review_Post;--4
--ALTER TABLE [Transaction] DROP CONSTRAINT FK_Transaction_Tenant;--5
--ALTER TABLE Review DROP CONSTRAINT FK_Review_Tenant;--6
--ALTER TABLE Report DROP CONSTRAINT FK_Report_Tenant1;--7
--ALTER TABLE Post DROP CONSTRAINT FK_Post_PropertyType;--8
--ALTER TABLE Wishlist DROP CONSTRAINT FK_Wishlist_Tenant;--9
--ALTER TABLE [Transaction] DROP CONSTRAINT FK_Transaction_Post;--10
--ALTER TABLE Report DROP CONSTRAINT FK_Report_Tenant2;--11
--ALTER TABLE Report DROP CONSTRAINT FK_Report_Post;--12
--ALTER TABLE Wishlist DROP CONSTRAINT FK_Wishlist_Post;--13
--DROP TABLE Admin;
--DROP TABLE Landlord;
--DROP TABLE [Order];
--DROP TABLE Post;
--DROP TABLE Property_type;
--DROP TABLE Report;
--DROP TABLE Review;
--DROP TABLE Tenant;
--DROP TABLE [Transaction];
--DROP TABLE Wishlist;
--insert Admin values
--('thanghqhe176429@fpt.edu.vn',CAST(123456 as varbinary(80)),CAST(123456 as varbinary(50)),0);
--select * from admin;
insert Property_Location values
('Cay xang 39'),
('Tay Ho'),
('Landmark 69'),
('Dong Da');
insert Property_type values
('Nha Tro'),
('Chung cu');
--select*from Property_type;
insert User_role values
('Tenant'),
('Landlord'),
('Admin');
select*from User_role;
insert Promotions values
(20, '20% discount for the first 3 months of rent','06/21/2023','07/21/2023'),
(10, '10% discount for the first month of rent','06/21/2023','07/21/2023'),
(50, '50% for the first month if the length of contract is more than 3 months','06/21/2023','07/21/2023')
select* from Promotions;
--insert Users values

--('sytthe176623@fpt.edu.vn',CAST(123456 as varbinary(80)),CAST(123456 as varbinary(50)),3,null,null,null,'0942010101',null, 'VER', 0),
--('tungdthe176669@fpt.edu.vn',CAST(123456 as varbinary(80)),CAST(123456 as varbinary(50)),1,'Thang','Ha','259 Burbank Street, Texas','0942121212',null, 'VER', null),
--('antnthe176694@fpt.edu.vn',CAST(123456 as varbinary(80)),CAST(123456 as varbinary(50)),1,'Thang','Ha','259 Burbank Street, Texas','0942343434',null, 'VER', null),
--('thanghq176429@fpt.edu.vn',CAST(123456 as varbinary(80)),CAST(123456 as varbinary(50)),1,'Thang','Ha','259 Burbank Street, Texas','0942454545',null, 'UNV', null),
--('khanhnbhe170920@fpt.edu.vn',CAST(123456 as varbinary(80)),CAST(123456 as varbinary(50)),2,'Thang','Ha','259 Burbank Street, Texas','0942565656',null, 'VER', 0),
--('tienpvhe163824@fpt.edu.vn',CAST(123456 as varbinary(80)),CAST(123456 as varbinary(50)),2,'Thang','Ha','259 Burbank Street, Texas','0942676767',null, 'VER', 2000),
--('asd@gmail.com',CAST(123456 as varbinary(80)),CAST(123456 as varbinary(50)),2,'Thang','Ha','159 Wall Street, New York City','0942434343',null, 'UNV', 13000),
--('asds@gmail.com',CAST(123456 as varbinary(80)),CAST(123456 as varbinary(50)),2,'Thang','Ha','101 Plankton Street, Virginia','0944121212',null, 'UNV', 20);

--insert Users values
--('sytthe176623@fpt.edu.vn',CAST(123456 as varbinary(80)),CAST(123456 as varbinary(50)),3, 'VER'),
--('tungdthe176669@fpt.edu.vn',CAST(123456 as varbinary(80)),CAST(123456 as varbinary(50)),1, 'VER'),
--('antnthe176694@fpt.edu.vn',CAST(123456 as varbinary(80)),CAST(123456 as varbinary(50)),1, 'VER'),
--('thanghq176429@fpt.edu.vn',CAST(123456 as varbinary(80)),CAST(123456 as varbinary(50)),1, 'VER'),
--('khanhnbhe170920@fpt.edu.vn',CAST(123456 as varbinary(80)),CAST(123456 as varbinary(50)),2, 'VER'),
--('tienpvhe163824@fpt.edu.vn',CAST(123456 as varbinary(80)),CAST(123456 as varbinary(50)),2, 'VER'),
--('asd@gmail.com',CAST(123456 as varbinary(80)),CAST(123456 as varbinary(50)),2, 'UNV'),
--('asds@gmail.com',CAST(123456 as varbinary(80)),CAST(123456 as varbinary(50)),2, 'UNV');

--insert Admin values
--(1,'Truong','Sy','0942010101');

--insert Tenant values
--(2,'Thang','Ha','259 Burbank Street, Texas','0942121212',null),
--(3,'Thang','Ha','259 Burbank Street, Texas','0942343434',null),
--(4,'Thang','Ha','259 Burbank Street, Texas','0942454545',null);

--insert Landlord values
--(5,'Sy','Truong','259 Burbank Street, Texas','0942565656',null, 0),
--(6,'Hieu','Nguyen','259 Burbank Street, Texas','0942676767',null, 2000),
--(7,'Minh','Nguyen','159 Wall Street, New York City','0942434343',null, 13000),
--(8,'Thang','Ha','101 Plankton Street, Virginia','0944121212',null, 20);

--insert Post values
--('Nha Tro Hoa Hong', 2000, 1, 20, 2, '270 Duong Lang, Dong Da, Ha Noi', 'Description', 6,1, 'Not Occupied', null, '07/25/2022','08/25/2022'),
--('Nha Tro Thai Binh', 800, 1, 10, 1, '27 Duong Song Da, Long Bien, Ha Noi', 'Description', 6,1, 'Not Occupied', null, '07/25/2022','08/25/2022'),
--('Nha Tro Co Loan', 1000, 1, 15, 2, '210 Duong Hai Ba Trung, Cau Giay, Ha Noi', 'Description', 7,1, 'Not Occupied', 2, '07/26/2023','08/26/2023'),
--('Nha Tro Co Hang', 1200, 1, 15, 1, '120 Duong Ho Chi Minh, Cau Giay, Ha Noi', 'Description', 7,2, 'Not Occupied', 1, '07/26/2023','08/26/2023'),
--('Nha Tro FU', 1800, 1, 20, 2, '20 Duong Thang Long, Dong Da, Ha Noi', 'Description', 7,2, 'Not Occupied', null, '07/25/2022','08/25/2022'),
--('Chung cu Phenika', 1500,2, 18, 1, '75 Duong Giai Phong, Thanh Xuan, Ha Noi', 'Description', 8,2, 'Not occupied', null, '01/11/2023','02/11/2023'),
--('Chung cu Hoa Lac', 1200, 2, 14, 1, '25 Duong Le Hong Phong, Hoan Kiem, Ha Noi', 'Description', 8,3, 'Occupied', null, '06/24/2023','06/30/2023'),
--('Chung cu HoLA', 1500, 2, 20, 1, '234 Yen Lang, Dong Da, Ha Noi', 'Description', 6,3, 'Occupied', 3, '06/24/2023','06/30/2023'),
--('Chung cu Funfact', 2100, 2, 20, 3, '250 Yen Lang, Dong Da, Ha Noi', 'Description', 6,4, 'Not Occupied', null, '06/02/2023','07/02/2023'),
--('Chung cu ABC', 900, 2, 20, 2, '102 Pham Hung, Cau Giay, Ha Noi', 'Description', 7,4, 'Not Occupied', null, '06/21/2023','07/21/2023'),
--('Chung cu HLE', 1500, 2, 20, 1, '234 Yen Lang, Dong Da, Ha Noi', 'Description', 6,4, 'Occupied', null, '06/24/2023','06/30/2023');
select*from Post;

--insert Orders values
--(1,1,1,'Approved'),
--(2,2,2,'Rejected'),
--(2,2,3,'Rejected');
-- insert Wishlist values
-- (2,1),
-- (2,2),
-- (2,3),
-- (3,7),
-- (3,8),
-- (3,9);
select*from User_role;
select*from Wishlist;
select*from Users;
select*from Admin;
select*from Tenant;
select*from Landlord;
--select*from Orders;
--insert Transactions values 
--(200,null,'Recharge','06/23/2023',null),
--(200,1, 'Transfer', '05/23/2022', 1),
--(200,2, 'Transfer', '05/23/2023', 4);
--select*from Transactions;




