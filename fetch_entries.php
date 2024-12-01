<?php
session_start(); // Start the session to access the logged-in user ID

// Check if the user is logged in
if (!isset($_SESSION['user_id'])) {
    echo json_encode(['success' => false, 'error' => 'User not logged in.']);
    exit;
}

$user_id = $_SESSION['user_id'];

// Database connection setup
$host = 'localhost';
$username = 'root';
$password = '';
$dbname = 'account_data';

$conn = new mysqli($host, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Base query to fetch entries for the logged-in user
$query = "SELECT id, 
                 entry_title, 
                 date_string, 
                 image_html, 
                 entry_text, 
                 gratitude, 
                 created_at 
          FROM diary_entriess 
          WHERE user_id = ?";

// Handle mood filter
if (isset($_GET['mood']) && $_GET['mood'] !== 'None' && $_GET['mood'] !== '') {
    $mood = $_GET['mood'];
    $query .= " AND mood = ?";
}

// Handle sorting by date
if (isset($_GET['sort'])) {
    $sort = $_GET['sort'];
    if ($sort === 'DateAsc') {
        $query .= " ORDER BY created_at ASC";
    } elseif ($sort === 'DateDesc') {
        $query .= " ORDER BY created_at DESC";
    }
}

// Prepare and execute the query
$stmt = $conn->prepare($query);

// Bind parameters based on mood filter presence
if (isset($mood)) {
    $stmt->bind_param('is', $user_id, $mood); // 'i' for user_id, 's' for mood
} else {
    $stmt->bind_param('i', $user_id);
}

$stmt->execute();
$result = $stmt->get_result();

$entries = [];

// Fetch data and store it in an array
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $entries[] = $row;
    }
}

// Return JSON response
echo json_encode(['success' => true, 'entries' => $entries]);

// Close the statement and connection
$stmt->close();
$conn->close();
?>
