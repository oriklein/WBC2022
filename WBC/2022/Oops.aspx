<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Oops.aspx.cs" Inherits="Oops" %>

<% Response.WriteFile("inc.header2.aspx"); %>
<%-- include page specific header items --%>
<%-- include header end / body start until content --%>
<% Response.WriteFile("inc.header.body1.aspx"); %>
<% Response.WriteFile("inc.header.body2.aspx"); %>

<form id="form1" class="cform" name="forattendee" runat="server">
<div class="row row-field">
   <h1>Sorry an error has occured please try again</h1></div>

</form>
<%-- end page content --%>
<%-- Include Footer --%>
<% Response.WriteFile("inc.footer.aspx"); %>