<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*, java.text.SimpleDateFormat, java.util.Date"%>
<%@ page import="javax.naming.Context, javax.naming.InitialContext, javax.naming.NamingException"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="javax.sql.DataSource"%>
<%@ page import="java.io.*"%>

<%
    request.setCharacterEncoding("UTF-8");

    // 1. 예약 번호 파라미터 받기
    String reserveNoParam = request.getParameter("reserve_no");
    int reserveNo = 0; // 기본값 설정

    try {
        if (reserveNoParam != null && !reserveNoParam.isEmpty()) {
            reserveNo = Integer.parseInt(reserveNoParam);
        } else {
            // reserve_no가 주요 조건이므로, 값이 없을 경우 예외 처리 또는 다른 로직을 추가할 수 있습니다.
            throw new IllegalArgumentException("reserve_no 파라미터가 없습니다.");
        }
    } catch (NumberFormatException e) {
        // 예외 처리: 숫자로 변환할 수 없는 경우
        e.printStackTrace(); // 로그에 예외 내용 기록
    } catch (IllegalArgumentException e) {
        // 예외 처리: reserve_no 파라미터가 없는 경우
        e.printStackTrace(); // 로그에 예외 내용 기록
    }

    // 2. 기타 파라미터 받기
    String user_id = request.getParameter("user_id");
    String user_name = request.getParameter("user_name");
    String reserve_gen = request.getParameter("reserve_gen");
    int reserve_age = Integer.parseInt(request.getParameter("reserve_age"));
    String reserve_phone = request.getParameter("reserve_phone");
    String reserve_email = request.getParameter("reserve_email");
    String reserve_disease = request.getParameter("reserve_disease");
    String reserve_item = request.getParameter("reserve_item");
    String reserve_date_str = request.getParameter("reserve_date");
    String reserve_local = request.getParameter("reserve_local");

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // 3. 데이터베이스 연결
        Context initContext = new InitialContext();
        Context envContext = (Context) initContext.lookup("java:comp/env");
        DataSource ds = (DataSource) envContext.lookup("jdbc/mariadb");
        conn = ds.getConnection();

        // 4. 데이터 삽입 쿼리
        String updateQuery = "UPDATE reserve SET user_id=?, user_name=?, reserve_gen=?, reserve_age=?, " +
                             "reserve_phone=?, reserve_email=?, reserve_disease=?, reserve_item=?, " +
                             "reserve_date=?, reserve_local=? WHERE reserve_no=?";
        pstmt = conn.prepareStatement(updateQuery);
        pstmt.setString(1, user_id);
        pstmt.setString(2, user_name);
        pstmt.setString(3, reserve_gen);
        pstmt.setInt(4, reserve_age);
        pstmt.setString(5, reserve_phone);
        pstmt.setString(6, reserve_email);
        pstmt.setString(7, reserve_disease);
        pstmt.setString(8, reserve_item);

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date utilDate = dateFormat.parse(reserve_date_str);
        pstmt.setDate(9, new java.sql.Date(utilDate.getTime()));

        pstmt.setString(10, reserve_local);
        pstmt.setInt(11, reserveNo); // reserve_no에 대한 WHERE 조건 추가

        int result = pstmt.executeUpdate();

        if (result != 0) {
            out.println("예약이 수정되었습니다.");
            out.println("<a href='vacResView.jsp'> 조회페이지로 이동</a>");
        } else {
            out.println("예약 수정에 실패하였습니다.");
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
