using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using ISCRegDAL;

public partial class MWF_ContributorIndex : SSLHelper
{
    UserServices objUserServices = new UserServices();
    DataTable objDt;
    protected string admin;
    protected override void OnInit(EventArgs e)
    {

        //if (Request.IsSecureConnection)
        //{
        //    SslTools.SwitchToClearText();

        //}

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["AdminOrder"] != null)
        {
            if (Request.QueryString["AdminOrder"].ToString() == "YES")
            {
                Session["AdminOrder"] = "Yes";
                selExtra.Disabled = true;
            }
        }
        form1.Action = Request.RawUrl;
        if (Session["AdminOrder"] != null)
            if (Session["userid"] == null)
                Response.Redirect("http://www.sequence-events.com/wbc/BO/Bo_Login.aspx");
            else
            {
                divAdmin.Visible = true;
                selExtra.Disabled = true;
            }
        else
        {
            divAdmin.Visible = false;
            selExtra.Disabled = false;
        }

        // txtOtherAmount.Attributes.Add("onkeypress","return numbersonly(this, event)");
        
        if (!Page.IsPostBack)
        {
            selContributor.Items.Add(new ListItem("Select", "0"));
            selContributor.Items.Add(new ListItem("Member Table $9,500 ( 10 tickets )", "FOREMAN"));
            selContributor.Items.Add(new ListItem("Non-Member Table $10,500 ( 10 tickets )", "BUILDER"));
            selContributor.Items.Add(new ListItem("Corporate  Member  Firms  1⁄2  Table   $5,800   ( 5 tickets )", "CARPENTER"));
            selContributor.Items.Add(new ListItem("Non Member  Firms  1⁄2  Table    $6,400 ( 5 tickets )", "PAINTER"));
            //selContributor.Items.Add(new ListItem("DELUXE TICKET PACKAGE $2,250 Includes three tickets", "DELUXE"));
            //selContributor.Items.Add(new ListItem("PREMIUM TICKET PACKAGE $1,500 Includes two tickets", "PREMIUM"));
          }
        

        if (Session["AdminOrder"] != null)
        {
           
           divAdminPrice.Visible = true;
           divNoTickets.Visible = true;
          

            admin = "yes";
        }
        else
        {
           
            divNoTickets.Visible = false;
            divAdminPrice.Visible = false;
            admin = "no";

        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        objDt = objUserServices.Get_Enteprise_Charges(selContributor.Value.Trim());
        string contlevel = "";
        double cost = 0.0;
        Session["extraPer"] = 0;
        contlevel = "You Selected " + getSelectType(selContributor.Value);
        cost = double.Parse(objDt.Rows[0]["price"].ToString());
        Session["level"] = selContributor.Value;
        Session["extraPer"] = selMad.Value;
        

        if (Session["AdminOrder"] != null)
        {
            contlevel = "You Selected " + getSelectType(selContributor.Value);
            cost = int.Parse(txtAdminPrice.Value.ToString());
            //Session["level"] = "Admin";
            Session["AdminAttendees"] = Convert.ToString(txtAdminTicktets.Value);
        }

        Session["contlevel"] = contlevel;
        Session["cost"] = cost.ToString();
        Response.Redirect("registration-step2-contributor");
    }
    protected void lnkLogOut_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.RemoveAll();
        Session["userid"] = "";
        Response.Redirect("Bo/Bo_Login.aspx");
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
}
