<?php
require '../includes/db.php';

header('Content-Type: text/csv');
header('Content-Disposition: attachment; filename="applicants.csv"');

$output = fopen('php://output', 'w');

// CSV Header
fputcsv($output, ['Name', 'Email', 'Job Title', 'Status', 'Applied At']);

$stmt = $pdo->query("
  SELECT a.full_name, a.email, j.title AS job_title, a.status, a.applied_at
  FROM applications a
  JOIN jobs j ON a.job_id = j.id
  ORDER BY a.applied_at DESC
");

while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    fputcsv($output, [
        $row['full_name'],
        $row['email'],
        $row['job_title'],
        $row['status'] ?? 'pending',
        $row['applied_at']
    ]);
}

fclose($output);
exit;
