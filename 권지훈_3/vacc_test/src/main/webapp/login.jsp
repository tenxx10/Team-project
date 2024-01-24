<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Vaccine Friend</title>
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

    <div class="container-fluid">
        <div class="row">
            <nav id="sidebar" class="col-lg-2 col-md-5 d-md-block bg-light sticky-top">
                <div class="p-4">
                    <h2 class="h4 mb-4"><br /><br />카테고리</h2>
                    <div class="list-group">
                        <a href="mypage.jsp" class="list-group-item list-group-item-action"><i class="bi bi-person"></i> 마이페이지</a>
                        <a href="vacccine.jsp" class="list-group-item list-group-item-action"><i class="bi bi-file-earmark-text"></i> 예방접종정보</a>
                        <a href="calendar.jsp" class="list-group-item list-group-item-action"><i class="bi bi-calendar"></i> 캘린더</a>
                        <a href="board.jsp" class="list-group-item list-group-item-action"><i class="bi bi-chat-left"></i> 자유게시판</a>
                        <a href="info.jsp" class="list-group-item list-group-item-action"><i class="bi bi-info-circle"></i> 인포메이션</a>
                    </div>
                </div>
            </nav>
            
            <main class="col-lg-10 col-md-7 ms-md-auto px-4">
                
                    <form action="login_Process.jsp" method="post">
                    	<center>
                        <br><br>
                        <h2>로그인</h2>
                        <br>
                        <div class="mb-3">
                            <label for="username" class="form-label">아이디</label>
                            <input type="text" class="form-control" id="user_id" name="user_id" style="width:300px" required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">비밀번호</label>
                            <input type="password" class="form-control" id="user_pw" name="user_pw" style="width:300px" required>
                        </div>
                        <button type="submit" class="btn btn-primary">로그인</button>
                        

                        
                        <form action="find_pw.jsp" method="post">
                        <a href="find_pw.jsp" class="btn btn-success" onclick="find_pw()">비밀번호 찾기</button>
                        </a></form>
                	</center>
                </form>                
            </main>
            
        </div>

    <footer class="py-4 bg-dark">
        <div class="container">
            <p class="m-0 text-center text-white">
                Copyright &copy; The joeun 2024
            </p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/scripts.js"></script>
</body>
</html>
