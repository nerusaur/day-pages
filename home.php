<?php
session_start();
include('connect.php');  //database connection

// Redirect if the user is not logged in
if (empty($_SESSION['user_id'])) {
    header('Location: index.php'); 
    exit();
}

// tmp stores session variables
$name = htmlspecialchars($_SESSION['name'] ?? "Guest");
// Handle diary entry submission
if (isset($_POST['submit'])) {
  // Database insertion
  $user_id = intval($_SESSION['user_id']);
  $mood = mysqli_real_escape_string($conn, $_POST['mood']);
  $entry_title = mysqli_real_escape_string($conn, $_POST['entry-title']);
  $entry_text = mysqli_real_escape_string($conn, $_POST['daily-entry']);
  $gratitude = mysqli_real_escape_string($conn, $_POST['gratitude']);
  $date_string = date("Y-m-d");
  $image_path = null;

  // Handle image upload
  if (!empty($_FILES['image_path']['name'])) {
      $upload_dir = 'uploads/';
      // Ensure the uploads directory exists
      if (!is_dir($upload_dir)) {
          mkdir($upload_dir, 0755, true);
      }
      // Generate a unique file name to avoid conflicts
      $file_name = time() . '_' . basename($_FILES['image_path']['name']);
      $image_path = $upload_dir . $file_name;
      // Move the uploaded file
      if (!move_uploaded_file($_FILES['image_path']['tmp_name'], $image_path)) {
          echo "<script>alert('Failed to upload image.');</script>";
          $image_path = null;
      }
  }

  // Insert query with gratitude field
  $stmt = $conn->prepare(
      "INSERT INTO diary_entriess (entry_title, date_string, image_html, entry_text, created_at, user_id, mood, gratitude)
       VALUES (?, ?, ?, ?, NOW(), ?, ?, ?)"
  );
  $stmt->bind_param("ssssiss", $entry_title, $date_string, $image_path, $entry_text, $user_id, $mood, $gratitude);

  if ($stmt->execute()) {
      echo "<script>alert('Diary entry added successfully!');</script>";
  } else {
      echo "<script>alert('Failed to add entry: " . $stmt->error . "');</script>";
  }
  $stmt->close();
}


