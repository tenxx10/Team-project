<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="DB_res.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>예약신청페이지</title>

<!-- jsp. 490p 참조 -->
<style>
	table{ 
		margine : auto;
		width : 400px;
		border : 1px solid gray;
		text-align: center;
		
	}
	.td_title{
		font-weight: bold;
		font-size: x-large;
	}

</style>
</head>

<body>
<form name ="resForm" action="resProcess.jsp" method = "post">
<table>
	<tr>
		<td colspan="2" class = "td_title">
			예약페이지
		</td>
	</tr>
	<tr>
		<td><label for = "user_id">아이디 : </label></td>
		<td><input type= "text" name= "user_id" user_id= "user_id"/></td>
	</tr>
	<tr>
		<td><label for = "user_name">회원 이름 : </label></td>
		<td><input type= "text" name= "user_name" user_name= "user_name"/></td>
	</tr>
	<tr>
		<td><label for = "reserve_gen">예약자 성별 : </label></td>
		<td><input type= "text" name= "reserve_gen" reserve_gen= "reserve_gen"/></td>
	</tr>
	<tr>
		<td><label for = "reserve_age">예약자 나이 : </label></td>
		<td><input type= "text" name= "reserve_age" reserve_age= "reserve_age"/></td>
	</tr>
	<tr>
		<td><label for = "reserve_phone">예약자 연락처 : </label></td>
		<td><input type= "text" name= "reserve_phone" reserve_phone= "reserve_phone"/></td>
	</tr>
	<tr>
		<td><label for = "reserve_email">예약자 이메일 : </label></td>
		<td><input type= "text" name= "reserve_email" reserve_email= "reserve_email"/></td>
	</tr>
	<tr>
		<td><label for = "reserve_disease">접종대상 질병 : </label></td>
		<td><input type= "text" name= "reserve_disease" reserve_disease= "reserve_disease"/></td>
	</tr>
	<tr>
		<td><label for = "reserve_item">예약 주사제품 : </label></td>
		<td><input type= "text" name= "reserve_item" reserve_item= "reserve_item"/></td>
	</tr>
	<tr>
		<td><label for = "reserve_date">접종희망일 : </label></td>
		<td><input type= "text" name= "reserve_date" reserve_date= "reserve_date"/></td>
	</tr>	
	<tr>
		<td><label for = "reserve_local">접종희망병원 : </label></td>
		<td><input type= "text" name= "reserve_local" reserve_local= "reserve_local"/></td>
	</tr>
	<tr>
		 <td colspan="2">
         <button type="submit">접종예약</button>&nbsp;&nbsp;
         <input type="reset" value="다시작성">
		</td>
	</tr>		
</table>
</form>
</body>
</html>
</form>
