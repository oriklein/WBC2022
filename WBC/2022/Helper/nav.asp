<%
dim contactSwap
dim contactSwapBack

if navID = "home" then
contactSwap = "home_head_05-over.jpg"
contactSwapBack = "home_head_05.jpg"
end if

if navID = "research1" then
contactSwap = "research_head_05-over.jpg"
contactSwapBack = "research_head_05.jpg"
end if

if navID = "research" then
contactSwap = "research_head_05b-over.jpg"
contactSwapBack = "case_studies_head_05.jpg"
end if

if navID = "education" then
contactSwap = "education_head_05-over.jpg"
contactSwapBack = "education_head_05.jpg"
end if

if navID = "mentoring1" then
contactSwap = "mentor_head_05-over.jpg"
contactSwapBack = "mentor_head_05.jpg"
end if

if navID = "mentoring" then
contactSwap = "mentor_head_05b-over.jpg"
contactSwapBack = "questions_head_05.jpg"
end if

if navID = "consulting" then
contactSwap = "consulting_head_05-over.jpg"
contactSwapBack = "consulting_head_05.jpg"
end if

if navID = "about" then
contactSwap = "about_head_05-over.jpg"
contactSwapBack = "about_head_05.jpg"
end if

if navID = "contact" then
contactSwap = "contact_head_05-over.jpg"
contactSwapBack = "contact_head_05.jpg"
end if
%>
<table id="nav" width="538" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<%if navID <> "home" then%>
		<td>
			<a href="default.asp"
				onmouseover="changeImages('nav_home', 'images/nav_home-over.gif'); return true;"
				onmouseout="changeImages('nav_home', 'images/nav_home.gif'); return true;">
				<img name="nav_home" src="images/nav_home.gif" width="68" height="61" border="0" alt="Home"></a></td><% else %>
		<td width="68" height="61">
			<a href="default.asp"><img src="images/nav_home-over.gif" alt="Home" border="0" width="68" height="61"></a></td>
		<% end if %>		
		
		<%if sectionID = "home" then %>
		<%if navID <> "research1" then%>
		<td>
			<a href="research.asp"
				onmouseover="changeImages('nav_research', 'images/nav_research-over.gif'); return true;"
				onmouseout="changeImages('nav_research', 'images/nav_research.gif'); return true;">
				<img name="nav_research" src="images/nav_research.gif" width="80" height="61" border="0" alt="Research"></a></td><% else %>
		<td width="80" height="61">
			<a href="research.asp"><img src="images/nav_research-over.gif" alt="Research" border="0" width="80" height="61"></a></td>
		<% end if %>
		<% end if %>
		<%if sectionID <> "home" then %>
		<%if navID <> "research" then%>
		<td>
			<a href="research.asp"
				onmouseover="changeImages('nav_research', 'images/nav_research-over.gif'); return true;"
				onmouseout="changeImages('nav_research', 'images/nav_research.gif'); return true;">
				<img name="nav_research" src="images/nav_research.gif" width="80" height="61" border="0" alt="Research"></a></td><% else %>
		<td width="80" height="61">
			<a href="research.asp"><img src="images/nav_research-over.gif" alt="Research" border="0" width="80" height="61"></a></td>
		<% end if %>
		<% end if %>

		<%if navID <> "education" then%>
		<td>
			<a href="education.asp"
				onmouseover="changeImages('nav_education', 'images/nav_education-over.gif'); return true;"
				onmouseout="changeImages('nav_education', 'images/nav_education.gif'); return true;">
				<img name="nav_education" src="images/nav_education.gif" width="86" height="61" border="0" alt="Education"></a></td><% else %>
		<td width="86" height="61">
			<a href="education.asp"><img src="images/nav_education-over.gif" alt="Education" width="86" height="61" border="0"></a></td>
		<% end if %>
							
		<%if sectionID = "home" then %>				
		<%if navID <> "mentoring1" then%>
		<td>
			<a href="mentoring.asp"
				onmouseover="changeImages('nav_mentoring', 'images/nav_mentoring-over.gif'); return true;"
				onmouseout="changeImages('nav_mentoring', 'images/nav_mentoring.gif'); return true;">
				<img name="nav_mentoring" src="images/nav_mentoring.gif" width="86" height="61" border="0" alt="Mentoring"></a></td>
		<% else %>
		<td width="86" height="61">
			<a href="mentoring.asp"><img src="images/nav_mentoring-over.gif" alt="Mentoring" width="86" height="61" border="0"></a></td>
		<% end if %>
		<% end if %>
		
		<%if sectionID <> "home" then %>				
		<%if navID <> "mentoring" then%>
		<td>
			<a href="mentoring.asp"
				onmouseover="changeImages('nav_mentoring', 'images/nav_mentoring-over.gif'); return true;"
				onmouseout="changeImages('nav_mentoring', 'images/nav_mentoring.gif'); return true;">
				<img name="nav_mentoring" src="images/nav_mentoring.gif" width="86" height="61" border="0" alt="Mentoring"></a></td>
		<% else %>
		<td width="86" height="61">
			<a href="mentoring.asp"><img src="images/nav_mentoring-over.gif" alt="Mentoring" width="86" height="61" border="0"></a></td>
		<% end if %>
		<% end if %>

		
		<%if navID <> "consulting" then%>
		<td>
			<a href="consulting.asp"
				onmouseover="changeImages('nav_consulting', 'images/nav_consulting-over.gif'); return true;"
				onmouseout="changeImages('nav_consulting', 'images/nav_consulting.gif'); return true;">
				<img name="nav_consulting" src="images/nav_consulting.gif" width="89" height="61" border="0" alt="Consulting"></a></td><% else %>
		<td width="86" height="61">
			<a href="consulting.asp"><img src="images/nav_consulting-over.gif" alt="Consulting" width="89" height="61" border="0"></a></td>
		<% end if %>
		
		<%if navID <> "about" then%>
		<td>
			<a href="about.asp"
				onmouseover="changeImages('nav_about', 'images/nav_about-over.gif'); return true;"
				onmouseout="changeImages('nav_about', 'images/nav_about.gif'); return true;">
				<img name="nav_about" src="images/nav_about.gif" width="60" height="61" border="0" alt="About Us"></a></td>
		<% else %>
		<td width="86" height="61">
			<a href="about.asp"><img src="images/nav_about-over.gif" alt="About Us" width="60" height="61" border="0"></a></td>
		<% end if %>		
		
	  <td>
		<%if navID <> "contact" then%>
		  <a href="contact.asp"
				onmouseover="changeImages('nav_contact', 'images/nav_contact-over.gif', 'contact2', 'images/<%response.write(contactSwap)%>'); return true;"
				onmouseout="changeImages('nav_contact', 'images/nav_contact.gif', 'contact2', 'images/<%response.write(contactSwapBack)%>'); return true;">
			  <img name="nav_contact" src="images/nav_contact.gif" width="69" height="61" border="0" alt="Contact Us"></a></td>
		<% else %>
		<td width="69" height="61">
			<a href="contact.asp"><img src="images/nav_contact-over.gif" alt="Contact Us" width="69" height="61" border="0"></a></td>
		<% end if %>			
	</tr>
</table>