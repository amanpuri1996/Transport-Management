using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Loan_Account : System.Web.UI.Page
{
    DAL objdal = new DAL();
    BAL objbal = new BAL();
    DTO objdto = new DTO();
    static DataTable dtstatic = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bind_state();
            Bind_grrvw_Loan_Account();
            Bind_district();     
        }
    }
    public void Bind_grrvw_Loan_Account()
    {
        try
        {
            dtstatic = objbal.bind_loan_account(objdto);
            grdvw_loan_account.DataSource = dtstatic;
            grdvw_loan_account.DataBind();
        }
        catch (Exception excp)
        {
            throw excp;
        }
    }
    public void Bind_state()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
        SqlCommand cmd = new SqlCommand("Select * from state", con);
        cmd.CommandType = CommandType.Text;
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        con.Open();
        sda.Fill(dt);

        if (dt.Rows.Count > 0)
        {
            ddl_state.DataSource = dt;
            ddl_state.DataTextField = "state";
            ddl_state.DataValueField = "id";
            ddl_state.DataBind();
            // ddl_state.Items.Insert(0, new ListItem("--Select---", "0"));
        }

        con.Close();

    }
     public void Bind_district()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
        SqlCommand cmd = new SqlCommand("Select * from district where district.state_name='" + ddl_state.SelectedValue + "'", con);
        cmd.CommandType = CommandType.Text;
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        con.Open();
        sda.Fill(dt);

        if (dt.Rows.Count > 0)
        {
            // ddl_district.Items.Insert(0, new ListItem("--Select--", "0"));
            ddl_district.DataSource = dt;
            ddl_district.DataTextField = "district";
            ddl_district.DataValueField = "id";
            ddl_district.ClearSelection();
            ddl_district.DataBind();
        }
        else
        {
            ddl_district.Items.Clear();
            ddl_district.Items.Insert(0, new ListItem("--Select--", "0"));
           
        }

        con.Close();
    }
    protected void btn_save_Click(object sender, EventArgs e)
    {
        int x;
        try
        {
            #region Save
            if (btn_save.Text == "Save / सुरक्षित करें")
            {
                objdto.account_name = txt_account_Name.Text;
                objdto.address = txt_Address.Text;
                objdto.pin_no = txt_PIN.Text;
                objdto.state = ddl_state.SelectedValue;
                objdto.district = ddl_district.SelectedValue;
                objdto.ifsc_code = txt_IFSC_Code.Text;
                objdto.account_no = txt_Account_No.Text;
                objdto.CR_DR = ddl_cr_dr.SelectedValue;
                objdto.opening_balance = txt_Opening_Balance.Text;
                objdto.createddate = DateTime.Now.ToString();
                x = objbal.insert_loan_account(objdto);
                if (x != 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Add Successfully');window.location='Loan-Account.aspx';", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again');window.location='Loan-Account.aspx';", true);

                }
                //}
            }
            #endregion

            #region update
            else if (btn_save.Text == "Update")
            {
                objdto.updt_id = Convert.ToInt32(hf_id.Value.ToString());
                objdto.account_name = txt_account_Name.Text;
                objdto.address = txt_Address.Text;
                objdto.pin_no = txt_PIN.Text;
                objdto.state = ddl_state.SelectedValue;
                objdto.district = ddl_district.SelectedValue;
                objdto.ifsc_code = txt_IFSC_Code.Text;
                objdto.account_no = txt_Account_No.Text;
                objdto.CR_DR = ddl_cr_dr.SelectedValue;
                objdto.opening_balance = txt_Opening_Balance.Text;
                objdto.createddate = DateTime.Now.ToString();
                x = objbal.update_loan_account(objdto);
                if (x != 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Update Successfully');window.location='Loan-Account.aspx';", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again');window.location='Loan-Account.aspx';", true);

                }
            }
            #endregion
        }
        catch (Exception excp)
        {
            throw excp;
        }
    }
    protected void btn_reset_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }
    protected void grdvw_loan_account_RowEditing(object sender, GridViewEditEventArgs e)
    {
        int x;
        #region Edit
        try
        {
            string sid = grdvw_loan_account.DataKeys[e.NewEditIndex].Values[0].ToString();
            DataTable dt = new DataTable();
            objdto.updt_id = Convert.ToInt32(sid.ToString());
            dt = objbal.edit_loan_account(objdto);
            if(dt.Rows.Count>0)
            {
                hf_id.Value = Convert.ToInt32(sid).ToString();
                txt_account_Name.Text = dt.Rows[0]["account_name"].ToString();
                txt_Address.Text = dt.Rows[0]["address"].ToString();
                txt_PIN.Text = dt.Rows[0]["pin_no"].ToString();
                ddl_state.SelectedValue = dt.Rows[0]["state"].ToString();
                Bind_district();
                ddl_district.SelectedValue = dt.Rows[0]["district"].ToString();
                txt_IFSC_Code.Text = dt.Rows[0]["ifsc_code"].ToString();
                txt_Account_No.Text = dt.Rows[0]["account_no"].ToString();
                ddl_cr_dr.Text = dt.Rows[0]["cr_dr"].ToString();
                txt_Opening_Balance.Text = dt.Rows[0]["opening_balance"].ToString();

                btn_save.Text = "Update";

            }
            //var data = dtstatic.AsEnumerable().Where(a => (a["id"]).Equals(int.Parse(sid))).AsDataView().ToTable();
            //foreach (DataRow dr in data.Rows)
            //{
            //    hf_id.Value = sid;
            //    txt_account_Name.Text = dr["account_name"].ToString();
            //    txt_Address.Text = dr["address"].ToString();
            //    txt_PIN.Text = dr["pin_no"].ToString();
            //    ddl_state.SelectedValue = dr["state"].ToString();
            //    ddl_district.SelectedValue = dr["district"].ToString();
            //    txt_IFSC_Code.Text = dr["ifsc_code"].ToString();
            //    txt_Account_No.Text = dr["account_no"].ToString();
            //    ddl_cr_dr.Text = dr["cr_dr"].ToString();
            //    txt_Opening_Balance.Text = dr["opening_balance"].ToString();
                
            //    btn_save.Text = "Update";
            //}
        }
        catch (Exception excp)
        {
         
            lbl_error.Text = excp.Message;
            //  ClassHelper.ErrorLog(Request.Url.AbsolutePath + " " + excp.Message);
            // lblmsg.Text = ex.ToString();
            // lblmsg.Visible = true;
        }
        #endregion
    }

    protected void ddl_state_SelectedIndexChanged(object sender, EventArgs e)
    {
        Bind_district();
    }
}