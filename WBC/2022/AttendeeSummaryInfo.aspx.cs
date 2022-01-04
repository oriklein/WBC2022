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
public partial class AttendeeSummaryInfo : SSLHelper
{
    UserServices objUserServices = new UserServices();
    DataTable objDt;

    protected override void OnInit(EventArgs e)
    {

        //if (Request.IsSecureConnection)
        //{
        //    SslTools.SwitchToClearText();

        //}

    }
    Attende2014[] objAttende;
    double cost;
    double Admincost;
    string userInfo = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminOrder"] != null)
            if (Session["userid"] == null)
                Response.Redirect("Bo/Bo_Login.aspx");
            else
                divAdmin.Visible = true;
        else
            divAdmin.Visible = false;

        //decimal Damt = decimal.Parse(Session["cost"].ToString());
        objDt = objUserServices.Get_All_Charges();
        int ipcount = 0;
        int nipCount = 0;
        int nwCount = 0;
        int APCount = 0;
        int vrcount = 0;
        string str = "";
        objAttende = new Attende2014[int.Parse(Session["AttendeeCount"].ToString())];



        objAttende = (Attende2014[])Session["Attendees"];
        userInfo = "";
        int[] objAdminPrice;
        objAdminPrice = (int[])Session["AdminPrices"];


