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
    public partial class SuDungDichVu : System.Web.UI.Page
    {
        string conString;
        string trangThai ;
        string maBill ;
        protected void Page_Load(object sender, EventArgs e)
        {
            conString = CommonCode.DataClasses.WebClass.getConnectionStringByName("conString");

            try
            {
                //phần BILL,Trạng thái ban
                string sql = "select TrangThai from Ban where MaBan = @maBan";
                List<SqlParameter> sqlParams = new List<SqlParameter>();
                sqlParams.Add(new SqlParameter("maBan", Request.QueryString["maBan"].ToString()));

                DataTool dataTool = new DataTool();
                SqlDataReader sqlDataReader = dataTool.execReader(conString, sql, sqlParams);
                if (sqlDataReader != null && sqlDataReader.HasRows)
                {
                    while (sqlDataReader.Read())
                    {
                        trangThai = sqlDataReader.GetInt32(0).ToString();
                    }
                }
                Response.Write("trangThai" + trangThai);

                if (trangThai == "0")
                {
                    List<SqlParameter> sqlParams2 = new List<SqlParameter>();
                    sqlParams2.Add(new SqlParameter("maBan", Request.QueryString["maBan"].ToString()));
                    sql = "insert into Bill(MaBan) values (@maBan)";
                    dataTool.execInsUpdDel(conString, sql, sqlParams2);

                    List<SqlParameter> sqlParams3 = new List<SqlParameter>();
                    sqlParams3.Add(new SqlParameter("maBan", Request.QueryString["maBan"].ToString()));
                    sql = "update Ban set TrangThai =1  where MaBan = @maBan";
                    dataTool.execInsUpdDel(conString, sql, sqlParams3);
                }
                //lấy mã Bill
                List<SqlParameter> sqlParams4 = new List<SqlParameter>();
                sqlParams4.Add(new SqlParameter("maBan", Request.QueryString["maBan"].ToString()));
                sql = "select top 1  MaBill from Bill where MaBan=@maBan order by MaBill desc ";
                sqlDataReader = dataTool.execReader(conString, sql, sqlParams4);
                if (sqlDataReader != null && sqlDataReader.HasRows)
                {
                    while (sqlDataReader.Read())
                    {
                        maBill = sqlDataReader.GetInt32(0).ToString();
                    }
                }
                Response.Write("maBill" + maBill);
            }
            catch (Exception exc)
            {
                Response.Write(String.Format("{0} </br> </br></br>{1}", exc.Message, exc.StackTrace));
            }
            


            if (!Page.IsPostBack)
            {

                // hiển thị nội dung khi chưa click vào dropdownlist
                ListItem item = new ListItem();
                item.Value = "-1";//Giá trị sẽ được lấy
                item.Text = "Chọn thể loại";//Nội dung hiển thị trong danh sách
                ddlTheLoai.Items.Add(item);


                try
                {
                    string sql7 = "select maLoaiDV,TenLoaiDichVu " +
                                    "from TheLoaiDichVu";

                    DataTool dataTool7 = new DataTool();
                    SqlDataReader sqlDataReader7 = dataTool7.execReader(conString, sql7, null);
                    if (sqlDataReader7 != null && sqlDataReader7.HasRows)
                    {
                        while (sqlDataReader7.Read())
                        {
                            ListItem item2 = new ListItem();
                            item2.Text = sqlDataReader7.GetString(1).ToString();
                            item2.Value = sqlDataReader7.GetString(0).ToString();
                            ddlTheLoai.Items.Add(item2);

                        }
                    }






                    

                }
                catch (Exception exc)
                {
                    Response.Write(String.Format("{0} </br> </br></br>{1}", exc.Message, exc.StackTrace));
                }
                BindDataToDataList();
            }
            
        }

        protected void ddlTheLoai_SelectedIndexChanged(object sender, EventArgs e)
        {

            {
                ddlDichVu.Items.Clear();//cứ mỗi lần ddlTheLoai chọn :post back cần clear dropdownlist dịch vụ cũ đi
                // hiển thị nội dung khi chưa click vào dropdownlist
                ListItem item = new ListItem();
                item.Value = "-1";//Giá trị sẽ được lấy
                item.Text = "Chọn Dịch Vụ";//Nội dung hiển thị trong danh sách
                ddlDichVu.Items.Add(item);


                try
                {
                    string sql = "select maDV,TenDV,Gia,HinhAnh,maLoaiDV " +
                                    "from DICHVU " +
                                    "where maLoaiDV =@maTheLoai";

                    List<SqlParameter> sqlParams = new List<SqlParameter>();
                    sqlParams.Add(new SqlParameter("@maTheLoai", ddlTheLoai.SelectedValue));

                    DataTool dataTool = new DataTool();
                    SqlDataReader sqlDataReader = dataTool.execReader(conString, sql, sqlParams);
                    if (sqlDataReader != null && sqlDataReader.HasRows)
                    {
                        while (sqlDataReader.Read())
                        {
                            ListItem item2 = new ListItem();
                            item2.Text = sqlDataReader.GetString(1).ToString();
                            item2.Value = sqlDataReader.GetString(0).ToString();
                            ddlDichVu.Items.Add(item2);

                        }
                    }



                   

                }
                catch (Exception exc)
                {
                    Response.Write(String.Format("{0} </br> </br></br>{1}", exc.Message, exc.StackTrace));
                }
                BindDataToDataList();
            }
        }

        

        protected void btChonDichVu_Click(object sender, EventArgs e)
        {
            //nếu bàn đang trống ==> thay đổi thành đã có người
     
            try
            {

                
                   
                    Response.Write("maBill"+maBill);
                    // insert SuDUngDichVu
                    String sql = "insert into SUDUNGDICHVU(MaDV,SoLuong,MaBill) values (@maDV,@soLuong,@maBill)";
                    List<SqlParameter> sqlParams5 = new List<SqlParameter>();
                    sqlParams5.Add(new SqlParameter("maDV", ddlDichVu.SelectedValue.ToString()));
                    sqlParams5.Add(new SqlParameter("soLuong", tbSoLuong.Text.Trim()));
                    sqlParams5.Add(new SqlParameter("maBill", maBill));
                     DataTool dataTool = new DataTool();    
                    dataTool.execInsUpdDel(conString,sql,sqlParams5);
                                                    

                    //đọc lại dữ liệu và đưa lên GridView
                    //BindDataToGridView(-1);
                }
                catch (Exception exc)
                {
                    Response.Write(String.Format("{0} </br> </br></br>{1}", exc.Message, exc.StackTrace));
                }
            BindDataToDataList();
            }
    
        private void BindDataToDataList()
        {
            try
            {
                if (maBill != null)
                {
                    Response.Write("mã Bill là" + maBill);
                    string sql = "select DichVu.MaDV,TenDV,DonViTinh,Gia,SoLuong " +
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

        protected void linkbtThanhToan_Click(object sender, EventArgs e)
        {
            try
            {
                //set trạng thái bàn =0
                List<SqlParameter> sqlParams3 = new List<SqlParameter>();
                sqlParams3.Add(new SqlParameter("maBan", Request.QueryString["maBan"].ToString()));
                String sql = "update Ban set TrangThai =0  where MaBan = @maBan";
                new DataTool().execInsUpdDel(conString, sql, sqlParams3);



                Response.Write(DateTime.Now.ToString("yyyy-06-dd"));
                //cập nhật ngày giờ thanh toán
                List<SqlParameter> sqlParams4 = new List<SqlParameter>();
                sqlParams4.Add(new SqlParameter("maBill",Int32.Parse(maBill)));
                sqlParams4.Add(new SqlParameter("ngayThanhToan", DateTime.Now.ToString("yyyy-06-dd")));
                sql = "update Bill set NgayThanhToan=@ngayThanhToan where MaBill=@maBill";
                new DataTool().execInsUpdDel(conString, sql, sqlParams4);
                

                Response.Redirect("ThanhToan.aspx?maBill=" + maBill);
            }
            catch (Exception exc)
            {
                //MessageBox.Show
                Response.Write(String.Format("Loi: {0}<br />{1}", exc.Message, exc.StackTrace));
            }
        }
    }
}




        
