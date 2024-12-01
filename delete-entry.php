<?php
header('Content-Type: application/json');

$servername = "localhost"; // Replace with your server name
$username = "root";        // Replace with your MySQL username
$password = "";            // Replace with your MySQL password
$dbname = "account_data";  // Replace with your database name

try {
    $pdo = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    if ($_SERVER['REQUEST_METHOD'] === 'DELETE') {
        // Parse the raw input to get the ID
        parse_str(file_get_contents('php://input'), $data);
        $id = isset($data['id']) ? intval($data['id']) : null;

        if (!$id) {
            echo json_encode(['error' => 'No entry ID provided']);
            http_response_code(400);
            exit;
        }

        // Prepare and execute the DELETE query
        $stmt = $pdo->prepare('DELETE FROM diary_entriess WHERE id = :id');
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        $stmt->execute();

        if ($stmt->rowCount() > 0) {
            echo json_encode(['success' => 'Entry deleted successfully']);
            http_response_code(200);
        } else {
            echo json_encode(['error' => 'Entry not found']);
            http_response_code(404);
        }
    } else {
        echo json_encode(['error' => 'Invalid request method']);
        http_response_code(405);
    }
} catch (PDOException $e) {
    echo json_encode(['error' => 'Database error: ' . $e->getMessage()]);
    http_response_code(500);
}
?>
