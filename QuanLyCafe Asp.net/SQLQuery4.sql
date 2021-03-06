create procedure ThemDichVu(@id nvarchar(50),@TenDV nvarchar(50) , @Gia int , @HinhAnh nvarchar(50),@maTheLoai nvarchar(50))
as
begin
	Insert Into DichVU(MaDV,TenDV,Gia,HinhAnh, maLoaiDV)
	values (@id,@TenDV,@Gia,@HinhAnh,@maTheLoai)
end 

create procedure SuaDichVu(@id nvarchar(50),@TenDV nvarchar(50) , @Gia int , @HinhAnh nvarchar(50),@maTheLoai nvarchar(50))
as
begin
	update DichVu
	set maDV = @id, TenDV = @TenDV, Gia= @Gia,HinhAnh=@HinhAnh, maLoaiDV = @maTheLoai
	where MaDV = @id
end 
SuaDichVu '45', 'a',14000,'a',1
update DICHVU
set MaDV =23 ,TenDV='a'
where MaDV =45

create procedure XoaDichVu(@id nvarchar(50))
as
begin
	 delete from DICHVU where MaDV = @id
end 

select maLoaiDV,TenLoaiDichVu
from TheLoaiDichVu

select TrangThai from Ban where MaBan = 1
insert into Bill(MaBan) values (10)

update Ban set TrangThai =0 where MaBan =10


select top 1  MaBill from Bill where MaBan=1
order by MaBill desc


select DichVu.MaDV,TenDV,DonViTinh,Gia,SoLuong, SoLuong*Gia
				from DICHVU join SUDUNGDICHVU on DICHVU.MaDV = SUDUNGDICHVU.MaDV 
				where MaBill=76
				
				
				update Bill set NgayThanhToan='02-11-2012' where MaBill=76
				

select Id,UserName,TenHienThi,PassWord,role
from ACCOUNT
where UserName = 'admin' and PassWord='1111'

select MaDV,TenDV,Gia,maLoaiDV from DICHVU



