using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Net.Mail;

public partial class NY2014_TestMail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SmtpClient smtpClient = new SmtpClient("maila45.webcontrolcenter.com", 25);

        smtpClient.Credentials = new System.Net.NetworkCredential("enterprise@sequence-events.com", "enter1310@");
        smtpClient.UseDefaultCredentials = true;
        smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
        smtpClient.EnableSsl = true;
        MailMessage mail = new MailMessage();
        mail.Subject = "test";
        mail.Body = "test";
        //Setting From , To and CC
        mail.From = new MailAddress("enterprise@sequence-events.com", "tewsy");
        mail.To.Add(new MailAddress("sree@locustsystems.com"));
      
        smtpClient.Send(mail);


    }
}