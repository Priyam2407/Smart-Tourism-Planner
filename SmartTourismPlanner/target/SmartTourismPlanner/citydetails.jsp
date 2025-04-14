<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.net.*, java.io.*, org.json.*" %>
<%
    String city = request.getParameter("city");

    String dbURL = "jdbc:mysql://localhost:3306/tourism";
    String dbUser = "root";
    String dbPass = "priyam@123";

    String description = "", conditions = "", imageLocation = "";
    float temperature = 0;
    int humidity = 0;
    boolean cityFound = false;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(dbURL, dbUser, dbPass);
        PreparedStatement ps = con.prepareStatement("SELECT * FROM cities WHERE name=?");
        ps.setString(1, city);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            description = rs.getString("description");
            imageLocation = rs.getString("image");
            cityFound = true;
        }

        rs.close();
        ps.close();
        con.close();
    } catch (Exception e) {
        description = "Error connecting to database: " + e.getMessage();
    }

    // Weather API call
    try {
        String apiKey = "c5c655ab2772d2b0e2e424787acde6e8";
        String urlString = "https://api.openweathermap.org/data/2.5/weather?q=" + URLEncoder.encode(city, "UTF-8") + "&appid=" + apiKey + "&units=metric";

        URL url = new URL(urlString);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");

        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        StringBuilder apiResponse = new StringBuilder();
        String line;

        while ((line = in.readLine()) != null) {
            apiResponse.append(line);
        }
        in.close();

        JSONObject json = new JSONObject(apiResponse.toString());
        JSONObject main = json.getJSONObject("main");
        temperature = main.getFloat("temp");
        humidity = main.getInt("humidity");
        conditions = json.getJSONArray("weather").getJSONObject(0).getString("description");

    } catch (Exception e) {
        conditions = "Weather data not available: " + e.getMessage();
    }

    if (imageLocation == null || imageLocation.trim().equals("")) {
        imageLocation = "images/default-city.jpg";
    }
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Explore <%= city %></title>
  <style>
    html, body {
      margin: 0;
      padding: 0;
      height: 100%;
      font-family: 'Segoe UI', sans-serif;
      background: url('<%= imageLocation %>') no-repeat center center fixed;
      background-size: cover;
      color: white;
    }
    .overlay {
      position: absolute;
      top: 0; left: 0;
      width: 100%; height: 100%;
      background-color: rgba(0, 0, 0, 0.6);
      z-index: 1;
    }
    .container {
      position: relative;
      z-index: 2;
      max-width: 900px;
      margin: 0 auto;
      padding: 60px 20px;
      text-align: center;
    }
    h1 {
      font-size: 2.2rem;
      color: #ffc107;
      text-shadow: 1px 1px 3px black;
      margin-bottom: 10px;
    }
    h2 {
      font-size: 3rem;
      margin-bottom: 20px;
      color: #f8f9fa;
      text-shadow: 2px 2px 5px #000;
    }
    .city-image {
      max-width: 100%;
      height: auto;
      border-radius: 15px;
      margin: 30px auto;
      box-shadow: 0 5px 20px rgba(0,0,0,0.5);
    }
    @keyframes fadeInUp {
      from {
        opacity: 0;
        transform: translateY(30px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }
    .weather-panel {
      background-color: rgba(255, 255, 255, 0.9);
      color: #222;
      padding: 25px;
      margin-top: 30px;
      border-radius: 12px;
      box-shadow: 0px 4px 12px rgba(0,0,0,0.4);
      animation: fadeInUp 1s ease-out;
    }
    .weather-panel h3 {
      margin-bottom: 20px;
      font-size: 1.8rem;
      color: red;
      animation: fadeInUp 1.2s ease-out;
    }
    .weather-panel p {
      font-size: 1.1rem;
      margin: 8px 0;
      animation: fadeInUp 1.4s ease-out;
    }
    .back-button {
      margin-top: 30px;
      padding: 10px 20px;
      background-color: #28a745;
      color: white;
      text-decoration: none;
      font-size: 1rem;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      transition: background-color 0.3s;
    }
    .back-button:hover {
      background-color: #218838;
    }
    .footer {
      position:static;
      bottom: 0;
      width: 100%;
      text-align: center;
      padding: 15px 0;
      color: white;
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
      fill: white;
      height: 24px;
      width: 24px;
    }
  </style>
</head>
<body>
  <div class="overlay"></div>
  <div class="container">
    <h1>Welcome to Smart Tourism Planner</h1>
    <h2>Explore <%= city %></h2>

    <img src="<%= imageLocation %>" alt="<%= city %> Image" class="city-image" />

    <div class="weather-panel">
      <% if (cityFound) { %>
        <h3>Live City Information</h3>
        <p><strong>Description:</strong> <%= description %></p>
        <p><strong>Temperature:</strong> <%= temperature %> °C</p>
        <p><strong>Humidity:</strong> <%= humidity %>%</p>
        <p><strong>Conditions:</strong> <%= conditions %></p>
      <% } else { %>
        <h3>City Not Found</h3>
        <p><%= description %></p>
      <% } %>
    </div>

    <a href="dashboard.jsp">
      <button class="back-button">← Back to Dashboard</button>
    </a>
  </div>

  <!-- Footer -->
  <footer class="footer">
    <div class="footer-content">
      <p>
        &copy; 2025 Smart Tourism Planner | Created with ❤️ by Priyam<br>
        All rights reserved.
      </p>
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
