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

public partial class updateDelegate : System.Web.UI.Page
{
    Attende[] objAttende;
    public DataTable myDataTable;
    ClientScriptManager cs;
    protected string checkadmin = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            createTable();
            FillGrid();
        }

    }
    protected void FillGrid()
    {
        grdAttendee.DataSource = myDataTable;
        grdAttendee.DataBind();
    }
    protected void createTable()
    {
        myDataTable = new DataTable();

        DataColumn myDataRowNoColumn = new DataColumn();
        myDataRowNoColumn.DataType = System.Type.GetType("System.Int32");
        myDataRowNoColumn.ColumnName = "rowno";
        myDataTable.Columns.Add(myDataRowNoColumn);


        DataColumn myDataFirstNameColumn = new DataColumn();
        myDataFirstNameColumn.DataType = System.Type.GetType("System.String");
        myDataFirstNameColumn.ColumnName = "FirstName";
        myDataTable.Columns.Add(myDataFirstNameColumn);

        DataColumn myDataLastNameColumn = new DataColumn();
        myDataLastNameColumn.DataType = System.Type.GetType("System.String");
        myDataLastNameColumn.ColumnName = "LastName";
        myDataTable.Columns.Add(myDataLastNameColumn);

        DataColumn myDataAttendeTypeColumn = new DataColumn();
        myDataAttendeTypeColumn.DataType = System.Type.GetType("System.String");
        myDataAttendeTypeColumn.ColumnName = "AttendeType";
        myDataTable.Columns.Add(myDataAttendeTypeColumn);

        DataColumn myDataOrganizationColumn = new DataColumn();
        myDataOrganizationColumn.DataType = System.Type.GetType("System.String");
        myDataOrganizationColumn.ColumnName = "Organization";
        myDataTable.Columns.Add(myDataOrganizationColumn);

        DataColumn myDataTitleColumn = new DataColumn();
        myDataTitleColumn.DataType = System.Type.GetType("System.String");
        myDataTitleColumn.ColumnName = "Title";
        myDataTable.Columns.Add(myDataTitleColumn);

        DataColumn myDataEmailColumn = new DataColumn();
        myDataEmailColumn.DataType = System.Type.GetType("System.String");
        myDataEmailColumn.ColumnName = "Email";
        myDataTable.Columns.Add(myDataEmailColumn);

        DataColumn myDataPhoneColumn = new DataColumn();
        myDataPhoneColumn.DataType = System.Type.GetType("System.String");
        myDataPhoneColumn.ColumnName = "Phone";
        myDataTable.Columns.Add(myDataPhoneColumn);

        DataColumn myDataExtColumn = new DataColumn();
        myDataExtColumn.DataType = System.Type.GetType("System.String");
        myDataExtColumn.ColumnName = "Ext";
        myDataTable.Columns.Add(myDataExtColumn);

        DataColumn myDataAddressColumn = new DataColumn();
        myDataAddressColumn.DataType = System.Type.GetType("System.String");
        myDataAddressColumn.ColumnName = "Address";
        myDataTable.Columns.Add(myDataAddressColumn);

        DataColumn myDataOtherAddressColumn = new DataColumn();
        myDataOtherAddressColumn.DataType = System.Type.GetType("System.String");
        myDataOtherAddressColumn.ColumnName = "OtherAddress";
        myDataTable.Columns.Add(myDataOtherAddressColumn);

        DataColumn myDataCountryColumn = new DataColumn();
        myDataCountryColumn.DataType = System.Type.GetType("System.String");
        myDataCountryColumn.ColumnName = "Country";
        myDataTable.Columns.Add(myDataCountryColumn);

        DataColumn myDataOtherCountryColumn = new DataColumn();
        myDataOtherCountryColumn.DataType = System.Type.GetType("System.String");
        myDataOtherCountryColumn.ColumnName = "OtherCountry";
        myDataTable.Columns.Add(myDataOtherCountryColumn);

        DataColumn myDataCityColumn = new DataColumn();
        myDataCityColumn.DataType = System.Type.GetType("System.String");
        myDataCityColumn.ColumnName = "City";
        myDataTable.Columns.Add(myDataCityColumn);

        DataColumn myDataStateColumn = new DataColumn();
        myDataStateColumn.DataType = System.Type.GetType("System.String");
        myDataStateColumn.ColumnName = "State";
        myDataTable.Columns.Add(myDataStateColumn);

        DataColumn myDataOtherStateColumn = new DataColumn();
        myDataOtherStateColumn.DataType = System.Type.GetType("System.String");
        myDataOtherStateColumn.ColumnName = "OtherState";
        myDataTable.Columns.Add(myDataOtherStateColumn);

        DataColumn myDataZipCodeColumn = new DataColumn();
        myDataZipCodeColumn.DataType = System.Type.GetType("System.String");
        myDataZipCodeColumn.ColumnName = "Zip";
        myDataTable.Columns.Add(myDataZipCodeColumn);

        DataColumn myDataPriceColumn = new DataColumn();
        myDataPriceColumn.DataType = System.Type.GetType("System.String");
        myDataPriceColumn.ColumnName = "Price";
        myDataTable.Columns.Add(myDataPriceColumn);


        objAttende = new Attende[int.Parse(Session["AttendeeCount"].ToString())];
        objAttende = (Attende[])Session["Attendees"];
        for (int i = 0; i < int.Parse(Session["AttendeeCount"].ToString()); i++)
        {
            DataRow myDataRow = myDataTable.NewRow();
            myDataRow["rowno"] = i + 1;
            myDataRow["FirstName"] = objAttende[i].FirstName;
            myDataRow["LastName"] = objAttende[i].LastName;
            myDataRow["AttendeType"] = objAttende[i].AttendeeType;
            myDataRow["Organization"] = objAttende[i].Organization;
            myDataRow["Title"] = objAttende[i].Title;
            myDataRow["Email"] = objAttende[i].Email;
            myDataRow["Phone"] = objAttende[i].Phone;
            myDataRow["Ext"] = objAttende[i].Ext;
            myDataRow["Address"] = objAttende[i].Address;
            myDataRow["OtherAddress"] = objAttende[i].OtherAddress;
            myDataRow["Country"] = objAttende[i].country;
            myDataRow["OtherCountry"] = objAttende[i].OtherCountry;
            myDataRow["City"] = objAttende[i].city;
            myDataRow["State"] = objAttende[i].state;
            myDataRow["OtherState"] = objAttende[i].OtherState;
            myDataRow["Zip"] = objAttende[i].zip;
            myDataRow["Price"] = objAttende[i].Price;

            myDataTable.Rows.Add(myDataRow);
        }


    }
    protected void makeUp(object sender, GridViewRowEventArgs e)
    {
        cs = Page.ClientScript;
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Button btnDelete = (Button)e.Row.FindControl("btnRemove");
            Button btnModify = (Button)e.Row.FindControl("btnUpdate");
            HtmlInputText txtgrdFirstName = (HtmlInputText)e.Row.FindControl("txtFirstName");
            HtmlInputText txtgrdLastName = (HtmlInputText)e.Row.FindControl("txtLastName");
            DropDownList ddlAttendeType = (DropDownList)e.Row.FindControl("ddlAttendeType");
            HtmlInputText txtOrganization = (HtmlInputText)e.Row.FindControl("txtOrganization");
            HtmlInputText txtgrdEmail = (HtmlInputText)e.Row.FindControl("txtEmail");
            HtmlInputText txtPhone = (HtmlInputText)e.Row.FindControl("txtPhone");
            HtmlInputText txtAddress = (HtmlInputText)e.Row.FindControl("txtAddress");
            DropDownList ddlCountry = (DropDownList)e.Row.FindControl("ddlCountry");
            HtmlInputText txtCity = (HtmlInputText)e.Row.FindControl("txtCity");
            HtmlInputText txtCountry = (HtmlInputText)e.Row.FindControl("txtCountry");
            HtmlInputText txtState = (HtmlInputText)e.Row.FindControl("txtState");
            DropDownList ddlState = (DropDownList)e.Row.FindControl("ddlState");
            HtmlInputText txtZip = (HtmlInputText)e.Row.FindControl("txtZip");
            Label lblHeading = (Label)e.Row.FindControl("lblHeading");

            lblHeading.Text = "Attendee No: " + (e.Row.RowIndex + 1).ToString() + " Information";
            cs.RegisterArrayDeclaration("grdFirstName_Txt", String.Concat("'", txtgrdFirstName.ClientID, "'"));
            cs.RegisterArrayDeclaration("grdLastName_Txt", String.Concat("'", txtgrdLastName.ClientID, "'"));
            cs.RegisterArrayDeclaration("grdAttendeType_ddl", String.Concat("'", ddlAttendeType.ClientID, "'"));

            cs.RegisterArrayDeclaration("grdOrganization_Txt", String.Concat("'", txtOrganization.ClientID, "'"));
            cs.RegisterArrayDeclaration("grdEmail_Txt", String.Concat("'", txtgrdEmail.ClientID, "'"));
            cs.RegisterArrayDeclaration("grdPhone_Txt", String.Concat("'", txtPhone.ClientID, "'"));
            cs.RegisterArrayDeclaration("grdAddress_Txt", String.Concat("'", txtAddress.ClientID, "'"));
            cs.RegisterArrayDeclaration("grdCountry_ddl", String.Concat("'", ddlCountry.ClientID, "'"));
            cs.RegisterArrayDeclaration("grdZip_Txt", String.Concat("'", txtZip.ClientID, "'"));
            cs.RegisterArrayDeclaration("grdCity_Txt", String.Concat("'", txtCity.ClientID, "'"));
            cs.RegisterArrayDeclaration("grdState_ddl", String.Concat("'", ddlState.ClientID, "'"));
            cs.RegisterArrayDeclaration("grdOtherCountry_Txt", String.Concat("'", txtCountry.ClientID, "'"));
            cs.RegisterArrayDeclaration("grdOtherState_Txt", String.Concat("'", txtState.ClientID, "'"));
            txtCountry.Attributes.Add("onfocus", "javascript: return hide('" + txtCountry.ClientID + "')");
            txtState.Attributes.Add("onfocus", "javascript: return hide('" + txtState.ClientID + "')");

            if (Session["AdminOrder"] != null)
            {
                HtmlInputText txtAdminPrice = (HtmlInputText)e.Row.FindControl("txtAdminPrice");
                HtmlGenericControl divAdminPrice = (HtmlGenericControl)e.Row.FindControl("divAdminPrice");
                divAdminPrice.Visible = true;
                checkadmin = "yes";
                cs.RegisterArrayDeclaration("grdAdminPrice_Txt", String.Concat("'", txtAdminPrice.ClientID, "'"));
                cs.RegisterArrayDeclaration("grddivAdminPrice_Txt", String.Concat("'", divAdminPrice.ClientID, "'"));
            }
            else
            {
                checkadmin = "no";
            }

            ddlCountry.Attributes.Add("onchange", "javascript: return display('" + ddlCountry.ClientID + "','" + txtCountry.ClientID + "','" + ddlState.ClientID + "','" + txtState.ClientID + "')");
            if (myDataTable.Rows.Count == 1)
                btnDelete.Visible = false;
            if (myDataTable.Rows[e.Row.RowIndex]["FirstName"].ToString() == "")
                btnModify.Visible = false;

            if (myDataTable.Rows[e.Row.RowIndex]["OtherCountry"].ToString() != "")
            {
                ddlState.Attributes.Add("style", "display:none");
                txtState.Attributes.Add("style", "display:block");
                txtCountry.Attributes.Add("style", "display:block");
                ddlCountry.Items.FindByText("Other").Selected = true;
            }
            else
            {
                ddlState.Attributes.Add("style", "display:block");
                txtCountry.Attributes.Add("style", "display:none");
                txtState.Attributes.Add("style", "display:none");
                if (myDataTable.Rows[e.Row.RowIndex]["Country"].ToString() != "")
                    ddlCountry.Items.FindByText(myDataTable.Rows[e.Row.RowIndex]["Country"].ToString()).Selected = true;
                if (myDataTable.Rows[e.Row.RowIndex]["State"].ToString() != "")
                    ddlState.Items.FindByText(myDataTable.Rows[e.Row.RowIndex]["State"].ToString()).Selected = true;
            }
            if (myDataTable.Rows[e.Row.RowIndex]["AttendeType"].ToString() != "")
                ddlAttendeType.Items.FindByText(myDataTable.Rows[e.Row.RowIndex]["AttendeType"].ToString()).Selected = true;


        }
    }
    protected void initialMakeUp(object sender, EventArgs e)
    {
        cs = Page.ClientScript;

        int count = 1;
        foreach (GridViewRow grdrow in grdAttendee.Rows)
        {

            HtmlInputText txtgrdFirstName = (HtmlInputText)grdrow.FindControl("txtFirstName");
            HtmlInputText txtgrdLastName = (HtmlInputText)grdrow.FindControl("txtLastName");
            DropDownList ddlAttendeType = (DropDownList)grdrow.FindControl("ddlAttendeType");
            HtmlInputText txtOrganization = (HtmlInputText)grdrow.FindControl("txtOrganization");
            HtmlInputText txtgrdEmail = (HtmlInputText)grdrow.FindControl("txtEmail");
            HtmlInputText txtPhone = (HtmlInputText)grdrow.FindControl("txtPhone");
            HtmlInputText txtAddress = (HtmlInputText)grdrow.FindControl("txtAddress");
            DropDownList ddlCountry = (DropDownList)grdrow.FindControl("ddlCountry");
            HtmlInputText txtCity = (HtmlInputText)grdrow.FindControl("txtCity");
            HtmlInputText txtCountry = (HtmlInputText)grdrow.FindControl("txtCountry");
            HtmlInputText txtState = (HtmlInputText)grdrow.FindControl("txtState");
            DropDownList ddlState = (DropDownList)grdrow.FindControl("ddlState");
            Label lblHeading = (Label)grdrow.FindControl("lblHeading");
            lblHeading.Text = "Attendee No: " + count.ToString() + " Information";
            cs.RegisterArrayDeclaration("grdFirstName_Txt", String.Concat("'", txtgrdFirstName.ClientID, "'"));
            cs.RegisterArrayDeclaration("grdLastName_Txt", String.Concat("'", txtgrdLastName.ClientID, "'"));
            cs.RegisterArrayDeclaration("grdAttendeType_ddl", String.Concat("'", ddlAttendeType.ClientID, "'"));

            cs.RegisterArrayDeclaration("grdOrganization_Txt", String.Concat("'", txtOrganization.ClientID, "'"));
            cs.RegisterArrayDeclaration("grdEmail_Txt", String.Concat("'", txtgrdEmail.ClientID, "'"));
            cs.RegisterArrayDeclaration("grdPhone_Txt", String.Concat("'", txtPhone.ClientID, "'"));
            cs.RegisterArrayDeclaration("grdAddress_Txt", String.Concat("'", txtAddress.ClientID, "'"));
            cs.RegisterArrayDeclaration("grdCountry_ddl", String.Concat("'", ddlCountry.ClientID, "'"));
            cs.RegisterArrayDeclaration("grdCity_Txt", String.Concat("'", txtCity.ClientID, "'"));
            cs.RegisterArrayDeclaration("grdState_ddl", String.Concat("'", ddlState.ClientID, "'"));
            cs.RegisterArrayDeclaration("grdOtherState_Txt", String.Concat("'", txtState.ClientID, "'"));
            ddlCountry.Attributes.Add("onchange", "javascript: return display('" + ddlCountry.ClientID + "','" + txtCountry.ClientID + "','" + ddlState.ClientID + "','" + txtState.ClientID + "')");

            count++;

        }


    }
    protected void action(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "goBack")
        {
            Response.Redirect("index.aspx");
        }
        if (e.CommandName == "remove")
        {
            createTable();
            int rno = int.Parse(e.CommandArgument.ToString()) - 1;

            if (myDataTable.Rows[rno]["AttendeType"].ToString() == "Investment Professional")
            {
                Session["IPCount"] = ((int.Parse(Session["IPCount"].ToString()) - 1).ToString());
            }
            else
                if (myDataTable.Rows[rno]["AttendeType"].ToString() == "Non-Investment Professional")
                {
                    Session["NiPCount"] = ((int.Parse(Session["IPCount"].ToString()) - 1).ToString());
                }
                else
                {
                    Session["VrCount"] = ((int.Parse(Session["IPCount"].ToString()) - 1).ToString());
                }


            myDataTable.Rows[rno].Delete();
            Session["AttendeeCount"] = (int.Parse(Session["AttendeeCount"].ToString()) - 1).ToString();

            objAttende = new Attende[int.Parse(Session["AttendeeCount"].ToString())];
            for (int i = 0; i < myDataTable.Rows.Count; i++)
            {
                objAttende[i] = new Attende();
                objAttende[i].Price = myDataTable.Rows[i]["Price"].ToString();

                objAttende[i].FirstName = myDataTable.Rows[i]["FirstName"].ToString();
                objAttende[i].LastName = myDataTable.Rows[i]["LastName"].ToString();
                objAttende[i].AttendeeType = myDataTable.Rows[i]["AttendeType"].ToString();
                objAttende[i].Organization = myDataTable.Rows[i]["Organization"].ToString();
                objAttende[i].Title = myDataTable.Rows[i]["Title"].ToString();
                objAttende[i].Email = myDataTable.Rows[i]["Email"].ToString();
                objAttende[i].Phone = myDataTable.Rows[i]["Phone"].ToString();
                objAttende[i].Ext = myDataTable.Rows[i]["Ext"].ToString();
                objAttende[i].Address = myDataTable.Rows[i]["Address"].ToString();
                objAttende[i].OtherAddress = myDataTable.Rows[i]["OtherAddress"].ToString();
                objAttende[i].country = myDataTable.Rows[i]["Country"].ToString();
                objAttende[i].OtherCountry = myDataTable.Rows[i]["OtherCountry"].ToString();
                objAttende[i].city = myDataTable.Rows[i]["City"].ToString();
                objAttende[i].state = myDataTable.Rows[i]["State"].ToString();
                objAttende[i].OtherState = myDataTable.Rows[i]["OtherState"].ToString();
                objAttende[i].zip = myDataTable.Rows[i]["Zip"].ToString();
            }
            Session["Attendees"] = objAttende;
            createTable();
            FillGrid();
        }



        if (e.CommandName == "change")
        {
            int rno = int.Parse(e.CommandArgument.ToString()) - 1;
            int count = int.Parse(Session["AttendeeCount"].ToString());
            Attende[] objAttende = new Attende[count];
            objAttende = (Attende[])Session["Attendees"];
            HtmlInputText txtgrdFirstName = (HtmlInputText)grdAttendee.Rows[rno].FindControl("txtFirstName");
            HtmlInputText txtgrdLastName = (HtmlInputText)grdAttendee.Rows[rno].FindControl("txtLastName");
            DropDownList ddlAttendeType = (DropDownList)grdAttendee.Rows[rno].FindControl("ddlAttendeType");
            HtmlInputText txtOrganization = (HtmlInputText)grdAttendee.Rows[rno].FindControl("txtOrganization");
            HtmlInputText txtTitle = (HtmlInputText)grdAttendee.Rows[rno].FindControl("txtTitle");
            HtmlInputText txtgrdEmail = (HtmlInputText)grdAttendee.Rows[rno].FindControl("txtEmail");
            HtmlInputText txtPhone = (HtmlInputText)grdAttendee.Rows[rno].FindControl("txtPhone");
            HtmlInputText txtExt = (HtmlInputText)grdAttendee.Rows[rno].FindControl("txtExt");
            HtmlInputText txtAddress = (HtmlInputText)grdAttendee.Rows[rno].FindControl("txtAddress");
            HtmlInputText txtOtherAddress = (HtmlInputText)grdAttendee.Rows[rno].FindControl("txtOtherAddress");
            DropDownList ddlCountry = (DropDownList)grdAttendee.Rows[rno].FindControl("ddlCountry");
            HtmlInputText txtCity = (HtmlInputText)grdAttendee.Rows[rno].FindControl("txtCity");
            HtmlInputText txtCountry = (HtmlInputText)grdAttendee.Rows[rno].FindControl("txtCountry");
            HtmlInputText txtState = (HtmlInputText)grdAttendee.Rows[rno].FindControl("txtState");
            DropDownList ddlState = (DropDownList)grdAttendee.Rows[rno].FindControl("ddlState");
            HtmlInputText txtZip = (HtmlInputText)grdAttendee.Rows[rno].FindControl("txtZip");


            if (Session["AdminOrder"] != null)
            {
                HtmlInputText txtAdminPrice = (HtmlInputText)grdAttendee.Rows[rno].FindControl("txtAdminPrice");
                HtmlGenericControl divAdminPrice = (HtmlGenericControl)grdAttendee.Rows[rno].FindControl("divAdminPrice");
                divAdminPrice.Visible = true;
                objAttende[rno].Price = txtAdminPrice.Value;
                //cs.RegisterArrayDeclaration("grdAdminPrice_Txt", String.Concat("'", txtAdminPrice.ClientID, "'"));
                //cs.RegisterArrayDeclaration("grddivAdminPrice_Txt", String.Concat("'", divAdminPrice.ClientID, "'"));
            }



            //objAttende[rno] = new Attende();
            objAttende[rno].FirstName = txtgrdFirstName.Value;
            objAttende[rno].LastName = txtgrdLastName.Value;
            if (objAttende[rno].AttendeeType != ddlAttendeType.Items[ddlAttendeType.SelectedIndex].Text)
            {
                if (ddlAttendeType.Items[ddlAttendeType.SelectedIndex].Text == "Investment Professional")
                {

                    Session["IPCount"] = (int.Parse(Session["IPCount"].ToString() + 1).ToString());
                    Session["NiPCount"] = ((int.Parse(Session["IPCount"].ToString()) - 1).ToString());
                    Session["VrCount"] = ((int.Parse(Session["IPCount"].ToString()) - 1).ToString());
                }
                else
                    if (ddlAttendeType.Items[ddlAttendeType.SelectedIndex].Text == "Non-Investment Professional")
                    {
                        Session["IPCount"] = ((int.Parse(Session["IPCount"].ToString()) - 1).ToString());
                        Session["NiPCount"] = (int.Parse(Session["NiPCount"].ToString() + 1).ToString());
                        Session["VrCount"] = ((int.Parse(Session["IPCount"].ToString()) - 1).ToString());
                    }
                    else
                    {
                        Session["IPCount"] = ((int.Parse(Session["IPCount"].ToString()) - 1).ToString());
                        Session["NiPCount"] = ((int.Parse(Session["IPCount"].ToString()) - 1).ToString());
                        Session["VrCount"] = ((int.Parse(Session["VrCount"].ToString()) + 1).ToString());

                    }
            }
            objAttende[rno].AttendeeType = ddlAttendeType.Items[ddlAttendeType.SelectedIndex].Text;
            objAttende[rno].Organization = txtOrganization.Value;
            objAttende[rno].Title = (txtTitle.Value == "" ? String.Empty : txtTitle.Value);
            objAttende[rno].Email = txtgrdEmail.Value;
            objAttende[rno].Phone = txtPhone.Value;
            objAttende[rno].Ext = (txtExt.Value == "" ? String.Empty : txtExt.Value);
            objAttende[rno].Address = txtAddress.Value;
            objAttende[rno].city = txtCity.Value;
            objAttende[rno].OtherAddress = (txtOtherAddress.Value == "" ? String.Empty : txtOtherAddress.Value);
            objAttende[rno].country = ((ddlCountry.Items[ddlCountry.SelectedIndex].Text == "-Select-") ? String.Empty : ddlCountry.Items[ddlCountry.SelectedIndex].Text);
            objAttende[rno].OtherCountry = (txtCountry.Value == "Country" ? String.Empty : txtCountry.Value);
            objAttende[rno].state = ((ddlState.Items[ddlState.SelectedIndex].Text == "-Select-") ? String.Empty : ddlState.Items[ddlState.SelectedIndex].Text);
            objAttende[rno].OtherState = (txtState.Value == "State" ? String.Empty : txtState.Value);
            objAttende[rno].zip = (txtZip.Value == "" ? String.Empty : txtZip.Value);


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
            createTable();
            FillGrid();

        }
        if (e.CommandName == "insertAttendee")
        {
            createTable();
            DataRow myDataRow = myDataTable.NewRow();
            myDataTable.Rows.Add(myDataRow);
            int r = int.Parse(Session["AttendeeCount"].ToString()) + 1;
            objAttende = new Attende[r];
            objAttende = (Attende[])Session["Attendees"];
            Attende[] objAtt = new Attende[r];
            for (int i = 0; i < r - 1; i++)
                objAtt[i] = objAttende[i];
            objAtt[r - 1] = new Attende();

            objAtt[r - 1].FirstName = String.Empty;
            objAtt[r - 1].LastName = String.Empty;
            objAtt[r - 1].AttendeeType = String.Empty;
            objAtt[r - 1].Organization = String.Empty;
            objAtt[r - 1].Title = String.Empty;
            objAtt[r - 1].Email = String.Empty;
            objAtt[r - 1].Phone = String.Empty;
            objAtt[r - 1].Ext = String.Empty;
            objAtt[r - 1].Address = String.Empty;
            objAtt[r - 1].OtherAddress = String.Empty;
            objAtt[r - 1].country = String.Empty;
            objAtt[r - 1].OtherCountry = String.Empty;
            objAtt[r - 1].city = String.Empty;
            objAtt[r - 1].state = String.Empty;
            objAtt[r - 1].OtherState = String.Empty;
            objAtt[r - 1].zip = String.Empty;
            objAtt[r - 1].Price = string.Empty;
            //objAtt[r - 1].AdminPrice  = String.Empty;
            Session["Attendees"] = objAtt;
            Session["AttendeeCount"] = (int.Parse(Session["AttendeeCount"].ToString()) + 1).ToString();

            createTable();
            FillGrid();

        }
        if (e.CommandName == "Finished")
        {
            int count = int.Parse(Session["AttendeeCount"].ToString());
            int ipCount = 0;
            int nIpCount = 0;
            int vrCount = 0;
            int[] APCount = new int[count];
            Attende[] objAttende = new Attende[count];
            int rc = 0;
            foreach (GridViewRow grdrow in grdAttendee.Rows)
            {

                HtmlInputText txtgrdFirstName = (HtmlInputText)grdrow.FindControl("txtFirstName");
                HtmlInputText txtgrdLastName = (HtmlInputText)grdrow.FindControl("txtLastName");
                DropDownList ddlAttendeType = (DropDownList)grdrow.FindControl("ddlAttendeType");
                HtmlInputText txtOrganization = (HtmlInputText)grdrow.FindControl("txtOrganization");
                HtmlInputText txtTitle = (HtmlInputText)grdrow.FindControl("txtTitle");
                HtmlInputText txtgrdEmail = (HtmlInputText)grdrow.FindControl("txtEmail");
                HtmlInputText txtPhone = (HtmlInputText)grdrow.FindControl("txtPhone");
                HtmlInputText txtExt = (HtmlInputText)grdrow.FindControl("txtExt");
                HtmlInputText txtAddress = (HtmlInputText)grdrow.FindControl("txtAddress");
                HtmlInputText txtOtherAddress = (HtmlInputText)grdrow.FindControl("txtOtherAddress");
                DropDownList ddlCountry = (DropDownList)grdrow.FindControl("ddlCountry");
                HtmlInputText txtCity = (HtmlInputText)grdrow.FindControl("txtCity");
                HtmlInputText txtCountry = (HtmlInputText)grdrow.FindControl("txtCountry");
                HtmlInputText txtState = (HtmlInputText)grdrow.FindControl("txtState");
                DropDownList ddlState = (DropDownList)grdrow.FindControl("ddlState");
                HtmlInputText txtZip = (HtmlInputText)grdrow.FindControl("txtZip");

                objAttende[rc] = new Attende();

                if (Session["AdminOrder"] != null)
                {
                    HtmlInputText txtAdminPrice = (HtmlInputText)grdrow.FindControl("txtAdminPrice");
                    HtmlGenericControl divAdminPrice = (HtmlGenericControl)grdrow.FindControl("divAdminPrice");
                    divAdminPrice.Visible = true;
                    objAttende[rc].Price = txtAdminPrice.Value;
                    APCount[rc] = Convert.ToInt32(txtAdminPrice.Value);
                    //cs.RegisterArrayDeclaration("grdAdminPrice_Txt", String.Concat("'", txtAdminPrice.ClientID, "'"));
                    //cs.RegisterArrayDeclaration("grddivAdminPrice_Txt", String.Concat("'", divAdminPrice.ClientID, "'"));
                }

                objAttende[rc].FirstName = txtgrdFirstName.Value;
                objAttende[rc].LastName = txtgrdLastName.Value;
                objAttende[rc].AttendeeType = ddlAttendeType.Items[ddlAttendeType.SelectedIndex].Text;
                objAttende[rc].Organization = txtOrganization.Value;
                objAttende[rc].Title = (txtTitle.Value == "" ? String.Empty : txtTitle.Value);
                objAttende[rc].Email = txtgrdEmail.Value;
                objAttende[rc].Phone = txtPhone.Value;
                objAttende[rc].Ext = (txtExt.Value == "" ? String.Empty : txtExt.Value);
                objAttende[rc].city = txtCity.Value;
                objAttende[rc].Address = txtAddress.Value;
                objAttende[rc].OtherAddress = (txtOtherAddress.Value == "" ? String.Empty : txtOtherAddress.Value);
                objAttende[rc].country = ((ddlCountry.Items[ddlCountry.SelectedIndex].Text == "-Select-") ? String.Empty : ddlCountry.Items[ddlCountry.SelectedIndex].Text);
                objAttende[rc].OtherCountry = (txtCountry.Value == "Country" ? String.Empty : txtCountry.Value);
                objAttende[rc].state = ((ddlState.Items[ddlState.SelectedIndex].Text == "-Select-") ? String.Empty : ddlState.Items[ddlState.SelectedIndex].Text);
                objAttende[rc].OtherState = (txtState.Value == "State" ? String.Empty : txtState.Value);
                objAttende[rc].zip = (txtZip.Value == "" ? String.Empty : txtZip.Value);

                if (ddlAttendeType.Items[ddlAttendeType.SelectedIndex].Text == "Investment Professional")
                    ipCount++;
                else
                    if (ddlAttendeType.Items[ddlAttendeType.SelectedIndex].Text == "Non-Investment Professional")
                        nIpCount++;
                    else
                        vrCount++;

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
            Session["VrCount"] = vrCount.ToString();
            Session["AdminPrices"] = APCount;
            Response.Redirect("DelegateSummaryInfo.aspx");


        }
    }
}
