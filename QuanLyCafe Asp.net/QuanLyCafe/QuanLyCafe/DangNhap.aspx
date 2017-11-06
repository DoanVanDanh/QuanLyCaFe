<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DangNhap.aspx.cs" Inherits="QuanLyCafe.DangNhap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="container">
    <div class="row vertical-offset-100">
    	<div class="col-md-4 col-md-offset-4">
    		<div class="panel panel-default">
			  	<div class="panel-heading">
			    	<h3 class="panel-title">Đăng nhập</h3>
			 	</div>
			  	<div class="panel-body">
			    	
                    <fieldset>
                    	
			    	  	<div class="form-group">
			    	  		<label for="">User</label>
                              <asp:TextBox ID="tbTenDangNhap" runat="server" class="form-control"></asp:TextBox>
			    		</div>
			    		
			    		<div class="form-group">
			    			<label for="">PassWord</label>
                            <asp:TextBox ID="tbMatKhau" runat="server" class="form-control"></asp:TextBox>
			    		</div>
                        <asp:Label ID="lThongBao" runat="server" Text=""></asp:Label><br />
			    	    <asp:Button ID="btDangNhap" runat="server" OnClick="btDangNhap_Click" Text="Đăng Nhập" class="btn btn-lg btn-success btn-block"/>

			    	</fieldset>
			      	
			    </div>
			</div>
		</div>
	</div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
