/*
Developer : Senthil kumar.L
Project : Center for Nonprofit Success
Date : May - 23th - 2007
Address : Ivor Heyman,3307 19th Street NW, Suite A4,Washington, DC 20010
//-->
*/

//window.history.go(+1);

function chkSelectedSeminar(countVal)
{
	var checkboxname;
	var countChecked = 0;
	var minVal=1;

	for(var J=0; J<countVal;J++)
	{
		var TmpControl = document.forms[0].elements["ctl00$CPHPageContent$CHK"+J];
		if(TmpControl.checked)
		{
			countChecked++;
		}
	}

	if(countChecked < minVal)
	{
		alert("Please you must fill out at least 1 seminar");
		return false;
	}
}

function validatecheckbox()
{
	//var frmValue =document.getElementById("aspnetForm");
	var frmValue = document.getElementsByTagName("img");
	var flgChkStatus=false;

	for(J=0; J<frmValue.length; J++)
	{
		var e = frmValue[J];
		if(e.id.indexOf("imgBtnGreenSeminar")>=0)
		{
			//alert(e.src);
			if(e.style.display == "block")
			{
				flgChkStatus = true;
			}
		}
	}

	if(!flgChkStatus)
	{
		alert("You must select at least one seminar to check out.");
		return false;
	}
}

var objOldTime=new String();

function RedSelectedSeminar(valSeminID,valSeminarTime)
{
	var strBeginTime="";
	var strSearchChar ="";
	var setFlagStatus = false;

	if(objOldTime != ""){strBeginTime = objOldTime;}

	for(var z=0; z<valSeminarTime.length;z++)
	{
		valSeminarTime = valSeminarTime.replace(" ","");
	}
	valSeminarTime = valSeminarTime.toLowerCase();

	if(strBeginTime !="")
	{
		strSearchChar = "'"+valSeminarTime+"'";
		var temp = new Array();
		temp = strBeginTime.split(',');
		for(var x=1;x<temp.length;x++)
		{
			if(temp[x] == strSearchChar)
			{
				setFlagStatus = true;
				alert(" Sorry ! \n User can't select seminar's having same timings");
			}
		}
	}

	if(setFlagStatus)
	{
		document.getElementById("imgBtnRedSeminar_"+valSeminID).style.display="block";
		document.getElementById("imgBtnGreenSeminar_"+valSeminID).style.display="none";
	}
	else
	{
		objOldTime = objOldTime+",'"+valSeminarTime+"'";
		//alert(objOldTime);
		document.getElementById("imgBtnRedSeminar_"+valSeminID).style.display="none";
		document.getElementById("imgBtnGreenSeminar_"+valSeminID).style.display="block";
		SeminarInformation.StoreSession(valSeminID,'Yes',CB);
	}
}

function GreenSelectedSeminar(valSeminID,valSeminarTime)
{
	for(var z=0; z<valSeminarTime.length;z++)
	{
		valSeminarTime = valSeminarTime.replace(" ","");
	}
	valSeminarTime = valSeminarTime.toLowerCase();

	valRepSemTime = ",'"+valSeminarTime+"'";
	objOldTime = objOldTime.replace(valRepSemTime,'');
	//alert(objOldTime)

	document.getElementById("imgBtnGreenSeminar_"+valSeminID).style.display="none";
	document.getElementById("imgBtnRedSeminar_"+valSeminID).style.display="block";
	SeminarInformation.StoreSession(valSeminID,'No',CB);
}

function CB(res)
{
	//alert(res.value);
}

function clickOverView(myVal)
{
	var frmValue = document.getElementsByTagName("table");
	var frmColor = document.getElementsByTagName("A");

	for(RGP=0; RGP<frmColor.length; RGP++)
	{
		var RGPColor = frmColor[RGP];

		if(RGPColor.id.indexOf("overviewColorChange_")>=0)
		{
			RGPColor.style.color ="#6392E7";
			document.getElementById("overviewColorChange_"+myVal).style.color='black';
		}
	}

	for(J=0; J<frmValue.length; J++)
	{
		var  e= frmValue[J];
		if(e.id.indexOf("EventAndSummitChildDes_")>=0)
		{
			flgChkStatus = true;
			e.style.display='none';
			document.getElementById("EventAndSummitChildDes_"+myVal).style.display='block'
		}
	}
}

function clickDisableItems(chkVal)
{


	//var frmValue = document.getElementById("EventAndSummitChildDes_");
	//var frmValue =document.getElementById("aspnetForm");
	var frmValue = document.getElementsByTagName("table");
	var frmColor = document.getElementsByTagName("A");
	var flgChkStatus=false;

	for(RGP=0; RGP<frmColor.length; RGP++)
	{
		var RGPColor = frmColor[RGP];

		if(RGPColor.id.indexOf("overviewColorChange_")>=0)
		{
			RGPColor.style.color ="#6392E7";
			document.getElementById("overviewColorChange_"+chkVal).style.color='black';
		}
	}

	for(J=0; J<frmValue.length; J++)
	{
		var  e= frmValue[J];
		if(e.id.indexOf("EventAndSummitChildDes_")>=0)
		{
			flgChkStatus = true;
			e.style.display='none';
			document.getElementById("EventAndSummitChildDes_"+chkVal).style.display='block';
		}
	}
}

function clickOverViewRegister(myVal,RId)
{
	var frmValue = document.getElementsByTagName("table");
	var frmColor = document.getElementsByTagName("A");

	for(RGP=0; RGP<frmColor.length; RGP++)
	{
		var RGPColor = frmColor[RGP];

		if(RGPColor.id.indexOf("overviewColorChange_")>=0)
		{
			RGPColor.style.color ="#6392E7";
			document.getElementById("overviewColorChange_"+myVal).style.color='black';
		}
	}

	for(J=0; J<frmValue.length; J++)
	{
		var  e= frmValue[J];
		if(e.id.indexOf("EventAndSummitChildDes_")>=0)
		{
			flgChkStatus = true;
			e.style.display='none';
			document.getElementById("EventAndSummitChildDes_"+myVal).style.display='block';
		}
	}

	document.frmpayRegisterLink.evatt_num.value ="1";
	document.frmpayRegisterLink.events.value=RId;
	document.frmpayRegisterLink.submit();
}