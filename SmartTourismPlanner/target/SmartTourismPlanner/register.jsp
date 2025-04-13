<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Register - Smart Tourism Planner</title>
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

    .register-background {
      background: url('images/index1.webp') no-repeat center center fixed;
      background-size: cover;
      position: relative;
      height: 100%;
    }

    .register-background::before {
      content: "";
      position: absolute;
      top: 0; left: 0;
      width: 100%; height: 100%;
      background-color: rgba(0, 0, 0, 0.6);
      z-index: 1;
    }

    .register-container {
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

    .register-box {
      background: rgba(255, 255, 255, 0.1);
      border: 1px solid rgba(255, 255, 255, 0.2);
      border-radius: 20px;
      padding: 40px;
      backdrop-filter: blur(12px);
      box-shadow: 0 8px 32px rgba(0, 0, 0, 0.4);
      max-width: 420px;
      width: 100%;
      color: #fff;
      animation: fadeIn 1s ease-in-out;
    }

    .register-box h3 {
      font-size: 1.8rem;
      margin-bottom: 20px;
    }

    .register-box input[type="text"],
    .register-box input[type="email"],
    .register-box input[type="password"] {
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

    .register-box input::placeholder {
      color: #ddd;
    }

    .register-box button {
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

    .register-box button:hover {
      background-color: #00a67e;
      transform: translateY(-2px);
    }

    .register-box p {
      margin-top: 15px;
      font-size: 0.9rem;
    }

    .register-box a {
      color: #00c897;
      text-decoration: none;
      font-weight: 500;
      transition: color 0.3s;
    }

    .register-box a:hover {
      color: #00a67e;
    }

    @media (max-width: 500px) {
      .welcome-heading {
        font-size: 1.8rem;
      }
      .register-box {
        padding: 30px 25px;
      }
      .register-box h3 {
        font-size: 1.5rem;
      }
    }
  </style>

  <!-- ✅ JavaScript Validation -->
  <script>
    function validateRegister() {
      const name = document.forms["regForm"]["name"].value.trim();
      const email = document.forms["regForm"]["email"].value.trim();
      const password = document.forms["regForm"]["password"].value.trim();
      let error = "";

      if (name === "") {
        error = "Please enter your full name.";
      } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
        error = "Please enter a valid email address.";
      } else if (password.length < 6) {
        error = "Password must be at least 6 characters long.";
      }

      if (error !== "") {
        alert(error);
        return false;
      }
      return true;
    }
  </script>
</head>

<body>
  <div class="register-background">
    <div class="register-container">
      <h1 class="welcome-heading">Welcome to Smart Tourism Planner</h1>
      <div class="register-box">
        <h3>Create Your Account</h3>

        <form name="regForm" action="register" method="post" onsubmit="return validateRegister();">
          <input type="text" name="name" placeholder="Full Name" required />
          <input type="email" name="email" placeholder="Email Address" required />
          <input type="password" name="password" placeholder="Password" required />
          <button type="submit">Register</button>
        </form>

        <p>Already have an account? <a href="login.jsp">Login here</a></p>
      </div>
    </div>
  </div>
</body>
</html>
