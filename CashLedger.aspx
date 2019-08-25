<%@ Page Language="C#" MasterPageFile="~/MasterPage.master"  AutoEventWireup="true" CodeFile="CashLedger.aspx.cs" Inherits="CashLedger" %>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
    <script>
        function Confirm_Delete() {
            var r = confirm("Are you sure to delete this.");
            if (r == true) return true;
            else return false;
        }
    </script>
</asp:Content>
<asp:Content ID="cnt" runat="server" ContentPlaceHolderID="footer">
    <div class="row tm-content-row tm-mt-big">
        <div class="box">
            <div class="panel-heading" >
           Create  Cash Ledger
                 </div>
            <div class="panel-heading" style="background: #eee;">
                <p>Basic Details / मूल जानकारी </p>
            </div>
            <div class="container">
                <asp:UpdatePanel ID="update_pnl1" runat="server">
                    <ContentTemplate>
            <div class="row">
                    <div class="col-md-3">
        Cash Ledger Name *:   <asp:TextBox ID="txt_Cash_Ledger_Name" runat="server" CssClass="form-control" placeholder="Name"></asp:TextBox>
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
                                <asp:GridView ID="grdvw_cash_ledger" runat="server" DataKeyNames="id" AutoGenerateColumns="false" CssClass="table table-striped  table-responsive" OnRowEditing="grdvw_cash_ledger_RowEditing" OnRowDeleting="grdvw_cash_ledger_RowDeleting">
                                    <Columns>
                                        <asp:TemplateField HeaderText="S.No">
                                            <ItemTemplate>
                                                <%# ((GridViewRow)Container).RowIndex + 1%>
                                                <asp:HiddenField ID="hf" runat="server" Value='<%# Eval("id")%>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Expense Name">
                                            <ItemTemplate>
                                                <%#Eval("cash_ledger") %>
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
                                        <asp:TemplateField HeaderText="Delete">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="cmddelete" runat="server" OnClientClick="return Confirm_Delete()" CommandName="Delete"><i class ="fa fa-trash"></i></asp:LinkButton>
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
