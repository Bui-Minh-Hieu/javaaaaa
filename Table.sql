-- Create Database
CREATE DATABASE SICT_HAUI;
GO

USE SICT_HAUI;
GO

-- Table 0: Admin
CREATE TABLE [Admin] (
    AdminID INT IDENTITY(1,1) PRIMARY KEY,
    Username NVARCHAR(50) NOT NULL UNIQUE,
    PasswordHash NVARCHAR(255) NOT NULL,
    FullName NVARCHAR(100) NOT NULL,
    NgayDangKy DATETIME
);
GO

-- Table 1: Users (Readers)
CREATE TABLE Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    Username NVARCHAR(50) NOT NULL UNIQUE,
    PasswordHash NVARCHAR(255) NOT NULL,
    FullName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    NgayDangKy DATETIME
);
GO

-- Table 2: TheLoai (Main categories)
CREATE TABLE TheLoai (
    MaTheLoai INT PRIMARY KEY,
    TenTheLoai NVARCHAR(50) NOT NULL,
    VisibleTheLoai BIT DEFAULT 0,
    VisibleTheLoai1 BIT DEFAULT 0,
    SapXep INT,
    Url NVARCHAR(255),
    Target NVARCHAR(15),
    LinkNgoai BIT DEFAULT 0
);
GO

-- Table 3: TheLoaiTin (Subcategories)
CREATE TABLE TheLoaiTin (
    MaTheLoaiTin INT PRIMARY KEY,
    TenTheLoaiTin NVARCHAR(50) NOT NULL,
    VisibleTheLoaiTin BIT DEFAULT 0,
    VisibleTheLoaiTin1 BIT DEFAULT 0,
    SapXep INT,
    Url NVARCHAR(255),
    Target NVARCHAR(15),
    LinkNgoai BIT DEFAULT 0,
    MaTheLoai INT,
    CONSTRAINT FK_TheLoaiTin_TheLoai FOREIGN KEY (MaTheLoai) REFERENCES TheLoai(MaTheLoai)
);
GO

-- Table 4: PhanLoaiTin
CREATE TABLE PhanLoaiTin (
    MaPhanLoaiTin INT PRIMARY KEY,
    TenPhanLoaiTin NVARCHAR(50) NOT NULL,
    SapXep INT,
    NgayCapNhat DATETIME
);
GO

-- Table 5: TinTuc
CREATE TABLE TinTuc (
    MaTinTuc INT PRIMARY KEY,
    TieuDeTinTuc NVARCHAR(255) NOT NULL,
    UrlAnh NVARCHAR(100),
    TrichDanTin NVARCHAR(MAX),
    NoiDungTin NVARCHAR(MAX),
    NgayCapNhat DATETIME DEFAULT GETDATE(),
    SoLanDoc INT,
    Tag NVARCHAR(255),
    MaTheLoai INT,
    MaTheLoaiTin INT,
    MaPhanLoaiTin INT,
    MaThanhVien INT,
    CONSTRAINT FK_TinTuc_TheLoai FOREIGN KEY (MaTheLoai) REFERENCES TheLoai(MaTheLoai),
    CONSTRAINT FK_TinTuc_TheLoaiTin FOREIGN KEY (MaTheLoaiTin) REFERENCES TheLoaiTin(MaTheLoaiTin),
    CONSTRAINT FK_TinTuc_PhanLoaiTin FOREIGN KEY (MaPhanLoaiTin) REFERENCES PhanLoaiTin(MaPhanLoaiTin),
    CONSTRAINT FK_TinTuc_Admin FOREIGN KEY (MaThanhVien) REFERENCES Admin(AdminID)
);
GO

-- Table 6: Comments
CREATE TABLE Comments (
    MaBinhLuan INT IDENTITY(1,1) PRIMARY KEY,
    MaTinTuc INT NOT NULL,
    UserID INT NOT NULL,
    NoiDung NVARCHAR(MAX) NOT NULL,
    NgayBinhLuan DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_Comments_TinTuc FOREIGN KEY (MaTinTuc) REFERENCES TinTuc(MaTinTuc),
    CONSTRAINT FK_Comments_Users FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
GO

-- Table 7: VideoClip
CREATE TABLE VideoClip (
    MaVideo INT PRIMARY KEY,
    TenVideo NVARCHAR(255) NOT NULL,
    Url NVARCHAR(255),
    NgayCapNhat DATETIME
);
GO