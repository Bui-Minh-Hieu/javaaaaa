<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Câu lạc bộ</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        html {
            font-size: 16px;
        }
        .club-item {
            display: flex;
            margin-bottom: 20px;
            background-color: white;
            padding: 15px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .club-item img {
            width: 200px;
            height: 150px;
            object-fit: cover;
            margin-right: 15px;
            border-radius: 5px;
        }
        .club-item .content {
            flex: 1;
        }
        .club-item .content h3 {
            font-size: 1.5em;
            margin: 0 0 10px;
        }
        .club-item .content h3 a {
            color: #003087;
            text-decoration: none;
        }
        .club-item .content h3 a:hover {
            text-decoration: underline;
        }
        .club-item .content .date {
            color: #666;
            font-size: 0.9em;
            margin-bottom: 10px;
        }
        .club-item .content .summary {
            color: #333;
            line-height: 1.6;
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

    <div class="slideshow-container">
        <img class="slide" src="https://pbs.twimg.com/media/Gqpzy2-WEAA0cHY?format=jpg&name=900x900" alt="Ảnh 2">
    </div>

    <div class="container my-4">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="club-detail">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="<%= request.getContextPath() %>/trang-chu">Trang chủ</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Câu lạc bộ</li>
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
        <c:forEach var="club" items="${clubList}">
            <div class="row mb-4 p-3 bg-light rounded shadow-sm">
                <c:if test="${not empty club.urlAnh}">
                    <div class="col-md-4">
                        <img src="${club.urlAnh}" alt="Ảnh câu lạc bộ" class="img-fluid rounded">
                    </div>
                </c:if>
                <c:if test="${empty club.urlAnh}">
                    <div class="col-md-4">
                        <img src="https://via.placeholder.com/200x150" alt="Ảnh mặc định" class="img-fluid rounded">
                    </div>
                </c:if>
                <div class="col-md-8 d-flex flex-column justify-content-between">
                    <div>
                        <h5 class="fw-bold" style="color: #003399;">
                            <a href="xem-cau-lac-bo?matintuc=${club.maTinTuc}" style="text-decoration: none; color: inherit;">
                                ${club.tieuDeTinTuc}
                            </a>
                        </h5>
                        <p class="text-muted mb-2">
                            <fmt:parseDate value="${club.ngayCapNhat}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDate" />
                            <fmt:formatDate value="${parsedDate}" pattern="EEEE, HH:mm dd/MM/yyyy"/>
                        </p>
                        <p class="text-body">${club.trichDanTin}</p>
                    </div>
                    <div>
                        <a href="xem-cau-lac-bo?matintuc=${club.maTinTuc}" class="fw-bold text-primary">Xem thêm</a>
                    </div>
                </div>
            </div>
        </c:forEach>
        <c:if test="${empty clubList}">
            <p>Không có câu lạc bộ nào để hiển thị.</p>
        </c:if>
    </div>

    <%@ include file="footer.jsp" %>

    <script src="<%= request.getContextPath() %>/script.js"></script>
</body>
</html>