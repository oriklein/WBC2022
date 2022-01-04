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

public partial class ContriPayInfo : SSLHelper
{
    protected override void OnInit(EventArgs e)
    {



    }
    string Mad = "";
    double extra = 0;
    int attendeeCount = 0;
    protected void Page_Load(object sender, EventArgs e)
    {

        //if (Session["AdminOrder"] != null)
        //{
        //    if (Session["userid"] == null)
        //        Response.Redirect("http://www.sequence-events.com/wbc/Bo/Bo_Login.aspx");
        //    else
        //        divAdmin.Visible = true;
        //    divJorn.Visible = true;
        //    divLogo.Visible = true;
        //}
        //else
            divAdmin.Visible = false;


        txtExt1.Attributes.Add("onkeypress", "return numbersonly(this, event)");
        txtExt2.Attributes.Add("onkeypress", "return numbersonly(this, event)");



        double Damt = 0;
        //if (Session["AdminOrder"] != null)
        //{
        //    dvAttendees.InnerHtml = "<p>" + Session["contlevel"].ToString().Replace("Selected ", "Selected<br>") + "</p>";

        //    dvAttendees.InnerHtml += "<br /> " + "Total Ticket(s) " + Session["AdminAttendees"].ToString();
        //    // dvAttendees.InnerHtml += "<br /> Total " + (Convert.ToInt32(Session["cost"].ToString()) + (Convert.ToInt32(Session["extraPer"]) * 800)).ToString("C");
        //    Damt = Convert.ToDouble(Session["cost"].ToString());
        //    //Session["cost"] = (Session["cost"].ToString()) + (Convert.ToInt32(Session["extraPer"]) * 800).ToString();


        //}
        //else
        {
            dvAttendees.InnerHtml = "<p>You Selected</p>";
            Memebrs mb = (Memebrs)Session["contlevel"];
            double totalMny = 0;
            if (mb.MemberType == "Yes")
            {
                dvAttendees.InnerHtml += "<p>Table for 10 and Full Page Ad included in WBC Membership</p>";
                // dvAttendees.InnerHtml += "<p>Full Page Ad in MAD Event Journal</p>";

                attendeeCount += 10;

                if (mb.AddFullTable > 0)
                {
                    dvAttendees.InnerHtml += "<p>" + mb.AddFullTable + " Additional Full Table(s) of 10 @ " + (mb.AddFullTable * (int)WBCPrice.MFullTable).ToString("C") + " </p>";
                    totalMny += (mb.AddFullTable * (int)WBCPrice.MFullTable);
                    attendeeCount += (10 * mb.AddFullTable);
                }
                if (mb.AddHalfTable > 0)
                {
                    dvAttendees.InnerHtml += "<p>" + mb.AddHalfTable + " Additional Half Table(s) of 5 @ " + (mb.AddHalfTable * (int)WBCPrice.MHalfTable).ToString("C") + "</p>";
                    totalMny += (mb.AddHalfTable * (int)WBCPrice.MHalfTable);
                    attendeeCount += (5 * mb.AddHalfTable);
                }
                if (mb.AddTickets > 0)
                {
                    dvAttendees.InnerHtml += "<p>" + mb.AddTickets + " Additional Ticket(s) @ " + (mb.AddTickets * (int)WBCPrice.MIndivisual).ToString("C") + "</p>";
                    totalMny += (mb.AddTickets * (int)WBCPrice.MIndivisual);
                    attendeeCount += mb.AddTickets;
                }
                if (mb.AddFullAd > 0)
                {
                    dvAttendees.InnerHtml += "<p>" + mb.AddFullAd + " Additional Full Page Ad in MAD Event Journal @ " +Convert.ToDouble( WBCPrice.MFullAD).ToString("C") + "</p>";
                    totalMny += (int)WBCPrice.MFullAD;
                }
                if (mb.AddHalfAd > 0)
                {
                    dvAttendees.InnerHtml += "<p>" + mb.AddHalfAd + " Additional Half Page Ad in MAD Event Journal @ " + Convert.ToDouble(WBCPrice.MHalfAd).ToString("C") + "</p>";
                    totalMny += (int)WBCPrice.MHalfAd;
                }
            }
            else if (mb.MemberType == "Extra")
            {
                // dvAttendees.InnerHtml += "<p>Table for 10 and Full Page Ad included in WBC Membership</p>";
                // dvAttendees.InnerHtml += "<p>Full Page Ad in MAD Event Journal</p>";

                // attendeeCount += 10;

                if (mb.AddFullTable > 0)
                {
                    dvAttendees.InnerHtml += "<p>" + mb.AddFullTable + " Additional Full Table(s) of 10 @ " + (mb.AddFullTable * (int)WBCPrice.MFullTable).ToString("C") + " </p>";
                    totalMny += (mb.AddFullTable * (int)WBCPrice.MFullTable);
                    attendeeCount += (10 * mb.AddFullTable);
                }
                if (mb.AddHalfTable > 0)
                {
                    dvAttendees.InnerHtml += "<p>" + mb.AddHalfTable + " Additional Half Table(s) of 5 @ " + (mb.AddHalfTable * (int)WBCPrice.MHalfTable).ToString("C") + "</p>";
                    totalMny += (mb.AddHalfTable * (int)WBCPrice.MHalfTable);
                    attendeeCount += (5 * mb.AddHalfTable);
                }
                if (mb.AddTickets > 0)
                {
                    dvAttendees.InnerHtml += "<p>" + mb.AddTickets + " Additional Ticket(s) @ " + (mb.AddTickets * (int)WBCPrice.MIndivisual).ToString("C") + "</p>";
                    totalMny += (mb.AddTickets * (int)WBCPrice.MIndivisual);
                    attendeeCount += mb.AddTickets;
                }
                if (mb.AddFullAd > 0)
                {
                    dvAttendees.InnerHtml += "<p>" + mb.AddFullAd + " Additional Full Page Ad in MAD Event Journal @ " + Convert.ToDouble(WBCPrice.MFullAD).ToString("C") + "</p>";
                    totalMny += (int)WBCPrice.MFullAD;
                }
                if (mb.AddHalfAd > 0)
                {
                    dvAttendees.InnerHtml += "<p>" + mb.AddHalfAd + " Additional Half Page Ad in MAD Event Journal @ " + Convert.ToDouble(WBCPrice.MHalfAd).ToString("C") + "</p>";
                    totalMny += (int)WBCPrice.MHalfAd;
                }
            }
            else
            {
                if (mb.AddFullTable > 0)
                {
                    dvAttendees.InnerHtml += "<p>" + mb.AddFullTable + " Full Table(s) of 10 @ " + (mb.AddFullTable * (int)WBCPrice.NMFullTable).ToString("C") + " </p>";
                    totalMny += (mb.AddFullTable * (int)WBCPrice.NMFullTable);
                    attendeeCount += (10 * mb.AddFullTable);
                }
                if (mb.AddHalfTable > 0)
                {
                    dvAttendees.InnerHtml += "<p>" + mb.AddHalfTable + " Half Table(s) of 5 @ " + (mb.AddHalfTable * (int)WBCPrice.NMHalfTable).ToString("C") + "</p>";
                    totalMny += (mb.AddHalfTable * (int)WBCPrice.NMHalfTable);
                    attendeeCount += (5 * mb.AddHalfTable);
                }
                if (mb.AddTickets > 0)
                {
                    dvAttendees.InnerHtml += "<p>" + mb.AddTickets + " Ticket(s) @ " + (mb.AddTickets * (int)WBCPrice.NMIndivisual).ToString("C") + "</p>";
                    totalMny += (mb.AddTickets * (int)WBCPrice.NMIndivisual);
                    attendeeCount += mb.AddTickets;
                }
                if (mb.AddFullAd > 0)
                {
                    dvAttendees.InnerHtml += "<p>" + mb.AddFullAd + " Full Page Ad in MAD Event Journal @ " + Convert.ToDouble(WBCPrice.MFullAD).ToString("C") + "</p>";
                    totalMny += (int)WBCPrice.MFullAD;
                }
                if (mb.AddHalfAd > 0)
                {
                    dvAttendees.InnerHtml += "<p>" + mb.AddHalfAd + " Half Page Ad in MAD Event Journal @ " + Convert.ToDouble(WBCPrice.MHalfAd).ToString("C") + "</p>";
                    totalMny += (int)WBCPrice.MHalfAd;
                }
            }

            dvAttendees.InnerHtml += "<br /> Total " + totalMny.ToString("C");
            Damt = totalMny;
            Session["cost"] = totalMny;
            //Session["cost"] = (Session["cost"].ToString()) + (Convert.ToInt32(Session["extraPer"]) * 2000).ToString();

        }


        if (Session["Error"] != null)
        {

            ddlCardType.SelectedIndex = 1;
            paymentView.ActiveViewIndex = 1;
            CreditCard2014 objCreditCard = new CreditCard2014();
            objCreditCard = (CreditCard2014)Session["CreditCard"];
            txtCreditCardNo.Value = objCreditCard.CreditCardNumber;
            Session["Error"] = null;

            if (objCreditCard.OtherCountry != null)
            {
                ddlCountry1.Attributes.Add("style", "display:block;");
                //txtCountry1.Attributes.Add("style","display:block;width: 130px; float:right; margin:0 0 0 10px");
                ddlCountry1.SelectedIndex = ddlCountry1.Items.IndexOf(new ListItem("Other"));
                txtCountry1.Attributes.Add("style", "display:block;");
                ddlState2.Attributes.Add("style", "display:none;");
                txtState1.Attributes.Add("style", "display:block;");
                txtCountry1.Value = objCreditCard.OtherCountry;
                txtState1.Value = objCreditCard.OtherState;
            }
            else
            {
                txtCountry1.Attributes.Add("style", "display:none;");
                ddlState2.Attributes.Add("style", "display:block;");
                txtState1.Attributes.Add("style", "display:none;");

                ddlCountry1.SelectedIndex = ddlCountry1.Items.IndexOf(new ListItem(objCreditCard.Country));
                ddlState2.SelectedIndex = ddlState2.Items.IndexOf(new ListItem(objCreditCard.State));
            }



            ddlExpirationMonth.SelectedIndex = ddlExpirationMonth.Items.IndexOf(new ListItem(objCreditCard.ExpiryMonth));
            ddlExpirationYear.SelectedIndex = ddlExpirationYear.Items.IndexOf(new ListItem(objCreditCard.Expirydate));
            ddlCreditCardType.SelectedIndex = ddlCreditCardType.Items.IndexOf(new ListItem(objCreditCard.CreditCardType));
            txtSecurityCode.Value = objCreditCard.SecurityCode;
            //objCreditCard.Expirydate = ddlExpirationMonth.Items[ddlExpirationMonth.SelectedIndex].Text + "-" + ddlExpirationYear.Items[ddlExpirationYear.SelectedIndex].Text.Substring(2, 2);
            txtFirstName1.Value = objCreditCard.FirstName;
            txtLastName1.Value = objCreditCard.LastName;
            txtEmail1.Value = objCreditCard.Email;
            txtCompanyName1.Value = objCreditCard.CompanyName;
            txtTitle1.Value = objCreditCard.Title;
            txtZip1.Value = objCreditCard.Zip;
            txtPhone1.Value = objCreditCard.Phone;
            txtCity1.Value = objCreditCard.City;
            txtExt1.Value = objCreditCard.Ext;
            txtAddress1.Value = objCreditCard.Address;
            txtAddress21.Value = objCreditCard.OtherAddress;
            //=  + " " + txtAddress21.Value;


        }
        if (Damt >= 5000)
        {
            divPay.Visible = false;
        }
        if (Damt >= 0)
        {
            paymentView.ActiveViewIndex = 2;
            ddlCardType.SelectedIndex = 2;
            ddlCardType.Enabled = false;
        }


    }
    protected void btnNext_Click(object sender, EventArgs e)
    {
        CreditCard2014 objCreditCard = new CreditCard2014();
        objCreditCard.CreditCardNumber = txtCreditCardNo.Value;
        objCreditCard.CreditCardType = ddlCreditCardType.Items[ddlCreditCardType.SelectedIndex].Text;
        objCreditCard.SecurityCode = txtSecurityCode.Value;
        //objCreditCard.Expirydate = ddlExpirationMonth.Items[ddlExpirationMonth.SelectedIndex].Text + "-" + ddlExpirationYear.Items[ddlExpirationYear.SelectedIndex].Text.Substring(2, 2);
        objCreditCard.Expirydate = ddlExpirationYear.Items[ddlExpirationYear.SelectedIndex].Text;
        objCreditCard.ExpiryMonth = ddlExpirationMonth.Items[ddlExpirationMonth.SelectedIndex].Value;
        objCreditCard.FirstName = txtFirstName1.Value;
        objCreditCard.LastName = txtLastName1.Value;
        objCreditCard.CompanyName = txtCompanyName1.Value;
        objCreditCard.Title = txtTitle1.Value;
        objCreditCard.cost = double.Parse(Session["cost"].ToString());
        if (ddlCountry1.Items[ddlCountry1.SelectedIndex].Text == "Other")
            objCreditCard.OtherCountry = txtCountry1.Value;
        else
            objCreditCard.Country = ddlCountry1.Items[ddlCountry1.SelectedIndex].Text;
        if (ddlCountry1.Items[ddlCountry1.SelectedIndex].Text == "Other")
            objCreditCard.OtherState = txtState1.Value;
        else
            objCreditCard.State = ddlState2.Items[ddlState2.SelectedIndex].Text;
        if (txtAddress1.Value != "")
            objCreditCard.Address = txtAddress1.Value;
        if (txtAddress2.Value != "")
            objCreditCard.OtherAddress = txtAddress21.Value;
        objCreditCard.Email = txtEmail1.Value;
        Session["ContriEmail"] = txtEmail1.Value.ToString();
        //objCreditCard.Country = Text2.Value;
        //objCreditCard.State = txtState1.Value;
        objCreditCard.Zip = txtZip1.Value;
        objCreditCard.Phone = txtPhone1.Value;
        objCreditCard.Ext = txtExt1.Value;
        objCreditCard.Address = txtAddress1.Value;
        objCreditCard.OtherAddress = txtAddress21.Value;
        objCreditCard.invoiceNumber = Guid.NewGuid().ToString().Substring(1, 5);
        objCreditCard.City = txtCity1.Value;
        objCreditCard.Cocktail = "";
        objCreditCard.NextWave = "";
        objCreditCard.SohnGeneralPartner = "";
        //Added by Gopi for Donation Ind/Org
        objCreditCard.DonationIndOrg = txtIndOrg1.Text;
        WBCUserServices objUserServices = new WBCUserServices();
        DataTable objDt = objUserServices.Get_Enteprise_Charges(Session["level"].ToString().Trim());
        int attendeeCount;
        attendeeCount = Convert.ToInt32(objDt.Rows[0]["tickets"].ToString());
        //if (Session["AdminOrder"] != null)
        //{
        //    objCreditCard.TicketCount = Convert.ToInt32(Session["AdminAttendees"]);
        //}
        //else
        {
            objCreditCard.TicketCount = attendeeCount;
        }


        //objCreditCard.Address = txtAddress1.Value ;
        Session["CreditCard"] = objCreditCard;
        Response.Redirect("Payment.aspx?utype=C");
    }
    protected void btnEditAttendee_Click(object sender, EventArgs e)
    {
        Memebrs mb = (Memebrs)Session["contlevel"];
        if (mb.MemberType == "Yes")
            Response.Redirect("contributorindex_mb.aspx");
        else
            Response.Redirect("contributorindex_nmb.aspx");
    }
    protected void btnNext_Click1(object sender, EventArgs e)
    {
        Response.Redirect("success.aspx");
    }
    protected void ddlCardType_SelectedIndexChanged(object sender, EventArgs e)
    {
        paymentView.ActiveViewIndex = Convert.ToInt32(ddlCardType.SelectedValue);
    }

