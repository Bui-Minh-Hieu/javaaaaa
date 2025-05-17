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

@WebServlet("/khoa")
public class KhoaServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        TinTuc news = null;
        String category = request.getParameter("cat");
        int maTheLoaiTin = 1; // Default to "Khoa Công nghệ Thông tin"
        String categoryName = "Khoa Công nghệ Thông tin";

        // Map category parameter to MaTheLoaiTin and category name
        if ("cong_nghe_thong_tin".equals(category)) {
            maTheLoaiTin = 1;
            categoryName = "Khoa Công nghệ Thông tin";
        } else if ("cong_nghe_phan_mem".equals(category)) {
            maTheLoaiTin = 2;
            categoryName = "Khoa Công nghệ Phần mềm";
        } else if ("khoa_hoc_may_tinh".equals(category)) {
            maTheLoaiTin = 3;
            categoryName = "Khoa Khoa học Máy tính";
        } else if ("mang_may_tinh".equals(category)) {
            maTheLoaiTin = 4;
            categoryName = "Khoa Mạng Máy tính và Truyền thông";
        }

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(
                     "SELECT MaTinTuc, TieuDeTinTuc, TrichDanTin, NoiDungTin, NgayCapNhat, UrlAnh, SoLanDoc, Tag, MaTheLoai, MaTheLoaiTin, MaPhanLoaiTin, MaThanhVien " +
                     "FROM TinTuc WHERE MaTheLoaiTin = ? AND MaTheLoai = ?")) {
            stmt.setInt(1, maTheLoaiTin);
            stmt.setInt(2, 4); // MaTheLoai for "KHOA"
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
                System.out.println("No record found for MaTheLoaiTin: " + maTheLoaiTin + " and MaTheLoai: 4");
                request.setAttribute("error", "Không tìm thấy thông tin cho: " + categoryName);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi khi tải dữ liệu: " + e.getMessage());
        }

        request.setAttribute("news", news);
        request.setAttribute("categoryName", categoryName);
        request.getRequestDispatcher("/khoa.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}