<%@page import="java.util.*" %>
<%@page import="com.PMSystems.*" %>
<%@page import="com.PMSystems.util.*" %>
<%@page import="com.PMSystems.logger.*" %>
<%@page import="com.PMSystems.dbbeans.*" %>
<%@page import="com.PMSystems.beans.*" %>


<!-- You can use this JSP snippet <=WebSecurityManager.getCSRFToken_HREF(session)> in your code also, but you will need to convert your .HTML file to .JSP file -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Make Bridge Editor</title>
    <link href="css/jquery-ui.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/styles.css" rel="stylesheet" />
    <link href="scripts/libs/miniColor/jquery.minicolors.css" rel="stylesheet" />
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
        <!--Content Area-->
        <div class="right_column fr">
            <div class="content" style="height: 1000px; overflow: scroll; padding: 0 30px;">
                <div id="imageDataSavingObject" style="display: none;"></div>
                <div id="imageToolbarInstance" style="display: none;"></div>
                <div id="linkTrack" style="display: none;"></div>
                <div id="currTinyMCE" style="display: none;"></div>
                
                <table style="width:100%; height:100%; vertical-align:top;" align="center" class="mainTable">
                    <tr>
                        <td class="mainContentHtmlGrand" valign="top" style="width:700px;">
                            <ul class="sortable mainContentHtml" style="list-style: none; padding: 0; margin: 0;">
                            </ul>
                        <td>
                    </tr>
                </table>
                
            </div>
        </div>
        <div class="left_column fr">
            <div id="tabs">
                <ul>
                    <li><a class="tab1" href="#tabs-1">
                        <img style="padding-right: 5px; position: relative !important; top: 5px !important;" src="images/content_ico.png" />Builder</a></li>
                    <li><a class="tab2" href="#tabs-2">
                        <img style="padding-right: 5px; position: relative !important; top: 5px !important;" src="images/styles_ico.png" />Styles</a></li>
                </ul>
                <div id="tabs-1">
                    <div class="accordion">
                        <h3 class="building-blocks accordian-common">Building Blocks</h3>
                        <div>
                            <div style="height: 350px;">
                                <h4 class="no-margin font_75 grey-col">Rows</h4>
                                <ul class="b-blocks">
                                    <li class="draggableControl" data-type="oneColumnContainer">
                                        <img title="One Item Container" alt="" src="images/1col-ico.png" /><br />
                                        <a href="#"><span class=" font_75">1 Item</span></a></li>
                                    <li class="draggableControl" data-type="twoColumnContainer">
                                        <img title="Two Item Container" alt="" src="images/2col-ico.png" /><br />
                                        <a href="#"><span class=" font_75">2 Item</span></a></li>
                                    <li class="draggableControl" data-type="threeColumnContainer">
                                        <img title="Three Item Container" alt="" src="images/3col-ico.png" /><br />
                                        <a href="#"><span class=" font_75">3 Item</span></a></li>
                                    <li class="draggableControl" data-type="fourColumnContainer">
                                        <img title="Four Item Container" alt="" src="images/4col-ico.png" /><br />
                                        <a href="#"><span class=" font_75">4 Item</span></a></li>
                                </ul>
                                <br />
                                <br />
                                <h4 class="no-margin font_75 grey-col">Items</h4>
                                <ul class="b-blocks">
                                    <li class="draggableControl" data-type="image">
                                        <img title="Image" alt="" src="images/image-li-ico.png" /><br />
                                        <a href="#"><span class=" font_75">Images</span></a></li>
                                    <li class="draggableControl" data-type="text">
                                        <img title="Text" alt="" src="images/text-li-ico.png" /><br />
                                        <a href="#"><span class=" font_75">Text</span></a></li>
                                    <li class="draggableControl" data-type="textWithImage">
                                        <img title="Text With Image" alt="" src="images/text-img-li-ico.png" /><br />
                                        <a href="#"><span class=" font_75">Text/Img</span></a></li>
                                    <li class="draggableControl" data-type="imageWithText">
                                        <img title="Image With Text" alt="" src="images/img-txt-li-ico.png" /><br />
                                        <a href="#"><span class=" font_75">Img/Text</span></a></li>
                                </ul>
                                <br />
                                <br />

                                <h4 class="no-margin font_75 grey-col">Spacer</h4>
                                <ul class="b-blocks">
                                    <li class="draggableControl" data-type="spacer5">
                                        <img title="5 Pixel Spacer" alt="" src="images/5-pixel-spacers.png" /><br />
                                        <a href="#"><span class=" font_75">5 Pixel</span></a></li>

                                    <li class="draggableControl" data-type="spacer10">
                                        <img title="10 Pixel Spacer" alt="" src="images/10-pixel-spacer.png" /><br />
                                        <a href="#"><span class=" font_75">10 Pixel</span></a></li>

                                    <li class="draggableControl" data-type="spacer15">
                                        <img title="15 Pixel Spacer" alt="" src="images/15-pxl-spacer.png" /><br />
                                        <a href="#"><span class=" font_75">15 Pixel</span></a></li>

                                    <li class="draggableControl" data-type="spacer20">
                                        <img title="20 Pixel Spacer" alt="" src="images/20-pxl-spacer.png" /><br />
                                        <a href="#"><span class=" font_75">20 Pixel</span></a></li>

                                </ul>
                                <br />
                            </div>
                        </div>
                        <h3 class="my-build-blocks accordian-common">My Building Block</h3>
                        <div style="padding: 10px;">
						
						<div class="imagelib-icons-building">
