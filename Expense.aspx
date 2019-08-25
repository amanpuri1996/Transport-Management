<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Expense.aspx.cs" Inherits="Expense" %>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head"></asp:Content>
<asp:Content ID="cnt" runat="server" ContentPlaceHolderID="footer">
    <div class="row tm-content-row tm-mt-big">
        <div class="box">
            <div class="panel-heading" >
           Create Expense
                 </div>
            <div class="panel-heading" style="background: #eee;">
                <p>Basic Details / मूल जानकारी </p>
            </div>
            <div class="container">
                <asp:UpdatePanel ID="update_pnl1" runat="server">
                    <ContentTemplate>
            <div class="row">
                    <div class="col-md-3">
       Expense Name *:   <asp:TextBox ID="txt_Expense_Name" runat="server" CssClass="form-control" placeholder="Name"></asp:TextBox>
                <asp:HiddenField ID="hf_id" runat="server" />
                    </div>
                                <div class="col-md-3">
    CR/DR   :        <asp:DropDownList ID="ddl_cr_dr" runat="server" CssClass="form-control">
        <asp:ListItem Text="CR" Value="CR" Selected="True"></asp:ListItem>
        <asp:ListItem Text="DR" Value="DR"></asp:ListItem>
                     </asp:DropDownList>
                </div>
                                <div class="col-md-3">
      Opening Balance :    <asp:TextBox ID="txt_Opening_Balance" runat="server" CssClass="form-control" placeholder="Opening Balance"></asp:TextBox>
                </div>
                </div>
                       <asp:Button ID="btn_save" runat="server" OnClick="btn_save_Click" CssClass="btn btn-success" Text="Save / सुरक्षित करें" />
            <asp:Button ID="btn_reset" runat="server" OnClick="btn_reset_Click" CssClass="btn btn-default" Text="Reset / हटायें" />
                   </ContentTemplate>
                </asp:UpdatePanel>
                       <div class="row">
                    <div class="box-body" >
                        <asp:UpdatePanel ID="updt_pnl" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="grdvw_expense" runat="server" DataKeyNames="id" AutoGenerateColumns="false" CssClass="table table-striped  table-responsive" OnRowEditing="grdvw_expense_RowEditing">
                                    <Columns>
                                        <asp:TemplateField HeaderText="S.No">
                                            <ItemTemplate>
                                                <%# ((GridViewRow)Container).RowIndex + 1%>
                                                <asp:HiddenField ID="hf" runat="server" Value='<%# Eval("id")%>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Expense Name">
                                            <ItemTemplate>
                                                <%#Eval("expense_name") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="CR/DR">
                                            <ItemTemplate>
                                                <%#Eval("cr_dr") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Opening Balance">
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
