using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Web.Mail;
/// <summary>
/// Summary description for BaseFunctions
/// </summary>
public class BaseFunctions
{
    public BaseFunctions()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public void sendAdminEmail(string subject,string To,string From,string body)
    {
        MailMessage objMailMesg = new MailMessage();

        objMailMesg.Subject = subject; //"Attendee Order was Deleted";
        objMailMesg.From = From;
        objMailMesg.To = To;
        System.Web.Mail.SmtpMail.SmtpServer = System.Configuration.ConfigurationManager.AppSettings["SMTPServer"];
        objMailMesg.BodyFormat = MailFormat.Html;
        objMailMesg.Body = body;
        System.Web.Mail.SmtpMail.Send(objMailMesg);
    }

}
