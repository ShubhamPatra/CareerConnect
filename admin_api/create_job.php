<?php
require '../includes/db.php';
header('Content-Type: application/json');

$data = json_decode(file_get_contents("php://input"), true);

$title = $data['title'] ?? '';
$location = $data['location'] ?? '';
$salary = $data['salary'] ?? '';
$skills = $data['skills'] ?? '';
$description = $data['description'] ?? '';
$deadline = $data['deadline'] ?? '';

if (!$title || !$location || !$salary || !$description || !$deadline) {
  echo json_encode(["success" => false]);
  exit;
}

$stmt = $pdo->prepare("
  INSERT INTO jobs (title, location, salary, skills, description, deadline, status)
  VALUES (?, ?, ?, ?, ?, ?, 'open')
");

$success = $stmt->execute([$title, $location, $salary, $skills, $description, $deadline]);

echo json_encode(["success" => $success]);
