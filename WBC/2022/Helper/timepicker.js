
	var imagePath='../App_Themes/Default/TimePicker/';

	var iexp=document.all;
	var dome=document.getElementById;
	var ns4n=document.layers;
	var booShow=false;
	var textCtl;

	function setTimePicker(t) {
		textCtl.value=t;
		closeTimePicker();
	}

	function refreshTimePicker(mode)
	{

		if (mode==0)
		{
			suffix="am";
		}
		else
		{
			suffix="pm";

		}

		sHTML = "<table><tr><td><table cellpadding=1 cellspacing=0 border=0 bordercolor='#D4E4F0' border-style: solid  bgcolor='white'>";

		/*if (mode==1)
		{
			for (i=12;i<=23;i++)
			{

				sHTML+="<tr align=right style='font-family:verdana;font-size:10px;color:#000000;'>";

				if (i==0) {
					hr = 24;
				}
				else {
					hr=i;
					//hr+=12
				}
				for (j=0;j<12;j++)
				{
					//sHTML+="<td width=57 style='cursor:hand' onmouseover='this.style.backgroundColor=\"#D4E4F0\"' onmouseout='this.style.backgroundColor=\"\"' onclick='setTimePicker(\""+ hr + ":" + padZero_T(j*15) + " " + suffix + "\")'><a style='text-decoration:none;color:#000000' href='javascript:setTimePicker(\""+ hr + ":" + padZero_T(j*15) + " " + suffix + "\")'>" + hr + ":"+padZero_T(j*15) + "<font color=\"#808080\">" + suffix + "</font></a></td>";
					if(j==6)
					{
						sHTML+="<td width=57 style='cursor:hand' onmouseover='this.style.backgroundColor=\"#D4E4F0\"' onmouseout='this.style.backgroundColor=\"\"' onclick='setTimePicker(\""+ hr + ":" + padZero_T(j*5) + " " + suffix + "\")'><a style='text-decoration:none;color:#000000' href='javascript:setTimePicker(\""+ hr + ":" + padZero_T(j*5) + " " + suffix + "\")'>" + hr + ":"+padZero_T(j*5) + "<font color=\"#808080\">" + suffix + "</font></a></td>";
						sHTML+="</tr>";
						sHTML+="<tr align=right style='font-family:verdana;font-size:10px;color:black;'>";
					}
					else
					{
					//	sHTML+="<td width=57 style='cursor:hand' onmouseover='this.style.backgroundColor=\"black\"' onmouseout='this.style.backgroundColor=\"\"' onclick='setTimePicker(\""+ hr + ":" + padZero_T(j*5) + " " + suffix + "\")'><a style='text-decoration:none;color:black' href='javascript:setTimePicker(\""+ hr + ":" + padZero_T(j*5) + " " + suffix + "\")'>" + hr + ":"+padZero_T(j*5) + "<font color=\"white\">" + suffix + "</font></a></td>";
						sHTML+="<td width=57 style='cursor:hand' onmouseover='this.style.backgroundColor=\"#D4E4F0\"' onmouseout='this.style.backgroundColor=\"\"' onclick='setTimePicker(\""+ hr + ":" + padZero_T(j*5) + " " + suffix + "\")'><a style='text-decoration:none;color:#000000' href='javascript:setTimePicker(\""+ hr + ":" + padZero_T(j*5) + " " + suffix + "\")'>" + hr + ":"+padZero_T(j*5) + "<font color=\"#808080\">" + suffix + "</font></a></td>";
					}
				}
			}
		}
		else
		{ */

			for (i=0;i<=11;i++)
			{
				sHTML+="<tr align=right style='font-family:verdana;font-size:10px;color:#000000;'>";
				if (i==0)
				{
					hr = 12;
				}
				else
				{
					hr=i;
				}

				for (j=0;j<12;j++)
				{
					//sHTML+="<td width=57 style='cursor:hand' onmouseover='this.style.backgroundColor=\"#D4E4F0\"' onmouseout='this.style.backgroundColor=\"\"' onclick='setTimePicker(\""+ hr + ":" + padZero_T(j*15) + " " + suffix + "\")'><a style='text-decoration:none;color:#000000' href='javascript:setTimePicker(\""+ hr + ":" + padZero_T(j*15) + " " + suffix + "\")'>" + hr + ":"+padZero_T(j*15) + "<font color=\"#808080\">" + suffix + "</font></a></td>";
					if(j==5)
					{
						sHTML+="<td width=57 style='cursor:hand' onmouseover='this.style.backgroundColor=\"#D4E4F0\"' onmouseout='this.style.backgroundColor=\"\"' onclick='setTimePicker(\""+ hr + ":" + padZero_T(j*5) + " " + suffix + "\")'><a style='text-decoration:none;color:#000000' href='javascript:setTimePicker(\""+ hr + ":" + padZero_T(j*5) + " " + suffix + "\")'>" + hr + ":"+padZero_T(j*5) + "<font color=\"#808080\">" + suffix + "</font></a></td>";
						sHTML+="</tr>";
						sHTML+="<tr align=right style='font-family:verdana;font-size:10px;color:#000000;'>";
					}
					else
					{
						sHTML+="<td width=57 style='cursor:hand' onmouseover='this.style.backgroundColor=\"#D4E4F0\"' onmouseout='this.style.backgroundColor=\"\"' onclick='setTimePicker(\""+ hr + ":" + padZero_T(j*5) + " " + suffix + "\")'><a style='text-decoration:none;color:#000000' href='javascript:setTimePicker(\""+ hr + ":" + padZero_T(j*5) + " " + suffix + "\")'>" + hr + ":"+padZero_T(j*5) + "<font color=\"#808080\">" + suffix + "</font></a></td>";
					}
				}
			}


			sHTML+="</tr>";
		//}

		sHTML += "</table></td></tr></table>";
		document.getElementById("timePickerContent").innerHTML = sHTML;
	}

	if (dome){
		document.write ("<div id='timepicker' style='z-index:+999;position:absolute;visibility:hidden;'><table style='border-width:3px;border-style:solid;border-color:#4891C6' bgcolor='#ffffff' cellpadding=0><tr bgcolor='#4891C6'><td><table cellpadding=0 cellspacing=0 width='100%' background='" + imagePath + "titleback.gif'><tr valign=bottom height=21><td style='font-family:verdana;font-size:11px;color:#ffffff;padding:3px' valign=center><B>&nbsp;&nbsp;Pick Time&nbsp;&nbsp;</B></td><td><img id='iconAM' src='" + imagePath + "am1.gif' onclick='document.getElementById(\"iconAM\").src=\"" + imagePath + "am1.gif\";document.getElementById(\"iconPM\").src=\"" + imagePath + "pm2.gif\";refreshTimePicker(0)' style='cursor:hand'></td><td><img id='iconPM' src='" + imagePath + "pm2.gif' onclick='document.getElementById(\"iconAM\").src=\"" + imagePath + "am2.gif\";document.getElementById(\"iconPM\").src=\"" + imagePath + "pm1.gif\";refreshTimePicker(1);' style='cursor:hand'></td><td align=right valign=center>&nbsp;<img onclick='closeTimePicker()' src='" + imagePath + "close.gif'  STYLE='cursor:hand'>&nbsp;</td></tr></table></td></tr><tr><td colspan=2><span id='timePickerContent'></span></td></tr></table></div>");
		refreshTimePicker(0);
	}

	var crossobj_T=(dome)?document.getElementById("timepicker").style : iexp? document.all.timepicker : document.timepicker;
	var currentCtl

	function selectTime(ctl,ctl2) {


		var leftpos_T=0
		var toppos_T=0
		textCtl=ctl2;


		currentCtl = ctl
		currentCtl.src=imagePath + "timepicker2.gif";

		aTag = ctl
		do {
			aTag = aTag.offsetParent;
			leftpos_T += aTag.offsetLeft;
			toppos_T += aTag.offsetTop;
		} while(aTag.tagName!="BODY");
		crossobj_T.left =	ctl.offsetLeft	+ leftpos_T
		crossobj_T.top = ctl.offsetTop +	toppos_T + ctl.offsetHeight +	2
		crossobj_T.visibility=(dome||iexp)? "visible" : "show"
		//hideElement_Time( 'SELECT', document.getElementById("calendar") );
		//hideElement_Time( 'APPLET', document.getElementById("calendar") );
		hideElement_Time( 'SELECT', document.getElementById("timepicker") );
		hideElement_Time( 'APPLET', document.getElementById("timepicker") );
		booShow = true;
	}

	// hides <select> and <applet> objects (for IE only)
	function hideElement_Time( elmID, overDiv ){
		if( iexp ){
			for( i = 0; i < document.all.tags( elmID ).length; i++ ){
				obj = document.all.tags( elmID )[i];
				if( !obj || !obj.offsetParent ){
						continue;

				}


				  // Find the element's offsetTop and offsetLeft relative to the BODY tag.
				  objLeft   = obj.offsetLeft;
				  objTop    = obj.offsetTop;
				  objParent = obj.offsetParent;

				  while( objParent.tagName.toUpperCase() != "BODY" )
				  {
					objLeft  += objParent.offsetLeft;
					objTop   += objParent.offsetTop;
					objParent = objParent.offsetParent;
				  }
				  objHeight = obj.offsetHeight;
				  objWidth = obj.offsetWidth;
				  //alert(objTop+","+objLeft+","+objWidth+","+objHeight+"OverDiv--)"+ overDiv.offsetLeft+","+ overDiv.offsetLeft+","+overDiv.offsetWidth+","+overDiv.offsetHeight)

				  if(( overDiv.offsetLeft + overDiv.offsetWidth ) <= objLeft );
				  else if(( overDiv.offsetTop + overDiv.offsetHeight ) <= objTop );
				  else if( overDiv.offsetTop >= ( objTop + objHeight ));
				  else if( overDiv.offsetLeft >= ( objLeft + objWidth ));
				  else
				  {
				  	//alert("Maatikichu")
					obj.style.visibility = "hidden";
				  }
			}
		}
	}

	//unhides <select> and <applet> objects (for IE only)
	function showElement_Time( elmID ){
		if( iexp ){
			for( i = 0; i < document.all.tags( elmID ).length; i++ ){
				obj = document.all.tags( elmID )[i];
				if( !obj || !obj.offsetParent ){
						continue;
				}
				obj.style.visibility = "";
			}
		}
	}

	function closeTimePicker() {
		crossobj_T.visibility="hidden"
		showElement_Time( 'SELECT' );
		showElement_Time( 'APPLET' );
		currentCtl.src=imagePath + "timepicker.gif"
		textCtl.focus();
	}

	document.onkeypress = function hideTimePicker1 () {
		if (event.keyCode==27){
			if (!booShow){
				closeTimePicker();
			}
		}
	}

	function isDigit(c) {

		return ((c=='0')||(c=='1')||(c=='2')||(c=='3')||(c=='4')||(c=='5')||(c=='6')||(c=='7')||(c=='8')||(c=='9'))
	}

	function isNumeric(n) {

		num = parseInt(n,10);

		return !isNaN(num);
	}

	function padZero_T(n) {
		v="";
		if (n<10){
			return ('0'+n);
		}
		else
		{
			return n;
		}
	}

	function validateDatePicker(ctl) {

 alert("hi");
		t=ctl.value.toLowerCase();
		t=t.replace(" ","");
		t=t.replace(".",":");
		t=t.replace("-","");

		if ((isNumeric(t))&&(t.length==4))
		{
			t=t.charAt(0)+t.charAt(1)+":"+t.charAt(2)+t.charAt(3);
		}

		var t=new String(t);
		tl=t.length;

		if (tl==1 ) {
			if (isDigit(t)) {
				//ctl.value=t+":00 am";
				ctl.value=t+":00 ";
			}
			else {
				return false;
			}
		}
		else if (tl==2) {
			if (isNumeric(t)) {
				if (parseInt(t,10)<13){
					if (t.charAt(1)!=":") {
						//ctl.value= t + ':00 am';
						ctl.value= t + ':00 ';

					}
					else {
						//ctl.value= t + '00 am';
						ctl.value= t + '00 ';

					}
				}
				else if (parseInt(t,10)==24) {
					//ctl.value= "0:00 am";
					ctl.value= "0:00 ";

				}
				else if (parseInt(t,10)<24) {
					if (t.charAt(1)!=":") {
						//ctl.value= (t-12) + ':00 pm';
						ctl.value= t + ':00';

					}
					else {
						//ctl.value= (t-12) + '00 pm';
						ctl.value= t + '00';

					}
				}
				else if (parseInt(t,10)<=60) {
					//ctl.value= '0:'+padZero_T(t)+' am';
					ctl.value= '0:'+padZero_T(t)+'';

				}
				else {
					//ctl.value= '1:'+padZero_T(t%60)+' am';
					ctl.value= '1:'+padZero_T(t%60)+'';

				}
			}
			else
   		    {
				if ((t.charAt(0)==":")&&(isDigit(t.charAt(1)))) {
					//ctl.value = "0:" + padZero_T(parseInt(t.charAt(1),10)) + " am";
					ctl.value = "0:" + padZero_T(parseInt(t.charAt(1),10)) + "";

				}
				else {
					return false;
				}
			}
		}
		else if (tl>=3) {
		alert("hi");

			var arr = t.split(":");
			if (t.indexOf(":") > 0)
			{
				hr=parseInt(arr[0],10);
				mn=parseInt(arr[1],10);
				alert(hr);
				alert(mn);

				if (t.indexOf("pm")>0) {
					//mode="pm";
					mode="";
				}
				else {
					//mode="am";
					mode="";
				}

				if (isNaN(hr)) {
					hr=0;
				} else {
					if (hr>24) {
						return false;
					}
					else if (hr==24) {
						//mode="am";
						mode="";
						hr=0;
					}
					else if (hr>12) {
						//mode="pm";
						mode="";
						hr-=12;

					}
				}

				if (isNaN(mn)) {
					mn=0;
				}
				else {
					if (mn>60) {
						mn=mn%60;
						hr+=1;
					}
				}
			} else {

				hr=parseInt(arr[0],10);
				alert(hr);

				if (isNaN(hr)) {
					hr=0;
				} else {
					if (hr>24) {
						return false;
					}
					else if (hr==24) {
						//mode="am";
						mode="";
						hr=0;
					}
					else if (hr>12) {
						//mode="pm";
						mode="";
					//	hr-=12;
						hr=0;
					}
				}

				mn = 0;
			}

			if (hr==24) {
				hr=0;
				//mode="am";
				mode="";
			}
			ctl.value=hr+":"+padZero_T(mn)+" "+mode;
		}
	}
