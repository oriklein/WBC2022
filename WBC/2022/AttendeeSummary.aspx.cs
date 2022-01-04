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
public partial class AttendeeSummary : SSLHelper
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
            if (objAttende[i].AttendeeType == "Member Individual Ticket  $750")
                attendeetype = "Member Individual Ticket  $750";
            else if (objAttende[i].AttendeeType == "Non Member Individual Ticket  $1,100")
                attendeetype = "Non Member Individual Ticket  $1,100";
            else if (objAttende[i].AttendeeType == "Next Wave Sohn Only")
                attendeetype = "Next Wave Sohn Only";
                else
                    attendeetype = "Viewing Room";

            //val = "<tr><td width='100'>" + objAttende[i].FirstName + " " + objAttende[i].LastName + "</td>" + "<td width='150'>" + ((objAttende[i].AttendeeType == "Investment Professional") ? "Investment Professional" : "Non-Investment Professional") + "</td>";
            val = "<tr><td width='100'>" + objAttende[i].FirstName + " " + objAttende[i].LastName + "</td>" + "<td width='150'>" + attendeetype + "</td>";



            str = str + "<u>" + "Attendee&nbsp;&nbsp;#" + (i + 1).ToString() + "</u>" + "<br/>" + "" + "First Name :" + "" + "" + objAttende[i].FirstName + "" + "<br/>" + "" + "Last Name : " + "" + "&nbsp;" + "" + objAttende[i].LastName + "" + "<br/>" + "Organization : " + "" +
                objAttende[i].Organization + "</br>";

