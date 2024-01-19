<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>게시판</title>
    
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="/assets/favicon.ico" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link rel="stylesheet" type="text/css" href="/css/style.css">
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
        
        <div class="section section-properties">
	  <div class="container">
	   	<div class="two_third first" style="height:auto">
		  <div class="col-lg-12">
		  <h2 class="font-weight-bold text-primary heading"><b>게시판 상세보기</b></h2>
		  <hr/>
		  <br><br>
		  
       	<div class="two_third first">
       		<table class="table">
       		
       			<tr>
       				<th width=20% class="text-center">번호</th>
       				<td width=30% class="text-center">${vo.no }</td>
       				<th width=20% class="text-center">작성일</th>
       				<td width=30% class="text-center">${vo.dbday }</td>
       			</tr>
       			<tr>
       				<th width=20% class="text-center">이름</th>
       				<td width=30% class="text-center">${vo.id }</td>
       				<th width=20% class="text-center">아이디</th>
       				<td width=30% class="text-center">${vo.name }</td>
       			</tr>
       			<tr>
       				<th width=20% class="text-center">제목</th>
       				<td width=30%>${vo.subject }</td>
       				<th width=20% class="text-center">조회수</th>
       				<td width=30% class="text-center">${vo.hit }</td>
       			</tr>
       			<tr>
       				<td colspan="4" height="200" valign="top">
       					<pre style="white-space: pre-wrap; background-color: white; border:none">${vo.content }</pre>
       				</td>
        		</tr>
        		
        		<tr>
        			<td colspan="4" class="text-center">
        		    	<button class="w-btn w-btn-green" type="button" style=" display: inline-block;" >
        				<a href="../freeboard/update.do?no=${vo.no }">수정</a>
        				</button>
        				<button class="w-btn w-btn-indigo" type="button" style=" display: inline-block;">
        				<span id="del">삭제</span>
        				</button>
        				<button class="w-btn w-btn-gray" type="button" style=" display: inline-block;">
        				<a href="../freeboard/list.do">목록</a>
        				</button>
        			</td>
        		</tr>
       		</table>
      	<br>
      <div id="comments">
      
      
                   
                 
           <!-- 페이징 바 -->
                <div class="paging-area" align="center">
                <button>1</button>
                <button>2</button>
                <button>3</button>
                <button>4</button>
                <button>5</button>
                <button>6</button>
                <button>7</button>
                <button>8</button>
                <button>9</button>
                <button>10</button>

                </div>
                <br><br>        
     </div>
    
</body>    


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

