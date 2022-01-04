 var gControlNamePrefix = "ctl00$CPHPageContent$";
 var gFormName = 0;
 function checkMendorDetails()
 {
 	for(i=1; i<=7;i++)
 	{
 		if(i==2 || i==3 || i==7)
 		{
 			if(getCheckOrRadioValue("radio", gControlNamePrefix+"OptRQuestion_"+i, gFormName) == "")
 			{
 				RadioQuestionAlert("Question "+i);
 				return false;
 			}
 		}
 	}
 	if(validateForm(gFormName))
 	{
 		if(checkOthers("OptR", "Question_2", "radio", "Other"))
 		{
 			if(checkOthers("OptR", "Question_3", "radio", "Other"))
 			{
 				var tmpQ5 = isQuestion5Selected();
 				if(tmpQ5 > -1 )
 				{
 					if(checkFreeFlowTextLength(tmpQ5)) return true;
 					else return false;
 				}
 				else
 				{
 					alert("Question 5 is required!");
 					return false;
 				}
 			}
 			else return false;
 		}
 		else return false;
 		return true;
 	}
 	else return false;
 }
 
 function checkOthers(ControlPrefix, ControlName, ControlType, CheckValue)
 {
 
 	if(getCheckOrRadioValue(ControlType, gControlNamePrefix+ControlPrefix+ControlName, gFormName) == CheckValue)
 	{
 		if(!checkTextBoxValue(ControlName)) return false;
 	}
 	return true;
 }
 
 function isQuestion5Selected()
 {
 	var Tmpindex = -1;
 
 	for(i=0;i<11;i++)
 	{
 		var TmpControl = document.forms[gFormName].elements[gControlNamePrefix+"ChkRQuestion_5$"+i];
 		if(TmpControl.checked)
 		{
 			Tmpindex = i;
 		}
 	}
 	return Tmpindex;
 }
 
 function checkTextBoxValue(ControlName)
 {
 	var TmpControl = document.forms[gFormName].elements[gControlNamePrefix+"TxtO"+ControlName];
 
 	if(TmpControl.value == "")
 	{
 		ControlName = ControlName.replace("_", " ");
 		alert("'"+ControlName+"' is Required!");
 		TmpControl.focus();
 		return false;
 	}
 	else
 	{
 		if(!isText(TmpControl.value))
 		{
 			return false;
 		}
 	}
 	return true;
 }
 
 function checkFreeFlowTextLength(tmpQ5)
 {
 	var TmpControl = document.forms[gFormName].elements[gControlNamePrefix+"TxtRQuestion_1"];
 	if(checkTextLength(300, TmpControl, "Question 1"))
 	{
 		TmpControl = document.forms[gFormName].elements[gControlNamePrefix+"TxtRQuestion_6"];
 		if(checkTextLength(300, TmpControl, "Question 6"))
 		{
 			if(tmpQ5 == 10)
 			{
 				if(checkTextBoxValue("Question_5"))
 				{
 					TmpControl = document.forms[gFormName].elements[gControlNamePrefix+"TxtOQuestion_5"];
 					return checkTextLength(300, TmpControl, "Question 5");
 				}
 				else return false;
 			}
 			return true;
 		}
 		else return false;
 	}
 	else return false;
 }
 function checkTextLength(MaxTextLength, TmpControl, ControlName)
 {
 	if(TmpControl.value.length > MaxTextLength)
 	{
 		alert("'"+ControlName+"' excedes the maximum length "+MaxTextLength);
 		TmpControl.focus();
 		return false;
 	}
 	else return true;
 }
 function RadioQuestionAlert(ControlName)
 {
 	alert("'"+ControlName+"' is required");
 	ControlName = "OptR"+ControlName;
 	ControlName = ControlName.replace(" ","_");
 	document.forms[gFormName].elements[gControlNamePrefix+ControlName][0].focus();
}