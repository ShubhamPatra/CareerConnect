// Pagination state variables
let currentPage = 1;
let totalPages = 1;
const perPage = 12;

const links = document.querySelectorAll(".navbar a");
const slider = document.getElementById("slider");
const sections = ["home", "jobs"];

// Load home content from file
function loadHome() {
  fetch("home-content.html")
    .then(res => res.text())
    .then(data => {
      document.getElementById("home-content").innerHTML = data;
    })
    .catch(err => {
      console.error("Failed to load home content", err);
    });
     loadStats();
}

// Load jobs from backend with pagination
function loadJobs(page = 1) {
  const container = document.getElementById("jobs-content");
  if (!container) {
    console.error("❌ #jobs-content not found");
    return;
  }

  currentPage = page;

  container.innerHTML = `
    <div class="container">
      <h2 class="section-title">All Jobs</h2>
      <div class="job-list" id="full-job-list">
        <p>Loading jobs...</p>
      </div>
      <div id="job-pagination"></div>
    </div>
  `;

  fetch(`../backend/get_jobs.php?page=${page}&per_page=${perPage}`)
    .then(res => res.json())
    .then(data => {
      const list = document.getElementById("full-job-list");
      if (!list) return;

      // Handle structured response format
      const jobs = data.data || data; // Fallback for backward compatibility
      const total = data.total || jobs.length;
      
      totalPages = Math.ceil(total / perPage);

      if (jobs.length === 0) {
        list.innerHTML = "<p>No jobs available at the moment.</p>";
        return;
      }

      list.innerHTML = ""; // Clear "loading..."

      jobs.forEach(job => {
        list.innerHTML += `
          <div class="job-card">
            <div class="job-card-header">
              <h3 class="job-title">${job.title}</h3>
              <span class="job-location"><i class="fas fa-map-marker-alt"></i> ${job.location}</span>
            </div>
            <p class="job-salary"><i class="fas fa-dollar-sign"></i> ${job.salary}</p>
            <a href="job_detail.html?id=${job.id}" class="btn-apply">View & Apply</a>
          </div>
        `;
      });

      // Render pagination controls
      renderPagination(total, currentPage, perPage);
    })
    .catch(err => {
      console.error("❌ Error loading jobs:", err);
      document.getElementById("full-job-list").innerHTML = "<p>Error loading jobs.</p>";
    });
}

// Render pagination controls
function renderPagination(total, currentPage, perPage) {
  const paginationContainer = document.getElementById("job-pagination");
  if (!paginationContainer) return;

  const totalPages = Math.ceil(total / perPage);
  
  if (totalPages <= 1) {
    paginationContainer.innerHTML = "";
    return;
  }

  let paginationHTML = '<div class="pagination">';
  
  // Previous button
  if (currentPage > 1) {
    paginationHTML += `<button class="pagination-btn" onclick="loadJobs(${currentPage - 1})">Previous</button>`;
  } else {
    paginationHTML += `<button class="pagination-btn disabled" disabled>Previous</button>`;
  }

  // Page numbers
  const startPage = Math.max(1, currentPage - 2);
  const endPage = Math.min(totalPages, currentPage + 2);

  if (startPage > 1) {
    paginationHTML += `<button class="pagination-btn" onclick="loadJobs(1)">1</button>`;
    if (startPage > 2) {
      paginationHTML += `<span class="pagination-ellipsis">...</span>`;
    }
  }

  for (let i = startPage; i <= endPage; i++) {
    const activeClass = i === currentPage ? ' active' : '';
    paginationHTML += `<button class="pagination-btn${activeClass}" onclick="loadJobs(${i})">${i}</button>`;
  }

  if (endPage < totalPages) {
    if (endPage < totalPages - 1) {
      paginationHTML += `<span class="pagination-ellipsis">...</span>`;
    }
    paginationHTML += `<button class="pagination-btn" onclick="loadJobs(${totalPages})">${totalPages}</button>`;
  }

  // Next button
  if (currentPage < totalPages) {
    paginationHTML += `<button class="pagination-btn" onclick="loadJobs(${currentPage + 1})">Next</button>`;
  } else {
    paginationHTML += `<button class="pagination-btn disabled" disabled>Next</button>`;
  }

  paginationHTML += '</div>';
  
  // Add pagination info
  paginationHTML += `<div class="pagination-info">Page ${currentPage} of ${totalPages} (${total} total jobs)</div>`;

  paginationContainer.innerHTML = paginationHTML;
}

document.addEventListener("DOMContentLoaded", () => {
  const links = document.querySelectorAll(".navbar a");
  const slider = document.getElementById("slider");
  const sections = ["home", "jobs"];

  // Horizontal tab switching
  links.forEach(link => {
    link.addEventListener("click", e => {
      e.preventDefault();
      const target = link.dataset.target;
      const index = sections.indexOf(target);
      if (index >= 0) {
        slider.style.transform = `translateX(-${index * 100}vw)`;

        if (target === "home") loadHome();
        else if (target === "jobs") {
          currentPage = 1; // Reset to first page when switching to jobs
          loadJobs();
        }
      }
    });
  });

  // Admin login button (if present)
  const adminBtn = document.getElementById("admin-login-button");
  if (adminBtn) {
    adminBtn.addEventListener("click", () => {
      window.location.href = "../admin/login.html";
    });
  }

  // Load Home by default
  loadHome();
  loadStats();
});
// Admin login button (outside nav)
document.getElementById("admin-login-button").addEventListener("click", () => {
  window.location.href = "../admin/login.html";
});

function loadStats() {
  fetch("../backend/get_stats.php")
    .then(res => res.json())
    .then(stats => {
      document.getElementById("stat-jobs").textContent = stats.jobs;
      document.getElementById("stat-open").textContent = stats.open_jobs;
      document.getElementById("stat-closed").textContent = stats.closed_jobs;
      document.getElementById("stat-applicants").textContent = stats.applications;
    })
    .catch(() => {
      console.warn("Failed to load stats.");
    });
}

function scrollToJobs() {
  const jobsLink = document.querySelector(".navbar a[data-target='jobs']");
  if (jobsLink) jobsLink.click();
}
