<!-- checkUserId.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    String userId = request.getParameter("userId");
    String message = "사용 가능한 아이디입니다.";

    try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/vacc", "root", "")) {
        String checkQuery = "SELECT COALESCE(COUNT(*), 0) FROM user WHERE user_id = ?";
        try (PreparedStatement checkStatement = conn.prepareStatement(checkQuery)) {
            checkStatement.setString(1, userId);

            try (ResultSet resultSet = checkStatement.executeQuery()) {
                if (resultSet.next()) {
                    int count = resultSet.getInt(1);

                    if (count > 0) {
                        message = "이미 존재하는 아이디입니다.";
                    }
                }
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
        message = "error";
    }

    response.getWriter().write(message);
    
%>