        for (int i = 0; i < int.Parse(Session["AttendeeCount"].ToString()); i++)
        {
            //userInfo += "<tr><td>";
            //userInfo += userInfo + objAttende[i].FirstName + " "+ objAttende[i].LastName        ;
            //userInfo += userInfo + "</td>";
            //userInfo += "<td>";
            string val;
            string attendeetype = "";
            if (objAttende[i].AttendeeType == "IP")
                attendeetype = "Member Individual Ticket  $750";
            else if (objAttende[i].AttendeeType == "NIP")

                attendeetype = "Non Member Individual Ticket  $1,100";
            else if (objAttende[i].AttendeeType == "Next Wave Sohn Only")
                attendeetype = "Next Wave Sohn Only";
                else
                    attendeetype = "Viewing Room";

            //val = "<tr><td width='100'>" + objAttende[i].FirstName + " " + objAttende[i].LastName + "</td>" + "<td width='150'>" + ((objAttende[i].AttendeeType == "Investment Professional") ? "Investment Professional" : "Non-Investment Professional") + "</td>";
            val = "<tr><td width='100'>" + objAttende[i].FirstName + " " + objAttende[i].LastName + "</td>" + "<td width='150'>" + attendeetype + "</td>";



            str = str + "<u>" + "Attendee&nbsp;&nbsp;#" + (i + 1).ToString() + "</u>" + "<br/>" + "" + "First Name :" + "" + "" + objAttende[i].FirstName + "" + "<br/>" + "" + "Last Name : " + "" + "&nbsp;" + "" + objAttende[i].LastName + "" + "<br/>" + "Organization : " + "" +
                objAttende[i].Organization + "<br/>" + "Ticket Type : " + "" + objAttende[i].AttendeeType + "<br/>";
           // str = str + "Attending the Next Wave Sohn : " + "" + objAttende[i].NextWave + "<br/>";
           // str = str + "Sohn Partner : " + "" + objAttende[i].SohnGeneralPartner + "<br/>";
            if (objAttende[i].Title.ToString() != "")
            {
                str = str + "Title : " + "" + objAttende[i].Title + "<br/>";
            }
            str = str + "Email : " + "" + objAttende[i].Email + "<br/>" + "Phone : " + "" + objAttende[i].Phone + "<br/>";
            if (objAttende[i].Ext.ToString() != "")
            {
                str = str + "Ext : " + "" + objAttende[i].Ext + "<br/>";
            }

         /*   str = str + "Address : " + "" + objAttende[i].Address.ToString() + "" + "<br/>";
            if (objAttende[i].OtherAddress.ToString() != "")
            {
                str = str + "Address2 :" + "" + objAttende[i].OtherAddress.ToString() + "" + "<br/>";
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
            //if (i == 0)
            //    str = str + "CockTail Reception: " + "" + objAttende[i].Cocktail + "" + "<br/>";
*/

            string val1 = "";
            if (objAttende[i].AttendeeType == "IP")
            {
                if (Session["AdminOrder"] != null)
                {
                    str = str + "Member Individual Ticket  $750:" + (double.Parse(objAdminPrice[i].ToString())).ToString("C") + "" + "<br/><br/>";
                    val1 = "<td>" + (double.Parse(objAdminPrice[i].ToString())).ToString("C") + "</td></tr>";
                    Admincost = Admincost + Convert.ToDouble(objAdminPrice[i]);
                }
                else
                {

                    if (ipcount == 0)
                    {
                        str = str + "Member Individual Ticket  $750:" + (double.Parse(objDt.Rows[0]["firstip"].ToString())).ToString("C") + "" + "<br/><br/>";

                        //    userInfo = ""+userInfo+ " $5.00</td></tr>";
                        //val = val + " $5.00</td></tr>";                            
                        objAttende[i].Price = objDt.Rows[0]["firstip"].ToString();
                        val1 = "<td>" + (double.Parse(objDt.Rows[0]["firstip"].ToString())).ToString("C") + "</td></tr>";
                    }
                    else
                    {
                        str = str + "Member Individual Ticket  $750:" + (double.Parse(objDt.Rows[0]["otherip"].ToString())).ToString("C") + "" + "<br/><br/>";
                        objAttende[i].Price = objDt.Rows[0]["otherip"].ToString();
                        //userInfo = "" + userInfo + " $2.50</td></tr>";
                        val1 = "<td>" + (double.Parse(objDt.Rows[0]["otherip"].ToString())).ToString("C") + "</td></tr>";
                    }
                    ipcount++;

                }
            }
            if (objAttende[i].AttendeeType == "Next Wave Sohn Only")
            {
                if (Session["AdminOrder"] != null)
                {
                    str = str + "Next Wave Sohn Only:" + (double.Parse(objAdminPrice[i].ToString())).ToString("C") + "" + "<br/><br/>";
                    val1 = "<td>" + (double.Parse(objAdminPrice[i].ToString())).ToString("C") + "</td></tr>";
                    Admincost = Admincost + Convert.ToDouble(objAdminPrice[i]);
                }
                else
                {

                    if (nwCount == 0)
                    {
                        str = str + "Next Wave Sohn Only:" + (double.Parse(objDt.Rows[0]["NextWave"].ToString())).ToString("C") + "" + "<br/><br/>";

                        //    userInfo = ""+userInfo+ " $5.00</td></tr>";
                        //val = val + " $5.00</td></tr>";                            
                        objAttende[i].Price = objDt.Rows[0]["NextWave"].ToString();
                        val1 = "<td>" + (double.Parse(objDt.Rows[0]["NextWave"].ToString())).ToString("C") + "</td></tr>";
                    }
                    else
                    {
                        str = str + "Next Wave Sohn Only:" + (double.Parse(objDt.Rows[0]["NextWave"].ToString())).ToString("C") + "" + "<br/><br/>";
                        objAttende[i].Price = objDt.Rows[0]["NextWave"].ToString();
                        //userInfo = "" + userInfo + " $2.50</td></tr>";
                        val1 = "<td>" + (double.Parse(objDt.Rows[0]["NextWave"].ToString())).ToString("C") + "</td></tr>";
                    }
                    nwCount++;

                }
            }
            if (objAttende[i].AttendeeType == "NIP")
            {
                if (Session["AdminOrder"] != null)
                {
                    str = str + "Non Member Individual Ticket  $1,100:" + (double.Parse(objAdminPrice[i].ToString())).ToString("C") + "" + "<br/><br/>";
                    val1 = "<td>" + (double.Parse(objAdminPrice[i].ToString())).ToString("C") + "</td></tr>";
                    Admincost = Admincost + Convert.ToDouble(objAdminPrice[i]);
                }
                else
                {

                    if (nipCount == 0)
                    {
                        str = str + "Non Member Individual Ticket  $1,100:" + (double.Parse(objDt.Rows[0]["firstnip"].ToString())).ToString("C") + "" + "<br/><br/>";
                        objAttende[i].Price = objDt.Rows[0]["firstnip"].ToString();
                        // userInfo = userInfo + " $4.00</td></tr>";
                        val1 = "<td>" + (double.Parse(objDt.Rows[0]["firstnip"].ToString())).ToString("C") + "</td></tr>";
                    }
                    else
                    {
                        str = str + "Non Member Individual Ticket  $1,100:" + (double.Parse(objDt.Rows[0]["othernip"].ToString())).ToString("C") + "" + "<br/><br/>";
                        objAttende[i].Price = objDt.Rows[0]["othernip"].ToString();
                        //userInfo = ""+ userInfo + " $2.00</td></tr>";
                        val1 = "<td>" + (double.Parse(objDt.Rows[0]["othernip"].ToString())).ToString("C") + "</td></tr>";
                    }
                    nipCount++;
                }
            }


            if (objAttende[i].AttendeeType == "Viewing Room")
            {
                if (Session["AdminOrder"] != null)
                {
                    str = str + " Viewing Room:" + (double.Parse(objAdminPrice[i].ToString())).ToString("C") + "" + "<br/><br/>";
                    val1 = "<td>" + (double.Parse(objAdminPrice[i].ToString())).ToString("C") + "</td></tr>";
                    Admincost = Admincost + Convert.ToDouble(objAdminPrice[i]);
                }
                else
                {

                    if (vrcount == 0)
                    {
                        str = str + "Viewing Room:" + (double.Parse(objDt.Rows[0]["firstvr"].ToString())).ToString("C") + "" + "<br/><br/>";
                        objAttende[i].Price = objDt.Rows[0]["firstvr"].ToString();
                        // userInfo = userInfo + " $4.00</td></tr>";
                        val1 = "<td>" + (double.Parse(objDt.Rows[0]["firstvr"].ToString())).ToString("C") + "</td></tr>";
                    }
                    else
                    {
                        str = str + "Viewing Room:" + (double.Parse(objDt.Rows[0]["othervr"].ToString())).ToString("C") + "" + "<br/><br/>";
                        objAttende[i].Price = objDt.Rows[0]["othervr"].ToString();
                        //userInfo = ""+ userInfo + " $2.00</td></tr>";
                        val1 = "<td>" + (double.Parse(objDt.Rows[0]["othervr"].ToString())).ToString("C") + "</td></tr>";
                    }
                    vrcount++;
                }
            }



            userInfo += val + val1;
            APCount++;
        }