<a href="#"><img title="tooltip-lorem ipsum" alt="" src="images/ico-edit.png" style="width:24px;" /></a>
<a href="#"><img title="tooltip-lorem ipsum" alt="" style="width:28px;" src="images/delete-ico.png" /></a>
</div>
						
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
						
							<div class="imagelib-icons-dynamic">
<a href="#"><img title="tooltip-lorem ipsum" alt="" src="images/add-ico.png" /></a>
<a href="#"><img title="tooltip-lorem ipsum" alt="" style="width:28px;" src="images/delete-ico.png" /></a>
</div>

                            <div style="clear: both;"></div>
                            <div style="height: 350px;">

                                <div class="ul-container">

                                    <form action="/" enctype="multipart/form-data" method="post">
                                        <input class="search_field" type="text" id="search" size="50" maxlength="50" />
                                        <input type="button" class=" submitForm" />

                                        <div class="dyna-cont-input grey-col">New Dynamic Content<span class="delete">x</span></div>
                                        <input type="button" class="acco-button fr dyna-cont-button" value="Save" />
                                        <input type="button" class="acco-button fr dyna-cont-button grey-button" value="Cancel" />
                                        <div style="clear: both;"></div>
                                        <div class="dyna-cont-input2 grey-col">D Content 1<span class="delete">x</span></div>
                                        <div class="dyna-cont-input3 grey-col">D Content 2<span class="delete">x</span></div>

                                    </form>

                                </div>
                            </div>
                        </div>
                        <h3 class="accordian-common image_library">Image Library
		<!--<div class="imagelib-icons">
<a href="#"><img title="tooltip-lorem ipsum" alt="" src="images/add-ico.png" /></a>
<a href="#"><img title="tooltip-lorem ipsum" alt="" src="images/delete-ico.png" /></a>
</div>-->


                        </h3>
                        <div>
							<div class="imagelib-icons">
