<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Fusion_Forum.Profile" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Profile - Fusion Forum</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="CSS/Profile.css" />
</head>
<body>
    <form id="form1" runat="server">
        <!-- Added floating particles background effect -->
        <div class="particles-container" id="particlesContainer"></div>

        <div class="container">
            <!-- Enhanced success message with icon -->
            <div class="success-message" id="successMessage">
                <svg class="success-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path>
                    <polyline points="22 4 12 14.01 9 11.01"></polyline>
                </svg>
                <span>Profile updated successfully!</span>
            </div>

            <!-- Enhanced profile header with better visual hierarchy -->
            <div class="profile-header">
                <div class="profile-header-background">
                    <!-- Added animated wave overlay -->
                    <div class="wave-overlay"></div>
                </div>
                
                <div class="profile-content">
                    <div class="avatar-section">
                        <div class="avatar-wrapper">
                            <!-- Added status indicator -->
                            <div class="status-indicator online"></div>
                            <asp:Image ID="imgAvatar" runat="server" 
                                CssClass="avatar" 
                                ImageUrl="https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=300&h=300&fit=crop" 
                                AlternateText="Profile Picture" />
                            <label class="avatar-upload" for="fileUpload">
                                <svg class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"></path>
                                    <circle cx="12" cy="13" r="4"></circle>
                                </svg>
                                <asp:FileUpload ID="fileUpload" runat="server" ClientIDMode="Static" accept="image/*" />
                            </label>
                        </div>
                        <!-- Added badge collection -->
                        <div class="badge-collection">
                            <div class="badge" title="Top Contributor">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"></path>
                                </svg>
                            </div>
                            <div class="badge" title="Verified User">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path>
                                    <polyline points="22 4 12 14.01 9 11.01"></polyline>
                                </svg>
                            </div>
                            <div class="badge" title="Expert Developer">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <polyline points="16 18 22 12 16 6"></polyline>
                                    <polyline points="8 6 2 12 8 18"></polyline>
                                </svg>
                            </div>
                        </div>
                    </div>

                    <div class="user-info">
                        <h1 class="username">
                            <span class="view-mode-text">
                                <asp:Literal ID="litUsername" runat="server">Alex Martinez</asp:Literal>
                            </span>
                            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-input" style="display:none;" placeholder="Username" />
                            <!-- Added verified badge next to username -->
                            <span class="verified-badge" title="Verified Account">
                                <svg viewBox="0 0 24 24" fill="currentColor">
                                    <path d="M22.5 12.5c0-1.58-.875-2.95-2.148-3.6.154-.435.238-.905.238-1.4 0-2.21-1.71-3.998-3.818-3.998-.47 0-.92.084-1.336.25C14.818 2.415 13.51 1.5 12 1.5s-2.816.917-3.437 2.25c-.415-.165-.866-.25-1.336-.25-2.11 0-3.818 1.79-3.818 4 0 .494.083.964.237 1.4-1.272.65-2.147 2.018-2.147 3.6 0 1.495.782 2.798 1.942 3.486-.02.17-.032.34-.032.514 0 2.21 1.708 4 3.818 4 .47 0 .92-.086 1.335-.25.62 1.334 1.926 2.25 3.437 2.25 1.512 0 2.818-.916 3.437-2.25.415.163.865.248 1.336.248 2.11 0 3.818-1.79 3.818-4 0-.174-.012-.344-.033-.513 1.158-.687 1.943-1.99 1.943-3.484zm-6.616-3.334l-4.334 6.5c-.145.217-.382.334-.625.334-.143 0-.288-.04-.416-.126l-.115-.094-2.415-2.415c-.293-.293-.293-.768 0-1.06s.768-.294 1.06 0l1.77 1.767 3.825-5.74c.23-.345.696-.436 1.04-.207.346.23.44.696.21 1.04z"></path>
                                </svg>
                            </span>
                        </h1>
                        <div class="display-name">
                            <span class="view-mode-text">
                                @<asp:Literal ID="litDisplayName" runat="server">alexmartinez</asp:Literal>
                            </span>
                            <asp:TextBox ID="txtDisplayName" runat="server" CssClass="form-input-inline" style="display:none;" placeholder="Display Name" />
                        </div>

                        <!-- Enhanced stats with progress bars and animations -->
                        <div class="stats">
                            <div class="stat-item" data-stat="posts">
                                <span class="stat-value" data-count="324">0</span>
                                <span class="stat-label">Posts</span>
                                <div class="stat-progress">
                                    <div class="stat-progress-bar" style="width: 75%"></div>
                                </div>
                            </div>
                            <div class="stat-item" data-stat="followers">
                                <span class="stat-value" data-count="2847">0</span>
                                <span class="stat-label">Followers</span>
                                <div class="stat-progress">
                                    <div class="stat-progress-bar" style="width: 90%"></div>
                                </div>
                            </div>
                            <div class="stat-item" data-stat="solutions">
                                <span class="stat-value" data-count="156">0</span>
                                <span class="stat-label">Solutions</span>
                                <div class="stat-progress">
                                    <div class="stat-progress-bar" style="width: 60%"></div>
                                </div>
                            </div>
                        </div>

                        <div class="profile-bio">
                            <div class="view-mode-text">
                                <asp:Literal ID="litBio" runat="server">
                                    Full-stack developer passionate about AI and building collaborative solutions. 
                                    Love helping others solve complex problems through code.
                                </asp:Literal>
                            </div>
                            <asp:TextBox ID="txtBio" runat="server" TextMode="MultiLine" CssClass="form-textarea" style="display:none;" placeholder="Tell us about yourself..." />
                        </div>

                        <div class="profile-meta">
                            <div class="meta-item">
                                <svg class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <rect x="2" y="7" width="20" height="14" rx="2" ry="2"></rect>
                                    <path d="M16 21V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v16"></path>
                                </svg>
                                <span class="view-mode-text">
                                    <asp:Literal ID="litProfession" runat="server">Senior Full-Stack Developer</asp:Literal>
                                </span>
                                <asp:TextBox ID="txtProfession" runat="server" CssClass="form-input-inline" style="display:none;" placeholder="Your profession" />
                            </div>
                            <div class="meta-item">
                                <svg class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path>
                                    <circle cx="12" cy="10" r="3"></circle>
                                </svg>
                                <span class="view-mode-text">
                                    <asp:Literal ID="litLocation" runat="server">San Francisco, CA</asp:Literal>
                                </span>
                                <asp:TextBox ID="txtLocation" runat="server" CssClass="form-input-inline" style="display:none;" placeholder="City, Country" />
                            </div>
                            <!-- Added member since info -->
                            <div class="meta-item">
                                <svg class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                                    <line x1="16" y1="2" x2="16" y2="6"></line>
                                    <line x1="8" y1="2" x2="8" y2="6"></line>
                                    <line x1="3" y1="10" x2="21" y2="10"></line>
                                </svg>
                                <span>Member since 2022</span>
                            </div>
                        </div>

                        <!-- Added Follow/Message Action Buttons Section -->
                        <div class="profile-actions">
                            <button class="btn btn-follow" id="followBtn" onclick="toggleFollowStatus(); return false;">
                                <svg class="btn-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M16 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                    <circle cx="12" cy="7" r="4"></circle>
                                    <polyline points="21 8 21 14"></polyline>
                                    <polyline points="18 11 24 11"></polyline>
                                </svg>
                                <span class="btn-text">Follow</span>
                            </button>

                            <button class="btn btn-message" onclick="openMessageModal(); return false;">
                                <svg class="btn-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path>
                                </svg>
                                <span class="btn-text">Message</span>
                            </button>

                            <button class="btn btn-more" onclick="toggleMoreActions(); return false;">
                                <svg class=" edit-btn" viewBox="0 0 24 24" fill="more" stroke="currentColor" stroke-width="4">
                                    <circle cx="12" cy="14" r="1"></circle>
                                    <circle cx="19" cy="14" r="1"></circle>
                                    <circle cx="12" cy="14" r="1"></circle>
                                </svg>
                            </button>
                        </div>

                       <div class="more-container">
    <button class="more-btn" onclick="toggleMenu()">
        &#8942; <!-- Vertical 3 dots -->
    </button>
    </n>
    </n>
    <!-- Dropdown Menu -->
    <div class="more-actions-menu" id="moreActionsMenu">
        <div class="menu-item" onclick="blockUser();">
            <span>Block User</span>
        </div>

        <div class="menu-item" onclick="reportUser();">
            <span>Report User</span>
        </div>

        <div class="menu-item" onclick="restrict user();">
            <span>restric user</span>
        </div>
    </div>
