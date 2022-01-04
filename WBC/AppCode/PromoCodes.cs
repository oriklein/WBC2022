using System;
using System.Data.SqlClient;
using System.Data;
using Locust.Common.DB;

public class PromoCodes
{

    string[] PromoCodeList = new string[] {"ACKMAN","ARIELY","BLOOMBERG","DEVINE","EINHORN","EVAN","GORDON","GRANT","GUNDLACH","HIRSCH","KARP","KHOURY","LAFFONT","NIR","NORMAN","NOVOGRATZ","PSSCRA","ROBBINS","SAIGAL","SCREIBER","SHUMWAY","SNELLINGS","SOHN","TIFFANY","TUDOR JONES","SOHN1","SOHN2","SOHN3","SOHN4","SOHN5","SOHN6","SOHN7","SOHN8","SOHN9","SOHN10","SOHN11","SOHN12","SOHN13","SOHN14","SOHN15","SOHN16","SOHN17","SOHN18","SOHN19","SOHN20","SOHN21","SOHN22","SOHN23","SOHN24","SOHN25","SOHN26","SOHN27","SOHN28","SOHN29","SOHN30","SOHN31","SOHN32","SOHN33","SOHN34","SOHN35","SOHN36","SOHN37","SOHN38","SOHN39","SOHN40","SOHN41","SOHN42","SOHN43","SOHN44","SOHN45","SOHN46","SOHN47","SOHN48","SOHN49","SOHN50"};
    public string _ErrorString = "";
    public bool ValidatePromoCode(string promoCode){
        DBHelper db = new DBHelper();
        DataSet ds = new DataSet();
        try
        {
            db.OpenConnection();
            ds = db.getDatasetFromProc("Validate_Contributor_Code", "@CCode", promoCode);
            this._ErrorString = db.executionStatus;
            return (ds.Tables[0].Rows.Count > 0);
        }
        catch (Exception ex)
        {
            this._ErrorString = ex.ToString();
            return false;
        }
        finally
        {
            db.CloseConnection();
        }
        //return (Array.IndexOf(PromoCodeList, promoCode) >= 0);
        //return (Array.FindIndex(PromoCodeList, t => t.IndexOf(promoCode, StringComparison.InvariantCultureIgnoreCase) >= 0) >=0);
    }

    public bool UpdateContributorCode(int chequeid, string ccode){
        DBHelper db = new DBHelper();
        int outParam = 0;
        try
        {
            db.OpenConnection();
            SqlParameter[] param = new SqlParameter[2];
            param[0] = new SqlParameter("@ChequeID", chequeid);
            param[1] = new SqlParameter("@CCode", ccode);

            outParam = db.executeCommandOut("Update_Contributor_Code", param);
            this._ErrorString = db.executionStatus;
            bool UpStatus = false;
            if (this._ErrorString == "" || this._ErrorString == "Success" || this._ErrorString == "0") UpStatus = true;
            return UpStatus;
        }
        catch (Exception ex)
        {
            this._ErrorString = ex.ToString();
            return false;
        }
        finally
        {
            db.CloseConnection();
        }
         
    }

}
