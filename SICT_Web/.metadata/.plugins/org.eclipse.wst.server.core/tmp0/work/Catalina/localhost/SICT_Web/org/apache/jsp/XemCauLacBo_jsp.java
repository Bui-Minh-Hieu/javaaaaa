/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.104
 * Generated at: 2025-05-14 14:56:02 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import vn.connection.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public final class XemCauLacBo_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/footer.jsp", Long.valueOf(1746967890293L));
    _jspx_dependants.put("/header.jsp", Long.valueOf(1746967890295L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.LinkedHashSet<>(4);
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.LinkedHashSet<>(10);
    _jspx_imports_classes.add("vn.connection.DatabaseConnection");
    _jspx_imports_classes.add("java.sql.SQLException");
    _jspx_imports_classes.add("java.sql.Connection");
    _jspx_imports_classes.add("java.sql.ResultSet");
    _jspx_imports_classes.add("java.sql.Timestamp");
    _jspx_imports_classes.add("java.text.SimpleDateFormat");
    _jspx_imports_classes.add("java.sql.PreparedStatement");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"vi\">\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"UTF-8\">\r\n");
      out.write("    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("    <title>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${tenCauLacBo != null ? tenCauLacBo : 'Chi tiết Câu lạc bộ'}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</title>\r\n");
      out.write("    <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("    <link href=\"https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap\" rel=\"stylesheet\">\r\n");
      out.write("    <style>\r\n");
      out.write("        html {\r\n");
      out.write("            font-size: 16px;\r\n");
      out.write("        }\r\n");
      out.write("        .container {\r\n");
      out.write("            padding-bottom: 40px;\r\n");
      out.write("        }\r\n");
      out.write("        .slideshow-container {\r\n");
      out.write("            width: 100%;\r\n");
      out.write("            max-width: 1200px;\r\n");
      out.write("            margin: 20px auto;\r\n");
      out.write("            position: relative;\r\n");
      out.write("            overflow: hidden;\r\n");
      out.write("        }\r\n");
      out.write("        .slideshow-container img.slide {\r\n");
      out.write("            width: 100%;\r\n");
      out.write("            height: auto;\r\n");
      out.write("            display: block;\r\n");
      out.write("        }\r\n");
      out.write("    </style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("    ");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"vi\">\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"UTF-8\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"");
      out.print( request.getContextPath() );
      out.write("/assets/fonts/themify-icons/themify-icons.css\">\r\n");
      out.write("    <link href=\"https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css\" rel=\"stylesheet\">\r\n");
      out.write("    <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("    <style>\r\n");
      out.write("        /* Thanh điều hướng */\r\n");
      out.write("        .navbar {\r\n");
      out.write("            list-style: none;\r\n");
      out.write("            background-color: #003366;\r\n");
      out.write("            padding: 0;\r\n");
      out.write("            margin: 0;\r\n");
      out.write("            display: flex;\r\n");
      out.write("            flex-wrap: wrap;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .navbar > li {\r\n");
      out.write("            position: relative;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .navbar > li > a {\r\n");
      out.write("            display: block;\r\n");
      out.write("            padding: 14px 18px;\r\n");
      out.write("            color: white;\r\n");
      out.write("            font-weight: bold;\r\n");
      out.write("            text-decoration: none;\r\n");
      out.write("            white-space: nowrap;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .navbar > li:hover {\r\n");
      out.write("            background-color: #005599;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        /* Dropdown menu */\r\n");
      out.write("        .dropdown {\r\n");
      out.write("            position: absolute;\r\n");
      out.write("            top: 100%;\r\n");
      out.write("            left: 0;\r\n");
      out.write("            background-color: white;\r\n");
      out.write("            list-style: none;\r\n");
      out.write("            min-width: 220px;\r\n");
      out.write("            display: none;\r\n");
      out.write("            padding: 10px 0;\r\n");
      out.write("            margin: 0;\r\n");
      out.write("            border-radius: 6px;\r\n");
      out.write("            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);\r\n");
      out.write("            z-index: 1000;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .dropdown li a {\r\n");
      out.write("            display: block;\r\n");
      out.write("            padding: 12px 20px;\r\n");
      out.write("            color: #003366;\r\n");
      out.write("            text-decoration: none;\r\n");
      out.write("            font-weight: bold;\r\n");
      out.write("            white-space: nowrap;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .dropdown li a:hover {\r\n");
      out.write("            background-color: #f0f0f0;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .submenu {\r\n");
      out.write("            position: absolute;\r\n");
      out.write("            top: 0;\r\n");
      out.write("            left: 100%;\r\n");
      out.write("            background-color: white;\r\n");
      out.write("            min-width: 220px;\r\n");
      out.write("            display: none;\r\n");
      out.write("            padding: 10px 0;\r\n");
      out.write("            margin: 0;\r\n");
      out.write("            list-style: none;\r\n");
      out.write("            border-radius: 6px;\r\n");
      out.write("            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);\r\n");
      out.write("            z-index: 1000;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .submenu li a {\r\n");
      out.write("            display: block;\r\n");
      out.write("            padding: 12px 20px;\r\n");
      out.write("            color: #003366;\r\n");
      out.write("            text-decoration: none;\r\n");
      out.write("            font-weight: bold;\r\n");
      out.write("            white-space: nowrap;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .submenu li a:hover {\r\n");
      out.write("            background-color: #f0f0f0;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        /* Hiện dropdown khi hover */\r\n");
      out.write("        .navbar > li:hover > .dropdown {\r\n");
      out.write("            display: block;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        /* Hiện submenu của \"ĐẠI HỌC\" khi hover vào mục \"ĐẠI HỌC\" trong dropdown \"ĐÀO TẠO\" */\r\n");
      out.write("        .navbar > li:nth-child(3) > .dropdown > li:first-child:hover > .submenu {\r\n");
      out.write("            display: block;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        /* Hiện submenu của \"SAU ĐẠI HỌC\" khi hover vào mục \"SAU ĐẠI HỌC\" trong dropdown \"ĐÀO TẠO\" */\r\n");
      out.write("        .navbar > li:nth-child(3) > .dropdown > li:nth-child(2):hover > .submenu {\r\n");
      out.write("            display: block;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        /* Logo */\r\n");
      out.write("        .logobar {\r\n");
      out.write("            display: flex;\r\n");
      out.write("            align-items: center;\r\n");
      out.write("            padding: 10px 20px;\r\n");
      out.write("            background-color: #f5f5f5;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .logobar img {\r\n");
      out.write("            height: 60px;\r\n");
      out.write("            margin-right: 15px;\r\n");
      out.write("        }\r\n");
      out.write("    </style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("    <div class=\"logobar\">\r\n");
      out.write("        <img src=\"");
      out.print( request.getContextPath() );
      out.write("/images/logo.png\" alt=\"Logo HaUI\">\r\n");
      out.write("        <h1>KHOA CÔNG NGHỆ THÔNG TIN</h1>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <ul class=\"navbar\">\r\n");
      out.write("        <li><a href=\"https://www.haui.edu.vn/vn\">TRANG HAUI</a></li>\r\n");
      out.write("        <li>\r\n");
      out.write("            <a href=\"#\">GIỚI THIỆU <i class=\"bi bi-chevron-down ms-auto\"></i></a>\r\n");
      out.write("            <ul class=\"dropdown\">\r\n");
      out.write("                <li><a href=\"#\">THÔNG TIN CHUNG</a></li>\r\n");
      out.write("                <li><a href=\"#\">CƠ CẤU TỔ CHỨC</a></li>\r\n");
      out.write("                <li><a href=\"#\">CHIẾN LƯỢC PHÁT TRIỂN</a></li>\r\n");
      out.write("                <li><a href=\"#\">CÁN BỘ GIẢNG VIÊN</a></li>\r\n");
      out.write("                <li><a href=\"#\">CƠ SỞ VẬT CHẤT</a></li>\r\n");
      out.write("                <li><a href=\"#\">LIÊN HỆ</a></li>\r\n");
      out.write("            </ul>\r\n");
      out.write("        </li>\r\n");
      out.write("        <li>\r\n");
      out.write("            <a href=\"#\">ĐÀO TẠO <i class=\"bi bi-chevron-down ms-auto\"></i></a>\r\n");
      out.write("            <ul class=\"dropdown\">\r\n");
      out.write("                <li>\r\n");
      out.write("                    <a href=\"#\">ĐẠI HỌC</a>\r\n");
      out.write("                    <ul class=\"submenu\">\r\n");
      out.write("                        <li class=\"submenu-item\"><a href=\"#\">KHOA HỌC MÁY TÍNH</a></li>\r\n");
      out.write("                        <li class=\"submenu-item\"><a href=\"#\">KỸ THUẬT PHẦN MỀM</a></li>\r\n");
      out.write("                        <li class=\"submenu-item\"><a href=\"#\">HỆ THỐNG THÔNG TIN</a></li>\r\n");
      out.write("                        <li class=\"submenu-item\"><a href=\"#\">CÔNG NGHỆ THÔNG TIN</a></li>\r\n");
      out.write("                        <li class=\"submenu-item\"><a href=\"#\">CÔNG NGHỆ ĐA PHƯƠNG TIỆN</a></li>\r\n");
      out.write("                        <li class=\"submenu-item\"><a href=\"#\">AN TOÀN THÔNG TIN</a></li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("                </li>\r\n");
      out.write("                <li>\r\n");
      out.write("                    <a href=\"#\">SAU ĐẠI HỌC</a>\r\n");
      out.write("                    <ul class=\"submenu\">\r\n");
      out.write("                        <li class=\"submenu-item\"><a href=\"#\">HỆ THỐNG THÔNG TIN</a></li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("                </li>\r\n");
      out.write("                <li><a href=\"#\">KẾ HOẠCH</a></li>\r\n");
      out.write("                <li><a href=\"#\">TIẾN ĐỘ</a></li>\r\n");
      out.write("                <li><a href=\"#\">QUY CHẾ, BIỂU MẪU</a></li>\r\n");
      out.write("            </ul>\r\n");
      out.write("        </li>\r\n");
      out.write("        <li>\r\n");
      out.write("            <a href=\"#\">TUYỂN SINH <i class=\"bi bi-chevron-down ms-auto\"></i></a>\r\n");
      out.write("            <ul class=\"dropdown\">\r\n");
      out.write("                <li><a href=\"#\">ĐẠI HỌC</a></li>\r\n");
      out.write("                <li><a href=\"#\">SAU ĐẠI HỌC</a></li>\r\n");
      out.write("            </ul>\r\n");
      out.write("        </li>\r\n");
      out.write("        <li>\r\n");
      out.write("            <a href=\"#\">KHOA <i class=\"bi bi-chevron-down ms-auto\"></i></a>\r\n");
      out.write("            <ul class=\"dropdown\">\r\n");
      out.write("                <li><a href=\"#\">KHOA CÔNG NGHỆ THÔNG TIN</a></li>\r\n");
      out.write("                <li><a href=\"#\">KHOA CÔNG NGHỆ PHẦN MỀM</a></li>\r\n");
      out.write("                <li><a href=\"#\">KHOA KHOA HỌC MÁY TÍNH</a></li>\r\n");
      out.write("                <li><a href=\"#\">KHOA MẠNG MÁY TÍNH VÀ TRUYỀN THÔNG</a></li>\r\n");
      out.write("            </ul>\r\n");
      out.write("        </li>\r\n");
      out.write("        <li>\r\n");
      out.write("            <a href=\"#\">PHÒNG/TRUNG TÂM <i class=\"bi bi-chevron-down ms-auto\"></i></a>\r\n");
      out.write("            <ul class=\"dropdown\">\r\n");
      out.write("                <li><a href=\"#\">PHÒNG TỔNG HỢP</a></li>\r\n");
      out.write("                <li><a href=\"#\">TRUNG TÂM HỢP TÁC PHÁT TRIỂN</a></li>\r\n");
      out.write("                <li><a href=\"#\">TRUNG TÂM NGHIÊN CỨU CÔNG NGHỆ TIÊN TIẾN ICT</a></li>\r\n");
      out.write("            </ul>\r\n");
      out.write("        </li>\r\n");
      out.write("        <li>\r\n");
      out.write("            <a href=\"#\">KHOA HỌC - CÔNG NGHỆ <i class=\"bi bi-chevron-down ms-auto\"></i></a>\r\n");
      out.write("            <ul class=\"dropdown\">\r\n");
      out.write("                <li><a href=\"#\">CÔNG TRÌNH CÔNG BỐ</a></li>\r\n");
      out.write("                <li><a href=\"#\">ĐỀ TÀI DỰ ÁN</a></li>\r\n");
      out.write("                <li><a href=\"#\">SINH VIÊN NCKH</a></li>\r\n");
      out.write("                <li><a href=\"#\">TIN KHCN</a></li>\r\n");
      out.write("            </ul>\r\n");
      out.write("        </li>\r\n");
      out.write("        <li><a href=\"#\">THƯ VIỆN ẢNH</a></li>\r\n");
      out.write("    </ul>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <div class=\"slideshow-container\">\r\n");
      out.write("        <img class=\"slide\" src=\"https://pbs.twimg.com/media/Gqpzy2-WEAA0cHY?format=jpg&name=900x900\" alt=\"Ảnh 1\">\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <div class=\"container my-5\">\r\n");
      out.write("        ");

            String maclubParam = request.getParameter("maclub");
            if (maclubParam != null) {
                try {
                    int maclub = Integer.parseInt(maclubParam);
                    Connection conn = DatabaseConnection.getConnection();
                    String sql = "SELECT TieuDeTinTuc, UrlAnh , TrichDanTin, NoiDungTin, NgayCapNhat, SoLanDoc FROM TinTuc WHERE MaTheLoai = 15 and MaTinTuc = ?";
                    PreparedStatement stmt = conn.prepareStatement(sql);
                    stmt.setInt(1, maclub);
                    ResultSet rs = stmt.executeQuery();

                    if (rs.next()) {
                        String tieuDeTinTuc = rs.getString("TieuDeTinTuc");
                        String noiDung = rs.getString("NoiDungTin");
                        String urlAnh = rs.getString("UrlAnh");
                        Timestamp ngayCapNhat = rs.getTimestamp("NgayCapNhat");
                        SimpleDateFormat sdf = new SimpleDateFormat("EEEE, HH:mm dd/MM/yyyy");
        
      out.write("\r\n");
      out.write("        <div class=\"container-fluid\">\r\n");
      out.write("            <div class=\"row\">\r\n");
      out.write("                <div class=\"col-md-12\">\r\n");
      out.write("                    <div class=\"club-detail\">\r\n");
      out.write("                        <nav aria-label=\"breadcrumb\">\r\n");
      out.write("                            <ol class=\"breadcrumb\">\r\n");
      out.write("                                <li class=\"breadcrumb-item\"><a href=\"");
      out.print( request.getContextPath() );
      out.write("/trang-chu\">Trang chủ</a></li>\r\n");
      out.write("                                <li class=\"breadcrumb-item\"><a href=\"");
      out.print( request.getContextPath() );
      out.write("/CauLacBo.jsp\">Câu lạc bộ</a></li>\r\n");
      out.write("                                <li class=\"breadcrumb-item active\" aria-current=\"page\">");
      out.print( tieuDeTinTuc );
      out.write("</li>\r\n");
      out.write("                            </ol>\r\n");
      out.write("                        </nav>\r\n");
      out.write("                        ");
 if (request.getAttribute("error") != null) { 
      out.write("\r\n");
      out.write("                            <div class=\"alert alert-danger\" role=\"alert\">\r\n");
      out.write("                                ");
      out.print( request.getAttribute("error") );
      out.write("\r\n");
      out.write("                            </div>\r\n");
      out.write("                        ");
 } 
      out.write("\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <h2 class=\"mb-3 text-primary\">");
      out.print( tieuDeTinTuc );
      out.write("</h2>\r\n");
      out.write("        <p class=\"text-muted mb-3\">");
      out.print( sdf.format(ngayCapNhat) );
      out.write("</p>\r\n");
      out.write("        ");
 if (urlAnh != null && !urlAnh.isEmpty()) { 
      out.write("\r\n");
      out.write("            <img src=\"");
      out.print( urlAnh );
      out.write("\" alt=\"Ảnh câu lạc bộ\" class=\"img-fluid mb-4\">\r\n");
      out.write("        ");
 } 
      out.write("\r\n");
      out.write("        <div class=\"mb-4\" style=\"line-height: 1.8;\">");
      out.print( noiDung );
      out.write("</div>\r\n");
      out.write("        ");

                    } else {
        
      out.write("\r\n");
      out.write("            <div class=\"alert alert-warning\">Không tìm thấy câu lạc bộ.</div>\r\n");
      out.write("        ");

                    }
                    rs.close();
                    stmt.close();
                    conn.close();
                } catch (Exception e) {
        
      out.write("\r\n");
      out.write("            <div class=\"alert alert-danger\">Lỗi: ");
      out.print( e.getMessage() );
      out.write("</div>\r\n");
      out.write("        ");

                }
            } else {
        
      out.write("\r\n");
      out.write("            <div class=\"alert alert-warning\">Thiếu mã câu lạc bộ để hiển thị nội dung.</div>\r\n");
      out.write("        ");

            }
        
      out.write("\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    ");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"vi\">\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"UTF-8\">\r\n");
      out.write("    <link href=\"https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css\" rel=\"stylesheet\">\r\n");
      out.write("    <style>\r\n");
      out.write("        /* Footer */\r\n");
      out.write("        .footer {\r\n");
      out.write("            background-color: #004080;\r\n");
      out.write("            color: white;\r\n");
      out.write("            font-family: Arial, sans-serif;\r\n");
      out.write("            padding: 20px;\r\n");
      out.write("            position: relative;\r\n");
      out.write("            width: 100%;\r\n");
      out.write("            box-sizing: border-box;\r\n");
      out.write("            z-index: 1000;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .footer-container {\r\n");
      out.write("            display: flex;\r\n");
      out.write("            flex-wrap: wrap;\r\n");
      out.write("            justify-content: space-between;\r\n");
      out.write("            gap: 30px;\r\n");
      out.write("            max-width: 1200px;\r\n");
      out.write("            margin: auto;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .footer-col {\r\n");
      out.write("            flex: 1;\r\n");
      out.write("            min-width: 250px;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .footer-col a {\r\n");
      out.write("            color: white;\r\n");
      out.write("            text-decoration: none;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .footer-col a:hover {\r\n");
      out.write("            color: #ccc;\r\n");
      out.write("            text-decoration: underline;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .footer-logo {\r\n");
      out.write("            width: 180px;\r\n");
      out.write("            margin-bottom: 15px;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .footer-col h4 {\r\n");
      out.write("            margin-top: 15px;\r\n");
      out.write("            margin-bottom: 10px;\r\n");
      out.write("            font-weight: bold;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .footer-col p {\r\n");
      out.write("            margin: 6px 0;\r\n");
      out.write("            font-size: 14px;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .social-icons {\r\n");
      out.write("            display: flex;\r\n");
      out.write("            gap: 12px;\r\n");
      out.write("            margin-top: 10px;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .social-icons a {\r\n");
      out.write("            color: inherit;\r\n");
      out.write("            text-decoration: none;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .social-icons i {\r\n");
      out.write("            font-size: 22px;\r\n");
      out.write("            cursor: pointer;\r\n");
      out.write("            transition: transform 0.2s;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .social-icons a:hover i {\r\n");
      out.write("            transform: scale(1.2);\r\n");
      out.write("            color: #ccc;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .back-to-top {\r\n");
      out.write("            position: fixed;\r\n");
      out.write("            bottom: 20px;\r\n");
      out.write("            right: 20px;\r\n");
      out.write("            font-size: 36px;\r\n");
      out.write("            color: #fff;\r\n");
      out.write("            background-color: #007bff;\r\n");
      out.write("            border-radius: 50%;\r\n");
      out.write("            width: 48px;\r\n");
      out.write("            height: 48px;\r\n");
      out.write("            display: flex;\r\n");
      out.write("            justify-content: center;\r\n");
      out.write("            align-items: center;\r\n");
      out.write("            z-index: 1000;\r\n");
      out.write("            transition: transform 0.2s, background-color 0.2s, border-color 0.2s;\r\n");
      out.write("            text-decoration: none !important;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .back-to-top:hover {\r\n");
      out.write("            transform: scale(1.2);\r\n");
      out.write("            background-color: #fff;\r\n");
      out.write("            color: #007bff;\r\n");
      out.write("        }\r\n");
      out.write("    </style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("    <footer class=\"footer\">\r\n");
      out.write("        <div class=\"footer-container\">\r\n");
      out.write("            <div class=\"footer-col\">\r\n");
      out.write("                <img src=\"");
      out.print( request.getContextPath() );
      out.write("/images/logo.png\" alt=\"HaUI Logo\" class=\"footer-logo\">\r\n");
      out.write("                <h4>THÔNG TIN LIÊN HỆ</h4>\r\n");
      out.write("                <p><i class=\"bi bi-geo-alt-fill\"></i> Tầng 12, Nhà A1</p>\r\n");
      out.write("                <p><i class=\"bi bi-geo-alt\"></i> Số 298 đường Cầu Diễn, quận Bắc Từ Liêm, Hà Nội</p>\r\n");
      out.write("                <p><i class=\"bi bi-envelope\"></i> Email: sict@haui.edu.vn</p>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"footer-col\">\r\n");
      out.write("                <h4>THÔNG TIN</h4>\r\n");
      out.write("                <p><a href=\"\">> Liên hệ</a></p>\r\n");
      out.write("                <p><a href=\"\">> Sơ đồ trường</a></p>\r\n");
      out.write("                <h4>MẠNG XÃ HỘI</h4>\r\n");
      out.write("                <div class=\"social-icons\">\r\n");
      out.write("                    <a href=\"https://web.facebook.com/DHCNHNofficial\" target=\"_blank\"><i class=\"bi bi-facebook\"></i></a>\r\n");
      out.write("                    <a href=\"https://www.youtube.com/@HaUITV\" target=\"_blank\"><i class=\"bi bi-youtube\"></i></a>\r\n");
      out.write("                    <a href=\"https://web.facebook.com/messages/t/200315546493808\" target=\"_blank\"><i class=\"bi bi-messenger\"></i></a>\r\n");
      out.write("                    <a href=\"https://www.tiktok.com/@fitmedia.haui\" target=\"_blank\"><i class=\"bi bi-tiktok\"></i></a>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"footer-col\">\r\n");
      out.write("                <h4>BẢN ĐỒ CHỈ DẪN</h4>\r\n");
      out.write("                <iframe\r\n");
      out.write("                    src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.607123306446!2d105.7296514750296!3d21.01101108063321!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ab45780ff4cf%3A0x385fda93d8b3ecb3!2zSOG6o2kgxJDDtG5nIE5naGnhu4dwIEjDoCBO4buZaQ!5e0!3m2!1svi!2s!4v1715071600000!5m2!1svi!2s\"\r\n");
      out.write("                    width=\"250\" height=\"150\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\">\r\n");
      out.write("                </iframe>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"footer-bottom text-center\">\r\n");
      out.write("            <p>Copyright © 2025 School Of Information And Communications Technology</p>\r\n");
      out.write("        </div>\r\n");
      out.write("        <a href=\"#\" class=\"back-to-top\">\r\n");
      out.write("            <i class=\"bi bi-arrow-up-circle-fill\"></i>\r\n");
      out.write("        </a>\r\n");
      out.write("    </footer>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <script src=\"");
      out.print( request.getContextPath() );
      out.write("/script.js\"></script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
