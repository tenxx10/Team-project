<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*" %>

<%
    // db 연결을 위한 정보 설정
    String url = "jdbc:mysql://localhost:3306/vacc"; // 자신의 db URL
    String dbUsername = "root"; //db 사용자 이름
    String dbPassword = ""; // db 비밀번호

    // 폼에서 전달된 데이터 받기
    String username = request.getParameter("user_id");
    String password = request.getParameter("user_pw");

    Connection conn = null;
    String message = null;

    try {
        // JDBC 드라이버 로딩
        Class.forName("com.mysql.cj.jdbc.Driver");

        // db 연결
        conn = DriverManager.getConnection(url, dbUsername, dbPassword);

        // SQL 쿼리 작성 - 사용자 인증
        String selectQuery = "SELECT * FROM user WHERE user_id = ? AND user_pw = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(selectQuery)) {
            pstmt.setString(1, username);
            pstmt.setString(2, password);

            // 쿼리 실행
            ResultSet resultSet = pstmt.executeQuery();

            // 사용자 인증 결과 확인
            if (resultSet.next()) {
                // 사용자 인증 성공

                // 세션에 사용자 정보 저장
                session.setAttribute("user_id", username);
                session.setAttribute("user_name", resultSet.getString("user_name")); 
                session.setAttribute("user_email", resultSet.getString("user_email")); 
                session.setAttribute("user_phone", resultSet.getString("user_phone")); 
                session.setAttribute("user_date", resultSet.getString("user_date")); 

                // 로그인 성공 페이지로 리다이렉트
                response.sendRedirect("login_success.jsp");
            } else {
                // 사용자 인증 실패
                message = "아이디 또는 비밀번호가 일치하지 않습니다.";
                request.setAttribute("message", message);
                RequestDispatcher dispatcher = request.getRequestDispatcher("login_fail.jsp");
                dispatcher.forward(request, response);
            }
        }

    } catch (Exception e) {
        // 오류 발생 시 처리
        e.printStackTrace();
        message = "로그인 중 오류가 발생했습니다.";
        request.setAttribute("message", message);
        RequestDispatcher dispatcher = request.getRequestDispatcher("login_fail.jsp");
        dispatcher.forward(request, response);
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
