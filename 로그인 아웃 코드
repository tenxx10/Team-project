<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
	</head>
	
	<body>
<form action= "authentication.jsp" method="post">
	<label> ID: </label>
	<input name = "id" type ="text"><br>
	
	<label> pw: </label>
	<input name = "pw" type ="password"><br>
	
	<input name = "sumbit" value ="로그인"><br>
	</form>
</body>
	</html>

<%
	// 인증 가능 사용자 및 비밀번호 목록
	String[] users = { "ninja", "knight", "elf" };
	String[] passwords = { "ak74", "m4", "pgs11" };
	
	// 1: form 으로부터 전달된 데이터를 변수에 저장.
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
	
	// 2: 사용자 인증
    String redirectUrl = "form.jsp"; // 인증 실패시 재요청 될 url 
    for (int i = 0; i < users.length; i++) {
        if (users[i].equals(id) && passwords[i].equals(pw)) {
            session.setAttribute("signedUser", id); // 인증되었음 세션에 남김
            redirectUrl = "welcome.jsp"; // 인증 성공 시 재요청 url
        }
    }
    response.sendRedirect(redirectUrl);
%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%  // 인증된 세션이 없는경우, 해당페이지를 볼 수 없게 함.
    if (session.getAttribute("signedUser") == null) {
        response.sendRedirect("logout.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
    </head>
    <body>
        <h1><%= session.getAttribute("signedUser") %>님 <small>반갑습니다.</small></h1>
        <a href="logout.jsp">로그아웃</a>
    </body>
</html>

<%
    // 1: 기존의 세션 데이터를 모두 삭제
    session.invalidate();
    // 2: 로그인 페이지로 이동시킴.
    response.sendRedirect("form.jsp");
%>
