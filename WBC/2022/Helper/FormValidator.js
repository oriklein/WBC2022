

function validateForm(frmName)
{
	//if(document.forms.length == 2)
		//frmName = 1;
	var n;
 	var ctlName;
	var ctlType;
	var ctlReq;
	var ctlValue;
	var ctlErrName;	
	var ctlObj;

	var errInt;
	var errFlt;
	var errTxt;
	var errDat;
	var  booSpace;
	var tempChr;
	var tempCtlValue;
	booSpace=false;

	errInt="Only Numbers are allowed in - ";
	errFlt="Only Numbers are allowed in - ";
	errTxt="Invalid Characters in - ";
	errInv="Invalid - ";
	errDat="Date is not valid in - ";
	errNum="Not a Valid Number - ";	
	n=document.forms[frmName].elements.length ;

	for(var i=0;i<document.forms[frmName].elements.length;i++)
	{


		ctlName=document.forms[frmName].elements[i].name;

		ctlName=ctlName.replace("ctl00$CPHPageContent$","");
		ctlName=ctlName.replace("ctl00$CPHPage_Nationwide_stydy_Content$","");
		ctlName=ctlName.replace("ctl00$BO_HeaderFooter$","");
		
		
		ctlObj=document.forms[frmName].elements[i].type;
		
		if(ctlObj == "hidden")
			continue;

		if (ctlObj.indexOf("select")>=0 )
		{
				document.forms[frmName].elements[i].options[document.forms[frmName].elements[i].selectedIndex].value=document.forms[frmName].elements[i].options[document.forms[frmName].elements[i].selectedIndex].value.replace("'","`");
		}
		else
		{
			
			//RSQ--->replace_single_quote_
			RSQ_ctlValue=document.forms[frmName].elements[i].value;
			RSQ_ctlValuename=document.forms[frmName].elements[i].name;
			if(RSQ_ctlValuename!="")
			{
				var RSQ_tempStr;
				RSQ_tempStr="";
		     		 if(RSQ_ctlValue != "")
				{
					for (var RSQ_sl=0;RSQ_sl<RSQ_ctlValue.length;RSQ_sl++)
					{
						RSQ_tempStr=RSQ_tempStr+RSQ_ctlValue.substring(RSQ_sl,RSQ_sl+1).replace("'","`");
					}
				}
				
				document.forms[frmName].elements[i].value=RSQ_tempStr;
			}	
		     
		}
		
		if(ctlName!="")
		{
			if(ctlName.indexOf(":Int")>=0)
			{
				ctlType="Int";
				ctlReq=ctlName.substring(ctlName.indexOf(":Int"),ctlName.indexOf(":Int")+1);
				ctlErrName=ctlName.substring(0,ctlName.indexOf(":Int")) +" - " + ctlName.substring(ctlName.indexOf(":Int")+5,ctlName.length);	
			}
			else
			{
				ctlType=ctlName.substring(0,3);
				ctlReq=ctlName.substring(3,4);
				ctlErrName=ctlName.substring(4,ctlName.length);	
			}
			
			if(ctlName.indexOf(":_ctl")>=0){
						ctlType="Txt";
						//ctlReq=ctlName.substring(ctlName.indexOf(":_ctl")+10,ctlName.indexOf(":_ctl")+11);					
						var colIndex;
						if(ctlName.indexOf(":") != ctlName.lastIndexOf(":")){
							colIndex = ctlName.indexOf(":");
							var tctlName = ctlName.substring(colIndex+1);
							colIndex = ctlName.indexOf(":") + tctlName.indexOf(":")+2;
						}
						else{
							colIndex = ctlName.indexOf(":");
						}
						var ctlTempName = ctlName.substring(colIndex);					
						ctlType=ctlTempName.substring(0,3);
						ctlReq=ctlTempName.substring(3,4);
						ctlErrName=ctlTempName.substring(4,ctlTempName.length);	
					}
					else{
						ctlType=ctlName.substring(0,3);
						ctlReq=ctlName.substring(3,4);
						ctlErrName=ctlName.substring(4,ctlName.length);	
			}

			var tempStr;
		
			tempStr="";
			
			for (var sl=0;sl<ctlErrName.length;sl++)
			{
				tempStr=tempStr+ctlErrName.substring(sl, sl+1).replace("_"," ");
			}
	
			ctlErrName=tempStr;

			ctlErrName="\'"+ctlErrName+"\'";

			if (ctlObj.indexOf("select")>=0 )
			{
				if(document.forms[frmName].elements[i].selectedIndex >=0)
				{
					ctlValue=document.forms[frmName].elements[i].options[document.forms[frmName].elements[i].selectedIndex].value;
				}		
			}
			else
				ctlValue=document.forms[frmName].elements[i].value;	
			
			
		

			// trim 


			tempCtlValue='';
			booSpace=false;
			for (var sl=0;sl<ctlValue.length;sl++)
			{
				tempChr=ctlValue.substring(sl, sl+1);
				if (tempChr!=' ')
				{
					booSpace=true;
					tempCtlValue=tempCtlValue+tempChr;
				}
				else
				if (booSpace)
					tempCtlValue=tempCtlValue+tempChr;
			
			}
	
			ctlValue=tempCtlValue;

			if (ctlObj.indexOf("select")>=0 )
			{
				document.forms[frmName].elements[i].options[document.forms[frmName].elements[i].selectedIndex].value=ctlValue;
			}
			else
				document.forms[frmName].elements[i].value=ctlValue;

			// end of trim

			if ((ctlReq=="R") && (ctlObj!="hidden"))
			{
				if(ctlValue.length<=0)
				{
					alert(ctlErrName+' is Required'); 
					document.forms[frmName].elements[i].focus();
					return false;	
				}
			}

//			if ((ctlReq=="O") && (ctlObj.indexOf("select")>=0 ))	// if Select
//					return true;	

			if(ctlValue.length>0)
			{		

				switch (ctlType)
				{
					
					case "Txa":
						if (!isTextOthers(ctlValue))
						{
							alert(errTxt+ctlErrName);
							document.forms[frmName].elements[i].focus();
							return false;
						}
						break;
					case "Txt":
						if (!isText(ctlValue))
						{
							alert(errTxt+ctlErrName);
							document.forms[frmName].elements[i].focus();
							return false;
						}
						break;
					case "Int":
						if (!isInteger(ctlValue))
						{
							alert(errInt+ctlErrName);
							//document.forms[frmName].elements[i].value='0';
							document.forms[frmName].elements[i].focus();
							return false;
						}
						break;

					case "Flt":
						if (!isFloat(ctlValue))
						{
							alert(errNum+ctlErrName);
							document.forms[frmName].elements[i].value='0';
							document.forms[frmName].elements[i].focus();
							return false;
						}
						break;

					case "Neg":
						if (!isNegative(ctlValue))
						{
							alert(errNum+ctlErrName);
							if (isNaN(document.forms[frmName].elements[i].value))
							{
								return false;
							}
							else
							{
								break ;
							}
							document.forms[frmName].elements[i].value='0';
							document.forms[frmName].elements[i].focus();
							return false;
						}
						break;

					case "AId":
						if(isPassword(ctlValue)&&ctlValue.length<3)
						{
							alert("You must enter atleast 3 characters in - "+ctlErrName);
							document.forms[frmName].elements[i].focus();
							return false;
						}
						if (!isPassword(ctlValue))
						{
							alert("Only alphanumeric characters are allowed in - "+ctlErrName);
							document.forms[frmName].elements[i].focus();
							return false;
						}
						break;
					case "Pwd":
						if(isPassword(ctlValue)&&ctlValue.length<3)
						{
							alert("You must enter atleast 3 characters in - "+ctlErrName);
							document.forms[frmName].elements[i].focus();
							return false;
						}
						if (!isPassword(ctlValue))
						{
							alert("Only alphanumeric characters are allowed in - "+ctlErrName);
							document.forms[frmName].elements[i].focus();
							return false;
						}
						break;
					case "Eml":
						if (!isEMail(ctlValue))
						{
							alert(errInv+ctlErrName);
							document.forms[frmName].elements[i].focus();
							return false;
						}
						break;

					case "Tel":
						if (!isTelephone(ctlValue))
						{
							alert(errTxt+ctlErrName);
							document.forms[frmName].elements[i].focus();
							return false;
						}
						break;

					case "Fax":
						if (!isFax(ctlValue))
						{
							alert(errTxt+ctlErrName);
							document.forms[frmName].elements[i].focus();
							return false;
						}
						break;

					case "Pin":
						if (!isPinCode(ctlValue))
						{
							alert(errTxt+ctlErrName);
							document.forms[frmName].elements[i].focus();
							return false;
						}
						break;
					case "Dat":
						if (ctlValue.indexOf("-") == -1)
						{
							//if (!isDate(ctlValue,"dd/mm/yyyy")){ // Changed by Prabhu P on 11 Jan 2006
							if (!isDate(ctlValue,"mm/dd/yyyy"))
							{ 
								alert(errDat+ctlErrName);
								document.forms[frmName].elements[i].focus();
								return false;
							}
						}
						else
						{
								alert(errTxt+ctlErrName);
								document.forms[frmName].elements[i].focus();
								return false;
						}
						break;
					case "Amt":
						if (!isAmount(ctlValue,ctlErrName,document.forms[frmName].elements[i].name))
						{
							document.forms[frmName].elements[i].focus();
							return false;
						}
						break;
					case "URL":
						if (ctlValue.substring(0,7).toUpperCase()!="HTTP://")
						{
							alert(ctlErrName+" should start with http://");
							document.forms[frmName].elements[i].focus();
							return false;
						}
						break;
					case "Fld":
						if (!isFolderName(ctlValue,ctlErrName))
						{
							document.forms[frmName].elements[i].focus();
							return false;
						}
						break;
					case "Per":
						if (!isPercentage(frmName,ctlValue,i))
						{
							document.forms[frmName].elements[i].focus();
							return false;
						}
						break;

					default :
						break;

				}
			}
		}	
	}
	return true;
}
function isPercentage(FormName,a,i){
			if(a.length!=0){
				z=a.length;
						for(m=0;m<=z;m++){
							if(a.charAt(0)==" "){
								a=a.substring(1,a.length);
								var y=a.length;
								if(y==0){
									alert("Percentage is required");
									document.forms[FormName].elements[i].focus();
									return false;
								}
							}
						}
						if(isNaN(a)){
							alert("Sorry !! "+a+" is not a number !!");
							document.forms[FormName].elements[i].focus();
							return false;
						}
						else{
							if(a.charAt(0)=="-"){
								alert("Sorry !! Negative numbers are not allowed !!");
								document.forms[FormName].elements[i].focus();
								return false;
							}
							else if(a.charAt(0)=="+"){
								alert("Sorry !! Special characters are not allowed !!");
								document.forms[FormName].elements[i].focus();
								return false;
							}
							else if(parseFloat(document.forms[FormName].elements[i].value)>100){
								alert("Sorry !! Percentage cannot be greater than 100!!");
								document.forms[FormName].elements[i].focus();
								return false;
							}
							else{
								if(a.indexOf(".")!=-1){
									var b=a.substring(a.indexOf(".")+1,a.length);
									if(b.length>2){
									 	alert("In the decimal part you have entered more than two digits!! \n                          Please round it !!")
										document.forms[FormName].elements[i].focus();
										return false;
									}
									else{
										  //allow to proceed
										return true;
									}
								}		
								else{
										  //allow to proceed
										return true;
									}
						}
				}	
		
	}
}


