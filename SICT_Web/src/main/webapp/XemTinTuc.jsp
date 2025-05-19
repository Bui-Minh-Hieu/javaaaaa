<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><c:out value="${news != null ? news.tieuDeTinTuc : 'Tin Tức Chi Tiết'}"/></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        html { font-size: 16px; }
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
        .news-content p {
            margin-bottom: 1.5rem;
        }
        .news-content br {
            margin-bottom: 1rem;
            display: block;
            content: "";
        }
        .comment-section {
            margin-top: 40px;
        }
        .comment-item {
            border-bottom: 1px solid #e9ecef;
            padding: 15px 0;
        }
    </style>
</head>
<body>
    <%@ include file="header.jsp" %>

    <div class="container my-5">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="news-detail">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="<%= request.getContextPath() %>/trang-chu">Trang chủ</a></li>
                                <li class="breadcrumb-item"><a href="<%= request.getContextPath() %>/tin-tuc">Tin tức</a></li>
                                <li class="breadcrumb-item active" aria-current="page"><c:out value="${news.tieuDeTinTuc}"/></li>
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

        <c:choose>
            <c:when test="${news != null}">
                <h2 class="mb-3 text-primary"><c:out value="${news.tieuDeTinTuc}"/></h2>
                <p class="text-muted mb-3">
                    <fmt:parseDate value="${news.ngayCapNhat}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDate" />
                    <fmt:formatDate value="${parsedDate}" pattern="EEEE, HH:mm dd/MM/yyyy"/>
                </p>
                <c:if test="${not empty news.urlAnh}">
                    <img src="${news.urlAnh}" alt="Ảnh tin tức" class="img-fluid" style="max-width: 730px; height: auto;">
                </c:if>
                <div class="mb-4 news-content" style="line-height: 1.8;"><c:out value="${news.noiDungTin}" escapeXml="false"/></div>
                <c:if test="${not empty news.soLanDoc}">
                    <p class="text-muted small">Lượt xem: ${news.soLanDoc}</p>
                </c:if>
                <c:if test="${not empty news.tag}">
                    <p class="text-muted small">Tags: ${news.tag}</p>
                </c:if>

                <!-- Comment Section -->
                <div class="comment-section">
                    <h4>Bình luận</h4>
                    <c:if test="${not empty commentSuccess}">
                        <div class="alert alert-success" role="alert">
                            ${commentSuccess}
                        </div>
                    </c:if>
                    <c:if test="${not empty commentError}">
                        <div class="alert alert-danger" role="alert">
                            ${commentError}
                        </div>
                    </c:if>

                    <c:if test="${sessionScope.USER != null}">
                        <form action="<%= request.getContextPath() %>/comment" method="post" class="mb-4">
                            <input type="hidden" name="maTinTuc" value="${news.maTinTuc}">
                            <div class="mb-3">
                                <textarea name="noiDung" class="form-control" rows="4" placeholder="Viết bình luận của bạn..." required></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary">Gửi bình luận</button>
                        </form>
                    </c:if>
                    <c:if test="${sessionScope.USER == null}">
                        <p>Vui lòng <a href="<%= request.getContextPath() %>/user/login">đăng nhập</a> để bình luận.</p>
                    </c:if>

                    <c:forEach items="${comments}" var="comment">
                        <div class="comment-item">
                            <p><strong><c:out value="${comment.fullName}"/></strong> - 
                                <fmt:formatDate value="${comment.ngayBinhLuan}" pattern="HH:mm dd/MM/yyyy"/>
                            </p>
                            <p><c:out value="${comment.noiDung}"/></p>
                        </div>
                    </c:forEach>
                </div>
            </c:when>
            <c:otherwise>
                <div class="alert alert-warning">Không tìm thấy tin tức hoặc mã tin tức không hợp lệ.</div>
            </c:otherwise>
        </c:choose>
    </div>

    <%@ include file="footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="<%= request.getContextPath() %>/script.js"></script>
</body>
</html>