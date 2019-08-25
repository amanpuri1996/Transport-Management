using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class FillingStations : System.Web.UI.Page
{
    DAL objdal = new DAL();
    BAL objbal = new BAL();
    DTO objdto = new DTO();
    static DataTable dtstatic = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bind_grrvw_Fueling();
            Bind_state();
            Bind_Bank_Name();
        }
    }
    public void Bind_grrvw_Fueling()
    {
        try
        {
            dtstatic = objbal.bind_fueling_station(objdto);
            grdvw_fueling.DataSource = dtstatic;
            grdvw_fueling.DataBind();
        }
        catch (Exception excp)
        {
            throw excp;
        }
    }
    public void Bind_Bank_Name()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
        SqlCommand cmd = new SqlCommand("sp_bind_bankname", con);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        con.Open();
        sda.Fill(dt);

        if (dt.Rows.Count > 0)
        {
            ddl_bank_name.DataSource = dt;
            ddl_bank_name.DataTextField = "bank_name";
            ddl_bank_name.DataValueField = "id";
            ddl_bank_name.DataBind();
            // ddl_state.Items.Insert(0, new ListItem("--Select---", "0"));
        }

        con.Close();

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
    protected void ddl_state_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
        SqlCommand cmd = new SqlCommand("Select * from district inner join State on district.state_name=state.id where district.state_name='" + ddl_state.SelectedValue + "'", con);
        cmd.CommandType = CommandType.Text;
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        con.Open();
        sda.Fill(dt);

        if (dt.Rows.Count > 0)
        {
            ddl_district.DataSource = dt;
            ddl_district.Items.Clear();
            ddl_district.Items.Add("--Please Select state--");
            ddl_district.DataTextField = "district";
            ddl_district.DataValueField = "id";
            ddl_district.DataBind();
           // ddl_state.Items.Insert(1, new ListItem("--Select---", "0"));
        }
        else
        {
            ddl_district.Items.Add("--Please Select state--");
        }
        con.Close();
    }
    protected void btn_reset_Click(object sender, EventArgs e)
    {
          Response.Redirect(Request.RawUrl);
    }
    protected void grdvw_fueling_RowEditing(object sender, GridViewEditEventArgs e)
    {
        #region Edit
        string sid = grdvw_fueling.DataKeys[e.NewEditIndex].Values[0].ToString();
        var data = dtstatic.AsEnumerable().Where(a => (a["id"]).Equals(int.Parse(sid))).AsDataView().ToTable();
        foreach (DataRow dr in data.Rows)
        {
            hf_id.Value = sid;
            txt_fueling_Name.Text = dr["fueling_station"].ToString();
            ddl_bank_name.Text = dr["bank_name"].ToString();
            txt_Address.Text = dr["address"].ToString();
            txt_PIN.Text = dr["pin_no"].ToString();
            ddl_state.Text = dr["state"].ToString();
            ddl_district.Text = dr["district"].ToString();
            ddl_bank_name.Text = dr["bank_name"].ToString();
            txt_IFSC_Code.Text = dr["ifsc_code"].ToString();
            txt_Account_No.Text = dr["account_no"].ToString();
            ddl_cr_dr.Text = dr["cr_dr"].ToString();
            txt_Opening_Balance.Text = dr["opening_balance"].ToString();
            btn_save.Text = "Update";
        #endregion
    }
}
    protected void btn_save_Click(object sender, EventArgs e)
    {
        int x;
        try
        {
            #region Save
            if (btn_save.Text == "Save / सुरक्षित करें")
            {
                objdto.Fueling_Station_name = txt_fueling_Name.Text;
                objdto.bank_name = ddl_bank_name.SelectedValue;
                objdto.address = txt_Address.Text;
                objdto.pin_no = txt_PIN.Text;
                objdto.state = ddl_state.SelectedValue;
                objdto.district = ddl_district.SelectedValue;
                objdto.ifsc_code = txt_IFSC_Code.Text;
                objdto.account_no = txt_Account_No.Text;
                objdto.CR_DR = ddl_cr_dr.SelectedValue;
                objdto.opening_balance = txt_Opening_Balance.Text;
                objdto.createddate = DateTime.Now.ToString();

                objdto.createddate = DateTime.Now.ToString();
                x = objbal.insert_fueling_station(objdto);
                if (x != 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Add Successfully');window.location='FillingStations.aspx';", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again');window.location='FillingStations.aspx';", true);

                }
                //}
            }
            #endregion

            #region update
            else if (btn_save.Text == "Update")
            {
                objdto.updt_id = Convert.ToInt32(hf_id.Value.ToString());
                objdto.Fueling_Station_name = txt_fueling_Name.Text;
                objdto.bank_name = ddl_bank_name.SelectedValue;
                objdto.address = txt_Address.Text;
                objdto.pin_no = txt_PIN.Text;
                objdto.state = ddl_state.SelectedValue;
                objdto.district = ddl_district.SelectedValue;
                objdto.ifsc_code = txt_IFSC_Code.Text;
                objdto.account_no = txt_Account_No.Text;
                objdto.CR_DR = ddl_cr_dr.SelectedValue;
                objdto.opening_balance = txt_Opening_Balance.Text;
                objdto.createddate = DateTime.Now.ToString();
                x = objbal.update_fueling_station(objdto);
                if (x != 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Update Successfully');window.location='FillingStations.aspx';", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again');window.location='FillingStations.aspx';", true);

                }
            }
            #endregion
        }
        catch (Exception excp)
        {
            throw excp;
        }
    }
}
