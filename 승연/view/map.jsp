<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">

<meta name="description" content="" />
<meta name="author" content="" />
<title>지도</title>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="../assets/favicon1.png" />
<!-- Core theme CSS (includes Bootstrap)-->
<link rel="stylesheet" type="text/css" href="../css/style.css">
<script type="text/javascript"
	src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=j343qrlqau"></script>
<style>

.custom-box {
	border: 2px solid gray;
	padding-left: 200px;
	padding-right: 200px;
	padding-top: 30px;
	padding-bottom: 30px;
	display: inline-block;
	margin-bottom: 50px;
	margin-top: 10px;
	text-align: left;
	position: relative; /* 부모 요소로 설정 */
	margin-left: 10%;
	margin-right: 10%;
	font-weight: bold;
}

.custom-box::after {
	content: "";
	position: absolute;
	width: 100%;
	height: 2px;
	background-color: gray;
	bottom: 0;
	left: 0;
}

h1.mb-4 {
	color: #495057;
	font-size: 2em; 
	font-family: 'Arial', sans-serif; 
	padding-top:5px;
	padding-bottom:0;
}

h4.head {
	color: gray;
	font-family: 'Arial', sans-serif; 
	text-align:left;
	padding-top:30px;
	font-weight: bold;
}

.check-icon {
	display: inline-block;
	margin-right: 10px;
	font-size: 1.2em;
	color: green;
}

.section-divider {
	margin-top: 20px;
	margin-bottom: 20px;
	width: 100%;
	border-bottom: 1px solid gray;
}

.map {
	width: 1200px;
	height: 500px;
	margin-left: 20%; 
	margin-right: 20%;
}

.mt-6 {
	margin-top: 100px;
	margin-bottom: 50px;
	margin-left: 10%;
	margin-right: 10%;
}



</style>
</head>

<body>

	<!-- header.jsp 포함 -->
<%@ include file="/include/header.jsp"%>

