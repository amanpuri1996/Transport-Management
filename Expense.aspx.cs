using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Expense : System.Web.UI.Page
{
    DAL objdal = new DAL();
    BAL objbal = new BAL();
    DTO objdto = new DTO();
    static DataTable dtstatic = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bind_expense();
        }
    }
    public void Bind_expense()
    {
        try
        {
            dtstatic = objbal.bind_expense(objdto);
            grdvw_expense.DataSource = dtstatic;
            grdvw_expense.DataBind();
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
                objdto.expense_name = txt_Expense_Name.Text;
                objdto.CR_DR = ddl_cr_dr.SelectedValue;
                objdto.opening_balance = txt_Opening_Balance.Text;
                objdto.createddate = DateTime.Now.ToString();
                x = objbal.insert_expense(objdto);
                if (x != 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Add Successfully');window.location='Expense.aspx';", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again');window.location='Expense.aspx';", true);

                }
                //}
            }
            #endregion

            #region update
            else if (btn_save.Text == "Update")
            {
                objdto.updt_id = Convert.ToInt32(hf_id.Value.ToString());
                objdto.expense_name = txt_Expense_Name.Text;
                objdto.CR_DR = ddl_cr_dr.SelectedValue;
                objdto.opening_balance = txt_Opening_Balance.Text;
                objdto.createddate = DateTime.Now.ToString();
                x = objbal.update_expense(objdto);
                if (x != 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Update Successfully');window.location='Expense.aspx';", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again');window.location='Expense.aspx';", true);

                }
            }
            #endregion
        }
        catch (Exception excp)
        {
            throw excp;
        }
    }
    protected void grdvw_expense_RowEditing(object sender, GridViewEditEventArgs e)
    {
        #region Edit
        string sid = grdvw_expense.DataKeys[e.NewEditIndex].Values[0].ToString();
        var data = dtstatic.AsEnumerable().Where(a => (a["id"]).Equals(int.Parse(sid))).AsDataView().ToTable();
        foreach (DataRow dr in data.Rows)
        {
            hf_id.Value = sid;
            txt_Expense_Name.Text = dr["expense_name"].ToString();
            ddl_cr_dr.SelectedValue = dr["cr_dr"].ToString();
            txt_Opening_Balance.Text = dr["opening_balance"].ToString();
            btn_save.Text = "Update";
        #endregion
        }
    }
}