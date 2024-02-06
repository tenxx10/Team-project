<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*" %>

<%
    // db 연결을 위한 정보 설정
    String url = "jdbc:mariadb://localhost:3306/project"; // 자신의 db URL
    String dbUsername = "root"; //db 사용자 이름
    String dbPassword = "1234"; // db 비밀번호

    // 폼에서 전달된 데이터 받기
    String username = request.getParameter("user_id");
    String password = request.getParameter("user_pw");

    Connection conn = null;
    String message = null;

    try {
        // JDBC 드라이버 로딩
        Class.forName("org.mariadb.jdbc.Driver");

        // 데이터베이스 연결
        conn = DriverManager.getConnection(url, dbUsername, dbPassword);

        // SQL 쿼리 작성 - 사용자 인증
        String selectQuery = "SELECT * FROM user WHERE user_id = ? AND user_pw = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(selectQuery)) {
            pstmt.setString(1, username);
            pstmt.setString(2, password);

         // 쿼리 실행
            ResultSet resultSet = pstmt.executeQuery();
            // 사용자 인증 결과 확인
            if (resultSet.next()) {
                // 사용자 인증 성공
                message = "로그인 성공!";
               
                // 세션에 사용자 정보 저장
               
                session.setAttribute("user_id", username);
                session.setAttribute("user_name", resultSet.getString("user_name"));
                session.setAttribute("user_email", resultSet.getString("user_email"));
                session.setAttribute("user_phone", resultSet.getString("user_phone"));
                session.setAttribute("user_date", resultSet.getString("user_date"));
             // returnUrl 디버깅
                String returnUrl = request.getParameter("returnUrl");
                System.out.println("Return URL: " + returnUrl);
               
        if (returnUrl != null && !returnUrl.isEmpty()) {
            response.sendRedirect(returnUrl); // returnUrl이 있는 경우 해당 페이지로 이동
        } else {
            response.sendRedirect("login_success.jsp"); // returnUrl이 없는 경우 기본 페이지로 이동
        }
           
            } else {
                // 사용자 인증 실패
                message = "아이디 또는 비밀번호가 일치하지 않습니다.";
            }
        }


    } catch (Exception e) {
        // 오류 발생 시 처리
        e.printStackTrace();
        message = "로그인 중 오류가 발생했습니다.";
    } finally {
        try {
            // Connection 닫기
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>로그인 결과</title>
<link rel="icon" type="image/x-icon" href="../assets/favicon1.png" />
<!-- Core theme CSS (includes Bootstrap)-->
<link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>

	<!-- Include header.jsp -->
	<%@ include file="/include/header.jsp"%>

	<!-- Page content -->
	<div class="container-fluid">
		<div class="row">

			<!-- Include cate.jsp -->
			<%@ include file="/include/cate.jsp"%>


			<!-- Main content -->
			<main class="col-lg-10 col-md-7 ms-md-auto px-4">

				<div class="container">
					<br>
					<h1>로그인 결과</h1>
					<p><%=message%></p>
				</div>
			</main>
		</div>
	</div>

	<%@ include file="/include/footer.jsp"%>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>