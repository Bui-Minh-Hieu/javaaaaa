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

@WebServlet("/xem-guong-sang-sv")
public class XemGuongSangSVServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        TinTuc student = null;
        String maTinTuc = request.getParameter("matintuc");

        if (maTinTuc == null || maTinTuc.trim().isEmpty()) {
            request.setAttribute("error", "Mã tin tức không hợp lệ.");
        } else {
            try (Connection conn = DatabaseConnection.getConnection();
                 PreparedStatement stmt = conn.prepareStatement(
                         "SELECT MaTinTuc, TieuDeTinTuc, TrichDanTin, NoiDungTin, NgayCapNhat, UrlAnh, SoLanDoc, Tag FROM TinTuc WHERE MaTinTuc = ? AND MaTheLoai = 16")) {
                stmt.setInt(1, Integer.parseInt(maTinTuc));
                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    student = new TinTuc();
                    student.setMaTinTuc(rs.getInt("MaTinTuc"));
                    student.setTieuDeTinTuc(rs.getString("TieuDeTinTuc"));
                    student.setTrichDanTin(rs.getString("TrichDanTin"));
                    String noiDungTin = rs.getString("NoiDungTin");
                    if (noiDungTin != null) {
                        noiDungTin = noiDungTin.replace("\n", "<br>");
                    }
                    student.setNoiDungTin(noiDungTin);
                    Timestamp timestamp = rs.getTimestamp("NgayCapNhat");
                    if (timestamp != null) {
                        student.setNgayCapNhat(timestamp.toLocalDateTime());
                    }
                    student.setUrlAnh(rs.getString("UrlAnh"));
                    student.setSoLanDoc(rs.getInt("SoLanDoc"));
                    student.setTag(rs.getString("Tag"));
                } else {
                    request.setAttribute("error", "Không tìm thấy gương sáng sinh viên với mã: " + maTinTuc);
                }
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("error", "Lỗi khi tải dữ liệu: " + e.getMessage());
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Mã tin tức không hợp lệ: " + maTinTuc);
            }
        }

        request.setAttribute("student", student); 
        request.getRequestDispatcher("/XemGuongSangSV.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}