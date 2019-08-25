using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public class DTO
{
    #region ADD Object

    private int _updt_id;
    public int updt_id { get; set; }

    private string _state;
    public string state { get; set; }

    private string _district;
    public string district { get; set; }

    private string _district_sortname;
    public string districk_sortname { get; set; }

    private string _createddate;
    public string createddate { get; set; }

    private string _vehicle_ownership;
    public string vehicle_ownership { get; set; }

    private string _vehicle_type;
    public string vehicle_type { get; set; }

    private string _vehicle_number;
    public string vehicle_number { get; set; }

    private string _standard_mileage;
    public string standard_mileage { get; set; }

    private string _Insurance_vendor;
    public string Insurance_vendor { get; set; }
    private string _vehicle_year;
    public string vehicle_year { get; set; }

    private string _fuel_type;
    public string  fuel_type{ get; set; }

    private string _vehicle_registration;
    public string  vehicle_registration{ get; set; }

    private string _CR_DR;
    public string  CR_DR{ get; set; }

    private string _opening_balance ;
    public string opening_balance { get; set; }


    private string _agent_name;
    public string agent_name { get; set; }

    private string Insurance_expire;
    public string _Insurance_expire { get; set; }

    private string _contact_number;
    public string contact_number { get; set; }

    private string _R_C_no;
    public string R_C_no { get; set; }

        private string _consigner_name;
    public string  consigner_name { get; set; }

    private string _consignee_name;
    public string consignee_name { get; set; }

    private string _email_id;
    public string  email_id { get; set; }

    private string _gst_no;
    public string  gst_no { get; set; }

    private string _pan_no;
    public string   pan_no{ get; set; }

    private string _address;
    public string  address { get; set; }

    private string _pin_no;
    public string  pin_no { get; set; }

    private string _contact_person;
    public string   contact_person{ get; set; }


        private string _contact_no;
    public string   contact_no{ get; set; }

    private string _owner_name;
    public string  owner_name { get; set; }

    private string _owner_contact_no;
    public string  owner_contact_no { get; set; }

    private string _id_proof;
    public string  id_proof { get; set; }

    private string _id_no; 
    public string   id_no{ get; set; }

    private string _bank_name;
    public string  bank_name { get; set; }

    private string _ifsc_code;
    public string  ifsc_code { get; set; }
    
    private string _account_no;
    public string  account_no { get; set; }

    private string _account_name;
    public string account_name { get; set; }

    private string _Fueling_Station_name;
    public string Fueling_Station_name { get; set; }
    
    private string _office_type;
    public string  office_type{ get; set; }

    private string _company_name;
    public string company_name { get; set; }
    
    private string _gr_no ;
    public string gr_no { get; set; }

    private string _expense_name;
    public string expense_name { get; set; }

    private string _trip_sheet_no;
    public string  trip_sheet_no{ get; set; }

    private string _kilometer;
 public string  kilometer{ get; set; }

    private string _driver_name;
    public string  driver_name{ get; set; }

    private string _from_location;
    public string from_location { get; set; }

    private string _number_of_count;
    public string number_of_count { get; set; }

    private string _freight;
    public string freight { get; set; }

    private string _extra_point;
    public string extra_point { get; set; }

    private string _labour;
    public string labour { get; set; }

    private string _commission;
    public string commission { get; set; }

    private string _total_freight;
    public string total_freight { get; set; }

    private string _voucher_number;
    public string voucher_number { get; set; }

    private string _fuel_quantity;
    public string fuel_quantity { get; set; }

    private string _fuel_amount;
    public string fuel_amount { get; set; }

    private string _cash_ledger;
    public string cash_ledger { get; set; }

    private string _cash_ledger_amount;
    public string cash_ledger_amount { get; set; }

    private string _bank_ledger;
    public string bank_ledger { get; set; }

    private string _transaction_check_number;
    public string transaction_check_number { get; set; }

    private string _bank_ledger_amount;
    public string bank_ledger_amount { get; set; }

    private string _bank_transaction_date;
    public string bank_transaction_date { get; set; }

    private string _trip_sheet_date;
    public string trip_sheet_date { get; set; }

    private string _payment_type;
    public string payment_type { get; set; }

    private string _bank_payment_amount;
    public string bank_payment_amount { get; set; }

    private string _trip_sheet_truck_number;
    public string trip_sheet_truck_number { get; set; }

    /*private string ;
    public string  { get; set; }
    private string ;
    public string  { get; set; }
    private string ;
    public string  { get; set; }
    private string ;
    public string  { get; set; }*/


    #endregion

    public DTO()
    {

    }
}