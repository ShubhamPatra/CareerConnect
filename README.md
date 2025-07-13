# CareerConnect Job Portal

CareerConnect is a comprehensive PHP-based job application portal that enables job seekers to browse and apply for positions while providing administrators with powerful tools to manage job listings and applications through a secure dashboard interface.

## 🚀 Technology Stack

- **Backend**: PHP 8.0+ with PDO for database operations
- **Database**: MySQL/MariaDB with foreign key constraints
- **Frontend**: HTML5, CSS3, JavaScript (ES6+)
- **Security**: Password hashing with PHP's `password_hash()`, session management
- **File Handling**: Secure resume upload with validation
- **UI Framework**: Font Awesome icons, responsive CSS Grid/Flexbox

---

## 🌐 Features

### 🎯 Public Side
- **Job Browsing**: View all open job listings with pagination
- **Advanced Search**: Filter jobs by title, location, skills, and salary range
- **Job Details**: Comprehensive job information including requirements and deadlines
- **Application System**: Apply to jobs with resume upload (PDF support)
- **Responsive Design**: Mobile-first responsive layout
- **Real-time Stats**: Dashboard showing total jobs and applications

### 🛠 Admin Panel
- **Secure Authentication**: Login/logout system with session management
- **Dashboard Analytics**: Real-time statistics for jobs and applications
- **Job Management**: Create, edit, delete, and toggle job status (open/closed)
- **Application Management**: View all applicants with detailed information
- **Resume Downloads**: Direct download of applicant resumes
- **Status Management**: Approve, reject, or keep applications pending
- **CSV Export**: Export application data for external analysis
- **Bulk Operations**: Manage multiple jobs and applications efficiently

---

## 📁 Project Structure

```
job-portal/
├── admin/                   # Admin frontend interface
│   ├── dashboard.html       # Main admin dashboard
│   ├── login.html          # Admin login page
│   └── js/
│       └── admin.js        # Admin panel JavaScript
├── admin_api/              # Admin backend APIs
│   ├── auth_check.php      # Authentication verification
│   ├── create_job.php      # Job creation endpoint
│   ├── delete_job.php      # Job deletion endpoint
│   ├── export_applicants.php # CSV export functionality
│   ├── get_applicants.php  # Fetch applications data
│   ├── get_job.php         # Single job retrieval
│   ├── get_jobs.php        # Jobs listing for admin
│   ├── login.php           # Admin login handler
│   ├── logout.php          # Session termination
│   ├── toggle_status.php   # Job status toggle
│   ├── update_application_status.php # Application status updates
│   └── update_job.php      # Job modification endpoint
├── backend/                # Public-facing APIs
│   ├── apply.php           # Job application submission
│   ├── get_job.php         # Public job details
│   └── get_jobs.php        # Public jobs listing
├── includes/               # Configuration and utilities
│   ├── config.php          # Application configuration
│   └── db.php              # Database connection setup
├── public/                 # Public frontend
│   ├── css/
│   │   └── style.css       # Main stylesheet
│   ├── js/
│   │   └── app.js          # Public-side JavaScript
│   ├── index.html          # Homepage
│   └── job_detail.html     # Job details page
├── uploads/                # File storage
│   └── resumes/            # Resume uploads directory
├── database.sql            # Database schema and sample data
└── README.md               # Project documentation
```

---

## 🗄️ Database Schema

The application uses three main tables with proper relationships:

### Tables Overview

1. **`admins`** - Administrator accounts
   - `id` (Primary Key)
   - `username` (Unique)
   - `password` (Hashed with `password_hash()`)

2. **`jobs`** - Job listings
   - `id` (Primary Key)
   - `title`, `description`, `location`, `skills`
   - `salary` (Decimal), `deadline` (Date)
   - `status` (ENUM: 'open', 'closed')
   - `created_at` (Timestamp)

3. **`applications`** - Job applications
   - `id` (Primary Key)
   - `job_id` (Foreign Key → jobs.id)
   - `full_name`, `email`, `phone`
   - `resume` (File path)
   - `applied_at` (Timestamp)
   - `status` (ENUM: 'pending', 'approved', 'rejected')
   - Unique constraint on (`job_id`, `email`)

---

## ⚙️ Technical Requirements

