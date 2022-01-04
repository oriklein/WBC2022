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
using System.IO;
using System.Net.Mail;
public partial class Contri_ChequeConfirm : System.Web.UI.Page
{
    string html = "";
    string firstname = "";
    string lastname = "";
    string ContributorEmail = "";
    public string cost = "";
    public string level = "";
    public string tickets = "";
    string Mad = "";
    double extra = 0;
    UserServices objUserServices = new UserServices();
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
        if (Session["ContriCheque"] != null && Session["cost"] != null)
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


            if (Session["level"] != null)
            {
                UserServices objUserServices = new UserServices();
                DataTable objDt = objUserServices.Get_Enteprise_Charges(Session["level"].ToString().Trim());
                int attendees = Convert.ToInt32(objDt.Rows[0]["tickets"].ToString());



                // lblTickets.Text = " " + attendees.ToString() + " ";
                tickets = " " + attendees.ToString();
                if (Session["AdminOrder"] != null)
                {
                    tickets = (Session["AdminAttendees"]).ToString();
                }
            }
            if (Session["extraPer"].ToString() != "0")
            {

                cost = decimal.Parse((Convert.ToInt32(Session["cost"]) + (extra)).ToString()).ToString("C");
            }
            else
                cost = decimal.Parse(Session["cost"].ToString()).ToString("C");
            level = getSelectType(Session["level"].ToString().Trim());
            if (Session["extraPer"].ToString() != "0")
            {
                level = level + "<br>" + Mad;
            }

            string BillInfo = "";
            Cheque2014 objCheque = new Cheque2014();
            objCheque = (Cheque2014)Session["ContriCheque"];



            if (Session["Confirm"] != null)
            {
                lblConfirm.Text = Session["Confirm"].ToString();

            }

            BillInfo = BillInfo + "Your First Name : " + "" + objCheque.FirstName + "" + "<br/>" +
            "Your Last Name : " + "&nbsp;" + "" + objCheque.LastName + "" + "<br/>" +
            "Company name as it should appear on event collateral : &nbsp;" + "" + objCheque.company + "" + "<br/>";

            if (objCheque.IndOrg.ToString() != "")
            {
                BillInfo = BillInfo + "Company Name : &nbsp;" + "" + objCheque.IndOrg + "" + "<br/>";
            }
            BillInfo = BillInfo + "Email : &nbsp;" + "" + objCheque.Email + "" + "<br/>" +
                "Phone :  &nbsp;" + "" + objCheque.Phone + "" + "<br/>";

            if (objCheque.Ext.ToString() != "")
            {
                BillInfo = BillInfo + "Ext : &nbsp;" + "" + objCheque.Ext + "" + "<br/>";
            }
            BillInfo = BillInfo + "Address : &nbsp;" + "" + objCheque.Address + "" + "<br/>";
            if (objCheque.OtherAddress.ToString() != "")
            {
                BillInfo = BillInfo + "Address 2 : &nbsp;" + "" + objCheque.OtherAddress + "" + "<br/>";
            }
            BillInfo = BillInfo + "Country : &nbsp;" + "" + objCheque.Country + "" + "<br/>" +
                "City : &nbsp;" + "" + objCheque.City + "" + "<br/>" +
                "State : &nbsp;" + "" + objCheque.State + "" + "<br/>" +
                "Zip :  &nbsp;" + "" + objCheque.Zip + "" + "<br/>";
            BillInfo = BillInfo + "WBC : &nbsp;" + "" + objCheque.WbcName + "" + "<br/>";
            BillInfo = BillInfo + "<Div style='margin:0px 0px 0px 0px;'>" +
                //"Individual or Organization responsible for the donation : &nbsp;" + "" + objCheque.IndOrg + "</Div>" + "" + "<br/>";
                "</Div>" + "";
            //BillInfo = BillInfo + "Attending Next Wave Sohn:&nbsp;" + " " + objCheque.NextWave + "<br/>";
            //BillInfo = BillInfo + "Sohn Partner:&nbsp;" + " " + objCheque.SohnGeneralPartner + "<br/>";
            //BillInfo = BillInfo + "Attending Cocktail Hour:&nbsp;" + " " + objCheque.Cocktail + "";
            lblStatus.Text = BillInfo;
            if (Session["Confirm"] != null)
                lblConfirm.Text = Session["Confirm"].ToString();
            MailMessage objMailMesg = new MailMessage();

