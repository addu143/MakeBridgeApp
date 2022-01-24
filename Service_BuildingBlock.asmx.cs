using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
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
    public class Service_BuildingBlock : System.Web.Services.WebService
    {

        [WebMethod (EnableSession = true)]        
        public void InsertBuildingBlock(string name, string html)
        {
            List<BuildingBlock> listOfBuilding = new List<BuildingBlock>();

            if (HttpRuntime.Cache["myBuilding"] != null)
            {
                listOfBuilding = HttpRuntime.Cache["myBuilding"] as List<BuildingBlock>;
            }
            
            
            listOfBuilding.Add(new BuildingBlock() { Name = name, Html = html });
            HttpRuntime.Cache["myBuilding"] = listOfBuilding;

        }

        [WebMethod(EnableSession = true)]
        public string GetBuildingBlocks()
        {          
            List<BuildingBlock> listOfBuilding = new List<BuildingBlock>();

            if (HttpRuntime.Cache["myBuilding"] != null)
            {
                listOfBuilding = HttpRuntime.Cache["myBuilding"] as List<BuildingBlock>;
            }
            
            return new JavaScriptSerializer().Serialize(listOfBuilding);
        }
    }
}
