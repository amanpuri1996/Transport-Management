using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class District : System.Web.UI.Page
{
    DAL objdal = new DAL();
    BAL objbal = new BAL();
    DTO objdto = new DTO();
   static DataTable dtstatic = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            Bind_state();
            Bind_District();
        }
    }
    public void Bind_District()
    {
        try
        {
            DataSet ds = new DataSet();
            dtstatic = objbal.bind_district(objdto);
            grd_vw.DataSource = dtstatic;
           grd_vw.DataBind();
        }
        catch(Exception excp)
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
        DataTable  dt = new DataTable();
        con.Open();
        sda.Fill(dt);

        if(dt.Rows.Count>0)
        {
            ddl_state.DataSource = dt;
            ddl_state.DataTextField = "state";
            ddl_state.DataValueField = "id";
            ddl_state.DataBind();
            ddl_state.Items.Insert(0,new ListItem("--Select---","0"));
        }

        con.Close();
     
    }
    protected void btn_save_Click(object sender, EventArgs e)
    {
        int x;
        try
        {
            #region Submit
            if (btn_save.Text == "Save / सुरक्षित करें")
            {
                if (ddl_state.SelectedValue == "0")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Select City')", true);

                }
                else
                {
                    objdto.state = ddl_state.SelectedValue.ToString();
                    objdto.district = txt_district_name.Text.ToString();
                    objdto.districk_sortname = txt_district_short_name.Text.ToString();
                    objdto.createddate = DateTime.Now.ToString();
                    x = objbal.insert_district(objdto);
                    if (x != 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Add Successfully');window.location='District.aspx';", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again');window.location='District.aspx';", true);

                    }
                }
            }
            #endregion

            #region Update
            else if (btn_save.Text == "Update")
            {
                if (ddl_state.SelectedValue == "0")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Select City')", true);

                }
                else
                {
                    objdto.updt_id = Convert.ToInt32(hfItemId.Value.ToString());
                    objdto.state = ddl_state.SelectedValue.ToString();
                    objdto.district = txt_district_name.Text.ToString();
                    objdto.districk_sortname = txt_district_short_name.Text.ToString();
                    objdto.createddate = DateTime.Now.ToString();
                    x = objbal.update_district(objdto);
                    if (x != 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Update Successfully');window.location='District.aspx';", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again');window.location='District.aspx';", true);

                    }
                }
            }
            #endregion
        }
        catch (Exception excp)
        {
            throw excp;
        }
    }
  //  protected void grd_vw_RowEditing(object sender, GridViewEditEventArgs e)
    //{
    //    string sid = grd_vw.DataKeys[e.NewEditIndex].Values[0].ToString();
    //    var data = dtstatic.AsEnumerable().Where(a => (a["id"]).Equals(int.Parse(sid))).AsDataView().ToTable();
    //    foreach(DataRow dr in data.Rows)
    //    {
    //        hfItemId.Value = sid;
    //        ddl_state.SelectedValue = dr["state_name"].ToString();
    //        txt_district_name.Text = dr["district"].ToString();
    //        txt_district_short_name.Text = dr["district_sortname"].ToString();
    //        btn_save.Text = "Update";
    //    }
    //}
    protected void cmdEdit_Click(object sender, EventArgs e)
    {
        try
        {
            DataSet ds = new DataSet();
            string id = ((HiddenField)((RepeaterItem)((LinkButton)sender).NamingContainer).FindControl("hf")).Value;
            hfItemId.Value = id;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
            SqlCommand cmd = new SqlCommand("Select * from district where id='" + hfItemId.Value + "'", con);
            cmd.CommandType = CommandType.Text;
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            con.Open();
            sda.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                //  ds = objbal.bind_district(objdto);
               ddl_state.SelectedValue = ds.Tables[0].Rows[0]["state_name"].ToString();
                txt_district_name.Text = ds.Tables[0].Rows[0]["district"].ToString();
                txt_district_short_name.Text = ds.Tables[0].Rows[0]["district_sortname"].ToString();
                btn_save.Text = "Update";
            }
        }
        catch (Exception excp)
        {
            throw excp;
        }
    }
}