</div>
                </div>
            </div>

            <!-- Enhanced settings section with better icons and hover effects -->
            <div class="settings-section">
                <h2 class="section-title">
                    <svg class="title-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <circle cx="12" cy="12" r="3"></circle>
                        <path d="M12 1v6m0 6v6m8.66-15.66l-4.24 4.24m-4.24 4.24l-4.24 4.24M23 12h-6m-6 0H1m20.66 8.66l-4.24-4.24m-4.24-4.24l-4.24-4.24"></path>
                    </svg>
                    Profile Settings
                </h2>
                
                <div class="settings-grid">
                    <div class="setting-item" id="editProfileItem">
                        <div class="setting-content">
                            <div class="setting-icon">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                    <circle cx="12" cy="7" r="4"></circle>
                                </svg>
                            </div>
                            <div class="setting-info">
                                <h3 class="setting-title">Edit Profile</h3>
                                <p class="setting-description">Update your personal information</p>
                            </div>
                        </div>
                        <div class="setting-actions">
                  <asp:Button 
    ID="btnEdit" 
    runat="server" 
    CssClass="edit-btn" 
    Text="Edit" 
    OnClientClick="window.location.href='Setting.aspx?section=#profile'; return false;" />
<asp:Button ID="btnSave" runat="server" CssClass="edit-btn save-btn" Text="Save" style="display:none;" OnClick="btnSave_Click" />
                            <asp:Button ID="btnCancel" runat="server" CssClass="edit-btn cancel-btn" Text="Cancel" style="display:none;" OnClientClick="toggleEditMode(); return false;" />
                            <svg class="arrow-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <polyline points="9 18 15 12 9 6"></polyline>
                            </svg>
                        </div>
                    </div>

                    <div class="setting-item">
                        <div class="setting-content">
                            <div class="setting-icon">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M19 21l-7-5-7 5V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2z"></path>
                                </svg>
                            </div>
                            <div class="setting-info">
                                <h3 class="setting-title">Saved Posts</h3>
                                <p class="setting-description">View your saved posts and solutions</p>
                            </div>
                        </div>
                        <div class="setting-actions">
                            <span class="badge-count">24</span>
                            <svg class="arrow-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <polyline points="9 18 15 12 9 6"></polyline>
                            </svg>
                        </div>
                    </div>

                    <div class="setting-item">
                        <div class="setting-content">
                            <div class="setting-item" onclick="window.location.href='Setting.aspx#posts';">
                            <div class="setting-icon">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <circle cx="12" cy="12" r="3"></circle>
                                    <path d="M12 1v6m0 6v6m8.66-15.66l-4.24 4.24m-4.24 4.24l-4.24 4.24M23 12h-6m-6 0H1m20.66 8.66l-4.24-4.24m-4.24-4.24l-4.24-4.24"></path>
                                </svg>
                            </div>
                            <div class="setting-info">
                                <h3 class="setting-title">Privacy Settings</h3>
                                <p class="setting-description">Manage your privacy settings</p>
                            </div>
                        </div>
                        <div class="setting-actions">
                            <svg class="arrow-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <polyline points="9 18 15 12 9 6"></polyline>
                            </svg>
                        </div>
                    </div>

                    <div class="setting-item">
                        <div class="setting-content">
                         <div class="setting-item" onclick="window.location.href='Setting.aspx#privacy';">
                            <div class="setting-icon">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path>
                                </svg>
                            </div>
                            <div class="setting-info">
                                <h3 class="setting-title">Likes & Reactions</h3>
                                <p class="setting-description">View your liked posts and reactions</p>
                            </div>
                        </div>
                        <div class="setting-actions">
                            <div class="setting-item" onclick="window.location.href='Setting.aspx#likes-shares';">
                            <span class="badge-count">156</span>
                            <svg class="arrow-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <polyline points="9 18 15 12 9 6"></polyline>
                            </svg>
                        </div>
                    </div>

                    <!-- Added Following/Followers Management -->
                    <div class="setting-item">
                        <div class="setting-content">
                            <div class="setting-item" onclick="window.location.href='Setting.aspx#followers';">
                            <div class="setting-icon">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                                    <circle cx="9" cy="7" r="4"></circle>
                                    <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
                                    <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
                                </svg>
                            </div>
                            <div class="setting-info">
                                <h3 class="setting-title">Following & Followers</h3>
                                <p class="setting-description">Manage your followers and following list</p>
                            </div>
                        </div>
                        <div class="setting-actions">
                            <span class="badge-count">342</span>
                            <svg class="arrow-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <polyline points="9 18 15 12 9 6"></polyline>
                            </svg>
                        </div>
                    </div>

                    <div class="setting-item">
                        <div class="setting-content">
                            <div class="setting-icon">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
                                    <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                                </svg>
                            </div>
                            <div class="setting-info">
                                <h3 class="setting-title">Security & Login</h3>
                                <p class="setting-description">Password and authentication settings</p>
                            </div>
                        </div>
                        <div class="setting-actions">
                            <svg class="arrow-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <polyline points="9 18 15 12 9 6"></polyline>
                            </svg>
                        </div>
                    </div>

                    <div class="setting-item">
                        <div class="setting-content">
                            <div class="setting-item" onclick="window.location.href='Setting.aspx#security';">
                            <div class="setting-icon">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"></path>
                                    <path d="M13.73 21a2 2 0 0 1-3.46 0"></path>
                                </svg>
                            </div>
                            <div class="setting-info">
                                <h3 class="setting-title">Notifications</h3>
                                <p class="setting-description">Configure notification preferences</p>
                            </div>
                        </div>
                        <div class="setting-actions">
                            <span class="badge-count new">5</span>
                            <svg class="arrow-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <polyline points="9 18 15 12 9 6"></polyline>
                            </svg>
                        </div>
                    </div>

                    <div class="setting-item">
                        <div class="setting-content">
                            <div class="setting-item" onclick="window.location.href='Setting.aspx#notifications';">
                            <div class="setting-icon">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <circle cx="12" cy="12" r="10"></circle>
                                    <path d="M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3"></path>
                                    <line x1="12" y1="17" x2="12.01" y2="17"></line>
                                </svg>
                            </div>
                            <div class="setting-info">
                                <h3 class="setting-title">Help & Support</h3>
                                <p class="setting-description">Get support and documentation</p>
                            </div>
                        </div>
                        <div class="setting-actions">
                            <svg class="arrow-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <polyline points="9 18 15 12 9 6"></polyline>
                            </svg>
                        </div>
                    </div>

                    <div class="setting-item">
                        <div class="setting-content">
                            <div class="setting-item" onclick="window.location.href='Setting.aspx#help';">
                            <div class="setting-icon">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path>
                                    <polyline points="22,6 12,13 2,6"></polyline>
                                </svg>
                            </div>
                            <div class="setting-info">
                                <h3 class="setting-title">Email Preferences</h3>
                                <p class="setting-description">Manage email subscriptions</p>
                            </div>
                        </div>
                        <div class="setting-actions">
                            <svg class="arrow-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <polyline points="9 18 15 12 9 6"></polyline>
                            </svg>
                        </div>
                    </div>

                    <div class="setting-item">
                        <div class="setting-content">
                            <div class="setting-item" onclick="window.location.href='Setting.aspx#email-preferences';">
                            <div class="setting-icon">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path>
                                    <polyline points="7 10 12 15 17 10"></polyline>
                                    <line x1="12" y1="15" x2="12" y2="3"></line>
                                </svg>
                            </div>
                            <div class="setting-info">
                                <h3 class="setting-title">Download Data</h3>
                                <p class="setting-description">Export your profile information</p>
                            </div>
                        </div>
                        <div class="setting-actions">
                            <div class="setting-item" onclick="window.location.href='Setting.aspx#data';">
                            <svg class="arrow-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <polyline points="9 18 15 12 9 6"></polyline>
                            </svg>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <asp:hiddenfield id="hdneditmode" runat="server" value="false" />
    </form>
    <script>
function togglefollowstatus() {
    const btn = document.getelementbyid("followbtn");
    btn.classlist.toggle("following");

    const text = btn.querySelector(".btn-text");
    text.textContent = btn.classList.contains("following") ? "Following" : "Follow";
}
    </script>
    <script>
        function toggleMenu() {
            var menu = document.getElementById("moreActionsMenu");

            if (menu.style.display === "block") {
                menu.style.display = "none";
            } else {
                menu.style.display = "block";
            }
        }

        // Optional: Close menu when clicking outside
        window.onclick = function (event) {
            if (!event.target.matches('.more-btn')) {
                var menu = document.getElementById("moreActionsMenu");
                if (menu.style.display === "block") {
                    menu.style.display = "none";
                }
            }
        }

        // Example functions
        function blockUser() {
            alert("User Blocked");
        }

        function reportUser() {
            alert("User Reported");
        }

        function viewActivity() {
            alert("Viewing Activity");
        }

    </script>
    <script src="JS/Profile.js"></script>
</body>
</html>
