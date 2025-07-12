<?php
require '../includes/db.php';
header('Content-Type: application/json');

function countQuery($pdo, $sql) {
  try {
    return (int) $pdo->query($sql)->fetchColumn();
  } catch (Exception $e) {
    return 0;
  }
}

echo json_encode([
  "jobs" => countQuery($pdo, "SELECT COUNT(*) FROM jobs"),
  "open_jobs" => countQuery($pdo, "SELECT COUNT(*) FROM jobs WHERE status = 'open'"),
  "closed_jobs" => countQuery($pdo, "SELECT COUNT(*) FROM jobs WHERE status = 'closed'"),
  "applications" => countQuery($pdo, "SELECT COUNT(*) FROM applications")
]);
