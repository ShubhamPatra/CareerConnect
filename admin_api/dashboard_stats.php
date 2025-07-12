<?php
require '../includes/db.php';
require 'auth_check.php';

header('Content-Type: application/json');

// Total jobs
$total = $pdo->query("SELECT COUNT(*) FROM jobs")->fetchColumn();

// Open jobs
$open = $pdo->query("SELECT COUNT(*) FROM jobs WHERE status = 'open'")->fetchColumn();

// Closed jobs
$closed = $pdo->query("SELECT COUNT(*) FROM jobs WHERE status = 'closed'")->fetchColumn();

// Applications
$applications = $pdo->query("SELECT COUNT(*) FROM applications")->fetchColumn();

echo json_encode([
  'total_jobs' => (int)$total,
  'open_jobs' => (int)$open,
  'closed_jobs' => (int)$closed,
  'applications' => (int)$applications
]);
