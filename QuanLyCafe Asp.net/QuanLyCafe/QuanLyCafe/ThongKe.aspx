<%@ Page Title="" Language="C#" MasterPageFile="~/QuanTri.master" AutoEventWireup="true" CodeBehind="ThongKe.aspx.cs" Inherits="QuanLyCafe.ThongKe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
      <p style="color:red;font-size:20px" >
            Thống kê, tìm kiếm dịch vụ
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
            <td>Thể loại:</td>
            <td>
            <asp:DropDownList ID="ddlTheLoai" runat="server">
            </asp:DropDownList>
            </td>
            </tr>
        </table>

     <asp:Label ID="lThongBao" runat="server" Text="Chỗ hiện thông báo"></asp:Label>
    <br />
    <asp:Button ID="bTimKiem" runat="server" OnClick="bTimKiem_Click" Text="Tìm Kiếm" />
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" EnableViewState="True" EmptyDataText="Không có bản ghi nào" HorizontalAlign="Center" OnPageIndexChanging="GridView1_PageIndexChanging" OnSorting="GridView1_Sorting">
    </asp:GridView>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
