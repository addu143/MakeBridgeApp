using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MakeBridge
{
    public partial class test1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (fileUpload.HasFile)
            {
                string fileName = fileUpload.FileName;
                string path = Directory.GetParent(HttpContext.Current.Request.MapPath("~")).FullName;
                string finalpath = path + @"\images\upload-images\";

                if (!Directory.Exists(finalpath)) Directory.CreateDirectory(finalpath);

                fileUpload.SaveAs(finalpath + fileName);
            }
        }
    }
}