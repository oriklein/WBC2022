using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace ISCRegDAL
{
    public class BOUserServices
    {
        Database dbase;
        DbCommand dbcmd;
        public BOUserServices()
        {
            dbase = DatabaseFactory.CreateDatabase("NEWCFNSDB");
        }
        public void Attendee_Add(int paymentid, string firstname, string lastname, string organization, string title, string emailId, string phone, string phex, string Country, string otherCountry, string state, string otherstate, string attendeType, string address, string otheraddress, string city, string zip)
        {
            dbcmd = dbase.GetStoredProcCommand("IRa_Tbl_AttendeeInformations");
            dbase.AddInParameter(dbcmd, "@paymentid", DbType.Int32, paymentid);
            dbase.AddInParameter(dbcmd, "@FirstName", DbType.String, firstname);
            dbase.AddInParameter(dbcmd, "@LastName", DbType.String, lastname);
            dbase.AddInParameter(dbcmd, "@Organization", DbType.String, organization);
            dbase.AddInParameter(dbcmd, "@Title", DbType.String, title);
            dbase.AddInParameter(dbcmd, "@EmailID", DbType.String, emailId);
            dbase.AddInParameter(dbcmd, "@Phone", DbType.String, phone);
            dbase.AddInParameter(dbcmd, "@Ph_Ex", DbType.String, phex);
            dbase.AddInParameter(dbcmd, "@AttendeeType", DbType.String, attendeType);
            dbase.AddInParameter(dbcmd, "@Address", DbType.String, address);
            dbase.AddInParameter(dbcmd, "@Address2", DbType.String, otheraddress);
            dbase.AddInParameter(dbcmd, "@City", DbType.String, city);
            dbase.AddInParameter(dbcmd, "@State", DbType.String, state);
            dbase.AddInParameter(dbcmd, "@OtherState", DbType.String, otherstate);
            dbase.AddInParameter(dbcmd, "@Zip", DbType.String, zip);
            dbase.AddInParameter(dbcmd, "@Country", DbType.String, Country);
            dbase.AddInParameter(dbcmd, "@OtherCountry", DbType.String, otherCountry);
            dbase.ExecuteNonQuery(dbcmd);
        }

        public DataTable get_AllAttendees()
        {
            dbcmd = dbase.GetStoredProcCommand("Get_All_Attendees_SP");
            return dbase.ExecuteDataSet(dbcmd).Tables[0];
        }
        public DataTable get_AllSohnPartners()
        {
            dbcmd = dbase.GetStoredProcCommand("usp_get_all_sohn_partners");
            return dbase.ExecuteDataSet(dbcmd).Tables[0];
        }

        public void Change_ContributorChequeStatus(int payid, bool status, string chequeNum)
        {

            dbcmd = dbase.GetStoredProcCommand("FA_Change_ContributorCheque_Status_SP");

            dbase.AddInParameter(dbcmd, "@IN_Payid", DbType.Int32, payid);

            dbase.AddInParameter(dbcmd, "@IN_Status", DbType.Boolean, status);

            dbase.AddInParameter(dbcmd, "@IN_ChequeNum", DbType.String, chequeNum);

            dbase.ExecuteNonQuery(dbcmd);



        }



        public DataTable get_AllContributor_PaymentStatus()
        {
            dbcmd = dbase.GetStoredProcCommand("Get_All_Contributors_SP");
            return dbase.ExecuteDataSet(dbcmd).Tables[0];
        }



        public void ContributorInfo_Insert(ref int OutId, double amt, string cheqnum, string fname, string lname, string company, string title, string email, string ph, string ext, string adr1, string adr2, string country, string state, string city, string otherCountry, string otherState, string Zip, string type, string ConfirmNum, string ContributorType)
        {

            //int OutId;
            // OutId = 0;

            dbcmd = dbase.GetStoredProcCommand("IRA_Insert_ContCheque_SP");
            dbase.AddInParameter(dbcmd, "@IN_FirstName", DbType.String, fname);
            dbase.AddInParameter(dbcmd, "@IN_LastName", DbType.String, lname);
            dbase.AddInParameter(dbcmd, "@IN_CompanyName", DbType.String, company);
            dbase.AddInParameter(dbcmd, "@IN_Title", DbType.String, title);
            dbase.AddInParameter(dbcmd, "@IN_Email", DbType.String, email);
            dbase.AddInParameter(dbcmd, "@IN_Phone", DbType.String, ph);
            dbase.AddInParameter(dbcmd, "@IN_Extension", DbType.String, ext);
            dbase.AddInParameter(dbcmd, "@IN_Address1", DbType.String, adr1);
            dbase.AddInParameter(dbcmd, "@IN_Address2", DbType.String, adr2);
            dbase.AddInParameter(dbcmd, "@IN_Country", DbType.String, country);
            dbase.AddInParameter(dbcmd, "@IN_City", DbType.String, city);
            dbase.AddInParameter(dbcmd, "@IN_State", DbType.String, state);
            dbase.AddInParameter(dbcmd, "@IN_OtherCountry", DbType.String, otherCountry);
            dbase.AddInParameter(dbcmd, "@IN_OtherState", DbType.String, otherState);
            dbase.AddInParameter(dbcmd, "@IN_Zip", DbType.String, Zip);
            dbase.AddInParameter(dbcmd, "@IN_Id", DbType.Int32, 0);
            dbase.AddInParameter(dbcmd, "@IN_Type", DbType.String, type);
            dbase.AddOutParameter(dbcmd, "@OUT_Id", DbType.Int32, OutId);
            dbase.AddInParameter(dbcmd, "@IN_ChequeAmt", DbType.Double, amt);
            dbase.AddInParameter(dbcmd, "@IN_ChequeNum", DbType.String, cheqnum);
            dbase.AddInParameter(dbcmd, "@IN_ConfirmNum", DbType.String, ConfirmNum);
            dbase.AddInParameter(dbcmd, "@IN_ContType", DbType.String, ContributorType);
            //Added for donation text
            //dbase.AddInParameter(dbcmd, "@IN_IndOrg", DbType.String, IndOrg);

            dbase.ExecuteNonQuery(dbcmd);
            OutId = int.Parse(dbase.GetParameterValue(dbcmd, "@OUT_Id").ToString());
            //return OutId;
        }



        public DataTable get_allCheques(string utype)
        {
            dbcmd = dbase.GetStoredProcCommand("get_all_by_cheque_sp");
            dbase.AddInParameter(dbcmd, "@utype", DbType.String, utype);
            return dbase.ExecuteDataSet(dbcmd).Tables[0];
        }

        public DataSet get_Revenue()
        {
            dbcmd = dbase.GetStoredProcCommand("ira_get_totalrevenue_sp");
            return dbase.ExecuteDataSet(dbcmd);
        }

        public DataTable get_allCCs(string utype)
        {
            dbcmd = dbase.GetStoredProcCommand("IRA_Get_ALL_CC_SP");
            dbase.AddInParameter(dbcmd, "@utype", DbType.String, utype);
            return dbase.ExecuteDataSet(dbcmd).Tables[0];
        }
        public string Get_ConfirmNum()
        {
            dbcmd = dbase.GetStoredProcCommand("IRA_Get_Confirm_SP");
            return dbase.ExecuteScalar(dbcmd).ToString();
        }
        public string Get_CheckConfirmNum()
        {
            dbcmd = dbase.GetStoredProcCommand("IRA_Get_CheckConfirm_SP");
            return dbase.ExecuteScalar(dbcmd).ToString();
        }


        public void insertContriDonorInfo(ref int condonid, char utype, string fname, string lname, string company, string title, string email, string phone, string ext, string country, string othercountry, string state, string otherstate, string city, string address, string otheraddress, string zip, string ctype, string cnum, string scode, string expmonth, string extyear, string amt, string transactionId, string confirm, string ContributorType)
        {
            dbcmd = dbase.GetStoredProcCommand("Add_Tbl_ContriDonor_Info_SP");
            dbase.AddOutParameter(dbcmd, "@ContriDonorID", DbType.Int64, 8);
            dbase.AddInParameter(dbcmd, "@Utype", DbType.String, utype);
            dbase.AddInParameter(dbcmd, "@FirstName", DbType.String, fname);
            dbase.AddInParameter(dbcmd, "@LastName", DbType.String, lname);
            dbase.AddInParameter(dbcmd, "@Organization", DbType.String, company);
            dbase.AddInParameter(dbcmd, "@Title", DbType.String, title);
            dbase.AddInParameter(dbcmd, "@EmailID", DbType.String, email);
            dbase.AddInParameter(dbcmd, "@Phone", DbType.String, phone);
            dbase.AddInParameter(dbcmd, "@Ph_Ex", DbType.String, ext);
            dbase.AddInParameter(dbcmd, "@Address", DbType.String, address);
            dbase.AddInParameter(dbcmd, "@Address2", DbType.String, otheraddress);
            dbase.AddInParameter(dbcmd, "@Country", DbType.String, country);
            dbase.AddInParameter(dbcmd, "@OtherCountry", DbType.String, othercountry);
            dbase.AddInParameter(dbcmd, "@City", DbType.String, city);
            dbase.AddInParameter(dbcmd, "@State", DbType.String, state);
            dbase.AddInParameter(dbcmd, "@OtherState", DbType.String, otherstate);
            dbase.AddInParameter(dbcmd, "@Zip", DbType.String, zip);
            dbase.AddInParameter(dbcmd, "@creditCardtype", DbType.String, ctype);
            dbase.AddInParameter(dbcmd, "@creditCardNum", DbType.String, cnum);
            dbase.AddInParameter(dbcmd, "@securityCode", DbType.String, scode);
            dbase.AddInParameter(dbcmd, "@expirymonth", DbType.String, expmonth);
            dbase.AddInParameter(dbcmd, "@expiryYear", DbType.String, extyear);
            dbase.AddInParameter(dbcmd, "@amount", DbType.String, amt);
            dbase.AddInParameter(dbcmd, "@transactionId", DbType.String, transactionId);
            dbase.AddInParameter(dbcmd, "@confirnum", DbType.String, confirm);
            dbase.AddInParameter(dbcmd, "@contype", DbType.String, ContributorType);

            //Added for Donation text
            //dbase.AddInParameter(dbcmd, "@DonationIndOrg", DbType.String, DonationIndOrg);

            dbase.ExecuteNonQuery(dbcmd);
            condonid = int.Parse(dbase.GetParameterValue(dbcmd, "@ContriDonorID").ToString());

        }
        public DataTable validateAdmin(string uname, string pwd)
        {
            dbcmd = dbase.GetStoredProcCommand("IRA_Validate_Admin_SP");
            dbase.AddInParameter(dbcmd, "@IN_UserName", DbType.String, uname);
            dbase.AddInParameter(dbcmd, "@IN_Password", DbType.String, pwd);
            return dbase.ExecuteDataSet(dbcmd).Tables[0];
        }
        public bool Admin_ChangePassword(int userid, string oldpwd, string newpwd)
        {
            dbcmd = dbase.GetStoredProcCommand("IRA_Change_Admin_Password_SP");
            dbase.AddInParameter(dbcmd, "@IN_Userid", DbType.Int32, userid);
            dbase.AddInParameter(dbcmd, "@IN_OldPassword", DbType.String, oldpwd);
            dbase.AddInParameter(dbcmd, "@IN_NewPassword", DbType.String, newpwd);
            return bool.Parse(dbase.ExecuteScalar(dbcmd).ToString());
        }
        public DataTable Get_User_All_Payments_Report(string utype)
        {
            dbcmd = dbase.GetStoredProcCommand("IRA_Get_UserType_Payments_SP");
            dbase.AddInParameter(dbcmd, "@IN_Utype", DbType.String, utype);
            return dbase.ExecuteDataSet(dbcmd).Tables[0];
        }

        public DataTable Get_All_Contributors(string utype)
        {
            dbcmd = dbase.GetStoredProcCommand("IRA_Get_All_Contributors_SP");
            dbase.AddInParameter(dbcmd, "@IN_Utype", DbType.String, utype);
            return dbase.ExecuteDataSet(dbcmd).Tables[0];
        }
        public DataTable Get_All_Charges()
        {
            dbcmd = dbase.GetStoredProcCommand("IRA_Get_All_Charges_SP");
            return dbase.ExecuteDataSet(dbcmd).Tables[0];
        }
        public void Update_All_Charges(string ipcost, string otheripcost, string nipcost, string othernipcost, string championcost, int championAttendees, string benefactorcost, int benefactorAttendees, string patroncost, int partronAttendees, string sponsorcost, int sponsorAttendees, string supportorcost, int supportorAttendees)
        {
            dbcmd = dbase.GetStoredProcCommand("IRA_Update_All_Charges_SP");
            dbase.AddInParameter(dbcmd, "@IN_FirstIPCost", DbType.String, ipcost);
            dbase.AddInParameter(dbcmd, "@IN_OtherIPCost", DbType.String, otheripcost);
            dbase.AddInParameter(dbcmd, "@IN_NIPCost", DbType.String, nipcost);
            dbase.AddInParameter(dbcmd, "@IN_OtherNIPCost", DbType.String, othernipcost);
            dbase.AddInParameter(dbcmd, "@IN_ChampionCost", DbType.String, championcost);
            dbase.AddInParameter(dbcmd, "@IN_ChampionAttendees", DbType.Int32, championAttendees);
            dbase.AddInParameter(dbcmd, "@IN_BenefactorCost", DbType.String, benefactorcost);
            dbase.AddInParameter(dbcmd, "@IN_BenefactorAttendees", DbType.Int32, benefactorAttendees);
            dbase.AddInParameter(dbcmd, "@IN_PatronCost", DbType.String, patroncost);
            dbase.AddInParameter(dbcmd, "@IN_PatronAttendees", DbType.Int32, partronAttendees);
            dbase.AddInParameter(dbcmd, "@IN_SposorCost", DbType.String, sponsorcost);
            dbase.AddInParameter(dbcmd, "@IN_SponsorAttendees", DbType.Int32, sponsorAttendees);
            dbase.AddInParameter(dbcmd, "@IN_SupportorCost", DbType.String, supportorcost);
            dbase.AddInParameter(dbcmd, "@IN_SupportorAttedees", DbType.Int32, supportorAttendees);
            dbase.ExecuteNonQuery(dbcmd);

        }
        public DataTable Get_Attendee_ByContri(int contriid)
        {
            dbcmd = dbase.GetStoredProcCommand("IRA_Get_Attendees_ByContributor_SP");
            dbase.AddInParameter(dbcmd, "@IN_ContriID", DbType.Int32, contriid);
            return dbase.ExecuteDataSet(dbcmd).Tables[0];
        }
        public void Update_Attendee_ByContri(int attendeeid, string fname, string lname, string emailid, string companyname, string title, string phone, string ext)
        {
            dbcmd = dbase.GetStoredProcCommand("IRA_Update_Attendees_ByContributor_SP");
            dbase.AddInParameter(dbcmd, "@IN_AttendeeId", DbType.Int32, attendeeid);
            dbase.AddInParameter(dbcmd, "@IN_FirstName", DbType.String, fname);
            dbase.AddInParameter(dbcmd, "@IN_LastName", DbType.String, lname);
            dbase.AddInParameter(dbcmd, "@IN_Emailid", DbType.String, emailid);
            dbase.AddInParameter(dbcmd, "@IN_Organization", DbType.String, companyname);
            dbase.AddInParameter(dbcmd, "@IN_Title", DbType.String, title);
            dbase.AddInParameter(dbcmd, "@IN_Phone", DbType.String, phone);
            dbase.AddInParameter(dbcmd, "@IN_Ext", DbType.String, ext);
            dbase.ExecuteNonQuery(dbcmd);
        }
        public DataTable Getall_Payment()
        {
            dbcmd = dbase.GetStoredProcCommand("IRA_Get_ALL_UserType_Payments_SP");
            return dbase.ExecuteDataSet(dbcmd).Tables[0];
        }
        public DataTable Get_Attendee_ByLastName(string lname)
        {
            dbcmd = dbase.GetStoredProcCommand("IRA_Get_Attendee_ByLastName_SP");
            dbase.AddInParameter(dbcmd, "@IN_LastName", DbType.String, lname);
            return dbase.ExecuteDataSet(dbcmd).Tables[0];
        }
        public void Update_Attendee_VipStatus(int attendeeid)
        {
            dbcmd = dbase.GetStoredProcCommand("IRA_Change_Attendee_VipStatus_SP");
            dbase.AddInParameter(dbcmd, "@IN_AttendeeId", DbType.String, attendeeid);
            dbase.ExecuteNonQuery(dbcmd);
        }

    }
}
