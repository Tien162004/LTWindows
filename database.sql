USE [master]
GO
/****** Object:  Database [db_quan_ly_ban_sach]    Script Date: 11/2/2024 5:21:17 PM ******/
CREATE DATABASE [db_quan_ly_ban_sach]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_quan_ly_ban_sach', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\db_quan_ly_ban_sach.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'db_quan_ly_ban_sach_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\db_quan_ly_ban_sach_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [db_quan_ly_ban_sach] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_quan_ly_ban_sach].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_quan_ly_ban_sach] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_quan_ly_ban_sach] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_quan_ly_ban_sach] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_quan_ly_ban_sach] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_quan_ly_ban_sach] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_quan_ly_ban_sach] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db_quan_ly_ban_sach] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_quan_ly_ban_sach] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_quan_ly_ban_sach] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_quan_ly_ban_sach] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_quan_ly_ban_sach] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_quan_ly_ban_sach] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_quan_ly_ban_sach] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_quan_ly_ban_sach] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_quan_ly_ban_sach] SET  DISABLE_BROKER 
GO
ALTER DATABASE [db_quan_ly_ban_sach] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_quan_ly_ban_sach] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_quan_ly_ban_sach] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_quan_ly_ban_sach] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_quan_ly_ban_sach] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_quan_ly_ban_sach] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_quan_ly_ban_sach] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_quan_ly_ban_sach] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [db_quan_ly_ban_sach] SET  MULTI_USER 
GO
ALTER DATABASE [db_quan_ly_ban_sach] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_quan_ly_ban_sach] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_quan_ly_ban_sach] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_quan_ly_ban_sach] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db_quan_ly_ban_sach] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [db_quan_ly_ban_sach] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [db_quan_ly_ban_sach] SET QUERY_STORE = ON
GO
ALTER DATABASE [db_quan_ly_ban_sach] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [db_quan_ly_ban_sach]
GO
/****** Object:  Table [dbo].[tbl_chi_tiet_hoa_don]    Script Date: 11/2/2024 5:21:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_chi_tiet_hoa_don](
	[ma_hoa_don] [int] IDENTITY(1,1) NOT NULL,
	[ma_sach] [int] NOT NULL,
	[so_luong] [int] NOT NULL,
 CONSTRAINT [PK_tbl_chi_tiet_hoa_don] PRIMARY KEY CLUSTERED 
(
	[ma_hoa_don] ASC,
	[ma_sach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_chi_tiet_phieu_nhap]    Script Date: 11/2/2024 5:21:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_chi_tiet_phieu_nhap](
	[ma_phieu_nhap] [int] NOT NULL,
	[ma_sach] [int] NOT NULL,
	[so_luong] [int] NOT NULL,
	[gia_nhap] [decimal](18, 2) NULL,
 CONSTRAINT [PK_tbl_chi_tiet_phieu_nhap] PRIMARY KEY CLUSTERED 
(
	[ma_phieu_nhap] ASC,
	[ma_sach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_hoa_don]    Script Date: 11/2/2024 5:21:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_hoa_don](
	[ma_hoa_don] [int] IDENTITY(1,1) NOT NULL,
	[ngay_lap_hoa_don] [datetime] NOT NULL,
	[ten_khach_hang] [nvarchar](50) NOT NULL,
	[sdt_khach_hang] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_hoa_don] PRIMARY KEY CLUSTERED 
(
	[ma_hoa_don] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_loai_sach]    Script Date: 11/2/2024 5:21:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_loai_sach](
	[ma_loai_sach] [int] IDENTITY(1,1) NOT NULL,
	[ten_loai_sach] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_tbl_loai_sach] PRIMARY KEY CLUSTERED 
(
	[ma_loai_sach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_phieu_nhap]    Script Date: 11/2/2024 5:21:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_phieu_nhap](
	[ma_phieu_nhap] [int] IDENTITY(1,1) NOT NULL,
	[ngay_lap_phieu_nhap] [datetime] NOT NULL,
	[ten_nha_cung_cap] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_phieu_nhap] PRIMARY KEY CLUSTERED 
(
	[ma_phieu_nhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_sach]    Script Date: 11/2/2024 5:21:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_sach](
	[ma_sach] [int] IDENTITY(1,1) NOT NULL,
	[ten_sach] [nvarchar](256) NOT NULL,
	[ma_loai_sach] [int] NOT NULL,
	[tac_gia] [nvarchar](256) NOT NULL,
	[so_luong] [int] NOT NULL,
	[gia_ban] [float] NOT NULL,
 CONSTRAINT [PK_tbl_sach] PRIMARY KEY CLUSTERED 
(
	[ma_sach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tbl_chi_tiet_phieu_nhap] ([ma_phieu_nhap], [ma_sach], [so_luong], [gia_nhap]) VALUES (3, 16, 2, CAST(1000.00 AS Decimal(18, 2)))
INSERT [dbo].[tbl_chi_tiet_phieu_nhap] ([ma_phieu_nhap], [ma_sach], [so_luong], [gia_nhap]) VALUES (3, 27, 1, CAST(12000.00 AS Decimal(18, 2)))
INSERT [dbo].[tbl_chi_tiet_phieu_nhap] ([ma_phieu_nhap], [ma_sach], [so_luong], [gia_nhap]) VALUES (3, 28, 4, CAST(15000.00 AS Decimal(18, 2)))
INSERT [dbo].[tbl_chi_tiet_phieu_nhap] ([ma_phieu_nhap], [ma_sach], [so_luong], [gia_nhap]) VALUES (5, 16, 4, CAST(14000.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[tbl_hoa_don] ON 

INSERT [dbo].[tbl_hoa_don] ([ma_hoa_don], [ngay_lap_hoa_don], [ten_khach_hang], [sdt_khach_hang]) VALUES (1, CAST(N'2024-10-26T00:00:00.000' AS DateTime), N'Vo Thi Kieu Tien', N'0326115340')
INSERT [dbo].[tbl_hoa_don] ([ma_hoa_don], [ngay_lap_hoa_don], [ten_khach_hang], [sdt_khach_hang]) VALUES (4, CAST(N'2024-10-25T00:00:00.000' AS DateTime), N'Ho Thi Thu An', N'0367902640')
SET IDENTITY_INSERT [dbo].[tbl_hoa_don] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_loai_sach] ON 

INSERT [dbo].[tbl_loai_sach] ([ma_loai_sach], [ten_loai_sach]) VALUES (1, N'Sách Văn Học')
INSERT [dbo].[tbl_loai_sach] ([ma_loai_sach], [ten_loai_sach]) VALUES (2, N'Sách Toán')
INSERT [dbo].[tbl_loai_sach] ([ma_loai_sach], [ten_loai_sach]) VALUES (3, N'Sách hoa Học')
INSERT [dbo].[tbl_loai_sach] ([ma_loai_sach], [ten_loai_sach]) VALUES (4, N'sach anh van')
INSERT [dbo].[tbl_loai_sach] ([ma_loai_sach], [ten_loai_sach]) VALUES (5, N'Sách khoa Học')
INSERT [dbo].[tbl_loai_sach] ([ma_loai_sach], [ten_loai_sach]) VALUES (6, N'Sách van Học')
INSERT [dbo].[tbl_loai_sach] ([ma_loai_sach], [ten_loai_sach]) VALUES (8, N'Sách khoa Học')
INSERT [dbo].[tbl_loai_sach] ([ma_loai_sach], [ten_loai_sach]) VALUES (12, N'')
INSERT [dbo].[tbl_loai_sach] ([ma_loai_sach], [ten_loai_sach]) VALUES (13, N'Sách khoa k')
INSERT [dbo].[tbl_loai_sach] ([ma_loai_sach], [ten_loai_sach]) VALUES (14, N'Sách Toán4')
INSERT [dbo].[tbl_loai_sach] ([ma_loai_sach], [ten_loai_sach]) VALUES (15, N'sach an van')
SET IDENTITY_INSERT [dbo].[tbl_loai_sach] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_phieu_nhap] ON 

INSERT [dbo].[tbl_phieu_nhap] ([ma_phieu_nhap], [ngay_lap_phieu_nhap], [ten_nha_cung_cap]) VALUES (2, CAST(N'2024-08-31T00:00:00.000' AS DateTime), N'NXB Việt Nam')
INSERT [dbo].[tbl_phieu_nhap] ([ma_phieu_nhap], [ngay_lap_phieu_nhap], [ten_nha_cung_cap]) VALUES (3, CAST(N'2024-08-16T00:00:00.000' AS DateTime), N'NXB nuoc ngoai')
INSERT [dbo].[tbl_phieu_nhap] ([ma_phieu_nhap], [ngay_lap_phieu_nhap], [ten_nha_cung_cap]) VALUES (5, CAST(N'2024-08-16T00:00:00.000' AS DateTime), N'NXB nuoc ngoai')
SET IDENTITY_INSERT [dbo].[tbl_phieu_nhap] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_sach] ON 

INSERT [dbo].[tbl_sach] ([ma_sach], [ten_sach], [ma_loai_sach], [tac_gia], [so_luong], [gia_ban]) VALUES (1, N'Ngữ Văn 1', 1, N'NXB Việt Nam', 10, 20000)
INSERT [dbo].[tbl_sach] ([ma_sach], [ten_sach], [ma_loai_sach], [tac_gia], [so_luong], [gia_ban]) VALUES (16, N'Toán 2', 2, N'NXB Việt Nam', 20, 15000)
INSERT [dbo].[tbl_sach] ([ma_sach], [ten_sach], [ma_loai_sach], [tac_gia], [so_luong], [gia_ban]) VALUES (27, N'Toán 3', 2, N'NXB Việt Nam', 19, 15000)
INSERT [dbo].[tbl_sach] ([ma_sach], [ten_sach], [ma_loai_sach], [tac_gia], [so_luong], [gia_ban]) VALUES (28, N'Ngữ Văn 2', 1, N'NXB Việt Nam', 10, 20000)
INSERT [dbo].[tbl_sach] ([ma_sach], [ten_sach], [ma_loai_sach], [tac_gia], [so_luong], [gia_ban]) VALUES (29, N'Toán 3', 2, N'NXB Việt Nam', 19, 15000)
SET IDENTITY_INSERT [dbo].[tbl_sach] OFF
GO
ALTER TABLE [dbo].[tbl_chi_tiet_hoa_don]  WITH CHECK ADD  CONSTRAINT [FK_tbl_chi_tiet_hoa_don_tbl_hoa_don] FOREIGN KEY([ma_hoa_don])
REFERENCES [dbo].[tbl_hoa_don] ([ma_hoa_don])
GO
ALTER TABLE [dbo].[tbl_chi_tiet_hoa_don] CHECK CONSTRAINT [FK_tbl_chi_tiet_hoa_don_tbl_hoa_don]
GO
ALTER TABLE [dbo].[tbl_chi_tiet_hoa_don]  WITH CHECK ADD  CONSTRAINT [FK_tbl_chi_tiet_hoa_don_tbl_sach] FOREIGN KEY([ma_sach])
REFERENCES [dbo].[tbl_sach] ([ma_sach])
GO
ALTER TABLE [dbo].[tbl_chi_tiet_hoa_don] CHECK CONSTRAINT [FK_tbl_chi_tiet_hoa_don_tbl_sach]
GO
ALTER TABLE [dbo].[tbl_chi_tiet_phieu_nhap]  WITH CHECK ADD  CONSTRAINT [FK_tbl_chi_tiet_phieu_nhap_tbl_phieu_nhap] FOREIGN KEY([ma_phieu_nhap])
REFERENCES [dbo].[tbl_phieu_nhap] ([ma_phieu_nhap])
GO
ALTER TABLE [dbo].[tbl_chi_tiet_phieu_nhap] CHECK CONSTRAINT [FK_tbl_chi_tiet_phieu_nhap_tbl_phieu_nhap]
GO
ALTER TABLE [dbo].[tbl_chi_tiet_phieu_nhap]  WITH CHECK ADD  CONSTRAINT [FK_tbl_chi_tiet_phieu_nhap_tbl_sach] FOREIGN KEY([ma_sach])
REFERENCES [dbo].[tbl_sach] ([ma_sach])
GO
ALTER TABLE [dbo].[tbl_chi_tiet_phieu_nhap] CHECK CONSTRAINT [FK_tbl_chi_tiet_phieu_nhap_tbl_sach]
GO
ALTER TABLE [dbo].[tbl_sach]  WITH CHECK ADD  CONSTRAINT [FK_tbl_sach_tbl_loai_sach] FOREIGN KEY([ma_loai_sach])
REFERENCES [dbo].[tbl_loai_sach] ([ma_loai_sach])
GO
ALTER TABLE [dbo].[tbl_sach] CHECK CONSTRAINT [FK_tbl_sach_tbl_loai_sach]
GO
/****** Object:  StoredProcedure [dbo].[proc_cap_nhat_chi_tiet_hoa_don]    Script Date: 11/2/2024 5:21:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proc_cap_nhat_chi_tiet_hoa_don]
    @maHoaDon int, @maSach int, @soLuong int
as
begin
    update tbl_chi_tiet_hoa_don
    set so_luong = @soLuong
    where ma_hoa_don = @maHoaDon and ma_sach = @maSach;
end
GO
/****** Object:  StoredProcedure [dbo].[proc_cap_nhat_chi_tiet_phieu_nhap]    Script Date: 11/2/2024 5:21:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proc_cap_nhat_chi_tiet_phieu_nhap]
    @maPhieuNhap int, @maSach int, @soLuong int
as
begin
    update tbl_chi_tiet_phieu_nhap
    set so_luong = @soLuong
    where ma_phieu_nhap = @maPhieuNhap and ma_sach = @maSach;
end
GO
/****** Object:  StoredProcedure [dbo].[proc_cap_nhat_hoa_don]    Script Date: 11/2/2024 5:21:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create the new procedure
CREATE PROCEDURE [dbo].[proc_cap_nhat_hoa_don]
    @maHoaDon INT,
    @ngayLapHoaDon DATE,
    @tenKhachHang NVARCHAR(100),
    @sdtKhachHang NVARCHAR(15)
AS
BEGIN
    UPDATE tbl_hoa_don
    SET
        ngay_lap_hoa_don = @ngayLapHoaDon,
        ten_khach_hang = @tenKhachHang,
        sdt_khach_hang = @sdtKhachHang
    WHERE
        ma_hoa_don = @maHoaDon;
END
GO
/****** Object:  StoredProcedure [dbo].[proc_cap_nhat_loai_sach]    Script Date: 11/2/2024 5:21:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proc_cap_nhat_loai_sach]
    @maLoaiSach int, @tenLoaiSach nvarchar(256)
as
begin
    update tbl_loai_sach
    set ten_loai_sach = @tenLoaiSach
    where ma_loai_sach = @maLoaiSach;
end
GO
/****** Object:  StoredProcedure [dbo].[proc_cap_nhat_phieu_nhap]    Script Date: 11/2/2024 5:21:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[proc_cap_nhat_phieu_nhap]
    @ngayLapPhieuNhap DATE,
    @tenNhaCungCap NVARCHAR(255),
    @maPhieuNhap INT
AS
BEGIN
    UPDATE tbl_phieu_nhap
    SET ngay_lap_phieu_nhap = @ngayLapPhieuNhap,
        ten_nha_cung_cap = @tenNhaCungCap
    WHERE ma_phieu_nhap = @maPhieuNhap;
END
GO
/****** Object:  StoredProcedure [dbo].[proc_cap_nhat_sach]    Script Date: 11/2/2024 5:21:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[proc_cap_nhat_sach]
    @maSach INT,
    @tenSach NVARCHAR(255),
    @maLoaiSach INT,
    @tacGia NVARCHAR(255),
    @soLuong INT,
    @giaBan DECIMAL(18, 2)
AS
BEGIN
    UPDATE tbl_sach
    SET ten_sach = @tenSach,
        ma_loai_sach = @maLoaiSach,
        tac_gia = @tacGia,
        so_luong = @soLuong,
        gia_ban = @giaBan
    WHERE ma_sach = @maSach;
END;
GO
/****** Object:  StoredProcedure [dbo].[proc_sua_sach]    Script Date: 11/2/2024 5:21:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_sua_sach]
    @maSach INT,
    @tenSach NVARCHAR(255),
    @maLoaiSach INT,
    @tacGia NVARCHAR(255),
    @soLuong INT,
    @giaBan DECIMAL(18, 2)
AS
BEGIN
    UPDATE tbl_sach
    SET 
        ten_sach = @tenSach,
        ma_loai_sach = @maLoaiSach,
        tac_gia = @tacGia,
        so_luong = @soLuong,
        gia_ban = @giaBan
    WHERE ma_sach = @maSach;
END;
GO
/****** Object:  StoredProcedure [dbo].[proc_them_chi_tiet_hoa_don]    Script Date: 11/2/2024 5:21:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proc_them_chi_tiet_hoa_don]
    @maHoaDon int, @maSach int, @soLuong int
as
begin
    insert into tbl_chi_tiet_hoa_don(ma_hoa_don, ma_sach, so_luong)
    values(@maHoaDon, @maSach, @soLuong);
end
GO
/****** Object:  StoredProcedure [dbo].[proc_them_chi_tiet_phieu_nhap]    Script Date: 11/2/2024 5:21:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[proc_them_chi_tiet_phieu_nhap]
    @maPhieuNhap INT,
    @maSach INT,
    @soLuong INT,
    @giaNhap DECIMAL(18, 2)
AS
BEGIN
    INSERT INTO tbl_chi_tiet_phieu_nhap (ma_phieu_nhap, ma_sach, so_luong, gia_nhap)
    VALUES (@maPhieuNhap, @maSach, @soLuong, @giaNhap);
END;
GO
/****** Object:  StoredProcedure [dbo].[proc_them_hoa_don]    Script Date: 11/2/2024 5:21:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_them_hoa_don]
    @ngayLapHoaDon DATE,
    @tenKhachHang NVARCHAR(100),
    @sdtKhachHang NVARCHAR(15)
AS
BEGIN
    -- Your logic to insert a new invoice
    INSERT INTO tbl_hoa_don (ngay_lap_hoa_don, ten_khach_hang, sdt_khach_hang)
    VALUES (@ngayLapHoaDon, @tenKhachHang, @sdtKhachHang);
END
GO
/****** Object:  StoredProcedure [dbo].[proc_them_loai_sach]    Script Date: 11/2/2024 5:21:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proc_them_loai_sach]
    @tenLoaiSach nvarchar(256)
as
begin
    insert into tbl_loai_sach(ten_loai_sach) values(@tenLoaiSach);
end
GO
/****** Object:  StoredProcedure [dbo].[proc_them_phieu_nhap]    Script Date: 11/2/2024 5:21:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[proc_them_phieu_nhap]
    @ngayLapPhieuNhap DATE,
    @tenNhaCungCap NVARCHAR(255)  -- Adjust based on your table schema
AS
BEGIN
    INSERT INTO tbl_phieu_nhap (ngay_lap_phieu_nhap, ten_nha_cung_cap)  -- Use actual column names
    VALUES (@ngayLapPhieuNhap, @tenNhaCungCap);
END
GO
/****** Object:  StoredProcedure [dbo].[proc_them_sach]    Script Date: 11/2/2024 5:21:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create the new procedure
CREATE PROCEDURE [dbo].[proc_them_sach]
    @tenSach NVARCHAR(255),
    @maLoaiSach INT,
    @tacGia NVARCHAR(255),
    @soLuong INT,
    @giaBan DECIMAL(18, 2)
AS
BEGIN
    INSERT INTO tbl_sach (ten_sach, ma_loai_sach, tac_gia, so_luong, gia_ban)
    VALUES (@tenSach, @maLoaiSach, @tacGia, @soLuong, @giaBan);
END;
GO
/****** Object:  StoredProcedure [dbo].[proc_xoa_phieu_nhap]    Script Date: 11/2/2024 5:21:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[proc_xoa_phieu_nhap]
    @maPhieuNhap INT
AS
BEGIN
    DELETE FROM tbl_phieu_nhap 
    WHERE ma_phieu_nhap = @maPhieuNhap;
END
GO
/****** Object:  StoredProcedure [dbo].[proc_xoa_sach]    Script Date: 11/2/2024 5:21:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_xoa_sach]
    @maSach INT
AS
BEGIN
    DELETE FROM tbl_sach
    WHERE ma_sach = @maSach;
END;
GO
USE [master]
GO
ALTER DATABASE [db_quan_ly_ban_sach] SET  READ_WRITE 
GO
