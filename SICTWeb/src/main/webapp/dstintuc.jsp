<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.sict.database.DatabaseConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SICT News</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
    <style>
        html {
            font-size: 16px; /* Base font size for rem units */
        }
        body {
            background-color: #f5f5f5;
            font-family: 'Roboto', Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        /* Header Styles */
        header {
            background-color: #fff;
            border-bottom: 0.0625rem solid #ddd;
            text-align: center;
        }
        .header-top {
            padding: 0.625rem 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .header-top img {
            height: 2.5rem; /* ~40px */
            margin-right: 0.625rem;
        }
        .header-top h1 {
            font-size: 1rem; /* ~16px */
            color: #003087;
            margin: 0;
            font-weight: 700;
        }
        .navbar {
            list-style: none;
            background-color: #003087;
            padding: 0;
            margin: 0;
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            width: 100vw;
        }
        .navbar > li {
            position: relative;
            margin: 0 0.625rem;
        }
        .navbar > li > a {
            display: block;
            padding: 0.75rem 1rem;
            color: white;
            font-weight: bold;
            text-decoration: none;
            white-space: nowrap;
            font-size: 0.875rem; /* ~14px */
        }
        .navbar > li:hover {
            background-color: #0055b3;
        }
        .dropdown {
            position: absolute;
            top: 100%;
            left: 0;
            background-color: white;
            list-style: none;
            min-width: 13.75rem; /* 220px */
            display: none;
            padding: 0.625rem 0;
            margin: 0;
            border-radius: 0.375rem;
            box-shadow: 0 0.25rem 0.5rem rgba(0, 0, 0, 0.15);
            z-index: 1000;
        }
        .dropdown li a {
            display: block;
            padding: 0.75rem 1.25rem;
            color: #003087;
            text-decoration: none;
            font-weight: bold;
            white-space: nowrap;
            font-size: 0.8125rem; /* ~13px */
        }
        .dropdown li a:hover {
            background-color: #f0f0f0;
        }
        .submenu {
            position: absolute;
            top: 0;
            left: 100%;
            background-color: white;
            min-width: 13.75rem;
            display: none;
            padding: 0.625rem 0;
            margin: 0;
            list-style: none;
            border-radius: 0.375rem;
            box-shadow: 0 0.25rem 0.5rem rgba(0, 0, 0, 0.15);
            z-index: 1000;
        }
        .submenu li a {
            display: block;
            padding: 0.75rem 1.25rem;
            color: #003087;
            text-decoration: none;
            font-weight: bold;
            white-space: nowrap;
            font-size: 0.8125rem;
        }
        .submenu li a:hover {
            background-color: #f0f0f0;
        }
        .navbar > li:hover > .dropdown {
            display: block;
        }
        .dropdown li:hover > .submenu {
            display: block;
        }

        /* News Item Styles */
        .news-item {
            display: flex;
            align-items: flex-start;
            margin-bottom: 1.25rem;
            background-color: white;
            padding: 0.9375rem;
            border-radius: 0.5rem;
            box-shadow: 0 0.125rem 0.25rem rgba(0,0,0,0.1);
            transition: box-shadow 0.2s;
        }
        .news-item:hover {
            box-shadow: 0 0.25rem 0.5rem rgba(0,0,0,0.15);
        }
        .news-item img {
            max-width: 12.5rem;
            height: auto;
            aspect-ratio: 4 / 3;
            object-fit: cover;
            border-radius: 0.3125rem;
            margin-right: 0.9375rem;
        }
        .news-item .content {
            flex: 1;
        }
        .news-item .content h3 {
            font-size: 1rem;
            font-weight: 700;
            margin: 0 0 0.5rem;
        }
        .news-item .content h3 a {
            color: #003087;
            text-decoration: none;
        }
        .news-item .content h3 a:hover {
            text-decoration: underline;
        }
        .news-item .content .date {
            color: #666;
            font-size: 0.75rem;
            margin-bottom: 0.5rem;
        }
        .news-item .content .summary {
            color: #333;
            font-size: 0.875rem;
            line-height: 1.5;
        }

        /* Recent News Sidebar Styles */
        .recent-news {
            background-color: white;
            padding: 0.9375rem;
            border-radius: 0.5rem;
            box-shadow: 0 0.125rem 0.25rem rgba(0,0,0,0.1);
        }
        .recent-news h4 {
            color: #003087;
            font-size: 1rem;
            font-weight: 700;
            margin-bottom: 0.9375rem;
            border-bottom: 0.125rem solid #003087;
            padding-bottom: 0.3125rem;
        }
        .recent-news ul {
            list-style: none;
            padding: 0;
        }
        .recent-news ul li {
            margin-bottom: 0.625rem;
        }
        .recent-news ul li a {
            color: #333;
            text-decoration: none;
            font-size: 0.8125rem;
            display: block;
            transition: color 0.2s;
        }
        .recent-news ul li a:hover {
            color: #003087;
        }

        /* Footer Styles */
        .footer {
            background-color: #004080;
            color: white;
            font-family: 'Roboto', Arial, sans-serif;
            padding: 1.25rem 0;
            width: 100%;
            box-sizing: border-box;
            text-align: center;
        }
        .footer-container {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 1.875rem;
            width: 100%;
            padding: 0 1rem;
        }
        .footer-col {
            flex: 1;
            min-width: 15.625rem;
            text-align: left;
        }
        .footer-col a {
            color: white;
            text-decoration: none;
        }
        .footer-col a:hover {
            color: #ccc;
            text-decoration: underline;
        }
        .footer-logo {
            width: 11.25rem;
            margin-bottom: 0.9375rem;
        }
        .footer-col h4 {
            margin-top: 0.9375rem;
            margin-bottom: 0.625rem;
            font-weight: bold;
            font-size: 0.875rem;
        }
        .footer-col p {
            margin: 0.375rem 0;
            font-size: 0.75rem;
        }
        .social-icons {
            display: flex;
            justify-content: center;
            gap: 0.75rem;
            margin-top: 0.625rem;
        }
        .social-icons a {
            color: inherit;
            text-decoration: none;
        }
        .social-icons i {
            font-size: 1.375rem; /* 22px */
            cursor: pointer;
            transition: transform 0.2s;
        }
        .social-icons a:hover i {
            transform: scale(1.2);
            color: #ccc;
        }
        .back-to-top {
            position: fixed;
            bottom: 1.25rem;
            right: 1.25rem;
            font-size: 2.25rem; /* 36px */
            color: #fff;
            background-color: #007bff;
            border-radius: 50%;
            width: 3rem;
            height: 3rem;
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 1000;
            transition: transform 0.2s, background-color 0.2s;
            text-decoration: none !important;
        }
        .back-to-top:hover {
            transform: scale(1.2);
            background-color: #fff;
            color: #007bff;
        }
        .footer-bottom {
            text-align: center;
            margin-top: 1.25rem;
            font-size: 0.75rem;
        }
        .footer-col iframe {
            width: 100%;
            max-width: 15.625rem;
            height: 9.375rem;
        }
    </style>
</head>
<body>
    <header>
        <div class="header-top">
            <img src="<%= request.getContextPath() %>/images/logo.png" alt="Logo HaUI">
            <h1>KHOA CÔNG NGHỆ THÔNG TIN</h1>
        </div>
        <ul class="navbar">
            <li><a href="https://www.haui.edu.vn/vn">TRANG HAUI</a></li>
            <li>
                <a href="#">GIỚI THIỆU <i class="bi bi-chevron-down ms-auto"></i></a>
                <ul class="dropdown">
                    <li><a href="#">THÔNG TIN CHUNG</a></li>
                    <li><a href="#">CƠ CẤU TỔ CHỨC</a></li>
                    <li><a href="#">CHIẾN LƯỢC PHÁT TRIỂN</a></li>
                    <li><a href="#">CÁN BỘ GIẢNG VIÊN</a></li>
                    <li><a href="#">CƠ SỞ VẬT CHẤT</a></li>
                    <li><a href="#">LIÊN HỆ</a></li>
                </ul>
            </li>
            <li>
                <a href="#">ĐÀO TẠO <i class="bi bi-chevron-down ms-auto"></i></a>
                <ul class="dropdown">
                    <li>
                        <a href="#">ĐẠI HỌC</a>
                        <ul class="submenu">
                            <li><a href="#">KHOA HỌC MÁY TÍNH</a></li>
                            <li><a href="#">KỸ THUẬT PHẦN MỀM</a></li>
                            <li><a href="#">HỆ THỐNG THÔNG TIN</a></li>
                            <li><a href="#">CÔNG NGHỆ THÔNG TIN</a></li>
                            <li><a href="#">CÔNG NGHỆ ĐA PHƯƠNG TIỆN</a></li>
                            <li><a href="#">AN TOÀN THÔNG TIN</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">SAU ĐẠI HỌC</a>
                        <ul class="submenu">
                            <li><a href="#">HỆ THỐNG THÔNG TIN</a></li>
                        </ul>
                    </li>
                    <li><a href="#">KẾ HOẠCH</a></li>
                    <li><a href="#">TIẾN ĐỘ</a></li>
                    <li><a href="#">QUY CHẾ, BIỂU MẪU</a></li>
                </ul>
            </li>
            <li>
                <a href="#">TUYỂN SINH <i class="bi bi-chevron-down ms-auto"></i></a>
                <ul class="dropdown">
                    <li><a href="#">ĐẠI HỌC</a></li>
                    <li><a href="#">SAU ĐẠI HỌC</a></li>
                </ul>
            </li>
            <li>
                <a href="#">KHOA <i class="bi bi-chevron-down ms-auto"></i></a>
                <ul class="dropdown">
                    <li><a href="#">KHOA CÔNG NGHỆ THÔNG TIN</a></li>
                    <li><a href="#">KHOA CÔNG NGHỆ PHẦN MỀM</a></li>
                    <li><a href="#">KHOA KHOA HỌC MÁY TÍNH</a></li>
                    <li><a href="#">KHOA MẠNG MÁY TÍNH VÀ TRUYỀN THÔNG</a></li>
                </ul>
            </li>
            <li>
                <a href="#">PHÒNG/TRUNG TÂM <i class="bi bi-chevron-down ms-auto"></i></a>
                <ul class="dropdown">
                    <li><a href="#">PHÒNG TỔNG HỢP</a></li>
                    <li><a href="#">TRUNG TÂM HỢP TÁC PHÁT TRIỂN</a></li>
                    <li><a href="#">TRUNG TÂM NGHIÊN CỨU CÔNG NGHỆ TIÊN TIẾN ICT</a></li>
                </ul>
            </li>
            <li>
                <a href="#">KHOA HỌC - CÔNG NGHỆ <i class="bi bi-chevron-down ms-auto"></i></a>
                <ul class="dropdown">
                    <li><a href="#">CÔNG TRÌNH CÔNG BỐ</a></li>
                    <li><a href="#">ĐỀ TÀI DỰ ÁN</a></li>
                    <li><a href="#">SINH VIÊN NCKH</a></li>
                    <li><a href="#">TIN KHCN</a></li>
                </ul>
            </li>
            <li><a href="#">THƯ VIỆN ẢNH</a></li>
        </ul>
    </header>

    <div class="container-fluid">
        <div class="row">
            <!-- Main News List -->
            <div class="col-md-8">
                <%
                    try (Connection conn = DatabaseConnection.getConnection()) {
                        String sql = "SELECT TOP 10 MaTinTuc, TieuDeTinTuc, TrichDanTin, NgayCapNhat, UrlAnh FROM TinTuc ORDER BY NgayCapNhat DESC";
                        PreparedStatement stmt = conn.prepareStatement(sql);
                        ResultSet rs = stmt.executeQuery();
                        while (rs.next()) {
                            int maTinTuc = rs.getInt("MaTinTuc");
                            String tieuDe = rs.getString("TieuDeTinTuc");
                            String trichDan = rs.getString("TrichDanTin");
                            String ngayCapNhat = rs.getTimestamp("NgayCapNhat") != null ? rs.getTimestamp("NgayCapNhat").toString() : "";
                            String urlAnh = rs.getString("UrlAnh");
                            String slug = tieuDe.toLowerCase().replaceAll("\\s+", "-").replaceAll("[^a-z0-9-]", "");
                %>
                <div class="news-item">
                    <% if (urlAnh != null && !urlAnh.isEmpty()) { %>
                        <img src="<%= urlAnh %>" alt="News Image">
                    <% } else { %>
                        <img src="https://via.placeholder.com/200x150" alt="Default Image">
                    <% } %>
                    <div class="content">
                        <h3><a href="tin-tuc/<%= slug %>/<%= maTinTuc %>"><%= tieuDe %></a></h3>
                        <div class="date"><%= ngayCapNhat %></div>
                        <div class="summary"><%= trichDan %></div>
                    </div>
                </div>
                <%
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                        out.println("<p class='text-danger'>Lỗi khi tải danh sách tin tức: " + e.getMessage() + "</p>");
                    }
                %>
            </div>
            <!-- Recent News Sidebar -->
            <div class="col-md-4">
                <div class="recent-news">
                    <h4>Tin Tiêu Điểm</h4>
                    <ul>
                        <%
                            try (Connection conn = DatabaseConnection.getConnection()) {
                                String sql = "SELECT TOP 5 MaTinTuc, TieuDeTinTuc FROM TinTuc ORDER BY NgayCapNhat DESC";
                                PreparedStatement stmt = conn.prepareStatement(sql);
                                ResultSet rs = stmt.executeQuery();
                                while (rs.next()) {
                                    int maTinTuc = rs.getInt("MaTinTuc");
                                    String tieuDe = rs.getString("TieuDeTinTuc");
                                    String slug = tieuDe.toLowerCase().replaceAll("\\s+", "-").replaceAll("[^a-z0-9-]", "");
                        %>
                        <li><a href="tin-tuc/<%= slug %>/<%= maTinTuc %>"><%= tieuDe %></a></li>
                        <%
                                }
                            } catch (SQLException e) {
                                e.printStackTrace();
                                out.println("<p class='text-danger'>Lỗi khi tải tin tức gần đây: " + e.getMessage() + "</p>");
                            }
                        %>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <footer class="footer">
        <div class="footer-container">
            <div class="footer-col">
                <img src="<%= request.getContextPath() %>/images/logo.png" alt="HaUI Logo" class="footer-logo">
                <h4>THÔNG TIN LIÊN HỆ</h4>
                <p><i class="bi bi-geo-alt-fill"></i> Tầng 12, Nhà A1</p>
                <p><i class="bi bi-geo-alt"></i> Số 298 đường Cầu Diễn, quận Bắc Từ Liêm, Hà Nội</p>
                <p><i class="bi bi-envelope"></i> Email: sict@haui.edu.vn</p>
            </div>
            <div class="footer-col">
                <h4>THÔNG TIN</h4>
                <p><a href="#">> Liên hệ</a></p>
                <p><a href="#">> Sơ đồ trường</a></p>
                <h4>MẠNG XÃ HỘI</h4>
                <div class="social-icons">
                    <a href="https://web.facebook.com/DHCNHNofficial" target="_blank"><i class="bi bi-facebook"></i></a>
                    <a href="https://www.youtube.com/@HaUITV" target="_blank"><i class="bi bi-youtube"></i></a>
                    <a href="https://web.facebook.com/messages/t/200315546493808" target="_blank"><i class="bi bi-messenger"></i></a>
                    <a href="https://www.tiktok.com/@fitmedia.haui" target="_blank"><i class="bi bi-tiktok"></i></a>
                </div>
            </div>
            <div class="footer-col">
                <h4>BẢN ĐỒ CHỈ DẪN</h4>
                <iframe
                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.607123306446!2d105.7296514750296!3d21.01101108063321!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ab45780ff4cf%3A0x385fda93d8b3ecb3!2zSOG6o2kgxJDDtG5nIE5naGnhu4dwIEjDoCBO4buZaQ!5e0!3m2!1svi!2s!4v1715071600000!5m2!1svi!2s"
                    style="border:0;" allowfullscreen="" loading="lazy">
                </iframe>
            </div>
        </div>
        <div class="footer-bottom">
            <p>Copyright © 2025 School Of Information And Communications Technology</p>
        </div>
        <a href="#" class="back-to-top">
            <i class="bi bi-arrow-up-circle-fill"></i>
        </a>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.querySelector('.back-to-top').addEventListener('click', function(e) {
            e.preventDefault();
            window.scrollTo({ top: 0, behavior: 'smooth' });
        });
    </script>
</body>
</html>