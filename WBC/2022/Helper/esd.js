function hide(myVal)
{
//alert(document.getElementById("ctl00_CPHPageContent_PnlUpload").style.display);
//alert(document.getElementById("ctl00_CPHPageContent_PnlReport").style.display);

document.getElementById("ctl00_CPHPageContent_PnlUser").style.display="none";
document.getElementById("ctl00_CPHPageContent_PnlUpload").style.display="none";
document.getElementById("ctl00_CPHPageContent_PnlReport").style.display="block";


}
function hide1(myVal)
{

document.getElementById("ctl00_CPHPageContent_PnlReport").style.display="none";
document.getElementById("ctl00_CPHPageContent_PnlUpload").style.display="block";

}


function DoAttendValidate()
{
	if(document.getElementById("ctl00_CPHPageContent_seminarVal_TxtRPMF_ID").value=="")
	{
	alert("Member Number is required");
	return false;
	}
	else if(document.getElementById("ctl00_CPHPageContent_seminarVal_TxtRPassword").value=="")
	{
		alert("Password is required");
		return false;
	}
	else
	{
	//alert("asddfas");
		
		var result=SummitInformations.CheckExist(document.getElementById("ctl00_CPHPageContent_seminarVal_TxtRPMF_ID").value,document.getElementById("ctl00_CPHPageContent_seminarVal_TxtRPassword").value).value;
				
		var temAttID = new Array();
		temAttID = result.split('^');
		//alert(temAttID[1]);
		if(temAttID[0]=="exist")
		{		
			document.getElementById("ctl00_CPHPageContent_seminarVal_HdnMem").value=temAttID[1];
			//alert(document.getElementById("ctl00_CPHPageContent_seminarVal_HdnMem").value);
			//Upload('$reg1');
			return true;
		}
		else
		{
			alert("User does not exist! Please register");
			document.getElementById("ctl00_CPHPageContent_seminarVal_TxtRPMF_ID").value=""
			document.getElementById("ctl00_CPHPageContent_seminarVal_TxtRPassword").value=""
			return false;
		}
	}
			
	
}

