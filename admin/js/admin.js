const links = document.querySelectorAll(".navbar a[data-target]");
const slider = document.getElementById("slider");
const sections = ["dashboard", "applicants", "edit-jobs", "create-job"];

// Tab navigation
links.forEach(link => {
  link.addEventListener("click", e => {
    e.preventDefault();
    const target = link.dataset.target;
    const index = sections.indexOf(target);
    if (index >= 0) {
      slider.style.transform = `translateX(-${index * 100}vw)`;
      if (target === "applicants") loadApplicants();
      if (target === "edit-jobs") loadJobs();
    }
  });
});

// Load applicants
function loadApplicants() {
  fetch("../admin_api/get_applicants.php")
    .then(res => res.json())
    .then(apps => {
      const container = document.getElementById("applicants-content");
      if (!apps.length) {
        container.innerHTML = "<p>No applications found.</p>";
        return;
      }

      let html = `
        <h2>Applications</h2>
        <table class="styled-table">
          <thead>
            <tr>
              <th>Name</th>
              <th>Email</th>
              <th>Job</th>
              <th>Resume</th>
              <th>Applied</th>
              <th>Status</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
      `;

      apps.forEach(app => {
        const statusText = app.status || "pending";
        const actionButtons =
          statusText === "pending"
            ? `
              <button onclick="updateApplicationStatus(${app.id}, 'approved')">Approve</button>
              <button onclick="updateApplicationStatus(${app.id}, 'rejected')">Reject</button>
            `
            : `<span class="badge-${statusText}">${statusText}</span>`;

        html += `
          <tr>
            <td>${app.full_name}</td>
            <td>${app.email}</td>
            <td>${app.job_title}</td>
            <td><a href="../download.php?file=${app.resume}" target="_blank">Download</a></td>
            <td>${new Date(app.applied_at).toLocaleString()}</td>
            <td>${statusText}</td>
            <td>${actionButtons}</td>
          </tr>
        `;
      });

      html += "</tbody></table>";
      container.innerHTML = html;
    })
    .catch(() => {
      document.getElementById("applicants-content").innerHTML = "<p>Error loading applications.</p>";
    });
}
function updateApplicationStatus(id, status) {
  if (!confirm(`Are you sure you want to mark this as ${status}?`)) return;

  fetch("../admin_api/update_application_status.php", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ id, status })
  })
    .then(res => res.json())
    .then(result => {
      if (result.success) {
        alert(`✅ Application ${status}.`);
        loadApplicants(); // Refresh table
      } else {
        alert("❌ Failed to update application.");
      }
    })
    .catch(() => {
      alert("❌ Error updating status.");
    });
}
function exportApplicants() {
  window.open("../admin_api/export_applicants.php", "_blank");
}


// Load jobs and display with edit/delete
function loadJobs() {
  fetch("../admin_api/get_jobs.php")
    .then(res => res.json())
    .then(jobs => {
      const container = document.getElementById("edit-jobs-content");
      if (!jobs.length) {
        container.innerHTML = "<p>No jobs posted yet.</p>";
        return;
      }

      let html = `
        <h2>Job Listings</h2>
        <table class="styled-table">
          <thead>
            <tr>
              <th>Title</th>
              <th>Location</th>
              <th>Salary</th>
              <th>Status</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
      `;

      jobs.forEach(job => {
        const isClosed = job.status === "closed";
        const statusHTML = isClosed
          ? `<span class="badge-closed">Closed</span>`
          : `<button onclick="closeJob(${job.id})" class="btn-close">Close</button>`;

        html += `
          <tr>
            <td>${job.title}</td>
            <td>${job.location}</td>
            <td>$${job.salary}</td>
            <td>${statusHTML}</td>
            <td>
              <button onclick="editJob(${job.id})">Edit</button>
              <button onclick="deleteJob(${job.id})">Delete</button>
            </td>
          </tr>
        `;
      });

      html += "</tbody></table>";
      container.innerHTML = html;
    })
    .catch(() => {
      document.getElementById("edit-jobs-content").innerHTML = "<p>Error loading jobs.</p>";
    });
}

