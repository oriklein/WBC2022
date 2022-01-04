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

public partial class AttendePayInfo : SSLHelper
{
    UserServices objUserServices = new UserServices();
    string Mad = "";
    double extra = 0;
    protected override void OnInit(EventArgs e)
    {

        //if (!Request.IsSecureConnection)
        //{
        //    SslTools.SwitchToSsl();
        //}

    }
    Attende2014[] objAttende;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["extraPer"].ToString() == "1")
        {
            Mad = "Full Page Ad in MAD Event Journal ($250)";
            extra = 250;
        }
        else if (Session["extraPer"].ToString() == "2")
        {
            Mad = "Half Page Ad in MAD Event Journal ($150)";
            extra = 150;
        }
        else if (Session["extraPer"].ToString() == "3")
        {
            Mad = "Member, Ad already included";
            extra = 0;
        }
        form1.Action = Request.RawUrl;
        if (Session["AdminOrder"] != null)
            if (Session["userid"] == null)
                Response.Redirect("Bo/Bo_Login.aspx");
            else
                divAdmin.Visible = true;
        else
            divAdmin.Visible = false;


        lblStatus.Visible = false;
              
        if (Session["cost"] == null)
        {
            if (Session["CreditCard"] == null || Session["AttendiCheque"] == null)
            {
                string msg = "<script language='JavaScript'>window.alert('Your Session Has Expired.');</script>";
                Page.RegisterStartupScript("strScript", msg);
                Response.Redirect("Oops.htm");
            }
        }
       dvUserInfo.InnerHtml = Session["userInfo"].ToString();
       decimal Damt = decimal.Parse(Session["cost"].ToString());
       if (Session["Error"] != null)
       {
           ddlCardType.SelectedIndex = 1;
           paymentView.ActiveViewIndex = 1;
           lblStatus.Visible = true;
           lblStatus.Text = Session["Error"].ToString() + "    Please try Again ";
           
		   CreditCard2014 objCreditCard = new CreditCard2014();
           objCreditCard = (CreditCard2014)Session["CreditCard"];
           txtCreditCardNo.Value = objCreditCard.CreditCardNumber;
           Session["Error"] = null;
           //if (objCreditCard.OtherCountry != "")
           //    ddlCountry1.SelectedIndex = ddlCountry1.Items.IndexOf(new ListItem(objCreditCard.Country));
           //else
           //    txtCountry1.Value = objCreditCard.OtherCountry;
           //if (objCreditCard.OtherState != "")
           //    ddlState1.SelectedIndex = ddlState1.Items.IndexOf(new ListItem(objCreditCard.State));
           //else
           //    txtState1.Value = objCreditCard.OtherState;
           ddlExpirationMonth.SelectedIndex = ddlExpirationMonth.Items.IndexOf(new ListItem(objCreditCard.ExpiryMonth));
           ddlExpirationDate.SelectedIndex = ddlExpirationDate.Items.IndexOf(new ListItem(objCreditCard.Expirydate));
           ddlCreditCardType.SelectedIndex = ddlCreditCardType.Items.IndexOf(new ListItem(objCreditCard.CreditCardType));
           txtSecurityCode.Value = objCreditCard.SecurityCode;
           //objCreditCard.Expirydate = ddlExpirationMonth.Items[ddlExpirationMonth.SelectedIndex].Text + "-" + ddlExpirationDate.Items[ddlExpirationDate.SelectedIndex].Text.Substring(2, 2);
           txtFirstName1.Value = objCreditCard.FirstName;
           txtLastName1.Value = objCreditCard.LastName;
           txtEmail1.Value = objCreditCard.Email;

           if (objCreditCard.OtherCountry != null)
           {
               ddlCountry1.Attributes.Add("style", "display:block;");
               //txtCountry1.Attributes.Add("style","display:block;width: 130px; float:right; margin:0 0 0 10px");
               ddlCountry1.SelectedIndex = ddlCountry1.Items.IndexOf(new ListItem("Other"));
               txtCountry1.Attributes.Add("style", "display:block;");
               ddlState1.Attributes.Add("style", "display:none;");
               txtState1.Attributes.Add("style", "display:block;");
               txtCountry1.Value = objCreditCard.OtherCountry;
               txtState1.Value = objCreditCard.OtherState;
           }
           else
           {
               txtCountry1.Attributes.Add("style", "display:none;");
               ddlState1.Attributes.Add("style", "display:block;");
               txtState1.Attributes.Add("style", "display:none;");
              
               ddlCountry1.SelectedIndex = ddlCountry1.Items.IndexOf(new ListItem(objCreditCard.Country));
               ddlState1.SelectedIndex = ddlState1.Items.IndexOf(new ListItem(objCreditCard.State));
           }
           
           txtTitle1.Value = objCreditCard.Title;
           txtCompnayName1.Value = objCreditCard.CompanyName;
           txtZip1.Value=objCreditCard.Zip;
           txtPhone1.Value=objCreditCard.Phone;
           txtCity1.Value=objCreditCard.City;
           txtExt1.Value= objCreditCard.Ext ;
           txtAddress1.Value = objCreditCard.Address;
           txtAddress12.Value = objCreditCard.OtherAddress;
            //=  + " " + txtAddress21.Value;


       }
       if (Damt >= 5000)
       {
           divPay.Visible = false;
       }

       if (Damt >= 0)
       {if(!Page.IsPostBack)
           ddlCardType.Items.RemoveAt(0);
            ListItem itemToRemove = ddlCardType.Items.FindByValue("1");
            if (itemToRemove != null)
            {
                ddlCardType.Items.Remove(itemToRemove);
            }        
           paymentView.ActiveViewIndex = 2;
           //ddlCardType.SelectedIndex = 2;
           //ddlCardType.Enabled = false;
       }
    }
    protected void btnNext_Click(object sender, EventArgs e)
    {
        CreditCard2014 objCreditCard = new CreditCard2014();
        objCreditCard.CreditCardNumber = txtCreditCardNo.Value;
        objCreditCard.CreditCardType = ddlCreditCardType.Items[ddlCreditCardType.SelectedIndex].Text;
        objCreditCard.SecurityCode = txtSecurityCode.Value;
        objCreditCard.Expirydate =  ddlExpirationDate.Items[ddlExpirationDate.SelectedIndex].Text;
        objCreditCard.ExpiryMonth = ddlExpirationMonth.Items[ddlExpirationMonth.SelectedIndex].Text;
        objCreditCard.FirstName = txtFirstName1.Value;
        objCreditCard.LastName = txtLastName1.Value;
        objCreditCard.CompanyName = txtCompnayName1.Value;
        objCreditCard.cost = double.Parse(Session["cost"].ToString());
        objCreditCard.Email = txtEmail1.Value;
        objCreditCard.Title = txtTitle1.Value; 
        objCreditCard.Zip = txtZip1.Value;
        objCreditCard.Phone = txtPhone1.Value;
        objCreditCard.invoiceNumber = Guid.NewGuid().ToString().Substring(1, 5);
        objCreditCard.City = txtCity1.Value;
        if (ddlEmailSettings.Items[ddlEmailSettings.SelectedIndex].Text == "Attendee 1")
            Session["EmailCount"] = "0";
        else if (ddlEmailSettings.Items[ddlEmailSettings.SelectedIndex].Text == "Email Address below")
            Session["EmailCount"] = txtEmail1.Value;
        else
            Session["EmailCount"] = "All";
        
            if (ddlCountry1.Items[ddlCountry1.SelectedIndex].Text == "Other")
                objCreditCard.OtherCountry = txtCountry1.Value;
            else
                objCreditCard.Country = ddlCountry1.Items[ddlCountry1.SelectedIndex].Text;
        if (ddlCountry1.Items[ddlCountry1.SelectedIndex].Text == "Other")
            objCreditCard.OtherState = txtState1.Value;
        else
            objCreditCard.State = ddlState1.Items[ddlState1.SelectedIndex].Text;
        if (txtAddress1.Value != "")
            objCreditCard.Address = txtAddress1.Value;
        if (txtAddress12.Value != "")
            objCreditCard.OtherAddress = txtAddress12.Value;
        objCreditCard.Ext = txtExt1.Value;
        objCreditCard.Cocktail = "";
        //Added by Gopi for Donation Ind/Org
        objCreditCard.DonationIndOrg = txtIndOrg1.Text;
        objCreditCard.NextWave = "";
        objCreditCard.SohnGeneralPartner = "";
        objCreditCard.TicketCount = Convert.ToInt32(Session["AttendeeCount"]);




        //Session["EmailSettings"] = ddlEmailSettings.SelectedIndex.ToString();
        ///extra code for Index 2 (below textbox)

        Session["CreditCard"] = objCreditCard;

        Response.Redirect("Payment.aspx?utype=A");
    }
    protected void btnEditAttendee_Click(object sender, EventArgs e)
    {
        Response.Redirect("updateAttendees.aspx");
    }
    protected void chkSame_CheckedChanged(object sender, EventArgs e)
    {
        objAttende = new Attende2014[int.Parse(Session["AttendeeCount"].ToString())];
        objAttende = (Attende2014[])Session["Attendees"];
        txtFirstName1.Value = objAttende[0].FirstName;
        txtLastName1.Value = objAttende[0].LastName;
        //txtOrganization1.Value = objAttende[0].Organization;
        //txtTitle1.Value = objAttende[0].Title;
        txtEmail1.Value = objAttende[0].Email;
        Session["EmailSettings"] = objAttende[0].Email;
        txtPhone1.Value = objAttende[0].Phone;
        txtExt1.Value = objAttende[0].Ext;
        txtAddress1.Value = objAttende[0].Address;
        // =  + " " + txtAddress21.Value;
        if (objAttende[0].OtherCountry != "")
        {
            ddlCountry1.Attributes.Add("style", "display:block;");
            //txtCountry1.Attributes.Add("style","display:block;width: 130px; float:right; margin:0 0 0 10px");
            ddlCountry1.SelectedIndex = ddlCountry1.Items.IndexOf(new ListItem("Other"));
            txtCountry1.Attributes.Add("style", "display:block;");
            ddlState1.Attributes.Add("style", "display:none;");
            txtState1.Attributes.Add("style", "display:block;");
            txtCountry1.Value = objAttende[0].OtherCountry;
            txtState1.Value = objAttende[0].OtherState;
        }
        else
        {
            txtCountry1.Attributes.Add("style", "display:none;");
            ddlState1.Attributes.Add("style", "display:block;");
            txtState1.Attributes.Add("style", "display:none;");

            ddlCountry1.SelectedIndex = ddlCountry1.Items.IndexOf(new ListItem(objAttende[0].country));
            ddlState1.SelectedIndex = ddlState1.Items.IndexOf(new ListItem(objAttende[0].state));
        }
        
            txtTitle1.Value = objAttende[0].Title;
            txtAddress12.Value = objAttende[0].OtherAddress;
            txtCity1.Value = objAttende[0].city;
            txtZip1.Value = objAttende[0].zip;
            txtCompnayName1.Value = objAttende[0].Organization;
        //txtSpecialNeeds1.Value = objAttende[0].specialNeeds;
        //ddlAttendeType1.Items.FindByText(objAttende[0].AttendeeType).Selected = true;
    }
    protected void chkSame_CheckedChanged1(object sender, EventArgs e)
    {
        objAttende = new Attende2014[int.Parse(Session["AttendeeCount"].ToString())];
        objAttende = (Attende2014[])Session["Attendees"];
                //ddlAttendeType1.Items.FindByText(objAttende[0].AttendeeType).Selected = true;
        txtFirstName2.Value = objAttende[0].FirstName;
        txtLastName2.Value = objAttende[0].LastName;
        txtTitles.Value = objAttende[0].Title;
        //txtTitle1.Value = objAttende[0].Title;
        txtEmail2.Value = objAttende[0].Email;
        Session["EmailSettings"] = objAttende[0].Email;
        txtPhone2.Value = objAttende[0].Phone;
        txtExt2.Value = objAttende[0].Ext;
        txtAddress2.Value = objAttende[0].Address;
        // =  + " " + txtAddress21.Value;

        if (objAttende[0].OtherCountry != "")
        {
            ddlCountry2.Attributes.Add("style", "display:block;");
            //txtCountry1.Attributes.Add("style","display:block;width: 130px; float:right; margin:0 0 0 10px");
            ddlCountry2.SelectedIndex = ddlCountry2.Items.IndexOf(new ListItem("Other"));
            txtCountry2.Attributes.Add("style", "display:block;");
            ddlState3.Attributes.Add("style", "display:none;");
            txtState2.Attributes.Add("style", "display:block;");
            txtCountry2.Value = objAttende[0].OtherCountry;
            txtState2.Value = objAttende[0].OtherState;
        }
        else
        {

            txtCountry2.Attributes.Add("style", "display:none;");
            ddlState3.Attributes.Add("style", "display:block;");
            txtState2.Attributes.Add("style", "display:none;");

            ddlCountry2.SelectedIndex = ddlCountry2.Items.IndexOf(new ListItem(objAttende[0].country));
            ddlState3.SelectedIndex = ddlState3.Items.IndexOf(new ListItem(objAttende[0].state));
                        
        }
       
        txtCompany2.Value = objAttende[0].Organization;
        txtAddress21.Value = objAttende[0].OtherAddress;
        txtCity2.Value = objAttende[0].city;
        txtZip2.Value = objAttende[0].zip;
        //txtSpecialNeeds1.Value = objAttende[0].specialNeeds;
       
    }
    protected void btnChequeNext_Click(object sender, EventArgs e)
    {
        UserServices obj = new UserServices();
        Cheque objCheque = new Cheque();

       
            objCheque.cost = double.Parse(Session["cost"].ToString());
            objCheque.FirstName = txtFirstName2.Value;
            objCheque.LastName = txtLastName2.Value;
            objCheque.company = txtCompany2.Value;
            objCheque.Title = txtTitles.Value;
            objCheque.Email = txtEmail2.Value;
            objCheque.WbcName = txtWBCS.Value;

            Session["EmailSettings"] = txtEmail2.Value;
            objCheque.Phone = txtPhone2.Value;
            objCheque.Ext = txtExt2.Value;
            objCheque.Address = txtAddress2.Value;
            objCheque.OtherAddress = txtAddress21.Value;
            objCheque.Year =selPart.SelectedIndex==0?"No": selYear.Value;
            if (ddlCountry2.Items[ddlCountry2.SelectedIndex].Text == "Other")
            {
                objCheque.Country = txtCountry2.Value;
                objCheque.State = txtState2.Value;
            }
            else
            {
                objCheque.Country = ddlCountry2.Items[ddlCountry2.SelectedIndex].Text;
                objCheque.State = ddlState3.Items[ddlState3.SelectedIndex].Text;
            }

            if (ddlEmailSettingsCheque.Items[ddlEmailSettingsCheque.SelectedIndex].Text == "DO NOT Send Confirmation email")
                Session["EmailCount"] = "0";
            else
                Session["EmailCount"] = "1";
            //else
            //    Session["EmailCount"] = "All";

            objCheque.Aware =Server.HtmlEncode( txtAware.Value);
            objCheque.City = txtCity2.Value;
            objCheque.Zip = txtZip2.Value;

            //Added by Gopi for Donation Ind/Org
            objCheque.IndOrg  = txtIndOrg.Text;

            objCheque.TicketCount = Convert.ToInt32(Session["AttendeeCount"]);

            Session["AttendiCheque"] = objCheque;
            int OutId = 0;
            Session["Confirm"] = obj.Get_CheckConfirmNum();
            Attende2014[] objAttende = new Attende2014[int.Parse(Session["AttendeeCount"].ToString())];
            objAttende = (Attende2014[])Session["Attendees"];

            string paymenttype = "";
            if (rdCheck.Checked == true)
                paymenttype = "Check";
            else if(rdWire.Checked == true)
                paymenttype = "Wire Transfer";
        else
                paymenttype = "CC";

            Session["paymenttype"] = paymenttype;
            if (Session["AdminOrder"] != null)
                obj.ContributorInfo_Insert(ref OutId, double.Parse(Session["cost"].ToString()), "", txtFirstName2.Value, txtLastName2.Value, txtCompany2.Value, txtTitles.Value, txtEmail2.Value, txtPhone2.Value, txtExt2.Value, txtAddress2.Value, txtAddress21.Value, objCheque.Country, objCheque.State, txtCity2.Value, (txtCountry2.Value != "Country" ? txtCountry2.Value : ""), (txtState2.Value != "State" ? txtState2.Value : ""), txtZip2.Value, "A", Session["Confirm"].ToString(), "", objCheque.IndOrg, "OVERRIDE", objCheque.TicketCount, paymenttype, txtAware.Value, txtWBCS.Value, selPart.SelectedIndex == 0 ? "No" : selYear.Value,Mad);
            else
                obj.ContributorInfo_Insert(ref OutId, double.Parse(Session["cost"].ToString()), "", txtFirstName2.Value, txtLastName2.Value, txtCompany2.Value, txtTitles.Value, txtEmail2.Value, txtPhone2.Value, txtExt2.Value, txtAddress2.Value, txtAddress21.Value, objCheque.Country, objCheque.State, txtCity2.Value, (txtCountry2.Value != "Country" ? txtCountry2.Value : ""), (txtState2.Value != "State" ? txtState2.Value : ""), txtZip2.Value, "A", Session["Confirm"].ToString(), "", objCheque.IndOrg, "", objCheque.TicketCount, paymenttype, txtAware.Value, txtWBCS.Value, selPart.SelectedIndex == 0 ? "No" : selYear.Value,Mad);

            Session["payPersonID"] = Convert.ToString(OutId);
            string attendeetype = "";
            for (int i = 0; i < int.Parse(Session["AttendeeCount"].ToString()); i++)
            {
                
                if (objAttende[i].AttendeeType == "IP")
                    attendeetype = "Ticket(s) $800 each";
                else if (objAttende[i].AttendeeType == "NIP")

                    attendeetype = "Nonprofit Rate Ticket(s) $400 each";
                else if (objAttende[i].AttendeeType == "Next Wave Sohn Only")
                    attendeetype = "Next Wave Sohn Only";
                else
                    attendeetype = "Viewing Room";
                if (Session["AdminOrder"] != null)
                {
                    objUserServices.Attendee_Add_NY2014(OutId, objAttende[i].FirstName, objAttende[i].LastName, objAttende[i].Organization, objAttende[i].Title, objAttende[i].Email, objAttende[i].Phone, objAttende[i].Ext, objAttende[i].country, objAttende[i].OtherCountry, objAttende[i].state, objAttende[i].OtherState, attendeetype, objAttende[i].Address, objAttende[i].OtherAddress, objAttende[i].city, objAttende[i].zip, Convert.ToDouble(objAttende[i].Price), "OVERRIDE", paymenttype, objAttende[i].Cocktail, objAttende[i].NextWave, objAttende[i].SohnGeneralPartner);
                }
                else
                {
                    objUserServices.Attendee_Add_NY2014(OutId, objAttende[i].FirstName, objAttende[i].LastName, objAttende[i].Organization, objAttende[i].Title, objAttende[i].Email, objAttende[i].Phone, objAttende[i].Ext, objAttende[i].country, objAttende[i].OtherCountry, objAttende[i].state, objAttende[i].OtherState, attendeetype, objAttende[i].Address, objAttende[i].OtherAddress, objAttende[i].city, objAttende[i].zip, Convert.ToDouble(objAttende[i].Price), "", paymenttype, objAttende[i].Cocktail, objAttende[i].NextWave, objAttende[i].SohnGeneralPartner);
                }
            }

            //obj.ContributorInfo_Insert(ref OutId, double.Parse(Session["cost"].ToString()), "", txtFirstName2.Value, txtLastName2.Value, txtCompany2.Value, txtTitles.Value, txtEmail2.Value, txtPhone2.Value, txtExt2.Value, txtAddress2.Value, txtAddress22.Value, objCheque.Country, objCheque.State, Text10.Value, objCheque.OtherCountry, objCheque.OtherState, txtZip2.Value, "D", Session["Confirm"].ToString());
            //   Response.Redirect("index.aspx?out=" + OutId);
            Response.Redirect("registration-step3-professional");
        
       
    }
    protected void btnChequeBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("updateAttendees.aspx");
    }
    protected void ddlCardType_SelectedIndexChanged(object sender, EventArgs e)
    {
        paymentView.ActiveViewIndex = Convert.ToInt32(ddlCardType.SelectedValue);
    }

    protected void btnPromoBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("updateAttendees.aspx");
    }


    protected void btnPromoNext_Click(object sender, EventArgs e)
    {
        UserServices obj = new UserServices();
        PromoCodes promo = new PromoCodes();
        string strPromoCode = txtContributorCode.Value;
        if(promo.ValidatePromoCode(strPromoCode)){
            
            Attende2014[] objAttende = new Attende2014[int.Parse(Session["AttendeeCount"].ToString())];
            objAttende = (Attende2014[])Session["Attendees"];

            Cheque objCheque = new Cheque();
 
            objCheque.cost = 0.0;
            objCheque.FirstName = objAttende[0].FirstName;
            objCheque.LastName = objAttende[0].LastName;
            objCheque.company = objAttende[0].Organization;
            objCheque.Title = objAttende[0].Title;
            objCheque.Email = objAttende[0].Email;


            Session["EmailSettings"] = objAttende[0].Email;
            objCheque.Phone = objAttende[0].Phone;
            objCheque.Ext = objAttende[0].Ext;
            objCheque.Address = objAttende[0].Address;
            objCheque.OtherAddress = objAttende[0].OtherAddress;

            if (objAttende[0].country == "Other")
            {
                objCheque.Country = objAttende[0].OtherCountry;
                objCheque.State = objAttende[0].OtherState;
            }
            else
            {
                objCheque.Country = objAttende[0].country;
                objCheque.State = objAttende[0].state;
            }
            Session["EmailCount"] = "0";

            objCheque.City = objAttende[0].city;
            objCheque.Zip = objAttende[0].zip;

            //Added by Gopi for Donation Ind/Org
            objCheque.IndOrg = "";
            objCheque.Aware = txtAware.Value;

            objCheque.TicketCount = Convert.ToInt32(Session["AttendeeCount"]);

            Session["AttendiCheque"] = objCheque;
            int OutId = 0;
            Session["Confirm"] = obj.Get_CheckConfirmNum();
            Session["cost"] = "0";
            Session["PromoCode"] = strPromoCode;
            string paymenttype = "";

            paymenttype = "ContributorCode";


            if (Session["AdminOrder"] != null)
                obj.ContributorInfo_Insert(ref OutId, double.Parse(Session["cost"].ToString()), "", objCheque.FirstName, objCheque.LastName, objCheque.company, objCheque.Title, objCheque.Email, objCheque.Phone, objCheque.Ext, objCheque.Address, objCheque.OtherAddress, objCheque.Country, objCheque.State, objCheque.City, objCheque.Country, objCheque.State, objCheque.Zip, "A", Session["Confirm"].ToString(), "", objCheque.IndOrg, "OVERRIDE", objCheque.TicketCount, paymenttype, txtAware.Value, txtWBCS.Value, selPart.SelectedIndex == 0 ? "No" : selYear.Value,Mad);
            else
                obj.ContributorInfo_Insert(ref OutId, double.Parse(Session["cost"].ToString()), "", objCheque.FirstName, objCheque.LastName, objCheque.company, objCheque.Title, objCheque.Email, objCheque.Phone, objCheque.Ext, objCheque.Address, objCheque.OtherAddress, objCheque.Country, objCheque.State, objCheque.City, objCheque.Country, objCheque.State, objCheque.Zip, "A", Session["Confirm"].ToString(), "", objCheque.IndOrg, "", objCheque.TicketCount, paymenttype, txtAware.Value, txtWBCS.Value, selPart.SelectedIndex == 0 ? "No" : selYear.Value,Mad);

            Session["payPersonID"] = Convert.ToString(OutId);
            promo.UpdateContributorCode(OutId, strPromoCode);
            for (int i = 0; i < int.Parse(Session["AttendeeCount"].ToString()); i++)
            {
                if (Session["AdminOrder"] != null)
                {
                    objUserServices.Attendee_Add_NY2014(OutId, objAttende[i].FirstName, objAttende[i].LastName, objAttende[i].Organization, objAttende[i].Title, objAttende[i].Email, objAttende[i].Phone, objAttende[i].Ext, objAttende[i].country, objAttende[i].OtherCountry, objAttende[i].state, objAttende[i].OtherState, objAttende[i].AttendeeType, objAttende[i].Address, objAttende[i].OtherAddress, objAttende[i].city, objAttende[i].zip, Convert.ToDouble(objAttende[i].Price), "OVERRIDE", paymenttype, objAttende[i].Cocktail, objAttende[i].NextWave,objAttende[i].SohnGeneralPartner );
                }
                else
                {
                    objUserServices.Attendee_Add_NY2014(OutId, objAttende[i].FirstName, objAttende[i].LastName, objAttende[i].Organization, objAttende[i].Title, objAttende[i].Email, objAttende[i].Phone, objAttende[i].Ext, objAttende[i].country, objAttende[i].OtherCountry, objAttende[i].state, objAttende[i].OtherState, objAttende[i].AttendeeType, objAttende[i].Address, objAttende[i].OtherAddress, objAttende[i].city, objAttende[i].zip, Convert.ToDouble(objAttende[i].Price), "", paymenttype, objAttende[i].Cocktail, objAttende[i].NextWave, objAttende[i].SohnGeneralPartner);
                }
            }

            //obj.ContributorInfo_Insert(ref OutId, double.Parse(Session["cost"].ToString()), "", txtFirstName2.Value, txtLastName2.Value, txtCompany2.Value, txtTitles.Value, txtEmail2.Value, txtPhone2.Value, txtExt2.Value, txtAddress2.Value, txtAddress22.Value, objCheque.Country, objCheque.State, Text10.Value, objCheque.OtherCountry, objCheque.OtherState, txtZip2.Value, "D", Session["Confirm"].ToString());
            //   Response.Redirect("index.aspx?out=" + OutId);
            //Response.Redirect("registration-step3-professional");
            Response.Redirect("Confirm_Code.aspx");
        }
        else{
            dvUserInfo.InnerHtml = "<h3>Invalid Contributor Code</h3>";
            
        }        
       
    }

    protected void lnkLogOut_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.RemoveAll();
        Session["userid"] = "";
        Response.Redirect("Bo/Bo_Login.aspx");
    }
}
