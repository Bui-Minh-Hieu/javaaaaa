USE SICT_HAUI;
GO
-- Insert into Admin table
INSERT INTO Admin (Username, PasswordHash, FullName, NgayDangKy)
VALUES
    ('ad1', '123', N'Bùi Minh Hiếu', '2025-01-01 10:00:00'),
    ('ad2', '123', N'Phùng Tuấn Đạt', '2025-02-15 09:30:00'),
    ('ad3', '123', N'Hoàng Việt Long', '2025-03-20 14:20:00');
GO


-- Insert into TheLoai (Main categories)
INSERT INTO TheLoai (MaTheLoai, TenTheLoai, VisibleTheLoai, VisibleTheLoai1, SapXep, Url, Target, LinkNgoai)
VALUES
    (1, N'TRANG SICT', 1, 0, 1, 'https://sict.haui.edu.vn/vn/', '_self', 1),
	(2, N'TRANG HAUI', 1, 0, 2, 'https://www.haui.edu.vn/vn', '_self', 1),
    (3, N'GIỚI THIỆU', 1, 0, 3, NULL, NULL, 0),
    (4, N'ĐÀO TẠO', 1, 0, 4, NULL, NULL, 0),
    (5, N'TUYỂN SINH', 1, 0, 5, NULL, NULL, 0),
    (6, N'KHOA', 1, 0, 6, NULL, NULL, 0),
    (7, N'PHÒNG/TRUNG TÂM', 1, 0, 7, NULL, NULL, 0),
    (8, N'KHOA HỌC - CÔNG NGHỆ', 1, 0, 8, NULL, NULL, 0),
    (9, N'THƯ VIỆN ẢNH', 1, 0, 9, NULL, NULL, 0),
	(10, N'TIN TỨC', 0, 1, 1, NULL, NULL, 0),
	(11, N'THÔNG BÁO', 0, 1, 2, NULL, NULL, 0),
	(12, N'CHUYÊN NGÀNH ĐÀO TẠO', 0, 1, 3, NULL, NULL, 0),
	(13, N'TUYỂN DỤNG', 0, 1, 4, NULL, NULL, 0),
	(14, N'ĐÀO TẠO NGẮN HẠN', 0, 1, 5, NULL, NULL, 0),
	(15, N'CÂU LẠC BỘ', 0, 1, 6, NULL, NULL, 0),
	(16, N'GƯƠNG SÁNG SINH VIÊN', 0, 1, 7, NULL, NULL, 0);
GO


-- Insert into TheLoaiTin (Subcategories)
-- Subcategories for 'GIỚI THIỆU' (MaTheLoai = 3)
INSERT INTO TheLoaiTin (MaTheLoaiTin, TenTheLoaiTin, VisibleTheLoaiTin, VisibleTheLoaiTin1, SapXep, Url, Target, LinkNgoai, MaTheLoai)
VALUES
    (1, N'THÔNG TIN CHUNG', 1, 0, 1, NULL, NULL, 0, 3),
    (2, N'CƠ CẤU TỔ CHỨC', 1, 0, 2, NULL, NULL, 0, 3),
    (3, N'CHIẾN LƯỢC PHÁT TRIỂN', 1, 0, 3, NULL, NULL, 0, 3),
    (4, N'CÁN BỘ GIẢNG VIÊN', 1, 0, 4, NULL, NULL, 0, 3),
    (5, N'CƠ SỞ VẬT CHẤT', 1, 0, 5, NULL, NULL, 0, 3),
    (6, N'LIÊN HỆ', 1, 0, 6, NULL, NULL, 0, 3);
GO

-- Subcategories for 'ĐÀO TẠO' (MaTheLoai = 4)
INSERT INTO TheLoaiTin (MaTheLoaiTin, TenTheLoaiTin, VisibleTheLoaiTin, VisibleTheLoaiTin1, SapXep, Url, Target, LinkNgoai, MaTheLoai)
VALUES
    (7, N'ĐẠI HỌC', 1, 0, 1, NULL, NULL, 0, 4),
    (8, N'SAU ĐẠI HỌC', 1, 0, 2, NULL, NULL, 0, 4),
    (9, N'KẾ HOẠCH', 1, 0, 3, NULL, NULL, 0, 4),
    (10, N'TIẾN ĐỘ', 1, 0, 4, NULL, NULL, 0, 4),
    (11, N'QUY CHẾ, BIỂU MẪU', 1, 0, 5, NULL, NULL, 0, 4);
GO

-- Step 1: Add new subcategories under ĐẠI HỌC (MaTheLoai = 4, MaTheLoaiTin = 7)
INSERT INTO TheLoaiTin (MaTheLoaiTin, TenTheLoaiTin, VisibleTheLoaiTin, VisibleTheLoaiTin1, SapXep, Url, Target, LinkNgoai, MaTheLoai)
VALUES
    (25, N'KHOA HỌC MÁY TÍNH', 1, 0, 1, NULL, NULL, 0, 4),
    (26, N'KỸ THUẬT PHẦN MỀM', 1, 0, 2, NULL, NULL, 0, 4),
    (27, N'HỆ THỐNG THÔNG TIN', 1, 0, 3, NULL, NULL, 0, 4),
    (28, N'CÔNG NGHỆ THÔNG TIN', 1, 0, 4, NULL, NULL, 0, 4),
    (29, N'CÔNG NGHỆ ĐA PHƯƠNG TIỆN', 1, 0, 5, NULL, NULL, 0, 4),
    (30, N'AN TOÀN THÔNG TIN', 1, 0, 6, NULL, NULL, 0, 4);
GO

-- Step 2: Add a subcategory under SAU ĐẠI HỌC (MaTheLoai = 4, MaTheLoaiTin = 8)
INSERT INTO TheLoaiTin (MaTheLoaiTin, TenTheLoaiTin, VisibleTheLoaiTin, VisibleTheLoaiTin1, SapXep, Url, Target, LinkNgoai, MaTheLoai)
VALUES
    (31, N'HỆ THỐNG THÔNG TIN', 1, 0, 1, NULL, NULL, 0, 4);


-- Subcategories for 'TUYỂN SINH' (MaTheLoai = 5)
INSERT INTO TheLoaiTin (MaTheLoaiTin, TenTheLoaiTin, VisibleTheLoaiTin, VisibleTheLoaiTin1, SapXep, Url, Target, LinkNgoai, MaTheLoai)
VALUES
    (12, N'ĐẠI HỌC', 1, 0, 1, NULL, NULL, 0, 5),
    (13, N'SAU ĐẠI HỌC', 1, 0, 2, NULL, NULL, 0, 5);
GO

-- Subcategories for 'KHOA' (MaTheLoai = 6)
INSERT INTO TheLoaiTin (MaTheLoaiTin, TenTheLoaiTin, VisibleTheLoaiTin, VisibleTheLoaiTin1, SapXep, Url, Target, LinkNgoai, MaTheLoai)
VALUES
    (14, N'KHOA CÔNG NGHỆ THÔNG TIN', 1, 0, 1, NULL, NULL, 0, 6),
    (15, N'KHOA CÔNG NGHỆ PHẦN MỀM', 1, 0, 2, NULL, NULL, 0, 6),
    (16, N'KHOA KHOA HỌC MÁY TÍNH', 1, 0, 3, NULL, NULL, 0, 6),
    (17, N'KHOA MẠNG MÁY TÍNH VÀ TRUYỀN THÔNG', 1, 0, 4, NULL, NULL, 0, 6);
GO

