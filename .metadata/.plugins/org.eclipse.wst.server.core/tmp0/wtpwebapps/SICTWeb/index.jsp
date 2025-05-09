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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SICT News</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            background-color: #f5f5f5;
        }
        .header {
            background-color: #003087;
            color: white;
            padding: 15px 0;
            text-align: center;
            margin-bottom: 20px;
        }
        .news-item {
            display: flex;
            margin-bottom: 20px;
            background-color: white;
            padding: 15px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .news-item img {
            width: 200px;
            height: 150px;
            object-fit: cover;
            margin-right: 15px;
            border-radius: 5px;
        }
        .news-item .content {
            flex: 1;
        }
        .news-item .content h3 {
            font-size: 1.5em;
            margin: 0 0 10px;
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
            font-size: 0.9em;
            margin-bottom: 10px;
        }
        .news-item .content .summary {
            color: #333;
            line-height: 1.6;
        }
        .recent-news {
            background-color: white;
            padding: 15px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .recent-news h4 {
            color: #003087;
            font-size: 1.2em;
            margin-bottom: 15px;
        }
        .recent-news ul {
            list-style: none;
            padding: 0;
        }
        .recent-news ul li {
            margin-bottom: 10px;
        }
        .recent-news ul li a {
            color: #333;
            text-decoration: none;
            font-size: 0.95em;
        }
        .recent-news ul li a:hover {
            color: #003087;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>SICT News</h1>
    </div>
    <div class="container">
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
                    <h4>Tin Tức Gần Đây</h4>
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>