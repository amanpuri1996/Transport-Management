<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminDashboard.aspx.cs" Inherits="Admin_AdminDashboard" MasterPageFile="~/MasterPage.master"%> 
<asp:Content ContentPlaceHolderID="head" ID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <style>
        .small-box{
            height:142px;
        }
       .small-box-footer{
          top:31px;
        }
       .small-box h3 {
             font-size:21px;
            }
        @media only screen and (max-width: 640px) {
            .small-box h3 {
                font-size: 13px;
            }
        }
    </style>
</asp:Content>
<asp:Content ContentPlaceHolderID="footer" ID="cnt" runat="server">
       <div class="row tm-content-row tm-mt-big">
          <div class="col-12">
            <div class="col-lg-3  col-xs-6">
              <!-- small box -->
          <div class="small-box bg-aqua">
                <div class="inner">
                    
                <h3> <asp:Label ID="lbl_mutual_fund" runat="server"></asp:Label></h3>
                 <h3 >
                    District</h3>
                </div>
                <div class="icon">
                  <i class="ion ion-bag"></i>
                </div>
                <asp:LinkButton runat="server" ID="lbtnJobSeeker" PostBackUrl="~/District.aspx" CssClass="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></asp:LinkButton>
              </div>
            </div><!-- ./col -->
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-green">
                <div class="inner">
                  <h3><asp:Label ID="lbl_fds" runat="server"></asp:Label></h3>
                 <h3 >
                    Vehicle</h3>
                </div>
                <div class="icon">
                  <i class="ion ion-stats-bars"></i>
                </div>
                <asp:LinkButton runat="server" ID="lbtnEmployer" PostBackUrl="~/Vehicle.aspx" CssClass="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></asp:LinkButton>
              </div>
            </div><!-- ./col -->
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-yellow">
                <div class="inner">
                  <h3> <asp:Label ID="lbl_equity" runat="server"></asp:Label></h3>
                  <h3 > 
                    Consigner </h3>
                </div>
                <div class="icon">
                  <i class="ion ion-person-add"></i>
                </div>
                <a href="Consigner.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
              </div>
            </div><!-- ./col -->
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-red">
                <div class="inner">
             <h3><asp:Label ID="lbl_nfo" runat="server"></asp:Label></h3>
                  <h3 > 
                   Consignee</h3>
                </div>
                <div class="icon">
                  <i class="ion ion-pie-graph"></i>
                </div>
                <asp:LinkButton runat="server" ID="lbnJobPost" PostBackUrl="~/Consignee.aspx"  CssClass="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></asp:LinkButton>
              </div>
            </div>
                 <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-red">
                <div class="inner">
             <h3>
                  <asp:Label ID="Label1" runat="server"></asp:Label></h3>
                  <h3 > <i class="fa fa-rupee"></i>
                    Total Trip Generated</h3>
                </div>
                <div class="icon">
                  <i class="ion ion-pie-graph"></i>
                </div>
                <asp:LinkButton runat="server" ID="LinkButton1" PostBackUrl="~/Consignee.aspx"  CssClass="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></asp:LinkButton>
              </div>
            </div>
              <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-red">
                <div class="inner">
             <h3>
                  <asp:Label ID="Label2" runat="server"></asp:Label></h3>
                  <h3 > <i class="fa fa-rupee"></i>
                    Total TPT Generate</h3>
                </div>
                <div class="icon">
                  <i class="ion ion-pie-graph"></i>
                </div>
                <asp:LinkButton runat="server" ID="LinkButton2" PostBackUrl="~/Consignee.aspx"  CssClass="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></asp:LinkButton>
              </div>
            </div>
              <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-red">
                <div class="inner">
             <h3>
                  <asp:Label ID="Label3" runat="server"></asp:Label></h3>
                  <h3 > <i class="fa fa-rupee"></i>
                    Total Paid Amount</h3>
                </div>
                <div class="icon">
                  <i class="ion ion-pie-graph"></i>
                </div>
                <asp:LinkButton runat="server" ID="LinkButton3" PostBackUrl="~/Consignee.aspx"  CssClass="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></asp:LinkButton>
              </div>
            </div>
              <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-red">
                <div class="inner">
             <h3>
                  <asp:Label ID="Label4" runat="server"></asp:Label></h3>
                  <h3 > <i class="fa fa-rupee"></i>
                   Total Received Amount</h3>
                </div>
                <div class="icon">
                  <i class="ion ion-pie-graph"></i>
                </div>
                <asp:LinkButton runat="server" ID="LinkButton4" PostBackUrl="~/Consignee.aspx"  CssClass="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></asp:LinkButton>
              </div>
            </div>
          </div><!-- /.row -->
        </div><!-- /.content-wrapper -->
</asp:Content>


