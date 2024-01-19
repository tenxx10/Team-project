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
    <link rel="icon" type="image/x-icon" href="/assets/favicon.ico" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    
    <style type="text/css">
    	#writeForm{
    		background-color: #f0f0f0;
    		padding: 50px;
    		border-radius: 10px;
    	}
    	
    	#BOARD_CONTENT{
    		height: 1000px;
    		width: 100%;
    		resize: none;
   			max-width: 800px;
    	}
    </style>
    
  </head>
   <body>
     <!-- Include header.jsp -->
    <%@ include file="/include_team/header.jsp" %>
    <!-- Page content -->
    <div class="container-fluid">
      <div class="row">
    <!-- Include cate.jsp -->
    <%@ include file="/include_team/cate.jsp" %>
	<!-- Main content -->
        <main class="col-lg-10 col-md-7 ms-md-auto px-4">
        
        <!-- 여기부터 작성하면 됩니다.-->
        <!-- 게시판 수정 -->
        <section id="articleForm">
        	<h2>글 내용 상세보기</h2>
        	<section id="basicInfoArea">
        		제목:<br>
        		<%if(article != null){ %>
        			<%=article.getBOARD_SUBJECT() %>
        		<%}else{ %>
        			게시물이 없습니다.
        		<%} %>
        		<br>
        		첨부파일:
        		<%if (article != null && !(article.getBOARD_FILE()==null)){ %>
        			<a href="file_down?downFile=<%=article.getBOARD_FILE() %>"><%=article.getBOARD_FILE() %></a>
        		<%} %>
        	</section>
        </section>
        <section id="commandList">
        	<% if (article != null){ %>
        		<a href="boardReplyForm.bo?board_num=<%=article.getBOARD_NUM() %>&page=<%=nowPage %>">[답변] </a>
        		<a href="boardModifyForm.bo?board_num=<%=article.getBOARD_NUM() %>">[수정]</a>
        		<a href="boardDeleteForm.bo?board_num=<%=article.getBOARD_NUM() %>&page=<%=nowPage %>">[삭제]</a>
        		<a href="boardListForm.bo?page=<%=nowPage %>">[목록]</a>
        	<%}else{ %>
        		게시물이 없습니다.
        	<%} %>
        </section>
        
        
        </main>
      </div>
    </div>
    
    
<!-- Include footer.jsp -->
    <%@ include file="/include_team/footer.jsp" %>

    
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
  </body>
</html>