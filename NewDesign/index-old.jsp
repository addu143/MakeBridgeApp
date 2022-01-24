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
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/icons.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/changes.css" rel="stylesheet" />
    <link href="css/chosen.css" rel="stylesheet" />
    <link href="css/bmsgrid.css" rel="stylesheet" />

    <link href="css/isotope.css" rel="stylesheet" />
    <link href="editorcss/editorstyle.css" rel="stylesheet" />
    <link href="editorcss/skin.css" rel="stylesheet" />
    <link href="scripts/libs/miniColor/jquery.minicolors.css" rel="stylesheet" />
    <link href="editorcss/style.css" rel="stylesheet" />





    <script type="text/template" id="tmpMakeBridgeContainer">

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
        <div class="addyHyperLinkDiv" style="display:none">
                
      <h4>Add a Hyperlink  (Standard Link URL)</h4>
    
            <form enctype="multipart/form-data" method="post" action="#" name="submit_url">
                <div class="textAreaDivfortextLink" style="display:none;" >
                    <label>Text</label>
                    <textarea style=" text-decoration: underline; color: rgb(0, 0, 0); color:#000;"  class="text-areaLinkGUI linkTextArea" >
                  
            </textarea>
                </div>
                <div class="linkImagePreview" style="display:none;">
                    <img style="width:60px;max-height:100%;max-width:100%;vertical-align:top;">
              </div>
                <br>      
                <label>Link (URL)  </label>
                
                <div class="input-append" >
                    <div class="inputcont ">
                        <input type="text" class="header-info linkHyperLinkURL" placeholder="Type link here"></div>
                       
                            <button tabindex="-1" data-toggle="dropdown" id="" class="btn dropdown-toggle"> Existing Link <span class="caret"></span> </button>
                        
                        <div class="existinglinksdd">
                            <div id="copycampsearch" class="input-append search"> <span class="icon link"></span>
                                    <input type="text" id="copy-camp-search" placeholder="Search links" class="search-control show-image">
                                    <a class="close-icon" id="clearsearch" style="display:none"></a>
                                    <div class="btn-group">
                                    <button tabindex="-1" class="searchbtn" id="searchbtn"><span class="icon-search icon-white"> </span></button>
                                    </div>
                                </div>
                            <ul class="linkresults">
                                    <li data-option-array-index="0" style="" class="result-selected">https://my.dotmailer.com/Campaigns/Step/EasyEditor.aspx?id=3644033</li>
                                    <li data-option-array-index="1" style="" class="">https://my.dotmailer.com/Campaigns/Step/EasyEditor.aspx?id=3644033</li>
                                    <li data-option-array-index="2" style="" class="">https://my.dotmailer.com/Campaigns/Step/EasyEditor.aspx?id=3644033</li>
                                </ul>
                        
                        </div>
                    </div>
                    
                    <a href="" target="_new" class="visitlink"><i class="icon preview"></i></a>
                <br>
            
                <label>Link Name (For Tracking)</label>
                <input type="text" maxlength="200" class="textLinkGUI linkName">
                <br>
                    <div class="inputlabel">
                    <input type="checkbox" id="dont-track"><label><span>Do not track this link</span></label>
                    </div>
        
                <br>       
                
                <a href="" target="_new">Visit Link</a>
                     
      </form>
        </div>
        <div class="addEmailLinkDiv" style="display:none;">
      <h4>Add a link to an email address</h4>
    
      <form enctype="multipart/form-data" method="post" action="#" name="submit_url">
        <div class="textAreaDivfortextLink" style="display:none;" >
                    <label>Text</label>
                    <textarea style=" text-decoration: underline; color: rgb(0, 0, 0); color:#000;"  class="text-areaLinkGUI linkTextArea" >
                  
            </textarea>
                </div>
                <div class="linkImagePreview" style="display:none;">
                    <img style="width:60px;max-height:100%;max-width:100%;vertical-align:top;">
              </div>
        <br>
      
        <label>Email address</label>
        <input type="text" maxlength="200" class="textLinkGUI" id="emailLinkName"/>        
        <br>
        <label>Email subject</label>
        <input type="text" maxlength="200" class="textLinkGUI" id="emailLinkSubject"/>
        <br>
     
      </form> 
        </div>
        <div class="addFrwdToFrndLinkDiv" style="display:none;">
            <h4>Add a 'Forward to a friend' link</h4>
    
            <form enctype="multipart/form-data" method="post" action="#" name="submit_url">
                <div class="textAreaDivfortextLink" style="display:none;" >
                    <label>Text</label>
                    <textarea style=" text-decoration: underline; color: rgb(0, 0, 0); color:#000;"  class="text-areaLinkGUI linkTextArea" >
                  
            </textarea>
                </div>
                <div class="linkImagePreview" style="display:none;">
                    <img style="width:60px;max-height:100%;max-width:100%;vertical-align:top;">
              </div>
         
            </form>
        </div>
        <div class="addUnsubscribeLinkDiv" style="display:none;">
            <h4>Add an unsubscribe link</h4>
    
            <form enctype="multipart/form-data" method="post" action="#" name="submit_url">
                <div class="textAreaDivfortextLink" style="display:none;" >
                    <label>Text</label>
                    <textarea style=" text-decoration: underline; color: rgb(0, 0, 0); color:#000;"  class="text-areaLinkGUI linkTextArea" >
                  
            </textarea>
                </div>
                <div class="linkImagePreview" style="display:none;">
                    <img style="width:60px;max-height:100%;max-width:100%;vertical-align:top;">
              </div>
                <br>
            </form>
        </div>
        <div class="addViewinBrowserLinkDiv" style="display:none;">
            <h4>Add a 'Can\'t read email' link</h4>
    
            <form enctype="multipart/form-data" method="post" action="#" name="submit_url">
                <div class="textAreaDivfortextLink" style="display:none;" >
                    <label>Text</label>
                    <textarea style=" text-decoration: underline; color: rgb(0, 0, 0); color:#000;"  class="text-areaLinkGUI linkTextArea" >
                  
            </textarea>
                </div>
                <div class="linkImagePreview" style="display:none;">
                    <img style="width:60px;max-height:100%;max-width:100%;vertical-align:top;">
              </div>
                <br>
     
            </form>
        </div>
        <div class="addNewAnchorLinkDiv" style="display:none;">
            <h4>New # anchor</h4>
    
            <form enctype="multipart/form-data" method="post" action="#" name="submit_url">
                <div class="textAreaDivfortextLink" style="display:none;" >
                    <label>Text</label>
                    <textarea style=" text-decoration: underline; color: rgb(0, 0, 0); color:#000;"  class="text-areaLinkGUI linkTextArea" >
                  
            </textarea>
                </div>
                <div class="linkImagePreview" style="display:none;">
                    <img style="width:60px;max-height:100%;max-width:100%;vertical-align:top;">
              </div>
                <!--input type="text" maxlength="200" class="textLinkGUI" id="newAnchortext"/>
                <p>* Note that the anchor will be inserted at the beginning of the selected text </p-->
                <br>             
                      
                      <label>Anchor name</label>
                      <input type="text" id="newAnchortext" class="textLinkGUI" maxlength="200">
           
                <em class="note">* Note that the anchor will be inserted at the beginning of the selected text</em>
                    
          
        <br>
                
                            
            </form>
        </div>
        <div class="addDoubleOptLinkDiv" style="display:none;">
        </div>
        <div class="addSafeSenderLinkDiv" style="display:none;">
        </div>

        <div id="imageToolbar" class="imageToolbar-menu">
            <ul>
                <li title="Set Link" class="ImageToolbarLinkClass">
                    <select style="background-color:#5E5E5E; color:#FFFFFF; width:64px;" title="Set Link">
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

        <div id="currTinyMCE" style="display:none;"></div>
        <div id="linkTrack" style="display:none;"></div>
        <div id="imageDataSavingObject" style="display:none;"></div>
        
    <div class="overlay" style="display:none;">
  <div class="modal in" style="width: 780px; margin-left: -380px;" aria-hidden="false">
    <div class="modal-header ws-notags">
    <div class="camp_header grayicons ">
             
            
            <div class="row c-name  "> 
              <h2><i class="icon link left"></i><span style="margin-left:5px;">Links GUI</span>               </h2>
              
              <!--     -->
              
            </div>
            
            
            <ul class="toolbar">
          
        <li><a title="" class="icon close showtooltip" data-original-title="Close"></a></li>
    </ul>
            
         
            
          </div>
    
    </div>
    <div class="modal-body" style="min-height: 260px;">
      
      
      
      
      
      <div class="content_containerLinkGUI">
      <div class="left_columnLinkGUI flLinkGUI">
        <div id="cssmenuLinkGUI">
                <ul>
                   <li class="homeLinkGUI selected"><a href="#"><i class="icon homelink"></i><span>Hyperlink</span></a></li>
                   <li class="emailLinkGUI "><a href="#" id="emailLinkGUI"><i class="icon emaillink"></i><span>Email</span></a></li>
                   <li class="forwardToFriendLinkGUI"><a href="#"><i class="icon frwrdfriend"></i><span>Forward to a Friend</span></a></li>
                   <li class="unsubscribeLinkGUI"><a href="#" class="noimage"><i class="icon unsubslink"></i><span>Unsubscribe</span></a></li>
                   <li class="viewInBrowserLinkGUI"><a href="#" class="noimage"><i class="icon vbrsrlink"></i><span>View in Browser</span></a></li>
                   <li class="newAnchorLinkGUI"><a href="#" class="noimage"><i class="icon newanchlink"></i><span>New # anchor</span></a></li>
                </ul>
                </div>
            </div>
        <div class="right_columnLinkGUI frLinkGUI" id="rightPanelArea">
          
        </div>



        </div>
     
    </div>
    <div class="modal-footer"> <a style="display: inline;" class="btn btn-green right btn-save"><span>Insert</span><i class="icon next"></i></a> <a data-dismiss="modal" class="btn btn-gray btn-close"><span>Close</span></a> </div>
  </div>
