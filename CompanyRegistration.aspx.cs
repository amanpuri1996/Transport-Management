using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class CompanyRegistration : System.Web.UI.Page
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
            Bind_district();
           Bind_company_registration();
        }
    }

    public void Bind_company_registration()
    {
        try
        {
            dtstatic = objbal.bind_company_registration(objdto);
            grdvw_company_registration.DataSource = dtstatic;
            grdvw_company_registration.DataBind();
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
    protected void ddl_state_SelectedIndexChanged(object sender, EventArgs e)
    {
        Bind_district();
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
                if (btn_save.Text == "Submit")
            {
                objdto.office_type = txt_office_type.Text;
                objdto.company_name = txt_Company_Name.Text;
                objdto.email_id = txt_email_id.Text;
                objdto.gst_no = txt_gst_no.Text;
                objdto.pan_no = txt_pan_no.Text;
                objdto.gr_no = txt_gr_no.Text;
                objdto.contact_person = txt_contact_person.Text;
                objdto.contact_no = txt_contact_no.Text;
                objdto.owner_name = txt_owner_name.Text;
                objdto.owner_contact_no = txt_owner_contact_no.Text;
                objdto.address = txt_address.Text;
                objdto.pin_no = txt_pin.Text;
                objdto.state = ddl_state.SelectedValue;
                objdto.district = ddl_district.SelectedValue;
                objdto.createddate = DateTime.Now.ToString();
                x = objbal.insert_company_registration(objdto);
                if (x != 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Add Successfully');window.location='CompanyRegistration.aspx';", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again');window.location='CompanyRegistration.aspx';", true);

                }
                //}
            }
            #endregion

            #region update
            else if (btn_save.Text == "Update")
            {
                objdto.updt_id = Convert.ToInt32(hf_id.Value.ToString());
                objdto.office_type = txt_office_type.Text;
                objdto.company_name = txt_Company_Name.Text;
                objdto.email_id = txt_email_id.Text;
                objdto.gst_no = txt_gst_no.Text;
                objdto.pan_no = txt_pan_no.Text;
                objdto.gr_no = txt_gr_no.Text;
                objdto.contact_person = txt_contact_person.Text;
                objdto.contact_no = txt_contact_no.Text;
                objdto.owner_name = txt_owner_name.Text;
                objdto.owner_contact_no = txt_owner_contact_no.Text;
                objdto.address = txt_address.Text;
                objdto.pin_no = txt_pin.Text;
                objdto.state = ddl_state.SelectedValue;
                objdto.district = ddl_district.SelectedValue;
                objdto.createddate = DateTime.Now.ToString();
                x = objbal.update_company_registration(objdto);
                if (x != 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Update Successfully');window.location='CompanyRegistration.aspx';", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again');window.location='CompanyRegistration.aspx';", true);

                }
            }
            #endregion
        }
        catch (Exception excp)
        {
            throw excp;
        }
    }
    protected void grdvw_company_registration_RowEditing(object sender, GridViewEditEventArgs e)
    {
        #region Edit
        try
        {
            string sid = grdvw_company_registration.DataKeys[e.NewEditIndex].Values[0].ToString();
             DataTable dt = new DataTable();
            objdto.updt_id = Convert.ToInt32(sid.ToString());
            dt = objbal.bind_company_registration(objdto);
            if (dt.Rows.Count > 0)
            {
                ddl_district.SelectedValue = dt.Rows[0]["reg_district"].ToString();
                ddl_state.SelectedValue = dt.Rows[0]["reg_state"].ToString();
                btn_save.Text = "Update";
                /* var data = dtstatic.AsEnumerable().Where(a => (a["id"]).Equals(int.Parse(sid))).AsDataView().ToTable();
                  foreach (DataRow dr in data.Rows)
                   {
                       hf_id.Value = sid;
                       txt_office_type.Text = dr["office_type"].ToString();
                       txt_Company_Name.Text = dr["company_name"].ToString();
                       txt_email_id.Text = dr["email_id"].ToString();
                       txt_gst_no.Text = dr["gst_no"].ToString();
                       txt_pan_no.Text = dr["pan_no"].ToString();
                       txt_gr_no.Text = dr["gr_no"].ToString();
                       txt_contact_person.Text = dr["contact_person"].ToString();
                       txt_contact_no.Text = dr["contact_no"].ToString();
                       txt_owner_name.Text = dr["owner_name"].ToString();
                       txt_owner_contact_no.Text = dr["owner_no"].ToString();
                       txt_address.Text = dr["address"].ToString();
                       txt_pin.Text = dr["pin_no"].ToString();
                       ddl_state.SelectedValue = dr["reg_state"].ToString();
                       ddl_district.SelectedValue = dr["reg_district"].ToString();
                       btn_save.Text = "Update";
                   }*/
            }
        }
        catch (Exception ex)
        {
            lbl_error.Text = ex.Message;
        }
        #endregion
    }
}