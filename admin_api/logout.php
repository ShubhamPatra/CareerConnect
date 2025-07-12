<?php
session_start();
session_destroy();

// Redirect to public index.html (adjust path as needed)
header("Location: ../public/index.html");
exit;
