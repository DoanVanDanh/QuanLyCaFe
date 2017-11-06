<%@ Page Title="" Language="C#" MasterPageFile="~/NhanVien.master" AutoEventWireup="true" CodeBehind="ThanhToan.aspx.cs" Inherits="QuanLyCafe.ThanhToan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <h2>Cảm ơn bạn đã sử dụng dịch vụ</h2>
    <asp:LinkButton Font-Size="Large" CssClass="form-control-warning" ID="linkbtQuanLyBan" runat="server" OnClick="linkbtQuanLyBan_Click">Quay Về </asp:LinkButton><br />


    <asp:Label Font-Size="20px" CssClass="bg-success" ID="lbNgayGio" runat="server" Text="Label"> </asp:Label><br />
    <asp:Label Font-Size="20px" CssClass="bg-success" ID="lbTongTien" runat="server" Text="Label"></asp:Label> <br />
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
    <div class="table-responsive">
   
           	<table class="table table-hover">
		            <thead>
			            <tr class="active">
				            <th class="col-xs-3 col-sm-3 col-md-3 col-lg-3">tên</th>
				            <th class="col-xs-3 col-sm-3 col-md-3 col-lg-3">số lượng</th>
				            <th class="col-xs-3 col-sm-3 col-md-3 col-lg-3"> giá </th>
				           <th class="col-xs-3 col-sm-3 col-md-3 col-lg-3"> Tổng Tiền</th>
			            </tr>
		            </thead>
                </table>
        <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" CssClass="table table-hover" RepeatColumns="1" >       
            <ItemTemplate>
                
                <asp:Table ID="Table1" runat="server" CssClass="table table-hover"> 
                    <asp:TableRow ID="TableRow1" runat="server"> <%--row:dòng, cell:ô--%>
                   
                         <asp:TableCell ID="TableCell1" runat="server" CssClass="col-xs-3 col-sm-3 col-md-3 col-lg-3" >
                            <%# Eval("tenDV") %>
                        </asp:TableCell>

                       
                        <asp:TableCell ID="TableCell3" runat="server" CssClass="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                            <%# Eval("soLuong") %>
                        </asp:TableCell>
                       
                        <asp:TableCell ID="TableCell2" runat="server" CssClass="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                            <%# Eval("gia") %>
                        </asp:TableCell> 

                        <asp:TableCell ID="TableCell4" runat="server" CssClass="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                            <%# Eval("TongTien") %>
                        </asp:TableCell> 
                    </asp:TableRow>
                </asp:Table>
           
            </ItemTemplate>
        </asp:DataList>
    
    </div>
</div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
