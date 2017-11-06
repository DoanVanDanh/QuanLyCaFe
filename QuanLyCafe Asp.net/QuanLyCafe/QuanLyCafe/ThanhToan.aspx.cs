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
    public partial class ThanhToan : System.Web.UI.Page
    {
        string conString;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            conString = CommonCode.DataClasses.WebClass.getConnectionStringByName("conString");
            BindDataToDataList();
            lbNgayGio.Text = string.Format("ngày thanh toán {0:dd:mm:yyyy HH:mm:ss}", DateTime.Now);

        }

        private void BindDataToDataList()
        {
            try
            {
                string maBill = Request.QueryString["maBill"].ToString();
                if (maBill != null)
                {
                    Response.Write("mã Bill là" + maBill);
                    string sql = "select DichVu.MaDV,TenDV,DonViTinh,Gia,SoLuong,SoLuong*Gia as TongTien " +
                    "from DICHVU join SUDUNGDICHVU on DICHVU.MaDV = SUDUNGDICHVU.MaDV " +
                    "where MaBill=@maBill";

                    List<SqlParameter> sqlParams = new List<SqlParameter>();
                    sqlParams.Add(new SqlParameter("maBill", maBill));
                    DataList1.DataSource = (new DataTool()).execSelect(conString, sql, sqlParams);
                    DataList1.DataBind();

                }
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

       

     
        protected void linkbtQuanLyBan_Click(object sender, EventArgs e)
        {
            Response.Redirect("TrangThaiBan.aspx");
        }
    }
}