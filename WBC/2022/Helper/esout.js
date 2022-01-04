function calculateAmt(noOfPerson,seminarAmt)
{
	if(noOfPerson >0)
	{
		HdnAmt= document.forms[0].ctl00$CPHPageContent$hdnoTotalVal.value;
		var intTotlaAmount = (parseFloat(noOfPerson)*parseFloat(HdnAmt));
		intTotlaAmount = formatCurrency(intTotlaAmount);
		document.forms[0].ctl00$CPHPageContent$TxtOTotalAmount.value =intTotlaAmount;
		//alert(document.forms[0].ctl00$CPHPageContent$TxtOTotalAmount.value);
	}
	else
	{
		alert("There must be atleast one attendee");
		document.forms[0].ctl00$CPHPageContent$TxtONoOfPerson.value =1;
		document.forms[0].ctl00$CPHPageContent$TxtONoOfPerson.focus();
	}
}

function formatCurrency(num)
{
	num = num.toString().replace(/\$|\,/g,'');
	if(isNaN(num))
		num = "0";
	
	sign = (num == (num = Math.abs(num)));
	num = Math.floor(num*100+0.50000000001);
	cents = num%100;
	num = Math.floor(num/100).toString();

	if(cents<10)
		cents = "0" + cents;

	for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)
		num = num.substring(0,num.length-(4*i+3))+','+
		num.substring(num.length-(4*i+3));
		return (((sign)?'':'-') + '$' + num + '.' + cents);
}

function ChkBoxSingleClick(ChkStatus,Counter)
{
	var setFlags= false;
	var steId = ChkStatus.value;
	if(ChkStatus.checked)
	{
		setFlags = true;
	}

	if(setFlags)
	{
		clsSummitcheckout.StoreSession(steId,'exVal',CallBackMethod);
	}
	else
	{
		clsSummitcheckout.RemoveSession(steId,'exVal',CallBackMethod);
	}
}

function CallBackMethod(mySes)
{
	//alert(mySes.value);
}

/*
function ChkBoxAllClick(setStatus,counter)
{
	var setFlags =false;
	if(setStatus.checked)
	{
		setFlags = true;
	}

	for(J=1;J<=counter;J++)
	{
		if(setFlags)
		{
			document.aspnetForm.elements["chkSelect_"+[J]].checked = true;
			var setSeminarId = document.aspnetForm.elements["chkSelect_"+[J]].value;
			getseminarIds(setSeminarId);
		}
		else
		{
			document.aspnetForm.elements["chkSelect_"+[J]].checked = false;
			var setSeminarId = document.aspnetForm.elements["chkSelect_"+[J]].value;
			removeseminarIds(setSeminarId);
		}
	}
}
*/

function ChkBoxAllClick(setStatus,counter)
{
	var setFlags =false;
	if(setStatus.checked)
	{
		setFlags = true;
	}

	/*var frmValue = document.getElementsByTagName("input");
	var flgChkStatus=false;

	for(J=0; J<frmValue.length; J++)
	{
		var e = frmValue[J];
		if((e.type =="checkbox") && (e.id.indexOf("chkSelect_")>=0))
		{
			e.checked =setStatus.checked;
		}
	}
	*/

	for(J=1;J<=counter;J++)
	{
		if(setFlags)
		{
			document.aspnetForm.elements["chkSelect_"+[J]].checked = true;
			var setSeminarId = document.aspnetForm.elements["chkSelect_"+[J]].value;
			getseminarIds(setSeminarId);
		}
		else
		{
			document.aspnetForm.elements["chkSelect_"+[J]].checked = false;
			var setSeminarId = document.aspnetForm.elements["chkSelect_"+[J]].value;
			removeseminarIds(setSeminarId);
		}
	}
}

function getseminarIds(chkVal)
{
	clsSummitcheckout.StoreSession(chkVal,'AAll',CallBackMethod);
}

