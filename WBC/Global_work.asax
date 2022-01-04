<%@ Application %>
<%@ Import Namespace="System.Web.Mail" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Text" %>
<script Language="C#" runat="server">


protected void Application_Error(Object sender, EventArgs e)
{
    //SendMails();
    //Response.Redirect("https://reg.sohnconference.com/ny2014/oops.aspx");
}
protected void Application_BeginRequest(object sender, EventArgs e)
{

   // //if (!(Request.Url.AbsoluteUri.ToLower().Contains("www")))
   //// {
   // //    Response.Redirect(Request.Url.AbsoluteUri.Replace("http://", "http://www."));
   //// }
   // if (Request.Url.ToString().ToLower().Contains("sohnconference.org/mdonate"))
   // {

   //     Response.Redirect("https://reg.sohnconference.com/ny2014/Donation-step1");
   // }
   // if (Request.Url.ToString().ToLower().Contains("sohnconference.com/mdonate"))
   // {

   //     Response.Redirect("https://reg.sohnconference.com/ny2014/Donation-step1");
   // }
   // if (Request.Url.ToString().ToLower().Contains("ny2014/bo"))
   // {

   //     Response.Redirect(Request.Url.ToString().ToLower().Replace("ny2014/",""));
   // }
   // if (Request.Url.ToString().ToLower().Contains("http://reg.sohnconference.com/word/contest/") || Request.Url.ToString().ToLower().Contains("http://reg.sohnconference.com/word/contest"))
   // {

   //     Response.Redirect("http://www.sohnconference.org/contest/");
   // }
   // if (Request.Url.ToString().ToLower().Contains("reg.sohnconference.com/default.aspx"))
   // {
       
   //     Response.Redirect("http://www.sohnconference.org/word");
   // }
   // if (Request.RawUrl.ToLower().Contains("ny2014/donorindex.aspx"))
   // {
   //     //HttpContext.Current.Response.Write(Request.RawUrl.ToLower());
   //     Response.Redirect("https://reg.sohnconference.com/ny2014/Donation-step1");
   // }
   // if (Request.RawUrl.ToLower().Contains("ny2014/index.aspx") || Request.RawUrl.ToLower().Contains("/ny2014/index.aspx"))
   // {
   //    // HttpContext.Current.Response.Write(Request.RawUrl.ToLower());
   //     Response.Redirect("https://reg.sohnconference.com/ny2014/registration-step1-professional");
   // }
   // if (Request.RawUrl.ToLower().Contains("ny2014/contributorindex.aspx"))
   // {
   //    // HttpContext.Current.Response.Write(Request.RawUrl.ToLower());
   //     Response.Redirect("https://reg.sohnconference.com/ny2014/registration-step1-contributor");
   // }
   // if(Request.Url.ToString().ToLower().Equals("http://www.reg.sohnconference.com"))
   //     {
   //         Response.Redirect("http://www.sohnconference.org");
   //     }
   // if(Request.Url.ToString().ToLower().Equals("http://www.reg.sohnconference.com/"))
   //     {
   //         Response.Redirect("http://www.sohnconference.org");
   //     }
} 


private void SendMails()
{
    //try
    //{
	string FromMailID = System.Configuration.ConfigurationSettings.AppSettings["FAFromMailID"];
		MailMessage ObjMailMessage = new MailMessage();
		ObjMailMessage.BodyFormat = MailFormat.Html;
        ObjMailMessage.From = System.Configuration.ConfigurationManager.AppSettings["CFNSAdminMailID"];
		ObjMailMessage.Subject = "FA Generic - Error page ";
        ObjMailMessage.To = "sree@locustsystems.com;orik@locustsystems.com";//System.Configuration.ConfigurationSettings.AppSettings["FAErrorMailID"];
		//ObjMailMessage.To = "Ori@locustsystems.com;mkoonani@locustsystems.com";
		ObjMailMessage.Body = GetMailBody();
        SmtpMail.SmtpServer = System.Configuration.ConfigurationManager.AppSettings["SMTPServer"];
        var ex = HttpContext.Current.Server.GetLastError();

        
        var httpException = ex as HttpException;
        if (httpException != null && httpException.GetHttpCode() != 404)        
		SmtpMail.Send(ObjMailMessage);

    //}
    //catch(Exception ex)
    //{
    //    //LblMessage.Text = "Error while sending mail :"+ex.ToString();
    //}
}

