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
    public partial class ThongKe : System.Web.UI.Page
    {
        string conString;
        protected void Page_Load(object sender, EventArgs e)
        {
            conString = CommonCode.DataClasses.WebClass.getConnectionStringByName("conString");
            if (!Page.IsPostBack)
            {

                // hiển thị nội dung khi chưa click vào dropdownlist
                ListItem item = new ListItem();
                item.Value = "-1";//Giá trị sẽ được lấy
                item.Text = "Chọn thể loại";//Nội dung hiển thị trong danh sách
                ddlTheLoai.Items.Add(item);


                try
                {
                    string sql = "select maLoaiDV,TenLoaiDichVu " +
                                    "from TheLoaiDichVu";

                    DataTool dataTool = new DataTool();
                    SqlDataReader sqlDataReader = dataTool.execReader(conString, sql, null);
                    if (sqlDataReader != null && sqlDataReader.HasRows)
                    {
                        while (sqlDataReader.Read())
                        {
                            ListItem item2 = new ListItem();
                            item2.Text = sqlDataReader.GetString(1).ToString();
                            item2.Value = sqlDataReader.GetString(0).ToString();
                            ddlTheLoai.Items.Add(item2);

                        }
                    }

                }
                catch (Exception exc)
                {
                    Response.Write(String.Format("{0} </br> </br></br>{1}", exc.Message, exc.StackTrace));
                }
                BindDataToGridView(-1);
              
            }
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

                ViewState["sortExpression"] = e.SortExpression;

                BindDataToGridView(GridView1.PageIndex);
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


        // get chuỗi truy vấn: phần  điều kiện tìm kiếm  :where...  
        protected void bTimKiem_Click(object sender, EventArgs e)
        {
            //không chọn cái nào, không nhập ô nào cả
            if (tbID.Text.Trim() == "" &&tbGia.Text.Trim() == ""&& tbTen.Text.Trim() == "" && ddlTheLoai.SelectedValue.Trim() == "-1")
            {
                lThongBao.Text = " bạn phải nhập/ chọn 1 trong các textbox/dropdownlist";
            }

            //chuỗi where=....
            String dieuKienTimKiem = "where 1=1 ";//lun đúng~~//đưa 1=1 để dễ nối các điều kiện khác vào: có thể tbId,tbTen hay ddlTheLoai trống--> k nối
            if (tbID.Text.Trim() != "")
                dieuKienTimKiem += "and maDV=" + tbID.Text.Trim();
            if (tbTen.Text.Trim() != "")
                dieuKienTimKiem += " and TenDV like N'%" + tbTen.Text.Trim() + "%'";
            if (ddlTheLoai.SelectedValue.Trim() != "-1")
                dieuKienTimKiem += " and MaLoaiDV=" + ddlTheLoai.SelectedValue;

            if(tbGia.Text!="")
                dieuKienTimKiem += " and Gia=" + tbGia.Text;



            //lưu vào viewstage chuỗi tìm kiếm ~~
            ViewState["dieuKiemTimKiem"] = dieuKienTimKiem;

            //
            BindDataToGridView(-1);
        }



        // chuỗi select + ViewState["dieuKiemTimKiem"]==> đưa vào DataTable --> Đẩy lên GridView
        private void BindDataToGridView(int pageIndex)
        {
            SqlConnection sqlCon = new SqlConnection();
            SqlCommand sqlCom = new SqlCommand();

            try
            {
                sqlCon.ConnectionString = conString;
                sqlCon.Open();

                if (sqlCon.State == System.Data.ConnectionState.Open)
                {
                    sqlCom.Connection = sqlCon;

                    sqlCom.CommandType = System.Data.CommandType.Text;
                    // đọc từ ViewState--> bỏ vào câu truy vấn
                    sqlCom.CommandText = String.Format("select MaDV,TenDV,Gia,maLoaiDV from DICHVU "+
                        " {0} order by MaDV desc", (ViewState["dieuKiemTimKiem"] != null) ? (ViewState["dieuKiemTimKiem"] as String) : "");
                    lThongBao.Text = sqlCom.CommandText;


                    //đưa vào gridView
                    SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCom);
                    DataTable dataTable = new DataTable();
                    sqlDataAdapter.Fill(dataTable);
                    GridView1.DataSource = dataTable;
                    //sort
                    if (ViewState["sortExpression"] != null)
                    {
                        dataTable.DefaultView.Sort = String.Format("{0} {1}", ViewState["sortExpression"], ViewState["sortDirection"] != null ? (ViewState["sortDirection"] as String) : "");
                    }

                    //phân trang
                    if (pageIndex >= 0)
                        GridView1.PageIndex = pageIndex;
                    GridView1.DataBind();

                    //Đổi tiêu đề cột
                    if (GridView1.Rows.Count > 0)
                    {
                        ((LinkButton)(GridView1.HeaderRow.Cells[0].Controls[0])).Text = "Mã";
                        ((LinkButton)(GridView1.HeaderRow.Cells[1].Controls[0])).Text = "Tên hàng";
                        ((LinkButton)(GridView1.HeaderRow.Cells[2].Controls[0])).Text = "Thể loại";
                    }
                    //lThongBao.Text = String.Format("Tìm được {0} bản ghi!", dt.Rows.Count);

                }
            }
            catch (Exception exc)
            {
                lThongBao.Text = exc.Message + "</br>" + exc.StackTrace;
            }
            finally
            {
                sqlCom.Dispose();
                sqlCon.Close();
            }


        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            BindDataToGridView(e.NewPageIndex);
        }
    }
}