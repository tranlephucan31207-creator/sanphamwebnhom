-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 27, 2026 lúc 10:29 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `coffe`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chi_tiet_don_hang`
--

CREATE TABLE `chi_tiet_don_hang` (
  `id_ctdh` int(11) NOT NULL,
  `id_don_hang` int(11) NOT NULL,
  `id_san_pham` int(11) DEFAULT NULL,
  `ten_san_pham` varchar(150) NOT NULL,
  `so_luong` int(11) NOT NULL DEFAULT 1,
  `don_gia` decimal(12,0) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chi_tiet_don_hang`
--

INSERT INTO `chi_tiet_don_hang` (`id_ctdh`, `id_don_hang`, `id_san_pham`, `ten_san_pham`, `so_luong`, `don_gia`) VALUES
(11, 9, 6, 'Trà sen', 1, 30000),
(12, 9, 2, 'Bạc xỉu', 2, 27000),
(13, 10, 9, 'Nước ép cam', 1, 28000),
(14, 10, 2, 'Bạc xỉu', 1, 27000),
(15, 11, 2, 'Bạc xỉu', 1, 27000),
(16, 12, 2, 'Bạc xỉu', 1, 27000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danh_muc`
--

CREATE TABLE `danh_muc` (
  `id_danh_muc` int(11) NOT NULL,
  `ten_danh_muc` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `danh_muc`
--

INSERT INTO `danh_muc` (`id_danh_muc`, `ten_danh_muc`) VALUES
(1, 'Cà phê'),
(2, 'Trà'),
(3, 'Bánh'),
(4, 'Nước ép'),
(5, 'Sinh tố');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `don_hang`
--

CREATE TABLE `don_hang` (
  `id_don_hang` int(11) NOT NULL,
  `id_nguoi_dung` int(11) DEFAULT NULL,
  `ten_khach_hang` varchar(100) NOT NULL,
  `so_dien_thoai` varchar(20) NOT NULL,
  `dia_chi` varchar(255) NOT NULL,
  `ghi_chu` text DEFAULT NULL,
  `tong_tien` decimal(12,0) NOT NULL DEFAULT 0,
  `trang_thai` varchar(30) NOT NULL DEFAULT 'cho_xac_nhan',
  `ngay_dat` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `don_hang`
--

INSERT INTO `don_hang` (`id_don_hang`, `id_nguoi_dung`, `ten_khach_hang`, `so_dien_thoai`, `dia_chi`, `ghi_chu`, `tong_tien`, `trang_thai`, `ngay_dat`) VALUES
(9, 1, 'thanhtu', '0122222', 'đà nẵng', 'ít đá', 84000, 'hoan_thanh', '2026-11-26 16:18:32'),
(10, 1, 'Thanh Tú', '0122222', 'Dùng tại quán', 'ko', 55000, 'hoan_thanh', '2026-11-26 16:48:04'),
(11, 1, 'Thanh Tú', '0122222', 'Dùng tại quán', 'ít đá', 27000, 'da_huy', '2026-11-26 16:49:16'),
(12, 1, 'Thanh Tú', '0122222', 'hòa đồng', 'ít đá', 27000, 'hoan_thanh', '2026-11-26 16:55:54');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `gio_hang`
--

CREATE TABLE `gio_hang` (
  `id_gio_hang` int(11) NOT NULL,
  `id_nguoi_dung` int(11) NOT NULL,
  `id_san_pham` int(11) NOT NULL,
  `so_luong` int(11) NOT NULL DEFAULT 1,
  `ngay_cap_nhat` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `gio_hang`
--

INSERT INTO `gio_hang` (`id_gio_hang`, `id_nguoi_dung`, `id_san_pham`, `so_luong`, `ngay_cap_nhat`) VALUES
(54, 1, 3, 1, '2026-11-27 03:02:29'),
(55, 1, 5, 1, '2026-11-27 03:02:29'),
(56, 1, 8, 1, '2026-11-27 03:02:29'),
(57, 1, 4, 1, '2026-11-27 03:02:29'),
(58, 1, 10, 1, '2026-11-27 03:02:29'),
(59, 1, 11, 1, '2026-11-27 03:02:29');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nguoi_dung`
--

CREATE TABLE `nguoi_dung` (
  `id_nguoi_dung` int(11) NOT NULL,
  `ho_ten` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `dien_thoai` varchar(20) DEFAULT NULL,
  `mat_khau` varchar(255) NOT NULL,
  `vai_tro` varchar(20) NOT NULL DEFAULT 'khach_hang',
  `trang_thai` tinyint(1) NOT NULL DEFAULT 1,
  `ngay_tao` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nguoi_dung`
--

INSERT INTO `nguoi_dung` (`id_nguoi_dung`, `ho_ten`, `email`, `dien_thoai`, `mat_khau`, `vai_tro`, `trang_thai`, `ngay_tao`) VALUES
(1, 'Thanh Tú', 'abcd@gmail.com', '0122222', '$2y$10$iRzTkGlQmzlZUIchB51pY.3dfmlVCnaDv4p9dJpwLWh/hOXJnJXP.', 'khach_hang', 1, '2026-11-13 06:21:30'),
(3, 'Quản trị viên Hệ thống', 'admin@coffeehouse.vn', '0909000111', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', 1, '2026-11-17 06:12:20'),
(4, 'Thu ngân Ca Sáng', 'thungan@coffeehouse.vn', '0909000222', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'thu_ngan', 1, '2026-11-17 06:12:20'),
(5, 'Trần Minh Thu Ngân', 'thungan1@coffeehouse.vn', '0901234567', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'thu_ngan', 1, '2026-11-17 06:14:05'),
(6, 'Lê Hoàng Quản Lý', 'quanly2@coffeehouse.vn', '0907654321', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', 1, '2026-11-17 06:14:05'),
(7, 'Phương Bảo', 'baotran123@gmail.com', '01234567', '$2y$10$vUBnPRtCU8nGzfZeylrXeOnpgo9v6N3MV95o6dwDKXGhk08STcdxe', 'khach_hang', 1, '2026-11-26 10:09:39');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `san_pham`
--

CREATE TABLE `san_pham` (
  `id_san_pham` int(11) NOT NULL,
  `ten_san_pham` varchar(100) NOT NULL,
  `hinh_anh` varchar(255) DEFAULT NULL,
  `gia` decimal(10,2) NOT NULL,
  `id_danh_muc` int(11) DEFAULT NULL,
  `noi_bat` tinyint(1) DEFAULT 0,
  `mo_ta` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `san_pham`
--

INSERT INTO `san_pham` (`id_san_pham`, `ten_san_pham`, `hinh_anh`, `gia`, `id_danh_muc`, `noi_bat`, `mo_ta`) VALUES
(1, 'Cà phê sữa', 'img/caphesua.jpg', 25000.00, 1, 1, 'Cà phê phin truyền thống pha cùng sữa đặc'),
(2, 'Bạc xỉu', 'img/bacxiu.jpg', 27000.00, 1, 1, 'Cà phê sữa nhiều sữa, vị nhẹ dịu'),
(3, 'Cappuccino', 'img/capuchiano.jpg', 35000.00, 1, 1, 'Cà phê Ý với lớp bọt sữa dày'),
(4, 'Latte', 'img/late.jpg', 35000.00, 1, 1, 'Cà phê Ý vị béo, nhiều sữa tươi'),
(5, 'Trà đào', 'img/tradao.jpg', 30000.00, 2, 0, 'Trà trái cây vị đào thanh mát'),
(6, 'Trà sen', 'img/trasen.jpg', 30000.00, 2, 0, 'Trà ướp hương sen tự nhiên'),
(7, 'Bánh Tiramisu', 'img/tiramisu.jpg', 32000.00, 3, 0, 'Bánh kem vị cà phê kiểu Ý'),
(8, 'Bánh Croissant', 'img/cosant.jpg', 20000.00, 3, 0, 'Bánh sừng bò bơ Pháp'),
(9, 'Nước ép cam', 'img/epcam.jpg', 28000.00, 4, 0, 'Nước cam vắt nguyên chất'),
(10, 'Sinh tố bơ', 'img/sinhtobo.jpg', 35000.00, 5, 0, 'Sinh tố bơ sánh mịn'),
(11, 'Sinh tố xoài', 'img/sp_1795688361_117.jpg', 40000.00, 5, 0, 'Sinh tố xoài là thức uống giải khát được xay nhuyễn từ thịt xoài chín cùng sữa và đá bào, mang sắc vàng tươi rực rỡ, kết cấu sánh mịn cùng hương vị ngọt ngào, béo ngậy hòa quyện chút chua thanh tự nhiên.'),
(12, 'Cà phê muối', 'img/sp_1795713991_865.jpg', 20000.00, 1, 0, 'Cà phê muối là thức uống đặc sản có nguồn gốc từ Huế, kết hợp cà phê đậm vị, sữa và một lượng nhỏ muối để cân bằng vị đắng gắt và làm nổi bật vị ngọt béo');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chi_tiet_don_hang`
--
ALTER TABLE `chi_tiet_don_hang`
  ADD PRIMARY KEY (`id_ctdh`),
  ADD KEY `fk_ctdh_donhang` (`id_don_hang`),
  ADD KEY `fk_ctdh_sanpham` (`id_san_pham`);

--
-- Chỉ mục cho bảng `danh_muc`
--
ALTER TABLE `danh_muc`
  ADD PRIMARY KEY (`id_danh_muc`);

--
-- Chỉ mục cho bảng `don_hang`
--
ALTER TABLE `don_hang`
  ADD PRIMARY KEY (`id_don_hang`),
  ADD KEY `fk_donhang_nguoidung` (`id_nguoi_dung`);

--
-- Chỉ mục cho bảng `gio_hang`
--
ALTER TABLE `gio_hang`
  ADD PRIMARY KEY (`id_gio_hang`),
  ADD UNIQUE KEY `uniq_user_sp` (`id_nguoi_dung`,`id_san_pham`);

--
-- Chỉ mục cho bảng `nguoi_dung`
--
ALTER TABLE `nguoi_dung`
  ADD PRIMARY KEY (`id_nguoi_dung`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Chỉ mục cho bảng `san_pham`
--
ALTER TABLE `san_pham`
  ADD PRIMARY KEY (`id_san_pham`),
  ADD KEY `id_danh_muc` (`id_danh_muc`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `chi_tiet_don_hang`
--
ALTER TABLE `chi_tiet_don_hang`
  MODIFY `id_ctdh` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `danh_muc`
--
ALTER TABLE `danh_muc`
  MODIFY `id_danh_muc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `don_hang`
--
ALTER TABLE `don_hang`
  MODIFY `id_don_hang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `gio_hang`
--
ALTER TABLE `gio_hang`
  MODIFY `id_gio_hang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT cho bảng `nguoi_dung`
--
ALTER TABLE `nguoi_dung`
  MODIFY `id_nguoi_dung` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `san_pham`
--
ALTER TABLE `san_pham`
  MODIFY `id_san_pham` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chi_tiet_don_hang`
--
ALTER TABLE `chi_tiet_don_hang`
  ADD CONSTRAINT `fk_ctdh_donhang` FOREIGN KEY (`id_don_hang`) REFERENCES `don_hang` (`id_don_hang`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ctdh_sanpham` FOREIGN KEY (`id_san_pham`) REFERENCES `san_pham` (`id_san_pham`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `don_hang`
--
ALTER TABLE `don_hang`
  ADD CONSTRAINT `fk_donhang_nguoidung` FOREIGN KEY (`id_nguoi_dung`) REFERENCES `nguoi_dung` (`id_nguoi_dung`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `san_pham`
--
ALTER TABLE `san_pham`
  ADD CONSTRAINT `san_pham_ibfk_1` FOREIGN KEY (`id_danh_muc`) REFERENCES `danh_muc` (`id_danh_muc`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
