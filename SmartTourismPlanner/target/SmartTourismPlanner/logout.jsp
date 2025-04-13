<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="true" %>
<%
  session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Logging Out...</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
  <style>
    * {
      margin: 0; padding: 0; box-sizing: border-box;
    }

    html, body {
      height: 100%;
      font-family: 'Poppins', sans-serif;
      background-color: #000;
      overflow: hidden;
    }

    .logout-background {
      background: url('images/index1.webp') no-repeat center center fixed;
      background-size: cover;
      position: relative;
      height: 100%;
    }

    .logout-background::before {
      content: "";
      position: absolute;
      top: 0; left: 0;
      width: 100%; height: 100%;
      background: rgba(0, 0, 0, 0.7);
      z-index: 1;
    }

    .logout-container {
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
      animation: fadeIn 1.5s ease-in-out;
    }

    .logout-container h2 {
      font-size: 2.5rem;
      margin-bottom: 1rem;
      text-shadow: 2px 2px 8px rgba(0,0,0,0.7);
      animation: floatText 2s infinite alternate;
    }

    .logout-container p {
      font-size: 1.1rem;
      margin-top: 0.5rem;
      color: #ccc;
      opacity: 0.9;
    }

    @keyframes fadeIn {
      0% { opacity: 0; transform: translateY(30px); }
      100% { opacity: 1; transform: translateY(0); }
    }

    @keyframes floatText {
      0% { transform: translateY(0); }
      100% { transform: translateY(-10px); }
    }

    /* Optional: glowing loader dot effect */
    .dots {
      display: flex;
      justify-content: center;
      margin-top: 20px;
    }

    .dot {
      width: 12px;
      height: 12px;
      margin: 0 5px;
      background-color: #00c897;
      border-radius: 50%;
      animation: pulse 1s infinite ease-in-out;
    }

    .dot:nth-child(2) {
      animation-delay: 0.2s;
    }

    .dot:nth-child(3) {
      animation-delay: 0.4s;
    }

    @keyframes pulse {
      0%, 100% { transform: scale(1); opacity: 0.6; }
      50% { transform: scale(1.5); opacity: 1; }
    }
  </style>
  <script>
    setTimeout(function() {
      window.location.href = 'index.jsp';
    }, 2500);
  </script>
</head>
<body>
  <div class="logout-background">
    <div class="logout-container">
      <h2>👋 You have been logged out</h2>
      <p>Redirecting to home page...</p>
      <div class="dots">
        <div class="dot"></div>
        <div class="dot"></div>
        <div class="dot"></div>
      </div>
    </div>
  </div>
</body>
</html>
