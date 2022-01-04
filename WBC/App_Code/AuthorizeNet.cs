using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Text;
using System.Net; 
using System.IO; 

/// <summary>
/// Summary description for AuthorizeNet
/// </summary>
public static class AuthorizeNet 
{   
    #region Private Member(s) 
    private static string UNEXPECTED_ERROR = "Unexpected error"; 
    private static string AUTHORIZENET_TEST_URL = "https://test.authorize.net/gateway/transact.dll";
    private static string AUTHORIZENET_LIVE_URL = "https://secure.authorize.net/gateway/transact.dll";
    #endregion                                     
    //https://authorize.net/gateway/transact.dll
    #region Transaction Type Enum(s)
    public enum TransactionType  
    { 
        AUTH_CAPTURE = 0, AUTH_ONLY,PRIOR_AUTH_CAPTURE, CREDIT,VOID
    } 
    // Get string for Enum 
     public static string GetSringForEnum(TransactionType TransType)
     {  
          switch (TransType) 
          { 
              case TransactionType.AUTH_CAPTURE: 
                                                return "AUTH_CAPTURE"; 
                                                break; 
              case TransactionType.AUTH_ONLY:  
                                                return "AUTH_ONLY";  
                                                break;  
              case TransactionType.PRIOR_AUTH_CAPTURE: 
                                                return "PRIOR_AUTH_CAPTURE"; 
                                                break;  
              case TransactionType.CREDIT: 
                                                return "CREDIT"; 
                                                break;  
              case TransactionType.VOID:  
                                               return "VOID";  
                                               break;  
              default:  
                                               return string.Empty; 
                                               break;  
          }  
     }   
    #endregion  
    /// <summary>  
    /// /// Generate Rququest string  
    /// /// </summary>  
    /// /// <param name="objAuthorizeNetRequest"></param>  
    /// /// <returns></returns>  
    private static string GetRequestString(AuthorizeNetRequest objAuthorizeNetRequest,TransactionType TransType)
       {
        StringBuilder stbRequest = new StringBuilder(string.Empty);
        stbRequest.Append("x_login=");  
        stbRequest.Append(objAuthorizeNetRequest.Login);  
        stbRequest.Append("&x_type=");  
        stbRequest.Append(GetSringForEnum(TransType));
        //The following new field added by me
        stbRequest.Append("&x_method=CC");
        //stbRequest.Append("&x_trans_id=");
        //stbRequest.Append(objAuthorizeNetRequest.TransactionId);  
        stbRequest.Append("&x_amount="); 
        stbRequest.Append(objAuthorizeNetRequest.Amount);  
        stbRequest.Append("&x_card_num="); 
        stbRequest.Append(objAuthorizeNetRequest.CardNumber); 
        stbRequest.Append("&x_exp_date="); 
        stbRequest.Append(objAuthorizeNetRequest.CardExpirationDate); 
        stbRequest.Append("&x_tran_key="); 
        stbRequest.Append(objAuthorizeNetRequest.TransactionKey); 
        stbRequest.Append("&x_relay_response=FALSE");
        stbRequest.Append("&x_delim_data=TRUE"); 
        stbRequest.Append("&x_delim_char=|"); 
        stbRequest.Append("&x_email=");
        stbRequest.Append(objAuthorizeNetRequest.Email);
        stbRequest.Append("&x_company=");
        stbRequest.Append(objAuthorizeNetRequest.CompanyName);
        stbRequest.Append("&x_First_Name=");
        stbRequest.Append(objAuthorizeNetRequest.FirstName);
        stbRequest.Append("&x_Last_Name=");
        stbRequest.Append(objAuthorizeNetRequest.LastName);
        stbRequest.Append("&x_Phone=");
        stbRequest.Append(objAuthorizeNetRequest.Phone);
        stbRequest.Append("&x_Address=");
        stbRequest.Append(objAuthorizeNetRequest.Address);
        stbRequest.Append("&x_City=");
        stbRequest.Append(objAuthorizeNetRequest.City);
        stbRequest.Append("&x_State=");
        stbRequest.Append(objAuthorizeNetRequest.State);
        stbRequest.Append("&x_Zip=");
        stbRequest.Append(objAuthorizeNetRequest.Zip);
        stbRequest.Append("&x_Country=");
        stbRequest.Append(objAuthorizeNetRequest.Country); 
        // If x_test_request = FALSE, TransactionId is generated. 
        stbRequest.Append("&x_test_request=FALSE"); 
        // First name and Last will be displayed in Transaction report. (LastName,FirstName)
        
        if (TransType == TransactionType.CREDIT || TransType == TransactionType.PRIOR_AUTH_CAPTURE || TransType == TransactionType.VOID) 
            { 
            stbRequest.Append("&x_trans_id="); 
            stbRequest.Append(objAuthorizeNetRequest.TransactionId);
            
            }    
        return stbRequest.ToString(); 
    } 
    /// <summary> 
    /// /// Authorize the merchant detail and if merchant is valid process the credit card. 
    /// /// </summary> 
    /// /// <param name="objAuthorizeNetRequest"></param> 
    /// /// <returns></returns> 
     public static AuthorizeNetResponse CallAuthorizeNetMethod(AuthorizeNetRequest objAuthorizeNetRequest)
          { 
         AuthorizeNetResponse objAuthorizeNetResponse = new AuthorizeNetResponse(); 
         string strRequest = GetRequestString(objAuthorizeNetRequest, objAuthorizeNetRequest.TransactionType);
         string strResponse = string.Empty;
         WebRequest objWebRequest = WebRequest.Create(AUTHORIZENET_LIVE_URL); 
         objWebRequest.Method = "POST"; 
         objWebRequest.ContentLength = strRequest.Length; 
         objWebRequest.ContentType = "application/x-www-form-urlencoded"; 
         // Add request parameters to memory stream before sending the web request. 
          using (StreamWriter objStreamWriter = new StreamWriter(objWebRequest.GetRequestStream()))
             { 
              objStreamWriter.Write(strRequest,0,strRequest.Length); 
              objStreamWriter.Close(); 
          } 
         // Get Response back. 
          WebResponse objWebResponse = objWebRequest.GetResponse();
         // Retrieve result parameter. 
         using (StreamReader objStreamReader = new StreamReader(objWebResponse.GetResponseStream())) 
              { 
             strResponse = objStreamReader.ReadToEnd(); 
             objStreamReader.Close(); 
               } 
         HandleResponse(strResponse, objAuthorizeNetResponse); 
         return objAuthorizeNetResponse; 
     } 
    
