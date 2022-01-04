<%@ Page Language="C#" AutoEventWireup="true" CodeFile="updateDelegate.aspx.cs" Inherits="updateDelegate" %>

<% Response.WriteFile("inc.header2.aspx"); %>

<script type="text/javascript" language="javascript">

function echeck(str) {

		var at="@"
		var dot="."
		var lat=str.indexOf(at)
		var lstr=str.length
		var ldot=str.indexOf(dot)
		if (str.indexOf(at)==-1){
		   return false
		}

		if (str.indexOf(at)==-1 || str.indexOf(at)==0 || str.indexOf(at)==lstr){
		   return false
		}

		if (str.indexOf(dot)==-1 || str.indexOf(dot)==0 || str.indexOf(dot)==lstr){
		    return false
		}

		 if (str.indexOf(at,(lat+1))!=-1){
		    return false
		 }

		 if (str.substring(lat-1,lat)==dot || str.substring(lat+1,lat+2)==dot){
		    return false
		 }

		 if (str.indexOf(dot,(lat+2))==-1){
		    return false
		 }
		
		 if (str.indexOf(" ")!=-1){
		    return false
		 }

 		 return true					
	}
	
function IsNumeric(sText)
{
   var ValidChars = "0123456789.";
   var IsNumber=true;
   var Char;

 
   for (i = 0; i < sText.length && IsNumber == true; i++) 
      { 
      Char = sText.charAt(i); 
      if (ValidChars.indexOf(Char) == -1) 
         {
         IsNumber = false;
         }
      }
   return IsNumber;
   
}


function Updatevalidate(x)
  {
   
      var objFirstName=document.getElementById(grdFirstName_Txt[x]);
        if(objFirstName.value=="")
            {
             alert("Attendee No : "+ [parseInt(x)+1]+ " First name can not be blank");
             objFirstName.focus();
             return false;
             }
            var objLastName=document.getElementById(grdLastName_Txt[x]);
            if(objLastName.value=="")
            {
             alert("Attendee No : "+ [parseInt(x)+1]+ " Last name can not be blank");
            objLastName.focus();
            return false;
             }
             var objAttendeeType=document.getElementById(grdAttendeType_ddl[i]);
            if(objAttendeeType.options[objAttendeeType.selectedIndex].text=="-select option-")
            {
            alert("Attendee No : "+ [parseInt(x)+1]+ " Please select Attendee Type");
            objAttendeeType.focus();
            return false;
             }
             var objOrganization=document.getElementById(grdOrganization_Txt[x]);
            if(objOrganization.value=="")
            {
             alert("Attendee No : "+ [parseInt(x)+1]+ " Organization can not be blank");
            objOrganization.focus();
            return false;
             }
             var objEmail=document.getElementById(grdEmail_Txt[x]);
            if(objEmail.value=="")
            {
             alert("Attendee No : "+ [parseInt(x)+1]+ " Email can not be blank");
            objEmail.focus();
            return false;
             }
             if (echeck(objEmail.value)==false)
             {
                 alert("Attendee No : "+ [parseInt(x)+1]+ " Email-ID is incorrect.");
            objEmail.focus();
            return false;
             }
             var objPhone=document.getElementById(grdPhone_Txt[x]);
            if(objPhone.value=="")
            {
             alert("Attendee No : "+ [parseInt(x)+1]+ " Phone can not be blank");
            objPhone.focus();
            return false;
             }
            var objAddress=document.getElementById(grdAddress_Txt[x]);
            if(objAddress.value=="")
            {
             alert("Attendee No : "+ [parseInt(x)+1]+ " Address can not be blank");
            objAddress.focus();
            return false;
             }
            var objCountry=document.getElementById(grdCountry_ddl[x]);
            if(objCountry.options[objCountry.selectedIndex].text=="-Select-")
            {
             alert("Attendee No : "+ [parseInt(x)+1]+ " Select the Country");
            objCountry.focus();
            return false;
             }
            
             var objState=document.getElementById(grdState_ddl[x]);
             if(objCountry.options[objCountry.selectedIndex].text=="USA")
             {
               if(objState.options[objState.selectedIndex].text=="-Select-")
                {
                    alert("Attendee No : "+ [parseInt(x)+1]+ " Select the State");
                    objState.focus();
                     return false;
                 }
             }
              if(objCountry.options[objCountry.selectedIndex].text=="Other")
             {
               var objOtherCountry=document.getElementById(grdOtherCountry_Txt[x]);
               if(objOtherCountry.value=="Country" || objOtherCountry.value=="")
               {
               alert("Attendee No : "+[parseInt(x)+1]+"Country can not be blank");
               return false;
               }
             }
              if(objCountry.options[objCountry.selectedIndex].text=="Other")
             {
               var objOtherCountry=document.getElementById(grdOtherState_Txt[x]);
               if(objOtherCountry.value=="State" ||objOtherCountry.value=="")
               {
               alert("Attendee No : "+[parseInt(x)+1]+" State can not be blank");
               return false;
               }
             }
             var objCity=document.getElementById(grdCity_Txt[x]);
            if(objCity.value=="")
            {
             alert("Attendee No : "+ [parseInt(x)+1]+ " City can not be blank");
            objCity.focus();
            return false;
             }
             
             var objZip=document.getElementById(grdZip_Txt[x]);
            if(objZip.value=="")
            {
             alert("Attendee No : "+ [parseInt(x)+1]+ " Zip/Postal code can not be blank");
            objZip.focus();
            return false;
             }
           
            
            var checkadmin1 = '<%=checkadmin%>';           
               if (checkadmin1 == "yes")
               {
               var objgrdAdminPrice = document.getElementById(grdAdminPrice_Txt[i]);
                   if (objgrdAdminPrice.value == "")
                    {
                     alert("Attendee No : "+ [parseInt(i)+1]+ " Admin Price Override can not be blank");
                    objgrdAdminPrice.focus();
                    return false;
                    }
                    
//                    if(!IsNumeric(objgrdAdminPrice.value))
//                    {
//                     alert("Attendee No : "+ [parseInt(i)+1] + " Admin Price Override should be numeric");
//                     return false;
//                    }

                }
            
             
   return true;
    }