function isAmount(strVal,ctlErrName,FullName){
		if (isNaN(strVal)==true)
		{
			//alert("Invalid Character Entered !! Please Check Up - in "+ctlErrName);
			OpenPopupScreen(18);
			return false;
		}
		else if(strVal.charAt(0)=="-"){
					//alert("Negative numbers are not allowed - in "+ctlErrName);
					OpenPopupScreen(18);
					return false;
		}
		else if(strVal.charAt(0)=="+"){
					//alert("Special characters are not allowed - in "+ctlErrName);
					OpenPopupScreen(18);
					return false;
		}
		else if(strVal.charAt(0)=="0" && strVal.substring(0,strVal.indexOf(".")).length >1 && strVal.indexOf(".")!=-1){
					//alert("Sorry !! first digit cannot be zero!! - in "+ctlErrName);
					//OpenPopupScreen(18);
					return true;
					
		}
		else if(strVal.indexOf(".")!=-1){
				var b=strVal.substring(strVal.indexOf(".")+1,strVal.length);
				if(b.length>4){
					//alert("In the paise part you have entered more than two digits - in "+ctlErrName);
					OpenPopupScreen(18);
					return false;
				}
				else if(FullName.charAt(3)=="R" && parseFloat(strVal)<=0){
					//alert("Amount should be greater than zero !!");
					OpenPopupScreen(18);
					return false;	
				}
				else{
					return true;
				}
		}
		else if(FullName.charAt(3)=="R" && parseFloat(strVal)<=0){
			//alert("Amount should be greater than zero !!");
			OpenPopupScreen(18);
			return false;	
		}


		else{
			return true;
		}

}


