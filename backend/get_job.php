<?php
require '../includes/db.php';
header('Content-Type: application/json');

if (!isset($_GET['id'])) {
  echo json_encode(["error" => "Missing job ID"]);
  exit;
}

$id = $_GET['id'];
$stmt = $pdo->prepare("SELECT * FROM jobs WHERE id = ?");
$stmt->execute([$id]);
$job = $stmt->fetch(PDO::FETCH_ASSOC);

echo json_encode($job);
