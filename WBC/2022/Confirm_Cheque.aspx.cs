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
        if (Session["AttendiCheque"] != null && Session["cost"] != null)
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


            string BillInfo = "";
            Cheque objCheque = new Cheque();
            objCheque = (Cheque)Session["AttendiCheque"];
            int[] objAdminPrice;
            double Admincost = 0.0;
            objAdminPrice = (int[])Session["AdminPrices"];
            
            BillInfo = BillInfo + "First Name : " + objCheque.FirstName + "<br/>" +
            "Last Name : "  + objCheque.LastName + "<br/>" +
            "Comany Name :" + objCheque.company + "<br/>";
            if (objCheque.Title.ToString() != "")
            {
                BillInfo = BillInfo + "Tilte : " + objCheque.Title + "<br/>";
            }
            BillInfo = BillInfo + "Email : " + objCheque.Email + "<br/>" +
                "Phone : " + objCheque.Phone + "<br/>";

            if (objCheque.Ext.ToString() != "")
            {
                BillInfo = BillInfo + "Ext : " + objCheque.Ext + "<br/>";
            }
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
          
            string str = " ";
            int ipcount = 0;
            int nwcount = 0;
            int nipCount = 0;
            string userInfo = "";
            Attende2014[] objAttende = new Attende2014[int.Parse(Session["AttendeeCount"].ToString())];
            objAttende = (Attende2014[])Session["Attendees"];
            string val = "";
            double costAdmin = 0.0;
            for (int i = 0; i < int.Parse(Session["AttendeeCount"].ToString()); i++)
            {
                val = "<tr><td width='150'>" + objAttende[i].FirstName + " " + objAttende[i].LastName + "</td>" + "<td width='250'>" + ((objAttende[i].AttendeeType == "IP") ? "Ticket(s) $800 each" : "Nonprofite Rate Ticket(s) $400 each") + "</td></tr>";
                str = str + "<b>Attendee&nbsp;&nbsp;#" + (i + 1).ToString() + "</b><br/>" + "First Name : " + objAttende[i].FirstName + "" + "<br/>" + "Last Name : " +  objAttende[i].LastName + "" + "<br/>" + "Organization : " + "" +
                 objAttende[i].Organization + "" + "<br/>" + "Ticket Type : " + "" + ((objAttende[i].AttendeeType == "IP") ? "Ticket(s) $800 each" : "Nonprofite Rate Ticket(s) $400 each") + "" + "<br/>";
                //  str = str + "Attending the Next Wave Sohn : " + "" + objAttende[i].NextWave + "<br/>";
                //  str = str + "Sohn Partner : " + "" + objAttende[i].SohnGeneralPartner + "<br/>";
                if (objAttende[i].Title.ToString() != "")
                {
                    str = str + "Title : " + objAttende[i].Title + "<br/>";
                }
                str = str + "Email : " + objAttende[i].Email + "<br/>" + "Phone : " + "" + objAttende[i].Phone + "" + "<br/>";
                if (objAttende[i].Ext.ToString() != "")
                {
                    str = str + "Ext : " + objAttende[i].Ext + "<br/>";
                }

                /*    str = str + "Address 1: " + "" + objAttende[i].Address.ToString() + "" + "<br/>";
                    if (objAttende[i].OtherAddress.ToString() != "")
                    {
                        str = str + "Address 2 :" + "" + objAttende[i].OtherAddress.ToString() + "" + "<br/>";
                    }

                    if (objAttende[i].OtherCountry.ToString() != "")
                    {
                        str = str + "Country : " + "" + objAttende[i].OtherCountry.ToString() + "" + "<br/>";
                    }
                    else
                    {
                        str = str + "Country : " + "" + objAttende[i].country.ToString() + "" + "<br/>";
                    }
                    str = str + "City : " + "" + objAttende[i].city.ToString() + "" + "<br/>";
                    if (objAttende[i].OtherState.ToString() != "")
                    {
                        str = str + "State : " + "" + objAttende[i].OtherState.ToString() + "" + "<br/>";
                    }
                    else
                    {
                        str = str + "State : " + "" + objAttende[i].state.ToString() + "" + "<br/>";
                    }
                    str = str + "Zip : " + "" + objAttende[i].zip + "" + "<br/>";
                 * */
                //if (i == 0)
                //    str = str + "Attending Cocktail Hour : " + "" + objAttende[i].Cocktail + "" + "<br/>";
                //else
                //    str = str + "<br/>";

                objDt = objUserServices.Get_All_Charges();



                if (objAttende[i].AttendeeType == "IP")
                {
                    if (Session["AdminOrder"] != null)
                    {
                        str = str + "" + "Member Individual Ticket $750 : " + (double.Parse(objAdminPrice[i].ToString())).ToString("C") + "" + "<br/>";
                        userInfo = userInfo + (double.Parse(objAdminPrice[i].ToString())).ToString("C") + "<br/>";
                        Admincost = Admincost + Convert.ToDouble(objAdminPrice[i]);
                    }
                    else
                    {
                        if (ipcount == 0)
                        {
                            str = str + "" + "Member Individual Ticket $750 : " + (double.Parse(objDt.Rows[0]["firstip"].ToString())).ToString("C") + "" + "<br/>";
                            userInfo = userInfo + (double.Parse(objDt.Rows[0]["firstip"].ToString())).ToString("C") + "<br/>";
                        }
                        else
                        {
                            str = str + "" + "Member Individual Ticket $750: " + (double.Parse(objDt.Rows[0]["otherip"].ToString())).ToString("C") + "" + "<br/>";
                            userInfo = userInfo + (double.Parse(objDt.Rows[0]["otherip"].ToString())).ToString("C") + "<br/>";
                        }
                        ipcount++;
                    }
                }
                if (objAttende[i].AttendeeType == "Next Wave Sohn Only")
                {
                    if (Session["AdminOrder"] != null)
                    {
                        str = str + "" + "Next Wave Sohn Only: " + (double.Parse(objAdminPrice[i].ToString())).ToString("C") + "" + "<br/>";
                        userInfo = userInfo + (double.Parse(objAdminPrice[i].ToString())).ToString("C") + "<br/>";
                        Admincost = Admincost + Convert.ToDouble(objAdminPrice[i]);
                    }
                    else
                    {
                        if (nwcount == 0)
                        {
                            str = str + "" + "Next Wave Sohn Only: " + (double.Parse(objDt.Rows[0]["NextWave"].ToString())).ToString("C") + "" + "<br/>";
                            userInfo = userInfo + (double.Parse(objDt.Rows[0]["NextWave"].ToString())).ToString("C") + "<br/>";
                        }
                        else
                        {
                            str = str + "" + "Next Wave Sohn Only: " + (double.Parse(objDt.Rows[0]["NextWave"].ToString())).ToString("C") + "" + "<br/>";
                            userInfo = userInfo + (double.Parse(objDt.Rows[0]["NextWave"].ToString())).ToString("C") + "<br/>";
                        }
                        nwcount++;
                    }
                }
                if (objAttende[i].AttendeeType == "NIP")
                {
                    if (Session["AdminOrder"] != null)
                    {
                        str = str + "" + "Non Member Individual Ticket $1,100 : " + (double.Parse(objAdminPrice[i].ToString())).ToString("C") + "" + "<br/>";
                        userInfo = userInfo + (double.Parse(objAdminPrice[i].ToString())).ToString("C") + "<br/>";
                        Admincost = Admincost + Convert.ToDouble(objAdminPrice[i]);
                    }
                    else
                    {
                        if (nipCount == 0)
                        {
                            str = str + "" + "Non Member Individual Ticket $1,100 : " + (double.Parse(objDt.Rows[0]["firstnip"].ToString())).ToString("C") + "" + "<br/>";
                            userInfo = userInfo + (double.Parse(objDt.Rows[0]["firstnip"].ToString())).ToString("C") + "<br/>";
                        }
                        else
                        {
                            str = str + "" + "Non Member Individual Ticket $1,100 : " + (double.Parse(objDt.Rows[0]["othernip"].ToString())).ToString("C") + "" + "<br/>" + "<br/>";
                            userInfo = userInfo + (double.Parse(objDt.Rows[0]["othernip"].ToString())).ToString("C") + "<br/>";
                        }
                    }
                }


                if (objAttende[i].AttendeeType == "Viewing Room")
                {
                    if (Session["AdminOrder"] != null)
                    {
                        str = str + "" + "Viewing Room: " + (double.Parse(objAdminPrice[i].ToString())).ToString("C") + "" + "<br/><br/>";
                        userInfo = userInfo + (double.Parse(objAdminPrice[i].ToString())).ToString("C") + "<br/>";
                        Admincost = Admincost + Convert.ToDouble(objAdminPrice[i]);
                    }
                    else
                    {
                        if (nipCount == 0)
                        {
                            str = str + "" + "Viewing Room: " + (double.Parse(objDt.Rows[0]["firstvr"].ToString())).ToString("C") + "" + "<br/><br/>";
                            userInfo = userInfo + (double.Parse(objDt.Rows[0]["firstvr"].ToString())).ToString("C") + "<br/>";
                        }
                        else
                        {
                            str = str + "" + "Viewing Room: " + (double.Parse(objDt.Rows[0]["othervr"].ToString())).ToString("C") + "" + "<br/>" + "<br/>";
                            userInfo = userInfo + (double.Parse(objDt.Rows[0]["othervr"].ToString())).ToString("C") + "<br/>";
                        }
                    }
                }

                if (Session["AdminOrder"] != null)
                {
                    costAdmin = costAdmin + double.Parse(objAdminPrice[i].ToString());
                }

            }
            double cost = 0.0;
            if (int.Parse(Session["IPCount"].ToString()) >= 2)
                cost = (int.Parse(Session["IPCount"].ToString()) - 1) * (double.Parse(objDt.Rows[0]["otherip"].ToString())) + (double.Parse(objDt.Rows[0]["firstip"].ToString()));
            else
            {
                if (int.Parse(Session["IPCount"].ToString()) == 1)
                    cost = (double.Parse(objDt.Rows[0]["firstip"].ToString()));
            }
            if (int.Parse(Session["NiPCount"].ToString()) >= 2)
                cost = cost + (int.Parse(Session["NiPCount"].ToString()) - 1) * (double.Parse(objDt.Rows[0]["othernip"].ToString())) + (double.Parse(objDt.Rows[0]["firstnip"].ToString()));
            else
            {
                if (int.Parse(Session["NiPCount"].ToString()) == 1)
                    cost = cost + (double.Parse(objDt.Rows[0]["firstnip"].ToString()));
            }
           
            double extra = 0;
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
            if (Session["extraPer"].ToString() != "0")
                cost = cost + extra;
            //if (int.Parse(Session["vrCount"].ToString()) >= 2)
            //    cost = cost + (int.Parse(Session["vrCount"].ToString()) - 1) * (double.Parse(objDt.Rows[0]["othervr"].ToString())) + (double.Parse(objDt.Rows[0]["firstvr"].ToString()));
            //else
            //{
            //    if (int.Parse(Session["vrCount"].ToString()) == 1)
            //        cost = cost + (double.Parse(objDt.Rows[0]["firstvr"].ToString()));
            //}
            //if (Session["AdminOrder"] != null)
            //{
            //    cost = Admincost;
            //}
            //else
            if (int.Parse(Session["nwCount"].ToString()) >= 1)
                cost = cost + (int.Parse(Session["nwCount"].ToString()) * (double.Parse(objDt.Rows[0]["nextwave"].ToString())));

            //  lblStatus.Text = Session["userInfo"].ToString();

            objCheque = (Cheque)Session["AttendiCheque"];
            string creditCard =  "Name : " + objCheque.FirstName + " " + objCheque.LastName + "<br/>" +
                        "Have you participated before? : " + objCheque.Year + "<br/>" +
            "Company Name : " + objCheque.company + "<br/>";

            //if (objCheque.Title != null)
            //{
            //    creditCard = creditCard + "Title : " + objCheque.Title + "<br/>";
            //}

            creditCard = creditCard + "Email : " + objCheque.Email + "<br/>" +
                         "Phone : " + objCheque.Phone + "<br/>";

            if (objCheque.Ext.ToString() != "")
            {
                creditCard = creditCard + "Ext : " + objCheque.Ext.ToString() + "<br/>";
            }

            creditCard = creditCard + (objCheque.OtherAddress.ToString() != "" ? "Address :" + objCheque.Address + "  " + objCheque.OtherAddress + "<br/>" : "Address : " + objCheque.Address) + "<br/>" +
                             (objCheque.OtherCountry != null ? "Country : " + objCheque.OtherCountry + "<br/>" : "Country : " + objCheque.Country + "<br/>") +
                              (objCheque.OtherState != null ? "State : " + objCheque.OtherState + "<br/>" : "State : " + objCheque.State + "<br/>") +
                              "City : " + objCheque.City + "<br/>Zip : " + objCheque.Zip;// +"<br/>Individual or Organization responsible for the donation: " + objCheque.IndOrg + "";
            creditCard = creditCard + "<br/>Please state any dietary restrictions or<br /> physical impairments that we should be made aware of :<br /> " + objCheque.Aware;
            creditCard = creditCard + "WBC Contact : " + objCheque.WbcName + "<br/>";
           
            if (Session["AdminOrder"] != null)
            {
                cost = costAdmin;
            }
          
            string strs = "<table align='center'><tr><th colspan=3>Review Total</th></tr><tr><th width='150'>Name</th><th width='250'>Attendee Type</th><th width='150'>Amount</th></tr>" + val + "<tr><td></td><td width='150'>Total Cost:</td><td>" + cost.ToString("C") + "</td></tr></table>";


            string viewingroomtext = "";
            if (Session["viewingroomtext"] != null && Session["viewingroomtext"].ToString() != "" && Session["viewingroomtext"].ToString() == "Y")
            {
                //viewingroomtexttag.Visible = true;
                //vrbr1.Visible = true;
                //vrbr2.Visible = true;

                viewingroomtext = "<p align='left' style='font-weight:normal;'>" +
                       "<span style='font-size:15px;font-weight:normal;'>" +
                       " Please note that the Viewing Room is located in Jazz at Lincoln Center, with a live feed from theater. You will have complete access to the post-program cocktail reception." +
                       "    </span> </p><br />";
            }
            else
            {
                //viewingroomtexttag.Visible = false;
                //vrbr1.Visible = false;
                //vrbr2.Visible = false;
            }
            if (Session["extraPer"].ToString() != "0")
            {
               
                pEmail.Visible = false;
            }
            else
            {
                divAd.Visible = false;

            }
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
            if (Session["extraPer"].ToString() != "0")
            {
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
            }
            html = html + "<p style=\"font-size: 13px;    line-height: 1.5em;    margin: 10px 0 0;\">";
            html = html + "Feel free to contact me if you have any questions. ";
            html = html + "</p>";
            html = html + "<p style=\"font-size: 13px;    line-height: 1.5em;    margin: 10px 0 0;\">";
            html = html + "Thanks and we look forward to seeing you in April!";
            html = html + "</p>";
            html = html + "<p style=\"font-size: 13px;    line-height: 1.5em;    margin: 10px 0 0;\">";
            html = html + "Joy";
            html = html + "</p>";
            if (Session["extraPer"].ToString() == "0")
            {
                html = html + "<p style=\"font-size: 13px;    line-height: 1.5em;    margin: 10px 0 0;\">";
                html = html + "joy@sequence-events.com";
                html = html + "</p>";
            }
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
            if (Session["EmailCount"].ToString() == "1")
            {
                AttendeeEmail = objMailMesg.To.ToString();
                firstname = objCheque.FirstName;
                lastname = objCheque.LastName;
                objMailMesg.To.Add(objAttende[0].Email.ToString());
                //commmented by me towards new templates testing
               
                try
                {


                    objMailMesg.Body = html;
                    objUserServices.Update_SentDate(Convert.ToInt32(Session["payPersonID"]), DateTime.Now.ToString());

                    smtpClient.Send(objMailMesg);

                }
                catch (Exception ex)
                {
                }
            }
            else
                objUserServices.Update_SentDate(Convert.ToInt32(Session["payPersonID"]), "NOT SENT");
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
