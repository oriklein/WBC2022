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
    WBCUserServices objUserServices = new WBCUserServices();
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
       // Response.Redirect("index.aspx");
        //if (Request.QueryString["AdminOrder"] != null)
        //{
        //    if (Request.QueryString["AdminOrder"].ToString() == "YES")
        //    {
        //        Session["AdminOrder"] = "Yes";

        //    }
        //}
        form1.Action = Request.RawUrl;
        //if (Session["AdminOrder"] != null)
        //    if (Session["userid"] == null)
        //        Response.Redirect("http://www.sequence-events.com/wbc/BO/Bo_Login.aspx");
        //    else
        //    {
        //        divAdmin.Visible = true;
               
        //    }
        //else
        {
            divAdmin.Visible = false;
          
        }

        // txtOtherAmount.Attributes.Add("onkeypress","return numbersonly(this, event)");
        
        
        

        //if (Session["AdminOrder"] != null)
        //{
           
        //   divAdminPrice.Visible = true;
        //   divNoTickets.Visible = true;
          

        //    admin = "yes";
        //}
        //else
        {
           
            divNoTickets.Visible = false;
            divAdminPrice.Visible = false;
            admin = "no";

        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Memebrs mb = new Memebrs();
        mb.AddFullTable = selFullTable.SelectedIndex;
        mb.AddHalfTable = selHalfTable.SelectedIndex;
        mb.AddTickets = SelTickets.SelectedIndex;
        mb.AddFullAd = selFullAd.SelectedIndex;
        mb.AddHalfAd = selHalfAd.SelectedIndex;
        mb.MemberType = "Yes";

        Session["contlevel"] =mb;

        Response.Redirect("ContriPayInfo.aspx");
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
                return "Member Table $15,000 ( 10 tickets )";
            case "BUILDER":
                return "Non-Member Table $12,000 ( 10 tickets )";
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
