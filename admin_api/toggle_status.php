<?php
require '../includes/db.php';
require 'auth_check.php';

header('Content-Type: application/json');
ob_clean(); // clears any accidental whitespace or BOM

$data = json_decode(file_get_contents("php://input"), true);

$id = $data['id'] ?? null;
$status = $data['status'] ?? null;

if (!$id || !in_array($status, ['open', 'closed'])) {
    echo json_encode(['success' => false, 'error' => 'Invalid input']);
    exit;
}

$stmt = $pdo->prepare("UPDATE jobs SET status = ? WHERE id = ?");
$success = $stmt->execute([$status, $id]);

echo json_encode(['success' => $success]);
exit;