-- Subcategories for 'PHÒNG/TRUNG TÂM' (MaTheLoai = 7)
INSERT INTO TheLoaiTin (MaTheLoaiTin, TenTheLoaiTin, VisibleTheLoaiTin, VisibleTheLoaiTin1, SapXep, Url, Target, LinkNgoai, MaTheLoai)
VALUES
    (18, N'PHÒNG TỔNG HỢP', 1, 0, 1, NULL, NULL, 0, 7),
    (19, N'TRUNG TÂM HỢP TÁC PHÁT TRIỂN', 1, 0, 2, NULL, NULL, 0, 7),
    (20, N'TRUNG TÂM NGHIÊN CỨU CÔNG NGHỆ TIÊN TIẾN ICT', 1, 0, 3, NULL, NULL, 0, 7);
GO

-- Subcategories for 'KHOA HỌC - CÔNG NGHỆ' (MaTheLoai = 8)
INSERT INTO TheLoaiTin (MaTheLoaiTin, TenTheLoaiTin, VisibleTheLoaiTin, VisibleTheLoaiTin1, SapXep, Url, Target, LinkNgoai, MaTheLoai)
VALUES
    (21, N'CÔNG TRÌNH CÔNG BỐ', 1, 0, 1, NULL, NULL, 0, 8),
    (22, N'ĐỀ TÀI, DỰ ÁN', 1, 0, 2, NULL, NULL, 0, 8),
    (23, N'SINH VIÊN NCKH', 1, 0, 3, NULL, NULL, 0, 8),
    (24, N'TIN KHCN', 1, 0, 4, NULL, NULL, 0, 8);
GO


-- Insert into PhanLoaiTin (Classifications)
INSERT INTO PhanLoaiTin (MaPhanLoaiTin, TenPhanLoaiTin, SapXep, NgayCapNhat)
VALUES
    (1, N'Tiêu điểm', 1, '2025-04-01 08:00:00'),
    (2, N'Các bài đăng', 2, '2025-04-02 09:00:00'),
    (3, N'Tags', 3, '2025-04-03 10:00:00'),
	(4, N'Video giới thiệu', 4, '2025-04-03 10:00:00');
GO

INSERT INTO VideoClip (MaVideo, TenVideo, Url, NgayCapNhat)
VALUES
    (1, N'Video giới thiệu', 'https://www.youtube.com/watch?v=mpIyV4xFf2o', '2025-03-10 08:00:00');
GO


select * from TheLoai

SELECT * FROM [Admin] WHERE Username = ? AND PasswordHash = ?


INSERT INTO TinTuc (MaTinTuc, TieuDeTinTuc, TrichDanTin, MaTheLoai, MaTheLoaiTin, MaPhanLoaiTin, MaThanhVien, NgayCapNhat)
VALUES (1, N'Tin tức mẫu 1', N'Tóm tắt tin tức mẫu 1', 10, 1, 1, 1, GETDATE()),
       (2, N'Tin tức mẫu 2', N'Tóm tắt tin tức mẫu 2', 10, 1, 1, 1, GETDATE());

INSERT INTO TinTuc (MaTinTuc, TieuDeTinTuc, TrichDanTin, NoiDungTin, MaTheLoai, MaTheLoaiTin, MaPhanLoaiTin, MaThanhVien, NgayCapNhat)
VALUES (3, N'Tin tức mẫu 1', N'Tóm tắt tin tức mẫu 1', 'ạhsfohaaaaaawjjjjjjjjjjjjjjjjjjjjjjjjwfisoaifhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhiwnsncjsakwdffffffffffffa', 10, 1, 1, 1, GETDATE());

INSERT INTO TinTuc (MaTinTuc, TieuDeTinTuc, TrichDanTin, MaTheLoai, MaTheLoaiTin, MaPhanLoaiTin, MaThanhVien, NgayCapNhat)
VALUES (5, N'Tin tức mẫu 1', N'Trong nhiều năm qua, Trường Công nghệ thông tin và Truyền thông (SICT)...', 10, 1, 1, 1, GETDATE());

SELECT * FROM TinTuc

-- Xóa các bản ghi cũ để tránh trùng lặp
DELETE FROM TinTuc where MaTheLoai = 10;

