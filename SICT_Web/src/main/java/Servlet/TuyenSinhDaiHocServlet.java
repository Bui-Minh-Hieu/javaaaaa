package Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.DatabaseConnection;
import model.TinTuc;

@WebServlet("/tuyen-sinh-dai-hoc")
public class TuyenSinhDaiHocServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        List<TinTuc> newsList = new ArrayList<>();

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(
                     "SELECT MaTinTuc, TieuDeTinTuc, TrichDanTin, NgayCapNhat, UrlAnh, SoLanDoc, Tag " +
                     "FROM TinTuc WHERE MaTheLoai = ? AND MaTheLoaiTin = ? ORDER BY NgayCapNhat DESC")) {
            stmt.setInt(1, 5); // MaTheLoai = 5 (TUYỂN SINH)
            stmt.setInt(2, 12); // MaTheLoaiTin = 12 (ĐẠI HỌC)
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                TinTuc news = new TinTuc();
                news.setMaTinTuc(rs.getInt("MaTinTuc"));
                news.setTieuDeTinTuc(rs.getString("TieuDeTinTuc"));
                String trichDanTin = rs.getString("TrichDanTin");
                if (trichDanTin != null) {
                    String original = trichDanTin;
                    // Replace literal "\n" with actual newline
                    trichDanTin = trichDanTin.replace("\\n", "\n");
                    // Replace actual newlines with <br> for HTML
                    trichDanTin = trichDanTin.replaceAll("\r\n|\n|\r", "<br>");
                }
                news.setTrichDanTin(trichDanTin);
                Timestamp timestamp = rs.getTimestamp("NgayCapNhat");
                if (timestamp != null) {
                    news.setNgayCapNhat(timestamp.toLocalDateTime());
                }
                news.setUrlAnh(rs.getString("UrlAnh"));
                news.setSoLanDoc(rs.getInt("SoLanDoc"));
                news.setTag(rs.getString("Tag"));
                newsList.add(news);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi khi tải dữ liệu: " + e.getMessage());
        }

        request.setAttribute("newsList", newsList);
        request.getRequestDispatcher("/TuyenSinhDaiHoc.jsp").forward(request, response);
    }
}