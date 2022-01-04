using System;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections;
using System.Data;
using System.Text;
using CFNS.DataLayer;
using CFNS.Common;
using CFNS.Common.DB;
public partial class Review: Page
{
	private CFNSDB objCFNSDB = new CFNSDB();
	private string strSummitId ="";
	public int PromoCode;
	private string ResID="",strFinalVal="",strEventId="",strSem="";
	private string strSelectedSeminars="";
	public string[] arInfo;
	public void Page_Load(Object Sender,EventArgs E)
	{
		AjaxPro.Utility.RegisterTypeForAjax(typeof(Review));
		btnCalculate.Attributes.Add("Onclick", "return Validate();");
 		if (Request["eid"] != null)
		{
			strEventId = Request["eid"].ToString();
			Session["SummitID"]=strEventId;
 		}
		Session["SummitIdentity"] = strEventId;
		if(Request.QueryString["rsid"]!=null && Request.QueryString["rsid"].ToString()!="")
		{
			ResID=Request.QueryString["rsid"].ToString();
			Session["ReservationID"] = Request.QueryString["rsid"].ToString();
		}
		Tbl_AttendeeInformations objAttendeeInformations1 = new  Tbl_AttendeeInformations(objCFNSDB);
		DataSet dsAttendeeInfo= objAttendeeInformations1.LoadByReservationID(Convert.ToInt32(ResID));
		if(dsAttendeeInfo.Tables[0].Rows.Count>0)
		{
			foreach(DataRow dr in dsAttendeeInfo.Tables[0].Rows)
			{
				if(strFinalVal != null && strFinalVal !="")
				{
					strFinalVal=strFinalVal+","+dr["AttendeeID"].ToString();
				}
				else
				{
					strFinalVal=dr["AttendeeID"].ToString();
				}
				if(strSelectedSeminars != null && strSelectedSeminars !="")
				{
					strSelectedSeminars=strSelectedSeminars+","+dr["SeminorID"].ToString();
				}
				else
				{
					strSelectedSeminars=dr["SeminorID"].ToString();
				}
			}
		}

		arInfo = new string[strFinalVal.Length];

		arInfo = strFinalVal.Split(',');
		HdnAttID.Value=strFinalVal;
		Tbl_SummitInformations objSummitInfo = new Tbl_SummitInformations(objCFNSDB);
		DataSet dsSummitInfo = objSummitInfo.LoadAllSeminar(Convert.ToInt32(strEventId));
		DataTable dtSummitInfo = dsSummitInfo.Tables[0];
		DataView dvSummitInfo = dtSummitInfo.DefaultView;
		for(int i=0;i<dvSummitInfo.Count;i++)
		{
			if(strSem != null && strSem !="")
			{
				strSem=strSem+","+dvSummitInfo[i]["SeminarID"].ToString();
			}
			else
			{
				strSem=dvSummitInfo[i]["SeminarID"].ToString();
			}
		}
		HdnSeminarID.Value=strSem;
		if(!IsPostBack)
		{
			SeminarGrid(Convert.ToInt32(strEventId));
		}
	}
	private void SeminarGrid(int intSumid)
	{
		string SeminarID = "";
		decimal NetTotal=0;
		decimal discount=0;
		string[] SeminarArray;
		Tbl_SummitInformations objSeminarInformations = new Tbl_SummitInformations(objCFNSDB);
		objSeminarInformations.SummitID = Convert.ToInt32(Request["eid"].ToString());
		objSeminarInformations.SelectedSeminars =strSelectedSeminars;
		DataSet ds =objSeminarInformations.LoadSelectedSeminar();
		DataTable dt= ds.Tables[0];
		DataView dv = dt.DefaultView;
		Tbl_AttendeeInformations objAttendeeInformations = new  Tbl_AttendeeInformations(objCFNSDB);
		DataSet dsAttendeeInfo= objAttendeeInformations.LoadByReservationID(Convert.ToInt32(ResID));
		DataTable dtAttendeeInfo = dsAttendeeInfo.Tables[0];
		DataView dvAttendeeInfo = dtAttendeeInfo.DefaultView;
		pnlSelectSeminar.Controls.Add(new LiteralControl("<table cellspacing='0' class='summary'>"));
		pnlSelectSeminar.Controls.Add(new LiteralControl("<tr>"));
		pnlSelectSeminar.Controls.Add(new LiteralControl("<th>Seminar Title</th>"));
		pnlSelectSeminar.Controls.Add(new LiteralControl("<th class='detailstring'>Attendees</th>"));
		pnlSelectSeminar.Controls.Add(new LiteralControl("<th class='detailnumeric'>Price</th>"));
		pnlSelectSeminar.Controls.Add(new LiteralControl("</tr>"));
		if(dv.Count>0)
		{
			for(int i=0;i<dv.Count;i++)
			{
				pnlSelectSeminar.Controls.Add(new LiteralControl("<tr>"));
				pnlSelectSeminar.Controls.Add(new LiteralControl("<td ><a style='font-size: 12px;' href='ShowSeminar.aspx?eid="+strEventId+"&rsid="+ResID+"&Smid="+dv[i]["SeminarID"].ToString()+"'>"+dv[i]["SeminarTitle"].ToString()+"</a><br />"+DateTime.Parse(dv[i]["SeminarDate"].ToString()).ToString("dddd MMMM dd,yyyy")+" | "+dv[i]["SeminarTime"].ToString()+"</td>"));
				pnlSelectSeminar.Controls.Add(new LiteralControl("<td>"));
				if(dvAttendeeInfo.Count>0)
				{
					for(int j=0;j<dvAttendeeInfo.Count;j++)
					{
						pnlSelectSeminar.Controls.Add(new LiteralControl("<input type='hidden' runat='server' id='HdnAttTotal_"+dvAttendeeInfo[j]["AttendeeID"].ToString()+"' name='HdnAttTotal_"+dvAttendeeInfo[j]["AttendeeID"].ToString()+"' />"));
						SeminarID=dvAttendeeInfo[j]["SeminorId"].ToString();
						SeminarArray = SeminarID.Split(',');
						for(int k=0;k<SeminarArray.Length;k++)
						{
							if(dv[i]["SeminarID"].ToString() == SeminarArray[k])
							{
								pnlSelectSeminar.Controls.Add(new LiteralControl(dvAttendeeInfo[j]["FirstName"].ToString()+" "+dvAttendeeInfo[j]["LastName"].ToString()+"</br>"));
								pnlSelectSeminar.Controls.Add(new LiteralControl("<input type='hidden' runat='server' id='Hdn_"+dvAttendeeInfo[j]["AttendeeID"].ToString()+"_"+dv[i]["SeminarID"].ToString()+"' name='Hdn_"+dvAttendeeInfo[j]["AttendeeID"].ToString()+"_"+dv[i]["SeminarID"].ToString()+"' value='"+dv[i]["SeminarPrice"].ToString()+"'/>"));
								NetTotal = NetTotal+Convert.ToDecimal(dv[i]["SeminarPrice"].ToString());
							}
						}

					}
				}
				pnlSelectSeminar.Controls.Add(new LiteralControl("</td>"));
				pnlSelectSeminar.Controls.Add(new LiteralControl("<td>"));
				if(dvAttendeeInfo.Count>0)
				{
					for(int j=0;j<dvAttendeeInfo.Count;j++)
					{
						SeminarID=dvAttendeeInfo[j]["SeminorId"].ToString();
						SeminarArray = SeminarID.Split(',');
						for(int k=0;k<SeminarArray.Length;k++)
						{
							if(dv[i]["SeminarID"].ToString() == SeminarArray[k])
							{
								pnlSelectSeminar.Controls.Add(new LiteralControl("&#36; "+dv[i]["SeminarPrice"].ToString()+"</br>"));
								if(HdnSelectedSeminars.Value != null && HdnSelectedSeminars.Value!="")
								{
									HdnSelectedSeminars.Value =HdnSelectedSeminars.Value+","+dv[i]["SeminarID"].ToString();
								}
								else
								{
									HdnSelectedSeminars.Value =dv[i]["SeminarID"].ToString();
								}
							}
						}
					}
				}
				pnlSelectSeminar.Controls.Add(new LiteralControl("</td>"));
				pnlSelectSeminar.Controls.Add(new LiteralControl("</tr>"));
			}
		}
		if(HdnPromo.Value != null && HdnPromo.Value !="")
		{
			pnlSelectSeminar.Controls.Add(new LiteralControl("<tr>"));
			pnlSelectSeminar.Controls.Add(new LiteralControl("<td colspan='2'>Sub Total</td>"));
			pnlSelectSeminar.Controls.Add(new LiteralControl("<td>"));
			pnlSelectSeminar.Controls.Add(new LiteralControl("&#36; <strong>"+NetTotal.ToString()+"</strong>"));
			pnlSelectSeminar.Controls.Add(new LiteralControl("</td>"));
			pnlSelectSeminar.Controls.Add(new LiteralControl("</tr>"));
			pnlSelectSeminar.Controls.Add(new LiteralControl("<tr>"));
			pnlSelectSeminar.Controls.Add(new LiteralControl("<td colspan='2'>Promotional Discount</td>"));
			pnlSelectSeminar.Controls.Add(new LiteralControl("<td>"));
			if(HdnAmt.Value != null && HdnAmt.Value !="")
			{
				discount = Convert.ToDecimal(HdnAmt.Value);
				pnlSelectSeminar.Controls.Add(new LiteralControl("&#36; <strong>"+discount.ToString()+".00</strong>"));
			}
			else if(HdnPtg.Value != null && HdnPtg.Value !="")
			{

				discount = NetTotal * (Convert.ToDecimal(HdnPtg.Value))/100;
				pnlSelectSeminar.Controls.Add(new LiteralControl("&#36; <strong>"+discount.ToString()+"</strong>"));
			}
			pnlSelectSeminar.Controls.Add(new LiteralControl("</td>"));
			pnlSelectSeminar.Controls.Add(new LiteralControl("</tr>"));
			NetTotal = NetTotal - discount;
			pnlSelectSeminar.Controls.Add(new LiteralControl("<tr>"));
			pnlSelectSeminar.Controls.Add(new LiteralControl("<th colspan='2'>Total</th>"));
			pnlSelectSeminar.Controls.Add(new LiteralControl("<th>"));
			pnlSelectSeminar.Controls.Add(new LiteralControl("&#36; <strong>"+NetTotal.ToString()+"</strong>"));
			pnlSelectSeminar.Controls.Add(new LiteralControl("</th>"));
			pnlSelectSeminar.Controls.Add(new LiteralControl("</tr>"));
		}
		else
		{
			pnlSelectSeminar.Controls.Add(new LiteralControl("<tr>"));
			pnlSelectSeminar.Controls.Add(new LiteralControl("<th colspan='2'>Total</th>"));
			pnlSelectSeminar.Controls.Add(new LiteralControl("<th>"));
			pnlSelectSeminar.Controls.Add(new LiteralControl("&#36; "+NetTotal.ToString()));
			pnlSelectSeminar.Controls.Add(new LiteralControl("</th>"));
			pnlSelectSeminar.Controls.Add(new LiteralControl("</th>"));
		}

		pnlSelectSeminar.Controls.Add(new LiteralControl("</table>"));
		pnlSelectSeminar.Controls.Add(new LiteralControl("<script>UpdateTotal()</script>"));
		HdnNetTotal.Value = NetTotal.ToString();
}