-- Thêm bản ghi mới với đầy đủ các cột
INSERT INTO TinTuc (MaTinTuc, TieuDeTinTuc, UrlAnh, TrichDanTin, NoiDungTin, NgayCapNhat, SoLanDoc, Tag, MaTheLoai, MaTheLoaiTin, MaPhanLoaiTin, MaThanhVien)
VALUES 
    (1, N'Đội Olympic Tin học', 'https://sict.haui.edu.vn/media/77/t77832.jpg', N'Là đội tuyển đại diện cho Trường Công nghệ thông tin và Truyền thông - Trường Đại học Công nghiệp Hà Nội ôn luyện và tham gia các kì thi Olympic quốc gia và quốc tế ',
	N'ĐỘI OLYMPIC TIN HỌC

⚡Là đội tuyển đại diện cho Trường Công nghệ thông tin và Truyền thông - Trường Đại học Công nghiệp Hà Nội ôn luyện và tham gia các kì thi Olympic quốc gia và quốc tế .Trải qua gần 20 năm không ngừng phấn đấu và nỗ lực, Đội Olympic Tin học Trường Công nghệ thông tin và Truyền thông - Trường Đại học Công nghiệp Hà Nội tự hào là đơn vị đạt được nhiều thành tích cao trong các cuộc thi trong nước do Hội Tin học Việt Nam tổ chức cũng như các cuộc thi trong khu vực.

🏆 Với sự hướng dẫn tận tình của các thầy cô cùng với tài năng, tinh thần đoàn kết, quyết tâm cao, Đội Olympic tin học đã đạt được nhiều thành tích nổi bật:
- Vô địch PROCON Việt Nam 2022.
- Các giải Nhất, Nhì, Ba cuộc thi Olympic Tin học Sinh viên các năm.
- Đồng giải Ba cuộc thi Lập trình Sinh viên Quốc tế ACM/ICPC Hà Nội - Châu Á.

Hiện tại Ban chủ nhiệm đội bao gồm:

- Đội trưởng: Nguyễn Duy Minh Quân

- Đội phó: Nguyễn Viết Vượng', GETDATE(), 0, 'tag1,tag2', 15, 1, 1, 1),
    (2, N'Câu lạc bộ Thể thao điện tử Trường Công nghệ thông tin và Truyền thông HEC', 'https://sict.haui.edu.vn/media/77/t77821.jpg', 
	N'CLB HEC được thành lập với mục đích mang bộ môn Esports đến gần hơn với sinh viên Trường Công nghệ thông tin và Truyền thông nói riêng và trường Đại học Công nghiệp nói chung.
Phòng máy Esports Training Room của HEC được trang đầy đủ thiết bị thi đấu phục vụ cho các giải đấu esports chuyên nghiệp.',
	N'Câu lạc bộ Thể thao điện tử Trường Công nghệ thông tin và Truyền thông HEC

⚡️CLB HEC được thành lập với mục đích mang bộ môn Esports đến gần hơn với sinh viên Trường Công nghệ thông tin và Truyền thông nói riêng và trường Đại học Công nghiệp nói chung.
Phòng máy Esports Training Room của HEC được trang đầy đủ thiết bị thi đấu phục vụ cho các giải đấu esports chuyên nghiệp.

✨Tại đây, các bạn CTV, thành viên không chỉ được bồi dưỡng các kỹ năng trong lĩnh vực thể thao điện tử như: thiết kế, lên kế hoạch, tổ chức giải đấu, chụp ảnh. Mà còn là nơi giao lưu thể thao điện tử giữa các đội trong trường và được tham gia vô số giải đấu hấp dẫn của HEC cũng như của Trường Đại học Công nghiệp Hà Nội.', GETDATE(), 0, 'tag3,tag4', 15, 1, 1, 1)


	SELECT * FROM TinTuc;


USE SICT_HAUI;
GO

INSERT INTO TinTuc (MaTinTuc, TieuDeTinTuc, UrlAnh, TrichDanTin, NoiDungTin, NgayCapNhat, SoLanDoc, Tag, MaTheLoai, MaTheLoaiTin, MaPhanLoaiTin, MaThanhVien)
VALUES (1000, N'Thông Tin Chung', NULL, N'Giới thiệu tổng quan về Trường Công nghệ Thông tin và Truyền thông', 
        N'**TRƯỜNG CÔNG NGHỆ THÔNG TIN VÀ TRUYỀN THÔNG (SICT)**\n\nTrường Công nghệ Thông tin và Truyền thông là một đơn vị đào tạo hàng đầu thuộc Đại học Công nghiệp Hà Nội, chuyên cung cấp các chương trình giáo dục chất lượng cao trong lĩnh vực Công nghệ Thông tin, Truyền thông và các ngành liên quan. Với đội ngũ giảng viên giàu kinh nghiệm và cơ sở vật chất hiện đại, SICT cam kết mang đến môi trường học tập lý tưởng cho sinh viên.\n\n- **Sứ mệnh**: Đào tạo nguồn nhân lực chất lượng, thúc đẩy nghiên cứu khoa học và đổi mới sáng tạo.\n- **Tầm nhìn**: Trở thành trung tâm đào tạo CNTT hàng đầu tại Việt Nam vào năm 2030.', GETDATE(), 0, NULL, 3, 1, 1, 1);
GO


USE SICT_HAUI;
GO
USE SICT_HAUI;
GO

-- Cập nhật các bản ghi hiện có cho "GIỚI THIỆU" (MaTheLoai = 3)
UPDATE TinTuc
SET TieuDeTinTuc = N'Thông Tin Chung',
    UrlAnh = NULL,
    TrichDanTin = N'Giới thiệu tổng quan về Trường Công nghệ Thông tin và Truyền thông',
    NoiDungTin = N'**TRƯỜNG CÔNG NGHỆ THÔNG TIN VÀ TRUYỀN THÔNG (SICT)**\nTrường Công nghệ Thông tin và Truyền thông là một đơn vị đào tạo hàng đầu thuộc Đại học Công nghiệp Hà Nội, chuyên cung cấp các chương trình giáo dục chất lượng cao trong lĩnh vực Công nghệ Thông tin, Truyền thông và các ngành liên quan.\n- **Sứ mệnh**: Đào tạo nguồn nhân lực chất lượng, thúc đẩy nghiên cứu khoa học và đổi mới sáng tạo.\n- **Tầm nhìn**: Trở thành trung tâm đào tạo CNTT hàng đầu tại Việt Nam vào năm 2030.',
    NgayCapNhat = '2025-05-17 11:58:00',
    SoLanDoc = 0,
    Tag = NULL,
    MaPhanLoaiTin = 1,
    MaThanhVien = 1
WHERE MaTheLoai = 3 AND MaTheLoaiTin = 1;

UPDATE TinTuc
SET TieuDeTinTuc = N'Cơ Cấu Tổ Chức',
    UrlAnh = NULL,
    TrichDanTin = N'Tổ chức và cơ cấu của Trường Công nghệ Thông tin và Truyền thông',
    NoiDungTin = N'**CƠ CẤU TỔ CHỨC SICT**\nTrường Công nghệ Thông tin và Truyền thông (SICT) được tổ chức với các bộ phận chính sau:\n- **Ban Lãnh đạo**: Bao gồm Hiệu trưởng, các Phó Hiệu trưởng và các phòng ban chức năng.\n- **Các Khoa**: Gồm Khoa Công nghệ Thông tin, Khoa Công nghệ Phần mềm, v.v.\n- **Phòng Hành chính - Tổng hợp**: Hỗ trợ quản lý và điều hành.',
    NgayCapNhat = '2025-05-17 11:58:00',
    SoLanDoc = 0,
    Tag = NULL,
    MaPhanLoaiTin = 1,
    MaThanhVien = 1
WHERE MaTheLoai = 3 AND MaTheLoaiTin = 2;

UPDATE TinTuc
SET TieuDeTinTuc = N'Chiến Lược Phát Triển',
    UrlAnh = NULL,
    TrichDanTin = N'Kế hoạch phát triển dài hạn của SICT',
    NoiDungTin = N'**CHIẾN LƯỢC PHÁT TRIỂN**\nSICT đặt mục tiêu trở thành trung tâm đào tạo và nghiên cứu CNTT hàng đầu tại Việt Nam:\n- **Giai đoạn 2025-2030**: Mở rộng quy mô đào tạo, nâng cao chất lượng giảng dạy.\n- **Đầu tư nghiên cứu**: Tăng cường hợp tác với các doanh nghiệp công nghệ.\n- **Quốc tế hóa**: Xây dựng các chương trình liên kết với các trường đại học nước ngoài.',
    NgayCapNhat = '2025-05-17 11:58:00',
    SoLanDoc = 0,
    Tag = NULL,
    MaPhanLoaiTin = 1,
    MaThanhVien = 1
WHERE MaTheLoai = 3 AND MaTheLoaiTin = 3;

UPDATE TinTuc
SET TieuDeTinTuc = N'Cán Bộ Giảng Viên',
    UrlAnh = NULL,
    TrichDanTin = N'Đội ngũ giảng viên chất lượng cao của SICT',
    NoiDungTin = N'**CÁN BỘ GIẢNG VIÊN**\nSICT tự hào sở hữu đội ngũ giảng viên giàu kinh nghiệm và trình độ cao:\n- **Số lượng**: 150 giảng viên, trong đó 60% có trình độ Tiến sĩ.\n- **Chuyên môn**: Các lĩnh vực như AI, An toàn thông tin, Kỹ thuật phần mềm.\n- **Thành tích**: Nhiều giảng viên đạt giải thưởng nghiên cứu khoa học quốc gia.',
    NgayCapNhat = '2025-05-17 11:58:00',
    SoLanDoc = 0,
    Tag = NULL,
    MaPhanLoaiTin = 1,
    MaThanhVien = 1
WHERE MaTheLoai = 3 AND MaTheLoaiTin = 4;

UPDATE TinTuc
SET TieuDeTinTuc = N'Cơ Sở Vật Chất',
    UrlAnh = NULL,
    TrichDanTin = N'Cơ sở vật chất hiện đại của SICT',
    NoiDungTin = N'**CƠ SỞ VẬT CHẤT**\nSICT được trang bị cơ sở vật chất hiện đại:\n- **Phòng máy tính**: 10 phòng với hơn 500 máy tính cấu hình cao.\n- **Thư viện**: Thư viện số với hàng nghìn tài liệu chuyên ngành.\n- **Phòng thí nghiệm**: Phòng nghiên cứu AI, IoT và An ninh mạng.',
    NgayCapNhat = '2025-05-17 11:58:00',
    SoLanDoc = 0,
    Tag = NULL,
    MaPhanLoaiTin = 1,
    MaThanhVien = 1
WHERE MaTheLoai = 3 AND MaTheLoaiTin = 5;

UPDATE TinTuc
SET TieuDeTinTuc = N'Liên Hệ',
    UrlAnh = NULL,
    TrichDanTin = N'Thông tin liên hệ với SICT',
    NoiDungTin = N'**LIÊN HỆ**\n- **Địa chỉ**: Trường Đại học Công nghiệp Hà Nội, Số 298 Cầu Diễn, Bắc Từ Liêm, Hà Nội.\n- **Điện thoại**: (024) 1234 5678\n- **Email**: sict@haui.edu.vn\n- **Website**: https://sict.haui.edu.vn',
    NgayCapNhat = '2025-05-17 11:58:00',
    SoLanDoc = 0,
    Tag = NULL,
    MaPhanLoaiTin = 1,
    MaThanhVien = 1
WHERE MaTheLoai = 3 AND MaTheLoaiTin = 6;




USE SICT_HAUI;
GO

-- Xóa dữ liệu cũ cho MaTheLoai = 3
select * FROM TinTuc ;
GO

-- Chèn dữ liệu mới cập nhật cho MaTheLoai = 3
INSERT INTO TinTuc (MaTinTuc, TieuDeTinTuc, UrlAnh, TrichDanTin, NoiDungTin, NgayCapNhat, SoLanDoc, Tag, MaTheLoai, MaTheLoaiTin, MaPhanLoaiTin, MaThanhVien)
VALUES 
    -- THÔNG TIN CHUNG (MaTheLoaiTin = 1)
    (40,N'Thông Tin Chung', NULL, N'Giới thiệu tổng quan về Trường Công nghệ Thông tin và Truyền thông',
     N'TRƯỜNG CÔNG NGHỆ THÔNG TIN VÀ TRUYỀN THÔNG(SICT)
	 Trường Công nghệ Thông tin và Truyền thông là một đơn vị đào tạo hàng đầu thuộc Đại học Công nghiệp Hà Nội, chuyên cung cấp các chương trình giáo dục chất lượng cao trong lĩnh vực Công nghệ Thông tin, Truyền thông và các ngành liên quan.
	 Sứ mệnh: Đào tạo nguồn nhân lực chất lượng, thúc đẩy nghiên cứu khoa học và đổi mới sáng tạo.\n- **Tầm nhìn**: Trở thành trung tâm đào tạo CNTT hàng đầu tại Việt Nam vào năm 2030.',
     '2025-05-17 12:14:00', 0, NULL, 3, 1, 1, 1),

    -- CƠ CẤU TỔ CHỨC (MaTheLoaiTin = 2)
    (41,N'Cơ Cấu Tổ Chức', NULL, N'Tổ chức và cơ cấu của Trường Công nghệ Thông tin và Truyền thông',
     N'**CƠ CẤU TỔ CHỨC SICT**\nTrường Công nghệ Thông tin và Truyền thông (SICT) được tổ chức với các bộ phận chính sau:\n- **Ban Lãnh đạo**: Bao gồm Hiệu trưởng, các Phó Hiệu trưởng và các phòng ban chức năng.\n- **Các Khoa**: Gồm Khoa Công nghệ Thông tin, Khoa Công nghệ Phần mềm, v.v.\n- **Phòng Hành chính - Tổng hợp**: Hỗ trợ quản lý và điều hành.',
     '2025-05-17 12:14:00', 0, NULL, 3, 2, 1, 1),

    -- CHIẾN LƯỢC PHÁT TRIỂN (MaTheLoaiTin = 3)
    (42,N'Chiến Lược Phát Triển', NULL, N'Kế hoạch phát triển dài hạn của SICT',
     N'**CHIẾN LƯỢC PHÁT TRIỂN**\nSICT đặt mục tiêu trở thành trung tâm đào tạo và nghiên cứu CNTT hàng đầu tại Việt Nam:\n- **Giai đoạn 2025-2030**: Mở rộng quy mô đào tạo, nâng cao chất lượng giảng dạy.\n- **Đầu tư nghiên cứu**: Tăng cường hợp tác với các doanh nghiệp công nghệ.\n- **Quốc tế hóa**: Xây dựng các chương trình liên kết với các trường đại học nước ngoài.',
     '2025-05-17 12:14:00', 0, NULL, 3, 3, 1, 1),

    -- CÁN BỘ GIẢNG VIÊN (MaTheLoaiTin = 4)
    (43,N'Cán Bộ Giảng Viên', NULL, N'Đội ngũ giảng viên chất lượng cao của SICT',
     N'**CÁN BỘ GIẢNG VIÊN**\nSICT tự hào sở hữu đội ngũ giảng viên giàu kinh nghiệm và trình độ cao:\n- **Số lượng**: 150 giảng viên, trong đó 60% có trình độ Tiến sĩ.\n- **Chuyên môn**: Các lĩnh vực như AI, An toàn thông tin, Kỹ thuật phần mềm.\n- **Thành tích**: Nhiều giảng viên đạt giải thưởng nghiên cứu khoa học quốc gia.',
     '2025-05-17 12:14:00', 0, NULL, 3, 4, 1, 1),

    -- CƠ SỞ VẬT CHẤT (MaTheLoaiTin = 5)
    (44,N'Cơ Sở Vật Chất', NULL, N'Cơ sở vật chất hiện đại của SICT',
     N'**CƠ SỞ VẬT CHẤT**\nSICT được trang bị cơ sở vật chất hiện đại:\n- **Phòng máy tính**: 10 phòng với hơn 500 máy tính cấu hình cao.\n- **Thư viện**: Thư viện số với hàng nghìn tài liệu chuyên ngành.\n- **Phòng thí nghiệm**: Phòng nghiên cứu AI, IoT và An ninh mạng.',
     '2025-05-17 12:14:00', 0, NULL, 3, 5, 1, 1),

    -- LIÊN HỆ (MaTheLoaiTin = 6)
    (45,N'Liên Hệ', NULL, N'Thông tin liên hệ với SICT',
     N'**LIÊN HỆ**\n- **Địa chỉ**: Trường Đại học Công nghiệp Hà Nội, Số 298 Cầu Diễn, Bắc Từ Liêm, Hà Nội.\n- **Điện thoại**: (024) 1234 5678\n- **Email**: sict@haui.edu.vn\n- **Website**: https://sict.haui.edu.vn',
     '2025-05-17 12:14:00', 0, NULL, 3, 6, 1, 1);
GO

SELECT * FROM TinTuc WHERE MaTheLoai = 3;

SELECT NoiDungTin FROM TinTuc WHERE MaTheLoaiTin = 1 AND MaTheLoai = 3;
DELETE FROM TinTuc WHERE MaTheLoai = 3;



-- Chèn dữ liệu cho KHOA (MaTheLoai = 4)
INSERT INTO TinTuc (MaTinTuc, TieuDeTinTuc, UrlAnh, TrichDanTin, NoiDungTin, NgayCapNhat, SoLanDoc, Tag, MaTheLoai, MaTheLoaiTin, MaPhanLoaiTin, MaThanhVien)
VALUES 
    -- KHOA CÔNG NGHỆ THÔNG TIN (MaTheLoaiTin = 1)
    (50, N'Khoa Công nghệ Thông tin', NULL, N'Giới thiệu về Khoa Công nghệ Thông tin',
     N'**KHOA CÔNG NGHỆ THÔNG TIN**\nKhoa Công nghệ Thông tin là một trong những khoa chủ lực của Trường Công nghệ Thông tin và Truyền thông (SICT), chuyên đào tạo các chuyên ngành như Lập trình, Cơ sở dữ liệu và Hệ thống thông tin.\n- **Sứ mệnh**: Cung cấp nhân lực chất lượng cao cho ngành CNTT.\n- **Đội ngũ**: 50 giảng viên, 70% có trình độ Tiến sĩ.\n- **Thành tích**: Đạt nhiều giải thưởng trong các cuộc thi công nghệ quốc gia.',
     '2025-05-17 12:36:00', 0, N'CNTT, Lập trình', 4, 1, 1, 1),

    -- KHOA CÔNG NGHỆ PHẦN MỀM (MaTheLoaiTin = 2)
    (51, N'Khoa Công nghệ Phần mềm', NULL, N'Giới thiệu về Khoa Công nghệ Phần mềm',
     N'**KHOA CÔNG NGHỆ PHẦN MỀM**\nKhoa Công nghệ Phần mềm tập trung vào phát triển phần mềm, kỹ thuật phần mềm và quản lý dự án CNTT.\n- **Chương trình đào tạo**: Đáp ứng tiêu chuẩn quốc tế như ACM/IEEE.\n- **Cơ sở vật chất**: Phòng thực hành với phần mềm hiện đại.\n- **Hợp tác**: Liên kết với các công ty như FPT, Viettel.',
     '2025-05-17 12:36:00', 0, N'Phần mềm, Kỹ thuật', 4, 2, 1, 1),

    -- KHOA KHOA HỌC MÁY TÍNH (MaTheLoaiTin = 3)
    (52, N'Khoa Khoa học Máy tính', NULL, N'Giới thiệu về Khoa Khoa học Máy tính',
     N'**KHOA KHOA HỌC MÁY TÍNH**\nKhoa Khoa học Máy tính chuyên sâu về trí tuệ nhân tạo, học máy và phân tích dữ liệu.\n- **Nghiên cứu**: Dẫn đầu trong các dự án AI và Big Data.\n- **Giảng viên**: 40 giảng viên, 80% có công bố quốc tế.\n- **Sinh viên**: Tham gia các cuộc thi như ICPC, Hackathon.',
     '2025-05-17 12:36:00', 0, N'AI, Dữ liệu', 4, 3, 1, 1),

    -- KHOA MẠNG MÁY TÍNH VÀ TRUYỀN THÔNG (MaTheLoaiTin = 4)
    (53, N'Khoa Mạng Máy tính và Truyền thông', NULL, N'Giới thiệu về Khoa Mạng Máy tính và Truyền thông',
     N'**KHOA MẠNG MÁY TÍNH VÀ TRUYỀN THÔNG**\nKhoa chuyên đào tạo về mạng máy tính, an ninh mạng và truyền thông đa phương tiện.\n- **Chương trình**: CCNA, CEH, và các chứng chỉ quốc tế.\n- **Phòng thí nghiệm**: Trang bị thiết bị Cisco, Juniper.\n- **Cơ hội việc làm**: Hợp tác với các tập đoàn viễn thông.',
     '2025-05-17 12:36:00', 0, N'Mạng, An ninh', 4, 4, 1, 1),

    -- PHÒNG TỔNG HỢP (MaTheLoai = 5, MaTheLoaiTin = 1)
    (54, N'Phòng Tổng hợp', NULL, N'Giới thiệu về Phòng Tổng hợp',
     N'**PHÒNG TỔNG HỢP**\nPhòng Tổng hợp chịu trách nhiệm quản lý hành chính và hỗ trợ các hoạt động của Trường Công nghệ Thông tin và Truyền thông.\n- **Nhiệm vụ**: Quản lý hồ sơ, tổ chức sự kiện, hỗ trợ sinh viên.\n- **Nhân sự**: 20 cán bộ hành chính.\n- **Liên hệ**: Email: tonghop@sict.haui.edu.vn.',
     '2025-05-17 12:36:00', 0, N'Hành chính', 5, 1, 1, 1),

    -- TRUNG TÂM HỢP TÁC PHÁT TRIỂN (MaTheLoai = 5, MaTheLoaiTin = 2)
    (55, N'Trung tâm Hợp tác Phát triển', NULL, N'Giới thiệu về Trung tâm Hợp tác Phát triển',
     N'**TRUNG TÂM HỢP TÁC PHÁT TRIỂN**\nTrung tâm thúc đẩy hợp tác giữa SICT và các doanh nghiệp, tổ chức trong và ngoài nước.\n- **Hoạt động**: Ký kết MOU với các công ty công nghệ.\n- **Dự án**: Hỗ trợ khởi nghiệp và chuyển giao công nghệ.\n- **Liên hệ**: Email: hoptac@sict.haui.edu.vn.',
     '2025-05-17 12:36:00', 0, N'Hợp tác, Doanh nghiệp', 5, 2, 1, 1),

    -- TRUNG TÂM NGHIÊN CỨU CÔNG NGHỆ TIÊN TIẾN ICT (MaTheLoai = 5, MaTheLoaiTin = 3)
    (56, N'Trung tâm Nghiên cứu Công nghệ Tiên tiến ICT', NULL, N'Giới thiệu về Trung tâm Nghiên cứu Công nghệ Tiên tiến ICT',
     N'**TRUNG TÂM NGHIÊN CỨU CÔNG NGHỆ TIÊN TIẾN ICT**\nTrung tâm tập trung vào nghiên cứu các công nghệ tiên tiến như AI, IoT, và Blockchain.\n- **Dự án**: Phát triển giải pháp IoT cho thành phố thông minh.\n- **Thành tựu**: 10 bài báo quốc tế trong năm 2024.\n- **Liên hệ**: Email: nghien-cuu@sict.haui.edu.vn.',
     '2025-05-17 12:36:00', 0, N'Nghiên cứu, Công nghệ', 5, 3, 1, 1);
GO



-- Xóa dữ liệu cũ để tránh trùng lặp
DELETE FROM TinTuc WHERE MaTheLoai = 5;

-- Insert sample news for TUYỂN SINH - ĐẠI HỌC (MaTheLoai = 5, MaTheLoaiTin = 12)
INSERT INTO TinTuc (MaTinTuc, TieuDeTinTuc, UrlAnh, TrichDanTin, NoiDungTin, NgayCapNhat, SoLanDoc, Tag, MaTheLoai, MaTheLoaiTin, MaPhanLoaiTin, MaThanhVien)
VALUES 
    (60, N'Thông Báo Tuyển Sinh Đại Học 2025', 'https://sict.haui.edu.vn/media/78/t78901.jpg', 
     N'Trường Công nghệ Thông tin và Truyền thông – Đại học Công nghiệp Hà Nội thông báo tuyển sinh đại học năm 2025 với các ngành: \n Công nghệ Thông tin\nKhoa học Máy tính\nKỹ thuật Phần mềm\n\nPhương thức xét tuyển:\nXét điểm thi THPT Quốc gia\nXét học bạ\nXét tuyển thẳng theo quy định của Bộ GD&ĐT\n\nThời gian nhận hồ sơ: Từ 01/06/2025 đến 30/06/2025.', 
     N'THÔNG BÁO TUYỂN SINH ĐẠI HỌC 2025 ' +
     N'Trường Công nghệ Thông tin và Truyền thông – Đại học Công nghiệp Hà Nội thông báo tuyển sinh đại học năm 2025 với các ngành:\n' +
     N'- Công nghệ Thông tin\n' +
     N'- Khoa học Máy tính\n' +
     N'- Kỹ thuật Phần mềm\n\n' +
     N'Phương thức xét tuyển:\n' +
     N'- Xét điểm thi THPT Quốc gia\n' +
     N'- Xét học bạ\n' +
     N'- Xét tuyển thẳng theo quy định của Bộ GD&ĐT\n\n' +
     N'Thời gian nhận hồ sơ: Từ 01/06/2025 đến 30/06/2025.', 
     GETDATE(), 0, 'tuyensin,daihoc', 5, 12, 1, 1),
    (61, N'Hội Thảo Tư Vấn Tuyển Sinh Đại Học', 'https://sict.haui.edu.vn/media/78/t78902.jpg', 
     N'Hội thảo tư vấn tuyển sinh đại học 2025 sẽ được tổ chức vào ngày 15/05/2025.', 
     N'HỘI THẢO TƯ VẤN TUYỂN SINH ĐẠI HỌC 2025\n\n' +
     N'Trường Công nghệ Thông tin và Truyền thông tổ chức hội thảo tư vấn tuyển sinh đại học 2025 nhằm cung cấp thông tin chi tiết về:\n' +
     N'- Các ngành đào tạo\n' +
     N'- Phương thức xét tuyển\n' +
     N'- Cơ hội việc làm sau tốt nghiệp\n\n' +
     N'Thời gian: 08:00, ngày 15/05/2025\n' +
     N'Địa điểm: Hội trường A, Đại học Công nghiệp Hà Nội\n' +
     N'Đăng ký tham gia tại: https://sict.haui.edu.vn/dangky', 
     GETDATE(), 0, 'tuyensin,hoithao', 5, 12, 1, 1);

-- Insert sample news for TUYỂN SINH - SAU ĐẠI HỌC (MaTheLoai = 5, MaTheLoaiTin = 13)
INSERT INTO TinTuc (MaTinTuc, TieuDeTinTuc, UrlAnh, TrichDanTin, NoiDungTin, NgayCapNhat, SoLanDoc, Tag, MaTheLoai, MaTheLoaiTin, MaPhanLoaiTin, MaThanhVien)
VALUES 
    (62, N'Tuyển Sinh Thạc Sĩ 2025', 'https://sict.haui.edu.vn/media/78/t78903.jpg', 
     N'Trường Công nghệ Thông tin và Truyền thông – Đại học Công nghiệp Hà Nội thông báo tuyển sinh thạc sĩ năm 2025 với các chuyên ngành:\n- Hệ thống Thông tin\n- Khoa học Dữ liệu\n\nĐiều kiện dự tuyển:\n- Tốt nghiệp đại học đúng ngành hoặc ngành gần\n- Có chứng chỉ ngoại ngữ theo quy định\n\nThời gian nhận hồ sơ: Từ 01/07/2025 đến 31/07/2025.', 
     N'TUYỂN SINH THẠC SĨ 2025\n\n' +
     N'Trường Công nghệ Thông tin và Truyền thông – Đại học Công nghiệp Hà Nội thông báo tuyển sinh chương trình thạc sĩ năm 2025 với các chuyên ngành:\n' +
     N'- Hệ thống Thông tin\n' +
     N'- Khoa học Dữ liệu\n\n' +
     N'Điều kiện dự tuyển:\n' +
     N'- Tốt nghiệp đại học đúng ngành hoặc ngành gần\n' +
     N'- Có chứng chỉ ngoại ngữ theo quy định\n\n' +
     N'Thời gian nhận hồ sơ: Từ 01/07/2025 đến 31/07/2025.', 
     GETDATE(), 0, 'tuyensin,thacsi', 5, 13, 1, 1),
    (63, N'Hội Thảo Tuyển Sinh Sau Đại Học', 'https://sict.haui.edu.vn/media/78/t78904.jpg', 
     N'Hội thảo giới thiệu chương trình thạc sĩ 2025 sẽ diễn ra vào ngày 20/06/2025.', 
     N'HỘI THẢO TUYỂN SINH SAU ĐẠI HỌC 2025\n\n' +
     N'Trường Công nghệ Thông tin và Truyền thông tổ chức hội thảo giới thiệu chương trình thạc sĩ 2025, bao gồm:\n' +
     N'- Thông tin chi tiết về chương trình đào tạo\n' +
     N'- Điều kiện dự tuyển\n' +
     N'- Cơ hội học bổng và hỗ trợ tài chính\n\n' +
     N'Thời gian: 09:00, ngày 20/06/2025\n' +
     N'Địa điểm: Phòng họp B, Đại học Công nghiệp Hà Nội\n' +
     N'Đăng ký tham gia tại: https://sict.haui.edu.vn/dangky-thacsi', 
     GETDATE(), 0, 'tuyensin,hoithao', 5, 13, 1, 1);



	 USE SICT_HAUI;
GO

-- Xóa dữ liệu cũ cho MaTheLoai = 7 để tránh trùng lặp
DELETE FROM TinTuc WHERE MaTheLoai = 7;
GO

-- Chèn dữ liệu mới cho PHÒNG/TRUNG TÂM (MaTheLoai = 7)
INSERT INTO TinTuc (MaTinTuc, TieuDeTinTuc, UrlAnh, TrichDanTin, NoiDungTin, NgayCapNhat, SoLanDoc, Tag, MaTheLoai, MaTheLoaiTin, MaPhanLoaiTin, MaThanhVien)
VALUES 
    -- PHÒNG TỔNG HỢP (MaTheLoaiTin = 18)
    (70, N'Phòng Tổng hợp', NULL, 
     N'Giới thiệu về Phòng Tổng hợp của Trường Công nghệ Thông tin và Truyền thông.', 
     N'**PHÒNG TỔNG HỢP**\n\n' +
     N'Phòng Tổng hợp thuộc Trường Công nghệ Thông tin và Truyền thông (SICT) chịu trách nhiệm quản lý hành chính và hỗ trợ các hoạt động chung của nhà trường.\n\n' +
     N'- **Nhiệm vụ chính**:\n' +
     N'  - Quản lý hồ sơ sinh viên và giảng viên.\n' +
     N'  - Tổ chức các sự kiện nội bộ và hội thảo.\n' +
     N'  - Hỗ trợ công tác tuyển sinh và đào tạo.\n\n' +
     N'- **Nhân sự**: Phòng có 20 cán bộ hành chính, luôn sẵn sàng hỗ trợ sinh viên và giảng viên.\n' +
     N'- **Liên hệ**: Email: tonghop@sict.haui.edu.vn | Điện thoại: (024) 1234 5678.', 
     '2025-05-17 13:00:00', 0, N'HanhChinh,TongHop', 7, 18, 1, 1),

    -- TRUNG TÂM HỢP TÁC PHÁT TRIỂN (MaTheLoaiTin = 19)
    (71, N'Trung tâm Hợp tác Phát triển', NULL, 
     N'Trung tâm thúc đẩy hợp tác giữa SICT và các doanh nghiệp, tổ chức trong và ngoài nước.', 
     N'**TRUNG TÂM HỢP TÁC PHÁT TRIỂN**\n\n' +
     N'Trung tâm Hợp tác Phát triển của Trường Công nghệ Thông tin và Truyền thông (SICT) được thành lập nhằm tăng cường mối quan hệ hợp tác với các đối tác trong và ngoài nước.\n\n' +
     N'- **Hoạt động nổi bật**:\n' +
     N'  - Ký kết biên bản ghi nhớ (MOU) với các công ty công nghệ lớn như FPT, Viettel.\n' +
     N'  - Tổ chức các chương trình trao đổi sinh viên quốc tế.\n' +
     N'  - Hỗ trợ khởi nghiệp và chuyển giao công nghệ cho sinh viên.\n\n' +
     N'- **Thành tựu**: Đã hợp tác với hơn 50 doanh nghiệp trong 5 năm qua.\n' +
     N'- **Liên hệ**: Email: hoptac@sict.haui.edu.vn | Điện thoại: (024) 8765 4321.', 
     '2025-05-17 13:00:00', 0, N'HopTac,DoanhNghiep', 7, 19, 1, 1),

    -- TRUNG TÂM NGHIÊN CỨU CÔNG NGHỆ TIÊN TIẾN ICT (MaTheLoaiTin = 20)
    (72, N'Trung tâm Nghiên cứu Công nghệ Tiên tiến ICT', NULL, 
     N'Trung tâm tập trung nghiên cứu các công nghệ tiên tiến như AI, IoT, và Blockchain.', 
     N'**TRUNG TÂM NGHIÊN CỨU CÔNG NGHỆ TIÊN TIẾN ICT**\n\n' +
     N'Trung tâm Nghiên cứu Công nghệ Tiên tiến ICT của Trường Công nghệ Thông tin và Truyền thông (SICT) là đơn vị dẫn đầu trong nghiên cứu và ứng dụng các công nghệ mới.\n\n' +
     N'- **Lĩnh vực nghiên cứu**:\n' +
     N'  - Trí tuệ nhân tạo (AI) và học máy (Machine Learning).\n' +
     N'  - Internet vạn vật (IoT) và thành phố thông minh.\n' +
     N'  - Công nghệ Blockchain và bảo mật dữ liệu.\n\n' +
     N'- **Thành tựu**: Đã công bố 15 bài báo quốc tế trong năm 2024 và triển khai 5 dự án IoT cho các địa phương.\n' +
     N'- **Liên hệ**: Email: nghien-cuu@sict.haui.edu.vn | Điện thoại: (024) 5678 1234.', 
     '2025-05-17 13:00:00', 0, N'NghienCuu,CongNghe', 7, 20, 1, 1);
GO

-- Kiểm tra dữ liệu vừa chèn
SELECT * FROM TinTuc WHERE MaTheLoai = 7;
GO



USE SICT_HAUI;
GO

-- Step 1: Add new subcategories under ĐẠI HỌC (MaTheLoai = 4, MaTheLoaiTin = 7)
INSERT INTO TheLoaiTin (MaTheLoaiTin, TenTheLoaiTin, VisibleTheLoaiTin, VisibleTheLoaiTin1, SapXep, Url, Target, LinkNgoai, MaTheLoai)
VALUES
    (25, N'KHOA HỌC MÁY TÍNH', 1, 0, 1, NULL, NULL, 0, 4),
    (26, N'KỸ THUẬT PHẦN MỀM', 1, 0, 2, NULL, NULL, 0, 4),
    (27, N'HỆ THỐNG THÔNG TIN', 1, 0, 3, NULL, NULL, 0, 4),
    (28, N'CÔNG NGHỆ THÔNG TIN', 1, 0, 4, NULL, NULL, 0, 4),
    (29, N'CÔNG NGHỆ ĐA PHƯƠNG TIỆN', 1, 0, 5, NULL, NULL, 0, 4),
    (30, N'AN TOÀN THÔNG TIN', 1, 0, 6, NULL, NULL, 0, 4);
GO

-- Step 2: Add a subcategory under SAU ĐẠI HỌC (MaTheLoai = 4, MaTheLoaiTin = 8)
INSERT INTO TheLoaiTin (MaTheLoaiTin, TenTheLoaiTin, VisibleTheLoaiTin, VisibleTheLoaiTin1, SapXep, Url, Target, LinkNgoai, MaTheLoai)
VALUES
    (31, N'HỆ THỐNG THÔNG TIN', 1, 0, 1, NULL, NULL, 0, 4);
GO

-- Step 3: Delete incorrect data for MaTheLoai = 4
DELETE FROM TinTuc WHERE MaTheLoai = 4;
GO

-- Step 4: Insert news entries for ĐẠI HỌC, SAU ĐẠI HỌC, and QUY CHẾ, BIỂU MẪU
INSERT INTO TinTuc (MaTinTuc, TieuDeTinTuc, UrlAnh, TrichDanTin, NoiDungTin, NgayCapNhat, SoLanDoc, Tag, MaTheLoai, MaTheLoaiTin, MaPhanLoaiTin, MaThanhVien)
VALUES 
    -- KHOA HỌC MÁY TÍNH (MaTheLoaiTin = 25)
    (80, N'Khoa Khoa học Máy tính', NULL, 
     N'Giới thiệu về Khoa Khoa học Máy tính', 
     N'**KHOA KHOA HỌC MÁY TÍNH**\n\n' +
     N'Khoa Khoa học Máy tính thuộc Trường Công nghệ Thông tin và Truyền thông (SICT) chuyên đào tạo và nghiên cứu chuyên sâu về trí tuệ nhân tạo, học máy và phân tích dữ liệu.\n\n' +
     N'- **Nghiên cứu nổi bật**:\n' +
     N'  - Dẫn đầu trong các dự án AI và Big Data.\n' +
     N'  - Phát triển các thuật toán học máy tiên tiến.\n\n' +
     N'- **Đội ngũ giảng viên**: 40 giảng viên, 80% có công bố quốc tế.\n' +
     N'- **Sinh viên**: Tham gia các cuộc thi lập trình quốc tế như ICPC, Hackathon.\n' +
     N'- **Liên hệ**: Email: khoahocmaytinh@sict.haui.edu.vn | Điện thoại: (024) 5678 1234.', 
     '2025-05-17 14:00:00', 0, N'AI,DuLieu', 4, 25, 1, 1),

    -- KỸ THUẬT PHẦN MỀM (MaTheLoaiTin = 26)
    (81, N'Khoa Kỹ thuật Phần mềm', NULL, 
     N'Giới thiệu về Khoa Kỹ thuật Phần mềm', 
     N'**KHOA KỸ THUẬT PHẦN MỀM**\n\n' +
     N'Khoa Kỹ thuật Phần mềm tập trung đào tạo các kỹ năng phát triển phần mềm, quản lý dự án và kỹ thuật phần mềm theo tiêu chuẩn quốc tế.\n\n' +
     N'- **Chương trình đào tạo**:\n' +
     N'  - Đáp ứng tiêu chuẩn ACM/IEEE.\n' +
     N'  - Tập trung vào quy trình phát triển phần mềm Agile, DevOps.\n\n' +
     N'- **Cơ sở vật chất**: Phòng thực hành với các phần mềm hiện đại như Visual Studio, IntelliJ.\n' +
     N'- **Hợp tác doanh nghiệp**: Liên kết với FPT, Viettel để cung cấp cơ hội thực tập.\n' +
     N'- **Liên hệ**: Email: kythuatphanmem@sict.haui.edu.vn | Điện thoại: (024) 8765 4321.', 
     '2025-05-17 14:00:00', 0, N'PhanMem,KyThuat', 4, 26, 1, 1),

    -- HỆ THỐNG THÔNG TIN (MaTheLoaiTin = 27)
    (82, N'Hệ thống Thông tin', NULL, 
     N'Giới thiệu về chuyên ngành Hệ thống Thông tin', 
     N'**HỆ THỐNG THÔNG TIN**\n\n' +
     N'Chuyên ngành Hệ thống Thông tin tại Trường Công nghệ Thông tin và Truyền thông (SICT) đào tạo sinh viên về thiết kế, triển khai và quản lý các hệ thống thông tin doanh nghiệp.\n\n' +
     N'- **Chương trình đào tạo**:\n' +
     N'  - Tập trung vào ERP, CRM và các hệ thống quản lý dữ liệu.\n' +
     N'  - Học về phân tích và thiết kế hệ thống.\n\n' +
     N'- **Cơ hội việc làm**: Làm việc tại các công ty tư vấn CNTT như Deloitte, EY.\n' +
     N'- **Thành tích sinh viên**: Nhiều sinh viên đạt giải trong các cuộc thi phân tích dữ liệu.\n' +
     N'- **Liên hệ**: Email: hethongthongtin@sict.haui.edu.vn | Điện thoại: (024) 1234 5678.', 
     '2025-05-17 14:00:00', 0, N'HeThong,DoanhNghiep', 4, 27, 1, 1),

    -- CÔNG NGHỆ THÔNG TIN (MaTheLoaiTin = 28)
    (83, N'Công nghệ Thông tin', NULL, 
     N'Giới thiệu về chuyên ngành Công nghệ Thông tin', 
     N'**CÔNG NGHỆ THÔNG TIN**\n\n' +
     N'Chuyên ngành Công nghệ Thông tin tại Trường Công nghệ Thông tin và Truyền thông (SICT) cung cấp kiến thức toàn diện về lập trình, cơ sở dữ liệu và quản trị hệ thống.\n\n' +
     N'- **Môn học tiêu biểu**:\n' +
     N'  - Lập trình Java, Python.\n' +
     N'  - Quản trị cơ sở dữ liệu với MySQL, Oracle.\n\n' +
     N'- **Phòng thí nghiệm**: Trang bị máy tính cấu hình cao và phần mềm chuyên dụng.\n' +
     N'- **Cơ hội nghề nghiệp**: Làm việc tại các tập đoàn công nghệ như Google, Microsoft.\n' +
     N'- **Liên hệ**: Email: congnghethongtin@sict.haui.edu.vn | Điện thoại: (024) 5678 1234.', 
     '2025-05-17 14:00:00', 0, N'LapTrinh,CoSoDuLieu', 4, 28, 1, 1),

    -- CÔNG NGHỆ ĐA PHƯƠNG TIỆN (MaTheLoaiTin = 29)
    (84, N'Công nghệ Đa phương tiện', NULL, 
     N'Giới thiệu về chuyên ngành Công nghệ Đa phương tiện', 
     N'**CÔNG NGHỆ ĐA PHƯƠNG TIỆN**\n\n' +
     N'Chuyên ngành Công nghệ Đa phương tiện tại Trường Công nghệ Thông tin và Truyền thông (SICT) đào tạo về thiết kế đồ họa, sản xuất video và phát triển game.\n\n' +
     N'- **Kỹ năng đào tạo**:\n' +
     N'  - Sử dụng phần mềm Adobe Photoshop, Premiere.\n' +
     N'  - Phát triển game với Unity, Unreal Engine.\n\n' +
     N'- **Dự án sinh viên**: Thực hiện các sản phẩm truyền thông đa phương tiện cho doanh nghiệp.\n' +
     N'- **Cơ hội nghề nghiệp**: Làm việc trong ngành truyền thông, game và quảng cáo.\n' +
     N'- **Liên hệ**: Email: daphuongtien@sict.haui.edu.vn | Điện thoại: (024) 8765 4321.', 
     '2025-05-17 14:00:00', 0, N'ThietKe,Game', 4, 29, 1, 1),

    -- AN TOÀN THÔNG TIN (MaTheLoaiTin = 30)
    (85, N'An toàn Thông tin', NULL, 
     N'Giới thiệu về chuyên ngành An toàn Thông tin', 
     N'**AN TOÀN THÔNG TIN**\n\n' +
     N'Chuyên ngành An toàn Thông tin tại Trường Công nghệ Thông tin và Truyền thông (SICT) đào tạo về bảo mật mạng, mã hóa và phòng chống tấn công mạng.\n\n' +
     N'- **Chương trình đào tạo**:\n' +
     N'  - Học các chứng chỉ quốc tế như CEH, CISSP.\n' +
     N'  - Thực hành tại phòng thí nghiệm an ninh mạng.\n\n' +
     N'- **Thành tích**: Sinh viên đạt giải cao trong các cuộc thi an ninh mạng toàn quốc.\n' +
     N'- **Cơ hội việc làm**: Làm việc tại các công ty bảo mật như Kaspersky, BKAV.\n' +
     N'- **Liên hệ**: Email: antoanthongtin@sict.haui.edu.vn | Điện thoại: (024) 1234 5678.', 
     '2025-05-17 14:00:00', 0, N'BaoMat,Mang', 4, 30, 1, 1),

    -- SAU ĐẠI HỌC - HỆ THỐNG THÔNG TIN (MaTheLoaiTin = 31)
    (86, N'Hệ thống Thông tin - Sau Đại học', NULL, 
     N'Giới thiệu về chương trình Sau Đại học chuyên ngành Hệ thống Thông tin', 
     N'**HỆ THỐNG THÔNG TIN - SAU ĐẠI HỌC**\n\n' +
     N'Chương trình Sau Đại học chuyên ngành Hệ thống Thông tin tại Trường Công nghệ Thông tin và Truyền thông (SICT) tập trung vào nghiên cứu và ứng dụng các hệ thống thông tin trong doanh nghiệp.\n\n' +
     N'- **Mục tiêu đào tạo**:\n' +
     N'  - Phát triển chuyên gia trong lĩnh vực quản lý hệ thống thông tin.\n' +
     N'  - Nâng cao kỹ năng nghiên cứu và phân tích dữ liệu.\n\n' +
     N'- **Chương trình học**:\n' +
     N'  - Quản lý dữ liệu lớn (Big Data).\n' +
     N'  - Hệ thống ERP và CRM.\n\n' +
     N'- **Cơ hội nghề nghiệp**: Làm việc tại các tập đoàn lớn như IBM, Oracle.\n' +
     N'- **Liên hệ**: Email: sauhethongthongtin@sict.haui.edu.vn | Điện thoại: (024) 5678 1234.', 
     '2025-05-17 14:00:00', 0, N'SauDaiHoc,HeThong', 4, 31, 1, 1),

    -- QUY CHẾ, BIỂU MẪU (MaTheLoaiTin = 11)
    (87, N'Quy Chế và Biểu Mẫu', NULL, 
     N'Thông tin về quy chế và biểu mẫu đào tạo', 
     N'**QUY CHẾ VÀ BIỂU MẪU**\n\n' +
     N'Trường Công nghệ Thông tin và Truyền thông (SICT) cung cấp các quy chế và biểu mẫu cần thiết cho sinh viên và giảng viên trong quá trình đào tạo.\n\n' +
     N'- **Quy chế đào tạo**:\n' +
     N'  - Quy định về học tập và thi cử.\n' +
     N'  - Quy chế xét tốt nghiệp và cấp bằng.\n\n' +
     N'- **Biểu mẫu**:\n' +
     N'  - Đơn xin nghỉ học.\n' +
     N'  - Đơn xin chuyển ngành.\n' +
     N'  - Đơn xin bảo lưu kết quả học tập.\n\n' +
     N'- **Tải xuống**: Các biểu mẫu có thể được tải tại [website chính thức](https://sict.haui.edu.vn).\n' +
     N'- **Liên hệ hỗ trợ**: Email: quyche@sict.haui.edu.vn | Điện thoại: (024) 1234 5678.', 
     '2025-05-17 14:00:00', 0, N'QuyChe,BieuMau', 4, 11, 1, 1);
GO

-- Verify the inserted data
SELECT * FROM TinTuc WHERE MaTheLoai = 4;
GO


select * from [Admin]