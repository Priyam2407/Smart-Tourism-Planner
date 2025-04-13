<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
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
            temperature = rs.getFloat("temperature");
            humidity = rs.getInt("humidity");
            conditions = rs.getString("conditions");
            imageLocation = rs.getString("image");
            cityFound = true;
        }

        rs.close();
        ps.close();
        con.close();
    } catch (Exception e) {
        description = "Error connecting to database: " + e.getMessage();
    }

    // If image is missing or null, show a placeholder
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

    .weather-panel {
      background-color: rgba(255, 255, 255, 0.9);
      color: #222;
      padding: 25px;
      margin-top: 30px;
      border-radius: 12px;
      box-shadow: 0px 4px 12px rgba(0,0,0,0.4);
    }

    .weather-panel h3 {
      margin-bottom: 20px;
      font-size: 1.8rem;
      color: #333;
    }

    .weather-panel p {
      font-size: 1.1rem;
      margin: 8px 0;
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
        <h3>City Information</h3>
        <p><strong>Description:</strong> <%= description %></p>
        <p><strong>Temperature:</strong> <%= temperature %> °C</p>
        <p><strong>Humidity:</strong> <%= humidity %>%</p>
        <p><strong>Conditions:</strong> <%= conditions %></p>
      <% } else { %>
        <h3>City Not Found</h3>
        <p><%= description %></p>
      <% } %>
    </div>

    <div id="map"></div>

    <a href="dashboard.jsp">
      <button class="back-button">← Back to Dashboard</button>
    </a>
  </div>

</body>
</html>
