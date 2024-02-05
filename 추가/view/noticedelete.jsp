<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%
	Integer boardNumObj = (Integer) request.getAttribute("board_num");
	int board_num = (boardNumObj != null) ? boardNumObj.intValue() : 0;

	String nowPage=(String)request.getAttribute("page");
%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>공지사항</title>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="../assets/favicon1.png" />
<!-- Core theme CSS (includes Bootstrap)-->
<link rel="stylesheet" type="text/css" href="../css/style.css">

<style type="text/css">
#writeForm {

	padding: 50px;
	border-radius: 10px;
}

#BOARD_CONTENT {
	height: 1000px;
	width: 100%;
	resize: none;
	max-width: 800px;
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
				<section id="passForm">
					<h2 style="font-family: 'Black Han Sans', sans-serif;">공지사항 글
							삭제</h2>
					<br>

					<%
					HttpSession userSession = request.getSession(false);
					String id = (String) userSession.getAttribute("user_id");
					if (id != null && id.equals("admin1234")) { // 관리자 아이디 넣기 !! 
					%>


					<form name="deleteForm"
						action="boardDeletePro.bo?board_num=<%=board_num %>" method="post">
						<input type="hidden" name="page" value="<%=nowPage %>" />
						<table>
							<tr>
								<td><label>글비밀번호:</label></td>
								<td><input name="BOARD_PASS" type="password"></td>
							</tr>
							<tr>
								<td><input type="submit" value="삭제" />&nbsp;&nbsp; <input
									type="button" value="돌아가기" onClick="javascript:history.go(-1)" />
						</table>
					</form>

					<%
						} else {
						out.println("<br>");
						%>
					<br>
					<img src="../assets/admin.png" alt="로그인이 필요한 페이지입니다."><br>
					<br>

					<%
						out.println("<br><button class=\"btn btn-secondary\" onclick=\"history.back()\">이전 페이지로 돌아가기</button>");
						}
						%><br> <br>

				</section>


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
</body>
</html>