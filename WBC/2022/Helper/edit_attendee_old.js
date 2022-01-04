	var gControlNamePrefix="ctl00$CPHPageContent$";
	var gFormName = 0;
	function DoAttendValidateForm()
	{
		if(validateForm(gFormName))
		{
		return true;
		}
		else
		return false;
	}
	function callbackdesc1(res)
	{
		if (isError(res)) return false;
		alert(res.value);
		//alert("sdfsd");
	}
	function isError(res)
	{
		if(res.error)
		{
			alert("Error: " + res.error.Message);
			return true;
		}
		return false;
	}
	function callbackdesc2(res)
	{
		if (isError(res)) return false;
		alert(res.value);
		document.forms[0].submit();
	}
	function Update(i,s,Qualifier,j,k)
	{

		var PMF="";
		var PASS="";
		var fname="";
		var lname="";
		var eid="";
		//alert(j);alert(i);
		//alert(s);
		//alert(Qualifier);
		//return false;
		//var status="P";
		if(j==1) // && s!="A"
		{
			//alert("asdas1");
			PMF=document.getElementById('ctl00_CPHPageContent_TxtR'+Qualifier).value;
			//alert("asdas2");

			if(PMF=="")
			{
				alert("'"+Qualifier+"' is required");
				document.getElementById('ctl00_CPHPageContent_TxtR'+Qualifier).focus();
				return false;
			}
			PASS=document.getElementById('ctl00_CPHPageContent_TxtRPassword').value;

			if(PASS=="")
			{
				alert("'Password' is required");
				document.getElementById('ctl00_CPHPageContent_TxtRPassword').focus();
				return false;
			}

			fname=document.getElementById('ctl00_CPHPageContent_TxtRQualifier_First_Name').value;
			if(fname=="")
			{
				alert("First Name is required");
				document.getElementById('ctl00_CPHPageContent_TxtRQualifier_First_Name').focus();
				return false;
			}
			lname=document.getElementById('ctl00_CPHPageContent_TxtRQualifier_Last_Name').value;
			if(lname=="")
			{
				alert("Last Name is required");
				document.getElementById('ctl00_CPHPageContent_TxtRQualifier_Last_Name').focus();
				return false;
			}
			eid=document.getElementById('ctl00_CPHPageContent_EmlRQualifier_Email').value;
			if(!isEMail(eid))
			{
				alert("Invalid Email");
				return false;
			}
			var spneed="";//document.getElementById('ctl00_CPHPageContent_TxtQualifier_Specialneeds').value;

		}
		else
		{
			fname=document.getElementById('ctl00_CPHPageContent_TxtRGuest_'+(j-1)+'_First_Name').value;
			if(fname=="")
			{
				alert("First Name is required");
				document.getElementById('ctl00_CPHPageContent_TxtRGuest_'+(j-1)+'_First_Name').focus();
				return false;
			}
			var lname=document.getElementById('ctl00_CPHPageContent_TxtRGuest_'+(j-1)+'_Last_Name').value;
			if(lname=="")
			{
				alert("Last Name is required");
				document.getElementById('ctl00_CPHPageContent_TxtRGuest_'+(j-1)+'_Last_Name').focus();
				return false;
			}
			var eid="";
			/*var eid=document.getElementById('ctl00_CPHPageContent_EmlRGuest_'+(j-1)+'_Email').value;
			if(!isEMail(eid))
			{
				alert("Invalid Email");
				return false;
			}*/
			var spneed="";//document.getElementById('ctl00_CPHPageContent_TxtGuest_'+(j-1)+'_Specialneeds').value;
		}
		var child="n";
		var age="";
		//alert(j);
		//alert(child);
		if(j!=1)
		{
		     // alert('sdfsdf');
		    if ( document.getElementById('ctl00_CPHPageContent_IntRChildAge'+i+'_ChildAge')!=null )
		    {
				age=document.getElementById('ctl00_CPHPageContent_IntRChildAge'+i+'_ChildAge').value;

				if(age=="")
				{
					alert("Age is required");
					return false;
				}
				child=document.getElementById("ctl00_CPHPageContent_Hdn"+i).value
				//alert(child);
			}

		}
		//alert(child);
		if(child=="n")
		{
		child="N";
		age="0";
		}
		if(child=="y")
		child="Y";
		var title="";
		//alert(k);
		var org=k;
		//alert(org);
		
		var tit="";
		var phn="";
		var phext=""
		var State="";
		var Address="";
		var City="";
		var Zip="";
		
		var ResID=document.getElementById('ctl00_CPHPageContent_HdnResID').value;
		var AttType="A";
		//alert(eid);
		SeminarBuynow.UpdateAttendeeInfo(i,fname,lname,org,"",eid,"","",spneed,ResID,AttType,Address,City,State,Zip,child,parseInt(age),PMF,PASS,callbackdesc1);
		return false;
	}
	function Delete(j)
	{
		if (confirm("Do you want to delete? "))
		{
			if(document.getElementById('ctl00_CPHPageContent_HidAttCount').value != null && document.getElementById('ctl00_CPHPageContent_HidAttCount').value !="")
			{
				alert("Minimun of one attendee must present");
				return false;
			}
			else
			{
				SeminarBuynow.DeleteAttendeeInfo(j,callbackdesc2);
				return false;
			}
		}
		else
		{
			return false;
		}
	}

function ClearValue(Obj)
{
	var txtvalue = Obj;
	txtvalue.value="";
	return true;
}
function CheckValue(Obj)
{
	var txtvalue = Obj;
	if(txtvalue.value == "")
	{
		Obj.value="(food/access requirements/other)";
	}
	return true;
}
