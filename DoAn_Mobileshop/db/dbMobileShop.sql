use master
go
if DB_ID('MobileShop') is not null
	drop database MobileShop
go
create database MobileShop 
go
use MobileShop
go

-- Table ChiTietDonDatHang
--

CREATE TABLE ChiTietDonDatHang (
  MaChiTietDDH varchar(10) NOT NULL,
  MaDonDatHang varchar(10) NOT NULL,
  MaSanPham int NOT NULL,
  GiaBan int DEFAULT NULL,
  SoLuong int DEFAULT NULL,
  constraint pk_ChiTietDonHang primary key (MaChiTietDDH)
) 

--
-- Nhap lieu ChiTietDonHang
--

INSERT INTO ChiTietDonDatHang (MaChiTietDDH , MaDonDatHang, MaSanPham, GiaBan, SoLuong) VALUES
('1001170030', '100117003', 10, 10990000, 1),
('10100001', '100001', 1, 27990000, 1),
('10100002', '100002', 4, 22290000, 1),
('10100003', '100003', 9, 12490000, 1),
('10100004', '100004', 10, 10990000, 1),
('1101170010', '110117001', 22, 9990000, 1),
('1101170020', '110117002', 8, 15990000, 1);

-- --------------------------------------------------------

--
-- Table DonDatHang
--

CREATE TABLE DonDatHang (
  MaDonDatHang varchar(10) NOT NULL,
  NgayLap datetime DEFAULT NULL,
  TongThanhTien int DEFAULT NULL,
  MaTaiKhoan int NOT NULL,
  MaTinhTrang int NOT NULL,
  constraint pk_DonDatHang primary key (MaDonDatHang)
) 

--
-- Nhap lieu DonDatHang
--

INSERT INTO DonDatHang (MaDonDatHang, NgayLap, TongThanhTien, MaTaiKhoan, MaTinhTrang) VALUES
('100001', '2016-12-20 00:00:00', 27990000, 1, 2),
('100002', '2016-12-20 00:00:00', 22290000, 1, 3),
('100003', '2016-12-29 00:00:00', 12490000, 3, 3),
('100004', '2016-12-26 00:00:00', 10990000, 4, 2),
('100117003', '2017-01-10 23:38:04', 10990000, 1, 3),
('110117001', '2017-01-11 20:38:28', 18980000, 4, 2),
('110117002', '2017-01-11 22:29:05', 25980000, 2, 2);

-- --------------------------------------------------------

--
-- Table LoaiSanPham
--

CREATE TABLE LoaiSanPham (
  MaLoaiSanPham int NOT NULL,
  TenLoaiSanPham varchar(50) DEFAULT NULL,
  BiXoa tinyint DEFAULT '0',
  constraint pk_LoaiSanPham primary key (MaLoaiSanPham)
) 

--
-- Nhap lieu LoaiSanPham
--

INSERT INTO LoaiSanPham (MaLoaiSanPham, TenLoaiSanPham, BiXoa) VALUES
(1, 'SamSung', 0),
(2, 'iphone',  0),
(3, 'OPPO',    0),
(4, 'SONY',    0),
(5, 'HUAWEI',  0),
(6, 'ASUS',    0),
(7, 'NOKIA',   0);

-- --------------------------------------------------------
--
-- Table TaiKhoan
--

CREATE TABLE TaiKhoan (
  MaTaiKhoan int NOT NULL,
  TenTaiKhoan varchar(50)  DEFAULT NULL,
  MatKhau varchar(50)  DEFAULT NULL,
  TenHienThi varchar(100)  DEFAULT NULL,
  NgaySinh date DEFAULT NULL,
  BiXoa tinyint DEFAULT '0',
  MaLoaiTaiKhoan int NOT NULL,
  NoiSong varchar(100) DEFAULT NULL,
  constraint pk_TaiKhoan primary key (MaTaiKhoan)
) 

--
-- Nhap lieu TaiKhoan
--

