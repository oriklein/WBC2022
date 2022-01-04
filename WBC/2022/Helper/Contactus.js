var gControlNamePrefix = "ctl00$CPHPageContent$";
var gFormName = 0;
function checkForm()
{
	if(validateForm(gFormName)) return true;
	else return false;
}