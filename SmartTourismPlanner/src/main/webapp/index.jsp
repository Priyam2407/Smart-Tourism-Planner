<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Smart Tourism Planner</title>
  <style>
    /* Reset & base */
    * { margin: 0; padding: 0; box-sizing: border-box; }
    html, body {
      height: 100%;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #000; /* fallback */
    }

    /* Background */
    .background {
      background: url('images/index1.webp') no-repeat center center fixed;
      background-size: cover;
      position: relative;
      min-height: 100vh;
    }

    .background::before {
      content: "";
      position: absolute;
      top: 0; left: 0;
      width: 100%; height: 100%;
      background-color: rgba(0, 0, 0, 0.6);
      z-index: 1;
    }

    /* Main container */
    .container {
      position: relative;
      z-index: 2;
      min-height: 100vh;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      text-align: center;
      color: #fff;
      padding: 30px;
    }

    .glass-box {
      background: rgba(255, 255, 255, 0.1);
      border: 1px solid rgba(255, 255, 255, 0.3);
      border-radius: 20px;
      padding: 40px;
      backdrop-filter: blur(10px);
      box-shadow: 0 8px 32px rgba(0, 0, 0, 0.4);
      max-width: 600px;
      width: 90%;
      animation: fadeIn 1.5s ease-in-out;
    }

    .glass-box h2 {
      font-size: 2.8rem;
      margin-bottom: 0.5rem;
      text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.7);
    }

    .glass-box p {
      font-size: 1.1rem;
      margin-bottom: 2rem;
      color: #ddd;
    }

    /* Buttons */
    .btn {
      display: inline-block;
      margin: 0.5rem;
      padding: 0.75rem 1.8rem;
      font-size: 1.1rem;
      text-decoration: none;
      color: #fff;
      border: 2px solid #fff;
      border-radius: 30px;
      transition: all 0.4s ease;
    }

    .btn:hover {
      background-color: #fff;
      color: #333;
      transform: scale(1.05);
    }

    /* Animation */
    @keyframes fadeIn {
      0%{ opacity: 0; transform: translateY(-30px); }
      100% { opacity: 1; transform: translateY(0); }
    }

    /* Responsive */
    @media (max-width: 600px) {
      .glass-box h2 {
        font-size: 2rem;
      }

      .glass-box p {
        font-size: 1rem;
      }

      .btn {
        padding: 0.6rem 1.4rem;
        font-size: 1rem;
      }
    }
  </style>
</head>
<body>
  <div class="background">
    <div class="container">
      <div class="glass-box">
        <h2>Welcome to Smart Tourism Planner</h2>
        <p>Plan your dream vacation, explore hidden gems, and travel smarter.</p>
        <a href="login.jsp" class="btn">Login</a>
        <a href="register.jsp" class="btn">Register</a>
      </div>
    </div>
  </div>
</body>
</html>