function isInteger(strVal){
	var validStr='0123456789';
	var temp;
	for (var i=0; i<strVal.length; i++) {
		temp =  strVal.substring(i,i+1);
		if (validStr.indexOf(temp) == -1)  return false ;
	}
	return true ;

}

function isNegative(strVal){
	var validStr='-0123456789.';
	var temp;
	for (var i=0; i<strVal.length; i++) {
		temp =  strVal.substring(i, i+1);
		if (validStr.indexOf(temp) == -1)  return false ;
	}
	return true ;

}
function isFloat(strVal){
	var validStr='0123456789.';
	var temp;
	for (var i=0; i<strVal.length; i++) {
		temp =  strVal.substring(i, i+1);
		if (validStr.indexOf(temp) == -1)  return false ;
	}
	if (isNaN(strVal))	
		return false;
	return true ;

}


function isTelephone(strVal){
	var validStr=' 0123456789-()abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
	var temp;
	for (var i=0; i<strVal.length; i++) {
		temp =  strVal.substring(i, i+1);
		if (validStr.indexOf(temp) == -1)  return false ;
	}

	if  (strVal.substring(1)=="-")
		return false;

	return true ;

}


function isPinCode(strVal){
	var validStr='0123456789-()abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
	var temp;
	//if (strVal.length>6)
	//	return false;
	
	for (var i=0; i<strVal.length; i++) {
		temp =  strVal.substring(i, i+1);
		if (validStr.indexOf(temp) == -1)  return false ;
	}
	return true ;

}



function isFax(strVal){

	var validStr=' 0123456789-()abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
	var temp;
	for (var i=0; i<strVal.length; i++) {
		temp =  strVal.substring(i, i+1);
		if (validStr.indexOf(temp) == -1)  return false ;
	}
	return true ;

}
function isFolderName(strVal,ctlErrName){
	var validStr='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
	var temp;
	for (var i=0; i<strVal.length; i++) {
		temp =  strVal.substring(i, i+1);
		//if(temp=="\'") return false;
		if (validStr.indexOf(temp) == -1){
			alert("Only alphanumeric characters are allowed in - "+ctlErrName);
			 return false ;
		}	
	}
	return true ;
}
function isText(strVal){	
	var validStr="0123456789-abcdefghijklmnopqrstuvwxyz |'\"`~!%&@#$^&*()-_=+/{}[],.:;<>?\\ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	var temp;
	for (var i=0; i<strVal.length; i++) {
		temp =  strVal.substring(i, i+1);
		//if(temp=="\'") return false;
		//alert(strVal.charCodeAt(i));
		if(strVal.charCodeAt(i)!=13 && strVal.charCodeAt(i)!=10){
			if (validStr.indexOf(temp) == -1)  return false ;
		}
	}
	return true ;

}
function isTextOthers(strVal){	
	var validStr='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
	var temp;
	for (var i=0; i<strVal.length; i++) {
		temp =  strVal.substring(i, i+1);
		//if(temp=="\'") return false;
		//alert(strVal.charCodeAt(i));
		if(strVal.charCodeAt(i)!=13 && strVal.charCodeAt(i)!=10){
			if (validStr.indexOf(temp) == -1)  return false ;
		}
	}
	return true ;

}
function isPassword(strVal){
	var validStr='0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
	var temp;
	for (var i=0; i<strVal.length; i++) {
		temp =  strVal.substring(i, i+1);
		if (validStr.indexOf(temp) == -1)  return false ;
	}
	return true ;

}


function isEMail(strVal){


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



function isDate(strVal,dateFormat){

      var val=strVal;
       var datePat = /^(\d{1,2})(\/|-)(\d{1,2})\2(\d{2,4})$/;
       var matchArray = val.match(datePat)
	if (matchArray == null)
		return false

// for dd/mm/yyyy format. For mm/dd/yyyy format month=matchArray[1] and day=matchArray[3]

	if (dateFormat.toLowerCase()=="dd/mm/yyyy"){
		month = matchArray[3]	// month
		day = matchArray[1]	// day
	}
	else{
		month = matchArray[1]	// month
		day = matchArray[3]	// day
	}
	year = matchArray[4]
	
	if(parseFloat(year)==0)
		return false
	
	if (month < 1 || month > 12)
		return false

	if (day < 1 || day > 31)
		return false

	if ((month==4 || month==6 || month==9 || month==11) && day==31)
		return false

	if (month == 2)
	{
		var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0))
		if (day>29 || (day==29 && !isleap))
			return false;
	}
	if(year < 1900){
		return false;
	}
        //if(year.length < 4) 
	//{
	//	return false;
	//}
	return true;

}