            objMailMesg.IsBodyHtml = true;

            objMailMesg.Subject = "WBC 2015 Confirmation ";
            objMailMesg.From = new MailAddress(System.Configuration.ConfigurationManager.AppSettings["CFNSAdminMailID"]);
            string[] emails = (System.Configuration.ConfigurationSettings.AppSettings["CFNSAdminBCCMailID"]).Split(';');
            foreach (string email in emails)
            {
                objMailMesg.Bcc.Add(new MailAddress(email));
            }
            if (Session["ContriEmail"] != null)
                objMailMesg.To.Add(Session["ContriEmail"].ToString());

            SmtpClient smtpClient = new SmtpClient("maila45.webcontrolcenter.com", 25);

            smtpClient.Credentials = new System.Net.NetworkCredential("wbc@sequence-events.com", "5kJH1WaH&aj$0");
            smtpClient.UseDefaultCredentials = true;
            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtpClient.EnableSsl = true;
            html = "<html><head></head>";


            html = html + "<body style=\"background: none repeat scroll 0 0 #FFFFFF;color: #666666;font-family: Arial,Helvetica,sans-serif;font-size: 11px;height: 100%;margin: 0;padding: 0;position: relative;text-align: center;\">";
            html = html + "<div style=\"padding: 20px 0; overflow: visible;    text-align: center; width: 100%;\">";
            html = html + "<img src=\"http://sequence-events.com/wbc/2015/Images/EmailLogo.png\"></img>";
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
            html = html + "Hello!";
            html = html + "</p>";
            html = html + "<p style=\"font-size: 12px;    line-height: 1.5em;    margin: 10px 0 0;\">";
            html = html + "Thank you for your table commitment for the 2015 Merit Award Dinner!  Your purchase details are as follows:";
            html = html + "</p>";
            html = html + "<h2 style=\" color: #333333;    font-size: 12px;    line-height: 1.5em;    margin: 20px 0 0;    text-transform: uppercase;\">";
            html = html + " Sponsor Level: " + level;
            html = html + "</h2>";
            html = html + "<h2 style=\" color: #333333;    font-size: 12px;    line-height: 1.5em;    margin: 20px 0 0;    text-transform: uppercase;\">";
            html = html + "Confirmation Number: " + Session["Confirm"].ToString();
            html = html + "</h2>";
            html = html + "<h2 style=\" color: #333333;    font-size: 12px;    line-height: 1.5em;    margin: 20px 0 0;    text-transform: uppercase;\">";
            html = html + "REGISTRATION DETAILS";
            html = html + "</h2>";
            html = html + "<p style=\"font-size: 12px;    line-height: 1.5em;    margin: 10px 0 0;\">";
            html = html + BillInfo;
            html = html + "</p>";

            html = html + "<h2 style=\" color: #333333;    font-size: 12px;    line-height: 1.5em;    margin: 20px 0 0;    text-transform: uppercase;\">";
            html = html + "Event Details";
            html = html + "</h2>";
            html = html + "<p style=\"font-size: 12px;    line-height: 1.5em;    margin: 10px 0 0;\">";
            html = html + "April 21st, 2015<br />6pm-10pm<br /><br />American Museum of Natural History<br />Central Park W & 79th St<br />New York, NY, 10024";
            html = html + "</p>";