var ddlcountry="";
var country="";
var ddlstate="";
var state="";
function display(ddlcountry,country,ddlstate,state)
{

var dc=document.getElementById(ddlcountry);

//alert(dc.options[dc.selectedIndex].text);
if(dc.options[dc.selectedIndex].text=="Other")
{
document.getElementById(country).style.display='block';
document.getElementById(ddlstate).style.display='none';
document.getElementById(state).style.display='block';
}
else
{
document.getElementById(country).style.display='none';
document.getElementById(ddlstate).style.display='block';
document.getElementById(state).style.display='none';
}
}
var id="";
function hide(id)
{
document.getElementById(id).value="";
return false;
}




function validate()
  {
  
    for(i=0;i<grdFirstName_Txt.length;i++)
     {
      var objFirstName=document.getElementById(grdFirstName_Txt[i]);
             if(objFirstName.value=="")
               {
                alert("Attendee No : "+ [parseInt(i)+1]+ " First name can not be blank");
                objFirstName.focus();
                return false;
               }
       var objLastName=document.getElementById(grdLastName_Txt[i]);
            if(objLastName.value=="")
            {
             alert("Attendee No : "+ [parseInt(i)+1]+ " Last name can not be blank");
            objLastName.focus();
            return false;
             }
      var objAttendeeType=document.getElementById(grdAttendeType_ddl[i]);
            if(objAttendeeType.options[objAttendeeType.selectedIndex].text=="-select option-")
            {
            alert("Attendee No : "+ [parseInt(i)+1]+ " Please select Attendee Type");
            objAttendeeType.focus();
            return false;
             }
      var objOrganization=document.getElementById(grdOrganization_Txt[i]);
            if(objOrganization.value=="")
            {
             alert("Attendee No : "+ [parseInt(i)+1]+ " Organization can not be blank");
            objOrganization.focus();
            return false;
             }
      var objEmail=document.getElementById(grdEmail_Txt[i]);
            if(objEmail.value=="")
            {
             alert("Attendee No : "+ [parseInt(i)+1]+ " Email can not be blank");
            objEmail.focus();
            return false;
             }
             if (echeck(objEmail.value)==false)
             {
                 alert("Attendee No : "+ [parseInt(i)+1]+ " Email-ID is incorrect.");
            objEmail.focus();
            return false;
             }
      var objPhone=document.getElementById(grdPhone_Txt[i]);
            if(objPhone.value=="")
            {
             alert("Attendee No : "+ [parseInt(i)+1]+ " Phone can not be blank");
            objPhone.focus();
            return false;
             }
      var objAddress=document.getElementById(grdAddress_Txt[i]);
            if(objAddress.value=="")
            {
             alert("Attendee No : "+ [parseInt(i)+1]+ " Address can not be blank");
            objAddress.focus();
            return false;
             }
     var objCountry=document.getElementById(grdCountry_ddl[i]);
            if(objCountry.options[objCountry.selectedIndex].text=="-Select-")
            {
             alert("Attendee No : "+ [parseInt(i)+1]+ " Select the Country");
            objCountry.focus();
            return false;
             }
            
             
             if(objCountry.options[objCountry.selectedIndex].text=="USA")
             { 
              var objState=document.getElementById(grdState_ddl[i]);
               if(objState.options[objState.selectedIndex].text=="-Select-")
                {
                    alert("Attendee No : "+ [parseInt(i)+1]+ " Select the State");
                    objState.focus();
                     return false;
                 }
                 
             }
              var objCountry=document.getElementById(grdCountry_ddl[i]);
             
              if(objCountry.options[objCountry.selectedIndex].text=="Other")
             {
               var objOtherCountrytext=document.getElementById(grdOtherCountry_Txt[i]);
              
               if(objOtherCountrytext.value=="Country" || objOtherCountrytext.value=="")
               {
               alert("Attendee No : "+[parseInt(i)+1]+"Country can not be blank");
               return false;
               }
              
             }
              var objCountry=document.getElementById(grdCountry_ddl[i]);
              
              if(objCountry.options[objCountry.selectedIndex].text=="Other")
             {
             
               var objOtherState=document.getElementById(grdOtherState_Txt[i]);
               if(objOtherState.value=="State" ||objOtherState.value=="")
               {
               alert("Attendee No : "+[parseInt(i)+1]+" State can not be blank");
               return false;
               }
              
             }
             var objCity=document.getElementById(grdCity_Txt[i]);
            if(objCity.value=="")
            {
             alert("Attendee No : "+ [parseInt(i)+1]+ " City can not be blank");
            objCity.focus();
            return false;
             }
             
             var objZip=document.getElementById(grdZip_Txt[i]);
            if(objZip.value=="")
            {
             alert("Attendee No : "+ [parseInt(i)+1]+ " Zip/Postal code can not be blank");
            objZip.focus();
            return false;
             }
            
             var checkadmin1 = '<%=checkadmin%>';
           
               if (checkadmin1 == "yes")
               {
               var objgrdAdminPrice = document.getElementById(grdAdminPrice_Txt[i]);
                   if (objgrdAdminPrice.value == "")
                    {
                     alert("Attendee No : "+ [parseInt(i)+1]+ " Admin Price Override can not be blank");
                    objgrdAdminPrice.focus();
                    return false;
                    }
                    
//                    if(!IsNumeric(objgrdAdminPrice.value))
//                    {
//                     alert("Attendee No : "+ [parseInt(i)+1] + " Admin Price Override should be numeric");
//                     return false;
//                    }

                }
             
       }
     
   return true;
    }
     
