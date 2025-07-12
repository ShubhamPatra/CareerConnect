const links = document.querySelectorAll(".navbar a");
const slider = document.getElementById("slider");
const sections = ["home", "jobs"];


// Horizontal scroll navigation
links.forEach(link => {
  link.addEventListener("click", e => {
    e.preventDefault();
    const target = link.dataset.target;
    const index = sections.indexOf(target);
    if (index >= 0) {
      slider.style.transform = `translateX(-${index * 100}vw)`;

      // Load dynamic content for each section
      if (target === "home") loadHome();
      else if (target === "jobs") loadJobs();
    }
  });
});

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

// Load jobs from backend
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
        else if (target === "jobs") loadJobs();
      }
    });
  });

  // Load Home content
  function loadHome() {
    fetch("home-content.html")
      .then(res => res.text())
      .then(data => {
        document.getElementById("home-content").innerHTML = data;
      })
      .catch(err => {
        console.error("Failed to load home content", err);
      });
  }
  // Load Jobs section 
  function loadJobs() {
    const container = document.getElementById("jobs-content");
    if (!container) {
      console.error("❌ #jobs-content not found");
      return;
    }

    container.innerHTML = `
      <div class="container">
        <h2 class="section-title">All Jobs</h2>
        <div class="job-list" id="full-job-list">
          <p>Loading jobs...</p>
        </div>
      </div>
    `;

    fetch("../backend/get_jobs.php")
      .then(res => res.json())
      .then(jobs => {
        const list = document.getElementById("full-job-list");
        if (!list) return;

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
      })
      .catch(err => {
        console.error("❌ Error loading jobs:", err);
        document.getElementById("full-job-list").innerHTML = "<p>Error loading jobs.</p>";
      });
  }

  // Admin login button (if present)
  const adminBtn = document.getElementById("admin-login-button");
  if (adminBtn) {
    adminBtn.addEventListener("click", () => {
      window.location.href = "../admin/login.html";
    });
  }

  // Load Home by default
  loadHome();
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
document.addEventListener("DOMContentLoaded", () => {
  loadStats();
});


  function scrollToJobs() {
    const jobsLink = document.querySelector(".navbar a[data-target='jobs']");
    if (jobsLink) jobsLink.click();
  }

  document.addEventListener("DOMContentLoaded", loadStats);



// Load home by default
loadHome();
