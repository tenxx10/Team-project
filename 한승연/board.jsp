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
        
  		<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#writeBtn').click(function(){
		let name=$('#name').val();
		if(name.trim()=="")
		{
			$('#name').focus();
			return;
		}
		
		let id=$('#id').val();
		if(id.trim()=="")
		{
			$('#id').focus();
			return;
		}
	
		let subject=$('#subject').val();
		if(subject.trim()=="")
		{
			$('#subject').focus();
			return;
		}
		
		let content=$('#content').val();
		if(content.trim()=="")
		{
			$('#content').focus();
			return;
		}
		
		let pwd=$('#pwd').val();
		if(pwd.trim()=="")
		{
			$('#pwd').focus();
			return;
		}
		
		$('#frm').submit();
	})
})
</script>
</head>
<body>

<div class="section section-properties" >
	  <div class="container">
	   	<div class="two_third first" style="height:auto">
  <div class="col-lg-12">
		   <h2 class="font-weight-bold text-primary heading">Board</h2>
		     <hr/><br><br>
    	<div class="two_third first">
    	<form method=post action="../freeboard/insert_ok.do" id="frm">
    		<table class="table">
    			<tr>
	       			<th width=10% class="text-right">이름</th>
		       			<td width=80%>
		       				<form method=post action="../freeboard/freeboard_insert.do">
		       				<input type=text size=15 class="input-sm" id="name" style="height: 30px" value="${sessionScope.name }">
		       				</form>
		       			</td>
	       			</tr>
	       			<tr>
	       		<th width=10% class="text-right">아이디</th>
		       			<td width=80%>
		       				<form method=post action="../freeboard/freeboard_insert.do">
		       				<input type=text size=15 class="input-sm" id="id" style="height: 30px" value="${sessionScope.id }">
		       				</form>
		       			</td>
	       		</tr>
    			<tr>
    			<th width=20% class="text-right">제목</th>
	       			<td width=80%>
	       				<input type=text name=subject size=50 class="input-sm" id="subject" >
	       				
	       			</td>
    			</tr>
    			<tr>
    			<th width=20% class="text-right">내용</th>
	       			<td width=80%>
	       				<textarea rows="10" cols="50" name=content id="content"></textarea>
	       			</td>
    			</tr>
    			<tr>
    			<th width=20% class="text-right">비밀번호</th>
	       			<td width=80%>
	       				<input type="password" name=pwd size=10 class="input-sm" id="pwd">
	       			</td>
    			</tr>
    			<tr>
    				</tr>
				<tr>
					<td class="td_left"><label for="BOARD_FILE"> 파일 첨부 </label></td>
					<td class="td_right"><input name="BOARD_FILE" type="file"
						id="BOARD_FILE" required="required" /></td>
	       			<td colspan="2" class="text-center">
	       				<div class="wrap">
	       					<td colspan="2"><div align="center">
	       					<input type="submit" value="등록">      				
							<input type=button value="목록">
							<input type=button value="수정">
							<input type=button value="삭제">
      						<td width="0">&nbsp;</td>

						</div>
	       				
	       			</td>
    			</tr>
    		</table>
    		</form>
    	</div>
    	</div>
    	</div>
    	</div>

</body>
</html>

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

		