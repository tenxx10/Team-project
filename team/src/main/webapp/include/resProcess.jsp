<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    request.setCharacterEncoding("UTF-8");

    String user_id = request.getParameter("user_id");
    String user_name = request.getParameter("user_name");
    int user_age = Integer.parseInt(request.getParameter("user_age"));
    String user_gen = request.getParameter("user_gen");
    String reserve_phone = request.getParameter("reserve_phone");
    String reserve_email = request.getParameter("reserve_email");
    String reserve_disease = request.getParameter("reserve_disease");
    String reserve_item = request.getParameter("reserve_item");
    String reserve_date = request.getParameter("reserve_date");
    String reserve_local = request.getParameter("reserve_local");

    Connection connection = null;
    PreparedStatement pstmt = null;

    try {
        // JDBC 드라이버 로드
        Class.forName("org.mariadb.jdbc.Driver");

        // 데이터베이스 연결 정보
        String url = "jdbc:mariadb://localhost:3306/vac";
        String username = "root";
        String password = "1234";

        // 데이터베이스 연결
        connection = DriverManager.getConnection(url, username, password);

        // 데이터 삽입 쿼리
        String insertQuery = "INSERT INTO reserve (user_id, user_name, user_age, user_gen, reserve_phone, reserve_email, reserve_disease, reserve_item, reserve_date, reserve_local) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        pstmt = connection.prepareStatement(insertQuery);
        pstmt.setString(1, user_id);
        pstmt.setString(2, user_name);
        pstmt.setInt(3, user_age);
        pstmt.setString(4, user_gen);
        pstmt.setString(5, reserve_phone);
        pstmt.setString(6, reserve_email);
        pstmt.setString(7, reserve_disease);
        pstmt.setString(8, reserve_item);
        pstmt.setString(9, reserve_date);
        pstmt.setString(10, reserve_local);

        int result = pstmt.executeUpdate();

        if (result != 0) {
            //out.println("<script>");
            //out.println("location.href='resForm.jsp'");
            //out.println("</script>");
        	out.println("예약이 완료되었습니다.");
        } else {
            out.println("예약에 실패하였습니다.");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // 리소스 정리
        try {
            if (pstmt != null) {
                pstmt.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
