<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap core CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="../css/style.css" rel="stylesheet">
</head>
<body>

    <!-- Sidebar with categories -->
    <nav id="sidebar" class="col-lg-2 col-md-5 d-md-block bg-light sticky-top">
        <div class="p-4">
            <h2 class="h4 mb-4"><br /><br />카테고리</h2>
            <div class="list-group">
                <a href="mypage.jsp" class="list-group-item list-group-item-action ">
                    <i class="bi bi-person"></i> 마이페이지
                </a>
                <a href="vacInfo.jsp" class="list-group-item list-group-item-action"> <!-- 예방접종 정보 카테고리추가 -->
                    <i class="bi bi-file-earmark-text"></i> 예방접종정보
                </a>
				<a href="vacResForm.jsp" class="list-group-item list-group-item-action"> <!-- 예방접종 예약카테고리 추가 -->
                    <i class="bi bi-file-earmark-text"></i> 예방접종예약
                </a>
                <a href="map.jsp" class="list-group-item list-group-item-action">
                    <i class="bi bi-info-circle"></i> 기관위치 찾기
                </a>
                <a href="search.jsp" class="list-group-item list-group-item-action">
                    <i class="bi bi-info-circle"></i> 검색 기능
                </a>
                <a href="calendar.jsp" class="list-group-item list-group-item-action">
                    <i class="bi bi-calendar"></i> 캘린더
                </a>
                <a href="board.jsp" class="list-group-item list-group-item-action">
                    <i class="bi bi-chat-left"></i> 자유게시판
                </a>
                <a href="notice.jsp" class="list-group-item list-group-item-action">
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
