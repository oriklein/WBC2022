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
public partial class Confirm_Code : System.Web.UI.Page
{
    UserServices objUserServices = new UserServices();
    DataTable objDt;
    string html = "";
    string firstname = "";
    string lastname = "";
    string AttendeeEmail = "";
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
            "Last Name : " + "&nbsp;" + objCheque.LastName + "<br/>" +
            "Comany Name : &nbsp;" + objCheque.company + "<br/>";
            if (objCheque.Title.ToString() != "")
            {
                BillInfo = BillInfo + "Tilte : &nbsp;" + objCheque.Title + "<br/>";
            }
            BillInfo = BillInfo + "Email :" + objCheque.Email + "<br/>" +
                "Phone : " + objCheque.Phone + "<br/>";

            if (objCheque.Ext.ToString() != "")
            {
                BillInfo = BillInfo + "Ext : " + objCheque.Ext + "<br/>";
            }
            BillInfo = BillInfo + "Address :" + objCheque.Address + "<br/>";
            if (objCheque.OtherAddress.ToString() != "")
            {
                BillInfo = BillInfo + "Address2 : " + objCheque.OtherAddress + "<br/>";
            }
            BillInfo = BillInfo + "Country :" + objCheque.Country + "<br/>" +
                "City :" + objCheque.City + "<br/>" +
                "State : " + objCheque.State + "<br/>" +
                "Zip : " + objCheque.Zip + "<br/><br/>" +
                "Individual or Organization responsible for the donations:" + objCheque.IndOrg + "<br/>";



            lblConfirm.Text = Session["Confirm"].ToString();
            lblPromoCode.Text = Session["PromoCode"].ToString();
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
                val = "<tr><td width='150'>" + objAttende[i].FirstName + " " + objAttende[i].LastName + "</td>" + "<td width='250'>" + ((objAttende[i].AttendeeType == "Investment Professional") ? "Investment Professional" : "Non-Investment Professional") + "</td></tr>";
                str = str + "<br/>" + "Attendee&nbsp;&nbsp;#" + (i + 1).ToString() + "<br/>" + "First Name : " + objAttende[i].FirstName + "" + "<br/>" + "Last Name : " + "&nbsp;" + objAttende[i].LastName + "" + "<br/>" + "Organization : " + "" +
                 objAttende[i].Organization + "" + "<br/>" + "Attendee Type : " + "" + objAttende[i].AttendeeType + "" + "<br/>";
                str = str + "Attending the Next Wave Sohn : " + "" + objAttende[i].NextWave + "<br/>";
                str = str + "Sohn Partner : " + "" + objAttende[i].SohnGeneralPartner + "<br/>";
                if (objAttende[i].Title.ToString() != "")
                {
                    str = str + "Title : " + objAttende[i].Title + "<br/>";
                }
                str = str + "Email : " + objAttende[i].Email + "<br/>" + "Phone : " + "" + objAttende[i].Phone + "" + "<br/>";
                if (objAttende[i].Ext.ToString() != "")
                {
                    str = str + "Ext : " + objAttende[i].Ext + "<br/>";
                }

                str = str + "Address 1: " + "" + objAttende[i].Address.ToString() + "" + "<br/>";
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
                if (i == 0)
                    str = str + "Attending Cocktail Hour : " + "" + objAttende[i].Cocktail + "" + "<br/>";
                else
                    str = str + "<br/>";

                objDt = objUserServices.Get_All_Charges();



