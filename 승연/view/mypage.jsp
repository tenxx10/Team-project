<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>마이페이지</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="../assets/favicon1.png" />
<!-- Core theme CSS (includes Bootstrap)-->
<link rel="stylesheet" type="text/css" href="../css/style.css">
<style>
.navbar {
	padding-top: 0;
	padding-bottom: 0;
}
</style>
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

				<!-- 여기부터 작성하면 됩니다.-->
				<div class="container">

					<br><br>
					<h2 style="font-family:'Black Han Sans', sans-serif;">마이페이지</h2>
					<br>


					<%
                        // 세션 겟
                        HttpSession userSession = request.getSession(false);

                        if (userSession != null && userSession.getAttribute("user_id") != null) {
                            // 로그인 o
                            
                            String userId = (String) userSession.getAttribute("user_id");
                            String userName = (String) userSession.getAttribute("user_name");
                            String userEmail = (String) userSession.getAttribute("user_email");
                            String userPhone = (String) userSession.getAttribute("user_phone");
                            String userDate = (String) userSession.getAttribute("user_date");
                    %>

					<br>
					<p>
						아이디:
						<%= userId %></p>
					<p>
						이름:
						<%= userName %></p>
					<p>
						이메일:
						<%= userEmail %></p>
					<p>
						연락처:
						<%= userPhone %></p>
					<p>
						가입일:
						<%= userDate %></p>
					<a href="vacResView.jsp">예약조회</a> <br> <br> <br>

					<!-- 비밀번호 변경 모달 -->
					<div class="modal fade" id="changePasswordModal" tabindex="-1"
						role="dialog" aria-labelledby="changePasswordModalLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="changePasswordModalLabel">비밀번호
										변경</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>

								<div class="modal-body">
									<!-- 비밀번호 변경 폼 -->
									<form action="changePassword.jsp" method="post">
										<div class="mb-3">
											<label for="currentPassword" class="form-label">현재
												비밀번호</label> <input type="password" class="form-control"
												id="currentPassword" name="currentPassword" required>
										</div>
										<div class="mb-3">
											<label for="newPassword" class="form-label">새로운 비밀번호</label>
											<input type="password" class="form-control" id="newPassword"
												name="newPassword" required>
										</div>
										<div class="mb-3">
											<label for="confirmPassword" class="form-label">비밀번호
												확인</label> <input type="password" class="form-control"
												id="confirmPassword" name="confirmPassword" required>
										</div>
										<button type="submit" class="btn btn-primary">비밀번호 변경</button>
									</form>
								</div>

								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">닫기</button>
								</div>
							</div>
						</div>
					</div>



					<!-- 로그아웃 모달 불러와서 사용 -->
					<jsp:include page="logout_modal.jsp" />
					<button type="button" class="btn btn-success"
						data-bs-toggle="modal" data-bs-target="#changePasswordModal">비밀번호
						변경</button>
					<button type="button" class="btn btn-primary"
						data-bs-toggle="modal" data-bs-target="#logoutModal">로그아웃</button>

					<%
					} else {
					// 로그인 x
					%>
					
					
					<img src="../assets/NeedLogin.png" alt="로그인이 필요한 페이지입니다.">
					<br>
					<button type="button" class="btn btn-warning"
						onclick="redirectToLoginPage()">로그인 하러가기</button>
						<br><br><br>
					

					<%
					}
					%>
				</div>
			</main>
		</div>
	</div>
	

	<!-- Include footer.jsp -->
	<%@ include file="/include/footer.jsp"%>

	<script>
function redirectToLoginPage() {
    // login.jsp 페이지로 이동
    window.location.href = 'login.jsp';
}
</script>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->

</body>
</html>
