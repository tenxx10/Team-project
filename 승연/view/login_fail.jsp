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
<title>로그인 결과</title>
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

			<main class="col-lg-10 col-md-7 ms-md-auto px-4">


				<div class="container">
					<br>
					<br>
					<br>
					<br>
					<br>
					<p><%=request.getAttribute("message")%></p>
					<br>
					<br>
					<br>
					<p>
						<a href="login.jsp">로그인 화면 돌아가기</a>
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
