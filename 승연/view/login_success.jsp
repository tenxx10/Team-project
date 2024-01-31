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
<title>Login Success</title>
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
				<div class="container">
					<br>
					<br>

					<p>
						환영합니다,
						<%= session.getAttribute("user_name") %>님!
					</p>

					<p>
						<a href="mypage.jsp" class="btn btn-primary">마이페이지</a>
					</p>

					<!-- 로그아웃 모달 불러오기 -->
					<jsp:include page="logout_modal.jsp" />
					<p>
						<a href="logout.jsp" class="btn btn-success"
							data-bs-toggle="modal" data-bs-target="#logoutModal">로그아웃</a>
					</p>


				</div>


			</main>
		</div>
	</div>

	<!-- Include footer.jsp -->
	<%@ include file="/include/footer.jsp"%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


