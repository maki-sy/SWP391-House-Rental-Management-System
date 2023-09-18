--DROP DATABASE SWP391;

--create database SWP391;
--use SWP391;
CREATE TABLE Admin (
id int IDENTITY NOT NULL, 
email varchar(100) NOT NULL, 
hashed_password varbinary(80) NOT NULL, 
salt varbinary(50) NOT NULL,
account_points int NOT NULL, 
);


CREATE TABLE Landlord (
id int IDENTITY NOT NULL, 
email varchar(100) NOT NULL, 
hashed_password varbinary(80) NOT NULL, 
salt varbinary(50) NOT NULL,
address varchar(255) NOT NULL, 
phone varchar(15) NOT NULL, 
civil_id image NULL, 
status varchar(50) NOT NULL, 
account_points int NOT NULL, 
);


CREATE TABLE [Orders] (
order_id int IDENTITY NOT NULL, 
tenant_id int NOT NULL, 
post_id int NOT NULL, 
status varchar(50) NOT NULL, 
);

CREATE TABLE Post (
id int IDENTITY NOT NULL, 
name varchar(255) NOT NULL, 
price int NOT NULL, 
type int NOT NULL, 
area int NOT NULL, 
NumOfBedrooms int NOT NULL, 
address varchar(255) NOT NULL, 
description nvarchar(2000) NOT NULL, 
landlord_id int NOT NULL, 
status varchar(50) NOT NULL, 
[promotions(%)] int NULL, 
post_start_date date NOT NULL, 
post_end_date date NOT NULL, 

);

CREATE TABLE Property_type (
type_id int IDENTITY NOT NULL, 
type_name varchar(50) NOT NULL, 
);

CREATE TABLE Report (
[report_id] int IDENTITY NOT NULL, 
reporter_id int NOT NULL, 
property_id int NULL, 
reported_id int NULL, 
categories varchar(100) NOT NULL, 
description text NOT NULL, 
status varchar(50) NOT NULL, 

);

CREATE TABLE Review (
review_id int IDENTITY NOT NULL, 
user_id int NOT NULL, 
property_id int NOT NULL, 
rating smallint NOT NULL, 
review varchar(300) NOT NULL, 

);


CREATE TABLE Tenant (
id int IDENTITY NOT NULL, 
email varchar(100) NOT NULL, 
hashed_password varbinary(80) NOT NULL, 
salt varbinary(50) NOT NULL,
address varchar(255) NULL, 
phone varchar(15) NOT NULL, 
civil_id image NULL, 
status varchar(50) NOT NULL,   
);

CREATE TABLE Transactions (
transaction_id int IDENTITY NOT NULL, 
amount decimal(19, 0) NOT NULL, 
payer_id int NOT NULL, 
type varchar(50) NOT NULL, --Recharge=Nạp tiền/Transfer=Chuyển tiền
transaction_date date NOT NULL, 
post_id int NOT NULL, 

);

CREATE TABLE Wishlist (
id int IDENTITY NOT NULL, 
user_id int NOT NULL, 
property_id int NOT NULL, 

);

alter table Admin add constraint PK_Admin
PRIMARY KEY (id);
alter table Landlord add constraint PK_Landlord
PRIMARY KEY (id);
alter table Orders add constraint PK_Orders
PRIMARY KEY (order_id);
alter table Post add constraint PK_Post
PRIMARY KEY (id);
alter table Property_type add constraint PK_typeID
PRIMARY KEY (type_id);
alter table Report add constraint PK_Report
PRIMARY KEY ([report_id]);
alter table Review add constraint PK_Review
PRIMARY KEY (review_id);
alter table Tenant add constraint PK_Tenant
PRIMARY KEY (id);
alter table Transactions add constraint PK_Transaction PRIMARY KEY (transaction_id);
alter table Wishlist add constraint PK_Wishlist
PRIMARY KEY (id);

ALTER TABLE Post ADD CONSTRAINT FK_Post_Landlord FOREIGN KEY (landlord_id) REFERENCES Landlord (id);--1
ALTER TABLE [Orders] ADD CONSTRAINT FK_Order_Post FOREIGN KEY (post_id) REFERENCES Post (id);--2
ALTER TABLE [Orders] ADD CONSTRAINT FK_Order_Tenant FOREIGN KEY (tenant_id) REFERENCES Tenant (id);--3
ALTER TABLE Review ADD CONSTRAINT FK_Review_Post FOREIGN KEY (property_id) REFERENCES Post (id);--4
ALTER TABLE Transactions ADD CONSTRAINT FK_Transaction_Tenant FOREIGN KEY (payer_id) REFERENCES Tenant (id);--5
ALTER TABLE Review ADD CONSTRAINT FK_Review_Tenant FOREIGN KEY (user_id) REFERENCES Tenant (id);--6
ALTER TABLE Report ADD CONSTRAINT FK_Report_Tenant1 FOREIGN KEY (reporter_id) REFERENCES Tenant (id);--7
ALTER TABLE Post ADD CONSTRAINT FK_Post_PropertyType FOREIGN KEY (type) REFERENCES Property_type (type_id);--8
ALTER TABLE Wishlist ADD CONSTRAINT FK_Wishlist_Tenant FOREIGN KEY (user_id) REFERENCES Tenant (id);--9
ALTER TABLE Transactions ADD CONSTRAINT FK_Transaction_Post FOREIGN KEY (post_id) REFERENCES Post (id);--10
ALTER TABLE Report ADD CONSTRAINT FK_Report_Tenant2 FOREIGN KEY (reported_id) REFERENCES Tenant (id);--11
ALTER TABLE Report ADD CONSTRAINT FK_Report_Post FOREIGN KEY (property_id) REFERENCES Post (id);--12
ALTER TABLE Wishlist ADD CONSTRAINT FK_Wishlist_Post FOREIGN KEY (property_id) REFERENCES Post (id);--13

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
insert Admin values
('thanghqhe176429@fpt.edu.vn',CAST(123456 as varbinary(80)),CAST(123456 as varbinary(50)),0);
select * from admin;

