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
    public partial class ThongKeDichVuDaDung : System.Web.UI.Page
    {
        string conString;
        protected void Page_Load(object sender, EventArgs e)
        {
            conString = CommonCode.DataClasses.WebClass.getConnectionStringByName("conString");
            if (!Page.IsPostBack)
            {
                BindDataToGridView(-1);
            }
            
        }
        // DataBind, đưa dữ liệu lên gird view
        private void BindDataToGridView(int pageIndex)
        {
        
            try
            {
                String sql = "select DICHVU.MaDV,DICHVU.TenDV,Bill.NgayThanhToan,SUM (SUDUNGDICHVU.SoLuong) as TongSL "+

                               "from Bill join SUDUNGDICHVU on Bill.MaBill = SUDUNGDICHVU.MaBill join DICHVU "+
                                   "on DICHVU.MaDV = SUDUNGDICHVU.MaDV "+
                                "group by DICHVU.MaDV,Bill.NgayThanhToan,DICHVU.TenDV";
				
				
				
                GridView1.DataSource = new DataTool().execSelect(conString, sql, null);

                if (pageIndex >= 0)
                    GridView1.PageIndex = pageIndex;


                GridView1.DataBind();

            }
            catch (Exception exc)
            {
                lThongBao.Text = exc.Message + "</br>" + exc.StackTrace;
            }
            finally
            {
            }
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            BindDataToGridView(e.NewPageIndex);
        }



        private void BindDataToGridView(int pageIndex, String sortExpression, String sortDirection)
        {

            SqlConnection sqlCon = new SqlConnection();
            SqlCommand sqlCom = new SqlCommand();

            try
            {
                sqlCon.ConnectionString = conString;
                sqlCon.Open();
                if (sqlCon.State == ConnectionState.Open)
                {
                    sqlCom.Connection = sqlCon;

                    sqlCom.CommandType = System.Data.CommandType.Text;
                    sqlCom.CommandText = "select DICHVU.MaDV,DICHVU.TenDV,Bill.NgayThanhToan,SUM (SUDUNGDICHVU.SoLuong) as TongSL " +

                               "from Bill join SUDUNGDICHVU on Bill.MaBill = SUDUNGDICHVU.MaBill join DICHVU " +
                                   "on DICHVU.MaDV = SUDUNGDICHVU.MaDV " +
                                "group by DICHVU.MaDV,Bill.NgayThanhToan,DICHVU.TenDV " +
                                "order by DichVu.MaDV desc";

                    SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCom);
                    DataTable dataTable = new DataTable();
                    sqlDataAdapter.Fill(dataTable);


                    GridView1.DataSource = dataTable;

                    if (pageIndex >= 0)
                        GridView1.PageIndex = pageIndex;

                    dataTable.DefaultView.Sort = String.Format("{0} {1}", sortExpression, sortDirection);

                    GridView1.DataBind();//hoac DataBind();
                }

            }
            catch (Exception exc)
            {
                lThongBao.Text = exc.Message + " </br> " + exc.StackTrace;
            }
            finally
            {
                sqlCom.Dispose();
                sqlCon.Close();
            }

            /*
            try
            {

                    string sql = "select id,ten,maTheLoai from HangHoa order by id desc";

                    SqlDataAdapter sqlDataAdapter = new SqlDataAdapter();
                    DataTable dataTable = new DataTable(); 
                    dataTable= new DataTool().execSelect(conString,sql,null);
                    sqlDataAdapter.Fill(dataTable);


                    GridView1.DataSource = dataTable;

                    if (pageIndex >= 0)
                        GridView1.PageIndex = pageIndex;

                    dataTable.DefaultView.Sort = String.Format("{0} {1}", sortExpression, sortDirection);

                    GridView1.DataBind();//hoac DataBind();
            }
            catch (Exception exc)
            {
                lThongBao.Text = exc.Message + " </br> " + exc.StackTrace;
            }
            finally
            {
            }
            */
        }
        protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
        {
            string sortDirection;
            try
            {
                //Mặc định ASC
                if (ViewState["sortDirection"] != null) sortDirection = ViewState["sortDirection"] as string;
                else sortDirection = "ASC";
                //Đưa thông báo dưới dạng javascript alert
                Response.Write(String.Format("<script>alert('Sắp xếp {1} theo cột {0}')</script>", e.SortExpression, sortDirection));

                BindDataToGridView(GridView1.PageIndex, e.SortExpression, sortDirection);
                //Đảo chiều sau mỗi lần click
                if (sortDirection == "ASC") sortDirection = "DESC";
                else sortDirection = "ASC";
                //Lưu cách sắp xếp vào ViewState để có thể sử dụng khi chuyển sang lần gọi sau 
                ViewState["sortDirection"] = sortDirection;
            }
            catch (Exception exc)
            {
                Response.Write(String.Format("{0} {1}", exc.Message, exc.StackTrace));
            }
        }
    }
}