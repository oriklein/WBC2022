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


public partial class DonorPayInfo : SSLHelper
{ 
    protected override void OnInit(EventArgs e)
    {
        //if (!Request.IsSecureConnection)
        //{
        //    SslTools.SwitchToSsl();

        //}


    }
    protected void Page_Load(object sender, EventArgs e)
    {
        form1.Action = Request.RawUrl;
        if (!Page.IsPostBack)
        {
           /* pnlTxtState1.Visible = false;*/
            /*pnlTxtCountry1.Visible = false;*/
        }
      
        if (Session["contlevel"] == null)
        {
            if (Session["CreditCard"] == null || Session["donorCheque"] == null)
            {
                string msg = "<script language='JavaScript'>window.alert('Your Session Has Expired.');</script>";
                Page.RegisterStartupScript("strScript", msg);
                Response.Redirect("Oops.htm");
            }
        }


        dvAttendees.InnerHtml = Session["contlevel"].ToString();
        decimal Damt = decimal.Parse(Session["cost"].ToString());
        if (Session["Error"] != null)
        {
           
            lblStatus.Visible = true;
            lblStatus.Text = Session["Error"].ToString() + "    Please try Again ";
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
                Text2.Attributes.Add("style", "display:block;");
                ddlState2.Attributes.Add("style", "display:none;");
                txtState1.Attributes.Add("style", "display:block;");
                Text2.Value = objCreditCard.OtherCountry;
                txtState1.Value = objCreditCard.OtherState;
            }
            else
            {
                Text2.Attributes.Add("style", "display:none;");
                ddlState2.Attributes.Add("style", "display:block;");
                txtState1.Attributes.Add("style", "display:none;");

                ddlCountry1.SelectedIndex = ddlCountry1.Items.IndexOf(new ListItem(objCreditCard.Country));
                ddlState2.SelectedIndex = ddlState2.Items.IndexOf(new ListItem(objCreditCard.State));
            }
           
            ddlExpirationMonth.SelectedIndex = ddlExpirationMonth.Items.IndexOf(new ListItem(objCreditCard.ExpiryMonth));
            ddlExpirationDate.SelectedIndex = ddlExpirationDate.Items.IndexOf(new ListItem(objCreditCard.Expirydate));
            ddlCreditCardType.SelectedIndex = ddlCreditCardType.Items.IndexOf(new ListItem(objCreditCard.CreditCardType));
            txtSecurityCode.Value = objCreditCard.SecurityCode;
            
            txtFirstName1.Value = objCreditCard.FirstName;
            txtLastName1.Value = objCreditCard.LastName;
            txtEmail1.Value = objCreditCard.Email;
            txtCompanyName1.Value = objCreditCard.CompanyName;
            txtTitle1.Value = objCreditCard.Title;
            txtZip1.Value = objCreditCard.Zip;
            txtPhone1.Value=objCreditCard.Phone;
            txtCity1.Value = objCreditCard.City;
            txtExt1.Value = objCreditCard.Ext;
            txtAddress1.Value = objCreditCard.Address;
            txtAddress21.Value = objCreditCard.OtherAddress;
           


        }
        if (Damt >= 1)
        {
            paymentView.ActiveViewIndex = 2;
            ddlCardType.SelectedIndex = 2;
            ddlCardType.Enabled = false;
        }


        //code of Number only
        //txtHomePh1.Attributes.Add("onkeypress", "return numbersonly(this, event)");
        txtPhone1.Attributes.Add("onkeypress", "return numbersonly(this, event)");
        txtExt1.Attributes.Add("onkeypress", "return numbersonly(this, event)");
        //txtZip1.Attributes.Add("onkeypress", "return numbersonly(this, event)");