insert Property_type values
('Nha Tro'),
('Chung cu');

insert Landlord values

('sytthe176623@fpt.edu.vn',CAST(123456 as varbinary(80)),CAST(123456 as varbinary(50)),'259 Burbank Street, Texas','0942010101',null, '', 0),
('tungdthe176669@fpt.edu.vn',CAST(123456 as varbinary(80)),CAST(123456 as varbinary(50)),'259 Burbank Street, Texas','0942121212',null, 0, 2000),
('antnthe176694@fpt.edu.vn',CAST(123456 as varbinary(80)),CAST(123456 as varbinary(50)),'259 Burbank Street, Texas','0942343434',null, 0, 0),
('thanghq176429@fpt.edu.vn',CAST(123456 as varbinary(80)),CAST(123456 as varbinary(50)),'259 Burbank Street, Texas','0942454545',null, 0, 7000),
('khanhnbhe170920@fpt.edu.vn',CAST(123456 as varbinary(80)),CAST(123456 as varbinary(50)),'259 Burbank Street, Texas','0942565656',null, 0, 6000),
('tienpvhe163824@fpt.edu.vn',CAST(123456 as varbinary(80)),CAST(123456 as varbinary(50)),'259 Burbank Street, Texas','0942676767',null, 0, 0),
('asd@gmail.com',CAST(123456 as varbinary(80)),CAST(123456 as varbinary(50)),'159 Wall Street, New York City','0942434343',null, 1, 13000),
('asds@gmail.com',CAST(123456 as varbinary(80)),CAST(123456 as varbinary(50)),'101 Plankton Street, Virginia','0944121212',null, 1, 20);

select*from Landlord;
insert Post values
('Nha Tro Hoa Hong', 2000, 1, 20, 2, '270 Duong Lang, Dong Da, Ha Noi', 'Description', 1, 'Not Occupied', null, '07/25/2022','08/25/2022'),
('Nha Tro Thai Binh', 800, 1, 10, 1, '27 Duong Song Da, Long Bien, Ha Noi', 'Description', 1, 'Not Occupied', null, '07/25/2022','08/25/2022'),
('Nha Tro Co Loan', 1000, 1, 15, 2, '210 Duong Hai Ba Trung, Cau Giay, Ha Noi', 'Description', 2, 'Not Occupied', 20, '07/26/2023','08/26/2023'),
('Nha Tro Co Hang', 1200, 1, 15, 1, '120 Duong Ho Chi Minh, Cau Giay, Ha Noi', 'Description', 2, 'Not Occupied', 10, '07/26/2023','08/26/2023'),
('Nha Tro FU', 1800, 1, 20, 2, '20 Duong Thang Long, Dong Da, Ha Noi', 'Description', 3, 'Not Occupied', null, '07/25/2022','08/25/2022'),
('Chung cu Phenika', 1500,2, 18, 1, '75 Duong Giai Phong, Thanh Xuan, Ha Noi', 'Description', 4, 'Not occupied', null, '01/11/2023','02/11/2023'),
('Chung cu Hoa Lac', 1200, 2, 14, 1, '25 Duong Le Hong Phong, Hoan Kiem, Ha Noi', 'Description', 5, 'Occupied', null, '06/24/2023','06/30/2023'),
('Chung cu HoLA', 1500, 2, 20, 1, '234 Yen Lang, Dong Da, Ha Noi', 'Description', 6, 'Occupied', null, '06/24/2023','06/30/2023'),
('Chung cu Funfact', 2100, 2, 20, 3, '250 Yen Lang, Dong Da, Ha Noi', 'Description', 6, 'Not Occupied', null, '06/02/2023','07/02/2023'),
('Chung cu ABC', 900, 2, 20, 2, '102 Pham Hung, Cau Giay, Ha Noi', 'Description', 1, 'Not Occupied', null, '06/21/2023','07/21/2023'),
('Chung cu HLE', 1500, 2, 20, 1, '234 Yen Lang, Dong Da, Ha Noi', 'Description', 6, 'Occupied', null, '06/24/2023','06/30/2023');
select*from Post;

insert Tenant values
('qwerty@gmail.com', CAST(123456 as varbinary(80)),CAST(123456 as varbinary(50)), 'So 25 Duong Lang','0923232323',null, 'Occupying'),
('qwe@gmail.com', CAST(123456 as varbinary(80)),CAST(123456 as varbinary(50)), 'So 25 Duong Lang','0924242424',null, 'Free');
select*from Tenant;

insert Orders values
(1,1,'Approved'),
(2,2,'Rejected');
--
select*from Orders;
