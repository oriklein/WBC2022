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
using System.Net.Mail;

public partial class ContriPayInfo : SSLHelper
{
    protected override void OnInit(EventArgs e)
    {

     

    }
    protected void Page_Load(object sender, EventArgs e)
    {

       
    }
    
    

    protected void ContributorInfo_Insert(object sender, EventArgs e)
    {string country="";
        string state="";
        if (ddlCountry2.Value == "Other")
                country= txtCountry2.Value;
            else
               country= ddlCountry2.Value;
                  
            if (ddlCountry2.Value == "Other")
                state= ddlState3.Value ;
            else
                state= ddlState3.Value ;
            int OutId = 0;
        UserServices obj = new UserServices();
       int MadID= obj.MadAd_Insert(ref OutId, txtFirstName2.Value, txtLastName2.Value, txtOrg.Value, txtEmail2.Value, txtPhone2.Value, txtAddress2.Value, txtAddress22.Value, country, state, txtCity2.Value, txtZip2.Value,SelMad.Value);
       Session["Confirm"] = MadID.ToString();
       Cheque2014 objCheque = new Cheque2014();
       objCheque.WbcName = SelMad.Value;
       objCheque.FirstName = txtFirstName2.Value;
       objCheque.LastName = txtLastName2.Value;
       objCheque.IndOrg = txtOrg.Value;
       objCheque.Email = txtEmail2.Value;
       objCheque.Phone = txtPhone2.Value;
       objCheque.Address = txtAddress2.Value;
       objCheque.OtherAddress = txtAddress22.Value;
       if (ddlCountry2.Value == "Other"){
       objCheque.Country = txtCountry2.Value;
       objCheque.State = dvtextState3.Value;
      
       }
       else {
           objCheque.Country = ddlCountry2.Value;
           objCheque.State = ddlState3.Value;
       }
       objCheque.City = txtCity2.Value;
       objCheque.Zip = txtZip2.Value;


       Session["AttendiCheque"] = objCheque;
            //MailMessage objMailMesg = new MailMessage();

            //objMailMesg.IsBodyHtml = true;
            //objMailMesg.Subject = "Ad Request WBC";
            //SmtpClient smtpClient = new SmtpClient("maila45.webcontrolcenter.com", 25);

            //smtpClient.Credentials = new System.Net.NetworkCredential("wbc@sequence-events.com", "5kJH1WaH&aj$0");
            //smtpClient.UseDefaultCredentials = true;
            //smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
            //smtpClient.EnableSsl = true;
            //objMailMesg.To.Add("gsvasu25@gmail.com");
            //objMailMesg.From = new MailAddress(System.Configuration.ConfigurationManager.AppSettings["CFNSAdminMailID"]);
            //objMailMesg.Body = BillInfo;
       

            //smtpClient.Send(objMailMesg);
            Response.Redirect("confirm_ad.aspx");


    }

   

}
