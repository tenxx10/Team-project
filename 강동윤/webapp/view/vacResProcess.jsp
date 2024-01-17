<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ page import="java.net.URL, java.net.URLEncoder, java.io.BufferedReader, java.io.InputStreamReader, java.io.StringReader, javax.xml.parsers.DocumentBuilderFactory, javax.xml.parsers.DocumentBuilder, org.w3c.dom.Document, org.w3c.dom.NodeList, org.xml.sax.InputSource"%>
<%@ page import="org.w3c.dom.Node, org.w3c.dom.Element"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>예방접종예약</title>
    
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="/assets/favicon.ico" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>
    <!-- Include header.jsp -->
    <%@ include file="/include/header.jsp" %>
    <!-- Page content -->
    <div class="container-fluid">
        <div class="row">
            <!-- Include cate.jsp -->
            <%@ include file="/include/cate.jsp" %>
            <!-- Main content -->
            <main class="col-lg-10 col-md-7 ms-md-auto px-4">
            
                <!-- 여기부터 작성하면 됩니다.-->  
                
<%
    request.setCharacterEncoding("UTF-8");

    String user_id = request.getParameter("user_id");
    String user_name = request.getParameter("user_name");
    String reserve_gen = request.getParameter("reserve_gen");
    int reserve_age = Integer.parseInt(request.getParameter("reserve_age"));
    String reserve_phone = request.getParameter("reserve_phone");
    String reserve_email = request.getParameter("reserve_email");
    String reserve_disease = request.getParameter("reserve_disease");
    String reserve_item = request.getParameter("reserve_item");
    String reserve_date = request.getParameter("reserve_date");
    String reserve_local = request.getParameter("reserve_local");

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // 데이터베이스 연결 정보
        Context initContext = new InitialContext();
        Context envContext  = (Context)initContext.lookup("java:comp/env");
        DataSource ds = (DataSource) envContext.lookup("jdbc/mariadb");

        // 데이터베이스 연결
        conn = ds.getConnection();

        // 데이터 삽입 쿼리
        String insertQuery = "INSERT INTO reserve (user_id, user_name, reserve_gen, reserve_age, reserve_phone, reserve_email, reserve_disease, reserve_item, reserve_date, reserve_local) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(insertQuery);
        pstmt.setString(1, user_id);
        pstmt.setString(2, user_name);
        pstmt.setString(3, reserve_gen);
        pstmt.setInt(4, reserve_age);
        pstmt.setString(5, reserve_phone);
        pstmt.setString(6, reserve_email);
        pstmt.setString(7, reserve_disease);
        pstmt.setString(8, reserve_item);
        pstmt.setString(9, reserve_date);
        pstmt.setString(10, reserve_local);

        int result = pstmt.executeUpdate();

        if (result != 0) {
            out.println("예약이 완료되었습니다.");
            out.println("<a href='vacResView.jsp'> 조회페이지로 이동</a>");
        } else {
            out.println("예약에 실패하였습니다.");
            out.println("<a href='vacResForm.jsp'> 예약페이지로 이동</a>");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // 리소스 정리
        try {
            if (pstmt != null) {
                pstmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
                
                
                
                
                
                
                
                <!--  여기까지 -->
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
</body>
</html>
