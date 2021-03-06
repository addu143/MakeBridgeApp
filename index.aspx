<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="MakeBridge.test1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Make Bridge Editor</title>
    <script type="text/template" id="tmpMakeBridgeContainer">
    <!-- /////////////////// Popups and Contents which will shown dynamically ///////////// -->
    <div id="dialog-Preview" title="Preview Code" style="display: none;">
        <textarea style="width: 800px; height: 400px;" id="txtPreviewCode"></textarea>
    </div>
    <div id="imageDropDialog" style="display: none; position: relative;" title="drop image">
        <table style="width: 400px;">
            <tr>
                <td>
                    <ul class="sortable" style="list-style: none; padding: 0; margin: 0;">
                        <li>
                            <img class="sortable" src="images/drop-here.png" style="display: block;" />
                        </li>
                    </ul>
                </td>
            </tr>
        </table>
    </div>
    <div id="imageTitleDialog" title="Basic dialog">
        <table style="width: 400px;">
            <tr>
                <td>
                    <label id="imageTitleLabel">
                        Image
                    </label>
                </td>
                <td>
                    <input type="text" id="imageTitleText" />
                </td>
            </tr>
        </table>
    </div>
    <div id="imageLinkDialog" style="display: none;">
    </div>
    <div id="imageToolbar" class="imageToolbar-menu">
        <ul>
            <li title="Left Align" class="ImageToolbarLeftAlignClass">
                <select class="ImageToolbarLinkClass" title="Set Link">
                    <option class="ImageToolbarLinkClass">Link </option>
                </select>
            </li>
            <li title="Left Align" class="ImageToolbarLeftAlignClass"><a href="#">
                <img src="images/Image-align-left-icon.png" /></a></li>
            <li title="Center Align" class="ImageToolbarCenterAlignClass"><a href="#">
                <img src="images/Image-align-center-icon.png" /></a></li>
            <li title="Right Align" class="ImageToolbarRightAlignClass"><a href="#">
                <img src="images/Image-align-right-icon.png" /></a></li>
            <li title="Set Title" class="ImageToolbarTitleSetClass"><a href="#">
                <img src="images/Adobe_Premiere_Pro_Title.png" /></a></li>
        </ul>
    </div>
    <!-- /////////////////// Popups and Contents which will shown dynamically ///////////// -->
    <div class="wrapper">
        <div class="navbar">
            <ul>
                <li class="test"><a class="" href="#">Test Send</a></li>
                <li class="save"><a href="#">Save</a></li>
                <li class="preview"><a href="#">Preview</a></li>
                <li class="redo"><a href="#">Redo</a></li>
                <li class="undo"><a href="#">Undo</a></li>
            </ul>
        </div>
        <div class="left_column fl">
            <div id="tabs">
                <ul>
                    <li><a class="tab1" href="#tabs-1">
                        <img style="padding-right: 5px;" src="images/content_ico.png" />Builder</a></li>
                    <li><a class="tab2" href="#tabs-2">
                        <img style="padding-right: 5px;" src="images/styles_ico.png" />
                        Styles</a></li>
                </ul>
                <div id="tabs-1">
                    <div class="accordion">
                        <h3 class="building-blocks accordian-common">Building Blocks</h3>
                        <div>
                            <div style="height: 350px;">
                                <h4 class="no-margin font_75 grey-col">Rows</h4>
                                <ul class="b-blocks">
                                    <li class="draggableControl" data-type="oneColumnContainer">
                                        <img src="images/1col-ico.png" /><br />
                                        <a href="#"><span class=" font_75">1 Item</span></a></li>
                                    <li class="draggableControl" data-type="twoColumnContainer">
                                        <img src="images/2col-ico.png" /><br />
                                        <a href="#"><span class=" font_75">2 Item</span></a></li>
                                    <li class="draggableControl" data-type="threeColumnContainer">
                                        <img src="images/3col-ico.png" /><br />
                                        <a href="#"><span class=" font_75">3 Item</span></a></li>
                                    <li class="draggableControl" data-type="fourColumnContainer">
                                        <img src="images/4col-ico.png" /><br />
                                        <a href="#"><span class=" font_75">4 Item</span></a></li>
                                </ul>
                                <br />
                                <br />
                                <h4 class="no-margin font_75 grey-col">Items</h4>
                                <ul class="b-blocks">
                                    <li class="draggableControl" data-type="image">
                                        <img src="images/image-li-ico.png" /><br />
                                        <a href="#"><span class=" font_75">Images</span></a></li>
                                    <li class="draggableControl" data-type="text">
                                        <img src="images/text-li-ico.png" /><br />
                                        <a href="#"><span class=" font_75">Text</span></a></li>
                                    <li class="draggableControl" data-type="textWithImage">
                                        <img src="images/text-img-li-ico.png" /><br />
                                        <a href="#"><span class=" font_75">Text/Img</span></a></li>
                                    <li class="draggableControl" data-type="imageWithText">
                                        <img src="images/img-txt-li-ico.png" /><br />
                                        <a href="#"><span class=" font_75">Img/Text</span></a></li>
                                </ul>
                                <br />
                                <br />

                                <h4 class="no-margin font_75 grey-col">Spacer</h4>
                                <ul class="b-blocks">
                                    <li class="draggableControl" data-type="spacer5">
                                        <img src="images/1col-ico.png" /><br />
                                        <a href="#"><span class=" font_75">5 Pixel</span></a></li>

                                    <li class="draggableControl" data-type="spacer10">
                                        <img src="images/2col-ico.png" /><br />
                                        <a href="#"><span class=" font_75">10 Pixel</span></a></li>

                                    <li class="draggableControl" data-type="spacer15">
                                        <img src="images/3col-ico.png" /><br />
                                        <a href="#"><span class=" font_75">15 Pixel</span></a></li>

                                    <li class="draggableControl" data-type="spacer20">
                                        <img src="images/4col-ico.png" /><br />
                                        <a href="#"><span class=" font_75">20 Pixel</span></a></li>

                                </ul>
                                <br />
                            </div>
                        </div>
                        <h3 class="my-build-blocks accordian-common">My Building Block</h3>
                        <div style="padding: 10px;">
                            <div class='buildingBlockDroppable'>
                                <div class="divLoading" style="background-color: white; width: 270px; vertical-align: middle; position: absolute; height: 100%; display: none;">Loading</div>
                                <div class='divDragHereText' style='text-align: center;'>Drop block here </div>
                                <div>
                                    <ul class='ulBuildingBlocks image-gallery b-blocks'>
                                    </ul>
                                </div>


                            </div>
                        </div>
                        <h3 class="accordian-common dynamic-content">Dynamic Content</h3>
                        <div>
                            <div style="clear: both;">
                            </div>
                            <div style="height: 350px;">
                                <div class="ul-container">
                                    <form action="/" enctype="multipart/form-data" method="post">
                                        <input class="search_field" type="text" id="search" size="50" maxlength="50" />
                                        <input type="submit" class=" submitForm" />
                                        <div class="dyna-cont-input grey-col">
                                            New Dynamic Content<span class="delete">x</span>
                                        </div>
                                        <input type="submit" class="acco-button fr dyna-cont-button" value="Save" />
                                        <input type="submit" class="acco-button fr dyna-cont-button grey-button" value="Cancel" />
                                        <div style="clear: both;">
                                        </div>
                                        <div class="dyna-cont-input2 grey-col">
                                            D Content 1<span class="delete">x</span>
                                        </div>
                                        <div class="dyna-cont-input3 grey-col">
                                            D Content 2<span class="delete">x</span>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <h3 class="accordian-common image_library">Image Library</h3>
                        <div>
                            <div style="height: 350px;">
                                <div style="clear: both;">
                                </div>
                                <div id="imageTagsPopup" style="display: none;"></div>
                                <div class="ul-container">
                                    <input class="search_field" type="text" id="searchImage" size="50" maxlength="50" />
                                    <input type="button" class="submitForm" data-name="123" />
                                    <form id="form1" runat="server">
                                        <asp:FileUpload runat="server" ID="fileUpload" style="display: none;" />
                                        <asp:Button runat="server" ID="btnSave" Text="Save" OnClick="btnSave_Click" style="display: none;" />
                                    </form>
                                    <ul class="blue b-blocks">
                                        <li><a class="uploadFile" href="#" title="Upload file">
                                            <img src="images/upload-img-ico.png" /></a></li>
                                        <li><a class="AddUpdateTags" href="#" title="Manage tags">
                                            <img src="images/tag-ico.png" /></a></li>
                                        <li><a class="deleteMode" href="#" title="Delete image">
                                            <img src="images/manage-ico.png" /></a></li>
                                        <li class="submenu fr"><a href="#">
                                            <img src="images/view-ico.png" /></a>
                                            <ul class="secondary-ul">
                                                <li><a href="#" class="gridView">
                                                    <img src="images/grid-ico.png" /></a></li>
                                                <li><a href="#" class="listView">
                                                    <img src="images/list-view-ico.png" /></a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                                <br />
                                <br />
                                <br />
                                <div class="upload-statusbar" style="display: none;">
                                    <img src="images/upload-status-bar.png" />
                                </div>
                                <ul class="image-gallery b-blocks imageLib">
                                    <li class="draggableControl droppedImage" data-type="droppedImage">
                                        <img src="images/img1.png" data-id="1" data-tags="image1-tag" title="Image 1" /><label>+</label><br />
                                        <a href="#"><span class=" font_75">Image 1<img src="images/delete-ico.png" /></span></a></li>
                                    <li class="draggableControl droppedImage" data-type="droppedImage">
                                        <img src="images/img2.png" data-id="2" data-tags="image2-tag" title="Image 2" /><label>+</label><br />
                                        <a href="#"><span class=" font_75">Image 2<img src="images/delete-ico.png" /></span></a></li>
                                    <li class="draggableControl droppedImage" data-type="droppedImage">
                                        <img src="images/img3.png" data-id="3" data-tags="image3-tag" title="Image 3" /><label>+</label><br />
                                        <a href="#"><span class=" font_75">Image 3
                                            <img src="images/delete-ico.png" /></span></a></li>
                                    <li class="draggableControl droppedImage" data-type="droppedImage">
                                        <img src="images/img4.png" data-id="4" data-tags="image4-tag" title="Image 4" /><label>+</label><br />
                                        <a href="#"><span class=" font_75">Image 4<img src="images/delete-ico.png" /></span></a></li>
                                </ul>

                                <br />
                                <br />
                                <div>
                                    <ul class="del-menu blue b-blocks" style="display: none;">
                                        <li style="width: 87px;">
                                            <a class="confirm-del" href="#"><span>Delete</span></a></li>

                                        <li style="width: 87px;">
                                            <a href="#" class="cancel-del"><span>Cancel</span></a></li>
                                    </ul>
                                </div>
                                <br />
                            </div>
                        </div>
                    </div>
                </div>
                <div id="tabs-2">
                    <div class="accordion">
                        <h3 class="background-accordion accordion2-common">Background</h3>
                        <div class="no-margin padding-10">
                            <div style="height: 350px;">
                                <form class="back-form" action="#" method="post" enctype="multipart/form-data">
                                    <label>
                                        <p class="grey-col background">Background Layers</p>
                                    </label>
                                    <select class="acco-select">
                                        <option value="0">Borders (Table)</option>
                                        <option value="1">Borders (Table)</option>
                                        <option value="2">Borders (Table)</option>
                                        <option value="3">Borders (Table)</option>
                                        <option value="4">Borders (Table)</option>

                                    </select>
                                    <label>
                                        <p class="grey-col background">Color Picker</p>
                                    </label>
                                    <a href="#">
                                        <img src="images/color-picker.png" /></a>
                                    <input type="text" class="acco-input" size="15" maxlength="15" />
                                    <input type="submit" class="acco-button" value="ADD TO MY COLORS" />
                                    <input type="checkbox" value="true" /><label class="acco-label">Change all of matching colors</label>


                                    <label>
                                        <p class="grey-col background">Template Colors</p>
                                    </label>

                                    <ul class="color-box">
                                        <li><a href="#">
                                            <img src="images/nocolor-ico.png" /></a></li>
                                        <li><a href="#">
                                            <img src="images/color-ico.png" /></a></li>
                                    </ul>


                                    <label>
                                        <p class="grey-col background">My Colors</p>
                                    </label>
                                    <ul class="color-box">
                                        <li><a href="#">
                                            <img src="images/black-color.png" /></a></li>
                                        <li><a href="#">
                                            <img src="images/nocolor-ico.png" /></a></li>
                                        <li><a href="#">
                                            <img src="images/grey-color.png" /></a></li>
                                    </ul>
                            </div>
                        </div>
                        <h3 class="accordion2-common borders-accordion">Borders & Paddings</h3>
                        <div class="no-margin padding-10">
                            <div style="height: 350px;">

                                <label>
                                    <p class="grey-col background">Borders</p>
                                </label>
                                <table>
                                    <tr>
                                        <td>
                                            <label class="acco-label grey-col fl width_140 ">Styles</label>
                                            <select class="acco-select margin_20 width_140 fl">
                                                <option value="0">-----------</option>
                                                <option value="1">-----------</option>
                                                <option value="2">...........</option>
                                            </select>
                                            <label class="acco-label grey-col fl  width_140">Weight</label>
                                            <select class="acco-select margin_20 width_140 fl">
                                                <option value="0">----------- 1px</option>
                                                <option value="1">----------- 2px</option>
                                                <option value="2">----------- 3px</option>
                                            </select>
                                        </td>
                                        <td>

                                            <a href="#" class="fr">
                                                <img src="images/border-placing.png" /></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><a href="#" class="fl">
                                            <img src="images/color-pallette.png" /></a></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label class="acco-label grey-col fl width_140 ">Padding</label>
                                            <select class="acco-select margin_20 width_140 fl">
                                                <option value="0">6px</option>
                                                <option value="1">8px</option>
                                                <option value="2">10px</option>
                                            </select>
                                        </td>
                                        <td>

                                            <a href="#" class="fr">
                                                <img src="images/padding-placing.png" /></a>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <!-- <h3 class="accordion2-common mobile-display">MOBILE DISPLAY</h3>
  <div class="no-margin padding-10">
  <label>
    	<p class="grey-col background">VISIBILITY</p>
     </label>
 		<input type="checkbox"  value="true"  /> <label class="acco-label">Hide this block on mobile devices</label>

  <label>
    	<p class="grey-col background">IMAGES</p>
     </label>
 		<input type="checkbox"  value="true"  /> <label class="acco-label">Preserve images sizes on mobile devices</label>

  <label>
    	<p class="grey-col background">COLUMNS</p>
     </label>
 		<input type="checkbox"  value="true"  /><label class="acco-label">Do not stack content on mobile devices</label>
    
   
  </div>-->
                        <h3 class="accordion2-common email-width">Email Width</h3>

                        <div class="no-margin padding-10">
                            <div style="height: 350px;">
                                <input type="submit" class="large-button acco-button" value="LARGE(700px)" />
                                <input type="submit" class="medium-button acco-button" value="MEDIUM(600px)" />
                                <input type="submit" class="small-button acco-button" value="SMALL(500px)" /><br />

                                <label class="acco-label">Size</label><br />
                                <input type="text" class="acco-input" size="10" maxlength="10" value="600" /><label class="acco-label">Pixels</label>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <div class="buildingBlock_name" style="display: none;">
            <div class="ddgwin-titlebar">
                <span class="ddgwin-title">Create a building block</span>
            </div>
            <div style="height: 106px;">
                <br>
                <div style="width: 250px;">
                    <div>
                        <div style="width: 200px; font-size: 12px;">
                            Block name<br>
                        </div>
                    </div>
                    <div>
                        <input type="text" class='txtPlaceHolder' placeholder="Provide a name for your building block"
                            style="width: 430px;" maxlength="255">
                    </div>
                </div>
                <div style="font-size: 12px;">
                    Give your block a name that you will be able to recognise later.
                </div>
            </div>
        </div>
        <!--Content Area-->
        <div class="right_column fr">
            <div class="content" style="height: 630px; overflow:scroll;  padding: 0 30px;">
                <div id="imageDataSavingObject" style="display: none;"></div>
                <div id="imageToolbarInstance" style="display: none;"></div>
                <div id="linkTrack" style="display: none;"></div>
                <div id="currTinyMCE" style="display: none;"></div>
                <ul class="sortable mainContentHtml" style="list-style: none; padding: 0; margin: 0;">
                </ul>
            </div>
        </div>
    </div>
    </script>
    <link href="css/jquery-ui.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/styles.css" rel="stylesheet" />
    <script src="scripts/libs/jquery/jquery.js"></script>
    <script src="scripts/libs/underscore/underscore.js"></script>
    <script src="scripts/libs/backbone/backbone.js"></script>
    <script src="scripts/libs/jquery/jquery_ui.js"></script>
    <script src="scripts/libs/custom/helper_methods.js"></script>
    <script src="scripts/libs/custom/makebridge_custom_methods.js"></script>
    <script src="scripts/libs/tinymce/tinymce.js"></script>
    <script src="scripts/libs/tinymce/tinymce_jquery.js"></script>
    <script src="scripts/libs/custom/linq.min.js"></script>
    <script src="scripts/makebridge_data.js"></script>
    <script src="scripts/library.js"></script>
    <script src="scripts/makebridge.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {


            //EXPOSED AJAX PROPERTIES FOR IMAGE GALLERY

            var _imageAjaxParameters = {
                Url: "ImageLibrary.asmx/FetchListOfImages",
                Data: "",
                DataType: "",
                Type: "",
                ContentType: ""
            };

            var _AddimageAjaxParameters = {
                Url: "ImageLibrary.asmx/AddImage",
                Data: "",
                DataType: "",
                Type: "",
                ContentType: ""
            };

            var _searchImagesAjaxParameters = {
                Url: "ImageLibrary.asmx/SearchImages",
                Data: "",
                DataType: "",
                Type: "",
                ContentType: ""
            };

            var _saveImageTagsAjaxParameters = {
                Url: "ImageLibrary.asmx/SaveTags",
                Data: "",
                DataType: "",
                Type: "",
                ContentType: ""
            };

            var _deleteImageAjaxParameter = {
                Url: "ImageLibrary.asmx/DeleteImage",
                Data: "",
                DataType: "",
                Type: "",
                ContentType: ""
            };

            $("#myMakeBridge").MakeBridgeEditor({
                SaveImageTagsProperties: _saveImageTagsAjaxParameters,
                DeleteImageProperties: _deleteImageAjaxParameter,
                ImagesAjaxProperties: _imageAjaxParameters,
                SearchImagesProperties: _searchImagesAjaxParameters,
                AddImageProperties: _AddimageAjaxParameters,
                OnDropElementOnBuildingBlock: function (args) {

                    //Save to Server
                    if (args.buildingBlock != null) {
                        //args.buildingBlock.Name; 
                        //args.buildingBlock.Html;

                        $.ajax({
                            url: "/Service_BuildingBlock.asmx/InsertBuildingBlock",
                            data: "{ name: '" + args.buildingBlock.Name + "', html: '" + args.buildingBlock.Html.html() + "' }",
                            //data: "{ name: 'test', html: 'html' }",
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            cache: false,
                            async: false,
                            success: function (e) {
                                console.log("InsertBuildingBlock success");
                            }

                        });

                    }


                },

                LoadBuildingBlocks: function (args) {
                    //GetBuildingBlocks

                    $.ajax({
                        url: "/Service_BuildingBlock.asmx/GetBuildingBlocks",
                        data: "{}",
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        cache: false,
                        async: false,
                        success: function (e) {
                            args.buildingBlocks = e.d;
                            console.log("GetBuildingBlocks success");
                        }
                    });
                }
            });

        })
    </script>
</head>
<body>
    <div id="myMakeBridge">
    </div>
</body>
</html>
