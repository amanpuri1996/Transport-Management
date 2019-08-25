<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="NewTripSheet.aspx.cs" Inherits="NewTripSheet" %>


<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:Content ID="head" runat="server" ContentPlaceHolderID="head"></asp:Content>
<asp:Content ID="cnt" runat="server" ContentPlaceHolderID="footer">
    <div class="row tm-content-row tm-mt-big">
        <div class="box">
            <div class="panel-heading" style="background: #e46c0a; font-size: 19px;">
                Create New TripSheet
            </div>
            <div class="panel-heading" style="background: #eee;">
                <p>Basic Trip Sheet Details</p>
            </div>
            <div class="clearfix"></div>
            <div class="container" id="edit_container" runat="server" visible="false">
                <asp:UpdatePanel ID="updtpnl_edit" runat="server">
                    <ContentTemplate>
                        <div class="col-md-2">
                            <asp:TextBox ID="txt_search" runat="server" CssClass="form-control" placeholder="Trip Sheet No."></asp:TextBox>
                        </div>

                        <div class="col-md-2">
                            <asp:Button ID="btn_search" runat="server" CssClass="btn btn-secondary" OnClick="btn_search_Click"
                                Text="Search" />
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="clearfix"></div>
            <div class="container">
                <asp:UpdatePanel ID="updt_pnl" runat="server">
                    <ContentTemplate>

                        <div class="row">
                            <div class="col-md-3">
                                Trip Sheet No. *:  
                        <asp:TextBox ID="txt_trip_sheet_no" runat="server" CssClass="form-control" placeholder="Trip Sheet No"></asp:TextBox>
                                <asp:HiddenField ID="hf_if" runat="server" />
                            </div>
                            <div class="col-md-3">
                                Date:   
                        <asp:TextBox ID="txt_trip_sheet_date" runat="server" CssClass="form-control" placeholder="Date"></asp:TextBox>
                              <asp:CalendarExtender runat="server" Enabled="True" TargetControlID="txt_trip_sheet_date"
                                    ID="txt_trip_sheet_date_CalendarExtender"></asp:CalendarExtender>
                            </div>
                    <div class="col-md-3">
                        Vehicle OwnerShip  : 
                        <asp:DropDownList ID="ddl_Vehicle_OwnerShip" OnSelectedIndexChanged="ddl_Vehicle_OwnerShip_SelectedIndexChanged" AutoPostBack="true" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Own" Value="Own" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="On Contract" Value="On Contract"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    </div>
                        <div class="row">
                    <asp:Panel ID="pnl_own1" runat="server" style="width:100%;" Visible="true">
                    <div class="col-md-3">
                        Truck Number:   
                        <asp:DropDownList ID="ddl_truck_no" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="col-md-3">
                        Kilo Meter:   
                        <asp:TextBox ID="txt_kilometer" runat="server" CssClass="form-control" placeholder="Kilo Meter"></asp:TextBox>
                    </div>
                        </asp:Panel>
                            </div>
                            <div class="row">
                    <asp:Panel ID="pnl_contact1" runat="server" style="width:100%;" Visible="false">
                    <div class="col-md-3">
                        Vehicle Type:   
                        <asp:DropDownList ID="ddl_vehicle_type" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="col-md-3">
                        Vehicle Number:   
                        <asp:TextBox ID="txt_Vehicle_Number" runat="server" CssClass="form-control" placeholder="Vehicle Number"></asp:TextBox>
                    </div>
                        <div class="col-md-3"><br />
                       <asp:Button ID="btn_save_vehicle" runat="server" OnClick="btn_save_vehicle_Click" CssClass="btn btn-success" Text="Save Vehicle" />
                    </div>
                        </asp:Panel>
                            </div>
                
                <div class="panel-heading" style="background: #e46c0a; font-size: 19px; color: white;">
                    Driver Details
                </div>
                <div class="row">
                <div class="col-md-3">
       Driver Name:    <asp:TextBox ID="txt_driver_name" runat="server" CssClass="form-control" placeholder="Driver Name"></asp:TextBox>
                </div>
                      
                <div class="col-md-3">
       Contact No:    <asp:TextBox ID="txt_Contact_No" runat="server" CssClass="form-control" placeholder="Contact No"></asp:TextBox>
                </div>
                <div class="col-md-3">
       Consigner :   <asp:DropDownList ID="ddl_Consigner" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
                <div class="col-md-3">
      From Location:    <asp:DropDownList ID="ddl_Location" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
                <div class="col-md-3">
       No. Of Count :<asp:TextBox ID="txt_No_Of_Count" runat="server" CssClass="form-control" placeholder="No. Of Count"></asp:TextBox>
                </div>
                                 </div>
                <%-- <div class="panel-heading" style="background: #e46c0a; font-size: 19px; color: white;">
                    Driver Details
                </div><br />
                       <asp:Button ID="Button2" runat="server" CssClass="btn btn-success" Text="Add" /><br /><br />--%>
                <div class="panel panel-primary">
                    <div class="panel-heading" style="background: #e46c0a;">Freight Details</div>
                    <div class="panel-body">
                        <div class="col-sm-3">
                            <div class="form-group">
                                <label class="control-label circle">Freight*</label>
                                <asp:TextBox ID="txt_freight" runat="server" OnTextChanged="txt_freight_TextChanged" AutoPostBack="true" CssClass="form-control input-circle ng-pristine ng-untouched ng-valid" placeholder="Freight"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txt_freight" SetFocusOnError="true" ValidationExpression="^\d+(\.\d{1,2})?$" runat="server" ErrorMessage="Type Numeric Only"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="form-group">
                                <label class="control-label circle">Extra Point*</label>
                                <asp:TextBox ID="txt_Extra_Point" runat="server" OnTextChanged="txt_Extra_Point_TextChanged" AutoPostBack="true" CssClass="form-control input-circle ng-pristine ng-untouched ng-valid" placeholder="Extra Point"></asp:TextBox>
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator2" SetFocusOnError="true" ControlToValidate="txt_Extra_Point" ValidationExpression="^\d+(\.\d{1,2})?$" runat="server" ErrorMessage="Type Numeric Only"></asp:RegularExpressionValidator>
                           </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="form-group">
                                <label class="control-label circle">Labour*</label>
                                <asp:TextBox ID="txt_Labour" runat="server" OnTextChanged="txt_Labour_TextChanged" AutoPostBack="true" CssClass="form-control input-circle ng-pristine ng-untouched ng-valid" placeholder="Labour"></asp:TextBox>
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="txt_Labour" SetFocusOnError="true" ValidationExpression="^\d+(\.\d{1,2})?$" runat="server" ErrorMessage="Type Numeric Only"></asp:RegularExpressionValidator>
                             </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="form-group">
                                <label class="control-label circle">Commission*</label>
                                <asp:TextBox ID="txt_Commission" runat="server" OnTextChanged="txt_Commission_TextChanged" AutoPostBack="true" CssClass="form-control input-circle ng-pristine ng-untouched ng-valid" placeholder="Commission"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" SetFocusOnError="true" ControlToValidate="txt_Commission" ValidationExpression="^\d+(\.\d{1,2})?$" runat="server" ErrorMessage="Type Numeric Only"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="form-group">
                                <label class="control-label circle">Total Freight*</label>
                                <asp:TextBox ID="txt_Total_Freight" Enabled="false" runat="server" SetFocusOnError="true" CssClass="form-control input-circle ng-pristine ng-untouched ng-valid" placeholder="Total Freight"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel panel-primary">
                                            <div class="panel-heading" style="background: #e46c0a;">Petrol Pump Details</div>
                                            <div class="panel-body">
                                                <div class="col-sm-3">
                                                    <div class="form-group">
                                                        <label class="control-label circle">Fueling Station</label>
                                                        <asp:DropDownList ID="ddl_Fueling_Station" runat="server" CssClass="form-control input-circle ng-pristine ng-untouched ng-valid"></asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="form-group">
                                                        <label class="control-label circle">Voucher No.</label>
                                                         <asp:TextBox ID="ttx_Voucher_No" runat="server" CssClass="form-control input-circle ng-pristine ng-untouched ng-valid" placeholder="Voucher No"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="form-group">
                                                        <label class="control-label circle">Amount</label>
                                                         <asp:TextBox ID="txt_fuel_amount" runat="server" CssClass="form-control input-circle ng-pristine ng-untouched ng-valid" placeholder="Amount"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="form-group">
                                                        <label class="control-label circle">Fuel Quantity(In Ltr.)</label>
                                                         <asp:TextBox ID="txt_Fuel_Quantity" runat="server" CssClass="form-control input-circle ng-pristine ng-untouched ng-valid" placeholder="Fuel Quantity(In Ltr.)"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                 <div class="panel panel-primary">
                                            <div class="panel-heading" style="background: #e46c0a;">Advance Details (By CASH)</div>
                                            <div class="panel-body">
                                                <div class="row">

                                                    <div class="col-sm-3">
                                                        <div class="form-group">
                                                            <label class="control-label">Cash Ledger</label>
                                                       <asp:DropDownList ID="ddl_Cash_Ledger" runat="server" CssClass="form-control input-circle ng-pristine ng-untouched ng-valid"></asp:DropDownList>    
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <div class="form-group">
                                                            <label class="control-label circle">Amount*</label>
                                                             <asp:TextBox ID="txt_Cash_Ledger_Amount" runat="server" CssClass="form-control input-circle ng-pristine ng-untouched ng-valid" placeholder="Amount"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                <div class="panel panel-primary">
                                            <div class="panel-heading" style="background: #e46c0a;">Advance Details (By BANK)</div>
                                            <div class="panel-body">
                                                <div class="row">
                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label class="control-label">Bank Ledger</label>
                                                           <asp:DropDownList ID="ddl_Bank_Ledger" runat="server" CssClass="form-control input-circle ng-pristine ng-untouched ng-valid"></asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label class="control-label circle">Transaction Date</label>
                                                             <asp:TextBox ID="bank_transaction_date" runat="server" CssClass="form-control input-circle ng-pristine ng-untouched ng-valid" placeholder="Freight"></asp:TextBox>
                                                            
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label class="control-label circle">Transaction No./Cheque No.</label>
                                                             <asp:TextBox ID="txt_Transaction_Cheque_No" runat="server" CssClass="form-control input-circle ng-pristine ng-untouched ng-valid" placeholder="Transaction No./Cheque No"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="row">
                                                    <div class="col-sm-4">
                                                        <label class="control-label">Payment Type</label>
                                                         <asp:DropDownList ID="ddl_Payment_Type" runat="server" CssClass="form-control input-circle ng-pristine ng-untouched ng-valid">
                                                             <asp:ListItem Text="CHEQUE" Value="CHEQUE"></asp:ListItem>
                                                             <asp:ListItem Text="NEFT/RTGS" Value="NEFT/RTGS"></asp:ListItem>
                                                             <asp:ListItem Text="INTERNET BANKING" Value="INTERNET BANKING"></asp:ListItem>
                                                         </asp:DropDownList>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label class="control-label circle">Amount</label>
                                                             <asp:TextBox ID="txt_bank_Amount_by_cash" runat="server" CssClass="form-control input-circle ng-pristine ng-untouched ng-valid" placeholder="Amount"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                       <asp:Button ID="btn_save" runat="server" OnClick="btn_save_Click" CssClass="btn btn-success" Text="Save / सुरक्षित करें" />
            <asp:Button ID="Button1" runat="server" CssClass="btn btn-default" Text="Reset / हटायें" />
                        
                    </ContentTemplate>
                </asp:UpdatePanel>
                </div>
            <div class="box-body" >
                <div class="clearfix"></div>
             </div>
            </div>
        </div>
    
    </asp:Content>