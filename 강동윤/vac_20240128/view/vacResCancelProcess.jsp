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
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>예방접종예약</title>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="../assets/favicon1.png" />
<!-- Core theme CSS (includes Bootstrap)-->
<link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>
	<!-- Include header.jsp -->
	<%@ include file="/include/header.jsp"%>
	<!-- Page content -->
	<div class="container-fluid">
		<div class="row">
			<!-- Include cate.jsp -->
			<%@ include file="/include/cate.jsp"%>
			<!-- Main content -->
			<main class="col-lg-10 col-md-7 ms-md-auto px-4">

				<!-- 여기부터 작성하면 됩니다.-->


				<%

    Connection conn = null;
    PreparedStatement preparedStatement = null;

    try {
    	// 데이터베이스 연결 정보
    	Context initContext = new InitialContext();
    	Context envContext  = (Context)initContext.lookup("java:comp/env");
    	DataSource ds = (DataSource) envContext.lookup("jdbc/mariadb");
    	
    	// 데이터베이스 연결
    	conn = ds.getConnection();
        

        

        // 사용자로부터의 취소 대상 예약 번호 받아오기
        int reserveNoToCancel = Integer.parseInt(request.getParameter("reserve_no"));

        // 데이터 삭제 쿼리
        String deleteQuery = "DELETE FROM reserve WHERE reserve_no=?";
        preparedStatement = conn.prepareStatement(deleteQuery);
        preparedStatement.setInt(1, reserveNoToCancel);

        // 쿼리 실행
        int rowsAffected = preparedStatement.executeUpdate();

        if (rowsAffected > 0) {
            out.println("취소되었습니다.");
            out.println("<a href='vacResView.jsp'> 조회페이지로 이동</a>"); // 조회페이지 주소링크
        } else {
            out.println("취소 실패하였습니다. 다시 확인바랍니다.");
            out.println("<a href='vacResView.jsp'> 조회페이지로 이동</a>"); // 조회페이지 주소링크
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // 리소스 정리
        try {
            if (preparedStatement != null) preparedStatement.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

				<!--  여기까지 -->

			</main>
		</div>
	</div>
	
		<!-- Include footer.jsp -->
	<%@ include file="/include/footer.jsp"%>


	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>
