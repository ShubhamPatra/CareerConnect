<?php
require '../includes/db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  $job_id = $_POST['job_id'];
$job_id = $_POST['job_id'];
$full_name = $_POST['name'];       // still comes from form input called "name"
$email = $_POST['email'];
$phone = $_POST['phone'] ?? '';                  // optional: no phone input in form yet


  if (!isset($_FILES['resume']) || $_FILES['resume']['error'] !== UPLOAD_ERR_OK) {
    die("Resume upload failed.");
  }

  $resume_name = uniqid() . '_' . basename($_FILES['resume']['name']);
  $resume_path = '../uploads/' . $resume_name;
  move_uploaded_file($_FILES['resume']['tmp_name'], $resume_path);

$stmt = $pdo->prepare("INSERT INTO applications (job_id, full_name, email, phone, resume) VALUES (?, ?, ?, ?, ?)");
$stmt->execute([$job_id, $full_name, $email, $phone, $resume_name]);

  echo "<script>alert('Application submitted successfully!'); window.location.href='../public/index.html';</script>";
}
