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
      background: url('images/pune.jpg') no-repeat center center fixed;
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
    .footer {
      position: sticky;
      bottom: 0;
      width: 100%;
      text-align: center;
      padding: 15px 0;
      color: #bbb;
      font-size: 0.9rem;
      z-index: 2;
    }

    .footer-content {
      display: flex;
      flex-direction: column;
      align-items: center;
      gap: 8px;
    }

    .social-icons a {
      margin: 0 6px;
      text-decoration: none;
      transition: transform 0.3s ease;
    }

    .social-icons a:hover {
      transform: scale(1.2);
    }

    .social-icons svg {
      fill: #bbb;
      height: 24px;
      width: 24px;
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
     <footer class="footer">
    <div class="footer-content">
      <p>&copy; 2025 Smart Tourism Planner | Created with ❤️ by Priyam<br>All rights reserved.</p>
      <div class="social-icons">
        <a href="#" title="Facebook" target="_blank">
          <svg viewBox="0 0 24 24"><path d="M22 12a10 10 0 1 0-11.5 9.9v-7H8v-2.9h2.5V9.5c0-2.4 1.4-3.7 3.6-3.7 1 0 2 .2 2 .2v2.3h-1.1c-1.1 0-1.4.7-1.4 1.3v1.6H18l-.5 2.9h-2v7A10 10 0 0 0 22 12Z"/></svg>
        </a>
        <a href="#" title="Twitter" target="_blank">
          <svg viewBox="0 0 24 24"><path d="M22.46 6c-.77.35-1.6.59-2.46.7a4.27 4.27 0 0 0 1.88-2.36 8.5 8.5 0 0 1-2.7 1.03 4.26 4.26 0 0 0-7.3 3.89A12.1 12.1 0 0 1 3.1 4.9a4.26 4.26 0 0 0 1.32 5.7 4.22 4.22 0 0 1-1.93-.53v.05a4.26 4.26 0 0 0 3.42 4.18 4.28 4.28 0 0 1-1.92.07 4.26 4.26 0 0 0 4 2.97A8.53 8.53 0 0 1 2 19.55a12 12 0 0 0 6.56 1.92c7.88 0 12.2-6.53 12.2-12.2v-.56A8.62 8.62 0 0 0 24 6.4a8.43 8.43 0 0 1-2.42.66A4.26 4.26 0 0 0 22.46 6Z"/></svg>
        </a>
        <a href="#" title="Instagram" target="_blank">
          <svg viewBox="0 0 24 24"><path d="M12 2.2c3.2 0 3.6 0 4.8.1 1.2.1 1.9.2 2.3.4.6.2 1 .5 1.5 1s.8.9 1 1.5c.2.4.3 1.1.4 2.3.1 1.2.1 1.6.1 4.8s0 3.6-.1 4.8c-.1 1.2-.2 1.9-.4 2.3a3.6 3.6 0 0 1-1 1.5c-.5.5-.9.8-1.5 1-.4.2-1.1.3-2.3.4-1.2.1-1.6.1-4.8.1s-3.6 0-4.8-.1c-1.2-.1-1.9-.2-2.3-.4a3.6 3.6 0 0 1-1.5-1 3.6 3.6 0 0 1-1-1.5c-.2-.4-.3-1.1-.4-2.3C2.2 15.6 2.2 15.2 2.2 12s0-3.6.1-4.8c.1-1.2.2-1.9.4-2.3a3.6 3.6 0 0 1 1-1.5c.5-.5.9-.8 1.5-1 .4-.2 1.1-.3 2.3-.4C8.4 2.2 8.8 2.2 12 2.2Z"/></svg>
        </a>
      </div>
    </div>
  </footer>       
</body>
</html>