                if (objAttende[i].AttendeeType == "Investment Professional")
                {
                    if (Session["AdminOrder"] != null)
                    {
                        str = str + "" + "Investment Professional <br>"; //: " + (double.Parse(objAdminPrice[i].ToString())).ToString("C") + "" + "<br/>";
                        //userInfo = userInfo + (double.Parse(objAdminPrice[i].ToString())).ToString("C") + "<br/>";
                        Admincost = Admincost + Convert.ToDouble(objAdminPrice[i]);
                    }
                    else
                    {
                        if (ipcount == 0)
                        {
                            str = str + "" + "Investment Professional<br>";// + (double.Parse(objDt.Rows[0]["firstip"].ToString())).ToString("C") + "" + "<br/>";
                            userInfo = userInfo + (double.Parse(objDt.Rows[0]["firstip"].ToString())).ToString("C") + "<br/>";
                        }
                        else
                        {
                            str = str + "" + "Investment Professional<br>";// + (double.Parse(objDt.Rows[0]["otherip"].ToString())).ToString("C") + "" + "<br/>";
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
                            str = str + "" + "Next Wave Sohn Only<br>";// + (double.Parse(objDt.Rows[0]["NextWave"].ToString())).ToString("C") + "" + "<br/>";
                            //userInfo = userInfo + (double.Parse(objDt.Rows[0]["NextWave"].ToString())).ToString("C") + "<br/>";
                        }
                        else
                        {
                            str = str + "" + "Next Wave Sohn Only<br>";// + (double.Parse(objDt.Rows[0]["NextWave"].ToString())).ToString("C") + "" + "<br/>";
                            //userInfo = userInfo + (double.Parse(objDt.Rows[0]["NextWave"].ToString())).ToString("C") + "<br/>";
                        }
                        nwcount++;
                    }
                }
                if (objAttende[i].AttendeeType == "Non-Investment Professional")
                {
                    if (Session["AdminOrder"] != null)
                    {
                        str = str + "" + "Non-Investment Professional<br>"; // + (double.Parse(objAdminPrice[i].ToString())).ToString("C") + "" + "<br/>";
                        //userInfo = userInfo + (double.Parse(objAdminPrice[i].ToString())).ToString("C") + "<br/>";
                        Admincost = Admincost + Convert.ToDouble(objAdminPrice[i]);
                    }
                    else
                    {
                        if (nipCount == 0)
                        {
                            str = str + "" + "Non-Investment Professional<br>"; // + (double.Parse(objDt.Rows[0]["firstnip"].ToString())).ToString("C") + "" + "<br/>";
                            userInfo = userInfo + (double.Parse(objDt.Rows[0]["firstnip"].ToString())).ToString("C") + "<br/>";
                        }
                        else
                        {
                            str = str + "" + "Non-Investment Professional<br>"; // + (double.Parse(objDt.Rows[0]["othernip"].ToString())).ToString("C") + "" + "<br/>" + "<br/>";
                            userInfo = userInfo + (double.Parse(objDt.Rows[0]["othernip"].ToString())).ToString("C") + "<br/>";
                        }
                    }
                }


