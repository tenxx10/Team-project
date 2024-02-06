package calendar.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CalModel {
    private Connection connection; // JDBC Connection

    // 생성자에서 JDBC 연결을 초기화하는 로직 추가 필요

    public boolean updatePlan(String date, int typeno) {
        try {
            String sql = "UPDATE tableA SET charge_type_no = ? WHERE date = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, typeno);
                statement.setString(2, date);
                return statement.executeUpdate() > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deletePlan(String date, int typeno) {
        try {
            String sql = "UPDATE tableA SET charge_type_no = 0 WHERE date = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, date);
                return statement.executeUpdate() > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Map<String, Object>> getPlan() {
        List<Map<String, Object>> result = new ArrayList<>();

        try {
            String sql = "SELECT A.charge_type_no, A.date, B.name, B.color " +
                    "FROM tableA A " +
                    "LEFT JOIN tableB B ON A.charge_type_no = B.no " +
                    "WHERE A.date BETWEEN '2022-01-01' AND '2022-12-31'";

            try (Statement statement = connection.createStatement();
                 ResultSet resultSet = statement.executeQuery(sql)) {

                while (resultSet.next()) {
                    Map<String, Object> row = new HashMap<>();
                    row.put("charge_type_no", resultSet.getInt("charge_type_no"));
                    row.put("date", resultSet.getString("date"));
                    row.put("name", resultSet.getString("name"));
                    row.put("color", resultSet.getString("color"));
                    result.add(row);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    // JDBC 연결을 닫는 로직 추가 필요
}