<!-- 페이지 콘텐츠 -->
<div class="container-fluid">
    <div class="row">
        <!-- cate.jsp 포함 -->
			<%@ include file="/include/cate.jsp"%>
			<!-- 주요 콘텐츠 -->
			<main class="col-lg-10 col-md-7 ms-md-auto px-4">
				<div class="text-center mt-5">


					<h1 class="mb-4">기관위치 찾기</h1>
					
					<div class="custom-box">
						<h3 class="mb-4">
							<span class="check-icon">&#10003;</span> 알려드려요
						</h3>
						<div class="section-divider"></div>
						<p class="text-center" style="color:#adb5bd">이 페이지는 근처 보건소의 위치를 편리하게 확인할 수 있는 서비스를 제공하는 페이지입니다.</p>

						<h4 class="head">1. 보건소 위치 지도</h4>
						<p>
							왼쪽에 표시된 지도는 근처 보건소의 정확한 위치를 보여줍니다.<br>지도를 확대, 축소하여 원하는 위치로
							이동할 수 있습니다.
						</p>

						<h4 class="head">2. 주의사항</h4>
						<ul>
							<li>보건소 정보는 실제 서비스 기관에서 제공하는 정확한 정보를 기반으로 합니다.</li>
							<li>지도에서 표시된 위치는 참고용이며, 실제 보건소 방문 시에는 아래의 표를 참고하시어 <br>정확한 주소 및 연락처를 확인해주세요.</li>
						</ul>
						<p style="padding-top:30px; text-align:right; color:#adb5bd"> - 2024.01 기준 부산권 보건소 업데이트</p>
					</div>

				</div>



				<div class="row">
					<!-- 왼쪽: 지도 -->
					<div class="col-md-6">
						<div id="map" class="map"></div>
					</div>
				</div>
					

					<!-- 오른쪽: 테이블 -->
				
						<div id="location-info" class="mt-6 text-left">
							<table class="table table-striped" style="margin-right: 70px;">
								<thead>
									<tr>
										<th scope="col">#</th>
										<th scope="col">보건소</th>
										<th scope="col">상세 주소</th>
										<th scope="col">전화번호</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">A</th>
										<td>부산 동부지부 건강관리협회</td>
										<td>부산광역시 동래구 충렬대로 145</td>
										<td>051-553-6400</td>
									</tr>
									<tr>
										<th scope="row">B</th>
										<td>부산 서부지부 건강관리협회</td>
										<td>부산광역시 사상구 학감대로 230</td>
										<td>051-601-9700</td>

									</tr>
									<tr>
										<th scope="row">C</th>
										<td>연제구 보건소</td>
										<td>부산광역시 연제구 연제로 2</td>
										<td>051-665-4781</td>

									</tr>
									<tr>
										<th scope="row">D</th>
										<td>해운대구 보건소</td>
										<td>부산광역시 해운대구 해운대로61번길 28</td>
										<td>051-746-4000</td>

									</tr>
									<tr>
										<th scope="row">E</th>
										<td>반송 보건소</td>
										<td>부산광역시 해운대구 반송로 853</td>
										<td>051-544-4000</td>

									</tr>
									<tr>
										<th scope="row">F</th>
										<td>사상구 보건소</td>
										<td>부산광역시 사상구 학감대로 242</td>
										<td>051-310-4000</td>

									</tr>
									<tr>
										<th scope="row">G</th>
										<td>부산진구 보건소</td>
										<td>부산광역시 부산진구 황령대로8번길 36</td>
										<td>051-645-4000</td>
									</tr>
									<tr>
										<th scope="row">H</th>
										<td>기장군 보건소</td>
										<td>부산광역시 기장군 기장읍 신천리 1</td>
										<td>051-709-4795</td>
									</tr>
									<tr>
										<th scope="row">I</th>
										<td>부산 강서구 보건소</td>
										<td>부산광역시 강서구 공항로811번가길 36</td>
										<td>051-970-3415</td>

									</tr>
									<tr>
										<th scope="row">J</th>
										<td>영도 보건지소</td>
										<td>부산광역시 영도구 태종로 423</td>
										<td>051-419-4901</td>

									</tr>
									<tr>
										<th scope="row">K</th>
										<td>덕천보건지소</td>
										<td>부산광역시 북구 만덕대로89번길 9</td>
										<td>051-309-7071</td>

									</tr>
									<tr>
										<th scope="row">L</th>
										<td>금정구 보건소</td>
										<td>부산광역시 금정구 중앙대로 1777</td>
										<td>051-519-5051</td>

									</tr>
									<tr>
										<th scope="row">M</th>
										<td>동래구 보건소</td>
										<td>부산광역시 동래구 명륜로187번길 56</td>
										<td>051-555-4000</td>

									</tr>
									<tr>
										<th scope="row">N</th>
										<td>부산 중구 보건소</td>
										<td>부산광역시 중구 중구로 120</td>
										<td>051-600-4741</td>

									</tr>
									<tr>
										<th scope="row">O</th>
										<td>부산서구 보건소</td>
										<td>부산광역시 서구 부용로 30</td>
										<td> 051-242-4000</td>
									</tr>
									<tr>
										<th scope="row">P</th>
										<td>김해시 보건소</td>
										<td>경상남도 김해시 분성로 227</td>
										<td>055-330-8311</td>

									</tr>
									<tr>
										<th scope="row">Q</th>
										<td>부산남구 보건소</td>
										<td>부산광역시 남구 못골로 23</td>
										<td>051-607-6476</td>

									</tr>
									<tr>
										<th scope="row">R</th>
										<td>부산동구 보건소</td>
										<td>부산광역시 동구 구청로 1</td>
										<td>051-440-6500</td>

									</tr>
									<tr>
										<th scope="row">S</th>
										<td>사하구 보건소</td>
										<td>부산광역시 사하구 하신번영로127번길 2</td>
										<td>051-220-5701</td>

									</tr>
									<tr>
										<th scope="row">T</th>
										<td>수영구 보건소</td>
										<td>부산광역시 수영구 수영로 637-5</td>
										<td>051-752-4000</td>
									</tr>

								</tbody>
							</table>
							<p>
								<br> <br><a
									href="https://www.nhis.or.kr/nhis/healthin/retrieveExmdAdminSearch.do"> 그외 보건소
									검색 참고</a>
							</p>

						</div>
					
		
			</main>
    </div>
</div>

<!-- footer.jsp 포함 -->
<%@ include file="/include/footer.jsp"%>


	<script src="../js/map.js"></script>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>