      private static void HandleError(AuthorizeNetResponse objAuthorizeNetResponse,string ErrorMessage)
          { 
          objAuthorizeNetResponse.IsSuccess = false; 
          objAuthorizeNetResponse.Errors = ErrorMessage; 
          } 
     
    private static void HandleResponse(string strResponse, AuthorizeNetResponse objAuthorizeNetResponse)
    { 
        /********************************************************************************************************************************************************************************************************** 
         ** We will get the response srting as shown below, this is a sample string 
         *** 1|1|1|This transaction has been approved.|Ravi|Y|508252758|||100.00|CC|auth_capture||||||||||||chanduravi75@gmail.com||||||||||||||AAD0537178B11C0F1105614FD1774773||2||||||||||||||||||||||||||||
         ** The first value before the first pipe(|) symbol indicates the result.
         ** Below is teh link that represents the different Response code 
         ** http://www.authorize.net/support/Merchant/Transaction_Response/Response_Reason_Codes_and_Response_Reason_Text.htm 
         ***********************************************************************************************************************************************************************************************************/ 
         string[] strWebResponse = strResponse.Split(new char[] { '|' }, StringSplitOptions.None);
         if (strResponse != null) 
         { 
             // Check the response 
             if (strWebResponse[0] == "1")
             { 
                 objAuthorizeNetResponse.IsSuccess = true;
                 if (strWebResponse.Length > 3) 
                     objAuthorizeNetResponse.SuccessMessage = strWebResponse[3]; 
                  // If x_test_request = FALSE, we will get transaction id else Transaction id = 0 
                  if (strWebResponse.Length > 6) 
                      objAuthorizeNetResponse.TransactionId = strWebResponse[6];
                  if (strWebResponse.Length > 24)
                  {
                      objAuthorizeNetResponse.FirstName = strWebResponse[13];
                      objAuthorizeNetResponse.LastName = strWebResponse[14];
                      objAuthorizeNetResponse.Amount = (double.Parse(strWebResponse[9].ToString())).ToString("C");
                      objAuthorizeNetResponse.CompanyName = strWebResponse[15];
                      objAuthorizeNetResponse.Phone = strWebResponse[21];
                      objAuthorizeNetResponse.Email = strWebResponse[23];
                      objAuthorizeNetResponse.Country = strWebResponse[20];
                      objAuthorizeNetResponse.City = strWebResponse[17];
                      objAuthorizeNetResponse.State = strWebResponse[18];
                      objAuthorizeNetResponse.Zip = strWebResponse[19];
                  }
             } 
             else 
              { 
                 if (strWebResponse.Length > 3)
                     HandleError(objAuthorizeNetResponse, strWebResponse[3]); 
                    else 
                     HandleError(objAuthorizeNetResponse, UNEXPECTED_ERROR); 
              } 
         } 
         else 
         { 
             HandleError(objAuthorizeNetResponse, UNEXPECTED_ERROR); 
          } 
    } 
}
  