function removeseminarIds(chkVal)
{
	clsSummitcheckout.RemoveSession(chkVal,'RAll',CallBackMethod);
}

/*
function deleteSeminars()
{
	var frmValue=document.getElementById("aspnetForm");
	for(S=0;S<frmValue.elements.length;S++)
	{
		var eMt=frmValue.elements[S];
		if((eMt.type=="checkbox") && (eMt.id.indexOf("chkSelect_")>=0))
		{
			var setFlags =eMt.checked;
		}
	}

	if(setFlags == false)
	{
		alert('Atleast one seminar name should be selected.');
		return false;
	}
}
*/

function deleteSeminars()
{
	var frmValue = document.getElementsByTagName("input");
	var flgChkStatus=false;

	for(J=0; J<frmValue.length; J++)
	{
		var e = frmValue[J];
		if((e.type =="checkbox") && (e.id.indexOf("chkSelect_")>=0))
		{
			if(e.checked)
			{
				flgChkStatus = true;
			}
		}
	}

	if(!flgChkStatus)
	{
		alert('Atleast one seminar name should be selected.');
		return false;
	}
}

function RedSelectedSeminar(valSeminID,valSeminarTime,valSeminarDate,ClickAmt)
{
	var strBeginDateAndTime = "";
	var strSearchDate ="";
	var strSearchTime = "";
	setFlagDateAndTime = false;

	if(objDateAndTime !="") {strBeginDateAndTime = objDateAndTime;}

	for(var z=0; z<valSeminarTime.length;z++)
	{
		valSeminarTime = valSeminarTime.replace(" ","");
	}
	valSeminarTime = valSeminarTime.toLowerCase();
	
	if(strBeginDateAndTime !="")
	{
		strSearchDate = valSeminarDate;
		strSearchTime = valSeminarTime;
		var temDateAndTime = new Array();
		var tempDateAndTimeSplit = new Array();
		var finalCompareDate = new Array();
		var tempPreviousTime = new Array();
		var serachCurrentTime = new Array();
		temDateAndTime = strBeginDateAndTime.split(',');

		for(var z=1;z<temDateAndTime.length;z++)
		{
			tempDateAndTimeSplit = temDateAndTime[z].split('~');
			finalCompareDate = tempDateAndTimeSplit[0].replace("'","");
			
			if(finalCompareDate.trim() == strSearchDate.trim())
			{	
				tempPreviousTime = tempDateAndTimeSplit[1].replace("'","");
				tempPreviousTime = tempPreviousTime.split("-");
				serachCurrentTime = strSearchTime.split("-");

				if(!CompareTime(convertTime(tempPreviousTime[0].trim()),convertTime(tempPreviousTime[1].trim()),convertTime(serachCurrentTime[0].trim()),convertTime(serachCurrentTime[1].trim())))
				{
					setFlagDateAndTime = true;
					//alert(setFlagDateAndTime);
				}
			}
		}
	}

	if(setFlagDateAndTime)
	{
		alert("You are trying to register for two seminars taking place at the same time.\n Please select only one seminar for each time slot");
		return false;
	}
	else
	{
		objDateAndTime = objDateAndTime+",'"+valSeminarDate+"~"+valSeminarTime+"'";
		var HdnAmt =0;
		var noEvent =0;
		noEvent = document.forms[0].ctl00$CPHPageContent$TxtONoOfEvents.value;
		noEvent = (parseFloat(noEvent) +1);
		document.forms[0].ctl00$CPHPageContent$TxtONoOfEvents.value=noEvent;
		document.getElementById("imgBtnGreenSeminar_"+valSeminID).style.display="block";
		document.getElementById("imgBtnRedSeminar_"+valSeminID).style.display="none";

		// seminar calculation code
		HdnAmt= document.forms[0].ctl00$CPHPageContent$hdnoTotalVal.value;
		HdnAmt = (parseFloat(HdnAmt) + parseFloat(ClickAmt));
		document.forms[0].ctl00$CPHPageContent$hdnoTotalVal.value =HdnAmt;
		document.forms[0].ctl00$CPHPageContent$TxtOTotalAmount.value =formatCurrency(HdnAmt);

		clsSummitcheckout.StoreSession(objDateAndTime,valSeminID,'Yes',CB);
	}
}

