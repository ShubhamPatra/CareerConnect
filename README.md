# CareerConnect Job Portal

CareerConnect is a PHP-based job application portal that allows candidates to view jobs and apply, while admins can manage job listings and applications via a secure dashboard.

---

## 🌐 Features

### 🎯 Public Side
- Browse open job listings
- View job details
- Apply to jobs with resume upload
- Home page with statistics and search UI
- Responsive layout (HTML/CSS/JS)

### 🛠 Admin Panel
- Admin login/logout system
- Dashboard with job/applicant stats
- Create, edit, delete, and close jobs
- View all applicants with resume download
- Approve or reject applications
- Export applications to CSV

---

## 📁 Project Structure

```
job-portal/
├── admin/                   # Admin frontend
│   ├── dashboard.html
│   ├── js/admin.js
│   └── login.html
├── admin_api/               # Admin-related backend APIs
│   ├── auth_check.php
│   ├── create_job.php
│   ├── delete_job.php
│   ├── get_applicants.php
│   ├── get_job.php
│   ├── get_jobs.php
│   ├── logout.php
│   ├── toggle_status.php
│   ├── update_job.php
│   ├── update_application_status.php
│   └── export_applicants.php
├── backend/                 # Public-side APIs
│   ├── apply.php
│   ├── get_job.php
│   └── get_jobs.php
├── includes/
│   └── db.php               # Database connection
├── public/                 # Public frontend
│   ├── css/style.css
│   ├── index.html
│   ├── job_detail.html
│   └── js/app.js
├── uploads/                # Resumes directory
├── sample_jobs.sql         # Sample jobs for testing
└── README.md
```

---

## ⚙️ Requirements

- PHP 7.4+
- MySQL
- Apache (via XAMPP or similar)
- Internet connection (for Font Awesome CDN)

---

## 🚀 Setup Instructions

### 1. Clone or Copy Project

```bash
git clone https://github.com/yourname/job-portal.git
```

Or copy the files manually into your XAMPP `htdocs/` folder.

### 2. Import Database

- Create a MySQL database (e.g. `job_portal`)
- Import `sample_jobs.sql` via phpMyAdmin or CLI

### 3. Configure DB

Update `includes/db.php` with your local database credentials:
```php
$pdo = new PDO("mysql:host=localhost;dbname=job_portal", "root", "");
```

### 4. Start Local Server

Open XAMPP → Start Apache and MySQL  
Visit: [http://localhost/job-portal/public/](http://localhost/job-portal/public/)

---

## 🔐 Admin Access

### Login at:
```
http://localhost/job-portal/admin/login.html
```

Use the admin credentials set in the database (you can manually add to `admins` table if needed).

---

## 📦 Sample Admin SQL (if needed)

```sql
INSERT INTO admins (username, password)
VALUES ('admin', SHA2('admin123', 256));
```

---

## 📄 License

This project is licensed for educational and portfolio use. You may extend and deploy it freely.

---

## 🙋‍♂️ Author

Built with ❤️ by Shubham Patra

Feel free to customize and enhance it!
