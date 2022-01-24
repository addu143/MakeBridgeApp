using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ImageModel
/// </summary>
public class ImageModel
{
	public ImageModel()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public string name { get; set; }
    public string imageId_encode { get; set; }
    public string imageId_checksum { get; set; }
    public string tags { get; set; }
    public string originalURL { get; set; }
    public string thumbURL { get; set; }
}