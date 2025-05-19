package Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.DatabaseConnection;
import model.TinTuc;

@WebServlet("/tim-kiem")
public class TimKiemTinTucServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        // Lấy tham số query từ yêu cầu
        String query = request.getParameter("query");
        List<TinTuc> searchResults = new ArrayList<>();

        // Nếu query rỗng hoặc null, trả về danh sách rỗng hoặc có thể hiển thị thông báo
        if (query == null || query.trim().isEmpty()) {
            request.setAttribute("error", "Vui lòng nhập từ khóa tìm kiếm.");
        } else {
            try (Connection conn = DatabaseConnection.getConnection();
                 PreparedStatement stmt = conn.prepareStatement(
                         "SELECT MaTinTuc, TieuDeTinTuc, TrichDanTin, NgayCapNhat, UrlAnh, SoLanDoc, Tag " +
                         "FROM TinTuc " +
                         "WHERE MaTheLoai = 10 AND (TieuDeTinTuc LIKE ? OR TrichDanTin LIKE ?) " +
                         "ORDER BY NgayCapNhat DESC")) {

                // Thêm % để tìm kiếm gần đúng (LIKE)
                String searchPattern = "%" + query + "%";
                stmt.setString(1, searchPattern);
                stmt.setString(2, searchPattern);

                try (ResultSet rs = stmt.executeQuery()) {
                    while (rs.next()) {
                        TinTuc news = new TinTuc();
                        news.setMaTinTuc(rs.getInt("MaTinTuc"));
                        news.setTieuDeTinTuc(rs.getString("TieuDeTinTuc"));
                        news.setTrichDanTin(rs.getString("TrichDanTin"));
                        Timestamp timestamp = rs.getTimestamp("NgayCapNhat");
                        if (timestamp != null) {
                            news.setNgayCapNhat(timestamp.toLocalDateTime());
                        }
                        news.setUrlAnh(rs.getString("UrlAnh"));
                        news.setSoLanDoc(rs.getInt("SoLanDoc"));
                        news.setTag(rs.getString("Tag"));
                        searchResults.add(news);
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("error", "Lỗi khi tìm kiếm: " + e.getMessage());
            }
        }

        // Gửi kết quả tìm kiếm về TinTuc.jsp
        request.setAttribute("newsList", searchResults);
        request.getRequestDispatcher("/TinTuc.jsp").forward(request, response);
    }
}