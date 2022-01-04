var gControlNamePrefix = "ctl00$CPHPageContent$";
var gFormName = 0;

function checkMendorDetails()
{
	if(validateForm(gFormName))
	{
		if(_q2RadioBtnChk())
		{
			if(_q3RadioBtnChk())
			{
				if(_q4SelectBoxChk())				
				{
					if(_q5CheckBoxChk())
					{
						if(_q6TextBoxVal())
						{
							return true;
						}
						else return false;	
					}
					else return false;
				}
				else return false;
			}
			else return false;
		}
		else return false;
		return true;
	}
	else return false;
}

function _q2RadioBtnChk()
{
	var Q2BoolStatus = false;
	var getRadioVal = document.forms[0].ctl00$CPHPageContent$OptRQuestion_2;
	for(var J=0;J<getRadioVal.length;J++)
	{
		if(J<5)
		{
			if(getRadioVal[J].checked) Q2BoolStatus = true;
		}
		else
		{
			if(getRadioVal[J].checked)
			{
				var TmpControl = document.forms[gFormName].elements["ctl00$CPHPageContent$TxtOQuestion_2"];

				if(TmpControl.value == "")
				{
					alert("Other Question-2 is required !");
					TmpControl.focus();
					Q2BoolStatus = false;
					return false;
				}				
				else
				{
					Q2BoolStatus = true;
					return true;
				}		
			}	
		}
	}
	
	if (Q2BoolStatus){ return true;}
	else {alert("Question 2 is required !"); return false;}
}

function _q3RadioBtnChk()
{
	var Q3BoolStatus = false;
	var getRadioVal = document.forms[0].ctl00$CPHPageContent$OptRQuestion_3;
	for(var J=0;J<getRadioVal.length;J++)
	{
		if(J<6)
		{
			if(getRadioVal[J].checked) Q3BoolStatus = true;
		}
		else
		{
			if(getRadioVal[J].checked)
			{
				var TmpControl = document.forms[gFormName].elements["ctl00$CPHPageContent$TxtOQuestion_3"];

				if(TmpControl.value == "")
				{
					alert("Other Question-3 is required !");
					TmpControl.focus();
					Q3BoolStatus = false;
					return false;
				}				
				else
				{
					Q3BoolStatus = true;
					return true;
				}		
			}	
		}
	}
	if (Q3BoolStatus) return true;
	else {alert("Question 3 is required !"); return false;}
}

function _q4SelectBoxChk()
{
	var strQ4Select = document.forms[0].ctl00$CPHPageContent$SelOQuestion_4.selectedIndex;
	if(strQ4Select == 0)
	{
		alert("Question 4 is required!");
		document.forms[0].ctl00$CPHPageContent$SelOQuestion_4.focus();
		return false;
	}
	else return true;
}

function _q5CheckBoxChk()
{
	var frmValue = document.getElementsByTagName("input");
	var flgChkStatus=false;

	for(J=0; J<frmValue.length; J++)
	{
		var e = frmValue[J];
		if((e.type =="checkbox") && (e.id.indexOf("ctl00_CPHPageContent_ChkOQuestion_5_")>=0))
		{
			if(e.checked)
			{
				flgChkStatus = true;
			}
		}
	}

	/*if(document.forms[0].ctl00$CPHPageContent$TxtOQuestion_5.value)
	{
		document.forms[0].ctl00$CPHPageContent$ChkOQuestion_5$10.checked = true;
		flgChkStatus = true;
	}*/

	if(!flgChkStatus)
	{
		alert("Question 5 is required !");
		return false;
	}
	else return true;
}

function _q6TextBoxVal()
{	
	var strQ6Select = document.forms[0].ctl00$CPHPageContent$Txt0Question_6;
	if(strQ6Select.value == "")
	{
		alert("Question 6 is required !");
		strQ6Select.focus();
		return false;
	}
	else return true;
}	

function _q7RadioBtnChk()
{
	var Q7BoolStatus = false;	
	var getRadioVal = document.forms[0].ctl00$CPHPageContent$OptRQuestion_7;	
	for(var J =0; J<getRadioVal.length;J++)
	{
		if(getRadioVal[J].checked){Q7BoolStatus = true};
	}	
	if (Q7BoolStatus){return true;}
	else {alert("Question 7 is required !"); return false;}
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
		var TmpControl = document.forms[gFormName].elements["ctl00_CPHPageContent_ChkRQuestion_5_"+i];
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
		ControlName = ControlName.replace("$0", "");
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
		TmpControl = document.forms[gFormName].elements[gControlNamePrefix+"Txt0Question_6"];
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
		alert("'"+ControlName+"' exceeds the maximum length "+MaxTextLength);
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

function CheckMinCommitment()
{
	document.getElementById("ctl00_CPHPageContent_OptRQuestion_7_0").checked =true;
	alert("A minimum commitment of one hour per month is required");	
	return false;
}

function OrganizationsRol()
{
	var optLength = document.forms[0].ctl00$CPHPageContent$OptRQuestion_2.length;
	var setFlag = false;
	for(J=0; J<optLength;J++)
	{
		if(document.forms[0].elements["ctl00_CPHPageContent_OptRQuestion_2_"+J].checked)
			setFlag = true;
		else
			setFlag = false;
	}

	if(setFlag)
	{
		document.getElementById('OptRQuestion2Other').style.display="block";
		document.forms[0].ctl00$CPHPageContent$TxtOQuestion_2.focus();
	}
	else
	{
		document.getElementById('OptRQuestion2Other').style.display="none";
	}
}

function OrganizationMission()
{
	var optLength = document.forms[0].ctl00$CPHPageContent$OptRQuestion_3.length;
	var setFlag = false;
	for(J=0; J<optLength;J++)
	{
		if(document.forms[0].elements["ctl00_CPHPageContent_OptRQuestion_3_"+J].checked)
			setFlag = true;
		else
			setFlag = false;
	}

	if(setFlag)
	{
		document.getElementById('OptRQuestion3Other').style.display="block";
		document.forms[0].ctl00$CPHPageContent$TxtOQuestion_3.focus();
	}
	else
	{
		document.getElementById('OptRQuestion3Other').style.display="none";
	}
}