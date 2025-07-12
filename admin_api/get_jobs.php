<?php
require '../includes/db.php';
header('Content-Type: application/json');

$stmt = $pdo->query("SELECT id, title, location, salary, status FROM jobs ORDER BY created_at DESC");
echo json_encode($stmt->fetchAll(PDO::FETCH_ASSOC));
