<?php
require '../includes/db.php';
require 'auth_check.php'; // ✅ Optional but recommended

header('Content-Type: application/json');

$id = $_GET['id'] ?? null;
if (!$id) {
    echo json_encode(['success' => false, 'error' => 'Missing job ID']);
    exit;
}

$stmt = $pdo->prepare("SELECT * FROM jobs WHERE id = ?");
$stmt->execute([$id]);
$job = $stmt->fetch(PDO::FETCH_ASSOC);

if ($job) {
    echo json_encode($job);
} else {
    echo json_encode(['success' => false, 'error' => 'Job not found']);
}
