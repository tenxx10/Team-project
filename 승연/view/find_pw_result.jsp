<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*" %>
<%
    // 데이터베이스 연결을 위한 정보 설정
    String url = "jdbc:mysql://localhost:3306/vacc"; // 자신의 데이터베이스 URL
    String dbUsername = "root"; // 데이터베이스 사용자 이름
    String dbPassword = ""; // 데이터베이스 비밀번호

    // 폼에서 전달된 데이터 받기
    String userId = request.getParameter("user_id");
    String userEmail = request.getParameter("user_email");

    Connection conn = null;
    String message = null;

    try {
        // JDBC 드라이버 로딩
        Class.forName("com.mysql.cj.jdbc.Driver");

        // 데이터베이스 연결
        conn = DriverManager.getConnection(url, dbUsername, dbPassword);

        // SQL 쿼리 작성 - 아이디와 이메일 확인
        String selectQuery = "SELECT * FROM user WHERE user_id = ? AND user_email = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(selectQuery)) {
            pstmt.setString(1, userId);
            pstmt.setString(2, userEmail);

            // 쿼리 실행
            ResultSet resultSet = pstmt.executeQuery();

            // 아이디와 이메일 확인 결과에 따라 메시지 설정
            if (resultSet.next()) {
                // 아이디와 이메일이 일치
                // 사용자에게 저장된 비밀번호를 보여줌
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>비밀번호 찾기 결과</title>

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
					<h1>비밀번호 찾기 결과</h1>
					<br> <br> <input type="hidden" name="user_id"
						value="<%=userId%>">

					<p>
						회원님의 비밀번호는 "<%=resultSet.getString("user_pw")%>" 입니다.
					</p>
					<form action="login.jsp" method="get">
						<input type="submit" value="로그인 페이지로 돌아가기" class="btn btn-success">
					</form>
				</div>

				<%
				} else {
				// 아이디 또는 이메일이 일치하지 않음
				message = "입력한 정보와 일치하는 사용자가 없습니다.";
				}
				}

				} catch (Exception e) {
				// 오류 발생 시 처리
				e.printStackTrace();
				message = "비밀번호 찾기 중 오류가 발생했습니다.";
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


			</main>
		</div>
	</div>

	<!-- Include footer.jsp -->
	<%@ include file="/include/footer.jsp"%>



	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>