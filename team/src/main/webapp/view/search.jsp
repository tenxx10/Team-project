<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>지도</title>

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


				<!-- 네이버 search api 기능 구현 -->
				<div class="text-center mt-5">
					<form id="searchFrm" style="max-width: 500px; margin: 0 auto;">
						<h2 class="mb-4">블로그 검색</h2>
						<div class="mb-4">원하시는 검색어를 입력하세요</div>
						<div class="input-group mb-3">
							<select id="startNum" class="form-select" style="width: 110px;">
								<option value="1">1페이지</option>
								<option value="11">2페이지</option>
								<option value="21">3페이지</option>
								<option value="31">4페이지</option>
								<option value="41">5페이지</option>
							</select> <input type="text" id="keyword" class="form-control"
								style="width: 200px;" placeholder="검색어를 입력하세요." />
							<button type="button" id="searchBtn" class="btn btn-primary"
								style="height: 38px;">검색 요청</button>
						</div>
					</form>
					<div class="row mt-4">
						<div id="searchResult" class="col-md-10 mx-auto">
							<!-- 검색 결과는 여기에 출력 -->
						</div>
					</div>
				</div>



			</main>
		</div>
	</div>

<div style="margin-bottom:100px;"></div>
	<!-- Include footer.jsp -->
	<%@ include file="/include/footer.jsp"%>



	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="../js/search.js"></script>


</body>
</html>


