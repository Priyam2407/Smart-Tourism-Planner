<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%
    String name = (String) session.getAttribute("name");
    if (name == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String dbURL = "jdbc:mysql://localhost:3306/tourism";
    String dbUser = "root";
    String dbPass = "priyam@123";

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Dashboard</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    html, body {
      height: 100%;
      font-family: 'Poppins', sans-serif;
      background-color: #000;
    }

    .dashboard-background {
      background: url('images/index1.webp') no-repeat center center fixed;
      background-size: cover;
      position: relative;
      height: 100%;
    }

    .dashboard-background::before {
      content: "";
      position: absolute;
      top: 0; left: 0;
      width: 100%; height: 100%;
      background-color: rgba(0, 0, 0, 0.6);
      z-index: 1;
    }

    .dashboard-container {
      position: relative;
      z-index: 2;
      height: 100%;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      text-align: center;
      color: #fff;
      padding: 20px;
      animation: fadeIn 1s ease-in-out;
    }

    .glass-box {
      background: rgba(255, 255, 255, 0.1);
      border: 1px solid rgba(255, 255, 255, 0.2);
      backdrop-filter: blur(12px);
      border-radius: 20px;
      padding: 40px;
      box-shadow: 0 8px 32px rgba(0, 0, 0, 0.4);
      max-width: 450px;
      width: 100%;
    }

    h2 {
      font-size: 2.2rem;
      margin-bottom: 1.5rem;
      text-shadow: 2px 2px 6px rgba(0,0,0,0.8);
    }

    .dashboard-form {
      margin-top: 1rem;
    }

    .dashboard-form input[list] {
      padding: 12px 18px;
      width: 100%;
      max-width: 300px;
      border-radius: 30px;
      border: none;
      margin-bottom: 1rem;
      font-size: 1rem;
      background: rgba(255, 255, 255, 0.2);
      color: #fff;
      outline: none;
    }

    .dashboard-form input[list]::placeholder {
      color: rgba(255, 255, 255, 0.85);
      font-weight: 500;
      font-size: 1rem;
    }

    .dashboard-form button {
      padding: 12px 30px;
      font-size: 1rem;
      border: none;
      border-radius: 30px;
      background-color: #00c897;
      color: #fff;
      cursor: pointer;
      font-weight: 600;
      transition: background 0.3s ease;
    }

    .dashboard-form button:hover {
      background-color: #00a67e;
    }

    .logout-btn {
      padding: 10px 26px;
      font-size: 0.95rem;
      border: 2px solid #fff;
      border-radius: 30px;
      background: transparent;
      color: #fff;
      cursor: pointer;
      font-weight: 500;
      transition: all 0.3s ease;
      margin-top: 1.5rem;
    }

    .logout-btn:hover {
      background-color: #fff;
      color: #333;
    }

    @media (max-width: 480px) {
      .glass-box {
        padding: 25px 20px;
      }
      h2 {
        font-size: 1.6rem;
      }
    }
  </style>
</head>
<body>
  <div class="dashboard-background">
    <div class="dashboard-container">
      <div class="glass-box">
        <h2>Welcome, <%= name %> 👋</h2>

        <form action="citydetails.jsp" method="get" class="dashboard-form">
          <input list="cities" name="city" placeholder="Type or select a city" required />
          <datalist id="cities">
            <%
              try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection(dbURL, dbUser, dbPass);
                ps = con.prepareStatement("SELECT name FROM cities ORDER BY name ASC");
                rs = ps.executeQuery();
                while (rs.next()) {
                  String city = rs.getString("name");
            %>
              <option value="<%= city %>"></option>
            <%
                }
              } catch (Exception e) {
                out.println("<option disabled>Error: " + e.getMessage() + "</option>");
              } finally {
                try {
                  if (rs != null) rs.close();
                  if (ps != null) ps.close();
                  if (con != null) con.close();
                } catch (SQLException ex) {
                  out.println("<option disabled>Close error: " + ex.getMessage() + "</option>");
                }
              }
            %>
          </datalist>
          <br />
          <button type="submit">Explore</button>
        </form>

        <!-- Logout button -->
        <form action="logout.jsp" method="post">
          <button type="submit" class="logout-btn">Logout 🚪</button>
        </form>
      </div>
    </div>
  </div>
</body>
</html>
