-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 01, 2024 lúc 11:45 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `petshop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitiet_donhang`
--

CREATE TABLE `chitiet_donhang` (
  `id_ctdonhang` int(11) NOT NULL,
  `tensp` varchar(100) NOT NULL,
  `soluong` tinyint(4) DEFAULT NULL,
  `giamgia` int(11) DEFAULT NULL,
  `giatien` int(11) DEFAULT NULL,
  `giakhuyenmai` int(11) DEFAULT NULL,
  `id_sanpham` int(11) NOT NULL,
  `id_dathang` int(10) UNSIGNED NOT NULL,
  `id_kh` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chitiet_donhang`
--

INSERT INTO `chitiet_donhang` (`id_ctdonhang`, `tensp`, `soluong`, `giamgia`, `giatien`, `giakhuyenmai`, `id_sanpham`, `id_dathang`, `id_kh`) VALUES
(1, 'Bánh Gặm Cho Mèo – Smoked Beefy Dental Bone -14g', 2, 0, 32000, 32000, 13, 4, 3),
(2, 'Áo cho bé nhỏ đáng yêu', 1, 0, 30000, 30000, 5, 5, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `sanpham_id` int(11) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `sanpham_id`, `content`, `created_at`, `updated_at`) VALUES
(1, NULL, 12, 'Sản phẩm cũng tốt', '2024-10-01 01:43:34', '2024-10-01 01:43:34'),
(2, 3, 13, 'Không ổn', '2024-10-01 01:44:07', '2024-10-01 01:44:07');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhmuc`
--

CREATE TABLE `danhmuc` (
  `id_danhmuc` int(11) NOT NULL,
  `ten_danhmuc` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `danhmuc`
--

INSERT INTO `danhmuc` (`id_danhmuc`, `ten_danhmuc`, `created_at`, `updated_at`) VALUES
(1, 'Sản phẩm cho chó', '2024-09-30 09:19:21', NULL),
(2, 'Sản phẩm cho mèo', '2024-09-30 09:19:21', NULL),
(3, 'tất cả sản phẩm', '2024-09-30 09:19:21', NULL),
(4, 'phụ kiện', '2024-09-30 09:19:21', NULL),
(5, 'nổi bật', '2024-09-30 09:19:21', NULL),
(6, 'dành cho chó', '2024-09-30 09:19:21', NULL),
(7, 'dành cho mèo', '2024-09-30 09:19:21', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dathang`
--

CREATE TABLE `dathang` (
  `id_dathang` int(10) UNSIGNED NOT NULL,
  `ngaydathang` datetime DEFAULT current_timestamp(),
  `ngaygiaohang` datetime DEFAULT current_timestamp(),
  `tongtien` int(11) NOT NULL,
  `phuongthucthanhtoan` varchar(10) NOT NULL,
  `diachigiaohang` varchar(100) DEFAULT NULL,
  `trangthai` varchar(100) DEFAULT NULL,
  `id_kh` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `dathang`
--

INSERT INTO `dathang` (`id_dathang`, `ngaydathang`, `ngaygiaohang`, `tongtien`, `phuongthucthanhtoan`, `diachigiaohang`, `trangthai`, `id_kh`) VALUES
(3, '2024-10-01 08:44:50', NULL, 64000, 'COD', NULL, 'đang xử lý', 3),
(4, '2024-10-01 08:45:26', NULL, 64000, 'COD', NULL, 'đang xử lý', 3),
(5, '2024-10-01 08:51:32', NULL, 30000, 'COD', 'Số 49 Ngõ 75 Phố Lụa', 'đang xử lý', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang`
--

CREATE TABLE `khachhang` (
  `id_kh` int(11) NOT NULL,
  `hoten` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `diachi` varchar(255) DEFAULT NULL,
  `sdt` int(11) DEFAULT NULL,
  `id_phanquyen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `khachhang`
--

INSERT INTO `khachhang` (`id_kh`, `hoten`, `email`, `password`, `diachi`, `sdt`, `id_phanquyen`) VALUES
(1, 'teo', 'teo@gmail.com', '$2y$12$o42vmZrn2TzpqtP0NJ/VyOd0qgv2coPm76eyZ/ZNwUgBHNUUW6H2y', '', 379487241, 2),
(2, 'admin', 'duchai2211@gmail.com', '$2y$12$JjPydOKxMwUUQWS2bG5ZJOTO7m0gwYnyF4umA4OMU.NtDzvBoMbim', '', 379487352, 1),
(3, 'Test', 'duchai0501@gmail.com', '$2y$12$CE/Rzwf9QldVVRjpFYXJ4u6ObRoudzEzBnkOQVN5PVwPDv3AzL6eK', 'Số 49 Ngõ 75 Phố Lụa', 987654321, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2024_04_21_090007_create_chitiet_donhang_table', 1),
(3, '2024_04_21_090007_create_danhmuc_table', 1),
(4, '2024_04_21_090007_create_dathang_table', 1),
(5, '2024_04_21_090007_create_phanquyen_table', 1),
(6, '2024_04_21_090007_create_sanpham_table', 1),
(7, '2024_04_21_090010_add_foreign_keys_to_sanpham_table', 1),
(8, '2024_04_21_092420_add_foreign_key_to_chitiet_donhang_table', 1),
(9, '2024_04_22_080854_create_khachhang_table', 1),
(10, '2024_04_22_080855_add_foreign_keys_to_khachhang_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phanquyen`
--

CREATE TABLE `phanquyen` (
  `id_phanquyen` int(11) NOT NULL,
  `tenquyen` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `phanquyen`
--

INSERT INTO `phanquyen` (`id_phanquyen`, `tenquyen`) VALUES
(1, 'admin'),
(2, 'user'),
(3, 'staff');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `id_sanpham` int(11) NOT NULL,
  `tensp` varchar(100) DEFAULT NULL,
  `anhsp` varchar(255) DEFAULT NULL,
  `giasp` int(11) DEFAULT NULL,
  `mota` text DEFAULT NULL,
  `giamgia` int(11) DEFAULT NULL,
  `giakhuyenmai` int(11) DEFAULT NULL,
  `soluong` int(11) DEFAULT NULL,
  `id_danhmuc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`id_sanpham`, `tensp`, `anhsp`, `giasp`, `mota`, `giamgia`, `giakhuyenmai`, `soluong`, `id_danhmuc`) VALUES
(1, 'Thức Ăn Cho Chó Trưởng Thành Giống Lớn – Eminent Adult Large Breed – 500g', 'frontend/upload/Eminent.jpg', 72000, 'abc', 0, 72000, 2, 1),
(2, 'Pate Cho Mèo – Pate Fit4 Cats -Cá Ngừ Và Thanh Cua 160g', 'frontend/upload/dohop.jpg', 20000, NULL, 0, 72000, 5, 2),
(3, 'Áo cho chó lớn', 'frontend/upload/6MHfrO1odWrP85Lyx1wJW4EnD7fb9qcz8q0ILBrX.jpg', 72000, 'Dành cho chó lớn từ 7kg', 0, 72000, 5, 6),
(4, 'Áo cho chó bé nhỏ đáng yêu', 'frontend/upload/Aey1INsjVPBTihNAj8uJQUZG4lMcgTBm68hh1xNe.jpg', 30000, 'Áo cho chó bé nhỏ đáng yêu', 10, 27000, 5, 6),
(5, 'Áo cho bé nhỏ đáng yêu', 'frontend/upload/K3ara9nZJFOmX0HXWqVUibaNNmqSQUR3wGWIstYf.jpg', 30000, 'Áo cho pet nhỏ đáng yêu', 0, 30000, 3, 6),
(6, 'Bánh Gặm Cho Chó – Smoked Beefy Dental Bone -14g', 'frontend/upload/dochocho.jpg', 20000, NULL, 0, 20000, 6, 1),
(7, 'Thức Ăn Cho Chó Trưởng Thành Giống Lớn – Eminent Adult Large Breed – 100g', 'frontend/upload/Eminent.jpg', 20000, 'abc', 0, 20000, 2, 1),
(8, 'Thức Ăn Cho Chó Trưởng Thành Giống Lớn – Eminent Adult Large Breed – 200g', 'frontend/upload/Eminent.jpg', 30000, 'abc', 0, 30000, 5, 1),
(9, 'Thức Ăn Cho Chó Trưởng Thành Giống Lớn – Eminent Adult Large Breed – 300g', 'frontend/upload/Eminent.jpg', 40000, 'abc', 0, 40000, 2, 1),
(10, 'Pate Cho Mèo – Pate Fit4 Cats -Cá Ngừ Và Thanh Cua 260g', 'frontend/upload/dohop.jpg', 30000, NULL, 0, 30000, 10, 2),
(11, 'Pate Cho Mèo – Pate Fit4 Cats -Cá Ngừ Và Thanh Cua 360g', 'frontend/upload/dohop.jpg', 40000, NULL, 0, 4000, 2, 2),
(12, 'Bánh Gặm Cho Chó – Smoked Beefy Dental Bone -20g', 'frontend/upload/dochocho.jpg', 25000, NULL, 0, 25000, 6, 1),
(13, 'Bánh Gặm Cho Mèo – Smoked Beefy Dental Bone -14g', 'frontend/upload/dochocho.jpg', 32000, NULL, 0, 32000, 2, 2),
(14, 'Kính sịn sò con bò', 'frontend/upload/8xgOELGb8mr6EyxE3zuavEWbaueuRxGCMz1iKAMh.jpg', 10000, 'Kính mắt cho pet', 1, 9900, 10, 7),
(15, 'Áo cho bé mèo', 'frontend/upload/pFk4pjh3fxJ7UyoNXAxgYUz9oOIxwKuzflkJVPVm.jpg', 20000, NULL, 5, 19000, 5, 7),
(16, 'Áo cho mèo lớn', 'frontend/upload/bhSbm8LfnkKory6PRfJ4yCMGqcBrcH33FqrmlV0X.jpg', 15000, NULL, NULL, 15000, 5, 7),
(17, 'Áo cho bé nhỏ đáng yêu', 'frontend/upload/vmQdoNJqZEOFcrw10wvn9e7B639WLdrJTW3I31sM.jpg', 50000, NULL, 10, 45000, 6, 7);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chitiet_donhang`
--
ALTER TABLE `chitiet_donhang`
  ADD PRIMARY KEY (`id_ctdonhang`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `sanpham_id` (`sanpham_id`);

--
-- Chỉ mục cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  ADD PRIMARY KEY (`id_danhmuc`);

--
-- Chỉ mục cho bảng `dathang`
--
ALTER TABLE `dathang`
  ADD PRIMARY KEY (`id_dathang`),
  ADD KEY `dathang_id_dathang_index` (`id_dathang`);

--
-- Chỉ mục cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`id_kh`),
  ADD KEY `fk_dk` (`id_phanquyen`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `phanquyen`
--
ALTER TABLE `phanquyen`
  ADD PRIMARY KEY (`id_phanquyen`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`id_sanpham`),
  ADD KEY `fk_customer` (`id_danhmuc`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `chitiet_donhang`
--
ALTER TABLE `chitiet_donhang`
  MODIFY `id_ctdonhang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  MODIFY `id_danhmuc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `dathang`
--
ALTER TABLE `dathang`
  MODIFY `id_dathang` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  MODIFY `id_kh` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `id_sanpham` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `khachhang` (`id_kh`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`sanpham_id`) REFERENCES `sanpham` (`id_sanpham`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  ADD CONSTRAINT `fk_dk` FOREIGN KEY (`id_phanquyen`) REFERENCES `phanquyen` (`id_phanquyen`);

--
-- Các ràng buộc cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `fk_customer` FOREIGN KEY (`id_danhmuc`) REFERENCES `danhmuc` (`id_danhmuc`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
