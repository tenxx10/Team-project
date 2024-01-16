<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    try {
        // JDBC 드라이버 로드
        Class.forName("org.mariadb.jdbc.Driver");

        // 데이터베이스 연결 정보
        String url = "jdbc:mariadb://localhost:3306/vac";
        String username = "root";
        String password = "1234";

        // 데이터베이스 연결
        connection = DriverManager.getConnection(url, username, password);

        // 사용자로부터의 취소 대상 예약 아이디 받아오기
        String userIdToCancel = request.getParameter("user_id");
        
        // 데이터 조회 쿼리
        String selectQuery = "SELECT * FROM reserve WHERE user_id = ?";
        preparedStatement = connection.prepareStatement(selectQuery);
        preparedStatement.setString(1, userIdToCancel);
        resultSet = preparedStatement.executeQuery();
        
        // 취소할 데이터 출력
        if (resultSet.next()) {
            resultSet.beforeFirst(); // ResultSet의 커서를 첫 번째 행 이전으로 되될림
            out.println("<a href='resForm.jsp'> 예약페이지로 이동</a>");		
            while (resultSet.next()) {
                int reserveNo = resultSet.getInt("reserve_no");
                String userId = resultSet.getString("user_id");
                String userName = resultSet.getString("user_name");
                String reserveGen = resultSet.getString("reserve_gen");
                int reserveAge = resultSet.getInt("reserve_age");
                String reservePhone = resultSet.getString("reserve_phone");
                String reserveEmail = resultSet.getString("reserve_email");
                String reserveDisease = resultSet.getString("reserve_disease");
                String reserveItem = resultSet.getString("reserve_item");
                Date reserveDate = resultSet.getDate("reserve_date");
                String reserveLocal = resultSet.getString("reserve_local");

                // 예약내용확인
                out.println("<form action='resCProcess.jsp' method='post'>");
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
        } else {
            out.println("예약 내역이 없습니다.");
            out.println("<a href='resForm.jsp'> 예약페이지로 이동</a>");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // 리소스 정리
        try {
            if (resultSet != null) resultSet.close();
            if (preparedStatement != null) preparedStatement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

</body>
</html>
