<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CompanyRegistration.aspx.cs" Inherits="CompanyRegistration" %>


<asp:Content ID="head" runat="server" ContentPlaceHolderID="head"></asp:Content>
<asp:Content ID="cnt" runat="server" ContentPlaceHolderID="footer">
    <div class="row tm-content-row tm-mt-big">
        <div class="box">
           
            <div class="container">
                <%-- <asp:UpdatePanel ID="update_pnl1" runat="server">
                    <ContentTemplate>--%>
                 <div class="panel-heading" >
           Company Detail
                 </div>
            <div class="row">
                    <div class="col-md-3">
      Office Type :  <asp:TextBox ID="txt_office_type" Enabled="false" runat="server" CssClass="form-control" placeholder="Office Type"></asp:TextBox>
                <asp:HiddenField ID="hf_id" runat="server" />
                    </div>
              
                <div class="col-md-3">
       Company Name:    <asp:TextBox ID="txt_Company_Name" runat="server" CssClass="form-control" placeholder="Company Name" required></asp:TextBox>
                </div>
                <div class="col-md-3">
       Email Id:    <asp:TextBox ID="txt_email_id" runat="server" CssClass="form-control" placeholder="Email_Id" required></asp:TextBox>
                </div>
                <div class="col-md-3">
       GST No:  <asp:TextBox ID="txt_gst_no" runat="server" CssClass="form-control" placeholder="GST No"></asp:TextBox>
                </div>
                <div class="col-md-3">
       PAN No:    <asp:TextBox ID="txt_pan_no" runat="server" CssClass="form-control" placeholder="PAN No"></asp:TextBox>
                </div>
                <div class="col-md-3">
       GR No:    <asp:TextBox ID="txt_gr_no" runat="server" CssClass="form-control" placeholder="GR No"></asp:TextBox>
                </div>
                </div>
                         <div class="panel-heading" >
           Company Person  Detail
                 </div>
                <div class="row">
                <div class="col-md-3">
      Contact Person:    <asp:TextBox ID="txt_contact_person" runat="server" CssClass="form-control" placeholder="Conatct Person"></asp:TextBox>
                </div>
                <div class="col-md-3">
      Contact No:    <asp:TextBox ID="txt_contact_no" runat="server" CssClass="form-control" placeholder="Contact No"></asp:TextBox>
                </div>
                <div class="col-md-3">
       Owner Name:    <asp:TextBox ID="txt_owner_name" runat="server" CssClass="form-control" placeholder="Owner Name"></asp:TextBox>
                </div>
                    <div class="col-md-3">
       Owner Contact No:    <asp:TextBox ID="txt_owner_contact_no" runat="server" CssClass="form-control" placeholder="Owner No"></asp:TextBox>
                </div>
                    </div>
                       <div class="panel-heading" >
           Address  Detail
                 </div>
                <div class="row">
                      <div class="col-md-3">
      Address:    <asp:TextBox ID="txt_address" runat="server" Rows="3" TextMode="MultiLine" CssClass="form-control" placeholder="Address"></asp:TextBox>
                </div>
                      <div class="col-md-3">
      Pin No:    <asp:TextBox ID="txt_pin" runat="server" CssClass="form-control" placeholder="PIN No"></asp:TextBox>
                </div>
                <div class="col-md-3">
      State :  <asp:DropDownList ID="ddl_state" runat="server" OnSelectedIndexChanged="ddl_state_SelectedIndexChanged"  AutoPostBack="true" CssClass="form-control"></asp:DropDownList>
                </div>
                <div class="col-md-3">
            District :  <asp:DropDownList ID="ddl_district"  runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
                </div>
                                <asp:Label ID="lbl_error" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
                       <asp:Button ID="btn_save" runat="server" OnClick="btn_save_Click"  CssClass="btn btn-success" Text="Update" />
            <asp:Button ID="btn_reset" runat="server" OnClick="btn_reset_Click" CssClass="btn btn-default" Text="Reset / हटायें" />
         <%--      </ContentTemplate>
                </asp:UpdatePanel>--%>
               <div class="row">
                    <div class="box-body" >
                        <asp:UpdatePanel ID="updt_pnl" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="grdvw_company_registration" runat="server" DataKeyNames="id" AutoGenerateColumns="false" CssClass="table table-striped  table-responsive" OnRowEditing="grdvw_company_registration_RowEditing">
                                    <Columns>
                                        <asp:TemplateField HeaderText="S.No">
                                            <ItemTemplate>
                                                <%# ((GridViewRow)Container).RowIndex + 1%>
                                                <asp:HiddenField ID="hf" runat="server" Value='<%# Eval("id")%>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Office Type">
                                            <ItemTemplate>
                                                <%#Eval("office_type") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Company Name">
                                            <ItemTemplate>
                                                <%#Eval("company_name") %>
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
                                        <asp:TemplateField HeaderText="PAN No">
                                            <ItemTemplate>
                                                <%#Eval("pan_no") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="GR No">
                                            <ItemTemplate>
                                                <%#Eval("gr_no") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Contact Name">
                                            <ItemTemplate>
                                                <%#Eval("contact_person") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Owner Name">
                                            <ItemTemplate>
                                                <%#Eval("owner_name") %>
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