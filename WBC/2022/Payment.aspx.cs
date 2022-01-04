using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using ISCRegDAL;
using System.Text;
using System.Globalization;

public partial class Default2 : SSLHelper
{
    protected override void OnInit(EventArgs e)
    {

        //if (!Request.IsSecureConnection)
        //{
        //    SslTools.SwitchToSsl();

        //}

    }
    private string TransationID
    {
        get
        {
            if (ViewState["TransationID"] == null)
                ViewState["TransationID"] = string.Empty;
            return (string)ViewState["TransationID"];
        }
        set
        {
            ViewState["TransationID"] = value;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        DoDummyTest();

        DoAuthorizationAndPayment();
    }
    public void DoDummyTest()
    {
        if (Session["CreditCard"] != null)
        {
            CreditCard2014 objCredit = (CreditCard2014)Session["CreditCard"];
            string str = objCredit.cost.ToString();
        }

    }
    public static String RemoveDiacritics(String s)
    {
        String normalizedString = s.Normalize(NormalizationForm.FormD);
        StringBuilder stringBuilder = new StringBuilder();

        for (int i = 0; i < normalizedString.Length; i++)
        {
            Char c = normalizedString[i];
            if (CharUnicodeInfo.GetUnicodeCategory(c) != UnicodeCategory.NonSpacingMark)
                stringBuilder.Append(c);
        }

        return stringBuilder.ToString();
    }
    private void DoAuthorizationAndPayment()
    {
        AuthorizeNetRequest objAuthorizeNetRequest = new AuthorizeNetRequest();
        // This is the account information for merchant account given by Authorize.Net people in email 
        // I can see transaction history here. 
        if (Session["CreditCard"] != null)
        {
            CreditCard2014 objCredit = (CreditCard2014)Session["CreditCard"];
            objAuthorizeNetRequest.Login = "8yr77sXHE7"; // Live
            // objAuthorizeNetRequest.Login = "7wYB5c6R";
            //  objAuthorizeNetRequest.Amount = "1.00";//objCredit.cost.ToString();
            objAuthorizeNetRequest.CardNumber = objCredit.CreditCardNumber;   //"4007000000027";
            objAuthorizeNetRequest.FirstName = RemoveDiacritics(objCredit.FirstName);
            objAuthorizeNetRequest.LastName = RemoveDiacritics(objCredit.LastName);
            objAuthorizeNetRequest.Email = RemoveDiacritics(objCredit.Email);
            //objAuthorizeNetRequest.TransactionId = "1212121";
            objAuthorizeNetRequest.CardExpirationDate = objCredit.ExpiryMonth + "-" + objCredit.Expirydate.Substring(2, 2);
            objAuthorizeNetRequest.TransactionType = AuthorizeNet.TransactionType.AUTH_CAPTURE;
            // Below is the API created by me by registering for test account. 
            objAuthorizeNetRequest.TransactionKey = "659yYcdHRg274xMW"; // Live
            //objAuthorizeNetRequest.TransactionKey = "4px54kx6ZZ7489Gq";      
            objAuthorizeNetRequest.CompanyName = RemoveDiacritics(objCredit.CompanyName);
            if (objCredit.OtherCountry != null)
                objAuthorizeNetRequest.Country = RemoveDiacritics(objCredit.OtherCountry);
            else
                objAuthorizeNetRequest.Country = objCredit.Country;
            //objAuthorizeNetRequest.Country = "USA";
            if (objCredit.OtherState != null)
                objAuthorizeNetRequest.State = RemoveDiacritics(objCredit.OtherState);
            else
                objAuthorizeNetRequest.State = objCredit.State;
            if (Session["extraPer"] != null)
                if (Session["extraPer"].ToString() != "0")
                {
                    objAuthorizeNetRequest.Amount = (objCredit.cost + (Convert.ToInt32(Session["extraPer"]) * 2000)).ToString();//objAuthorizeNetRequest.Amount = "1.00";
                }
                else
                    objAuthorizeNetRequest.Amount = objCredit.cost.ToString();  //objAuthorizeNetRequest.Amount ="1.00";
            else
                objAuthorizeNetRequest.Amount = objCredit.cost.ToString();  // objAuthorizeNetRequest.Amount = "1.00";
            objAuthorizeNetRequest.City = RemoveDiacritics(objCredit.City);
            if (objCredit.OtherAddress != null)
                objAuthorizeNetRequest.Address = RemoveDiacritics(objCredit.Address.ToString() + ";" + objCredit.OtherAddress.ToString());
            else
                objAuthorizeNetRequest.Address = RemoveDiacritics(objCredit.Address.ToString());
            //objAuthorizeNetRequest.invoiceNumber = objCredit.invoiceNumber;
            objAuthorizeNetRequest.Phone = RemoveDiacritics(objCredit.Phone);
            objAuthorizeNetRequest.Zip = RemoveDiacritics(objCredit.Zip);

            AuthorizeNetResponse objAuthorizeNetResponse = AuthorizeNet.CallAuthorizeNetMethod(objAuthorizeNetRequest);
            lblTransType.Text = "Authorize And Capture";
            if (objAuthorizeNetResponse.IsSuccess)
            {
                UserServices objUserServices = new UserServices();
                Session["Confirm"] = objUserServices.Get_ConfirmNum();
                TransationID = objAuthorizeNetResponse.TransactionId;
                if (Request.QueryString["utype"].ToString() == "A")
                {
                    Attende2014[] objAttende = new Attende2014[int.Parse(Session["AttendeeCount"].ToString())];
                    objAttende = (Attende2014[])Session["Attendees"];
                    int x = 0;

                    if (Session["AdminOrder"] != null)
                        objUserServices.insertContriDonorInfo(ref x, 'A', objCredit.FirstName, objCredit.LastName, objCredit.CompanyName, objCredit.Title, objCredit.Email, objCredit.Phone, objCredit.Ext, objCredit.Country, objCredit.OtherCountry, objCredit.State, objCredit.OtherState, objCredit.City, objCredit.Address, objCredit.OtherAddress, objCredit.Zip, objCredit.CreditCardType, objCredit.CreditCardNumber, objCredit.SecurityCode, objCredit.ExpiryMonth, objCredit.Expirydate, objCredit.cost.ToString(), TransationID, Session["Confirm"].ToString(), "", objCredit.DonationIndOrg, "OVERRIDE", objCredit.TicketCount);
                    else
                        objUserServices.insertContriDonorInfo(ref x, 'A', objCredit.FirstName, objCredit.LastName, objCredit.CompanyName, objCredit.Title, objCredit.Email, objCredit.Phone, objCredit.Ext, objCredit.Country, objCredit.OtherCountry, objCredit.State, objCredit.OtherState, objCredit.City, objCredit.Address, objCredit.OtherAddress, objCredit.Zip, objCredit.CreditCardType, objCredit.CreditCardNumber, objCredit.SecurityCode, objCredit.ExpiryMonth, objCredit.Expirydate, objCredit.cost.ToString(), TransationID, Session["Confirm"].ToString(), "", objCredit.DonationIndOrg, "", objCredit.TicketCount);


                    for (int i = 0; i < int.Parse(Session["AttendeeCount"].ToString()); i++)
                    {

                        if (Session["AdminOrder"] != null)
                        {
                            objUserServices.Attendee_Add_NY2014(x, objAttende[i].FirstName, objAttende[i].LastName, objAttende[i].Organization, objAttende[i].Title, objAttende[i].Email, objAttende[i].Phone, objAttende[i].Ext, objAttende[i].country, objAttende[i].OtherCountry, objAttende[i].state, objAttende[i].OtherState, objAttende[i].AttendeeType, objAttende[i].Address, objAttende[i].OtherAddress, objAttende[i].city, objAttende[i].zip, Convert.ToDouble(objAttende[i].Price), "OVERRIDE", "CreditCard", objAttende[i].Cocktail, objAttende[i].NextWave, objAttende[i].SohnGeneralPartner);
                        }
                        else
                        {
                            objUserServices.Attendee_Add_NY2014(x, objAttende[i].FirstName, objAttende[i].LastName, objAttende[i].Organization, objAttende[i].Title, objAttende[i].Email, objAttende[i].Phone, objAttende[i].Ext, objAttende[i].country, objAttende[i].OtherCountry, objAttende[i].state, objAttende[i].OtherState, objAttende[i].AttendeeType, objAttende[i].Address, objAttende[i].OtherAddress, objAttende[i].city, objAttende[i].zip, Convert.ToDouble(objAttende[i].Price), "", "CreditCard", objAttende[i].Cocktail, objAttende[i].NextWave, objAttende[i].SohnGeneralPartner);
                        }
                    }
                }
                else if (Request.QueryString["utype"].ToString() == "S")
                {
                    Attende[] objAttende = new Attende[int.Parse(Session["AttendeeCount"].ToString())];
                    objAttende = (Attende[])Session["Attendees"];
                    int x = 0;

                    if (Session["AdminOrder"] != null)
                        objUserServices.insertContriDonorInfo(ref x, 'S', objCredit.FirstName, objCredit.LastName, objCredit.CompanyName, objCredit.Title, objCredit.Email, objCredit.Phone, objCredit.Ext, objCredit.Country, objCredit.OtherCountry, objCredit.State, objCredit.OtherState, objCredit.City, objCredit.Address, objCredit.OtherAddress, objCredit.Zip, objCredit.CreditCardType, objCredit.CreditCardNumber, objCredit.SecurityCode, objCredit.ExpiryMonth, objCredit.Expirydate, objCredit.cost.ToString(), TransationID, Session["Confirm"].ToString(), "", objCredit.DonationIndOrg, "OVERRIDE", objCredit.TicketCount);
                    else
                        objUserServices.insertContriDonorInfo(ref x, 'S', objCredit.FirstName, objCredit.LastName, objCredit.CompanyName, objCredit.Title, objCredit.Email, objCredit.Phone, objCredit.Ext, objCredit.Country, objCredit.OtherCountry, objCredit.State, objCredit.OtherState, objCredit.City, objCredit.Address, objCredit.OtherAddress, objCredit.Zip, objCredit.CreditCardType, objCredit.CreditCardNumber, objCredit.SecurityCode, objCredit.ExpiryMonth, objCredit.Expirydate, objCredit.cost.ToString(), TransationID, Session["Confirm"].ToString(), "", objCredit.DonationIndOrg, "", objCredit.TicketCount);


                    for (int i = 0; i < int.Parse(Session["AttendeeCount"].ToString()); i++)
                    {

                        if (Session["AdminOrder"] != null)
                        {
                            objUserServices.Attendee_Add(x, objAttende[i].FirstName, objAttende[i].LastName, objAttende[i].Organization, objAttende[i].Title, objAttende[i].Email, objAttende[i].Phone, objAttende[i].Ext, objAttende[i].country, objAttende[i].OtherCountry, objAttende[i].state, objAttende[i].OtherState, "Student Order", objAttende[i].Address, objAttende[i].OtherAddress, objAttende[i].city, objAttende[i].zip, Convert.ToDouble(objAttende[i].Price.Replace("$", "")), "OVERRIDE", "CreditCard");
                        }
                        else
                        {
                            objUserServices.Attendee_Add(x, objAttende[i].FirstName, objAttende[i].LastName, objAttende[i].Organization, objAttende[i].Title, objAttende[i].Email, objAttende[i].Phone, objAttende[i].Ext, objAttende[i].country, objAttende[i].OtherCountry, objAttende[i].state, objAttende[i].OtherState, "Student Order", objAttende[i].Address, objAttende[i].OtherAddress, objAttende[i].city, objAttende[i].zip, Convert.ToDouble(objAttende[i].Price.Replace("$", "")), "", "CreditCard");
                        }
                    }
                }
                else
                    if (Request.QueryString["utype"].ToString() == "D")
                    {
                        int Id = 0;
                        objUserServices.insertContriDonorInfo(ref Id, 'D', objCredit.FirstName, objCredit.LastName, objCredit.CompanyName, objCredit.Title, objCredit.Email, objCredit.Phone, objCredit.Ext, objCredit.Country, objCredit.OtherCountry, objCredit.State, objCredit.OtherState, objCredit.City, objCredit.Address, objCredit.OtherAddress, objCredit.Zip, objCredit.CreditCardType, objCredit.CreditCardNumber, objCredit.SecurityCode, objCredit.ExpiryMonth, objCredit.Expirydate, objCredit.cost.ToString(), TransationID, Session["Confirm"].ToString(), "", objCredit.DonationIndOrg, "", -1);
                        //   objUserServices.insert_temp_credit(0, objCredit.CreditCardType, objCredit.CreditCardNumber, objCredit.FirstName + ' ' + objCredit.LastName, objCredit.Expirydate, DateTime.Now, "credit card", double.Parse(Session["cost"].ToString()), false, 'D', TransationID, Session["Confirm"].ToString());
                    }
                    else
                    {
                        int Id = 0;
                        if (Session["extraPer"].ToString() != "0")
                        {
                            if (Session["AdminOrder"] != null)
                                objUserServices.insertContriDonorInfo(ref Id, 'C', objCredit.FirstName, objCredit.LastName, objCredit.CompanyName, objCredit.Title, objCredit.Email, objCredit.Phone, objCredit.Ext, objCredit.Country, objCredit.OtherCountry, objCredit.State, objCredit.OtherState, objCredit.City, objCredit.Address, objCredit.OtherAddress, objCredit.Zip, objCredit.CreditCardType, objCredit.CreditCardNumber, objCredit.SecurityCode, objCredit.ExpiryMonth, objCredit.Expirydate, (objCredit.cost + (Convert.ToInt32(Session["extraPer"]) * 2000)).ToString(), TransationID, Session["Confirm"].ToString(), Session["level"].ToString(), objCredit.DonationIndOrg, "OVERRIDE", objCredit.TicketCount + Convert.ToInt32(Session["extraPer"]));
                            else
                                objUserServices.insertContriDonorInfo(ref Id, 'C', objCredit.FirstName, objCredit.LastName, objCredit.CompanyName, objCredit.Title, objCredit.Email, objCredit.Phone, objCredit.Ext, objCredit.Country, objCredit.OtherCountry, objCredit.State, objCredit.OtherState, objCredit.City, objCredit.Address, objCredit.OtherAddress, objCredit.Zip, objCredit.CreditCardType, objCredit.CreditCardNumber, objCredit.SecurityCode, objCredit.ExpiryMonth, objCredit.Expirydate, (objCredit.cost + (Convert.ToInt32(Session["extraPer"]) * 2000)).ToString(), TransationID, Session["Confirm"].ToString(), Session["level"].ToString(), objCredit.DonationIndOrg, "", objCredit.TicketCount + Convert.ToInt32(Session["extraPer"]));
                        }
                        else
                        {
                            if (Session["AdminOrder"] != null)
                                objUserServices.insertContriDonorInfo(ref Id, 'C', objCredit.FirstName, objCredit.LastName, objCredit.CompanyName, objCredit.Title, objCredit.Email, objCredit.Phone, objCredit.Ext, objCredit.Country, objCredit.OtherCountry, objCredit.State, objCredit.OtherState, objCredit.City, objCredit.Address, objCredit.OtherAddress, objCredit.Zip, objCredit.CreditCardType, objCredit.CreditCardNumber, objCredit.SecurityCode, objCredit.ExpiryMonth, objCredit.Expirydate, objCredit.cost.ToString(), TransationID, Session["Confirm"].ToString(), Session["level"].ToString(), objCredit.DonationIndOrg, "OVERRIDE", objCredit.TicketCount);
                            else
                                objUserServices.insertContriDonorInfo(ref Id, 'C', objCredit.FirstName, objCredit.LastName, objCredit.CompanyName, objCredit.Title, objCredit.Email, objCredit.Phone, objCredit.Ext, objCredit.Country, objCredit.OtherCountry, objCredit.State, objCredit.OtherState, objCredit.City, objCredit.Address, objCredit.OtherAddress, objCredit.Zip, objCredit.CreditCardType, objCredit.CreditCardNumber, objCredit.SecurityCode, objCredit.ExpiryMonth, objCredit.Expirydate, objCredit.cost.ToString(), TransationID, Session["Confirm"].ToString(), Session["level"].ToString(), objCredit.DonationIndOrg, "", objCredit.TicketCount);
                        }

                        if (Session["level"] != null)
                        {
                            //UserServices objUserServices = new UserServices();
                            DataTable objDt = objUserServices.Get_All_Charges();
                            int attendees;
                            if (Session["AdminOrder"] != null)
                                attendees = int.Parse(Session["AdminAttendees"].ToString());
                            else if (Session["level"].ToString() == "Champion")
                                attendees = int.Parse(objDt.Rows[0]["ChampionAttendees"].ToString());
                            else if (Session["level"].ToString() == "Benefactor")
                                attendees = int.Parse(objDt.Rows[0]["BenefactorAttendees"].ToString());
                            else if (Session["level"].ToString() == "Patron")
                                attendees = int.Parse(objDt.Rows[0]["PatronAttendees"].ToString());
                            else if (Session["level"].ToString() == "Sponsor")
                                attendees = int.Parse(objDt.Rows[0]["SponsorAttendees"].ToString());
                            else
                                attendees = int.Parse(objDt.Rows[0]["SupportorAttendees"].ToString());
                            if (Session["extraPer"].ToString() != "0")
                            {
                                for (int i = 1; i <= attendees + Convert.ToInt32(Session["extraPer"]); i++)
                                {

                                    if (Session["AdminOrder"] != null)
                                        objUserServices.Attendee_Add_NY2014(Id, Session["Confirm"].ToString(), i.ToString() + " of" + attendees.ToString(), objCredit.CompanyName, objCredit.Title, objCredit.Email, objCredit.Phone, objCredit.Ext, objCredit.Country, objCredit.OtherCountry, objCredit.State, objCredit.OtherState, Session["level"].ToString(), objCredit.Address, objCredit.OtherAddress, objCredit.City, objCredit.Zip, -1.0, "OVERRIDE", "CreditCard", objCredit.Cocktail, objCredit.NextWave,objCredit.SohnGeneralPartner);
                                    else
                                        objUserServices.Attendee_Add_NY2014(Id, Session["Confirm"].ToString(), i.ToString() + " of" + attendees.ToString(), objCredit.CompanyName, objCredit.Title, objCredit.Email, objCredit.Phone, objCredit.Ext, objCredit.Country, objCredit.OtherCountry, objCredit.State, objCredit.OtherState, Session["level"].ToString(), objCredit.Address, objCredit.OtherAddress, objCredit.City, objCredit.Zip, -1.0, "", "CreditCard", objCredit.Cocktail, objCredit.NextWave, objCredit.SohnGeneralPartner);

                                }
                            }
                            else
                            {
                                for (int i = 1; i <= attendees; i++)
                                {

                                    if (Session["AdminOrder"] != null)
                                        objUserServices.Attendee_Add_NY2014(Id, Session["Confirm"].ToString(), i.ToString() + " of" + attendees.ToString(), objCredit.CompanyName, objCredit.Title, objCredit.Email, objCredit.Phone, objCredit.Ext, objCredit.Country, objCredit.OtherCountry, objCredit.State, objCredit.OtherState, Session["level"].ToString(), objCredit.Address, objCredit.OtherAddress, objCredit.City, objCredit.Zip, -1.0, "OVERRIDE", "CreditCard", objCredit.Cocktail, objCredit.NextWave, objCredit.SohnGeneralPartner);
                                    else
                                        objUserServices.Attendee_Add_NY2014(Id, Session["Confirm"].ToString(), i.ToString() + " of" + attendees.ToString(), objCredit.CompanyName, objCredit.Title, objCredit.Email, objCredit.Phone, objCredit.Ext, objCredit.Country, objCredit.OtherCountry, objCredit.State, objCredit.OtherState, Session["level"].ToString(), objCredit.Address, objCredit.OtherAddress, objCredit.City, objCredit.Zip, -1.0, "", "CreditCard", objCredit.Cocktail, objCredit.NextWave, objCredit.SohnGeneralPartner);

                                }
                            }


                        }




                    }

                string creditCard = "Transaction Details :<br/><br/>";
                if (objAuthorizeNetResponse.TransactionId.ToString() != "")
                    Session["tid"] = objAuthorizeNetResponse.TransactionId.ToString();
                creditCard = creditCard + "<p style='font-weight:normal;'>";
                //creditCard = creditCard + "Credit Card Number : " + "<b>" + objAuthorizeNetResponse.CardNumber + "</b>" + "<br/>" +
                creditCard = creditCard + "Credit Card Holder Name : " + "<b>" + objAuthorizeNetResponse.FirstName + " " + objAuthorizeNetResponse.LastName + "</b>" + "<br/>" +
                      "Amount : " + "<b>" + objAuthorizeNetResponse.Amount + "</b>" + "<br/>" +
                     "Transaction Id : " + "<b>" + objAuthorizeNetResponse.TransactionId.ToString() + "</b>" + "<br/>" + "<br/>" +
                      "Billing Information :" + "<br/>" + "First Name: " + "<b>" + objAuthorizeNetResponse.FirstName + "</b>" + "<br/>" +
                      "Last Name: " + "<b>" + objAuthorizeNetResponse.LastName + "</b>" + "<br/>" +
                      "Company Name: " + "<b>" + objAuthorizeNetResponse.CompanyName + "</b>" + "<br/>" +
                      "Country: " + "<b>" + objAuthorizeNetResponse.Country + "</b>" + "<br/>" + "State: " + "<b>" + objAuthorizeNetResponse.State + "</b>" + "<br/>" +
                      "City: " + "<b>" + objAuthorizeNetResponse.City + "</b>" + "<br/>" + "Zip: " + "<b>" + objAuthorizeNetResponse.Zip + "</b>";
                creditCard = creditCard + "</p><br />";
                Session["res"] = creditCard;
                Session["cost"] = objAuthorizeNetResponse.Amount;





                if (Request.QueryString["utype"] != null)
                {
                    if (Request.QueryString["utype"].ToString() == "A")
                        Response.Redirect("Confirmation_CC.aspx");//?transid=" + objAuthorizeNetResponse.TransactionId);
                    else
                        if (Request.QueryString["utype"].ToString() == "D")
                        {
                            Response.Redirect("donorCC_Confirm.aspx");
                        }
                        else if (Request.QueryString["utype"].ToString() == "S")
                        {
                            Response.Redirect("Studentconfirmation.aspx");
                        }
                        else
                        {

                            Response.Redirect("contri_Cc_Confirm.aspx");
                        }
                }





                //lblMessage.Text = "Success. Transaction ID : " + objAuthorizeNetResponse.TransactionId;
            }
            else
            {
                Session["Error"] = "Error : " + objAuthorizeNetResponse.Errors;
                if (Request.QueryString["utype"] != null)
                {
                    if (Request.QueryString["utype"].ToString() == "A")
                        Response.Redirect("AttendePayInfo.aspx");
                    else if (Request.QueryString["utype"].ToString() == "S")
                        Response.Redirect("StudentPayInfo.aspx");
                    else if (Request.QueryString["utype"].ToString() == "D")
                    {
                        Response.Redirect("donorpayinfo.aspx");
                    }
                    else
                    {
                        Response.Redirect("ContriPayInfo.aspx");
                    }
                }
            }
        }
    }
}
