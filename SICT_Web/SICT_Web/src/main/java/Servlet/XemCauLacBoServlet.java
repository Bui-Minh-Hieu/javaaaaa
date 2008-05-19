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

@WebServlet("/xem-cau-lac-bo")
public class XemCauLacBoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        TinTuc club = null;
        String maTinTuc = request.getParameter("matintuc");

        Connection conn = null;
        if (maTinTuc == null || maTinTuc.trim().isEmpty()) {
            request.setAttribute("error", "Mã tin tức không hợp lệ.");
        } else {
            try {
                conn = DatabaseConnection.getConnection();
                conn.setAutoCommit(false);

                // Cập nhật số lượt xem
                String updateSql = "UPDATE TinTuc SET SoLanDoc = SoLanDoc + 1 WHERE MaTinTuc = ? AND MaTheLoai = 15";
                try (PreparedStatement updateStmt = conn.prepareStatement(updateSql)) {
                    updateStmt.setInt(1, Integer.parseInt(maTinTuc));
                    updateStmt.executeUpdate();
                }

                // Lấy dữ liệu sau khi cập nhật
                String selectSql = "SELECT MaTinTuc, TieuDeTinTuc, TrichDanTin, NoiDungTin, NgayCapNhat, UrlAnh, SoLanDoc, Tag FROM TinTuc WHERE MaTinTuc = ? AND MaTheLoai = 15";
                try (PreparedStatement stmt = conn.prepareStatement(selectSql)) {
                    stmt.setInt(1, Integer.parseInt(maTinTuc));
                    ResultSet rs = stmt.executeQuery();

                    if (rs.next()) {
                        club = new TinTuc();
                        club.setMaTinTuc(rs.getInt("MaTinTuc"));
                        club.setTieuDeTinTuc(rs.getString("TieuDeTinTuc"));
                        club.setTrichDanTin(rs.getString("TrichDanTin"));
                        String noiDungTin = rs.getString("NoiDungTin");
                        if (noiDungTin != null) {
                            noiDungTin = noiDungTin.replace("\n", "<br>");
                        }
                        club.setNoiDungTin(noiDungTin);
                        Timestamp timestamp = rs.getTimestamp("NgayCapNhat");
                        if (timestamp != null) {
                            club.setNgayCapNhat(timestamp.toLocalDateTime());
                        }
                        club.setUrlAnh(rs.getString("UrlAnh"));
                        club.setSoLanDoc(rs.getInt("SoLanDoc"));
                        club.setTag(rs.getString("Tag"));
                    } else {
                        request.setAttribute("error", "Không tìm thấy câu lạc bộ với mã: " + maTinTuc);
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
                request.setAttribute("error", "Lỗi khi tải dữ liệu câu lạc bộ: " + e.getMessage());
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Mã tin tức không hợp lệ: " + maTinTuc);
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
        }

        request.setAttribute("club", club);
        request.getRequestDispatcher("/XemCauLacBo.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}