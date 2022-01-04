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
public partial class Confirmation_CC : System.Web.UI.Page
{
    UserServices objUserServices = new UserServices();
    DataTable objDt;
    string html = "";
    string firstname = "";
    string lastname = "";
    string AttendeeEmail = "";
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

            lblConfirm.Text = Session["Confirm"].ToString();
            string str = "Attendees Information<br/><br/>";

            string userInfo = "";

            Attende2014[] objAttende = new Attende2014[int.Parse(Session["AttendeeCount"].ToString())];
            objAttende = (Attende2014[])Session["Attendees"];
            // string val = "";
            for (int i = 0; i < int.Parse(Session["AttendeeCount"].ToString()); i++)
            {
                userInfo = userInfo + objAttende[i].FirstName + objAttende[i].LastName;

                str = str + "Attendee&nbsp;&nbsp;#" + (i + 1).ToString() + "<br/>" + "First Name : " + objAttende[i].FirstName + "<br/>Last Name : " + "&nbsp;" + objAttende[i].LastName + "<br/>" + "Organization : " +
                       objAttende[i].Organization + "<br/>" + "Attendee Type : " + objAttende[i].AttendeeType + "<br/>";
               // str = str + "Attending the Next Wave Sohn : " + "" + objAttende[i].NextWave + "<br/>";
                //str = str + "Sohn Partner : " + "" + objAttende[i].SohnGeneralPartner + "<br/>";
                if (objAttende[i].Title.ToString() != "")
                {
                    str = str + "Title : " + objAttende[i].Title + "<br/>";
                }
                str = str + "Email :" + objAttende[i].Email + "<br/>" + "Phone :" + objAttende[i].Phone + "<br/>";
                if (objAttende[i].Ext.ToString() != "")
                {
                    str = str + "Ext : " + objAttende[i].Ext + "<br/>";
                }

              /*  str = str + "Address : " + objAttende[i].Address.ToString() + "<br/>";
                if (objAttende[i].OtherAddress.ToString() != "")
                {
                    str = str + "Address2 :" + objAttende[i].OtherAddress.ToString() + "<br/>";
                }

                if (objAttende[i].OtherCountry.ToString() != "")
                {
                    str = str + "Country :" + objAttende[i].OtherCountry.ToString() + "<br/>";
                }
                else
                {
                    str = str + "Country :" + objAttende[i].country.ToString() + "<br/>";
                }
                str = str + "City : " + objAttende[i].city.ToString() + "<br/>";
                if (objAttende[i].OtherState.ToString() != "")
                {
                    str = str + "State : " + objAttende[i].OtherState.ToString() + "<br/>";
                }
                else
                {
                    str = str + "State : " + objAttende[i].state.ToString() + "<br/>";
                }
                str = str + "Zip : " + objAttende[i].zip + "<br/>";
               * */
                //if (i == 0)
                //    str = str + "Attending Cocktail Hour : " + objAttende[i].Cocktail + "<br/><br/>";
                //else
                //    str = str + "<br/><br/>";
            }
            double cost = 0.0;
            objDt = objUserServices.Get_All_Charges();
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

            if (int.Parse(Session["nwCount"].ToString()) >= 1)
                cost = cost + (int.Parse(Session["nwCount"].ToString()) * (double.Parse(objDt.Rows[0]["nextwave"].ToString())));
            //  lblUserInfo.Text = val;
            // lblStatus.Text = Session["userInfo"].ToString();

            CreditCard2014 objCredit = (CreditCard2014)Session["CreditCard"];
            string creditCard = "Name:" + objCredit.FirstName + " " + objCredit.LastName + "<br/>" +
                        "Company Name: " + objCredit.CompanyName + "<br/>" +
                        "Email: " + objCredit.Email + "<br/> " +
                        "Phone: " + objCredit.Phone + "<br/>";

