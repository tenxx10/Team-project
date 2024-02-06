package vacc_test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class changePW {

    private static final String JDBC_URL = "jdbc:mariadb://localhost:3306/project";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "1234";

    // 데이터베이스 연결 변수
    private Connection conn = null;

    // 생성자에서 데이터베이스 연결 수행
    public changePW() {
        try {
            Class.forName("com.mariadb.jdbc.Driver");
            conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    // 비밀번호 변경 메서드
    public boolean changePassword(String userId, String currentPassword, String newPassword, String confirmPassword) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // 현재 비밀번호 확인
            String checkPasswordQuery = "SELECT user_pw FROM user WHERE user_id = ?";

            pstmt = conn.prepareStatement(checkPasswordQuery);
            pstmt.setString(1, userId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String storedPassword = rs.getString("user_pw");

                // 현재 비밀번호 일치 여부 확인
                if (storedPassword.equals(currentPassword)) {
                    // 새로운 비밀번호로 업데이트
                    String updatePasswordQuery = "UPDATE user SET user_pw = ? WHERE user_id = ?";

                    pstmt = conn.prepareStatement(updatePasswordQuery);
                    pstmt.setString(1, newPassword);
                    pstmt.setString(2, userId);

                    int rowsAffected = pstmt.executeUpdate();

                    // 비밀번호 업데이트 성공 여부 확인
                    return rowsAffected > 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources(rs, pstmt);
        }

        // 실패 시 false 반환
        return false;
    }

    //데이터베이스 연결 닫기 메서드
    public void closeConnection() {
        try {
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //ResultSet과 PreparedStatement를 닫는 메서드
    private void closeResources(ResultSet rs, PreparedStatement pstmt) {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