### Minimum Requirements
- **PHP**: 8.0+ (recommended) or 7.4+ (minimum)
- **MySQL**: 5.7+ or MariaDB 10.3+
- **Apache**: 2.4+ with mod_rewrite enabled
- **PHP Extensions**: PDO, PDO_MySQL, fileinfo, session
- **Disk Space**: 100MB+ for uploads
- **Memory**: 128MB+ PHP memory limit

### Development Environment
- **XAMPP**: 8.0+ (includes Apache, MySQL, PHP)
- **Alternative**: WAMP, MAMP, or Docker with LAMP stack
- **Browser**: Modern browser with JavaScript enabled
- **Internet**: Required for Font Awesome CDN

---

## 🚀 Setup Instructions

### 1. Environment Setup

**Option A: Using XAMPP**
```bash
# Download and install XAMPP from https://www.apachefriends.org/
# Start Apache and MySQL services
```

**Option B: Manual Setup**
```bash
# Ensure Apache, MySQL, and PHP are installed and configured
sudo systemctl start apache2
sudo systemctl start mysql
```

### 2. Project Installation

```bash
# Clone the repository
git clone https://github.com/yourname/job-portal.git

# Or download and extract to your web server directory
# For XAMPP: C:\xampp\htdocs\job-portal
# For Linux: /var/www/html/job-portal
```

### 3. Database Configuration

**Step 1: Create Database**
```sql
-- Via phpMyAdmin or MySQL CLI
CREATE DATABASE job_portal CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
```

**Step 2: Import Schema**
```bash
# Via phpMyAdmin: Import database.sql file
# Or via MySQL CLI:
mysql -u root -p job_portal < database.sql
```

**Step 3: Verify Tables**
```sql
USE job_portal;
SHOW TABLES;
-- Should show: admins, applications, jobs
```

### 4. Configuration Setup

Update configuration files with your environment settings:

**`includes/config.php`**
```php
<?php
define('DB_HOST', 'localhost');
define('DB_NAME', 'job_portal');
define('DB_USER', 'root');        // Your MySQL username
define('DB_PASS', '');            // Your MySQL password
define('UPLOAD_PATH', __DIR__ . '/../uploads/resumes/');
?>
```

### 5. File Permissions

```bash
# Set proper permissions for upload directory
chmod 755 uploads/
chmod 755 uploads/resumes/

# For Linux/Mac, ensure web server can write
sudo chown -R www-data:www-data uploads/
```

### 6. Access the Application

- **Public Site**: `http://localhost/job-portal/public/`
- **Admin Panel**: `http://localhost/job-portal/admin/login.html`

---

## 🔐 Admin Access & Security

### Default Admin Account

The database includes a pre-configured admin account:
- **Username**: `admin`
- **Password**: `admin123` (hashed with `password_hash()`)

### Creating Additional Admin Accounts

```sql
-- Add new admin (password will be hashed automatically by the application)
INSERT INTO admins (username, password) 
VALUES ('newadmin', '$2y$10$OEWlg5spFKHpuhdPDN9E3e4/jyF01DDSA2BAGHEnVy1bU56U9pgBm');
```

### Security Features

- **Password Hashing**: Uses PHP's `password_hash()` with bcrypt
- **Session Management**: Secure session handling with regeneration
- **File Upload Security**: 
  - File type validation (PDF only for resumes)
  - File size limits
  - Secure file naming to prevent conflicts
- **SQL Injection Protection**: All queries use prepared statements
- **XSS Prevention**: Input sanitization and output escaping

---

## 📡 API Documentation

### Public APIs

#### Get Jobs List
```
GET /backend/get_jobs.php
Response: JSON array of open jobs
```

#### Get Job Details
```
GET /backend/get_job.php?id={job_id}
Response: JSON object with job details
```

#### Submit Application
```
POST /backend/apply.php
Form Data: job_id, full_name, email, phone, resume (file)
Response: JSON success/error message
```

### Admin APIs

#### Authentication Check
```
GET /admin_api/auth_check.php
Response: {"authenticated": boolean}
```

#### Get All Jobs (Admin)
```
GET /admin_api/get_jobs.php
Response: JSON array of all jobs with status
```

