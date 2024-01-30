<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ page import="board.model.BoardBean2" %>
<%

	BoardBean2 article = (BoardBean2)request.getAttribute("article");
	if (article == null){
		
	}
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
    		background-color: #f0f0f0;
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
    
    <script>
        function modifyboard() {
            // 여기에 실제 수정 동작을 처리하는 코드를 추가하세요.
            // 예: form.submit();
            document.modifyform.submit();
        }
    </script>
    
  </head>
   <body>
     <!-- Include header.jsp -->
    <%@ include file="/include/header.jsp" %>
    <!-- Page content -->
    <div class="container-fluid">
      <div class="row">
    <!-- Include cate.jsp -->
    <%@ include file="/include/cate.jsp" %>
	<!-- Main content -->
        <main class="col-lg-10 col-md-7 ms-md-auto px-4">
        
        <!-- 여기부터 작성하면 됩니다.-->
        <!-- 게시판 등록 -->
        <section id="writeForm">
        	<h2>공지사항글수정</h2>
        	<form action="boardModifyPro.boa" method="post" name="modifyform">
        	<%-- article이 null이 아닐 때만 값을 출력하도록 수정 --%>
        	<input type="hidden" name="BOARD_NUM" value="<%= article != null ? article.getBOARD_NUM() : "" %>">
        		<table>
        			<tr>
        				<td class="td_left"><label for="BOARD_NAME">글쓴이</label></td>
        				<td class="td_right"><input type="text" name="BOARD_NAME" id="BOARD_NAME" value="<%= article != null ? article.getBOARD_NAME() : "" %>"/></td>
        			</tr>
        			<tr>
        				<td class="td_left"><label for="BOARD_PASS">비밀번호</label></td>
        				<td class="td_right"><input name="BOARD_PASS" type="password" id="BOARD_PASS"/></td>
        			</tr>
        			<tr>
        				<td class="td_left"><label for="BOARD_SUBJECT">제목</label></td>
        				<td class="td_right"><input id="BOARD_SUBJECT" name="BOARD_SUBJECT" type="text" value="<%= article != null ? article.getBOARD_SUBJECT() : "" %>"/></td>
        			</tr>
        			<tr>
        				<td class="td_left"><label for="BOARD_CONTENT">내용</label></td>
        				<td><textarea name="BOARD_CONTENT" id="BOARD_CONTENT" cols="40" rows="15"><%= article != null ? article.getBOARD_CONTENT() : "" %></textarea></td>
        			</tr>
        		</table>
        			<section id="commandCell">
        				<a href="javascript:modifyboard()">[수정]</a>&nbsp;&nbsp;
        				<a href="javascript:history.go(-1)">[뒤로]</a>
        			</section>
        	</form>
        </section>
        <!-- 게시판 등록 -->
   
        
        </main>
      </div>
    </div>
    
    
<!-- Include footer.jsp -->
    <%@ include file="/include/footer.jsp" %>

    
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
  </body>
</html>