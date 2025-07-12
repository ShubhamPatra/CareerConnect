<?php
require '../includes/db.php';
require 'auth_check.php';

header('Content-Type: application/json');

// Read and decode JSON body
$data = json_decode(file_get_contents("php://input"), true);

$id = $data['id'] ?? null;
$title = $data['title'] ?? '';
$location = $data['location'] ?? '';
$salary = $data['salary'] ?? 0;
$skills = $data['skills'] ?? '';
$description = $data['description'] ?? '';
$deadline = $data['deadline'] ?? '';

// Validate input
if (!$id || !$title || !$location || !$salary || !$deadline) {
  echo json_encode(['success' => false, 'error' => 'Missing required fields']);
  exit;
}

// Update the job
$stmt = $pdo->prepare("UPDATE jobs SET title = ?, location = ?, salary = ?, skills = ?, description = ?, deadline = ? WHERE id = ?");
$success = $stmt->execute([$title, $location, $salary, $skills, $description, $deadline, $id]);

echo json_encode(['success' => $success]);
