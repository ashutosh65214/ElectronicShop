using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;

namespace ElectronicShop
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private SqlConnection con = null;
        private SqlCommand cmd = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConShop"].ConnectionString))
                {
                    using (SqlDataAdapter adapter = new SqlDataAdapter("Select * from Category", con))
                    {
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);
                        DdlCategories.DataSource = dt;
                        DdlCategories.DataValueField = "Id";
                        DdlCategories.DataTextField = "Category";
                        DdlCategories.DataBind();
                    }
                }

            }

        }
        protected void BtnSave_Click(object sender, EventArgs e)
        {
            using (con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConShop"].ConnectionString))
            {
                using (cmd = new SqlCommand("usp_AddNewProduct", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ProductName", TxtProductName.Text);
                    cmd.Parameters.AddWithValue("@Description", TxtDescription.Text);
                    cmd.Parameters.AddWithValue("@Price", TxtPrice.Text);
                    cmd.Parameters.AddWithValue("@Quantity", TxtQuantity.Text);
                    cmd.Parameters.AddWithValue("@CategoryId", DdlCategories.SelectedValue);

                    if (ImgFileUpload.HasFile)
                    {
                        string fileName = ImgFileUpload.PostedFile.FileName;
                        string extn = ImgFileUpload.PostedFile.ContentType;
                        if (extn == @"image/jpeg" || extn == @"image/png")
                        {
                            //cmd.Parameters.AddWithValue("@ImageFileName", fileName);
                            cmd.Parameters.AddWithValue("@ImagePath", Path.Combine(@"~\Content\Image\", fileName));
                            ImgFileUpload.PostedFile.SaveAs(Server.MapPath(Path.Combine(@"~\Content\Image\", fileName)));
                        }
                        else
                        {
                            lblMessage.Text = "Kindly upload an image";
                        }
                    }

                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }
                    cmd.ExecuteNonQuery();
                    this.ClearAll();

                }
            }
        }
        protected void BtnReset_Click(object sender, EventArgs e)
        {
            this.ClearAll();
        }

        public void ClearAll()
        {
            TxtProductName.Text = "";
            TxtDescription.Text = "";
            TxtPrice.Text = "";
            TxtQuantity.Text = "";
            TxtProductName.Focus();
        }

    }
}