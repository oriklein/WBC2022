var gControlNamePrefix = "ctl00$CPHPageContent$";
var gFormName = 0;
function checkForm(MaxRadioQuestions)
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
}
function RadioQuestionAlert(ControlName)
{
	alert("'"+ControlName+"' is required");
	ControlName = "OptR"+ControlName;
	ControlName = ControlName.replace(" ","_");
	document.forms[gFormName].elements[gControlNamePrefix+ControlName][0].focus();
}