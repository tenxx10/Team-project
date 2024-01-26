<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>게시판</title>

<!-- Favicon-->
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

				<!-- 여기부터 작성하면 됩니다.-->
				
				
				<br><br>

				<div class="container"> 새로 작성해야하는 부분입니다 !</div>
				
			</main>
		</div>
	</div>


	<!-- Include footer.jsp -->
	<%@ include file="/include/footer.jsp"%>



	<script type="text/javascript">
		$(function() {
			$('#writeBtn').click(function() {
				let name = $('#name').val();
				if (name.trim() == "") {
					$('#name').focus();
					return;
				}

				let id = $('#id').val();
				if (id.trim() == "") {
					$('#id').focus();
					return;
				}

				let subject = $('#subject').val();
				if (subject.trim() == "") {
					$('#subject').focus();
					return;
				}

				let content = $('#content').val();
				if (content.trim() == "") {
					$('#content').focus();
					return;
				}

				let pwd = $('#pwd').val();
				if (pwd.trim() == "") {
					$('#pwd').focus();
					return;
				}

				$('#frm').submit();
			})
		})
	</script>
	
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->

	<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>

</body>
</html>