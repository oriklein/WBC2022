var FrmName=0;
var strControlName="ctl00$CPHPage_Nationwide_stydy_Content$";
function doCopyNameOnCard()
{
	if (document.forms[FrmName].elements['ctl00_CPHPage_Nationwide_stydy_Content_ChkOSameAsAbove'].checked)
	{
		var strName = document.forms[FrmName].elements[strControlName+'TxtRName'].value;
		if(strName == null) {strName=""}
			document.forms[FrmName].elements[strControlName+'TxtRNameOnCard'].value=strName;
	}
	else
	{
		document.forms[FrmName].elements[strControlName+'TxtRNameOnCard'].value="";
	}
}

function doCopyBillingAddress()
{
	if(document.forms[FrmName].elements['ctl00_CPHPage_Nationwide_stydy_Content_ChkBillingAddress'].checked)
	{
		var strAdd = document.forms[FrmName].elements[strControlName+'TxtRAddress'].value
		if(strAdd == null) {strAdd = "";}
		 	document.forms[FrmName].elements[strControlName+'TxtRBillingAddress'].value =strAdd;
		 var strCity = document.forms[FrmName].elements[strControlName+'TxtRCity'].value;
		 if(strCity == null) {strCity ="";}
		 	document.forms[FrmName].elements[strControlName+'TxtR_BillingCity'].value =strCity;
		 var strState = document.forms[FrmName].elements[strControlName+'SelR_State'].options.selectedIndex;
		  if(strState == null) {strState ="";}
		 	document.forms[FrmName].elements[strControlName+'SelRBilling_State'].options.selectedIndex =strState;
		 var strZip =document.forms[FrmName].elements[strControlName+'IntRZip'].value
		 if(strZip == null) {strZip ="";}
		 	document.forms[FrmName].elements[strControlName+'TxtR_Billing_Zip'].value = strZip;
	}
	else
	{
		document.forms[FrmName].elements[strControlName+'TxtRBillingAddress'].value="";
		document.forms[FrmName].elements[strControlName+'TxtR_BillingCity'].value="";
		document.forms[FrmName].elements[strControlName+'SelRBilling_State'].options.selectedIndex ="";
		document.forms[FrmName].elements[strControlName+'TxtR_Billing_Zip'].value ="";
	}
}