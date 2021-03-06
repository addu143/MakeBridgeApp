//[ -------------------------  Sohaib -----------------------------------]



// For Image Titling Dialog
function openImageTitleDialog(uiElement) {
    $("#imageTitleDialog").dialog({
        closeOnEscape: false,
        autoOpen: false,
        modal: true,
        //z-index: 500,
        buttons: {
            "Set Title": function () {

                this.imageNewTitle = $("#imageTitleDialog").find("#imageTitleText").val().trim();
                $(uiElement).parent().parent().parent().find("img").attr("title", this.imageNewTitle);
                $("#imageTitleDialog").dialog("close");
                
            },
            Cancel: function () {
                $("#imageTitleDialog").dialog("close");
                
            }
        },

        width: 450
    });

    $("#imageTitleDialog").find("#imageTitleText").val("");
    $("#imageTitleDialog").dialog("open");
}

function attachLinkWithElement(workingObject) {    

    if ($("#rightPanelArea").data("tabClicked") == "hyperlink") {
        
        var myLink = $("#linkHyperLinkURL").val() + "?campaignkw=" + $("#linkName").val()
        if ($(workingObject).parent().parent().parent().find("img.imageHandlingClass").parent().is("a")) {
            $(workingObject).parent().parent().parent().find("a").data("link", myLink);
        }
        else {
            $(workingObject).parent().parent().parent().find("img.imageHandlingClass").wrap("<a href='#'></a>");
            $(workingObject).parent().parent().parent().find("a").data("link", myLink);
        }
    } else if ($("#rightPanelArea").data("tabClicked") == "mailto") {
        var myEmailId = $("#emailAddText").val();
        var myEmailSubject = $("#emailSubjText").val();
        var query = "mailto"+":" + myEmailId + "?subject=" + myEmailSubject;
        if ($(workingObject).parent().parent().parent().find("img.imageHandlingClass").parent().is("a")) {
            $(workingObject).parent().parent().parent().find("a").data("link", query);
        }
        else {
            $(workingObject).parent().parent().parent().find("img.imageHandlingClass").wrap("<a href='#'></a>");
            $(workingObject).parent().parent().parent().find("a").data("link", query);
        }
    }
    
}



// Load Text Inline Text Editor
function LoadEditor(args)
{
    tinymce.init({
        selector: "div.textcontent",
        theme: "modern",
        plugins: 'link',
        script_url: '/scripts/libs/tinymce/tinymce.js',
        toolbar1: "fontselect fontsizeselect | forecolor backcolor | bold italic underline strikethrough | subscript superscript | alignleft aligncenter alignright alignjustif | bullist numlist | table preview ",
        toolbar2: "mybutton123",
        link_list: [
        {title: 'My page 1', value: 'http://www.tinymce.com'},
        {title: 'My page 2', value: 'http://www.moxiecode.com'}
        ],
        setup: function (editor) {
            /*editor.addButton('mybutton', {
                type: 'listbox',
                title: 'Links',
                text: 'Links',
                icon: false,
                onselect: function(e) {
                    //editor.insertContent(this.value());
                    $("#linkTrack").data("linkObject", "text");
                    $("#imageLinkDialog").load("AddLinkScreen.html", function () {
                        if (tinyMCE.activeEditor.selection.getContent({ format: 'text' }) != "") {
                            $("#linkTextArea").val(tinyMCE.activeEditor.selection.getContent({ format: 'text' }));
                            $("#currTinyMCE").data("myTinyMCE", tinyMCE.activeEditor.selection);
                            if (tinyMCE.activeEditor.selection.getNode().nodeName == "a") {
                                var previousLink = tinyMCE.activeEditor.selection.getNode().getAttribute("data");
                                $("#linkHyperLinkURL").val(previousLink);
                            }
                            else {
                                $("#linkHyperLinkURL").val("");
                            }                            
                        }
                    }).dialog("open");
                },
                values: [
                    {text: 'Link', value: 'Link'}/*,
                    {text: 'Menu item 2', value: 'Some text 2'},
                    {text: 'Menu item 3', value: 'Some text 3'}*/
                /*],
                onPostRender: function() {
                    // Select the second item by default
                    //this.value('');
                }
            });*/
            editor.addButton('mybutton123', {
                type: 'listbox',
                title: 'Personalize',
                text: 'Personalize',
                icon: false,
                onselect: function (e) {
                    editor.insertContent(this.value());
                },
                values: [
                    { text: 'Personalize', value: '' },
                    { text: 'Email', value: '@EMAIL@' },
                    { text: 'First Name', value: '@First Name@' },
                    { text: 'Full Name', value: '@Full Name@' },
                    { text: 'Gender', value: '@Gender@' },
                    { text: 'Last Name', value: '@Last Name@' },
                    { text: 'Post Code', value: '@Post Code@' },
                    { text: 'Sender Address', value: '@Sender Address@' }
                ],
                onPostRender: function () {
                    // Select the second item by default
                    //this.value('Some text 2');
                }
            });
        },
        //theme_modern_buttons2: "exapmle Mybutton",
        toolbar_items_size: 'small',
        menubar: false,
        schema: "html5",
        inline: true,
        statusbar: false,
        object_resizing: false
    });

}
/*
tinyMCE.activeEditor.selection.getContent({ format: 'text' }) // To get the Selected Text
tinymce.activeEditor.execCommand('mceInsertContent', false, "some text"); // to Add some text at the place of curser
*/
//////////////////////////////////////////////////////////////////////////////////////////////////////

 //.................... Send Server Request ................................
