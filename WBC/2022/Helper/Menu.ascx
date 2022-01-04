<%@ Control Language="C#" debug="true"%>
<%@ import Namespace="System" %>
<script runat="server">
	public string navID = "";
	public string sectionID = "";
	private string contactSwap, contactSwapBack, BaseURL,URL;
	public bool IsSSL = false;
	void Page_Load(Object Src, EventArgs E)
	{
		switch (navID)

		{
			case "home":
				contactSwap = "home_head_05-over.jpg";
				contactSwapBack = "home_head_05.jpg";
				break;

			case "research1":
				contactSwap = "research_head_05-over.jpg";
				contactSwapBack = "research_head_05.jpg";
				break;

			case "research":
				contactSwap = "research_head_05b-over.jpg";
				contactSwapBack = "case_studies_head_05.jpg";
				break;

			case "education":
				contactSwap = "education_head_05-over.jpg";
				contactSwapBack = "education_head_05.jpg";
				break;

			case "reservation":
				contactSwap = "reservation_head_05-over.jpg";
				contactSwapBack = "reservation_head_05.jpg";
				break;

			case "mentoring1":
				contactSwap = "mentor_head_05-over.jpg";
				contactSwapBack = "mentor_head_05.jpg";
				break;

			case "mentoring2":
				contactSwap = "mentor_head_05b-over.jpg";
				contactSwapBack = "questions_head_05.jpg";
				break;

			case "mentoring":
				contactSwap = "mentor_head_05b-over.jpg";
				contactSwapBack = "questions_head_05.jpg";
				break;

			case "consulting":
				contactSwap = "consulting_head_05-over.jpg";
				contactSwapBack = "consulting_head_05.jpg";
				break;
case "consultingScholar":
				contactSwap = "consulting_head_05-over_new.jpg";
				contactSwapBack = "consulting_head_05_new.jpg";
				break;
			case "about":
				contactSwap = "about_head_05-over.jpg";
				contactSwapBack = "about_head_05.jpg";
				break;

			case "contact":
				contactSwap = "contact_head_05-over.jpg";
				contactSwapBack = "contact_head_05.jpg";
				break;
			default:
				contactSwap = "home_head_05-over.jpg";
				contactSwapBack = "home_head_05.jpg";
				break;

		}
		//Response.Write(Request.RawUrl);
		//Response.Write(Request.Path);
		if(IsSSL)  BaseURL = "";
		else BaseURL = System.Configuration.ConfigurationSettings.AppSettings["CFNSNormalURL"];
		try
		{

			if(Request.ServerVariables["Server_port"].ToString()=="443")
			{
				if((Request.Path)!="/cfnps/OrderSummary.aspx" && (Request.Path)!="/cfnps/SeminarCCStatus.aspx" && (Request.Path)!="/cfnps/Summit_Registration.aspx" && (Request.Path)!="/cfnps/SeminarCCStatus.aspx" && (Request.Path)!="/cfnps/research_study_order_form.aspx" && (Request.Path)!="/cfnps/Research_SOrderForm_Registeration.aspx" )
				{

					URL=Request.RawUrl.ToString().Replace("/cfnps/","");
					Response.Redirect(BaseURL+URL);
				}
			}
		}
		catch(Exception ex)
		{
		}

	}
</script>

