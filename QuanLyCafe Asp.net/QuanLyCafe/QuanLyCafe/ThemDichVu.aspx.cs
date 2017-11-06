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
    public partial class ThemDichVu : System.Web.UI.Page
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
                    string sql = "select maLoaiDV,TenLoaiDichVu "+
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
                BindDataToDataList();
            }
        }

        protected void bThemMoi_Click(object sender, EventArgs e)
        {
            lThongBao.Text = "";
            try
            {
                Response.Write(tbID.Text.Trim() + tbGia.Text.Trim() + ddlTheLoai.SelectedIndex);
                if (tbID.Text.Trim()==""||tbGia.Text.Trim() == "" || tbTen.Text.Trim() == ""
                    || ddlTheLoai.SelectedIndex == 0 || !FileUploadControl.HasFile)
                {
                    lThongBao.Text = "Phải nhập đủ dữ liệu!";
                    return;
                }
                ///Có thể thêm mã nguồn kiểm tra file tải lên có định dạng như mong muốn hay không
                /// hoặc kích thước đảm bảo yêu cầu không... - dùng FileUploadControl.PostedFile.ContentLength,
                /// FileUploadControl.PostedFile.ContentType...

                //insert: hinhAnh :hanghoa_id.jpg
                //Vẫn thêm bản ghi vào bảng HangHoa, giờ có thêm tên file
                string sql = "ThemDichVu";
                SqlConnection sqlCon = new SqlConnection();
                SqlCommand sqlCom = new SqlCommand(sql,sqlCon);

                sqlCon.ConnectionString = conString;
                sqlCon.Open();
                if (sqlCon.State == System.Data.ConnectionState.Open)
                {
                    sqlCom.CommandType = CommandType.StoredProcedure;
                    sqlCom.Parameters.AddWithValue("@id", tbID.Text.Trim());
                    sqlCom.Parameters.AddWithValue("@tenDV", tbTen.Text.Trim());
                    sqlCom.Parameters.AddWithValue("@gia", tbGia.Text.Trim());
                    sqlCom.Parameters.AddWithValue("@hinhAnh", string.Format("dichvu_{0}.jpg", tbID.Text.Trim()));
                    sqlCom.Parameters.AddWithValue("@maTheLoai", ddlTheLoai.SelectedValue);
                    int cnt = sqlCom.ExecuteNonQuery();
                    lThongBao.Text = cnt.ToString() + " đã được thêm thành công!";

                    //Lưu file vào thư mục files/img với tên là hangHoa_ID.jpg (vì chưa tạo nên phải tạo các thư mục này)
                    //tạo đường dẫn tuyệt  đối để lưu file: string.Format("{0}/files/img/hangHoa_{1}.jpg",   Server.MapPath("~"), tbID.Text.Trim())
                    //(Do: FileUploadControl.SaveAs(…) có tham số là 1 đường dẫn tuyệt đối,cụ thể~~)
                    FileUploadControl.SaveAs(string.Format("{0}/img/dichvu/dichvu_{1}.jpg",
                        Server.MapPath("~"), tbID.Text.Trim())); //Server.MapPath("~") : đường dẫn của host(localhost: lưu trong máy mình rùi)==> lưu vào thư mục dạng :.../files/img/hanghoa_id .jpg 

                    BindDataToDataList();// sau khi nhấn nút thêm ==> gọi phương thức này để có thể hiện hanghoa mới thêm lên trình duyệt lun~~

                }
            }
            catch (Exception exc)
            {
                lThongBao.Text = "Kết nối CSDL thất bại! Lỗi: " + exc.Message + ". " + exc.StackTrace;

            }
        }
        protected void FileUploadControl_Load(object sender, EventArgs e)
        {

        }
        private void BindDataToDataList()
        {

            try
            {
                string sql = " select MaDV,TenDV,Gia,HinhAnh,maLoaiDV " +
                             "from DICHVU "+
                    " ORDER BY MaDV DESC";
         
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
    }
}