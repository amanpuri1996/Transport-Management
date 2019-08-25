<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Ledger-Report.aspx.cs" Inherits="Ledger_Report" %>

<asp:Content ID="cnt" runat="server" ContentPlaceHolderID="footer">
    <div class="row tm-content-row tm-mt-big">
        <div class="box">
            <div class="panel-heading" style="background: #e46c0a; font-size: 19px;">
                Consigner Report
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        Select A/C Head Type : 
                        <asp:DropDownList ID="ddl_Vehicle_OwnerShip" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Consigner"></asp:ListItem>
                            <asp:ListItem Text="Bank"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-3">
                        Select A/C Head  : 
                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                            <asp:ListItem Text="BRL"></asp:ListItem>
                            <asp:ListItem Text="FST"></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="col-md-3">
                        From Date:   
                        <asp:TextBox ID="txt_from_date" runat="server" CssClass="form-control" placeholder="dd/mm/yyyy"></asp:TextBox>
                    </div>
                    <div class="col-md-3">
                        To Date:   
                        <asp:TextBox ID="txt_to_date" runat="server" CssClass="form-control" placeholder="dd/mm/yyyy"></asp:TextBox>
                    </div>
                </div>
                <asp:Button ID="btn_search" runat="server" CssClass="btn btn-success" Text="Search" />
            </div>
        </div>
    </div>
</asp:Content>