</script>

<% Response.WriteFile("inc.header.body1.aspx"); %>
Attendee Reservation
<% Response.WriteFile("inc.header.body2.aspx"); %>
<form id="form1" class="cform" name="forattendee" runat="server">
<table width="100%" border="0" cellpadding="8">
    <tr>
        <td>
            <div id="container">
                <asp:gridview id="grdAttendee" onrowcommand="action" onrowdatabound="makeUp" cssclass="gridalign"
                    showfooter="true" borderstyle="none" runat="server" autogeneratecolumns="false">
                                        <Columns>
                                            <asp:TemplateField ItemStyle-BorderStyle="none">
                                                <HeaderStyle BorderStyle="None" />
                                                <FooterStyle BorderStyle="None" />
                                                <ItemTemplate>
                                                    <div id="mainContent">
                                                        <!-- Heading row1 -->
                                                        <div class="hdngrow1">
                                                            <span class="reqHdng1">*Required</span><span class="topPad">&nbsp;</span><h1>
                                                                <asp:Label ID="lblHeading" runat="server"></asp:Label></h1>
                                                        </div>
                                                        <!-- Fields Start From Here -->
                                                        <div class="wrappr1">
                                                            <div class="row" style="width: 400px; height: 45px; float: right; margin: 10px 46px 0px 0px;">
                                                                <asp:Button ID="btnUpdate" runat="server" CssClass="button" OnClientClick="javascript:return validate();"
                                                                    Text="Update" CommandArgument='<%# Eval("rowno") %>' CommandName="change" /></label>
                                                                <asp:Button ID="btnRemove" runat="server" CssClass="button" Text="Remove" CommandArgument='<%# Eval("rowno") %>'
                                                                    CommandName="remove" />
                                                            </div>
                                                            <div class="cl">
                                                                &nbsp;</div>
                                                            <div class="row1">
                                                                <label class="slabel1">
                                                                    <span class="req1">*</span>First Name:</label>
                                                                <input id="txtFirstName" value='<%# Eval("FirstName") %>' class=" bigfield1" runat="server"
                                                                    maxlength="30" type="text" />
                                                                <div class="cl">
                                                                    &nbsp;</div>
                                                            </div>
                                                            <div class="row1">
                                                                <label class="slabel1">
                                                                    <span class="req1">*</span>Last Name:</label>
                                                                <input id="txtLastName" value='<%# Eval("LastName") %>' class=" bigfield1" runat="server"
                                                                    maxlength="30" type="text" />
                                                                <div class="cl">
                                                                    &nbsp;</div>
                                                            </div>
                                                            <div class="row1">
                                                                <label class="slabel1">
                                                                    <span class="req1">*</span>This attendee is:</label>
                                                                <asp:DropDownList CssClass="mrgnLeft" ID="ddlAttendeType" runat="server">
                                                                    <asp:ListItem Value="0" Text="-select option-"></asp:ListItem>
                                                                    <asp:ListItem Value="IP" Text="Investment Professional"></asp:ListItem>
                                                                    <asp:ListItem Value="NIP" Text="Non-Investment Professional"></asp:ListItem>
                                                                     <asp:ListItem Value="VR" Text="Viewing Room"></asp:ListItem>
                                                                </asp:DropDownList>
                                                                <%-- <select id="ddlAttendeType" runat="server" class="midfield1" >
                <option value="0">-select option-</option>
                <option value="IP">Investment Professional</option>
                <option value="NIP">Non-Investment Professional</option> 
            </select>--%>
                                                                <div class="cl">
                                                                    &nbsp;</div>
                                                            </div>
                                                            <div class="row1">
                                                                <label class="slabel1">
                                                                    <span class="req1">*</span>Organization:</label>
                                                                <input id="txtOrganization" value='<%# Eval("Organization") %>' runat="server" class=" bigfield1"
                                                                    maxlength="30" type="text" />
                                                                <div class="cl">
                                                                    &nbsp;</div>
                                                            </div>
                                                            <div class="row1">
                                                                <label class="slabel1">
                                                                    Title:</label>
                                                                <input id="txtTitle" runat="server" value='<%# Eval("Title") %>' class=" bigfield1"
                                                                    maxlength="20" type="text" />
                                                                <div class="cl">
                                                                    &nbsp;</div>
                                                            </div>
                                                            <div class="row1">
                                                                <label class="slabel1">
                                                                    <span class="req1">*</span>Email:</label>
                                                                <input id="txtEmail" runat="server" value='<%# Eval("Email") %>' class=" bigfield1"
                                                                    maxlength="128" type="text" />
                                                                <div class="cl">
                                                                    &nbsp;</div>
                                                            </div>
                                                            <div class="row1">
                                                                <label class="slabel1">
                                                                    <span class="req1">*</span>Phone:</label>
                                                                <input id="txtPhone" runat="server" value='<%# Eval("Phone") %>' class=" midfield1"
                                                                    maxlength="15" type="text" />
                                                                <div class="cl">
                                                                    &nbsp;</div>
                                                            </div>
                                                            <div class="row1">
                                                                <label class="slabel1">
                                                                    Ext:</label>
                                                                <input id="txtExt" class=" midfield1" value='<%# Eval("Ext") %>' runat="server" maxlength="6"
                                                                    type="text" />
                                                                <div class="cl">
                                                                    &nbsp;</div>
                                                            </div>
                                                            <div class="row1">
                                                                <label class="slabel1">
                                                                    <span class="req1">*</span>Address:</label>
                                                                <input id="txtAddress" class=" bigfield1" value='<%# Eval("Address") %>' runat="server"
                                                                    maxlength="30" type="text" />
                                                                <div class="cl">
                                                                    &nbsp;</div>
                                                            </div>
                                                            <div class="row1">
                                                                <label class="slabel1">
                                                                    Address 2:</label>
                                                                <input id="txtOtherAddress" runat="server" value='<%# Eval("OtherAddress") %>' class=" bigfield1"
                                                                    maxlength="15" type="text" />
                                                                <div class="cl">
                                                                    &nbsp;</div>
                                                            </div>
                                                            <div class="row1">
                                                                <label class="slabel1">
                                                                    <span class="req1">*</span>Country:</label>
                                                                <div style="float: left;">
                                                                    <asp:DropDownList CssClass="midfield1" ID="ddlCountry" runat="server">
                                                                        <asp:ListItem Value="" Text="-Select-"></asp:ListItem>
                                                                        <asp:ListItem Value="USA" Text="USA"></asp:ListItem>
                                                                        <asp:ListItem Value="Other" Text="Other"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                    <%--<select id="ddlCountry" runat="server" class="midfield1">
                        <option selected="selected" value="">-Select-</option>
                        <option  value="USA">USA</option>
                        <option value="Other">Other</option>
                    </select>--%>
                                                                </div>
                                                                <div style="float: left; width: 80px">
                                                                    <input id="txtCountry" value='<%# Eval("OtherCountry") %>' runat="server" class="midfield1 othertext"
                                                                        maxlength="20" style="margin: 0px 0px 0px 0px; width: 30px; display: none;" type="text" />
                                                                </div>
                                                                <div class="cl">
                                                                    &nbsp;</div>
                                                            </div>
                                                            <div class="row1">
                                                                <label class="slabel1">
                                                                    <span class="req1">*</span>City:</label>
                                                                <input id="txtCity" runat="server" value='<%# Eval("City") %>' class="midfield1"
                                                                    maxlength="30" type="text" />
                                                                <div class="cl">
                                                                    &nbsp;</div>
                                                            </div>
                                                            <div class="row sprow">
                                                                <label class="slabel1">
                                                                    <span class="req1">*</span>State:</label>
                                                                <div class="selectDiv" style="float: left; margin-left: -7px">
                                                                    <asp:DropDownList CssClass="midfield1" ID="ddlState" runat="server">
                                                                        <asp:ListItem Value="" Text="Select State"></asp:ListItem>
                                                                        <asp:ListItem Value="AL" Text="AL"></asp:ListItem>
                                                                        <asp:ListItem Value="AK" Text="AK"></asp:ListItem>
                                                                        <asp:ListItem Value="AZ" Text="AZ"></asp:ListItem>
                                                                        <asp:ListItem Value="AR" Text="AR"></asp:ListItem>
                                                                        <asp:ListItem Value="CA" Text="CA"></asp:ListItem>
                                                                        <asp:ListItem Value="CO" Text="CO"></asp:ListItem>
                                                                        <asp:ListItem Value="CT" Text="CT"></asp:ListItem>
                                                                        <asp:ListItem Value="DE" Text="DE"></asp:ListItem>
                                                                        <asp:ListItem Value="FL" Text="FL"></asp:ListItem>
                                                                        <asp:ListItem Value="GA" Text="GA"></asp:ListItem>
                                                                        <asp:ListItem Value="HI" Text="HI"></asp:ListItem>
                                                                        <asp:ListItem Value="ID" Text="ID"></asp:ListItem>
                                                                        <asp:ListItem Value="IL" Text="IL"></asp:ListItem>
                                                                        <asp:ListItem Value="IN" Text="IN"></asp:ListItem>
                                                                        <asp:ListItem Value="IA" Text="IA"></asp:ListItem>
                                                                        <asp:ListItem Value="KS" Text="KS"></asp:ListItem>
                                                                        <asp:ListItem Value="KY" Text="KY"></asp:ListItem>
                                                                        <asp:ListItem Value="LA" Text="LA"></asp:ListItem>
                                                                        <asp:ListItem Value="ME" Text="ME"></asp:ListItem>
                                                                        <asp:ListItem Value="MD" Text="MD"></asp:ListItem>
                                                                        <asp:ListItem Value="MA" Text="MA"></asp:ListItem>
                                                                        <asp:ListItem Value="MI" Text="MI"></asp:ListItem>
                                                                        <asp:ListItem Value="MN" Text="MN"></asp:ListItem>
                                                                        <asp:ListItem Value="MS" Text="MS"></asp:ListItem>
                                                                        <asp:ListItem Value="MO" Text="MO"></asp:ListItem>
                                                                        <asp:ListItem Value="MT" Text="MT"></asp:ListItem>
                                                                        <asp:ListItem Value="NE" Text="NE"></asp:ListItem>
                                                                        <asp:ListItem Value="NV" Text="NV"></asp:ListItem>
                                                                        <asp:ListItem Value="NH" Text="NH"></asp:ListItem>
                                                                        <asp:ListItem Value="NJ" Text="NJ"></asp:ListItem>
                                                                        <asp:ListItem Value="NM" Text="NM"></asp:ListItem>
                                                                        <asp:ListItem Value="NY" Text="NY"></asp:ListItem>
                                                                        <asp:ListItem Value="NC" Text="NC"></asp:ListItem>
                                                                        <asp:ListItem Value="ND" Text="ND"></asp:ListItem>
                                                                        <asp:ListItem Value="OH" Text="OH"></asp:ListItem>
                                                                        <asp:ListItem Value="OK" Text="OK"></asp:ListItem>
                                                                        <asp:ListItem Value="OR" Text="OR"></asp:ListItem>
                                                                        <asp:ListItem Value="PA" Text="PA"></asp:ListItem>
                                                                        <asp:ListItem Value="RI" Text="RI"></asp:ListItem>
                                                                        <asp:ListItem Value="SC" Text="SC"></asp:ListItem>
                                                                        <asp:ListItem Value="SD" Text="SD"></asp:ListItem>
                                                                        <asp:ListItem Value="TN" Text="TN"></asp:ListItem>
                                                                        <asp:ListItem Value="TX" Text="TX"></asp:ListItem>
                                                                        <asp:ListItem Value="UT" Text="UT"></asp:ListItem>
                                                                        <asp:ListItem Value="VT" Text="VT"></asp:ListItem>
                                                                        <asp:ListItem Value="VA" Text="VA"></asp:ListItem>
                                                                        <asp:ListItem Value="WA" Text="WA"></asp:ListItem>
                                                                        <asp:ListItem Value="WV" Text="WV"></asp:ListItem>
                                                                        <asp:ListItem Value="WI" Text="WI"></asp:ListItem>
                                                                        <asp:ListItem Value="WY" Text="WY"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                    <%--<select id="ddlState" runat="server" class="midfield1" style="width: 100px;">
                        <option selected="selected" value="Select State">-Select-</option>
                        <option value="AL">AL</option>
                        <option value="AK">AK</option>
                        <option value="AZ">AZ</option>
                        <option value="AR">AR</option>
                        <option value="CA">CA</option>
                        <option value="CO">CO</option>
                        <option value="CT">CT</option>
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
                    </select>--%>
                                                                    <input id="txtState" runat="server" value='<%# Eval("OtherState") %>' class="midfield1"
                                                                        style="display: none; margin-left: -7px;" maxlength="20" type="text" />
                                                                </div>
                                                                <div class="cl">
                                                                    &nbsp;</div>
                                                            </div>
                                                            <div class="row1">
                                                                <label class="slabel1">
                                                                    <span class="req1">*</span>Zip/Postal Code:</label>
                                                                <input id="txtZip" runat="server" value='<%# Eval("Zip") %>' class=" midfield1" maxlength="12"
                                                                    type="text" />
                                                                <div class="cl">
                                                                    &nbsp;</div>
                                                            </div>
                                                            <div class="rbg" visible="false" runat="server" id="divAdminPrice">
                                                                <label class="slabeln">
                                                                    <span class="req1a">*&nbsp;</span>Admin Price Override:</label>
                                                                <input id="txtAdminPrice" value='<%# Eval("Price") %>' runat="server" class="midfield1" maxlength="12" type="text" />
                                                                <div class="cl">
                                                                    &nbsp;</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div style="height: 10px;">
                                                    </div>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <div style="width: 500px; text-align: center; height: 45px; margin: 10px 0px 0px 0px;">
                                                        <asp:Button ID="btnGoBack" CommandName="goBack" CssClass="button" Text="Go Back"
                                                            runat="server" />
                                                        <asp:Button ID="btnAdd" CssClass="button" Text="Add Attendee" CommandName="insertAttendee"
                                                            runat="server" />
                                                        <asp:Button ID="btnFinished" CssClass="button" Text="IM Finished" CommandName="Finished"
                                                            OnClientClick="javascript:return validate();" runat="server" />
                                                    </div>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:gridview>
            </div>
            <br />
            <br />
            <br />
            <br />
        </td>
    </tr>
</table>
</form>
<% Response.WriteFile("inc.footer.aspx"); %>