<?php
require '../includes/db.php';
header('Content-Type: application/json');

// Get pagination parameters
$page = isset($_GET['page']) ? (int)$_GET['page'] : null;
$per_page = isset($_GET['per_page']) ? (int)$_GET['per_page'] : 12;

// If pagination parameters are provided
if ($page !== null) {
    // Validate page number
    $page = max(1, $page);
    $per_page = max(1, $per_page);
    
    // Calculate offset
    $offset = ($page - 1) * $per_page;
    
    // Get total count
    $countStmt = $pdo->prepare("SELECT COUNT(*) FROM jobs");
    $countStmt->execute();
    $total = $countStmt->fetchColumn();
    
    // Get paginated jobs
    $stmt = $pdo->prepare("SELECT id, title, location, salary, status FROM jobs ORDER BY created_at DESC LIMIT :limit OFFSET :offset");
    $stmt->bindValue(':limit', $per_page, PDO::PARAM_INT);
    $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
    $stmt->execute();
    $jobs = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    // Return structured response
    echo json_encode([
        'data' => $jobs,
        'total' => (int)$total,
        'page' => $page,
        'per_page' => $per_page
    ]);
} else {
    // Backward compatibility - return all jobs as before
    $stmt = $pdo->query("SELECT id, title, location, salary, status FROM jobs ORDER BY created_at DESC");
    echo json_encode($stmt->fetchAll(PDO::FETCH_ASSOC));
}