	[AjaxPro.AjaxMethod]
	public string UpdateAttTotal(int ID,string Total)
	{
		string sRet="";
		bool status = false;
		int ret=0;
		CFNSDB objCFNSDB1 = new CFNSDB();
		Tbl_AttendeeInformations ObjAttInfo = new Tbl_AttendeeInformations(objCFNSDB1);

		try
		{
			ObjAttInfo.AttendeeID=ID;
			ObjAttInfo.AttendeeTotal=Convert.ToDecimal(Total);
			ObjAttInfo.UpdateAttendeeTotal();
			sRet="Updatedsuccessfully";
		}
		catch(Exception ex)
		{
			sRet=ObjAttInfo.ErrorString.ToString();
		}
		return Total;
	}
	[AjaxPro.AjaxMethod]
	public string UpdateRes(string ID)
	{
		string sRet="";
		bool status = false;
		int ret=0;
		CFNSDB objCFNSDB1 = new CFNSDB();
		Tbl_PromoCodeDetails ObjPromo = new Tbl_PromoCodeDetails(objCFNSDB1);

		try
		{
			ObjPromo.PromoID=Convert.ToInt32(ID);
			ObjPromo.ReservationID=Request.QueryString["rsid"].ToString();
			ObjPromo.IsNew=false;
			ObjPromo.UpdateResID();
			sRet="Updatedsuccessfully";
		}
		catch(Exception ex)
		{
			sRet=ObjPromo.ErrorString.ToString();
		}
		sRet=ObjPromo.ErrorString.ToString();
		return sRet;
	}
	public void btn_GoNext(object Sender, EventArgs e)
	{
		bool status = false;
		if(HdnNetTotal.Value!=null && HdnNetTotal.Value!="")
		{
			if(Convert.ToInt32(Convert.ToDecimal(HdnNetTotal.Value.ToString()))<=0)
			{
				Session["SemID"]=HdnSelectedSeminars.Value;
				Response.Redirect("SummitRegistration.aspx?S="+Request.QueryString["eid"]+"&rsid="+Request.QueryString["rsid"]+"&Pr="+HdnPromoID.Value.ToString());
			}
			else if (Convert.ToInt32(Convert.ToDecimal(HdnNetTotal.Value.ToString()))>0)
			{
				string strSummitID=Request["eid"].ToString();
				string RsId=Request["rsid"].ToString();
				string SSLURL = System.Configuration.ConfigurationSettings.AppSettings["CFNSSSLURL"];
				StringBuilder TmpText = new StringBuilder();

				TmpText.Append("<input type=\"hidden\" name=\"PromoCode\" value=\'"+HdnPromo.Value+"\'>'");
				if(HdnAmt.Value!=null && HdnAmt.Value!="")
				{
					TmpText.Append("<input type=\"hidden\" name=\"PromoValue\" value=\'$"+HdnAmt.Value+"\'>'");
				}
				else if(HdnPtg.Value!=null && HdnPtg.Value!="")
				{
					TmpText.Append("<input type=\"hidden\" name=\"PromoValue\" value=\'"+HdnPtg.Value+"%\'>'");
				}
				if(HdnPromoID.Value!="" && HdnPromoID.Value!="")
				{
					TmpText.Append("<input type=\"hidden\" name=\"PromoCodeID\" value=\'"+HdnPromoID.Value+"\'>'");
				}
				if(HdnSelectedSeminars.Value!=null && HdnSelectedSeminars.Value!="")
				{
					TmpText.Append("<input type=\"hidden\" name=\"SelSeminars\" value=\'"+HdnSelectedSeminars.Value+"\'>'");
				}
				TmpText.Append("<input type=\"hidden\" name=\"rsid\" value=\'"+RsId+"\'>'");
				TmpText.Append("<input type=\"hidden\" name=\"eid\" value=\'"+strEventId+"\'>'");
				TmpText.Append("<script language=\"javascript\">document.forms[\"frmRegisterPage\"].action ='"+SSLURL+"OrderSummary.aspx';");
				//TmpText.Append("<script language=\"javascript\">document.forms[\"frmRegisterPage\"].action ='http://bdl2-1/cfns/Payment.aspx';");
				//TmpText.Append("<script language=\"javascript\">document.forms[\"frmRegisterPage\"].action ='"+SSLURL+"SeminarCCStatus.aspx';");
				TmpText.Append(" document.forms[\"frmRegisterPage\"].submit();</script>");

				HdnAmt.Value="";
				HdnPtg.Value="";

				PnlForSubmit.Controls.Add(new LiteralControl(TmpText.ToString()));
			}
		}
	}


