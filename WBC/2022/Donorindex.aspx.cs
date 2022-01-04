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

public partial class Donorindex : SSLHelper
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
        if (isMob())
        {
            Response.Redirect("https://sohnconference.3mobb.com/");
        }
        form1.Action = Request.RawUrl;
        txtOtherAmount.Attributes.Add("onkeypress", "return numbersonly(this, event)");
    }
    private bool isMob(){
        bool ismobile = false;
        string[] mobiles={"midp", "j2me", "avant", "docomo", "novarra", "palmos", "palmsource", "240×320?", "opwv", "chtml", "pda", "windows/sce", "mmp/", "blackberry", "mib/", "symbian", "wireless", "nokia", "hand", "mobi", "phone", "cdm", "up.b", "audio", "SIE-", "SEC-", "samsung", "HTC", "mot-", "mitsu", "sagem", "sony", "alcatel", "lg", "eric", "vx", "NEC", "philips", "mmm", "xx", "panasonic", "sharp", "wap", "sch", "rover", "pocket", "benq", "java", "pt", "pg", "vox", "amoi", "bird", "compal", "kg", "voda", "sany", "kdd", "dbt", "sendo", "sgh", "gradi", "jb", "dddi", "moto", "iphone", "ipad", "ipod", "mini", "sce", "palm"};
        foreach(string mobi in mobiles){
            if(Request.UserAgent.ToLower().Contains(mobi.ToLower())){
                ismobile= true ;
                break;
            }

        }
        return ismobile;
    }
    
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string contlevel = "";
        double price = 0.0;
        //if (rdChampion.Checked)
        //{
        //    contlevel = " Champion $100,000";
        //    cost = 100000;
        //}
        //if (rdBenefactor.Checked)
        //{
        //    contlevel = "Benefactor $50,000";
        //    cost = 50000;
        //}
        //if (rdPatron.Checked)
        //{
        //    contlevel = "Patron  $25,000";
        //    cost = 25000;
        //}
        //if (rdSponser.Checked)
        //{
        //    contlevel = "Sponser $10,000";
        //    cost = 10000;
        //}
        //if (rdSupporter.Checked)
        //{
        //    contlevel = "Supporter $5,000";
        //    cost = 5000;
        //}
        if (txtOtherAmount.Value != "")
        {
            //String cos= txtOtherAmount.Value.ToString();
            //string strs = string.Format("{0.00:C}\n",cos);
             price = double.Parse(txtOtherAmount.Value);
            contlevel = " You entered the Amount as " + string.Format("{0:C}", price);
            //cost =  double.Parse(txtOtherAmount.Value.ToString());
        }
       
        Session["contlevel"] = contlevel;
        Session["cost"] = price.ToString();
        Response.Redirect("Donation-step2");
    }

}
