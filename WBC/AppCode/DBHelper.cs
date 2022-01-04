/*
	Program : DBHelper.cs
	Purpose	: Class with methods to handle the database operations.
*/
using System;
using System.Text;
using System.Collections;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace Locust.Common.DB
{
	public class DBHelper
	{
		public SqlConnection myConnection;
		public SqlDataReader myReader;
		public SqlDataAdapter strAdap;
		public SqlCommand cmd ;
		public string executionStatus = string.Empty;

		public string ExecutionStatus
		{
			get { return executionStatus;}
		}
		public DBHelper()
		{
			String sConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["CFNSDB2012"].ConnectionString;
 			myConnection = new SqlConnection(sConnectionString);
		}
		public SqlConnection GetConnection()
		{
			return myConnection;
		}
		public void OpenConnection()
		{
			myConnection.Open();
		}
		public void CloseConnection()
		{
			myConnection.Close();
		}
		// Return a	DataSet from Stored Procedure
		public DataSet getDatasetFromProc(string procedureName)
		{
			DataSet resultDs = new DataSet ();
			cmd = new SqlCommand();
			cmd.Connection	= myConnection;
			cmd.CommandType	= CommandType.StoredProcedure;
			cmd.CommandText	= procedureName;
			cmd.CommandTimeout=500;
			strAdap	= new  SqlDataAdapter(procedureName,myConnection);
			try
			{
				strAdap.Fill(resultDs);
				executionStatus = "Success";
				return resultDs;
			}
			catch(Exception ex)
			{
				executionStatus = ex.ToString();
				return resultDs;
			}
			finally
			{
				cmd.Dispose();
				resultDs.Dispose();
			}
		}
		// Return a	DataSet from Stored Procedure using SQL Parameter Array
		public DataSet getDatasetFromProc(string procedureName,SqlParameter[] parameterArray)
		{
			DataSet resultDs = new DataSet ();
			cmd = new SqlCommand();
			SqlParameter parm = new SqlParameter ();
			cmd.Connection	= myConnection;
			cmd.CommandType	= CommandType.StoredProcedure;
			cmd.CommandText	= procedureName;
			cmd.CommandTimeout=500;
			for( int i=0;i<parameterArray.Length;i++)
			{
				cmd.Parameters.Add(parameterArray[i]);
			}
			strAdap	=  new  SqlDataAdapter(cmd);
			try
			{
				strAdap.Fill(resultDs);
				executionStatus = "Success";
				return resultDs;
			}
			catch(Exception ex)
			{
				executionStatus = ex.ToString();
				return resultDs;
			}
			finally
			{
				cmd.Dispose();
				resultDs.Dispose();
			}
		}
		// Return a DataSet from Stored Procedure using SQL Parameter Name and Value
		public DataSet getDatasetFromProc(string procedureName,string strParamName, string strParamValue)
		{
			DataSet resultDs = new DataSet ();
			SqlParameter parm = new SqlParameter ();
			cmd = new SqlCommand();
			cmd.Connection	= myConnection;
			cmd.CommandType	= CommandType.StoredProcedure;
			cmd.CommandText	= procedureName;
			myConnection.CreateCommand();
			cmd.Parameters.AddWithValue(strParamName,strParamValue);
			cmd.CommandTimeout=500;
			strAdap			= new SqlDataAdapter(cmd);
			try
			{
				strAdap.Fill(resultDs);
				executionStatus = "Success";
				return resultDs;
			}
			catch(Exception ex)
			{
				executionStatus = ex.ToString();
				//HttpContext.Current.Response.Write("Error :" +executionStatus);
				return resultDs;
			}
			finally
			{
				cmd.Dispose();
				resultDs.Dispose();
			}
		}// End of method
		public DataSet getDatasetFromProc(string procedureName,string strParamName, int strParamValue)
		{
			DataSet resultDs = new DataSet ();
			SqlParameter parm = new SqlParameter ();
			cmd = new SqlCommand();
			cmd.Connection	= myConnection;
			cmd.CommandType	= CommandType.StoredProcedure;
			cmd.CommandText	= procedureName;
			myConnection.CreateCommand();
			cmd.Parameters.AddWithValue(strParamName,strParamValue);
			cmd.CommandTimeout=500;
			strAdap			= new SqlDataAdapter(cmd);
			try
			{
				strAdap.Fill(resultDs);
				executionStatus = "Success";
				return resultDs;
			}
			catch(Exception ex)
			{
				executionStatus = ex.ToString();
				return resultDs;
			}
			finally
			{
				cmd.Dispose();
				resultDs.Dispose();
			}
		}// End of method
 		public int executeCommandOut(string procedureName, SqlParameter[] parameterArray)
		{
			int outParam=0;
			cmd =	new SqlCommand();
			cmd.Connection	=	myConnection;
			cmd.CommandType	=	CommandType.StoredProcedure;
			cmd.CommandText	=	procedureName;
			for( int i=0;i<parameterArray.Length;i++)
			{
				cmd.Parameters.Add(parameterArray[i]);
			}
			cmd.Transaction  =	myConnection.BeginTransaction();
            //cmd.CommandTimeout=500;
			try
			{
				cmd.ExecuteNonQuery();
                //outParam = Convert.ToInt32(cmd.Parameters["@OutParam"].Value);
				executionStatus = "Success";
				cmd.Transaction.Commit();
				cmd.Parameters.Clear();
				return outParam;
			 }
			catch(Exception ex)
			{
				executionStatus = ex.ToString();
				//HttpContext.Current.Response.Write("Error :" +executionStatus);
                cmd.Transaction.Rollback();
				cmd.Parameters.Clear();
				return 0;
			}
			  finally
			  {
				  cmd.Dispose();
			  }
		}// End of method
        public int executeCommandOutInt(string procedureName)
        {
            //int outParam = 0;
            cmd = new SqlCommand();
            cmd.Connection = myConnection;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = procedureName;

            cmd.Transaction = myConnection.BeginTransaction();
            cmd.CommandTimeout = 500;
            try
            {
                cmd.ExecuteNonQuery();
                //outParam = Convert.ToInt32(cmd.Parameters["@Outparam"].Value);
                //outParam = Convert.ToInt32(cmd.Parameters[OutParamName].Value);
                executionStatus = "Success";
                cmd.Transaction.Commit();
                cmd.Parameters.Clear();
                return 0;
            }
            catch (Exception ex)
            {
                executionStatus = ex.ToString();
                //HttpContext.Current.Response.Write("Error :" +executionStatus);
                cmd.Parameters.Clear();
                return 0;
            }
            finally
            {
                cmd.Dispose();
            }
        }// End of method
		public int executeCommandOutInt(string procedureName, SqlParameter[] parameterArray)
		{
			int outParam=0;
			cmd =	new SqlCommand();
			cmd.Connection	=	myConnection;
			cmd.CommandType	=	CommandType.StoredProcedure;
			cmd.CommandText	=	procedureName;
			for( int i=0;i<parameterArray.Length;i++)
			{
				cmd.Parameters.Add(parameterArray[i]);
			}
			cmd.Transaction  =	myConnection.BeginTransaction();
			cmd.CommandTimeout=500;
			try
			{
				cmd.ExecuteNonQuery();
				outParam = Convert.ToInt32(cmd.Parameters["@Outparam"].Value);
				executionStatus = "Success";
				cmd.Transaction.Commit();
				cmd.Parameters.Clear();
				return outParam;
			 }
			catch(Exception ex)
			{
				executionStatus = ex.ToString();
				//HttpContext.Current.Response.Write("Error :" +executionStatus);
				cmd.Parameters.Clear();
				return 0;
			}
			  finally
			  {
				  cmd.Dispose();
			  }
		}// End of method
		public int executeCommandOutInt(string procedureName, SqlParameter[] parameterArray, string OutParamName)
		{
			int outParam=0;
			cmd =	new SqlCommand();
			cmd.Connection	=	myConnection;
			cmd.CommandType	=	CommandType.StoredProcedure;
			cmd.CommandText	=	procedureName;
			for( int i=0;i<parameterArray.Length;i++)
			{
				cmd.Parameters.Add(parameterArray[i]);
			}
			cmd.Transaction  =	myConnection.BeginTransaction();
			cmd.CommandTimeout=500;
			try
			{
				cmd.ExecuteNonQuery();
				outParam = Convert.ToInt32(cmd.Parameters[OutParamName].Value);
				executionStatus = "Success";
				cmd.Transaction.Commit();
				cmd.Parameters.Clear();
				return outParam;
			 }
			catch(Exception ex)
			{
				executionStatus = ex.ToString();
				//HttpContext.Current.Response.Write("Error :" +executionStatus);
				cmd.Parameters.Clear();
				return 0;
			}
			  finally
			  {
				  cmd.Dispose();
			  }
		}// End of method
   }
}