INSERT INTO TaiKhoan (MaTaiKhoan, TenTaiKhoan, MatKhau, TenHienThi, NgaySinh, BiXoa, MaLoaiTaiKhoan, NoiSong) VALUES
(1, 'trctoan', 'e10adc3949ba59abbe56e057f20f883e', 'Trần Công Toản', '1996-09-15', 0, 1, 'Hồ Chí Minh'),
(2, 'admin', '0192023a7bbd73250516f069df18b500', 'Lý Nam Du', '1994-05-23', 0, 2, 'Hồ Chí Minh'),
(3, 'ChiuLee', 'f7d8160ec84ec37fb6a72768d9ae7866', 'Lê Văn Chiu', '1994-05-10', 0, 1, 'Hà Nội'),
(4, 'HaChi', '77d7c854015841b3892b803252426fd7', 'Chi Hà Thị Mỹ', '1996-03-14', 0, 1, 'Đà Nẵng'),
(5, 'dungthuy', 'e5484520b896b2f8749d489e72ede084', 'Hoàng Thùy Dung', '1998-05-01', 0, 1, 'Hà Nội');

-- --------------------------------------------------------
--
-- Table LoaiTaiKhoan
--

CREATE TABLE LoaiTaiKhoan (
  MaLoaiTaiKhoan int NOT NULL,
  LoaiTaiKhoan varchar(50) DEFAULT NULL,
  constraint pk_LoaiTaiKhoan primary key (LoaiTaiKhoan)
) 

--
-- Nhap lieu LoaiTaiKhoan
--

INSERT INTO LoaiTaiKhoan (MaLoaiTaiKhoan, LoaiTaiKhoan) VALUES
(2, 'admin'),
(1, 'user');

-- --------------------------------------------------------

--
-- Table NhaSanXuat
--

CREATE TABLE NhaSanXuat (
  MaNhaSanXuat int NOT NULL,
  TenNhaSanXuat varchar(50) DEFAULT NULL,
  BiXoa tinyint DEFAULT '0',
  constraint pk_NhaSanXuat primary key (MaNhaSanXuat)
) 

--
-- Nhap lieu NhaSanXuat
--

INSERT INTO NhaSanXuat (MaNhaSanXuat, TenNhaSanXuat, BiXoa) VALUES
(1, 'SAMSUNG', 0),
(2, 'APPLE', 0),
(3, 'OPPO', 0),
(4, 'SONY', 0),
(5, 'HUAWEI', 0),
(6, 'NOKIA', 0),
(7, 'ASUS', 0);

-- --------------------------------------------------------

--
-- Table SanPham
--

CREATE TABLE SanPham (
  MaSanPham int NOT NULL,
  TenSanPham varchar(50) DEFAULT NULL,
  MoTa text,
  XuatXu varchar(50) DEFAULT NULL,
  MaNhaSanXuat int NOT NULL,
  GiaBan int DEFAULT NULL,
  NgayNhap datetime DEFAULT NULL,
  SoLuongBan int DEFAULT NULL,
  SoLuongTon int DEFAULT NULL,
  MaLoaiSanPham int NOT NULL,
  SoLuongXem int DEFAULT NULL,
  HinhAnh varchar(100) DEFAULT NULL,
  BiXoa tinyint DEFAULT '0',
  constraint pk_SanPham primary key (MaSanPham)
)

--
-- Nhap lieu SanPham
--