function TextareaLengthChecker(frmName,ObjName,Max)
{
  var temp=document.forms[0].elements[ObjName].value;
  if (temp.length>Max)
   {
	if (ObjName.substring(3,4)=="R")	
	 {	
alert(ObjName.substring(ObjName.indexOf('R')+1,ObjName.length)+'  ' + 'should not exceed' +' ' + Max +' ' + 'Characters');
		document.forms[0].elements[ObjName].focus();
		return false;
	 }	
	else
	 {

alert(ObjName.substring(ObjName.indexOf('O')+1,ObjName.length)+' ' +'should not exceed' +' ' + Max +' ' + 'Characters');
		document.forms[0].elements[ObjName].focus();
		return false;
	}	
  }	
 else
  return true;				
}

// This function is used to check the relation between from date and to date present in the combo boxes 
function doAdminSubmitCheckFromToDate(frmName,hdnValue,CurrDate){

function RetSeldVal(pfrmName,pename){
return document.forms[pfrmName].elements[pename].options[document.forms[pfrmName].elements[pename].selectedIndex].value;
}


FromDay=RetSeldVal(frmName,'SelRFromDate');
FromMonth=RetSeldVal(frmName,'SelRFromMonth');
FromYear=RetSeldVal(frmName,'SelRFromYear');
ToDay=RetSeldVal(frmName,'SelRToDate');
ToMonth=RetSeldVal(frmName,'SelRToMonth');
ToYear=RetSeldVal(frmName,'SelRToYear');

	var CurrentDate=new Date(CurrDate);
	var FromDate=new Date(FromMonth+'/'+FromDay+'/'+FromYear);
	var ToDate=new Date(ToMonth+'/'+ToDay+'/'+ToYear);
	var CurrentDate2GMT=CurrentDate.toGMTString();
	var FromDate2GMT=FromDate.toGMTString();
	var ToDate2GMT=ToDate.toGMTString();
	var CurrentDateParse=Date.parse(CurrentDate2GMT);
	var FromDateParse=Date.parse(FromDate2GMT);
	var ToDateParse=Date.parse(ToDate2GMT);

//----------------to check whether it is a valid or not--------------------------

function check4validatedate(day,month,year,FromorTo,FormName){
var a="SelR"+FromorTo+"Date";
var dd=0;
	if (month < 1 || month > 12){

		alert("Invalid "+ FromorTo +" Date");
		document.forms[frmName].elements[a].focus();
		dd=1;
		//return false;
		}

	if (day < 1 || day > 31){
		alert("Invalid "+ FromorTo +" Date");
		document.forms[frmName].elements[a].focus();
		dd=1;//return false;
		}

	if ((month==4 || month==6 || month==9 || month==11) && day==31){
		alert("Invalid "+ FromorTo +" Date");
		document.forms[frmName].elements[a].focus();
		dd=1;//return false;
		}
	if (month == 2)
	{
		var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0))
		if (day>29 || (day==29 && !isleap)){
		alert("Invalid "+ FromorTo+" Date");
		document.forms[frmName].elements[a].focus();
		dd=1;//return false;
		}
	}
if(dd==0){
	return true;
	}
	//if(!(month < 1 || month > 12) && !(day < 1 || day > 31) && !((month==4 || month==6 || month==9 || month==11) && day==31) && !( (month == 2)&& (day>29 || (day==29 && !(year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)))) ) ){
	//	return true;
