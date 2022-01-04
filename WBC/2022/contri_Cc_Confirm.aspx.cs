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
public partial class contri_Cc_Confirm : System.Web.UI.Page
{
    string html = "";
    string firstname = "";
    string lastname = "";
    string ContributorEmail = "";
    public string level = "";
    public string tickets = "0";
    public string Cost = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["CreditCard"] != null && Session["cost"] != null)
        {
            //try
            //{
            if (Session["AdminOrder"] != null)
                if (Session["userid"] == null)
                    Response.Redirect("Bo/Bo_Login.aspx");
                else
                    divAdmin.Visible = true;
            else
                divAdmin.Visible = false;

            string info = "";
            CreditCard2014 objCreditCard = new CreditCard2014();
            objCreditCard = (CreditCard2014)Session["CreditCard"];
            info = "Credit Card Number : " + "<b>" + "xxxxxxxxxxxxx" + objCreditCard.CreditCardNumber.ToString().Substring(objCreditCard.CreditCardNumber.ToString().Length - 4, 4) + "</b>" + "<br/>" +
            "Credit Card Type : " + "<b>" + objCreditCard.CreditCardType + "</b>" + "<br/>" +
            "First Name : " + "<b>" + objCreditCard.FirstName + "</b>" + "<br/>" +
            "Last Name : " + "<b>" + objCreditCard.LastName + "</b>" + "<br/>" +
            "Company Name : " + "<b>" + objCreditCard.CompanyName + "</b>" + "<br/>";
            Cost = Convert.ToDouble(objCreditCard.cost).ToString("C");
            if (Session["level"] != null)
            {
                UserServices objUserServices = new UserServices();
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
                else if (Session["level"].ToString() == "Partner")
                    attendees = int.Parse(objDt.Rows[0]["PartnerAttendees"].ToString());
                else
                    attendees = int.Parse(objDt.Rows[0]["SupportorAttendees"].ToString());
                level = Session["level"].ToString().Replace("upportor", "upporter");
                if (Session["extraPer"].ToString() != "0")
                {
                    attendees = attendees + Convert.ToInt32(Session["extraPer"]);
                    Cost = Convert.ToDouble(objCreditCard.cost+(Convert.ToInt32(Session["extraPer"])*800)).ToString("C");
                }
                //  lblTickets.Text = " " + attendees.ToString() + " ";
                tickets = attendees.ToString();
            }


            if (objCreditCard.Title.ToString() != "")
            {
                info = info + "Title : " + "<b>" + objCreditCard.Title + "</b>" + "<br/>";

            }

            info = info + "Email-id : " + "<b>" + objCreditCard.Email + "</b>" + "<br/>" +
            "Phone : " + "<b>" + objCreditCard.Phone + "</b>" + "<br/>";
            if (objCreditCard.Ext.ToString() != "")
            {
                info = info + "Ext : " + "<b>" + objCreditCard.Ext + "</b>" + "<br/>";
            }
            info = info + "Address 1 : " + "<b>" + objCreditCard.Address + "</b>" + "<br/>";
            if (objCreditCard.OtherAddress.ToString() != "")
            {
                info = info + "Address 2 : " + "<b>" + objCreditCard.OtherAddress + "</b>" + "<br/>";
            }
            if (objCreditCard.OtherCountry != null)
            {
                info = info + "Country : " + "<b>" + objCreditCard.OtherCountry + "</b>" + "<br/>";
            }
            else
            {
                info = info + "Country : " + "<b>" + objCreditCard.Country + "</b>" + "<br/>";
            }

            info = info + "City : " + "<b>" + objCreditCard.City + "</b>" + "<br/>";
            if (objCreditCard.OtherState != null)
            {
                info = info + "State : " + "<b>" + objCreditCard.OtherState + "</b>" + "<br/>";
            }
            else
            {
                info = info + "State : " + "<b>" + objCreditCard.State + "</b>" + "<br/>";
            }

            //   "State : " + "<b>" + objCreditCard.State + "</b>" + "<br/>" +
            info = info + "Zip : " + "<b>" + objCreditCard.Zip + "</b>" + "<br/>";

            //Added for donation text
            info = info + "Individual or Organization responsible for the donation : " + "<b>" + objCreditCard.DonationIndOrg + "</b>" + "<br/>";
            //info = info + "Next Wave Sohn: " + "<b>" + objCreditCard.NextWave + "</b>" + "<br/>";
            //info = info + "Sohn Partner : " + "<b>" + objCreditCard.SohnGeneralPartner + "</b>" + "<br/>";
            //info = info + "Attending Cocktail Hour:&nbsp;" + "<b> " + objCreditCard.Cocktail + "</b>";
            if (Session["res"] != null)
                lblStatus.Text = Session["res"].ToString() + "<br/><br/>" + info;

            lblConfirm.Text = Session["Confirm"].ToString();

            MailMessage objMailMesg = new MailMessage();

            objMailMesg.BodyFormat = MailFormat.Html;

            objMailMesg.Subject = "Womens Bond Club 2016 Confirmation";
            objMailMesg.From = System.Configuration.ConfigurationManager.AppSettings["CFNSAdminMailID"];


            //int iEmail;
            //iEmail = int.Parse(Session["EmailSettings"].ToString());

            //if (iEmail == 0)
            //{
            //    objMailMesg.To = objAttende[0].Email.ToString();
            //}
            //else
            //{
            //    for (int i = 0; i < int.Parse(Session["AttendeeCount"].ToString()); i++)
            //    {
            //        objMailMesg.To += objAttende[i].Email.ToString() + ",";
            //    }
            //}
            if (Session["ContriEmail"] != null)
            {
                objMailMesg.To = Session["ContriEmail"].ToString();
                objMailMesg.Bcc = System.Configuration.ConfigurationSettings.AppSettings["CFNSAdminBCCMailID"];
            }


           
            html = "<html><head></head>";


            html = html + "<body style=\"background: none repeat scroll 0 0 #FFFFFF;color: #666666;font-family: Arial,Helvetica,sans-serif;font-size: 11px;height: 100%;margin: 0;padding: 0;position: relative;text-align: center;\">";
            html = html + "<div style=\"padding: 20px 0; overflow: visible;    text-align: center; width: 100%;\">";
            html = html + "<img src=\"http://sequence-events.com/wbc/2015/asset/img-header-logo.png​\" ></imag>";
            html = html + "</div>";
            //  html = html + "</tr> <tr><td>" + sb.ToString() + "</td></tr></table></body></html>";
            html = html + "<div style=\"left: 0; min-width: 320px; position: absolute; top: 0;width: 100%;\">";
            html = html + "<div style=\"padding: 20px 0; overflow: visible;    text-align: center; width: 100%;\">";
            html = html + "<div style=\"text-align: center;-moz-box-sizing: border-box; margin: 0 auto;  max-width: 960px; overflow: hidden; position: relative;width: 100%;\">";
            html = html + "<div style=\"margin: 0 12.5% !important;width: 75% !important; width: 100%; -moz-box-sizing: border-box;    float: left;    overflow: hidden;    padding: 0 10px 10px;    position: relative;    text-align: left;\">";
            html = html + "<div style=\"padding: 20px 0; overflow: visible;    text-align: center; width: 100%;\">";
            html = html + "<div style=\"text-align: center;-moz-box-sizing: border-box; margin: 0 auto;  max-width: 960px; overflow: hidden; position: relative;width: 100%;\">";
            html = html + "<div style=\"margin: 0 12.5% !important;width: 75% !important; width: 100%; -moz-box-sizing: border-box;    float: left;    overflow: hidden;    padding: 0 10px 10px;    position: relative;    text-align: left;\">";
           
            html = html + "<p style=\"font-size: 12px;    line-height: 1.5em;    margin: 10px 0 0;\">";
            html = html + "Please print this confirmation page for your records.";
            html = html + "</p>";
            html = html + "<h2 style=\" color: #333333;    font-size: 12px;    line-height: 1.5em;    margin: 20px 0 0;    text-transform: uppercase;\">";
            html = html + "Confirmation Number: " + Session["Confirm"].ToString();
            html = html + "</h2>";
            html = html + "<h2 style=\" color: #333333;    font-size: 12px;    line-height: 1.5em;    margin: 20px 0 0;    text-transform: uppercase;\">";
            html = html + "Total Amount: " + Cost;
            html = html + "</h2>";

            html = html + "<h2 style=\" color: #333333;    font-size: 12px;    line-height: 1.5em;    margin: 20px 0 0;    text-transform: uppercase;\">";
            html = html + " Contributor Level: " + level.Replace("upportor", "upporter"); ;
            html = html + "</h2>";
            html = html + "<h2 style=\" color: #333333;    font-size: 12px;    line-height: 1.5em;    margin: 20px 0 0;    text-transform: uppercase;\">";
            html = html + " Total # of Tickets: " + tickets;
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
            // html = html + "<h2 style=\" color: #333333;    font-size: 12px;    line-height: 1.5em;    margin: 20px 0 0;    text-transform: uppercase;\">";

            //html = html + "<h2 style=\" color: #333333;    font-size: 12px;    line-height: 1.5em;    margin: 20px 0 0;    text-transform: uppercase;\">";
            //html = html + "Check Payment Detail";
            //html = html + "</h2>";
            html = html + "<p style=\"font-size: 12px;    line-height: 1.5em;    margin: 10px 0 0;\">";
            html = html + "You have purchased " + tickets + " tickets to the Womens Bond Club 2016.";
            html = html + "</p>";
           
          
            html = html + "</div></div></div></div></div></div></div>";
            html = html + "</body></html>";
            //System.Web.Mail.SmtpMail.SmtpServer = System.Configuration.ConfigurationSettings.AppSettings["smtpserver"];


            ContributorEmail = objMailMesg.To.ToString();
            //ContributorEmail = "kgopi@clavib.com";
            firstname = objCreditCard.FirstName;
            lastname = objCreditCard.LastName;
            try
            {
                System.Web.Mail.SmtpMail.SmtpServer = System.Configuration.ConfigurationManager.AppSettings["SMTPServer"];
                //System.Web.Mail.SmtpMail.SmtpServer = "mail.clavib.com";

                objMailMesg.BodyFormat = MailFormat.Html;
                objMailMesg.Body = html;

                //Commented by gopi to test on local
                System.Web.Mail.SmtpMail.Send(objMailMesg);
            }
            catch (Exception ex)
            {
            }
            Session.Remove("CreditCard");
            Session.Remove("cost");

        }
        else
        {
            Response.Redirect("Oops.htm");
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
