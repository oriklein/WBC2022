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

public partial class index_new : SSLHelper
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
        this.form1.Action = Request.RawUrl;
     
        Session["title"] = "test";
        if (!Page.IsPostBack)
        {
            selContributor.Items.Add(new ListItem("Select", "0"));
            
            selContributor.Items.Add(new ListItem("DELUXE TICKET PACKAGE $2,250 Includes three tickets", "DELUXE"));
            selContributor.Items.Add(new ListItem("PREMIUM TICKET PACKAGE $1,500 Includes two tickets", "PREMIUM"));
        }
        if (Request.QueryString["AdminOrder"] != null)
        {
            //string adminorder;
            //adminorder = Request.QueryString["AdminOrder"].ToString();
            if (Request.QueryString["AdminOrder"].ToString() == "YES")
            {
                Session["AdminOrder"] = "Yes";
                divAdmin.Visible = true;
              
            }
        }
        else
        {
            
            divAdmin.Visible = false;
        }
        if (Request.QueryString["AdminOrder"] != null)
        {
            if (Request.QueryString["AdminOrder"].ToString() == "YES")
            {
                Session["AdminOrder"] = "Yes";
                selExtra.Disabled = true;
            }
        }
       
        if (Session["AdminOrder"] != null)
            if (Session["userid"] == null)
                Response.Redirect("http://www.sequence-events.com/EntepriseApp/BO/Bo_Login.aspx");
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
    protected void btnNext_Click(object sender, EventArgs e)
    {
        //Session["objAdminPrice"] = txtMoney.Value.Trim();
        Session["extraPer"] = selMad.Value;
        Response.Redirect("insertAttendees.aspx?count=" + ddlAttendeCount.Items[ddlAttendeCount.SelectedIndex].Text.ToString());
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
                return "FOREMAN’S FRIEND $50,000 Includes a prime table for ten guests";
            case "BUILDER":
                return "BUILDER’S CREW $30,000 Includes a prime table for ten guests";
            case "CARPENTER":
                return "CARPENTER’S CLUB $15,000 Includes a preferred table for ten guests";
            case "PAINTER":
                return "PAINTER’S CIRCLE $10,000 Includes a table for ten guests";
            case "DELUXE":
                return "DELUXE TICKET PACKAGE $2,250 Includes three tickets";
            case "PREMIUM":
                return "PREMIUM TICKET PACKAGE $1,500 Includes two tickets";
        }
        return "";
    }
}
