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

public partial class donorChequeConfirm : System.Web.UI.Page
{
    string html = "";
    string firstname = "";
    string lastname = "";
    UserServices objUserServices = new UserServices();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["donorCheque"] != null || Session["contlevel"] != null)
        {
            //try
            //{
                string BillInfo = "";
                Cheque objCheque = new Cheque();
                objCheque = (Cheque)Session["donorCheque"];
                if (Session["cost"] != null)
                {
                    lblCost.Text = string.Format("{0:C}", double.Parse(Session["cost"].ToString()));
                }
               
                if (Session["Confirm"] != null)
                    lblConfirm.Text = Session["Confirm"].ToString();
                BillInfo = BillInfo + "First Name : " + "" + objCheque.FirstName + "" + "<br/>" +
                "Last Name : " + "&nbsp;" + "" + objCheque.LastName + "" + "<br/>" +
                "Company Name : &nbsp;" + "" + objCheque.company + "" + "<br/>";
                if (objCheque.Title.ToString() != "")
                {
                    BillInfo = BillInfo + "Tilte : &nbsp;" + "" + objCheque.Title + "" + "<br/>";
                }
                BillInfo = BillInfo + "Email : " + "" + objCheque.Email + "" + "<br/>" +
                    "Phone : " + "" + objCheque.Phone + "" + "<br/>";

                if (objCheque.Ext.ToString() != "")
                {
                    BillInfo = BillInfo + "Ext : " + "" + objCheque.Ext + "" + "<br/>";
                }
                BillInfo = BillInfo + "Address 1: " + "" + objCheque.Address + "" + "<br/>";
                if (objCheque.OtherAddress.ToString() != "")
                {
                    BillInfo = BillInfo + "Address 2: " + "" + objCheque.OtherAddress + "" + "<br/>";
                }
                BillInfo = BillInfo + "Country : " + "" + objCheque.Country + "" + "<br/>" +
                    "City : " + "" + objCheque.City + "" + "<br/>" +
                    "State : " + "" + objCheque.State + "" + "<br/>" +
                    "Zip : " + "" + objCheque.Zip + "" + "<br/>" +
                "Individual or Organization reponsible for the donation: " + "" + objCheque.IndOrg + "<br/>";

                lblStatus.Text = BillInfo;

              


                MailMessage objMailMesg = new MailMessage();

                objMailMesg.IsBodyHtml = true;

                objMailMesg.Subject = "Womens Bond Club 2015 Confirmation";
                objMailMesg.From =new MailAddress(System.Configuration.ConfigurationManager.AppSettings["CFNSAdminMailID"]);
                objMailMesg.To.Add(Session["donorEmail"].ToString());
                //objMailMesg.Bcc.Add(System.Configuration.ConfigurationSettings.AppSettings["CFNSAdminBCCMailID"]);
                SmtpClient smtpClient = new SmtpClient("maila45.webcontrolcenter.com", 25);

                smtpClient.Credentials = new System.Net.NetworkCredential("wbc@sequence-events.com", "5kJH1WaH&aj$0");
                smtpClient.UseDefaultCredentials = true;
                smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtpClient.EnableSsl = true;
                string html = "";
                html = "<html><head></head>";


                html = html + "<body style=\"background: none repeat scroll 0 0 #FFFFFF;color: #666666;font-family: Arial,Helvetica,sans-serif;font-size: 11px;height: 100%;margin: 0;padding: 0;position: relative;text-align: center;\">";
                html = html + "<div style=\"text-align: center;-moz-box-sizing: border-box; margin: 0 auto;  max-width: 960px; overflow: hidden; position: relative;width: 100%;\">";
                html = html + "<img src=\"http://sequence-events.com/wbc/2015/asset/img-header-logo.png​\" ></img>";
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
                html = html + "Donation Amount: " + string.Format("{0:C}", double.Parse(Session["cost"].ToString()));
                html = html + "</h2>";
                
                html = html + "<h2 style=\" color: #333333;    font-size: 12px;    line-height: 1.5em;    margin: 20px 0 0;    text-transform: uppercase;\">";
                html = html + "Payment Details";
                html = html + "</h2>";
                html = html + "<p style=\"font-size: 12px;    line-height: 1.5em;    margin: 10px 0 0;\">";
                html = html + BillInfo;
                html = html + "</p>";

                html = html + "<h2 style=\" color: #333333;    font-size: 12px;    line-height: 1.5em;    margin: 20px 0 0;    text-transform: uppercase;\">";
                html = html + "PAYMENT INFORMATION";
                html = html + "</h2>";
                html = html + "<p style=\"font-size: 12px;    line-height: 1.5em;    margin: 10px 0 0;\">";
                html = html + "If you are paying by check, please make checks payable to Enterprise Community Partners, Inc. Please note your confirmation number above on the check.<br /><br />";
                html = html + "All checks must be mailed to:<br />Sequence Events<br />Attn: Gotham City Gala<br />108 West 39th St., Suite 604<br />New York, NY 10018<br /><br />";
                html = html + "Questions? Contact Sequence Events at <br />";
                html = html + "<u>gothamcitygala@enterprisecommunity.org</u> or call (646) 336-6800 x104.";
                html = html + "</p>";
                html = html + "</div></div></div></div></div></div></div>";
                html = html + "</body></html>";

                //System.Web.Mail.SmtpMail.SmtpServer = System.Configuration.ConfigurationSettings.AppSettings["smtpserver"];

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
                Session.Remove("donorCheque");
                Session.Remove("contlevel");
        }
        else
        {
            Response.Redirect("Oops.htm");
        }
    }
}
