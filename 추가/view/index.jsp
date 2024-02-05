<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta name="description" content="" />
<meta name="author" content="" />
<title>Vaccine Friend</title>


<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="../assets/favicon1.png" />
<!-- Core theme CSS (includes Bootstrap)-->
<link rel="stylesheet" type="text/css" href="../css/style.css">

<style type="text/css">


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

				<!-- 헤더 -->
				<div class="container">
					<div class="text-center my-5"></div>
				</div>


				<!-- Page content : 어떤 형식으로 할 지 미정-->
				<div class="container">
					<div class="row">
						<!-- 슬라이드 형식 -->



						<div id="carouselExampleDark" class="carousel carousel-dark slide"
							data-bs-ride="carousel" style="margin-bottom: 50px;">
							<div class="carousel-indicators">
								<button type="button" data-bs-target="#carouselExampleDark"
									data-bs-slide-to="0" class="active" aria-current="true"
									aria-label="Slide 1"></button>
								<button type="button" data-bs-target="#carouselExampleDark"
									data-bs-slide-to="1" aria-label="Slide 2"></button>
								<button type="button" data-bs-target="#carouselExampleDark"
									data-bs-slide-to="2" aria-label="Slide 3"></button>
							</div>
							<div class="carousel-inner">
								<div class="carousel-item active" data-bs-interval="10000">
									<img src="../assets/img/index2.png" class="d-block w-100"
										alt="...">
									<div class="carousel-caption d-none d-md-block">

										<p style="font-weight: bold; color: white;">필수 접종관련 정보를
											확인할 수 있는 사이트입니다.</p>
									</div>
								</div>
								<div class="carousel-item" data-bs-interval="2000">
									<img src="../assets/img/index1.png" class="d-block w-100"
										alt="...">
									<div class="carousel-caption d-none d-md-block">
										
										<p style="font-weight: bold;">필수 접종관련 정보를 확인할 수 있는 사이트입니다.</p>
									</div>
								</div>
								<div class="carousel-item">
									<img src="../assets/img/index4.png" class="d-block w-100"
										alt="...">
									<div class="carousel-caption d-none d-md-block">
										<h5>Vaccine Friend</h5>
										<p style="font-weight: bold;">필수 접종관련 정보를 확인할 수 있는 사이트입니다.</p>
									</div>
								</div>
							</div>
							<button class="carousel-control-prev" type="button"
								data-bs-target="#carouselExampleDark" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button"
								data-bs-target="#carouselExampleDark" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
						</div>



						<!-- Blog entries-->
						<div class="col-lg-8">
							<!-- Featured blog post-->
							<div class="card mb-4">
								<a href="#!"><img class="card-img-top"
									src="../assets/img/vacc2.png" alt="..." /></a>
								<div class="card-body">
									<div class="small text-muted">January, 2024</div>
									<h2 class="card-title">필수 예방 접종 확인</h2>
									<p class="card-text">
									<div></div>
									<div>
										<br>「감염병의 예방 및 관리에 관한 법률」 제24조에 따라 예방접종 대상 감염병 중 <br>
										관할 보건소를 통해 필수적으로 예방접종을 시행해야 하는<br> 감염병에 대한 예방접종을 말합니다. <br>
										<br>
									</div>
									<a class="btn bg-warning" href="vacInfo.jsp">바로 가기 →</a>
								</div>
							</div>
							<!-- Nested row for non-featured blog posts-->
							<div class="row">
								<div class="col-lg-6">
									<!-- Blog post-->
									<div class="card mb-4">
										<a href="#!"><img class="card-img-top"
											src="../assets/img/vacc1.jpg" alt="..." /></a>
										<div class="card-body">
											<div class="small text-muted">January, 2024</div>
											<h2 class="card-title h4">오늘의 예방접종 소식</h2>
											<p class="card-text">
												<br>감기가 유행인 한겨울, 나에게 알맞는 예방접종 <br> 소식 알아보기<br>
											</p>
											<a class="btn bg-warning"
												href="https://nip.kdca.go.kr/irhp/mngm/goVcntMngm.do?menuLv=3&menuCd=341">
												바로 가기 →</a>
										</div>
									</div>
									<!-- Blog post-->
									<div class="card mb-4">
										<a href="#!"><img class="card-img-top"
											src="../assets/img/vacc3.jpg" alt="..." /></a>
										<div class="card-body">
											<div class="small text-muted">January, 2024</div>
											<h2 class="card-title h4">예방접종 증명서 발급</h2>
											<p class="card-text">
												<br>예방접종증명서를 의료기관 및 보건기관 방문없이 <br> 간편하게 온라인을 통해
												발급받으실 수 있습니다.
											</p>
											<a class="btn bg-warning"
												href="https://nip.kdca.go.kr/irhp/mngm/goVcntMngm.do?menuLv=3&menuCd=341">바로
												가기→</a>
										</div>
									</div>
								</div>
								<div class="col-lg-6">
									<!-- Blog post-->
									<div class="card mb-4">
										<a href="#!"><img class="card-img-top"
											src="../assets/img/vacc4.jpg" alt="..." /></a>
										<div class="card-body">
											<div class="small text-muted">January, 2024</div>
											<h2 class="card-title h4">성인 예방접종 일정표</h2>
											<p class="card-text">
												<br>각 연령대의 성인에게 권장되는 예방접종으로 <br> 개인별 건강상태(질환),
												직업∙상황 등에 따라 <br>권장되는 백신이 달라질 수 있습니다.
											</p>
											<a class="btn bg-warning"
												href="https://nip.kdca.go.kr/irhp/images/egovframework/rte/infm/Schedule_for_Adult_2019_1.gif">바로
												가기→</a>
										</div>
									</div>
									<!-- Blog post-->
									<div class="card mb-4">
										<a href="#!"><img class="card-img-top"
											src="../assets/img/vacc5.jpg" alt="..." /></a>
										<div class="card-body">
											<div class="small text-muted">January, 2024</div>
											<h2 class="card-title h4">
												광진구, 어르신 폐렴구균 무료 <br>예방접종 지원… 130곳서 가능
											</h2>
											<p class="card-text">서울시 광진구, 65세 노인 무료접종 ...</p>
											<a class="btn bg-warning"
												href="https://www.news1.kr/articles/5281700">기사 읽기 →</a>
										</div>
									</div>
								</div>
							</div>
							<!-- Pagination // 정적 페이지 -->
							<nav aria-label="Pagination">
								<hr class="my-0" />
								<ul class="pagination justify-content-center my-4">
									<li class="page-item disabled"><a class="page-link"
										href="#" tabindex="-1" aria-disabled="true">이전</a></li>
									<li class="page-item active" aria-current="page"><a
										class="page-link" href="#!">1</a></li>
									<li class="page-item"><a class="page-link" href="#!">2</a>
									</li>
									<li class="page-item"><a class="page-link" href="#!">3</a>
									</li>
									<li class="page-item disabled"><a class="page-link"
										href="#!">...</a></li>
									<li class="page-item"><a class="page-link" href="#!">15</a>
									</li>
									<li class="page-item disabled"><a class="page-link"
										href="#!">다음</a></li>
								</ul>
							</nav>
						</div>
						<!-- Side widgets-->
						<div class="col-lg-4">
							<!-- 날짜 넣었음 -->
							<div class="card mb-4">
								<div class="card-header">오늘의 날짜</div>
								<div class="card-body">
									<%
				          				Date today = new Date();
								        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
								        String todayStr = dateFormat.format(today);
								        out.println( todayStr);
								    %>
								</div>
							</div>
							<!-- Search 기능 * 정적 -->
							<div class="card mb-4">
								<div class="card-header">Search</div>
								<div class="card-body">
									<div class="input-group">
										<input class="form-control" type="text"
											placeholder="검색페이지로 이동" aria-label="검색페이지로 이동"
											aria-describedby="button-search" />
										<button class="btn btn-primary" id="button-search"
											type="button">Go!</button>
									</div>
								</div>
							</div>
							<!-- Categories widget-->
							<div class="card mb-4">
								<div class="card-header">Categories</div>
								<div class="card-body">
									<div class="row" style="text-align: left;">
										<div class="col-sm-6">
											<ul class="mb-0">
												<li><a href="vacInfo.jsp">예방접종 정보</a></li>
												<li><a href="map.jsp">주변 보건소 위치</a></li>
												<li> <a  href="<%=request.getContextPath()%>/boardList.boa">자유 게시판</a></li>
											</ul>
										</div>
										<div class="col-sm-6">
											<ul class=" mb-0">
												<li><a href="calendar.jsp">보건 캘린더</a></li>
												<li><a href="mypage.jsp">마이페이지</a></li>
												<li><a href="<%=request.getContextPath()%>/boardList.bo">공지사항</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<!-- Side widget-->
							<div class="card mb-4">
								<div class="card-header">오늘의 건강정보</div>
								<div class="card-body">
									현재 <strong>전국감기</strong>는 경고단계입니다.
								</div>
							</div>
						</div>


					</div>

				</div>
			</main>
		</div>
	</div>


	<!-- Include footer.jsp -->
	<%@ include file="/include/footer.jsp"%>


	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>

	<!-- search Go! 버튼-->
	<script>
		document.getElementById("button-search")
				.addEventListener(
						"click",
						function() {
							// Get the search term from the input field
							var searchTerm = document
									.querySelector(".form-control").value;

							// Redirect to search.jsp with the search term as a query parameter
							window.location.href = "search.jsp?term="
									+ encodeURIComponent(searchTerm);
						});
	</script>

</body>
</html>