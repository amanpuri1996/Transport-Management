<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="tpt-trip-sheet.aspx.cs" Inherits="tpt_trip_sheet" %>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head"></asp:Content>
<asp:Content ID="cnt" runat="server" ContentPlaceHolderID="footer">
    <div class="row tm-content-row tm-mt-big">
        <div class="box">
            <div class="panel-heading" style="background: #e46c0a;    font-size: 19px;">
          TPT Trip Sheet
                 </div>
            <div class="container">
                 <div class="row">
                    <div class="col-md-3">
                       Date  : 
                        <asp:TextBox ID="txt_date" runat="server" CssClass="form-control"  placeholder="dd/mm/yyyy"></asp:TextBox>
                    </div>
                     <div class="col-md-3">
                        TPT Number* : 
                          <asp:TextBox ID="txt_tpt_number" runat="server" CssClass="form-control" placeholder="TPT Number"></asp:TextBox>
                    </div>
                    
                    <div class="col-md-3">
                        Cash Ledger:   
                        <asp:DropDownList ID="ddl_cash_ledger" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Cash" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="DDN Cash"></asp:ListItem>
                            <asp:ListItem Text="KNP Cash"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                     <div class="col-md-2">
                       TPT Entry Count:  
                        <asp:TextBox ID="txt_TPT_Entry_count" runat="server" CssClass="form-control" placeholder="Entry Count"></asp:TextBox>
                    </div>
                </div>
                <asp:Button ID="btn_search" runat="server" CssClass="btn btn-success" Text="Search" />
                </div>
            </div>
        </div>
    </asp:Content>
