<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ page import= "notice.model.BoardBean" %>

<%
	BoardBean article = (BoardBean)request.getAttribute("article");
	String nowPage = (String)request.getAttribute("page");
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>공지사항</title>
    
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="../assets/favicon1.png" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    
    <style type="text/css">
    	#writeForm{

    		padding: 50px;
    		border-radius: 10px;
    	}
    	
    	#BOARD_CONTENT{
    		height: 100px;
    		width: 100%;
    		resize: none;
   			max-width: 800px;
    	}
    </style>
    
  </head>
   <body>
     <!-- Include header.jsp -->
    <%@ include file="/include/header.jsp" %>
    <!-- Page content -->
	<div class="container-fluid">
		<div class="row">
			<!-- Include cate.jsp -->
			<%@ include file="/include/cate.jsp"%>
			<!-- Main content -->
			<main class="col-lg-10 col-md-7 ms-md-auto px-4">

				<!-- 여기부터 작성하면 됩니다.-->
				<!-- 게시판 답변 -->


				<section id="writeForm">
					<h2 style="font-family: 'Black Han Sans', sans-serif;">공지사항 글
							답변 등록</h2>
					<br>

					<%
					HttpSession userSession = request.getSession(false);
					String id = (String) userSession.getAttribute("user_id");
					if (id != null && id.equals("admin1234")) { // 관리자 아이디 넣기 !! 
					%>


					<form action="boardReplyPro.bo" method="post" name="boardform">
						<input type="hidden" name="page" value="<%=nowPage %>" /> <input
							type="hidden" name="BOARD_NUM"
							value="<%= (article != null) ? article.getBOARD_NUM() : "" %>">
						<input type="hidden" name="BOARD_RE_REF"
							value="<%= (article != null) ? article.getBOARD_RE_REF() : "" %>">
						<input type="hidden" name="BOARD_RE_LEV"
							value="<%= (article != null) ? article.getBOARD_RE_LEV() : "" %>">
						<input type="hidden" name="BOARD_RE_SEQ"
							value="<%= (article != null) ? article.getBOARD_RE_SEQ() : "" %>">
						<table>
							<tr>
								<td class="td_left"><label for="BOARD_NAME">글쓴이</label></td>
								<td class="td_right"><input type="text" name="BOARD_NAME"
									id="BOARD_NAME" /></td>
							</tr>
							<tr>
								<td class="td_left"><label for="BOARD_PASS">비밀번호</label></td>
								<td class="td_right"><input type="password"
									name="BOARD_PASS" id="BOARD_PASS" /></td>
							</tr>
							<tr>
								<td class="td_left"><label for="BOARD_SUBJECT">제목</label></td>
								<td class="td_right"><input type="text"
									name="BOARD_SUBJECT" id="BOARD_SUBJECT" /></td>
							</tr>
							<tr>
								<td class="td_left"><label for="BOARD_CONTENT">내용</label></td>
								<td class="td_right"><textarea id="BOARD_CONTENT"
										name="BOARD_CONTENT" cols="40" rows="15" /></textarea></td>
							</tr>
						</table>
						<section id="commandCell">
							<input type="submit" value="답변글등록" />&nbsp;&nbsp; <input
								type="reset" value="다시작성" />
						</section>
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