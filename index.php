<?php
include 'connect.php';
session_start();

// Handle Registration
if (isset($_POST['register'])) {
    if (!empty($_POST['newName']) && !empty($_POST['newEmail']) && !empty($_POST['newPassword'])) {
        $name = htmlspecialchars($_POST['newName'], ENT_QUOTES, 'UTF-8');
        $email = filter_var($_POST['newEmail'], FILTER_SANITIZE_EMAIL);
        $password = password_hash($_POST['newPassword'], PASSWORD_DEFAULT);

        // Check if email already exists
        $check_email_sql = $conn->prepare("SELECT Email FROM account_table WHERE Email = ?");
        $check_email_sql->bind_param("s", $email);
        $check_email_sql->execute();
        $check_email_sql->store_result();

        if ($check_email_sql->num_rows > 0) {
            echo "<script>alert('Email already registered. Please use a different email.');</script>";
        } else {
            // Insert user into database
            $register_sql = $conn->prepare("INSERT INTO account_table (Name, Email, Password) VALUES (?, ?, ?)");
            $register_sql->bind_param("sss", $name, $email, $password);

            if ($register_sql->execute()) {
                echo "<script>alert('Registration successful! Please log in.');</script>";
            } else {
                echo "<script>alert('Error registering user. Please try again later.');</script>";
            }

            $register_sql->close();
        }

        $check_email_sql->close();
    } else {
        echo "<script>alert('Please fill all fields.');</script>";
    }
}

// Handle Login
if (isset($_POST['login'])) {
    if (!empty($_POST['email']) && !empty($_POST['password'])) {
        $email = filter_var($_POST['email'], FILTER_SANITIZE_EMAIL);
        $password = $_POST['password'];

        // Fetch user details
        $login_sql = $conn->prepare("SELECT id, Name, Password FROM account_table WHERE Email = ?");
        $login_sql->bind_param("s", $email);
        $login_sql->execute();
        $result = $login_sql->get_result();

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();

            if (password_verify($password, $row['Password'])) {
                // Start session and redirect to home
                $_SESSION['user_id'] = $row['id'];
                $_SESSION['name'] = $row['Name'];
                $_SESSION['email'] = $email;

                echo "<script>
                    alert('Welcome, " . addslashes($row['Name']) . "!');
                    window.location.href = 'Home.php';
                </script>";
            } else {
                echo "<script>alert('Invalid password.');</script>";
            }
        } else {
            echo "<script>alert('User not found.');</script>";
        }

        $login_sql->close();
    } else {
        echo "<script>alert('Please fill all fields.');</script>";
    }
}

$conn->close(); // Close the database connection

?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login/Register</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Atma:wght@300;400;500;600;700&family=Dancing+Script:wght@400..700&family=Georama:ital,wght@0,100..900;1,100..900&family=Kumar+One&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="Home.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Atma:wght@300;400;500;600;700&family=Dancing+Script:wght@400..700&family=Georama:ital,wght@0,100..900;1,100..900&family=Kumar+One&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="index.css">
  <link rel="icon" type="image/png" href="img/logo.png">
  <style>
    /* Global Styles */
/* General Reset */
* {
  font-family: "Roboto", sans-serif;
    font-weight: 700;
    font-style: normal;
  
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  margin: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  position: relative;
  overflow: hidden; /* Ensures no scrollbars from the pseudo-element */
}

body::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-image: url('img/pexels-8moments-1323550 2 (1).png');
  background-repeat: no-repeat;
  background-size: cover;
  filter: blur(8px); /* Blurs the background */
  z-index: -1; /* Sends it behind the content */
}


/* Container */
.container {
  display: flex;
  flex-wrap: wrap; /* Allows wrapping for smaller screens */
  width: 90%;
  max-width: 1200px;
  background: rgba(255, 255, 255, 0.0); /* Fully transparent */
  overflow: hidden;
  transition: background 0.3s ease; /* Smooth transition for background */
}

.container:hover {
  background: rgba(255, 255, 255, 0.2); /* Semi-transparent white on hover */
}


/* Columns */
.text-column, .login-container {
  
  flex: 1; /* Each column takes equal width */
  padding: 2rem;
  min-width: 300px;
}

.text-column {
  animation: slideFromBottom 1.1s ease-out;
  color: #FFFFFF;
  text-align: center;
}

.text-column h1 {
  color: #FFFFFF;
  font-size: 3rem;
  margin-bottom: 1rem;
}

.text-column p {
  color: #FFFFFF;
  font-size: 2.2rem;
}

.login-container {
  animation: slideFromLeft 1.1s ease-out;
  background: rgba(255, 255, 255, 0.7); 
  border-radius: 8px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  overflow: hidden;
}
/* Tabs */
.tabs {
  display: flex;
  justify-content: center;
  margin-bottom: 1rem;
}

.tabs button {
  flex: 1;
  padding: 0.75rem;
  border: none;
  cursor: pointer;
  font-weight: bold;
  font-size: 1rem; /* Added for consistent scaling */
  transition: background-color 0.3s ease, color 0.3s ease; /* Smooth transitions */
  border-radius: 1rem; /* Added rounding for a modern look */
}

#loginbutton, #regBttn {
  background-color: #F9F298;
  color: #EF88A3;
}

.tabs button.active {
  background-color: #F9F298;
  color: #EF88A3;
}

.tabs button:not(.active) {
  background-color: transparent; 
  color: #EF88A3; /* Inactive text color */
  opacity: 0.4; /* Slightly faded */
}



/* Forms */
form {
  display: flex;
  flex-direction: column;
}

