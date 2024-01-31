<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="vacc_test.changePW"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Vaccine Friend</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="../assets/favicon1.png" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="..css/styles.css" rel="stylesheet" />

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


					<%
					HttpSession userSession = request.getSession(false);

					if (userSession != null && userSession.getAttribute("user_id") != null) {
						String userId = (String) userSession.getAttribute("user_id");
						String currentPassword = request.getParameter("currentPassword");
						String newPassword = request.getParameter("newPassword");
						String confirmPassword = request.getParameter("confirmPassword");

						// 입력값 검증
						if (currentPassword == null || newPassword == null || confirmPassword == null || newPassword.isEmpty()
						|| !newPassword.equals(confirmPassword)) {
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
					<p>
						로그인이 필요한 페이지입니다. <a href="login.jsp">로그인</a>해주세요.
					</p>
					<%
					}
					%>
				</div>
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

