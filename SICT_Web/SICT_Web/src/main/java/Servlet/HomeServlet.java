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

   @WebServlet("/trang-chu")
   public class HomeServlet extends HttpServlet {
       @Override
       protected void doGet(HttpServletRequest request, HttpServletResponse response)
               throws ServletException, IOException {
           response.setCharacterEncoding("UTF-8");
           request.setCharacterEncoding("UTF-8");

           List<TinTuc> newsList = new ArrayList<>();
           List<TinTuc> clubList = new ArrayList<>();
           List<TinTuc> studentList = new ArrayList<>();
           List<TinTuc> notificationList = new ArrayList<>();

           // Truy vấn tin tức (MaTheLoai = 10)
           try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement stmtNews = conn.prepareStatement(
                        "SELECT TOP 3 MaTinTuc, TieuDeTinTuc, TrichDanTin, NgayCapNhat, UrlAnh FROM TinTuc WHERE MaTheLoai = 10 ORDER BY NgayCapNhat DESC");
                ResultSet rsNews = stmtNews.executeQuery()) {

               while (rsNews.next()) {
                   TinTuc news = new TinTuc();
                   news.setMaTinTuc(rsNews.getInt("MaTinTuc"));
                   news.setTieuDeTinTuc(rsNews.getString("TieuDeTinTuc"));
                   news.setTrichDanTin(rsNews.getString("TrichDanTin"));
                   Timestamp timestamp = rsNews.getTimestamp("NgayCapNhat");
                   if (timestamp != null) {
                       news.setNgayCapNhat(timestamp.toLocalDateTime());
                   }
                   news.setUrlAnh(rsNews.getString("UrlAnh"));
                   newsList.add(news);
               }
               System.out.println("Số lượng tin tức lấy được: " + newsList.size());
               if (newsList.isEmpty()) {
                   request.setAttribute("error", "Không có tin tức nào với MaTheLoai = 10.");
               }
           } catch (SQLException e) {
               e.printStackTrace();
               request.setAttribute("error", "Lỗi khi tải dữ liệu tin tức: " + e.getMessage());
           }

           // Truy vấn câu lạc bộ (MaTheLoai = 15)
           try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement stmtClubs = conn.prepareStatement(
                        "SELECT TOP 3 MaTinTuc, TieuDeTinTuc, TrichDanTin, NgayCapNhat, UrlAnh FROM TinTuc WHERE MaTheLoai = 15 ORDER BY NgayCapNhat DESC");
                ResultSet rsClubs = stmtClubs.executeQuery()) {

               while (rsClubs.next()) {
                   TinTuc club = new TinTuc();
                   club.setMaTinTuc(rsClubs.getInt("MaTinTuc"));
                   club.setTieuDeTinTuc(rsClubs.getString("TieuDeTinTuc"));
                   club.setTrichDanTin(rsClubs.getString("TrichDanTin"));
                   Timestamp timestamp = rsClubs.getTimestamp("NgayCapNhat");
                   if (timestamp != null) {
                       club.setNgayCapNhat(timestamp.toLocalDateTime());
                   }
                   club.setUrlAnh(rsClubs.getString("UrlAnh"));
                   clubList.add(club);
               }
               System.out.println("Số lượng tin tức lấy được: " + clubList.size());
               if (clubList.isEmpty()) {
                   request.setAttribute("error", "Không có tin tức nào với MaTheLoai = 15.");
               }
           } catch (SQLException e) {
               e.printStackTrace();
               request.setAttribute("error", "Lỗi khi tải dữ liệu câu lạc bộ: " + e.getMessage());
           }

           // Truy vấn gương sáng sinh viên (MaTheLoai = 16)
           try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement stmtStudents = conn.prepareStatement(
                        "SELECT TOP 3 MaTinTuc, TieuDeTinTuc, TrichDanTin, NgayCapNhat, UrlAnh FROM TinTuc WHERE MaTheLoai = 16 ORDER BY NgayCapNhat DESC");
                ResultSet rsStudents = stmtStudents.executeQuery()) {

               while (rsStudents.next()) {
                   TinTuc student = new TinTuc();
                   student.setMaTinTuc(rsStudents.getInt("MaTinTuc"));
                   student.setTieuDeTinTuc(rsStudents.getString("TieuDeTinTuc"));
                   student.setTrichDanTin(rsStudents.getString("TrichDanTin"));
                   Timestamp timestamp = rsStudents.getTimestamp("NgayCapNhat");
                   if (timestamp != null) {
                       student.setNgayCapNhat(timestamp.toLocalDateTime());
                   }
                   student.setUrlAnh(rsStudents.getString("UrlAnh"));
                   studentList.add(student);
               }
               System.out.println("Số lượng tin tức lấy được: " + studentList.size());
               if (studentList.isEmpty()) {
                   request.setAttribute("error", "Không có tin tức nào với MaTheLoai = 16.");
               }
           } catch (SQLException e) {
               e.printStackTrace();
               request.setAttribute("error", "Lỗi khi tải dữ liệu gương sáng sinh viên: " + e.getMessage());
           }

           // Truy vấn thông báo (MaTheLoai = 11)
           try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement stmtNotifications = conn.prepareStatement(
                        "SELECT TOP 3 MaTinTuc, TieuDeTinTuc, TrichDanTin, NgayCapNhat, UrlAnh FROM TinTuc WHERE MaTheLoai = 11 ORDER BY NgayCapNhat DESC");
                ResultSet rsNotifications = stmtNotifications.executeQuery()) {

               while (rsNotifications.next()) {
                   TinTuc notification = new TinTuc();
                   notification.setMaTinTuc(rsNotifications.getInt("MaTinTuc"));
                   notification.setTieuDeTinTuc(rsNotifications.getString("TieuDeTinTuc"));
                   notification.setTrichDanTin(rsNotifications.getString("TrichDanTin"));
                   Timestamp timestamp = rsNotifications.getTimestamp("NgayCapNhat");
                   if (timestamp != null) {
                       notification.setNgayCapNhat(timestamp.toLocalDateTime());
                   }
                   notification.setUrlAnh(rsNotifications.getString("UrlAnh"));
                   notificationList.add(notification);
               }
           } catch (SQLException e) {
               e.printStackTrace();
               request.setAttribute("error", "Lỗi khi tải dữ liệu thông báo: " + e.getMessage());
           }

           request.setAttribute("newsList", newsList);
           request.setAttribute("clubList", clubList);
           request.setAttribute("studentList", studentList);
           request.setAttribute("notificationList", notificationList);

           request.getRequestDispatcher("/index.jsp").forward(request, response);
       }

       @Override
       protected void doPost(HttpServletRequest request, HttpServletResponse response)
               throws ServletException, IOException {
           doGet(request, response);
       }
   }