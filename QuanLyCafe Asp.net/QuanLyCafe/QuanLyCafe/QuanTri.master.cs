using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyCafe
{
    public partial class QuanTri : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((string)Session["role"] != "QuanTri")
                Response.Redirect("DangNhap.aspx");

        }
    }
}