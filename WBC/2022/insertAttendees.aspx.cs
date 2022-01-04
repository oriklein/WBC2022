using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class insertAttendees : System.Web.UI.Page
{
    protected string checkadmin = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            DataTable objDT = new DataTable();
            for (int i = 1; i <= int.Parse(Request.QueryString["count"].ToString()); i++)
                objDT.Rows.Add(objDT.NewRow());

            // Bind the DataSet to the GridView
            grdAttendee.DataSource = objDT;
            grdAttendee.DataBind();
        }

      //grdAttendee.FooterRow.FindControl("btnGoNext").

        if (Session["AdminOrder"] != null)
             if (Session["userid"] == null)
                 Response.Redirect("https://reg.sohnconference.com/Bo/Bo_Login.aspx");
             else       
            divAdmin.Visible = true;
        else
            divAdmin.Visible = false;
        
    }
    protected void initialMakeUp(object sender, EventArgs e)
    {
        ClientScriptManager cs = Page.ClientScript;
        
        int count=1;
        foreach (GridViewRow grdrow in grdAttendee.Rows)
        {

            HtmlInputText txtgrdFirstName = (HtmlInputText)grdrow.FindControl("txtFirstName");
            HtmlInputText txtgrdLastName = (HtmlInputText)grdrow.FindControl("txtLastName");
            HtmlSelect ddlAttendeType = (HtmlSelect)grdrow.FindControl("ddlAttendeType");
            HtmlSelect ddlNW = (HtmlSelect)grdrow.FindControl("ddlNW");
            HtmlInputText txtOrganization = (HtmlInputText)grdrow.FindControl("txtOrganization");
            HtmlInputText txtgrdEmail = (HtmlInputText)grdrow.FindControl("txtEmail");
            HtmlInputText txtPhone = (HtmlInputText)grdrow.FindControl("txtPhone");
            HtmlInputText txtAddress = (HtmlInputText)grdrow.FindControl("txtAddress");
            HtmlSelect ddlCountry = (HtmlSelect)grdrow.FindControl("ddlCountry");
            HtmlInputText txtCity = (HtmlInputText)grdrow.FindControl("txtCity");
            HtmlInputText txtCountry = (HtmlInputText)grdrow.FindControl("txtCountry");
            HtmlInputText txtState = (HtmlInputText)grdrow.FindControl("txtState");
            HtmlSelect ddlState = (HtmlSelect)grdrow.FindControl("ddlState");
            //DropDownList ddlState = (DropDownList)grdrow.FindControl("ddlState");
            HtmlInputText txtZip = (HtmlInputText)grdrow.FindControl("txtZip");
            Label lblHeading=(Label)grdrow.FindControl("lblHeading");
            HtmlGenericControl divCocktail = (HtmlGenericControl)grdrow.FindControl("divCocktail");


            if (Session["AdminOrder"] != null)
            {
                HtmlInputText txtAdminPrice = (HtmlInputText)grdrow.FindControl("txtAdminPrice");
                HtmlGenericControl divAdminPrice = (HtmlGenericControl)grdrow.FindControl("divAdminPrice");
                divAdminPrice.Visible = true;
               checkadmin = "yes";
                cs.RegisterArrayDeclaration("grdAdminPrice_Txt", String.Concat("'", txtAdminPrice.ClientID, "'"));
                cs.RegisterArrayDeclaration("grddivAdminPrice_Txt", String.Concat("'", divAdminPrice.ClientID, "'"));
            }
            else
            {
                //HtmlInputText txtAdminPrice = (HtmlInputText)grdrow.FindControl("txtAdminPrice");
                ////txtAdminPrice.Value = "dummy";
                //HtmlGenericControl divAdminPrice = (HtmlGenericControl)grdrow.FindControl("divAdminPrice");
                //divAdminPrice.Visible = false;
                checkadmin = "no";
                //cs.RegisterArrayDeclaration("grdAdminPrice_Txt", String.Concat("'", txtAdminPrice.ClientID, "'"));
                //cs.RegisterArrayDeclaration("grddivAdminPrice_Txt", String.Concat("'", divAdminPrice.ClientID, "'"));
            }


            if (count.ToString().Trim() != "1")
            {
                divCocktail.Style.Add("display", "none");
            }

            lblHeading.Text = "Attendee : " + count.ToString() + " Information";
            cs.RegisterArrayDeclaration("grdFirstName_Txt", String.Concat("'", txtgrdFirstName.ClientID, "'"));
            cs.RegisterArrayDeclaration("grdLastName_Txt", String.Concat("'", txtgrdLastName.ClientID, "'"));
            cs.RegisterArrayDeclaration("grdAttendeType_ddl", String.Concat("'", ddlAttendeType.ClientID, "'"));


          //  txtCountry.Attributes.Add("onfocus", "javascript: return hide('" + txtCountry.ClientID + "')");
          //  txtState.Attributes.Add("onfocus", "javascript: return hide('" + txtState.ClientID + "')");

            cs.RegisterArrayDeclaration("grdOrganization_Txt", String.Concat("'", txtOrganization.ClientID, "'"));
            cs.RegisterArrayDeclaration("grdEmail_Txt", String.Concat("'", txtgrdEmail.ClientID, "'"));
            cs.RegisterArrayDeclaration("grdPhone_Txt", String.Concat("'", txtPhone.ClientID, "'"));
            cs.RegisterArrayDeclaration("grdAddress_Txt", String.Concat("'", txtAddress.ClientID, "'"));
            cs.RegisterArrayDeclaration("grdCountry_ddl", String.Concat("'", ddlCountry.ClientID, "'"));
            cs.RegisterArrayDeclaration("grdOtherCountry_Txt", String.Concat("'", txtCountry.ClientID, "'"));
            cs.RegisterArrayDeclaration("grdCity_Txt", String.Concat("'", txtCity.ClientID, "'"));
            cs.RegisterArrayDeclaration("grdZip_Txt", String.Concat("'", txtZip.ClientID, "'"));
            cs.RegisterArrayDeclaration("grdState_ddl", String.Concat("'", ddlState.ClientID, "'"));
            cs.RegisterArrayDeclaration("grdOtherState_Txt", String.Concat("'", txtState.ClientID, "'"));
            ddlCountry.Attributes.Add("onchange", "javascript: return display('" + ddlCountry.ClientID + "','" + ddlState.ClientID + "','" + txtCountry.ClientID + "','" + txtState.ClientID + "')");
            ddlAttendeType.Attributes.Add("onchange", "javascript: return disNextWave('" + ddlNW.ClientID + "',this)");
 
           count++;

        }


    }
    protected void action(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "goBack")
        {
            Response.Redirect("registration-step1-professional");
        }
        if (e.CommandName == "insertAttendee")
        {
            int count = int.Parse(Request.QueryString["count"].ToString());
            Session["AttendeeCount"] = count.ToString();
            int ipCount = 0;
            int nIpCount = 0;
            int nwCount = 0;
            //viewing room
            int vr = 0;
            Attende2014[] objAttende = new Attende2014[count];
            int rc=0;
            int[] APCount = new int[count];
            string cocktail = "True";
            foreach (GridViewRow grdrow in grdAttendee.Rows)
            {

                HtmlInputText txtgrdFirstName = (HtmlInputText)grdrow.FindControl("txtFirstName");
                HtmlInputText txtgrdLastName = (HtmlInputText)grdrow.FindControl("txtLastName");
                HtmlSelect ddlAttendeType = (HtmlSelect)grdrow.FindControl("ddlAttendeType");
                HtmlSelect ddlNW = (HtmlSelect)grdrow.FindControl("ddlNW");
                HtmlInputText txtOrganization = (HtmlInputText)grdrow.FindControl("txtOrganization");
                HtmlInputText txtTitle = (HtmlInputText)grdrow.FindControl("txtTitle");
                HtmlInputText txtgrdEmail = (HtmlInputText)grdrow.FindControl("txtEmail");
                HtmlInputText txtPhone = (HtmlInputText)grdrow.FindControl("txtPhone");
                HtmlInputText txtExt = (HtmlInputText)grdrow.FindControl("txtExt");
                HtmlInputText txtAddress = (HtmlInputText)grdrow.FindControl("txtAddress");
                HtmlInputText txtOtherAddress = (HtmlInputText)grdrow.FindControl("txtOtherAddress");
                HtmlSelect ddlCountry = (HtmlSelect)grdrow.FindControl("ddlCountry");
                HtmlInputText txtCity = (HtmlInputText)grdrow.FindControl("txtCity");
                HtmlInputText txtCountry = (HtmlInputText)grdrow.FindControl("txtCountry");
                HtmlInputText txtState = (HtmlInputText)grdrow.FindControl("txtState");
                HtmlSelect ddlState = (HtmlSelect)grdrow.FindControl("ddlState");
                HtmlInputText txtZip = (HtmlInputText)grdrow.FindControl("txtZip");
                HtmlInputText txtAdminPrice = (HtmlInputText)grdrow.FindControl("txtAdminPrice");
                HtmlSelect ddlCTR = (HtmlSelect)grdrow.FindControl("selCTR");
                  HtmlSelect ddlSGP = (HtmlSelect)grdrow.FindControl("ddlSGP");
                objAttende[rc] = new Attende2014();
                objAttende[rc].FirstName = txtgrdFirstName.Value;
                objAttende[rc].LastName = txtgrdLastName.Value;
                objAttende[rc].AttendeeType = ddlAttendeType.Items[ddlAttendeType.SelectedIndex].Value;
                objAttende[rc].NextWave = "";
                objAttende[rc].Organization = txtOrganization.Value;
                objAttende[rc].Title = (txtTitle.Value == "" ? String.Empty : txtTitle.Value);
                objAttende[rc].Email = txtgrdEmail.Value;
                objAttende[rc].Phone = txtPhone.Value;                
                objAttende[rc].city = txtCity.Value;
                objAttende[rc].Ext = (txtExt.Value == "" ? String.Empty : txtExt.Value);
                //objAttende[rc].Address = txtAddress.Value;
                //objAttende[rc].OtherAddress = (txtOtherAddress.Value == "" ? String.Empty : txtOtherAddress.Value);
                //objAttende[rc].country = ((ddlCountry.Items[ddlCountry.SelectedIndex].Text=="-Select-")?String.Empty:ddlCountry.Items[ddlCountry.SelectedIndex].Text);
                //objAttende[rc].OtherCountry = (txtCountry.Value == "Country" ? String.Empty : txtCountry.Value);
                //objAttende[rc].state = ((ddlState.Items[ddlState.SelectedIndex].Text == "-Select-") ? String.Empty : ddlState.Items[ddlState.SelectedIndex].Text);
                //objAttende[rc].OtherState = (txtState.Value == "State" ? String.Empty : txtState.Value);
                //objAttende[rc].zip = (txtZip.Value == "" ? String.Empty : txtZip.Value);
                objAttende[rc].Address = "";
                objAttende[rc].OtherAddress = "";
                objAttende[rc].country = "";
                objAttende[rc].OtherCountry = "";
                objAttende[rc].state = "";
                objAttende[rc].OtherState = "";
                objAttende[rc].zip = "";
                objAttende[rc].SohnGeneralPartner = "";
                if(rc==0)
                    cocktail=ddlCTR.Items[ddlCTR.SelectedIndex].Text;
                objAttende[rc].Cocktail = "";
                if (Session["AdminOrder"] != null)
                {
                    objAttende[rc].Price = (txtAdminPrice.Value == "" ? String.Empty : txtAdminPrice.Value);
                    APCount[rc] = Convert.ToInt32(txtAdminPrice.Value);
                }


                if (ddlAttendeType.Items[ddlAttendeType.SelectedIndex].Value == "IP")
                    ipCount++;
                else if (ddlAttendeType.Items[ddlAttendeType.SelectedIndex].Value == "NIP")
                        nIpCount++;
                else if (ddlAttendeType.Items[ddlAttendeType.SelectedIndex].Text == "Next Wave Sohn Only")
                    nwCount++;
                    else
                        vr++;
                       
                    
                rc++;


            }
            int viewingtextcount = 0;
            for (int i = 0; i < count; i++)
            {
                if (objAttende[i].AttendeeType == "Viewing Room")
                    viewingtextcount++; 
            }

            if (viewingtextcount > 0)
                Session["viewingroomtext"] = "Y";
            else
                Session["viewingroomtext"] = "N";

            

            Session["Attendees"] = objAttende;
            Session["IPCount"] = ipCount.ToString();
            Session["NiPCount"] = nIpCount.ToString();
            Session["VrCount"] = vr.ToString();
            Session["nwCount"] = nwCount.ToString();
            Session["AdminPrices"] = APCount;
          
            Response.Redirect("AttendeeSummaryinfo.aspx");


        }
    }
    protected void lnkLogOut_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.RemoveAll();
        Session["userid"] = "";
        Response.Redirect("Bo/Bo_Login.aspx");
    }
   
}