//Response.Write(objAttende[i].Cocktail + " : " + objAttende[i].NextWave + " : " + objAttende[i].SohnGeneralPartner);

                // + "<br/>" + "Attendee Type : " + "" + objAttende[i].AttendeeType + "<br/>";
            /*str = str + "Attending the Next Wave Sohn : " + "" + objAttende[i].NextWave + "<br/>";
            str = str + "Sohn Partner : " + "" + objAttende[i].SohnGeneralPartner + "<br/>";
            if (objAttende[i].Title.ToString() != "")
            {
                str = str + "Title : " + "" + objAttende[i].Title + "<br/>";
            }
            str = str + "Email : " + "" + objAttende[i].Email + "<br/>" + "Phone : " + "" + objAttende[i].Phone + "<br/>";
            if (objAttende[i].Ext.ToString() != "")
            {
                str = str + "Ext : " + "" + objAttende[i].Ext + "<br/>";
            }

            str = str + "Address : " + "" + objAttende[i].Address.ToString() + "" + "<br/>";
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
            if (i == 0)
                str = str + "CockTail Reception: " + "" + objAttende[i].Cocktail + "" + "<br/>";

            */
            string val1 = "";
            if (objAttende[i].AttendeeType == "Non Member Individual Ticket  $1,100")
            {
                if (Session["AdminOrder"] != null)
                {
                    str = str + "Non Member Individual Ticket  $1,100:" + (double.Parse(objAdminPrice[i].ToString())).ToString("C") + "" + "<br/><br/>";
                    val1 = "<td>" + (double.Parse(objAdminPrice[i].ToString())).ToString("C") + "</td></tr>";
                    Admincost = Admincost + Convert.ToDouble(objAdminPrice[i]);
                }
                else
                {

                    if (ipcount == 0)
                    {
                        str = str + "Non Member Individual Ticket  $1,100:" + (double.Parse(objDt.Rows[0]["firstip"].ToString())).ToString("C") + "" + "<br/><br/>";

                        //    userInfo = ""+userInfo+ " $5.00</td></tr>";
                        //val = val + " $5.00</td></tr>";                            
                        objAttende[i].Price = objDt.Rows[0]["firstip"].ToString();
                        val1 = "<td>" + (double.Parse(objDt.Rows[0]["firstip"].ToString())).ToString("C") + "</td></tr>";
                    }
                    else
                    {
                        str = str + "Non Member Individual Ticket  $1,100:" + (double.Parse(objDt.Rows[0]["otherip"].ToString())).ToString("C") + "" + "<br/><br/>";
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
            if (objAttende[i].AttendeeType == "Member Individual Ticket  $750")
            {
                if (Session["AdminOrder"] != null)
                {
                    str = str + "Member Individual Ticket  $750:" + (double.Parse(objAdminPrice[i].ToString())).ToString("C") + "" + "<br/><br/>";
                    val1 = "<td>" + (double.Parse(objAdminPrice[i].ToString())).ToString("C") + "</td></tr>";
                    Admincost = Admincost + Convert.ToDouble(objAdminPrice[i]);
                }
                else
                {

                    if (nipCount == 0)
                    {
                        str = str + "Member Individual Ticket  $750:" + (double.Parse(objDt.Rows[0]["firstnip"].ToString())).ToString("C") + "" + "<br/><br/>";
                        objAttende[i].Price = objDt.Rows[0]["firstnip"].ToString();
                        // userInfo = userInfo + " $4.00</td></tr>";
                        val1 = "<td>" + (double.Parse(objDt.Rows[0]["firstnip"].ToString())).ToString("C") + "</td></tr>";
                    }
                    else
                    {
                        str = str + "Member Individual Ticket  $750:" + (double.Parse(objDt.Rows[0]["othernip"].ToString())).ToString("C") + "" + "<br/><br/>";
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




            // New Fields

            /*
            str += "<div class='article article-box article-link'>";
            str += "<h1 class='large'>Become a Sohn Partner</h1>";
            if(i==0){
            str += "<p>The ideas shared at the Sohn Conference move the market every year...But the most important impact is that of those who have supported the work of the foundation, including speakers and attendees who donate some of their profits from money-making Sohn ideas back to the Sohn Foundation. Thousands of children have been helped and the science of pediatric cancer research, and cancer research in general, has been advanced thanks to the committed supporters of the Sohn Conference Foundation.</p>";
            str += "<p>This year, we’re challenging you to join and become a Sohn Partner: make a bigger impact by linking your Sohn gains to the move forward for the work of the Foundation. By clicking below you are making a non-binding pledge stating your intention to donate some percentage of your gains from the ideas shared at this year’s conference to the Sohn Conference Foundation, and thereby increase the impact of furthering pediatric cancer research.</p>";
            str += "<p>As thanks, partners will be acknowledged at the conference and you will get a special indicator to wear at the event expressing our appreciation for your support of childrens’ fight against pediatric cancer.</p>";
            }
            str += "            <select id='ddlPartner_"+i+"' name='ddlPartner_"+i+"' class='field field-select'>";

            if(objAttende[i].SohnGeneralPartner == null || objAttende[i].SohnGeneralPartner == "No" || objAttende[i].SohnGeneralPartner.Trim() == ""){
                str += "                <option value='Yes'>Yes</option>";
                str += "                <option selected='selected' value='No'>No</option>";
            }
            else{
                str += "                <option selected='selected' value='Yes'>Yes</option>";
                str += "                <option value='No'>No</option>";                
            }
            str += "            </select>";
            str += " <label for='ddlPartner_"+i+"'>" + objAttende[i].FirstName + " " + objAttende[i].LastName + " pledges to become a Sohn Partner</label>";
            str += "<br><br><h1 class='large'>Next Wave Sohn</h1>";
            if(i == 0){
            str += "<p>Next Wave Sohn brings the next generation of talent to the  Womens Bond Club 2015. Held during the morning hours just before the Sohn Investment Conference convenes, Next Wave Sohn offers an audience of 250 attendees a chance to hear up-and-comers share their best ideas.</p>";
            str += "<p>8:45 AM – Registration opens (at Avery Fischer Hall and Rubenstein Atrium)<br>";
            str += "9:30 AM – Program begins<br>";
            str += "11:15 AM – Program ends</p>";
            }
            str += "            <select id='ddlNextWave_"+i+"' name='ddlNextWave_"+i+"' class='field field-select'>";
            if(objAttende[i].NextWave == null || objAttende[i].NextWave == "No" || objAttende[i].NextWave.Trim() == ""){ 
               // str += "                <option value='Yes'>Yes</option>";
                if (objAttende[i].AttendeeType != "Next Wave Sohn Only"){
                    str += "                <option selected='selected' value='No'>No</option>";
                }
            }
            else{
                str += "                <option selected='selected' value='Yes'>Yes</option>";
                if (objAttende[i].AttendeeType != "Next Wave Sohn Only"){
                    str += "                <option value='No'>No</option>";
                }
                
            }
            str += "            </select>";
            str += " <label for='ddlNextWave_"+i+"'> [SOLD OUT] " + objAttende[i].FirstName + " " + objAttende[i].LastName + " will attend the Next Wave Sohn</label>";
            str += "<br><br><h1 class='large'>Cocktail Reception</h1>";
            //Response.Write("Cocktail" + objAttende[i].Cocktail);
            if(i == 0){
            str += "<p>A cocktail reception for conference attendees will follow the conclusion of the conference<br>5:30 p.m.</p>";
            }
            str += "            <select id='ddlCocktail_"+i+"' name='ddlCocktail_"+i+"' class='field field-select'>";
            if(objAttende[i].Cocktail == null || objAttende[i].Cocktail == "No" || objAttende[i].Cocktail.Trim() == ""){
                str += "                <option value='Yes'>Yes</option>";
                str += "                <option selected='selected' value='No'>No</option>";
            }else{
                str += "                <option selected='selected' value='Yes'>Yes</option>";
                str += "                <option value='No'>No</option>";                
            }
            str += "            </select>";
            str += " <label for='ddlCocktail_"+i+"'>" + objAttende[i].FirstName + " " + objAttende[i].LastName + " will attend the Cocktail Reception</label>";

            str += "</div>";
            */
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




       
        
        dvAttendees.InnerHtml = str; // + "Total Registration&nbsp;&nbsp;" + cost.ToString("C");

        userInfo = "<table align='center'><tr><th colspan=3><!--Review Total--></th></tr><tr><th width='150'>Name</th><th width='250'>Attendee Type</th><th>Amount</th></tr>" + userInfo + "<tr><td></td><td width='100'>Total Cost:</td><td>" + cost.ToString("C") + "</td></tr></table>";

        //  userInfo = userInfo + "Total Cost: &nbsp;&nbsp;" + cost.ToString("C");
        //ViewState["cost"] = cost.ToString();
        Session["cost"] = cost.ToString();
        Session["userInfo"] = userInfo;
        dvUserInfo.InnerHtml = Session["userInfo"].ToString();
        
    }


    protected void btnPay_Click(object sender, EventArgs e)
    {
        //Response.Redirect("registration-step2-professional");
        int nOfAt = int.Parse(Session["AttendeeCount"].ToString());
        Attende2014[] objAttende = new Attende2014[nOfAt];
        objAttende = (Attende2014[])Session["Attendees"];
        for (int i = 0; i < nOfAt; i++)
        {
            //objAttende[i].SohnGeneralPartner = Request["ddlPartner_" + i].ToString();
            //objAttende[i].NextWave = Request["ddlNextWave_" + i].ToString();
            //objAttende[i].Cocktail = Request["ddlCocktail_" + i].ToString();   
            //-------------------------Cocktail------------------------------------------------------

            objAttende[i].SohnGeneralPartner = "";
            objAttende[i].NextWave ="";
            objAttende[i].Cocktail ="";   
        }
        Response.Redirect("AttendeeSummaryInfo.aspx");
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
