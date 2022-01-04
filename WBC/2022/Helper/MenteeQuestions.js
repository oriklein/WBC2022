var gControlNamePrefix = "ctl00$CPHPageContent$";
var gFormName = 0;

function MentorMoreInformationYes()
{
	document.getElementById('MoreMentorDetailEmailID').style.display="block";
}

function MentorMoreInformationNo()
{
	document.getElementById('MoreMentorDetailEmailID').style.display="none";
}

function MentorMoreInformationPerhaps()
{
	document.getElementById('MoreMentorDetailEmailID').style.display="block";
}

function RoleOrganizationOther()
{
	var optLength = document.forms[0].ctl00$CPHPageContent$OptRQuestion_1.length;
	var setFlag = false;
	for(J=0; J<optLength;J++)
	{
		if(document.forms[0].elements["ctl00_CPHPageContent_OptRQuestion_1_"+J].checked)
			setFlag = true;
		else
			setFlag = false;
	}

	if(setFlag)
	{
		document.getElementById('OptRQuestion1Other').style.display="block";
		document.forms[0].ctl00$CPHPageContent$TxtOQuestion_1.focus();
	}
	else
	{
		document.getElementById('OptRQuestion1Other').style.display="none";
	}
}

function OrganizationsMission()
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

function RoleNonProfit()
{
	var optLength = document.forms[0].ctl00$CPHPageContent$OptRQuestion_4.length;
	var setFlag = false;
	for(J=0; J<optLength;J++)
	{
		if(document.forms[0].elements["ctl00_CPHPageContent_OptRQuestion_4_"+J].checked)
			setFlag = true;
		else
			setFlag = false;
	}

	if(setFlag)
	{
		document.getElementById('OptRQuestion4Other').style.display="block";
		document.forms[0].ctl00$CPHPageContent$TxtOQuestion_4.focus();
	}
	else
	{
		document.getElementById('OptRQuestion4Other').style.display="none";
	}
}


function checkMenteeDetails()
{
	for(i=1; i<=10;i++)
	{
		if(i<=2 || i==4 || i==6 || i==10)
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
		if(checkOthers("OptR", "Question_1", "radio", "Other"))
		{
			if(checkOthers("OptR", "Question_2", "radio", "Other"))
			{
				if(checkOthers("OptR", "Question_4", "radio", "Other"))
				{
					if(checkFreeFlowTextLength())
					{
						if(checkMoreDetailsEmails()) return true;
						return false;
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

function checkOthers(ControlPrefix, ControlName, ControlType, CheckValue)
{

	if(getCheckOrRadioValue(ControlType, gControlNamePrefix+ControlPrefix+ControlName, gFormName) == CheckValue)
	{
		if(!checkTextBoxValue(ControlName)) return false;
	}
	return true;
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

function checkFreeFlowTextLength()
{
	var TmpControl = document.forms[gFormName].elements[gControlNamePrefix+"TxtRQuestion_7"];
	if(checkTextLength(300, TmpControl, "Question 7"))
	{
		TmpControl = document.forms[gFormName].elements[gControlNamePrefix+"TxtRQuestion_8"];
		return (checkTextLength(300, TmpControl, "Question 8"))
		/*{
			TmpControl = document.forms[gFormName].elements[gControlNamePrefix+"TxtRQuestion_9"];
			return checkTextLength(300, TmpControl, "Question 9");
		}
		else return false;*/
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

/*function checkForm(MaxRadioQuestions)
{
	for(i=1; i<=MaxRadioQuestions;i++)
	{
		if(getCheckOrRadioValue("radio", gControlNamePrefix+"OptRQuestion_"+i, gFormName) == "")
		{
			RadioQuestionAlert("Question "+i);
			return false;
		}
	}
	if(validateForm(gFormName))
	{
		return true;
	}
	else return false;
}*/

function RadioQuestionAlert(ControlName)
{
	alert("'"+ControlName+"' is required");
	ControlName = "OptR"+ControlName;
	ControlName = ControlName.replace(" ","_");
	document.forms[gFormName].elements[gControlNamePrefix+ControlName][0].focus();
}

function checkMoreDetailsEmails()
{
	var TmpControl = document.forms["0"].elements["ctl00_CPHPageContent_OptRQuestion_10_0"];
	var TmpControlPerhaps = document.forms["0"].elements["ctl00_CPHPageContent_OptRQuestion_10_2"];
	var TmpControlNo =document.forms["0"].elements["ctl00_CPHPageContent_OptRQuestion_10_1"];
	var TxtEmail = document.forms["0"].elements["ctl00_CPHPageContent_EmailMoreMentorInformation"].value;
	if((TmpControl.checked) || (TmpControlPerhaps.checked))
	{
		if (!CheckEMail(TxtEmail))
		{
			document.getElementById('MoreMentorDetailEmailID').style.display="block";
			if(TxtEmail == "")
				alert("We need your email address in order to send\nyou more information about being a mentor");
			else
				alert("Invalid E-mail Id");
			document.forms["0"].elements["ctl00_CPHPageContent_EmailMoreMentorInformation"].focus();
			return false;
		}
		else return true;
	}
	
	if(TmpControlNo.checked) return true;	
}

function CheckEMail(strVal){


	var validStr='0123456789-abcdefghijklmnopqrstuvwxyz_@.ABCDEFGHIJKLMNOPQRSTUVWXYZ';
	var temp;
        var fieldVal;
	for (var i=0; i<strVal.length; i++) {
		temp =  strVal.substring(i, i+1);
		if (validStr.indexOf(temp) == -1)  return false ;
	}

        
        fieldVal = strVal;
	if(fieldVal.indexOf('@')!=fieldVal.lastIndexOf('@'))  return false ;
     
              
        if (fieldVal.indexOf("@") <= 1 
            || fieldVal.indexOf(".") < 1 
            || fieldVal.length<6)
        {              
            return false;
        }
        
	var IntDiff=fieldVal.indexOf(".")-fieldVal.indexOf("@");
	if(IntDiff==1) return false;     

	if ((fieldVal.indexOf(".")-fieldVal.lastIndexOf("."))==-1) return false;

	if ((fieldVal.indexOf("@")-fieldVal.lastIndexOf("@"))!=0) return false;
   
	if(fieldVal.length-(fieldVal.indexOf(".")+1)<=1) return false ;
        return true;
   }