//}


}
var From=check4validatedate(FromDay,FromMonth,FromYear,'From',frmName);
var To=check4validatedate(ToDay,ToMonth,ToYear,'To',frmName);


		if(eval(CurrentDateParse-FromDateParse)<0 && !(!From || !To)){
			alert("From date should be less than \n               OR             \n  equal to Current date");
			document.forms[frmName].SelRFromDate.focus();
			//return false;
		}
		else if(eval(CurrentDateParse-ToDateParse)<0  && !(!From || !To)){
			alert("To date should be less than \n               OR             \n  equal to Current date   ");
			document.forms[frmName].SelRToDate.focus();
			//return false;
		}
		else if( !(!From || !To)){
				if(eval(ToDateParse-FromDateParse)>=0){
					doAdminSubmit(frmName,hdnValue);
				}
				else{
					alert("From date should be less than \n               OR             \n  equal to To date");
					document.forms[frmName].SelRFromDate.focus();
					//return false;
				}
		}
}
//This function is used to Check if the entered date is greater than the current date
function Check4Date(FormName,DateFieldName,CurrDate){
	DateFieldName=DateFieldName.replace("_"," ");
	var sysdate=new Date();
//	var d1=sysdate.getDate();
//	var m1=sysdate.getMonth()+1;
//	var y1=sysdate.getYear();
//	var SysDateStr=m1+'/'+d1+'/'+y1;
	var SysDateStr=CurrDate;
	var date1=new Date(SysDateStr);			
	var input=document.forms[FormName].elements[DateFieldName].value;	
	var d2=input.substring(0,input.indexOf("/"));	
	var m2=input.substring(input.indexOf("/")+1,input.lastIndexOf("/"));
	var y2=input.substring(input.lastIndexOf("/")+1,input.length);
	var date2Str=m2+'/'+d2+'/'+y2;
//alert(date2Str);
//alert(SysDateStr);
	var date2=new Date(date2Str);
	var date1gmtstring=date1.toGMTString();
	var date2gmtstring=date2.toGMTString();
	var date1parse=Date.parse(date1gmtstring);
	var date2parse=Date.parse(date2gmtstring);
	var diff=(date2parse-date1parse);
//----------------to check whether it is a valid or not--------------------------

		if (eval(diff)>0){
			alert("Sorry !! Date sholud not be greater than the current date !!");
			document.forms[FormName].elements[DateFieldName].focus();
			return false;
		}
return true;
}
function maxpic(page,width,height)
{
	var myBars='directories=no,location=no,menubar=no,status=no';
	myBars+=',titlebar=no,toolbar=no';
	var myOptions='scrollbars=yes,width='+width+',height='+height+',resizable=no';
	var myFeatures=myBars+' '+myOptions;
	newWin = open(page,'myOptions',myFeatures);
}
function OpenNormalWindow(page,width,height)
{
//	var myBars='directories=yes,location=yes,menubar=yes,status=yes';
//	myBars+=',titlebar=yes,toolbar=yes';
//	var myOptions='width='+width+'left=0,top=0,height='+height;
//	var myFeatures=myOptions;
//	newWin = open(page,'myOptions',myFeatures);
	newWin = open(page,'_blank','directories=yes,location=yes,menubar=yes,status=yes,titlebar=yes,toolbar=yes,width='+width+',height='+height+',left=0,top=0');

}
function Check4LessEqual2CurrDate(FormName,DateFieldName,CurrDate){
//alert(CurrDate);
	//DateFieldName=DateFieldName.replace("_"," ");
	var sysdate=new Date();
	var SysDateStr=CurrDate;
	var date1=new Date(SysDateStr);			
	var input=document.forms[FormName].elements[DateFieldName].value;	
	var m2=input.substring(0,input.indexOf("/"));	
	var d2=input.substring(input.indexOf("/")+1,input.lastIndexOf("/"));
	var y2=input.substring(input.lastIndexOf("/")+1,input.length);
	var date2Str=m2+'/'+d2+'/'+y2;
	var date2=new Date(date2Str);
	var date1gmtstring=date1.toGMTString();
	var date2gmtstring=date2.toGMTString();
	var date1parse=Date.parse(date1gmtstring);
	var date2parse=Date.parse(date2gmtstring);
	var diff=(date2parse-date1parse);
// alert(date1);
//alert(date2);
//alert(eval(diff));
		if (eval(diff)>0){
			alert("Sorry !! "+DateFieldName.substring(4,DateFieldName.length).replace("_"," ")+" cannot be greater than the current date !!");
			document.forms[FormName].elements[DateFieldName].focus();
			return false;
		}
return true;
}

function Check4GreaterThanCurrDate(FormName,DateFieldName,CurrDate){
	//DateFieldName=DateFieldName.replace("_"," ");
	var sysdate=new Date();
	var SysDateStr=CurrDate;
	var date1=new Date(SysDateStr);			
	var input=document.forms[FormName].elements[DateFieldName].value;	
	var m2=input.substring(0,input.indexOf("/"));	
	var d2=input.substring(input.indexOf("/")+1,input.lastIndexOf("/"));
	var y2=input.substring(input.lastIndexOf("/")+1,input.length);
	var date2Str=m2+'/'+d2+'/'+y2;
	var date2=new Date(date2Str);
	var date1gmtstring=date1.toGMTString();
	var date2gmtstring=date2.toGMTString();
	var date1parse=Date.parse(date1gmtstring);
	var date2parse=Date.parse(date2gmtstring);
	var diff=(date2parse-date1parse);
		if (eval(diff)<=0){
			alert("Sorry !! "+DateFieldName.substring(4,DateFieldName.length).replace("_"," ")+" should be greater than the current date !!");
			document.forms[FormName].elements[DateFieldName].focus();
			return false;
		}
return true;
}
function Check4GreaterThanCurrDate1(FormName,DateFieldName,CurrDate,DateFormat){
	//DateFieldName=DateFieldName.replace("_"," ");
	var sysdate=new Date();
	var SysDateStr=CurrDate;
	var date1=new Date(SysDateStr);			
	var input=document.forms[FormName].elements[DateFieldName].value;	
	var m2=input.substring(0,input.indexOf("/"));	
	var d2=input.substring(input.indexOf("/")+1,input.lastIndexOf("/"));
	var y2=input.substring(input.lastIndexOf("/")+1,input.length);
	if(DateFormat.toUpperCase()=="MM/DD/YYYY")
		var date2Str=m2+'/'+d2+'/'+y2;
	else if(DateFormat.toUpperCase()=="DD/MM/YYYY")
		var date2Str=d2+'/'+m2+'/'+y2;

	var date2=new Date(date2Str);
	var date1gmtstring=date1.toGMTString();
	var date2gmtstring=date2.toGMTString();
	var date1parse=Date.parse(date1gmtstring);
	var date2parse=Date.parse(date2gmtstring);
	var diff=(date2parse-date1parse);
		if (eval(diff)<=0){
			alert("Sorry !! "+DateFieldName.substring(4,DateFieldName.length).replace("_"," ")+" should be greater than the current date !!");
			document.forms[FormName].elements[DateFieldName].focus();
			return false;
		}
return true;
}
function Check4GreaterThanEqual2CurrDate(FormName,DateFieldName,CurrDate){
	//DateFieldName=DateFieldName.replace("_"," ");
	var sysdate=new Date();
	var SysDateStr=CurrDate;
	var date1=new Date(SysDateStr);			
	var input=document.forms[FormName].elements[DateFieldName].value;	
	var m2=input.substring(0,input.indexOf("/"));	
	var d2=input.substring(input.indexOf("/")+1,input.lastIndexOf("/"));
	var y2=input.substring(input.lastIndexOf("/")+1,input.length);
	var date2Str=m2+'/'+d2+'/'+y2;
	var date2=new Date(date2Str);
	var date1gmtstring=date1.toGMTString();
	var date2gmtstring=date2.toGMTString();
	var date1parse=Date.parse(date1gmtstring);
	var date2parse=Date.parse(date2gmtstring);
	var diff=(date2parse-date1parse);
		if (eval(diff)<0){
			alert("Sorry !! "+DateFieldName.substring(4,DateFieldName.length).replace("_"," ")+" should be greater than or equal to the current date !!");
			document.forms[FormName].elements[DateFieldName].focus();
			return false;
		}
return true;
}


