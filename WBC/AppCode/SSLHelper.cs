using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for SSLHelper
/// </summary>
public class SSLHelper : System.Web.UI.Page
{
    public SSLHelper()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public enum RedirectOptions
    {
        Relative,
        AbsoluteHttp,
        AbsoluteHttps,
        AbsoluteIisConfig
    }

    public enum ProtocolOptions
    {
        Http,
        Https
    }

    public class SslTools
    {
        public static void Redirect(string url)
        {
            Redirect(url, RedirectOptions.Relative);
        }

        public static void Redirect(string url, RedirectOptions options)
        {
            HttpContext context = HttpContext.Current;
            string absolutePath = "";

            if (options == RedirectOptions.Relative)
            {
                context.Response.Redirect(url);
                return;
            }

            if (options == RedirectOptions.AbsoluteHttp)
            {
                absolutePath = GetAbsoluteUrl(url, ProtocolOptions.Http);
            }

            if (options == RedirectOptions.AbsoluteHttps)
            {
                absolutePath = GetAbsoluteUrl(url, ProtocolOptions.Https);
            }

            if (options == RedirectOptions.AbsoluteIisConfig)
            {
                throw new NotImplementedException();
            }

            context.Response.Redirect(absolutePath);
        }

        public static string GetAbsoluteUrl(string url, ProtocolOptions protocol)
        {
            if (url == "")
            {
                return url;
            }

            // check for querystring parameters
            string path, query;
            if (url.Contains("?"))
            {
                int qpos = url.IndexOf('?');
                path = url.Substring(0, qpos);
                query = url.Substring(qpos);
            }
            else
            {
                path = url;
                query = "";
            }

            if (VirtualPathUtility.IsAppRelative(path))
            {
                path = VirtualPathUtility.ToAbsolute(path);
            }

            Uri baseUri;
            string hostName = HttpContext.Current.Request.Url.Host;

            if (protocol == ProtocolOptions.Http)
            {
                baseUri = new Uri(String.Format("http://{0}", hostName));
            }
            else
            {
                baseUri = new Uri(String.Format("https://{0}", hostName));
            }

            return new Uri(baseUri, path).ToString() + query;
        }

        public static void SwitchToSsl()
        {
            HttpContext context = HttpContext.Current;
            string str = context.Request.Url.ToString();
            context.Response.Redirect(str.Replace("http", "https"));
        }

        public static void SwitchToClearText()
        {
            HttpContext context = HttpContext.Current;
            string str = context.Request.Url.ToString();
        }
    }
}