function closeJob(id) {
  if (!confirm("Are you sure you want to close this job?")) return;

  fetch("../admin_api/toggle_status.php", {
    method: "POST",
    body: JSON.stringify({ id, status: "closed" })
  })
    .then(res => res.json())
    .then(result => {
      if (result.success) {
        alert("✅ Job closed.");
        loadJobs(); // Refresh list to remove the button
      } else {
        alert("❌ Failed to close job.");
      }
    });
}

function editJob(id) {
  fetch(`../admin_api/get_job.php?id=${id}`)
    .then(res => res.json())
    .then(job => {
      if (!job || !job.id) {
        alert("❌ Job not found.");
        return;
      }

      document.getElementById("edit-id").value = job.id;
      document.getElementById("edit-title").value = job.title;
      document.getElementById("edit-location").value = job.location;
      document.getElementById("edit-salary").value = job.salary;
      document.getElementById("edit-skills").value = job.skills;
      document.getElementById("edit-description").value = job.description;
      document.getElementById("edit-deadline").value = job.deadline;

      document.getElementById("edit-job-modal").classList.remove("hidden");
    })
    .catch(() => {
      alert("❌ Failed to load job details.");
    });
}

function closeEditModal() {
  document.getElementById("edit-job-modal").classList.add("hidden");
}

document.getElementById("edit-job-form").addEventListener("submit", function (e) {
  e.preventDefault();

  const formData = new FormData(this);
  const jobData = Object.fromEntries(formData.entries());

  fetch("../admin_api/update_job.php", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(jobData)
  })
    .then(res => res.json())
    .then(result => {
      if (result.success) {
        alert("✅ Job updated successfully.");
        closeEditModal();
        loadJobs();
      } else {
        alert("❌ Failed to update job.");
      }
    })
    .catch(() => {
      alert("❌ Server error while updating job.");
    });
});

// Delete job
function deleteJob(id) {
  if (!confirm("Are you sure you want to delete this job?")) return;

  fetch("../admin_api/delete_job.php", {
    method: "POST",
    body: JSON.stringify({ id })
  })
    .then(res => res.json())
    .then(result => {
      if (result.success) {
        alert("🗑 Job deleted.");
        loadJobs();
      } else {
        alert("❌ Failed to delete job.");
      }
    });
}

// Create job form
document.addEventListener("DOMContentLoaded", () => {
  slider.style.transform = "translateX(0vw)";

  const jobForm = document.getElementById("job-form");
  if (jobForm) {
    jobForm.addEventListener("submit", e => {
      e.preventDefault();
      const data = Object.fromEntries(new FormData(jobForm).entries());

      fetch("../admin_api/create_job.php", {
        method: "POST",
        body: JSON.stringify(data)
      })
        .then(res => res.json())
        .then(result => {
          const msg = document.getElementById("job-message");
          if (result.success) {
            msg.style.color = "green";
            msg.textContent = "✅ Job created successfully!";
            jobForm.reset();
            loadJobs();
          } else {
            msg.style.color = "red";
            msg.textContent = "❌ Failed to create job.";
          }
        })
        .catch(() => {
          const msg = document.getElementById("job-message");
          msg.style.color = "red";
          msg.textContent = "❌ An error occurred.";
        });
    });
  }

  loadDashboardStats(); // Also load stats
});

// Load dashboard stats
function loadDashboardStats() {
  fetch("../admin_api/dashboard_stats.php")
    .then(res => res.json())
    .then(stats => {
      document.getElementById("stat-total").textContent = stats.total_jobs;
      document.getElementById("stat-open").textContent = stats.open_jobs;
      document.getElementById("stat-closed").textContent = stats.closed_jobs;
      document.getElementById("stat-apps").textContent = stats.applications;
    })
    .catch(err => {
      console.error("Dashboard stats failed:", err);
    });
}
