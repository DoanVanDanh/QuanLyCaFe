<%@ Page Title="" Language="C#" MasterPageFile="~/QuanTri.master" AutoEventWireup="true" CodeBehind="ThemDichVu.aspx.cs" Inherits="QuanLyCafe.ThemDichVu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <p>
        Thêm Dich Vụ

    </p>
    <p>
        <asp:PlaceHolder ID="PlaceHolder1" runat="server">
            
        </asp:PlaceHolder>
    </p>
    <table>
        <tr>
            <td>Mã Dịch Vụ</td><td>
            <asp:TextBox ID="tbID" runat="server" Width="83px"></asp:TextBox>
            </td>

            <td>Tên Dịch Vụ</td><td>
            <asp:TextBox ID="tbTen" runat="server" Width="83px"></asp:TextBox>
            </td>

            <td>Giá:</td><td>
            <asp:TextBox ID="tbGia" runat="server"></asp:TextBox>
            </td>
            <td>Thể loại:</td><td>
            <asp:DropDownList ID="ddlTheLoai" runat="server">
            </asp:DropDownList>
            </td>
            <td>Hình ảnh:</td><td>
            
<%-- --------------   Bước 1: upload file --------------------------%>
            <asp:FileUpload ID="FileUploadControl" runat="server" OnLoad="FileUploadControl_Load" />
                <!--Đoạn này giúp chọn file hình ảnh có đuôi JPG -->
<asp:RegularExpressionValidator ID="regexValidator" runat="server"
     ControlToValidate="FileUploadControl"
     ErrorMessage="Only JPEG images are allowed" 
     ValidationExpression="(.*\.([Jj][Pp][Gg])|.*\.([Jj][Pp][Ee][Gg])$)">
</asp:RegularExpressionValidator>
                <!--End: Đoạn này giúp chọn file hình ảnh có đuôi JPG -->
            </td>
        </tr>
    </table>
    <asp:Label ID="lThongBao" runat="server" Text="Chỗ hiện thông báo!!!"></asp:Label>
    <br />
    <asp:Button ID="bThemMoi" runat="server" OnClick="bThemMoi_Click" Text="Thêm" />
    <br />
    <p>
        <asp:PlaceHolder ID="PlaceHolder2" runat="server"></asp:PlaceHolder>
    </p>

        <div class="table-responsive">
        <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" CssClass="table table-hover" RepeatColumns="3" >
            <%--1 ItemTemplate của DataList: chứa 1 asp:Table--%>
            <ItemTemplate>
                
                <asp:Table ID="Table1" runat="server" > 
                    <asp:TableRow ID="TableRow1" runat="server"> <%--row:dòng, cell:ô--%>
                        <asp:TableCell ID="TableCell1" runat="server">
                    <%--#Eval("ID"): in ra gia tri (duy nhất)(cột) ID trong csdl khi select(ở hàm BindDataToDataList())--%>
                    Mã Dịch Vụ: <asp:Label ID="lId" runat="server" Text='<%# Eval("maDV")  %>'></asp:Label><br />
                    Tên:        <asp:Label ID="lTenHang" runat="server" Text='<%# Eval("tenDV") %>'></asp:Label><br />
                    Giá:        <asp:Label ID="lLoaiHang" runat="server" Text='<%# Eval("gia") %>'></asp:Label>

                        </asp:TableCell>
                        <asp:TableCell ID="TableCell2" runat="server">
                            <%--#Bind("hinhAnh","~/files/img/{0}"):in gia trị cột (1 hoặc nhìu) hình ảnh(csdl khi select:ở hàm BindDataToDataList()) vào vị trí 0--%>
                            <asp:Image ID="hinhAnh" runat="server" Height="90" Width="60" ImageUrl='<%#Bind("hinhAnh","~/img/dichvu/{0}")%>' />

                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
           
            </ItemTemplate>
        </asp:DataList>
        </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
