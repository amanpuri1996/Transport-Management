using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class NewTripSheet : System.Web.UI.Page
{ 
    DAL objdal = new DAL();
    BAL objbal = new BAL();
    DTO objdto = new DTO();
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request["type"] == "edit")
            {
                edit_container.Visible = true;
                Bind_Vehicle_Number();
                Bind_Vehicle_Type();
                Bind_Consigner_Name();
                Bind_Location();
                Bind_Cash_ledger();
                Bind_Fuel_Station();
                Bind_Bank_Ledger();
            }
          
            else
            {
                edit_container.Visible = false;
                Bind_Vehicle_Number();
                Bind_Vehicle_Type();
                Bind_Consigner_Name();
                Bind_Location();
                Bind_Cash_ledger();
                Bind_Fuel_Station();
                Bind_Bank_Ledger();
            }
            //if (Session["txt_trip_sheet_no"] != null)
            //{
            //     string edit_trip_id = Session["txt_trip_sheet_no"].ToString();
            //     btn_save.Text = "Update";
            //}
        }
    }
    protected void ddl_Vehicle_OwnerShip_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(ddl_Vehicle_OwnerShip.SelectedValue=="Own")
        {
            pnl_own1.Visible = true;
            pnl_contact1.Visible=false;
        }
        if (ddl_Vehicle_OwnerShip.SelectedValue == "On Contract")
        {
            pnl_own1.Visible = false;
            pnl_contact1.Visible = true;
        }
    }
    public void Bind_Vehicle_Number()
    {
        dt = objbal.bind_vehicle_number(objdto);
        ddl_truck_no.DataSource = dt;
        ddl_truck_no.DataValueField = "vehicle_number";
        ddl_truck_no.DataTextField = "vehicle_number";
        ddl_truck_no.DataBind();
    }
    public void Bind_Vehicle_Type()
    {
        dt = objbal.bind_vehicle_type(objdto);
        ddl_vehicle_type.DataSource = dt;
        ddl_vehicle_type.DataValueField = "vehicle_type";
        ddl_vehicle_type.DataTextField = "vehicle_type";
        ddl_vehicle_type.DataBind();
    }
    public void Bind_Consigner_Name()
    {
        dt = objbal.bind_consigner_name(objdto);
        ddl_Consigner.DataSource = dt;
        ddl_Consigner.DataValueField = "consigner_name";
        ddl_Consigner.DataTextField = "consigner_name";
        ddl_Consigner.DataBind();
    }
    public void Bind_Location()
    {
        dt = objbal.bind_location(objdto);
        ddl_Location.DataSource = dt;
        ddl_Location.DataValueField = "id";
        ddl_Location.DataTextField = "location";
        ddl_Location.DataBind();
    }
    public void Bind_Cash_ledger()
    {
        dt = objbal.bind_cash_ledger(objdto);
        ddl_Cash_Ledger.DataSource = dt;
        ddl_Cash_Ledger.DataValueField = "id";
        ddl_Cash_Ledger.DataTextField = "cash_ledger";
        ddl_Cash_Ledger.DataBind();
    }
    public void Bind_Fuel_Station()
    {
        dt = objbal.bind_fueling_station(objdto);
        ddl_Fueling_Station.DataSource = dt;
        ddl_Fueling_Station.DataValueField = "id";
        ddl_Fueling_Station.DataTextField = "fueling_station";
        ddl_Fueling_Station.DataBind();
    }
    public void Bind_Bank_Ledger()
    {
        dt = objbal.bind_tbl_bank(objdto);
        ddl_Bank_Ledger.DataSource = dt;
        ddl_Bank_Ledger.DataValueField = "id";
        ddl_Bank_Ledger.DataTextField = "bank_name1";
        ddl_Bank_Ledger.DataBind();
    }
    protected void btn_save_vehicle_Click(object sender, EventArgs e)
    {

        int x = 0;

        try
        {
            #region Submit
            if (btn_save.Text == "Save / सुरक्षित करें")
            {
                objdto.vehicle_ownership = ddl_Vehicle_OwnerShip.SelectedValue;
                objdto.vehicle_type = ddl_vehicle_type.SelectedValue;
                objdto.vehicle_number = txt_Vehicle_Number.Text;
                objdto.standard_mileage = string.Empty;
                objdto.vehicle_year = string.Empty;
                objdto.fuel_type = "Diesel";
                objdto.vehicle_registration = string.Empty;
                objdto.CR_DR = "DR";
                objdto.opening_balance = Convert.ToDecimal("11").ToString();
                objdto.Insurance_vendor = "SBI Car Insurance";
                objdto.agent_name = string.Empty;
                objdto.contact_number = string.Empty;
                objdto._Insurance_expire = string.Empty;
                objdto.R_C_no = string.Empty;
                objdto.createddate = DateTime.Now.ToString();
                x = objbal.insert_vehicle(objdto);
                if (x != 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Vehicle Add Successfully');window.location='NewTripSheet.aspx';", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again');window.location='NewTripSheet.aspx';", true);

                }
            }
            #endregion
            #region Update
            else if(btn_save.Text=="Update")
            {

            }
            #endregion
        }
        catch(Exception excp)
        {
            throw excp;
        }
    }
    protected void txt_Commission_TextChanged(object sender, EventArgs e)
    {
       double freight,extrapoint,labour,commision,total;
        double.TryParse(txt_freight.Text,out freight);
        double.TryParse(txt_Extra_Point.Text,out extrapoint);
        double.TryParse( txt_Labour.Text,out labour);
        double.TryParse( txt_Commission.Text,out commision);
       // double.TryParse(txt_Total_Freight.Text,out total);
        total = freight + extrapoint + labour - commision;
        txt_Total_Freight.Text = total.ToString();
        //Convert.ToDecimal(((freight*extrapoint)+(labour*commision),2).ToString());
    }
    protected void txt_freight_TextChanged(object sender, EventArgs e)
    {
        double freight, extrapoint, labour, commision, total;
        double.TryParse(txt_freight.Text, out freight);
        double.TryParse(txt_Extra_Point.Text, out extrapoint);
        double.TryParse(txt_Labour.Text, out labour);
        double.TryParse(txt_Commission.Text, out commision);
        // double.TryParse(txt_Total_Freight.Text,out total);
        total = freight + extrapoint + labour - commision;
        txt_Total_Freight.Text = total.ToString();
    }
    protected void txt_Extra_Point_TextChanged(object sender, EventArgs e)
    {
        double freight, extrapoint, labour, commision, total;
        double.TryParse(txt_freight.Text, out freight);
        double.TryParse(txt_Extra_Point.Text, out extrapoint);
        double.TryParse(txt_Labour.Text, out labour);
        double.TryParse(txt_Commission.Text, out commision);
        // double.TryParse(txt_Total_Freight.Text,out total);
        total = freight + extrapoint + labour - commision;
        txt_Total_Freight.Text = total.ToString();
    }
    protected void txt_Labour_TextChanged(object sender, EventArgs e)
    {
        double freight, extrapoint, labour, commision, total;
        double.TryParse(txt_freight.Text, out freight);
        double.TryParse(txt_Extra_Point.Text, out extrapoint);
        double.TryParse(txt_Labour.Text, out labour);
        double.TryParse(txt_Commission.Text, out commision);
        // double.TryParse(txt_Total_Freight.Text,out total);
        total = freight + extrapoint + labour - commision;
        txt_Total_Freight.Text = total.ToString();
    }
    protected void btn_save_Click(object sender, EventArgs e)
    {
        int x;
        try
        {
            #region Save
            if (btn_save.Text == "Save / सुरक्षित करें")
            {  
                objdto.trip_sheet_no=txt_trip_sheet_no.Text;
                objdto.trip_sheet_date= txt_trip_sheet_date.Text;
                objdto.vehicle_ownership=ddl_Vehicle_OwnerShip.SelectedValue;
                objdto.trip_sheet_truck_number = ddl_truck_no.SelectedValue;
                objdto.driver_name = txt_driver_name.Text;
                objdto.contact_number = txt_Contact_No.Text;
                objdto.consigner_name=ddl_Consigner.SelectedValue;
                objdto.from_location=ddl_Location.SelectedValue;
                objdto.number_of_count = txt_No_Of_Count.Text;
                objdto.freight = Double.Parse(txt_freight.Text).ToString();
                objdto.extra_point = Double.Parse(txt_Extra_Point.Text).ToString();
                objdto.labour = Double.Parse(txt_Labour.Text).ToString();
                objdto.commission = Double.Parse(txt_Commission.Text).ToString();
                objdto.total_freight = Double.Parse(txt_Total_Freight.Text).ToString();
                objdto.Fueling_Station_name = ddl_Fueling_Station.SelectedValue;
                objdto.voucher_number = ttx_Voucher_No.Text;
                objdto.fuel_amount = Double.Parse(txt_fuel_amount.Text).ToString();
                objdto.fuel_quantity = txt_Fuel_Quantity.Text;
                objdto.cash_ledger = ddl_Cash_Ledger.SelectedValue;
                objdto.cash_ledger_amount = txt_Cash_Ledger_Amount.Text;
                objdto.bank_ledger = ddl_Bank_Ledger.SelectedValue;
                objdto.bank_transaction_date =bank_transaction_date.Text;
                objdto.transaction_check_number = txt_Transaction_Cheque_No.Text;
                objdto.payment_type=ddl_Payment_Type.SelectedValue;
                objdto.bank_payment_amount = txt_bank_Amount_by_cash.Text;
                objdto.createddate = DateTime.Now.ToString();
                x = objbal.insert_NewTripSheet(objdto);
                if (x != 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Add Successfully');window.location='NewTripSheet.aspx';", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again');window.location='NewTripSheet.aspx';", true);

                }
                //}
            }
            #endregion

            #region update
            else if (btn_save.Text == "Update")
            {
                objdto.updt_id = Convert.ToInt32(hf_if.Value);
                objdto.trip_sheet_no = txt_trip_sheet_no.Text;
                objdto.trip_sheet_date = txt_trip_sheet_date.Text;
                objdto.vehicle_ownership = ddl_Vehicle_OwnerShip.SelectedValue;
                objdto.trip_sheet_truck_number = ddl_truck_no.SelectedValue;
                objdto.driver_name = txt_driver_name.Text;
                objdto.contact_number = txt_Contact_No.Text;
                objdto.consigner_name = ddl_Consigner.SelectedValue;
                objdto.from_location = ddl_Location.SelectedValue;
                objdto.number_of_count = txt_No_Of_Count.Text;
                objdto.freight = Double.Parse(txt_freight.Text).ToString();
                objdto.extra_point = Double.Parse(txt_Extra_Point.Text).ToString();
                objdto.labour = Double.Parse(txt_Labour.Text).ToString();
                objdto.commission = Double.Parse(txt_Commission.Text).ToString();
                objdto.total_freight = Double.Parse(txt_Total_Freight.Text).ToString();
                objdto.Fueling_Station_name = ddl_Fueling_Station.SelectedValue;
                objdto.voucher_number = ttx_Voucher_No.Text;
                objdto.fuel_amount = Double.Parse(txt_fuel_amount.Text).ToString();
                objdto.fuel_quantity = txt_Fuel_Quantity.Text;
                objdto.cash_ledger = ddl_Cash_Ledger.SelectedValue;
                objdto.cash_ledger_amount = txt_Cash_Ledger_Amount.Text;
                objdto.bank_ledger = ddl_Bank_Ledger.SelectedValue;
                objdto.bank_transaction_date = bank_transaction_date.Text;
                objdto.transaction_check_number = txt_Transaction_Cheque_No.Text;
                objdto.payment_type = ddl_Payment_Type.SelectedValue;
                objdto.bank_payment_amount = txt_bank_Amount_by_cash.Text;
                objdto.createddate = DateTime.Now.ToString();
                x = objbal.update_NewTripSheet(objdto);
                if (x != 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Add Successfully');window.location='NewTripSheet.aspx';", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Try Again');window.location='NewTripSheet.aspx';", true);

                }
                           }
            #endregion
        }
        catch (Exception excp)
        {
            throw excp;
        }
    }
    protected void btn_search_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        try
        {
            cmd = new SqlCommand("Select * from tbl_NewTripSheet where trip_sheet_number='"+txt_search.Text+"'", con);
            cmd.CommandType = CommandType.Text;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            con.Open();
            sda.Fill(dt);
            con.Close();
            if (dt.Rows.Count > 0)
            {
                //Session["txt_trip_sheet_no"] = txt_search.Text;
                hf_if.Value = dt.Rows[0]["id"].ToString();
                txt_trip_sheet_no.Text = dt.Rows[0]["trip_sheet_number"].ToString();
                txt_trip_sheet_date.Text = dt.Rows[0]["trip_sheet_date"].ToString();
                ddl_Vehicle_OwnerShip.SelectedValue = dt.Rows[0]["vehicle_ownership"].ToString();
                ddl_truck_no.SelectedValue = dt.Rows[0]["truck_number"].ToString();
                txt_driver_name.Text = dt.Rows[0]["driver_name"].ToString();
                txt_Contact_No.Text = dt.Rows[0]["contact_number"].ToString();
                ddl_Consigner.SelectedValue = dt.Rows[0]["conigner_name"].ToString();
                ddl_Location.SelectedValue = dt.Rows[0]["from_location"].ToString();
                txt_No_Of_Count.Text = dt.Rows[0]["No_of_count"].ToString();
                txt_freight.Text = dt.Rows[0]["freight"].ToString();
                txt_Extra_Point.Text = dt.Rows[0]["extra_point"].ToString();
                txt_Labour.Text = dt.Rows[0]["labour"].ToString();
                txt_Commission.Text = dt.Rows[0]["commision"].ToString();
                txt_Total_Freight.Text = dt.Rows[0]["total_freight"].ToString();
                ddl_Fueling_Station.SelectedValue = dt.Rows[0]["fueling_station"].ToString();
                ttx_Voucher_No.Text = dt.Rows[0]["voucher_number"].ToString();
                txt_fuel_amount.Text = dt.Rows[0]["fuel_amount"].ToString();
                txt_Fuel_Quantity.Text = dt.Rows[0]["fuel_quantity"].ToString();
                ddl_Cash_Ledger.SelectedValue = dt.Rows[0]["cash_ledger"].ToString();
                txt_Cash_Ledger_Amount.Text = dt.Rows[0]["cash_ledger_amount"].ToString();
                ddl_Bank_Ledger.SelectedValue = dt.Rows[0]["bank_ledger"].ToString();
                bank_transaction_date.Text = dt.Rows[0]["transaction_date"].ToString();
                txt_Transaction_Cheque_No.Text = dt.Rows[0]["transaction_number"].ToString();
                ddl_Payment_Type.SelectedValue = dt.Rows[0]["payment_type"].ToString();
                txt_bank_Amount_by_cash.Text = dt.Rows[0]["payment_amount"].ToString();
              //  Response.Redirect(Request.RawUrl);
                btn_save.Text = "Update";
            }
            else
            {
                Response.Redirect(Request.RawUrl);
            }
        }
        catch (Exception excp)
        {
            throw excp;
        }
    }
    public void Edit_NewTrip_Sheet()
    {
        
    }
}