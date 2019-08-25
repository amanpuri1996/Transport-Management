<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Bank-Book.aspx.cs" Inherits="Bank_Book" %>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head"></asp:Content>
<asp:Content ID="cnt" runat="server" ContentPlaceHolderID="footer">
    <div class="row tm-content-row tm-mt-big">
        <div class="box">
            <div class="panel-heading" style="background: #e46c0a;    font-size: 19px;">
       Bank Book
                 </div>
            <div class="container">
                 <div class="row">
                    <div class="col-md-3">
                      Bank Ledger: 
                        <asp:DropDownList ID="ddl_Vehicle_OwnerShip" runat="server" CssClass="form-control">
                            <asp:ListItem Text="SBI 127"></asp:ListItem>
                            <asp:ListItem Text="ICICI12"></asp:ListItem>
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
