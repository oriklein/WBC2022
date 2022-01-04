var gControlNamePrefix="ctl00$CPHPage_Nationwide_stydy_Content$";
var gFormName = 0;
function checkCaseStudySubmit()
{
	if(validateForm(gFormName))
	{
		if(checkFreeFlowTextLength())
		{
			var myindex=document.forms[0].ctl00$CPHPage_Nationwide_stydy_Content$SelRCaseStudyCategory.selectedIndex;
			if (myindex==0)
			{
				alert("\nYou must make a selection from the case study category.");
				document.forms[0].ctl00$CPHPage_Nationwide_stydy_Content$SelRCaseStudyCategory.focus();
				return false;
			}
		}
		else return false;
	}
	else return false;
}

function checkFreeFlowTextLength()
{
	var TmpControl = document.forms[gFormName].elements[gControlNamePrefix+"TxtRBackground"];
	if(checkTextLength(1200, TmpControl, "Background"))
	{
		TmpControl = document.forms[gFormName].elements[gControlNamePrefix+"TxtRChallenge"];
		if(checkTextLength(1500, TmpControl, "Challenge"))
		{
			TmpControl = document.forms[gFormName].elements[gControlNamePrefix+"TxtRSolution"];
			if(checkTextLength(1200, TmpControl, "Solution"))
			{
				TmpControl = document.forms[gFormName].elements[gControlNamePrefix+"TxtRLessonsLearned"];
				return checkTextLength(1200, TmpControl, "Lessons Learned");
			}
			else return false;
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
