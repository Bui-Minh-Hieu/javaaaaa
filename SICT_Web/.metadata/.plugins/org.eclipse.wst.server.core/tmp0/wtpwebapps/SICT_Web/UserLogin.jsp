<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập/Đăng ký người dùng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/login.css"/>
</head>
<body>
    <div id="logreg-forms">
        <!-- Login Form -->
        <form class="form-signin" action="signin" method="post">
            <h1 class="text-center">Đăng nhập</h1>

            <c:if test="${resSuccess != null}">
                <div class="alert alert-success" role="alert">
                    ${resSuccess}
                </div>
            </c:if>
            <c:if test="${loginError != null}">
                <div class="alert alert-danger" role="alert">
                    ${loginError}
                </div>
            </c:if>

            <div class="mb-3">
                <input name="user" type="text" class="form-control" placeholder="Tên đăng nhập" required autofocus value="${username}">
            </div>

            <div class="mb-3">
                <input name="pass" type="password" class="form-control" placeholder="Mật khẩu" required>
            </div>

            <button class="btn btn-primary w-100 mb-3" type="submit">
                <i class="fas fa-sign-in-alt me-2"></i>Đăng nhập
            </button>

            <p class="text-center">
                Chưa có tài khoản? <a href="#" id="btn-signup">Đăng ký</a>
            </p>
        </form>

        <!-- Registration Form -->
        <form class="form-signup" action="signup" method="post" style="display: none;">
            <h1 class="text-center">Đăng ký</h1>

            <c:if test="${registerError != null}">
                <div class="alert alert-danger" role="alert">
                    ${registerError}
                </div>
            </c:if>

            <div class="mb-3">
                <input name="user" type="text" class="form-control" placeholder="Tên đăng nhập" required value="${username}">
            </div>

            <div class="mb-3">
                <input name="pass" type="password" class="form-control" placeholder="Mật khẩu" required>
            </div>

            <div class="mb-3">
                <input name="fullName" type="text" class="form-control" placeholder="Họ và tên" required value="${fullName}">
            </div>

            <div class="mb-3">
                <input name="email" type="email" class="form-control" placeholder="Email" required value="${email}">
            </div>

            <button class="btn btn-primary w-100 mb-3" type="submit">
                <i class="fas fa-user-plus me-2"></i>Đăng ký
            </button>

            <p class="text-center">
                Đã có tài khoản? <a href="#" id="cancel_signup">Đăng nhập</a>
            </p>
        </form>
    </div>

    <div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
        <div id="loginSuccessToast" class="toast align-items-center text-bg-success border-0" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="d-flex">
                <div class="toast-body">
                    Đăng nhập/Đăng ký thành công!
                </div>
                <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(() => {
            $('#btn-signup').click((e) => {
                e.preventDefault();
                $('.form-signin').hide();
                $('.form-signup').show();
            });
            $('#cancel_signup').click((e) => {
                e.preventDefault();
                $('.form-signup').hide();
                $('.form-signin').show();
            });

            <c:if test="${resSuccess != null}">
                var toast = new bootstrap.Toast(document.getElementById('loginSuccessToast'));
                toast.show();
            </c:if>
        });
    </script>
</body>
</html>