function CheckClientDate(FormName,DateFieldName,CurrDate){
	//DateFieldName=DateFieldName.replace("_"," ");
	var sysdate=new Date();
	var SysDateStr=CurrDate;
	var date1=new Date(SysDateStr);			
	var input=document.forms[FormName].elements[DateFieldName].value;	
	var d2=input.substring(0,input.indexOf("/"));	
	var m2=input.substring(input.indexOf("/")+1,input.lastIndexOf("/"));
	var y2=input.substring(input.lastIndexOf("/")+1,input.length);
	var date2Str=m2+'/'+d2+'/'+y2;
	var date2=new Date(date2Str);
	var date1gmtstring=date1.toGMTString();
	var date2gmtstring=date2.toGMTString();
	var date1parse=Date.parse(date1gmtstring);
	var date2parse=Date.parse(date2gmtstring);
	var diff=(date2parse-date1parse);
		if (eval(diff)<=0){
			alert("Sorry !! "+DateFieldName.substring(4,DateFieldName.length).replace("_"," ")+" should be greater than the current date !!");
			document.forms[FormName].elements[DateFieldName].focus();
			return false;
		}
return true;
}



function DateDiff(firstDate,secondDate,dateFormat){
// Send FirstDate and Seconddate in mm/dd/yyyy format
	if (dateFormat.toUpperCase()=="DD/MM/YYYY"){

		var d1=firstDate.split("/");	
		var date1Str=d1[1]+'/'+d1[0]+'/'+d1[2];
		var date1=new Date(date1Str);			
		var d2=secondDate.split("/");	
		var date2Str=d2[1]+'/'+d2[0]+'/'+d2[2];
		var date2=new Date(date2Str);			
	}
	else{
	var date1=new Date(firstDate);			
	var date2=new Date(secondDate);
	}
	var date1gmtstring=date1.toGMTString();
	var date2gmtstring=date2.toGMTString();
	var date1parse=Date.parse(date1gmtstring);
	var date2parse=Date.parse(date2gmtstring);
	var diff=(date1parse-date2parse);
	return diff;
}

function replace_(strT){
	var tempStr;
	tempStr='';
	for (var sl=0;sl<strT.length;sl++){
			tempStr=tempStr+strT.substring(sl, sl+1).replace("_"," ");
		}
	return tempStr;
}

function SetStatus(a){
	window.status=a;
}
/***************   Scrollers for window status        ***********************/
var x1 = 0
  var y1 = 0
  var z1 = 140
  var delay1 = 40
  var text1="Pro-MATE Your Project Partner...."
  while (y1 ++ < z1) {
  text1 = " " + text1
  }

  function scroller1() {
//  window.status = text1.substring(x1++, text1.length);

  if (x1 == text1.length)  {
  x1 = 0;
  }
  setTimeout("scroller1()", delay1);
  }

  scroller1();

/********************      End       ******************/


/*********Navigate function*************/
function Navigate(strStartRow,SBY,SN,frmName){
		if (document.forms[frmName].HdnOAction.value=='Search'){
			document.forms[frmName].HdnOAction.value='Search'
		}
		document.forms[frmName].HdnOStartRow.value=strStartRow;
		document.forms[frmName].HdnOSortNature.value=SN;
		document.forms[frmName].HdnOOrderBy.value=SBY;
		document.forms[frmName].submit();
	}

/*********Sort function*************/
	function doSort(SBY,SN,frmName)
	{
		if (document.forms[frmName].HdnOAction.value=='Search'){

			document.forms[frmName].HdnOAction.value='Search'
		}

		document.forms[frmName].HdnOSortNature.value=SN;
		document.forms[frmName].HdnOOrderBy.value=SBY;
		document.forms[frmName].submit();
	}

/********Function to find the difference between the date passed and current date**************************/
	function Datediff(D1)
	{

		var sysdate=new Date();
		var d1=sysdate.getDate();
		var m1=sysdate.getMonth()+1;
		var y1=sysdate.getYear();
		var SysDateStr=m1+'/'+d1+'/'+y1;
		var date1=new Date(SysDateStr);			
		var input=D1;	
		var d2=input.substring(0,input.indexOf("/"));	
		var m2=input.substring(input.indexOf("/")+1,input.lastIndexOf("/"));
		var y2=input.substring(input.lastIndexOf("/")+1,input.length);
		if (y2.length<4)
			y2="20"+y2;
		var date2Str=d2+'/'+m2+'/'+y2;
		var date2=new Date(date2Str);
		var date1gmtstring=date1.toGMTString();
		var date2gmtstring=date2.toGMTString();
		var date1parse=Date.parse(date1gmtstring);
		var date2parse=Date.parse(date2gmtstring);
		var diff=(date2parse-date1parse);
		if (eval(diff)>0)
		{
			flag=1;
			return flag;
		}
	}


	function autoTab(txtBox, strLength, frmName, nextTextBox){
		var currentEntry = txtBox;
		var nextEntry = document.forms[frmName].elements[nextTextBox];		
		if(nextEntry == null){
			nextEntry = document.forms[1].elements[nextTextBox];
		}		
			if(txtBox.value.length == strLength)
				nextEntry.focus();
		
	}



/******************** Function to count the number of years between two given dates ******************/
// Send FirstDate and Seconddate in dd/mm/yyyy format - Added by Ramesh
function countYears(FirstDate,Seconddate)
 {
	
	var x = FirstDate.split('/'),
		y = Seconddate.split('/'),
		yrCount = 0;
	// Convert to dates
	var date0 = new Date(x[2],x[1]-1,x[0]);
	var date1 = new Date(y[2],y[1]-1,y[0]);
	while (addYr(date0) <= date1)
	{
		date0 = addYr(date0);
		yrCount++;
	}
	return yrCount;
}

