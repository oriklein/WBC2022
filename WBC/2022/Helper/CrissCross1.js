objDateAndTime = new String();
objDate = new String();
objTime = new String();
objAtt = new String();
function convertTime(time)
{
	time=time.replace(' ','');
	if(time.indexOf('AM') == 4 || time.indexOf('AM') == 5 || time.indexOf('AM') == 6)
	{
		time = time.replace('AM','')
		if(time.indexOf('12') == 0)
		{
			time=time.replace(':','')
			newtime=time.replace('12','00')

		}
		else
		{
		  	newtime= parseFloat(time.replace(':','.'))*100
		}
	}
	if(time.indexOf('PM') == 4 || time.indexOf('PM') == 5 || time.indexOf('PM') == 6)
	{
		time = time.replace('PM','')
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
function DisplaySelectedSeminars(SeminarID,SeminarDate,SeminarTime,SeminarAttendee,stat)
{

//alert("inside");
//alert(stat);
if(stat!="")
{
if(stat!="P")
{
	var strSemAtt=SeminarAttendee;
	var Att_Sem_arr=strSemAtt.split(',');
	//alert(Att_Sem_arr.length);
	for(x=0; x<Att_Sem_arr.length; x++)
	{
		document.getElementById("imgBtnRedSeminar_"+Att_Sem_arr[x]).style.display="none";
		document.getElementById("imgBtnGreenSeminar_"+Att_Sem_arr[x]).style.display="block";
		var attID=Att_Sem_arr[x].split('_')
		var dattime=SeminarDate+"@"+SeminarTime;
		document.getElementById("selecteddate_"+attID[1]).value = document.getElementById("selecteddate_"+attID[1]).value+','+dattime;
		document.getElementById("selectedtime_"+attID[1]).value = document.getElementById("selectedtime_"+attID[1]).value+','+SeminarTime;

		if(document.getElementById("selectedseminar_"+attID[1]).value != "")
		{
			document.getElementById("selectedseminar_"+attID[1]).value=document.getElementById("selectedseminar_"+attID[1]).value+","+SeminarID;
		}
		else
		{
			document.getElementById("selectedseminar_"+attID[1]).value=SeminarID;
		}
		document.getElementById("ctl00_CPHPageContent_HdnShowSelectedSeminars").value="";
	}
}
}
}

function GreenSelectedSeminarsold(chkVal,valSeminarTime,valSeminarDate,chkattval)
{
        alert("This activity already sold out, please select other activity")
	return false;
}
function RedSelectedSeminarsold(chkVal,valSeminarTime,valSeminarDate,chkattval,maxallowpTour,extra)
{
	alert("This activity already sold out, please select other activity")
	return false;
}
function RedSelectedSeminar(chkVal,valSeminarTime,valSeminarDate,chkattval,maxallowpTour,extra)
{
//alert("inside check in");

	objSeminarID= new String();
	var strBeginDateAndTime = "";
	var strSearchDateAndTime = "";
	var setFlagDateAndTime = "";
	var strseminarid="";
	setFlagDateAndTime=false;
	if(objDateAndTime !="")
	{
		strBeginDateAndTime = objDateAndTime;
	}
		strSearchDateAndTime = "'"+valSeminarDate+"~"+valSeminarTime+"'"+chkattval;
		var temDate = new Array();
		temDate = document.getElementById("selecteddate_"+chkattval).value.split(',');
		var temTime = new Array();
		var temdattime = new Array();
		var temAttID = new Array();
		temAttID = objAtt.split(',');
		for(var z=0;z<temDate.length;z++)
		{
			temdattime=temDate[z].split('@')
			if(temdattime[0] == valSeminarDate)
			{
				var prevseltime= temdattime[1].replace(' ','')
						var tempprevTime = new Array();
						tempprevTime=prevseltime.split('-');
						var seltime= valSeminarTime.replace(' ','');
						var tempTime = new Array();
						tempTime=seltime.split('-');
						if(!CompareTime(convertTime(tempprevTime[0]),convertTime(tempprevTime[1]),convertTime(tempTime[0]),convertTime(tempTime[1])))
						{
							setFlagDateAndTime = true;
						}
			}
		}
	if(setFlagDateAndTime)
	{
		alert(" You are trying to register for two activities taking place at the same time.\n Please select only one activities for each time slot");
		return false;
	}
	else
	{
		objDateAndTime = objDateAndTime+",'"+valSeminarDate+"~"+valSeminarTime+"'"+chkattval;
		objDate=objDate+","+valSeminarDate;
		var dattime =valSeminarDate+"@"+valSeminarTime
		document.getElementById("selecteddate_"+chkattval).value=document.getElementById("selecteddate_"+chkattval).value+","+dattime;
		objTime=objTime+","+valSeminarTime;
		document.getElementById("selectedtime_"+chkattval).value=document.getElementById("selectedtime_"+chkattval).value+","+valSeminarTime;
		objAtt=objAtt+","+chkattval;
		if(document.getElementById("selectedseminar_"+chkattval).value != "")
		{
			document.getElementById("selectedseminar_"+chkattval).value=document.getElementById("selectedseminar_"+chkattval).value+","+chkVal;
		}
		else
		{
			document.getElementById("selectedseminar_"+chkattval).value=chkVal;
		}
		document.getElementById("imgBtnGreenSeminar_"+chkVal+"_"+chkattval).style.display="block";
		document.getElementById("imgBtnRedSeminar_"+chkVal+"_"+chkattval).style.display="none";
		if(document.getElementById("selectedseminar_"+chkattval).value != null)
		{
			//Select.LoadByAttendeeID(chkattval,callbackds);
			
			//alert(chkattval);
			var res=ShowActivity.LoadByAttendeeID(chkattval).value;
			//alert(res);
			//condition(chkVal,chkattval,maxallowpTour,valSeminarTime,valSeminarDate);
			var active = new Array();
			if(res!="")
			{
				//if(res.indexOf(',')!=-1)
				active = res.split(',');
				//else
				//active=res;
				//alert(active[0]);
				//alert(active[1]);
				//alert("active.length"+active.length);
				//alert("maxallowpTour"+maxallowpTour);
				//alert("extra"+extra);
				       if(active.length>=maxallowpTour || maxallowpTour==0)
					{
						
						if(extra=="Y")
						{
						//document.getElementById("selectedextra_"+chkattval).value=
						ShowActivity.UpdateSeminartoAttendee(chkattval,document.getElementById("selectedseminar_"+chkattval).value,callbackdesc)
						}
						else
						{
						alert("Maximum allowed activities to this tour per attendee is "+maxallowpTour);
						GreenSelectedSeminar1(chkVal,valSeminarTime,valSeminarDate,chkattval);
						//GreenSelectedSeminar(chkVal,valSeminarTime,valSeminarDate,chkattval);
						/*if(document.getElementById("selectedseminar_"+chkattval).value != null)
						{
							Select.UpdateSeminartoAttendee(chkattval,document.getElementById("selectedseminar_"+chkattval).value,callbackdesc)
						}
						document.getElementById("imgBtnGreenSeminar_"+chkVal+"_"+chkattval).style.display="none";
						document.getElementById("imgBtnRedSeminar_"+chkVal+"_"+chkattval).style.display="block";*/
						//active.length=0;
						return false;
						}
					}
					else
					{
					ShowActivity.UpdateSeminartoAttendee(chkattval,document.getElementById("selectedseminar_"+chkattval).value,callbackdesc)
					}
			}
			else
			{
			ShowActivity.UpdateSeminartoAttendee(chkattval,document.getElementById("selectedseminar_"+chkattval).value,callbackdesc)
			}
			
			
			
		}
	}
}
function condition(chkVal,chkattval,maxallowpTour,valSeminarTime,valSeminarDate)
{
//alert("chkattval"+chkattval);
var res=ShowActivity.LoadByAttendeeID(chkattval).value;
alert("res"+res);
var active = new Array();

if(res!="")
{
	alert("sgsdf"+res.indexOf(','));
	if(res.indexOf(',')!=-1)
	active = res.split(',');
	//else
	//active[0]=res;


	alert("maxallowpTour"+maxallowpTour);
	alert("active.length"+active.length);
	alert("active[0]"+active[0]);
	alert("active[1]"+active[1]);
	alert("active[2]"+active[2]);

	if(active.length>maxallowpTour || maxallowpTour==0)
	{
		alert("Maximum allowed activities to this tour per attendee is "+maxallowpTour);
		GreenSelectedSeminar(chkVal,valSeminarTime,valSeminarDate,chkattval);
		/*if(document.getElementById("selectedseminar_"+chkattval).value != null)
		{
			Select.UpdateSeminartoAttendee(chkattval,document.getElementById("selectedseminar_"+chkattval).value,callbackdesc)
		}
		document.getElementById("imgBtnGreenSeminar_"+chkVal+"_"+chkattval).style.display="none";
		document.getElementById("imgBtnRedSeminar_"+chkVal+"_"+chkattval).style.display="block";*/
		return false;
	}
	else
	{
		ShowActivity.UpdateSeminartoAttendee(chkattval,document.getElementById("selectedseminar_"+chkattval).value,callbackdesc)
		//return true;
	}
}
else
{
	ShowActivity.UpdateSeminartoAttendee(chkattval,document.getElementById("selectedseminar_"+chkattval).value,callbackdesc)
	//return true;
}

}
function GreenSelectedSeminar(chkVal,valSeminarTime,valSeminarDate,chkattval)
{
      // alert("inside check out");
      //alert("inside check out");
	var valRepSemDateAndTime="";
	var RepSemDate="";
	var RepSemTime="";
	var dattime =valSeminarDate+"@"+valSeminarTime
	valRepSemDateAndTime =",'"+valSeminarDate+"~"+valSeminarTime+"'"+chkattval;
	RepSemDate =","+valSeminarDate;
	RepSemTime =","+valSeminarTime;
	RepAttID=","+chkattval;
	objDateAndTime = objDateAndTime.replace(valRepSemDateAndTime,'');
	objDate = objDate.replace(RepSemDate,'');
	document.getElementById("selecteddate_"+chkattval).value = document.getElementById("selecteddate_"+chkattval).value.replace(dattime,'');
	objTime = objTime.replace(RepSemTime,'');
	document.getElementById("selectedtime_"+chkattval).value = document.getElementById("selectedtime_"+chkattval).value.replace(RepSemTime,'');
	objAtt = objAtt.replace(RepAttID,'');
	document.getElementById("selectedseminar_"+chkattval).value=document.getElementById("selectedseminar_"+chkattval).value.replace(chkVal+",",'');
	document.getElementById("selectedseminar_"+chkattval).value=document.getElementById("selectedseminar_"+chkattval).value.replace(","+chkVal,'');
	document.getElementById("selectedseminar_"+chkattval).value=document.getElementById("selectedseminar_"+chkattval).value.replace(chkVal,'');
	if(document.getElementById("selectedseminar_"+chkattval).value != null)
	{
		ShowActivity.UpdateSeminartoAttendee(chkattval,document.getElementById("selectedseminar_"+chkattval).value,callbackdesc)
	}
	//alert("inside check out");
	document.getElementById("imgBtnGreenSeminar_"+chkVal+"_"+chkattval).style.display="none";
	document.getElementById("imgBtnRedSeminar_"+chkVal+"_"+chkattval).style.display="block";
}
function GreenSelectedSeminar1(chkVal,valSeminarTime,valSeminarDate,chkattval)
{
       //alert("inside check out");
	var valRepSemDateAndTime="";
	var RepSemDate="";
	var RepSemTime="";
	var dattime =valSeminarDate+"@"+valSeminarTime
	valRepSemDateAndTime =",'"+valSeminarDate+"~"+valSeminarTime+"'"+chkattval;
	RepSemDate =","+valSeminarDate;
	RepSemTime =","+valSeminarTime;
	RepAttID=","+chkattval;
	objDateAndTime = objDateAndTime.replace(valRepSemDateAndTime,'');
	objDate = objDate.replace(RepSemDate,'');
	document.getElementById("selecteddate_"+chkattval).value = document.getElementById("selecteddate_"+chkattval).value.replace(dattime,'');
	objTime = objTime.replace(RepSemTime,'');
	document.getElementById("selectedtime_"+chkattval).value = document.getElementById("selectedtime_"+chkattval).value.replace(RepSemTime,'');
	objAtt = objAtt.replace(RepAttID,'');
	document.getElementById("selectedseminar_"+chkattval).value=document.getElementById("selectedseminar_"+chkattval).value.replace(chkVal+",",'');
	document.getElementById("selectedseminar_"+chkattval).value=document.getElementById("selectedseminar_"+chkattval).value.replace(","+chkVal,'');
	document.getElementById("selectedseminar_"+chkattval).value=document.getElementById("selectedseminar_"+chkattval).value.replace(chkVal,'');
	//if(document.getElementById("selectedseminar_"+chkattval).value != null)
	//{
		//Select.UpdateSeminartoAttendee(chkattval,document.getElementById("selectedseminar_"+chkattval).value,callbackdesc)
	//}
	document.getElementById("imgBtnGreenSeminar_"+chkVal+"_"+chkattval).style.display="none";
	document.getElementById("imgBtnRedSeminar_"+chkVal+"_"+chkattval).style.display="block";
}
function callbackdesc(res)
{
if (isError(res)) return false;
	//alert(res.value);
}
function isError(res)
{
	if(res.error)
	{
		//alert("Error: " + res.error.Message);
		return true;
	}
	return false;
}

function ClearValue()
{

if(validatecheckbox())
{
	//alert(document.getElementById("ctl00_CPHPageContent_EditHdnSemID").value);
	var strSemid=document.getElementById("ctl00_CPHPageContent_HdnAttID").value;
	var Sem_array=strSemid.split(',');	
		
	for(x=0; x<Sem_array.length; x++)
	{
		document.getElementById("selectedseminar_"+Sem_array[x]).value="";
		document.getElementById("selecteddate_"+Sem_array[x]).value="";
		document.getElementById("selectedtime_"+Sem_array[x]).value="";
	}
	
	//alert("here"+document.getElementById("ctl00_CPHPageContent_EditHdnSemID").value);
	return true
}
//alert("sdf"+document.getElementById("ctl00_CPHPageContent_EditHdnSemID").value);
return false;
}
function validatecheckbox()
{
	var strSemid=document.getElementById("ctl00_CPHPageContent_HdnSemID").value;
	var Sem_array=strSemid.split(',');
	var strAttid=document.getElementById("ctl00_CPHPageContent_HdnAttID").value;
	var Att_array=strAttid.split(',');
	var temp="";
	for(y=0; y<Att_array.length; y++)
	{   
		
		
		if(y==0)
		{
		temp=document.getElementById("selectedseminar_"+Att_array[y]).value
		}
		else
		{
		temp=temp+'^'+document.getElementById("selectedseminar_"+Att_array[y]).value
		}
		
		
		var flgChkStatus=false;
		for(x=0; x<Sem_array.length; x++)
		{
			var frmValue = document.getElementsByTagName("img");
			for(J=0; J<frmValue.length; J++)
			{
				var e = frmValue[J];
				if(e.id.indexOf("imgBtnGreenSeminar_"+Sem_array[x]+"_"+Att_array[y])>=0)
				{
					if(e.style.display == "block")
					{
						flgChkStatus = true;
					}
				}
			}
		}
		if(!flgChkStatus)
		{
			alert("You must select at least one activities for each Attendee ");
			return false;
		}
	}
	document.getElementById("ctl00_CPHPageContent_EditHdnSemID").value=temp;
	//alert(document.getElementById("ctl00_CPHPageContent_EditHdnSemID").value);
	return true
}
function EditRedSelectedSeminar(chkVal,valSeminarTime,valSeminarDate,chkattval,maxallowpTour,extra)
{
//alert("inside check in");

	objSeminarID= new String();
	var strBeginDateAndTime = "";
	var strSearchDateAndTime = "";
	var setFlagDateAndTime = "";
	var strseminarid="";
	setFlagDateAndTime=false;
	if(objDateAndTime !="")
	{
		strBeginDateAndTime = objDateAndTime;
	}
		strSearchDateAndTime = "'"+valSeminarDate+"~"+valSeminarTime+"'"+chkattval;
		var temDate = new Array();
		temDate = document.getElementById("selecteddate_"+chkattval).value.split(',');
		//alert(document.getElementById("selecteddate_"+chkattval).value);
		var temTime = new Array();
		var temdattime = new Array();
		var temAttID = new Array();
		temAttID = objAtt.split(',');
		for(var z=0;z<temDate.length;z++)
		{
			temdattime=temDate[z].split('@')
			if(temdattime[0] == valSeminarDate)
			{
				var prevseltime= temdattime[1].replace(' ','')
						var tempprevTime = new Array();
						tempprevTime=prevseltime.split('-');
						var seltime= valSeminarTime.replace(' ','');
						var tempTime = new Array();
						tempTime=seltime.split('-');
						if(!CompareTime(convertTime(tempprevTime[0]),convertTime(tempprevTime[1]),convertTime(tempTime[0]),convertTime(tempTime[1])))
						{
							setFlagDateAndTime = true;
						}
			}
		}
	if(setFlagDateAndTime)
	{
		alert(" You are trying to register for two activities taking place at the same time.\n Please select only one activities for each time slot");
		return false;
	}
	else
	{
		objDateAndTime = objDateAndTime+",'"+valSeminarDate+"~"+valSeminarTime+"'"+chkattval;
		objDate=objDate+","+valSeminarDate;
		var dattime =valSeminarDate+"@"+valSeminarTime
		document.getElementById("selecteddate_"+chkattval).value=document.getElementById("selecteddate_"+chkattval).value+","+dattime;
		objTime=objTime+","+valSeminarTime;
		document.getElementById("selectedtime_"+chkattval).value=document.getElementById("selectedtime_"+chkattval).value+","+valSeminarTime;
		objAtt=objAtt+","+chkattval;
		if(document.getElementById("selectedseminar_"+chkattval).value != "")
		{
			document.getElementById("selectedseminar_"+chkattval).value=document.getElementById("selectedseminar_"+chkattval).value+","+chkVal;
		}
		else
		{
			document.getElementById("selectedseminar_"+chkattval).value=chkVal;
		}
		document.getElementById("imgBtnGreenSeminar_"+chkVal+"_"+chkattval).style.display="block";
		document.getElementById("imgBtnRedSeminar_"+chkVal+"_"+chkattval).style.display="none";
		if(document.getElementById("selectedseminar_"+chkattval).value != null)
		{
			//Select.LoadByAttendeeID(chkattval,callbackds);
			
			//alert(chkattval);
			//var res=Select.LoadByAttendeeID(chkattval).value;
			var res=document.getElementById("selectedseminar_"+chkattval).value
			//alert(res);
			//condition(chkVal,chkattval,maxallowpTour,valSeminarTime,valSeminarDate);
			var active = new Array();
			if(res!="")
			{
				//if(res.indexOf(',')!=-1)
				active = res.split(',');
				//else
				//active=res;
				//alert(active[0]);
				//alert(active[1]);
				//alert(document.getElementById("selectedseminar_"+chkattval).value)
				//alert("active.length"+active.length);
				//alert("maxallowpTour"+maxallowpTour);
				//alert("extra"+extra);
				       if(active.length>maxallowpTour || maxallowpTour==0)
					{
						
						if(extra=="Y")
						{
						//document.getElementById("selectedextra_"+chkattval).value=
						//Select.UpdateSeminartoAttendee(chkattval,document.getElementById("selectedseminar_"+chkattval).value,callbackdesc)
						}
						else
						{
						alert("Maximum allowed activities to this tour per attendee is "+maxallowpTour);
						GreenSelectedSeminar1(chkVal,valSeminarTime,valSeminarDate,chkattval);
						//GreenSelectedSeminar(chkVal,valSeminarTime,valSeminarDate,chkattval);
						/*if(document.getElementById("selectedseminar_"+chkattval).value != null)
						{
							Select.UpdateSeminartoAttendee(chkattval,document.getElementById("selectedseminar_"+chkattval).value,callbackdesc)
						}
						document.getElementById("imgBtnGreenSeminar_"+chkVal+"_"+chkattval).style.display="none";
						document.getElementById("imgBtnRedSeminar_"+chkVal+"_"+chkattval).style.display="block";*/
						//active.length=0;
						return false;
						}
					}
					else
					{
					//Select.UpdateSeminartoAttendee(chkattval,document.getElementById("selectedseminar_"+chkattval).value,callbackdesc)
					}
			}
			else
			{
			//Select.UpdateSeminartoAttendee(chkattval,document.getElementById("selectedseminar_"+chkattval).value,callbackdesc)
			}
			
			
			
		}
	}
	//alert(document.getElementById("selectedseminar_"+chkattval).value);
}
