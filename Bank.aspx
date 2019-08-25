<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Bank.aspx.cs" Inherits="Bank" %>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head"></asp:Content>
<asp:Content ID="cnt" runat="server" ContentPlaceHolderID="footer">
    <div class="row tm-content-row tm-mt-big">
        <div class="box">
            <div class="panel-heading" style="background: #0094ff; font-size: 19px;">
                Create Bank
            </div>
            <div class="panel-heading" style="background: #eee;">
                <p>Basic Details / मूल जानकारी </p>
            </div>
            <div class="container">
                <asp:UpdatePanel ID="update_pnl1" runat="server">
                    <ContentTemplate>
                        <div class="row">
                            <div class="col-md-3">
                                Bank Name :   
                                 <asp:DropDownList ID="ddl_bank_name" runat="server" CssClass="form-control"></asp:DropDownList>
                                <asp:HiddenField ID="hf_id" runat="server" />
                            </div>
                            <div class="col-md-3">
                                Address:   
                                <asp:TextBox ID="txt_Address" runat="server" CssClass="form-control" placeholder="Address"></asp:TextBox>
                            </div>
                            <div class="col-md-3">
                                PIN
                               <asp:TextBox ID="txt_PIN" runat="server" CssClass="form-control" placeholder="PIN"></asp:TextBox>
                            </div>
                            <div class="col-md-3">
                                State : 
                                <asp:DropDownList ID="ddl_state" runat="server" OnTextChanged="ddl_state_TextChanged" AutoPostBack="true" CssClass="form-control"></asp:DropDownList>
                            </div>
                            <div class="col-md-3">
                                District : 
                                <asp:DropDownList ID="ddl_district" runat="server" CssClass="form-control"></asp:DropDownList>
                            </div>

                            <div class="col-md-3">
                                Id No *  :   
                                <asp:TextBox ID="txt_Id_No" runat="server" CssClass="form-control" placeholder="Id No"></asp:TextBox>
                            </div>

                            <div class="col-md-3">
                                IFSC Code :   
                                <asp:TextBox ID="txt_IFSC_Code" runat="server" CssClass="form-control" placeholder="IFSC Code"></asp:TextBox>
                            </div>
                            <div class="col-md-3">
                                Account No :   
                                <asp:TextBox ID="txt_Account_No" runat="server" CssClass="form-control" placeholder="Account No"></asp:TextBox>
                            </div>
                            <div class="col-md-3">
                                CR/DR   :       
                                <asp:DropDownList ID="ddl_cr_dr" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="DR" Value="DR" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="CR" Value="CR"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-3">
                                Opening Balance :   
                                <asp:TextBox ID="txt_Opening_Balance" runat="server" CssClass="form-control" placeholder="Opening Balance"></asp:TextBox>
                            </div>
                        </div>
                        <asp:Button ID="btn_save" runat="server" OnClick="btn_save_Click" CssClass="btn btn-success" Text="Save / सुरक्षित करें" />
                        <asp:Button ID="btn_reset" runat="server" OnClick="btn_reset_Click" CssClass="btn btn-default" Text="Reset / हटायें" />
                    </ContentTemplate>
                </asp:UpdatePanel>
                <div class="row">
                    <div class="box-body">
                        <asp:UpdatePanel ID="updt_pnl" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="grdvw_bank" runat="server" DataKeyNames="id" AutoGenerateColumns="false" CssClass="table table-striped  table-responsive" OnRowEditing="grdvw_bank_RowEditing">
                                    <Columns>
                                        <asp:TemplateField HeaderText="S.No">
                                            <ItemTemplate>
                                                <%# ((GridViewRow)Container).RowIndex + 1%>
                                                <asp:HiddenField ID="hf" runat="server" Value='<%# Eval("id")%>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Bank Name">
                                            <ItemTemplate>
                                                <%#Eval("bank_name1") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Address">
                                            <ItemTemplate>
                                                <%#Eval("address") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Pin No">
                                            <ItemTemplate>
                                                <%#Eval("pin_no") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="State">
                                            <ItemTemplate>
                                                <%#Eval("state") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="District">
                                            <ItemTemplate>
                                                <%#Eval("district") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="IFSC">
                                            <ItemTemplate>
                                                <%#Eval("ifsc_code") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Account No">
                                            <ItemTemplate>
                                                <%#Eval("account_no") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="CR/DR">
                                            <ItemTemplate>
                                                <%#Eval("cr_dr") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="opening_balance">
                                            <ItemTemplate>
                                                <%#Eval("opening_balance") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Date">
                                            <ItemTemplate>
                                                <%#Eval("created_date") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Edit">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="cmdEdit" runat="server" CommandName="Edit"><i class ="fa fa-edit"></i></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>