<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ page import="java.net.URL, java.net.URLEncoder, java.io.BufferedReader, java.io.InputStreamReader, java.io.StringReader, javax.xml.parsers.DocumentBuilderFactory, javax.xml.parsers.DocumentBuilder, org.w3c.dom.Document, org.w3c.dom.NodeList, org.xml.sax.InputSource"%>
<%@ page import="org.w3c.dom.Node, org.w3c.dom.Element"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

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
    <link rel="icon" type="image/x-icon" href="../assets/favicon1.png" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <style>
        .table-responsive {
            overflow-x: auto;
        }
    </style>
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

                <!-- 여기부터 작성하면 됩니다. -->
                <%
                    HttpSession userSession = request.getSession(false);

                    if (userSession != null && userSession.getAttribute("user_id") != null) {
                        String userId = (String) userSession.getAttribute("user_id");
                        String userName = (String) userSession.getAttribute("user_name");
                        String userEmail = (String) userSession.getAttribute("user_email");
                        String userPhone = (String) userSession.getAttribute("user_phone");
                        String userDate = (String) userSession.getAttribute("user_date");
                %>

                <%
                    Connection conn = null;
                    PreparedStatement preparedStatement = null;
                    ResultSet resultSet = null;

                    try {
                        Context initContext = new InitialContext();
                        Context envContext = (Context) initContext.lookup("java:comp/env");
                        DataSource ds = (DataSource) envContext.lookup("jdbc/mariadb");

                        conn = ds.getConnection();

                        String selectQuery = "SELECT * FROM reserve WHERE user_id = ?";
                        preparedStatement = conn.prepareStatement(selectQuery);
                        preparedStatement.setString(1, userId);
                        resultSet = preparedStatement.executeQuery();
                %>

                        <!-- 예약목록 테이블 (화면출력)-->
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>예약번호</th>
                                        <th>회원 아이디</th>
                                        <th>회원 이름</th>
                                        <th>예약자 성별</th>
                                        <th>예약자 나이</th>
                                        <th>예약자 연락처</th>
                                        <th>예약자 이메일</th>
                                        <th>접종대상질병</th>
                                        <th>접종주사제품명</th>
                                        <th>접종 희망일</th>
                                        <th>접종 장소</th>
                                        <th>예약 취소</th>
                                        <th>예약 수정</th>
                                    </tr>
                                </thead>
                                <tbody>
                <%
                        while (resultSet.next()) {
                            int reserveNo = resultSet.getInt("reserve_no");
                            String reserveGen = resultSet.getString("reserve_gen");
                            int reserveAge = resultSet.getInt("reserve_age");
                            String reservePhone = resultSet.getString("reserve_phone");
                            String reserveEmail = resultSet.getString("reserve_email");
                            String reserveDisease = resultSet.getString("reserve_disease");
                            String reserveItem = resultSet.getString("reserve_item");
                            Date reserveDate = resultSet.getDate("reserve_date");
                            String reserveLocal = resultSet.getString("reserve_local");
                %>
                                    <!-- 각 예약건을 행으로 추가 (화면출력) -->
                                    <tr>
                                        <td><%= reserveNo %></td>
                                        <td><%= userId %></td>
                                        <td><%= userName %></td>
                                        <td><%= reserveGen %></td>
                                        <td><%= reserveAge %></td>
                                        <td><%= reservePhone %></td>
                                        <td><%= reserveEmail %></td>
                                        <td><%= reserveDisease %></td>
                                        <td><%= reserveItem %></td>
                                        <td><%= reserveDate %></td>
                                        <td><%= reserveLocal %></td>
                                        <!-- 예약 취소 버튼 -->
                                        <td>
                                            <form action='vacResCancelProcess.jsp' method='post'>
                                                <input type='hidden' name='reserve_no' value='<%= reserveNo %>'>
                                                <input type='submit' value='예약 취소' class='btn btn-danger'>
                                            </form>
                                        </td>
                                        <!-- 예약 수정 버튼 -->
                                        <td>
                                            <form action='vacResUpdate.jsp' method='get'>
                                                <input type='hidden' name='reserve_no' value='<%= reserveNo %>'>
                                                <input type='submit' value='예약 수정' class='btn btn-warning'>
                                            </form>
                                        </td>
                                    </tr>
                <%
                        }

                        resultSet.beforeFirst();
                        if (!resultSet.next()) {
                            out.println("<tr><td colspan='13'>예약내역이 없습니다.</td></tr>");
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        try {
                            if (resultSet != null)
                                resultSet.close();
                            if (preparedStatement != null)
                                preparedStatement.close();
                            if (conn != null)
                                conn.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                %>
                                </tbody>
                            </table>
                        </div>

                <!-- 로그인하지 않은 경우 안내 메시지 출력 -->
               <%
					} else {
					// 로그인 x
					%>
					
					
					<img src="../assets/NeedLogin.png" alt="로그인이 필요한 페이지입니다.">
					<br>
					<button type="button" class="btn btn-warning"
						onclick="redirectToLoginPage()">로그인 하러가기</button>
						<br><br><br>
					

					<%
					}
					%>
            </main>
        </div>
    </div>

    <!-- Include footer.jsp -->
    <%@ include file="/include/footer.jsp"%>

    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
</body>
</html>
