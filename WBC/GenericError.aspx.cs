 using System;
 using System.Data;
 using System.Configuration;
 using System.Collections;
 using System.Web;
 using System.Web.Security;
 using System.Web.UI;
 using System.Web.UI.WebControls;
 using System.Web.UI.WebControls.WebParts;
 using System.Web.UI.HtmlControls;
 using System.Text;
  using System.Web.Mail;

 public partial class clsGenericError: Page
 {

 	public void Page_Load(Object Sender,EventArgs E)
 	{

 		if(!IsPostBack)
 		{
 		//string strIpAddress;
			    //strIpAddress = System.Web.HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
			   // Response.Write("Kaipulla Question "+strIpAddress);
	    //Response.End();
	    //SendMails();
			}

 	}

 	private void SendMails()
  	{
  		try
  		{
    		string FromMailID = System.Configuration.ConfigurationSettings.AppSettings["CFNSAdminMailID"];
  			MailMessage ObjMailMessage = new MailMessage();
  			ObjMailMessage.BodyFormat = MailFormat.Html;
  			ObjMailMessage.From = FromMailID;
  			ObjMailMessage.Subject = "Generic - Error page";
  			//ObjMailMessage.To = "naveen@tychons.com;sambenedict@tychons.com";
  			ObjMailMessage.To = "Orik@locustsystems.com;reddy@locustsystems.com,jeff@spellmantravelpartners.com";
  			ObjMailMessage.Body = GetMailBody();
  			SmtpMail.SmtpServer = System.Configuration.ConfigurationSettings.AppSettings["SMTPServer"];
  			SmtpMail.Send(ObjMailMessage);

  		}
  		catch(Exception ex)
  		{
  			LblMessage.Text = "Error while sending mail :"+ex.ToString();
  		}
 	}
	public string GetMailBody()
 	{

 		StringBuilder TmpText = new StringBuilder();
 		TmpText.Append("<center>Mini Club Activity<br>") ;
 		TmpText.Append("<table width=\"550px\"  border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"content\">");
 		TmpText.Append("<tr>");
		TmpText.Append("  <td height=\"30\" colspan=\"2\" align=\"center\"><strong> Generic - Error page</strong></td>");
 		TmpText.Append("</tr>");
 		TmpText.Append("<tr>");
 		TmpText.Append("  <td height=\"30\" nowrap><strong> IP Address :</strong></td>");
 		TmpText.Append("  <td><strong>"+IpAddress()+"</strong></td>");
 		TmpText.Append("</tr>");
 		TmpText.Append("<tr>");
 		TmpText.Append("  <td height=\"30\" nowrap><strong> Browser :</strong></td>");
 		TmpText.Append("  <td><strong>"+strBrowserName()+"</strong></td>");
 		TmpText.Append("</tr>");
 		TmpText.Append("<tr>");
 		TmpText.Append("  <td height=\"30\" nowrap><strong>Error URL :</strong></td>");
 		TmpText.Append("  <td><strong>"+strUrl()+"</strong></td>");
 		TmpText.Append("</tr></table>");
 		return TmpText.ToString();
 	}

 	/*private string GetMailBody()
  	{
 		Exception objError = Server.GetLastError().GetBaseException();
   		StringBuilder TmpText = new StringBuilder();
  		TmpText.Append("<table width=\"750px\"  border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"content\">");
  		TmpText.Append("<tr>");
 		TmpText.Append("  <td height=\"30\" colspan=\"2\" align=\"center\"><strong><strong>Center for Nonprofit Success<strong></strong></td>");
  		TmpText.Append("</tr>");
 		TmpText.Append("<tr>");
 		TmpText.Append("  <td height=\"30\" colspan=\"2\" align=\"center\"><strong> Generic - Error page</strong></td>");
  		TmpText.Append("</tr>");
  		TmpText.Append("<tr>");
  		TmpText.Append("  <td height=\"30\" nowrap><strong>IP :</strong></td>");
  		TmpText.Append("  <td><strong>"+IpAddress()+"</strong></td>");
  		TmpText.Append("</tr>");
  		TmpText.Append("<tr>");
  		TmpText.Append("  <td height=\"30\" nowrap><strong>Browser :</strong></td>");
  		TmpText.Append("  <td><strong>"+strBrowserName()+"</strong></td>");
  		TmpText.Append("</tr>");
  		TmpText.Append("<tr>");
  		TmpText.Append("  <td height=\"30\" nowrap><strong>Source :</strong></td>");
  		TmpText.Append("  <td><br><strong>"+objError.Source.ToString()+"</strong></td>");
  		TmpText.Append("</tr>");
  		TmpText.Append("<tr>");
  		TmpText.Append("  <td height=\"30\" nowrap><strong>Message :</strong></td>");
  		TmpText.Append("  <td><br><strong>"+objError.Message.ToString()+"</strong></td>");
  		TmpText.Append("</tr>");
  		TmpText.Append("<tr>");
  		TmpText.Append("  <td height=\"30\" nowrap><strong>Stack Trace :</strong></td>");
  		TmpText.Append("  <td><br><strong>"+objError.StackTrace.ToString()+"</strong></td>");
  		TmpText.Append("</tr>");
  		TmpText.Append("<tr>");
  		TmpText.Append("  <td height=\"30\" nowrap><strong>Error URL :</strong></td>");
  		TmpText.Append("  <td><br><strong>"+strUrl()+"</strong></td>");
  		TmpText.Append("</tr></table>");
  		Server.ClearError();
  		return TmpText.ToString();
 	}*/
   	private string IpAddress()
	{
	    string strIpAddress;
	    strIpAddress = System.Web.HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
	   // Response.Write("Kaipulla Question "+strIpAddress);
	   // Response.End();
	    if (strIpAddress == null)
	    {
	       strIpAddress = System.Web.HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
	    }
	    return strIpAddress;
	}

	private string strUrl()
	{
		string strUrlName;
		strUrlName =Request.Url.ToString();
		if(strUrlName == null)
		{
			strUrlName =  Request.Url.ToString();
		}
		 return strUrlName;
 	 }

 	private string strBrowserName()
	{
		string strBrowserName;
		strBrowserName = Request.Browser.Browser.ToString();
		if(strBrowserName == null)
		{
			strBrowserName =Request.Browser.Browser.ToString();
		}
		 return strBrowserName;
 	 }
 }