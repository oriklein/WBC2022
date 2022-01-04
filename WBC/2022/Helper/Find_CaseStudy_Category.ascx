<%@ Control Language="C#" debug="true"%>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="CFNS.DataLayer" %>
<%@ import Namespace="CFNS.Common" %>
<%@ import Namespace="CFNS.Common.DB" %>
<script type="text/javascript" language="Javascript">
	function jumbCaseCategory()
	{
		var jumbbox = document.getElementById("ctl00_CPHPageContent_CategoryBox_SelOJumpTopic");
		if(jumbbox == null) jumbbox = document.getElementById("ctl00_CPHPage_Nationwide_stydy_Content_CategoryBox_SelOJumpTopic");
		if(jumbbox == null) jumbbox = document.getElementById("ctl00_CPHPageContent_PageFooter_SelOJumpTopic");

		if(jumbbox.value == "999")
		{
			alert("Please select a category!");
			jumbbox.focus();
			return false;
		}
		else return true;
	}
</script>
<script runat="server">
	public CFNSDB objCFNSDBc = new CFNSDB();
	void Page_Load(Object Src, EventArgs E)
	{
		objCFNSDBc.OpenConnection();
		ImgButtonGoCtl.Attributes.Add("Onclick","return jumbCaseCategory();");
		if(!IsPostBack)
		{
			LoadCategories();
		}
	}
	public void LoadCategories()
	{
		Tbl_Categories Categories = new Tbl_Categories(objCFNSDBc);
		DataTable dtCategories = Categories.LoadAll().Tables[0];
		SelOJumpTopic.DataSource = dtCategories;
		SelOJumpTopic.DataValueField = "CategoryID";
		SelOJumpTopic.DataTextField = "CategoryText";
		SelOJumpTopic.DataBind();
	}
	public void OnClick_ImgButtonGoCtl(Object Sender,EventArgs EA)
	{
		Response.Redirect("research_case_studies.aspx?Cid="+SelOJumpTopic.SelectedValue);
	}
	
</script>

<table width="205" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFAD5B">
	<tr>
		<td><img src="images/orange_call_top_left.gif" width="17" height="17" alt=""></td>
		<td width="175" height="13"></td>
		<td><img src="images/orange_call_top_right.gif" width="17" height="17" alt=""></td>
	</tr>
	<tr align="left" valign="top">
		<td height="30" width="187" colspan="3">
			<table width="100%"  border="0" cellspacing="0" cellpadding="0" class="callDark">
				<tr valign="top"><td width="186" height="30" colspan="2"><strong>Find Case Studies:</strong></td></tr>
				<tr valign="top"><td height="50" colspan="2">
					<strong>Category:</strong><br />
					<asp:DropDownList id="SelOJumpTopic" runat="server" style="width:175px;"></asp:DropDownList></td>
				</tr>
				<tr>
				<td height="40" colspan="2" align="right">
				<asp:ImageButton onclick="OnClick_ImgButtonGoCtl" src="images/button_orange_small_go.jpg" id="ImgButtonGoCtl" alt="Go" runat="server" style="font-weight:bold; border:0px" />
				</td>
				</tr>
			</table>
		</td>
	</tr>
<tr>
	<td><img src="images/orange_call_bottom_left.gif" width="17" height="17" alt=""></td>
	<td width="175" height="13"></td>
	<td><img src="images/orange_call_bottom_right.gif" width="17" height="17" alt=""></td>
</tr>
</table>