            if (objCredit.Ext.ToString() != "")
            {
                creditCard = creditCard + "Ext: " + objCredit.Ext + "<br/>";
            }

            creditCard = creditCard + "Credit Card Number : ............" + objCredit.CreditCardNumber.Substring(objCredit.CreditCardNumber.Length - 4, 4) + "<br/>" +
                        "CardType : " + objCredit.CreditCardType.ToString() + "<br/>" +
                        "Expiration Date :" + objCredit.ExpiryMonth + "/" + objCredit.Expirydate + "<br/>" +
                       (objCredit.OtherAddress != null ? "Address :" + objCredit.Address + " " + objCredit.OtherAddress : "Address :" + objCredit.Address) + "<br/>" +
                         "Transaction Id: " + Session["tid"].ToString() + "<br/>" +
                         (objCredit.OtherCountry != null ? "Country: " + objCredit.OtherCountry + "<br/>" : "Country: " + objCredit.Country + "<br/>") +
                         (objCredit.OtherState != null ? "State: " + objCredit.OtherState + "<br/>" : "State: " + objCredit.State + "<br/>") +
                         "City: " + objCredit.City + "<br/>" + "Zip: " + objCredit.Zip + "<br/>" + "Individual or Organization responsible for the donation: " + objCredit.DonationIndOrg + "</p>";
            lblAmmount.Text = objCredit.cost.ToString("C");
            lblAttendees.Text = str + "</p><h2>Payment Details</h2> <p class=\"large\">" + creditCard;
            if (Session["res"] != null)
            {
                //lblStatus.Text = Session["res"].ToString() + "<br/><br/>" + str;
                //lblPayment.Text = Session["res"].ToString(); 


                MailMessage objMailMesg = new MailMessage();

                objMailMesg.BodyFormat = MailFormat.Html;

                objMailMesg.Subject = "Womens Bond Club 2015 Confirmation";
                objMailMesg.From = System.Configuration.ConfigurationManager.AppSettings["CFNSAdminMailID"];
                objMailMesg.Bcc = System.Configuration.ConfigurationSettings.AppSettings["CFNSAdminBCCMailID"];
                //objMailMesg.From = "confirmation@irasohnsanfrancisco.com";

                //int iEmail;
                //iEmail = int.Parse(Session["EmailSettings"].ToString());
                if (Session["EmailCount"].ToString() != "0" && Session["EmailCount"].ToString() != "All")
                    objMailMesg.To = Session["EmailCount"].ToString();
                else
                    if (Session["EmailCount"].ToString() == "0")
                    {
                        objMailMesg.To = objAttende[0].Email.ToString();
                    }
                    else
                    {
                        string[] email = new string[int.Parse(Session["AttendeeCount"].ToString())];


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
                            objMailMesg.To += arr[k] + ",";
                        }
                    }
                //string htmls = " <div style='padding:15px;'><div class='bld15Black'> Thank you for registering for the<br />" +
                //    "2009 Sohn Research Conference FOUNDATION</div><br /><div class='bld15Black'>Wednesday, May 27, 2009<br />" +
                //    "Registration 2:30 PM<br />Conference 3:00 – 6:00 PM<br />Reception to follow<br /></div>" +
                //    "<div class='bld15Black'>Rose Theater, 5th floor<br />Frederick P. Rose Hall<br />Home of Jazz at Lincoln Center<br />" +
                //    "Broadway at 60th Street<br />New York City</div></div><div class='bld14Black'>" +
                //    "<span style='color:#b56006;'>Your registration details are as follows:</span><br /><br />" +
                //    "<span class='Treb14Bold'>" + str + "</span><br /><br /><span style='color:#b56006;'>You confirmation number for this order is:</span><br /><br />" +
                //    "<span class='Treb14Bold'>" + Session["Confirm"].ToString() + "</span><br /></div><div style='padding:15px;'><div class='bld15Black'>A tax deduction receipt will be sent to you immediately following the<br />" +
                //    "conference.</div><div class='bld15Black'>Should you have any questions, please visit the conference website at<br />www.sohnconference.com or contact us at info@irasohnconference.com<br /> or 212 677 3173 ext 233." +
                //    "</div>";

