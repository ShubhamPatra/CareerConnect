-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 12, 2025 at 03:11 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `job_portal`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`) VALUES
(2, 'admin', '$2y$10$OEWlg5spFKHpuhdPDN9E3e4/jyF01DDSA2BAGHEnVy1bU56U9pgBm');

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE `applications` (
  `id` int(11) NOT NULL,
  `job_id` int(11) DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `resume` varchar(255) DEFAULT NULL,
  `applied_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('pending','approved','rejected') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `applications`
--

INSERT INTO `applications` (`id`, `job_id`, `full_name`, `email`, `phone`, `resume`, `applied_at`, `status`) VALUES
(2, 109, 'Shubham', 'shubhampatra635@gmail.com', '9439602249', '6872559fa6d4a_DP & Greedy Algorithms Cheat Sheet (Java).pdf', '2025-07-12 12:31:27', 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `skills` varchar(255) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `status` enum('open','closed') DEFAULT 'open',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `title`, `description`, `location`, `skills`, `salary`, `deadline`, `status`, `created_at`) VALUES
(8, 'Full Stack Developer', 'We are looking for a passionate individual to join us.', 'New York, NY', 'JIRA, Selenium', 86739.00, '2025-11-01', 'open', '2025-07-12 12:22:51'),
(9, 'Mobile App Developer', 'We are looking for a passionate individual to join us.', 'Remote', 'SQL, Excel', 68451.00, '2025-11-04', 'closed', '2025-07-12 12:22:51'),
(10, 'Software Engineer', 'Collaborate with cross-functional teams to deliver quality.', 'Austin, TX', 'Linux, Bash', 74183.00, '2025-12-27', 'open', '2025-07-12 12:22:51'),
(11, 'Full Stack Developer', 'Be part of a dynamic and fast-growing company.', 'Boston, MA', 'AWS, Docker', 98665.00, '2025-12-07', 'open', '2025-07-12 12:22:51'),
(12, 'ML Engineer', 'We are looking for a passionate individual to join us.', 'Boston, MA', 'Agile, Scrum', 61134.00, '2025-08-13', 'closed', '2025-07-12 12:22:51'),
(13, 'Graphic Designer', 'Collaborate with cross-functional teams to deliver quality.', 'New York, NY', 'SQL, Excel', 115884.00, '2025-11-24', 'open', '2025-07-12 12:22:51'),
(14, 'Mobile App Developer', 'Join our team and work on exciting projects.', 'Seattle, WA', 'Python, Django', 104945.00, '2025-09-02', 'open', '2025-07-12 12:22:51'),
(15, 'Sales Executive', 'Take part in our mission to innovate and lead.', 'Los Angeles, CA', 'Python, Django', 61514.00, '2025-11-01', 'closed', '2025-07-12 12:22:51'),
(16, 'Sales Executive', 'Take part in our mission to innovate and lead.', 'San Francisco, CA', 'Figma, Sketch', 72580.00, '2025-11-21', 'open', '2025-07-12 12:22:51'),
(17, 'Sales Executive', 'Join our team and work on exciting projects.', 'Remote', 'AWS, Docker', 114654.00, '2025-12-08', 'closed', '2025-07-12 12:22:51'),
(18, 'Mobile App Developer', 'Be part of a dynamic and fast-growing company.', 'Remote', 'Agile, Scrum', 77910.00, '2025-10-23', 'closed', '2025-07-12 12:22:51'),
(19, 'QA Tester', 'We are looking for a passionate individual to join us.', 'Los Angeles, CA', 'React, Node.js', 62122.00, '2025-09-02', 'open', '2025-07-12 12:22:51'),
(20, 'Software Engineer', 'Take part in our mission to innovate and lead.', 'Denver, CO', 'Python, Django', 117487.00, '2025-11-11', 'closed', '2025-07-12 12:22:51'),
(21, 'Content Writer', 'Collaborate with cross-functional teams to deliver quality.', 'Los Angeles, CA', 'AWS, Docker', 104557.00, '2025-08-16', 'closed', '2025-07-12 12:22:51'),
(22, 'Frontend Developer', 'Join our team and work on exciting projects.', 'Los Angeles, CA', 'AWS, Docker', 52746.00, '2025-10-23', 'closed', '2025-07-12 12:22:51'),
(23, 'Software Engineer', 'Collaborate with cross-functional teams to deliver quality.', 'Denver, CO', 'Photoshop, Illustrator', 67993.00, '2025-08-27', 'closed', '2025-07-12 12:22:51'),
(24, 'Graphic Designer', 'Join our team and work on exciting projects.', 'Remote', 'Linux, Bash', 53400.00, '2025-08-14', 'open', '2025-07-12 12:22:51'),
(25, 'Mobile App Developer', 'Be part of a dynamic and fast-growing company.', 'Chicago, IL', 'AWS, Docker', 58933.00, '2025-08-18', 'open', '2025-07-12 12:22:51'),
(26, 'QA Tester', 'Collaborate with cross-functional teams to deliver quality.', 'Denver, CO', 'Python, Django', 103512.00, '2025-09-15', 'closed', '2025-07-12 12:22:51'),
(27, 'Cloud Engineer', 'We are looking for a passionate individual to join us.', 'New York, NY', 'Agile, Scrum', 47032.00, '2025-11-04', 'open', '2025-07-12 12:22:51'),
(28, 'IT Support Specialist', 'Be part of a dynamic and fast-growing company.', 'Boston, MA', 'Linux, Bash', 84427.00, '2025-09-29', 'open', '2025-07-12 12:22:51'),
(29, 'DevOps Engineer', 'Be part of a dynamic and fast-growing company.', 'San Francisco, CA', 'SQL, Excel', 94767.00, '2025-08-30', 'open', '2025-07-12 12:22:51'),
(30, 'Full Stack Developer', 'Take part in our mission to innovate and lead.', 'Chicago, IL', 'SQL, Excel', 59526.00, '2025-09-29', 'open', '2025-07-12 12:22:51'),
(31, 'Mobile App Developer', 'Be part of a dynamic and fast-growing company.', 'New York, NY', 'Figma, Sketch', 64082.00, '2025-08-17', 'open', '2025-07-12 12:22:51'),
(32, 'DevOps Engineer', 'Take part in our mission to innovate and lead.', 'Denver, CO', 'Linux, Bash', 73062.00, '2025-10-04', 'closed', '2025-07-12 12:22:51'),
(33, 'Sales Executive', 'We are looking for a passionate individual to join us.', 'Seattle, WA', 'Photoshop, Illustrator', 71309.00, '2025-11-09', 'open', '2025-07-12 12:22:51'),
(34, 'Project Manager', 'We are looking for a passionate individual to join us.', 'San Francisco, CA', 'HTML, CSS, JS', 65068.00, '2025-10-18', 'open', '2025-07-12 12:22:51'),
(35, 'Graphic Designer', 'Collaborate with cross-functional teams to deliver quality.', 'Denver, CO', 'React, Node.js', 71192.00, '2025-09-11', 'open', '2025-07-12 12:22:51'),
(36, 'UI/UX Designer', 'Collaborate with cross-functional teams to deliver quality.', 'Denver, CO', 'Photoshop, Illustrator', 111089.00, '2025-10-07', 'open', '2025-07-12 12:22:51'),
(37, 'QA Tester', 'Take part in our mission to innovate and lead.', 'Remote', 'JIRA, Selenium', 59616.00, '2025-10-08', 'open', '2025-07-12 12:22:51'),
(38, 'Graphic Designer', 'Join our team and work on exciting projects.', 'Los Angeles, CA', 'Agile, Scrum', 50205.00, '2025-10-11', 'closed', '2025-07-12 12:22:51'),
(39, 'Backend Developer', 'Take part in our mission to innovate and lead.', 'Remote', 'JIRA, Selenium', 80575.00, '2025-10-26', 'open', '2025-07-12 12:22:51'),
(40, 'Cloud Engineer', 'Take part in our mission to innovate and lead.', 'Denver, CO', 'HTML, CSS, JS', 97339.00, '2025-08-29', 'closed', '2025-07-12 12:22:51'),
(41, 'Full Stack Developer', 'Collaborate with cross-functional teams to deliver quality.', 'Seattle, WA', 'Python, Django', 58765.00, '2025-10-18', 'open', '2025-07-12 12:22:51'),
(42, 'ML Engineer', 'Collaborate with cross-functional teams to deliver quality.', 'Austin, TX', 'Agile, Scrum', 63910.00, '2025-10-13', 'open', '2025-07-12 12:22:51'),
(43, 'Business Analyst', 'Collaborate with cross-functional teams to deliver quality.', 'Remote', 'Photoshop, Illustrator', 92532.00, '2025-08-23', 'closed', '2025-07-12 12:22:51'),
(44, 'Marketing Manager', 'Take part in our mission to innovate and lead.', 'Austin, TX', 'Python, Django', 65677.00, '2025-10-28', 'open', '2025-07-12 12:22:51'),
(45, 'Cybersecurity Analyst', 'Be part of a dynamic and fast-growing company.', 'Denver, CO', 'AWS, Docker', 79877.00, '2025-12-23', 'open', '2025-07-12 12:22:51'),
(46, 'Sales Executive', 'We are looking for a passionate individual to join us.', 'Los Angeles, CA', 'JIRA, Selenium', 100825.00, '2025-11-09', 'closed', '2025-07-12 12:22:51'),
(47, 'Content Writer', 'Join our team and work on exciting projects.', 'Los Angeles, CA', 'AWS, Docker', 106596.00, '2025-08-26', 'open', '2025-07-12 12:22:51'),
(48, 'Frontend Developer', 'We are looking for a passionate individual to join us.', 'Seattle, WA', 'React, Node.js', 75790.00, '2025-10-27', 'closed', '2025-07-12 12:22:51'),
(49, 'Graphic Designer', 'Join our team and work on exciting projects.', 'Remote', 'Photoshop, Illustrator', 49106.00, '2025-12-23', 'open', '2025-07-12 12:22:51'),
(50, 'IT Support Specialist', 'Be part of a dynamic and fast-growing company.', 'Los Angeles, CA', 'JIRA, Selenium', 103854.00, '2025-09-01', 'open', '2025-07-12 12:22:51'),
(51, 'ML Engineer', 'Be part of a dynamic and fast-growing company.', 'Seattle, WA', 'Python, Django', 117138.00, '2025-11-14', 'open', '2025-07-12 12:22:51'),
(52, 'DevOps Engineer', 'We are looking for a passionate individual to join us.', 'New York, NY', 'React, Node.js', 91739.00, '2025-08-20', 'open', '2025-07-12 12:22:51'),
(53, 'IT Support Specialist', 'Take part in our mission to innovate and lead.', 'Boston, MA', 'React, Node.js', 45649.00, '2025-10-03', 'closed', '2025-07-12 12:22:51'),
(54, 'Content Writer', 'Take part in our mission to innovate and lead.', 'Boston, MA', 'SQL, Excel', 75868.00, '2025-11-19', 'open', '2025-07-12 12:22:51'),
(55, 'UI/UX Designer', 'Collaborate with cross-functional teams to deliver quality.', 'Seattle, WA', 'Figma, Sketch', 87238.00, '2025-11-23', 'closed', '2025-07-12 12:22:51'),
(56, 'Project Manager', 'Collaborate with cross-functional teams to deliver quality.', 'Remote', 'SQL, Excel', 114137.00, '2025-11-04', 'open', '2025-07-12 12:22:51'),
(57, 'Project Manager', 'Take part in our mission to innovate and lead.', 'San Francisco, CA', 'Linux, Bash', 48046.00, '2025-11-16', 'closed', '2025-07-12 12:22:51'),
(58, 'ML Engineer', 'Join our team and work on exciting projects.', 'Seattle, WA', 'React, Node.js', 56056.00, '2025-10-12', 'open', '2025-07-12 12:22:51'),
(59, 'Graphic Designer', 'Join our team and work on exciting projects.', 'Atlanta, GA', 'SQL, Excel', 59807.00, '2025-12-29', 'closed', '2025-07-12 12:22:51'),
(60, 'Frontend Developer', 'Collaborate with cross-functional teams to deliver quality.', 'New York, NY', 'JIRA, Selenium', 63741.00, '2025-09-26', 'closed', '2025-07-12 12:22:51'),
(61, 'Data Analyst', 'Take part in our mission to innovate and lead.', 'New York, NY', 'AWS, Docker', 108050.00, '2025-10-12', 'open', '2025-07-12 12:22:51'),
(62, 'Project Manager', 'Collaborate with cross-functional teams to deliver quality.', 'Austin, TX', 'Linux, Bash', 99242.00, '2025-09-03', 'open', '2025-07-12 12:22:51'),
(63, 'Cybersecurity Analyst', 'Collaborate with cross-functional teams to deliver quality.', 'Atlanta, GA', 'Photoshop, Illustrator', 54092.00, '2025-08-25', 'closed', '2025-07-12 12:22:51'),
(64, 'Cybersecurity Analyst', 'Join our team and work on exciting projects.', 'Atlanta, GA', 'React, Node.js', 109545.00, '2025-08-31', 'closed', '2025-07-12 12:22:51'),
(65, 'Business Analyst', 'We are looking for a passionate individual to join us.', 'San Francisco, CA', 'JIRA, Selenium', 60333.00, '2025-12-20', 'open', '2025-07-12 12:22:51'),
(66, 'Sales Executive', 'We are looking for a passionate individual to join us.', 'Atlanta, GA', 'React, Node.js', 113772.00, '2025-11-17', 'closed', '2025-07-12 12:22:51'),
(67, 'HR Associate', 'We are looking for a passionate individual to join us.', 'Austin, TX', 'SQL, Excel', 56147.00, '2025-10-26', 'open', '2025-07-12 12:22:51'),
(68, 'Frontend Developer', 'Join our team and work on exciting projects.', 'Seattle, WA', 'Linux, Bash', 96322.00, '2025-11-20', 'closed', '2025-07-12 12:22:51'),
(69, 'Project Manager', 'We are looking for a passionate individual to join us.', 'Denver, CO', 'Linux, Bash', 109233.00, '2025-09-02', 'open', '2025-07-12 12:22:51'),
(70, 'Data Analyst', 'We are looking for a passionate individual to join us.', 'Seattle, WA', 'SQL, Excel', 58184.00, '2025-09-09', 'closed', '2025-07-12 12:22:51'),
(71, 'Sales Executive', 'We are looking for a passionate individual to join us.', 'Seattle, WA', 'Linux, Bash', 53334.00, '2025-08-15', 'open', '2025-07-12 12:22:51'),
(72, 'Marketing Manager', 'Collaborate with cross-functional teams to deliver quality.', 'Remote', 'AWS, Docker', 47369.00, '2025-09-16', 'open', '2025-07-12 12:22:51'),
(73, 'QA Tester', 'We are looking for a passionate individual to join us.', 'Chicago, IL', 'Agile, Scrum', 110721.00, '2025-10-31', 'closed', '2025-07-12 12:22:51'),
(74, 'Project Manager', 'We are looking for a passionate individual to join us.', 'Seattle, WA', 'Agile, Scrum', 79629.00, '2025-11-07', 'open', '2025-07-12 12:22:51'),
(75, 'Content Writer', 'Join our team and work on exciting projects.', 'Remote', 'AWS, Docker', 61414.00, '2025-12-10', 'closed', '2025-07-12 12:22:51'),
(76, 'Content Writer', 'We are looking for a passionate individual to join us.', 'San Francisco, CA', 'HTML, CSS, JS', 79555.00, '2025-10-10', 'open', '2025-07-12 12:22:51'),
(77, 'Project Manager', 'Take part in our mission to innovate and lead.', 'San Francisco, CA', 'JIRA, Selenium', 81416.00, '2025-08-22', 'closed', '2025-07-12 12:22:51'),
(78, 'QA Tester', 'Be part of a dynamic and fast-growing company.', 'Remote', 'Linux, Bash', 68415.00, '2025-12-29', 'open', '2025-07-12 12:22:51'),
(79, 'ML Engineer', 'Join our team and work on exciting projects.', 'Remote', 'Photoshop, Illustrator', 82565.00, '2025-10-16', 'closed', '2025-07-12 12:22:51'),
(80, 'Marketing Manager', 'Take part in our mission to innovate and lead.', 'Denver, CO', 'Photoshop, Illustrator', 45124.00, '2026-01-06', 'open', '2025-07-12 12:22:51'),
(81, 'Frontend Developer', 'Collaborate with cross-functional teams to deliver quality.', 'Chicago, IL', 'Figma, Sketch', 110067.00, '2025-08-15', 'closed', '2025-07-12 12:22:51'),
(82, 'Cloud Engineer', 'We are looking for a passionate individual to join us.', 'Austin, TX', 'Python, Django', 119526.00, '2025-09-16', 'closed', '2025-07-12 12:22:51'),
(83, 'Cloud Engineer', 'We are looking for a passionate individual to join us.', 'Atlanta, GA', 'React, Node.js', 111028.00, '2026-01-05', 'closed', '2025-07-12 12:22:51'),
(84, 'Content Writer', 'We are looking for a passionate individual to join us.', 'Los Angeles, CA', 'HTML, CSS, JS', 98889.00, '2025-12-10', 'open', '2025-07-12 12:22:51'),
(85, 'Content Writer', 'Join our team and work on exciting projects.', 'Chicago, IL', 'Python, Django', 92433.00, '2026-01-03', 'open', '2025-07-12 12:22:51'),
(86, 'DevOps Engineer', 'Collaborate with cross-functional teams to deliver quality.', 'New York, NY', 'Agile, Scrum', 112848.00, '2025-11-21', 'closed', '2025-07-12 12:22:51'),
(87, 'IT Support Specialist', 'We are looking for a passionate individual to join us.', 'San Francisco, CA', 'AWS, Docker', 115936.00, '2025-09-19', 'closed', '2025-07-12 12:22:51'),
(88, 'Sales Executive', 'We are looking for a passionate individual to join us.', 'Austin, TX', 'SQL, Excel', 111917.00, '2025-09-30', 'closed', '2025-07-12 12:22:51'),
(89, 'ML Engineer', 'Be part of a dynamic and fast-growing company.', 'Los Angeles, CA', 'Figma, Sketch', 45888.00, '2025-12-05', 'closed', '2025-07-12 12:22:51'),
(90, 'Business Analyst', 'Join our team and work on exciting projects.', 'Austin, TX', 'AWS, Docker', 56363.00, '2026-01-05', 'open', '2025-07-12 12:22:51'),
(91, 'IT Support Specialist', 'We are looking for a passionate individual to join us.', 'Chicago, IL', 'Python, Django', 106855.00, '2025-11-04', 'closed', '2025-07-12 12:22:51'),
(92, 'Content Writer', 'Be part of a dynamic and fast-growing company.', 'Los Angeles, CA', 'JIRA, Selenium', 93781.00, '2026-01-01', 'closed', '2025-07-12 12:22:51'),
(93, 'Marketing Manager', 'Take part in our mission to innovate and lead.', 'Denver, CO', 'HTML, CSS, JS', 90244.00, '2025-12-06', 'closed', '2025-07-12 12:22:51'),
(94, 'Project Manager', 'We are looking for a passionate individual to join us.', 'Austin, TX', 'JIRA, Selenium', 104999.00, '2025-08-31', 'open', '2025-07-12 12:22:51'),
(95, 'Business Analyst', 'Take part in our mission to innovate and lead.', 'Seattle, WA', 'Figma, Sketch', 94900.00, '2025-08-14', 'closed', '2025-07-12 12:22:51'),
(96, 'Frontend Developer', 'Take part in our mission to innovate and lead.', 'Denver, CO', 'Figma, Sketch', 110251.00, '2025-11-23', 'closed', '2025-07-12 12:22:51'),
(97, 'IT Support Specialist', 'We are looking for a passionate individual to join us.', 'San Francisco, CA', 'HTML, CSS, JS', 111814.00, '2025-09-07', 'closed', '2025-07-12 12:22:51'),
(98, 'Business Analyst', 'Take part in our mission to innovate and lead.', 'Los Angeles, CA', 'Linux, Bash', 58409.00, '2025-12-19', 'open', '2025-07-12 12:22:51'),
(99, 'UI/UX Designer', 'Take part in our mission to innovate and lead.', 'Remote', 'Photoshop, Illustrator', 58537.00, '2025-12-11', 'closed', '2025-07-12 12:22:51'),
(100, 'HR Associate', 'Take part in our mission to innovate and lead.', 'Denver, CO', 'Agile, Scrum', 117978.00, '2025-09-13', 'open', '2025-07-12 12:22:51'),
(101, 'Content Writer', 'Take part in our mission to innovate and lead.', 'Boston, MA', 'Agile, Scrum', 63270.00, '2026-01-03', 'open', '2025-07-12 12:22:51'),
(102, 'IT Support Specialist', 'Be part of a dynamic and fast-growing company.', 'Austin, TX', 'HTML, CSS, JS', 50634.00, '2025-08-31', 'closed', '2025-07-12 12:22:51'),
(103, 'Backend Developer', 'Be part of a dynamic and fast-growing company.', 'Denver, CO', 'Photoshop, Illustrator', 57359.00, '2025-09-11', 'closed', '2025-07-12 12:22:51'),
(104, 'QA Tester', 'Take part in our mission to innovate and lead.', 'Los Angeles, CA', 'Python, Django', 93441.00, '2025-12-13', 'closed', '2025-07-12 12:22:51'),
(105, 'Content Writer', 'Be part of a dynamic and fast-growing company.', 'Boston, MA', 'HTML, CSS, JS', 117814.00, '2025-11-27', 'open', '2025-07-12 12:22:51'),
(106, 'Full Stack Developer', 'Collaborate with cross-functional teams to deliver quality.', 'Remote', 'React, Node.js', 59593.00, '2025-09-01', 'open', '2025-07-12 12:22:51'),
(107, 'Marketing Manager', 'Collaborate with cross-functional teams to deliver quality.', 'San Francisco, CA', 'SQL, Excel', 108932.00, '2025-12-31', 'open', '2025-07-12 12:22:51'),
(108, 'ML Engineer', 'Join our team and work on exciting projects.', 'New York, NY', 'React, Node.js', 85924.00, '2025-10-19', 'closed', '2025-07-12 12:23:53'),
(109, 'Data Analyst', 'Be part of a dynamic and fast-growing company.', 'New York, NY', 'HTML, CSS, JS', 92227.00, '2025-09-13', 'open', '2025-07-12 12:23:53'),
(110, 'UI/UX Designer', 'Collaborate with cross-functional teams to deliver quality.', 'Atlanta, GA', 'Figma, Sketch', 115515.00, '2025-10-05', 'open', '2025-07-12 12:23:53'),
(111, 'Cloud Engineer', 'Take part in our mission to innovate and lead.', 'Austin, TX', 'SQL, Excel', 80243.00, '2025-10-03', 'open', '2025-07-12 12:23:53'),
(112, 'UI/UX Designer', 'Join our team and work on exciting projects.', 'San Francisco, CA', 'React, Node.js', 105498.00, '2025-10-20', 'open', '2025-07-12 12:23:53'),
(113, 'Graphic Designer', 'Collaborate with cross-functional teams to deliver quality.', 'San Francisco, CA', 'React, Node.js', 113769.00, '2025-11-17', 'open', '2025-07-12 12:23:53'),
(114, 'UI/UX Designer', 'Take part in our mission to innovate and lead.', 'Chicago, IL', 'JIRA, Selenium', 99014.00, '2025-10-15', 'open', '2025-07-12 12:23:53'),
(115, 'Full Stack Developer', 'We are looking for a passionate individual to join us.', 'Austin, TX', 'AWS, Docker', 78218.00, '2025-09-29', 'open', '2025-07-12 12:23:53'),
(116, 'Mobile App Developer', 'Collaborate with cross-functional teams to deliver quality.', 'Remote', 'SQL, Excel', 78050.00, '2025-10-18', 'open', '2025-07-12 12:23:53'),
(117, 'Sales Executive', 'Be part of a dynamic and fast-growing company.', 'Remote', 'Python, Django', 76910.00, '2025-08-29', 'open', '2025-07-12 12:23:53'),
(118, 'Business Analyst', 'Join our team and work on exciting projects.', 'Seattle, WA', 'Agile, Scrum', 58902.00, '2025-10-15', 'open', '2025-07-12 12:23:53'),
(119, 'Mobile App Developer', 'We are looking for a passionate individual to join us.', 'Los Angeles, CA', 'React, Node.js', 80577.00, '2025-09-18', 'closed', '2025-07-12 12:23:53'),
(120, 'UI/UX Designer', 'Be part of a dynamic and fast-growing company.', 'Boston, MA', 'JIRA, Selenium', 100777.00, '2025-09-10', 'open', '2025-07-12 12:23:53'),
(121, 'Frontend Developer', 'Take part in our mission to innovate and lead.', 'Boston, MA', 'Photoshop, Illustrator', 100993.00, '2025-12-17', 'closed', '2025-07-12 12:23:53'),
(122, 'Backend Developer', 'Collaborate with cross-functional teams to deliver quality.', 'Boston, MA', 'SQL, Excel', 115105.00, '2025-09-26', 'closed', '2025-07-12 12:23:53'),
(123, 'IT Support Specialist', 'Join our team and work on exciting projects.', 'Denver, CO', 'Agile, Scrum', 81228.00, '2025-11-08', 'open', '2025-07-12 12:23:53'),
(124, 'Content Writer', 'Be part of a dynamic and fast-growing company.', 'San Francisco, CA', 'Agile, Scrum', 75991.00, '2025-12-15', 'open', '2025-07-12 12:23:53'),
(125, 'Marketing Manager', 'Join our team and work on exciting projects.', 'San Francisco, CA', 'SQL, Excel', 102303.00, '2025-12-29', 'open', '2025-07-12 12:23:53'),
(126, 'Frontend Developer', 'Join our team and work on exciting projects.', 'Denver, CO', 'React, Node.js', 90020.00, '2025-11-09', 'open', '2025-07-12 12:23:53'),
(127, 'Sales Executive', 'Join our team and work on exciting projects.', 'Seattle, WA', 'JIRA, Selenium', 89542.00, '2025-08-13', 'open', '2025-07-12 12:23:53'),
(128, 'Frontend Developer', 'We are looking for a passionate individual to join us.', 'San Francisco, CA', 'JIRA, Selenium', 109620.00, '2025-12-07', 'closed', '2025-07-12 12:23:53'),
(129, 'Frontend Developer', 'Join our team and work on exciting projects.', 'Seattle, WA', 'React, Node.js', 58004.00, '2025-08-26', 'open', '2025-07-12 12:23:53'),
(130, 'HR Associate', 'We are looking for a passionate individual to join us.', 'San Francisco, CA', 'Photoshop, Illustrator', 80731.00, '2025-11-30', 'open', '2025-07-12 12:23:53'),
(131, 'UI/UX Designer', 'Be part of a dynamic and fast-growing company.', 'Seattle, WA', 'HTML, CSS, JS', 80784.00, '2025-11-26', 'open', '2025-07-12 12:23:53'),
(132, 'Marketing Manager', 'Take part in our mission to innovate and lead.', 'Remote', 'HTML, CSS, JS', 84975.00, '2025-09-13', 'closed', '2025-07-12 12:23:53'),
(133, 'Marketing Manager', 'Collaborate with cross-functional teams to deliver quality.', 'Atlanta, GA', 'Figma, Sketch', 45822.00, '2025-12-09', 'open', '2025-07-12 12:23:53'),
(134, 'Full Stack Developer', 'Take part in our mission to innovate and lead.', 'Austin, TX', 'SQL, Excel', 60826.00, '2026-01-04', 'open', '2025-07-12 12:23:53'),
(135, 'ML Engineer', 'We are looking for a passionate individual to join us.', 'Atlanta, GA', 'Figma, Sketch', 57722.00, '2025-12-18', 'open', '2025-07-12 12:23:53'),
(136, 'UI/UX Designer', 'Take part in our mission to innovate and lead.', 'Austin, TX', 'Agile, Scrum', 64968.00, '2025-10-25', 'closed', '2025-07-12 12:23:53'),
(137, 'Project Manager', 'Be part of a dynamic and fast-growing company.', 'San Francisco, CA', 'JIRA, Selenium', 46000.00, '2025-09-15', 'closed', '2025-07-12 12:23:53'),
(138, 'Sales Executive', 'Collaborate with cross-functional teams to deliver quality.', 'Atlanta, GA', 'Agile, Scrum', 93561.00, '2025-09-19', 'open', '2025-07-12 12:23:53'),
(139, 'Software Engineer', 'We are looking for a passionate individual to join us.', 'San Francisco, CA', 'React, Node.js', 89970.00, '2025-09-21', 'open', '2025-07-12 12:23:53'),
(140, 'Full Stack Developer', 'Be part of a dynamic and fast-growing company.', 'Los Angeles, CA', 'JIRA, Selenium', 110069.00, '2025-12-21', 'open', '2025-07-12 12:23:53'),
(141, 'QA Tester', 'We are looking for a passionate individual to join us.', 'Seattle, WA', 'React, Node.js', 74150.00, '2025-09-19', 'open', '2025-07-12 12:23:53'),
(142, 'Project Manager', 'Take part in our mission to innovate and lead.', 'Denver, CO', 'HTML, CSS, JS', 50183.00, '2025-12-21', 'open', '2025-07-12 12:23:53'),
(143, 'Content Writer', 'Collaborate with cross-functional teams to deliver quality.', 'Remote', 'HTML, CSS, JS', 107391.00, '2025-10-06', 'open', '2025-07-12 12:23:53'),
(144, 'Cloud Engineer', 'Join our team and work on exciting projects.', 'Seattle, WA', 'React, Node.js', 100759.00, '2025-09-01', 'open', '2025-07-12 12:23:53'),
(145, 'Business Analyst', 'Collaborate with cross-functional teams to deliver quality.', 'Atlanta, GA', 'React, Node.js', 87987.00, '2025-08-26', 'open', '2025-07-12 12:23:53'),
(146, 'Backend Developer', 'Be part of a dynamic and fast-growing company.', 'Boston, MA', 'React, Node.js', 110252.00, '2026-01-08', 'open', '2025-07-12 12:23:53'),
(147, 'Cloud Engineer', 'Collaborate with cross-functional teams to deliver quality.', 'Remote', 'React, Node.js', 46802.00, '2025-11-19', 'open', '2025-07-12 12:23:53'),
(148, 'Mobile App Developer', 'We are looking for a passionate individual to join us.', 'Chicago, IL', 'AWS, Docker', 55395.00, '2025-09-19', 'closed', '2025-07-12 12:23:53'),
(149, 'Marketing Manager', 'Take part in our mission to innovate and lead.', 'Boston, MA', 'AWS, Docker', 78282.00, '2025-12-07', 'open', '2025-07-12 12:23:53'),
(150, 'Business Analyst', 'Join our team and work on exciting projects.', 'Denver, CO', 'Agile, Scrum', 90194.00, '2025-11-09', 'open', '2025-07-12 12:23:53'),
(151, 'Mobile App Developer', 'Join our team and work on exciting projects.', 'New York, NY', 'AWS, Docker', 107031.00, '2026-01-04', 'closed', '2025-07-12 12:23:53'),
(152, 'Mobile App Developer', 'Take part in our mission to innovate and lead.', 'Los Angeles, CA', 'SQL, Excel', 68912.00, '2025-09-12', 'open', '2025-07-12 12:23:53'),
(153, 'Data Analyst', 'Join our team and work on exciting projects.', 'Atlanta, GA', 'Agile, Scrum', 84753.00, '2025-10-04', 'open', '2025-07-12 12:23:53'),
(154, 'Project Manager', 'Collaborate with cross-functional teams to deliver quality.', 'Atlanta, GA', 'Figma, Sketch', 50074.00, '2025-08-11', 'open', '2025-07-12 12:23:53'),
(155, 'Cloud Engineer', 'Take part in our mission to innovate and lead.', 'Atlanta, GA', 'SQL, Excel', 106446.00, '2025-10-19', 'open', '2025-07-12 12:23:53'),
(156, 'DevOps Engineer', 'Join our team and work on exciting projects.', 'Austin, TX', 'AWS, Docker', 62486.00, '2025-10-31', 'open', '2025-07-12 12:23:53'),
(157, 'Full Stack Developer', 'Collaborate with cross-functional teams to deliver quality.', 'Denver, CO', 'JIRA, Selenium', 53984.00, '2025-11-08', 'open', '2025-07-12 12:23:53'),
(158, 'Business Analyst', 'Join our team and work on exciting projects.', 'Chicago, IL', 'HTML, CSS, JS', 111129.00, '2025-11-09', 'open', '2025-07-12 12:23:53'),
(159, 'Project Manager', 'Take part in our mission to innovate and lead.', 'Atlanta, GA', 'Figma, Sketch', 89033.00, '2025-08-23', 'closed', '2025-07-12 12:23:53'),
(160, 'Backend Developer', 'Collaborate with cross-functional teams to deliver quality.', 'Atlanta, GA', 'Photoshop, Illustrator', 79736.00, '2025-11-16', 'open', '2025-07-12 12:23:53'),
(161, 'DevOps Engineer', 'We are looking for a passionate individual to join us.', 'San Francisco, CA', 'SQL, Excel', 107635.00, '2025-10-21', 'open', '2025-07-12 12:23:53'),
(162, 'IT Support Specialist', 'Join our team and work on exciting projects.', 'Atlanta, GA', 'Figma, Sketch', 63120.00, '2025-12-31', 'open', '2025-07-12 12:23:53'),
(163, 'Content Writer', 'Be part of a dynamic and fast-growing company.', 'Denver, CO', 'Linux, Bash', 94889.00, '2025-10-06', 'open', '2025-07-12 12:23:53'),
(164, 'DevOps Engineer', 'Be part of a dynamic and fast-growing company.', 'San Francisco, CA', 'SQL, Excel', 91219.00, '2025-12-06', 'open', '2025-07-12 12:23:53'),
(165, 'Backend Developer', 'Be part of a dynamic and fast-growing company.', 'Chicago, IL', 'React, Node.js', 80418.00, '2025-12-17', 'open', '2025-07-12 12:23:53'),
(166, 'Frontend Developer', 'Collaborate with cross-functional teams to deliver quality.', 'San Francisco, CA', 'AWS, Docker', 66185.00, '2025-12-04', 'open', '2025-07-12 12:23:53'),
(167, 'Software Engineer', 'Be part of a dynamic and fast-growing company.', 'Chicago, IL', 'Figma, Sketch', 78021.00, '2025-11-01', 'open', '2025-07-12 12:23:53'),
(168, 'Graphic Designer', 'Collaborate with cross-functional teams to deliver quality.', 'Boston, MA', 'Agile, Scrum', 93041.00, '2025-09-30', 'open', '2025-07-12 12:23:53'),
(169, 'Data Analyst', 'We are looking for a passionate individual to join us.', 'Los Angeles, CA', 'HTML, CSS, JS', 112929.00, '2025-10-02', 'open', '2025-07-12 12:23:53'),
(170, 'Data Analyst', 'Collaborate with cross-functional teams to deliver quality.', 'Remote', 'JIRA, Selenium', 108983.00, '2025-11-22', 'open', '2025-07-12 12:23:53'),
(171, 'Content Writer', 'We are looking for a passionate individual to join us.', 'Chicago, IL', 'Agile, Scrum', 105833.00, '2025-11-29', 'closed', '2025-07-12 12:23:53'),
(172, 'Marketing Manager', 'Join our team and work on exciting projects.', 'Boston, MA', 'JIRA, Selenium', 66939.00, '2025-12-28', 'open', '2025-07-12 12:23:53'),
(173, 'Content Writer', 'Take part in our mission to innovate and lead.', 'Chicago, IL', 'React, Node.js', 113858.00, '2025-09-04', 'open', '2025-07-12 12:23:53'),
(174, 'Mobile App Developer', 'Join our team and work on exciting projects.', 'New York, NY', 'Figma, Sketch', 60972.00, '2025-10-29', 'open', '2025-07-12 12:23:53'),
(175, 'Data Analyst', 'Be part of a dynamic and fast-growing company.', 'Austin, TX', 'Linux, Bash', 94637.00, '2025-12-05', 'open', '2025-07-12 12:23:53'),
(176, 'ML Engineer', 'Join our team and work on exciting projects.', 'Seattle, WA', 'AWS, Docker', 118564.00, '2025-10-30', 'open', '2025-07-12 12:23:53'),
(177, 'Cybersecurity Analyst', 'Take part in our mission to innovate and lead.', 'Seattle, WA', 'JIRA, Selenium', 58724.00, '2025-09-27', 'open', '2025-07-12 12:23:53'),
(178, 'Business Analyst', 'Join our team and work on exciting projects.', 'New York, NY', 'Agile, Scrum', 89066.00, '2025-12-10', 'open', '2025-07-12 12:23:53'),
(179, 'Business Analyst', 'Collaborate with cross-functional teams to deliver quality.', 'San Francisco, CA', 'AWS, Docker', 96112.00, '2025-09-20', 'open', '2025-07-12 12:23:53'),
(180, 'Frontend Developer', 'Collaborate with cross-functional teams to deliver quality.', 'Austin, TX', 'Photoshop, Illustrator', 90712.00, '2025-11-29', 'closed', '2025-07-12 12:23:53'),
(181, 'Project Manager', 'Collaborate with cross-functional teams to deliver quality.', 'Boston, MA', 'AWS, Docker', 47577.00, '2025-11-29', 'closed', '2025-07-12 12:23:53'),
(182, 'Frontend Developer', 'Collaborate with cross-functional teams to deliver quality.', 'Denver, CO', 'JIRA, Selenium', 71452.00, '2025-12-15', 'open', '2025-07-12 12:23:53'),
(183, 'Content Writer', 'We are looking for a passionate individual to join us.', 'Remote', 'Photoshop, Illustrator', 106660.00, '2026-01-01', 'open', '2025-07-12 12:23:53'),
(184, 'Business Analyst', 'Join our team and work on exciting projects.', 'Seattle, WA', 'React, Node.js', 92447.00, '2025-08-14', 'open', '2025-07-12 12:23:53'),
(185, 'Cloud Engineer', 'Take part in our mission to innovate and lead.', 'Denver, CO', 'Python, Django', 72095.00, '2025-11-05', 'open', '2025-07-12 12:23:53'),
(186, 'Business Analyst', 'Take part in our mission to innovate and lead.', 'Chicago, IL', 'JIRA, Selenium', 92379.00, '2025-12-27', 'open', '2025-07-12 12:23:53'),
(187, 'UI/UX Designer', 'Take part in our mission to innovate and lead.', 'Austin, TX', 'Agile, Scrum', 98358.00, '2025-12-02', 'open', '2025-07-12 12:23:53'),
(188, 'IT Support Specialist', 'We are looking for a passionate individual to join us.', 'Seattle, WA', 'Photoshop, Illustrator', 59768.00, '2025-11-28', 'open', '2025-07-12 12:23:53'),
(189, 'Software Engineer', 'We are looking for a passionate individual to join us.', 'Seattle, WA', 'React, Node.js', 101605.00, '2025-12-31', 'open', '2025-07-12 12:23:53'),
(190, 'QA Tester', 'Be part of a dynamic and fast-growing company.', 'New York, NY', 'SQL, Excel', 107659.00, '2025-11-24', 'closed', '2025-07-12 12:23:53'),
(191, 'ML Engineer', 'We are looking for a passionate individual to join us.', 'San Francisco, CA', 'AWS, Docker', 101393.00, '2025-11-09', 'closed', '2025-07-12 12:23:53'),
(192, 'Content Writer', 'We are looking for a passionate individual to join us.', 'Seattle, WA', 'Figma, Sketch', 106057.00, '2025-10-19', 'open', '2025-07-12 12:23:53'),
(193, 'Content Writer', 'Be part of a dynamic and fast-growing company.', 'Atlanta, GA', 'Photoshop, Illustrator', 98095.00, '2025-12-10', 'open', '2025-07-12 12:23:53'),
(194, 'IT Support Specialist', 'Join our team and work on exciting projects.', 'San Francisco, CA', 'AWS, Docker', 112405.00, '2025-10-01', 'open', '2025-07-12 12:23:53'),
(195, 'Sales Executive', 'We are looking for a passionate individual to join us.', 'Chicago, IL', 'React, Node.js', 102881.00, '2025-09-24', 'open', '2025-07-12 12:23:53'),
(196, 'Full Stack Developer', 'Be part of a dynamic and fast-growing company.', 'Denver, CO', 'JIRA, Selenium', 92419.00, '2025-12-12', 'closed', '2025-07-12 12:23:53'),
(197, 'Cloud Engineer', 'Be part of a dynamic and fast-growing company.', 'Los Angeles, CA', 'HTML, CSS, JS', 90525.00, '2025-08-30', 'open', '2025-07-12 12:23:53'),
(198, 'UI/UX Designer', 'Collaborate with cross-functional teams to deliver quality.', 'Los Angeles, CA', 'SQL, Excel', 105815.00, '2025-12-31', 'closed', '2025-07-12 12:23:53'),
(199, 'Data Analyst', 'Collaborate with cross-functional teams to deliver quality.', 'Denver, CO', 'React, Node.js', 62619.00, '2025-09-17', 'open', '2025-07-12 12:23:53'),
(200, 'HR Associate', 'Collaborate with cross-functional teams to deliver quality.', 'Denver, CO', 'Figma, Sketch', 107075.00, '2025-11-14', 'open', '2025-07-12 12:23:53'),
(201, 'Frontend Developer', 'Be part of a dynamic and fast-growing company.', 'Denver, CO', 'Photoshop, Illustrator', 52591.00, '2025-11-07', 'open', '2025-07-12 12:23:53'),
(202, 'ML Engineer', 'Be part of a dynamic and fast-growing company.', 'New York, NY', 'Python, Django', 46758.00, '2025-12-16', 'open', '2025-07-12 12:23:53'),
(203, 'Graphic Designer', 'Take part in our mission to innovate and lead.', 'Los Angeles, CA', 'SQL, Excel', 57731.00, '2025-12-22', 'open', '2025-07-12 12:23:53'),
(204, 'Full Stack Developer', 'Be part of a dynamic and fast-growing company.', 'Chicago, IL', 'SQL, Excel', 62033.00, '2025-12-29', 'open', '2025-07-12 12:23:53'),
(205, 'IT Support Specialist', 'We are looking for a passionate individual to join us.', 'San Francisco, CA', 'Python, Django', 108812.00, '2025-10-20', 'closed', '2025-07-12 12:23:53'),
(206, 'Cybersecurity Analyst', 'We are looking for a passionate individual to join us.', 'Seattle, WA', 'HTML, CSS, JS', 101766.00, '2025-12-01', 'closed', '2025-07-12 12:23:53'),
(207, 'IT Support Specialist', 'Be part of a dynamic and fast-growing company.', 'Boston, MA', 'Agile, Scrum', 87892.00, '2025-08-15', 'closed', '2025-07-12 12:23:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `job_id` (`job_id`,`email`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=208;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `applications`
--
ALTER TABLE `applications`
  ADD CONSTRAINT `applications_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