public string GetMailBody()
{

	StringBuilder TmpText = new StringBuilder();
	TmpText.Append("<table width=\"880px\"  border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style='font-family: arial, helvetica, serif;font-size: 14px;'>");
	TmpText.Append("<tr>");
	TmpText.Append("  <td height=\"30\" colspan=\"3\" align=\"left\"><strong> Flooring America Generic - Error page</strong></td>");
	TmpText.Append("</tr>");
	TmpText.Append("<tr>");
	TmpText.Append("  <td height=\"30\" width='100' nowrap> IP Address </td><td width='12'><b>:</b></td>");
	TmpText.Append("  <td width='768'> "+IpAddress()+"</td>");
	TmpText.Append("</tr>");
	TmpText.Append("<tr>");
	TmpText.Append("  <td height=\"30\" nowrap> Browser </td><td><b>:</b></td>");
	TmpText.Append("  <td>"+strBrowserName()+"</td>");
	TmpText.Append("</tr>");
	TmpText.Append("<tr>");
	TmpText.Append("  <td height=\"30\" nowrap>Error URL </td><td><b>:</b></td>");
	TmpText.Append("  <td> "+Request.Url.ToString()+"</td></tr>");
	
	Exception myError =Server.GetLastError(); 

	TmpText.Append("<tr valign='top'>");
	TmpText.Append("  <td style='padding-top:10px' height=\"30\" nowrap>Error Message </td><td style='padding-top:10px'><b>:</b></td>");
	TmpText.Append("  <td style='padding-top:10px'>"+myError.Message+"</td></tr>");
    TmpText.Append("<tr valign='top'>");
    TmpText.Append("  <td style='padding-top:10px' height=\"30\" nowrap>Stack Trace </td><td style='padding-top:10px'><b>:</b></td>");
    TmpText.Append("  <td style='padding-top:10px'>" + myError.StackTrace.ToString() + "</td></tr>");
    TmpText.Append("<tr valign='top'>");
    TmpText.Append("  <td style='padding-top:10px' height=\"30\" nowrap>Source Code </td><td style='padding-top:10px'><b>:</b></td>");
    TmpText.Append("  <td style='padding-top:10px'>" + myError.Source + "</td></tr>");
    TmpText.Append("<tr valign='top'>");
    TmpText.Append("  <td style='padding-top:10px' height=\"30\" nowrap>inner Exception </td><td style='padding-top:10px'><b>:</b></td>");
    TmpText.Append("  <td style='padding-top:10px'>" + myError.InnerException + "</td></tr>");
    TmpText.Append("<tr valign='top'>");
    TmpText.Append("  <td style='padding-top:10px' height=\"30\" nowrap>Target Site </td><td style='padding-top:10px'><b>:</b></td>");
    TmpText.Append("  <td style='padding-top:10px'>" + myError.TargetSite + "</td></tr>");		
	TmpText.Append("<tr><td height=\"30\" colspan=\"3\" align=\"left\"> </td></tr>");
	TmpText.Append("<tr><td colspan=\"3\" align=\"left\"> Tech Team,</td></tr>");
	TmpText.Append("<tr><td colspan=\"3\" align=\"left\"> <a href='http://www.flooringamericacruise.com'>www.flooringamericacruise.com</a></td></tr>");
	TmpText.Append("</table>");
	return TmpText.ToString();
}

private string IpAddress()
{
    string strIpAddress;
    strIpAddress = System.Web.HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

    if (strIpAddress == null)
    {
       strIpAddress = System.Web.HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
    }
    return strIpAddress;
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


</script>