function forgotpaswordlogin()
{
	 document.getElementById("ctl00_CPHPageContent_seminarVal_LblEmail").style.display="block";
	 document.getElementById("ctl00_CPHPageContent_seminarVal_TxtOEma").style.display="block";
	  document.getElementById("ctl00_CPHPageContent_seminarVal_TxtRPassword").style.display="none";
	   document.getElementById("ctl00_CPHPageContent_seminarVal_LblPASS").style.display="none";
	   document.getElementById("ctl00_CPHPageContent_seminarVal_btnGotoforgot").style.display="block";
	   document.getElementById("ctl00_CPHPageContent_seminarVal_btnGotoNext1").style.display="none";

}
function clickOverViewOrigFloor(myVal)
{
	//document.getElementById("ctl00_CPHPageContent_seminarVal_SummitInfo_HdnfeFlag").value="";
	if( document.getElementById("ctl00_CPHPageContent_seminarVal_SummitInfo_HdnfeFlag").value!="" && document.getElementById("ctl00_CPHPageContent_seminarVal_SummitInfo_HdnfeFlag").value=="Y")
	{
	document.getElementById("Fulloverview").style.display="none";
	}
	else
	{
	document.getElementById("Fulloverview").style.display="block";
	}
	

	var frmValue = document.getElementsByTagName("table");
	var frmColor = document.getElementsByTagName("A");

	for(RGP=0; RGP<frmColor.length; RGP++)
	{
		var RGPColor = frmColor[RGP];

		if(RGPColor.id.indexOf("overviewColorChange_")>=0)
		{
			RGPColor.style.color ="#6392E7";
			document.getElementById("overviewColorChange_"+myVal).style.color='black';
			if(document.getElementById("pnlSeminarContent")!= null)
			{
				document.getElementById("pnlSeminarContent").style.display='block';
				document.getElementById("register").style.display='block';
					document.getElementById("register1").style.display='none';
			}
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

function clickOverViewOrig(myVal)
{
//alert("sdfsd");
//if(document.getElementById("ctl00_CPHPageContent_seminarVal_SummitInfo_HdnfeFlag")!=null && document.getElementById("ctl00_CPHPageContent_seminarVal_SummitInfo_HdnfeFlag").value!="" && document.getElementById("ctl00_CPHPageContent_seminarVal_SummitInfo_HdnfeFlag").value=="Y")
	//{
	//document.getElementById("Fulloverview").style.display="none";
	//}
	//else
	//{
	//document.getElementById("Fulloverview").style.display="block";
	//}
	

	var frmValue = document.getElementsByTagName("table");
	var frmColor = document.getElementsByTagName("A");

	for(RGP=0; RGP<frmColor.length; RGP++)
	{
		var RGPColor = frmColor[RGP];

		if(RGPColor.id.indexOf("overviewColorChange_")>=0)
		{
			RGPColor.style.color ="#6392E7";
			document.getElementById("overviewColorChange_"+myVal).style.color='black';
			if(document.getElementById("pnlSeminarContent")!= null)
			{
				document.getElementById("pnlSeminarContent").style.display='block';
					if(document.getElementById("ctl00_CPHPageContent_seminarVal_SummitInfo_HdnfeFlag")!=null && document.getElementById("ctl00_CPHPageContent_seminarVal_SummitInfo_HdnfeFlag").value!="" && document.getElementById("ctl00_CPHPageContent_seminarVal_SummitInfo_HdnfeFlag").value=="Y")
					{
					document.getElementById("Fulloverview").style.display='none';
					}
					//document.getElementById("register1").style.display='none';
					//document.getElementById("register2").style.display='none';
					//document.getElementById("register3").style.display='none';
			}
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

function clickOverView(id,myVal)
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
			if(document.getElementById("pnlSeminarContent")!= null)
			{
				document.getElementById("pnlSeminarContent").style.display='block';
				
			}
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
	
	
	
	var browser=navigator.appName;
	if(browser.indexOf("Microsoft") >= 0)
	{
		//window.location.href("EditProduct.aspx?Productid="+d1[1]);
		window.location.href("attendee_information.aspx?eid="+id+"&L=E");
	}
	else
	{
		//location.replace("EditProduct.aspx?Productid="+d1[1]);
		location.replace("attendee_information.aspx?eid="+id+"&L=E");
	}
	
	//<A HREF='javascript:hideregion(\"$reg\")'
		
	return false;	
	
}
function hideregionlogin(myVal)
{
	
	document.getElementById("ctl00_CPHPageContent_seminarVal_LblEmail").style.display="none";
	document.getElementById("ctl00_CPHPageContent_seminarVal_TxtOEma").style.display="none";
	document.getElementById("ctl00_CPHPageContent_seminarVal_TxtRPassword").style.display="block";
	document.getElementById("ctl00_CPHPageContent_seminarVal_LblPASS").style.display="block";
	document.getElementById("ctl00_CPHPageContent_seminarVal_btnGotoforgot").style.display="none";
	document.getElementById("ctl00_CPHPageContent_seminarVal_btnGotoNext1").style.display="block";
	//document.getElementById("ctl00_CPHPageContent_seminarVal_lblmamess").value="";
	
	
	if(document.getElementById("ctl00_CPHPageContent_seminarVal_SummitInfo_HdnfeFlag").value!="" && document.getElementById("ctl00_CPHPageContent_seminarVal_SummitInfo_HdnfeFlag").value=="Y")
	{
	document.getElementById("Fulloverview").style.display="block";
	}
	else
	{
	document.getElementById("Fulloverview").style.display="block";
	}	
	var frmValue = document.getElementsByTagName("table");
	var frmColor = document.getElementsByTagName("A");
	
		for(RGP=0; RGP<frmColor.length; RGP++)
		{
			var RGPColor = frmColor[RGP];
	
			if(RGPColor.id.indexOf("overviewColorChange_")>=0)
			{
				RGPColor.style.color ="#6392E7";
				document.getElementById("overviewColorChange_"+myVal).style.color='black';
				if(document.getElementById("pnlSeminarContent")!= null)
				{
					document.getElementById("pnlSeminarContent").style.display='none';
					//document.getElementById("pane").style.display='none';
					if(document.getElementById("ctl00_CPHPageContent_seminarVal_SummitInfo_HdnfeFlag").value!="" && document.getElementById("ctl00_CPHPageContent_seminarVal_SummitInfo_HdnfeFlag").value=="Y")
					{
					document.getElementById("register").style.display='none';
					document.getElementById("register1").style.display='none';
					document.getElementById("register2").style.display='block';
					document.getElementById("register3").style.display='none';
					}
					else
					{
					document.getElementById("register").style.display='block';
					document.getElementById("register1").style.display='none';
					document.getElementById("register2").style.display='none';
					document.getElementById("register3").style.display='none';
					}
					
					
				}
			}
	}
}
function Upload(myVal)
{
	if(document.getElementById("ctl00_CPHPageContent_seminarVal_SummitInfo_HdnfeFlag").value!="" && document.getElementById("ctl00_CPHPageContent_seminarVal_SummitInfo_HdnfeFlag").value=="Y")
	{
	
		document.getElementById("Fulloverview").style.display="block";
	}
	else
	{
		document.getElementById("Fulloverview").style.display="block";
	}
	
	
	var frmValue = document.getElementsByTagName("table");
		var frmColor = document.getElementsByTagName("A");
	
		for(RGP=0; RGP<frmColor.length; RGP++)
		{
			var RGPColor = frmColor[RGP];
	
			if(RGPColor.id.indexOf("overviewColorChange_")>=0)
			{
				RGPColor.style.color ="#6392E7";
				document.getElementById("overviewColorChange_"+myVal).style.color='black';
				if(document.getElementById("pnlSeminarContent")!= null)
				{
					document.getElementById("pnlSeminarContent").style.display='none';
					//document.getElementById("pane").style.display='none';
					if(document.getElementById("ctl00_CPHPageContent_seminarVal_SummitInfo_HdnfeFlag").value!="" && document.getElementById("ctl00_CPHPageContent_seminarVal_SummitInfo_HdnfeFlag").value=="Y")
					{
					document.getElementById("register").style.display='none';
					document.getElementById("register1").style.display='none';
					document.getElementById("register2").style.display='none';
					document.getElementById("register3").style.display='block';
					}
					else
					{
					document.getElementById("register").style.display='none';
					document.getElementById("register1").style.display='none';
					document.getElementById("register2").style.display='none';
					document.getElementById("register3").style.display='block';
					}
					
					
				}
			}
	}
	/*for(J=0; J<frmValue.length; J++)
	{
		var  e= frmValue[J];
		if(e.id.indexOf("EventAndSummitChildDes_")>=0)
		{
			flgChkStatus = true;
			e.style.display='none';
			document.getElementById("EventAndSummitChildDes_"+myVal).style.display='block'
		}
	}
	if(document.getElementById("pnlSpeakerContent")!= null)
	{
		document.getElementById("pnlSpeakerContent").style.display='none';
	}*/
}
function MemberShow()
{
	var myVal="$reg1";
	if(document.getElementById("ctl00_CPHPageContent_seminarVal_SummitInfo_HdnfeFlag").value!="" && document.getElementById("ctl00_CPHPageContent_seminarVal_SummitInfo_HdnfeFlag").value=="Y")
	{
	document.getElementById("Fulloverview").style.display="block";
	}
	else
	{
	document.getElementById("Fulloverview").style.display="block";
	}


	var frmValue = document.getElementsByTagName("table");
		var frmColor = document.getElementsByTagName("A");

		for(RGP=0; RGP<frmColor.length; RGP++)
		{
			var RGPColor = frmColor[RGP];

			if(RGPColor.id.indexOf("overviewColorChange_")>=0)
			{
				RGPColor.style.color ="#6392E7";
				document.getElementById("overviewColorChange_"+myVal).style.color='black';
				if(document.getElementById("pnlSeminarContent")!= null)
				{
					document.getElementById("pnlSeminarContent").style.display='none';
					//document.getElementById("pane").style.display='none';
					if(document.getElementById("ctl00_CPHPageContent_seminarVal_SummitInfo_HdnfeFlag").value!="" && document.getElementById("ctl00_CPHPageContent_seminarVal_SummitInfo_HdnfeFlag").value=="Y")
					{
					document.getElementById("register").style.display='none';
					document.getElementById("register1").style.display='block';
					document.getElementById("register2").style.display='none';
					document.getElementById("register3").style.display='none';
					}
					else
					{
					document.getElementById("register").style.display='block';
					document.getElementById("register1").style.display='none';
					document.getElementById("register2").style.display='none';
					document.getElementById("register3").style.display='none';
					}


				}
			}
		}
}

function hideregion(myVal)
{
	if(document.getElementById("ctl00_CPHPageContent_seminarVal_SummitInfo_HdnfeFlag").value!="" && document.getElementById("ctl00_CPHPageContent_seminarVal_SummitInfo_HdnfeFlag").value=="Y")
	{
	document.getElementById("Fulloverview").style.display="block";
	}
	else
	{
	document.getElementById("Fulloverview").style.display="block";
	}
	
	
	var frmValue = document.getElementsByTagName("table");
		var frmColor = document.getElementsByTagName("A");
	
		for(RGP=0; RGP<frmColor.length; RGP++)
		{
			var RGPColor = frmColor[RGP];
	
			if(RGPColor.id.indexOf("overviewColorChange_")>=0)
			{
				RGPColor.style.color ="#6392E7";
				document.getElementById("overviewColorChange_"+myVal).style.color='black';
				if(document.getElementById("pnlSeminarContent")!= null)
				{
					document.getElementById("pnlSeminarContent").style.display='none';
					//document.getElementById("pane").style.display='none';
					if(document.getElementById("ctl00_CPHPageContent_seminarVal_SummitInfo_HdnfeFlag").value!="" && document.getElementById("ctl00_CPHPageContent_seminarVal_SummitInfo_HdnfeFlag").value=="Y")
					{
					document.getElementById("register").style.display='none';
					document.getElementById("register1").style.display='block';
					document.getElementById("register2").style.display='none';
					document.getElementById("register3").style.display='none';
					}
					else
					{
					document.getElementById("register").style.display='block';
					document.getElementById("register1").style.display='none';
					document.getElementById("register2").style.display='none';
					document.getElementById("register3").style.display='none';
					}
					
					
				}
			}
	}
	/*for(J=0; J<frmValue.length; J++)
	{
		var  e= frmValue[J];
		if(e.id.indexOf("EventAndSummitChildDes_")>=0)
		{
			flgChkStatus = true;
			e.style.display='none';
			document.getElementById("EventAndSummitChildDes_"+myVal).style.display='block'
		}
	}
	if(document.getElementById("pnlSpeakerContent")!= null)
	{
		document.getElementById("pnlSpeakerContent").style.display='none';
	}*/
}
function hideregion1(myVal)
{
	if(document.getElementById("ctl00_CPHPageContent_seminarVal_SummitInfo_HdnfeFlag").value!="" && document.getElementById("ctl00_CPHPageContent_seminarVal_SummitInfo_HdnfeFlag").value=="Y")
	{
	document.getElementById("Fulloverview").style.display="block";
	}
	else
	{
	document.getElementById("Fulloverview").style.display="block";
	}
	
	
	var frmValue = document.getElementsByTagName("table");
		var frmColor = document.getElementsByTagName("A");
	
		for(RGP=0; RGP<frmColor.length; RGP++)
		{
			var RGPColor = frmColor[RGP];
	
			if(RGPColor.id.indexOf("overviewColorChange_")>=0)
			{
				RGPColor.style.color ="#6392E7";
				document.getElementById("overviewColorChange_"+myVal).style.color='black';
				if(document.getElementById("pnlSeminarContent")!= null)
				{
					document.getElementById("pnlSeminarContent").style.display='none';
					//document.getElementById("pane").style.display='none';
					if(document.getElementById("ctl00_CPHPageContent_seminarVal_SummitInfo_HdnfeFlag").value!="" && document.getElementById("ctl00_CPHPageContent_seminarVal_SummitInfo_HdnfeFlag").value=="Y")
					{
					document.getElementById("register").style.display='none';
					document.getElementById("register1").style.display='none';
						if(document.getElementById("ctl00_CPHPageContent_seminarVal_SummitInfo_HdnSession").value!="")
						{
						document.getElementById("register2").style.display='none';
						document.getElementById("register3").style.display='block';
						}
						else
						{
						document.getElementById("register2").style.display='block';
						document.getElementById("register3").style.display='none';
						}
					}
					else
					{
					document.getElementById("register").style.display='none';
					document.getElementById("register1").style.display='none';
					document.getElementById("register2").style.display='none';
					document.getElementById("register3").style.display='block';
					}
					
					
				}
			}
	}
	/*for(J=0; J<frmValue.length; J++)
	{
		var  e= frmValue[J];
		if(e.id.indexOf("EventAndSummitChildDes_")>=0)
		{
			flgChkStatus = true;
			e.style.display='none';
			document.getElementById("EventAndSummitChildDes_"+myVal).style.display='block'
		}
	}
	if(document.getElementById("pnlSpeakerContent")!= null)
	{
		document.getElementById("pnlSpeakerContent").style.display='none';
	}*/
}
function clickDisableItems(chkVal)
{
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
		if(document.getElementById("pnlSeminarContent")!= null)
		{
			document.getElementById("pnlSeminarContent").style.display='block';
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
	if(document.getElementById("EventAndSummitChildDes_HandoutInfo")!= null)
	{
		document.getElementById("EventAndSummitChildDes_HandoutInfo").style.display='none';
	}
	if(document.getElementById("pnlSpeakerContent")!= null)
	{
		document.getElementById("pnlSpeakerContent").style.display='none';
	}
}
/*
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
*/
function HideSummitDetails()
{
	document.getElementById("pnlSeminarContent").style.display="none";
}
function ShowSpeakerRegion(SummitID)
{

	SummitDetails.ShowSpeaker(SummitID,callbackres)
	
}
function ShowSpeakerRegion1(SummitID)
{
	SeminarDetails.ShowSpeaker(SummitID,callbackres)
}
function callbackres(res)
{
	var frmColor = document.getElementsByTagName("A");
	for(RGP=0; RGP<frmColor.length; RGP++)
	{
		var RGPColor = frmColor[RGP];

		if(RGPColor.id.indexOf("overviewColorChange_")>=0)
		{
			RGPColor.style.color ="#6392E7";
			document.getElementById("overviewColorChange_Speakers").style.color='black';
		}
	}
	document.getElementById("pnlSeminarContent").style.display="none";
	document.getElementById("pnlSpeakerContent").style.display="block";
	document.getElementById("pnlSpeakerContent").innerHTML = res.value;
	var strdiv=document.getElementById("hdnAll").value;
	infohover(strdiv)
}
function ShowRegister()
{
	if ( document.getElementById('#Reg#')!=null )
		document.getElementById('#Reg#').style.display="block";
	if ( document.getElementById('User_Reg')!=null )
		document.getElementById('User_Reg').style.display="block";
	if ( document.getElementById('overviewColorChange_$klsen')!=null )
		document.getElementById('overviewColorChange_$klsen').style.color="black";
}
function ShowDetailsSucess()
{
	alert("Successfully Registered");
}
function ShowDetails()
{
	document.getElementById("register1").style.display='none';
	document.getElementById("register1").style.display='none';
	document.getElementById("register2").style.display='block';
	document.getElementById("register3").style.display='none';
}
function ShowSummitDetails(target)
{
//alert("here");
	
	if(document.getElementById("ctl00_CPHPageContent_seminarVal_SummitInfo_HdnfeFlag").value!="" && document.getElementById("ctl00_CPHPageContent_seminarVal_SummitInfo_HdnfeFlag").value=="Y")
		{
		//document.getElementById('User_Reg').style.display="block";
		document.getElementById("Fulloverview").style.display="none";
		}
		else
		{
		document.getElementById('User_Reg').style.display="block";
		document.getElementById("Fulloverview").style.display="block";
		document.getElementById('#Reg#').style.display="block";
	}
	document.getElementById("pnlSeminarContent").style.display="block";
	
	
	if ( target == "" )
		document.getElementById('overviewColorChange_$klsen').style.color="black";
}
function showhide(id){
	if (document.getElementById){
		obj = document.getElementById(id);
		if (obj.style.display == "block"){
			obj.style.display = "none";
		} else {
			obj.style.display = "block";
		}
	}
}
function infohover(strdiv)
{
	
	var Sem_div=strdiv.split(',');
	for(y=0; y<Sem_div.length; y++)
	{
		document.getElementById(Sem_div[y]).style.display = "none";
	}
}