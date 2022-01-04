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
    public class LumenUserServices
    {
        Database dbase;
        DbCommand dbcmd;
        public LumenUserServices()
        {
            //dbase = DatabaseFactory.CreateDatabase("CFNSDB2011");            
            dbase = DatabaseFactory.CreateDatabase("CFNSDB2012");            
        }
        public void Attendee_Add(int paymentid, string firstname, string lastname, string organization, string title, string emailId, string phone, string phex, string Country, string otherCountry, string state, string otherstate, string attendeType, string address, string otheraddress, string city, string zip, double Price, string AdminOrder,string paymenttype)
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
            dbase.AddInParameter(dbcmd, "@Price", DbType.Double, Price);
            dbase.AddInParameter(dbcmd, "@AdminOrder", DbType.String, AdminOrder);
            dbase.AddInParameter(dbcmd, "@PaymentType", DbType.String, paymenttype);

            dbase.ExecuteNonQuery(dbcmd);
        }
        public void Attendee_Add_NY(int paymentid, string firstname, string lastname, string organization, string title, string emailId, string phone, string phex, string Country, string otherCountry, string state, string otherstate, string attendeType, string address, string otheraddress, string city, string zip, double Price, string AdminOrder, string paymenttype,string Cocktail)
        {
            dbcmd = dbase.GetStoredProcCommand("IRA_Tbl_AttendeeInformations_NEW");
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
            dbase.AddInParameter(dbcmd, "@Price", DbType.Double, Price);
            dbase.AddInParameter(dbcmd, "@AdminOrder", DbType.String, AdminOrder);
            dbase.AddInParameter(dbcmd, "@PaymentType", DbType.String, paymenttype);
            dbase.AddInParameter(dbcmd, "@Cocktail", DbType.String, Cocktail);
            dbase.ExecuteNonQuery(dbcmd);
        }
        public void Attendee_Add(int paymentid, string firstname, string lastname, string organization,  string emailId, string phone, string phex, string Country, string otherCountry, string state, string otherstate, string address, string otheraddress, string city, string zip)
        {
            dbcmd = dbase.GetStoredProcCommand("usp_lumen_Tbl_AttendeeInformations");
            dbase.AddInParameter(dbcmd, "@paymentid", DbType.Int32, paymentid);
            dbase.AddInParameter(dbcmd, "@FirstName", DbType.String, firstname);
            dbase.AddInParameter(dbcmd, "@LastName", DbType.String, lastname);
            dbase.AddInParameter(dbcmd, "@Organization", DbType.String, organization);
            dbase.AddInParameter(dbcmd, "@EmailID", DbType.String, emailId);
            dbase.AddInParameter(dbcmd, "@Phone", DbType.String, phone);
            dbase.AddInParameter(dbcmd, "@Ph_Ex", DbType.String, phex);
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
        public void Billing_Add(int paymentid, string Name, string emailId, string phone, string Address, string OName, string OEmail, string OPhone,string Title,string CCEmail,string Country,string State,string City,string zip,string company)
        {
            dbcmd = dbase.GetStoredProcCommand("usp_lumen_Billing_Info");
            dbase.AddInParameter(dbcmd, "@paymentid", DbType.Int32, paymentid);
            dbase.AddInParameter(dbcmd, "@Name", DbType.String, Name);            
            dbase.AddInParameter(dbcmd, "@EmailID", DbType.String, emailId);
            dbase.AddInParameter(dbcmd, "@Phone", DbType.String, phone);
            dbase.AddInParameter(dbcmd, "@Address", DbType.String, Address);
            dbase.AddInParameter(dbcmd, "@OName", DbType.String, OName);
            dbase.AddInParameter(dbcmd, "@OEmailID", DbType.String, OEmail);
            dbase.AddInParameter(dbcmd, "@OPhone", DbType.String, OPhone);
            dbase.AddInParameter(dbcmd, "@Title", DbType.String, Title);
            dbase.AddInParameter(dbcmd, "@CCEmailID", DbType.String, CCEmail);
            dbase.AddInParameter(dbcmd, "@Country", DbType.String, Country);
            dbase.AddInParameter(dbcmd, "@State", DbType.String, State);
            dbase.AddInParameter(dbcmd, "@City", DbType.String, City);
            dbase.AddInParameter(dbcmd, "@Zip", DbType.String, zip);
            dbase.AddInParameter(dbcmd, "@company", DbType.String, company);

            dbase.ExecuteNonQuery(dbcmd);
        }
      
        public void Attendee_Add_Tickets( int RefId, string Member,int FullTable, int HalfTable, int Tickets, int FullAd, int HalfAd)
        {
            dbcmd = dbase.GetStoredProcCommand("usp_lumen_InsertTickets");
            dbase.AddInParameter(dbcmd, "@RefId", DbType.Int32, RefId);
            dbase.AddInParameter(dbcmd, "@Member", DbType.String, Member);
            dbase.AddInParameter(dbcmd, "@FullTable", DbType.Int32, FullTable);
            dbase.AddInParameter(dbcmd, "@HalfTable", DbType.Int32, HalfTable);
            dbase.AddInParameter(dbcmd, "@Tickets", DbType.Int32, Tickets);
            dbase.AddInParameter(dbcmd, "@FullAd", DbType.Int32, FullAd);
            dbase.AddInParameter(dbcmd, "@HalfAd", DbType.Int32, HalfAd);
           

            dbase.ExecuteNonQuery(dbcmd);
        }
        public void Attendee_Add_Table(int tableid, string attendess)
        {
            dbcmd = dbase.GetStoredProcCommand("usp_inserttableAttvalues");
            dbase.AddInParameter(dbcmd, "@tableid", DbType.Int32, tableid);
            dbase.AddInParameter(dbcmd, "@attendeeid", DbType.String, attendess);
           

            dbase.ExecuteNonQuery(dbcmd);
        }
        public void Sohn_Partner_Add( string firstname, string lastname, string organization, string title, string emailId, string phone, string phex)
        {
            dbcmd = dbase.GetStoredProcCommand("usp_insert_sohn_partner");
          
            dbase.AddInParameter(dbcmd, "@FirstName", DbType.String, firstname);
            dbase.AddInParameter(dbcmd, "@LastName", DbType.String, lastname);
            dbase.AddInParameter(dbcmd, "@Organization", DbType.String, organization);
            dbase.AddInParameter(dbcmd, "@Title", DbType.String, title);
            dbase.AddInParameter(dbcmd, "@EmailID", DbType.String, emailId);
            dbase.AddInParameter(dbcmd, "@Phone", DbType.String, phone);
            dbase.AddInParameter(dbcmd, "@Ph_Ex", DbType.String, phex);
           
            dbase.ExecuteNonQuery(dbcmd);
        }
        public int L_Attendee_confirm(int AttendeeID, int outID)
        {
            dbcmd = dbase.GetStoredProcCommand("IRA_LONDON_Tbl_AttendeeConfirm");
            dbase.AddInParameter(dbcmd, "@AttendeeID", DbType.Int32, AttendeeID);
            dbase.AddOutParameter(dbcmd, "@OUT_Id", DbType.Int32, outID);
            dbase.ExecuteNonQuery(dbcmd);
            outID = int.Parse(dbase.GetParameterValue(dbcmd, "@OUT_Id").ToString());
            return outID;
        }
        public int L_Attendee_CC_Add(int confirmID, string CCType, string CCName, string authMode, string cartId, string emailID, string country, string fax, string IP, string postCode, string transID, string tranStatus, int OutId, string uType,string ammount)
        {
         
            dbcmd = dbase.GetStoredProcCommand("IRA_LONDON_Tbl_AttendeeCCInformation");
            dbase.AddInParameter(dbcmd, "@ConfirmID", DbType.Int32, confirmID);
            dbase.AddInParameter(dbcmd, "@CCType", DbType.String, CCType);
            dbase.AddInParameter(dbcmd, "@CCName", DbType.String, CCName);
            dbase.AddInParameter(dbcmd, "@authMode", DbType.String, authMode);
            dbase.AddInParameter(dbcmd, "@cartId", DbType.String, cartId);
            dbase.AddInParameter(dbcmd, "@EmailID", DbType.String, emailID);
            dbase.AddInParameter(dbcmd, "@country", DbType.String, country);
            dbase.AddInParameter(dbcmd, "@fax", DbType.String, fax);
            dbase.AddInParameter(dbcmd, "@IPAddress", DbType.String, IP);
            dbase.AddInParameter(dbcmd, "@postcode", DbType.String, postCode);
            dbase.AddInParameter(dbcmd, "@transId", DbType.String, transID);
            dbase.AddInParameter(dbcmd, "@tranStatus", DbType.String, tranStatus);
            dbase.AddInParameter(dbcmd, "@usertype", DbType.String, uType);
            dbase.AddInParameter(dbcmd, "@ammount", DbType.String, ammount);
            dbase.AddOutParameter(dbcmd, "@OUT_Id", DbType.Int32, OutId);
            dbase.ExecuteNonQuery(dbcmd);
            OutId = int.Parse(dbase.GetParameterValue(dbcmd, "@OUT_Id").ToString());
            return OutId;
        }
        public int L_Attendee_Add(int paymentid, string firstname, string lastname, string organization, string title, string emailId, string phone, string phex, string Country, string otherCountry, string state, string otherstate, string attendeType, string address, string otheraddress, string city, string zip, double Price, string AdminOrder, string paymenttype, string Location,  int OutId)
        {
            dbcmd = dbase.GetStoredProcCommand("IRA_LONDON_Tbl_AttendeeInformations");
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
            dbase.AddInParameter(dbcmd, "@Price", DbType.Double, Price);
            dbase.AddInParameter(dbcmd, "@AdminOrder", DbType.String, AdminOrder);
            dbase.AddInParameter(dbcmd, "@PaymentType", DbType.String, paymenttype);
            dbase.AddInParameter(dbcmd, "@Location", DbType.String, Location);
            dbase.AddOutParameter(dbcmd, "@OUT_Id", DbType.Int32, OutId);
            dbase.ExecuteNonQuery(dbcmd);
            OutId = int.Parse(dbase.GetParameterValue(dbcmd, "@OUT_Id").ToString());
            return OutId;
        }
        public void CSV_Attendee_Add(int paymentid, string firstname, string lastname, string organization, string title, string emailId, string phone, string phex, string Country, string otherCountry, string state, string otherstate, string attendeType, string address, string otheraddress, string city, string zip, byte  VipStatus, double Price, string AdminOrder)
        {
            dbcmd = dbase.GetStoredProcCommand("CSV_IRA_Tbl_AttendeeInformations");
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
            dbase.AddInParameter(dbcmd, "@VipStatus", DbType.Byte, VipStatus);
            dbase.AddInParameter(dbcmd, "@Price", DbType.Double, Price);
            dbase.AddInParameter(dbcmd, "@AdminOrder", DbType.String, AdminOrder);

            dbase.ExecuteNonQuery(dbcmd);
        }
        public void Update_Attendee_confirmID(string firstname, string lastname, string organization, string title, string emailId, string phone,int confirmID)
        {
            dbcmd = dbase.GetStoredProcCommand("Update_Attendee _ConfirmID");
           
            dbase.AddInParameter(dbcmd, "@FirstName", DbType.String, firstname);
            dbase.AddInParameter(dbcmd, "@LastName", DbType.String, lastname);
            dbase.AddInParameter(dbcmd, "@organisation", DbType.String, organization);
            dbase.AddInParameter(dbcmd, "@Title", DbType.String, title);
            dbase.AddInParameter(dbcmd, "@Email", DbType.String, emailId);
            dbase.AddInParameter(dbcmd, "@Phone", DbType.String, phone);
            dbase.AddInParameter(dbcmd, "@confirmNUm", DbType.Int32, confirmID);

            dbase.ExecuteNonQuery(dbcmd);
        }
        public DataTable get_AllLondonAttendees()
        {
            dbcmd = dbase.GetStoredProcCommand("Get_All_London_Attendees_SP");
            return dbase.ExecuteDataSet(dbcmd).Tables[0];
        }
        public DataTable getAttendeeByConfEmail(int confirmID,string Email)
        {
            dbcmd = dbase.GetStoredProcCommand("Get_London_Attendees_Payment");
            dbase.AddInParameter(dbcmd, "@confirmNum", DbType.Int32, confirmID);
            dbase.AddInParameter(dbcmd, "@emailID", DbType.String, Email);
            return dbase.ExecuteDataSet(dbcmd).Tables[0];
        }
        public DataSet getAttendeeNotPaidEmails()
        {
            dbcmd = dbase.GetStoredProcCommand("usp_getAttendNotpaidEmails");
            return dbase.ExecuteDataSet(dbcmd);
        }
        public DataSet getContriNotPaidEmails()
        {
            dbcmd = dbase.GetStoredProcCommand("usp_getContributorNotpaidEmails");
            return dbase.ExecuteDataSet(dbcmd);
        }
        public DataTable getAttendeeByConfID(int confirmID)
        {
            dbcmd = dbase.GetStoredProcCommand("Get_CheckConfirm_By _ConfirmID");
            dbase.AddInParameter(dbcmd, "@confirmNUm", DbType.Int32, confirmID);           
            return dbase.ExecuteDataSet(dbcmd).Tables[0];
        }
        public DataTable getAttendeeTranStatus(int confirmID)
        {
            dbcmd = dbase.GetStoredProcCommand("Get_London_Attendees_Payment_TranStatus");
            dbase.AddInParameter(dbcmd, "@confirmNum", DbType.Int32, confirmID);
            return dbase.ExecuteDataSet(dbcmd).Tables[0];
        }
        public DataTable get_AllAttendees()
        {
            dbcmd = dbase.GetStoredProcCommand("Get_All_Attendees_SP");
            return dbase.ExecuteDataSet(dbcmd).Tables[0];
        }
        public DataSet get_AllAttendees_Tables()
        {
            dbcmd = dbase.GetStoredProcCommand("Get_All_Attendees_SP");
            return dbase.ExecuteDataSet(dbcmd);
        }
        public DataTable get_AllSohnPartners()
        {
            dbcmd = dbase.GetStoredProcCommand("usp_get_all_sohn_partners");
            return dbase.ExecuteDataSet(dbcmd).Tables[0];
        }
        public DataTable get_LondonDonors()
        {
            dbcmd = dbase.GetStoredProcCommand("Get_London_Donor");
            return dbase.ExecuteDataSet(dbcmd).Tables[0];
        }
        public void deleteLondon(int payid)
        {

            dbcmd = dbase.GetStoredProcCommand("Get_London_delete");

            dbase.AddInParameter(dbcmd, "@attrendeeid", DbType.Int32, payid);
         

            dbase.ExecuteNonQuery(dbcmd);



        }
        public void Change_ContributorChequeStatus(int payid, bool status, string chequeNum)
        {

            dbcmd = dbase.GetStoredProcCommand("FA_Change_ContributorCheque_Status_SP");

            dbase.AddInParameter(dbcmd, "@IN_Payid", DbType.Int32, payid);

            dbase.AddInParameter(dbcmd, "@IN_Status", DbType.Boolean, status);

            dbase.AddInParameter(dbcmd, "@IN_ChequeNum", DbType.String, chequeNum);

            dbase.ExecuteNonQuery(dbcmd);



        }
        public void Update_PaymentPersonByCheck(int payid, bool status, string chequeNum,string firstname,string lastname,string email,string company,string phone,string extension,string address,string address2,string country,string city, string state,string zip,string paymenttype)
        {

            dbcmd = dbase.GetStoredProcCommand("Update_PaymentPersonByCheck");

            dbase.AddInParameter(dbcmd, "@IN_Payid", DbType.Int32, payid);
            dbase.AddInParameter(dbcmd, "@IN_ChequeNum", DbType.String, chequeNum);
            dbase.AddInParameter(dbcmd, "@IN_Status", DbType.Boolean, status);           
            dbase.AddInParameter(dbcmd, "@IN_FirstName", DbType.String, firstname);
            dbase.AddInParameter(dbcmd, "@IN_LastName", DbType.String, lastname);
            dbase.AddInParameter(dbcmd, "@IN_Email", DbType.String, email);
            dbase.AddInParameter(dbcmd, "@IN_Company", DbType.String, company);
            dbase.AddInParameter(dbcmd, "@IN_Phone", DbType.String, phone);

            dbase.AddInParameter(dbcmd, "@IN_Ext", DbType.String, extension);
            dbase.AddInParameter(dbcmd, "@IN_Address", DbType.String, address);
            dbase.AddInParameter(dbcmd, "@IN_Address2", DbType.String, address2);
            dbase.AddInParameter(dbcmd, "@IN_Country", DbType.String, country);
            dbase.AddInParameter(dbcmd, "@IN_City", DbType.String, city);
            dbase.AddInParameter(dbcmd, "@IN_State", DbType.String, state);
            dbase.AddInParameter(dbcmd, "@IN_Zip", DbType.String, zip);

            dbase.AddInParameter(dbcmd, "@IN_PaymentType", DbType.String, paymenttype);


            dbase.ExecuteNonQuery(dbcmd);



        }

        public void Update_PaymentPersonByCC(int payid,string firstname, string lastname, string email, string company, string phone,string extension,string address,string address2,string country,string city,string state,string zip)
        {

            dbcmd = dbase.GetStoredProcCommand("Update_PaymentPersonByCC");

            dbase.AddInParameter(dbcmd, "@IN_Payid", DbType.Int32, payid);
            dbase.AddInParameter(dbcmd, "@IN_FirstName", DbType.String, firstname);
            dbase.AddInParameter(dbcmd, "@IN_LastName", DbType.String, lastname);
            dbase.AddInParameter(dbcmd, "@IN_Email", DbType.String, email);
            dbase.AddInParameter(dbcmd, "@IN_Organization", DbType.String, company);
            dbase.AddInParameter(dbcmd, "@IN_Phone", DbType.String, phone);

            dbase.AddInParameter(dbcmd, "@IN_Ext", DbType.String, extension);
            dbase.AddInParameter(dbcmd, "@IN_Address", DbType.String, address);
            dbase.AddInParameter(dbcmd, "@IN_Address2", DbType.String, address2);
            dbase.AddInParameter(dbcmd, "@IN_Country", DbType.String, country);
            dbase.AddInParameter(dbcmd, "@IN_City", DbType.String, city);
            dbase.AddInParameter(dbcmd, "@IN_State", DbType.String, state);
            dbase.AddInParameter(dbcmd, "@IN_Zip", DbType.String, zip);

            dbase.ExecuteNonQuery(dbcmd);
        }



        public DataTable get_AllContributor_PaymentStatus()
        {
            dbcmd = dbase.GetStoredProcCommand("Get_All_Contributors_SP");
            return dbase.ExecuteDataSet(dbcmd).Tables[0];
        }


        public void Update_SentDate(int payid,string time)
        {

            dbcmd = dbase.GetStoredProcCommand("USP_MAILSENT");

            dbase.AddInParameter(dbcmd, "@CHKID", DbType.Int32, payid);
            dbase.AddInParameter(dbcmd, "@Time", DbType.String, time); 

            dbase.ExecuteNonQuery(dbcmd);
        }
        public void Update_EventTable(int eventid, string tblName,int seats)
        {

            dbcmd = dbase.GetStoredProcCommand("update_eventtable");

            dbase.AddInParameter(dbcmd, "@EventTableID", DbType.Int32, eventid);
            dbase.AddInParameter(dbcmd, "@Table_Name", DbType.String, tblName);
            dbase.AddInParameter(dbcmd, "@Table_capacity", DbType.Int32, seats);
            dbase.ExecuteNonQuery(dbcmd);
        }
        public void insert_EventTable(string tblName, int seats)
        {

            dbcmd = dbase.GetStoredProcCommand("insert_eventtable");

          
            dbase.AddInParameter(dbcmd, "@Table_Name", DbType.String, tblName);
            dbase.AddInParameter(dbcmd, "@Table_capacity", DbType.Int32, seats);
            dbase.ExecuteNonQuery(dbcmd);
        }
        public void Reservation_Insert(ref int OutId, double amt,string fname, string lname, string company, string email, string ph, string ext, string adr1, string adr2, string country, string state, string city, string otherCountry, string otherState, string Zip, string type, string ConfirmNum,  int TicketCount,string paymenttype,string Lumen,string Billing)
        {

            //int OutId;
            // OutId = 0;

            dbcmd = dbase.GetStoredProcCommand("usp_Lumen_Insert_Reservation");
            dbase.AddInParameter(dbcmd, "@IN_FirstName", DbType.String, fname);
            dbase.AddInParameter(dbcmd, "@IN_LastName", DbType.String, lname);
            dbase.AddInParameter(dbcmd, "@IN_CompanyName", DbType.String, company);         
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
            dbase.AddInParameter(dbcmd, "@IN_Type", DbType.String, type);
            dbase.AddOutParameter(dbcmd, "@OUT_Id", DbType.Int32, OutId);
            dbase.AddInParameter(dbcmd, "@IN_Amount", DbType.Double, amt);
            dbase.AddInParameter(dbcmd, "@IN_ConfirmNum", DbType.String, ConfirmNum);           
            dbase.AddInParameter(dbcmd, "@IN_TicketCount", DbType.Int32, TicketCount);
            dbase.AddInParameter(dbcmd, "@IN_PaymentType", DbType.String, paymenttype);
            dbase.AddInParameter(dbcmd, "@Lumen", DbType.String, Lumen);
            dbase.AddInParameter(dbcmd, "@Billing", DbType.String, Billing);
            dbase.ExecuteNonQuery(dbcmd);
            OutId = int.Parse(dbase.GetParameterValue(dbcmd, "@OUT_Id").ToString());
            //return OutId;
        }
        public int MadAd_Insert(ref int OutId, string fname, string lname, string company,  string email, string ph,  string adr1, string adr2, string country, string state, string city,  string Zip,   string Mad)
        {

            //int OutId;
            // OutId = 0;

            dbcmd = dbase.GetStoredProcCommand("MadAd_Insert");
            dbase.AddInParameter(dbcmd, "@IN_FirstName", DbType.String, fname);
            dbase.AddInParameter(dbcmd, "@IN_LastName", DbType.String, lname);
            dbase.AddInParameter(dbcmd, "@IN_CompanyName", DbType.String, company);           
            dbase.AddInParameter(dbcmd, "@IN_Email", DbType.String, email);
            dbase.AddInParameter(dbcmd, "@IN_Phone", DbType.String, ph);
            dbase.AddOutParameter(dbcmd, "@OUT_Id", DbType.Int32, OutId);
            dbase.AddInParameter(dbcmd, "@IN_Address1", DbType.String, adr1);
            dbase.AddInParameter(dbcmd, "@IN_Address2", DbType.String, adr2);
            dbase.AddInParameter(dbcmd, "@IN_Country", DbType.String, country);
            dbase.AddInParameter(dbcmd, "@IN_City", DbType.String, city);
            dbase.AddInParameter(dbcmd, "@IN_State", DbType.String, state);
        
            dbase.AddInParameter(dbcmd, "@IN_Zip", DbType.String, Zip);
            dbase.AddInParameter(dbcmd, "@MadType", DbType.String, Mad);
            dbase.ExecuteNonQuery(dbcmd);
            OutId = int.Parse(dbase.GetParameterValue(dbcmd, "@OUT_Id").ToString());
            return OutId;
        }


        public void ContributorInfo_london_Insert(ref int OutId, double amt, string cheqnum, string fname, string lname, string company, string title, string email, string ph, string ext, string adr1, string adr2, string country, string state, string city, string otherCountry, string otherState, string Zip, string type, string ConfirmNum, string ContributorType, string IndOrg, string AdminOrder, int TicketCount, string paymenttype,string location)
        {

            //int OutId;
            // OutId = 0;

            dbcmd = dbase.GetStoredProcCommand("london_Insert_ContCheque_SP");
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
            dbase.AddInParameter(dbcmd, "@IN_IndOrg", DbType.String, IndOrg);
            dbase.AddInParameter(dbcmd, "@IN_AdminOrder", DbType.String, AdminOrder);
            dbase.AddInParameter(dbcmd, "@IN_TicketCount", DbType.Int32, TicketCount);
            dbase.AddInParameter(dbcmd, "@IN_PaymentType", DbType.String, paymenttype);
            dbase.AddInParameter(dbcmd, "@Location", DbType.String, location);
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
        public DataTable get_all_london_Cheques(string utype)
        {
            dbcmd = dbase.GetStoredProcCommand("get_all_london_cheque_sp");
            dbase.AddInParameter(dbcmd, "@utype", DbType.String, utype);
            return dbase.ExecuteDataSet(dbcmd).Tables[0];
        }
        public DataTable get_all_london_Support(string utype)
        {
            dbcmd = dbase.GetStoredProcCommand("get_all_london_cheque_support");
            dbase.AddInParameter(dbcmd, "@utype", DbType.String, utype);
            return dbase.ExecuteDataSet(dbcmd).Tables[0];
        }
        public DataTable get_Cheque_byID(int orderid)
        {
            dbcmd = dbase.GetStoredProcCommand("get_Cheque_byID");
            dbase.AddInParameter(dbcmd, "@orderid", DbType.Int32, orderid);
            return dbase.ExecuteDataSet(dbcmd).Tables[0];
        }
        public DataTable get_london_Cheque_byID(int orderid)
        {
            dbcmd = dbase.GetStoredProcCommand("get_london_Cheque_byID");
            dbase.AddInParameter(dbcmd, "@orderid", DbType.Int32, orderid);
            return dbase.ExecuteDataSet(dbcmd).Tables[0];
        }
        public DataTable get_CC_byID(int orderid)
        {
            dbcmd = dbase.GetStoredProcCommand("get_CC_byID");
            dbase.AddInParameter(dbcmd, "@orderid", DbType.Int32, orderid);
            return dbase.ExecuteDataSet(dbcmd).Tables[0];
        }
        
        public DataSet get_Revenue()
        {
            dbcmd = dbase.GetStoredProcCommand("ira_get_totalrevenue_sp");
            return dbase.ExecuteDataSet(dbcmd);
        }
        public void deletTablesAtt()
        {
            dbcmd = dbase.GetStoredProcCommand("usp_deleteAttTables");
            dbase.ExecuteNonQuery(dbcmd);
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
            dbcmd = dbase.GetStoredProcCommand("usp_lumen_Get_CheckConfirm");
            return dbase.ExecuteScalar(dbcmd).ToString();
        }


        public void insertContriDonorInfo(ref int condonid, char utype, string fname, string lname, string company, string title, string email, string phone, string ext, string country, string othercountry, string state, string otherstate, string city, string address, string otheraddress, string zip, string ctype, string cnum, string scode, string expmonth, string extyear, string amt, string transactionId, string confirm, string ContributorType, string DonationIndOrg, string AdminOrder, int TicketCount)
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
            dbase.AddInParameter(dbcmd, "@DonationIndOrg", DbType.String, DonationIndOrg);
            dbase.AddInParameter(dbcmd, "@AdminOrder", DbType.String, AdminOrder);
            dbase.AddInParameter(dbcmd, "@TicketCount", DbType.Int32, TicketCount);


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

        public DataTable Get_All_Contributors_Notes(string utype)
        {
            dbcmd = dbase.GetStoredProcCommand("[IRA_Get_All_Contributors_Notes_SP]");
            dbase.AddInParameter(dbcmd, "@IN_Utype", DbType.String, utype);
            return dbase.ExecuteDataSet(dbcmd).Tables[0];
        }
        public DataTable Get_Enteprise_Charges(string utype)
        {
            dbcmd = dbase.GetStoredProcCommand("[IRA_Enteprise_Charges_SP]");
            dbase.AddInParameter(dbcmd, "@type", DbType.String, utype);
            return dbase.ExecuteDataSet(dbcmd).Tables[0];
        }
        public DataTable Get_All_EventTables()
        {
            dbcmd = dbase.GetStoredProcCommand("usp_EventTables");
            return dbase.ExecuteDataSet(dbcmd).Tables[0];
        }
        public DataSet Get_All_EventTablesAtt()
        {
            dbcmd = dbase.GetStoredProcCommand("usp_EventTablesAtt");
            return dbase.ExecuteDataSet(dbcmd);
        }
        public DataTable Get_All_Charges()
        {
            dbcmd = dbase.GetStoredProcCommand("IRA_Get_All_Charges_SP");
            return dbase.ExecuteDataSet(dbcmd).Tables[0];
        }
        public DataTable Get_All_LondonCharges()
        {
            dbcmd = dbase.GetStoredProcCommand("IRA_Get_All_London_Charges");
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
        public DataTable Get_London_Attendee_ByContri(int contriid)
        {
            dbcmd = dbase.GetStoredProcCommand("London_Get_Attendees_ByContributor_SP");                    
            dbase.AddInParameter(dbcmd, "@IN_ContriID", DbType.Int32, contriid);          
            return dbase.ExecuteDataSet(dbcmd).Tables[0];
        }
        public DataTable CSV_Get_Attendee_ByOrderID(int orderid)
        {
            dbcmd = dbase.GetStoredProcCommand("IRA_Get_All_AttendeesByID");
            dbase.AddInParameter(dbcmd, "@IN_OrderID", DbType.Int32, orderid);            
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
        public void Update_Attendee_ByContri(int attendeeid, string fname, string lname, string emailid, string companyname, string title, string phone, string ext,string nextwave,string cocktail,string sohngeneral)
        {
            dbcmd = dbase.GetStoredProcCommand("IRA_Update_Attendees_ByContributor_SP_2014");
            dbase.AddInParameter(dbcmd, "@IN_AttendeeId", DbType.Int32, attendeeid);
            dbase.AddInParameter(dbcmd, "@IN_FirstName", DbType.String, fname);
            dbase.AddInParameter(dbcmd, "@IN_LastName", DbType.String, lname);
            dbase.AddInParameter(dbcmd, "@IN_Emailid", DbType.String, emailid);
            dbase.AddInParameter(dbcmd, "@IN_Organization", DbType.String, companyname);
            dbase.AddInParameter(dbcmd, "@IN_Title", DbType.String, title);
            dbase.AddInParameter(dbcmd, "@IN_Phone", DbType.String, phone);
            dbase.AddInParameter(dbcmd, "@IN_Ext", DbType.String, ext);
            dbase.AddInParameter(dbcmd, "@IN_NextWave", DbType.String, nextwave);
            dbase.AddInParameter(dbcmd, "@IN_Cocktail", DbType.String, cocktail);
            dbase.AddInParameter(dbcmd, "@In_SohnGeneralPartner", DbType.String, sohngeneral);
            dbase.ExecuteNonQuery(dbcmd);
        }
        public void Update_AttendeeByID(int attendeeid, string fname, string lname, string emailid, string companyname,string phone, string extension,string address,string address2,string country,string city,string state,string zip)
        {
            dbcmd = dbase.GetStoredProcCommand("Update_AttendeeByID");
            dbase.AddInParameter(dbcmd, "@IN_AttendeeId", DbType.Int32, attendeeid);
            dbase.AddInParameter(dbcmd, "@IN_FirstName", DbType.String, fname);
            dbase.AddInParameter(dbcmd, "@IN_LastName", DbType.String, lname);
            dbase.AddInParameter(dbcmd, "@IN_Emailid", DbType.String, emailid);
            dbase.AddInParameter(dbcmd, "@IN_Organization", DbType.String, companyname);          
            dbase.AddInParameter(dbcmd, "@IN_Phone", DbType.String, phone);
            dbase.AddInParameter(dbcmd, "@IN_Ext", DbType.String, extension);
            dbase.AddInParameter(dbcmd, "@IN_Address", DbType.String, address);
            dbase.AddInParameter(dbcmd, "@IN_Address2", DbType.String, address2);
            dbase.AddInParameter(dbcmd, "@IN_Country", DbType.String, country);
            dbase.AddInParameter(dbcmd, "@IN_City", DbType.String, city);
            dbase.AddInParameter(dbcmd, "@IN_State", DbType.String, state);
            dbase.AddInParameter(dbcmd, "@IN_Zip", DbType.String, zip);
            //dbase.AddInParameter(dbcmd, "@IN_PaymentType", DbType.String, paymenttype);

            dbase.ExecuteNonQuery(dbcmd);
        }
        public void Update_AttendeeByID(int attendeeid, string fname, string lname, string emailid, string companyname, string phone, string extension, string address, string address2, string country, string city, string state, string zip, string nextwave, string cocktail, string sohngeneral)
        {
            dbcmd = dbase.GetStoredProcCommand("Update_AttendeeByID_2014");
            dbase.AddInParameter(dbcmd, "@IN_AttendeeId", DbType.Int32, attendeeid);
            dbase.AddInParameter(dbcmd, "@IN_FirstName", DbType.String, fname);
            dbase.AddInParameter(dbcmd, "@IN_LastName", DbType.String, lname);
            dbase.AddInParameter(dbcmd, "@IN_Emailid", DbType.String, emailid);
            dbase.AddInParameter(dbcmd, "@IN_Organization", DbType.String, companyname);
            dbase.AddInParameter(dbcmd, "@IN_Phone", DbType.String, phone);
            dbase.AddInParameter(dbcmd, "@IN_Ext", DbType.String, extension);
            dbase.AddInParameter(dbcmd, "@IN_Address", DbType.String, address);
            dbase.AddInParameter(dbcmd, "@IN_Address2", DbType.String, address2);
            dbase.AddInParameter(dbcmd, "@IN_Country", DbType.String, country);
            dbase.AddInParameter(dbcmd, "@IN_City", DbType.String, city);
            dbase.AddInParameter(dbcmd, "@IN_State", DbType.String, state);
            dbase.AddInParameter(dbcmd, "@IN_Zip", DbType.String, zip);
            dbase.AddInParameter(dbcmd, "@IN_NextWave", DbType.String, nextwave);
            dbase.AddInParameter(dbcmd, "@IN_Cocktail", DbType.String, cocktail);
            dbase.AddInParameter(dbcmd, "@In_SohnGeneralPartner", DbType.String, sohngeneral);
            //dbase.AddInParameter(dbcmd, "@IN_PaymentType", DbType.String, paymenttype);

            dbase.ExecuteNonQuery(dbcmd);
        }
      
        
        public DataTable Getall_Payment()
        {
            dbcmd = dbase.GetStoredProcCommand("IRA_Get_ALL_UserType_Payments_SP");
            return dbase.ExecuteDataSet(dbcmd).Tables[0];
        }
        public DataTable Get_Attendee_ByLastName(string lname,string chknotes)
        {
            dbcmd = dbase.GetStoredProcCommand("IRA_Get_Attendee_ByLastName_SP");
            dbase.AddInParameter(dbcmd, "@IN_LastName", DbType.String, lname);
            dbase.AddInParameter(dbcmd, "@IN_ChkNotes", DbType.String, chknotes);
            return dbase.ExecuteDataSet(dbcmd).Tables[0];
        }
        public DataTable Get_London_Attendee_ByLastName(string lname)
        {
            dbcmd = dbase.GetStoredProcCommand("London_Get_Attendee_ByLastName_SP");
            dbase.AddInParameter(dbcmd, "@IN_LastName", DbType.String, lname);           
            return dbase.ExecuteDataSet(dbcmd).Tables[0];
        }
        public void Update_Attendee_VipStatus(int attendeeid)
        {
            dbcmd = dbase.GetStoredProcCommand("IRA_Change_Attendee_VipStatus_SP");
            dbase.AddInParameter(dbcmd, "@IN_AttendeeId", DbType.String, attendeeid);
            dbase.ExecuteNonQuery(dbcmd);
        }
        public DataTable Get_Attendee_ByID(int attendeeid)
        {
            dbcmd = dbase.GetStoredProcCommand("IRA_Get_Attendee_ByID");
            dbase.AddInParameter(dbcmd, "@IN_AttendeeId", DbType.Int32, attendeeid);
            return dbase.ExecuteDataSet(dbcmd).Tables[0];
        }
        public DataSet Get_London_Attendee_ByID(int attendeeid)
        {
            dbcmd = dbase.GetStoredProcCommand("London_Get_Attendee_ByID");
            dbase.AddInParameter(dbcmd, "@IN_AttendeeId", DbType.Int32, attendeeid);
            return dbase.ExecuteDataSet(dbcmd);
        }
        public DataTable Get_Pay_Person_By_ID(int paypersonID)
        {
            dbcmd = dbase.GetStoredProcCommand("[IRA_Get_Pay_Person_By_ID_SP]");
            dbase.AddInParameter(dbcmd, "@IN_ID", DbType.Int32, paypersonID);
            return dbase.ExecuteDataSet(dbcmd).Tables[0];
        }
        public DataTable Get_All_Attendees()
        {
            dbcmd = dbase.GetStoredProcCommand("[IRA_Get_All_Attendees]");
            return dbase.ExecuteDataSet(dbcmd).Tables[0];
        }
        public DataTable GetSearchResults(string firstname,string lastname,string email,string phone,string company)
        {
            dbcmd = dbase.GetStoredProcCommand("[IRA_SearchAll_SP]");
            dbase.AddInParameter(dbcmd, "@firstname", DbType.String, firstname);
            dbase.AddInParameter(dbcmd, "@lastname", DbType.String, lastname);
            dbase.AddInParameter(dbcmd, "@emailid", DbType.String, email);
            dbase.AddInParameter(dbcmd, "@phone", DbType.String, phone);
            dbase.AddInParameter(dbcmd, "@company", DbType.String, company);
            return dbase.ExecuteDataSet(dbcmd).Tables[0];
        }
        public DataTable getDuplicates(string tempduptable)
        {
            dbcmd = dbase.GetStoredProcCommand("Get_Duplicates_SP");
            dbase.AddInParameter(dbcmd, "@TempDuplicateTable", DbType.String, tempduptable);
            return dbase.ExecuteDataSet(dbcmd).Tables[0];
        }
        public DataTable getNotes_By_Attendee(int attendeeid)
        {
            dbcmd = dbase.GetStoredProcCommand("Get_Notes_SP");
            dbase.AddInParameter(dbcmd, "@attendeeid", DbType.Int32,attendeeid);
            return dbase.ExecuteDataSet(dbcmd).Tables[0];
        
        }
        public void InsertNotes_By_Attendee(ref int notesid,int attendeeid,string notes)
        {
            dbcmd = dbase.GetStoredProcCommand("Insert_Attendee_Notes_SP");
            dbase.AddInParameter(dbcmd, "@attendeeid", DbType.Int32,attendeeid);
            dbase.AddOutParameter(dbcmd, "@notesid", DbType.Int64, 8);
            dbase.AddInParameter(dbcmd, "@notes", DbType.String , notes);
            dbase.ExecuteNonQuery(dbcmd);

            notesid = int.Parse(dbase.GetParameterValue(dbcmd, "@notesid").ToString());
        
        }
        public void updateNotes_By_Attendee(int notesid,string notes)
        {
            dbcmd = dbase.GetStoredProcCommand("Update_Attendee_Notes_SP");
            dbase.AddInParameter(dbcmd, "@notesid", DbType.Int32, notesid);
            dbase.AddInParameter(dbcmd, "@notes", DbType.String, notes);
            dbase.ExecuteNonQuery(dbcmd);
        }

        public void deleteNotes_By_Attendee(int notesid)
        {
            dbcmd = dbase.GetStoredProcCommand("Delete_Attendee_Notes_SP");
            dbase.AddInParameter(dbcmd, "@notesid", DbType.Int32, notesid);
            dbase.ExecuteNonQuery(dbcmd);
        }

        public DataTable getNotes_By_Contri(int contriID)
        {
            dbcmd = dbase.GetStoredProcCommand("Get_ContriNotes_SP");
            dbase.AddInParameter(dbcmd, "@contrid", DbType.Int32, contriID);
            return dbase.ExecuteDataSet(dbcmd).Tables[0];
        }

        public void InsertNotes_By_Contri(ref int notesid, int contriID, string notes)
        {
            dbcmd = dbase.GetStoredProcCommand("Insert_Contri_Notes_SP");
            dbase.AddInParameter(dbcmd, "@contrid", DbType.Int32, contriID);
            dbase.AddOutParameter(dbcmd, "@notesid", DbType.Int64, 8);
            dbase.AddInParameter(dbcmd, "@notes", DbType.String, notes);
            dbase.ExecuteNonQuery(dbcmd);

            notesid = int.Parse(dbase.GetParameterValue(dbcmd, "@notesid").ToString());

        }

        public void updateNotes_By_Contri(int notesid, string notes)
        {
            dbcmd = dbase.GetStoredProcCommand("Update_Contri_Notes_SP");
            dbase.AddInParameter(dbcmd, "@notesid", DbType.Int32, notesid);
            dbase.AddInParameter(dbcmd, "@notes", DbType.String, notes);
            dbase.ExecuteNonQuery(dbcmd);
        }

        public void deleteNotes_By_Contri(int notesid)
        {
            dbcmd = dbase.GetStoredProcCommand("Delete_Contri_Notes_SP");
            dbase.AddInParameter(dbcmd, "@notesid", DbType.Int32, notesid);
            dbase.ExecuteNonQuery(dbcmd);
        }
        //To Delete Attendee Or Contributor Order
        public void deleteOrder(int orderID,string orderType)
        {
            dbcmd = dbase.GetStoredProcCommand("DeleteOrder_SP");
            dbase.AddInParameter(dbcmd, "@OrderID", DbType.Int32, orderID);
            dbase.AddInParameter(dbcmd, "@OrderType", DbType.String, orderType);
            dbase.ExecuteNonQuery(dbcmd);
        }
        //To Delete Donor Order
        public void deleteDonorOrder(int orderID)
        {
            dbcmd = dbase.GetStoredProcCommand("DeleteDonorOrder_SP");
            dbase.AddInParameter(dbcmd, "@OrderID", DbType.Int32, orderID);
            dbase.ExecuteNonQuery(dbcmd);
        }
        public void deleteAttendeeByID(int attendeeID)
        {
            dbcmd = dbase.GetStoredProcCommand("DeleteAttendeeByID");
            dbase.AddInParameter(dbcmd, "@AttendeeID", DbType.Int32, attendeeID);
            dbase.ExecuteNonQuery(dbcmd);
        }
        public void createTempDuplicateTable(string tempduptable)
        {
            dbcmd = dbase.GetStoredProcCommand("create_Temp_Duplicate_Table");
            dbase.AddInParameter(dbcmd, "@TempDuplicateTable", DbType.String, tempduptable);
            dbase.ExecuteNonQuery(dbcmd);
        }
        public void deleteTempDuplicateTable(string tempduptable)
        {
            dbcmd = dbase.GetStoredProcCommand("delete_Temp_Duplicate_Table");
            dbase.AddInParameter(dbcmd, "@TempDuplicateTable", DbType.String, tempduptable);
            dbase.ExecuteNonQuery(dbcmd);
        }
        public DataTable showDuplicateEmails()
        {
            dbcmd = dbase.GetStoredProcCommand("Find_Duplicate_Emails_SP");
            return dbase.ExecuteDataSet(dbcmd).Tables[0];
        }
        public DataTable Get_Pay_Person_By_ID_CC(int paypersonID)
        {
            dbcmd = dbase.GetStoredProcCommand("[Get_Pay_Person_By_ID_CC_SP]");
            dbase.AddInParameter(dbcmd, "@IN_ID", DbType.Int32, paypersonID);
            return dbase.ExecuteDataSet(dbcmd).Tables[0];
        }
        public DataTable Get_Pay_Attendee_By_ResID(int paypersonID)
        {
            dbcmd = dbase.GetStoredProcCommand("[get_tbl_inf_by_resid]");
            dbase.AddInParameter(dbcmd, "@resid", DbType.Int32, paypersonID);
            return dbase.ExecuteDataSet(dbcmd).Tables[0];
        }
        public DataTable Get_Pay_Person_By_ID_Cheque(int paypersonID)
        {
            dbcmd = dbase.GetStoredProcCommand("[Get_Pay_Person_By_ID_Cheque_SP]");
            dbase.AddInParameter(dbcmd, "@IN_ID", DbType.Int32, paypersonID);
            return dbase.ExecuteDataSet(dbcmd).Tables[0];
        }
        public DataTable Get_UnDeliveredMail(int paypersonID)
        {
            dbcmd = dbase.GetStoredProcCommand("getUnDeliveredMail_SP");
            dbase.AddInParameter(dbcmd, "@id", DbType.Int32, paypersonID);
            return dbase.ExecuteDataSet(dbcmd).Tables[0];
        }
        public DataTable Get_UnDeliveredMails()
        {
            dbcmd = dbase.GetStoredProcCommand("getUnDeliveredMails_SP");
            return dbase.ExecuteDataSet(dbcmd).Tables[0];
        }
        
        public void InsertUnDeliveredMail(int paypersonID,string firstname,string lastname,string payPersonEmail,string EmailContent,string PaymentMode,string ErrorMessage)
        {
            dbcmd = dbase.GetStoredProcCommand("InsertUnDeliveredMails_SP");
            dbase.AddInParameter(dbcmd, "@id", DbType.Int32, paypersonID);
            dbase.AddInParameter(dbcmd, "@firstname", DbType.String, firstname);
            dbase.AddInParameter(dbcmd, "@lastname", DbType.String, lastname);
            dbase.AddInParameter(dbcmd, "@Email", DbType.String, payPersonEmail);
            dbase.AddInParameter(dbcmd, "@EmailContent", DbType.String, EmailContent);
            dbase.AddInParameter(dbcmd, "@PaymentMode", DbType.String, PaymentMode);
            dbase.AddInParameter(dbcmd, "@ErrorMessage", DbType.String, ErrorMessage);
            dbase.ExecuteNonQuery(dbcmd);
        }
        public void DeleteUnDeliveredMail(int paypersonID)
        {
            dbcmd = dbase.GetStoredProcCommand("deleteUnDeliveredMail_SP");
            dbase.AddInParameter(dbcmd, "@id", DbType.Int32, paypersonID);
            dbase.ExecuteNonQuery(dbcmd);
        }
        public void UpdateUnDeliveredMailStatus(int paypersonID,string deliverystatus)
        {
            dbcmd = dbase.GetStoredProcCommand("UpdateUnDeliveredMailStatus_SP");
            dbase.AddInParameter(dbcmd, "@id", DbType.Int32, paypersonID);
            dbase.AddInParameter(dbcmd, "@Delivered", DbType.String, deliverystatus);
            dbase.ExecuteNonQuery(dbcmd);
        }
        

    }

}