function SendServerRequest(requestProperties, errorCallBack) {
    var returnJson;
    
    $.ajax({
        url: requestProperties.Url,
        data: requestProperties.Data,
        type: requestProperties.Type,
        contentType: requestProperties.ContentType,
        dataType: requestProperties.DataType,
        cache: false,
        async: false,
        success: function (e) {
            console.log("Response Came:"+e);
            returnJson = e;
        },
        error: errorCallBack
    });
    //console.log(returnJson);
    return returnJson;
}
// .................... Send Server Request ................................

function filterImages(query, obj) {
    var new_obj = {}, total = 0, query = query.toLowerCase();
    for (var i in obj) {
        var imageName = obj[i].Name.toLowerCase();
        if (imageName == query) { new_obj[i] = obj[i]; total++; }
    }

    return new_obj;
}

function getImagesMarkup(obj) {
    var imagesMarkup = "";
    $.each(obj[0], function(index, val) {     
        console.log(val[0].fileName); 
        console.log(val[0]["imageId.encode"]);
        //console.log(val[0].imageId); 
         
        var j = index + 1;
        var li = "<li class='draggableControl droppedImage' data-type='droppedImage'>";

        li += "<img title='" + val[0].tags + "' src='" + val[0].thumbURL + "' data-Id='" + val[0]["imageId.encode"] + "' data-tags='" + val[0].tags + "' data-name='" + val[0].fileName + "' /><label>+</label><br />";
        li += "<span class=' font_75'>" + val[0].fileName + "<img src='images/delete-ico.png' /></span></li>";
        imagesMarkup = imagesMarkup + li;   
    })

  /*  for (var i = 0; i < obj.length; i++) {
        var j = i + 1;
        var li = "<li class='draggableControl droppedImage' data-type='droppedImage'>";

        li += "<img title='" + obj[i].tags + "' src='images/upload-images/" + obj[i].thumbURL + "' data-Id='" + obj[i].imageId_encode + "' data-tags='" + obj[i].tags + "' data-name='" + obj[i].name + "' /><label>+</label><br />";
        li += "<span class=' font_75'>" + obj[i].name + "<img src='images/delete-ico.png' /></span></li>";
        imagesMarkup = imagesMarkup + li;
    }*/
    return imagesMarkup;
}