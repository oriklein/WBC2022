
<%-- starting line below --%>
<%@ Page Language="C#"  Codefile="GenericError.aspx.cs" Inherits="clsGenericError" Title="Customer error page" %>
<% Response.WriteFile("inc.header2.aspx"); %>
<%-- include page specific header items --%>
<%-- include header end / body start until content --%>
<% Response.WriteFile("inc.header.body1.aspx"); %>
<%-- Change text below to refect the page the user is on will either be Attendee reservation --%>
17TH ANNUAL SOHN Investment Conference
<% Response.WriteFile("inc.header.body2.aspx"); %>
<%-- include actual code from page --%>

 <form id="Frm404error" runat="server">
<strong>Server Error</strong>
 							<p><strong>An error has occurred - our apologies!</strong></p>
 							 							<p><strong>Our technical team has already been contacted with the details of the error.</strong></p>
 						<asp:Label Id="LblMessage"  cssclass="content" runat="server"/>
 </form>

<%-- end page content --%>
<%-- Include Footer --%>
<% Response.WriteFile("inc.footer.aspx"); %>