INSERT INTO SanPham (MaSanPham, TenSanPham, MoTa, XuatXu, MaNhaSanXuat, GiaBan, NgayNhap, SoLuongBan, SoLuongTon, MaLoaiSanPham, SoLuongXem, HinhAnh, BiXoa) VALUES
(1, 'iPhone 7 Plus 256GB', 'Màn hình: 5.5", Retina HD\r\nHĐH: iOS 10\r\nCPU: Apple A10 Fusion 4 nhân\r\nRAM: 3GB, ROM: 256GB\r\nCamera: 2x12 MP, Selfie: 7 MP\r\nPIN: 2900 mAh, SIM: 1SIM', 'Made in china', 2, 27990000, '2016-12-08 00:00:00', 10, 25, 2, 33, 'iphone_7_plus_256.jpg', 0),
(3, 'iPhone 7 128GB', 'Màn hình: 4.7", Retina HD\r\nHĐH: iOS 10\r\nCPU: Apple A10 Fusion 4 nhân\r\nRAM: 2GB, ROM: 128GB\r\nCamera: 12 MP, Selfie: 7 MP\r\nPIN: 1960 mAh, SIM: 1SIM', 'Made in China', 2, 21690000, '2016-12-13 00:00:00', 7, 15, 2, 33, 'iphone_7_plus_128.jpg', 0),
(4, 'iPhone 7 Plus 64GB', 'Màn hình: 5.6", Retina HD\r\nHĐH: iOS 10\r\nCPU: Apple A10 Fusion 4 nhân\r\nRAM: 3GB, ROM: 32GB\r\nCamera: 2x12 MP, Selfie: 7 MP\r\nPIN: 2900 mAh, SIM: 1SIM', 'Made in China', 2, 23290000, '2016-12-12 00:00:00', 4, 13, 2, 30, 'iphone_7_plus_32.jpg\r\n', 0),
(7, 'iPhone SE 64GB', 'Màn hình: 4", Retina HD\r\nHĐH: iOS 9\r\nCPU: Apple A9 2 nhân \r\nRAM: 2GB, ROM: 64GB\r\nCamera: 12 MP, Selfie: 1.2 MP\r\nPIN: 1642 mAh, SIM: 1 SIM', 'Made in China', 2, 11990000, '2016-12-27 00:00:00', 3, 8, 2, 34, 'iphone_se_64.jpg', 0),
(8, 'SamSung Galaxy S7 Edge', 'Màn hình: 5.5", Quad HD\r\nHĐH: Android 6.0 (Marshmallow)\r\nCPU: Exynos 8890 8 nhân\r\nRAM: 4 GB, ROM: 32 GB\r\nCamera: 12 MP, Selfie: 5 MP\r\nPIN: 3600 mAh, SIM: 2 SIM', 'Made in VietNam', 1, 15990000, '2016-12-29 00:00:00', 5, 15, 1, 68, 'samsung_galaxy_s7_edge.jpg', 0),
(9, 'SamSung Galaxy Note 5', 'Màn hình: 5.7", Quad HD\r\nHĐH: Android 6.0 (Marshmallow)\r\nCPU: Exynos 7420 8 nhân\r\nRAM: 4 GB, ROM: 32 GB\r\nCamera: 16 MP, Selfie: 5 MP\r\nPIN: 3000 mAh, SIM: 1 SIM', 'Made in Vietnam', 1, 12490000, '2016-12-12 00:00:00', 7, 19, 1, 42, 'samsung_galaxy_note_5.jpg', 0),
(10, 'Samsung Galaxy A9 Pro', 'Màn hình: 6", Full HD\r\nHĐH: Android 6.0 (Marshmallow)\r\nCPU:Snapdragon 652 8 nhân\r\nRAM: 4 GB, ROM: 32 GB\r\nCamera: 16 MP, Selfie: 8 MP\r\nPIN: 5000 mAh, SIM: 2 SIM', 'Made in Vietnam', 1, 10990000, '2016-12-27 00:00:00', 7, 15, 1, 41, 'samsung_galaxy_a9_pro.jpg', 0),
(11, 'Samsung Galaxy J7 Prime', 'Màn hình: 5.5", Full HD\r\nHĐH: Android 6.0 (Marshmallow)\r\nCPU: Exynos 7420 8 nhân\r\nRAM: 3 GB, ROM: 32 GB\r\nCamera: 13 MP, Selfie: 8 MP\r\nPIN: 3300 mAh, SIM: 1 SIM', 'Made in Vietnam', 1, 62900000, '2016-12-18 00:00:00', 3, 9, 1, 25, 'samsung_galaxy_j7_prime.jpg', 0),
(12, 'Samsung Galaxy A3 2016', 'Màn hình: 4.7", Full HD\r\nHĐH: Android 5.1 (Lollipop)\r\nCPU: Exynos 7578 4 nhân\r\nRAM: 1.5 GB, ROM: 16 GB\r\nCamera: 13 MP, Selfie: 5 MP\r\nPIN: 2300 mAh, SIM: 2 SIM', 'Made in Vietnam', 1, 5390000, '2016-12-26 00:00:00', 2, 11, 1, 33, 'samsung_galaxy_a3_2016.jpg', 0),
(13, 'Samsung Galaxy J7', 'Màn hình: 5.5", HD\r\nHĐH: Android 5.1 (Lollipop)\r\nCPU: Exynos 7580 8 nhân\r\nRAM: 1.5 GB, ROM: 16 GB\r\nCamera: 13 MP, Selfie: 5 MP\r\nPIN: 3000 mAh, SIM: 2 SIM', 'Made in Vietnam', 1, 4068000, '2016-12-24 00:00:00', 3, 12, 1, 23, 'samsung_galaxy_j7.jpg', 0),
(14, 'OPPO F1 Plus', 'Màn hình: 5.5", Full HD\r\nHĐH: Android 5.1 (Lollipop)\r\nCPU: Helio P10 8 nhân\r\nRAM: 4 GB, ROM: 64 GB\r\nCamera: 13 MP, Selfie: 16 MP\r\nPIN: 2850 mAh, SIM: 2 SIM', 'Made in China ', 3, 9990000, '2016-12-26 00:00:00', 8, 16, 3, 45, 'oppo_f1_plus.jpg', 0),
(15, 'OPPO F1s', 'Màn hình: 5.5", HD\r\nHĐH: Android 5.1 (Lollipop)\r\nCPU: Mediatek MT6750 8 nhân \r\nRAM: 3 GB, ROM: 32 GB\r\nCamera: 13 MP, Selfie: 16 MP\r\nPIN: 3075 mAh, SIM: 2 SIM', 'Made in China', 3, 5990000, '2016-12-25 00:00:00', 4, 19, 3, 40, 'oppo_f1s.jpg', 0),
(16, 'OPPO A39 (Neo 9s)', 'Màn hình: 5.2", HD\r\nHĐH: Android 5.1 (Lollipop)\r\nCPU: MT6750, 8 nhân \r\nRAM: 3 GB, ROM: 32 GB\r\nCamera: 13 MP, Selfie: 5 MP\r\nPIN: 2900 mAh, SIM: 2 SIM', 'Made in China', 3, 4690000, '2016-12-14 00:00:00', 3, 9, 3, 26, 'oppo_a39_neo_9.jpg', 0),
(17, 'OPPO A37 (Neo 9)', 'Màn hình: 5", HD\r\nHĐH: Android 5.1 (Lollipop)\r\nCPU: Snapdragon 410 4 nhân \r\nRAM: 2 GB, ROM: 16 GB\r\nCamera: 8 MP, Selfie: 5 MP\r\nPIN: 2630 mAh, SIM: 2 SIM', 'Made in China', 3, 3690000, '2016-12-19 00:00:00', 2, 9, 3, 25, 'oppo_a37_neo_9.jpg', 0),
(18, 'OPPO Neo 7', 'Màn hình: 5", qHD\r\nHĐH: Android 5.1 (Lollipop)\r\nCPU: MTK 6582 4 nhân \r\nRAM: 1 GB, ROM: 16 GB\r\nCamera: 8 MP, Selfie: 5 MP\r\nPIN: 2420 mAh, SIM: 2 SIM', 'Made in China', 3, 3290000, '2016-12-19 00:00:00', 2, 8, 3, 18, 'oppo_neo_7.jpg', 0),
(19, 'OPPO Neo 7s', 'Màn hình: 5", qHD\r\nHĐH: Android 5.1 (Lollipop)\r\nCPU: Snapdragon 410 4 nhân \r\nRAM: 1 GB, ROM: 16 GB\r\nCamera: 8 MP, Selfie: 5 MP\r\nPIN: 2420 mAh, SIM: 2 SIM', 'Made in China', 3, 3290000, '2016-12-22 00:00:00', 2, 10, 3, 18, 'oppo_neo_7s.jpg', 0),
(20, 'Sony Xperia XZ', 'Màn hình: 5.2", Full HD\r\nHĐH: Android 6.0 (Marshmallow)\r\nCPU: MTK 6582 4 nhân \r\nRAM: 3 GB, ROM: 64 GB\r\nCamera: 23 MP, Selfie: 13 MP\r\nPIN: 2900 mAh, SIM: 2 SIM', 'Made in Vietnam', 4, 14990000, '2016-12-22 00:00:00', 8, 20, 4, 28, 'sony_xperia_xz.jpg', 0),
(21, 'Sony Xperia Z5 Dual', 'Màn hình: 5.2", Full HD\r\nHĐH: Android 6.0 (Marshmallow)\r\nCPU: Snapdragon 810 4 nhân \r\nRAM: 3 GB, ROM: 32 GB\r\nCamera: 23 MP, Selfie: 5 MP\r\nPIN: 2900 mAh, SIM: 2 SIM', 'Made in Vietnam', 4, 10990000, '2016-12-11 00:00:00', 3, 24, 4, 32, 'sony_xperia_z5.jpg', 0),
(22, 'Sony Xperia X', 'Màn hình: 5.2", Full HD\r\nHĐH: Android 6.0 (Marshmallow)\r\nCPU: Snapdragon 650 6 nhân \r\nRAM: 3 GB, ROM: 64 GB\r\nCamera: 23 MP, Selfie: 13 MP\r\nPIN: 2620 mAh, SIM: 2 SIM', 'Made in Vietnam', 4, 9990000, '2016-12-28 00:00:00', 4, 12, 4, 21, 'sony_xperia_x.jpg', 0),
(23, 'Sony Xperia XA Ultra', 'Màn hình: 6", Full HD\r\nHĐH: Android 6.0 (Marshmallow)\r\nCPU: Helio P10 8 nhân \r\nRAM: 3 GB, ROM: 16 GB\r\nCamera: 21.5 MP, Selfie: 16 MP\r\nPIN: 2700 mAh, SIM: 2 SIM', 'Made in Vietnam', 4, 7490000, '2016-12-27 00:00:00', 2, 10, 4, 30, 'sony_xperia_xa_ultra.jpg', 0),
(24, 'Sony Xperia M5(Single SIM)', 'Màn hình: 5", Full HD\r\nHĐH: Android 5.0 (Lollipop)\r\nCPU: Helio x10 8 nhân \r\nRAM: 3 GB, ROM: 16 GB\r\nCamera: 21.5 MP, Selfie: 13 MP\r\nPIN: 2600 mAh, SIM: 1 SIM', 'Made in Vietnam', 4, 6990000, '2016-12-26 00:00:00', 2, 10, 4, 15, 'sony_xperia_m5_single.jpg', 0),
(25, 'Sony Xperia XA', 'Màn hình: 5", HD\r\nHĐH: Android 6.0 (Marshmallow)\r\nCPU: Helio P10 8 nhân \r\nRAM: 2 GB, ROM: 16 GB\r\nCamera: 13 MP, Selfie: 8 MP\r\nPIN: 2300 mAh, SIM: 2 SIM', 'Made in Vietnam', 4, 6990000, '2016-12-29 00:00:00', 3, 14, 4, 56, 'sony_xperia_xa.jpg', 0),
(28, 'ASUS Zenfone 3 ZE552KL', 'Màn hình: 5.5",Full HD\r\nHĐH: Android 6.0 (Marshmallow)\r\nCPU: Snapdragon 625 8 nhân \r\nRAM: 4 GB, ROM: 64 GB\r\nCamera: 16 MP, Selfie: 8 MP\r\nPIN: 3000 mAh, SIM: 2 SIM', 'Made in USA', 7, 8990000, '2016-12-27 00:00:00', 6, 16, 6, 45, 'asus_zenfone_3_ze552kl.jpg', 0),
(29, 'ASUS Zenfone 3 MAX 5.5" ZC553KL', 'Màn hình: 5.5",Full HD\r\nHĐH: Android 6.0 (Marshmallow)\r\nCPU: Qualcomm Snapdragon 430 8 nhân \r\nRAM: 3 GB, ROM: 32 GB\r\nCamera: 16 MP, Selfie: 8 MP\r\nPIN: 4100 mAh, SIM: 2 SIM', 'Made in USA', 7, 5490000, '2016-12-18 00:00:00', 5, 13, 6, 16, 'asus_zenfone_3_max_zc553kl.jpg', 0),
(30, 'ASUS Zenfone 3 MAX', 'Màn hình: 5.2",HD\r\nHĐH: Android 6.0 (Marshmallow)\r\nCPU: 4 nhân \r\nRAM: 3 GB, ROM: 32 GB\r\nCamera: 13 MP, Selfie: 5 MP\r\nPIN: 4100 mAh, SIM: 2 SIM', 'Made in USA', 7, 4490000, '2016-12-15 00:00:00', 4, 18, 6, 25, 'asus_zenfone_3_max.jpg', 0),
(31, 'ASUS Zenfone Selfie', 'Màn hình: 5.5",Full HD\r\nHĐH: Android 5\r\nCPU: 8 nhân \r\nRAM: 3 GB\r\nCamera: 13.0 MP\r\nPIN: 3000 mAh, SIM: 2 SIM', 'Made in USA', 7, 3490000, '2016-12-13 00:00:00', 3, 12, 6, 15, 'asus_zenfone_selfie.jpg', 0),
(32, 'HUAWEI GR5 MINI', 'Màn hình: 5.2", Full HD\r\nHĐH: Android 6.0\r\nCPU: HiSilicon Kirin 655 8 nhân \r\nRAM: 2GB, ROM: 16GB\r\nCamera: 13 MP, Selfie: 8 MP\r\nPIN: 3000 mAh, SIM: 2 SIM', 'Made in China', 5, 3990000, '2016-12-14 00:00:00', 5, 14, 5, 32, 'huawei_gr5_mini.jpg', 0),
(33, 'HUAWEI Y6 II', 'Màn hình: 5.2", Full HD\r\nHĐH: Android 6.0\r\nCPU: HiSilicon Kirin 655 8 nhân \r\nRAM: 2GB, ROM: 16GB\r\nCamera: 13 MP, Selfie: 8 MP\r\nPIN: 3000 mAh, SIM: 2 SIM', 'Made in China', 5, 2990000, '2016-12-01 00:00:00', 4, 23, 5, 12, 'huawei_y6_ii.jpg', 0),
(34, 'HUAWEI Y5 II', 'Màn hình: 5", Full HD\r\nHĐH: Android 5.1 (Lollipop)\r\nCPU: MTK 6582 8 nhân \r\nRAM: 1GB, ROM: 8GB\r\nCamera: 8 MP, Selfie: 2 MP\r\nPIN: 2200 mAh, SIM: 2 SIM', 'Made in China', 5, 2190000, '2016-12-11 00:00:00', 2, 12, 5, 25, 'huawei_y5_ii.jpg', 0),
(35, 'HUAWEI Y541', 'Màn hình: 5", Full HD\r\nHĐH: Android 4.4(Kitkat)\r\nCPU: MTK 6582 8 nhân \r\nRAM: 1GB, ROM: 8GB\r\nCamera: 8 MP, Selfie: 2 MP\r\nPIN: 1700 mAh, SIM: 2 SIM', 'Made in China', 5, 1272000, '2016-12-08 00:00:00', 5, 14, 5, 14, 'huawei_y541_10.jpg', 0),
(36, 'NOKIA LUMIA 730', 'Màn hình: 5.2", Full HD\r\nHĐH: Windows Phone 8.1\r\nCPU: MTK 6582 8 nhân \r\nRAM: 1GB, ROM: 8GB\r\nCamera: 8 MP, Selfie: 2 MP\r\nPIN: 1700 mAh, SIM: 2 SIM', 'Made in Vietnam', 6, 2290000, '2016-12-12 00:00:00', 4, 21, 7, 23, 'nokia_lumia_730_dual.jpg', 0),
(37, 'NOKIA LUMIA 640', 'Màn hình: 5", Full HD\r\nHĐH: Windows Phone 8.1\r\nCPU: MTK 6582 8 nhân \r\nRAM: 1GB, ROM: 8GB\r\nCamera: 8 MP, Selfie: 2 MP\r\nPIN: 1700 mAh, SIM: 2 SIM', 'Made in Vietnam', 6, 1890000, '2016-12-08 00:00:00', 3, 21, 7, 25, 'microsoft_lumia_640.jpg', 0);

-- --------------------------------------------------------



--
-- Table TinhTrang
--

CREATE TABLE TinhTrang (
  MaTinhTrang int NOT NULL,
  TenTinhTrang varchar(50) DEFAULT NULL,
  constraint pk_TinhTrang primary key (MaTinhTrang)
) 

--
-- Nhap lieu TinhTrang
--

INSERT INTO TinhTrang (MaTinhTrang, TenTinhTrang) VALUES
(1, 'Đặt hàng'),
(2, 'Đang giao hàng'),
(3, 'Thanh toán'),
(4, 'Hủy');




