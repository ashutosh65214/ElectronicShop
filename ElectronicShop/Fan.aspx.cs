using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;


namespace ElectronicShop
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        private SqlConnection con = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                using (con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConShop"].ConnectionString))
                {
                    using (SqlDataAdapter adapter = new SqlDataAdapter("select ProductName,Price,ImagePath from Product where CategoryId=6", con))
                    {
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);
                        dlProducts.DataSource = dt;
                        dlProducts.DataBind();
                    }
                }
            }


        }
    }
}