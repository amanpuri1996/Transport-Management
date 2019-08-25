<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Company-Detail.aspx.cs" Inherits="Company_List" %>


<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
    <script type="text/javascript">
        function ShowModal() {

            $('#myModal').modal('show');
        }
        function CloseModalPopUp() {

            $('#myModal').modal('hide');
        }
        function Confirm_Delete() {
            var r = confirm("Are you sure to delete this item.");
            if (r == true) return true;
            else return false;
        }
    </script>
</asp:Content>
<asp:Content ID="cnt" runat="server" ContentPlaceHolderID="footer">
    <div class="row tm-content-row tm-mt-big">
        <div class="box">
            <div class="panel-heading" >
           Comnpany List
                 </div>
             <div class="box-body" style="overflow: scroll; height: 433px;">
                <asp:UpdatePanel ID="updt_pnl" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="grd_cmpny" runat="server" AutoGenerateColumns="false">
                            <Columns>
                               <asp:TemplateField HeaderText="Sr No.">
                                   
                               </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Office_Name">
                                   
                               </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Email Id">
                                   
                               </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Address">
                                   
                               </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <div class="clearfix"></div>
             </div>
            </div>
        </div>
    </asp:Content>