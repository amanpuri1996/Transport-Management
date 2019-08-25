using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public class DAL
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
    SqlCommand cmd;
    SqlDataAdapter sda;
    DataTable dt;



    #region Insert Disrtrict
    public int Insert_District(DTO obj)
    {
        int x = 0;
        try
        {
            cmd = new SqlCommand("sp_insert_district", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@state_name", obj.state);
            cmd.Parameters.AddWithValue("@district", obj.district);
            cmd.Parameters.AddWithValue("@district_sortname", obj.districk_sortname);
            cmd.Parameters.AddWithValue("@created_date", obj.createddate);
            con.Open();
            x = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (Exception excp)
        {
            throw excp;
        }
        return x;
    }
    public int Update_District(DTO obj)
    {
        int x = 0;
        try
        {
            cmd = new SqlCommand("sp_update_district", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", obj.updt_id);
            cmd.Parameters.AddWithValue("@state_name", obj.state);
            cmd.Parameters.AddWithValue("@district", obj.district);
            cmd.Parameters.AddWithValue("@district_sortname", obj.districk_sortname);
            cmd.Parameters.AddWithValue("@created_date", obj.createddate);
            con.Open();
            x = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (Exception excp)
        {
            throw excp;
        }
        return x;
    }
    public DataTable BindDistrict(DTO objdto)
    {

        try
        {
            cmd = new SqlCommand("sp_bind_district", con);
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            con.Open();
            sda.Fill(dt);
            con.Close();
        }
        catch (Exception excp)
        {
            throw excp;
        }
        return dt;
    }
    #endregion

    #region Insert update Bind Vehicle
    public int Insert_Vehicle(DTO obj)
    {
        int x = 0;
        try
        {
            cmd = new SqlCommand("sp_insert_vehicle", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@vehicle_ownership", obj.vehicle_ownership);
            cmd.Parameters.AddWithValue("@vehicle_type", obj.vehicle_type);
            cmd.Parameters.AddWithValue("@vehicle_number", obj.vehicle_number);
            cmd.Parameters.AddWithValue("@standard_mileage", obj.standard_mileage);
            cmd.Parameters.AddWithValue("@vehicle_year", obj.vehicle_year);
            cmd.Parameters.AddWithValue("@fuel_type", obj.fuel_type);
            cmd.Parameters.AddWithValue("@vehicle_reg", obj.vehicle_registration);
            cmd.Parameters.AddWithValue("@cr_dr", obj.CR_DR);
            cmd.Parameters.AddWithValue("@opening_balance", obj.opening_balance);
            cmd.Parameters.AddWithValue("@Insurance_vendor", obj.Insurance_vendor);
            cmd.Parameters.AddWithValue("@agent_name", obj.agent_name);
            cmd.Parameters.AddWithValue("@contact_number", obj.contact_number);
            cmd.Parameters.AddWithValue("@Insurance_expire", obj._Insurance_expire);
            cmd.Parameters.AddWithValue("@R_C_no", obj.R_C_no);
            cmd.Parameters.AddWithValue("@created_date", obj.createddate);
            con.Open();
            x = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (Exception excp)
        {
            throw excp;
        }
        return x;
    }
    public int Update_Vehicle(DTO obj)
    {
        int x = 0;
        try
        {
            cmd = new SqlCommand("sp_update_vehicle", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", obj.updt_id);
            cmd.Parameters.AddWithValue("@vehicle_ownership", obj.vehicle_ownership);
            cmd.Parameters.AddWithValue("@vehicle_type", obj.vehicle_type);
            cmd.Parameters.AddWithValue("@vehicle_number", obj.vehicle_number);
            cmd.Parameters.AddWithValue("@standard_mileage", obj.standard_mileage);
            cmd.Parameters.AddWithValue("@vehicle_year", obj.vehicle_year);
            cmd.Parameters.AddWithValue("@fuel_type", obj.fuel_type);
            cmd.Parameters.AddWithValue("@vehicle_reg", obj.vehicle_registration);
            cmd.Parameters.AddWithValue("@cr_dr", obj.CR_DR);
            cmd.Parameters.AddWithValue("@opening_balance", obj.opening_balance);
            cmd.Parameters.AddWithValue("@Insurance_vendor", obj.Insurance_vendor);
            cmd.Parameters.AddWithValue("@agent_name", obj.agent_name);
            cmd.Parameters.AddWithValue("@contact_number", obj.contact_number);
            cmd.Parameters.AddWithValue("@Insurance_expire", obj._Insurance_expire);
            cmd.Parameters.AddWithValue("@R_C_no", obj.R_C_no);
            cmd.Parameters.AddWithValue("@created_date", obj.createddate);
            con.Open();
            x = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (Exception excp)
        {
            throw excp;
        }
        return x;
    }
    public DataTable Bind_tbl_vehicle(DTO objdto)
    {
        try
        {
            cmd = new SqlCommand("sp_bind_tbl_vehicle", con);
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            con.Open();
            sda.Fill(dt);
            con.Close();
        }
        catch (Exception excp)
        {
            throw excp;
        }
        return dt;
    }
    #endregion

    #region Consigner Insert Update Bind
    public int Insert_Consigner(DTO obj)
    {
        int x = 0;
        try
        {
            cmd = new SqlCommand("sp_insert_Consigner", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@consigner_name", obj.consigner_name);
            cmd.Parameters.AddWithValue("@email_id", obj.email_id);
            cmd.Parameters.AddWithValue("@gst_no", obj.gst_no);
            cmd.Parameters.AddWithValue("@pan_no", obj.pan_no);
            cmd.Parameters.AddWithValue("@address", obj.address);
            cmd.Parameters.AddWithValue("@pin_no", obj.pin_no);
            cmd.Parameters.AddWithValue("@state", obj.state);
            cmd.Parameters.AddWithValue("@district", obj.district);
            cmd.Parameters.AddWithValue("@contact_person", obj.contact_person);
            cmd.Parameters.AddWithValue("@contact_no", obj.contact_no);
            cmd.Parameters.AddWithValue("@owner_name", obj.owner_name);
            cmd.Parameters.AddWithValue("@owner_contact_no", obj.owner_contact_no);
            cmd.Parameters.AddWithValue("@id_proof", obj.id_proof);
            cmd.Parameters.AddWithValue("@id_no", obj.id_no);
            cmd.Parameters.AddWithValue("@bank_name", obj.bank_name);
            cmd.Parameters.AddWithValue("@ifsc_code", obj.ifsc_code);
            cmd.Parameters.AddWithValue("@account_no", obj.account_no);
            cmd.Parameters.AddWithValue("@cr_dr", obj.CR_DR);
            cmd.Parameters.AddWithValue("@opening_balance", obj.opening_balance);
            cmd.Parameters.AddWithValue("@created_date", obj.createddate);         
            con.Open();
            x = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (Exception excp)
        {
            throw excp;
        }
        return x;
    }
    public int Update_Consigner(DTO obj)
    {
        int x = 0;
        try
        {
            cmd = new SqlCommand("sp_update_Consigner", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", obj.updt_id);
            cmd.Parameters.AddWithValue("@consigner_name", obj.consigner_name);
            cmd.Parameters.AddWithValue("@email_id", obj.email_id);
            cmd.Parameters.AddWithValue("@gst_no", obj.gst_no);
            cmd.Parameters.AddWithValue("@pan_no", obj.pan_no);
            cmd.Parameters.AddWithValue("@address", obj.address);
            cmd.Parameters.AddWithValue("@pin_no", obj.pin_no);
            cmd.Parameters.AddWithValue("@state", obj.state);
            cmd.Parameters.AddWithValue("@district", obj.district);
            cmd.Parameters.AddWithValue("@contact_person", obj.contact_person);
            cmd.Parameters.AddWithValue("@contact_no", obj.contact_no);
            cmd.Parameters.AddWithValue("@owner_name", obj.owner_name);
            cmd.Parameters.AddWithValue("@owner_contact_no", obj.owner_contact_no);
            cmd.Parameters.AddWithValue("@id_proof", obj.id_proof);
            cmd.Parameters.AddWithValue("@id_no", obj.id_no);
            cmd.Parameters.AddWithValue("@bank_name", obj.bank_name);
            cmd.Parameters.AddWithValue("@ifsc_code", obj.ifsc_code);
            cmd.Parameters.AddWithValue("@account_no", obj.account_no);
            cmd.Parameters.AddWithValue("@cr_dr", obj.CR_DR);
            cmd.Parameters.AddWithValue("@opening_balance", obj.opening_balance);
            cmd.Parameters.AddWithValue("@created_date", obj.createddate);
            con.Open();
            x = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (Exception excp)
        {
            throw excp;
        }
        return x;
    }
    public DataTable Bind_Consigner(DTO objdto)
    {
        try
        {
            cmd = new SqlCommand("sp_bind_Consigner", con);
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            con.Open();
            sda.Fill(dt);
            con.Close();
        }
        catch (Exception excp)
        {
            throw excp;
        }
        return dt;
    }
    #endregion

    #region Consignee Insert Update Bind
    public int Insert_Consignee(DTO obj)
    {
        int x = 0;
        try
        {
            cmd = new SqlCommand("sp_insert_Consignee", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@consignee_name", obj.consignee_name);
            cmd.Parameters.AddWithValue("@email_id", obj.email_id);
            cmd.Parameters.AddWithValue("@gst_no", obj.gst_no);
            cmd.Parameters.AddWithValue("@pan_no", obj.pan_no);
            cmd.Parameters.AddWithValue("@address", obj.address);
            cmd.Parameters.AddWithValue("@pin_no", obj.pin_no);
            cmd.Parameters.AddWithValue("@state", obj.state);
            cmd.Parameters.AddWithValue("@district", obj.district);
            cmd.Parameters.AddWithValue("@contact_person", obj.contact_person);
            cmd.Parameters.AddWithValue("@contact_no", obj.contact_no);
            cmd.Parameters.AddWithValue("@owner_name", obj.owner_name);
            cmd.Parameters.AddWithValue("@owner_contact_no", obj.owner_contact_no);
            cmd.Parameters.AddWithValue("@id_proof", obj.id_proof);
            cmd.Parameters.AddWithValue("@id_no", obj.id_no);
            cmd.Parameters.AddWithValue("@bank_name", obj.bank_name);
            cmd.Parameters.AddWithValue("@ifsc_code", obj.ifsc_code);
            cmd.Parameters.AddWithValue("@account_no", obj.account_no);
            cmd.Parameters.AddWithValue("@cr_dr", obj.CR_DR);
            cmd.Parameters.AddWithValue("@opening_balance", obj.opening_balance);
            cmd.Parameters.AddWithValue("@created_date", obj.createddate);
            con.Open();
            x = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (Exception excp)
        {
            throw excp;
        }
        return x;
    }
    public int Update_Consignee(DTO obj)
    {
        int x = 0;
        try
        {
            cmd = new SqlCommand("sp_update_Consignee", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", obj.updt_id);
            cmd.Parameters.AddWithValue("@consignee_name", obj.consignee_name);
            cmd.Parameters.AddWithValue("@email_id", obj.email_id);
            cmd.Parameters.AddWithValue("@gst_no", obj.gst_no);
            cmd.Parameters.AddWithValue("@pan_no", obj.pan_no);
            cmd.Parameters.AddWithValue("@address", obj.address);
            cmd.Parameters.AddWithValue("@pin_no", obj.pin_no);
            cmd.Parameters.AddWithValue("@state", obj.state);
            cmd.Parameters.AddWithValue("@district", obj.district);
            cmd.Parameters.AddWithValue("@contact_person", obj.contact_person);
            cmd.Parameters.AddWithValue("@contact_no", obj.contact_no);
            cmd.Parameters.AddWithValue("@owner_name", obj.owner_name);
            cmd.Parameters.AddWithValue("@owner_contact_no", obj.owner_contact_no);
            cmd.Parameters.AddWithValue("@id_proof", obj.id_proof);
            cmd.Parameters.AddWithValue("@id_no", obj.id_no);
            cmd.Parameters.AddWithValue("@bank_name", obj.bank_name);
            cmd.Parameters.AddWithValue("@ifsc_code", obj.ifsc_code);
            cmd.Parameters.AddWithValue("@account_no", obj.account_no);
            cmd.Parameters.AddWithValue("@cr_dr", obj.CR_DR);
            cmd.Parameters.AddWithValue("@opening_balance", obj.opening_balance);
            cmd.Parameters.AddWithValue("@created_date", obj.createddate);
            con.Open();
            x = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (Exception excp)
        {
            throw excp;
        }
        return x;
    }
    public DataTable Bind_Consignee(DTO objdto)
    {
        try
        {
            cmd = new SqlCommand("sp_bind_Consignee", con);
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            con.Open();
            sda.Fill(dt);
            con.Close();
        }
        catch (Exception excp)
        {
            throw excp;
        }
        return dt;
    }
    #endregion

    #region Bank Insert Update Bind
    public int Insert_Bank(DTO obj)
    {
        int x = 0;
        try
        {
            cmd = new SqlCommand("sp_insert_bank", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@bank_name", obj.bank_name);
            cmd.Parameters.AddWithValue("@address", obj.address);
            cmd.Parameters.AddWithValue("@pin_no",obj.pin_no);
            cmd.Parameters.AddWithValue("@state", obj.state);
            cmd.Parameters.AddWithValue("@district", obj.district);
            cmd.Parameters.AddWithValue("@ifsc_code", obj.ifsc_code);
            cmd.Parameters.AddWithValue("@account_no",obj.account_no);
            cmd.Parameters.AddWithValue("@cr_dr", obj.CR_DR);
            cmd.Parameters.AddWithValue("@opening_balance", obj.opening_balance);
            cmd.Parameters.AddWithValue("@created_date", obj.createddate);
            con.Open();
            x = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (Exception excp)
        {
            throw excp;
        }
        return x;
    }
    public int Update_Bank(DTO obj)
    {
        int x = 0;
        try
        {
            cmd = new SqlCommand("sp_update_bank", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", obj.updt_id);
            cmd.Parameters.AddWithValue("@bank_name", obj.bank_name);
            cmd.Parameters.AddWithValue("@address", obj.address);
            cmd.Parameters.AddWithValue("@pin_no", obj.pin_no);
            cmd.Parameters.AddWithValue("@state", obj.state);
            cmd.Parameters.AddWithValue("@district", obj.district);
            cmd.Parameters.AddWithValue("@ifsc_code", obj.ifsc_code);
            cmd.Parameters.AddWithValue("@account_no", obj.account_no);
            cmd.Parameters.AddWithValue("@cr_dr", obj.CR_DR);
            cmd.Parameters.AddWithValue("@opening_balance", obj.opening_balance);
            cmd.Parameters.AddWithValue("@created_date", obj.createddate);

            con.Open();
            x = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (Exception excp)
        {
            throw excp;
        }
        return x;
    }
    public DataTable Bind_Bank(DTO objdto)
    {
        try
        {
            cmd = new SqlCommand("sp_bind_bank", con);
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            con.Open();
            sda.Fill(dt);
            con.Close();
        }
        catch (Exception excp)
        {
            throw excp; 
        }
        return dt;
    }
    #endregion

    #region Fueling Station Insert Update Bind
    public int Insert_Fueling_Station(DTO obj)
    {
        int x = 0;
        try
        {
            cmd = new SqlCommand("sp_insert_fueling", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@fueling_station", obj.Fueling_Station_name);
            cmd.Parameters.AddWithValue("@bank_name", obj.bank_name);
            cmd.Parameters.AddWithValue("@address", obj.address);
            cmd.Parameters.AddWithValue("@pin_no", obj.pin_no);
            cmd.Parameters.AddWithValue("@state", obj.state);
            cmd.Parameters.AddWithValue("@district", obj.district);
            cmd.Parameters.AddWithValue("@ifsc_code", obj.ifsc_code);
            cmd.Parameters.AddWithValue("@account_no", obj.account_no);
            cmd.Parameters.AddWithValue("@cr_dr", obj.CR_DR);
            cmd.Parameters.AddWithValue("@opening_balance", obj.opening_balance);
            cmd.Parameters.AddWithValue("@created_date", obj.createddate);
            con.Open();
            x = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (Exception excp)
        {
            throw excp;
        }
        return x;
    }
    public int Update_Fueling_Station(DTO obj)
    {
        int x = 0;
        try
        {
            cmd = new SqlCommand("sp_update_fueling", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", obj.updt_id);
            cmd.Parameters.AddWithValue("@fueling_station", obj.Fueling_Station_name);
            cmd.Parameters.AddWithValue("@bank_name", obj.bank_name);
            cmd.Parameters.AddWithValue("@address", obj.address);
            cmd.Parameters.AddWithValue("@pin_no", obj.pin_no);
            cmd.Parameters.AddWithValue("@state", obj.state);
            cmd.Parameters.AddWithValue("@district", obj.district);
            cmd.Parameters.AddWithValue("@ifsc_code", obj.ifsc_code);
            cmd.Parameters.AddWithValue("@account_no", obj.account_no);
            cmd.Parameters.AddWithValue("@cr_dr", obj.CR_DR);
            cmd.Parameters.AddWithValue("@opening_balance", obj.opening_balance);
            cmd.Parameters.AddWithValue("@created_date", obj.createddate);

            con.Open();
            x = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (Exception excp)
        {
            throw excp;
        }
        return x;
    }
    public DataTable Bind_Fueling_Station(DTO objdto)
    {
        try
        {
            cmd = new SqlCommand("sp_bind_fueling", con);
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            con.Open();
            sda.Fill(dt);
            con.Close();
        }
        catch (Exception excp)
        {
            throw excp;
        }
        return dt;
    }
    #endregion

    #region Company Registration Insert Update Bind
    public int Insert_Company_Registration(DTO obj)
    {
        int x = 0;
        try
        {
            cmd = new SqlCommand("sp_insert_company_registration", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@office_type", obj.office_type);
            cmd.Parameters.AddWithValue("@company_name", obj.company_name);
            cmd.Parameters.AddWithValue("@email_id", obj.email_id);
            cmd.Parameters.AddWithValue("@gst_no", obj.gst_no);
            cmd.Parameters.AddWithValue("@pan_no", obj.pan_no);
            cmd.Parameters.AddWithValue("@gr_no", obj.gr_no);
            cmd.Parameters.AddWithValue("@contact_person", obj.contact_person);
            cmd.Parameters.AddWithValue("@contact_no", obj.contact_no);
            cmd.Parameters.AddWithValue("@owner_name", obj.owner_name);
            cmd.Parameters.AddWithValue("@owner_no", obj.owner_contact_no);
            cmd.Parameters.AddWithValue("@address", obj.address);
            cmd.Parameters.AddWithValue("@pin_no", obj.pin_no);
            cmd.Parameters.AddWithValue("@state", obj.state);
            cmd.Parameters.AddWithValue("@district", obj.district);
            cmd.Parameters.AddWithValue("@created_date", obj.createddate);

            con.Open();
            x = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (Exception excp)
        {
            throw excp;
        }
        return x;
    }
    public int Update_Company_Registration(DTO obj)
    {
        int x = 0;
        try
        {
            cmd = new SqlCommand("sp_update_company_registration", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", obj.updt_id);
            cmd.Parameters.AddWithValue("@office_type", obj.office_type);
            cmd.Parameters.AddWithValue("@company_name", obj.company_name);
            cmd.Parameters.AddWithValue("@email_id", obj.email_id);
            cmd.Parameters.AddWithValue("@gst_no", obj.gst_no);
            cmd.Parameters.AddWithValue("@pan_no", obj.pan_no);
            cmd.Parameters.AddWithValue("@gr_no", obj.gr_no);
            cmd.Parameters.AddWithValue("@contact_person", obj.contact_person);
            cmd.Parameters.AddWithValue("@contact_no", obj.contact_no);
            cmd.Parameters.AddWithValue("@owner_name", obj.owner_name);
            cmd.Parameters.AddWithValue("@owner_no", obj.owner_contact_no);
            cmd.Parameters.AddWithValue("@address", obj.address);
            cmd.Parameters.AddWithValue("@pin_no", obj.pin_no);
            cmd.Parameters.AddWithValue("@reg_state", obj.state);
            cmd.Parameters.AddWithValue("@reg_district", obj.district);
            cmd.Parameters.AddWithValue("@created_date", obj.createddate);

            con.Open();
            x = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (Exception excp)
        {
            throw excp;
        }
        return x;
    }
    public DataTable Bind_Company_Registration(DTO objdto)
    {
        try
        {
            cmd = new SqlCommand("sp_bind_compnay_registration", con);
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            con.Open();
            sda.Fill(dt);
            con.Close();
        }
        catch (Exception excp)
        {
            throw excp;
        }
        return dt;
    }
    #endregion

    #region Insert Expense
    public int Insert_Expense(DTO obj)
    {
        int x = 0;
        try
        {
            cmd = new SqlCommand("sp_Expense", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "insert");
            cmd.Parameters.AddWithValue("@expense_name", obj.expense_name);
            cmd.Parameters.AddWithValue("@cr_dr", obj.CR_DR);
            cmd.Parameters.AddWithValue("@opening_balance", obj.opening_balance);
            cmd.Parameters.AddWithValue("@created_date", obj.createddate);
            con.Open();
            x = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (Exception excp)
        {
            throw excp;
        }
        return x;
    }
    public int Update_Expense(DTO obj)
    {
        int x = 0;
        try
        {
            cmd = new SqlCommand("sp_Expense", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "update");
            cmd.Parameters.AddWithValue("@id", obj.updt_id);
            cmd.Parameters.AddWithValue("@expense_name", obj.expense_name);
            cmd.Parameters.AddWithValue("@cr_dr", obj.CR_DR);
            cmd.Parameters.AddWithValue("@opening_balance", obj.opening_balance);
            cmd.Parameters.AddWithValue("@created_date", obj.createddate);
            con.Open();
            x = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (Exception excp)
        {
            throw excp;
        }
        return x;
    }
    public DataTable Bind_Expense(DTO objdto)
    {

        try
        {
            cmd = new SqlCommand("sp_Expense", con);
            cmd.Parameters.AddWithValue("@Action", "bind");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            con.Open();
            sda.Fill(dt);
            con.Close();
        }
        catch (Exception excp)
        {
            throw excp;
        }
        return dt;
    }
    #endregion

    #region Cash Ledger Insert Update Delete Bind 
    public int Insert_Cash_Ledger(DTO obj)
    {
        int x = 0;
        try
        {
            cmd = new SqlCommand("sp_cash_ledger", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "insert");
            cmd.Parameters.AddWithValue("@cash_ledger", obj.cash_ledger);
            cmd.Parameters.AddWithValue("@cr_dr", obj.CR_DR);
            cmd.Parameters.AddWithValue("@opening_balance", obj.opening_balance);
            cmd.Parameters.AddWithValue("@created_date", obj.createddate);
            con.Open();
            x = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (Exception excp)
        {
            throw excp;
        }
        return x;
    }
    public int Update_Cash_Ledger(DTO obj)
    {
        int x = 0;
        try
        {
            cmd = new SqlCommand("sp_cash_ledger", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "update");
            cmd.Parameters.AddWithValue("@id", obj.updt_id);
            cmd.Parameters.AddWithValue("@cash_ledger", obj.cash_ledger);
            cmd.Parameters.AddWithValue("@cr_dr", obj.CR_DR);
            cmd.Parameters.AddWithValue("@opening_balance", obj.opening_balance);
            cmd.Parameters.AddWithValue("@created_date", obj.createddate);
            con.Open();
            x = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (Exception excp)
        {
            throw excp;
        }
        return x;
    }
    public DataTable Bind_Cash_Ledger(DTO objdto)
    {

        try
        {
            cmd = new SqlCommand("sp_cash_ledger", con);
            cmd.Parameters.AddWithValue("@Action", "select");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            con.Open();
            sda.Fill(dt);
            con.Close();
        }
        catch (Exception excp)
        {
            throw excp;
        }
        return dt;
    }
    public int Delete_Cash_Ledger(DTO objdto)
    {
        int x = 0;
        try
        {
            cmd = new SqlCommand("sp_cash_ledger", con);
            cmd.Parameters.AddWithValue("@Action", "delete");
            cmd.Parameters.AddWithValue("@id", objdto.updt_id);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            x = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (Exception excp)
        {
            throw excp;
        }
        return x;
    }
    #endregion

    #region Loan Account Insert Update Bind
    public int Insert_Loan_Account(DTO obj)
    {
        int x = 0;
        try
        {
            cmd = new SqlCommand("sp_loan_account", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "insert");
            cmd.Parameters.AddWithValue("@account_name", obj.account_name);
            cmd.Parameters.AddWithValue("@address", obj.address);
            cmd.Parameters.AddWithValue("@pin_no", obj.pin_no);
            cmd.Parameters.AddWithValue("@state", obj.state);
            cmd.Parameters.AddWithValue("@district", obj.district);
            cmd.Parameters.AddWithValue("@ifsc_code", obj.ifsc_code);
            cmd.Parameters.AddWithValue("@account_no", obj.account_no);
            cmd.Parameters.AddWithValue("@cr_dr", obj.CR_DR);
            cmd.Parameters.AddWithValue("@opening_balance", obj.opening_balance);
            cmd.Parameters.AddWithValue("@created_date", obj.createddate);
            con.Open();
            x = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (Exception excp)
        {
            throw excp;
        }
        return x;
    }
    public int Update_Loan_Account(DTO obj)
    {
        int x = 0;
        try
        {
            cmd = new SqlCommand("sp_loan_account", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "update");
            cmd.Parameters.AddWithValue("@id", obj.updt_id);
            cmd.Parameters.AddWithValue("@account_name", obj.bank_name);
            cmd.Parameters.AddWithValue("@address", obj.address);
            cmd.Parameters.AddWithValue("@pin_no", obj.pin_no);
            cmd.Parameters.AddWithValue("@state", obj.state);
            cmd.Parameters.AddWithValue("@district", obj.district);
            cmd.Parameters.AddWithValue("@ifsc_code", obj.ifsc_code);
            cmd.Parameters.AddWithValue("@account_no", obj.account_no);
            cmd.Parameters.AddWithValue("@cr_dr", obj.CR_DR);
            cmd.Parameters.AddWithValue("@opening_balance", obj.opening_balance);
            cmd.Parameters.AddWithValue("@created_date", obj.createddate);

            con.Open();
            x = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (Exception excp)
        {
            throw excp;
        }
        return x;
    }
    public DataTable Edit_Loan_Account(DTO objdto)
    {
        try
        {
            cmd = new SqlCommand("sp_loan_account", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "edit");
            cmd.Parameters.AddWithValue("@id", objdto.updt_id);
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            con.Open();
            sda.Fill(dt);
            con.Close();
        }
        catch (Exception excp)
        {
            throw excp;
        }
        return dt;
    }
    public DataTable Bind_Loan_Account(DTO objdto)
    {
        try
        {
            cmd = new SqlCommand("sp_loan_account", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "select");
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            con.Open();
            sda.Fill(dt);
            con.Close();
        }
        catch (Exception excp)
        {
            throw excp;
        }
        return dt;
    }
    #endregion

    #region Bind Vehicle Number
    public DataTable Bind_Vehicle_Number(DTO objdto)
    {
        try
        {
            cmd = new SqlCommand("sp_vehicle_number", con);
            cmd.CommandType = CommandType.StoredProcedure;
           // cmd.Parameters.AddWithValue("@Action", "select");
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            con.Open();
            sda.Fill(dt);
            con.Close();
        }
        catch (Exception excp)
        {
            throw excp;
        }
        return dt;
    }
    #endregion

    #region Bind Vehicle Type
    public DataTable Bind_Vehicle_Type(DTO objdto)
    {
        try
        {
            cmd = new SqlCommand("sp_vehicle_type", con);
            cmd.CommandType = CommandType.StoredProcedure;
            // cmd.Parameters.AddWithValue("@Action", "select");
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            con.Open();
            sda.Fill(dt);
            con.Close();
        }
        catch (Exception excp)
        {
            throw excp;
        }
        return dt;
    }
    #endregion

    #region Bind Consigner Name
    public DataTable Bind_Consigner_Name(DTO objdto)
    {
        try
        {
            cmd = new SqlCommand("sp_Consigner_Name", con);
            cmd.CommandType = CommandType.StoredProcedure;
            // cmd.Parameters.AddWithValue("@Action", "select");
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            con.Open();
            sda.Fill(dt);
            con.Close();
        }
        catch (Exception excp)
        {
            throw excp;
        }
        return dt;
    }
    public DataTable Bind_Consignee_Name(DTO objdto)
    {
        try
        {
            cmd = new SqlCommand("sp_Consignee_Name", con);
            cmd.CommandType = CommandType.StoredProcedure;
            // cmd.Parameters.AddWithValue("@Action", "select");
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            con.Open();
            sda.Fill(dt);
            con.Close();
        }
        catch (Exception excp)
        {
            throw excp;
        }
        return dt;
    }
    #endregion

    #region Bind Location
    public DataTable Bind_Location(DTO objdto)
    {
        try
        {
            cmd = new SqlCommand("sp_location", con);
            cmd.CommandType = CommandType.StoredProcedure;
            // cmd.Parameters.AddWithValue("@Action", "select");
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            con.Open();
            sda.Fill(dt);
            con.Close();
        }
        catch (Exception excp)
        {
            throw excp;
        }
        return dt;
    }
    #endregion

    #region NewTripSheet Insert Update Bind
    public int Insert_NewTripSheet(DTO obj)
    {
        int x = 0;
        try
        {
            cmd = new SqlCommand("sp_NewTripSheet", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "insert");
            cmd.Parameters.AddWithValue("@trip_sheet_number", obj.trip_sheet_no);
            cmd.Parameters.AddWithValue("@trip_sheet_date", obj.trip_sheet_date);
            cmd.Parameters.AddWithValue("@vehicle_ownership", obj.vehicle_ownership);
            cmd.Parameters.AddWithValue("@truck_number", obj.trip_sheet_truck_number);
            cmd.Parameters.AddWithValue("@driver_name", obj.driver_name);
            cmd.Parameters.AddWithValue("@contact_number", obj.contact_number);
            cmd.Parameters.AddWithValue("@conigner_name", obj.consigner_name);
            cmd.Parameters.AddWithValue("@from_location", obj.from_location);
            cmd.Parameters.AddWithValue("@No_of_count", obj.number_of_count);
            cmd.Parameters.AddWithValue("@freight", obj.freight);
            cmd.Parameters.AddWithValue("@extra_point", obj.extra_point);
            cmd.Parameters.AddWithValue("@labour", obj.labour);
            cmd.Parameters.AddWithValue("@commision", obj.commission);
            cmd.Parameters.AddWithValue("@total_freight", obj.total_freight);
            cmd.Parameters.AddWithValue("@fueling_station", obj.Fueling_Station_name);
            cmd.Parameters.AddWithValue("@voucher_number", obj.voucher_number);
            cmd.Parameters.AddWithValue("@fuel_amount", obj.fuel_amount);
            cmd.Parameters.AddWithValue("@fuel_quantity", obj.fuel_quantity);
            cmd.Parameters.AddWithValue("@cash_ledger", obj.cash_ledger);
            cmd.Parameters.AddWithValue("@cash_ledger_amount", obj.cash_ledger_amount);
            cmd.Parameters.AddWithValue("@bank_ledger", obj.bank_ledger);
            cmd.Parameters.AddWithValue("@transaction_date", obj.bank_transaction_date);
            cmd.Parameters.AddWithValue("@transaction_number", obj.transaction_check_number);
            cmd.Parameters.AddWithValue("@payment_type", obj.payment_type);
            cmd.Parameters.AddWithValue("@payment_amount", obj.bank_payment_amount);
            cmd.Parameters.AddWithValue("@created_date", obj.createddate);
            con.Open();
            x = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (Exception excp)
        {
            throw excp;
        }
        return x;
    }
    public int Update_NewTripSheet(DTO obj)
    {
        int x = 0;
        try
        {
            cmd = new SqlCommand("sp_NewTripSheet", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "update");
            cmd.Parameters.AddWithValue("@id", obj.updt_id);
            cmd.Parameters.AddWithValue("@trip_sheet_number", obj.trip_sheet_no);
            cmd.Parameters.AddWithValue("@trip_sheet_date", obj.trip_sheet_date);
            cmd.Parameters.AddWithValue("@vehicle_ownership", obj.vehicle_ownership);
            cmd.Parameters.AddWithValue("@truck_number", obj.trip_sheet_truck_number);
            cmd.Parameters.AddWithValue("@driver_name", obj.driver_name);
            cmd.Parameters.AddWithValue("@contact_number", obj.contact_number);
            cmd.Parameters.AddWithValue("@conigner_name", obj.consigner_name);
            cmd.Parameters.AddWithValue("@from_location", obj.from_location);
            cmd.Parameters.AddWithValue("@No_of_count", obj.number_of_count);
            cmd.Parameters.AddWithValue("@freight", obj.freight);
            cmd.Parameters.AddWithValue("@extra_point", obj.extra_point);
            cmd.Parameters.AddWithValue("@labour", obj.labour);
            cmd.Parameters.AddWithValue("@commision", obj.commission);
            cmd.Parameters.AddWithValue("@total_freight", obj.total_freight);
            cmd.Parameters.AddWithValue("@fueling_station", obj.Fueling_Station_name);
            cmd.Parameters.AddWithValue("@voucher_number", obj.voucher_number);
            cmd.Parameters.AddWithValue("@fuel_amount", obj.fuel_amount);
            cmd.Parameters.AddWithValue("@fuel_quantity", obj.fuel_quantity);
            cmd.Parameters.AddWithValue("@cash_ledger", obj.cash_ledger);
            cmd.Parameters.AddWithValue("@cash_ledger_amount", obj.cash_ledger_amount);
            cmd.Parameters.AddWithValue("@bank_ledger", obj.bank_ledger);
            cmd.Parameters.AddWithValue("@transaction_date", obj.bank_transaction_date);
            cmd.Parameters.AddWithValue("@transaction_number", obj.transaction_check_number);
            cmd.Parameters.AddWithValue("@payment_type", obj.payment_type);
            cmd.Parameters.AddWithValue("@payment_amount", obj.bank_payment_amount);
            cmd.Parameters.AddWithValue("@created_date", obj.createddate);
            con.Open();
            x = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (Exception excp)
        {
            throw excp;
        }
        return x;
    }
    public DataTable Bind_NewTripSheet(DTO objdto)
    {
        try
        {
            cmd = new SqlCommand("sp_NewTripSheet", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "select");
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            con.Open();
            sda.Fill(dt);
            con.Close();
        }
        catch (Exception excp)
        {
            throw excp;
        }
        return dt;
    }
    
    public int Search_NewTripSheet(DTO obj)
    {
        int x = 0;
        try
        {
            cmd = new SqlCommand("sp_NewTripSheet", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "search");
            cmd.Parameters.AddWithValue("@trip_sheet_number", obj.trip_sheet_no);
            cmd.Parameters.AddWithValue("@trip_sheet_date", obj.trip_sheet_date);
            cmd.Parameters.AddWithValue("@vehicle_ownership", obj.vehicle_ownership);
            cmd.Parameters.AddWithValue("@truck_number", obj.trip_sheet_no);
            cmd.Parameters.AddWithValue("@driver_name", obj.driver_name);
            cmd.Parameters.AddWithValue("@contact_number", obj.contact_number);
            cmd.Parameters.AddWithValue("@conigner_name", obj.consigner_name);
            cmd.Parameters.AddWithValue("@from_location", obj.from_location);
            cmd.Parameters.AddWithValue("@No_of_count", obj.number_of_count);
            cmd.Parameters.AddWithValue("@freight", obj.freight);
            cmd.Parameters.AddWithValue("@extra_point", obj.extra_point);
            cmd.Parameters.AddWithValue("@labour", obj.labour);
            cmd.Parameters.AddWithValue("@commision", obj.commission);
            cmd.Parameters.AddWithValue("@total_freight", obj.total_freight);
            cmd.Parameters.AddWithValue("@fueling_station", obj.Fueling_Station_name);
            cmd.Parameters.AddWithValue("@voucher_number", obj.voucher_number);
            cmd.Parameters.AddWithValue("@fuel_amount", obj.fuel_amount);
            cmd.Parameters.AddWithValue("@fuel_quantity", obj.fuel_quantity);
            cmd.Parameters.AddWithValue("@cash_ledger", obj.cash_ledger);
            cmd.Parameters.AddWithValue("@cash_ledger_amount", obj.cash_ledger_amount);
            cmd.Parameters.AddWithValue("@bank_ledger", obj.bank_ledger);
            cmd.Parameters.AddWithValue("@transaction_date", obj.bank_transaction_date);
            cmd.Parameters.AddWithValue("@transaction_number", obj.transaction_check_number);
            cmd.Parameters.AddWithValue("@payment_type", obj.payment_type);
            cmd.Parameters.AddWithValue("@payment_amount", obj.bank_payment_amount);
            cmd.Parameters.AddWithValue("@created_date", obj.createddate);
            con.Open();
            x = cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (Exception excp)
        {
            throw excp;
        }
        return x;
    }
    #endregion
    public DAL()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}

