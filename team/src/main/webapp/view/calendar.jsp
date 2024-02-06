<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>캘린더</title>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="../assets/favicon1.png" />
<!-- Core theme CSS (includes Bootstrap)-->
<link rel="stylesheet" type="text/css" href="../css/style.css">

<link href='../packages/core/main.css' rel='stylesheet' />
<link href='../packages/daygrid/main.css' rel='stylesheet' />
<link href='../packages/timegrid/main.css' rel='stylesheet' />
<link href='../packages/list/main.css' rel='stylesheet' />
<script src='../packages/core/main.js'></script>
<script src='../packages/interaction/main.js'></script>
<script src='../packages/daygrid/main.js'></script>
<script src='../packages/timegrid/main.js'></script>
<script src='../packages/list/main.js'></script>
<script>
	// 문서 로드 후 실행
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');

		// 헤더 설정
		var calendar = new FullCalendar.Calendar(calendarEl, {
			plugins: ['interaction', 'dayGrid', 'timeGrid', 'list'],
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
			},
			defaultDate: '2024-01-28',
			navLinks: true,
			businessHours: true,

			// 이벤트 및 편집 가능 설정
			editable: true,
			events: [
				{
					title: '신정',
					start: '2024-01-01',
				},
				{
					title: '설날',
					start: '2024-02-09',
					end: '2024-02-12'
				}, {
					title: '대체 공휴일',
					start: '2024-02-12',
				}, {
					title: '삼일절',
					start: '2024-03-01'
				}, {
					title: '22대 국회의원 선거일',
					start: '2024-04-10'
				}, {
					title: '어린이날',
					start: '2024-05-05'
				}, {
					title: '어린이날 (대체 공휴일)',
					start: '2024-05-06'
				}, {
					title: '부처님 오신날',
					start: '2024-05-15'
				}, {
					title: '현충일',
					start: '2024-06-06'
				}, {
					title: '광복절',
					start: '2024-08-15'
				}, {
					title: '추석 연휴',
					start: '2024-09-16',
					end: '2024-09-19'
				}, {
					title: '개천절',
					start: '2024-10-03'
				}, {
					title: '한글날',
					start: '2024-10-09'
				}, {
					title: '크리스마스',
					start: '2024-12-25'
				},

				// 이벤트 겹침 및 배경 색상 설정:
				{
					groupId: 'holiday',
					rendering: 'background',
					color: '#ff9f89',
					constraint: 'holiday'
				}, {
					daysOfWeek: [0, 6], // 0은 일요일, 6은 토요일
					title: '보건소 휴무일',
					rendering: 'background',
					color: '#ff9f89'
				}
			]
		});

		calendar.render();
	});
</script>

<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 1000px;
	margin: 0 auto;
	margin-bottom:50px;
}

.custom-box {
	border: 2px solid gray;
	padding-left: 300px;
	padding-right: 300px;
	padding-top: 30px;
	padding-bottom: 30px;
	display: inline-block;
	margin-bottom: 50px;
	margin-top: 1px;
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
	padding-top: 5px;
	padding-bottom: 0;
}

h4.head {
	color: gray;
	font-family: 'Arial', sans-serif;
	text-align: left;
	padding-top: 30px;
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
				
				<div class="text-center mt-5">


					<div class="custom-box">
						<h4 class="mb-4">
							<span class="check-icon">&#10003;</span> 휴무일을 확인하세요 !
						</h4>
						<div class="section-divider"></div>
						<p class="text-center" style="color:#adb5bd">접종 예약 전, 휴무일을 참고해주세요</p>

						<h4 class="head">보건소 휴무일</h4>
						<p>
							2024 국가 공휴일 기준 보건소 휴무일입니다.<br> 매주 주말을 포함한 공휴일은 쉬는 날입니다. <br>
							평소 보건소 운영시간은 평일 오전 9시부터 오후 6시입니다.
						</p>

					</div>

				</div>


				<br> <br>
				
				<div id="calendar"></div>
				<br> <br>

		

			</main>
		</div>
	</div>


	<!-- Include footer.jsp -->
	<%@ include file="/include/footer.jsp"%>





	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>



</body>
</html>