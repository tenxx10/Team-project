<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URL, java.net.URLEncoder, java.io.BufferedReader, java.io.InputStreamReader, java.io.StringReader, javax.xml.parsers.DocumentBuilderFactory, javax.xml.parsers.DocumentBuilder, org.w3c.dom.Document, org.w3c.dom.NodeList, org.xml.sax.InputSource"%>
<%@ page import="org.w3c.dom.Node, org.w3c.dom.Element"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>

<!-- 세션로그인 -->
<%@ page import="javax.servlet.http.HttpSession" %>

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

                <!-- 여기부터 작성하면 됩니다. -->

                <%
                    // 세션 겟
                    HttpSession userSession = request.getSession(false);

                    if (userSession != null && userSession.getAttribute("user_id") != null) {
                        // 로그인 o

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
                        // 데이터베이스 연결 정보
                        Context initContext = new InitialContext();
                        Context envContext = (Context) initContext.lookup("java:comp/env");
                        DataSource ds = (DataSource) envContext.lookup("jdbc/mariadb");

                        // 데이터베이스 연결
                        conn = ds.getConnection();

                        // 데이터 조회 쿼리
                        String selectQuery = "SELECT * FROM reserve WHERE user_id = ?";
                        preparedStatement = conn.prepareStatement(selectQuery);
                        preparedStatement.setString(1, userId);
                        resultSet = preparedStatement.executeQuery();

                        // 예약내역 출력
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

								// 예약내용확인 (화면 출력구간)
								out.println("<form action='vacResCancelProcess.jsp' method='post'>"); // 취소 프로세스 파일명 입력
								out.println("예약번호: " + reserveNo + "<br>");
								out.println("회원 아이디: " + userId + "<br>");
								out.println("회원 이름: " + userName + "<br>");
								out.println("예약자 성별: " + reserveGen + "<br>");
								out.println("예약자 나이: " + reserveAge + "<br>");
								out.println("예약자 연락처: " + reservePhone + "<br>");
								out.println("예약자 이메일: " + reserveEmail + "<br>");
								out.println("접종대상질병: " + reserveDisease + "<br>");
								out.println("접종주사제품명: " + reserveItem + "<br>");
								out.println("접종 희망일: " + reserveDate + "<br>");
								out.println("접종 장소: " + reserveLocal + "<br>");

								out.println("<input type='hidden' name='reserve_no' value='" + reserveNo + "'>");
								out.println("<input type='submit' value='예약취소'>"); // 예약취소버튼

								out.println("</form>");
								out.println("<br>");
							}
                     // resultSet.beforeFirst()를 사용하여 커서를 첫 번째 레코드 이전으로 되돌립니다.
                        resultSet.beforeFirst();
                        // 예약내역이 없는 경우 메시지 표시
                        if (!resultSet.next()) {
                            out.println("예약내역이 없습니다.");
                            out.println("<a href='vacResForm.jsp'> 예약페이지로 이동</a>");
                        }
                        
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        // 리소스 정리
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

                <!-- 로그인하지 않은 경우 안내 메시지 출력 -->
                <%
                    } else {
                %>
                    <br><br><br>
                    <p>로그인이 필요한 페이지입니다. <a href="login.jsp">로그인</a>해주세요.</p>
                <%
                    }
                %>

            </main>
        </div>
    </div>

    <!-- Include footer.jsp -->
    <%@ include file="/include/footer.jsp"%>

    <!-- Bootstrap core JS-->
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
</body>
</html>