---------------------
--------------
USE [master]
GO
/****** Object:  Database [Cafe]    Script Date: 06/16/2017 01:05:08 ******/
CREATE DATABASE [Cafe] ON  PRIMARY 
( NAME = N'Cafe', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\Cafe.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Cafe_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\Cafe_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Cafe] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Cafe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Cafe] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Cafe] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Cafe] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Cafe] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Cafe] SET ARITHABORT OFF
GO
ALTER DATABASE [Cafe] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Cafe] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Cafe] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Cafe] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Cafe] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Cafe] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Cafe] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Cafe] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Cafe] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Cafe] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Cafe] SET  DISABLE_BROKER
GO
ALTER DATABASE [Cafe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Cafe] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Cafe] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Cafe] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Cafe] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Cafe] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Cafe] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Cafe] SET  READ_WRITE
GO
ALTER DATABASE [Cafe] SET RECOVERY SIMPLE
GO
ALTER DATABASE [Cafe] SET  MULTI_USER
GO
ALTER DATABASE [Cafe] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Cafe] SET DB_CHAINING OFF
GO
USE [Cafe]
GO
/****** Object:  Table [dbo].[DICHVU]    Script Date: 06/16/2017 01:05:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DICHVU](
	[MaDV] [nvarchar](50) NOT NULL,
	[TenDV] [nvarchar](50) NULL,
	[DonViTinh] [nvarchar](50) NULL,
	[Gia] [int] NULL,
	[HinhAnh] [nvarchar](250) NULL,
	[maLoaiDV] [nvarchar](50) NULL,
 CONSTRAINT [PK_DICHVU] PRIMARY KEY CLUSTERED 
(
	[MaDV] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[DICHVU] ([MaDV], [TenDV], [DonViTinh], [Gia], [HinhAnh], [maLoaiDV]) VALUES (N'1', N'cafe phê sữa nóng', N'Ly', 12000, N'dichvu_1.jpg', N'1')
INSERT [dbo].[DICHVU] ([MaDV], [TenDV], [DonViTinh], [Gia], [HinhAnh], [maLoaiDV]) VALUES (N'10', N'Combo1', NULL, 49000, N'dichvu_10.jpg', N'3')
INSERT [dbo].[DICHVU] ([MaDV], [TenDV], [DonViTinh], [Gia], [HinhAnh], [maLoaiDV]) VALUES (N'11', N'Combo 2', NULL, 49000, N'dichvu_11.jpg', N'3')
INSERT [dbo].[DICHVU] ([MaDV], [TenDV], [DonViTinh], [Gia], [HinhAnh], [maLoaiDV]) VALUES (N'2', N'Cafe Sài Gòn', N'Ly', 10000, N'dichvu_2.jpg', N'1')
INSERT [dbo].[DICHVU] ([MaDV], [TenDV], [DonViTinh], [Gia], [HinhAnh], [maLoaiDV]) VALUES (N'22', N'Cafe', NULL, 5000, N'dichvu_22', N'1')
INSERT [dbo].[DICHVU] ([MaDV], [TenDV], [DonViTinh], [Gia], [HinhAnh], [maLoaiDV]) VALUES (N'3', N'Nước cam', N'Ly', 7000, N'dichvu_3.jpg', N'1')
INSERT [dbo].[DICHVU] ([MaDV], [TenDV], [DonViTinh], [Gia], [HinhAnh], [maLoaiDV]) VALUES (N'4', N'Nước chanh', N'Ly', 7000, N'dichvu_4.jpg', N'1')
INSERT [dbo].[DICHVU] ([MaDV], [TenDV], [DonViTinh], [Gia], [HinhAnh], [maLoaiDV]) VALUES (N'5', N'Xì tin', N'Chai', 8000, NULL, NULL)
INSERT [dbo].[DICHVU] ([MaDV], [TenDV], [DonViTinh], [Gia], [HinhAnh], [maLoaiDV]) VALUES (N'6', N'C2', NULL, 7000, N'dichvu_6.jpg', N'1')
INSERT [dbo].[DICHVU] ([MaDV], [TenDV], [DonViTinh], [Gia], [HinhAnh], [maLoaiDV]) VALUES (N'7', N'Trà Sữa', NULL, 15000, N'dichvu_7.jpg', N'1')
INSERT [dbo].[DICHVU] ([MaDV], [TenDV], [DonViTinh], [Gia], [HinhAnh], [maLoaiDV]) VALUES (N'8', N'3 số', NULL, 30000, N'dichvu_8.jpg', N'2')
INSERT [dbo].[DICHVU] ([MaDV], [TenDV], [DonViTinh], [Gia], [HinhAnh], [maLoaiDV]) VALUES (N'9', N'Ngựa trắng', NULL, 20000, N'dichvu_9.jpg', N'2')
/****** Object:  Table [dbo].[Bill]    Script Date: 06/16/2017 01:05:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[MaBill] [int] IDENTITY(1,1) NOT NULL,
	[MaBan] [int] NULL,
	[TongTien] [float] NULL,
	[NgayThanhToan] [date] NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[MaBill] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bill] ON
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (15, 3, 0, CAST(0xD73C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (16, 3, 0, CAST(0xD73C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (17, 3, 0, CAST(0xD73C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (18, 3, 0, CAST(0xD73C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (19, 5, 0, CAST(0xD73C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (20, 5, 0, CAST(0xD73C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (21, 5, 0, CAST(0xD73C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (22, 3, 0, CAST(0xD73C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (23, 3, 0, CAST(0xD73C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (24, 3, 0, CAST(0xD73C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (25, 1, 0, CAST(0xD73C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (26, 1, 0, CAST(0xD63C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (27, 1, 0, CAST(0xD63C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (28, 1, 0, CAST(0xD63C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (29, 1, 0, CAST(0xD63C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (30, 4, 0, CAST(0xD63C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (31, 4, 0, CAST(0xD63C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (32, 4, 0, CAST(0xD63C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (33, 4, 0, CAST(0xD63C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (34, 4, 0, CAST(0xD63C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (35, 5, 0, CAST(0xD63C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (36, 2, 0, CAST(0xD63C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (37, 2, 0, CAST(0xD63C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (38, 2, 0, CAST(0xD63C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (39, 1, 0, CAST(0xD63C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (40, 1, 0, CAST(0xD73C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (41, 1, 0, CAST(0xD63C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (42, 1, 0, CAST(0xD63C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (43, 1, 0, CAST(0xD63C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (44, 3, 0, CAST(0xD63C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (45, 2, 0, CAST(0xD63C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (46, 4, 0, CAST(0xD63C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (47, 4, 0, CAST(0xD63C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (48, 4, 0, CAST(0xD63C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (49, 1, 0, CAST(0xD63C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (50, 2, 0, CAST(0xD63C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (51, 2, 0, CAST(0xD63C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (52, 2, 0, CAST(0xD63C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (53, 2, 0, CAST(0xD63C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (54, 2, 0, CAST(0xD63C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (55, 2, 0, CAST(0xD63C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (56, 2, 0, CAST(0xD63C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (57, 2, 0, CAST(0xD63C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (58, 1, 0, CAST(0xD73C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (59, 2, 0, CAST(0xD83C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (60, 5, 0, CAST(0xD73C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (61, 2, 0, CAST(0xD83C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (62, 2, 0, CAST(0xD83C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (63, 2, 0, CAST(0xD83C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (64, 1, 0, CAST(0xD83C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (65, 3, 0, CAST(0xD73C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (66, 2, 0, CAST(0xD83C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (67, NULL, NULL, CAST(0xD83C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (68, NULL, NULL, CAST(0xD73C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (69, NULL, NULL, CAST(0xD63C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (87, 10, NULL, NULL)
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (88, 10, NULL, NULL)
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (89, 10, NULL, NULL)
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (90, 10, NULL, NULL)
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (91, 10, NULL, NULL)
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (92, 10, NULL, NULL)
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (93, 10, NULL, NULL)
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (94, 10, NULL, NULL)
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (95, 10, NULL, NULL)
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (96, 10, NULL, NULL)
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (97, 10, NULL, NULL)
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (98, 10, NULL, NULL)
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (99, 10, NULL, NULL)
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (100, 10, NULL, NULL)
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (101, 10, NULL, NULL)
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (102, 10, NULL, CAST(0xEE3C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (103, 10, NULL, CAST(0xEE3C0B00 AS Date))
INSERT [dbo].[Bill] ([MaBill], [MaBan], [TongTien], [NgayThanhToan]) VALUES (104, 10, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Bill] OFF
/****** Object:  Table [dbo].[Ban]    Script Date: 06/16/2017 01:05:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ban](
	[MaBan] [int] IDENTITY(1,1) NOT NULL,
	[TenBan] [nvarchar](50) NULL,
	[TrangThai] [int] NULL,
 CONSTRAINT [PK_Ban] PRIMARY KEY CLUSTERED 
(
	[MaBan] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Ban] ON
INSERT [dbo].[Ban] ([MaBan], [TenBan], [TrangThai]) VALUES (1, N'Bàn 1', 0)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [TrangThai]) VALUES (2, N'Bàn 2', 1)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [TrangThai]) VALUES (3, N'Bàn 3', 1)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [TrangThai]) VALUES (4, N'Bàn 4', 0)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [TrangThai]) VALUES (5, N'Bàn 5', 1)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [TrangThai]) VALUES (6, N'Bàn 6', 0)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [TrangThai]) VALUES (7, N'Bàn 7', 0)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [TrangThai]) VALUES (8, N'Bàn 8', 0)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [TrangThai]) VALUES (9, N'Bàn 9', 0)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [TrangThai]) VALUES (10, N'Bàn 10', 1)
SET IDENTITY_INSERT [dbo].[Ban] OFF
/****** Object:  Table [dbo].[ACCOUNT]    Script Date: 06/16/2017 01:05:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ACCOUNT](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[TenHienThi] [nvarchar](50) NULL,
	[PassWord] [varchar](50) NULL,
	[role] [nvarchar](50) NULL,
 CONSTRAINT [PK_ACCOUNT] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ACCOUNT] ON
INSERT [dbo].[ACCOUNT] ([Id], [UserName], [TenHienThi], [PassWord], [role]) VALUES (1, N'admin', N'Chủ Quán', N'b59c67bf196a4758191e42f76670ceba', N'QuanTri')
INSERT [dbo].[ACCOUNT] ([Id], [UserName], [TenHienThi], [PassWord], [role]) VALUES (2, N'admin2', N'COi Quán', N'1234', N'QuanTri')
INSERT [dbo].[ACCOUNT] ([Id], [UserName], [TenHienThi], [PassWord], [role]) VALUES (3, N'nhanvien', N'nhân viên  1', N'b59c67bf196a4758191e42f76670ceba', N'NhanVien')
INSERT [dbo].[ACCOUNT] ([Id], [UserName], [TenHienThi], [PassWord], [role]) VALUES (4, N'nhanvien2', N'nhân viên  2', N'1234', N'NhanVien')
SET IDENTITY_INSERT [dbo].[ACCOUNT] OFF
/****** Object:  Table [dbo].[TheLoaiDichVu]    Script Date: 06/16/2017 01:05:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheLoaiDichVu](
	[maLoaiDV] [nvarchar](50) NOT NULL,
	[TenLoaiDichVu] [nvarchar](50) NULL,
 CONSTRAINT [PK_TheLoaiDichVu] PRIMARY KEY CLUSTERED 
(
	[maLoaiDV] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[TheLoaiDichVu] ([maLoaiDV], [TenLoaiDichVu]) VALUES (N'1', N'Nước uống')
INSERT [dbo].[TheLoaiDichVu] ([maLoaiDV], [TenLoaiDichVu]) VALUES (N'2', N'Thuốc lá')
INSERT [dbo].[TheLoaiDichVu] ([maLoaiDV], [TenLoaiDichVu]) VALUES (N'3', N'Điểm tâm')
/****** Object:  Table [dbo].[SUDUNGDICHVU]    Script Date: 06/16/2017 01:05:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUDUNGDICHVU](
	[MaDV] [nvarchar](50) NULL,
	[MaBill] [int] NULL,
	[SoLuong] [int] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'1', 40, 2)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'1', 41, 11)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'2', 42, 11)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'2', 44, 1)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'1', 45, 1)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'1', 46, 1)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'1', 47, 2)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'1', 48, -2)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'1', 49, 3)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'5', 49, 2)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'4', 49, 1)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'1', 2, 3)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'1', 50, 1)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'1', 51, 2)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'1', 52, 2)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'1', 53, 2)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'1', 54, 222)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'1', 55, 7)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'3', 55, 10)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'1', 56, 2)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'1', 57, 5)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'3', 57, 1)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'1', 58, 2)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'3', 59, 2)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'4', 38, 12312)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'1', 39, 67)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'2', 39, 220)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'2', 38, 40)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'1', 38, 345)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'1', 43, 2)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'1', 59, 2)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'1', 60, 26)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'1', 61, 222)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'1', 62, 444)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'1', 63, 22)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'3', 63, 22)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'22', 75, 50)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'22', 75, 50)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'22', 75, 50)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'22', 75, 50)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'22', 75, 1)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'22', 75, 2)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'22', 0, 1)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'6', 0, 1)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'22', 83, 1)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'-1', 85, 1)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'22', 85, 1)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'22', 88, 1)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'22', 89, 1)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'22', 75, 500)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'22', 75, 500)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'22', 75, 1)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'22', 75, 1)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'22', 75, 1)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'22', 75, 1)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'22', 75, 1)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'6', 75, 2)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'22', 75, 2)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'22', 75, 2)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'22', 75, 2)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'22', 76, 1)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'22', 79, 1)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'22', 81, 1)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'22', 83, 1)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'22', 87, 1)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'22', 75, 500)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'', 0, 1)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'22', 76, 1)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'22', 76, 1)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'22', 77, 1)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'22', 77, 1)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'22', 79, 1)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'22', 84, 1)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'22', 103, 1)
INSERT [dbo].[SUDUNGDICHVU] ([MaDV], [MaBill], [SoLuong]) VALUES (N'22', 78, 1)
/****** Object:  StoredProcedure [dbo].[XoaDichVu]    Script Date: 06/16/2017 01:05:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[XoaDichVu](@id nvarchar(50))
as
begin
	 delete from DICHVU where MaDV = @id
end
GO
/****** Object:  StoredProcedure [dbo].[ThemDichVu]    Script Date: 06/16/2017 01:05:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ThemDichVu](@id nvarchar(50),@TenDV nvarchar(50) , @Gia int , @HinhAnh nvarchar(50),@maTheLoai nvarchar(50))
as
begin
	Insert Into DichVU(MaDV,TenDV,Gia,HinhAnh, maLoaiDV)
	values (@id,@TenDV,@Gia,@HinhAnh,@maTheLoai)
end 



select maLoaiDV,TenLoaiDichVu
from TheLoaiDichVu
GO
/****** Object:  StoredProcedure [dbo].[SuaDichVu]    Script Date: 06/16/2017 01:05:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SuaDichVu](@id nvarchar(50),@TenDV nvarchar(50) , @Gia int , @HinhAnh nvarchar(50),@maTheLoai nvarchar(50))
as
begin
	update DichVu
	set maDV = @id, TenDV = @TenDV, Gia= @Gia,HinhAnh=@HinhAnh, maLoaiDV = @maTheLoai
	where MaDV = @id
end
GO
