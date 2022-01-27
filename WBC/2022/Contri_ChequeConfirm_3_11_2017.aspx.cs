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
    public string LvlMsg = "";
    public string level = "";
    public string tickets = "";
    public string Desc = "";
    string Mad = "";
    double extra = 0;
    WBCUserServices objUserServices = new WBCUserServices();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["ContriCheque"] != null && Session["cost"] != null)
        {
            //try
            //{
            //if (Session["AdminOrder"] != null)
            //    if (Session["userid"] == null)
            //        Response.Redirect("Bo/Bo_Login.aspx");
            //    else
            //        divAdmin.Visible = true;
            //else
                divAdmin.Visible = false;


            Memebrs mb = (Memebrs)Session["contlevel"];
            double totalMny = 0;
            if (mb.MemberType == "Yes")
            {
                level += "<p>Table for 10 included in WBC Membership </p>";
                level += "<p>Full Page Ad in MAD Event Journal </p>";

                if (mb.AddFullTable > 0)
                {
                    level += "<p>" + mb.AddFullTable + " Additional Full Table(s) of 10 @ " + (mb.AddFullTable * 10500).ToString("C") + " </p>";
                    totalMny += (mb.AddFullTable * 10500);
                }
                if (mb.AddHalfTable > 0)
                {
                    level += "<p>" + mb.AddHalfTable + " Additional Half Table(s) of 5 @ " + (mb.AddHalfTable * 5800).ToString("C") + "</p>";
                    totalMny += (mb.AddHalfTable * 5800);
                }
                if (mb.AddTickets > 0)
                {
                    level += "<p>" + mb.AddTickets + " Additional Ticket(s) @ " + (mb.AddTickets * 750).ToString("C") + "</p>";
                    totalMny += (mb.AddTickets * 750);
                }
                if (mb.AddFullAd > 0)
                {
                    level += "<p>" + mb.AddFullAd + " Additional Full Page Ad in MAD Event Journal @ $250.00</p>";
                    totalMny += 250;
                }
                if (mb.AddHalfAd > 0)
                {
                    level += "<p>" + mb.AddHalfAd + " Additional Half Page Ad in MAD Event Journal @ $150.00</p>";
                    totalMny += 150;
                }
            }else if (mb.MemberType == "Extra")
            {
               // level += "<p>Table for 10 included in WBC Membership </p>";
               // level += "<p>Full Page ad in MAD Event Journal </p>";

                if (mb.AddFullTable > 0)
                {
                    level += "<p>" + mb.AddFullTable + " Additional Full Table(s) of 10 @ " + (mb.AddFullTable * 10500).ToString("C") + " </p>";
                    totalMny += (mb.AddFullTable * 10500);
                }
                if (mb.AddHalfTable > 0)
                {
                    level += "<p>" + mb.AddHalfTable + " Additional Half Table(s) of 5 @ " + (mb.AddHalfTable * 5800).ToString("C") + "</p>";
                    totalMny += (mb.AddHalfTable * 5800);
                }
                if (mb.AddTickets > 0)
                {
                    level += "<p>" + mb.AddTickets + " Additional Ticket(s) @ " + (mb.AddTickets * 750).ToString("C") + "</p>";
                    totalMny += (mb.AddTickets * 750);
                }
                if (mb.AddFullAd > 0)
                {
                    level += "<p>" + mb.AddFullAd + " Additional Full Page Ad in MAD Event Journal @ $250.00</p>";
                    totalMny += 250;
                }
                if (mb.AddHalfAd > 0)
                {
                    level += "<p>" + mb.AddHalfAd + " Additional Half Page Ad in MAD Event Journal @ $150.00</p>";
                    totalMny += 150;
                }
            }
            else
            {
                if (mb.AddFullTable > 0)
                {
                    level += "<p>" + mb.AddFullTable + " Full Table(s) of 10 @ " + (mb.AddFullTable * 12000).ToString("C") + " </p>";
                    totalMny += (mb.AddFullTable * 12000);
                }
                if (mb.AddHalfTable > 0)
                {
                    level += "<p>" + mb.AddHalfTable + " Half Table(s) of 5 @ " + (mb.AddHalfTable * 6400).ToString("C") + "</p>";
                    totalMny += (mb.AddHalfTable * 6400);
                }
                if (mb.AddTickets > 0)
                {
                    level += "<p>" + mb.AddTickets + " Ticket(s) @ " + (mb.AddTickets * 1100).ToString("C") + "</p>";
                    totalMny += (mb.AddTickets * 1100);
                }
                if (mb.AddFullAd > 0)
                {
                    level += "<p>" + mb.AddFullAd + " Full Page Ad in MAD Event Journal @ $250.00</p>";
                    totalMny += 250;
                }
                if (mb.AddHalfAd > 0)
                {
                    level += "<p>" + mb.AddHalfAd + " Half Page Ad in MAD Event Journal @ $150.00</p>";
                    totalMny += 150;
                }
            }
            LvlMsg += "<p>You Selected </p>";
            LvlMsg += "<p> Total " + totalMny.ToString("C") + "</p>";
            LvlMsg += level;



            string BillInfo = "";
            if (mb.MemberType == "Yes")
            {
                Desc += "  <p class=\"large\">If applicable, you will receive an email from the Women’s Bond Club to collect your payment information.  </p>";
                Desc += " <p class=\"large\">Each corporate membership in the Women’s Bond Club entitles you to an ad in the printed journal and premium exposure in the slideshow during the Merit Award Dinner.</p>";
                Desc += " <p class=\"large\" style=\"text-decoration: underline;font-weight: bold;\">All logos and ads must be submitted by Friday, April 7.</p>";
                Desc += " <p class=\"large\" style=\"font-weight: bold;\">The ad and logo specs are as follows:</p>";
                Desc += " <ul style=\"font-weight: bold;\"><li>Dimensions of the ad should be 7” W x 5” H</li>";
                Desc += "  <li>All ads should be black & white/grayscale</li>";
                Desc += " <li>Accepted file formats are: Illustrator EPS (convert text to outline), High-resolution TIFFs (300 dpi or greater), or PDFs (X-1A).</li>";
                Desc += "  <li>Corporate logo in color as a high-resolution TIFF, JPEG, or EPS.</li></ul>";
                Desc += " <p class=\"large\">Please email your ad and logo to wbc@sequence-events.com</p>";
            }
            if (mb.MemberType == "No" && (mb.AddFullTable > 0 || mb.AddHalfTable > 0) && mb.AddFullAd == 0 && mb.AddHalfAd == 0)
            {
                Desc += " <p class=\"large\">You will receive an email from the Women’s Bond Club to collect your payment information.  </p>";
                Desc += " <p class=\"large\">With your table purchase, your company logo will appear in the printed journal and in the slideshow during the Merit Award Dinner.  </p>";
                Desc += " <p class=\"large\" style=\"text-decoration: underline;font-weight: bold;\">All logos must be submitted by Friday, April 7.</p>";
                Desc += " <p class=\"large\" style=\"font-weight: bold;\">The logo specs are as follows:</p>";
                Desc += " <ul style=\"font-weight: bold;\">";
                Desc += "  <li>Corporate logo in color as a high-resolution TIFF, JPEG, or EPS.</li></ul>";
                Desc += " <p class=\"large\">Please email your ad and logo to wbc@sequence-events.com</p>";
            }
            if (mb.MemberType == "No" && (mb.AddFullTable > 0 || mb.AddHalfTable > 0) && (mb.AddFullAd > 0 || mb.AddHalfAd > 0))
            {
                Desc += " <p class=\"large\">You will receive an email from the Women’s Bond Club to collect your payment information.  </p>";
                Desc += " <p class=\"large\">With your commitment, you are entitled to an ad in the printed journal and premium exposure in the slideshow during the Merit Award Dinner.  </p>";
                Desc += " <p class=\"large\" style=\"text-decoration: underline;font-weight: bold;\">All logos and ads must be submitted by Friday, April 7.</p>";
                Desc += " <p style=\"font-weight: bold;\">The ad and logo specs are as follows:</p>";
                Desc += " <ul style=\"font-weight: bold;\"><li>Dimensions of the ad should be 7” W x 5” H</li>";
                Desc += "  <li>All ads should be black & white/grayscale</li>";
                Desc += " <li>Accepted file formats are: Illustrator EPS (convert text to outline), High-resolution TIFFs (300 dpi or greater), or PDFs (X-1A).</li>";
                Desc += "  <li>Corporate logo in color as a high-resolution TIFF, JPEG, or EPS.</li></ul>";
                Desc += " <p class=\"large\">Please email your ad and logo to wbc@sequence-events.com</p>";
            }
            if (mb.MemberType == "No" && (mb.AddFullTable == 0 && mb.AddHalfTable == 0) && mb.AddTickets > 0 && (mb.AddFullAd == 0 && mb.AddHalfAd == 0))
            {
                Desc += " <p class=\"large\">You will receive an email from the Women’s Bond Club to collect your payment information.  </p>";

            }
            if (mb.MemberType == "Extra")
            {
                Desc += " <p class=\"large\">You will receive an email from the Women’s Bond Club to collect your payment information.  </p>";

            }
            if (mb.MemberType == "No" && (mb.AddFullTable == 0 && mb.AddHalfTable == 0)  && (mb.AddFullAd > 0 || mb.AddHalfAd > 0))
            {
                Desc += " <p class=\"large\">You will receive an email from the Women’s Bond Club to collect your payment information.  </p>";
                Desc += " <p class=\"large\">With your commitment, you are entitled to an ad in the printed journal.  </p>";
                Desc += " <p class=\"large\" style=\"text-decoration: underline;font-weight: bold\">All logos and ads must be submitted by Friday, April 7.</p>";
                Desc += " <p style=\"font-weight: bold;>The ad and logo specs are as follows:</p>";
                Desc += " <ul style=\"font-weight: bold;><li>Dimensions of the ad should be 7” W x 5” H</li>";
                Desc += "  <li>All ads should be black & white/grayscale</li>";
                Desc += " <li>Accepted file formats are: Illustrator EPS (convert text to outline), High-resolution TIFFs (300 dpi or greater), or PDFs (X-1A).</li>";
                Desc += "</ul>";
                Desc += " <p class=\"large\">Please email your ad and logo to wbc@sequence-events.com</p>";

            }
            Cheque2014 objCheque = new Cheque2014();
            objCheque = (Cheque2014)Session["ContriCheque"];





            BillInfo = BillInfo + "Your First Name : " + "" + objCheque.FirstName + "" + "<br/>" +
            "Your Last Name : " + "&nbsp;" + "" + objCheque.LastName + "" + "<br/>";
            // "Company name as it should appear on event collateral : &nbsp;" + "" + objCheque.company + "" + "<br/>";

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
            BillInfo = BillInfo + "Please list your WBC Contact : &nbsp;" + "" + objCheque.WbcName + "" + "<br/>";
            if (objCheque.Biller=="Y")
                BillInfo = BillInfo + "I am the billing contact : &nbsp; Yes" + "<br/>";
            else
                BillInfo = BillInfo + "I am the billing contact : &nbsp; No" + "<br/>";
            if (objCheque.Biller == "N")
            {
                BillInfo = BillInfo + "  If different from above, <br>&bull;Address Invoice to:<br/>";
                BillInfo = BillInfo + "Name : &nbsp;" + "" + objCheque.BName + "" + "<br/>";
                BillInfo = BillInfo + "Title : &nbsp;" + "" + objCheque.BTitle + "" + "<br/>";
                BillInfo = BillInfo + "Company : &nbsp;" + "" + objCheque.BCompany + "" + "<br/>";
                BillInfo = BillInfo + "Address : &nbsp;" + "" + objCheque.BAddress + "" + "<br/>";
                BillInfo = BillInfo + "Country : &nbsp;" + "" + objCheque.BCountry + "" + "<br/>";
                BillInfo = BillInfo + "City : &nbsp;" + "" + objCheque.BCity + "" + "<br/>";
                BillInfo = BillInfo + "State : &nbsp;" + "" + objCheque.BState + "" + "<br/>";
                BillInfo = BillInfo + "Zip : &nbsp;" + "" + objCheque.BZip + "" + "<br/>";
                BillInfo = BillInfo + "&bull;Email Invoice to:<br/>";
                BillInfo = BillInfo + "Email Address : &nbsp;" + "" + objCheque.BEmail + "" + "<br/>";
                BillInfo = BillInfo + "Cc’d Email : &nbsp;" + "" + objCheque.BCEmail + "" + "<br/>";
                BillInfo = BillInfo + "&bull;In case of additional billing questions, please contact<br/>";
               
                    BillInfo = BillInfo + "Name : &nbsp;" + "" + objCheque.BOName + "" + "<br/>";
               
                    BillInfo = BillInfo + "Phone : &nbsp;" + "" + objCheque.BOPhone + "" + "<br/>";
              
                    BillInfo = BillInfo + "Email : &nbsp;" + "" + objCheque.BOEmail + "" + "<br/>";
            }
            BillInfo = BillInfo + "<Div style='margin:0px 0px 0px 0px;'>" +
                //"Individual or Organization responsible for the donation : &nbsp;" + "" + objCheque.IndOrg + "</Div>" + "" + "<br/>";
                "</Div>" + "";
            //BillInfo = BillInfo + "Attending Next Wave Sohn:&nbsp;" + " " + objCheque.NextWave + "<br/>";
            //BillInfo = BillInfo + "Sohn Partner:&nbsp;" + " " + objCheque.SohnGeneralPartner + "<br/>";
            //BillInfo = BillInfo + "Attending Cocktail Hour:&nbsp;" + " " + objCheque.Cocktail + "";
            lblStatus.Text = BillInfo;


            MailMessage objMailMesg = new MailMessage();

            objMailMesg.IsBodyHtml = true;

            objMailMesg.Subject = " 2017 Merit Award Dinner Confirmation";
            objMailMesg.From = new MailAddress(System.Configuration.ConfigurationManager.AppSettings["CFNSAdminMailID"], "Women's Bond Club");
            //string[] emails = (System.Configuration.ConfigurationSettings.AppSettings["CFNSAdminBCCMailID"]).Split(';');
            //foreach (string email in emails)
            //{
            //    objMailMesg.Bcc.Add(new MailAddress(email));
            //}
            objMailMesg.Bcc.Add(new MailAddress("SEQconfirm@gmail.com"));
            if (Session["ContriEmail"] != null)
                objMailMesg.To.Add(Session["ContriEmail"].ToString());

            SmtpClient smtpClient = new SmtpClient("maila45.webcontrolcenter.com", 25);

            smtpClient.Credentials = new System.Net.NetworkCredential("wbc@sequence-events.com", "5kJH1WaH&aj$0");
            smtpClient.UseDefaultCredentials = true;
            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtpClient.EnableSsl = true;
            html = "<html><head></head>";


            html = html + "<body style=\"background: none repeat scroll 0 0 #FFFFFF;color: #666666;font-family: Arial,Helvetica,sans-serif;font-size: 11px;height: 100%;margin: 0;padding: 0;position: relative;text-align: center;\">";

            //  html = html + "</tr> <tr><td>" + sb.ToString() + "</td></tr></table></body></html>";
            html = html + "<div style=\"left: 0; min-width: 320px; position: absolute; top: 0;width: 100%;\">";
            html = html + "<div style=\"padding: 20px 0; overflow: visible;    text-align: center; width: 100%;\">";
            html = html + "<div style=\"text-align: center;-moz-box-sizing: border-box; margin: 0 auto;  max-width: 960px; overflow: hidden; position: relative;width: 100%;\">";
            html = html + "<div style=\"margin: 0 12.5% !important;width: 75% !important; width: 100%; -moz-box-sizing: border-box;    float: left;    overflow: hidden;    padding: 0 10px 10px;    position: relative;    text-align: left;\">";
            html = html + "<div style=\"padding: 20px 0; overflow: visible;    text-align: center; width: 100%;\">";
            html = html + "<div style=\"text-align: center;-moz-box-sizing: border-box; margin: 0 auto;  max-width: 960px; overflow: hidden; position: relative;width: 100%;\">";
            html = html + "<div style=\"margin: 0 12.5% !important;width: 75% !important; width: 100%; -moz-box-sizing: border-box;    float: left;    overflow: hidden;    padding: 0 10px 10px;    position: relative;    text-align: left;\">";
            html = html + "<div style=\"padding: 20px 0; overflow: visible;    text-align: center; width: 100%;\">";
            html = html + "<img src=\"http://reg.sequence-events.com/wbc/2017/asset/img-header-logo.png\"></img>";
            html = html + "</div>";
            html = html + "<p style=\"font-size: 12px;    line-height: 1.5em;    margin: 10px 0 0;\">";
            html = html + "Hello!";
            html = html + "</p>";
            html = html + "<p style=\"font-size: 12px;    line-height: 1.5em;    margin: 10px 0 0;\">";
            html = html + "Thank you for your table commitment for the 2017 Merit Award Dinner!  Your purchase details are as follows:";
            html = html + "</p>";
            html = html + "<h2 style=\" color: #333333;    font-size: 12px;    line-height: 1.5em;    margin: 20px 0 0;    text-transform: uppercase;\">";
            html = html + LvlMsg;
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
            html = html + "May 2nd, 2017<br />6:00pm Cocktails | 7:00pm Dinner<br /><br />Business Attire<br />American Museum of Natural History<br /> Central Park West at 79th St.<br />New York, NY, 10024";
            html = html + "</p>";
            if (mb.MemberType == "Yes")
            {
                html = html + "<p style=\"font-size: 12px;    line-height: 1.5em;    margin: 10px 0 0;\">";
                html = html + "If applicable, you will receive an email from the Women’s Bond Club to collect your payment information. ";
                html = html + "</p>";
                html = html + "<p style=\"font-size: 12px;    line-height: 1.5em;    margin: 10px 0 0;\">";
                html = html + "Each corporate membership in the Women’s Bond Club entitles you to an ad in the printed journal and premium exposure in the slideshow during the Merit Award Dinner. ";
                html = html + "</p>";
                html = html + "<p style=\"font-size: 12px;font-weight: bold;    line-height: 1.5em; text-decoration:underline;   margin: 10px 0 0;\">";
                html = html + "All logos and ads must be submitted by Friday, April 7.";
                html = html + "</p>";
                html = html + "<p style=\"font-size: 12px;font-weight: bold;    line-height: 1.5em;    margin: 10px 0 0;\">";
                html = html + "The ad and logo specs are as follows:";
                html = html + "</p>";


                html = html + " <ul style=\"font-weight: bold;\"> ";
                html = html + "<li>Dimensions of the ad should be 7” W x 5” H</li>";
                html = html + "<li>All ads should be black & white/gray scale</li>";
                html = html + "<li>Accepted file formats are: Illustrator EPS (convert text to outline), High-resolution TIFFs (300 dpi or greater), or PDFs (X-1A).</li>";
                html = html + "<li>Corporate logo in color as a high-resolution TIFF, JPEG, or EPS.</li>";
                html = html + " </ul> ";
                html = html + "<p style=\"font-size: 13px;    line-height: 1.5em;    margin: 10px 0 0;\">";
                html = html + "Please email your ad and logo to wbc@sequence-events.com   ";
                html = html + "</p>";
            }
            if (mb.MemberType == "No" && (mb.AddFullTable > 0 || mb.AddHalfTable > 0) && mb.AddFullAd == 0 && mb.AddHalfAd == 0)
            {
                html = html + "<p style=\"font-size: 12px;    line-height: 1.5em;    margin: 10px 0 0;\">";
                html = html + "You will receive an email from the Women’s Bond Club to collect your payment information. ";
                html = html + "</p>";
                html = html + "<p style=\"font-size: 12px;    line-height: 1.5em;    margin: 10px 0 0;\">";
                html = html + "With your table purchase, your company logo will appear in the printed journal and in the slideshow during the Merit Award Dinner.   ";
                html = html + "</p>";
                html = html + "<p style=\"font-size: 12px; font-weight: bold;   line-height: 1.5em; text-decoration:underline;   margin: 10px 0 0;\">";
                html = html + "All logos must be submitted by Friday, April 7.";
                html = html + "</p>";
                html = html + "<p style=\"font-size: 12px; font-weight: bold;   line-height: 1.5em;    margin: 10px 0 0;\">";
                html = html + "The logo specs are as follows:";
                html = html + "</p>";


                html = html + " <ul style=\"font-weight: bold;\"> ";
                html = html + "<li>Corporate logo in color as a high-resolution TIFF, JPEG, or EPS.</li>";
                html = html + " </ul> ";
                html = html + "<p style=\"font-size: 13px;    line-height: 1.5em;    margin: 10px 0 0;\">";
                html = html + "Please email your ad and logo to wbc@sequence-events.com   ";
                html = html + "</p>";
            }
            if (mb.MemberType == "No" && (mb.AddFullTable > 0 || mb.AddHalfTable > 0) && (mb.AddFullAd > 0 || mb.AddHalfAd > 0))
            {
                html = html + "<p style=\"font-size: 12px;    line-height: 1.5em;    margin: 10px 0 0;\">";
                html = html + "You will receive an email from the Women’s Bond Club to collect your payment information. ";
                html = html + "</p>";
                html = html + "<p style=\"font-size: 12px;    line-height: 1.5em;    margin: 10px 0 0;\">";
                html = html + "With your commitment, you are entitled to an ad in the printed journal and premium exposure in the slideshow during the Merit Award Dinner.  ";
                html = html + "</p>";
                html = html + "<p style=\"font-size: 12px;font-weight: bold;line-height: 1.5em; text-decoration:underline;   margin: 10px 0 0;\">";
                html = html + "All logos and ads must be submitted by Friday, April 7.";
                html = html + "</p>";
                html = html + "<p style=\"font-size: 12px;font-weight: bold;line-height: 1.5em;    margin: 10px 0 0;\">";
                html = html + "The ad and logo specs are as follows:";
                html = html + "</p>";


                html = html + " <ul style=\"font-weight: bold;\"> ";
                html = html + "<li>Dimensions of the ad should be 7” W x 5” H</li>";
                html = html + "<li>All ads should be black & white/gray scale</li>";
                html = html + "<li>Accepted file formats are: Illustrator EPS (convert text to outline), High-resolution TIFFs (300 dpi or greater), or PDFs (X-1A).</li>";
                html = html + "<li>Corporate logo in color as a high-resolution TIFF, JPEG, or EPS.</li>";
                html = html + " </ul> ";
                html = html + "<p style=\"font-size: 13px;    line-height: 1.5em;    margin: 10px 0 0;\">";
                html = html + "Please email your ad and logo to wbc@sequence-events.com   ";
                html = html + "</p>";
            }
            if (mb.MemberType == "No" && (mb.AddFullTable == 0 && mb.AddHalfTable == 0) && mb.AddTickets > 0 && (mb.AddFullAd == 0 && mb.AddHalfAd == 0))
            {
                html = html + "<p style=\"font-size: 12px;    line-height: 1.5em;    margin: 10px 0 0;\">";
                html = html + "You will receive an email from the Women’s Bond Club to collect your payment information. ";
                html = html + "</p>";
            } if (mb.MemberType == "Extra")
            {
                html = html + "<p style=\"font-size: 12px;    line-height: 1.5em;    margin: 10px 0 0;\">";
                html = html + "You will receive an email from the Women’s Bond Club to collect your payment information. ";
                html = html + "</p>";
            }
            if (mb.MemberType == "No" && (mb.AddFullTable == 0 && mb.AddHalfTable == 0) && (mb.AddFullAd > 0 || mb.AddHalfAd > 0))
            {
                html = html + "<p style=\"font-size: 12px;    line-height: 1.5em;    margin: 10px 0 0;\">";
                html = html + "You will receive an email from the Women’s Bond Club to collect your payment information. ";
                html = html + "</p>";
                html = html + "<p style=\"font-size: 12px;    line-height: 1.5em;    margin: 10px 0 0;\">";
                html = html + "With your commitment, you are entitled to an ad in the printed journal.    ";
                html = html + "</p>";
                html = html + "<p style=\"font-size: 12px; font-weight: bold;   line-height: 1.5em; text-decoration:underline;   margin: 10px 0 0;\">";
                html = html + "All logos and ads must be submitted by Friday, April 7.";
                html = html + "</p>";
                html = html + "<p style=\"font-size: 12px;font-weight: bold; line-height: 1.5em;    margin: 10px 0 0;\">";
                html = html + "The ad and logo specs are as follows:";
                html = html + "</p>";


                html = html + " <ul style=\"font-weight: bold;\"> ";
                html = html + "<li>Dimensions of the ad should be 7” W x 5” H</li>";
                html = html + "<li>All ads should be black & white/gray scale</li>";
                html = html + "<li>Accepted file formats are: Illustrator EPS (convert text to outline), High-resolution TIFFs (300 dpi or greater), or PDFs (X-1A).</li>";

                html = html + " </ul> ";
                html = html + "<p style=\"font-size: 13px;    line-height: 1.5em;    margin: 10px 0 0;\">";
                html = html + "Please email your ad and logo to wbc@sequence-events.com   ";
                html = html + "</p>";
            }
            html = html + "<p style=\"font-size: 13px;    line-height: 1.5em;    margin: 10px 0 0;\">";
            html = html + "Feel free to contact me if you have any questions. ";
            html = html + "</p>";
            html = html + "<p style=\"font-size: 13px;    line-height: 1.5em;    margin: 10px 0 0;\">";
            html = html + "Thanks and we look forward to seeing you in May!";
            html = html + "</p>";
            html = html + "<p style=\"font-size: 13px;    line-height: 1.5em;    margin: 10px 0 0;\">";
            html = html + "Jocelyn";
            html = html + "</p>";
            html = html + "<p style=\"font-size: 13px;    line-height: 1.5em;    margin: 10px 0 0;\">";
            html = html + "646-336-6800 EXT 110";
            html = html + "</p>";
            html = html + "</div></div></div></div></div></div></div>";
            html = html + "</body></html>";
            //System.Web.Mail.SmtpMail.SmtpServer = System.Configuration.ConfigurationSettings.AppSettings["smtpserver"];

            ContributorEmail = objMailMesg.To.ToString();
            firstname = objCheque.FirstName;
            lastname = objCheque.LastName;
            try
            {



                objMailMesg.Body = html;



                //Commented by Gopi to test on local
                smtpClient.Send(objMailMesg);
            }
            catch (Exception ex)
            {
            }


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
