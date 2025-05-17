package Servlet;

  import java.io.IOException;
  import java.sql.Connection;
  import java.sql.PreparedStatement;
  import java.sql.ResultSet;
  import java.sql.SQLException;
  import java.sql.Timestamp;
  import java.time.LocalDateTime;

  import javax.servlet.ServletException;
  import javax.servlet.annotation.WebServlet;
  import javax.servlet.http.HttpServlet;
  import javax.servlet.http.HttpServletRequest;
  import javax.servlet.http.HttpServletResponse;

  import connection.DatabaseConnection;
  import model.TinTuc;

  @WebServlet("/xem-tin-tuc")
  public class XemTinTucServlet extends HttpServlet {
      @Override
      protected void doGet(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException {
          System.out.println("XemTinTucServlet được gọi với URL: " + request.getRequestURI());
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
                           "SELECT MaTinTuc, TieuDeTinTuc, TrichDanTin, NoiDungTin, NgayCapNhat, UrlAnh, SoLanDoc, Tag FROM TinTuc WHERE MaTinTuc = ?")) {
                  stmt.setInt(1, Integer.parseInt(maTinTuc));
                  ResultSet rs = stmt.executeQuery();

                  if (rs.next()) {
                      news = new TinTuc();
                      news.setMaTinTuc(rs.getInt("MaTinTuc"));
                      news.setTieuDeTinTuc(rs.getString("TieuDeTinTuc"));
                      news.setTrichDanTin(rs.getString("TrichDanTin"));
                      String noiDungTin = rs.getString("NoiDungTin");
                      // Chuyển đổi \n thành <br> để hiển thị các đoạn tách biệt
                      if (noiDungTin != null) {
                          noiDungTin = noiDungTin.replace("\n", "<br>");
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
          request.getRequestDispatcher("/XemTinTuc.jsp").forward(request, response);
      }

      @Override
      protected void doPost(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException {
          doGet(request, response);
      }
  }