#### Create Job
```
POST /admin_api/create_job.php
Form Data: title, description, location, skills, salary, deadline
Response: JSON success/error message
```

#### Update Job
```
POST /admin_api/update_job.php
Form Data: id, title, description, location, skills, salary, deadline
Response: JSON success/error message
```

#### Get Applications
```
GET /admin_api/get_applicants.php
Response: JSON array of all applications with job details
```

#### Update Application Status
```
POST /admin_api/update_application_status.php
Form Data: id, status (pending/approved/rejected)
Response: JSON success/error message
```

#### Export Applications
```
GET /admin_api/export_applicants.php
Response: CSV file download
```

---

## 🚀 Production Deployment

### Server Requirements

- **Web Server**: Apache 2.4+ or Nginx 1.18+
- **PHP**: 8.0+ with required extensions
- **Database**: MySQL 8.0+ or MariaDB 10.5+
- **SSL Certificate**: Recommended for production
- **Backup Strategy**: Regular database and file backups

### Deployment Steps

1. **Server Setup**
```bash
# Update server packages
sudo apt update && sudo apt upgrade

# Install LAMP stack
sudo apt install apache2 mysql-server php8.0 php8.0-mysql php8.0-mbstring
```

2. **Security Configuration**
```bash
# Secure MySQL installation
sudo mysql_secure_installation

# Configure firewall
sudo ufw allow 80
sudo ufw allow 443
sudo ufw enable
```

3. **Application Deployment**
```bash
# Upload files to web directory
# Update config.php with production database credentials
# Set proper file permissions
sudo chown -R www-data:www-data /var/www/html/job-portal
sudo chmod -R 755 /var/www/html/job-portal
sudo chmod -R 775 /var/www/html/job-portal/uploads
```

4. **SSL Setup** (Recommended)
```bash
# Using Let's Encrypt
sudo apt install certbot python3-certbot-apache
sudo certbot --apache -d yourdomain.com
```

---

## 🔧 Troubleshooting

### Common Issues

#### Database Connection Failed
```
Error: Database connection failed: SQLSTATE[HY000] [1045] Access denied
Solution: Check database credentials in includes/config.php
```

#### File Upload Issues
```
Error: Failed to upload resume
Solutions:
- Check upload directory permissions (755 or 775)
- Verify PHP upload_max_filesize setting
- Ensure file is PDF format and under size limit
```

#### Admin Login Problems
```
Error: Invalid credentials
Solutions:
- Verify admin account exists in database
- Check password hash in database
- Clear browser cache and cookies
```

#### Session Issues
```
Error: Session expired or authentication failed
Solutions:
- Check PHP session configuration
- Verify session directory permissions
- Clear browser cookies
```

### Debug Mode

Enable error reporting for development:
```php
// Add to top of PHP files for debugging
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
```

### Log Files

Check server logs for detailed error information:
```bash
# Apache error log
tail -f /var/log/apache2/error.log

# PHP error log
tail -f /var/log/php/error.log
```

---

## 🤝 Contributing

### Development Guidelines

1. **Code Standards**
   - Follow PSR-12 coding standards for PHP
   - Use meaningful variable and function names
   - Comment complex logic and algorithms
   - Maintain consistent indentation (2 spaces)

2. **Security Practices**
   - Always use prepared statements for database queries
   - Validate and sanitize all user inputs
   - Implement proper error handling
   - Use HTTPS in production

3. **Testing**
   - Test all functionality before submitting changes
   - Verify cross-browser compatibility
   - Test file upload functionality
   - Validate responsive design on mobile devices

### Contribution Process

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/new-feature`)
3. Make your changes with proper documentation
4. Test thoroughly in local environment
5. Commit changes (`git commit -am 'Add new feature'`)
6. Push to branch (`git push origin feature/new-feature`)
7. Create a Pull Request with detailed description

### Reporting Issues

When reporting bugs, please include:
- PHP version and server environment
- Browser and version
- Steps to reproduce the issue
- Error messages or screenshots
- Expected vs actual behavior

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

**Educational Use**: This project is designed for learning purposes and portfolio demonstration. Feel free to use, modify, and distribute according to the license terms.

---

## 🙋‍♂️ Author & Support

**Built with ❤️ by Shubham Patra**
