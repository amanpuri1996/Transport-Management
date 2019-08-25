﻿<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="GeneralVoucher.aspx.cs" Inherits="GeneralVoucher" %>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head"></asp:Content>
<asp:Content ID="cnt" runat="server" ContentPlaceHolderID="footer">
    <div class="row tm-content-row tm-mt-big">
        <div class="box">
            <div class="panel-heading" style="background: #e46c0a;    font-size: 19px;">
          General Voucher
                 </div>
            <div class="panel-heading" style="background: #eee;">
               <p>Basic Details / मूल जानकारी</p>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        Transaction Date*:   
                        <asp:TextBox ID="txt_Transaction_Date" runat="server" CssClass="form-control" placeholder="DD/MM/YYYY"></asp:TextBox>
                    </div>
                    <div class="col-md-3">
                       Voucher No *:  
                        <asp:TextBox ID="txt_Voucher_No" runat="server" CssClass="form-control" placeholder="Voucher No"></asp:TextBox>
                    </div>
                                     
                    <div class="col-md-3">
                        Select A/C Head Type (Payment) : 
                        <asp:DropDownList ID="ddl_AChead_Type" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="col-md-3">
                        Payment Given By  : 
                        <asp:DropDownList ID="ddl_payment_given_by" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="col-md-3">
                        Select A/C Head Type(Receipt)  : 
                        <asp:DropDownList ID="ddl_AC_Head_Name" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                     <div class="col-md-3">
                        Payment Received By* : 
                        <asp:DropDownList ID="ddl_payment_received" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="col-md-3">
                        Payment Type  : 
                        <asp:DropDownList ID="ddl_payment_type" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="col-md-3">
                        Amount:   
                        <asp:TextBox ID="txt_amount" runat="server" CssClass="form-control" placeholder="Amount"></asp:TextBox>
                    </div>
                    <div class="col-md-3">
                        Consigner(If Required):   
                        <asp:DropDownList ID="ddl_Consigner" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="col-md-3">
                        Narration :   
                        <asp:TextBox ID="txt_Narration" runat="server" CssClass="form-control" placeholder="Narration "></asp:TextBox>
                    </div>
                </div>
                <asp:Button ID="btn_save" runat="server" CssClass="btn btn-success" Text="Save / सुरक्षित करें" />
            <asp:Button ID="Button1" runat="server" CssClass="btn btn-default" Text="Reset / हटायें" />
                </div>
            </div>
        </div>
    </asp:Content>