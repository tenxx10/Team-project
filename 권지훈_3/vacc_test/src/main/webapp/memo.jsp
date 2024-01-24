<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="userCheck" class="vacc_test.userCheck" scope="page" />

<%
    String userId = request.getParameter("user_id");
    String password = request.getParameter("user_pw");
    String name = request.getParameter("user_name");
    String gender = request.getParameter("user_gen");
    String phone = request.getParameter("user_phone");
    String email = request.getParameter("user_email");
    String date = request.getParameter("user_date");

    String message = null;

    // 아이디 중복 검사
    if (userCheck.checkUserIdExistence(userId)) {
        message = "아이디가 이미 사용 중입니다. 다른 아이디를 선택해주세요.";
    } else {
        // 회원가입 처리
        if (userCheck.registerUser(userId, password, name, gender, phone, email, date)) {
            message = "회원가입이 완료되었습니다.";
        } else {
            message = "회원가입에 실패했습니다.";
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>회원가입 결과</title>
</head>
<body>
    <h1>회원가입 결과</h1>
    <p><%= message %></p>
</body>
</html>
