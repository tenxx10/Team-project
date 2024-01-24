<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    // 데이터베이스 연결을 위한 정보 설정
    String url = "jdbc:mysql://localhost:3306/vacc"; // 자신의 데이터베이스 URL
    String dbUsername = "root"; // 데이터베이스 사용자 이름
    String dbPassword = ""; // 데이터베이스 비밀번호

    // 폼에서 전달된 데이터 받기
    String id = request.getParameter("user_id");
    String pw = request.getParameter("user_pw");
    String name = request.getParameter("user_name");
    String gen = request.getParameter("user_gen");
    String phone1 = request.getParameter("user_phone1");
    String phone2 = request.getParameter("user_phone2");
    String phone3 = request.getParameter("user_phone3");
    String email1 = request.getParameter("user_email");
    String email2 = request.getParameter("user_email_domain");
    String date = request.getParameter("user_date");
    
    // 전화번호 조합
    String phone = phone1 + phone2 + phone3;
    String email = email1 + "@" + email2;
    
    Connection conn = null;
    String message = null;

    try {
        // JDBC 드라이버 로딩
        Class.forName("com.mysql.cj.jdbc.Driver");

        // 데이터베이스 연결
        conn = DriverManager.getConnection(url, dbUsername, dbPassword);

        // SQL 쿼리 작성 - 회원 정보 삽입
        String insertQuery = "INSERT INTO user (user_id, user_pw, user_name, user_gen, user_phone, user_email, user_date) VALUES (?,?,?,?,?,?,STR_TO_DATE(?, '%Y-%m-%d'))";
        try (PreparedStatement pstmt = conn.prepareStatement(insertQuery)) {
            pstmt.setString(1, id);
            pstmt.setString(2, pw);
            pstmt.setString(3, name);
            pstmt.setString(4, gen);
            pstmt.setString(5, phone);
            pstmt.setString(6, email);
            pstmt.setString(7, date);

            // 쿼리 실행
            int rows = pstmt.executeUpdate();

            // 회원가입 성공 여부에 따른 메시지 설정
            if (rows > 0) {
                message = "회원가입이 완료되었습니다.";
            } else {
                message = "회원가입에 실패했습니다.";
            }
        }

    } catch (Exception e) {
        // 오류 발생 시 처리
        e.printStackTrace();
        message = "회원가입 중 오류가 발생했습니다.";
    } finally {
        try {
            // Connection 닫기
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
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
    <p><a href="login.jsp">로그인 페이지로 이동</a></p>
</body>
</html>
