<%@ Page Title="" Language="C#" MasterPageFile="~/NhanVien.master" AutoEventWireup="true" CodeBehind="TrangThaiBan.aspx.cs" Inherits="QuanLyCafe.TrangThaiBan" %>
<%--<%@ Page EnableEventValidation="true" %>--%>
<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="table-responsive">
        <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" CssClass="table table-hover" RepeatColumns="3" OnItemCommand="DataList1_ItemCommand" >
            <%--1 ItemTemplate của DataList: chứa 1 asp:Table--%>
            <ItemTemplate>
                
                <asp:Table ID="Table1" runat="server" > 
                    <asp:TableRow ID="TableRow1" runat="server"> <%--row:dòng, cell:ô--%>
                     
                        <asp:TableCell ID="TableCell1" runat="server">
                            <%--#Bind("hinhAnh","~/files/img/{0}"):in gia trị cột (1 hoặc nhìu) hình ảnh(csdl khi select:ở hàm BindDataToDataList()) vào vị trí 0--%>
                            <asp:Image ID="hinhAnh" runat="server" Height="290" Width="250" ImageUrl='<%#Bind("trangThai","~/img/ban/{0}.jpg")%>' />

                            <p><asp:Label ID="lbMaBan" runat="server" Text='<%# Eval("maBan")  %>' > : </asp:Label>
                                <span><asp:Label ID="lTenBan" runat="server" Text='<%# Eval("tenBan")  %>' ></asp:Label><br /></span>
                            </p>
                            <asp:LinkButton ID="linkbtChonBan" runat="server" CssClass="form-control">Chọn Bàn</asp:LinkButton><br/><br/>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
           
            </ItemTemplate>
        </asp:DataList>
        </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
