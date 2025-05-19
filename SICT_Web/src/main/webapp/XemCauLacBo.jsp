<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><c:out value="${club != null ? club.tieuDeTinTuc : 'Chi tiết Câu lạc bộ'}"/></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        html {
            font-size: 16px;
        }
        .container {
            padding-bottom: 40px;
        }
        .slideshow-container {
            width: 100%;
            max-width: 1200px;
            margin: 20px auto;
            position: relative;
            overflow: hidden;
        }
        .slideshow-container img.slide {
            width: 100%;
            height: auto;
            display: block;
        }
    </style>
</head>
<body>
    <%@ include file="header.jsp" %>

    <div class="container my-5">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="club-detail">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="<%= request.getContextPath() %>/trang-chu">Trang chủ</a></li>
                                <li class="breadcrumb-item"><a href="<%= request.getContextPath() %>/cau-lac-bo">Câu lạc bộ</a></li>
                                <li class="breadcrumb-item active" aria-current="page"><c:out value="${club.tieuDeTinTuc}"/></li>
                            </ol>
                        </nav>
                        <c:if test="${not empty error}">
                            <div class="alert alert-danger" role="alert">
                                ${error}
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
        <c:if test="${club != null}">
            <h2 class="mb-3 text-primary"><c:out value="${club.tieuDeTinTuc}"/></h2>
            <p class="text-muted mb-3">
                <fmt:parseDate value="${club.ngayCapNhat}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDate" />
                <fmt:formatDate value="${parsedDate}" pattern="EEEE, HH:mm dd/MM/yyyy"/>
            </p>
            <c:if test="${not empty club.urlAnh}">
                <img src="${club.urlAnh}" alt="Ảnh câu lạc bộ" class="img-fluid mb-4">
            </c:if>
            <c:if test="${empty club.urlAnh}">
                <img src="https://via.placeholder.com/200x150" alt="Ảnh mặc định" class="img-fluid mb-4">
            </c:if>
            <div class="mb-4" style="line-height: 1.8;"><c:out value="${club.noiDungTin}" escapeXml="false"/></div>
        </c:if>
        <c:if test="${club == null}">
            <div class="alert alert-warning">Không tìm thấy câu lạc bộ.</div>
        </c:if>
    </div>

    <%@ include file="footer.jsp" %>

    <script src="<%= request.getContextPath() %>/script.js"></script>
</body>
</html>