                if (objAttende[i].AttendeeType == "Viewing Room")
                {
                    if (Session["AdminOrder"] != null)
                    {
                        str = str + "" + "Viewing Room<br>";// + (double.Parse(objAdminPrice[i].ToString())).ToString("C") + "" + "<br/><br/>";
                        userInfo = userInfo + (double.Parse(objAdminPrice[i].ToString())).ToString("C") + "<br/>";
                        Admincost = Admincost + Convert.ToDouble(objAdminPrice[i]);
                    }
                    else
                    {
                        if (nipCount == 0)
                        {
                            str = str + "" + "Viewing Room<br>";// + (double.Parse(objDt.Rows[0]["firstvr"].ToString())).ToString("C") + "" + "<br/><br/>";
                            userInfo = userInfo + (double.Parse(objDt.Rows[0]["firstvr"].ToString())).ToString("C") + "<br/>";
                        }
                        else
                        {
                            str = str + "" + "Viewing Room<br>";// + (double.Parse(objDt.Rows[0]["othervr"].ToString())).ToString("C") + "" + "<br/>" + "<br/>";
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
            /* No need to calculate cost...
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
*/
            //  lblStatus.Text = Session["userInfo"].ToString();

            objCheque = (Cheque)Session["AttendiCheque"];
            string creditCard = "Name: " + objCheque.FirstName + " " + objCheque.LastName + "<br/>" +
                        "Company Name: " + objCheque.company + "<br/>";

            if (objCheque.Title != null)
            {
                creditCard = creditCard + "Title : " + objCheque.Title + "<br/>";
            }

            creditCard = creditCard + "Email: " + objCheque.Email + "<br/>" +
                         "Phone: " + objCheque.Phone + "<br/>";

            if (objCheque.Ext.ToString() != "")
            {
                creditCard = creditCard + "Ext : " + objCheque.Ext.ToString() + "<br/>";
            }

            creditCard = creditCard + (objCheque.OtherAddress.ToString() != "" ? "Address :" + objCheque.Address + "  " + objCheque.OtherAddress + "<br/>" : "Address :" + objCheque.Address) + "<br/>" +
                             (objCheque.OtherCountry != null ? "Country: " + objCheque.OtherCountry + "<br/>" : "Country: " + objCheque.Country + "<br/>") +
                              (objCheque.OtherState != null ? "State: " + objCheque.OtherState + "<br/>" : "State: " + objCheque.State + "<br/>") +
                              "City: " + objCheque.City + "<br/>Zip: " + objCheque.Zip + "<br/>Individual or Organization responsible for the donation: " + objCheque.IndOrg + "";

            lblAttendees.Text = str;// + "</p><h2>Payment Details</h2> <p class=\"large\">" + creditCard;
            if (Session["AdminOrder"] != null)
            {
                cost = costAdmin;
            }
            lblDue.Text = "$0";
            string strs = "<table align='center'><tr><th colspan=3>Review Total</th></tr><tr><th width='150'>Name</th><th width='250'>Attendee Type</th><th width='150'>Amount</th></tr>" + val + "<tr><td></td><td width='150'>Total Cost:</td><td>" + cost.ToString("C") + "</td></tr></table>";

            //  lblStatus.Text = Session["userInfo"].ToString();
            //lblPayment.Text = BillInfo;

            // Cheque objCheque = new Cheque();
            //objCheque = (Cheque)Session["AttendiCheque"];

            //BillInfo = BillInfo + "First Name : " + objCheque.FirstName + "<br/>Last Name : " + "&nbsp;" + objCheque.LastName + "" + "<br/>" + "Organization : &nbsp;" +
            //    objCheque.company + "<br/>Email : " + objCheque.Email +
            //    "<br/>Phone : " + objCheque.Phone + "<br/>Ext : " + objCheque.Ext + "<br/>Address : " + objCheque.Address + "<br/>Country : " +
            //    objCheque.Country + "<br/>City : " +
            //    objCheque.City + "<br/> State : " + objCheque.State + "<br/>Zip : " + objCheque.Zip + "<br/>";
            // lblStatus.Text = str + "<br/>" + BillInfo + "<br/><br/>" + Session["userInfo"].ToString(); 

            ////if (Session["Confirm"] != null)
            ////    lblConfirm.Text = Session["Confirm"].ToString();
            //commented on 15March,2009.
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
            StringBuilder sb = new StringBuilder();
            pchkPayment.RenderControl(new HtmlTextWriter(new StringWriter(sb)));
            html = "<html><head></head>";


            html = html + "<body style=\"background: none repeat scroll 0 0 #FFFFFF;color: #666666;font-family: Arial,Helvetica,sans-serif;font-size: 11px;height: 100%;margin: 0;padding: 0;position: relative;text-align: center;\">";
            html = html + "<div style=\"text-align: center;-moz-box-sizing: border-box; margin: 0 auto;  max-width: 960px; overflow: hidden; position: relative;width: 100%;\">";
            html = html + "<img src=\"https://reg.sohnconference.com/ny2014/asset/img-header-logo.png\" ></imag>";
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
            html = html + "Thank you for Registering for the 2014 Investment Conference";
            html = html + "</p>";
            html = html + "<p style=\"font-size: 12px;    line-height: 1.5em;    margin: 10px 0 0;\">";
            html = html + "Please print this confirmation page for your records.";
            html = html + "</p>";
            html = html + "<h2 style=\" color: #333333;    font-size: 12px;    line-height: 1.5em;    margin: 20px 0 0;    text-transform: uppercase;\">";
            html = html + "Confirmation Number: " + Session["Confirm"].ToString();
            html = html + "</h2>";
            html = html + "<h2 style=\" color: #333333;    font-size: 12px;    line-height: 1.5em;    margin: 20px 0 0;    text-transform: uppercase;\">";
            html = html + "CONTRIBUTOR CODE: " + Session["PromoCode"].ToString();
            html = html + "</h2>";            //html = html + "<h2 style=\" color: #333333;    font-size: 12px;    line-height: 1.5em;    margin: 20px 0 0;    text-transform: uppercase;\">";
            //html = html + "Total Due: $0";
            //html = html + "</h2>";
            html = html + "<h2 style=\" color: #333333;    font-size: 12px;    line-height: 1.5em;    margin: 20px 0 0;    text-transform: uppercase;\">";
            html = html + "Event Details";
            html = html + "</h2>";
            html = html + "<p style=\"font-size: 12px;    line-height: 1.5em;    margin: 10px 0 0;\">";
            html = html + "Monday, May 5, 2014<br /><br />Next Wave<br />Registration: 8:45 AM<br />Program Begins: 9:30 AM<br /><br />Main Sohn Conference<br />  Registration: 11:00 AM<br /> Conference 12:00 PM - 6:00 PM<br />";
            html = html + "Reception to Follow<br /><br /> Avery Fisher Hall at Lincoln Center<br />132 W. 65th Street (on the corner of Columbus Avenue)<br />New York, NY 10023";
            html = html + "</p>";
            html = html + "<h2 style=\" color: #333333;    font-size: 12px;    line-height: 1.5em;    margin: 20px 0 0;    text-transform: uppercase;\">";
            html = html + "Registration Details";
            html = html + "</h2>";
            html = html + "<p style=\"font-size: 12px;    line-height: 1.5em;    margin: 10px 0 0;\">";
            html = html + str;
            html = html + "</p>";
            /*
            html = html + "<h2 style=\" color: #333333;    font-size: 12px;    line-height: 1.5em;    margin: 20px 0 0;    text-transform: uppercase;\">";
            html = html + "Payment Details";
            html = html + "</h2>";
            html = html + "<p style=\"font-size: 12px;    line-height: 1.5em;    margin: 10px 0 0;\">";
            html = html + creditCard;
            html = html + "</p>";
            */
            /*
            html = html + "<h2 style=\" color: #333333;    font-size: 12px;    line-height: 1.5em;    margin: 20px 0 0;    text-transform: uppercase;\">";
            html = html + "Check Payment Detail";
            html = html + "</h2>";
            html = html + "<p style=\"font-size: 12px;    line-height: 1.5em;    margin: 10px 0 0;\">";
            html = html + sb.ToString();
            html = html + "</p>";*/
            html = html + "</div></div></div></div></div></div></div>";
            html = html + "</body></html>";

            MailMessage objMailMesg = new MailMessage();

            objMailMesg.BodyFormat = MailFormat.Html;
            objMailMesg.Subject = "2014 Sohn Conference Foundation Confirmation";
            objMailMesg.From = System.Configuration.ConfigurationManager.AppSettings["CFNSAdminMailID"];
            objMailMesg.Bcc = System.Configuration.ConfigurationSettings.AppSettings["CFNSAdminBCCMailID"];
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

                        objMailMesg.To += arr[k] + ",";

                    }


                    //for (int i = 0; i<(int.Parse(Session["AttendeeCount"].ToString())) && (unique[i] != ""); i++)
                    //{
                    //    objMailMesg.To += unique[i] + ",";
                    //}
                }

            //System.Web.Mail.SmtpMail.SmtpServer = System.Configuration.ConfigurationSettings.AppSettings["smtpserver"];
            AttendeeEmail = objMailMesg.To.ToString();
            firstname = objCheque.FirstName;
            lastname = objCheque.LastName;
            //commmented by me towards new templates testing
            try
            {
                System.Web.Mail.SmtpMail.SmtpServer = System.Configuration.ConfigurationManager.AppSettings["SMTPServer"];
               
                objMailMesg.BodyFormat = MailFormat.Html;
                objMailMesg.Body = html;

              System.Web.Mail.SmtpMail.Send(objMailMesg);
            }
            catch (Exception ex)
            {
            }
            Session.Remove("AttendiCheque");
            Session.Remove("cost");
            Session.Remove("viewingroomtext");



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
