using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class Admin_Login : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);

    public static int count = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Request.QueryString["type"] != null)
        //{
        //    Session.RemoveAll();
        //}
        //if (Session["Adminname"] != null)
        //{
        //    Response.Redirect("AdminDashboard.aspx");
        //}
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try{
        string Username = txtEmail.Text;
        string Password = txtPassword.Text;

        //txtusername.Text = Username;
        //txtpassword.Text = Password;
        SqlCommand cmd = new SqlCommand("sp_login", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@username", Username);
        cmd.Parameters.AddWithValue("@password", Password);
        DataSet ds = new DataSet();
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        con.Open();
        sda.Fill(ds);
        con.Close();
        if (ds.Tables[0].Rows.Count > 0)
        {
            Session["Adminname"] = txtEmail.Text;
            Response.Redirect("AdminDashboard.aspx");
        }
        else
        {
           // lbl_error.Text = "Envalid Username or Password";
            // Response.Redirect(Request.RawUrl);
        }
    }
       catch (Exception ex)
        {
            lblMessage.Text = ex.Message.ToString();
        }
    }
    protected void btnForgot_Click(object sender, EventArgs e)
    {
 
    }
}