function addYr(a) 
{
	return new Date( check2k(1*a.getYear()+1),a.getMonth(),a.getDate());
}

function check2k(a)
{
	return (a<1900)?a -= -1900:a;
}
/********************      End       ******************/


/******************** Alert Message ******************/
function DisplayAlert(MsgId)
{
	var BooStatus
	switch (MsgId)
	{
		//Upto 14 Shipping and Logistics is used
		case "1":
			BooStatus = confirm('Do you want to Save ?');
			return BooStatus;
		case "2":
			BooStatus = confirm('Do you want to Save Changes?');
			return BooStatus;
		case "3":
			BooStatus = confirm('Do you want to Delete ?');
			return BooStatus;
		case "4" :
			alert( "Fill the Row ");
			return;
		case "5" : 
			BooStatus = confirm('Do you want to Delete this Row?');
			return BooStatus;
		case "6" : 	
			alert('Enter any Text to Search');
			return;
		case "7" : 	
			alert('Collection Time and Departure Time cannot be same at the same Date');
			return;
		case "8" : 	
			alert('Collection Time cannot be less than Departure Time at the same Date');
			return;
		case "9" : 	
			alert('Enter the Data for Truck');
			return;
               		
		case "10" : 	
			alert('Departure Date Cannot be Greater than Collection Date');
			return;	
		case "11" : 	
			alert('To Date Should Be Greater Than Or Equal To From Date');
			return;
		case "12" : 	
			alert('GST Percentage should be Less than 100 !');
			return ;
		case "13" :
			alert('Delivery Time Cannot be less than Collection Time');
			return;
		case "14" :
			alert('From Date should be greater than or equal to Current Date !');
			return;
		case "15" :
			alert('Select any Group !');
			return;
		case "16":
			alert('Description is Required');
			return;
		case "17":
			alert('Attribute is Required');
			return;	
		case "18" :
			alert('No of Subject should be less than Selected Subject');
			return;
		case "19" :
			alert('Name is Required');
			return;
		case "20" :
			alert('No of Subject cannot be blank');
			return;
		case "21" :
			alert('Enter atleast one record');
			return;
		case "22" :
			alert('Access denied for Addition/Modification');
			return;
		case "23" :
			alert('Access denied');
			return;
		case "24" :
			alert('Level Code should be 3 Characters');
			return;
		case "25" :
			alert('Text Book is Required');
			return;
		case "26" :
			alert('Course is Required');
			return;
		case "27" :
			BooStatus = confirm('Do you want to remove students from this batch?..');
			return BooStatus;						
		case "28" :
			BooStatus = confirm('Are you sure to Admit the Student ?');
			return BooStatus;
		case "29":
			BooStatus = confirm('The related exam groups for this may also be deleted.Do you want to Delete ?');
			return BooStatus;
		case "30":
			alert('Section is Required');
			return;
		case "31":
			alert('Attendance Date Should not be greater than Current Date');
			return;	
		case "32":
			alert('From Date Should not be greater than To  Date');
			return;
		case "33":
			alert('To Date Should not be greater than Current  Date');
			return;	
		case "34":
			alert('Password does not match');
			return;
		case "35":
			alert('Old password is wrong');
			return;
		case "36":
			alert('Select atleast one Record to remove');
			return;	
		case "37":
			alert('Old and New password are same');
			return;
		case "38":
			alert('Zero not allowed');
			return;
		case "39":
			alert('Choose a date between the Start year & End year!..');
			return;
		
		case "40":
			alert('Already Exists!..');
			return; 
		case "41":
			BooStatus = confirm('Do you want to Remove?');
			return BooStatus; 
		case "42":
			alert("'Facility Type' is Required");
			return;
		case "43":
			alert('Select a Facility Type to Add Facility');
			return;
		case "44":
			alert('Select/Add a Facility Type to Add Facility');
			return;
		case "45":
			alert('Please select any information and then save !!');
			return;		
		case "46":
			alert('Select atleast one Document for the Student ! ! !');
			return;				
		case "47":
			alert('Returned Date should be greater than Received Date');
			return;		
		case "48":
			alert('Received Date is Required');
			return;	
		case "49":
			alert('Remarks should not exceed 100 characters');
			return;	
		case "50":
			alert('Check atleast one Student Add/Edit Activity');
			return;	
		case "51":
			alert('Check atleast one Staff Add/Edit Activity');
			return;
		case "52":
			alert('Check atleast one Student for the Academic Year');
			return;
		case "53":
			alert('Address Field should not exceed 100 characters');
			return;
		case "54":
			alert('Select a Activity Type to add Activity');
			return;
		case "55":
			alert('Check atleast one Student to Add/Edit Scholarship !');
			return;
		case "56":
			alert('Number of Records per page should be greater than Zero!');
			return;	
		case "57":
			alert('Date - Required');
			return;	
		case "58":
			alert('Amount - Required');
			return;	
		case "59":
			BooStatus = confirm('Scheduled Periods crosses Allocated periods, Want to Proceed ?');
			return BooStatus;	
		case "60":
			alert('From Date Should not be greater than To Date');
			return;	
		case "61":
			alert('Invalid Entry');
			return;	
		case "62":
			alert('Value Required');
			return;	
		case "63":
			alert('Select the ItemType');
			return;	
		case "64":
			alert('Select atleast one Item !!!');
			return;	
		case "65" :
			alert( "Access denied for Approve !!! ");
			return;
		case "66" :
			alert( "Date should not be greater than Current Date ! ");
			return;
		case "67" :
			alert( "Item Rate - Required !!! ");
			return;
		case "68" :
			alert( "Lead Time - Required !!! ");
			return;
		case "69" :
			alert( "Discount - Required !!! ");
			return;
		case "70" :
			alert( "As On Date - Required !!! ");
			return;
		case "71":
			BooStatus = confirm('Do you want Transfer ?');
			return BooStatus;	
		case "72":
			BooStatus = confirm('Do you want to Approve ?');
			return BooStatus;
		case "73":
			BooStatus = confirm('Given Quantity is greater than Pending Quantity Do you want to Continue ?');
			return BooStatus;
		case "74" :
			alert( "Given Quantity is greater then Total Quantity!!! ");
			return;
		case "75" :
			alert( "Given Quantity is greater then Receipt Quantity!!! ");
			return;
		case "76" : 	
			BooStatus = confirm('Facility has been already allocated to batch(s)\nWant to Share the facility ?');
			return BooStatus;
		case "77":
			alert( "Access denied for Transfer !!! ");
			return;
		case "78":
			alert( "Date should not be less than Purchase Order date !!! ");
			return;
		case "79":
			alert('Check atleast one Student Add/Edit Incentive');
			return;	
		case "80":
			alert('Check atleast one Staff Add/Edit Incentive');
			return;
		case "81" : 	
			alert('Event Date should be greater than or Equal to Current Date !');
			return;
		case "82" :
			alert( "Given Quantity is greater then Issued Quantity!!! ");
			return;
		case "83":
			alert('Check atleast one Student to Assign Document');
			return;
		case "84":
			alert('Exceeds Safety Stock');
			return;
		case "85" :
			alert( "Given Quantity is greater then Total Quantity!!! ");
			return;
		case "86" :
			BooStatus = confirm('Do you want to Send Email ?');
			return BooStatus;
		case "87" :
			alert('Application Date should be greater than Birth Date !');
			return;
		case "88" :
			alert('Incentive Amount Should be greater than 0 !');
			return;
		case "89" :
			alert('From Date Should not be Greater than Current Date !');
			return;
		case "90" :
			alert('Scholarship Amount Should be greater than 0 !');
			return;
		case "91" :
			alert('Description should not exceed 200 characters !');
			return;
		case "92" :
			alert('Amount should be greater than 0 !');
			return;
		case "93" :
			alert('Occupation Description should not exceed 250 characters !');
			return;
		case "94" :
			alert("'First Name' or 'Last Name' or 'Student Id' is Required");
			return;
		case "95" :
			alert("'Sponser Name' is Required");
			return;
		case "96" :
			alert('Scholarship Amount is Required !');
			return;
		case "97" :
			alert("Only Numbers are allowed in Amount");
			return;
		case "98" :
			alert("Invalid Date of Birth");
			return;
		case "99" :
			alert("'Number of Relatives' is Required");
			return;
		case "100" :
			alert("'Number of Relatives' should be greater than 0");
			return;
		case "101" :
			alert("Enter the Branch they study is Required");
			return;
		case "102" :
			alert("Relative Branch should not exceed 50 characters");
			return;
		case "103" :
			BooStatus = confirm('Do you want copy Fee Structures ?');
			return BooStatus;
		case "104" :
			alert('Expiry Date should be greater than Current Date');
			
		case "105" :
			BooStatus = confirm('Do you want Import Data?');
			return BooStatus;
		case "106" :
			BooStatus = confirm('Do you want Transfer  Data?');
			return BooStatus;
		case "107" :
			BooStatus = confirm('Do you want to Close ?');
			return BooStatus;
	        
			
	}
}


