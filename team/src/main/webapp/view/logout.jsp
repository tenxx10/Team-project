<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport"
        content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Logout</title>
    <link rel="icon" type="image/x-icon" href="../assets/favicon.ico" />
    <link href="../css/styles.css" rel="stylesheet" />
</head>
<body>
    <!-- Include header.jsp -->
    <%@ include file="/include/header.jsp"%>

    <!-- Page content -->
    <div class="container-fluid">
        <div class="row">
            <!-- Include cate.jsp -->
            <%@ include file="/include/cate.jsp"%>

            <main class="col-lg-10 col-md-7 ms-md-auto px-4">
                <!-- 디버깅 출력 -->
                <h2>로그아웃 페이지 디버깅 출력</h2>
                <p>디버깅: 로그아웃 페이지에서 세션을 무효화하고 홈페이지로 이동합니다.</p>

                <% 
                    // 세션을 무효화하여 로그아웃 처리
                    HttpSession logoutSession = request.getSession(false);
                    if (logoutSession != null) {
                        logoutSession.invalidate();
                        out.println("<p>세션 무효화 성공</p>");
                    } else {
                        out.println("<p>세션을 찾을 수 없습니다.</p>");
                    }

                    // 로그아웃 후 홈페이지로 이동
                    response.sendRedirect("index.jsp");
                %>
            </main>
        </div>
    </div>

    <!-- Include footer.jsp -->
    <%@ include file="/include/footer.jsp"%>

    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>