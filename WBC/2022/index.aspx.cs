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

public partial class index_new : SSLHelper
{

    protected override void OnInit(EventArgs e)
    {

        //if (Request.IsSecureConnection)
        //{
        //    SslTools.SwitchToClearText();

        //}

    }
    protected void Page_Load(object sender, EventArgs e)
    {
       

        Session["title"] = "test";
        if (Request.QueryString["AdminOrder"] != null)
        {
            //string adminorder;
            //adminorder = Request.QueryString["AdminOrder"].ToString();
            if (Request.QueryString["AdminOrder"].ToString() == "YES")
            {
                Session["AdminOrder"] = "Yes";
              

            }
        }
        else
        {

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
