package Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.DatabaseConnection;
import model.TinTuc;

@WebServlet("/phong_trungtam")
public class XemPhongTrungTamServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        TinTuc news = null;
        String category = request.getParameter("cat");
        int maTheLoaiTin = 18; // Default to "Phòng Tổng hợp"
        String categoryName = "Phòng Tổng hợp";

        // Map category parameter to MaTheLoaiTin and category name
        if ("tong_hop".equals(category)) {
            maTheLoaiTin = 18; // Correct MaTheLoaiTin for "Phòng Tổng hợp"
            categoryName = "Phòng Tổng hợp";
        } else if ("hop_tac_phat_trien".equals(category)) {
            maTheLoaiTin = 19; // Correct MaTheLoaiTin for "Trung tâm Hợp tác Phát triển"
            categoryName = "Trung tâm Hợp tác Phát triển";
        } else if ("nghien_cuu_ict".equals(category)) {
            maTheLoaiTin = 20; // Correct MaTheLoaiTin for "Trung tâm Nghiên cứu Công nghệ Tiên tiến ICT"
            categoryName = "Trung tâm Nghiên cứu Công nghệ Tiên tiến ICT";
        }

        Connection conn = null;
        try {
            conn = DatabaseConnection.getConnection();

            // Bắt đầu giao dịch để cập nhật SoLanDoc
            conn.setAutoCommit(false);

            // Cập nhật số lượt xem
            String updateSql = "UPDATE TinTuc SET SoLanDoc = SoLanDoc + 1 WHERE MaTheLoaiTin = ? AND MaTheLoai = ?";
            try (PreparedStatement updateStmt = conn.prepareStatement(updateSql)) {
                updateStmt.setInt(1, maTheLoaiTin);
                updateStmt.setInt(2, 7); // MaTheLoai for "PHÒNG/TRUNG TÂM"
                updateStmt.executeUpdate();
            }

            // Lấy dữ liệu sau khi cập nhật
            String selectSql = "SELECT MaTinTuc, TieuDeTinTuc, TrichDanTin, NoiDungTin, NgayCapNhat, UrlAnh, SoLanDoc, Tag, MaTheLoai, MaTheLoaiTin, MaPhanLoaiTin, MaThanhVien " +
                             "FROM TinTuc WHERE MaTheLoaiTin = ? AND MaTheLoai = ?";
            try (PreparedStatement stmt = conn.prepareStatement(selectSql)) {
                stmt.setInt(1, maTheLoaiTin);
                stmt.setInt(2, 7); // MaTheLoai for "PHÒNG/TRUNG TÂM"
                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    news = new TinTuc();
                    news.setMaTinTuc(rs.getInt("MaTinTuc"));
                    news.setTieuDeTinTuc(rs.getString("TieuDeTinTuc"));
                    news.setTrichDanTin(rs.getString("TrichDanTin"));
                    String noiDungTin = rs.getString("NoiDungTin");
                    if (noiDungTin != null) {
                        String original = noiDungTin;
                        // Replace literal "\n" with actual newline
                        noiDungTin = noiDungTin.replace("\\n", "\n");
                        // Replace actual newlines with <br> for HTML
                        noiDungTin = noiDungTin.replaceAll("\r\n|\n|\r", "<br>");
                        System.out.println("Original NoiDungTin: " + original);
                        System.out.println("Processed NoiDungTin: " + noiDungTin);
                    }
                    news.setNoiDungTin(noiDungTin);
                    news.setNgayCapNhat(rs.getTimestamp("NgayCapNhat").toLocalDateTime());
                    news.setUrlAnh(rs.getString("UrlAnh"));
                    news.setSoLanDoc(rs.getInt("SoLanDoc"));
                    news.setTag(rs.getString("Tag"));
                    news.setMaTheLoai(rs.getInt("MaTheLoai"));
                    news.setMaTheLoaiTin(rs.getInt("MaTheLoaiTin"));
                    news.setMaPhanLoaiTin(rs.getInt("MaPhanLoaiTin"));
                    news.setMaThanhVien(rs.getInt("MaThanhVien"));
                } else {
                    System.out.println("No record found for MaTheLoaiTin: " + maTheLoaiTin + " and MaTheLoai: 7");
                    request.setAttribute("error", "Không tìm thấy thông tin cho: " + categoryName);
                }
            }

            // Commit giao dịch
            conn.commit();
        } catch (SQLException e) {
            e.printStackTrace();
            if (conn != null) {
                try {
                    conn.rollback(); // Rollback nếu có lỗi
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            request.setAttribute("error", "Lỗi khi tải dữ liệu: " + e.getMessage());
        } finally {
            if (conn != null) {
                try {
                    conn.setAutoCommit(true); // Khôi phục auto-commit
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        request.setAttribute("news", news);
        request.setAttribute("categoryName", categoryName);
        request.getRequestDispatcher("/phong_trungtam.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}