let isFollowing = false

function toggleFollowStatus() {
    const followBtn = document.getElementById("followBtn")
    const followersStat = document.querySelector('[data-stat="followers"] .stat-value')

    if (isFollowing) {
        // Unfollow user
        isFollowing = false
        followBtn.classList.remove("following")
        followBtn.innerHTML = `
      <svg class="btn-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
        <path d="M16 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
        <circle cx="12" cy="7" r="4"></circle>
        <polyline points="21 8 21 14"></polyline>
        <polyline points="18 11 24 11"></polyline>
      </svg>
      <span class="btn-text">Follow</span>
    `

        // Decrease follower count
        const currentCount = Number.parseInt(followersStat.getAttribute("data-count"))
        followersStat.setAttribute("data-count", currentCount - 1)
        animateCounter(followersStat, currentCount - 1)

        showToast("Unfollowed user", "info")
    } else {
        // Follow user
        isFollowing = true
        followBtn.classList.add("following")
        followBtn.innerHTML = `
      <svg class="btn-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
        <path d="M16 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
        <circle cx="12" cy="7" r="4"></circle>
        <polyline points="12 12 12 18"></polyline>
        <polyline points="9 15 15 15"></polyline>
      </svg>
      <span class="btn-text">Following</span>
    `

        // Increase follower count
        const currentCount = Number.parseInt(followersStat.getAttribute("data-count"))
        followersStat.setAttribute("data-count", currentCount + 1)
        animateCounter(followersStat, currentCount + 1)

        showToast("Followed user successfully!", "success")
    }
}

function openMessageModal() {
    showToast("Opening message composer...", "info")
    // Add your message modal logic here
    // Example: Display a modal to compose a message to the user
}

function toggleMoreActions() {
    const menu = document.getElementById("moreActionsMenu")
    const isVisible = menu.style.display === "flex"
    menu.style.display = isVisible ? "none" : "flex"
}

function blockUser() {
    if (confirm("Are you sure you want to block this user? You won't see their content anymore.")) {
        showToast("User blocked successfully", "success")
        document.getElementById("moreActionsMenu").style.display = "none"
    }
}

function reportUser() {
    showToast("Reporting user... Our team will review this shortly", "warning")
    document.getElementById("moreActionsMenu").style.display = "none"
}

function viewActivity() {
    showToast("Loading user activity...", "info")
    document.getElementById("moreActionsMenu").style.display = "none"
}

function showToast(message, type = "info") {
    const toast = document.createElement("div")
    toast.className = `toast toast-${type}`
    toast.innerHTML = `
    <div class="toast-content">
      <svg class="toast-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
        ${getToastIcon(type)}
      </svg>
      <span>${message}</span>
    </div>
  `

    document.body.appendChild(toast)

    // Add styles if not already present
    if (!document.getElementById("toast-styles")) {
        const styleSheet = document.createElement("style")
        styleSheet.id = "toast-styles"
        styleSheet.textContent = `
      .toast {
        position: fixed;
        bottom: 2rem;
        right: 2rem;
        background: rgba(0, 0, 0, 0.8);
        color: white;
        padding: 1rem 1.5rem;
        border-radius: 8px;
        backdrop-filter: blur(10px);
        border: 1px solid rgba(0, 210, 255, 0.3);
        animation: slideInToast 0.3s ease forwards;
        z-index: 10000;
        display: flex;
        align-items: center;
        gap: 1rem;
      }
      
      .toast-content {
        display: flex;
        align-items: center;
        gap: 0.75rem;
      }
      
      .toast-icon {
        width: 20px;
        height: 20px;
        flex-shrink: 0;
      }
      
      .toast-success {
        border-color: rgba(16, 185, 129, 0.5);
      }
      
      .toast-success .toast-icon {
        color: #10b981;
      }
      
      .toast-error {
        border-color: rgba(239, 68, 68, 0.5);
      }
      
      .toast-error .toast-icon {
        color: #ef4444;
      }
      
      .toast-warning {
        border-color: rgba(245, 158, 11, 0.5);
      }
      
      .toast-warning .toast-icon {
        color: #f59e0b;
      }
      
      .toast-info {
        border-color: rgba(0, 210, 255, 0.5);
      }
      
      .toast-info .toast-icon {
        color: #00d2ff;
      }
      
      @keyframes slideInToast {
        from {
          opacity: 0;
          transform: translateX(100%);
        }
        to {
          opacity: 1;
          transform: translateX(0);
        }
      }
      
      @media (max-width: 768px) {
        .toast {
          bottom: 1rem;
          right: 1rem;
          left: 1rem;
        }
      }
    `
        document.head.appendChild(styleSheet)
    }

    setTimeout(() => {
        toast.style.animation = "slideOutToast 0.3s ease forwards"
        setTimeout(() => toast.remove(), 300)
    }, 3000)
}