form label {
  margin-bottom: 0.5rem;
  font-weight: bold; /* Emphasize labels */
  color: #EF88A3;
}

form input, form button {
  margin-bottom: 1rem;
  padding: 0.75rem;
  border: 1px solid #ccc;
  border-radius: 5px;
  font-size: 1rem; /* Uniform sizing */
}

form input {
  border-radius: 1.125rem; /* Keep inputs visually consistent */
  transition: box-shadow 0.3s ease; /* Smooth focus effect */
}

form input:focus {
  outline: none;
  box-shadow: 0 0 5px rgba(239, 136, 163, 0.5); /* Subtle glow on focus */
}

form button {
  background-color: #EF88A3;
  color: #fff;
  border: none;
  cursor: pointer;
  transition: background-color 0.3s ease, transform 0.2s ease;
  font-weight: bold;
  border-radius: 1.125rem; /* Rounded button for a cohesive design */
}

form button:hover {
  background-color: #F76D92; /* Darker pink for hover effect */
  transform: translateY(-2px); /* Subtle lift effect */
}

form button:active {
  transform: translateY(0); /* Reset the lift on click */
  background-color: #EF5275; /* Even darker shade on click */
}

form button:hover {
  background-color: #d97187; /* Slightly darker hover effect */
}

/* Terms and Conditions */
.terms-and-conditions {
  display: flex; 
  align-items: center; 
  justify-content: center; 
  font-size: 0.9rem;
  margin-top: 1rem;
}

.terms-and-conditions label {
  display: flex; 
  align-items: center;
  gap: 0.5rem; 
  font-size: 0.9rem; 
  cursor: pointer; 
  line-height: 1; 
  white-space: nowrap; 
}

.terms-and-conditions a {
  color: #EF88A3;
  text-decoration: none;
}

.terms-and-conditions a:hover {
  text-decoration: underline;
}

.terms-and-conditions input[type="checkbox"] {
  margin: 0; 
  transform: scale(1.2); 
  vertical-align: middle; 
}
@keyframes slideFromLeft {
  0% {
    transform: translateX(-100%);
    opacity: 0;
  }
  100% {
    transform: translateX(0);
    opacity: 1;
  }
}
@keyframes slideFromBottom {
  0% {
    transform: translateY(100%);
    opacity: 0;
  }
  100% {
    transform: translateY(0);
    opacity: 1;
  }
}
/* Responsive Design */
@media (max-width: 768px) {
  .container {
    flex-direction: column; /* Stacks columns vertically on small screens */
  }

  .text-column, .login-container {
    min-width: 100%; /* Full-width for each column */
  }

  .text-column {
    text-align: center;
    padding: 1.5rem;
    
  }
}

    .hidden { display: none; }
    .active { background-color: #F9F298; color: #EF88A3; }
    .tabs button { padding: 10px; cursor: pointer; }
  </style>
</head>
<body>
<div class="container">
    <!-- Left Column -->
    <div class="text-column">
      <h1 class="yes">Write your story,</h1>
      <p class="no">One Click at a time</p>
    </div>

    <!-- Right Column -->
<div class="login-container">
  <div class="tabs">
    <button id="loginButton" class="active" onclick="showForm('login')">Login</button>
    <button id="registerButton" onclick="showForm('register')">Register</button>
  </div>

  <!-- Login Form -->
  <form id="loginForm" action="index.php" method="post" class="active-form">
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required>
    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required>
    <button type="submit" name="login" id="loginSubmitButton" disabled>Login</button>
  </form>

  <!-- Registration Form -->
  <form id="registerForm" action="index.php" method="post" class="hidden">
    <label for="newName">Name:</label>
    <input type="text" id="newName" name="newName" required>
    <label for="newEmail">Email:</label>
    <input type="email" id="newEmail" name="newEmail" required>
    <label for="newPassword">Password:</label>
    <input type="password" id="newPassword" name="newPassword" required>
    <button type="submit" id="registerSubmitButton" name="register" disabled>Register</button>
  </form>

  <!-- Terms and Conditions -->
  <div class="terms-and-conditions">
    <label for="terms">
      <input type="checkbox" id="terms" name="terms" required>
      I agree to the <a href="termsandcondition.html" target="_blank">terms and conditions</a>.
    </label>
  </div>
</div>

  </div>

  <script>
    document.addEventListener("DOMContentLoaded", () => {
  const termsCheckbox = document.getElementById("terms");
  const loginButton = document.getElementById("loginSubmitButton");
  const registerButton = document.getElementById("registerSubmitButton");

  // Disable buttons initially
  loginButton.disabled = true;
  registerButton.disabled = true;

  // Enable or disable buttons based on the checkbox state
  termsCheckbox.addEventListener("change", () => {
    const isChecked = termsCheckbox.checked;
    loginButton.disabled = !isChecked;
    registerButton.disabled = !isChecked;
  });
});

    function showForm(type) {
      const loginForm = document.getElementById('loginForm');
      const registerForm = document.getElementById('registerForm');
      const loginButton = document.getElementById('loginButton');
      const registerButton = document.getElementById('registerButton');

      if (type === 'login') {
        loginForm.classList.remove('hidden');
        registerForm.classList.add('hidden');
        loginButton.classList.add('active');
        registerButton.classList.remove('active');
      } else {
        loginForm.classList.add('hidden');
        registerForm.classList.remove('hidden');
        loginButton.classList.remove('active');
        registerButton.classList.add('active');
      }
    }
    // Default to showing the login form
    showForm('login');
  </script>
</body>
</html>
