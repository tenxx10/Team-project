<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    // 세션을 무효화하여 로그아웃 처리
    HttpSession logoutSession = request.getSession(false);
    if (logoutSession != null) {
        logoutSession.invalidate();
    }

    // 로그아웃 후 홈페이지로 이동
    response.sendRedirect("index.html");
%>
