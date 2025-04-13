<%-- 
    Document   : admin_login
    Created on : 11 Apr 2025, 1:26:54 am
    Author     : PRIYAM
--%>

<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Admin Login</title>
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background: #121212;
      color: white;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
    .login-box {
      background: #1e1e1e;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 0 15px rgba(0,0,0,0.7);
      width: 300px;
    }
    input, button {
      width: 100%;
      padding: 10px;
      margin-top: 15px;
      border-radius: 5px;
      border: none;
    }
    button {
      background: #00c897;
      color: white;
      font-weight: bold;
    }
  </style>
</head>
<body>
  <form class="login-box" method="post" action="adminlogin">
    <h2>Admin Login</h2>
    <input type="text" name="username" placeholder="Username" required/>
    <input type="password" name="password" placeholder="Password" required/>
    <button type="submit">Login</button>
    <p style="color:red;"><%= request.getParameter("error") != null ? "Invalid credentials" : "" %></p>
  </form>
</body>
</html>
