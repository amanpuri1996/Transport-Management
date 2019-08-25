using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Vehicle : System.Web.UI.Page
{
    DAL objdal = new DAL();
    BAL objbal = new BAL();
    DTO objdto = new DTO();
    static DataTable dtstatic = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bind_Insurance_Vendor();
            Bind_vehicle();
            if (ddl_vehicle_ownrsip.SelectedValue == "Own")
            {
                Panel_ownership.Visible = true;
                Panel1_Ownership.Visible = true;
            }
            else if (ddl_vehicle_ownrsip.SelectedValue == "On Contract")
            {
                Panel_ownership.Visible = false;
                Panel1_Ownership.Visible = false;
            }
        }

    }
    public void Bind_vehicle()
    {
        try
        {
            dtstatic = objbal.bind_tbl_vehicle(objdto);
            grd_vw.DataSource = dtstatic;
            grd_vw.DataBind();
        }
        catch (Exception excp)
        {
            throw excp;
        }
    }
    public void Bind_Insurance_Vendor()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
        SqlCommand cmd = new SqlCommand("Select * from tbl_insurance_vendor", con);
        cmd.CommandType = CommandType.Text;
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        con.Open();
        sda.Fill(dt);

        if (dt.Rows.Count > 0)
        {
            ddl_insurance_vendor.DataSource = dt;
            ddl_insurance_vendor.DataTextField = "insurance_vendor";
            ddl_insurance_vendor.DataValueField = "insurance_vendor";
            ddl_insurance_vendor.DataBind();
         //   ddl_insurance_vendor.Items.Insert(0, new ListItem("--Select---", "0"));
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
                //if (ddl_insurance_vendor.SelectedValue == "0")
                //{
                //    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Select Insurance Vendor')", true);
                //    lbl_ddl_insurance_vendor.Text = "Select Insurance Vendor";
                //}
                //else
                //{
                objdto.vehicle_ownership = ddl_vehicle_ownrsip.SelectedValue;
                objdto.vehicle_type = ddl_vehicle_type.SelectedValue;
                objdto.vehicle_number = txt_Vehicle_Number.Text;
                objdto.standard_mileage = txt_Standard_Mileage.Text;
                objdto.vehicle_year = txt_Vehicle_Year.Text;
                objdto.fuel_type = ddl_fuel_type.SelectedValue;
                objdto.vehicle_registration = txt_vehicle_reg_name.Text;
                objdto.CR_DR = ddl_CR_DR.SelectedValue;
                objdto.opening_balance = txt_Opening_Balance.Text;
                objdto.Insurance_vendor = ddl_insurance_vendor.SelectedValue;
                objdto.agent_name = txt_agent_name.Text;
                objdto.contact_number = txt_contact_number.Text;
                objdto._Insurance_expire = ttx_insurance_expire.Text;
                objdto.R_C_no = r_c_number.Text;
                objdto.createddate = DateTime.Now.ToString();
                x = objbal.insert_vehicle(objdto);
                if (x != 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Add Successfully');window.location='Vehicle.aspx';", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again');window.location='Vehicle.aspx';", true);

                }
                //}
            }
            #endregion 

            #region update
            else if (btn_save.Text == "Update")
            {
                if (ddl_vehicle_ownrsip.SelectedValue == "Own")
                {
                    Panel_ownership.Visible = true;
                    Panel1_Ownership.Visible = true;
                }
                else if (ddl_vehicle_ownrsip.SelectedValue == "On Contract")
                {
                    Panel_ownership.Visible = false;
                    Panel1_Ownership.Visible = false;
                }
                objdto.updt_id = Convert.ToInt32(hf_id.Value.ToString());
                objdto.vehicle_ownership = ddl_vehicle_ownrsip.SelectedValue;
                objdto.vehicle_type = ddl_vehicle_type.SelectedValue;
                objdto.vehicle_number = txt_Vehicle_Number.Text;
                objdto.standard_mileage = txt_Standard_Mileage.Text;
                objdto.vehicle_year = txt_Vehicle_Year.Text;
                objdto.fuel_type = ddl_fuel_type.SelectedValue;
                objdto.vehicle_registration = txt_vehicle_reg_name.Text;
                objdto.CR_DR = ddl_CR_DR.SelectedValue;
                objdto.opening_balance = txt_Opening_Balance.Text;
                objdto.Insurance_vendor = ddl_insurance_vendor.SelectedValue;
                objdto.agent_name = txt_agent_name.Text;
                objdto.contact_number = txt_contact_number.Text;
                objdto._Insurance_expire = ttx_insurance_expire.Text;
                objdto.R_C_no = r_c_number.Text;
                objdto.createddate = DateTime.Now.ToString();
                x = objbal.update_vehicle(objdto);
                if (x != 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Update Successfully');window.location='Vehicle.aspx';", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again');window.location='Vehicle.aspx';", true);

                }
            }
            #endregion
        }
        catch (Exception excp)
        {
            throw excp;
        }
    }
    protected void ddl_vehicle_ownrsip_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddl_vehicle_ownrsip.SelectedValue == "Own")
        {
            Panel_ownership.Visible = true;
            Panel1_Ownership.Visible = true;
        }
        else if (ddl_vehicle_ownrsip.SelectedValue == "On Contract")
        {
            Panel_ownership.Visible = false;
            Panel1_Ownership.Visible = false;
        }
    }
    protected void grd_vw_RowEditing(object sender, GridViewEditEventArgs e)
    {
        string sid = grd_vw.DataKeys[e.NewEditIndex].Values[0].ToString();
        var data = dtstatic.AsEnumerable().Where(a => (a["id"]).Equals(int.Parse(sid))).AsDataView().ToTable();
        foreach (DataRow dr in data.Rows)
        {
            hf_id.Value = sid;
            ddl_vehicle_ownrsip.SelectedValue = dr["vehicle_ownership"].ToString();
            ddl_vehicle_type.SelectedValue = dr["vehicle_type"].ToString();
            txt_Vehicle_Number.Text = dr["vehicle_number"].ToString();
            txt_Standard_Mileage.Text = dr["standard_mileage"].ToString();
            txt_Vehicle_Year.Text = dr["vehicle_year"].ToString();
            ddl_fuel_type.SelectedValue = dr["fuel_type"].ToString();
            txt_vehicle_reg_name.Text = dr["vehicle_reg"].ToString();
            ddl_CR_DR.SelectedValue = dr["cr_dr"].ToString();
            txt_Opening_Balance.Text = dr["opening_balance"].ToString();
            ddl_insurance_vendor.SelectedValue = dr["Insurance_vendor"].ToString();
            txt_agent_name.Text = dr["agent_name"].ToString();
            txt_contact_number.Text = dr["contact_number"].ToString();
            ttx_insurance_expire.Text = dr["Insurance_expire"].ToString();
            r_c_number.Text = dr["R_C_no"].ToString();
            btn_save.Text = "Update";

        }
    }
    
    protected void btn_reset_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }
}