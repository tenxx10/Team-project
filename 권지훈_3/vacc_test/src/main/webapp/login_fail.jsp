<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>로그인 결과</title>
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <link href="css/styles.css" rel="stylesheet" />
    
    <style>
    .navbar {
        padding-top: 0;
        padding-bottom: 0;
    }
	</style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">접종 친구</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link" href="board.jsp">Board</a></li>
                <li class="nav-item"><a class="nav-link" href="info.jsp">Info</a></li>
                <li class="nav-item"><a class="nav-link" href="mypage.jsp">Mypage</a></li>
                            <%-- 세션에 user_id가 없으면 링크를 보여줌 --%>
    				<li class="nav-item">
    				<% if (session.getAttribute("user_id") == null) { %>
                    <a class="nav-link" href="login.jsp">Login</a>
    				<% } %></li>
    				
                    <li class="nav-item">
				    <% if (session.getAttribute("user_id") == null) { %>
				        <a class="nav-link" href="join.jsp">Join</a>
				    <% } %></li>
				    
				    <!-- 로그인 상태일 때 -->
							<jsp:include page="logout_modal.jsp" />
                    <% if (session.getAttribute("user_name") != null) { %>
                        <li class="nav-item"><p class="nav-link" data-bs-toggle="modal" data-bs-target="#logoutModal"> [로그아웃]</p></li>
                    <% } %>
            </ul>
        </div>
    </div>
</nav>

<center>
    <div class="container">
        <br><br><br><br><br>
        <p><%= request.getAttribute("message") %></p><br><br><br>
        <p><a href="login.jsp">로그인 화면 돌아가기</a></p>
    </div>
</center>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/scripts.js"></script>
</body>
</html>
