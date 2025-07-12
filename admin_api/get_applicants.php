<?php
require '../includes/db.php';
header('Content-Type: application/json');

$stmt = $pdo->query("
  SELECT a.id, a.full_name, a.email, a.resume, a.applied_at, j.title AS job_title, a.status
  FROM applications a
  JOIN jobs j ON a.job_id = j.id
  ORDER BY a.applied_at DESC
");
echo json_encode($stmt->fetchAll(PDO::FETCH_ASSOC));
