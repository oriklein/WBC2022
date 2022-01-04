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
using System.Web.Mail;
public partial class sohnPatner : SSLHelper
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
  
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    protected void lnkSubmit_Click(object sender, EventArgs e)
    {
        objUserServices.Sohn_Partner_Add(txtFirstName.Value, txtLastName.Value, txtOrganization.Value, txtTitle.Value, txtEmail.Value, txtPhone.Value, txtExt.Value);
        lblDr.InnerHtml = "Dear " + txtFirstName.Value+",";
        divReg.Visible = false;
        divSucc.Visible = true;

        string html = "<html><head></head>";


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
            html = html + "Dear "+txtFirstName.Value+",";
            html = html + "</p>";
            html = html + "<p style=\"font-size: 12px;    line-height: 1.5em;    margin: 10px 0 0;\">";
            html = html + "Thank you for becoming a Sohn Partner.";
            html = html + "</p>";
            html = html + "<p style=\"font-size: 12px;    line-height: 1.5em;    margin: 10px 0 0;\">";
            html = html + "Should you have any questions, please visit the conference website at <a href='http://www.sohnconference.com'>www.sohnconference.com</a> or contact us at <a href='mailto:info@sohnconference.org'>info@sohnconference.org</a>.<br /><br />";
        html = html + "Please print this confirmation page for your records</p>";
        html = html + "</div></div></div></div></div></div></div>";
        html = html + "</body></html>";
        MailMessage objMailMesg = new MailMessage();

        objMailMesg.BodyFormat = MailFormat.Html;
        objMailMesg.Subject = "Sohn Partner";
        objMailMesg.From = "confirmation@iscreg.com";


        objMailMesg.To = txtEmail.Value;
            
        try
        {
            System.Web.Mail.SmtpMail.SmtpServer = "mail.iscreg.com";
            //System.Web.Mail.SmtpMail.SmtpServer = "mail.clavib.com";
            objMailMesg.BodyFormat = MailFormat.Html;
            objMailMesg.Body = html;


            System.Web.Mail.SmtpMail.Send(objMailMesg);
        }
        catch (Exception ex)
        {
        }
    }

}
