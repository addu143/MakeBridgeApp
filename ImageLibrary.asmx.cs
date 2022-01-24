using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;

namespace MakeBridge04
{
    /// <summary>
    /// Summary description for ImageLibrary
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class ImageLibrary : System.Web.Services.WebService
    {
        [WebMethod]
        public string FetchListOfImages()
        {
            string path = Directory.GetParent(HttpContext.Current.Request.MapPath("~")).FullName;
            string finalPath = path + @"\images\upload-images\";
            string[] images = Directory.GetFiles(finalPath);
            ImageCollection collection = new ImageCollection();
            collection.totalCount = images.Length;
            List<ImageModel> imagesList = new List<ImageModel>();
            for (int i = 0; i < images.Length; i++)
            {
                int imageIdCount = i + 1;
                string id = "imageId" + imageIdCount;
                imagesList.Add(
                    new ImageModel()
                    {
                        imageId_encode = id,
                        name = Path.GetFileNameWithoutExtension(images[i].ToString()),
                        thumbURL = Path.GetFileName(images[i].ToString()),
                        tags = "tag" + imageIdCount
                    });
            }
            collection.images = imagesList;
            return new JavaScriptSerializer().Serialize(collection);
        }

        [WebMethod]
        public string SearchImages(string searchText)
        {
            string path = Directory.GetParent(HttpContext.Current.Request.MapPath("~")).FullName;
            string finalPath = path + @"\images\upload-images\";
            string[] result;
            string[] images = Directory.GetFiles(finalPath);
            string[] searchedImages = Array.FindAll(images, x => Path.GetFileNameWithoutExtension(x).Contains(searchText));
            if (searchedImages.Length > 0)
                result = searchedImages;
            else
                result = images;
            
            ImageCollection collection = new ImageCollection();
            collection.totalCount = result.Length;
            List<ImageModel> imagesList = new List<ImageModel>();
            for (int i = 0; i < result.Length; i++)
            {
                int imageIdCount = i + 1;
                string id = "imageId" + imageIdCount;
                imagesList.Add(
                    new ImageModel()
                    {
                        imageId_encode = id,
                        name = Path.GetFileNameWithoutExtension(result[i].ToString()),
                        thumbURL = Path.GetFileName(result[i].ToString()),
                        tags = "tag" + imageIdCount
                    });
            }
            collection.images = imagesList;
            return new JavaScriptSerializer().Serialize(collection);
        }

        [WebMethod]
        public string AddImage(byte[] imageByteArray)
        {
            //string path = Directory.GetParent(HttpContext.Current.Request.MapPath("~")).FullName;
            //string finalPath = path + @"\MakeBridgeRelease\images\";
            //string[] images = Directory.GetFiles(finalPath);
            //images = images.Take(images.Length / 2).ToArray();
            //ImageCollection collection = new ImageCollection();
            //collection.totalCount = images.Length;
            //List<ImageModel> imagesList = new List<ImageModel>();
            //for (int i = 1; i < images.Length; i++)
            //{
            //    string id = "imageId" + i;
            //    imagesList.Add(new ImageModel() { imageId_encode = id, name = i.ToString(), thumbURL = images[i] });
            //}
            //collection.images = imagesList;
            //return new JavaScriptSerializer().Serialize(collection);
            return string.Empty;
        }

        [WebMethod]
        public string SaveTags(string imageId, string tags)
        {
            return string.Empty;
        }

        [WebMethod]
        public string DeleteImage(string imageName)
        {
            string fileNameWithExtension = string.Empty;
            string path = Directory.GetParent(HttpContext.Current.Request.MapPath("~")).FullName;
            string finalPath = path + @"\images\upload-images\";
            string[] allImages = Directory.GetFiles(finalPath);
            foreach (string item in allImages)
            {
                if (imageName == Path.GetFileNameWithoutExtension(item))
                {
                    fileNameWithExtension = Path.GetFileName(item);
                }
            }
            if (fileNameWithExtension != string.Empty)
            {
                finalPath = finalPath + fileNameWithExtension;
                if (File.Exists(finalPath))
                {
                    File.Delete(finalPath);
                }
            }
            return string.Empty;
        }
    }
}