function getToastIcon(type) {
    const icons = {
        success: '<path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path><polyline points="22 4 12 14.01 9 11.01"></polyline>',
        error:
            '<circle cx="12" cy="12" r="10"></circle><line x1="15" y1="9" x2="9" y2="15"></line><line x1="9" y1="9" x2="15" y2="15"></line>',
        warning:
            '<path d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3.05h16.94a2 2 0 0 0 1.71-3.05L13.71 3.86a2 2 0 0 0-3.42 0z"></path><line x1="12" y1="9" x2="12" y2="13"></line><line x1="12" y1="17" x2="12.01" y2="17"></line>',
        info: '<circle cx="12" cy="12" r="10"></circle><line x1="12" y1="16" x2="12" y2="12"></line><line x1="12" y1="8" x2="12.01" y2="8"></line>',
    }
    return icons[type] || icons.info
}

function toggleEditMode() {
    const container = document.getElementById("form1")
    const hdnEditMode = document.getElementById("hdnEditMode")
    const isEditMode = container.classList.contains("edit-mode")

    if (isEditMode) {
        // Switch to view mode
        container.classList.remove("edit-mode")
        container.classList.add("view-mode")
        hdnEditMode.value = "false"

        // Show view elements with fade effect
        document.querySelectorAll(".view-mode-text").forEach((el) => {
            el.style.display = ""
            el.style.animation = "fadeIn 0.3s ease"
        })

        // Hide edit controls
        document.getElementById("txtUsername").style.display = "none"
        document.getElementById("txtDisplayName").style.display = "none"
        document.getElementById("txtBio").style.display = "none"
        document.getElementById("txtProfession").style.display = "none"
        document.getElementById("txtLocation").style.display = "none"

        // Show/hide buttons
        document.getElementById("btnEdit").style.display = ""
        document.getElementById("btnSave").style.display = "none"
        document.getElementById("btnCancel").style.display = "none"

        // Reload values from literals
        function reloadValues() {
            // Implementation of reloadValues function
        }
        reloadValues()
    } else {
        // Switch to edit mode
        container.classList.remove("view-mode")
        container.classList.add("edit-mode")
        hdnEditMode.value = "true"

        // Hide view elements
        document.querySelectorAll(".view-mode-text").forEach((el) => (el.style.display = "none"))

        // Show edit controls with current values
        const txtUsername = document.getElementById("txtUsername")
        const txtDisplayName = document.getElementById("txtDisplayName")
        const txtBio = document.getElementById("txtBio")
        const txtProfession = document.getElementById("txtProfession")
        const txtLocation = document.getElementById("txtLocation")

        txtUsername.value = document.getElementById("litUsername").textContent.trim()
        txtDisplayName.value = document.getElementById("litDisplayName").textContent.trim()
        txtBio.value = document.getElementById("litBio").textContent.trim()
        txtProfession.value = document.getElementById("litProfession").textContent.trim()
        txtLocation.value = document.getElementById("litLocation").textContent.trim()

        txtUsername.style.display = ""
        txtDisplayName.style.display = ""
        txtBio.style.display = ""
        txtProfession.style.display = ""
        txtLocation.style.display = ""

        // Show/hide buttons
        document.getElementById("btnEdit").style.display = "none"
        document.getElementById("btnSave").style.display = ""
        document.getElementById("btnCancel").style.display = ""

        // Focus first input
        setTimeout(() => txtUsername.focus(), 100)
    }
}

function showSuccessMessage() {
    const msg = document.getElementById("successMessage")
    msg.style.display = "flex"
    msg.classList.add("show")
    setTimeout(() => {
        msg.classList.remove("show")
        setTimeout(() => {
            msg.style.display = "none"
        }, 300)
    }, 3000)
}

