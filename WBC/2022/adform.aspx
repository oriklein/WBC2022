<%@ Page Language="C#" AutoEventWireup="true" Inherits="ContriPayInfo" CodeFile="adform.aspx.cs" %>

<% Response.WriteFile("inc.header2.aspx"); %>
<link id="sidebar" href="Jscript/Sidebar.js" />
<script language="javascript" type="text/javascript" src="Jscript/CreditCard.js"></script>
<script language="javascript" type="text/javascript">
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
    function year_visible(ddl, dv) {

        var control = document.getElementById(ddl);
        if (control.options[control.selectedIndex].text == "No") {
            //    document.getElementById(dv).style.visibility='hidden';
            //    document.getElementById(txt).style.visibility='visible';
            //    document.getElementById(country).style.visibility='visible';
            document.getElementById(dv).style.display = 'none';

            // document.getElementById(country).style.display = 'block';
        }
        else {
            //    document.getElementById(dv).style.visibility='visible';
            //    document.getElementById(txt).style.visibility='hidden';
            //    document.getElementById(country).style.visibility='hidden';

            document.getElementById(dv).style.display = 'block';

            //document.getElementById(country).style.display = 'none';
        }
    }
    function IsNumeric(sText) {
        var ValidChars = "0123456789.";
        var IsNumber = true;
        var Char;


        for (i = 0; i < sText.length && IsNumber == true; i++) {
            Char = sText.charAt(i);
            if (ValidChars.indexOf(Char) == -1) {
                IsNumber = false;
            }
        }
        return IsNumber;

    }

    function show_CreditCard() {
        var ddlCard = document.getElementById("ddlPayment");
        if (ddlCard.options[ddlCard.selectedIndex].text == "Credit Card") {
            document.getElementById("dvCreditCard").style.visibility = 'visible';
            document.getElementById("dvCheck").style.visibility = 'hidden';
        }
        else if (ddlCard.options[ddlCard.selectedIndex].text == "Check or Wire Transfer") {
            document.getElementById("dvCheck").style.visibility = 'visible';
            document.getElementById("dvCreditCard").style.visibility = 'hidden';
        }
    }
    // For Expiry Year - Raghav
    function validateExp() {
        var d1 = new Date();
        var month = document.getElementById("ddlExpirationMonth");
        //    alert(month.options[month.options.selectedIndex].innerText);
        var yearexp = document.getElementById("ddlExpirationYear");
        //    alert(d1.getMonth());
        //  alert(month.options[month.options.selectedIndex].innerText < d1.getMonth());
        if ((month.options[month.options.selectedIndex].innerText < d1.getMonth() + 1) && (yearexp.options[yearexp.options.selectedIndex].innerText == d1.getYear())) {
            alert("Your Credit Card Has Expired");
            month.focus();
            return false;
        }
    }
    function validate() {
        //validate
        if (document.getElementById("ddlCreditCardType").options[document.getElementById("ddlCreditCardType").selectedIndex].text == "- select a payment option -") {
            alert("Please Select the Credit Card Type");
            return false;
        }
        if (document.getElementById("txtCreditCardNo").value == "") {
            alert("Please Enter Credit Card Number");
            return false;
        }


        //Credit card Validation.    
        var cmb = document.getElementById("ddlCreditCardType");
        var txtCardType;
        if (document.all)
            txtCardType = cmb.options[cmb.options.selectedIndex].innerText;
        else
            txtCardType = cmb.options[cmb.options.selectedIndex].textContent;

        if (!checkCreditCard(document.getElementById("txtCreditCardNo").value, txtCardType)) {
            alert(ccErrors[ccErrorNo]);
            document.getElementById("txtCreditCardNo").focus();
            return false;
        }

        //End of Credit Card Validation code Added By Ravi Pulluri.

        if (document.getElementById("txtSecurityCode").value == "") {
            alert("Please enter the Security Code");
            return false;
        }
        else {
            if (!IsNumeric(document.getElementById("txtSecurityCode").value)) {
                alert("Security Code should be numeric");
                return false;
            }
        }



        var month = document.getElementById("ddlExpirationMonth");
        if (month.selectedIndex == 0) {
            alert("Please Select Credit Card Expiry Month ");
            month.focus();
            return false;
        }
        var year = document.getElementById("ddlExpirationYear");
        if (year.selectedIndex == 0) {
            alert("Please Select Credit Card Expiry Year");
            year.focus();
            return false;
        }




        var myDate = new Date();
        var year = document.getElementById("ddlExpirationYear");
        var y = year.options[year.options.selectedIndex].innerText;
        var month = document.getElementById("ddlExpirationMonth");
        var m = parseInt(month.options[month.options.selectedIndex].innerText) - 1;
        myDate.setFullYear(y, m, 01);
        var today = new Date();
        if (myDate.getYear() <= today.getYear()) {
            if (myDate.getMonth() < today.getMonth()) {
                alert("The Credit Card has Expired.Please try Again");
                return false;
            }
        }


        if (document.getElementById("txtFirstName1").value == "") {
            alert("Please enter First Name");
            return false;
        }

        if (document.getElementById("txtLastName1").value == "") {
            alert("Please enter Last Name");
            return false;
        }
        if (document.getElementById("txtCompanyName1").value == "") {
            alert("Please enter Company Name");
            return false;
        }


        if (document.getElementById("txtEmail1").value == "") {
            alert("Please enter Email-id");
            return false;
        }
        if (echeck(document.getElementById("txtEmail1").value) == false) {
            alert("Email-ID is incorrect.");
            return false;
        }

        if (document.getElementById("txtPhone1").value == "") {
            alert("Please enter Phone Number");
            return false;
        }

        if (document.getElementById("txtAddress1").value == "") {
            alert("Please enter Address");
            return false;
        }

        var country = document.getElementById("ddlCountry1");
        if (country.options[country.selectedIndex].text == "- select option -") {
            alert("Please select the Country");
            return false;
        }

        if (document.getElementById("txtCity1").value == "") {
            alert("Please enter City");
            return false;
        }

        if (country.options[country.selectedIndex].text != "Other") {
            var state1 = document.getElementById("ddlState2");
            if (state1.options[state1.selectedIndex].text == "Select State") {
                alert("Please select the State");
                return false;
            }
        }
        else {
            if (document.getElementById("txtState1").value == "") {
                alert("Please enter the State");
                return false;
            }
        }

        if (document.getElementById("txtZip1").value == "") {
            alert("Please enter Zipcode");
            return false;
        }
        return validateDonation1();
        //return true;
    }

    function validateDonation1() {
        //alert('here');
        //For Donation Text
        if (document.getElementById("rdIndividual1").checked || document.getElementById("rdOrganization1").checked || document.getElementById("rdOther1").checked) {
            if (document.getElementById("rdOther1").checked && document.getElementById("txtIndOrg1").value == "") {
                alert("Please enter individual/organization responsible.");
                return false;
            }
            if (document.getElementById("rdIndividual1").checked && document.getElementById("txtIndOrg1").value == "") {
                alert("Please enter individual responsible.");
                return false;
            }
            if (document.getElementById("rdOrganization1").checked && document.getElementById("txtIndOrg1").value == "") {
                alert("Please enter organization responsible.");
                return false;
            }
            return true;
        }
        else {
            alert("Please select one of the three options.");
            return false;
        }

    }


    function validateAttende2() {
        if (document.getElementById("txtFirstName2").value == "") {
            alert("Please enter First Name");
            return false;
        }

        if (document.getElementById("txtLastName2").value == "") {
            alert("Please enter Last Name");
            return false;
        }
        
        if (document.getElementById("txtOrg").value == "") {
            alert("Please enter Company Name");
            return false;
        }
        
        if (document.getElementById("txtEmail2").value == "") {
            alert("Please enter Email-id");
            return false;
        }
        if (echeck(document.getElementById("txtEmail2").value) == false) {
            alert("Email-ID is incorrect.");
            return false;
        }
        if (document.getElementById("txtPhone2").value == "") {
            alert("Please enter Phone Number");
            return false;
        }
        if (document.getElementById("txtAddress2").value == "") {
            alert("Please enter Address");
            return false;
        }

        var country = document.getElementById("ddlCountry2");
        if (country.options[country.selectedIndex].text == "- select option -") {
            alert("Please Select the Country");
            return false;
        }
        if (document.getElementById("txtCity2").value == "") {
            alert("Please enter City");
            return false;
        }
        if (country.options[country.selectedIndex].text != "Other") {
            var state1 = document.getElementById("ddlState3");
            if (state1.options[state1.selectedIndex].text == "-Select Option-") {
                alert("Please select the State");
                return false;
            }
        }
        else {
            if (document.getElementById("dvtextState3").value == "") {
                alert("Please enter the State");
                return false;
            }
        }

        if (document.getElementById("txtZip2").value == "") {
            alert("Please enter Zipcode");
            return false;
        }
        // return validateDonation();
        return true;
    }

    function validateDonation() {
        //For Donation Text
        if (document.getElementById("rdIndividual").checked || document.getElementById("rdOrganization").checked || document.getElementById("rdOther").checked) {
            if (document.getElementById("rdOther").checked && document.getElementById("txtIndOrg").value == "") {
                alert("Please enter individual/organization responsible.");
                return false;
            }
            if (document.getElementById("rdIndividual").checked && document.getElementById("txtIndOrg").value == "") {
                alert("Please enter individual responsible.");
                return false;
            }
            if (document.getElementById("rdOrganization").checked && document.getElementById("txtIndOrg").value == "") {
                alert("Please enter organization responsible.");
                return false;
            }
            return true;
        }
        else {
            alert("Please select one of the three options.");
            return false;
        }

    }

    function hide_billing() {
        if (document.getElementById("chkSame").checked)
            document.getElementById("dvBilling").style.visibility = 'hidden';
        else
            document.getElementById("dvBilling").style.visibility = 'visible';
    }

    var ddl = "";
    var dv = "";
    var txt = "";
    var country = "";
    function state_visible(ddl, dv, txt) {
        var control = document.getElementById(ddl);
        //var control1 = document.getElementById("txt");

        if (control.options[control.selectedIndex].text == "Other") {
            document.getElementById(dv).style.display = 'block';
            document.getElementById(txt).style.display = 'block';

        }
        else {
            document.getElementById(dv).style.display = 'none';
            document.getElementById(txt).style.display = 'none';

        }
    }
    function clearText(text) {
        if (document.getElementById(text).value == "Country") {
            document.getElementById(text).value = "";
        }
    }

    function restoretext(text) {
        if (document.getElementById(text).value == "") {
            document.getElementById(text).value = "Country";
        }
    }
    function validateExpiry() {
        var myDate = new Date();
        var year = document.getElementById("ddlExpirationYear");
        var y = year.options[year.options.selectedIndex].innerText;
        var month = document.getElementById("ddlExpirationMonth");
        var m = parseInt(month.options[month.options.selectedIndex].innerText) - 1;
        myDate.setFullYear(y, m, 01);
        var today = new Date();
        if (myDate.getYear() <= today.getYear()) {
            if (myDate.getMonth() < today.getMonth()) {
                alert("The Credit Card has Expired.Please try Again");
                return false;
            }
        }
        return true;
    }

    function showIndOrgTxtBox(chk, chktype) {

        if (chk == 'YES' && chktype == 'Ind') {
            document.getElementById("divIndOrg").style.visibility = "visible";
            //document.getElementById("divIndOrg").style.display="block";
            document.getElementById("txtIndOrg").value = document.getElementById("txtFirstName2").value + " " + document.getElementById("txtLastName2").value;
        }

        if (chk == 'YES' && chktype == 'Org') {
            document.getElementById("divIndOrg").style.visibility = "visible";
            //document.getElementById("divIndOrg").style.display="block";
            document.getElementById("txtIndOrg").value = document.getElementById("txtCompany2").value;
        }
        if (chk == 'YES' && chktype == 'Other') {
            document.getElementById("divIndOrg").style.visibility = "visible";
            //document.getElementById("divIndOrg").style.display="block";
            document.getElementById("txtIndOrg").value = "";
        }


    }

    function showIndOrgTxtBox1(chk, chktype) {
        if (chk == 'YES' && chktype == 'Ind') {
            document.getElementById("divIndOrg1").style.visibility = "visible";
            //document.getElementById("divIndOrg1").style.display="block";
            document.getElementById("txtIndOrg1").value = document.getElementById("txtFirstName1").value + " " + document.getElementById("txtLastName1").value;
        }

        if (chk == 'YES' && chktype == 'Org') {
            document.getElementById("divIndOrg1").style.visibility = "visible";
            //document.getElementById("divIndOrg1").style.display="block";
            document.getElementById("txtIndOrg1").value = document.getElementById("txtCompanyName1").value;
        }
        if (chk == 'YES' && chktype == 'Other') {
            document.getElementById("divIndOrg1").style.visibility = "visible";
            //document.getElementById("divIndOrg1").style.display="block";
            document.getElementById("txtIndOrg1").value = "";
        }

    }

