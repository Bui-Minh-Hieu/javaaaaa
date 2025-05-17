package Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.DatabaseConnection;
import model.TinTuc;

@WebServlet("/xem-tuyen-sinh-sau-dai-hoc")
public class XemTuyenSinhSauDaiHocServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        TinTuc news = null;
        String maTinTuc = request.getParameter("matintuc");

        if (maTinTuc == null || maTinTuc.trim().isEmpty()) {
            request.setAttribute("error", "Mã tin tức không hợp lệ.");
        } else {
            try (Connection conn = DatabaseConnection.getConnection();
                 PreparedStatement stmt = conn.prepareStatement(
                         "SELECT MaTinTuc, TieuDeTinTuc, TrichDanTin, NoiDungTin, NgayCapNhat, UrlAnh, SoLanDoc, Tag " +
                         "FROM TinTuc WHERE MaTinTuc = ? AND MaTheLoai = ? AND MaTheLoaiTin = ?")) {
                stmt.setInt(1, Integer.parseInt(maTinTuc));
                stmt.setInt(2, 5); // MaTheLoai = 5 (TUYỂN SINH)
                stmt.setInt(3, 13); // MaTheLoaiTin = 13 (SAU ĐẠI HỌC)
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
                    Timestamp timestamp = rs.getTimestamp("NgayCapNhat");
                    if (timestamp != null) {
                        news.setNgayCapNhat(timestamp.toLocalDateTime());
                    }
                    news.setUrlAnh(rs.getString("UrlAnh"));
                    news.setSoLanDoc(rs.getInt("SoLanDoc"));
                    news.setTag(rs.getString("Tag"));
                } else {
                    request.setAttribute("error", "Không tìm thấy tin tức với mã: " + maTinTuc);
                }
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("error", "Lỗi khi tải dữ liệu tin tức: " + e.getMessage());
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Mã tin tức không hợp lệ: " + maTinTuc);
            }
        }

        request.setAttribute("news", news);
        request.getRequestDispatcher("/XemTuyenSinhSauDaiHoc.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}