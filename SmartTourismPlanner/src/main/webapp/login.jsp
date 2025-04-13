<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Login - Smart Tourism Planner</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    html, body {
      height: 100%;
      font-family: 'Poppins', sans-serif;
      background: #000;
    }

    .login-background {
      background: url('images/index1.webp') no-repeat center center fixed;
      background-size: cover;
      position: relative;
      height: 100%;
    }

    .login-background::before {
      content: "";
      position: absolute;
      top: 0; left: 0;
      width: 100%; height: 100%;
      background-color: rgba(0, 0, 0, 0.6);
      z-index: 1;
    }

    .login-container {
      position: relative;
      z-index: 2;
      height: 100%;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      padding: 20px;
      text-align: center;
    }

    .welcome-heading {
      color: #fff;
      font-size: 2.5rem;
      font-weight: 700;
      margin-bottom: 30px;
      text-shadow: 2px 2px 8px rgba(0,0,0,0.5);
      animation: fadeInDown 1s ease-in-out;
    }

    .login-box {
      background: rgba(255, 255, 255, 0.1);
      border: 1px solid rgba(255, 255, 255, 0.2);
      border-radius: 20px;
      padding: 40px;
      backdrop-filter: blur(12px);
      box-shadow: 0 8px 32px rgba(0, 0, 0, 0.4);
      max-width: 420px;
      width: 100%;
      text-align: center;
      color: #fff;
      animation: fadeIn 1s ease-in-out;
    }

    .login-box h3 {
      font-size: 2rem;
      margin-bottom: 20px;
    }

    .login-box input[type="email"],
    .login-box input[type="password"] {
      width: 100%;
      padding: 12px 18px;
      margin: 10px 0;
      border: none;
      border-radius: 30px;
      background-color: rgba(255, 255, 255, 0.2);
      color: #fff;
      font-size: 1rem;
      outline: none;
    }

    .login-box input::placeholder {
      color: #ddd;
    }

    .login-box button {
      width: 100%;
      padding: 12px;
      margin-top: 15px;
      font-size: 1rem;
      border: none;
      border-radius: 30px;
      background-color: #00c897;
      color: #fff;
      cursor: pointer;
      transition: all 0.3s ease;
      font-weight: 600;
    }

    .login-box button:hover {
      background-color: #00a67e;
      transform: translateY(-2px);
    }

    .login-box p {
      margin-top: 15px;
      font-size: 0.9rem;
    }

    .login-box a {
      color: #00c897;
      text-decoration: none;
      font-weight: 500;
      transition: color 0.3s;
    }

    .login-box a:hover {
      color: #00a67e;
    }

     @media (max-width: 500px) {
      .welcome-heading {
        font-size: 1.8rem;
      }
      .login-box {
        padding: 30px 25px;
      }
      .login-box h3 {
        font-size: 1.5rem;
      }
    }
  </style>
</head>
<body>
  <div class="login-background">
    <div class="login-container">
      <h1 class="welcome-heading">Welcome to Smart Tourism Planner</h1>
      <div class="login-box">
        <h3>Login to Your Account</h3>
        <form action="login" method="post">
          <input type="email" name="email" placeholder="Email Address" required />
          <input type="password" name="password" placeholder="Password" required />
          <button type="submit">Login</button>
        </form>
        <p>Don't have an account? <a href="register.jsp">Register here</a></p>
      </div>
    </div>
  </div>
</body>
</html>
