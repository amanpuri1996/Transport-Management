<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Consigner.aspx.cs" Inherits="Consigner" %>


<asp:Content ID="head" runat="server" ContentPlaceHolderID="head"></asp:Content>
<asp:Content ID="cnt" runat="server" ContentPlaceHolderID="footer">
    <div class="row tm-content-row tm-mt-big">
        <div class="box">
            <div class="panel-heading" >
           Create Consigner
                 </div>
            <div class="panel-heading" style="background: #eee;">
                <p>Basic Details / मूल जानकारी </p>
            </div>
            <div class="container">
                <asp:UpdatePanel ID="update_pnl1" runat="server">
                    <ContentTemplate>
            <div class="row">
                    <div class="col-md-3">
       Consigner Name *:   <asp:TextBox ID="txt_Consigner_Name" runat="server" CssClass="form-control" placeholder="Name"></asp:TextBox>
              <asp:HiddenField ID="hf_id" runat="server" />
                          </div>
              <div class="col-md-3">
       Email Id:    <asp:TextBox ID="txt_email_id" runat="server" CssClass="form-control" placeholder="Email Id"></asp:TextBox>
                </div>
                <div class="col-md-3">
      GST No :    <asp:TextBox ID="txt_GST_No" runat="server" CssClass="form-control" placeholder="GST No"></asp:TextBox>
                </div>
                <div class="col-md-3">
       PAN No:    <asp:TextBox ID="txt_PAN_No" runat="server" CssClass="form-control" placeholder="PAN No"></asp:TextBox>
                </div>
                <div class="col-md-3">
       Address:    <asp:TextBox ID="txt_Address" runat="server" CssClass="form-control" placeholder="Address"></asp:TextBox>
                </div>
                <div class="col-md-3">PIN
       PIN:    <asp:TextBox ID="txt_PIN" runat="server" CssClass="form-control" placeholder="PIN"></asp:TextBox>
                </div>
                <div class="col-md-3">
      State :  <asp:DropDownList ID="ddl_state" runat="server" OnTextChanged="ddl_state_TextChanged" AutoPostBack="true" CssClass="form-control"></asp:DropDownList>
                </div>
                <div class="col-md-3">
            District :  <asp:DropDownList ID="ddl_district" runat="server"  CssClass="form-control"></asp:DropDownList>
                </div>
                <div class="col-md-3">
     Contact Person  :    <asp:TextBox ID="txt_contact_person" runat="server" CssClass="form-control" placeholder="Contact Person"></asp:TextBox>
                </div>
                <div class="col-md-3">
       Contact No:    <asp:TextBox ID="txt_Contact_No" runat="server" CssClass="form-control" placeholder="Contact No"></asp:TextBox>
                </div>
                <div class="col-md-3">
       Owner Name:    <asp:TextBox ID="txt_Owner_Name" runat="server" CssClass="form-control" placeholder="Owner Name"></asp:TextBox>
                </div>
                <div class="col-md-3">
      Owner Contact No :    <asp:TextBox ID="txt_Owner_Contact_No" runat="server" CssClass="form-control" placeholder="Owner Contact No"></asp:TextBox>
                </div>
                <div class="col-md-3">
       Id Proof:   <asp:DropDownList ID="ddl_id_proof" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
                <div class="col-md-3">
     Id No *  :    <asp:TextBox ID="txt_Id_No" runat="server" CssClass="form-control" placeholder="Id No"></asp:TextBox>
                </div>
                                <div class="col-md-3">
      Bank Name :    <asp:DropDownList ID="ddl_bank_name" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
                                <div class="col-md-3">
      IFSC Code :    <asp:TextBox ID="txt_IFSC_Code" runat="server" CssClass="form-control" placeholder="IFSC Code"></asp:TextBox>
                </div>
                                <div class="col-md-3">
      Account No :    <asp:TextBox ID="txt_Account_No" runat="server" CssClass="form-control" placeholder="Account No"></asp:TextBox>
                </div>
                                <div class="col-md-3">
    CR/DR   :        <asp:DropDownList ID="ddl_cr_dr" runat="server" CssClass="form-control">
         <asp:ListItem Text="DR" Value="DR" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="CR" Value="CR"></asp:ListItem>
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
                    <div class="box-body" style="overflow: scroll; height: 433px; width: 100%;">
                        <asp:UpdatePanel ID="updt_pnl" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="grdvw_consigner" runat="server" DataKeyNames="id" AutoGenerateColumns="false" CssClass="table table-striped  table-responsive" OnRowEditing="grdvw_consigner_RowEditing">
                                    <Columns>
                                        <asp:TemplateField HeaderText="S.No">
                                            <ItemTemplate>
                                                <%# ((GridViewRow)Container).RowIndex + 1%>
                                                <asp:HiddenField ID="hf" runat="server" Value='<%# Eval("id")%>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Consigner Name">
                                            <ItemTemplate>
                                                <%#Eval("consigner_name") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Email">
                                            <ItemTemplate>
                                                <%#Eval("email_id") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="GST No">
                                            <ItemTemplate>
                                                <%#Eval("gst_no") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Pan No">
                                            <ItemTemplate>
                                                <%#Eval("pan_no") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Pin No">
                                            <ItemTemplate>
                                                <%#Eval("pin_no") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="GST No">
                                            <ItemTemplate>
                                                <%#Eval("gst_no") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Bank Name">
                                            <ItemTemplate>
                                                <%#Eval("bank_name1") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="IFSC">
                                            <ItemTemplate>
                                                <%#Eval("ifsc_code") %>
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
                                                <asp:LinkButton ID="cmdEdit" runat="server"  CommandName="Edit"><i class ="fa fa-edit"></i></asp:LinkButton>
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