<%@ Page Language="C#" AutoEventWireup="true" Inherits="Contri_ChequeConfirm" CodeFile="Contri_ChequeConfirm.aspx.cs" %>

<% Response.WriteFile("inc.header2.aspx"); %>
<% Response.WriteFile("inc.header.body1.aspx"); %>
<% Response.WriteFile("inc.header.body2.aspx"); %>

<form id="form1" name="forattendee" runat="server">
    <style>hr.style-two {border: 0; border-bottom: 1px dashed #ccc; background: #999;margin-left:0px;width:250px; }</style>
    <div id="dvCreditCard" runat="server">
        <div id="main">
            <div class="section">
                <div class="col col-100 center">
                    <ul class="menu menu-progress menu-match">
                        <li>REGISTRATION</li>
                        <li>DETAILS</li>
                        <li class="active">CONFIRMATION</li>
                    </ul>

                    <p class="large">Hello!</p>
                    <p class="large">Thank you for your table commitment for the <%=EventDetails.EventYear %> Merit Award Dinner!  Your purchase details are as follows:</p>
                    <h3><%=LvlMsg%></h3>

                    <h3>Registration Details</h3>
                    <p class="large">
                        <asp:label id="lblStatus" runat="server"></asp:label>
                    </p>
                    <h3>Event Details</h3>
                    <hr class="style-two">
                    <p class="large">
                        <%=EventDetails.EventMonth %> <%=EventDetails.EventDate %>, <%=EventDetails.EventYear %><br />
                        Starting at 6:00 PM
                        <br />
                        Business Formal<br />
                        American Museum of Natural History<br />
                        Central Park West at 79th St.<br />
                        New York, NY 10024
                    </p>

                    <%=Desc %>

                    <p class="large">Feel free to contact me if you have any questions.</p>
                    <p class="large">Thanks and we look forward to seeing you in April!</p>
                    <p class="large">Lily</p>
                    <p class="large">617-780-2556</p>




                </div>
            </div>
        </div>
    </div>
    <%--- email end ---%>
    <div id="divAdmin" class="mrgnLf" runat="server">
        <a href="http://www.sequence-events.com/wbc/BO/BoIndex.aspx">BO Home</a>&nbsp;&nbsp; |&nbsp;&nbsp;
    <asp:linkbutton id="LinkButton1" runat="server" onclick="lnkLogOut_Click">Logout</asp:linkbutton>
    </div>
</form>
<% Response.WriteFile("inc.footer.aspx"); %>
