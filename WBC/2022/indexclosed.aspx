<%-- starting line below --%>
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.new.aspx.cs" Inherits="index_new" %>
<% Response.WriteFile("inc.header2.aspx"); %>
<%-- include page specific header items --%>
<script language="javascript" type="text/javascript">
    function validate() {
        var x = document.getElementById("ddlAttendeCount");
        if (x.options[x.selectedIndex].text == '- select option -') {
            alert("Please select No. of People");
            return false;
        }
        else
            return true;
    }
    </script>
<%-- include header end / body start until content --%>
<% Response.WriteFile("inc.header.body1.aspx"); %>
<% Response.WriteFile("inc.header.body2.aspx"); %>
<%-- include actual code from page --%>
<div class="row row-indent">
							<ul class="menu menu-progress menu-match"><li class="active">Registration Form</li><li>Payment</li><li>Confirmation</li></ul>
							<h2>Step 1: Registration Form</h2>
							<p>Please provide the number of attendees you are registering for the Womens Bond Club 2015.</p>
						</div>

						
						
<form id="form1" class="cform" name="forattendee" runat="server">
	<div class="row row-field"><label><span class="req">*</span>NUMBER OF ATTENDEES</label><select name="SelRRegarding" class="field field-select" runat="server" id="ddlAttendeCount">
            <option value="" selected="selected">- select option -</option>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            <option value="7">7</option>
            <option value="8">8</option>
          </select></div>
         <div class="row row-button">
            <asp:Button CssClass="bullet bullet-forward small right" ID="btnNext" OnClientClick="javascript:return validate()"
                                            runat="server" Text="NEXT" OnClick="btnNext_Click" />
          </div>
     
        <div id="divAdmin" class="mrgnLf" runat="server"> <a href="BO/BoIndex.aspx">BO Home</a>&nbsp;&nbsp; |&nbsp;&nbsp;
          <asp:LinkButton ID="LinkButton1" runat="server" OnClick="lnkLogOut_Click">Logout</asp:LinkButton>
        </div>
</form>
<%-- end page content --%>
<%-- Include Footer --%>
<% Response.WriteFile("inc.footer.aspx"); %>