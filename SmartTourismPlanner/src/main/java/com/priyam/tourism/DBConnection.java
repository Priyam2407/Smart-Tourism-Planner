package com.priyam.tourism;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    public static Connection getConnection() {
        try {
            // Load driver (optional in newer JDBC, but safe)
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Connect
            return DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/tourism?useSSL=false&serverTimezone=UTC",
                "root",
                "priyam@123"
            );
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("MySQL JDBC Driver not found.", e);
        } catch (SQLException e) {
            throw new RuntimeException("Failed to connect to database.", e);
        }
    }
}
