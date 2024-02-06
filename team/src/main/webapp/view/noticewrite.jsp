<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
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
	height: 100px;
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
				<!-- 게시판 등록 -->
				<section id="writeForm">
					<div class="container">
						<br> <br>
						<h2 style="font-family: 'Black Han Sans', sans-serif;">공지사항 글
							등록</h2>
						<br>

						<!--  세션을 통한 관리자 확인 -->

						<%
					HttpSession userSession = request.getSession(false);
					String id = (String) userSession.getAttribute("user_id");
					if (id != null && id.equals("admin1234")) { // 관리자 아이디 넣기 !! 
					%>



						<form action="boardWritePro.bo" method="post"
							enctype="multipart/form-data" name="boardform">
							<table>
								<tr>
									<td class="td_left"><label for="BOARD_NAME">글쓴이</label></td>
									<td class="td_right"><input type="text" name="BOARD_NAME"
										id="BOARD_NAME" size="80" required="required" /></td>
								</tr>
								<tr>
									<td class="td_left"><label for="BOARD_PASS">비밀번호</label></td>
									<td class="td_right"><input type="password"
										name="BOARD_PASS" id="BOARD_PASS" size="80"
										required="required" /></td>
								</tr>
								<tr>
									<td class="td_left"><label for="BOARD_SUBJECT">제목</label></td>
									<td class="td_right"><input name="BOARD_SUBJECT"
										type="text" id="BOARD_SUBJECT" size="80" required="required" /></td>
								</tr>
								<tr>
									<td class="td_left"><label for="BOARD_CONTENT">내용</label></td>
									<td><textarea id="BOARD_CONTENT" name="BOARD_CONTENT"
											cols="80" rows="15" required="required"></textarea></td>
								</tr>
								<tr>
									<td class="td_left"><label for="BOARD_FILE">파일첨부</label></td>
									<td class="td_right"><input name="BOARD_FILE" type="file"
										id="BOARD_FILE" /></td>
								</tr>
								<tr>
									<td colspan="2" class="text-center">
										<div class="mb-3">
											<button type="submit" class="btn btn-primary">등록</button>
											<button type="reset" class="btn btn-secondary">다시쓰기</button>
										</div>
									</td>
								</tr>
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

					</div>
				</section>
				<!-- 게시판 등록 -->



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