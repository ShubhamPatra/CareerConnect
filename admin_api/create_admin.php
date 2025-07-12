<?php
require '../includes/db.php';

$username = 'admin';
$password = password_hash('admin123', PASSWORD_DEFAULT); // hash it properly

$stmt = $pdo->prepare("INSERT INTO admins (username, password) VALUES (?, ?)");
$stmt->execute([$username, $password]);

echo "✅ Admin user created.";
