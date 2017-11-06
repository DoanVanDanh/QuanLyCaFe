<%@ Page Title="" Language="C#" MasterPageFile="~/NhanVien.master" AutoEventWireup="true" CodeBehind="SuDungDichVu.aspx.cs" Inherits="QuanLyCafe.SuDungDichVu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">

<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
		<legend>Gọi đồ uống,,,</legend>

        <label>Chọn dịch Vụ </label>
		<div class="form-group">
              <label> Loại Dịch Vụ</label><asp:DropDownList ID="ddlTheLoai" runat="server" OnSelectedIndexChanged="ddlTheLoai_SelectedIndexChanged" AutoPostBack="True" />
               <label>  Tên dịch Vụ</label><asp:DropDownList ID="ddlDichVu" runat="server" AutoPostBack="True"/>
           
		</div>
		
        <div class="form-group">
            <label>Số lượng</label>
               <asp:TextBox ID="tbSoLuong" runat="server" Width="183px" CssClass="form-control"/>
		</div>
        	<div class="form-group">
                <asp:Label ID="lThongBao" runat="server" Text=""></asp:Label><br>
            <asp:Button ID="btChonDichVu" runat="server" Text="Chọn Dịch Vụ" OnClick="btChonDichVu_Click" CssClass="btn btn-primary" />
                <asp:LinkButton ID="linkbtThanhToan" runat="server" CssClass="btn btn-warning" OnClick="linkbtThanhToan_Click">Thanh toán</asp:LinkButton>
		</div>
</div>

<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
    <div class="table-responsive">
   
           	<table class="table table-hover">
		            <thead>
			            <tr class="active">
				            <th>tên</th>
				            <th>số lượng</th>
				            <th> giá </th>
				           
			            </tr>
		            </thead>
                </table>
        <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" CssClass="table table-hover" RepeatColumns="1" >       
            <ItemTemplate>
                
                <asp:Table ID="Table1" runat="server" CssClass="table table-hover"> 
                    <asp:TableRow ID="TableRow1" runat="server"> <%--row:dòng, cell:ô--%>
                   
                         <asp:TableCell ID="TableCell1" runat="server" CssClass="col-xs-2 col-sm-2 col-md-2 col-lg-2" >
                            <%# Eval("tenDV") %>
                        </asp:TableCell>

                       
                        <asp:TableCell ID="TableCell3" runat="server" CssClass="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                            <%# Eval("soLuong") %>
                        </asp:TableCell>
                       
                        <asp:TableCell ID="TableCell2" runat="server" CssClass="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                            <%# Eval("gia") %>
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