function createParticles() {
    const container = document.getElementById("particlesContainer")
    if (!container) return

    const particleCount = 30

    for (let i = 0; i < particleCount; i++) {
        const particle = document.createElement("div")
        particle.className = "particle"
        particle.style.left = Math.random() * 100 + "%"
        particle.style.animationDelay = Math.random() * 15 + "s"
        particle.style.animationDuration = Math.random() * 10 + 10 + "s"
        container.appendChild(particle)
    }
}

function animateCounter(element, target) {
    const duration = 2000
    const start = 0
    const increment = target / (duration / 16)
    let current = start

    const timer = setInterval(() => {
        current += increment
        if (current >= target) {
            element.textContent = target.toLocaleString()
            clearInterval(timer)
        } else {
            element.textContent = Math.floor(current).toLocaleString()
        }
    }, 16)
}

function initializeStatsCounters() {
    const statItems = document.querySelectorAll(".stat-item")

    const observer = new IntersectionObserver(
        (entries) => {
            entries.forEach((entry) => {
                if (entry.isIntersecting) {
                    const valueElement = entry.target.querySelector(".stat-value")
                    const targetValue = Number.parseInt(valueElement.getAttribute("data-count"))
                    animateCounter(valueElement, targetValue)
                    observer.unobserve(entry.target)
                }
            })
        },
        { threshold: 0.5 },
    )

    statItems.forEach((item) => observer.observe(item))
}

document.addEventListener("DOMContentLoaded", () => {
    const fileUpload = document.getElementById("fileUpload")
    if (fileUpload) {
        fileUpload.addEventListener("change", (e) => {
            if (e.target.files && e.target.files[0]) {
                const reader = new FileReader()
                reader.onload = (event) => {
                    const imgAvatar = document.querySelector(".avatar")
                    if (imgAvatar) {
                        imgAvatar.src = event.target.result
                        imgAvatar.style.animation = "fadeInScale 0.5s ease"
                    }
                }
                reader.readAsDataURL(e.target.files[0])
            }
        })
    }

    // Initialize view mode on page load
    const container = document.getElementById("form1")
    if (container) {
        container.classList.add("view-mode")
    }

    createParticles()
    initializeStatsCounters()

    document.querySelectorAll('a[href^="#"]').forEach((anchor) => {
        anchor.addEventListener("click", function (e) {
            e.preventDefault()
            const target = document.querySelector(this.getAttribute("href"))
            if (target) {
                target.scrollIntoView({ behavior: "smooth", block: "start" })
            }
        })
    })

    document.addEventListener("keydown", (e) => {
        // Press 'E' to toggle edit mode
        if (
            e.key === "e" &&
            !e.ctrlKey &&
            !e.metaKey &&
            document.activeElement.tagName !== "INPUT" &&
            document.activeElement.tagName !== "TEXTAREA"
        ) {
            toggleEditMode()
        }
        // Press 'Escape' to cancel edit mode
        if (e.key === "Escape" && container.classList.contains("edit-mode")) {
            toggleEditMode()
        }
    })

    document.addEventListener("click", (e) => {
        const moreActionsMenu = document.getElementById("moreActionsMenu")
        const moreBtn = document.querySelector(".btn-more")

        if (moreActionsMenu && !moreActionsMenu.contains(e.target) && !moreBtn.contains(e.target)) {
            moreActionsMenu.style.display = "none"
        }
    })

    document.querySelectorAll(".setting-item").forEach((item) => {
        if (item.id !== "editProfileItem") {
            item.addEventListener("click", () => {
                // Add ripple effect
                const ripple = document.createElement("span")
                ripple.style.position = "absolute"
                ripple.style.borderRadius = "50%"
                ripple.style.background = "rgba(0, 210, 255, 0.3)"
                ripple.style.width = "20px"
                ripple.style.height = "20px"
                ripple.style.animation = "ripple-effect 0.6s ease-out"
                ripple.style.pointerEvents = "none"
                item.appendChild(ripple)

                setTimeout(() => ripple.remove(), 600)
            })
        }
    })
})

const style = document.createElement("style")
style.textContent = `
    @keyframes ripple-effect {
        0% {
            transform: scale(1);
            opacity: 1;
        }
        100% {
            transform: scale(20);
            opacity: 0;
        }
    }
    @keyframes fadeIn {
        from {
            opacity: 0;
        }
        to {
            opacity: 1;
        }
    }
    @keyframes slideOutToast {
        from {
            opacity: 1;
            transform: translateX(0);
        }
        to {
            opacity: 0;
            transform: translateX(100%);
        }
    }
`
document.head.appendChild(style)
