<?php
require '../includes/db.php';
require 'auth_check.php';

$data = json_decode(file_get_contents("php://input"), true);
$id = $data['id'] ?? null;
$status = $data['status'] ?? null;

if ($id && in_array($status, ['approved', 'rejected'])) {
  $stmt = $pdo->prepare("UPDATE applications SET status = ? WHERE id = ?");
  $stmt->execute([$status, $id]);
  echo json_encode(['success' => true]);
} else {
  echo json_encode(['success' => false, 'error' => 'Invalid input']);
}
