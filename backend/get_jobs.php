<?php
require '../includes/db.php';

header('Content-Type: application/json');

$stmt = $pdo->query("SELECT id, title, location, salary FROM jobs WHERE status = 'open' ORDER BY created_at DESC");
$jobs = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($jobs);