    protected void ContributorInfo_Insert(object sender, EventArgs e)
    {
        // Response.Redirect("index.aspx");
        WBCUserServices obj = new WBCUserServices();
        int OutId = 0;
        string Logo = "";
        string Journal = "";
        //if (Session["AdminOrder"] != null)
        //{
        //    if (LGYES.Checked)
        //        Logo = "Yes";
        //    else Logo = "No";
        //    if (rdPJAYes.Checked)
        //        Journal = "Yes";
        //    else
        //        Journal = "No";
        //}
        if (Session["contlevel"] != null)
        {
            Cheque2014 objCheque = new Cheque2014();
            objCheque.cost = double.Parse(Session["cost"].ToString());
            objCheque.FirstName = txtFirstName2.Value;
            objCheque.LastName = txtLastName2.Value;
            objCheque.company = txtCompany2.Value;
            objCheque.Title = txtTitles.Value;
            objCheque.Email = txtEmail2.Value;
            Session["ContriEmail"] = txtEmail2.Value.ToString();
            objCheque.Phone = txtPhone2.Value;
            objCheque.Ext = txtExt2.Value;
            objCheque.Address = txtAddress2.Value;
            objCheque.OtherAddress = txtAddress22.Value;
            if (ddlCountry2.Items[ddlCountry2.SelectedIndex].Text == "Other")
            {
                objCheque.OtherCountry = txtCountry2.Value;
                objCheque.OtherState = dvtextState3.Value;
            }
            else
            {
                objCheque.Country = ddlCountry2.Items[ddlCountry2.SelectedIndex].Text;
                objCheque.State = ddlState3.Items[ddlState3.SelectedIndex].Text;

            }
            //objCheque.Country = ddlCountry2.SelectedIndex.ToString();
            //objCheque.State = ddlState2.SelectedIndex.ToString();
            objCheque.City = txtCity2.Value;
            objCheque.Zip = txtZip2.Value;

            objCheque.Cocktail = Logo;

            objCheque.NextWave = Journal;
            objCheque.WbcName = txtWBCS.Value;
            objCheque.Year = selPart.SelectedIndex == 0 ? "No" : selYear.Value;
            objCheque.SohnGeneralPartner = "";
            objCheque.Aware = Server.HtmlEncode(txtAware.Value);
            objCheque.IndOrg = txtOrg.Value;

            string biller = "Y";
            if (chkBill.Checked == false)
                biller = "N";
            objCheque.Biller = biller;
            objCheque.BName = txtBCN.Value;
            objCheque.BTitle = txtBT.Value;
            objCheque.BPhone = txtBCP.Value;
            objCheque.BEmail = txtBCE.Value;
            objCheque.BCEmail = txtCCDE.Value;
            objCheque.BAddress = txtBCA.Value;
            objCheque.BCountry = txtBCntry.Value;
            objCheque.BCity = txtBCity.Value;
            objCheque.BState = txtBSt.Value;
            objCheque.BZip = tztBZip.Value;
            objCheque.BOName = txtNPI.Value;
            objCheque.BOPhone = txtEPP.Value;
            objCheque.BOEmail = txtEPI.Value;
            Session["ContriCheque"] = objCheque;
            Session["Confirm"] = obj.Get_CheckConfirmNum();

            string paymenttype = "";
            if (rdCheck.Checked == true)
                paymenttype = "Check";
            else if (rdWire.Checked == true)
                paymenttype = "Wire Transfer";
            else
                paymenttype = "CC";

            Session["paymenttype"] = paymenttype;

            //if (Session["AdminOrder"] != null)

            //    obj.ContributorInfo_Insert(ref OutId, double.Parse(Session["cost"].ToString()), "", txtFirstName2.Value, txtLastName2.Value, txtOrg.Value, txtTitles.Value, txtEmail2.Value, txtPhone2.Value, txtExt2.Value, txtAddress2.Value, txtAddress22.Value, objCheque.Country, objCheque.State, txtCity2.Value, objCheque.OtherCountry, objCheque.OtherState, txtZip2.Value, "C", Session["Confirm"].ToString(), Session["level"].ToString(), objCheque.IndOrg, "OVERRIDE", objCheque.TicketCount, paymenttype, txtAware.Value, txtWBCS.Value, selPart.SelectedIndex == 0 ? "No" : selYear.Value, Mad, biller);
            //else
                obj.ContributorInfo_Insert(ref OutId, double.Parse(Session["cost"].ToString()), "", txtFirstName2.Value, txtLastName2.Value, txtOrg.Value, txtTitles.Value, txtEmail2.Value, txtPhone2.Value, txtExt2.Value, txtAddress2.Value, txtAddress22.Value, objCheque.Country, objCheque.State, txtCity2.Value, objCheque.OtherCountry, objCheque.OtherState, txtZip2.Value, "C", Session["Confirm"].ToString(), "Member", objCheque.IndOrg, "", objCheque.TicketCount, paymenttype, txtAware.Value, txtWBCS.Value, selPart.SelectedIndex == 0 ? "No" : selYear.Value, Mad, biller);

            if (Session["contlevel"] != null)
            {
                Memebrs mb = (Memebrs)Session["contlevel"];
                for (int i = 1; i <= attendeeCount; i++)
                    obj.Attendee_Add_NY2014(OutId, Session["Confirm"].ToString(), i.ToString() + " of " + (attendeeCount).ToString(), txtOrg.Value, txtTitles.Value, txtEmail2.Value, txtPhone2.Value, txtExt2.Value, objCheque.Country, objCheque.OtherCountry, objCheque.State, objCheque.OtherState, mb.MemberType, txtAddress2.Value, txtAddress22.Value, txtCity2.Value, txtZip2.Value, -1.0, "", paymenttype, Logo, Journal, "");

                obj.Attendee_Add_Tickets(Convert.ToInt32(Session["Confirm"].ToString()), mb.MemberType, mb.AddFullTable, mb.AddHalfTable, mb.AddTickets, mb.AddFullAd, mb.AddHalfAd);
                obj.Billing_Add_NY2014(Convert.ToInt32(Session["Confirm"].ToString()), txtBCN.Value, txtBCE.Value, txtBCP.Value, txtBCA.Value, txtNPI.Value, txtEPI.Value, txtEPP.Value, txtBT.Value, txtCCDE.Value, txtBCntry.Value, txtBSt.Value, txtBCity.Value, tztBZip.Value, txtBC.Value);

            }


            //   Response.Redirect("index.aspx?out=" + OutId);
            Response.Redirect("Contri_ChequeConfirm.aspx");

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