                AttendeeEmail = objMailMesg.To.ToString();
                //AttendeeEmail = "gopi@locustsystems.com";
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


             
                html = "<html><head></head>";
                html = html + "<body style=\"background: none repeat scroll 0 0 #FFFFFF;color: #666666;font-family: Arial,Helvetica,sans-serif;font-size: 11px;height: 100%;margin: 0;padding: 0;position: relative;text-align: center;\">";
                html = html + "<div style=\"text-align: center;-moz-box-sizing: border-box; margin: 0 auto;  max-width: 960px; overflow: hidden; position: relative;width: 100%;\">";
                html = html + "<img src=\"http://sequence-events.com/wbc/2015/asset/img-header-logo.png​\" ></imag>";
                html = html + "</div>";                    //  html = html + "</tr> <tr><td>" + sb.ToString() + "</td></tr></table></body></html>";
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
                html = html + "Total Ammount: " + objCredit.cost.ToString("C");
                html = html + "</h2>";
                html = html + "<h2 style=\" color: #333333;    font-size: 12px;    line-height: 1.5em;    margin: 20px 0 0;    text-transform: uppercase;\">";
                html = html + "Event Details";
                html = html + "</h2>";
                html = html + "<p style=\"font-size: 12px;    line-height: 1.5em;    margin: 10px 0 0;\">";
                html = html + "11/12/14<br />Pier Sixty at Chelsea Piers<br /><br />Pier 60<br />23rd Street and West Side Highway<br />New York, NY, 10011<br /><br />Cocktails at 6 P.M.<br />Dinner at 7 P.M.<br />Festive Attire<br />";
                html = html + "</p>";
                html = html + "<h2 style=\" color: #333333;    font-size: 12px;    line-height: 1.5em;    margin: 20px 0 0;    text-transform: uppercase;\">";
                html = html + "Registration Details";
                html = html + "</h2>";
                html = html + "<p style=\"font-size: 12px;    line-height: 1.5em;    margin: 10px 0 0;\">";
                html = html + str;
                html = html + "</p>";
                html = html + "<h2 style=\" color: #333333;    font-size: 12px;    line-height: 1.5em;    margin: 20px 0 0;    text-transform: uppercase;\">";
                html = html + "Payment Details";
                html = html + "</h2>";
                html = html + "<p style=\"font-size: 12px;    line-height: 1.5em;    margin: 10px 0 0;\">";
                html = html + creditCard;
                html = html + "</p>";
                
                html = html + "</div></div></div></div></div></div></div>";
                html = html + "</body></html>";


                //System.Web.Mail.SmtpMail.SmtpServer = System.Configuration.ConfigurationSettings.AppSettings["smtpserver"];
                firstname = objCredit.FirstName;
                lastname = objCredit.LastName;
                try
                {
                    System.Web.Mail.SmtpMail.SmtpServer = System.Configuration.ConfigurationManager.AppSettings["SMTPServer"];
                    
                    objMailMesg.BodyFormat = MailFormat.Html;
                    objMailMesg.Body = html;

                    //commented by Gopi to test on local
                    System.Web.Mail.SmtpMail.Send(objMailMesg);
                }
                catch (Exception ex)
                {
                }
                Session.Remove("CreditCard");
                Session.Remove("cost");
                Session.Remove("viewingroomtext");
            }
        }
        else
        {
            Response.Redirect("Oops.htm");
        }

    }
    protected void paymentView_ActiveViewChanged(object sender, EventArgs e)
    {

    }
    protected void lnkLogOut_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.RemoveAll();
        Session["userid"] = "";
        Response.Redirect("Bo/Bo_Login.aspx");
    }

}