</div>
    <div class="tools">
        <ul class="tabsnav">
            <li><a href="#" class="tabs active builder-tab"><i class="icon build"></i><span>Builder</span></a></li>
            <li><a href="#" class="tabs style-tab"><i class="icon styles"></i><span>Styles</span></a></li>
        </ul>




        <!--  tabsnav  -->

        <div class="tabcontent builder-panel">
            <div class="accordian">
                <h3 class="active"><span class="ui-accordion-header-icon ui-icon ui-icon-triangle-1-s"></span>Building Blocks </h3>
                <div class="accordian-content ">
                    <div class="clearfix">
                        <h4 class="">Rows</h4>
                        <ul class="b-blocks">
                            <li class="draggableControl ui-draggable" data-type="oneColumnContainer"><i class="icon col1"></i><a href="#"><span class=" font_75">1 Col</span></a></li>
                            <li class="draggableControl ui-draggable" data-type="twoColumnContainer"><i class="icon col2"></i><a href="#"><span class=" font_75">2 Col</span></a></li>
                            <li class="draggableControl ui-draggable" data-type="threeColumnContainer"><i class="icon col3"></i><a href="#"><span class=" font_75">3 Col</span></a></li>
                            <li class="draggableControl ui-draggable" data-type="fourColumnContainer"><i class="icon col4"></i><a href="#"><span class=" font_75">4 Col</span></a></li>
                        </ul>
                    </div>
                    <div class="clearfix">
                        <h4 class="">Items</h4>
                        <ul class="b-blocks">
                            <li class="draggableControl ui-draggable" data-type="text"><i class="icon txt"></i><a href="#"><span class=" font_75">Text</span></a></li>
                            <li class="draggableControl ui-draggable" data-type="image"><i class="icon imag"></i><a href="#"><span class=" font_75">Image</span></a></li>
                            <li class="draggableControl ui-draggable" data-type="textWithImage"><i class="icon txtimag"></i><a href="#"><span class=" font_75">Text + Image</span></a></li>
                            <li class="draggableControl ui-draggable" data-type="imageWithText"><i class="icon imagtxt"></i><a href="#"><span class=" font_75">Image + Text</span></a></li>
                        </ul>
                    </div>
                    <div class="clearfix">
                        <h4 class="">Spacer</h4>
                        <ul class="b-blocks">
                            <li class="draggableControl ui-draggable"><i class="icon txt"></i><a href="#"><span class=" font_75">Text</span></a></li>
                            <li class="draggableControl ui-draggable"><i class="icon imag"></i><a href="#"><span class=" font_75">Image</span></a></li>
                            <li class="draggableControl ui-draggable"><i class="icon txtimag"></i><a href="#"><span class=" font_75">Text + Image</span></a></li>
                            <li class="draggableControl ui-draggable"><i class="icon imagtxt"></i><a href="#"><span class=" font_75">Image + Text</span></a></li>
                        </ul>
                    </div>
                </div>
                <!--  accordian-content  -->

                <h3><span class="ui-accordion-header-icon ui-icon ui-icon-triangle-1-s"></span>My Building Blocks </h3>
                <div class="accordian-content">

                    <div class="dropblockpanel divLoading" style="display: none;">
                        <div class="blockdrop">
                            <h3>Drop Block Here</h3>
                        </div>
                    </div>


                    <div class="accordianbar">
                        <div>
                            <div class="search" style="width: 240px;">
                                <input type="text" value="" name="" style="width: 220px;" />
                                <a href="#" class="search"><i class="icon search"></i></a>
                            </div>
                        </div>

                    </div>
                    <div class="clearfix">
                        <div class="buildingBlockDroppable">
                            <div>
                                <ul class="ulBuildingBlocks image-gallery b-blocks">
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!--  accordian-content  -->

                <h3>
                    <span class="ui-accordion-header-icon ui-icon ui-icon-triangle-1-s"></span>
                    Dynamic Content Blocks </h3>
                <div class="accordian-content active">
                    <div class="accordianbar">
                        <div>
                            <h5></h5>
                            <div class="search">
                                <input type="text" value="" name="" />
                                <a href="#" class="search"><i class="icon search"></i></a>
                            </div>
                            <a href="#" class="add"><i class="icon add"></i></a>

                            <div class="image-info" style="left: 199px; top: 33px;">
                                <a class="closebtn"></a>
                                <h5>Enter Name of new block</h5>
                                <h5 class="error">Name already exist, please enter a different name.</h5>
                                <input type="text" placeholder="Image URL" class="left tginput" style="width: 202px; margin-bottom: 10px; dis" value="Edit Block Name">
                                <a class="btn-green left" style="display: none;"><span>Save</span><i class="icon save"></i></a>
                                <a class="btn-green left saving"><span>Save</span></a>
                                <a class="btn-gray right"><span>Close</span><i class="icon cross"></i></a>
                            </div>
                        </div>

                    </div>
                    <div class="clearfix">
                        <div class="dynamicBlockDroppable">
                            <ul class="ulDynamicBlocks image-gallery b-blocks">
                            </ul>
                        </div>
                    </div>
                </div>
                <!--  accordian-content  -->

                <h3><span class="ui-accordion-header-icon ui-icon ui-icon-triangle-1-s"></span>Image Library </h3>
                <div class="accordian-content active">
                    <div class="accordianbar">
                        <div class="" style="display: ;">
                            <div class="search">
                                <input class="searchimg-text" type="text" value="" name="" />
                                <a href="#" class="search search-img"><i class="icon search"></i></a>
                            </div>

                            <form id="form1" enctype="multipart/form-data" action="" method="POST">
                                <input type="file" id="myUploadFile" name="fileName" style="display: none;" />
                                <input type="hidden" name="type" value="add" />
                                <input type="hidden" name="allowOverwrite" value="N" />
                                <input type="hidden" name="BMS_REQ_TK" value="" />

                            </form>
                            <a href="#" class="upload uploadFile"><i class="icon upload"></i></a>
                        </div>

                    </div>
                    <!--  accordianbar  -->

                    <div class="clearfix">
                        <ul class="b-blocks imageLib">
                            <li class="draggableControl ui-draggable droppedImage" data-type="droppedImage">
                                <span class="img">
                                    <img src="images/img1.png" alt="" data-id="imgId1" data-tags="tag1,tag2" data-name="imageName" /></span>
                                <a href="#"><span class=" font_75">Image 1</span></a>
                                <div class="imageicons">
                                    <i class="imgicons info action" data-actiontype="imageInfo" data-id="imgId1"></i>
                                    <i class="imgicons link action" data-actiontype="imageLink" data-id="imgId1"></i>
                                    <i class="imgicons preview action" data-actiontype="imagePreview" data-id="imgId1"></i>
                                    <i class="imgicons tag action" data-actiontype="imageTag" data-id="imgId1"></i>
                                    <i class="imgicons delete action" data-actiontype="imageDelete" data-id="imgId1"></i>

                                    <div class="image-info info-window" style="left: -21px;">
                                        <a class="closebtn "></a>
                                        <h4>Image abcdef </h4>

                                        <h5><em>Size: </em>300 x 500</h5>
                                        <h5><em>Created on: </em>25 Feb 2014</h5>

                                        <!--   tagscont  -->
                                    </div>
                                    <!--   image-info  -->
                                    <div class="image-info link-window" style="left: 0px;">
                                        <a class="closebtn"></a>
                                        <h4>Image URL</h4>
                                        <input type="text" placeholder="Image URL" class="left tginput" style="width: 202px;" value="file:///E:/makes%20bridge/MEE%20Editor%20HTML/editor.html#">

                                        <!--   tagscont  -->
                                    </div>
                                    <!--   image-info link  -->
                                    <div class="image-info tag-window" style="left: 43px;">
                                        <a class="closebtn closebtn-imgtag" data-id="imgId1"></a>
                                        <div class="tagscont">
                                            <ul>
                                                <li><a class="tag" href="#"><span>Business</span><i class="icon cross remove-tag"></i></a> </li>
                                                <li><a class="tag" href="#"><span>marketing</span><i class="icon cross remove-tag"></i></a> </li>
                                                <li><a class="tag" href="#"><span>online shopping</span><i class="icon cross remove-tag"></i></a> </li>
                                                <li><a class="tag" href="#"><span>amazon</span><i class="icon cross remove-tag"></i></a> </li>
                                                <li><a class="tag" href="#"><span>Business</span><i class="icon cross remove-tag"></i></a> </li>
                                                <li><a class="tag" href="#"><span>marketing</span><i class="icon cross remove-tag"></i></a> </li>
                                                <li><a class="tag" href="#"><span>online shopping</span><i class="icon cross remove-tag"></i></a> </li>
                                                <li><a class="tag" href="#"><span>amazon</span><i class="icon cross remove-tag"></i></a> </li>
                                            </ul>
                                        </div>
                                        <!--   tagscont  -->
                                        <input type="text" placeholder="Add tag" class="left tginput">
                                        <a class="btn-green left addtag" data-id="imgId1"><span>Add</span><i class="icon plus"></i></a>


                                    </div>
                                    <!--   image-info  -->
                                    <div class="image-info del-window" style="left: 63px;">
                                        <a class="closebtn"></a>
                                        <h5 style="padding-bottom: 10px;">Do you want to delete this Image?</h5>
                                        <a class="btn-red left confirm-del" data-id="imgId1"><span>Delete</span><i class="icon delete"></i></a>
                                        <!--   tagscont  -->
                                    </div>
                                    <!--   image-info link  -->


                                </div>
                            </li>
                            <li class="draggableControl ui-draggable droppedImage" data-type="droppedImage">
                                <span class="img">
                                    <img src="images/img2.png" alt="" /></span>
                                <a href="#"><span class=" font_75">Image 2</span></a>
                                <div class="imageicons">
                                    <i class="imgicons info"></i>
                                    <i class="imgicons link"></i>
                                    <i class="imgicons preview"></i>
                                    <i class="imgicons tag"></i>
                                    <i class="imgicons delete"></i>

                                    <div class="image-info" style="left: -21px;">
                                        <a class="closebtn "></a>
                                        <h4>Image abcdef </h4>

                                        <h5><em>Size: </em>300 x 500</h5>
                                        <h5><em>Created on: </em>25 Feb 2014</h5>

                                        <!--   tagscont  -->
                                    </div>
                                    <!--   image-info  -->
                                    <div class="image-info" style="left: 0px;">
                                        <a class="closebtn"></a>
                                        <h4>Image URL</h4>
                                        <input type="text" placeholder="Image URL" class="left tginput" style="width: 202px;" value="file:///E:/makes%20bridge/MEE%20Editor%20HTML/editor.html#">

                                        <!--   tagscont  -->
                                    </div>
                                    <!--   image-info link  -->
                                    <div class="image-info" style="left: 43px;">
                                        <a class="closebtn"></a>
                                        <div class=" tagscont">
                                            <ul>
                                                <li><a class="tag" href=""><span>Business</span><i class="icon cross"></i></a> </li>
                                                <li><a class="tag" href=""><span>marketing</span><i class="icon cross"></i></a> </li>
                                                <li><a class="tag" href=""><span>online shopping</span><i class="icon cross"></i></a> </li>
                                                <li><a class="tag" href=""><span>amazon</span><i class="icon cross"></i></a> </li>
                                                <li><a class="tag" href=""><span>Business</span><i class="icon cross"></i></a> </li>
                                                <li><a class="tag" href=""><span>marketing</span><i class="icon cross"></i></a> </li>
                                                <li><a class="tag" href=""><span>online shopping</span><i class="icon cross"></i></a> </li>
                                                <li><a class="tag" href=""><span>amazon</span><i class="icon cross"></i></a> </li>
                                            </ul>
                                        </div>
                                        <!--   tagscont  -->
                                        <input type="text" placeholder="Add tag" class="left tginput">
                                        <a class="btn-green left"><span>Add</span><i class="icon plus"></i></a>


                                    </div>
                                    <!--   image-info  -->
                                    <div class="image-info" style="left: 63px;">
                                        <a class="closebtn"></a>
                                        <h5 style="padding-bottom: 10px;">Do you want to delete this Image?</h5>
                                        <a class="btn-red left"><span>Delete</span><i class="icon delete"></i></a>
                                        <!--   tagscont  -->
                                    </div>
                                    <!--   image-info link  -->


                                </div>
                            </li>
                            <li class="draggableControl ui-draggable droppedImage" data-type="droppedImage">
                                <span class="img">
                                    <img src="images/img3.png" alt="" /></span>
                                <a href="#"><span class=" font_75">Image 3</span></a>
                                <div class="imageicons">
                                    <i class="imgicons info"></i>
                                    <i class="imgicons link"></i>
                                    <i class="imgicons preview"></i>
                                    <i class="imgicons tag"></i>
                                    <i class="imgicons delete"></i>

                                    <div class="image-info" style="left: -21px;">
                                        <a class="closebtn "></a>
                                        <h4>Image abcdef </h4>

                                        <h5><em>Size: </em>300 x 500</h5>
                                        <h5><em>Created on: </em>25 Feb 2014</h5>

                                        <!--   tagscont  -->
                                    </div>
                                    <!--   image-info  -->
                                    <div class="image-info" style="left: 0px;">
                                        <a class="closebtn"></a>
                                        <h4>Image URL</h4>
                                        <input type="text" placeholder="Image URL" class="left tginput" style="width: 202px;" value="file:///E:/makes%20bridge/MEE%20Editor%20HTML/editor.html#">

                                        <!--   tagscont  -->
                                    </div>
                                    <!--   image-info link  -->
                                    <div class="image-info" style="left: 43px;">
                                        <a class="closebtn"></a>
                                        <div class=" tagscont">
                                            <ul>
                                                <li><a class="tag" href=""><span>Business</span><i class="icon cross"></i></a> </li>
                                                <li><a class="tag" href=""><span>marketing</span><i class="icon cross"></i></a> </li>
                                                <li><a class="tag" href=""><span>online shopping</span><i class="icon cross"></i></a> </li>
                                                <li><a class="tag" href=""><span>amazon</span><i class="icon cross"></i></a> </li>
                                                <li><a class="tag" href=""><span>Business</span><i class="icon cross"></i></a> </li>
                                                <li><a class="tag" href=""><span>marketing</span><i class="icon cross"></i></a> </li>
                                                <li><a class="tag" href=""><span>online shopping</span><i class="icon cross"></i></a> </li>
                                                <li><a class="tag" href=""><span>amazon</span><i class="icon cross"></i></a> </li>
                                            </ul>
                                        </div>
                                        <!--   tagscont  -->
                                        <input type="text" placeholder="Add tag" class="left tginput">
                                        <a class="btn-green left"><span>Add</span><i class="icon plus"></i></a>


                                    </div>
                                    <!--   image-info  -->
                                    <div class="image-info" style="left: 63px;">
                                        <a class="closebtn"></a>
                                        <h5 style="padding-bottom: 10px;">Do you want to delete this Image?</h5>
                                        <a class="btn-red left"><span>Delete</span><i class="icon delete"></i></a>
                                        <!--   tagscont  -->
                                    </div>
                                    <!--   image-info link  -->


                                </div>
                            </li>
                            <li class="draggableControl ui-draggable droppedImage" data-type="droppedImage">
                                <span class="img">
                                    <img src="images/img4.png" alt="" /></span>
                                <a href="#"><span class=" font_75">Image 4</span></a>
                                <div class="imageicons">
                                    <i class="imgicons info"></i>
                                    <i class="imgicons link"></i>
                                    <i class="imgicons preview"></i>
                                    <i class="imgicons tag"></i>
                                    <i class="imgicons delete"></i>

                                    <div class="image-info" style="left: -21px;">
                                        <a class="closebtn "></a>
                                        <h4>Image abcdef </h4>

                                        <h5><em>Size: </em>300 x 500</h5>
                                        <h5><em>Created on: </em>25 Feb 2014</h5>

                                        <!--   tagscont  -->
                                    </div>
                                    <!--   image-info  -->
                                    <div class="image-info" style="left: 0px;">
                                        <a class="closebtn"></a>
                                        <h4>Image URL</h4>
                                        <input type="text" placeholder="Image URL" class="left tginput" style="width: 202px;" value="file:///E:/makes%20bridge/MEE%20Editor%20HTML/editor.html#">

                                        <!--   tagscont  -->
                                    </div>
                                    <!--   image-info link  -->
                                    <div class="image-info" style="left: 43px;">
                                        <a class="closebtn"></a>
                                        <div class=" tagscont">
                                            <ul>
                                                <li><a class="tag" href=""><span>Business</span><i class="icon cross"></i></a> </li>
                                                <li><a class="tag" href=""><span>marketing</span><i class="icon cross"></i></a> </li>
                                                <li><a class="tag" href=""><span>online shopping</span><i class="icon cross"></i></a> </li>
                                                <li><a class="tag" href=""><span>amazon</span><i class="icon cross"></i></a> </li>
                                                <li><a class="tag" href=""><span>Business</span><i class="icon cross"></i></a> </li>
                                                <li><a class="tag" href=""><span>marketing</span><i class="icon cross"></i></a> </li>
                                                <li><a class="tag" href=""><span>online shopping</span><i class="icon cross"></i></a> </li>
                                                <li><a class="tag" href=""><span>amazon</span><i class="icon cross"></i></a> </li>
                                            </ul>
                                        </div>
                                        <!--   tagscont  -->
                                        <input type="text" placeholder="Add tag" class="left tginput">
                                        <a class="btn-green left"><span>Add</span><i class="icon plus"></i></a>


                                    </div>
                                    <!--   image-info  -->
                                    <div class="image-info" style="left: 63px;">
                                        <a class="closebtn"></a>
                                        <h5 style="padding-bottom: 10px;">Do you want to delete this Image?</h5>
                                        <a class="btn-red left"><span>Delete</span><i class="icon delete"></i></a>
                                        <!--   tagscont  -->
                                    </div>
                                    <!--   image-info link  -->


                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <!--  accordian-content  -->

            </div>
        </div>
        <!--  tabcontent  -->
        <div class="tabcontent style-panel" style="display: none;">
            <div class="accordian">

                <h3 class=""><span class="ui-accordion-header-icon ui-icon ui-icon-triangle-1-s"></span>Building Blocks </h3>
                <div class="accordian-content ">
                    <div class="clearfix" style="padding: 5px;">

                        <div class="minicolors minicolors-theme-default minicolors-position-bottom minicolors-position-left minicolors-inline" style="text-align: center;">
                            <img src="images/pallete.png" alt="" />
                        </div>
                        <input type="text" maxlength="15" size="15" class="txtColorCode acco-input">
                        <input type="button" style="float: right; margin: 0;" value="Add to my Colors" class=" addToMyColors">
                    </div>
                    <div class="clearfix">
                        <h4 class="">Template Colors</h4>
                        <ul class="color-box templateColors">
                            <li style="background-color: #fdc331;"></li>
                            <li style="background-color: #ef8f24;"></li>
                            <li style="background-color: #e7524e;"></li>
                            <li style="background-color: #a855a9;"></li>
                            <li style="background-color: #ff92a4;"></li>
                        </ul>
                    </div>
                    <div class="clearfix">
                        <h4 class="">My Colors</h4>
                        <ul class="color-box templateColors">
                            <li style="background-color: #fdc331;"></li>
                            <li style="background-color: #ef8f24;"></li>
                            <li style="background-color: #e7524e;"></li>
                        </ul>
                    </div>
                </div>
                <!--  accordian-content  -->
                <h3 class="active"><span class="ui-accordion-header-icon ui-icon ui-icon-triangle-1-s"></span>Borders & Paddings </h3>
                <div class="accordian-content active">
                    <div class="clearfix">
                        <h4 class="">Borders</h4>
                        <div style="padding: 5px;">

                            <div class="styletable clearfix">


                                <div class="stylebox">

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

                                    <label class="acco-label grey-col fl  width_140">Border Color</label>
                                    <div class="minicolors minicolors-theme-default minicolors-position-top minicolors-position-left"><a class="fl colorPickerBorder acco-label minicolors-input" href="#"></a><span class="minicolors-swatch"><span class="minicolors-swatch-color" style="background-color: rgb(0, 0, 0);"></span></span></div>


                                </div>
                                <div class="stylebox">


                                    <div class="ddg-control ved-edges ddg-container borderControl" style="top: 39px;">
                                        <div unselectable="on" id="top" class="ddg-control ddg-button ved-edges-button ved-edges-top ddg-unselectable borderselected">
                                            <div onclick="applyborder('top');" data-type="Top" class="ddg-unselectable sBorderLine" unselectable="on"></div>
                                        </div>
                                        <div unselectable="on" id="bottom" class="ddg-control ddg-button ved-edges-button ved-edges-bottom ddg-unselectable">
                                            <div onclick="applyborder('bottom');" data-type="Bottom" class="ddg-unselectable sBorderLine" unselectable="on"></div>
                                        </div>
                                        <div unselectable="on" id="left" class="ddg-control ddg-button ved-edges-button ved-edges-left ddg-unselectable">
                                            <div onclick="applyborder('left');" data-type="Left" class="ddg-unselectable sBorderLine" unselectable="on"></div>
                                        </div>
                                        <div unselectable="on" id="right" class="ddg-control ddg-button ved-edges-button ved-edges-right ddg-unselectable">
                                            <div onclick="applyborder('right');" data-type="Right" class="ddg-unselectable sBorderLine" unselectable="on"></div>
                                        </div>
                                        <div class="ved-edge-control">
                                            <div class="edges-dotted-topbottom"></div>
                                            <div class="edges-dotted-leftright"></div>
                                            <div style="width: 48px; height: 48px; border-bottom: medium none; border-top: medium none;" class="ved-edge-inner"></div>
                                        </div>
                                    </div>


                                </div>

                            </div>

                            <div class="styletable clearfix">
                                <div class="stylebox">

                                    <label class="acco-label grey-col fl  width_140">Padding </label>



                                    <select class="acco-select margin_20 width_140 fl ddlPadding">
                                        <option value="6">6px</option>
                                        <option value="8">8px</option>
                                        <option value="10">10px</option>
                                    </select>

                                </div>
                                <div class="stylebox">

                                    <div class="ddg-control ved-edges ved-padding-edges ddg-container paddingControl">
                                        <div unselectable="on" id="Div1" class="ddg-control ddg-button ved-edges-button ved-edges-top ddg-unselectable">
                                            <div onclick="applyPadding('top');" data-type="Top" class="ddg-unselectable sPadding" unselectable="on"></div>
                                        </div>
                                        <div unselectable="on" id="Div2" class="ddg-control ddg-button ved-edges-button ved-edges-bottom ddg-unselectable">
                                            <div onclick="applyPadding('bottom');" data-type="Bottom" class="ddg-unselectable sPadding" unselectable="on"></div>
                                        </div>
                                        <div unselectable="on" id="Div3" class="ddg-control ddg-button ved-edges-button ved-edges-left ddg-unselectable">
                                            <div onclick="applyPadding('left');" data-type="Left" class="ddg-unselectable sPadding" unselectable="on"></div>
                                        </div>
                                        <div unselectable="on" id="Div4" class="ddg-control ddg-button ved-edges-button ved-edges-right ddg-unselectable">
                                            <div onclick="applyPadding('right');" data-type="Right" class="ddg-unselectable sPadding" unselectable="on"></div>
                                        </div>
                                        <div class="ved-edge-control">
                                            <div class="edges-dotted-topbottom"></div>
                                            <div class="edges-dotted-leftright"></div>
                                            <div style="width: 48px; height: 48px;" class="ved-edge-inner">
                                                <div style="width: 48px; height: 48px;" class="edge-text-preview"></div>
                                            </div>

                                        </div>
                                    </div>

                                </div>

                            </div>
                            <!--  styletable -->
                        </div>
                    </div>
                </div>
                <!--  accordian-content  -->

                <h3 class=""><span class="ui-accordion-header-icon ui-icon ui-icon-triangle-1-s"></span>Email Width </h3>
                <div class="accordian-content active ">

                    <div class="clearfix">
                        <h4>Choose a width for your email</h4>

                        <div style="padding: 5px;">
                            <input type="button" value="LARGE (700px)" data-value="700" class="large-button acco-button ">
                            <input type="button" value="MEDIUM (600px)" data-value="600" class="medium-button acco-button active ">
                            <input type="button" value="SMALL (500px)" data-value="500" class="small-button acco-button ">


                            <label class="acco-label grey-col fl width_140 ">Custom width</label>
                            <input type="text" class="txtColorCode acco-input" size="15" maxlength="15">
                            pixels
                        </div>
                    </div>


                </div>
                <!--  accordian-content  -->


            </div>
        </div>
        <!--  tabcontent  -->

    </div>
    <!--  tools  -->

    <div class="editorpanel">
        <div class="editorbar">
            <ul>
                <li class="undo"><a href="#" class="btn-gray"><i class="icon undo"></i></a></li>
                <li class="redo"><a href="#" class="btn-gray"><i class="icon redo"></i></a></li>
                <li class="preview"><a href="#" class="btn-blue"><i class="icon preview"></i><span>Preview</span></a></li>
                <li class="save"><a href="#" class="btn-green"><i class="icon save"></i><span>Save</span></a></li>
            </ul>
        </div>
        <!--  tools  -->

        <div class="editorbox content" style="height: 1000px; overflow: scroll;">
            <table style="width: 700px; height: 100%; vertical-align: top;" align="center" class="mainTable">
                <tr>
                    <td class="mainContentHtmlGrand" valign="top">
                        <ul class="sortable mainContentHtml" style="list-style: none; padding: 0; margin: 0;">
                        </ul>
                    </td>
                </tr>
            </table>
        </div>
        <!--  editorpanel  -->

    </div>
    <!--  editorpanel  -->
    <div id="fontColorDialog" style="display: none;"></div>
        <div id="CustomColorPicker">
            <label>
                <p class="grey-col">Selected color</p>
            </label>
            <input type="text" class="selectedFontColor acco-input" size="15" maxlength="15" readonly />
            <label>
                <p class="grey-col background">Pick a color</p>
            </label>
            <div class="divFontColorPicker">
            </div>
            <div class="mycolorFontPicker">
                <label>
                    <p class="grey-col background">My Colors</p>
                </label>
                <ul class="color-box myFontColors">
                    <li style="background-color: none;"></li>


                </ul>
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
        <div class="buildingBlock_name_edit" style="display: none;">
            <div class="ddgwin-titlebar">
                <span class="ddgwin-title">Edit building block name</span>
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
                        <input type="text" class='txtPlaceHolder editBlockInputName' placeholder="Provide a name for your building block"
                            style="width: 430px;" maxlength="255">
                    </div>
                </div>
                <div style="font-size: 12px;">
                    Give your block a name that you will be able to recognise later.
                </div>
            </div>
        </div>
        <div class="divActionButtonsForBuildingBlock" style="display: none;">
            <div class="imageicons">
                <i class="imgicons edit"></i>
                <i class="imgicons delete right"></i>


                <div class="image-info editBox" style="left: -21px; display: none;">
                    <a class="closebtn"></a>
                    <h5 style="padding-bottom: 10px;">Edit Block Name</h5>

                    <input type="text" placeholder="Image URL" class="left tginput txtBlockName" style="width: 202px; margin-bottom: 10px; dis" value="Edit Block Name">
                    <a class="btn-green left btnSave"><span>Save</span><i class="icon save"></i></a>
                </div>
                <!-- image-info   -->


                <div style="left: 69px; display: none;" class="image-info delBox">
                    <a class="closebtn"></a>
                    <h5 style="padding-bottom: 10px;">Do you want to delete this Image?</h5>
                    <a class="btn-red left btnDelete"><span>Delete</span><i class="icon delete"></i></a>
                    <!--   tagscont  -->
                </div>
                <!--   image-info link  -->



            </div>
        </div>
        <!--div class="overlay imgpreview-container" style="display:none;">
        <div class="modal in" style="width: 518px; margin-left: -260px;" aria-hidden="false">
            <div class="modal-header ws-notags">
                <div class="camp_header grayicons ">
                    <div class="row c-name  ">
                        <h2><i class="icon preview  left"></i><span style="margin-left: 5px;">Image abc</span>               </h2>
                    </div>
                    <ul class="toolbar">
                        <li>
                            <!--<a  class="icon more showtooltip" title="More"></a>>
                            <ul id="more-tool-actions">
                                <li class=""><a title="" class="icon newwin showtooltip" data-original-title="Open in new window"></a></li>
                            </ul>
                        </li>
                        <li><a title="" class="icon close showtooltip" data-original-title="Close"></a></li>
                    </ul>
                </div>
            </div>
            <div class="modal-body" style="min-height: 260px;">
                <img src="images/libimg.jpg" alt="" />
            </div>
            <div class="modal-footer"></div>
        </div>
    </!--div-->
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
        <script type="text/javascript" src="scripts/libs/custom/MakeBridgeUndoRedoManager.js"></script>
        <script type="text/javascript" src="scripts/makebridge_data.js"></script>
        <script type="text/javascript" src="scripts/libs/miniColor/jquery.minicolors.js"></script>
        <script type="text/javascript" src="scripts/makebridge.js"></script>

        <script src="js/jquery.isotope.min.js"></script>
        <script src="js/jquery.icheck.min.js?v=0.9.1"></script>
        <script src="js/chosen.jquery.js" type="text/javascript"></script>
        <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>



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

                var _preDefinedHTML = "";

                // var _preDefinedHTML = "<ul class=\"sortable mainContentHtml\"><li class=\"myDroppable ui-draggable ui-droppable\" style=\"visibility: hidden; background-color: rgb(220, 238, 254);\"></li><li class=\"ui-draggable ui-droppable csHaveData\"><table width=\"100%\"><tbody><tr><td><div class=\"textcontent mce-content-body\" id=\"mce_0\" tabindex=\"-1\" contenteditable=\"true\" spellcheck=\"false\" style=\"position: relative;\"><p>This is sample text</p></div></td></tr></tbody></table></li><li class=\"myDroppable ui-draggable ui-droppable\" style=\"visibility: hidden; background-color: rgb(220, 238, 254);\"></li></ul>" ;

                $("#myMakeBridge").MakeBridgeEditor({
                    SaveImageTagsProperties: _saveImageTagsAjaxParameters,
                    DeleteImageProperties: _deleteImageAjaxParameter,
                    ImagesAjaxProperties: _imageAjaxParameters,
                    SearchImagesProperties: _searchImagesAjaxParameters,
                    AddImageProperties: _AddimageAjaxParameters,
                    preDefinedHTML: _preDefinedHTML,
                    sessionIDFromServer: "",
                    OnDropElementOnBuildingBlock: function (args) {

                        //Save to Server
                        if (args.buildingBlock != null) {
                            //args.buildingBlock.Name; 
                            //args.buildingBlock.Html;

                            $.ajax({
                            url: "/pms/io/publish/saveEditorData/?<%=WebSecurityManager.getCSRFToken_HREF(session)%>&type=addBlock&name="+ args.buildingBlock.Name + "&html=" + encodeURIComponent(args.buildingBlock.Html.html()) ,
                            //data: "{ name: 'test', html: args.buildingBlock.Name }",
                                type: "POST",
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                cache: true,
                                async: true,
                                success: function (e) {

                                    console.log("InsertBuildingBlock success");
                                }

                            });

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
                          if(e.count != "0") {
                            args.buildingBlocks = e.blocks[0];
                            console.log("GetBuildingBlocks success:"+ e);
                          }
                        },
                        error: function (e) {
                            console.log("GetBuildingBlocks Failed:"+ e);
                        }
                    });
                },
                    OnEditBuildingBlock: function (args) {

                        //Save to Server
                        if (args.buildingBlock != null) {
                            //args.buildingBlock.Name; 
                            //args.buildingBlock.Html;
                            //console.log("/pms/io/publish/getEditorData/?BMS_REQ_TK==WebSecurityManager.getCSRFToken_HREF(session)%>&type=addBlock");
                            console.log("Block Id:" + args.buildingBlock.Id);
                            console.log("Block Name:" + args.buildingBlock.Name);
                            // var URL = "/pms/io/publish/saveEditorData/?&type=renameBlock";
                            // $.post(URL, {
                            //    blockId: args.buildingBlock.Id,
                            //    name: args.buildingBlock.Name,
                            //    type: "renameBlock"
                            // })
                            // .done(function (data) {
                            //    console.log("RenameBuilding block success:" + data);
                            //    // your code go here. 
                            // });

                            $.ajax({
                                url: "/pms/io/publish/saveEditorData/?&type=renameBlock&name=" + args.buildingBlock.Name + "&blockId=" + args.buildingBlock.Id,
                                //data: "{ name: 'test', html: args.buildingBlock.Name }",
                                type: "POST",
                                contentType: "application/json; charset=latin1",
                                dataType: "json",
                                cache: false,
                                async: false,
                                success: function (e) {
                                    console.log("RenameBuilding success:" + e);
                                    //LoadBuildingBlocks();
                                },
                                error: function (e) {
                                    console.log("RenameBuilding failed:" + e);
                                }

                            });

                        }


                    },
                    OnDeleteBuildingBlock: function (args) {
                        if (args != null) {
                            console.log(args.buildingBlock.Id);

                            $.ajax({
                                url: "/pms/io/publish/saveEditorData/?&type=deleteBlock&blockId=" + args.buildingBlock.Id,
                                //data: "{ name: 'test', html: args.buildingBlock.Name }",
                                type: "POST",
                                contentType: "application/json; charset=latin1",
                                dataType: "json",
                                cache: false,
                                async: false,
                                success: function (e) {
                                    console.log("delete building block success:" + e);
                                    //LoadBuildingBlocks();
                                },
                                error: function (e) {
                                    console.log("delete building block failed:" + e);
                                }

                            });
                        }
                    },


                    LoadMyColors: function (args) {
                        //GetBuildingBlocks

                        $.ajax({
                        url: "/pms/io/publish/getEditorData/?<%=WebSecurityManager.getCSRFToken_HREF(session)%>&type=listColors",
                            data: "{}",
                            type: "POST",
                            contentType: "application/json; charset=latin1",
                            dataType: "json",
                            cache: false,
                            async: false,
                            success: function (e) {
                                args.myColors = e.colors;
                                console.log("MyColors success:" + e.colors);
                            },
                            error: function (e) {
                                console.log("MyColors Failed:" + e);
                            }
                        });
                    },

                    OnColorAdded: function (args) {
                        console.log("Color to be added:" + args.AddedColor);
                        console.log("Color Already added:" + args.myColorsFromServiceGlobal);

                        var saveColors = "";
                        if (args.myColorsFromServiceGlobal == "") {
                            saveColors = args.AddedColor;
                        }
                        else {
                            saveColors = args.myColorsFromServiceGlobal + "," + args.AddedColor;
                        }
                        console.log("Color list to be added:" + saveColors);

                        saveColors = encodeURIComponent(saveColors);
                        console.log("Color list to be added after encoded:" + saveColors);
                        var URL = "/pms/io/publish/saveEditorData/?<%=WebSecurityManager.getCSRFToken_HREF(session)%>&type=saveColors&colors=" + saveColors ;
                        $.post(URL)
                        .done(function (data) {
                            console.log("Insert My Color success:" + data);
                            // your code go here. 
                        });

                    },
                    OnDynamicControlSave: function (variation) {

                        console.log("Variation Name:" + variation.Label);
                    var URL = "/pms/io/publish/saveDynamicVariation/?<%=WebSecurityManager.getCSRFToken_HREF(session)%>&type=new&contentType=H&label=" + variation.Label ;

                        $.ajax({
                            url: URL,
                            //data: "{ name: 'test', html: args.buildingBlock.Name }",
                            type: "POST",
                            contentType: "application/json; charset=latin1",
                            dataType: "json",
                            cache: false,
                            async: false,
                            success: function (e) {
                                console.log("Insert Dynamic Variation success:" + e);
                                //var results = e.split(",");
                                console.log("Dynamic number is:" + e[1]);

                                var dynamicNumber = e[1];
                                if (dynamicNumber != "err") {
                                    var contents = variation.ListOfDynamicContents;
                                    for (var i = 0; i < contents.length; i++) {
                                        var content = contents[i];
                                    var contentURL = "/pms/io/publish/saveDynamicVariation/?<%=WebSecurityManager.getCSRFToken_HREF(session)%>&type=newContent&dynamicNumber="+ dynamicNumber+"&campaignSubject="+ content.Label + "&contents=&contentLabel="+ content.Label +"&isDefault=" + (content.IsDefault ? "Y" : "N");
                                        $.ajax({
                                            url: contentURL,
                                            //data: "{ name: 'test', html: args.buildingBlock.Name }",
                                            type: "POST",
                                            contentType: "application/json; charset=latin1",
                                            dataType: "json",
                                            cache: false,
                                            async: false,
                                            success: function (ec) {
                                                console.log("Insert Dynamic Variation Content success:" + ec);
                                                console.log("Dynamic number Content is:" + ec[1]);
                                                var dynamicNumberContent = ec[1];
                                                if (dynamicNumberContent != "err") {
                                                    var rules = content.ListOfDynamicRules;
                                                var contentRuleURL = "/pms/io/publish/saveDynamicVariation/?<%=WebSecurityManager.getCSRFToken_HREF(session)%>&type=updateContentRules&dynamicNumber="+ dynamicNumber+"&contentNumber=" + dynamicNumberContent + "&applyRuleCount=" + content.ApplyRuleCount + "&ruleCount=" + rules.length;
                                                    for (var j = 0; j < rules.length; j++) {
                                                        var rule = rules[j];
                                                        //contentRuleURL += "&"+ j +".spanInDays=";
                                                        contentRuleURL += "&" + j + ".matchValue=" + rule.RuleMatchValue;
                                                        contentRuleURL += "&" + j + ".fieldName=" + rule.RuleFieldName;
                                                        contentRuleURL += "&" + j + ".dateFormat=" + rule.RuleDefaultValue;
                                                        contentRuleURL += "&" + j + ".rule=" + rule.RuleCondition;
                                                        //contentRuleURL += "&"+ j +".listNumber=";
                                                    }
                                                    $.ajax({
                                                        url: contentRuleURL,
                                                        //data: "{ name: 'test', html: args.buildingBlock.Name }",
                                                        type: "POST",
                                                        contentType: "application/json; charset=latin1",
                                                        dataType: "json",
                                                        cache: false,
                                                        async: false,
                                                        success: function (e) {
                                                            console.log("Insert Dynamic Variation Content Rule success:" + e);

                                                        },
                                                        error: function (e) {
                                                            console.log("Insert Dynamic Variation Rule failed:" + e);
                                                        }
                                                    });

                                                }
                                            },
                                            error: function (e) {
                                                console.log("Insert Dynamic Variation Content failed:" + e);
                                            }
                                        });
                                    }
                                }
                            },
                            error: function (e) {
                                console.log("Insert Dynamic Variation failed:" + e);
                            }

                        });

                    },
                    LoadDynamicBlocks: function (args) {
                        //GetDynamicBlocks

                        $.ajax({
                        url: "/pms/io/publish/getDynamicVariation/?<%=WebSecurityManager.getCSRFToken_HREF(session)%>&type=list",
                            data: "{}",
                            type: "POST",
                            contentType: "application/json; charset=latin1",
                            dataType: "json",
                            cache: false,
                            async: false,
                            success: function (e) {
                                if (e.variations != undefined) {
                                    args.dynamicBlocks = e.variations[0];
                                    console.log("GetDynamicBlocks success:" + e.data);
                                }
                            },
                            error: function (e) {
                                console.log("GetDynamicBlocks Failed:" + e);
                            }
                        });
                    },
                    LoadDynamicBlockFields: function (args) {
                        //GetDynamicBlocks

                        $.ajax({
                        url: "/pms/io/getMetaData/?<%=WebSecurityManager.getCSRFToken_HREF(session)%>&type=fields_all",
                            data: "{}",
                            type: "POST",
                            contentType: "application/json; charset=latin1",
                            dataType: "json",
                            cache: false,
                            async: false,
                            success: function (e) {
                                args.dynamicBlockFields = e;
                                console.log("LoadDynamicBlockFields success:" + e);

                            },
                            error: function (e) {
                                console.log("LoadDynamicBlockFields Failed:" + e);
                            }
                        });
                    },
                    LoadDynamicBlockRuleConditions: function (args) {
                        //GetDynamicBlocks

                        $.ajax({
                        url: "/pms/io/getMetaData/?<%=WebSecurityManager.getCSRFToken_HREF(session)%>&type=rules",
                            data: "{}",
                            type: "POST",
                            contentType: "application/json; charset=latin1",
                            dataType: "json",
                            cache: false,
                            async: false,
                            success: function (e) {
                                args.dynamicBlockRuleConditions = e;
                                console.log("LoadDynamicBlockRuleConditions success:" + e);

                            },
                            error: function (e) {
                                console.log("LoadDynamicBlockRuleConditions Failed:" + e);
                            }
                        });
                    },
                    LoadDynamicBlockFormats: function (args) {
                        //GetDynamicBlocks

                        $.ajax({
                        url: "/pms/io/getMetaData/?<%=WebSecurityManager.getCSRFToken_HREF(session)%>&type=formats",
                            data: "{}",
                            type: "POST",
                            contentType: "application/json; charset=latin1",
                            dataType: "json",
                            cache: false,
                            async: false,
                            success: function (e) {
                                args.dynamicBlockFormats = e;
                                console.log("LoadDynamicBlockFormats success:" + e);

                            },
                            error: function (e) {
                                console.log("LoadDynamicBlockFormats Failed:" + e);
                            }
                        });
                    },
                    LoadPersonalizeTags: function (args) {
                        //GetDynamicBlocks

                        $.ajax({
                        url: "/pms/io/getMetaData/?<%=WebSecurityManager.getCSRFToken_HREF(session)%>&type=merge_tags",
                            data: "{}",
                            type: "POST",
                            contentType: "application/json; charset=latin1",
                            dataType: "json",
                            cache: false,
                            async: false,
                            success: function (e) {
                                args.personalizeTags = e;
                                console.log("LoadPersonalizeTags success:" + e);

                            },
                            error: function (e) {
                                console.log("LoadPersonalizeTags Failed:" + e);
                            }
                        });
                    },
                    CallBackSaveMethod: function (templateHTML, outputHTML) {
                        console.log("TemplateHTML:" + templateHTML);
                        console.log("OutputHTML:" + outputHTML);
                    }
                    , OnExistingDynamicControlDropped: function () {

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
    function applyborder(border_of) {

        var border_type = $(".ddlBorderType").val();
        $element = $(".borderControl .ved-edge-inner");
        var border_width = Number($(".ddlBorderWidth").val());
        var box_height = Number($element.height());
        var box_width = Number($element.width());

        var is_bordery_applied = $element.css("border-" + border_of + "-width").split("px");

        //alert(is_bordery_applied);



        var string = border_width + "px " + border_type + " #000";

        if (border_of == "top") {


            if (is_bordery_applied[0] == 0) {

                $element.css("border-top", string);

                borderTopWidth = $element.css("border-top-width").split("px");
                borderTopWidth = Number(borderTopWidth[0]);


                borderBottomWidth = $element.css("border-bottom-width").split("px");
                borderBottomWidth = Number(borderBottomWidth[0]);

                TotalBorderTopBottom = borderTopWidth + borderBottomWidth;

                $element.css("height", 48 - TotalBorderTopBottom + "px");

                $(".borderControl #top").css("background-color", "#ccc");
            } else {

                $element.css("border-top", "none");
                $element.css("height", box_height + borderTopWidth + "px");
                $(".borderControl #top").css("background-color", "transparent");

            }
        }

        if (border_of == "bottom") {

            if (is_bordery_applied[0] == 0) {

                $element.css("border-bottom", string);

                borderTopWidth = $element.css("border-top-width").split("px");
                borderTopWidth = Number(borderTopWidth[0]);

                borderBottomWidth = $element.css("border-bottom-width").split("px");
                borderBottomWidth = Number(borderBottomWidth[0]);

                TotalBorderTopBottom = borderTopWidth + borderBottomWidth;


                $element.css("height", 48 - TotalBorderTopBottom + "px");

                $(".borderControl #bottom").css("background-color", "#ccc");
            } else {

                $element.css("border-bottom", "none");
                $element.css("height", box_height + borderBottomWidth + "px");
                $(".borderControl #bottom").css("background-color", "transparent");

            }

        }

        if (border_of == "left") {

            if (is_bordery_applied[0] == 0) {

                $element.css("border-left", string);

                borderLeftWidth = $element.css("border-left-width").split("px");
                borderLeftWidth = Number(borderLeftWidth[0]);

                borderRightWidth = $element.css("border-right-width").split("px");
                borderRightWidth = Number(borderRightWidth[0]);

                TotalBorderLeftRight = borderLeftWidth + borderRightWidth;


                $element.css("width", 48 - TotalBorderLeftRight + "px");

                $(".borderControl #left").css("background-color", "#ccc");
            } else {

                $element.css("border-left", "none");
                $element.css("width", box_width + borderBottomWidth + "px");
                $(".borderControl #left").css("background-color", "transparent");

            }

        }

        if (border_of == "right") {

            if (is_bordery_applied[0] == 0) {

                $element.css("border-right", string);

                borderLeftWidth = $element.css("border-left-width").split("px");
                borderLeftWidth = Number(borderLeftWidth[0]);

                borderRightWidth = $element.css("border-right-width").split("px");
                borderRightWidth = Number(borderRightWidth[0]);

                TotalBorderLeftRight = borderLeftWidth + borderRightWidth;


                $element.css("width", 48 - TotalBorderLeftRight + "px");

                $(".borderControl #right").css("background-color", "#ccc");
            } else {

                $element.css("border-right", "none");
                $element.css("width", box_width + borderBottomWidth + "px");
                $(".borderControl #right").css("background-color", "transparent");

            }
        }

    }

    function applyPadding(padding_of) {

        $element = $(".paddingControl .ved-edge-inner");
        $elementH = $element.height();
        $elementW = $element.width();

        $elementPreview = $(".edge-text-preview");

        var paddingInt = Number($(".paddingInt").val());



        if (padding_of == "top") {

            $elementPaddingTop = $element.css("padding-top").split("px");
            $elementPaddingTop = Number($elementPaddingTop[0]);


            if ($elementPaddingTop == 0) {

                $element.css("padding-top", paddingInt + "px");

                $elementPaddingTop = $element.css("padding-top").split("px");
                $elementPaddingTop = Number($elementPaddingTop[0]);

                $elementPaddingBottom = $element.css("padding-bottom").split("px");
                $elementPaddingBottom = Number($elementPaddingBottom[0]);

                $elementPaddingTobBottom = $elementPaddingTop + $elementPaddingBottom;

                $element.css("height", 48 - $elementPaddingTobBottom + "px");
                $elementPreview.css("height", 48 - $elementPaddingTobBottom + "px");

                $(".paddingControl #top").css("background-color", "#ccc");

            } else {

                $elementPaddingTop = $element.css("padding-top").split("px");
                $elementPaddingTop = Number($elementPaddingTop[0]);
                $element.css("padding-top", "0px");

                $element.css("height", $elementH + $elementPaddingTop + "px");
                $elementPreview.css("height", $elementH + $elementPaddingTop + "px");

                $(".paddingControl #top").css("background-color", "transparent");
            }

        }

        if (padding_of == "bottom") {

            $elementPaddingBottom = $element.css("padding-bottom").split("px");
            $elementPaddingBottom = Number($elementPaddingBottom[0]);


            if ($elementPaddingBottom == 0) {

                $element.css("padding-bottom", paddingInt + "px");

                $elementPaddingTop = $element.css("padding-top").split("px");
                $elementPaddingTop = Number($elementPaddingTop[0]);

                $elementPaddingBottom = $element.css("padding-bottom").split("px");
                $elementPaddingBottom = Number($elementPaddingBottom[0]);

                $elementPaddingTobBottom = $elementPaddingTop + $elementPaddingBottom;

                $element.css("height", 48 - $elementPaddingTobBottom + "px");
                $elementPreview.css("height", 48 - $elementPaddingTobBottom + "px");

                $(".paddingControl #bottom").css("background-color", "#ccc");

            } else {

                $elementPaddingTop = $element.css("padding-bottom").split("px");
                $elementPaddingTop = Number($elementPaddingTop[0]);
                $element.css("padding-bottom", "0px");

                $element.css("height", $elementH + $elementPaddingTop + "px");
                $elementPreview.css("height", $elementH + $elementPaddingTop + "px");

                $(".paddingControl #bottom").css("background-color", "transparent");
            }

        }

        if (padding_of == "left") {

            $elementPaddingLeft = $element.css("padding-left").split("px");
            $elementPaddingLeft = Number($elementPaddingLeft[0]);


            if ($elementPaddingLeft == 0) {

                $element.css("padding-left", paddingInt + "px");

                $elementPaddingLeft = $element.css("padding-left").split("px");
                $elementPaddingLeft = Number($elementPaddingLeft[0]);

                $elementPaddingRight = $element.css("padding-right").split("px");
                $elementPaddingRight = Number($elementPaddingRight[0]);

                $elementPaddingLeftRight = $elementPaddingLeft + $elementPaddingRight;

                $element.css("width", 48 - $elementPaddingLeftRight + "px");
                $elementPreview.css("width", 48 - $elementPaddingLeftRight + "px");

                $(".paddingControl #left").css("background-color", "#ccc");

            } else {

                $elementPaddingLeft = $element.css("padding-left").split("px");
                $elementPaddingLeft = Number($elementPaddingLeft[0]);
                $element.css("padding-left", "0px");

                $element.css("width", $elementW + $elementPaddingLeft + "px");
                $elementPreview.css("width", $elementW + $elementPaddingLeft + "px");

                $(".paddingControl #left").css("background-color", "transparent");
            }

        }

        if (padding_of == "right") {

            $elementPaddingRight = $element.css("padding-right").split("px");
            $elementPaddingRight = Number($elementPaddingRight[0]);


            if ($elementPaddingRight == 0) {

                $element.css("padding-right", paddingInt + "px");

                $elementPaddingLeft = $element.css("padding-left").split("px");
                $elementPaddingLeft = Number($elementPaddingLeft[0]);

                $elementPaddingRight = $element.css("padding-right").split("px");
                $elementPaddingRight = Number($elementPaddingRight[0]);

                $elementPaddingLeftRight = $elementPaddingLeft + $elementPaddingRight;

                $element.css("width", 48 - $elementPaddingLeftRight + "px");
                $elementPreview.css("width", 48 - $elementPaddingLeftRight + "px");

                $(".paddingControl #right").css("background-color", "#ccc");

            } else {

                $elementPaddingRight = $element.css("padding-right").split("px");
                $elementPaddingRight = Number($elementPaddingRight[0]);
                $element.css("padding-right", "0px");

                $element.css("width", $elementW + $elementPaddingLeft + "px");
                $elementPreview.css("width", $elementW + $elementPaddingRight + "px");

                $(".paddingControl #right").css("background-color", "transparent");
            }

        }

    }

    function addNewRule() {

        var html = $("#dcRuleRow").html();

        $(".dynamic_inputs_list").append(html);

    }


</script>