<a href="#"><img title="tooltip-lorem ipsum" alt="" src="images/add-ico.png" /></a>
<a href="#"><img title="tooltip-lorem ipsum" alt="" style="width:28px;" src="images/delete-ico.png" /></a>
</div>
                            <div style="height: 350px;">
                                <div style="clear: both;">
                                </div>
                                <div id="imageTagsPopup" style="display: none;"></div>
                                <div class="ul-container">
                                    <input class="search_field" type="text" id="searchImage" size="50" maxlength="50" />
                                    <input type="button" class="submitForm" data-name="123" />
                                    <form id="form1" enctype="multipart/form-data" action="/pms/io/publish/saveImagesData/?<%=WebSecurityManager.getCSRFToken_HREF(session)%>&type=add" method="POST">
                                        <input type="file" id="myUploadFile" name="fileName" style="display: none;" />
                                        <input type="hidden" name="type" value="add" />
                                        <input type="hidden" name="allowOverwrite" value="N" />
                                        <input type="hidden" name="BMS_REQ_TK" value="<%=request.getParameter("BMS_REQ_TK")%>" />
                                        
                                    </form>
                                    <ul class="blue b-blocks">
                                        <li><a class="uploadFile" href="#" title="Upload file" id="uploadFile">
                                            <img title="Upload File" alt="" src="images/upload-img-ico.png" /></a></li>
                                        <li><a class="AddUpdateTags" href="#" title="Manage tags">
                                            <img title="Manage Tags" alt="" src="images/tag-ico.png" /></a></li>
                                        <li><a class="deleteMode" href="#" title="Delete image">
                                            <img title="Delete Image" alt="" src="images/manage-ico.png" /></a></li>
                                        <li class="submenu fr"><a href="#">
                                            <img src="images/view-ico.png" /></a>
                                            <ul class="secondary-ul">
                                                <li><a href="#" class="gridView">
                                                    <img title="Grid View" alt="" src="images/grid-ico.png" /></a></li>
                                                <li><a href="#" class="listView">
                                                    <img title="List View" alt="" src="images/list-view-ico.png" /></a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                                <br />
                                <br />
                                <br />
                                <div class="upload-statusbar" style="display: none;">
                                    <img title="Upload Status Bar" alt="" src="images/upload-status-bar.png" />
                                </div>
                                <ul class="image-gallery b-blocks imageLib">
                                    <li class="draggableControl droppedImage" data-type="droppedImage">
                                        <img title="Image" src="images/img1.png" data-id="1" data-tags="image1-tag" title="Image 1" /><label>+</label><br />
                                        <a href="#"><span class=" font_75">Image 1<img title="Image" src="images/delete-ico.png" /></span></a></li>
                                    <li class="draggableControl droppedImage" data-type="droppedImage">
                                        <img title="Image" src="images/img2.png" data-id="2" data-tags="image2-tag" title="Image 2" /><label>+</label><br />
                                        <a href="#"><span class=" font_75">Image 2<img title="Image" src="images/delete-ico.png" /></span></a></li>
                                    <li class="draggableControl droppedImage" data-type="droppedImage">
                                        <img title="Image" src="images/img3.png" data-id="3" data-tags="image3-tag" title="Image 3" /><label>+</label><br />
                                        <a href="#"><span class=" font_75">Image 3
                                            <img title="tooltip-lorem ipsum" src="images/delete-ico.png" /></span></a></li>
                                    <li class="draggableControl droppedImage" data-type="droppedImage">
                                        <img title="Image" src="images/img4.png" data-id="4" data-tags="image4-tag" title="Image 4" /><label>+</label><br />
                                        <a href="#"><span class=" font_75">Image 4<img title="Image" src="images/delete-ico.png" /></span></a></li>
                                </ul>

                                <br />
                                <br />
                                <div class="del-menu" style="display:none;">
                                    <input type="button" class="acco-button fr dyna-cont-button confirm-del" style="background: red" value="Delete" />
                                    <input type="button" class="acco-button fr dyna-cont-button grey-button cancel-del" value="Cancel" />
                                    <!--ul class="del-menu blue b-blocks" style="display: none;">
                                            <li style="width: 87px;">
                                                <a class="confirm-del" href="#"><span>Delete</span></a></li>

                                            <li style="width: 87px;">
                                                <a href="#" class="cancel-del"><span>Cancel</span></a></li>
                                        </ul-->
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
                                    <select class="acco-select ddlBackgroundLayers">
                                        

                                    </select>
                                    <label>
                                        <p class="grey-col background">Color Picker</p>
                                    </label>
                                    <div class="divColorPicker"></div>
                                    <input type="text" class="txtColorCode acco-input" size="15" maxlength="15" />
                                    <input type="button" class="acco-button" value="ADD TO MY COLORS" style='float:right; margin:0;' />
                                
                                <div style=" clear: both; margin-bottom: 4px; margin-top: 2px; overflow: hidden;">
                                        <input type="checkbox" class="chkChangeAllMatching" style="float:left;  margin-top: 8px;" />
                                        <label class="acco-label" style="float:left;">Change all of matching colors</label>

                                </div>
                                

                                    <label>
                                        <p class="grey-col background">Template Colors</p>
                                    </label>

                                    <ul class="color-box templateColors">
                                        <li style="background-color:none;">
                                             
                                        </li>

                                        
                                    </ul>


                                    <label>
                                        <p class="grey-col background">My Colors</p>
                                    </label>
                                    <ul class="color-box">
                                        <li><a href="#">
                                            <img title="tooltip-lorem ipsum" alt="" src="images/black-color.png" /></a></li>
                                        <li><a href="#">
                                            <img title="tooltip-lorem ipsum" alt="" src="images/nocolor-ico.png" /></a></li>
                                        <li><a href="#">
                                            <img title="tooltip-lorem ipsum" alt="" src="images/grey-color.png" /></a></li>
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
                                           

                                            <select class="ddlBorderType acco-select margin_20 width_140 fl">
                                                <option value="solid">Solid</option>
                                                <option value="dashed">Dashed</option>
                                                <option value="double">Double</option>                                                
                                            </select>
                                            


                                            <label class="acco-label grey-col fl  width_140">Weight</label>
                                            <select class="ddlBorderWidth acco-select margin_20 width_140 fl">
                                                <option value="1">-----1px</option>
                                                <option value="2">-----2px</option>
                                                <option value="3">-----3px</option>
                                                <option value="4">-----4px</option>
                                                <option value="5">-----5px</option>
                                            </select>
                                        </td>
                                        <td>
										
											<div class="ddg-control ved-edges ddg-container borderControl">
												<div class="ddg-control ddg-button ved-edges-button ved-edges-top ddg-unselectable" id="top" unselectable="on">
													<div unselectable="on" class="ddg-unselectable sBorderLine"  data-type="Top" onclick="applyborder('top');"></div>
												</div>
												<div class="ddg-control ddg-button ved-edges-button ved-edges-bottom ddg-unselectable" id="bottom" unselectable="on">
													<div unselectable="on" class="ddg-unselectable sBorderLine" data-type="Bottom" onclick="applyborder('bottom');"></div>
												</div>
												<div class="ddg-control ddg-button ved-edges-button ved-edges-left ddg-unselectable" id="left" unselectable="on">
													<div unselectable="on" class="ddg-unselectable sBorderLine" data-type="Left" onclick="applyborder('left');"></div>
												</div>
												<div class="ddg-control ddg-button ved-edges-button ved-edges-right ddg-unselectable" id="right" unselectable="on">
													<div unselectable="on" class="ddg-unselectable sBorderLine"  data-type="Right" onclick="applyborder('right');"></div>
												</div>
												<div class="ved-edge-control">
													<div class="edges-dotted-topbottom"></div>
													<div class="edges-dotted-leftright"></div>
													<div class="ved-edge-inner" style="width: 48px; height: 48px;"></div>
												</div>
											</div>

                                            <!--<a href="#" class="fr">
                                                <img title="tooltip-lorem ipsum" alt="" src="images/border-placing.png" /></a>-->
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label class="acco-label grey-col fl  width_140">Border Color</label>
                                            <a href="#" class="fl colorPickerBorder acco-label"></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p class="grey-col background">Padding</p>
                                            
                                            
        
                                            <select class="acco-select margin_20 width_140 fl ddlPadding">
                                                <option value="6">6px</option>
                                                <option value="8">8px</option>
                                                <option value="10">10px</option>
                                            </select>
                                        </td>
                                        <td>
											
											<div class="ddg-control ved-edges ved-padding-edges ddg-container paddingControl">
												<div class="ddg-control ddg-button ved-edges-button ved-edges-top ddg-unselectable" id="top" unselectable="on">
													<div unselectable="on" class="ddg-unselectable sPadding" data-type="Top" onclick="applyPadding('top')"></div>
												</div>
												<div class="ddg-control ddg-button ved-edges-button ved-edges-bottom ddg-unselectable" id="bottom" unselectable="on">
													<div unselectable="on" class="ddg-unselectable sPadding" data-type="Bottom" onclick="applyPadding('bottom')"></div>
												</div>
												<div class="ddg-control ddg-button ved-edges-button ved-edges-left ddg-unselectable" id="left" unselectable="on">
													<div unselectable="on" class="ddg-unselectable sPadding" data-type="Left" onclick="applyPadding('left')"></div>
												</div>
												<div class="ddg-control ddg-button ved-edges-button ved-edges-right ddg-unselectable" id="right" unselectable="on">
													<div unselectable="on" class="ddg-unselectable sPadding" data-type="Right" onclick="applyPadding('right')"></div>
												</div>
												<div class="ved-edge-control">
													<div class="edges-dotted-topbottom"></div>
													<div class="edges-dotted-leftright"></div>
													<div class="ved-edge-inner" style="width: 48px; height: 48px;">
														<div class="edge-text-preview" style="width: 48px; height: 48px;"></div>
													</div>
													
												</div>
											</div>
                                            
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
                                <input type="button" class="large-button acco-button btnContainerSize" data-value="700" value="LARGE(700px)" />
                                <input type="button" class="medium-button acco-button btnContainerSize" data-value="600" value="MEDIUM(600px)" />
                                <input type="button" class="small-button acco-button btnContainerSize" data-value="500" value="SMALL(500px)" /><br />

                                <label class="acco-label">Size</label><br />
                                <input type="text" class="acco-input txtContainerSize" size="10" maxlength="10" value="600" /><label class="acco-label">Pixels</label>

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
         <div class="divPreviewCode" style="display: none;" title="Code Preview">
            <div id="previeCodeTabs">
                <ul>
                    <li><a class="tab1" href="#tabs-1">
                        Preview</a></li>
        <li><a class="tab2" href="#tabs-2">
                        Html Code</a></li>

                   
                </ul>

                    <div id="tabs-1">
                        <div class="divHtmlPreview">
                            
                        </div>
                    </div>
                    
                    <div id="tabs-2">
                        <textarea style="font-size:10px;" class="divHtmlCode" cols="130" rows="20">                            
                        </textarea>
                    </div>
            </div>
        </div>
    </div>
    </script>
    <script type="text/javascript" src="scripts/libs/jquery/jquery.js"></script>
    <script type="text/javascript" src="scripts/libs/underscore/underscore.js"></script>
    <script type="text/javascript" src="scripts/libs/backbone/backbone.js"></script>
    <script type="text/javascript" src="scripts/libs/jquery/jquery_ui.js"></script>
    <script type="text/javascript" src="scripts/libs/custom/helper_methods.js"></script>
    <script type="text/javascript" src="scripts/libs/custom/makebridge_custom_methods.js"></script>
    <script type="text/javascript" src="scripts/libs/tinymce/tinymce.js"></script>
    <script type="text/javascript" src="scripts/libs/tinymce/tinymce_jquery.js"></script>
    <script type="text/javascript" src="scripts/libs/custom/linq.min.js"></script>
    <script type="text/javascript" src="scripts/makebridge_data.js"></script>
    <script type="text/javascript" src="scripts/libs/miniColor/jquery.minicolors.min.js"></script>
    <script type="text/javascript" src="scripts/makebridge.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {


            //EXPOSED AJAX PROPERTIES FOR IMAGE GALLERY

            var _imageAjaxParameters = {
                Url: "/pms/io/publish/getImagesData/?<%=WebSecurityManager.getCSRFToken_HREF(session)%>&type=list&offset=0",
                Data: "",
                DataType: "",
                Type: "",
                ContentType: ""
            };

            var _AddimageAjaxParameters = {
                Url: "/pms/io/publish/saveImagesData/?<%=WebSecurityManager.getCSRFToken_HREF(session)%>&type=add",
                Data: "",
                DataType: "",
                Type: "",
                ContentType: ""
            };

            var _searchImagesAjaxParameters = {
                Url: "/pms/io/publish/getImagesData/?<%=WebSecurityManager.getCSRFToken_HREF(session)%>&type=search&offset=0&searchText=",
                Data: "",
                DataType: "",
                Type: "",
                ContentType: ""
            };

            var _saveImageTagsAjaxParameters = {
                Url: "/pms/io/publish/saveImagesData/?<%=WebSecurityManager.getCSRFToken_HREF(session)%>&type=tags&imageId=",
                Data: "",
                DataType: "",
                Type: "",
                ContentType: ""
            };

            var _deleteImageAjaxParameter = {
                Url: "/pms/io/publish/saveImagesData/?<%=WebSecurityManager.getCSRFToken_HREF(session)%>&type=delete&imageId=",
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
                        //console.log("/pms/io/publish/getEditorData/?BMS_REQ_TK=<%=WebSecurityManager.getCSRFToken_HREF(session)%>&type=addBlock");
                        console.log("Block Name:" + args.buildingBlock.Name);
                        console.log("Block HTML:" + args.buildingBlock.Html.html());
                        var URL = "/pms/io/publish/saveEditorData/?<%=WebSecurityManager.getCSRFToken_HREF(session)%>&type=addBlock";
                        $.post(URL, {
                            name:  args.buildingBlock.Name,
                            html : args.buildingBlock.Html.html(),
                            type : "addBlock"
                        })
                        .done(function(data) { 
                            console.log("InsertBuildingBlock success:"+ data);                                                      
                                // your code go here. 
                        });

                        /*$.ajax({
                            url: "/pms/io/publish/saveEditorData/?<%=WebSecurityManager.getCSRFToken_HREF(session)%>&type=addBlock&name="+ args.buildingBlock.Name + "&html=" + args.buildingBlock.Html.html() ,
                            //data: "{ name: 'test', html: args.buildingBlock.Name }",
                            type: "POST",
                            contentType: "application/json; charset=latin1",
                            dataType: "json",
                            cache: false,
                            async: false,
                            success: function (e) {
                                console.log("InsertBuildingBlock success:"+ e);
                                //LoadBuildingBlocks();
                            },
                            error: function (e) {
                                console.log("InsertBuildingBlock failed:"+ e);
                            }

                        });*/

                    }


                },

                LoadBuildingBlocks: function (args) {
                    //GetBuildingBlocks

                    $.ajax({
                        url: "/pms/io/publish/getEditorData/?<%=WebSecurityManager.getCSRFToken_HREF(session)%>&type=listBlocks",
                        data: "{}",
                        type: "POST",
                        contentType: "application/json; charset=latin1",
                        dataType: "json",
                        cache: false,
                        async: false,
                        success: function (e) {
                            args.buildingBlocks = e.blocks[0];
                            console.log("GetBuildingBlocks success:"+ e.data);
                        },
                        error: function (e) {
                            console.log("GetBuildingBlocks Failed:"+ e);
                        }
                    });
                }
            });
        });
    </script>