function GreenSelectedSeminar(valSeminID,valSeminarTime,valSeminarDate,ClickAmt)
{
	var valRepSemDateAndTime = "";
	for(var z=0; z<valSeminarTime.length;z++)
	{
		valSeminarTime = valSeminarTime.replace(" ","");
	}
	valSeminarTime = valSeminarTime.toLowerCase();
	valRepSemDateAndTime =  ",'"+valSeminarDate+"~"+valSeminarTime+"'";
	objDateAndTime = objDateAndTime.replace(valRepSemDateAndTime,'');

	var HdnAmt =0;
	var noEvent =0;
	noEvent = document.forms[0].ctl00$CPHPageContent$TxtONoOfEvents.value;
	noEvent = (parseFloat(noEvent) -1);
	document.forms[0].ctl00$CPHPageContent$TxtONoOfEvents.value=noEvent;
	document.getElementById("imgBtnGreenSeminar_"+valSeminID).style.display="none";
	document.getElementById("imgBtnRedSeminar_"+valSeminID).style.display="block";

	// seminar calculation code
	HdnAmt= document.forms[0].ctl00$CPHPageContent$hdnoTotalVal.value;
	HdnAmt = (parseFloat(HdnAmt) - parseFloat(ClickAmt));
	document.forms[0].ctl00$CPHPageContent$hdnoTotalVal.value =HdnAmt;
	document.forms[0].ctl00$CPHPageContent$TxtOTotalAmount.value =formatCurrency(HdnAmt);

	clsSummitcheckout.RemoveSession(objDateAndTime,valSeminID,'No',CB);
}

function CB(res)
{
	//alert(res.value);
}

function CompareTime(PrevStartTime,PrevEndTime,CurrStartTime,CurrEndTime)
{
	if((CurrStartTime == PrevStartTime  && CurrEndTime == PrevEndTime) || (CurrStartTime == PrevStartTime) || (CurrEndTime == PrevEndTime))
	{
		return false;
	}
	else if(CurrStartTime > PrevStartTime && CurrStartTime < PrevEndTime)
	{
		return false;
	}
	else if (CurrEndTime > PrevStartTime && CurrEndTime < PrevEndTime)
	{
		return false;
	}
	else if (PrevStartTime > CurrStartTime && PrevEndTime < CurrEndTime)
	{
		return false;
	}
	else
	{
		return true;
	}	
}

function convertTime(time)
{
	time=time.replace(' ','');

	if(time.indexOf('am') == 4 || time.indexOf('am') == 5 || time.indexOf('am') == 6)
	{
		time = time.replace('am','');
		if(time.indexOf('12') == 0)
		{
			time=time.replace(':','');
			newtime=time.replace('12','00');
		}
		else
		{
			newtime= parseFloat(time.replace(':','.'))*100
		}

	}

	if(time.indexOf('pm') == 4 || time.indexOf('pm') == 5)
	{
		time = time.replace('pm','')
		time=time.replace(':','.')

		if(time.indexOf('12') != 0)
		{
			newtime= (parseFloat(time)*100)+1200
		}
		else
		{
			newtime= parseFloat(time)*100
		}
	}
	return newtime;
}


function validatecheckbox()
{
	var frmValue = document.getElementsByTagName("img");
	var flgChkStatus=false;

	for(J=0; J<frmValue.length; J++)
	{
		var e = frmValue[J];
		if(e.id.indexOf("imgBtnGreenSeminar")>=0)
		{
			if(e.style.display == "block")
			{
				flgChkStatus = true;
			}
		}
	}

	if(!flgChkStatus)
	{
		alert("You must select at least one seminar to buy.");
		return false;
	}
}