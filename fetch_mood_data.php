<?php
session_start();

// Ensure user is logged in
if (!isset($_SESSION['user_id'])) {
    echo json_encode(['success' => false, 'error' => 'User not logged in.']);
    exit;
}

$user_id = $_SESSION['user_id'];
$period = $_GET['period'] ?? 'all'; // Default to 'all'

try {
    // Database connection
    $conn = new mysqli('localhost', 'root', '', 'account_data');
    if ($conn->connect_error) {
        throw new Exception('Database connection failed.');
    }

    // Build query based on the period
    $timeFilter = '';
    if ($period === 'week') {
        $timeFilter = "AND created_at >= DATE_SUB(CURDATE(), INTERVAL 1 WEEK)";
    } elseif ($period === 'month') {
        $timeFilter = "AND created_at >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)";
    }

    $query = "SELECT mood, COUNT(*) as count 
              FROM diary_entriess
              WHERE user_id = ? $timeFilter
              GROUP BY mood";

    $stmt = $conn->prepare($query);
    if (!$stmt) {
        throw new Exception('Database query preparation failed.');
    }

    $stmt->bind_param('i', $user_id);
    $stmt->execute();

    $result = $stmt->get_result();
    $moodData = [];
    while ($row = $result->fetch_assoc()) {
        $moodData[$row['mood']] = $row['count'];
    }

    echo json_encode(['success' => true, 'moodData' => $moodData]);

    $stmt->close();
    $conn->close();

} catch (Exception $e) {
    // Handle errors and return a meaningful JSON response
    echo json_encode(['success' => false, 'error' => $e->getMessage()]);
}
?>