        txtPhone2.Attributes.Add("onkeypress", "return numbersonly(this, event)");
        txtExt2.Attributes.Add("onkeypress", "return numbersonly(this, event)");
        //txtZip2.Attributes.Add("onkeypress", "return numbersonly(this, event)");
    }


    protected void btnNext_Click(object sender, EventArgs e)
    {
        CreditCard2014 objCreditCard = new CreditCard2014();
        objCreditCard.CreditCardNumber = txtCreditCardNo.Value;
        objCreditCard.CreditCardType = ddlCreditCardType.Items[ddlCreditCardType.SelectedIndex].Text;
        objCreditCard.SecurityCode = txtSecurityCode.Value;
        //objCreditCard.Expirydate = ddlExpirationMonth.Items[ddlExpirationMonth.SelectedIndex].Text + "-" + ddlExpirationDate.Items[ddlExpirationDate.SelectedIndex].Text.Substring(2, 2);
        objCreditCard.Expirydate = ddlExpirationDate.Items[ddlExpirationDate.SelectedIndex].Text;
        objCreditCard.ExpiryMonth = ddlExpirationMonth.Items[ddlExpirationMonth.SelectedIndex].Text;
        objCreditCard.FirstName = txtFirstName1.Value;
        objCreditCard.LastName = txtLastName1.Value;
        objCreditCard.CompanyName = txtCompanyName1.Value;
        objCreditCard.Title = txtTitle1.Value;
        objCreditCard.Email = txtEmail1.Value;
        objCreditCard.Phone = txtPhone1.Value;
        objCreditCard.Ext = txtExt1.Value;
        objCreditCard.Zip = txtZip1.Value;
        objCreditCard.City = txtCity1.Value;

        //For Donation Text
        objCreditCard.DonationIndOrg = txtIndOrg1.Text;

        if (txtAddress1.Value != "")
        {
            objCreditCard.Address = txtAddress1.Value;
        }
        if (txtAddress21.Value != "")
        {
            objCreditCard.OtherAddress = txtAddress21.Value;
        }
        else
        {
            objCreditCard.OtherAddress = "";
        }



        if (ddlCountry1.Items[ddlCountry1.SelectedIndex].Text == "Other")
        {
            objCreditCard.OtherCountry = Text2.Value;
            objCreditCard.Country = Text2.Value;
        }
        else
        {
            objCreditCard.Country = ddlCountry1.Items[ddlCountry1.SelectedIndex].Text;
        }
        if (ddlCountry1.Items[ddlCountry1.SelectedIndex].Text == "Other")
        {
            objCreditCard.OtherState = txtState1.Value;
            objCreditCard.State = txtState1.Value;
        }
        else
        {
            objCreditCard.State = ddlState2.Items[ddlState2.SelectedIndex].Text;
        }
        
        objCreditCard.cost = int.Parse(Session["cost"].ToString());
        

        Session["donorEmail"] = txtEmail1.Value.ToString();
        Session["CreditCard"] = objCreditCard;
        
        Response.Redirect("Payment.aspx?utype=D");
    }
    protected void btnEditAttendee_Click(object sender, EventArgs e)
    {
        Response.Redirect("Donation-step1");
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
        UserServices obj = new UserServices();
        Cheque objCheque = new Cheque();

            objCheque.cost = double.Parse(Session["cost"].ToString());
            objCheque.FirstName = txtFirstName2.Value;
            objCheque.LastName = txtLastName2.Value;
            objCheque.company = txtCompany2.Value;
            objCheque.Title = txtTitles.Value;
            objCheque.Email = txtEmail2.Value;
            Session["donorEmail"] = txtEmail2.Value.ToString();

            objCheque.Phone = txtPhone2.Value;
            objCheque.Ext = txtExt2.Value;
            objCheque.Address = txtAddress2.Value;
            //objCheque.OtherAddress = txtAddress21.Value;
            objCheque.OtherAddress = txtAddress22.Value;
            if (ddlCountry2.Items[ddlCountry2.SelectedIndex].Text == "Other")
            {
                objCheque.OtherCountry = txtCountry2.Value;
                objCheque.OtherState = dvtextState3.Value;
                objCheque.Country=txtCountry2.Value;
                objCheque.State = dvtextState3.Value;
            }
            else
            {
                objCheque.Country = ddlCountry2.Items[ddlCountry2.SelectedIndex].Text;
                objCheque.State = ddlState3.Items[ddlState3.SelectedIndex].Text;
            }


            objCheque.City = Text10.Value;
            objCheque.Zip = txtZip2.Value;
            objCheque.IndOrg = txtIndOrg.Text;

            int OutId = 0;
            Session["donorCheque"] = objCheque;
            Session["Confirm"] = obj.Get_CheckConfirmNum();

            string paymenttype = "";
            if (rdCheck.Checked == true)
                paymenttype = "Check";
            else if (rdWire.Checked == true)
                paymenttype = "Wire Transfer";
            else
                paymenttype = "CC";

            obj.ContributorInfo_Insert(ref OutId, double.Parse(Session["cost"].ToString()), "", txtFirstName2.Value, txtLastName2.Value, txtCompany2.Value, txtTitles.Value, txtEmail2.Value, txtPhone2.Value, txtExt2.Value, txtAddress2.Value, txtAddress22.Value, objCheque.Country, objCheque.State, Text10.Value, objCheque.OtherCountry, objCheque.OtherState, txtZip2.Value, "D", Session["Confirm"].ToString(),"",objCheque.IndOrg,"",-1,paymenttype,"");
            if (ddlEmailSettingsCheque.Items[ddlEmailSettingsCheque.SelectedIndex].Text == "DO NOT Send Confirmation email")
                Session["EmailCount"] = "0";
            else
                Session["EmailCount"] = "1";
            Session["payPersonID"] = Convert.ToString(OutId);
            //   Response.Redirect("index.aspx?out=" + OutId);
            Response.Redirect("Donation-step3");
      
        
    }

}
