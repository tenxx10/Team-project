<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cancel Process</title>
</head>
<body>

<%
    Connection connection = null;
    PreparedStatement preparedStatement = null;

    try {
        // JDBC 드라이버 로드
        Class.forName("org.mariadb.jdbc.Driver");

        // 데이터베이스 연결 정보
        String url = "jdbc:mariadb://localhost:3306/vac";
        String username = "root";
        String password = "1234";

        // 데이터베이스 연결
        connection = DriverManager.getConnection(url, username, password);

        // 사용자로부터의 취소 대상 예약 번호 받아오기
        int reserveNoToCancel = Integer.parseInt(request.getParameter("reserve_no"));

        // 데이터 삭제 쿼리
        String deleteQuery = "DELETE FROM reserve WHERE reserve_no=?";
        preparedStatement = connection.prepareStatement(deleteQuery);
        preparedStatement.setInt(1, reserveNoToCancel);

        // 쿼리 실행
        int rowsAffected = preparedStatement.executeUpdate();

        if (rowsAffected > 0) {
            out.println("취소되었습니다.");
            out.println("<a href='Insert.jsp'> 조회페이지로 이동</a>");
        } else {
            out.println("취소 실패하였습니다.");
            out.println("<a href='Insert.jsp'> 조회페이지로 이동</a>");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // 리소스 정리
        try {
            if (preparedStatement != null) preparedStatement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

</body>
</html>
