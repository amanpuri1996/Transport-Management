using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class CashLedger : System.Web.UI.Page
{
    DAL objdal = new DAL();
    BAL objbal = new BAL();
    DTO objdto = new DTO();
    static DataTable dtstatic = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bind_cash_ledger();
        }
    }
    public void Bind_cash_ledger()
    {
        try
        {
            dtstatic = objbal.bind_cash_ledger(objdto);
            grdvw_cash_ledger.DataSource = dtstatic;
            grdvw_cash_ledger.DataBind();
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
    protected void btn_save_Click(object sender, EventArgs e)
    {
        int x;
        try
        {
            #region Save
            if (btn_save.Text == "Save / सुरक्षित करें")
            {
                objdto.cash_ledger = txt_Cash_Ledger_Name.Text;
                objdto.CR_DR = ddl_cr_dr.SelectedValue;
                objdto.opening_balance =txt_Opening_Balance.Text;
                objdto.createddate = DateTime.Now.ToString();
                x = objbal.insert_cash_ledger(objdto);
                if (x != 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Add Successfully');window.location='CashLedger.aspx';", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again');window.location='CashLedger.aspx';", true);

                }
                //}
            }
            #endregion

            #region update
            else if (btn_save.Text == "Update")
            {
                objdto.updt_id = Convert.ToInt32(hf_id.Value.ToString());
                objdto.cash_ledger = txt_Cash_Ledger_Name.Text;
                objdto.CR_DR = ddl_cr_dr.SelectedValue;
                objdto.opening_balance = txt_Opening_Balance.Text;
                objdto.createddate = DateTime.Now.ToString();
                x = objbal.update_cash_ledger(objdto);
                if (x != 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Update Successfully');window.location='CashLedger.aspx';", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again');window.location='CashLedger.aspx';", true);

                }
            }
            #endregion
        }
        catch (Exception excp)
        {
            throw excp;
        }
    }
    protected void grdvw_cash_ledger_RowEditing(object sender, GridViewEditEventArgs e)
    {
        #region Edit
        string sid = grdvw_cash_ledger.DataKeys[e.NewEditIndex].Values[0].ToString();
        var data = dtstatic.AsEnumerable().Where(a => (a["id"]).Equals(int.Parse(sid))).AsDataView().ToTable();
        foreach (DataRow dr in data.Rows)
        {
            hf_id.Value = sid;
            txt_Cash_Ledger_Name.Text = dr["cash_ledger"].ToString();
            ddl_cr_dr.SelectedValue = dr["cr_dr"].ToString();
            txt_Opening_Balance.Text = dr["opening_balance"].ToString();
            btn_save.Text = "Update";
        #endregion
        }
    }
    protected void grdvw_cash_ledger_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int id = 0;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
            id = Convert.ToInt32(grdvw_cash_ledger.DataKeys[e.RowIndex].Value);
            SqlCommand cmd = new SqlCommand("Delete tbl_cash_ledger where id='" + id.ToString() + "'", con);
            cmd.CommandType = CommandType.Text;
            con.Open();
            int x = cmd.ExecuteNonQuery();
            con.Close();
            if (x != 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Delete Successfully');window.location='CashLedger.aspx';", true);
            }
        }
        catch (Exception excp)
        {
            throw excp;
        }
    }
}