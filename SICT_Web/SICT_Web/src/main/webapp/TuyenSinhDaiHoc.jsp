<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Tuyển Sinh Đại Học</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        html { font-size: 16px; }
        .news-item {
            display: flex;
            margin-bottom: 20px;
            background-color: white;
            padding: 15px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .news-item img {
            width: 200px;
            height: 150px;
            object-fit: cover;
            margin-right: 15px;
            border-radius: 5px;
        }
        .news-item .content { flex: 1; }
        .news-item .content h3 {
            font-size: 1.5em;
            margin: 0 0 10px;
        }
        .news-item .content h3 a {
            color: #003087;
            text-decoration: none;
        }
        .news-item .content h3 a:hover {
            text-decoration: underline;
        }
        .news-item .content .date {
            color: #666;
            font-size: 0.9em;
            margin-bottom: 10px;
        }
        .news-item .content .summary {
            color: #333;
            line-height: 1.6;
        }
        .container { padding-bottom: 40px; }
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

    <div class="container my-4">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="news-detail">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="<%= request.getContextPath() %>/trang-chu">Trang chủ</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Tin tức</li>
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

        <c:forEach var="news" items="${newsList}">
            <div class="row mb-4 p-3 bg-light rounded shadow-sm">
                <c:if test="${not empty news.urlAnh}">
                    <div class="col-md-4">
                        <img src="${news.urlAnh}" alt="Ảnh tin tức" class="img-fluid rounded">
                    </div>
                </c:if>
                <div class="col-md-8 d-flex flex-column justify-content-between">
                    <div>
                        <h5 class="fw-bold" style="color: #003399;">
                            <a href="xem-tuyen-sinh-dai-hoc?matintuc=${news.maTinTuc}" style="text-decoration: none; color: inherit;">
                                ${news.tieuDeTinTuc}
                            </a>
                        </h5>
                        <p class="text-muted mb-2">
                            <fmt:parseDate value="${news.ngayCapNhat}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDate" />
                            <fmt:formatDate value="${parsedDate}" pattern="EEEE, HH:mm dd/MM/yyyy"/>
                        </p>
                        <p class="text-body"><c:out value="${news.trichDanTin}" escapeXml="false"/></p>
                        <c:if test="${not empty news.soLanDoc}">
                            <p class="text-muted small">Lượt xem: ${news.soLanDoc}</p>
                        </c:if>
                        <c:if test="${not empty news.tag}">
                            <p class="text-muted small">Tags: ${news.tag}</p>
                        </c:if>
                    </div>
                    <div>
                        <a href="xem-tuyen-sinh-dai-hoc?matintuc=${news.maTinTuc}" class="fw-bold text-primary">Xem thêm</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <%@ include file="footer.jsp" %>
    <script src="<%= request.getContextPath() %>/script.js"></script>
</body>
</html>