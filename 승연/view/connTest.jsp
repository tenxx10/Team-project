<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>DB 연결 테스트</title>
</head>
<body>
    <h1>DB 연결 테스트</h1>
    
    <% 
    String url = "jdbc:mysql://localhost:3306/project"; // 자신의 데이터베이스 URL(mariadb)
    String dbUsername = "root"; // 데이터베이스 사용자 이름
    String dbPassword = "1234"; // 데이터베이스 비밀번호

    Connection conn = null;

    try {
        // JDBC 드라이버 로딩
        Class.forName("com.mysql.jdbc.Driver");   //org.mariadb
        
        // 데이터베이스 연결 시도
        conn = DriverManager.getConnection(url, dbUsername, dbPassword);

        // 연결 성공 시 메시지 출력
        out.println("<p>데이터베이스 연결 성공!</p>");

        // 연결 닫기
        conn.close();
    } catch (Exception e) {
        // 오류 발생 시 오류 메시지 출력
        out.println("<p>데이터베이스 연결 실패: " + e.getMessage() + "</p>");
    }
    
    %>
</body>
</html>
