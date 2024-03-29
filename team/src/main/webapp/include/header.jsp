<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap core CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="../css/style.css" rel="stylesheet">
</head>
<body>

    <!-- Responsive navbar -->
    <nav class="navbar navbar-expand-lg" style="background-color: #e3f2fd; padding:15px;">
        <div class="container">
            <a class="navbar-brand" href="<%=request.getContextPath()%>/view/index.jsp" style="font-family:'Black Han Sans', sans-serif;  font-size: 25px;
            ">
            <img
            src="<%=request.getContextPath()%>/assets/icon8.png"
            alt="Logo"
            width="33"
            height="32"
            class="d-inline-block align-text-top"/>
             접종 친구</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent" style="font-weight:bold;">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="/team1/boardList.boa">Board</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/team1/boardList.bo">Notice</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/team1/view/mypage.jsp">Mypage</a>
                    </li>
                    <%-- 세션에 user_id가 없으면 링크를 보여줌 --%>
    				<li class="nav-item">
    				<% if (session.getAttribute("user_id") == null) { %>
                    <a class="nav-link" href="/team1/view/login.jsp">Login</a>
    				<% } %></li>
    				
                    <li class="nav-item">
				    <% if (session.getAttribute("user_id") == null) { %>
				        <a class="nav-link" href="/team1/view/join.jsp">Join</a>
				    <% } %></li>
				    
				    <!-- 로그인 상태일 때 -->
							<jsp:include page="../view/logout_modal.jsp" />
                    <% if (session.getAttribute("user_name") != null) { %>
                        <li class="nav-item"><p class="nav-link" data-bs-toggle="modal" data-bs-target="#logoutModal"> [로그아웃]</p></li>
                    <% } %>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Bootstrap core JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
 

</body>
</html>