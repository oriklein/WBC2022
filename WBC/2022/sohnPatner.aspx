<%-- starting line below --%>

<%@ Page Language="C#" AutoEventWireup="true" Inherits="sohnPatner" CodeFile="sohnPatner.aspx.cs" %>

<% Response.WriteFile("inc.header2.aspx"); %>
<script type="text/javascript">
    function echeck(str) {

        var at = "@"
        var dot = "."
        var lat = str.indexOf(at)
        var lstr = str.length
        var ldot = str.indexOf(dot)
        if (str.indexOf(at) == -1) {
            return false
        }

        if (str.indexOf(at) == -1 || str.indexOf(at) == 0 || str.indexOf(at) == lstr) {
            return false
        }

        if (str.indexOf(dot) == -1 || str.indexOf(dot) == 0 || str.indexOf(dot) == lstr) {
            return false
        }

        if (str.indexOf(at, (lat + 1)) != -1) {
            return false
        }

        if (str.substring(lat - 1, lat) == dot || str.substring(lat + 1, lat + 2) == dot) {
            return false
        }

        if (str.indexOf(dot, (lat + 2)) == -1) {
            return false
        }

        if (str.indexOf(" ") != -1) {
            return false
        }

        return true
    }
    function validate() {
        if (document.getElementById("txtFirstName").value == "") {
            alert("First Name is required");
            document.getElementById("txtFirstName").focus();
            return false;
        }
        if (document.getElementById("txtLastName").value == "") {
            alert("Last Name is required");
            document.getElementById("txtLastName").focus();
            return false;
        }
        if (document.getElementById("txtOrganization").value == "") {
            alert("Organization is required");
            document.getElementById("txtOrganization").focus();
            return false;
        }
        if (document.getElementById("txtEmail").value == "") {
            alert("Email is required");
            document.getElementById("txtEmail").focus();
            return false;
        }
        if (echeck(document.getElementById("txtEmail1").value) == false) {
            alert("Email-ID is incorrect.");
            document.getElementById("txtEmail").focus();
            return false;
        }
        if (document.getElementById("txtPhone").value == "") {
            alert("Phone is required");
            document.getElementById("txtPhone").focus();
            return false;
        }
    }

</script>
<% Response.WriteFile("inc.header.body1.aspx"); %>
<% Response.WriteFile("inc.header.body2.aspx"); %>

<form id="form1" name="forsohnpartner" runat="server">
 <div id="divReg" runat="server">
<div class="row row-indent">
    <div class="article article-box article-link">
        <h1 class="large">
            Become a Sohn Partner</h1>
        <p>
            The ideas shared at the Sohn Conference move the market every year...But the most
            important impact is that of those who have supported the work of the foundation,
            including speakers and attendees who donate some of their profits from money-making
            Sohn ideas back to the Sohn Foundation. Thousands of children have been helped and
            the science of pediatric cancer research, and cancer research in general, has been
            advanced thanks to the committed supporters of the Sohn Conference Foundation.</p>
        <p>
            This year, we’re challenging you to join and become a Sohn Partner: make a bigger
            impact by linking your Sohn gains to the move forward for the work of the Foundation.
            By clicking below you are making a non-binding pledge stating your intention to
            donate some percentage of your gains from the ideas shared at this year’s conference
            to the Sohn Conference Foundation, and thereby increase the impact of furthering
            pediatric cancer research.</p>
        <p>
            As thanks, partners will be acknowledged at the conference and you will get a special
            indicator to wear at the event expressing our appreciation for your support of childrens’
            fight against pediatric cancer.</p>
         <div>
            <object width="350" height="350">
                <param name="movie" value="https://www.youtube.com/v/Ytg58MbqUow&hl=en&fs=1&"></param>
                <param name="allowFullScreen" value="true"></param>
                <param name="allowscriptaccess" value="always"></param>
                <embed src="https://www.youtube.com/v/Ytg58MbqUow&hl=en&fs=1&" type="application/x-shockwave-flash"
                    allowscriptaccess="always" allowfullscreen="true" width="500" height="344">
             </embed>
            </object>
        </div>
        <%--<iframe src="http://www.youtube.com/embed/Ytg58MbqUow"
            height="350" width="500"  frameborder="0"></iframe>--%>
        <br />
        <br />
        <%--<iframe src="http://www.youtube.com/embed/ZWxspyhdbzE?rel=0&autohide=1&showinfo=0"
            height="350" width="500" allowfullscreen="" frameborder="0"></iframe>--%>
            <div>
            <object width="350" height="350">
                <param name="movie" value="https://www.youtube.com/v/ZWxspyhdbzE&hl=en&fs=1&"></param>
                <param name="allowFullScreen" value="true"></param>
                <param name="allowscriptaccess" value="always"></param>
                <embed src="https://www.youtube.com/v/ZWxspyhdbzE&hl=en&fs=1&" type="application/x-shockwave-flash"
                    allowscriptaccess="always" allowfullscreen="true" width="500" height="344">
             </embed>
            </object>
        </div>
    </div>
    <div class="row row-indent">
        <h1 class="large">
            Become a Sohn Partner</h1>
    </div>
   
    <div class="row row-field">
        <label>
            <span class="req">*</span>First Name</label>
        <input name="FirstName" class="field field-text large" maxlength="50" runat="server"
            id="txtFirstName" type="text" />
    </div>
    <div class="row row-field">
        <label>
            <span class="req">*</span>Last Name</label>
        <input name="LastName" class="field field-text large" maxlength="50" runat="server"
            id="txtLastName" type="text" />
    </div>
    <div class="row row-field">
        <label>
            <span class="req">*</span>Organization</label>
        <input name="Organization" class="field field-text large" maxlength="100" runat="server"
            id="txtOrganization" type="text" />
    </div>
    <div class="row row-field">
        <label>
            Title</label>
        <input name="title" class="field field-text large" maxlength="100" runat="server"
            id="txtTitle" type="text" />
    </div>
    <div class="row row-field">
        <label>
            <span class="req">*</span>Email</label>
        <input name="Email" class="field field-text large" maxlength="50" runat="server"
            id="txtEmail" type="text" />
    </div>
    <div class="row row-field">
        <label>
            <span class="req">*</span>Phone</label>
        <input class="field field-text small" id="txtPhone" maxlength="15" runat="server"
            type="text" />
        <label>
            Extention</label>
        <input class="field field-text xsmall" id="txtExt" maxlength="6" runat="server" type="text" />
    </div>
    <div class="row row-button">
        <asp:linkbutton id="lnkSubmit" onclientclick="javascript:return validate();" onclick="lnkSubmit_Click" cssclass="btn" runat="server"><span>BY SUBMITTING THIS FORM I AGREE TO BECOME A SOHN PARTNER >></span></asp:linkbutton>
    </div>
    </div>
    </div>
    <div id="divSucc" visible="false" class="row row-indent"  runat="server">
      <div class="row">
        <h1 class="large">
            Become a Sohn Partner</h1>
    </div>
    <p id="lblDr" runat="server"></p>
   <p>Thank you for becoming a Sohn Partner.  </p>
   <br /><br /><p>
</p>
    </div>

</form>
<%-- end page content --%>
<%-- Include Footer --%>
<% Response.WriteFile("inc.footer.aspx"); %>