        if (Session["AdminOrder"] != null)
        {
            cost = Admincost;
        }
        else
        {
            if (int.Parse(Session["IPCount"].ToString()) >= 2)
                cost = (int.Parse(Session["IPCount"].ToString()) - 1) * (double.Parse(objDt.Rows[0]["otherip"].ToString())) + (double.Parse(objDt.Rows[0]["firstip"].ToString()));
            else
            {
                if (int.Parse(Session["IPCount"].ToString()) == 1)
                    cost = (double.Parse(objDt.Rows[0]["firstip"].ToString()));
            }
        }

        if (Session["AdminOrder"] != null)
        {
            cost = Admincost;
        }
        else
            if (int.Parse(Session["NiPCount"].ToString()) >= 2)
                cost = cost + (int.Parse(Session["NiPCount"].ToString()) - 1) * (double.Parse(objDt.Rows[0]["othernip"].ToString())) + (double.Parse(objDt.Rows[0]["firstnip"].ToString()));
            else
            {
                if (int.Parse(Session["NiPCount"].ToString()) == 1)
                    cost = cost + (double.Parse(objDt.Rows[0]["firstnip"].ToString()));
            }
        if (Session["AdminOrder"] != null)
        {
            cost = Admincost;
        }
        else
            if (int.Parse(Session["nwCount"].ToString()) >=1)
            cost = cost + ((int.Parse(Session["nwCount"].ToString())  * (double.Parse(objDt.Rows[0]["nextwave"].ToString()))));




