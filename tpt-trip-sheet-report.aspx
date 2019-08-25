<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="tpt-trip-sheet-report.aspx.cs" Inherits="tpt_trip_sheet_report" %>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head"></asp:Content>
<asp:Content ID="cnt" runat="server" ContentPlaceHolderID="footer">
    <div class="row tm-content-row tm-mt-big">
        <div class="box">
            <div class="panel-heading" style="background: #e46c0a;    font-size: 19px;">
         TPT Trip Sheet  Basic Details / मूल जानकारी
                 </div>
            <div class="container">
                 <div class="row">
                    <div class="col-md-3">
                       TPT Sheet No  : 
                        <asp:TextBox ID="txt_TPT_sheet_No" runat="server" CssClass="form-control" placeholder="TPT Sheet No"></asp:TextBox>
                    </div>
                     <div class="col-md-3">
                       From Date* : 
                          <asp:TextBox ID="txt_from_date" runat="server" CssClass="form-control" placeholder="dd/mm/yyyy"></asp:TextBox>
                    </div>
                     <div class="col-md-3">
                       To Date:  
                        <asp:TextBox ID="txt_to_date" runat="server" CssClass="form-control" placeholder="dd/mm/yyyy"></asp:TextBox>
                      </div>
                </div>
                </div>
            </div>
        </div>
    </asp:Content>

