using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Consignee : System.Web.UI.Page
{
    DAL objdal = new DAL();
    BAL objbal = new BAL();
    DTO objdto = new DTO();
    static DataTable dtstatic = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bind_Consignee();
            Bind_state();
            Bind_Bank_Name();
            Bind_Id_Proof();
        }
    }
    public void Bind_Consignee()
    {
        try
        {
            dtstatic = objbal.bind_tbl_consignee(objdto);
            grdvw_consignee.DataSource = dtstatic;
            grdvw_consignee.DataBind();
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
    public void Bind_District()
    {


    }
    protected void ddl_state_TextChanged(object sender, EventArgs e)
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
            ddl_district.DataTextField = "district";
            ddl_district.DataValueField = "id";
            ddl_district.DataBind();
            // ddl_state.Items.Insert(0, new ListItem("--Select---", "0"));
        }

        con.Close();
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
    public void Bind_Id_Proof()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
        SqlCommand cmd = new SqlCommand("sp_id_proof", con);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        con.Open();
        sda.Fill(dt);

        if (dt.Rows.Count > 0)
        {
            ddl_id_proof.DataSource = dt;
            ddl_id_proof.DataTextField = "IdProof";
            ddl_id_proof.DataValueField = "id";
            ddl_id_proof.DataBind();
            // ddl_state.Items.Insert(0, new ListItem("--Select---", "0"));
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
                objdto.consignee_name = txt_Consignee_Name.Text;
                objdto.email_id = txt_email_id.Text;
                objdto.gst_no = txt_GST_No.Text;
                objdto.pan_no = txt_PAN_No.Text;
                objdto.address = txt_Address.Text;
                objdto.pin_no = txt_PIN.Text;
                objdto.state = ddl_state.SelectedValue;
                objdto.district = ddl_district.SelectedValue;
                objdto.contact_person = txt_contact_person.Text;
                objdto.contact_no = txt_Contact_No.Text;
                objdto.owner_name = txt_Owner_Name.Text;
                objdto.owner_contact_no = txt_Owner_Contact_No.Text;
                objdto.id_proof = ddl_id_proof.Text;
                objdto.id_no = txt_Id_No.Text;
                objdto.bank_name = ddl_bank_name.SelectedValue;
                objdto.ifsc_code = txt_IFSC_Code.Text;
                objdto.account_no = txt_Account_No.Text;
                objdto.CR_DR = ddl_cr_dr.SelectedValue;
                objdto.opening_balance = txt_Opening_Balance.Text;
                objdto.createddate = DateTime.Now.ToString();
                x = objbal.insert_consignee(objdto);
                if (x != 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Add Successfully');window.location='Consignee.aspx';", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again');window.location='Consignee.aspx';", true);

                }
                //}
            }
            #endregion

            #region update
            else if (btn_save.Text == "Update")
            {
                objdto.updt_id = Convert.ToInt32(hf_id.Value.ToString());
                objdto.consignee_name = txt_Consignee_Name.Text;
                objdto.email_id = txt_email_id.Text;
                objdto.gst_no = txt_GST_No.Text;
                objdto.pan_no = txt_PAN_No.Text;
                objdto.address = txt_Address.Text;
                objdto.pin_no = txt_PIN.Text;
                objdto.state = ddl_state.SelectedValue;
                objdto.district = ddl_district.SelectedValue;
                objdto.contact_person = txt_contact_person.Text;
                objdto.contact_no = txt_Contact_No.Text;
                objdto.owner_name = txt_Owner_Name.Text;
                objdto.owner_contact_no = txt_Owner_Contact_No.Text;
                objdto.id_proof = ddl_id_proof.Text;
                objdto.id_no = txt_Id_No.Text;
                objdto.bank_name = ddl_bank_name.SelectedValue;
                objdto.ifsc_code = txt_IFSC_Code.Text;
                objdto.account_no = txt_Account_No.Text;
                objdto.CR_DR = ddl_cr_dr.SelectedValue;
                objdto.opening_balance = txt_Opening_Balance.Text;
                objdto.createddate = DateTime.Now.ToString();
                x = objbal.update_consignee(objdto);
                if (x != 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Update Successfully');window.location='Consignee.aspx';", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again');window.location='Consignee.aspx';", true);

                }
            }
            #endregion
        }
        catch (Exception excp)
        {
            throw excp;
        }
    }
    protected void grdvw_consigner_RowEditing(object sender, GridViewEditEventArgs e)
    {
        string sid = grdvw_consignee.DataKeys[e.NewEditIndex].Values[0].ToString();
        var data = dtstatic.AsEnumerable().Where(a => (a["id"]).Equals(int.Parse(sid))).AsDataView().ToTable();
        foreach (DataRow dr in data.Rows)
        {
            hf_id.Value = sid;
            txt_Consignee_Name.Text = dr["consignee_name"].ToString();
            txt_email_id.Text = dr["email_id"].ToString();
            txt_GST_No.Text = dr["gst_no"].ToString();
            txt_PAN_No.Text = dr["pan_no"].ToString();
            txt_Address.Text = dr["address"].ToString();
            txt_PIN.Text = dr["pin_no"].ToString();
            ddl_state.Text = dr["state"].ToString();
            ddl_district.Text = dr["district"].ToString();
            txt_contact_person.Text = dr["contact_person"].ToString();
            txt_Contact_No.Text = dr["contact_no"].ToString();
            txt_Owner_Name.Text = dr["owner_name"].ToString();
            txt_Owner_Contact_No.Text = dr["owner_contact_no"].ToString();
            ddl_id_proof.Text = dr["id_proof"].ToString();
            txt_Id_No.Text = dr["id_no"].ToString();
            ddl_bank_name.Text = dr["bank_name"].ToString();
            txt_IFSC_Code.Text = dr["ifsc_code"].ToString();
            txt_Account_No.Text = dr["account_no"].ToString();
            ddl_cr_dr.Text = dr["cr_dr"].ToString();
            txt_Opening_Balance.Text = dr["opening_balance"].ToString();
            btn_save.Text = "Update";
        }

    }
    protected void btn_reset_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }
}