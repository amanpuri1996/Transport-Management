using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public class BAL
{
    DAL objdal = new DAL();

    #region District Insert Update Delete Bind
    public int insert_district(DTO objdto)
    {
        return objdal.Insert_District(objdto);
    }
    public int update_district(DTO objdto)
    {
        return objdal.Update_District(objdto);
    }
    public DataTable bind_district(DTO objdto)
    {
      return  objdal.BindDistrict(objdto);
    }
    #endregion

    #region Vehicle Insert Update Delete Bind
    public int insert_vehicle(DTO objdto)
    {
        return objdal.Insert_Vehicle(objdto);
    }
    public int update_vehicle(DTO objdto)
    {
        return objdal.Update_Vehicle(objdto);
    }
    public DataTable bind_tbl_vehicle(DTO objdto)
    {
        return objdal.Bind_tbl_vehicle(objdto);
    }
    #endregion

    #region Consigner Insert Update Delete Bind
    public int insert_consigner(DTO objdto)
    {
        return objdal.Insert_Consigner(objdto);
    }
    public int update_consigner(DTO objdto)
    {
        return objdal.Update_Consigner(objdto);
    }
    public DataTable bind_tbl_consigner(DTO objdto)
    {
        return objdal.Bind_Consigner(objdto);
    }
    #endregion

    #region Consignee Insert Update Delete Bind
    public int insert_consignee(DTO objdto)
    {
        return objdal.Insert_Consignee(objdto);
    }
    public int update_consignee(DTO objdto)
    {
        return objdal.Update_Consignee(objdto);
    }
    public DataTable bind_tbl_consignee(DTO objdto)
    {
        return objdal.Bind_Consignee(objdto);
    }
    #endregion

    #region Bank Insert Update Delete Bind
    public int insert_bank(DTO objdto)
    {
        return objdal.Insert_Bank(objdto);
    }
    public int update_bank(DTO objdto)
    {
        return objdal.Update_Bank(objdto);
    }
    public DataTable bind_tbl_bank(DTO objdto)
    {
        return objdal.Bind_Bank(objdto);
    }
    #endregion

    #region Fueling Station Insert Update Delete Bind
    public int insert_fueling_station(DTO objdto)
    {
        return objdal.Insert_Fueling_Station(objdto);
    }
    public int update_fueling_station(DTO objdto)
    {
        return objdal.Update_Fueling_Station(objdto);
    }
    public DataTable bind_fueling_station(DTO objdto)
    {
        return objdal.Bind_Fueling_Station(objdto);
    }
    #endregion

    #region Compnay Registration Insert Update Delete Bind
    public int insert_company_registration(DTO objdto)
    {
        return objdal.Insert_Company_Registration(objdto);
    }
    public int update_company_registration(DTO objdto)
    {
        return objdal.Update_Company_Registration(objdto);
    }
    public DataTable bind_company_registration(DTO objdto)
    {
        return objdal.Bind_Company_Registration(objdto);
    }
    #endregion

    #region ExpenseInsert Update Delete Bind
    public int insert_expense(DTO objdto)
    {
        return objdal.Insert_Expense(objdto);
    }
    public int update_expense(DTO objdto)
    {
        return objdal.Update_Expense(objdto);
    }
    public DataTable bind_expense(DTO objdto)
    {
        return objdal.Bind_Expense(objdto);
    }
    #endregion

    #region Cash Ledger Update Delete Bind
    public int insert_cash_ledger(DTO objdto)
    {
        return objdal.Insert_Cash_Ledger(objdto);
    }
    public int update_cash_ledger(DTO objdto)
    {
        return objdal.Update_Cash_Ledger(objdto);
    }
    public int delete_cash_ledger(DTO objdto)
    {
        return objdal.Delete_Cash_Ledger(objdto);
    }
    public DataTable bind_cash_ledger(DTO objdto)
    {
        return objdal.Bind_Cash_Ledger(objdto);
    }
    #endregion

    #region Loan Account Update Delete Bind
    public int insert_loan_account(DTO objdto)
    {
        return objdal.Insert_Loan_Account(objdto);
    }
    public int update_loan_account(DTO objdto)
    {
        return objdal.Update_Loan_Account(objdto);
    }
    public DataTable bind_loan_account(DTO objdto)
    {
        return objdal.Bind_Loan_Account(objdto);
    }
    public DataTable edit_loan_account(DTO objdto)
    {
        return objdal.Edit_Loan_Account(objdto);
    }
    #endregion

    #region Bind Vehicle Number 
    public DataTable bind_vehicle_number(DTO objdto)
    {
        return objdal.Bind_Vehicle_Number(objdto);
    }
    public DataTable bind_vehicle_type(DTO objdto)
    {
        return objdal.Bind_Vehicle_Type(objdto);
    }
    #endregion

    #region Bind Consigner Name
    public DataTable bind_consigner_name(DTO objdto)
    {
        return objdal.Bind_Consigner_Name(objdto);
    }
    public DataTable bind_consignee_name(DTO objdto)
    {
        return objdal.Bind_Consignee_Name(objdto);
    }
    #endregion

    #region NewTripSheet Update Delete Bind
    public int insert_NewTripSheet(DTO objdto)
    {
        return objdal.Insert_NewTripSheet(objdto);
    }
    public int update_NewTripSheet(DTO objdto)
    {
        return objdal.Update_NewTripSheet(objdto);
    }
    public DataTable bind_NewTripSheet(DTO objdto)
    {
        return objdal.Bind_NewTripSheet(objdto);
    }
    public int search_NewTripSheet(DTO objdto)
    {
        return objdal.Search_NewTripSheet(objdto);
    }
    #endregion

    #region Bind Location
    public DataTable bind_location(DTO objdto)
    {
        return objdal.Bind_Location(objdto);
    }
    #endregion


    public BAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}