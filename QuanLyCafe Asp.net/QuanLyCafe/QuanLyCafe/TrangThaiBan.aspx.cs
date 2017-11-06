using CommonCode.DataClasses;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace QuanLyCafe
{
    public partial class TrangThaiBan : System.Web.UI.Page
    {
         string conString;
        protected void Page_Load(object sender, EventArgs e)
        {
            conString = CommonCode.DataClasses.WebClass.getConnectionStringByName("conString");
            if (!Page.IsPostBack)
            {
            }
            BindDataToDataList();

        }
        private void BindDataToDataList()
        {

            try
            {
                string sql = "select maBan,tenBan,TrangThai "+
                            "from Ban " +
                        " ORDER BY maBan DESC";

                DataList1.DataSource = (new DataTool()).execSelect(conString, sql, null);
                DataList1.DataBind();
            }
            catch (Exception exc)
            {
                //MessageBox.Show
                Response.Write(String.Format("Loi: {0}<br />{1}", exc.Message, exc.StackTrace));
            }
            finally
            {
            }
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            Label lbl = (Label)e.Item.FindControl("lbMaBan");
            //HiddenField hiddenField = (HiddenField)e.Item.FindControl("hiddenMaBan");
            Response.Redirect("~/SuDungDichVu.aspx?maBan=" + lbl.Text);
        }

       
    }
}