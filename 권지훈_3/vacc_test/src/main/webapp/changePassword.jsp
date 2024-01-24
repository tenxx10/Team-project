<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="vacc_test.changePW"%> 

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Vaccine Friend</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />
    
    <style>
    .navbar {
        padding-top: 0;
        padding-bottom: 0;
    }
	</style>
  </head>
  
  
  <body>
    <!-- Responsive navbar-->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <div class="container">
        <a class="navbar-brand" href="index.jsp">접종 친구</a>
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link" href="board.jsp">Board</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="info.jsp">Info</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="mypage.jsp">Mypage</a>
            </li>
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
                    <% if (session.getAttribute("user_name") != null) { %>
                        <li class="nav-item"><p class="nav-link"> <%= session.getAttribute("user_name") %>(로그인)</p></li>
                    <% } %>
          </ul>
        </div>
      </div>
    </nav>
    
    <!-- Page content -->
    <div class="container-fluid">
      <div class="row">
        <!-- Sidebar with categories -->
        <nav
          id="sidebar"
          class="col-lg-2 col-md-5 d-md-block bg-light sticky-top"
        >
          <div class="p-4">
            <h2 class="h4 mb-4"><br /><br />카테고리</h2>
            <div class="list-group">
              <a
                href="mypage.jsp"
                class="list-group-item list-group-item-action"
              >
                <i class="bi bi-person"></i> 마이페이지
              </a>
              <a
                href="vacccine.jsp"
                class="list-group-item list-group-item-action"
              >
                <i class="bi bi-file-earmark-text"></i> 예방접종정보
              </a>
              <a
                href="calendar.jsp"
                class="list-group-item list-group-item-action"
              >
                <i class="bi bi-calendar"></i> 캘린더
              </a>
              <a
                href="board.jsp"
                class="list-group-item list-group-item-action"
              >
                <i class="bi bi-chat-left"></i> 자유게시판
              </a>
              <a
                href="info.jsp"
                class="list-group-item list-group-item-action"
              >
                <i class="bi bi-info-circle"></i> 인포메이션
              </a>
            </div>
          </div>
        </nav>
  
<main class="col-lg-10 col-md-7 ms-md-auto px-4">
        <div class="container">
        <center>
        <br><br><br><br>
<%
    HttpSession userSession = request.getSession(false);

    if (userSession != null && userSession.getAttribute("user_id") != null) {
        String userId = (String) userSession.getAttribute("user_id");
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        // 입력값 검증
        if (currentPassword == null || newPassword == null || confirmPassword == null ||
            newPassword.isEmpty() || !newPassword.equals(confirmPassword)) {
            out.println("<p style='color: red;'>입력 정보를 확인해주세요.</p>");
            out.println("<a href='mypage.jsp' class='btn btn-primary'>이전 페이지로 돌아가기</a>");
        } else {
            changePW changePW = new changePW();

            try {
                boolean isPasswordChanged = changePW.changePassword(userId, currentPassword, newPassword, confirmPassword);

                if (isPasswordChanged) {
                    out.println("<p style='color: green;'>비밀번호가 성공적으로 변경되었습니다.</p>");
                    
                    out.println("<a href='mypage.jsp' class='btn btn-primary'>이전 페이지로 돌아가기</a>");
                } else {
                    out.println("<p style='color: red;'>기존 비밀번호가 일치하지 않습니다.</p>");
                    out.println("<a href='mypage.jsp' class='btn btn-primary'>이전 페이지로 돌아가기</a>");
                }
            } catch (Exception e) {
                // 에러 메시지
                out.println("<p style='color: red;'>에러가 발생했습니다. 관리자에게 문의하세요.</p>");
                out.println("<a href='mypage.jsp' class='btn btn-primary'>이전 페이지로 돌아가기</a>");
                e.printStackTrace();
            } finally {
                //db 연결 닫기
                changePW.closeConnection();
            }
        }
    } else {
%>
    <p>로그인이 필요한 페이지입니다. <a href="login.jsp">로그인</a>해주세요.</p>
<%
    }
%>
</center>

      </div>
    </div>
    </main>
    
    
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
  </body>
</html>