</script>
<% Response.WriteFile("inc.header.body1.aspx"); %>
<% Response.WriteFile("inc.header.body2.aspx"); %>

<%-- include actual code from page --%>
<form id="form1" name="forattendee" runat="server">
    <div class="row row-indent" id="dvAttendees" runat="server">
    </div>
    
 
                                       
                                           
                                                <div  class="row row-field">
                                                    <label>
                                                        <span class="req">*</span> Please select ad type*
                                                    </label>
                                                   <select name="SelRRegarding" 
                                                            class="field field-select"  runat="server" id="SelMad">
                                                            <option value="Full Page Ad in MAD Event Journal ($250)" selected="selected">Full Page Ad in MAD Event Journal ($250)</option>
                                                            <option value="Half Page Ad in MAD Event Journal ($150)">Half Page Ad in MAD Event Journal ($150)</option>
                                                        </select>
                                                   </div>
                                                  
                                             
                                       
                                               
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>First Name</label>
                                                    <input class="field field-text large" runat="server" maxlength="30" id="txtFirstName2" type="text" />
                                                 
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Last Name
                                                    </label>
                                                    <input class="field field-text large" id="txtLastName2" maxlength="30" runat="server" type="text" />
                                                 
                                                </div>
                                               
                                                <div class="row row-field">
                                                    <label> <span class="req">*</span>
                                                        Company Name</label>
                                                    <input class="field field-text large" id="txtOrg" maxlength="128" runat="server" type="text" />
                                                

                                                </div>
      <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Email</label>
                                                    <input class="field field-text large" id="txtEmail2" maxlength="128" runat="server" type="text" />
                                                   
                                                </div>
    <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Phone</label>
                                                    <input  class="field field-text small" id="txtPhone2" runat="server"
                                                        maxlength="15" type="text" />
                                                   
                                                
                                                </div>
                                                 
                                               
                                               
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Address1</label>
                                                    <input class="field field-text large" id="txtAddress2" maxlength="30" runat="server" type="text" />
                                                  
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        Address 2</label>
                                                    <input class="field field-text large" id="txtAddress22" maxlength="15" runat="server" type="text" />
                                                 
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Country</label>
                                             
                                                        <select name="SelRRegarding" onchange="javascript: state_visible('ddlCountry2','txtCountry2','dvtextState3');"
                                                            class="field field-select"  runat="server" id="ddlCountry2">
                                                            
                                                            <option value="USA" selected="selected">USA</option>
                                                            <option value="Other">Other</option>
                                                        </select>
                                                 
                                                        <input id="txtCountry2"  maxlength="20" style="display:none;" runat="server" class="field field-text small" type="text" value="Country" onfocus="clearText('txtCountry2')"
                                                            onblur="restoretext('txtCountry2')" />
                                                 
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>City</label>
                                                    <input  id="txtCity2" runat="server" maxlength="30" class="field field-text large"
                                                        type="text" />
                                                   
                                                </div>   
                                        <div class="row row-field">
                                                   
                                                        <label>
                                                            <span class="req">*</span>State</label>
                                                     
                                                        
                                                                <select class="field field-select large" id="ddlState3"
                                                                    runat="server">
                                                                    <option selected="selected">-Select Option-</option>
                                                                    <option>AL</option>
                                                                    <option>AK</option>
                                                                    <option>AZ</option>
                                                                    <option>AR</option>
                                                                    <option>CA</option>
                                                                    <option>CO</option>
                                                                    <option>CT</option>
                                                                     <option>DC</option>
                                                                    <option>DE</option>
                                                                    <option>FL</option>
                                                                    <option>GA</option>
                                                                    <option>HI</option>
                                                                    <option>ID</option>
                                                                    <option>IL</option>
                                                                    <option>IN</option>
                                                                    <option>IA</option>
                                                                    <option>KS</option>
                                                                    <option>KY</option>
                                                                    <option>LA</option>
                                                                    <option>ME</option>
                                                                    <option>MD</option>
                                                                    <option>MA</option>
                                                                    <option>MI</option>
                                                                    <option>MN</option>
                                                                    <option>MS</option>
                                                                    <option>MO</option>
                                                                    <option>MT</option>
                                                                    <option>NE</option>
                                                                    <option>NV</option>
                                                                    <option>NH</option>
                                                                    <option>NJ</option>
                                                                    <option>NM</option>
                                                                    <option>NY</option>
                                                                    <option>NC</option>
                                                                    <option>ND</option>
                                                                    <option>OH</option>
                                                                    <option>OK</option>
                                                                    <option>OR</option>
                                                                    <option>PA</option>
                                                                    <option>RI</option>
                                                                    <option>SC</option>
                                                                    <option>SD</option>
                                                                    <option>TN</option>
                                                                    <option>TX</option>
                                                                    <option>UT</option>
                                                                    <option>VT</option>
                                                                    <option>VA</option>
                                                                    <option>WA</option>
                                                                    <option>WV</option>
                                                                    <option>WI</option>
                                                                    <option>WY</option>
                                                                </select>
                                                            
                                                         
                                                                <input class="field field-text" type="text" style="display:none;" runat="server" id="dvtextState3" maxlength="20" />
                                                            
                                                   
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Zie</label>
                                                    <input runat="server" class="field field-text large"  id="txtZip2"
                                                        maxlength="12" type="text" />
                                                 
                                                </div>
                                                 
                                               
                                                      
                                                 <div class="row row-button">
                                                
                                                                    <asp:Button ID="btnNext2" runat="server" OnClientClick="javascript:return validateAttende2();"
                                                                    CssClass="bullet bullet-forward small right" Text="Confirm" OnClick="ContributorInfo_Insert" />
                                                        </div>
                                                   
                               
    
</form>
<% Response.WriteFile("inc.footer.aspx"); %>
