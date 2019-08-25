<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Vehicle.aspx.cs" Inherits="Vehicle" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content ID="cnt" runat="server" ContentPlaceHolderID="footer">
    <div class="row tm-content-row tm-mt-big">
        <div class="box">
            <div class="panel-heading" style="background: #0094ff; font-size: 19px;">
                Vehicle Insert / Update
            </div>
            <div class="container">
                <asp:UpdatePanel ID="updt_panel" runat="server">
                    <ContentTemplate>
                <div class="row">
                    <div class="col-md-3">
                        Vehicle OwnerShip :  
                        <asp:DropDownList ID="ddl_vehicle_ownrsip" OnSelectedIndexChanged="ddl_vehicle_ownrsip_SelectedIndexChanged" AutoPostBack="true" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Own" Value="Own" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="On Contract" Value="On Contract"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:HiddenField ID="hf_id" runat="server" />
                    </div>
                    <div class="col-md-3">
                        Vehicle Type *:  
                        <asp:DropDownList ID="ddl_vehicle_type" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Ace" Value="Ace" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="Pickup" Value="Pickup"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-3">
                        Vehicle Number*:   
                        <asp:TextBox ID="txt_Vehicle_Number" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <asp:Panel ID="Panel_ownership" runat="server" Visible="true">
                    <div class="row">
                        <div class="col-md-3">
                            Standard Mileage*:   
                        <asp:TextBox ID="txt_Standard_Mileage" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-3">
                            Vehicle Year *:   
                        <asp:TextBox ID="txt_Vehicle_Year" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-3">
                            Fuel Type*:  
                        <asp:DropDownList ID="ddl_fuel_type" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Diesel" Value="Diesel"></asp:ListItem>
                            <asp:ListItem Text="Petrol" Value="Petrol"></asp:ListItem>
                            <asp:ListItem Text="CNG" Value="CNG"></asp:ListItem>
                            <asp:ListItem Text="CNG & Petrol" Value="CNG & Petrol"></asp:ListItem>
                        </asp:DropDownList>
                        </div>
                        <div class="col-md-3">
                            Vehicle Registered In The Name Of *:   
                        <asp:TextBox ID="txt_vehicle_reg_name" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>

                    </div>
                </asp:Panel>
                <div class="row">
                    <div class="col-md-3">
                        DR/CR *:  
                        <asp:DropDownList ID="ddl_CR_DR" runat="server" CssClass="form-control">
                            <asp:ListItem Text="DR" Value="DR" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="CR" Value="CR"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-3">
                        Opening Balance*:   
                        <asp:TextBox ID="txt_Opening_Balance" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <asp:Panel ID="Panel1_Ownership" runat="server" Visible="true">
                    <div class="panel-body">
                        <p><span>Other detail</span></p>
                        <table class="table table-bordered table-condensed">
                            <thead>
                                <tr>
                                    <th>Insurance Vendor</th>
                                    <th>Agent Name</th>
                                    <th>Contact No.</th>
                                    <th>Insurance Expiring On</th>
                                    <th>R.C Number</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <asp:DropDownList ID="ddl_insurance_vendor" runat="server" CssClass="form-control"></asp:DropDownList>
                                        <asp:Label ID="lbl_ddl_insurance_vendor" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_agent_name" runat="server" CssClass="form-control"></asp:TextBox></td>
                                    <td>
                                        <asp:TextBox ID="txt_contact_number" runat="server" CssClass="form-control"></asp:TextBox></td>
                                    <td>
                                        <asp:TextBox ID="ttx_insurance_expire" runat="server" CssClass="form-control" Placeholder="dd/MM/yyyy"></asp:TextBox>
                                      <%--  <asp:CalendarExtender runat="server" Enabled="True" TargetControlID="ttx_insurance_expire"
                                            ID="txt_start_date_CalendarExtender">
                                        </asp:CalendarExtender>--%>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="r_c_number" runat="server" CssClass="form-control"></asp:TextBox></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </asp:Panel>
                <asp:Button ID="btn_save" runat="server" OnClick="btn_save_Click" CssClass="btn btn-success" Text="Save / सुरक्षित करें" />
                <asp:Button ID="btn_reset" runat="server" CssClass="btn btn-default" OnClick="btn_reset_Click" Text="Reset / हटायें" />
                        </ContentTemplate>
                </asp:UpdatePanel>
                <div class="row">
                    <div class="box-body" style="overflow: scroll; height: 433px; width: 100%;">
                        <asp:UpdatePanel ID="updt_pnl" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="grd_vw" runat="server" DataKeyNames="id" AutoGenerateColumns="false" CssClass="table table-striped  table-responsive" OnRowEditing="grd_vw_RowEditing">
                                    <Columns>
                                        <asp:TemplateField HeaderText="S.No">
                                            <ItemTemplate>
                                                <%# ((GridViewRow)Container).RowIndex + 1%>
                                                <asp:HiddenField ID="hf" runat="server" Value='<%# Eval("id")%>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="vehicle_ownership">
                                            <ItemTemplate>
                                                <%#Eval("vehicle_ownership") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="vehicle_type">
                                            <ItemTemplate>
                                                <%#Eval("vehicle_type") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="fuel_type">
                                            <ItemTemplate>
                                                <%#Eval("fuel_type") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="vehicle_reg">
                                            <ItemTemplate>
                                                <%#Eval("vehicle_reg") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="cr_dr">
                                            <ItemTemplate>
                                                <%#Eval("cr_dr") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="opening_balance">
                                            <ItemTemplate>
                                                <%#Eval("opening_balance") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="agent_name">
                                            <ItemTemplate>
                                                <%#Eval("agent_name") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Insurance_expire">
                                            <ItemTemplate>
                                                <%#Eval("Insurance_expire") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="R_C_no">
                                            <ItemTemplate>
                                                <%#Eval("R_C_no") %>
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