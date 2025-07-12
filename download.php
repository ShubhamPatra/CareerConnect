<?php
require 'includes/db.php';

$filename = $_GET['file'] ?? null;

// Basic security: allow only expected filename pattern
if (!$filename || !preg_match('/^[\w,\s-]+\.(pdf|docx|doc)$/i', $filename)) {
  die("Invalid file name.");
}

// Secure the full file path
$path = realpath(__DIR__ . '/uploads/' . $filename);

if (!$path || !file_exists($path)) {
  die("File not found.");
}

// Set headers for download
header('Content-Description: File Transfer');
header('Content-Type: application/octet-stream');
header('Content-Disposition: attachment; filename="' . basename($path) . '"');
header('Expires: 0');
header('Cache-Control: must-revalidate');
header('Pragma: public');
header('Content-Length: ' . filesize($path));
readfile($path);
exit;
