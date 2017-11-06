using CommonCode.DataClasses;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace QuanLyCafe
{
    public partial class DangNhap : System.Web.UI.Page
    {
        string conString;
        protected void Page_Load(object sender, EventArgs e)
        {
            conString = CommonCode.DataClasses.WebClass.getConnectionStringByName("conString");
        }

        protected void btDangNhap_Click(object sender, EventArgs e)
        {
            lThongBao.Text = conString;

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
                    sqlCom.CommandText = "select Id,UserName,TenHienThi,PassWord,role "+
                                            "from ACCOUNT "+
                                               "where UserName = @UserName";

                    sqlCom.Parameters.AddWithValue("@UserName", tbTenDangNhap.Text.Trim());
                    SqlDataReader sqlDataReader = sqlCom.ExecuteReader();

                    Session["role"] = "";
                    MD5 md5 = MD5.Create();

                    if (sqlDataReader.HasRows)
                    {
                        while (sqlDataReader.Read())
                        {
                            if (CommonCode.MD5Hash.VerifyMd5Hash(md5, tbMatKhau.Text.Trim(), sqlDataReader.GetString(3)))
                            {
                                Session["role"] = sqlDataReader.GetString(4);
                                Session["id"] = sqlDataReader.GetInt32(0);
                                Session["TenHienThi"] = sqlDataReader.GetString(1);
                                


                                //redirect tới trang tương ứng theo từng vai trò(role) của người dùng
                                switch ((String)Session["role"])
                                {
                                    case "NhanVien":
                                        Response.Redirect("TrangThaiBan.aspx");
                                        break;
                                    case "QuanTri":
                                        Response.Redirect("ThemDichVu.aspx");
                                        break;
                                    default:
                                        break;
                                }

                            }
                            //Response.Write("da dang nhap"+"</br>");//do truy vấn với where: đăng nhập sai user ==>0 bảng, đúng user,sai pass==>1 bảng
                        }
                    }

                    lThongBao.Text = " đăng nhập k thành công";
                }

            }
            catch (Exception exc)
            {
                Response.Write(String.Format("Loi {0} {1}", exc.Message, exc.StackTrace));
            }
            finally
            {
                sqlCom.Dispose();
                sqlCon.Close();
            }
        }
    }
}