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
using System.Web.Mail;
using ISCRegDAL;
using System.Text;
using System.IO;

public partial class donorCC_Confirm : System.Web.UI.Page
{
    string htmls = "";
    string firstname = "";
    string lastname = "";
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["CreditCard"] != null || Session["contlevel"] != null)
        {

            //try
            //{
                string info = "";
                CreditCard2014 objCreditCard = new CreditCard2014();
                objCreditCard = (CreditCard2014)Session["CreditCard"];
                if (Session["cost"] != null)
                {
                    try
                    {
                        lblCost.Text = double.Parse(Session["cost"].ToString()).ToString("C");
                    }
                    catch (Exception ex)
                    {
                        lblCost.Text = Session["cost"].ToString();
                    }
                }
              


                info = "Credit Card Number : " + "" + "xxxxxxxxxxxxx" + objCreditCard.CreditCardNumber.ToString().Substring(objCreditCard.CreditCardNumber.ToString().Length - 4, 4) + "" + "<br/>" +
                 "Credit Card Type : " + "" + objCreditCard.CreditCardType + "" + "<br/>" +
                 "First Name : " + "" + objCreditCard.FirstName + "" + "<br/>" +
                 "Last Name : " + "" + objCreditCard.LastName + "" + "<br/>" +
                 "Company Name : " + "" + objCreditCard.CompanyName + "" + "<br/>";
                if (objCreditCard.Title.ToString() != "")
                {
                    info = info + "Title : " + "" + objCreditCard.Title + "" + "<br/>";
                }

                info = info + "Email-id : " + "" + objCreditCard.Email + "" + "<br/>" +
                "Phone : " + "" + objCreditCard.Phone + "" + "<br/>";
                if (objCreditCard.Ext.ToString() != "")
                {
                    info = info + "Ext : " + "" + objCreditCard.Ext + "" + "<br/>";
                }
                info = info + "Address 1 : " + "" + objCreditCard.Address + "" + "<br/>";
                if (objCreditCard.OtherAddress != "")
                {
                    info = info + "Address 2 : " + "" + objCreditCard.OtherAddress + "" + "<br/>";
                }
                info = info + "Country : " + "" + objCreditCard.Country + "" + "<br/>";
                info = info + "City : " + "" + objCreditCard.City + "" + "<br/>" +
                "State : " + "" + objCreditCard.State + "" + "<br/>" +
                 "Zip : " + "" + objCreditCard.Zip + "" + "<br/>" +
                "Individual or Organization responsible for the donation: " + objCreditCard.DonationIndOrg + "" + "<br/><br/>";



                lblStatus.Text = info;


                lblConfirm.Text = Session["Confirm"].ToString();

                MailMessage objMailMesg = new MailMessage();

                objMailMesg.BodyFormat = MailFormat.Html;

                objMailMesg.Subject = "Womens Bond Club 2015 Confirmation";
               // objMailMesg.From = "confirmation@iscreg.com";
                objMailMesg.From = System.Configuration.ConfigurationManager.AppSettings["CFNSAdminMailID"];

                string html = "";
                html = "<html><head></head>";


                html = html + "<body style=\"background: none repeat scroll 0 0 #FFFFFF;color: #666666;font-family: Arial,Helvetica,sans-serif;font-size: 11px;height: 100%;margin: 0;padding: 0;position: relative;text-align: center;\">";
                html = html + "<div style=\"text-align: center;-moz-box-sizing: border-box; margin: 0 auto;  max-width: 960px; overflow: hidden; position: relative;width: 100%;\">";
                html = html + "<img src=\"http://sequence-events.com/wbc/2015/asset/img-header-logo.png​\" ></imag>";
                html = html + "</div>";                //  html = html + "</tr> <tr><td>" + sb.ToString() + "</td></tr></table></body></html>";
                html = html + "<div style=\"left: 0; min-width: 320px; position: absolute; top: 0;width: 100%;\">";
                html = html + "<div style=\"padding: 20px 0; overflow: visible;    text-align: center; width: 100%;\">";
                html = html + "<div style=\"text-align: center;-moz-box-sizing: border-box; margin: 0 auto;  max-width: 960px; overflow: hidden; position: relative;width: 100%;\">";
                html = html + "<div style=\"margin: 0 12.5% !important;width: 75% !important; width: 100%; -moz-box-sizing: border-box;    float: left;    overflow: hidden;    padding: 0 10px 10px;    position: relative;    text-align: left;\">";
                html = html + "<div style=\"padding: 20px 0; overflow: visible;    text-align: center; width: 100%;\">";
                html = html + "<div style=\"text-align: center;-moz-box-sizing: border-box; margin: 0 auto;  max-width: 960px; overflow: hidden; position: relative;width: 100%;\">";
                html = html + "<div style=\"margin: 0 12.5% !important;width: 75% !important; width: 100%; -moz-box-sizing: border-box;    float: left;    overflow: hidden;    padding: 0 10px 10px;    position: relative;    text-align: left;\">";
              
                html = html + "<h2 style=\" color: #333333;    font-size: 12px;    line-height: 1.5em;    margin: 20px 0 0;    text-transform: uppercase;\">";
                html = html + "Confirmation Number: " + Session["Confirm"].ToString();
                html = html + "</h2>";
                html = html + "<h2 style=\" color: #333333;    font-size: 12px;    line-height: 1.5em;    margin: 20px 0 0;    text-transform: uppercase;\">";
                html = html + "Donation Amount: " + lblCost.Text;
                html = html + "</h2>";
                html = html + "<h2 style=\" color: #333333;    font-size: 12px;    line-height: 1.5em;    margin: 20px 0 0;    text-transform: uppercase;\">";
                html = html + "Event Details";
                html = html + "</h2>";
                html = html + "<p style=\"font-size: 12px;    line-height: 1.5em;    margin: 10px 0 0;\">";
                html = html + "11/12/14<br />Pier Sixty at Chelsea Piers<br /><br />Pier 60<br />23rd Street and West Side Highway<br />New York, NY, 10011<br /><br />Cocktails at 6 P.M.<br />Dinner at 7 P.M.<br />Festive Attire<br />";
                html = html + "</p>";
                html = html + "<h2 style=\" color: #333333;    font-size: 12px;    line-height: 1.5em;    margin: 20px 0 0;    text-transform: uppercase;\">";
                html = html + "Payment Details";
                html = html + "</h2>";
                html = html + "<p style=\"font-size: 12px;    line-height: 1.5em;    margin: 10px 0 0;\">";
                html = html + info;
                html = html + "</p>";

               
                html = html + "</div></div></div></div></div></div></div>";
                html = html + "</body></html>";

                firstname = objCreditCard.FirstName;
                lastname = objCreditCard.LastName;
                //System.Web.Mail.SmtpMail.SmtpServer = System.Configuration.ConfigurationSettings.AppSettings["smtpserver"];
                try
                {
                    objMailMesg.To = Session["donorEmail"].ToString();
                    objMailMesg.Bcc = System.Configuration.ConfigurationSettings.AppSettings["CFNSAdminBCCMailID"];
                    System.Web.Mail.SmtpMail.SmtpServer = System.Configuration.ConfigurationManager.AppSettings["SMTPServer"];
                    //System.Web.Mail.SmtpMail.SmtpServer = "mail.clavib.com";

                    objMailMesg.BodyFormat = MailFormat.Html;
                    objMailMesg.Body = html;

                    //Commented by Gopi to test on local
                    System.Web.Mail.SmtpMail.Send(objMailMesg);
                }
                catch (Exception ex)
                {
                }
                Session.Remove("CreditCard");
                Session.Remove("contlevel");


        }
        else
        {
            Response.Redirect("Oops.htm");
        }
    }
}
