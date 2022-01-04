using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Collections.Generic;
/// <summary>
/// Summary description for AuthorizeNetRespose
/// </summary>
public class AuthorizeNetResponse 
{  
    public AuthorizeNetResponse() 
    {  
        // TODO: Add constructor logic here 
        
    }  
    private string mstrTransactionId;
    private string mlstErrors;  
    private string mlstSuccessMessage;
    private bool mblnIsSuccess; 


    private string mdblAmount;
    private string mstrCardNumber;
    private string mstrCardExpirationDate;
    private string mstrLastName;
    private string mstrFirstName;
    private string mstrCompanyName;
    private string mstrEmail;
    private string mstrinvoiceNumber;
    private string mstrPhone;
    private string mstrAddress;
    private string mstrCountry;
    private string mstrCity;
    private string mstrState;
    private string mstrZip;



    public string Country
    {
        get
        {
            return mstrCountry;
        }
        set
        {
            mstrCountry = value;
        }
    }


    public string Address
    {
        get
        {
            return mstrAddress;
        }
        set
        {
            mstrAddress = value;
        }
    }


    public string Phone
    {
        get
        {
            return mstrPhone;
        }
        set
        {
            mstrPhone = value;
        }
    }

    public string invoiceNumber
    {
        get
        {
            return mstrinvoiceNumber;
        }
        set
        {
            mstrinvoiceNumber = value;
        }
    }



    public string City
    {
        get
        {
            return mstrCity;
        }
        set
        {
            mstrCity = value;
        }
    }


    public string State
    {
        get
        {
            return mstrState;
        }
        set
        {
            mstrState = value;
        }
    }


    public string Zip
    {
        get
        {
            return mstrZip;
        }
        set
        {
            mstrZip = value;
        }
    }

    public string Email
    {
        get
        {
            return mstrEmail;
        }
        set
        {
            mstrEmail = value;
        }
    }
    public string CompanyName
    {
        get
        {
            return mstrCompanyName;
        }
        set
        {
            mstrCompanyName = value;
        }
    }
    public string FirstName
    {
        get
        {
            return mstrFirstName;
        }
        set
        {
            mstrFirstName = value;
        }
    }
    public string LastName
    {
        get
        {
            return mstrLastName;
        }
        set
        {
            mstrLastName = value;
        }
    }

    
    public string CardNumber
    {
        get
        {
            return mstrCardNumber;
        }
        set
        {
            mstrCardNumber = value;
        }
    }
    public string Amount
    {
        get
        {
            return mdblAmount;
        }
        set
        {
            mdblAmount = value;
        }
    }
   
    public string CardExpirationDate
    {
        get
        {
            return mstrCardExpirationDate;
        }
        set
        {
            mstrCardExpirationDate = value;
        }
    }
    
    






    public string SuccessMessage  
    {  
        get 
        { 
            return mlstSuccessMessage; 
        }  
        set
        { 
            mlstSuccessMessage = value; 
        }  
    }  
    
    public bool IsSuccess  
    {  
        get 
        { 
            return mblnIsSuccess; 
        }  
        set 
        { 
            mblnIsSuccess = value;
        }  
    }  
    public string Errors  
    {  
        get 
        { 
            return mlstErrors;
        }  
        set 
        { 
            mlstErrors = value; 
        }  
    }  
    public string TransactionId  
    { 
        get 
        { 
            return mstrTransactionId; 
        }  
        set 
        { 
            mstrTransactionId = value; 
        }  
    }  
}
