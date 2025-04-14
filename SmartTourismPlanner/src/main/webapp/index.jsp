<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Smart Tourism Planner</title>
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    html, body {
      height: 100%;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #000;
      display: flex;
      flex-direction: column;
    }

    .background {
      background: url('images/pune.jpg') no-repeat center center fixed;
      background-size: cover;
      position: relative;
      flex: 1;
    }

    .background::before {
      content: "";
      position: absolute;
      top: 0; left: 0;
      width: 100%; height: 100%;
      background-color: rgba(0, 0, 0, 0.6);
      z-index: 1;
    }

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
      backdrop-filter: blur(12px);
      box-shadow: 0 8px 32px rgba(0, 0, 0, 0.5);
      max-width: 650px;
      width: 90%;
      animation: fadeIn 1.5s ease-in-out;
    }

    .glass-box h2 {
      font-size: 2.8rem;
      margin-bottom: 1rem;
      text-shadow: 2px 2px 6px rgba(0, 0, 0, 0.8);
    }

    .glass-box p {
      font-size: 1.1rem;
      margin-bottom: 2rem;
      color: #ddd;
    }

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

    @keyframes fadeIn {
      0% { opacity: 0; transform: translateY(-30px); }
      100% { opacity: 1; transform: translateY(0); }
    }

    #tagline::after {
      content: '|';
      animation: blink 1s infinite;
    }

    @keyframes blink {
      0%, 50%, 100% { opacity: 1; }
      25%, 75% { opacity: 0; }
    }

    #datetime {
      margin-top: 1rem;
      font-size: 0.95rem;
      color: #ccc;
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
        <p id="tagline"></p>
        <div>
          <a href="login.jsp" class="btn">Login</a>
          <a href="register.jsp" class="btn">Register</a>
        </div>
        <div id="datetime"></div>
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

  <script>
    // Typing Effect
    const text = "Plan your dream vacation, explore hidden gems, and travel smarter.";
    let i = 0;
    const speed = 50;
    function typeEffect() {
      if (i < text.length) {
        document.getElementById("tagline").innerHTML += text.charAt(i);
        i++;
        setTimeout(typeEffect, speed);
      }
    }
    window.onload = typeEffect;

    // Live Date & Time
    function updateDateTime() {
      const now = new Date();
      const formatted = now.toLocaleString();
      document.getElementById("datetime").textContent = "Current Time: " + formatted;
    }
    setInterval(updateDateTime, 1000);
    updateDateTime();
  </script>
</body>
</html>
