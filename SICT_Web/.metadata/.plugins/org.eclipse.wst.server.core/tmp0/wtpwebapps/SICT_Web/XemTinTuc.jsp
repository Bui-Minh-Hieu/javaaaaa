<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><c:out value="${not empty news ? news.tieuDeTinTuc : 'Chi Tiết Tin Tức'}"/></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        html { font-size: 16px; }
        .container { padding-bottom: 40px; }
        .news-detail .slideshow-container {
            max-width: 1200px;
            margin: 20px auto;
            overflow: hidden;
        }
        .news-detail .slideshow-container img {
            width: 100%;
            height: auto;
            display: block;
        }
        .news-content {
            line-height: 1.8;
        }
        .news-content p {
            margin-bottom: 1.5rem;
        }
        .news-content br {
            display: block;
            margin-bottom: 1rem;
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
        <div class="row">
            <div class="col-12">
                <div class="news-detail">
                    <!-- Breadcrumb -->
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="<%= request.getContextPath() %>/trang-chu">Trang chủ</a></li>
                            <li class="breadcrumb-item"><a href="<%= request.getContextPath() %>/tin-tuc">Tin tức</a></li>
                            <li class="breadcrumb-item active" aria-current="page">
                                <c:out value="${not empty news ? news.tieuDeTinTuc : ''}"/>
                            </li>
                        </ol>
                    </nav>

                    <!-- Thông báo lỗi -->
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger" role="alert">
                            ${error}
                        </div>
                    </c:if>

                    <!-- Nội dung tin tức -->
                    <c:choose>
                        <c:when test="${not empty news}">
                            <h2 class="mb-3 text-primary"><c:out value="${news.tieuDeTinTuc}"/></h2>
                            <p class="text-muted mb-3">
                                <fmt:parseDate value="${news.ngayCapNhat}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDate" type="both" />
                                <fmt:formatDate value="${parsedDate}" pattern="EEEE, HH:mm dd/MM/yyyy" />
                            </p>

                            <c:if test="${not empty news.urlAnh}">
                                <div class="slideshow-container">
                                    <img src="${news.urlAnh}" alt="Ảnh tin tức" class="img-fluid" style="max-width: 730px;">
                                </div>
                            </c:if>

                            <div class="news-content">
                                <c:out value="${news.noiDungTin}" escapeXml="false" />
                            </div>

                            <c:if test="${not empty news.soLanDoc}">
                                <p class="text-muted small">Lượt xem: ${news.soLanDoc}</p>
                            </c:if>
                            <c:if test="${not empty news.tag}">
                                <p class="text-muted small">Tags: ${news.tag}</p>
                            </c:if>

                            <!-- Phần bình luận -->
                            <div class="comment-section">
                                <h4>Bình luận</h4>

                                <!-- Thông báo thành công/lỗi -->
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

                                <!-- Form gửi bình luận -->
                                <c:choose>
                                    <c:when test="${not empty sessionScope.USER}">
                                        <form action="<%= request.getContextPath() %>/comment" method="post" class="mb-4">
                                            <input type="hidden" name="maTinTuc" value="${news.maTinTuc}">
                                            <div class="mb-3">
                                                <textarea name="noiDung" class="form-control" rows="4" placeholder="Viết bình luận của bạn..." required></textarea>
                                            </div>
                                            <button type="submit" class="btn btn-primary">Gửi bình luận</button>
                                        </form>
                                    </c:when>
                                    <c:otherwise>
                                        <p class="text-warning">Vui lòng <a href="<%= request.getContextPath() %>/user/login">đăng nhập</a> để bình luận.</p>
                                    </c:otherwise>
                                </c:choose>

                                <!-- Danh sách bình luận -->
                                <c:choose>
                                    <c:when test="${not empty comments and not empty comments}">
                                        <c:forEach items="${comments}" var="comment">
                                            <div class="comment-item">
                                                <p>
                                                    <strong><c:out value="${comment.fullName}"/></strong> -
                                                    <fmt:formatDate value="${comment.ngayBinhLuan}" pattern="HH:mm dd/MM/yyyy" />
                                                </p>
                                                <p><c:out value="${comment.noiDung}"/></p>
                                            </div>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <p class="text-muted">Chưa có bình luận nào.</p>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="alert alert-warning" role="alert">
                                Không tìm thấy tin tức hoặc mã tin tức không hợp lệ.
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="footer.jsp" %>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="<%= request.getContextPath() %>/script.js"></script>
</body>
</html>