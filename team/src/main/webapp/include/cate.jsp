<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<!-- Bootstrap core CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link href="../css/style.css" rel="stylesheet">

<style>
/* 추가적인 CSS 스타일링을 원하면 여기에 작성하세요 */
.disease-list {
	display: none; /* 초기에는 목록을 숨깁니다. */
	margin-left: 20px;
	position: absolute;
	top: 0;
	left: 0;
	z-index: 1000; /* 다른 요소 위에 나타나도록 z-index 설정 */
	background-color: #fff; /* 배경색 설정 (필요에 따라 수정) */
	border: 1px solid #ccc; /* 테두리 추가 (필요에 따라 수정) */
	padding: 10px;
	text-align:center;
}
</style>
</head>
<body>

	<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
		data-bs-target="#sidebar" aria-controls="sidebar"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<nav id="sidebar" class="col-lg-2 col-md-5 d-md-block sticky-top"
		style="margin-bottom: 16%;">
		<div class="p-4 text-center" style="font-weight: bold;">
			<h2 class="h4 mb-4">
				<br /> <br />- Category
			</h2>
            <div class="list-group">
                <a href="<%=request.getContextPath()%>/view/mypage.jsp" class="list-group-item list-group-item-action ">
                    <i class="bi bi-person"></i> 마이페이지
                </a>
                <a href="<%=request.getContextPath()%>/view/vacInfo.jsp" class="list-group-item list-group-item-action"> <!-- 예방접종 정보 카테고리추가 -->
                    <i class="bi bi-file-earmark-text"></i> 예방접종정보
                </a>
				<a href="<%=request.getContextPath()%>/view/vacResForm.jsp" class="list-group-item list-group-item-action"> <!-- 예방접종 예약카테고리 추가 -->
                    <i class="bi bi-file-earmark-text"></i> 예방접종예약
                </a>
                <a href="<%=request.getContextPath()%>/view/map.jsp" class="list-group-item list-group-item-action">
                    <i class="bi bi-info-circle"></i> 기관위치 찾기
                </a>
                <a href="<%=request.getContextPath()%>/view/search.jsp" class="list-group-item list-group-item-action">
                    <i class="bi bi-info-circle"></i> 검색 기능
                </a>
                <a href="<%=request.getContextPath()%>/view/calendar.jsp" class="list-group-item list-group-item-action">
                    <i class="bi bi-calendar"></i> 캘린더
                </a>
                <a href="<%=request.getContextPath()%>/boardList.boa" class="list-group-item list-group-item-action">
                    <i class="bi bi-chat-left"></i> 자유게시판
                </a>
                <a href="<%=request.getContextPath()%>/boardList.bo" class="list-group-item list-group-item-action">
                    <i class="bi bi-info-circle"></i> 공지사항
                </a>
            </div>
        </div>
    </nav>

    <!-- Bootstrap core JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS -->
    <script src="js/scripts.js"></script>
</body>
</html>