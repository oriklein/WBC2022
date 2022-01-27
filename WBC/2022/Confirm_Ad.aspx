<%@ Page Language="C#" AutoEventWireup="true" Inherits="Confirm_Cheque" CodeFile="Confirm_Ad.aspx.cs" %>
<% Response.WriteFile("inc.header2.aspx"); %>
<% Response.WriteFile("inc.header.body1.aspx"); %>
<% Response.WriteFile("inc.header.body2.aspx"); %>
<%-- include actual code from page --%>

<form id="form1" name="forattendee" runat="server">
  <div id="dvCreditCard" runat="server">
    <div id="main">
      <div class="section">
        <div class="col col-100 center">
         
           <p>Hello!</p>
                    <p>Thank you for your ad purchase for the 2015 Merit Award Dinner!  Your purchase details are as follows:</p>
                  
                    Confirmation Number:
                    <h3><asp:label id="lblConfirm" runat="server"></asp:label></h3>
             
                    <h3>Registration Details</h3>
                    <p class="large">
                        <asp:label id="lblStatus" runat="server"></asp:label>
                    </p>
                    <h3>Event Details</h3>
                    <p>
                        April 21st, 2015<br />
                        6pm-10pm
                        <br />
                        American Museum of Natural History<br />
                        Central Park West at 79th St<br />
                        New York, NY 10024
                    </p>
                    <p>You will receive an email from XXX to collect your payment information.  </p>
                    
                     <div id="divAd" runat="server">
                         <p><%=Mad %></p>
                    <p class="large" >All logos and ads must be submitted by Friday, April 1.</p>
                       
                    <p>The ad and logo specs are as follows:</p>

                    <ul>
                        <li>Dimensions of the ad should be 7� W x 5� H</li>
                        <li>All ads should be black & white/grayscale</li>
                        <li>Accepted file formats are: Illustrator EPS (convert text to outline), High-resolution TIFFs (300 dpi or greater), or PDFs (X-1A).</li>
                        <li>Corporate logo in color as a high-resolution TIFF, JPEG, or EPS.</li>
                    </ul>
                    <p>Please email your ad and logo to joy@sequence-events.com</p>
                        </div>
                    <p>Feel free to contact me if you have any questions.</p>
                    <p>Thanks and we look forward to seeing you in April!</p>
                    <p>Joy</p>
                   


          </div>
      </div>
    </div>
  </div>
 
</form>
<% Response.WriteFile("inc.footer.aspx"); %>
