using System;
using System.IO;
using System.Web.UI;

namespace Fusion_Forum
{
    public partial class Profile : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUserProfile();
            }
        }

        private void LoadUserProfile()
        {
            // Dummy data (replace with database values)
            litUsername.Text = "JohnDoe";
            litDisplayName.Text = "johndoe";
            litBio.Text = "Passionate software developer with 5+ years of experience.";
            litProfession.Text = "Senior Full-Stack Developer";
            litLocation.Text = "San Francisco, CA";

            txtUsername.Text = litUsername.Text;
            txtDisplayName.Text = litDisplayName.Text;
            txtBio.Text = litBio.Text;
            txtProfession.Text = litProfession.Text;
            txtLocation.Text = litLocation.Text;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            // Save text values
            litUsername.Text = txtUsername.Text.Trim();
            litDisplayName.Text = txtDisplayName.Text.Trim();
            litBio.Text = txtBio.Text.Trim();
            litProfession.Text = txtProfession.Text.Trim();
            litLocation.Text = txtLocation.Text.Trim();

            // Handle profile image upload
            if (fileUpload.HasFile)
            {
                string folderPath = Server.MapPath("~/images/");
                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                string fileName = Guid.NewGuid() + Path.GetExtension(fileUpload.FileName);
                string filePath = folderPath + fileName;

                fileUpload.SaveAs(filePath);
                imgAvatar.ImageUrl = "~/images/" + fileName;
            }

            // Show success message using JS
            ClientScript.RegisterStartupScript(
                this.GetType(),
                "showSuccess",
                "document.getElementById('successMessage').style.display='block'; toggleEditMode();",
                true
            );
        }
    }
}
