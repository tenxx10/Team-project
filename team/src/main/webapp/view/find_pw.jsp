<!-- findPasswordForm.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>비밀번호 찾기 </title>
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
				<main class="col-lg-10 col-md-7 ms-md-auto px-4">
					<div class="container">
						<form action="find_pw_result.jsp" method="post">
							<br> <br>
							<h2>비밀번호 찾기</h2>
							<br>
							<div class="mb-3">
								<label for="username" class="form-label">아이디</label> <input
									type="text" class="form-control" id="user_id" name="user_id"
									style="width: 300px" required>
							</div>
							<div class="mb-3">
								<label for="email" class="form-label">이메일</label> <input
									type="email" class="form-control" id="user_email"
									name="user_email" style="width: 300px" required>
							</div>
							<br>
							<button type="submit" class="btn btn-primary">비밀번호 찾기</button>
						</form>
					</div>
				</main>

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