<table id="nav" width="538" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<%if (navID != "home") {%>
		<td>
			<a href="<%=BaseURL%>default.aspx"
				onmouseover="changeImages('nav_home', 'images/nav_home-over.gif'); return true;"
				onmouseout="changeImages('nav_home', 'images/nav_home.gif'); return true;">
				<img name="nav_home" src="images/nav_home.gif" width="68" height="61" border="0" alt="Home"></a></td><% } else {%>
		<td width="68" height="61">
			<a href="<%=BaseURL%>default.aspx"><img src="images/nav_home-over.gif" alt="Home" border="0" width="68" height="61"></a></td>
		<% } %>

		<%if (sectionID == "home") { %>
		<%if (navID != "research1") {%>
		<td>
			<a href="<%=BaseURL%>research.aspx"
				onmouseover="changeImages('nav_research', 'images/nav_research-over.gif'); return true;"
				onmouseout="changeImages('nav_research', 'images/nav_research.gif'); return true;">
				<img name="nav_research" src="images/nav_research.gif" width="80" height="61" border="0" alt="Research"></a></td><% } else {%>
		<td width="80" height="61">
			<a href="<%=BaseURL%>research.aspx"><img src="images/nav_research-over.gif" alt="Research" border="0" width="80" height="61"></a></td>
		<% } }
		 if (sectionID != "home") {
		 if (navID != "research") {%>
		<td>
			<a href="<%=BaseURL%>research.aspx"
				onmouseover="changeImages('nav_research', 'images/nav_research-over.gif'); return true;"
				onmouseout="changeImages('nav_research', 'images/nav_research.gif'); return true;">
				<img name="nav_research" src="images/nav_research.gif" width="80" height="61" border="0" alt="Research"></a></td><% } else {%>
		<td width="80" height="61">
			<a href="<%=BaseURL%>research.aspx"><img src="images/nav_research-over.gif" alt="Research" border="0" width="80" height="61"></a></td>
		<% } }
		if (navID != "education") {%>
		<td>
			<a href="<%=BaseURL%>education_calendar.aspx"
				onmouseover="changeImages('nav_education', 'images/nav_education-over.gif'); return true;"
				onmouseout="changeImages('nav_education', 'images/nav_education.gif'); return true;">
				<img name="nav_education" src="images/nav_education.gif" width="86" height="61" border="0" alt="Education"></a></td><% } else {%>
		<td width="86" height="61">
			<a href="<%=BaseURL%>education_calendar.aspx"><img src="images/nav_education-over.gif" alt="Education" width="86" height="61" border="0"></a></td>
		<% }
		if (sectionID == "home") {
		if (navID != "mentoring1" && navID != "mentoring2") {%>
		<td>
			<a href="<%=BaseURL%>mentoring.aspx"
				onmouseover="changeImages('nav_mentoring', 'images/nav_mentoring-over.gif'); return true;"
				onmouseout="changeImages('nav_mentoring', 'images/nav_mentoring.gif'); return true;">
				<img name="nav_mentoring" src="images/nav_mentoring.gif" width="86" height="61" border="0" alt="Mentoring"></a></td>
		<% } else {%>
		<td width="86" height="61">
			<a href="<%=BaseURL%>mentoring.aspx"><img src="images/nav_mentoring-over.gif" alt="Mentoring" width="86" height="61" border="0"></a></td>
		<% } }
		if (sectionID != "home") {
		if (navID != "mentoring") {%>
		<td>
			<a href="<%=BaseURL%>mentoring.aspx"
				onmouseover="changeImages('nav_mentoring', 'images/nav_mentoring-over.gif'); return true;"
				onmouseout="changeImages('nav_mentoring', 'images/nav_mentoring.gif'); return true;">
				<img name="nav_mentoring" src="images/nav_mentoring.gif" width="86" height="61" border="0" alt="Mentoring"></a></td>
		<% } else {%>
		<td width="86" height="61">
			<a href="<%=BaseURL%>mentoring.aspx"><img src="images/nav_mentoring-over.gif" alt="Mentoring" width="86" height="61" border="0"></a></td>
		<% } } if (navID != "consulting") {%>
		<td>
			<a href="<%=BaseURL%>consulting.aspx"
				onmouseover="changeImages('nav_consulting', 'images/nav_consulting-over.gif'); return true;"
				onmouseout="changeImages('nav_consulting', 'images/nav_consulting.gif'); return true;">
				<img name="nav_consulting" src="images/nav_consulting.gif" width="89" height="61" border="0" alt="Consulting"></a></td><%} else {%>
		<td width="86" height="61">
			<a href="<%=BaseURL%>consulting.aspx"><img src="images/nav_consulting-over.gif" alt="Consulting" width="89" height="61" border="0"></a></td>
		<% } if (navID != "about") {%>
		<td>
			<a href="<%=BaseURL%>about.aspx"
				onmouseover="changeImages('nav_about', 'images/nav_about-over.gif'); return true;"
				onmouseout="changeImages('nav_about', 'images/nav_about.gif'); return true;">
				<img name="nav_about" src="images/nav_about.gif" width="60" height="61" border="0" alt="About Us"></a></td>
		<%} else {%>
		<td width="86" height="61">
			<a href="<%=BaseURL%>about.aspx"><img src="images/nav_about-over.gif" alt="About Us" width="60" height="61" border="0"></a></td>
		<% } %>

	  <td>
		<%if (navID != "contact") {%>
		  <a href="<%=BaseURL%>contact.aspx"
				onmouseover="changeImages('nav_contact', 'images/nav_contact-over.gif', 'contact2', 'images/<%Response.Write(contactSwap); %>'); return true;"
				onmouseout="changeImages('nav_contact', 'images/nav_contact.gif', 'contact2', 'images/<%Response.Write(contactSwapBack); %>'); return true;">
			  <img name="nav_contact" src="images/nav_contact.gif" width="69" height="61" border="0" alt="Contact Us"></a></td>
		<% } else {%>
		<td width="69" height="61">
			<a href="<%=BaseURL%>contact.aspx"><img src="images/nav_contact-over.gif" alt="Contact Us" width="69" height="61" border="0"></a></td>
		<% } %>
	</tr>
</table>