</head>
<body>
    <div id="myMakeBridge">
    </div>
</body>
</html>

<script type="text/javascript">
function applyborder(border_of){

	var border_type = $(".ddlBorderType").val();
	$element = $(".borderControl .ved-edge-inner");
	var border_width = Number($(".ddlBorderWidth").val());
	var box_height = Number($element.height());
	var box_width = Number($element.width());
	
	var is_bordery_applied = $element.css("border-"+border_of+"-width").split("px");
	
	//alert(is_bordery_applied);
	
	
	
	var string = border_width + "px " + border_type + " #000";
	
	if(border_of == "top"){
		
		
		if (is_bordery_applied[0] == 0) {
		
				$element.css("border-top" , string);
				
				borderTopWidth = $element.css("border-top-width").split("px");
				borderTopWidth = Number(borderTopWidth[0]);
				
				
				borderBottomWidth = $element.css("border-bottom-width").split("px");
				borderBottomWidth = Number(borderBottomWidth[0]);
				
				TotalBorderTopBottom = borderTopWidth + borderBottomWidth;
				
				$element.css("height" , 48 - TotalBorderTopBottom + "px");
					
				$(".borderControl #top").css("background-color" , "#ccc");
		}else{
			
			$element.css("border-top" , "none");
			$element.css("height" , box_height + borderTopWidth + "px");
			$(".borderControl #top").css("background-color" , "transparent");
		
		}
	}
	
	if(border_of == "bottom"){
		
		if (is_bordery_applied[0] == 0) {
		
				$element.css("border-bottom" , string);
				
				borderTopWidth = $element.css("border-top-width").split("px");
				borderTopWidth = Number(borderTopWidth[0]);
				
				borderBottomWidth = $element.css("border-bottom-width").split("px");
				borderBottomWidth = Number(borderBottomWidth[0]);
				
				TotalBorderTopBottom = borderTopWidth + borderBottomWidth;
				
				
				$element.css("height" , 48 - TotalBorderTopBottom + "px");
					
				$(".borderControl #bottom").css("background-color" , "#ccc");
		}else{
			
			$element.css("border-bottom" , "none");
			$element.css("height" , box_height + borderBottomWidth + "px");
			$(".borderControl #bottom").css("background-color" , "transparent");
		
		}
		
	}
	
	if(border_of == "left"){
		
		if (is_bordery_applied[0] == 0) {
		
				$element.css("border-left" , string);
				
				borderLeftWidth = $element.css("border-left-width").split("px");
				borderLeftWidth = Number(borderLeftWidth[0]);
				
				borderRightWidth = $element.css("border-right-width").split("px");
				borderRightWidth = Number(borderRightWidth[0]);
				
				TotalBorderLeftRight = borderLeftWidth + borderRightWidth;
				
				
				$element.css("width" , 48 - TotalBorderLeftRight + "px");
					
				$(".borderControl #left").css("background-color" , "#ccc");
		}else{
			
			$element.css("border-left" , "none");
			$element.css("width" , box_width + borderBottomWidth + "px");
			$(".borderControl #left").css("background-color" , "transparent");
		
		}
		
	}
	
	if(border_of == "right"){
	
		if (is_bordery_applied[0] == 0) {
		
				$element.css("border-right" , string);
				
				borderLeftWidth = $element.css("border-left-width").split("px");
				borderLeftWidth = Number(borderLeftWidth[0]);
				
				borderRightWidth = $element.css("border-right-width").split("px");
				borderRightWidth = Number(borderRightWidth[0]);
				
				TotalBorderLeftRight = borderLeftWidth + borderRightWidth;
				
				
				$element.css("width" , 48 - TotalBorderLeftRight + "px");
					
				$(".borderControl #right").css("background-color" , "#ccc");
		}else{
			
			$element.css("border-right" , "none");
			$element.css("width" , box_width + borderBottomWidth + "px");
			$(".borderControl #right").css("background-color" , "transparent");
		
		}
	}

}

