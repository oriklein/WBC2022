function Validate()
{
	if(document.getElementById("ctl00_CPHPageContent_TxtPromocode").value=="")
	{
		alert('Please Enter Promo Code');
		return false;
	}
	if(document.getElementById("ctl00_CPHPageContent_HdnPromo").value != null && document.getElementById("ctl00_CPHPageContent_HdnPromo").value!="")
	{
		alert('Promo Code does not exist');
		return false;
	}

	return true;
}
function RedSelectedSeminar()
{
	document.getElementById("imgBtnGreenSeminar").style.display="block";
	document.getElementById("imgBtnRedSeminar").style.display="none";
	document.getElementById('divSel').style.display="block";
	document.getElementById("divCheck").style.display="none";
}
function GreenSelectedSeminar()
{
	document.getElementById("imgBtnGreenSeminar").style.display="none";
	document.getElementById("imgBtnRedSeminar").style.display="block";
	document.getElementById('divSel').style.display="none";
}
function UpdateTotal()
{
	var strSemid=document.getElementById("ctl00_CPHPageContent_HdnSeminarID").value;
	var Sem_array=strSemid.split(',');
	var strAttid=document.getElementById("ctl00_CPHPageContent_HdnAttID").value;
	var Att_array=strAttid.split(',');
	var nettotal="";
	for(y=0; y<Att_array.length; y++)
	{
		var intatttotal="";
		for(x=0; x<Sem_array.length; x++)
		{
			if(document.forms[0].elements["Hdn_"+Att_array[y]+"_"+Sem_array[x]] != null)
			{
				if(intatttotal != null && intatttotal != "")
				{
					intatttotal = parseFloat(intatttotal) + parseFloat(document.forms[0].elements["Hdn_"+Att_array[y]+"_"+Sem_array[x]].value)
				}
				else
				{
					intatttotal= parseFloat(document.forms[0].elements["Hdn_"+Att_array[y]+"_"+Sem_array[x]].value)
				}
			 }
		}
		if(intatttotal != null && intatttotal != "")
		{
			intatttotal=intatttotal.toFixed(2);
			document.forms[0].elements["HdnAttTotal_"+Att_array[y]].value =intatttotal;
			if(nettotal != null && nettotal != "")
			{
				nettotal = parseFloat(nettotal)+parseFloat(intatttotal)
			}
			else
			{
				nettotal = parseFloat(intatttotal)
			}
			intatttotal=="";
		}
		Review.UpdateAttTotal(Att_array[y],document.forms[0].elements["HdnAttTotal_"+Att_array[y]].value);
	}
	if(document.forms[0].elements["ctl00_CPHPageContent_HdnNetTotal"]!= null )
	{
	//	document.forms[0].elements["ctl00_CPHPageContent_HdnNetTotal"].value=nettotal;
	}
}