<%@ Page Language="C#" AutoEventWireup="true" Inherits="Donorindex" CodeFile="Donorindex.aspx.cs" %>
<% Response.WriteFile("inc.header2.aspx"); %>
<!--Fireworks CS3 Dreamweaver CS3 target.  Created Thu Feb 26 12:20:05 GMT-0500 (Eastern Standard Time) 2009-->
<link id="sidebar" href="Jscript/Sidebar.js" />
<script language="javascript">


    function required() {
        if (document.getElementById("txtOtherAmount").value != "")
            return true;
        else
            alert("Please enter amount");
        return false;
    }

    function numbersonly(myfield, e, dec) {
        var key;
        var keychar;

        if (window.event)
            key = window.event.keyCode;

        else if (e)
            key = e.which;
        else
            return true;
        keychar = String.fromCharCode(key);

        // control keys
        if ((key == null) || (key == 0) || (key == 8) ||
            (key == 9) || (key == 13) || (key == 27))
            return true;

        // numbers
        else if ((("0123456789").indexOf(keychar) > -1))
            return true;

        // decimal point jump
        else if (dec && (keychar == ".")) {
            myfield.form.elements[dec].focus();
            return false;
        }
        else
            return false;
    }
</script>
<% Response.WriteFile("inc.header.body1.aspx"); %>
<% Response.WriteFile("inc.header.body2.aspx"); %>
<div class="row row-indent">
  <ul class="menu menu-progress menu-match">
    <li class="active">Donation Form </li>
    <li>Payment</li>
    <li>Confirmation</li>
  </ul>
  <h2> Make a Donation to The Womens Bond Club 2015 </h2>
 
</div>
<%-- include actual code from page --%>
<form id="form1" name="forattendee" runat="server">
  <div class="row row-field">
    <label> Make Your Donation – Enter Dollar Amount (Example 5000)</label>
    <input name="StreetAddress6" maxlength="10" class="field field-text large" runat="server"
        onchange="javascript:Uncheck('txtOtherAmount');" id="txtOtherAmount" type="text" />
  </div>
  <div class="row row-button">
    <asp:button id="btnSubmit" cssclass="bullet bullet-forward small right" onclick="btnSubmit_Click"
        onclientclick="javascript:return required();" runat="server" text="Next" />
  </div>
</form>
<% Response.WriteFile("inc.footer.aspx"); %>
