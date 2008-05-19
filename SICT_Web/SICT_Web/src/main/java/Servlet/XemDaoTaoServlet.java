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

@WebServlet("/dao_tao")
public class XemDaoTaoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        TinTuc news = null;
        String category = request.getParameter("cat");
        int maTheLoaiTin = 25; // Default to "KHOA HỌC MÁY TÍNH"
        String categoryName = "Khoa học Máy tính";

        // Map category parameter to MaTheLoaiTin and category name
        if ("khoa_hoc_may_tinh".equals(category)) {
            maTheLoaiTin = 25;
            categoryName = "Khoa học Máy tính";
        } else if ("ky_thuat_phan_mem".equals(category)) {
            maTheLoaiTin = 26;
            categoryName = "Kỹ thuật Phần mềm";
        } else if ("he_thong_thong_tin".equals(category)) {
            maTheLoaiTin = 27;
            categoryName = "Hệ thống Thông tin";
        } else if ("cong_nghe_thong_tin".equals(category)) {
            maTheLoaiTin = 28;
            categoryName = "Công nghệ Thông tin";
        } else if ("cong_nghe_da_phuong_tien".equals(category)) {
            maTheLoaiTin = 29;
            categoryName = "Công nghệ Đa phương tiện";
        } else if ("an_toan_thong_tin".equals(category)) {
            maTheLoaiTin = 30;
            categoryName = "An toàn Thông tin";
        } else if ("sau_he_thong_thong_tin".equals(category)) {
            maTheLoaiTin = 31;
            categoryName = "Hệ thống Thông tin - Sau Đại học";
        } else if ("quy_che_bieu_mau".equals(category)) {
            maTheLoaiTin = 11;
            categoryName = "Quy chế và Biểu mẫu";
        }

        Connection conn = null;
        try {
            conn = DatabaseConnection.getConnection();
            conn.setAutoCommit(false);

            // Update view count
            String updateSql = "UPDATE TinTuc SET SoLanDoc = SoLanDoc + 1 WHERE MaTheLoaiTin = ? AND MaTheLoai = ?";
            try (PreparedStatement updateStmt = conn.prepareStatement(updateSql)) {
                updateStmt.setInt(1, maTheLoaiTin);
                updateStmt.setInt(2, 4); // MaTheLoai for "ĐÀO TẠO"
                updateStmt.executeUpdate();
            }

            // Fetch data after updating
            String selectSql = "SELECT MaTinTuc, TieuDeTinTuc, TrichDanTin, NoiDungTin, NgayCapNhat, UrlAnh, SoLanDoc, Tag, MaTheLoai, MaTheLoaiTin, MaPhanLoaiTin, MaThanhVien " +
                             "FROM TinTuc WHERE MaTheLoaiTin = ? AND MaTheLoai = ?";
            try (PreparedStatement stmt = conn.prepareStatement(selectSql)) {
                stmt.setInt(1, maTheLoaiTin);
                stmt.setInt(2, 4); // MaTheLoai for "ĐÀO TẠO"
                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    news = new TinTuc();
                    news.setMaTinTuc(rs.getInt("MaTinTuc"));
                    news.setTieuDeTinTuc(rs.getString("TieuDeTinTuc"));
                    news.setTrichDanTin(rs.getString("TrichDanTin"));
                    String noiDungTin = rs.getString("NoiDungTin");
                    if (noiDungTin != null) {
                        noiDungTin = noiDungTin.replace("\\n", "\n");
                        noiDungTin = noiDungTin.replaceAll("\r\n|\n|\r", "<br>");
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
                    request.setAttribute("error", "Không tìm thấy thông tin cho: " + categoryName);
                }
            }

            conn.commit();
        } catch (SQLException e) {
            e.printStackTrace();
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            request.setAttribute("error", "Lỗi khi tải dữ liệu: " + e.getMessage());
        } finally {
            if (conn != null) {
                try {
                    conn.setAutoCommit(true);
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        request.setAttribute("news", news);
        request.setAttribute("categoryName", categoryName);
        request.getRequestDispatcher("/dao_tao.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}