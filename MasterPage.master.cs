using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_new_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Adminname"] != null)
        {
            Session.Timeout = 60;
        }
        else
        {
            Response.Redirect("login.aspx");
            //lblUserName.Text = Session["Adminname"].ToString();
        }
    }
    protected void btn_logout_Click(object sender, EventArgs e)
    {
        LinkButton lnkbtn = (LinkButton)sender;
        Session.RemoveAll();
        Session.Clear();
        Session.Abandon();
        Response.Redirect("Login.aspx", true);
    }
}