function DoDelete()
{
  if (DisplayAlert("3"))
  {
	return true;
  }
 	 return false;
}


function TimeDiff(CTime1, CTime2)
{
	var strTime1,strTime2;
	var tArr_1=CTime1.split(':');
	var strAMPM=tArr_1[1].substring(3,5);

	if(strAMPM.toUpperCase()=="PM")
		{
		  if(tArr_1[0]==12)
		   strTime1=(tArr_1[0]*60)+parseInt(tArr_1[1].substring(0,2));
		  else
	   	   strTime1=((tArr_1[0]+12)*60)+parseInt(tArr_1[1].substring(0,2));
	   	}  
	else
		{
			if(tArr_1[0]==12)
				strTime1=parseInt(tArr_1[1].substring(0,2))
			else
				strTime1=(tArr_1[0]*60)+parseInt(tArr_1[1].substring(0,2));
		}	

	var tArr_2=CTime2.split(':');
	strAMPM=tArr_2[1].substring(3,5);

	if(strAMPM.toUpperCase()=='PM')
		if(tArr_2[0]==12)	
			strTime2=((tArr_2[0])*60)+parseInt(tArr_2[1].substring(0,2));
		else	
			strTime2=((tArr_2[0]+12)*60)+parseInt(tArr_2[1].substring(0,2));		
	else
		if(tArr_2[0]==12)
			strTime2=parseInt(tArr_2[1].substring(0,2))
		else
			strTime2=(tArr_2[0]*60)+parseInt(tArr_2[1].substring(0,2));

	var strtime=strTime2-strTime1	
		
	if((strTime2-strTime1)<0)
		return "0";
	else if((strTime2-strTime1)==0)	
		return "1";
	else
		return "2";
}
/********************      End       ******************/

function getCheckOrRadioValue(ControlType,ControlName,FormName){
	var objControl,intCounter;
	for (intCounter=0;intCounter < document.forms[FormName].elements.length;intCounter++){
		objControl = document.forms[FormName].elements[intCounter];
		if (objControl.type == ControlType && objControl.name==ControlName && objControl.checked){
			return objControl.value;
		}
	}
	return "";
}//getCheckOrRadioValue(ControlType,ControlName,FormName)

function chkCheckOrRadioValue(ControlType,ControlName,FormName){
	var objControl,intCounter;
	for (intCounter=0;intCounter < document.forms[FormName].elements.length;intCounter++){
		objControl = document.forms[FormName].elements[intCounter];
		if (objControl.type == ControlType && objControl.name==ControlName && !objControl.checked){
			return objControl.value;
		}
	}
	return "";
}//getCheckOrRadioValue(ControlType,ControlName,FormName)