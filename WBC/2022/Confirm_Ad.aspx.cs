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
public partial class Confirm_Cheque : System.Web.UI.Page
{
    UserServices objUserServices = new UserServices();
    DataTable objDt;
    string html = "";
    string firstname = "";
    string lastname = "";
    string AttendeeEmail = "";
   public string Mad = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AttendiCheque"] != null )
        {
            

            string BillInfo = "";
            Cheque2014 objCheque = new Cheque2014();
            objCheque = (Cheque2014)Session["AttendiCheque"];
            int[] objAdminPrice;
            double Admincost = 0.0;
            objAdminPrice = (int[])Session["AdminPrices"];
            
            BillInfo = BillInfo + "First Name : " + objCheque.FirstName + "<br/>" +
            "Last Name : "  + objCheque.LastName + "<br/>" +
            "Comany Name :" + objCheque.company + "<br/>";
            
            BillInfo = BillInfo + "Email : " + objCheque.Email + "<br/>" +
                "Phone : " + objCheque.Phone + "<br/>";

           
            BillInfo = BillInfo + "Address : " + objCheque.Address + "<br/>";
            if (objCheque.OtherAddress.ToString() != "")
            {
                BillInfo = BillInfo + "Address2 : " + objCheque.OtherAddress + "<br/>";
            }
            BillInfo = BillInfo + "Country : " + objCheque.Country + "<br/>" +
                "City : " + objCheque.City + "<br/>" +
                "State : " + objCheque.State + "<br/>" +
                "Zip : " + objCheque.Zip + "<br/><br/>";
            // "Individual or Organization responsible for the donations:" + objCheque.IndOrg + "<br/>";

            lblStatus.Text = BillInfo;

            lblConfirm.Text = Session["Confirm"].ToString();
          
           
            html = "<html><head></head>";


            html = html + "<body style=\"background: none repeat scroll 0 0 #FFFFFF;color: #666666;font-family: Arial,Helvetica,sans-serif;font-size: 11px;height: 100%;margin: 0;padding: 0;position: relative;text-align: center;\">";
            html = html + "<div style=\"left: 0; min-width: 320px; position: absolute; top: 0;width: 100%;\">";
            html = html + "<div style=\"padding: 20px 0; overflow: visible;    text-align: center; width: 100%;\">";
            html = html + "<div style=\"text-align: center;-moz-box-sizing: border-box; margin: 0 auto;  max-width: 960px; overflow: hidden; position: relative;width: 100%;\">";
            html = html + "<div style=\"margin: 0 12.5% !important;width: 75% !important; width: 100%; -moz-box-sizing: border-box;    float: left;    overflow: hidden;    padding: 0 10px 10px;    position: relative;    text-align: left;\">";
            html = html + "<div style=\"padding: 20px 0; overflow: visible;    text-align: center; width: 100%;\">";
            html = html + "<div style=\"text-align: center;-moz-box-sizing: border-box; margin: 0 auto;  max-width: 960px; overflow: hidden; position: relative;width: 100%;\">";
            html = html + "<div style=\"margin: 0 12.5% !important;width: 75% !important; width: 100%; -moz-box-sizing: border-box;    float: left;    overflow: hidden;    padding: 0 10px 10px;    position: relative;    text-align: left;\">";
            html = html + "<div style=\"padding: 20px 0; overflow: visible;    text-align: center; width: 100%;\">";
            html = html + "<img src=\"http://sequence-events.com/wbc/2015/Images/EmailLogo.png\"></img>";
            html = html + "</div>";
            html = html + "<p style=\"font-size: 12px;    line-height: 1.5em;    margin: 10px 0 0;\">";
            html = html + "Hello!";
            html = html + "</p>";
            html = html + "<p style=\"font-size: 12px;    line-height: 1.5em;    margin: 10px 0 0;\">";
            html = html + "Thank you for your ticket commitment for the 2015 Merit Award Dinner!  Your purchase details are as follows:";
            html = html + "</p>";
           
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
                html = html + Mad;
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

            MailMessage objMailMesg = new MailMessage();

            objMailMesg.IsBodyHtml = true;
            objMailMesg.Subject = "WBC 2015 Confirmation";
            SmtpClient smtpClient = new SmtpClient("maila45.webcontrolcenter.com", 25);

            smtpClient.Credentials = new System.Net.NetworkCredential("wbc@sequence-events.com", "5kJH1WaH&aj$0");
            smtpClient.UseDefaultCredentials = true;
            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtpClient.EnableSsl = true;

            objMailMesg.From = new MailAddress(System.Configuration.ConfigurationManager.AppSettings["CFNSAdminMailID"]);
            
            string[] emails=(System.Configuration.ConfigurationSettings.AppSettings["CFNSAdminBCCMailID"]).Split(';');
            foreach (string email in emails)
            {
                objMailMesg.Bcc.Add(new MailAddress(email));
            }
         //   objMailMesg.Bcc.Add(new MailAddress(System.Configuration.ConfigurationSettings.AppSettings["CFNSAdminBCCMailID"]));
            /*     if (Session["EmailCount"].ToString() != "0" && Session["EmailCount"].ToString() != "All")
                     objMailMesg.To.Add(Session["EmailCount"].ToString());
                 else
                     if (Session["EmailCount"].ToString() == "0")
                     {
                         objMailMesg.To.Add(objAttende[0].Email.ToString());

                     }
                     else
                     {
                         string[] email = new string[int.Parse(Session["AttendeeCount"].ToString())];
                         string[] unique = new string[int.Parse(Session["AttendeeCount"].ToString())];
                         int count = 0;
                         for (int j = 0; j < int.Parse(Session["AttendeeCount"].ToString()); j++)
                         {
                             email[j] = objAttende[j].Email.ToString();
                         }

                         ArrayList arr = new ArrayList();

                         for (int k = 0; k < email.Length; k++)
                         {
                             arr.Add(email[k].ToString());
                         }
                         for (int i = 0; i < arr.Count - 1; i++)
                         {
                             for (int j = i + 1; j < arr.Count; j++)
                             {
                                 if (arr[i].Equals(arr[j]))
                                 {
                                     arr.RemoveAt(j);
                                 }
                             }
                         } for (int k = 0; k < arr.Count; k++)
                         {

                             objMailMesg.To.Add(arr[k].ToString());

                         }

                     }
     */
            //System.Web.Mail.SmtpMail.SmtpServer = System.Configuration.ConfigurationSettings.AppSettings["smtpserver"];
           
               
                objMailMesg.To.Add(objCheque.Email);
                //commmented by me towards new templates testing
               
                try
                {


                    objMailMesg.Body = html;
                   

                    smtpClient.Send(objMailMesg);

                }
                catch (Exception ex)
                {
                }
            
            Session.Remove("AttendiCheque");
            Session.Remove("cost");
            Session.Remove("viewingroomtext");
            Session.Remove("paymenttype");


        }
        else
        {
            //  Response.Redirect("Oops.htm");
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
