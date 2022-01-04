<%@ Page Language="C#" AutoEventWireup="true" Inherits="insertAttendees"  EnableViewStateMac="false" validateRequest="false" enableEventValidation="false" viewStateEncryptionMode ="Never" CodeFile="insertAttendees.aspx.cs" %>

<% Response.WriteFile("inc.header2.aspx"); %>
<%-- include page specific header items --%>

<script type="text/javascript" language="javascript">
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
    //    var ddlcountry = "";
    //    var country = "";
    //    var ddlstate = "";
    //    var state = "";
    function disNextWave(nextwave,val) {
        if (val.value == "NW") {
            document.getElementById(nextwave).value = "Yes";
            document.getElementById(nextwave).disabled = true;
        } else {
            document.getElementById(nextwave).disabled = false;
        }
    }
    function display(ddlcountry, ddlstate, country, state) {


        var dc = document.getElementById(ddlcountry);

        //alert(dc.options[dc.selectedIndex].text);
        if (dc.options[dc.selectedIndex].text == "Other") {
            document.getElementById(country).style.display = 'block';
            document.getElementById(ddlstate).style.display = 'none';
            document.getElementById(state).style.display = 'block';
            //document.getElementById(state).style.marginLeft='15px';
            //document.getElementById(state).style.borderLeft='10px solid #FFF';
        }
        else {
            document.getElementById(country).style.display = 'none';
            document.getElementById(ddlstate).style.display = 'block';
            document.getElementById(state).style.display = 'none';
            //document.getElementById(ddlstate).style.marginLeft='15px';
        }
    }
    var id = "";
    function hide(id) {
        document.getElementById(id).value = "";
        return false;
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


    function validate() {
        for (i = 0; i < grdFirstName_Txt.length; i++) {
            var objFirstName = document.getElementById(grdFirstName_Txt[i]);
            if (objFirstName.value == "") {
                alert("Attendee : " + [parseInt(i) + 1] + " First name can not be blank");
                objFirstName.focus();
                return false;
            }

            var objLastName = document.getElementById(grdLastName_Txt[i]);
            if (objLastName.value == "") {
                alert("Attendee : " + [parseInt(i) + 1] + " Last name can not be blank");
                objLastName.focus();
                return false;
            }

            var objAttendeeType = document.getElementById(grdAttendeType_ddl[i]);
            if (objAttendeeType.options[objAttendeeType.selectedIndex].text == "-select option-") {
                alert("Attendee : " + [parseInt(i) + 1] + " Please select Ticket Option");
                objAttendeeType.focus();
                return false;
            }

            var objOrganization = document.getElementById(grdOrganization_Txt[i]);
            if (objOrganization.value == "") {
                alert("Attendee : " + [parseInt(i) + 1] + " Company Name can not be blank");
                objOrganization.focus();
                return false;
            }


            var objEmail = document.getElementById(grdEmail_Txt[i]);
            if (objEmail.value == "") {
                alert("Attendee : " + [parseInt(i) + 1] + " Email can not be blank");
                objEmail.focus();
                return false;
            }


            if (echeck(objEmail.value) == false) {
                alert("Attendee : " + [parseInt(i) + 1] + " Email-ID is incorrect.");
                objEmail.focus();
                return false;
            }

            var objPhone = document.getElementById(grdPhone_Txt[i]);
            if (objPhone.value == "") {
                alert("Attendee : " + [parseInt(i) + 1] + " Phone can not be blank");
                objPhone.focus();
                return false;
            }


//            var objAddress = document.getElementById(grdAddress_Txt[i]);
//            if (objAddress.value == "") {
//                alert("Attendee : " + [parseInt(i) + 1] + " Address can not be blank");
//                objAddress.focus();
//                return false;
//            }

//            var objCountry = document.getElementById(grdCountry_ddl[i]);
//            if (objCountry.options[objCountry.selectedIndex].text == "-Select-") {
//                alert("Attendee : " + [parseInt(i) + 1] + " Select the Country");
//                objCountry.focus();
//                return false;
//            }

//            var objState = document.getElementById(grdState_ddl[i]);
//            if (objCountry.options[objCountry.selectedIndex].text == "USA") {
//                if (objState.options[objState.selectedIndex].text == "-Select-" || objState.options[objState.selectedIndex].text == "Select State") {
//                    alert("Attendee : " + [parseInt(i) + 1] + " Select the State");
//                    objState.focus();
//                    return false;
//                }
//            }

//            if (objCountry.options[objCountry.selectedIndex].text == "Other") {
//                var objOtherCountry = document.getElementById(grdOtherCountry_Txt[i]);
//                if (objOtherCountry.value == "Country" || objOtherCountry.value == "") {
//                    alert("Attendee : " + [parseInt(i) + 1] + " Country can not be blank");
//                    return false;
//                }
//            }

//            if (objCountry.options[objCountry.selectedIndex].text == "Other") {
//                var objOtherCountry = document.getElementById(grdOtherState_Txt[i]);
//                if (objOtherCountry.value == "State" || objOtherCountry.value == "") {
//                    alert("Attendee : " + [parseInt(i) + 1] + " State can not be blank");
//                    return false;
//                }
//            }


//            var objCity = document.getElementById(grdCity_Txt[i]);
//            if (objCity.value == "") {
//                alert("Attendee : " + [parseInt(i) + 1] + " City can not be blank");
//                objCity.focus();
//                return false;
//            }

//            var objZip = document.getElementById(grdZip_Txt[i]);
//            if (objZip.value == "") {
//                alert("Attendee : " + [parseInt(i) + 1] + " zip/postal code can not be blank");
//                objZip.focus();
//                return false;
//            }

            var checkadmin1 = '<%=checkadmin%>';
            if (checkadmin1 == "yes") {
                var objgrdAdminPrice = document.getElementById(grdAdminPrice_Txt[i]);

                if (objgrdAdminPrice.value == "") {
                    alert("Attendee : " + [parseInt(i) + 1] + " Admin Price Override can not be blank");
                    objgrdAdminPrice.focus();
                    return false;
                }
                //                    if(!IsNumeric(objgrdAdminPrice.value))
                //                    {
                //                     alert("Attendee  : "+ [parseInt(i)+1] + " Admin Price Override should be numeric");
                //                     return false;
                //                    }
            }
        }

        return true;
    }

    function checkAdminPrice() {
        var divAdmin = document.getElementById(grddivAdminPrice_Txt[i]);
        if (divAdmin != null) {
            if (document.getElementById(grddivAdminPrice_Txt[i]).style.visibility == "visible") {
                var objgrdAdminPrice = document.getElementById(grdAdminPrice_Txt[i]);
                if (objgrdAdminPrice.value == "") {
                    alert("Attendee : " + [parseInt(i) + 1] + " Admin Price Override can not be blank");
                    objgrdAdminPrice.focus();
                    return false;
                }

            }
        }
    }



    function testForObject(Id, Tag) {
        var o = document.getElementById(Id);
        if (o) {
            if (Tag) {
                if (o.tagName.toLowerCase() == Tag.toLowerCase()) {
                    return o;
                }
            }
            else {
                return o;
            }
        }
        return null;
    }


     
</script>

<%-- include header end / body start until content --%>
<% Response.WriteFile("inc.header.body1.aspx"); %>
<%-- Change text below to refect the page the user is on will either be Attendee reservation --%>
<% Response.WriteFile("inc.header.body2.aspx"); %>
<div class="row row-indent">
    <ul class="menu menu-progress menu-match">
        <li class="active">Registration</li><li>Details</li><li>Confirmation</li></ul>
    <h2>
        Registration</h2>
    <p>
        Please provide complete contact information for each attendee included in your registration.
        </p>
    <p>
        *Required</p>
      
        
</div>
<%-- include actual code from page --%>
<form id="form1" name="forattendee" runat="server">
<div id="container1">
    <asp:gridview id="grdAttendee" width="100%" onrowcommand="action" onprerender="initialMakeUp"
        borderstyle="none" showfooter="true" runat="server" autogeneratecolumns="false">
            <Columns>
            <asp:TemplateField ItemStyle-BorderStyle="none">
              <HeaderStyle BorderStyle="None" />
              <FooterStyle BorderStyle="None" />
              <ItemTemplate>
                <div id="mainContent">
                <!-- Heading row row-field -->
                <div class="row row-indent"> 
                  <h1>
                    <asp:Label ID="lblHeading" runat="server"></asp:Label>
                  </h1>
                </div>
                <!-- Fields Start From Here -->
                <div>
                  <div class="row row-field">
                    <label> <span class="req">*</span>First Name:</label>
                    <input id="txtFirstName" class="field field-text large" runat="server"  type="text" />
                  </div>
                  <div class="row row-field">
                    <label> <span class="req">*</span>Last Name:</label>
                    <input id="txtLastName" class="field field-text large" runat="server"  type="text" />
                  </div>
                  <div class="row row-field">
                    <label> <span class="req">*</span>Ticket Option:</label>
                    <select id="ddlAttendeType" onchange="javascript:disNextWave('ddlNW');" runat="server" class="field field-select" >
                      <option selected="selected" value="">-select option-</option>
                        <option value="IP">Member Individual Ticket  $750</option>
                                                                    <option value="NIP">Non Member Individual Ticket  $1,100</option> 
                                                                   <%-- <option value="NW">Next Wave Sohn Only</option> --%>
                      <%--<option value="VR">Viewing Room</option>--%>
                    </select>
                  </div>
                  
                    <!--
                   <div class="row row-field">
                    <label> <span class="req">*</span>Will this attendee
be attending the 
Next Wave Sohn?</label>
                    <select id="ddlNW" runat="server" class="field field-select" >
                      <option selected="selected" value="Yes">Yes</option>
                        <option value="No">No</option>
                                                                  
                      <%--<option value="VR">Viewing Room</option>--%>
                    </select>
                  </div>
                  
                  
                   <div class="row row-field">
                  
                   <label> <span class="req">*</span>This attendee will become a Sohn Partner</label>
                   <select id="ddlSGP" runat="server" class="field field-select" >
                      <option  value="Yes">Yes</option>
                        <option selected="selected" value="No">No</option>
                                                                  
                      <%--<option value="VR">Viewing Room</option>--%>
                    </select>
                  
                  
                  </div>
                    -->
                  <div class="row row-field">
                    <label> <span class="req">*</span>Company Name:</label>
                    <input id="txtOrganization" runat="server" class="field field-text large"  type="text" />
                  </div>
                  <div style="display:none" class="row row-field">
                    <label> Title:</label>
                    <input id="txtTitle" runat="server" class="field field-text large" type="text" />
                  </div>
                  <div class="row row-field">
                    <label> <span class="req">*</span>Email:</label>
                    <input id="txtEmail" runat="server" class="field field-text large"  type="text" />
                  </div>
                  <div class="row row-field">
                    <label> <span class="req">*</span>Phone:</label>
                    <input id="txtPhone" runat="server" class=" field field-text small"  type="text" />
                    <label>Extension:</label> <input id="txtExt" runat="server" class="field field-text xsmall" type="text" />
                  </div>
               <%--   <div class="row row-field">
                    <label> Ext:</label>
                    <input id="txtExt" class=" field field-select" runat="server"  type="text" />
                  </div>--%>
                  <div class="row row-field dspnone">
                    <label> <span class="req">*</span>Address:</label>
                    <input id="txtAddress" class="field field-text large" runat="server"  type="text" />
                  </div>
                  <div class="row row-field dspnone">
                    <label> Address 2:</label>
                    <input id="txtOtherAddress" runat="server" class="field field-text large"  type="text" />
                  </div>
                  <div class="row row-field dspnone">
                    <label> <span class="req">*</span>Country:</label>
                   
                      <select id="ddlCountry" onchange="javascript:display('ddlCountry', 'ddlState','txtCountry','txtState');" runat="server" class="field field-select large">
                        <option selected="selected" value="">-Select-</option>
                        <option value="USA">USA</option>
                        <option value="Other">Other</option>
                      </select>
                   
                  
                      <input id="txtCountry" runat="server" class="field field-text" maxlength="20" style="display: none;"  type="text" />
                   
                  </div>
                  <div class="row row-field dspnone">
                    <label> <span class="req">*</span>City:</label>
                    <input id="txtCity" runat="server" class=" field field-text large"  type="text" />
                  </div>
                  <div class="row row-field dspnone">
                    <label> <span class="req">*</span>State:</label>                 
                      <select id="ddlState" class="field field-select large" runat="server">
                        <option selected="selected" value="Select State">-Select-</option>
                        <option value="AL">AL</option>
                        <option value="AK">AK</option>
                        <option value="AZ">AZ</option>
                        <option value="AR">AR</option>
                        <option value="CA">CA</option>
                        <option value="CO">CO</option>
                        <option value="CT">CT</option>
                        <option value="DC">DC</option>
                        <option value="DE">DE</option>
                        <option value="FL">FL</option>
                        <option value="GA">GA</option>
                        <option value="HI">HI</option>
                        <option value="ID">ID</option>
                        <option value="IL">IL</option>
                        <option value="IN">IN</option>
                        <option value="IA">IA</option>
                        <option value="KS">KS</option>
                        <option value="KY">KY</option>
                        <option value="LA">LA</option>
                        <option value="ME">ME</option>
                        <option value="MD">MD</option>
                        <option value="MA">MA</option>
                        <option value="MI">MI</option>
                        <option value="MN">MN</option>
                        <option value="MS">MS</option>
                        <option value="MO">MO</option>
                        <option value="MT">MT</option>
                        <option value="NE">NE</option>
                        <option value="NV">NV</option>
                        <option value="NH">NH</option>
                        <option value="NJ">NJ</option>
                        <option value="NM">NM</option>
                        <option value="NY">NY</option>
                        <option value="NC">NC</option>
                        <option value="ND">ND</option>
                        <option value="OH">OH</option>
                        <option value="OK">OK</option>
                        <option value="OR">OR</option>
                        <option value="PA">PA</option>
                        <option value="RI">RI</option>
                        <option value="SC">SC</option>
                        <option value="SD">SD</option>
                        <option value="TN">TN</option>
                        <option value="TX">TX</option>
                        <option value="UT">UT</option>
                        <option value="VT">VT</option>
                        <option value="VA">VA</option>
                        <option value="WA">WA</option>
                        <option value="WV">WV</option>
                        <option value="WI">WI</option>
                        <option value="WY">WY</option>
                      </select>
                      <input id="txtState" runat="server" class="field field-text" style="display: none;"
                                                                        maxlength="20"  type="text" />
                   
                  </div>
                  <div class="row row-field dspnone">
                    <label> <span class="req">*</span>Zip/Postal Code:</label>
                    <input id="txtZip" runat="server" class="field field-text" maxlength="12" type="text" />
                  </div>
                    <!--
                  <div  id="divCocktail" runat="server">
                   <div class="row row-indent">
                   <h1>Cocktail Reception</h1></div> 
                    <div class="row row-field">
                  <label>Will you and your party be attending the cocktail  reception? </label>
                    <select  id="selCTR" class="field field-text" runat="server">
                       <option selected="selected" value="Y">Yes</option>
                           <option  value="N">No</option>
                    </select>
                  </div></div>-->
                  <div class="rbg" runat="server"  visible="false"   id="divAdminPrice">
                    <label class="slabeln"> <span class="req1a">*&nbsp;</span>Admin Price Override:</label>
                    <input id="txtAdminPrice" runat="server" class="field field-select" maxlength="12" type="text" />
                  </div>
                </div>
                <div style="height: 10px;"> </div>
              </ItemTemplate>
              <FooterTemplate>
                <div class="row row-button">
                  <asp:Button ID="btnGoBack" CommandName="goBack" CssClass="bullet bullet-back small left" Text="Go Back"
                                                            runat="server" />
                  <asp:Button ID="btnGoNext" CssClass="bullet bullet-forward small right" Text="Next" CommandName="insertAttendee"
                                                            OnClientClick="javascript:return validate();" runat="server" />
                </div>
              </FooterTemplate>
            </asp:TemplateField>
            </Columns>
          </asp:gridview>
</div>
<br />
<div id="divAdmin" class="mrgnLf" style="float: left;" runat="server">
    <a href="BO/BoIndex.aspx">BO Home</a>&nbsp;&nbsp; |&nbsp;&nbsp;
    <asp:linkbutton id="LinkButton1" runat="server" onclick="lnkLogOut_Click">Logout</asp:linkbutton>
</div>
</form>
<%-- end page content --%>
<%-- Include Footer --%>
<% Response.WriteFile("inc.footer.aspx"); %>
