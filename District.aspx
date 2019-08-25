<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="District.aspx.cs" Inherits="District" %>


<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
    <script type="text/javascript">
        function CheckDropDownList() {
            if (document.getElementById('ddl_state').selectedIndex = "0")
                alert('Please Select City');
        }
</script>
    <style>
        #tbltabcontent_filter input {
            width: 88%;
            padding: 8px;
            border: 1px solid #D1D1D1;
            font-size: 14px;
            color: #666;
            font-style: italic;
        }
        .auto-style1 {
            height: 20px;
        }
        .row{
            width: 100%;
        }
    </style>
    <link href="tabcontent.css" rel="stylesheet" />
    <script src="tabcontent.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css" />
</asp:Content>
<asp:Content ID="cnt" runat="server" ContentPlaceHolderID="footer">
    <div class="row tm-content-row tm-mt-big">
        <div class="box">
            <div class="panel-heading" style="background: #0094ff;    font-size: 19px;">
           District
                 </div>
            <div class="panel-heading" style="background: #eee;">
                <p>List of District</p>
            </div>
            <div class="container">
                  <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                  <ContentTemplate>
            <div class="row">
            <div class="col-md-3">
       State:   <asp:DropDownList ID="ddl_state" runat="server" CssClass="form-control"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="g1"
                       ControlToValidate="ddl_state" ErrorMessage="*" InitialValue="--Select--"></asp:RequiredFieldValidator>
                <asp:HiddenField ID="hfItemId" runat="server" />
                </div>
              <div class="col-md-3">
       District Name:   <asp:TextBox ID="txt_district_name" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
              <div class="col-md-3">
       District Short Name:    <asp:TextBox ID="txt_district_short_name" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                </div>
                   <asp:Button ID="btn_save" runat="server" ValidationGroup="g1" OnClientClick="CheckDropDownList()" OnClick="btn_save_Click" CssClass="btn btn-success" Text="Save / सुरक्षित करें" />
            <asp:Button ID="Button1" runat="server" CssClass="btn btn-default" Text="Reset / हटायें" />
                
            </ContentTemplate>
                      </asp:UpdatePanel>
                
                <div class="panel-heading" style="background: #eee;">
                <p>List of District</p>
            </div>
                </div>
           <div class="container">
          <div class="row">
              <div class="box-body">
              <asp:UpdatePanel ID="updt_pnl" runat="server">
                  <ContentTemplate>
                      <table class="table table-bordered table-striped" id="tbltabcontent">
                                <thead>
                                    <tr>
                                        <th>S.No.</th>
                                        <th style="display:none" >Company Name</th>
                                        <th>Item Name</th>
                                        <th>Qty</th>
                                        <th>Price</th>
                                        <th>In Stock Qty</th>
                                        <th>Inword Date</th>
                                         <th><i style="text-align: center; width: 100%" class="fa fa-edit">
                                              
                                             </i></th>
                                        <th style="display:none"><i style="text-align: center; width: 100%" class="fa fa-remove"></i></i></th>
                                    </tr>
                                </thead>
                                <tbody>
 
                                    <asp:Repeater ID="grd_vw" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td>
                                                    <%# ((RepeaterItem)Container).ItemIndex + 1%>
                                                    <asp:HiddenField ID="hf" runat="server" Value='<%# Eval("id")%>' />
                                                </td>
                                                <td style="display:none">
                                                      <%#Eval("state") %>
                                                </td>
                                                <td>
                                                    <%# Eval("district")%>
                                                </td>
                                                <td>
                                                    <%# Eval("district_sortname")%>
                                                </td>
                                                <td> <%# Eval("created_date")%></td>
                                              <td>
                                                    <%# Eval("state")%>
                                                </td>
                                                <td>
                                                    <%# Eval("district")%>
                                                </td>
                                                <td>
                                          <asp:LinkButton CssClass="edit" ID="cmdEdit" runat="server" ClientIDMode="AutoID" OnClick="cmdEdit_Click">
                                                <i class="fa fa-edit" data-placement="top" title="Edit/View" data-toggle="tooltip"></i></asp:LinkButton></td>
                                                <td style="display:none">
                                            <i class="fa fa-remove" data-placement="top" title="Delete" data-toggle="tooltip"></i>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                </ContentTemplate>
              </asp:UpdatePanel>
                  </div>
               </div>
            </div>
            </div>
        </div>
    <script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#tbltabcontent').DataTable();
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(BindEvents);
        });
    </script>
    <script type="text/javascript">
        function BindEvents() {
            $('#tbltabcontent').DataTable();
        }
    </script>
</asp:Content>