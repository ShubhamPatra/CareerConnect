<?php
require '../includes/db.php';
header('Content-Type: application/json');

// Get pagination parameters
$page = isset($_GET['page']) ? (int)$_GET['page'] : null;
$per_page = isset($_GET['per_page']) ? (int)$_GET['per_page'] : 12;

// If pagination parameters are provided, use pagination
if ($page !== null) {
    // Validate page number
    if ($page < 1) $page = 1;
    if ($per_page < 1) $per_page = 12;
    
    // Calculate offset
    $offset = ($page - 1) * $per_page;
    
    // Get total count
    $countStmt = $pdo->query("
        SELECT COUNT(*) as total
        FROM applications a
        JOIN jobs j ON a.job_id = j.id
    ");
    $total = $countStmt->fetch(PDO::FETCH_ASSOC)['total'];
    
    // Get paginated data
    $stmt = $pdo->prepare("
        SELECT a.id, a.full_name, a.email, a.resume, a.applied_at, j.title AS job_title, a.status
        FROM applications a
        JOIN jobs j ON a.job_id = j.id
        ORDER BY a.applied_at DESC
        LIMIT :limit OFFSET :offset
    ");
    $stmt->bindValue(':limit', $per_page, PDO::PARAM_INT);
    $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
    $stmt->execute();
    
    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    // Return structured response
    echo json_encode([
        'data' => $data,
        'total' => (int)$total,
        'page' => $page,
        'per_page' => $per_page
    ]);
} else {
    // Backward compatibility: return all data as before
    $stmt = $pdo->query("
        SELECT a.id, a.full_name, a.email, a.resume, a.applied_at, j.title AS job_title, a.status
        FROM applications a
        JOIN jobs j ON a.job_id = j.id
        ORDER BY a.applied_at DESC
    ");
    echo json_encode($stmt->fetchAll(PDO::FETCH_ASSOC));
}