function applyPadding(padding_of){

	$element = $(".paddingControl .ved-edge-inner");
	$elementH = $element.height();
	$elementW = $element.width();
	
	$elementPreview = $(".edge-text-preview");
	
	var paddingInt = Number($(".paddingInt").val());
	
	
	
	if(padding_of == "top"){
	
		$elementPaddingTop = $element.css("padding-top").split("px");
		$elementPaddingTop = Number($elementPaddingTop[0]);
		
		
		if($elementPaddingTop == 0){
		
			$element.css("padding-top" , paddingInt + "px");
			
			$elementPaddingTop = $element.css("padding-top").split("px");
			$elementPaddingTop = Number($elementPaddingTop[0]);
			
			$elementPaddingBottom = $element.css("padding-bottom").split("px");
			$elementPaddingBottom = Number($elementPaddingBottom[0]);
			
			$elementPaddingTobBottom = $elementPaddingTop + $elementPaddingBottom;
			
			$element.css("height" , 48 - $elementPaddingTobBottom + "px");
			$elementPreview.css("height" , 48 - $elementPaddingTobBottom + "px");
			
			$(".paddingControl #top").css("background-color" , "#ccc");
		
		}else{
			
			$elementPaddingTop = $element.css("padding-top").split("px");
			$elementPaddingTop = Number($elementPaddingTop[0]);
			$element.css("padding-top" , "0px");
			
			$element.css("height" , $elementH + $elementPaddingTop + "px");
			$elementPreview.css("height" , $elementH + $elementPaddingTop + "px");
			
			$(".paddingControl #top").css("background-color" , "transparent");
		}
		
	}
	
	if(padding_of == "bottom"){
	
		$elementPaddingBottom = $element.css("padding-bottom").split("px");
		$elementPaddingBottom = Number($elementPaddingBottom[0]);
		
		
		if($elementPaddingBottom == 0){
		
			$element.css("padding-bottom" , paddingInt + "px");
			
			$elementPaddingTop = $element.css("padding-top").split("px");
			$elementPaddingTop = Number($elementPaddingTop[0]);
			
			$elementPaddingBottom = $element.css("padding-bottom").split("px");
			$elementPaddingBottom = Number($elementPaddingBottom[0]);
			
			$elementPaddingTobBottom = $elementPaddingTop + $elementPaddingBottom;
			
			$element.css("height" , 48 - $elementPaddingTobBottom + "px");
			$elementPreview.css("height" , 48 - $elementPaddingTobBottom + "px");
			
			$(".paddingControl #bottom").css("background-color" , "#ccc");
		
		}else{
			
			$elementPaddingTop = $element.css("padding-bottom").split("px");
			$elementPaddingTop = Number($elementPaddingTop[0]);
			$element.css("padding-bottom" , "0px");
			
			$element.css("height" , $elementH + $elementPaddingTop + "px");
			$elementPreview.css("height" , $elementH + $elementPaddingTop + "px");
			
			$(".paddingControl #bottom").css("background-color" , "transparent");
		}
		
	}
	
	if(padding_of == "left"){
	
		$elementPaddingLeft = $element.css("padding-left").split("px");
		$elementPaddingLeft = Number($elementPaddingLeft[0]);
		
		
		if($elementPaddingLeft == 0){
		
			$element.css("padding-left" , paddingInt + "px");
			
			$elementPaddingLeft = $element.css("padding-left").split("px");
			$elementPaddingLeft = Number($elementPaddingLeft[0]);
			
			$elementPaddingRight = $element.css("padding-right").split("px");
			$elementPaddingRight = Number($elementPaddingRight[0]);
			
			$elementPaddingLeftRight = $elementPaddingLeft + $elementPaddingRight;
			
			$element.css("width" , 48 - $elementPaddingLeftRight + "px");
			$elementPreview.css("width" , 48 - $elementPaddingLeftRight + "px");
			
			$(".paddingControl #left").css("background-color" , "#ccc");
		
		}else{
			
			$elementPaddingLeft = $element.css("padding-left").split("px");
			$elementPaddingLeft = Number($elementPaddingLeft[0]);
			$element.css("padding-left" , "0px");
			
			$element.css("width" , $elementW + $elementPaddingLeft + "px");
			$elementPreview.css("width" , $elementW + $elementPaddingLeft + "px");
			
			$(".paddingControl #left").css("background-color" , "transparent");
		}
		
	}
	
	if(padding_of == "right"){
	
		$elementPaddingRight = $element.css("padding-right").split("px");
		$elementPaddingRight = Number($elementPaddingRight[0]);
		
		
		if($elementPaddingRight == 0){
		
			$element.css("padding-right" , paddingInt + "px");
			
			$elementPaddingLeft = $element.css("padding-left").split("px");
			$elementPaddingLeft = Number($elementPaddingLeft[0]);
			
			$elementPaddingRight = $element.css("padding-right").split("px");
			$elementPaddingRight = Number($elementPaddingRight[0]);
			
			$elementPaddingLeftRight = $elementPaddingLeft + $elementPaddingRight;
			
			$element.css("width" , 48 - $elementPaddingLeftRight + "px");
			$elementPreview.css("width" , 48 - $elementPaddingLeftRight + "px");
			
			$(".paddingControl #right").css("background-color" , "#ccc");
		
		}else{
			
			$elementPaddingRight = $element.css("padding-right").split("px");
			$elementPaddingRight = Number($elementPaddingRight[0]);
			$element.css("padding-right" , "0px");
			
			$element.css("width" , $elementW + $elementPaddingLeft + "px");
			$elementPreview.css("width" , $elementW + $elementPaddingRight + "px");
			
			$(".paddingControl #right").css("background-color" , "transparent");
		}
		
	}
	
}

function addNewRule(){

	var html = '<li class="listing"><ul class="clearfix"><li><select name="dsf"><option value="">Option</option><option value="">Option</option><option value="">Option</option><option value="">Option</option></select></li><li><select name="dsf"><option value="">Option</option><option value="">Option</option><option value="">Option</option><option value="">Option</option></select></li><li><select name="dsf"><option value="">Option</option><option value="">Option</option><option value="">Option</option><option value="">Option</option></select></li><li><select name="dsf"><option value="">Option</option><option value="">Option</option><option value="">Option</option><option value="">Option</option></select></li></ul></li>';
	
	$(".dynamic_inputs_list").append(html);

}


</script>
