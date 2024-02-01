<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*, java.text.SimpleDateFormat, java.util.Date"%>
<%@ page import="javax.naming.Context, javax.naming.InitialContext, javax.sql.DataSource"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport"
        content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>회원가입프로세스</title>

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
    request.setCharacterEncoding("UTF-8");

    String user_id = request.getParameter("user_id");
    String user_pw = request.getParameter("user_pw");
    String user_name = request.getParameter("user_name");
    String user_gen = request.getParameter("user_gen");
    String user_phone = request.getParameter("user_phone");

 // user_phone이 null이거나 빈 문자열인 경우 처리
 if (user_phone == null || user_phone.trim().isEmpty()) {
     out.println("전화번호를 입력하세요.");
     return; // 또는 필요에 따라 다른 처리 수행
 }

 // 기존 코드 계속...

    String user_email = request.getParameter("user_email");
    String user_date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // 데이터베이스 연결 정보
        Context initContext = new InitialContext();
        Context envContext  = (Context)initContext.lookup("java:comp/env");
        DataSource ds = (DataSource) envContext.lookup("jdbc/mariadb");

        // 데이터베이스 연결
        conn = ds.getConnection();

        // 데이터베이스 연결 및 쿼리 수행 전에 해당 이메일이 이미 존재하는지 확인
        String checkEmailQuery = "SELECT user_email FROM user WHERE user_email = ?";
        try (PreparedStatement checkEmailStmt = conn.prepareStatement(checkEmailQuery)) {
            checkEmailStmt.setString(1, user_email);
            ResultSet emailResult = checkEmailStmt.executeQuery();

            if (emailResult.next()) {
                // 이미 존재하는 이메일인 경우 처리
                out.println("이미 존재하는 이메일 주소입니다.");
                return; // 또는 필요에 따라 다른 처리 수행
            }
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("이메일 중복 확인 중 오류 발생");
            return;
        }

        // 데이터 삽입 쿼리
        String insertQuery = "INSERT INTO user (user_id, user_pw, user_name, user_gen, user_phone, user_email, user_date) VALUES (?, ?, ?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(insertQuery);
        pstmt.setString(1, user_id);
        pstmt.setString(2, user_pw);  
        pstmt.setString(3, user_name);
        pstmt.setString(4, user_gen);
        pstmt.setString(5, user_phone);
        pstmt.setString(6, user_email);
        pstmt.setString(7, user_date);

        int result = pstmt.executeUpdate();

        if (result != 0) {
            out.println("회원가입이 완료되었습니다.");
            out.println("<a href='login.jsp'><br><br> 로그인페이지로 이동</a>");
        } else {
            out.println("회원가입에 실패하였습니다.");
            out.println("<a href='join.jsp'><br><br> 회원가입페이지로 이동</a>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("회원가입 중 오류가 발생했습니다.");
        out.println("<a href='join.jsp'><br><br> 회원가입페이지로 이동</a>");
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

            </main>
        </div>
    </div>

    <!-- Include footer.jsp -->
    <%@ include file="/include/footer.jsp"%>

    <!--  여기까지 -->
    <!-- Bootstrap core JS-->
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
