using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ImageCollection
/// </summary>
public class ImageCollection
{
	public ImageCollection()
	{
        images = new List<ImageModel>();
		//
		// TODO: Add constructor logic here
		//
	}

    public long totalCount { get; set; }
    public int count { get; set; }
    public List<ImageModel> images { get; set; }
}