        //if (Session["AdminOrder"] != null)
        //{
        //    cost = Admincost;
        //}
        //else
        //    if (int.Parse(Session["vrCount"].ToString()) >= 2)
        //        cost = cost + (int.Parse(Session["vrCount"].ToString()) - 1) * (double.Parse(objDt.Rows[0]["othervr"].ToString())) + (double.Parse(objDt.Rows[0]["firstvr"].ToString()));
        //    else
        //    {
        //        if (int.Parse(Session["vrCount"].ToString()) == 1)
        //            cost = cost + (double.Parse(objDt.Rows[0]["firstvr"].ToString()));
        //    }

        //if (int.Parse(Session["IPCount"].ToString()) >= 2)
        //    cost = (int.Parse(Session["IPCount"].ToString()) - 1) * (double.Parse(objDt.Rows[0]["otherip"].ToString())) + (double.Parse(objDt.Rows[0]["firstip"].ToString()));
        //else if (int.Parse(Session["IPCount"].ToString()) == 1)
        //    cost = (double.Parse(objDt.Rows[0]["firstip"].ToString()));
        //else if (int.Parse(Session["NiPCount"].ToString()) >= 2)
        //    cost = cost + (int.Parse(Session["NiPCount"].ToString()) - 1) * (double.Parse(objDt.Rows[0]["othernip"].ToString())) + (double.Parse(objDt.Rows[0]["firstnip"].ToString()));
        //else if (int.Parse(Session["NiPCount"].ToString()) == 1)
        //    cost = cost + (double.Parse(objDt.Rows[0]["firstnip"].ToString()));

        //string  strs = string.Format("{0.00:C}\n", cost.ToString());
        string Mad = "";
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
        ////  userInfo =  "<table align='center'>"+ userInfo +  "</table>";
        dvAttendees.InnerHtml = str + "Total Registration&nbsp;&nbsp;" + cost.ToString("C");

        userInfo = "<table align='left'><tr><th colspan=3><!--Review Total--></th></tr><tr><th width='150'>Name</th><th width='250'>Ticket Type</th><th>Amount</th></tr>" + userInfo ;
        if (Session["extraPer"].ToString() != "0")
        {
            userInfo += "<tr><td width='150'>&nbsp;</td><td width='250'>" + Mad + "</td><td>" + extra.ToString("C") + "</td></tr>";
            userInfo += "<tr><td></td><td width='100'>Total Cost:</td><td>" + (cost+extra).ToString("C") + "</td></tr></table>";
        }
        else
        {
            userInfo += "<tr><td></td><td width='100'>Total Cost:</td><td>" + cost.ToString("C") + "</td></tr></table>";
        }

        //  userInfo = userInfo + "Total Cost: &nbsp;&nbsp;" + cost.ToString("C");
        //ViewState["cost"] = cost.ToString();
        if (Session["extraPer"].ToString() != "0")
            cost = cost + extra;
        Session["cost"] = cost.ToString();
        Session["userInfo"] = userInfo;
        dvUserInfo.InnerHtml = Session["userInfo"].ToString();
        Response.Redirect("AttendePayInfo.aspx");
    }


    protected void btnPay_Click(object sender, EventArgs e)
    {
        //Response.Redirect("registration-step2-professional");
        Response.Redirect("AttendePayInfo.aspx");
    }
    protected void btnEditAttendee_Click(object sender, EventArgs e)
    {
        Response.Redirect("updateAttendees.aspx");
    }
    protected void lnkLogOut_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.RemoveAll();
        Session["userid"] = "";
        Response.Redirect("Bo/Bo_Login.aspx");
    }

}