// Handle logout action
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['logout'])) {
    session_unset(); // Remove all session variables
    session_destroy(); // Destroy the session

    echo "<script>
        alert('You have been logged out.');
        window.location.href = 'index.php';
    </script>";
    exit();
}
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['update'])) {
  // Capture and sanitize input values
  $updateName = htmlspecialchars($_POST['update_Name'] ?? '');
  $updateEmail = htmlspecialchars($_POST['update_Email'] ?? '');
  $updatePassword = htmlspecialchars($_POST['update_Password'] ?? '');

  // Prepare the update query dynamically
  $queryParts = [];
  $queryParams = [];
  $paramTypes = '';

  if (!empty($updateName)) {
      $queryParts[] = "Name = ?";
      $queryParams[] = $updateName;
      $paramTypes .= 's';
  }

  if (!empty($updateEmail)) {
      $queryParts[] = "Email = ?";
      $queryParams[] = $updateEmail;
      $paramTypes .= 's';
  }

  if (!empty($updatePassword)) {
      // Hash the password for security
      $hashedPassword = password_hash($updatePassword, PASSWORD_DEFAULT);
      $queryParts[] = "Password = ?";
      $queryParams[] = $hashedPassword;
      $paramTypes .= 's';
  }

  // Ensure there is at least one field to update
  if (!empty($queryParts)) {
      // Append the WHERE clause to the query
      $query = "UPDATE account_table SET " . implode(", ", $queryParts) . " WHERE ID = ?";
      $queryParams[] = $_SESSION['user_id'];
      $paramTypes .= 'i';

      // Prepare and execute the query
      if ($stmt = $conn->prepare($query)) {
          $stmt->bind_param($paramTypes, ...$queryParams);

          if ($stmt->execute()) {
              echo "<script>alert('Account information updated successfully!');</script>";
          } else {
              echo "<script>alert('Failed to update account: " . $stmt->error . "');</script>";
          }
          $stmt->close();
      } else {
          echo "<script>alert('Failed to prepare the query.');</script>";
      }
  } else {
      echo "<script>alert('No fields to update. Please provide input.');</script>";
  }
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Day Pages</title>
  <link rel="icon" type="image/png" href="img/logo.png">

  <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Atma:wght@300;400;500;600;700&family=Dancing+Script:wght@400..700&family=Georama:ital,wght@0,100..900;1,100..900&family=Kumar+One&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="Home.css">
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>

  <nav>
    <!-- nav header -->
    <div class="nav-header">
    <div><img src="img/logo.png" class = "logo">
    </div>
    <p>Day Pages</p>
      
</div>
    </div>
    <!-- links -->
    <ul class="links">
      <li>
        <a href="#home" id="txt">home</a>
      </li>
      <li>
        <a href="#create"id="txt">Create</a>
      </li>
      <li>
        <a href="#previous"id="txt">Previous</a>
      </li>
      <li>
        <a href="#moods"id="txt">Moods</a>
      </li>
      <li><form method="POST" action="home.php">
      <a href="#" id="txt" class="logout-link" onclick="logout()">Logout</a>

    </form>
      </li>
    </ul>
    <button class="nav-toggle">
      <i class="fas fa-bars"></i>
    </button>
  </nav>
  
  <section id="home">
  <section class="blue">
    <h1>Write your Story,</h1>
  <p>One click at a time</p>
 
    <div class="curve"></div>
  </section>

    <a href="#create" class="btn-start"><h2>Create!</h1></a>
  </section>
  
  <section id="create">
    <div class="container">
        <!-- New Entry Section -->
        <div class="box">
            <section id="section-new" class="section-new">
                <h1>New Entry</h1>
                <form action="home.php" method="POST" enctype="multipart/form-data" autocomplete="off" id="entryForm" >
                <select name="mood" id="mood-selector" class="mood-dropdown" required>
                    <option value="" disabled selected>Select Mood</option>
                    <option value="Happy">Happy 😊</option>
                    <option value="Relaxed">Relaxed 😌</option>
                    <option value="Focused">Focused 🎯</option>
                    <option value="Excited">Excited 😄</option>
                    <option value="Calm">Calm 🌊</option>
                    <option value="Sad">Sad 😢</option>
                    <option value="Anxious">Anxious 😰</option>
                    <option value="Angry">Angry 😠</option>
                    <option value="Content">Content 😊</option>
                    <option value="Energetic">Energetic ⚡</option>
                </select>
                    <input type="text" name="entry-title" id="entry-title" class="entry-title"  required placeholder="Title 🖊️" />
                    <textarea name="daily-entry" id="entry" class="entry-box" style="resize:none" required placeholder="Dear Diary ...🖊️"></textarea>
                    <button type="submit" id="submit" name="submit">Add To Diary</button>
                
            </section>
        </div>

        <!-- I'm Grateful For Section -->
        <div class="box">
            <section class="optional">
                <h1>I am grateful for:</h1>
                <form action="home.php" method="POST" enctype="multipart/form-data" autocomplete="off" id="entryForm">
                    <input type="text" name="gratitude" id="entry-gratitude" class="entry-gratitude" required placeholder="I am thankful for... 🖊️" />
                    
                        <label for="image-upload" class="image-button" id="image-container">
                            <img src="img/insertimage.png" alt="Upload Image" id="preview-image" />
                        </label>
                        <input type="file" name="image_path" id="image-upload" accept="image/*" style="display: none;" />
                    
                </form>
            </section>
        </div>
    </div>
</section>

<section id="previous"><h1>Previous Entries
  
<select id="mood-selector-filter" class="mood-dropdown-filter">
    <option value="None" selected>None</option>
    <option value="Happy">Happy 😊</option>
    <option value="Relaxed">Relaxed 😌</option>
    <option value="Focused">Focused 🎯</option>
    <option value="Excited">Excited 😄</option>
    <option value="Calm">Calm 🌊</option>
    <option value="Sad">Sad 😢</option>
    <option value="Anxious">Anxious 😰</option>
    <option value="Angry">Angry 😠</option>
    <option value="Content">Content 😊</option>
    <option value="Energetic">Energetic ⚡</option>
    <option value="DateAsc">By Date (Ascending)</option>
    <option value="DateDesc">By Date (Descending)</option>
  </select>
</h1></section>
      <section class="previous">
        <div class="full-height-container">
        
          <!-- Previous Entries Section -->
          <section class="section-old" id="entryResultsSection">
          
            
          
                <div class="history"></div>
                
            <div class="container">


            </div>
          </section>
        </div>
      
    </section>
  </section>
  
  <section id="moods">
  <section class="mood-chart-section">
    <h2>Mood Chart</h2>
    <h3>This graph shows your mood based on your entries</h3>
    <select id="period-selector" onchange="fetchMoodData(this.value)">
      <option value="all">All Time</option>
      <option value="week">This Week</option>
      
    </select>
    <div class="mood-content">
      <div class="chart-container">
        <canvas id="moodChart"></canvas>
      </div>
      <div class="text-container">
        <hr>
        <p id="mood-percentage">Mood frequency will appear here.</p>
      </div>
    </div>
  </section>
  <section class="mood-chart-section">Account Settings
  <form action="home.php" method="POST" enctype="multipart/form-data" autocomplete="off" id="updateForm" >
  <input type="text" name="update_Name" id="update_Name" class="entry-title"   placeholder="Update Name :" />
  <input type="text" name="update_Email" id="update_Email" class="entry-title"   placeholder="Update Email:" />
  <input type="password" name="update_Password" id="update_Password" class="entry-title"   placeholder="Update Password:" />                 
  
  <button type="submit" id="updateButton" name="update">UPDATE</button>
  </form>


  </section>
</section>
<footer>
    <div class="footer-container">
        <p>&copy; <?php echo date("Y"); ?> Day Pages. All Rights Reserved.</p>
        <nav1>
            <a href="termsandcondition.html">Terms & Conditions</a>|
        </nav>
    </div>
</footer>


  <script src="index.js"></script>

  <script>


  function logout() {
    const form = document.createElement('form');
    form.method = 'POST';
    form.action = ''; // Current page
    const input = document.createElement('input');
    input.type = 'hidden';
    input.name = 'logout';
    input.value = '1';
    form.appendChild(input);
    document.body.appendChild(form);
    form.submit();
  }
  </script>
  
</body>
</html>