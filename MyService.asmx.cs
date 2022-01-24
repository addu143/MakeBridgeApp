using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;

namespace MakeBridge
{
    /// <summary>
    /// Summary description for MyService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class MyService : System.Web.Services.WebService
    {
        
        [WebMethod]
        public string GetImages()
        {
            //string path = Directory.GetParent(HttpContext.Current.Request.MapPath("~")).FullName;
            //string[] images = Directory.GetFiles(path + "\\images");
            //List<ImageModel> imagesList = new List<ImageModel>();
            //for (int i = 1; i < images.Length; i++)
            //{
            //    imagesList.Add(new ImageModel() { Name = i.ToString(), Path = images[i] });
            //}
            //return new JavaScriptSerializer().Serialize(imagesList);
            return string.Empty;
        }
    }
}
