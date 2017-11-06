<%@ Page Title="" Language="C#" MasterPageFile="~/QuanTri.master" AutoEventWireup="true" CodeBehind="ThongKeDichVuDaDung.aspx.cs" Inherits="QuanLyCafe.ThongKeDichVuDaDung" %>
<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <asp:Label ID="lThongBao" runat="server" Text="Label"></asp:Label>

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" EnableViewState="True" EmptyDataText="Không có bản ghi nào" HorizontalAlign="Center" OnPageIndexChanging="GridView1_PageIndexChanging" OnSorting="GridView1_Sorting">
    </asp:GridView>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