            html = html + "<p style=\"font-size: 12px;    line-height: 1.5em;    margin: 10px 0 0;\">";
            html = html + "You will receive an email from XXX to collect your payment information.  ";
            html = html + "</p>";
            html = html + "<p style=\"font-size: 12px;    line-height: 1.5em;    margin: 10px 0 0;\">";
            html = html + "As a Corporate Member of the Women's Bond Club, you are entitled to an ad in the printed journal, and premium exposure in the slideshow during the Merit Award Dinner.   ";
            html = html + "</p>";
            html = html + "<p style=\"font-size: 13px;    line-height: 1.5em;    margin: 10px 0 0;\">";
            html = html + "All logos and ads must be submitted by Friday, April 1.   ";
            html = html + "</p>";
            html = html + "<ul>";
            html = html + " <li>Dimensions of the ad should be 7” W x 5” H</li><li>All ads should be black & white/grayscale</li>";
            html = html + "<li>Accepted file formats are: Illustrator EPS (convert text to outline), High-resolution TIFFs (300 dpi or greater), or PDFs (X-1A).</li>";
            html = html + "<li>Corporate logo in color as a high-resolution TIFF, JPEG, or EPS.</li>";
            html = html + " </ul> ";
            html = html + "<p style=\"font-size: 13px;    line-height: 1.5em;    margin: 10px 0 0;\">";
            html = html + "Please email your ad and logo to joy@sequence-events.com   ";
            html = html + "</p>";
            html = html + "<p style=\"font-size: 13px;    line-height: 1.5em;    margin: 10px 0 0;\">";
            html = html + "Feel free to contact me if you have any questions. ";
            html = html + "</p>";
            html = html + "<p style=\"font-size: 13px;    line-height: 1.5em;    margin: 10px 0 0;\">";
            html = html + "Thanks and we look forward to seeing you in April!";
            html = html + "</p>";
            html = html + "<p style=\"font-size: 13px;    line-height: 1.5em;    margin: 10px 0 0;\">";
            html = html + "Joy";
            html = html + "</p>";
            html = html + "</div></div></div></div></div></div></div>";
            html = html + "</body></html>";
            //System.Web.Mail.SmtpMail.SmtpServer = System.Configuration.ConfigurationSettings.AppSettings["smtpserver"];

            ContributorEmail = objMailMesg.To.ToString();
            firstname = objCheque.FirstName;
            lastname = objCheque.LastName;
            if (Session["EmailCount"].ToString() == "1")
            {
                try
                {



                    objMailMesg.Body = html;


                    objUserServices.Update_SentDate(Convert.ToInt32(Session["payPersonID"]), DateTime.Now.ToString());
                    //Commented by Gopi to test on local
                    smtpClient.Send(objMailMesg);
                }
                catch (Exception ex)
                {
                }
            }
            else
                objUserServices.Update_SentDate(Convert.ToInt32(Session["payPersonID"]), "NOT SENT");
            Session.Remove("CreditCard");
            Session.Remove("ContriCheque");
            Session.Remove("cost");
            Session.Remove("extraPer");
            Session.Remove("contlevel");
            Session.Remove("paymenttype");
        }

        else
        {
            Response.Redirect("Oops.htm");
        }

    }
    private string getSelectType(string type)
    {
        switch (type)
        {
            case "FOREMAN":
                return "Member Table $9,500 ( 10 tickets )";
            case "BUILDER":
                return "Non-Member Table $10,500 ( 10 tickets )";
            case "CARPENTER":
                return "Corporate Member Firms 1⁄2 Table $5,800 ( 5 tickets )";
            case "PAINTER":
                return "Non Member Firms 1⁄2 Table $6,400 ( 5 tickets )";
            case "DELUXE":
                return "DELUXE TICKET PACKAGE $2,250 Includes three tickets";
            case "PREMIUM":
                return "PREMIUM TICKET PACKAGE $1,500 Includes two tickets";
        }
        return "";
    }

    protected void lnkLogOut_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.RemoveAll();
        Session["userid"] = "";
        Response.Redirect("Bo/Bo_Login.aspx");
    }
}
