var gControlNamePrefix="ctl00$CPHPageContent$";
var gFormName = 0;
function DoValidateForm()
{
	var myindex=document.forms[0].ctl00$CPHPageContent$SelRCard_Type.selectedIndex;
	if (myindex==0)
	{
		alert("Please Select Credit Card Type");
		document.forms[0].ctl00$CPHPageContent$SelRCard_Type.focus();
		return false;
	}
	if(validateForm(gFormName))
	{
		return true;
	}

	else return false;
}
function doCopyDetails()
{
	var resID = document.getElementById("ctl00_CPHPageContent_hdnResID").value;
	if (document.forms[0].elements["ctl00_CPHPageContent_ChkOSame"].checked)
	{
		Paymentproblem.GetAttendeeDetails(resID,callbackdesc)
	}
	else
	{
		document.getElementById("ctl00_CPHPageContent_TxtRFirstName").value ="";
		document.getElementById("ctl00_CPHPageContent_TxtRLastName").value ="";
		document.getElementById("ctl00_CPHPageContent_EmlOEmailID").value ="";
		document.getElementById("ctl00_CPHPageContent_TxtRPhone").value ="";
		document.getElementById("ctl00_CPHPageContent_TxtOPhoneExt").value ="";
		document.getElementById("ctl00_CPHPageContent_TxtRAddress").value ="";
		document.getElementById("ctl00_CPHPageContent_TxtRCity").value ="";
		document.getElementById("ctl00_CPHPageContent_TxtRZip").value ="";
		document.getElementById("ctl00_CPHPageContent_SelRBilling_State").value ="AK";
	}
}
function callbackdesc(res)
{
	var strres=res.value;
	var strres_array=strres.split('*');
	document.getElementById("ctl00_CPHPageContent_TxtRFirstName").value =strres_array[0]
	document.getElementById("ctl00_CPHPageContent_TxtRLastName").value =strres_array[1]
	document.getElementById("ctl00_CPHPageContent_EmlOEmailID").value =strres_array[2]
	document.getElementById("ctl00_CPHPageContent_TxtRPhone").value =strres_array[3]
	document.getElementById("ctl00_CPHPageContent_TxtOPhoneExt").value =strres_array[4]
	document.getElementById("ctl00_CPHPageContent_TxtRAddress").value =strres_array[5]
	document.getElementById("ctl00_CPHPageContent_TxtRCity").value =strres_array[6]
	document.getElementById("ctl00_CPHPageContent_TxtRZip").value =strres_array[7]
	document.getElementById("ctl00_CPHPageContent_SelRBilling_State").value = strres_array[8]
}
function Hide()
{
	if(document.getElementById("Hide")!= null)
	{
		document.getElementById("Hide").style.display = "none"
	}
}