	public void btn_EditAttend(object Sender, EventArgs e)
	{
		Response.Redirect("edit_attendee.aspx?eid="+Request["eid"].ToString()+"&rsid="+Request["rsid"].ToString());
	}
	public void btn_Calculate (object Sender, EventArgs e)
	{
		Tbl_PromoCodeDetails ObjPromoCode = new Tbl_PromoCodeDetails(objCFNSDB);
		DataSet dsPromoCode = ObjPromoCode.getValidCode(TxtPromocode.Text);
		DataView dvPromoCode = dsPromoCode.Tables[0].DefaultView;

		if(dvPromoCode.Count>0)
		{
			HdnPromo.Value=TxtPromocode.Text;
			HdnPromoID.Value=dvPromoCode[0]["PromoID"].ToString();
			Session["PromocodeValue"]=dvPromoCode[0]["PromoCode"].ToString();
			if(dvPromoCode[0]["Promo_type"].ToString()=="P")
			{
				HdnPtg.Value=dvPromoCode[0]["Promo_Value"].ToString();
				Session["PromoPtgValue"]=dvPromoCode[0]["Promo_Value"].ToString()+"%";
			}
			else if(dvPromoCode[0]["Promo_type"].ToString()=="A")
			{
				HdnAmt.Value=dvPromoCode[0]["Promo_Value"].ToString();
				Session["PromoAmtValue"]="$"+dvPromoCode[0]["Promo_Value"].ToString();
			}
			SeminarGrid(Convert.ToInt32(strEventId));
		}
		else
		{
			//Response.Write(dvPromoCode.Count);
			Session["PromoPtgValue"]="";
			Session["PromoAmtValue"]="";
			Session["PromocodeValue"]="";
			Session["PomoCodeDetails"]="";
			PnlPromoCodeGrid.Controls.Add(new LiteralControl("<script>alert('Promo Code does not Exist');</script>"));
			SeminarGrid(Convert.ToInt32(strEventId));
		}
		TxtPromocode.Text="";
	}
	public void btn_Back(Object o, ImageClickEventArgs e)
	{
		Response.Redirect("Select.aspx?eid="+Request.QueryString["eid"]+"&smid="+Request.QueryString["smid"]+"&rsid="+Request.QueryString["rsid"]);
	}
	 public void btn_StartOver(Object s, EventArgs e)
	{
		Session["ReservationID"]=null;
		Session["SummitID"]=null;
		Tbl_SummitInformations objSeminarInformations = new  Tbl_SummitInformations(objCFNSDB);
		objSeminarInformations.Load(Int32.Parse(Request["eid"].ToString()));
		if(objSeminarInformations.SummitFileName != null && objSeminarInformations.SummitFileName != "")
		{
			Response.Redirect(System.Configuration.ConfigurationSettings.AppSettings["CFNSNormalURL"]+objSeminarInformations.SummitFileName+".aspx");
		}
		else
		{
			Response.Redirect("education_calendar.aspx");
		}
	}
	public void Page_UnLoad(Object source, EventArgs e)
	{
		HdnAmt.Value="";
		HdnPtg.Value="";
	}
}