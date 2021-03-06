
    // DOM Ready
   
    var DefaultImage = "images/sample.jpg"
    
var topHandlersHTML = "<div class='topHandlers'><ul><li class='myHandlerDelete'><img src='images/delete.png' />  </li><li class='myHandlerCopy'><img src='images/copy.png' /></li><li class='myHandle'><img src='images/move.png' /></li></ul></div>";

$.fn.extend({

    MakeBridgeEditor: function (options) {
                        
        var undoManager = new MakeBridgeUndoRedoManager();

        //Getting View with the help of Backbone:
        var MainHtmlView = Backbone.View.extend({
            my_template: _.template($("#tmpMakeBridgeContainer").html()),
            initialize: function () {
                //The "render()" function will load our template into the view's "el" property using jQuery below :)
                this.render();
            },

            render: function () {
                this.$el.html(this.my_template);
            }

        });

        var mainView = new MainHtmlView();

        this.html(mainView.el);
        var myElement = this;

       
        

        //TODO Styles
        //--Muhammad Adnan -----------------------STYLES ----------------------------//
        var IsStyleActivated = false;
        var SelectedElementForStyle = null;
        var borderColor = "#000";        
        var chkChangeAllMatching = myElement.find(".chkChangeAllMatching");
        var templateColors = myElement.find(".templateColors");
        var mainContentHtmlGrand = myElement.find(".mainContentHtmlGrand");
        var myColorsFromServiceGlobal = "";
        var txtColorCode = myElement.find(".txtColorCode");
        var ulMyColors = myElement.find(".myColors");
        var personalizedTagsGlobal = "";
        // var firstTime = true;
        // Sarmad Ali //
        var RegisterObject = function(source, object, destination, type, index){
            this.sourceObj = source;
            this.currentObj = object;
            this.destObj = destination;
            this.typeObj = type;
            this.index = index;
        };
          

        if(options.preDefinedHTML != null && options.preDefinedHTML != "" ) {

            console.log("PRE-DEFINED HTML:" + options.preDefinedHTML);
            mainContentHtmlGrand.html(options.preDefinedHTML);
            initializeWholeSystem();

        }
        function makeCloneAndRegister() {
            var mainTable = myElement.find(".mainTable").clone(true);
            undoManager.registerAction(mainTable);
            return false;
        }

        function initializeWholeSystem(){

            var args = {
                predefinedControl: new Object()
            }
            args.predefinedControl = {
                Html: mainContentHtmlGrand
            }

            ReInitializeDragDropHoverAll(mainContentHtmlGrand);
            InitializePluginsEvents(args.predefinedControl.Html);
        //     // InitializeWithDropable();
        //     InitializeClickEvent(args);
        //     // InitializeMouseHover();
        //     // InitializeImageDroppedEvent(args);
        //     //InitializeElementWithDraggable();
        //     //InitializeMainDraggableControls();
        //     InitializeElementsForStyle();
        //     InitializeDeleteButtonOnElement(args.predefinedControl.Html);
        //     InitializeCopyButtonOnElement(args.predefinedControl.Html);
        //     //InitializeBuildingBlockDroppableArea();
        //     //InitializeBuildingBlockUpdatePopup();
        //     // InitializeControls();
        //     InitializeStyleControls()
        //     //InitializePreviewControls();
            

        }    

        
        
        //undoManager.registerAction();
        makeCloneAndRegister();
        var mainObj = $(myElement.find(".mainTable"));
        //Bind Undo redo Functionality 
        $(".undo").click(function () {
            var replaceObj = undoManager.undo();            
            //undoManager.registerAction(myElement.find(".mainTable").html());
            if (replaceObj != null) {
                myElement.find(".mainTable").outerHTML(replaceObj);
                //mainObj = $(myElement.find(".mainTable"));
                //mainObj = replaceObj;
            }
        });
        $(".redo").click(function () {
            var replaceObj = undoManager.redo();
            myElement.find(".mainTable").outerHTML(replaceObj);
            //mainObj = replaceObj;
        });

        function InitializeElementsForStyle(isActive) {
            
            if (!isActive) {

                RemoveAllOutline();

                IsStyleActivated = false;

                SelectedElementForStyle = null;

                InitializePluginsEvents(myElement);


            }
            else {

                DestroyPluginsEvents(myElement);

                IsStyleActivated = true;

                //Selection
                myElement.find(".csHaveData td").click(function (event) {
                    if (IsStyleActivated) {
                        event.stopPropagation(); //Stop bubbling

                        RemoveAllOutline();

                        $(this).css("outline", "2px solid #6298be");

                        SelectedElementForStyle = $(this);


                        //--------------Background Layers-------------//
                        var isGetGrandParent = false;

                        var ddlBackgroundLayers = myElement.find(".ddlBackgroundLayers");
                        ddlBackgroundLayers.find("option").remove();

                        ddlBackgroundLayers.append(
                                      $('<option></option>').val("-1").html("Select Background Layer"));


                        //Add Self
                        ddlBackgroundLayers.append(
                                        $('<option></option>')
                                        .val(SelectedElementForStyle.prop("tagName"))
                                        .html("Background " + SelectedElementForStyle.prop("tagName"))
                                        .data("el", SelectedElementForStyle)
                                    );
                        
                        SelectedElementForStyle.parents().each(function (index, element) {

                            if (!isGetGrandParent)
                            {
                                if ($(element).hasClass("mainContentHtmlGrand")) {
                                    isGetGrandParent = true;
                                }
                                
                                if ($(element).prop("tagName") === "TD") {
                                 
                                    ddlBackgroundLayers.append(
                                        $('<option></option>')
                                        .val($(element).prop("tagName"))
                                        .html("Background " + $(element).prop("tagName"))
                                        .data("el", $(element))
                                    );
                                }
                                
                            }
                            
                        });

                        //////////////////////////////////////////////////
                    }
                });
                //////////////////////

                //Border
                myElement.find(".sBorderLine").click(function () {

                    if (SelectedElementForStyle != null) {
                        
                        var type = $(this).data("type").toLowerCase();

                        if ($(this).hasClass("active")) {
                            
                            $(this).removeClass("active");
                            SelectedElementForStyle.removeInlineStyle("border-" + type);
                        }
                        else {
                            
                            $(this).addClass("active");
                            var borderType = myElement.find(".ddlBorderType").val();
                            var borderWidth = myElement.find(".ddlBorderWidth").val();
                            SelectedElementForStyle.css("border-" + type, borderWidth + "px " + borderType + " " + borderColor);
                        }
                       // undoManager.registerAction(mainContentHtmlGrand.html());    
                    }
                });
                //////////////////////

                //Padding
                myElement.find(".sPadding").click(function () {

                    if (SelectedElementForStyle != null) {
                        var type = $(this).data("type").toLowerCase();

                        if ($(this).hasClass("active")) {
                            $(this).removeClass("active");
                            SelectedElementForStyle.removeInlineStyle("padding-" + type);
                        }
                        else {
                            $(this).addClass("active");
                            var paddingValue = myElement.find(".ddlPadding").val();                            
                            SelectedElementForStyle.css("padding-" + type, paddingValue + "px");
                        }
                      //  undoManager.registerAction(mainContentHtmlGrand.html());
                    }
                });
                //////////////////////

                //Background Layers
                var ddlBackgroundLayers = myElement.find(".ddlBackgroundLayers");
                ddlBackgroundLayers.find("option").remove();

                ddlBackgroundLayers.append(
                                       $('<option></option>').val("-1").html("Select Background Layer"));
                
                
                ddlBackgroundLayers.append(
                                       $('<option></option>')
                                       .val(mainContentHtmlGrand.prop("tagName"))
                                       .html("Background " + mainContentHtmlGrand.prop("tagName"))
                                       .data("el", mainContentHtmlGrand)
                                   );

                ddlBackgroundLayers.on('change', function () {
                    
                    if ($(this).find(':selected').val() != "-1") {
                        RemoveAllOutline();
                        SelectedElementForStyle = $(this).find(':selected').data('el');
                        SelectedElementForStyle.css("outline", "2px solid #6298be");
                       // undoManager.registerAction(mainContentHtmlGrand.html());
                    }
                });
                ///////////////////////

                //Email Width
                myElement.find(".btnContainerSize").click(function () {
                    var value = $(this).data("value");
                    mainContentHtmlGrand.css("width", value + "px");
                    undoManager.registerAction(mainContentHtmlGrand.html());
                });

                myElement.find(".txtContainerSize").keyup(function (e) {
                    mainContentHtmlGrand.css("width", $(this).val() + "px");
                   // undoManager.registerAction(mainContentHtmlGrand.html());
                });
                ///////////////////////


                //Add to Colors
                myElement.find(".addToMyColors").click(function(){
                    if (!txtColorCode.isEmpty()) {

                        
                        var args = new Object();
                       

                        args.AddedColor = txtColorCode.val();
                        args.myColorsFromServiceGlobal = myColorsFromServiceGlobal;
                         //Call overridden Method here: will use when exposing properties to developer
                        if (options.OnColorAdded != null) {                    
                            options.OnColorAdded(args);
                        }

                        _LoadMyColors();   
                        
                        // ulMyColors.find("li").click(function () {                
                        //         SetBackgroundColor($(this).data("color"));
                        // });

                       

                    };

                });


                //Load Colors
                _LoadMyColors();
            }

           

           
        }
        
        function RemoveAllOutline() {
            myElement.find(".mainContentHtmlGrand").removeInlineStyle("outline");
            myElement.find(".csHaveData td").removeInlineStyle("outline");
        }

        var _LoadMyColors = function (args) {
                
            if (args == null) {
                args = new Object();
            }

            //Call overridden Method here: will use when exposing properties to developer
            if (options.LoadMyColors != null) {                    
                options.LoadMyColors(args);
            }

            //Getting building blocks from provided block:
            if (args.myColors != null) {

                var listOfMyColorsHtml = "" ;
                var myColorsFromService = args.myColors;
                var myColorsArray = myColorsFromService.split(",");
                //$.parseJSON Takes a well-formed JSON string and returns the resulting JavaScript object.
                
                $.each(myColorsArray, function (i, obj) {
                        
                    //Assigning unique ID here:
                    console.log("MyCOlor from AArray: "+ obj);
                    //var block = $("<li style='background-color:"+ obj + ";'></li>");                       

                    
                    listOfMyColorsHtml +="<li style='background-color:"+ obj + ";' data-color='"+ obj+"'></li>";

                   
                });
                //console.log(listOfMyColorsHtml);
                ulMyColors.empty();
                ulMyColors.append(listOfMyColorsHtml);

                 ulMyColors.find("li").click(function(){
                            console.log("li color" + $(this).data("color"));
                            SetBackgroundColor($(this).data("color"));

                 });

                
                myColorsFromServiceGlobal = myColorsFromService;
                    
            }

        }

        function InitializeStyleControls() {
            var colorPickerBackground = myElement.find(".divColorPicker");
           
            
            colorPickerBackground.minicolors({
                change: function (hex, opacity) {
                 
                    SetBackgroundColor(hex);

                    txtColorCode.val(hex);
                },
                inline: true
                
            });

            templateColors.children().first().click(function () {
                
                SetBackgroundColor(null);
            });

            

            $(".minicolors-picker").on("mouseup", function () {

                if (SelectedElementForStyle != null) {

                    var selectedColor = colorPickerBackground.minicolors('value');
                    var li = $("<li></li>").css("background-color", selectedColor).data("selectedColor", selectedColor);

                    li.click(function () {
                        SetBackgroundColor($(this).data("selectedColor"));
                    });

                    templateColors.append(li);
                    //undoManager.registerAction(mainContentHtmlGrand.html());
                }
              
            });
                  
            var colorPickerBorder = myElement.find(".colorPickerBorder");
            colorPickerBorder.minicolors({               
                change: function (hex, opacity) {
                    borderColor = hex;
                },
                inline: false,
                position: 'top left',
                defaultValue: '#000'

            });

            
        }

        var SetBackgroundColor = function (hex) {

            if (hex == null && SelectedElementForStyle != null) {
                //console.log(hex);
                SelectedElementForStyle.removeInlineStyle("background-color");
                return;
            }

            if (IsStyleActivated && SelectedElementForStyle != null) {

                if (chkChangeAllMatching.is(":checked")) {

                    var colorCode = SelectedElementForStyle.css("background-color");

                    mainContentHtmlGrand.find("td").andSelf().filter(function () {
                        return $(this).css("background-color") == colorCode;
                    }).css("background-color", hex);
                }

                SelectedElementForStyle.css("background-color", hex);
               // undoManager.registerAction(mainContentHtmlGrand.html());
            }
        }
        InitializeStyleControls();

        //=============================================================================


        //--Muhammad Adnan ---------------- Dyanamic Contents ------------------------//
        var dynamicBlocksGlobal = "";
        function DynamicVariation() {
            this.DynamicVariationID = 0;
            this.Label = "";
            this.IsUpdate = false;
            this.ListOfDynamicContents = new Array();
        }

        function DynamicContents() {
            this.DynamicVariationID = 0;
            this.DynamicContentID = 0;
            this.Label = "Default";
            this.IsDefault = false;
            this.ApplyRuleCount = "A";
            this.ListOfDynamicRules = new Array();
        }

        function DynamicRules() {
            this.DynamicRuleID = 0;
            this.RuleFieldName = "";
            this.RuleCondition = "";
            this.RuleDefaultValue = "";
            this.RuleMatchValue = "";
        }
        
        //myElement.find(".dcSaveButton").click(function () {
        var dcRulesContainer = myElement.find(".dynamic_inputs_list");
        var dcRuleTemplate = myElement.find(".dcRuleTemplate");
        var dcRulesDialog = myElement.find(".dcRulesDialog");
        var dcRuleLabel = dcRulesDialog.find(".dcRuleLabel");
        
        var PopulateContent = function (args)
        {
            if (args.DynamicVariation != null) {
                var txtVariationName = args.predefinedControl.Html.find(".txtVariationName");
                var dcContents = args.predefinedControl.Html.find(".dcContents");

                txtVariationName.val(args.DynamicVariation.Label);
                txtVariationName.data("isUpdate", true);
                txtVariationName.data("variationID", args.DynamicVariation.DynamicVariationID);

                $.each(args.DynamicVariation.ListOfDynamicContents, function (i, variation) {

                    var ContentLi = $("<li>" + variation.Label + "</li>");
                    ContentLi.data("content", variation);
                    dcContents.append(ContentLi);

                });
            }
        }

        var PopulateRulesWindow = function (args) {
            if (args.DynamicContent != null) {
                
                //Main values
                dcRuleLabel.val(args.DynamicContent.Label);
                
                //Rules
                dcRulesContainer.html("");

                $.each(args.DynamicContent.ListOfDynamicRules, function (i, o) {
                    
                    var ruleTemplate = $(dcRuleTemplate.html());
                    var dcRuleFieldName = ruleTemplate.find(".dcRuleFieldName");
                    var dcRuleCondition = ruleTemplate.find(".dcRuleCondition");
                    var dcRuleFormat = ruleTemplate.find(".dcRuleFormat");
                    var dcRuleMatchValue = ruleTemplate.find(".dcRuleMatchValue");

                    dcRuleFieldName.val(o.RuleFieldName);
                    dcRuleCondition.val(o.RuleCondition);
                    dcRuleFormat.val(o.dcRuleFormat);
                    dcRuleMatchValue.val(o.RuleMatchValue);
                    
                    dcRulesContainer.append(ruleTemplate);

                });

                //dcRulesDialog.find(".rule").each(function (index, object) {
                //    var $this = $(object);

                //    var dcRuleFieldName = $this.find(".dcRuleFieldName");
                //    var dcRuleCondition = $this.find(".dcRuleCondition");
                //    var dcRuleMatchValue = $this.find(".dcRuleMatchValue");

                //    var rule = new DynamicRules();
                //    rule.RuleFieldName = dcRuleFieldName.val();
                //    rule.RuleCondition = dcRuleCondition.val();
                //    rule.RuleMatchValue = dcRuleMatchValue.val();

                //    listOfDynamicRules.push(rule);

                //});

                

                //var content = new DynamicContents();
                //content.Label = dcRuleLabel.val();
                //content.ListOfDynamicRules = listOfDynamicRules;

                
            }
            else {
                console.log("args.DynamicContent is null");
            }
        }
                
        var InitializeDynamicControl = function (args)
        {
            if (args.predefinedControl != null) {

                PopulateContent(args);

                var txtVariationName = args.predefinedControl.Html.find(".txtVariationName");

                //Save Click
                args.predefinedControl.Html.find(".dcSaveButton").click(function () {

                    if (txtVariationName.isEmpty())
                    {
                        alert("Please enter dynamic control name.");
                        return;
                    }
                    else
                    {
                        var variation = new DynamicVariation();
                        variation.Label = txtVariationName.val();
                        
                        if (txtVariationName.data("isUpdate") != null && txtVariationName.data("variationID") != null) {
                            variation.IsUpdate = txtVariationName.data("isUpdate");
                            variation.DynamicVariationID = txtVariationName.data("variationID");
                        }
                        
                        args.predefinedControl.Html.find(".dcContents li").each(function (i, o) {
                            variation.ListOfDynamicContents.push($(o).data("content"));
                        });

                        if (options.OnDynamicControlSave != null) {
                            options.OnDynamicControlSave(variation);
                        }
                        
                        //args.DynamicVariation = variation;
                        //PopulateContent(args);


                        _LoadDynamicBlocks(args);

                    }

                    
                });

                // var PopulateRulesWindow = function (args)
                // {
                //     //myElement.find(".dcRulesDialog").html("adnan");
                // }

                
                //Add Default Content                
                var dcContents = args.predefinedControl.Html.find(".dcContents");
                if (dcContents.is(':empty')) {

                    var defaultContent = new DynamicContents();
                    defaultContent.Label = "Default";
                    defaultContent.IsDefault = true;

                    var defaultContentLi = $("<li>Default</li>");
                    defaultContentLi.data("content", defaultContent);
                    dcContents.append(defaultContentLi);
                }               
                ///////////
                
                args.predefinedControl.Html.find(".dcContents").on("click", "li", (function () {
                    
                    //Show window for rules:
                    args.clickedLi = $(this);
                    args.IsUpdate = false;

                    
                    if (args.clickedLi.data("content") != null)
                    {
                        args.IsUpdate = true;
                        args.DynamicContent = args.clickedLi.data("content");

                        PopulateRulesWindow(args);
                    }

                    OpenRulesWindow(args);

                }));

                var SaveRuleWindow = function (args) {
                   
                    var dcRulesDialog = args.dcRulesDialog;

                    var listOfDynamicRules = new Array();

                    dcRulesDialog.find(".rule").each(function (index, object) {
                        var $this = $(object);

                        var dcRuleFieldName = $this.find(".dcRuleFieldName");
                        var dcRuleCondition = $this.find(".dcRuleCondition");
                        var dcRuleMatchValue = $this.find(".dcRuleMatchValue");

                        var rule = new DynamicRules();
                        rule.RuleFieldName = dcRuleFieldName.val();
                        rule.RuleCondition = dcRuleCondition.val();
                        rule.RuleMatchValue = dcRuleMatchValue.val();

                        listOfDynamicRules.push(rule);

                    });

                    var dcRuleLabel = dcRulesDialog.find(".dcRuleLabel");

                   

                    
                    if (!args.IsUpdate) {
                        //NEW CASE

                        var content = new DynamicContents();
                        content.Label = dcRuleLabel.val();
                        content.ListOfDynamicRules = listOfDynamicRules;
                        
                        var dcContents = args.predefinedControl.Html.find(".dcContents");
                        var newLi = $("<li></li>");
                        newLi.html(content.Label);
                        newLi.data("content", content);

                        dcContents.append(newLi);
                        
                    }
                    else {
                        //UPDATE CASE               
                        var existingContent = args.clickedLi.data("content");
                        existingContent.Label = dcRuleLabel.val();
                        existingContent.ListOfDynamicRules = listOfDynamicRules;

                        args.clickedLi.data("content", existingContent);
                        
                    }

                    RePopulateContentNames(args);
                    
                }

                var RePopulateContentNames = function (args) {
                    var dcContents = args.predefinedControl.Html.find(".dcContents li");
                    dcContents.each(function (i, o) {
                        var content = $(o).data("content");
                        if (content != null) {

                            $(o).html(content.Label);

                        }
                    });
                }

                var OpenRulesWindow = function (args) {
                    
                    var dcRulesDialog = myElement.find(".dcRulesDialog");
                    
                    dcRulesDialog.dialog({
                        width: 990,
                        height: 500,
                        modal: true,
                        buttons: [
                             {
                                 text: "Close",
                                 click: function () {

                                     $(this).dialog('destroy');
                                 },

                             },

                             {
                                 text: "Save",
                                 click: function () {

                                     args.dcRulesDialog = $(this);

                                     SaveRuleWindow(args);

                                     $(this).dialog('destroy');
                                 }
                             }
                        ]
                    }).dialog("open");
                }


                args.predefinedControl.Html.find(".addDynamicRule").click(function () {

                    //Get window for rules:  
                    args.IsUpdate = false;
                    dcRuleLabel.val("");
                    dcRulesContainer.html("");
                    OpenRulesWindow(args);

                });

            }
        }
        //});
        

        var _LoadDynamicBlocks = function (args) {
                
            if (args == null) {
                args = new Object();
            }

            //Call overridden Method here: will use when exposing properties to developer
            if (options.LoadDynamicBlocks != null) {                    
                options.LoadDynamicBlocks(args);
            }

            //Getting building blocks from provided block:
            if (args.dynamicBlocks != null) {

                var listOfDynamicBlocksHtml = $("<div></div>");
                var dynamicBlocksFromService = args.dynamicBlocks;

                //$.parseJSON Takes a well-formed JSON string and returns the resulting JavaScript object.
                $.each(dynamicBlocksFromService, function (i, obj) {
                        
                    //Assigning unique ID here:
                    //obj[0].ID = "buildingBlock" + count;
                    //console.log("DC Label:" + obj[0].label);
                    var block = $("<li class='draggableControl droppedDynamicBlock' data-type='dynamicContentContainer' data-isnew='false' data-id='" + obj[0]["dynamicNumber.encode"] + "'>" +
                                  "<img src='images/custom-blocks.png' /><br />" +
                                  "<span class='font_75 name'>" + obj[0].label + "</span>" +
                                  "</li>");                       

                    //Initialize with default draggable:
                    InitializeMainDraggableControls(block);

                    listOfDynamicBlocksHtml.append(block);

                    
                });
                //console.log(listOfDynamicBlocksHtml);
                var ulDynamicBlocks = myElement.find(".dynamicBlockDroppable .ulDynamicBlocks");
                ulDynamicBlocks.empty();
                ulDynamicBlocks.append(listOfDynamicBlocksHtml);

                dynamicBlocksGlobal = dynamicBlocksFromService;
                    
            }

        }

        var _LoadDynamicBlockFields = function (args) {
                
            if (args == null) {
                args = new Object();
            }

            //Call overridden Method here: will use when exposing properties to developer
            if (options.LoadDynamicBlockFields != null) {                    
                options.LoadDynamicBlockFields(args);
            }

            //Getting building blocks from provided block:
            if (args.dynamicBlockFields != null) {

                var listOfDynamicBlockFieldssHtml = "";
                var dynamicBlockFieldsFromService = args.dynamicBlockFields;

                //$.parseJSON Takes a well-formed JSON string and returns the resulting JavaScript object.
                $.each(dynamicBlockFieldsFromService, function (i, obj) {
                        
                    //Assigning unique ID here:
                    //obj[0].ID = "buildingBlock" + count;
                    //console.log("DC Fiedl:" + obj);
                    if(obj[2] == "true") {
                        listOfDynamicBlockFieldssHtml += "<option value=\""+obj[0]+"\">"+ obj[1]+"</option>";                       
                    }
                    //Initialize with default draggable:
                    //InitializeMainDraggableControls(block);

                    //listOfDynamicBlockFieldssHtml.append(block);

                    
                });
                //console.log(listOfDynamicBlocksHtml);
                var ulDynamicBlockFields = myElement.find(".dcRuleFieldName");
                ulDynamicBlockFields.empty();
                ulDynamicBlockFields.append(listOfDynamicBlockFieldssHtml);

                // dynamicBlocksGlobal = dynamicBlocksFromService;
                    
            }

        }
    
        var _LoadDynamicBlockRuleConditions = function (args) {
                
            if (args == null) {
                args = new Object();
            }

            //Call overridden Method here: will use when exposing properties to developer
            if (options.LoadDynamicBlockRuleConditions != null) {                    
                options.LoadDynamicBlockRuleConditions(args);
            }

            //Getting building blocks from provided block:
            if (args.dynamicBlockRuleConditions != null) {

                var listOfDynamicBlockRuleConditionsHtml = "";
                var dynamicBlockRuleConditionsFromService = args.dynamicBlockRuleConditions;

                //$.parseJSON Takes a well-formed JSON string and returns the resulting JavaScript object.
                $.each(dynamicBlockRuleConditionsFromService, function (i, obj) {
                        
                    //Assigning unique ID here:
                    //obj[0].ID = "buildingBlock" + count;
                    //console.log("DC Fiedl:" + obj);
                    
                    listOfDynamicBlockRuleConditionsHtml += "<option value=\""+obj[0]+"\">"+ obj[1]+"</option>";                       
                    
                    //Initialize with default draggable:
                    //InitializeMainDraggableControls(block);

                    //listOfDynamicBlockFieldssHtml.append(block);

                    
                });
                //console.log(listOfDynamicBlocksHtml);
                var ulDynamicBlockRuleConditions = myElement.find(".dcRuleCondition");
                ulDynamicBlockRuleConditions.empty();
                ulDynamicBlockRuleConditions.append(listOfDynamicBlockRuleConditionsHtml);

                // dynamicBlocksGlobal = dynamicBlocksFromService;
                    
            }

        }


        var _LoadDynamicBlockFormats = function (args) {
                
            if (args == null) {
                args = new Object();
            }

            //Call overridden Method here: will use when exposing properties to developer
            if (options.LoadDynamicBlockFormats != null) {                    
                options.LoadDynamicBlockFormats(args);
            }

            //Getting building blocks from provided block:
            if (args.dynamicBlockFormats != null) {

                var listOfDynamicBlockFormatsHtml = "";
                var dynamicBlockFormatsFromService = args.dynamicBlockFormats;

                //$.parseJSON Takes a well-formed JSON string and returns the resulting JavaScript object.
                $.each(dynamicBlockFormatsFromService, function (i, obj) {
                        
                    //Assigning unique ID here:
                    //obj[0].ID = "buildingBlock" + count;
                    //console.log("DC Fiedl:" + obj);
                    
                    listOfDynamicBlockFormatsHtml += "<option value=\""+obj[0]+"\">"+ obj[1]+"</option>";                       
                    
                    //Initialize with default draggable:
                    //InitializeMainDraggableControls(block);

                    //listOfDynamicBlockFieldssHtml.append(block);

                    
                });
                //console.log(listOfDynamicBlocksHtml);
                var ulDynamicBlockFormats = myElement.find(".dcRuleFormat");
                ulDynamicBlockFormats.empty();
                ulDynamicBlockFormats.append(listOfDynamicBlockFormatsHtml);

                // dynamicBlocksGlobal = dynamicBlocksFromService;
                    
            }

        }

        function loadDynamicVariationFromServer(dynamicVariationID) {
            var dynamicVariation = new DynamicVariation();    
            var URL = "/pms/io/publish/getDynamicVariation/?"+ options.sessionIDFromServer +"&type=get&dynamicNumber=" + dynamicVariationID;
            $.ajax({
                url: URL,
                //data: "{ name: 'test', html: args.buildingBlock.Name }",
                type: "POST",
                contentType: "application/json; charset=latin1",
                dataType: "json",
                cache: false,
                async: false,
                success: function (e) {
                    console.log("get Dynamic Variation success:"+ e);
                    console.log(e);
                    dynamicVariation.DynamicVariationID = e["dynamicNumber.encode"];
                    dynamicVariation.Label = e.label;
                    var listOfDynamicContents = new Array();
                    if(e.contents != null && e.contents != undefined) {
                        var contents = e.contents[0];
                        $.each(contents, function (i, obj) {
                            var content = obj[0];
                            var dynamicContents = new DynamicContents();
                            dynamicContents.DynamicVariationID = e["dynamicNumber.encode"];
                            dynamicContents.DynamicContentID = content["contentNumber.encode"];
                            dynamicContents.Label = content.label;
                            dynamicContents.IsDefault = content.isDefault;
                            dynamicContents.ApplyRuleCount = content.ruleCount;
                            listOfDynamicContents.push(dynamicContents);
                            var listOfDynamicRules = new Array();
                            if(content.rules != null && content.rules != undefined) {
                                var rules = content.rules[0];
                                $.each(rules, function (i, obj) {
                                    var rule = obj[0];
                                    var dynamicRule = new DynamicRules();
                                    dynamicRule.DynamicRuleID = rule["listNumber.encode"];
                                    dynamicRule.RuleFieldName = rule.fieldName;
                                    dynamicRule.RuleCondition = rule.rule;
                                    dynamicRule.RuleDefaultValue = rule.dateFormat;
                                    dynamicRule.RuleMatchValue = rule.matchValue;    
                                    listOfDynamicRules.push(dynamicRule);
                                });
                            }

                            dynamicContents.ListOfDynamicRules = listOfDynamicRules;
                        });
                    }
                    dynamicVariation.ListOfDynamicContents = listOfDynamicContents;
                        
                },  
                error: function (e) {
                        console.log("get Dynamic Variation Content failed:"+ e);
                }
            });
            console.log(dynamicVariation);
            return dynamicVariation;

        }



        //=============================================================================

        var _LoadPersonalizeTags = function (args) {
                
            if (args == null) {
                args = new Object();
            }

            //Call overridden Method here: will use when exposing properties to developer
            if (options.LoadPersonalizeTags != null) {                    
                options.LoadPersonalizeTags(args);
            }

            //Getting building blocks from provided block:
            if (args.personalizeTags != null) {

                var listOfPersonalizeTagsHtml = new Array();
                //listOfPersonalizeTagsHtml.push("{ text: 'Personalize', value: '' }");
                var personalizeTagsFromService = args.personalizeTags;

                //$.parseJSON Takes a well-formed JSON string and returns the resulting JavaScript object.
                $.each(personalizeTagsFromService, function (i, obj) {
                        
                    //Assigning unique ID here:
                    //obj[0].ID = "buildingBlock" + count;
                    //console.log("DC Fiedl:" + obj);
                    var entry = {
                        text: obj[1],
                        value: obj[0]
                    }
                    if(obj[2] == "B") {
                        listOfPersonalizeTagsHtml.push(entry);                       
                    }
                    //Initialize with default draggable:
                    //InitializeMainDraggableControls(block);

                    //listOfDynamicBlockFieldssHtml.append(block);

                    
                });
                //console.log(listOfDynamicBlocksHtml);
                // var ulPersonalizeTags = myElement.find(".dcRuleFormat");
                // ulPersonalizeTags.empty();
                // ulPersonalizeTags.append(listOfPersonalizeTagsHtml);
                personalizedTagsGlobal = listOfPersonalizeTagsHtml;
                // dynamicBlocksGlobal = dynamicBlocksFromService;
                console.log(personalizedTagsGlobal);    
            }

        }


        //Muhammad Adnan --------------------- Code Preview ---------------------------//
        
        function InitializePreviewControls() {
            var lnkPreviewCode = $(".preview");
            var divPreviewCode = myElement.find(".divPreviewCode");
            var divHtmlCode = myElement.find(".divHtmlCode");
            var previeCodeTabs = divPreviewCode.find("#previeCodeTabs");
            
           

            previeCodeTabs.tabs();

           

            lnkPreviewCode.click(function () {

                //var asdf = myElement.find(".mainTable").clone(true);

                //alert(asdf.find(".textcontent").data("test"));

                //asdf.find(".textcontent").remove();
                
                //alert(asdf.find(".textcontent").data("test"));

                var divHtmlPreview = previeCodeTabs.find(".divHtmlPreview");
                var cleanCode = CleanCode(myElement.find(".mainTable").outerHTML());
                
                divHtmlPreview.html(cleanCode);
                divHtmlCode.val(cleanCode.outerHTML());

                divPreviewCode.dialog({
                    width: 990,
                    height: 500,
                    modal: true,
                    buttons: [
                         {
                            text: "Close",
                            click: function () {
                                $(this).dialog('destroy');

                            }
                        }
                    ]
                }).dialog("open");
            });

            
        };

        var CleanCode = function (html) {
            
            var oHtml = $(html);

            
            //DestroyPluginsEvents(oHtml);
            oHtml.removeClass("mainTable");            
            oHtml.find(".myDroppable").remove();            
            oHtml.find("td").removeClass("mainContentHtmlGrand");
            oHtml.find(".dynamicContentContainer").remove();

            //Remove Outline added by style
            oHtml.find("td").removeInlineStyle("outline");

            var RemoveCommon = function (element) {
                
                //Remove Empty Element
                if (element.isEmpty()) {
                    element.remove();
                    return;
                }

                var newElement = $("<div>");
                newElement.html(element.html());

                //Assign Style
                var elementStyle = element.attr("style");
                if (elementStyle != null) {
                    newElement.attr("style", elementStyle);
                }

                //Remove Class
                newElement.removeClass();
                element.replaceWith(newElement);
            }
                        
            oHtml.find("ul").each(function () { RemoveCommon($(this)); });
            oHtml.find("li").each(function () { RemoveCommon($(this)); });

            oHtml.find("table").each(function () {
                
                $(this).find("ul").each(function () { RemoveCommon($(this)); });
                $(this).find("li").each(function () { RemoveCommon($(this)); });
            });
            
            oHtml.find("*").removeAttr("class");

            return oHtml;
        };

        InitializePreviewControls();
        //=============================================================================





        //???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
        // [Muhammad.Adnan] --------------- DROPPING, DRAGGING, IMAGE CONTAINERS WORK (CORE FUNCTIONALITY) ------------ //            
        function DropableMouseEnterLeave (element) {
            //FOR CHROME SPECIALLY
            element.on(
                {
                    mouseenter: function () {
                        if ($(this).hasClass("myDroppable")) {
                            $(this).css({
                                "background-color": "#9fcbf1"
                            });
                        }
                    }
                ,
                    mouseleave: function () {
                        if ($(this).hasClass("myDroppable")) {
                            $(this).css({
                                "background-color": "#dceefe"
                            });
                        }

                    }
                });
        }

        var CreateDroppable = function (e) {
            var myDroppable = $("<li class='myDroppable'></li>");

            //FOR CHROME SPECIALLY
            DropableMouseEnterLeave(myDroppable);

            return myDroppable;
        }

        //Check if image-container exist in html, apply droppable on .imageContainer class on any element.
        function InitializeImageDroppedEvent(args) {
            if (args.predefinedControl != null) {

                if (args.predefinedControl.Html.find('.imageContainer').andSelf().filter('.imageContainer').length > 0) {

                    //Apply here Droppable Container:
                    args.predefinedControl.Html.find('.imageContainer').andSelf().filter('.imageContainer').each(function (index, element) {

                        $(element).droppable({
                            tolerance: "pointer",
                            greedy: true,
                            drop: function (event, ui) {
                                //alert("dropped");
                                //Only dropable for IMAGE TYPE
                                if (ui.draggable.hasClass("droppedImage")) {
                                    $(element).removeClass("imageContainer imagePlaceHolderAlone ui-droppable")

                                    var argsThis = {
                                        droppedElement: $(this),
                                        event: event,
                                        ui: ui,
                                        predefinedControl: args.predefinedControl
                                    };

                                    OnImageDropped(argsThis);
                                    InitializeClickEvent(argsThis);
                                }
                            }
                        });

                    });
                }

            }
        }

        //Check if Click-able event here in html, apply on click event:
        function InitializeClickEvent(args) {

            if (args.predefinedControl != null) {

                if (args.predefinedControl.Html.find('.clickEvent').andSelf().filter('.clickEvent').length > 0) {

                    args.predefinedControl.Html.find('.clickEvent').andSelf().filter('.clickEvent').each(function (index, element) {

                        $(element).click(function (event) {

                            isElementClicked = true;

                            OnClickedOnElement(args,event);

                        });

                    });
                }
            }

            //return args;

        }

        function InitializeDeleteButtonOnElement(element) {
          
            element.find(".myHandlerDelete").click(function () {
                var csHaveDataLength = myElement.find(".csHaveData").length;
                var myParent = $(this).closest(".csHaveData");

                //REMOVE DROPPABLES HERE  
                if (csHaveDataLength != 1) {
                    myParent.next(".myDroppable").remove();
                }
                else {
                    //If last element
                    myParent.next(".myDroppable").remove();
                    myParent.prev(".myDroppable").remove();
                }
                    
                myParent.remove();
            }); 
        }

        function InitializeCopyButtonOnElement(element) {
            
            element.find(".myHandlerCopy").click(function () {
                                
                var myParent = $(this).closest(".csHaveData");
                var droppable = CreateDroppableWithAllFunctions();
                myParent.before(droppable);

                DestroyPluginsEvents(myParent);                
                var duplicateElement = myParent.clone();
                InitializePluginsEvents(myParent);

                

                var oControl = new Object();
                oControl.Html = duplicateElement;
                oControl.Type = "copied";

                var args = {};

                args.predefinedControl = oControl;
                args.droppedElement = oControl.Html;
                
                ReInitializeDragDropHoverAll(args.droppedElement);
                

                InitializeImageDroppedEvent(args);

                InitializeClickEvent(args);

                
                droppable.before(args.droppedElement);

                myElement.find(".topHandlers").remove();
                RemoveDroppables(myElement);

                OnNewElementDropped(args);
                
                //myElement.find(".sortable").removeAttr("style");
                //myElement.find(".myDroppable").removeInlineStyle("height");

            });
        }

        function InitializeMouseHover(sender) {

            if (sender != null) {

                var myobject = $(topHandlersHTML);

                sender.on({
                    mouseenter: function (e) {
                        
                        if (!IsStyleActivated) {

                            //23 is height of topHandlers;
                            var topMeasure = $(this).offset().top - 23

                            var leftMeasure = $(this).offset().left;

                            myobject.css({
                                top: topMeasure,
                                left: leftMeasure + $(this).width() - 70,
                                "border-top": "1px solid #2486dc",
                                "border-left": "1px solid #2486dc",
                                "border-right": "1px solid #2486dc"
                            });

                            //Assign DELETE functionality here
                            InitializeDeleteButtonOnElement(myobject);

                            //Assign COPY functionality here
                            InitializeCopyButtonOnElement(myobject);

                            $(this).prepend(myobject);

                        }
                        
                    },
                    mouseleave: function () {
                        $(this).find(myobject).remove();
                    }
                });

                //args.droppedElement.hover(function (event) {
                //    //$(this).prepend(myobject);

                //}, function (event) {

                //    //$(this).find(myobject).remove();

                //});

                return sender;
            }

        }

        var SetElementSize = function (args) {
            //var args = {
            //    droppedElement: $(this),
            //    event: event,
            //    ui: ui,
            //    predefinedControl: Html, Type
            //};

            //Controlling here Width of Container
            if (args.predefinedControl != null) {
                var parentWidth = 100;
                //var parentWidth = args.droppedElement.width();
                var perTDwidth = 0;
                switch (args.predefinedControl.Type) {
                    case "oneColumnContainer":
                        //do nothing
                        break;
                    case "twoColumnContainer":
                        perTDwidth = (parentWidth / 2) + "%";
                        args.droppedElement.find(".container > tbody > tr > td").each(function (index, element) {
                            $(element).width(perTDwidth);
                        });
                        break;
                    case "threeColumnContainer":
                        perTDwidth = (parentWidth / 3) + "%";
                        args.droppedElement.find(".container > tbody > tr > td").each(function (index, element) {
                            $(element).width(perTDwidth);
                        });
                        break;
                    case "fourColumnContainer":
                        perTDwidth = (parentWidth / 4) + "%";
                        args.droppedElement.find(".container > tbody > tr > td").each(function (index, element) {
                            $(element).width(perTDwidth);
                        });
                        break;
                    default:

                }
            }
               
        }
        
        function ReInitializeDragDropHoverAll (element) {

            //-------------- Initialize Again all nested controls after dropped-------------------//:
            //Droppable:
            element.find(".myDroppable").andSelf().filter(".myDroppable").each(function (i, o) {
                CreateDroppableWithAllFunctions(o);
                DropableMouseEnterLeave($(o));
            });

            //Moving Handlers - Mouse Hover
            element.find(".csHaveData").andSelf().filter(".csHaveData").each(function (i, o) {
                InitializeElementWithDraggable($(o));
                InitializeMouseHover($(o));
            });

            //////////////////////////////////////////////////////////////////////////////////////////

            
        }

        //REINITIALIZE AND DESTROY BINDED EVENTS - I.E JQUERYUI PLUGINS ETC.
        function InitializePluginsEvents(element) {

            //alert("im calling");

            element.find("img.imageHandlingClass").resizable({
                // containment: 'parent',
                // handles: "se,sw"
            });
			
			element.find("div.textcontent").each(function (index, element) {
                if ($(element).tinymce() == undefined)
                {
                    $(element).tinymce({
                        //selector: "div.textcontent",
                        theme: "modern",
                        plugins: 'link textcolor preview table anchor autolink advlist',
                        script_url: '/scripts/libs/tinymce/tinymce.min.js',
                        toolbar1: "fontselect fontsizeselect | foreTextColor | backTextColor | bold italic underline strikethrough | subscript superscript | alignleft aligncenter alignright alignjustif | bullist numlist | table preview ",
                        toolbar2: "LinksButton | mybutton123 | undo redo ",
                        link_list: [
                        { title: 'My page 1', value: 'http://www.tinymce.com' },
                        { title: 'My page 2', value: 'http://www.moxiecode.com' }
                        ],
                        setup: function (editor) {
                            editor.addButton('LinksButton', {
                                type: 'listbox',
                                title: 'Links',
                                text: 'Links',
                                icon: false,
                                onClick: function(e) {
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
                                /*values: [
                                    {text: 'Link', value: 'Link'},
                                    {text: 'Menu item 2', value: 'Some text 2'},
                                    {text: 'Menu item 3', value: 'Some text 3'}
                            ],*/
                                onPostRender: function() {
                                    // Select the second item by default
                                    //this.value('');
                                }
                            });
                            editor.addButton('foreTextColor', {
                                type: 'button',
                                tooltip: 'Text color',
                                text: 'A',
                                selectcmd: 'ForeColor',
                                /*panel: {
                                    html: '<div class="divFontColorPicker"></div>'
                                    // onclick: function (e) {
                                    //     var buttonCtrl = this.parent(), value;

                                    //     if ((value = e.target.getAttribute('data-mce-color'))) {
                                    //         buttonCtrl.hidePanel();
                                    //         value = '#' + value;
                                    //         buttonCtrl.color(value);
                                    //         editor.execCommand(buttonCtrl.settings.selectcmd, false, value);
                                    //     }
                                    // }
                                },*/
                                onClick: function(e) {
                                    //$("#fontColorDialog").dialog("open");
                                    // var buttons = $( "#fontColorDialog" ).dialog( "option", "buttons" );
                                    // console.log(buttons[0].text);
                                    // buttons[0].click = function () {
                                    //     cosole.log("First button Pressed.");
                                    // }
                                    $( "#fontColorDialog" ).dialog( "option", "buttons", [
                                        {
                                            text: "OK",                            
                                            click: function () {
                                                // if ($("#linkTrack").data("linkObject") == "text") {
                                                //     var myvar = "<a href='#' style='text-decoration:underline;'>" + $("#linkTextArea").val() + "</a>";
                                                //     //tinyMCE.activeEditor.selection.setContent(myvar);
                                                //     $("#currTinyMCE").data("myTinyMCE").setContent(myvar)
                                                //     //tinyMCE.activeEditor.selection.getNode().setAttribute("data", $("#linkHyperLinkURL").val() + "?campaignkw=" + $("#linkName").val());
                                                //     $("#currTinyMCE").data("myTinyMCE").getNode().setAttribute("data", $("#linkHyperLinkURL").val() + "?campaignkw=" + $("#linkName").val());
                                                // }
                                                // $(this).each(function (index) {
                                                //     $(this).dialog("close");
                                                // });
                                                //var divFontColorPicker = $(".divFontColorPicker");
                                                //var selectedColor = divFontColorPicker.minicolors('value');
                                                var selectedFontColor = $(".selectedFontColor");
                                                var selectedColor = selectedFontColor.val();
                                                console.log("selected COlor:"+ selectedColor);
                                                editor.focus();
                                                var result = editor.execCommand('ForeColor', false, selectedColor);
                                                console.log("Result of command:"+ result);
                                                $(this).dialog("close");
                                            }
                                        },
                                        {
                                            text: "Close",
                                            click: function () {                                
                                                $(this).each(function (index) {
                                                    $(this).dialog("close");
                                                });
                                            }
                                        }
                                        ]

                                     );

                                    $("#fontColorDialog").dialog("open");
                                    
                                    //editor.windowManager.open({file:'customizedColorPicker.html', width:300, height:275, title:'Font Color Picker'});

                                    // $("#fontColorDialog").load("customizedColorPicker.html", function () {
                                    //     var divFontColorPicker = $(".divFontColorPicker");
                                    //     divFontColorPicker.minicolors({
                                    //         letterCase: 'uppercase',
                                    //         change: function (hex, opacity) {
                                    //             console.log(hex);
                                    //             //SetBackgroundColor(hex);

                                    //             //txtColorCode.val(hex);
                                    //         },
                                    //         inline: true,

                                            
                                    //     });
                                    // }).dialog("open");

                                    var divFontColorPicker = $(".divFontColorPicker");
                                    var selectedFontColor = $(".selectedFontColor");
                                    divFontColorPicker.minicolors({
                                        letterCase: 'uppercase',
                                        change: function (hex, opacity) {
                                            console.log(hex);
                                            //SetBackgroundColor(hex);
                                            selectedFontColor.val(hex);    
                                            //txtColorCode.val(hex);
                                        },
                                        inline: true,

                                        
                                    });

                                    if(myColorsFromServiceGlobal == "") {
                                        _LoadMyColors();
                                    }
                                    var myFontColors = $(".myFontColors");
                                    console.log(ulMyColors);
                                    console.log(myFontColors);
                                    
                                    myFontColors.empty();
                                    myFontColors.append(ulMyColors.html());

                                     myFontColors.find("li").click(function(){
                                                console.log("li color" + $(this).data("color"));
                                                selectedFontColor.val($(this).data("color"));

                                     });
                                }
                                
                            });
                            editor.addButton('backTextColor', {
                                type: 'button',
                                tooltip: 'Text Background color',
                                text: 'B',
                                selectcmd: 'HiliteColor',
                                
                                onClick: function(e) {
                                    
                                    $( "#fontColorDialog" ).dialog( "option", "buttons", [
                                        {
                                            text: "OK",                            
                                            click: function () {
                                                // if ($("#linkTrack").data("linkObject") == "text") {
                                                //     var myvar = "<a href='#' style='text-decoration:underline;'>" + $("#linkTextArea").val() + "</a>";
                                                //     //tinyMCE.activeEditor.selection.setContent(myvar);
                                                //     $("#currTinyMCE").data("myTinyMCE").setContent(myvar)
                                                //     //tinyMCE.activeEditor.selection.getNode().setAttribute("data", $("#linkHyperLinkURL").val() + "?campaignkw=" + $("#linkName").val());
                                                //     $("#currTinyMCE").data("myTinyMCE").getNode().setAttribute("data", $("#linkHyperLinkURL").val() + "?campaignkw=" + $("#linkName").val());
                                                // }
                                                // $(this).each(function (index) {
                                                //     $(this).dialog("close");
                                                // });
                                                //var divFontColorPicker = $(".divFontColorPicker");
                                                //var selectedColor = divFontColorPicker.minicolors('value');
                                                var selectedFontColor = $(".selectedFontColor");
                                                var selectedColor = selectedFontColor.val();
                                                console.log("selected COlor:"+ selectedColor);
                                                if(selectedColor != "") {
                                                    editor.focus();
                                                    var result = editor.execCommand('HiliteColor', false, selectedColor);
                                                    console.log("Result of command:"+ result);
                                                }
                                                $(this).dialog("close");
                                            }
                                        },
                                        {
                                            text: "Close",
                                            click: function () {                                
                                                $(this).each(function (index) {
                                                    $(this).dialog("close");
                                                });
                                            }
                                        }
                                        ]

                                     );

                                    $("#fontColorDialog").dialog("open");
                                    

                                    var divFontColorPicker = $(".divFontColorPicker");
                                    var selectedFontColor = $(".selectedFontColor");
                                    divFontColorPicker.minicolors({
                                        letterCase: 'uppercase',
                                        change: function (hex, opacity) {
                                            console.log(hex);
                                            //SetBackgroundColor(hex);
                                            selectedFontColor.val(hex);    
                                            //txtColorCode.val(hex);
                                        },
                                        inline: true,

                                        
                                    });

                                    if(myColorsFromServiceGlobal == "") {
                                        _LoadMyColors();
                                    }
                                    var myFontColors = $(".myFontColors");
                                    console.log(ulMyColors);
                                    console.log(myFontColors);
                                    
                                    myFontColors.empty();
                                    myFontColors.append(ulMyColors.html());

                                     myFontColors.find("li").click(function(){
                                                console.log("li color" + $(this).data("color"));
                                                selectedFontColor.val($(this).data("color"));

                                     });
                                }
                                
                            });

                            editor.addButton('mybutton123', {
                                type: 'listbox',
                                title: 'Personalize',
                                text: 'Personalize',
                                icon: false,
                                onselect: function (e) {
                                    editor.insertContent(this.value());
                                },
                                values: personalizedTagsGlobal,
                                    /*{ text: 'Personalize', value: '' },
                                    { text: 'Email', value: '@EMAIL@' },
                                    { text: 'First Name', value: '@First Name@' },
                                    { text: 'Full Name', value: '@Full Name@' },
                                    { text: 'Gender', value: '@Gender@' },
                                    { text: 'Last Name', value: '@Last Name@' },
                                    { text: 'Post Code', value: '@Post Code@' },
                                    { text: 'Sender Address', value: '@Sender Address@' }*/
                                
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
            });
        }

        var DestroyPluginsEvents = function (element) {
            element.find("img.imageHandlingClass").resizable("destroy");

            //Tiny MCE DESTROY work here:
            element.find("div.textcontent").each(function(index, element){
                var tinyEnableElement = $(element);
                
                //Avoid memory leak here
                if (tinyEnableElement.tinymce() != undefined) {
                    tinyEnableElement.tinymce().destroy();

                    //Remove here all attributes that inserted by tinymce except class
                    var whitelist = ["class"];
                    tinyEnableElement.each(function () {
                        var attributes = this.attributes;
                        var i = attributes.length;
                        while (i--) {
                            var attr = attributes[i];
                            if ($.inArray(attr.name, whitelist) == -1)
                                this.removeAttributeNode(attr);
                        }

                    });
                }
                
            });
            
        }
        /////////////////////////////////////////////////////////////////

        //Elements Dropping
        function InitializeWithDropable(sender) {

            //if (draggingUI != null) {
            //    alert("")
            //}

            sender.droppable({
                tolerance: "pointer",
                greedy: true,
                drop: function (event, ui) {

                    //makeCloneAndRegister();
                    //only allowed to drag controls from controls panel
                    if (!$(this).hasClass("myDroppable") || ui.draggable.data("type") === "droppedImage") {
                        //DO NOTHING
                        return;
                    }

                    if ($(this).css("visibility") == "hidden") {
                        //DO NOTHING
                        return;
                    }
                        
                    //MUST REMOVE IN ORDER TO WORK PROPER
                    $(this).removeAttr("style");

                    

                    if (IsFirstDroppableElement) {
                        //remove height here:
                        //$(this).removeAttr("style");
                        IsFirstDroppableElement = false;
                    }
                       
                    //Once dropped Delete myDroppable class here and Remove functionality of Droppable here                                
                    $(this).removeClass("myDroppable");

                    //Dragging and Dropping between elements
                    if (ui.draggable.hasClass("csHaveData")) {

                        //Add class to newly "SWAPED" elment - will use to delete droppable from container etc;
                        $(this).addClass("csHaveData");

                        //INSERT AND REMOVE DROPPABLES HERE                            
                        ui.draggable.next(".myDroppable").remove();

                        if ($(this).prev(".myDroppable").length == 0) {
                            $(this).before(CreateDroppableWithAllFunctions());
                        }

                        if ($(this).next(".myDroppable").length == 0) {
                            $(this).after(CreateDroppableWithAllFunctions());
                        }
                        /////////////////////////////////////

                        $(this).replaceWith(ui.draggable);

                    }
                    //Element recieving from controls panel:
                    else {   //Add class to newly entered element from control panel - will use to delete droppable from container etc;

                        //INSERT DROPPABLE BEFORE AND AFTER            
                        $(this).before(CreateDroppableWithAllFunctions());
                        $(this).after(CreateDroppableWithAllFunctions());
                        ///////
                        
                        $(this).addClass("csHaveData");

                        var args = {
                            droppedElement: $(this),
                            event: event,
                            ui: ui,
                            predefinedControl: null,
                            buildingBlock: null
                        };

                        var typeOfDraggingControl = ui.draggable.data("type");
                        var oControl = new Object();
                        // -------------- Building Block Controls[Better way] --------------//
                            
                        if (typeOfDraggingControl == "buildingBlock") {

                            var controlID = ui.draggable.data("id");                                
                            console.log(controlID);    
                            //need to apply each for this and then search on each [0]

                            console.log(buildingBlocksGlobal);
                            var bb = undefined;
                            $.each(buildingBlocksGlobal, function (i, obj) {
                                // var bBlock = Enumerable.From(buildingBlocksGlobal)
                                //             .Where(function(o){
                                //                             return (Enumerable.From(o[0])
                                //                                 .Where("x => x.ID == '" + controlID + "'").Any());


                                //             }).FirstOrDefault();
                                console.log(obj[0]);

                                // var bb = bBlock;
                                //var abb = Enumerable.From(obj[0]).Where(function(x) { x.ID == '" + controlID + "'").FirstOrDefault();
                                if(obj[0].ID == controlID) {
                                    bb = obj[0];
                                }
                                // console.log("abb:"+abb);
                                // if(abb != undefined) {
                                    // bb = abb
                                // }


                            });
                            console.log("BB:"+bb); 
                            if (bb != undefined) {
                                //Assign here predefined control into OBJECT TYPE and pass it to OnNewElementDropped.
                                var decodeHTML = $('<div/>').html(bb.html).text();
                                oControl.Html = $(decodeHTML);
                                oControl.Type = "buildingBlock";
                                oControl.ID = bb.ID;
                                    
                                console.log(oControl);

                                args.predefinedControl = oControl;
                                    
                                //-------------- Initialize Again all nested controls after dropped-------------------//:
                                ReInitializeDragDropHoverAll(oControl.Html);
                                //Droppable:
                                //oControl.Html.find(".myDroppable").each(function (i, o) {
                                //    CreateDroppableWithAllFunctions(o);
                                //});

                                ////Moving Handlers - Mouse Hover
                                //oControl.Html.find(".csHaveData").each(function (i, o) {
                                //    InitializeElementWithDraggable($(o));
                                //    InitializeMouseHover($(o));
                                //});

                                //////////////////////////////////////////////////////////////////////////////////////////

                                //Place predefined html into dropped area.
                                args.droppedElement.html(oControl.Html);

                            }
                        }
                        else if (typeOfDraggingControl == "dynamicContentContainer")
                        {
                            var isNew = ui.draggable.data("isnew");
                            var predefinedControl = Enumerable.From(predefinedControls).Where("x => x.type == '" + typeOfDraggingControl + "'").FirstOrDefault();
                            oControl.Html = $(predefinedControl.html);
                            oControl.Type = predefinedControl.type;
                            args.predefinedControl = oControl;
                            args.droppedElement.html(oControl.Html);

                            if (!isNew) {
                                //Call overridden Method here: will use when exposing properties to developer
                                if (options.OnExistingDynamicControlDropped != null) {
                                    args.ID = ui.draggable.data("id");
                                     args.DynamicVariation = loadDynamicVariationFromServer(args.ID);
                                    //options.OnExistingDynamicControlDropped(args);
                                }
                            }

                            InitializeDynamicControl(args);

                            ReInitializeDragDropHoverAll(oControl.Html);
                            

                        }
                        else {
                            // -------------- Predefined Controls[Better way] --------------//
                            var predefinedControl = Enumerable.From(predefinedControls).Where("x => x.type == '" + typeOfDraggingControl + "'").FirstOrDefault();
                            if (predefinedControl != undefined) {
                                //Assign here predefined control into OBJECT TYPE and pass it to OnNewElementDropped.

                                oControl.Html = $(predefinedControl.html);
                                oControl.Type = predefinedControl.type;

                                args.predefinedControl = oControl;

                                //Place predefined html into dropped area.
                                //console.log("HTML:"+ oControl.HTML);
                                args.droppedElement.html(oControl.Html);


                                //if (predefinedControl.type === "text") {
                                //    oControl.Html.find(".textcontent").data("test", "sohaib aik bohut accha bacha hai");


                                //    alert(oControl.Html.find(".textcontent").data("test"));
                                //}


                                

                            }

                        }
                            
                        //

                        //Controlling ELEMENT resizing here [Containers]
                        SetElementSize(args);
                        ////////////////////////////////////

                        OnNewElementDropped(args);

                        InitializeImageDroppedEvent(args);

                        InitializeClickEvent(args);

                        InitializeMouseHover(args.droppedElement);

                        //undoManager.registerAction(mainContentHtmlGrand.html());

                        //var regObj = new RegisterObject(null, $(this), $(event.target).parent(), "Drop",$(this).index());
                        makeCloneAndRegister();
                    }

                }
            });

            return sender;
        }

        //Elements DRAGGING - for swapping elements:
        function InitializeElementWithDraggable(object) {
                                
            object.draggable({
                helper: "clone",
                handle: ".myHandle",
                cursor: "crosshair",
                cursorAt: {
                    top: -7,
                    left: -7
                },

                //[M.Adnan] FOR DRAGGING
                start: function (e, ui) {

                    ShowDroppables(myElement);

                    RemovePopups();

                    myElement.find(".content .sortable").each(function () {
                        //Exclude here dragging element (which is added by jqueryUI)
                        var firstLevelLiDroppable = $(this).find(">.myDroppable:not(.ui-draggable-dragging)");
                        InsertDroppableInEmpty($(this), firstLevelLiDroppable);

                        //Last element FULL height
                        SetLastElementHeight($(this));
                        
                    });

                    //Hide imediate next and previos droppable containers
                    //e.target get original element.
                    $(e.target).next(".myDroppable").invisible();
                    $(e.target).prev(".myDroppable").invisible();
                },

                stop: function (e, ui) {
                    //Remove all Droppables places here.
                    RemoveDroppables(myElement);
                }
            });

            return object;
        }

        function CreateDroppableWithAllFunctions(object) {

            var d1;
            if (object == null) {
                d1 = CreateDroppable();
            }
            else {
                d1 = $(object);
            }
                
            var d1WithDraggable = InitializeElementWithDraggable(d1);
            var d1WithDroppable = InitializeWithDropable(d1WithDraggable);

            return d1WithDroppable;
        }

        var InsertDroppableInEmpty = function (sender, listOfElements) {
            var liLength = listOfElements.size();

            //Placing highlighter into "Container" here  
            if (liLength == 0) {

                var droppableElement = null;
                droppableElement = CreateDroppableWithAllFunctions();

                if (IsFirstDroppableElement) {
                    //droppableElement.css({
                    //    height: "100%"
                    //});

                    droppableElement.append("<div style='text-align:center; position:relative; top:40px; font-style:italic'> DROP HERE </div>");
                }

                sender.append(droppableElement);
            }

            //listOfElements.each(function (index) {
            //    var element = $(this);
            //    if (index == 0)
            //    {
            //        element.before(CreateDroppableWithAllFunctions());
            //    }

            //    element.after(CreateDroppableWithAllFunctions());
            //});
        }

        var RemoveDroppables = function (container) {
            container.find(".myDroppable:not(.csHaveData)").invisible();

            //Remove height from destination's parent and source's parent (.sortable UL)
            //Releted to last element dropped full height:
            myElement.find(".sortable").removeAttr("style");
            myElement.find(".myDroppable").removeInlineStyle("height");
            ///////
        }

        var ShowDroppables = function (container) {
            container.find(".myDroppable:not(.csHaveData)").visible();
        }

        var RemovePopups = function () {
            $("#imageToolbar").hide();
        }

        var IsFirstDroppableElement = false;
            
        //Last Element get full height here
        var SetLastElementHeight = function (element) {
            
            // Get parent element height and apply to UL (.sortable)
            var parentHeight = element.parent().height();
            element.height(parentHeight);

            //Get first level children in UL here:
            var firstLevelAllLi = element.children("li:not(.ui-draggable-dragging)");
            var firstLevelAllLiLength = firstLevelAllLi.length;
            var hightExcludingLast = 0;

            firstLevelAllLi.each(function (index, element) {
                
                if (index != firstLevelAllLiLength - 1) {
                    hightExcludingLast += $(this).outerHeight();

                }
                else {
                    //Get Last element here
                    var lastDroppableHeight = parentHeight - hightExcludingLast
                    if (lastDroppableHeight > 0) {
                        lastDroppableHeight = lastDroppableHeight - 2;
                    }
                  
                    $(this).height(lastDroppableHeight);
                }
            });
        }

        //---------------------  MAIN DRAGGABLE--------------------------//
        function InitializeMainDraggableControls(elementToApply) {
            elementToApply.draggable({
                helper: "clone",
                cursor: "crosshair",
                cursorAt:{
                    top: -7,
                    left: -7
                },

                //[M.Adnan] FOR DRAGGING
                start: function (e, ui) {

                    //Disable for droppedImage here
                    if (ui.helper.data("type") === "droppedImage") {
                        return;
                    }
                    //////////////

                    ShowDroppables(myElement);

                    RemovePopups();

                    var draggedControlType = ui.helper.data("type");

                    if (draggedControlType != "droppedImage") {

                        var totalLiLength = myElement.find(".content .sortable li").length;
                        myElement.find(".content .sortable").each(function () {

                            var firstLevelLiDroppable = $(this).find(">.myDroppable:not(.ui-draggable-dragging)");

                            if (totalLiLength == 0 && firstLevelLiDroppable.length == 0) {
                                //For first time dropping element                                
                                IsFirstDroppableElement = true;
                            }                                

                            InsertDroppableInEmpty($(this), firstLevelLiDroppable);

                            SetLastElementHeight($(this));

                        });

                        //var mainContent = myElement.find(".mainContentHtml");
                        //alert(mainContent.height());

                        //var lastDropabble = myElement.find(".myDroppable:last-child");
                        //lastDropabble.css({
                        //    height: "100%"                                
                        //});

                    }

                    //$(".imageContainer")
                    //myElement.find(".imageContainer").InitializeWithDropable();
                },

                stop: function (e, ui) {

                    //INSERT Dropable along with dragged element:

                    //Remove all Droppables places here.
                    RemoveDroppables(myElement);

                }
            });
        }
            
        //---------------------  BUILDING BLOCKS--------------------------//
        var InitializeBuildingBlockDroppableArea = function () {

            myElement.find(".buildingBlockDroppable").droppable({
                tolerance: "pointer",
                accept: ".csHaveData",
                drop: function (event, ui) {
                                                
                    var args = {
                        droppedElement: $(this),
                        buildingBlock: null,
                        event: event,
                        ui: ui
                    };

                    myElement.find(".buildingBlock_name").dialog({
                        width: 500,
                        modal: true,
                        buttons: [
                            {
                                text: "Cancel",
                                click: function () {
                                    $(this).dialog('destroy');

                                }
                            },{
                                text: "Ok",
                                click: function () {
                                    //var txtPlaceHolder = $(this).find(".txtPlaceHolder");
                                    //args.buildingDialogBox = $(this);

                                    var buildingBlock = new Object();
                                    buildingBlock.Name = $(this).find(".txtPlaceHolder").val();

                                    DestroyPluginsEvents(args.ui.draggable);

                                    buildingBlock.Html = args.ui.draggable.clone();

                                    InitializePluginsEvents(args.ui.draggable);

                                    args.buildingBlock = buildingBlock;

                                    $(this).dialog('destroy');

                                    _OnDropElementOnBuildingBlock(args);

                                }
                            }
                        ]
                    }).dialog("open");

                }
            });
        }          
        // ------------------------------------------------------------------------------------------------------------------//
        //???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????

        function InitializeBuildingBlockUpdatePopup() {
            $('.buildingBlock_name_edit').dialog({
                
                width: 500,
                modal: true,
                buttons: [
                    {
                        text: "Cancel",
                        click: function () {
                            $(this).dialog('destroy');
                            _LastSelectedBuildingBlock = null;
                            UnSelectAllBlocks();
                        }
                    }, {
                        text: "Ok",
                        click: function () {
                            var args = {
                                buildingBlock: null
                                };
                            
                            //var txtPlaceHolder = $(this).find(".txtPlaceHolder");
                            //args.buildingDialogBox = $(this);

                            var buildingBlock = new Object();
                            buildingBlock.Name = $(this).find(".txtPlaceHolder").val();
                            buildingBlock.Id = _LastSelectedBuildingBlock.data("id");
                            args.buildingBlock = buildingBlock;
                            $(this).dialog('destroy');
                            _OnEditBuildingBlock(args);
                            _LastSelectedBuildingBlock = null;
                            UnSelectAllBlocks();
                        }
                    }
                ]
            });
        }

        function InitializeDynamicBuildingBlockUpdatePopup() {
            $('.dynamicBuildingBlock_name_edit').dialog({
                
                width: 500,
                modal: true,
                buttons: [
                    {
                        text: "Cancel",
                        click: function () {
                            $(this).dialog('destroy');
                            _LastSelectedDynamicBuildingBlock = null;
                            UnSelectAllDynamicBlocks();
                        }
                    }, {
                        text: "Ok",
                        click: function () {
                            var args = {
                                buildingBlock: null
                                };
                            
                            //var txtPlaceHolder = $(this).find(".txtPlaceHolder");
                            //args.buildingDialogBox = $(this);

                            var dynamicVariation = new Object();
                            dynamicVariation.Name = $(this).find(".txtPlaceHolder").val();
                            dynamicVariation.Id = _LastSelectedDynamicBuildingBlock.data("id");
                            args.dynamicVariation = dynamicVariation;
                            $(this).dialog('destroy');
                            _OnEditDynamicVariation(args);
                            _LastSelectedDynamicBuildingBlock = null;
                            UnSelectAllDynamicBlocks();
                        }
                    }
                ]
            });
        }

        // ============== Sohaib Nadeem =====================///
        // == Enabling ImageFunctionality before access 
        var imageFunctionality = {
            leftAlign: function (myHtmlInstance, workingObject) {

                /*if (myHtmlInstance.find("#imageToolbar").data("objectType") == "image") {
                    //workingObject.attr("align", "left");
                    $(workingObject).parent().parent().parent().attr("align", "left");
                } else if (myHtmlInstance.find("#imageToolbar").data("objectType") == "textWithImage" || myHtmlInstance.find("#imageToolbar").data("objectType") == "imageWithText") {
                    //workingObject.find("div.myImage").css("width", "");
                    //workingObject.attr("align", "left");
                    $(workingObject).parent().parent().parent().attr("align", "left");
                } else if (myHtmlInstance.find("#imageToolbar").data("objectType") == "buildingBlock" || myHtmlInstance.find("#imageToolbar").data("objectType") == "copied") {
                    $(workingObject).parent().parent().parent().attr("align", "left");
                }*/
                /*var seHandle = workingObject.find(".ui-resizable-se");
                var swHandle = workingObject.find(".ui-resizable-sw");*/
                $(workingObject).parent().parent().parent().attr("align", "left");
                var myObj = $(workingObject).parent().parent().parent();
                var seHandle = myObj.find(".ui-resizable-se");
                var swHandle = myObj.find(".ui-resizable-sw");
                if (swHandle.is(":visible")) {
                    swHandle.hide();
                }
                seHandle.show();
            },
            centerAlign: function (myHtmlInstance, workingObject) {
                /*if (myHtmlInstance.find("#imageToolbar").data("objectType") == "image") {
                    $(workingObject).parent().parent().parent().attr("align", "center");
                } else if (myHtmlInstance.find("#imageToolbar").data("objectType") == "textWithImage" || myHtmlInstance.find("#imageToolbar").data("objectType") == "imageWithText") {
                    //workingObject.find("div.myImage").css("width", "");
                    $(workingObject).parent().parent().parent().attr("align", "center");
                } else if (myHtmlInstance.find("#imageToolbar").data("objectType") == "buildingBlock" || myHtmlInstance.find("#imageToolbar").data("objectType") == "copied") {
                    $(workingObject).parent().parent().parent().attr("align", "center");
                }*/
                $(workingObject).parent().parent().parent().attr("align", "center");
                $(workingObject).parent().parent().parent().find(".ui-resizable-se").show();
                $(workingObject).parent().parent().parent().find(".ui-resizable-sw").show();
            },
            rightAlign: function (myHtmlInstance, workingObject) {
                /*if (myHtmlInstance.find("#imageToolbar").data("objectType") == "image") {
                    $(workingObject).parent().parent().parent().attr("align", "right");
                } else if (myHtmlInstance.find("#imageToolbar").data("objectType") == "textWithImage" || myHtmlInstance.find("#imageToolbar").data("objectType") == "imageWithText") {
                    //workingObject.find("div.myImage").css("width", "");
                    $(workingObject).parent().parent().parent().attr("align", "right");
                } else if (myHtmlInstance.find("#imageToolbar").data("objectType") == "buildingBlock" || myHtmlInstance.find("#imageToolbar").data("objectType") == "copied") {
                    $(workingObject).parent().parent().parent().attr("align", "right");
                }*/
                $(workingObject).parent().parent().parent().attr("align", "right");
                $(workingObject).parent().parent().parent().find("img.imageHandlingClass").css("overflow", "hidden");
                var seHandle = $(workingObject).parent().parent().parent().find(".ui-resizable-se");
                var swHandle = $(workingObject).parent().parent().parent().find(".ui-resizable-sw");
                if (seHandle.is(":visible")) {
                    seHandle.hide();
                }
                swHandle.show();
            },
            openLinkGUI: function (workingObject) {
                $("#linkTrack").data("linkObject", "image");
                $("#rightPanelArea").data("tabClicked", "hyperlink");
                $("#imageLinkDialog").load("AddLinkScreen.html", function () {
                    if ($(workingObject).parent().parent().parent().find("img.imageHandlingClass").parent().is("a")) {
                        var previousLink = $(workingObject).parent().parent().parent().find("a").data("link");
                        if (previousLink.search("mailto") == -1) {
                            document.getElementById("rightPanelArea").innerHTML = "<p>ADD A HYPERLINK (STANDARD LINK URL)</p><br /><br /><form name='submit_url' action='#' method='post' enctype='multipart/form-data'><label><p>text</p></label><textarea id='linkTextArea' class='text-areaLinkGUI'></textarea><br /><br /><br /><label><p>link (url)</p></label><input type='text' class='textLinkGUI' id='linkHyperLinkURL' maxlength='200' /><br /><br /><label><p>LINK NAME (FOR TRACKING)</p></label><input id='linkName' type='text' class='textLinkGUI' maxlength='200' /><p><input type='checkbox' id='dont-track'  /><label><span>DO NOT TRACK THIS LINK</span></label></p><br /><br /><br /></form>";
                            $("#rightPanelArea").data("tabClicked", "hyperlink");
                            var index1 = previousLink.search("com");
                            var value = previousLink.substring(0, (index1 + 3));
                            $("#linkHyperLinkURL").val(value);
                            index1 = previousLink.search("campaignkw=");
                            value = previousLink.substring((index1 + 11), previousLink.length);
                            $("#linkName").val(value);
                        } else {
                            document.getElementById("rightPanelArea").innerHTML = "<div><p>ADD A Link To an email address</p><br /><br /><br /><Label><p>Email Address</p></Label><br /><input type='text' class='textLinkGUI' id='emailAddText' maxlength='200' /><br /><br /><Label><p>Email Subject</p></Label><br /><input type='text' class='textLinkGUI' id='emailSubjText' maxlength='200' /></div>";
                            $("#rightPanelArea").data("tabClicked", "mailto");
                            var index1 = previousLink.search("com");
                            var value = previousLink.substring(7, (index1 + 3));
                            $("#emailAddText").val(value);
                            index1 = previousLink.search("subject=");
                            value = previousLink.substring((index1 + 8), previousLink.length);
                            $("#emailSubjText").val(value);
                        }

                    }
                    $("#rightPanelArea").data("tabClicked", "hyperlink");
                    $("li.emailLinkGUI").click(function () {
                        $("#rightPanelArea").data("tabClicked", "mailto");
                        document.getElementById("rightPanelArea").innerHTML = "<div><p>ADD A Link To an email address</p><br /><br /><br /><Label><p>Email Address</p></Label><br /><input type='text' class='textLinkGUI' id='emailAddText' maxlength='200' /><br /><br /><Label><p>Email Subject</p></Label><br /><input type='text' class='textLinkGUI' id='emailSubjText' maxlength='200' /></div>";
                        var elem = $("#imageDataSavingObject").data("myWorkingObject");
                        if ($(elem).parent().parent().parent().find("img.imageHandlingClass").parent().is("a")) {
                            var previousLink = $(elem).parent().parent().parent().find("a").data("link");
                            if (previousLink.search("mailto") == -1) {
                                //document.getElementById("rightPanelArea").innerHTML = "<p>ADD A HYPERLINK (STANDARD LINK URL)</p><form name='submit_url' action='#' method='post' enctype='multipart/form-data'><label><p>text</p></label><textarea class='text-areaLinkGUI'></textarea><label><p>link (url)</p></label><input type='text' class='textLinkGUI' id='linkHyperLinkURL' maxlength='200' /><label><p>LINK NAME (FOR TRACKING)</p></label><input type='text' class='textLinkGUI' maxlength='200' /><p><input type='checkbox' id='dont-track'  /><label><span>DO NOT TRACK THIS LINK</span></label></p><br /><br /><br /></form>";
                                //$("#linkHyperLinkURL").val(previousLink);
                                var index1 = previousLink.search("com");
                                var value = previousLink.substring(0, (index1 + 3));
                                $("#linkHyperLinkURL").val(value);
                                index1 = previousLink.search("campaignkw=");
                                value = previousLink.substring((index1 + 11), previousLink.length);
                                $("#linkName").val(value);
                            } else {
                                //document.getElementById("rightPanelArea").innerHTML = "<div><p>ADD A Link To an email address</p><br /><br /><br /><Label><p>Email Address</p></Label><br /><input type='text' class='textLinkGUI' id='emailAddText' maxlength='200' /><br /><br /><Label><p>Email Subject</p></Label><br /><input type='text' class='textLinkGUI' id='emailSubjText' maxlength='200' /></div>";
                                var index1 = previousLink.search("com");
                                var value = previousLink.substring(7, (index1 + 3));
                                $("#emailAddText").val(value);
                                index1 = previousLink.search("subject=");
                                value = previousLink.substring((index1 + 8), previousLink.length);
                                $("#emailSubjText").val(value);
                            }
                        }

                    });
                    $("li.homeLinkGUI").click(function () {
                        $("#rightPanelArea").data("tabClicked", "hyperlink");
                        document.getElementById("rightPanelArea").innerHTML = "<p>ADD A HYPERLINK (STANDARD LINK URL)</p><br /><br /><form name='submit_url' action='#' method='post' enctype='multipart/form-data'><label><p>text</p></label><textarea id='linkTextArea' class='text-areaLinkGUI'></textarea><br /><br /><br /><label><p>link (url)</p></label><input type='text' class='textLinkGUI' id='linkHyperLinkURL' maxlength='200' /><br /><br /><label><p>LINK NAME (FOR TRACKING)</p></label><input type='text' id='linkName' class='textLinkGUI' maxlength='200' /><p><input type='checkbox' id='dont-track'  /><label><span>DO NOT TRACK THIS LINK</span></label></p><br /><br /><br /></form>";
                        var elem = $("#imageDataSavingObject").data("myWorkingObject");
                        if ($(elem).parent().parent().parent().find("img.imageHandlingClass").parent().is("a")) {
                            var previousLink = $(elem).parent().parent().parent().find("a").data("link");
                            if (previousLink.search("mailto") == -1) {
                                //document.getElementById("rightPanelArea").innerHTML = "<p>ADD A HYPERLINK (STANDARD LINK URL)</p><form name='submit_url' action='#' method='post' enctype='multipart/form-data'><label><p>text</p></label><textarea class='text-areaLinkGUI'></textarea><label><p>link (url)</p></label><input type='text' class='textLinkGUI' id='linkHyperLinkURL' maxlength='200' /><label><p>LINK NAME (FOR TRACKING)</p></label><input type='text' class='textLinkGUI' maxlength='200' /><p><input type='checkbox' id='dont-track'  /><label><span>DO NOT TRACK THIS LINK</span></label></p><br /><br /><br /></form>";
                                //$("#linkHyperLinkURL").val(previousLink);
                                var index1 = previousLink.search("com");
                                var value = previousLink.substring(0, (index1 + 3));
                                $("#linkHyperLinkURL").val(value);
                                index1 = previousLink.search("campaignkw=");
                                value = previousLink.substring((index1 + 11), previousLink.length);
                                $("#linkName").val(value);
                            } else {
                                //document.getElementById("rightPanelArea").innerHTML = "<div><p>ADD A Link To an email address</p><br /><br /><br /><Label><p>Email Address</p></Label><br /><input type='text' class='textLinkGUI' id='emailAddText' maxlength='200' /><br /><br /><Label><p>Email Subject</p></Label><br /><input type='text' class='textLinkGUI' id='emailSubjText' maxlength='200' /></div>";
                                var index1 = previousLink.search("com");
                                var value = previousLink.substring(7, (index1 + 3));
                                $("#emailAddText").val(value);
                                index1 = previousLink.search("subject=");
                                value = previousLink.substring((index1 + 8), previousLink.length);
                                $("#emailSubjText").val(value);
                            }
                        }

                    });
                    $("li.forwardToFriendLinkGUI").click(function () {
                        document.getElementById("rightPanelArea").innerHTML = "<p>ADD A Forward to a Friend</p><br /><br /><label><p>Text:</p></Label><textarea class='text-areaLinkGUI'>Forward This Email</textarea>";
                    });
                    $("li.unsubscribeLinkGUI").click(function () {
                        document.getElementById("rightPanelArea").innerHTML = "<p>ADD an Unsubscribe Link </p><br /><br /><label><p>Text:</p></Label><textarea class='text-areaLinkGUI'>Want to unsubscribe or change your details?</textarea>";
                    });
                    $("li.viewInBrowserLinkGUI").click(function () {
                        document.getElementById("rightPanelArea").innerHTML = "<p>ADD A Can't read email Link</p><br /><br /><label><p>Text:</p></Label><textarea class='text-areaLinkGUI'>Can't read this email Properly?</textarea>";
                    });
                    $("li.doubleOptLinkGUI").click(function () {
                        document.getElementById("rightPanelArea").innerHTML = "<p>ADD A Double opt-in Link</p><br /><br /><label><p>Text:</p></Label><textarea class='text-areaLinkGUI'>To confirm your email address, click here</textarea>";
                    });
                    $("li.safeSenderLinkGUI").click(function () {
                        document.getElementById("rightPanelArea").innerHTML = "<p>ADD A Safe Sender Message to your Email</p><br /><br /><label><p>Text:</p></Label><textarea class='text-areaLinkGUI'>To guarantee delivery of this email please add $CAMPAIGNFROMEMAIL$ to your address book and safe senders list.</textarea>";
                    });
                    $("li.newAnchorLinkGUI").click(function () {
                        document.getElementById("rightPanelArea").innerHTML = "<p>New # Anchor</p><br /><br /><label><p>Text:</p></Label><textarea class='text-areaLinkGUI'></textarea><br/><br><label><p>Anchor Name:</p></Label><input type='text' class='textLinkGUI' maxlength='200'/>";
                    });
                    $("#imageLinkDialog").dialog("open");
                })
            },
            setImageTitle: function (workingObject) {
                openImageTitleDialog(workingObject);
            }
        }
        //========================= End Sohaib Nadeem =====================////

        var isElementClicked = false;
        var buildingBlocksGlobal = null;
        
        //[Muhammad.Adnan] - Exposed Functions by CORE Code.
        var OnNewElementDropped = function (args) {
            //var args = {
            //    droppedElement: $(this),
            //    event: event,
            //    ui: ui,
            //    predefinedControl: (Html, Type)
            //};

                
         
            if (args.predefinedControl != null) {

                if (args.predefinedControl.Type == "copied" || args.predefinedControl.Type == "buildingBlock") {
                    
                    //alert(args.predefinedControl.Html.html());
                    InitializePluginsEvents(args.predefinedControl.Html);                    
                }

                if ((args.predefinedControl.Type == "text") || (args.predefinedControl.Type == "textWithImage") || (args.predefinedControl.Type == "imageWithText")) {
                   
                    InitializePluginsEvents(args.predefinedControl.Html);
                }
            }
              
            myElement.find(".ImageToolbarLeftAlignClass").click(function () {
                //DestroyPluginsEvents($(mainContentHtmlGrand.html()));
                //undoManager.registerAction(mainContentHtmlGrand.html());
                imageFunctionality.leftAlign(myElement, myElement.find("#imageDataSavingObject").data("myWorkingObject"));
                    return false;
                });
            myElement.find(".ImageToolbarCenterAlignClass").click(function () {
                //DestroyPluginsEvents($(mainContentHtmlGrand.html()));
                //undoManager.registerAction(mainContentHtmlGrand.html());
                    imageFunctionality.centerAlign(myElement, myElement.find("#imageDataSavingObject").data("myWorkingObject"));
                    return false;
                });
            myElement.find(".ImageToolbarRightAlignClass").click(function () {
                //DestroyPluginsEvents($(mainContentHtmlGrand.html()));
                //undoManager.registerAction(mainContentHtmlGrand.html());
                    imageFunctionality.rightAlign(myElement, myElement.find("#imageDataSavingObject").data("myWorkingObject"));
                    return false;
                });
            myElement.find(".ImageToolbarLinkClass").click(function () {
                //DestroyPluginsEvents($(mainContentHtmlGrand.html()));
                //undoManager.registerAction(mainContentHtmlGrand.html());
                
                    imageFunctionality.openLinkGUI(myElement.find("#imageDataSavingObject").data("myWorkingObject"));
                    return false;
                });
            myElement.find(".ImageToolbarTitleSetClass").click(function () {
                //DestroyPluginsEvents($(mainContentHtmlGrand.html()));
                //undoManager.registerAction(mainContentHtmlGrand.html());
                
                    imageFunctionality.setImageTitle(myElement.find("#imageDataSavingObject").data("myWorkingObject"));
                    return false;
                });

        }

        var OnImageDropped = function (args) {
                
            //var args = {
            //    droppedElement: $(this),
            //    event: event,
            //    ui: ui,
            //    predefinedControl: (Html, Type)
            //};
            //var htmlToPlace = "<div width='100%' ><div class='myHandle'><img src='images/move_handle.png' /></div><table width='100%'><tr><td width='100%'><div id='onlyImage' class='myImage'><img style='height:200px; width:200px;' class='imageHandlingClass resizable' src='"+ (args.droppedElement.find("img").attr("src")) +"' style='display:block;' /></div></td></tr></table></div>";
            var htmlToPlace = $("<div class='myImage'><img style='height:200px; width:200px;' class='imageHandlingClass resizable clickEvent' src='" + args.ui.draggable.find("img").attr("src") + "' style='display:block;' /></div>");

            htmlToPlace.find("img.imageHandlingClass").resizable({
                // containment: 'parent',
                // handles: "n, e, s, w, ne, se, sw, nw "
            });                

            $("#imageToolbar").data("objectType", args.predefinedControl.Type);
                                
            args.droppedElement.html(htmlToPlace);
                
        }

        var OnClickedOnElement = function (args,event) {

            //var args = {
            //    droppedElement: $(this),
            //    event: event,
            //    ui: ui,
            //    predefinedControl: (Html, Type)
            //};
            myElement.find("#imageToolbar").data("objectType", args.predefinedControl.Type);
            myElement.find("#imageDataSavingObject").data("myWorkingObject", event.target);
            myElement.find("#imageToolbar").addClass("imageToolbar-menu");
            myElement.find("#imageToolbar").show();
            myElement.find("#imageToolbar").css({ "margin-top": ($(event.target).parent().parent().parent().position().top), "margin-left": ($(event.target).parent().parent().parent().position().left) });
            /*myElement.find(".ImageToolbarLeftAlignClass").click(function () {
                //DestroyPluginsEvents($(mainContentHtmlGrand.html()));
                undoManager.registerAction(mainContentHtmlGrand.html());
                //InitializePluginsEvents($(mainContentHtmlGrand.html()));
                imageFunctionality.leftAlign(myElement, myElement.find("#imageDataSavingObject").data("myWorkingObject"));
                return false;
            });
            myElement.find(".ImageToolbarCenterAlignClass").click(function () {
                //DestroyPluginsEvents($(mainContentHtmlGrand.html()));
                undoManager.registerAction(mainContentHtmlGrand.html());
                //InitializePluginsEvents($(mainContentHtmlGrand.html()));
                imageFunctionality.centerAlign(myElement, myElement.find("#imageDataSavingObject").data("myWorkingObject"));
                return false;
            });
            myElement.find(".ImageToolbarRightAlignClass").click(function () {
                //DestroyPluginsEvents($(mainContentHtmlGrand.html()));
                undoManager.registerAction(mainContentHtmlGrand.html());
                //InitializePluginsEvents($(mainContentHtmlGrand.html()));
                imageFunctionality.rightAlign(myElement, myElement.find("#imageDataSavingObject").data("myWorkingObject"));
                return false;
            });
            myElement.find(".ImageToolbarLinkClass").click(function () {
                //DestroyPluginsEvents($(mainContentHtmlGrand.html()));
                undoManager.registerAction(mainContentHtmlGrand.html());
                //InitializePluginsEvents($(mainContentHtmlGrand.html()));
                imageFunctionality.openLinkGUI(myElement.find("#imageDataSavingObject").data("myWorkingObject"));
                return false;
            });
            myElement.find(".ImageToolbarTitleSetClass").click(function () {
                //DestroyPluginsEvents($(mainContentHtmlGrand.html()));
                undoManager.registerAction(mainContentHtmlGrand.html());
                //InitializePluginsEvents($(mainContentHtmlGrand.html()));
                imageFunctionality.setImageTitle(myElement.find("#imageDataSavingObject").data("myWorkingObject"));
                return false;
            });*/
                
        }

        var _OnDropElementOnBuildingBlock = function (args) {
            //var args = {
            //    droppedElement: $(this)                
            //    buildingBlock,
            //    event: event,
            //    ui: ui
            //};              
            // ===================== Sohaib ==========================
            // Before making a building block uninitialize image resizable
            //alert(args.buildingBlock.Html);
            //args.buildingBlock.Html.find("img.imageHandlingClass").resizable("destroy");
            //alert(args.buildingBlock.Html.html());
            if (options.OnDropElementOnBuildingBlock != null) {
                //Call overridden Method here: will use when exposing properties to developer
                options.OnDropElementOnBuildingBlock(args);
            }
                
            //Load Building Blocks
            _LoadBuildingBlocks(args);

        }

        var _OnEditBuildingBlock = function (args) {
            if (options.OnEditBuildingBlock != null) {
                //Call overridden Method here: will use when exposing properties to developer
                options.OnEditBuildingBlock(args);
            }

            _LoadBuildingBlocks(args);
        }

        var _OnDeleteBuildingBlock = function (args) {
            if (options.OnDeleteBuildingBlock != null) {
                //Call overridden Method here: will use when exposing properties to developer
                options.OnDeleteBuildingBlock(args);
            }

            _LoadBuildingBlocks(args);
        }

        var _OnEditDynamicVariation = function (args) {
            console.log("Going to edit Dynamic Variation...");
            if (options.OnEditDynamicVariation != null) {
                //Call overridden Method here: will use when exposing properties to developer
                options.OnEditDynamicVariation(args);
            }

            _LoadDynamicBlocks(args);
        }

        var _OnDeleteDynamicVariation = function (args) {
            if (options.OnDeleteDynamicVariation != null) {
                //Call overridden Method here: will use when exposing properties to developer
                options.OnDeleteDynamicVariation(args);
            }

            _LoadDynamicBlocks(args);
        }

            
        var _LoadBuildingBlocks = function (args) {
                
            if (args == null) {
                args = new Object();
            }

            //Call overridden Method here: will use when exposing properties to developer
            if (options.LoadBuildingBlocks != null) {                    
                options.LoadBuildingBlocks(args);
            }

            //Getting building blocks from provided block:
            if (args.buildingBlocks != null) {

                var count = 1;
                var listOfBuildingBlocksHtml = $("<div></div>");
                var buildingBlocksFromService = args.buildingBlocks;

                //$.parseJSON Takes a well-formed JSON string and returns the resulting JavaScript object.
                $.each(buildingBlocksFromService, function (i, obj) {
                        
                    //Assigning unique ID here:
                    obj[0].ID = obj[0]["blockId.encode"];

                    var block = $("<li class='draggableControl droppedBuildingBlock' data-type='buildingBlock' data-id='" + obj[0]["blockId.encode"] + "'>" +
                                  "<img src='images/custom-blocks.png' /><br />" +
                                  "<span class='font_75 name'>" + obj[0].name + "</span>" +
                                  "</li>");                       

                    //Initialize with default draggable:
                    InitializeMainDraggableControls(block);

                    listOfBuildingBlocksHtml.append(block);

                    count++;
                });

                var ulBuildingBlocks = myElement.find(".buildingBlockDroppable .ulBuildingBlocks");
                ulBuildingBlocks.empty();
                ulBuildingBlocks.append(listOfBuildingBlocksHtml);

                buildingBlocksGlobal = buildingBlocksFromService;
                    
            }

        }

        var _saveCallBackMethod = function()
        {
            if(options.CallBackSaveMethod != null)
            {
                var templateHTML = mainContentHtmlGrand.html();
                var outputHTML = CleanCode(myElement.find(".mainTable").outerHTML()).outerHTML();
                options.CallBackSaveMethod(templateHTML, outputHTML);
            }
        };


      




        function InitializeControls() {

            //Muhammad.Adnan
            //Main Draggable Controls
            var draggableControls = myElement.find(".draggableControl");
            InitializeMainDraggableControls(draggableControls);

            //Click on overall element:
            myElement.click(function () {

                if (!isElementClicked) {
                    //Will hide here floating elements:

                    //Sohaib 
                    RemovePopups();
                }
                isElementClicked = false;
            });

            //Building Blocks Drop Area:
            InitializeBuildingBlockDroppableArea();

            //Load building blocks from service:
            _LoadBuildingBlocks();
            //////////
           
            _LoadDynamicBlocks();
            _LoadDynamicBlockFields();
            _LoadDynamicBlockRuleConditions();
            _LoadDynamicBlockFormats();
            _LoadPersonalizeTags();
            
            myElement.find("#contentAreaDiv").scroll();
            myElement.find("#imageTitleDialog").hide();
            myElement.find(".accordion").accordion({ heightStyle: "content" });

            //TODO Styles
            myElement.find("#tabs").tabs({
                activate: function (event, ui) {
                    if (ui.newPanel.attr("id") == "tabs-1") {

                        InitializeElementsForStyle(false);
                        
                    }
                    else {

                        InitializeElementsForStyle(true);
                    }
                }
            });

            $(myElement).tooltip();

            
            myElement.find("#dialog-Preview").dialog({
                autoOpen: false,
                modal: true,
                buttons: {

                    Cancel: function () {
                        $(this).dialog("close");
                    }
                },
                width: 900
            });

            // if(firstTime && options.preDefinedHTML != null && options.preDefinedHTML != "" ) {

            //     console.log("PRE-DEFINED HTML:" + options.preDefinedHTML);
            //     mainContentHtmlGrand.html(options.preDefinedHTML);
            //     firstTime = false;
            //     InitializeControls();

            // }
            // firstTime = false;

        }

        InitializeControls();

        //---------------------------------------------------------------------------------//

        // [Sarmad.Ali] --------------- IMAGE LIBRARY ------------ //            

        //Image Parameters for Ajax Request
        var _imageAjaxParameters = null;
        if (options.ImagesAjaxProperties != null) {
            _imageAjaxParameters = new Object();
            _imageAjaxParameters.Url = options.ImagesAjaxProperties.Url;
            _imageAjaxParameters.Data = options.ImagesAjaxProperties.Data;
            _imageAjaxParameters.DataType = options.ImagesAjaxProperties.DataType != "" ? options.ImagesAjaxProperties.DataType : "json";
            _imageAjaxParameters.Type = options.ImagesAjaxProperties.Type != "" ? options.ImagesAjaxProperties.Type : "POST";
            _imageAjaxParameters.ContentType = options.ImagesAjaxProperties.ContentType != "" ? options.ImagesAjaxProperties.ContentType : "application/json; charset=latin1";
        }

        if (_imageAjaxParameters != null) {

            var LoadImagesInLibrary = function () {
                returnData = SendServerRequest(_imageAjaxParameters);
                console.log("Image return data:" + returnData.images[0].image1[0].fileName);
                //var obj = $.parseJSON(returnData.images[0].image1);
                var obj = returnData;


                //InitializeElementWithDraggable(

                var imagesHTML = getImagesMarkup(obj.images);
                if (imagesHTML != "") {
                    var oImages = $(imagesHTML);
                    
                    oImages.find(".draggableControl").andSelf().filter(".draggableControl").each(function (index, element) {
                        InitializeMainDraggableControls($(element));
                    });

                    myElement.find(".imageLib").html(oImages);

                    //getImagesMarkup(obj.images).each(function (index, element) {
                    //    alert(index);
                    //});
                    
                    //myElement.find(".searchImageButton").click(function () {
                    //    var jsonObj = filterImages($('.imageSearchInput').val(), obj)
                    //    var jsonString = eval(jsonObj);
                    //    var searchImageObj = $.parseJSON(jsonString);
                    //    var filteredImages = getImagesMarkup(searchImageObj);
                    //    myElement.find(".imageLib").html(filteredImages);
                    //});
                }
                


                

            }

            LoadImagesInLibrary();
        }

        var _searchImagesAjaxParameters = null;
        if (options.SearchImagesProperties != null) {
            _searchImagesAjaxParameters = new Object();
            _searchImagesAjaxParameters.Url = options.SearchImagesProperties.Url;
            _searchImagesAjaxParameters.Data = options.SearchImagesProperties.Data;
            _searchImagesAjaxParameters.DataType = options.SearchImagesProperties.DataType != "" ? options.SearchImagesProperties.DataType : "json";
            _searchImagesAjaxParameters.Type = options.SearchImagesProperties.Type != "" ? options.SearchImagesProperties.Type : "POST";
            _searchImagesAjaxParameters.ContentType = options.SearchImagesProperties.ContentType != "" ? options.SearchImagesProperties.ContentType : "application/json; charset=latin1";
        }

        var SearchImages = function (searchText) {
            var data = { searchText: searchText };
            _searchImagesAjaxParameters.Data = JSON.stringify(data);
            _searchImagesAjaxParameters.Url = options.SearchImagesProperties.Url + searchText;
            returnData = SendServerRequest(_searchImagesAjaxParameters);
            var obj = returnData;
            myElement.find(".imageLib").html(getImagesMarkup(obj.images));
        };

        var _AddimageAjaxParameters = null;
        if (options.AddImageProperties != null) {
            _AddimageAjaxParameters = new Object();
            _AddimageAjaxParameters.Url = options.AddImageProperties.Url;
            _AddimageAjaxParameters.Data = options.AddImageProperties.Data;
            _AddimageAjaxParameters.DataType = options.AddImageProperties.DataType != "" ? options.AddImageProperties.DataType : "json";
            _AddimageAjaxParameters.Type = options.AddImageProperties.Type != "" ? options.AddImageProperties.Type : "POST";
            _AddimageAjaxParameters.ContentType = options.AddImageProperties.ContentType != "" ? options.AddImageProperties.ContentType : "application/json; charset=latin1";
        }


        var AddImage = function (imageByteArray) {

        }

        myElement.find(".submitForm").click(function () {
            var searchText = $("#searchImage").val();
            //if (searchText != null && searchText != "")
            SearchImages(searchText);
        });

        myElement.find(".uploadFile").click(function () {
            console.log("upload file clicked.");
            if (!_deleteMode) {
                myElement.find("#myUploadFile").click();
            }
            return true;
        });

        myElement.find("#myUploadFile").change(function (e) {
            myElement.find("#form1").submit();
            //var $form = $('#form1'); // set your form ID
            // $.ajax({
            //     type: 'POST',
            //     url: $form.attr('action'),
            //     data: $form.serialize(),
            //     contentType:"multipart/form-data;",
            //     success: function (e) {
            //         console.log("Image Upload success:"+ e);
            //     },
            //     error: function (e) {
            //         console.log("Image Upload failed:"+ e);
            //     }
            // });
        
            // console.log(e);
            // var formObj = $('#form1');
            // var formURL = formObj.attr("action");
            // var formData = new FormData(formObj);
            // $.ajax({
            //     url: formURL,
            //     type: 'POST',
            //     data: formData,
            //     //mimeType:"multipart/form-data",
            //     contentType: false,
            //     cache: false,
            //     processData:false,
            //     success: function(data) {
            //         console.log("Image Upload success:"+ data);
            //     },
            //     error: function(data) {
            //         console.log("Image Upload failed:"+ data);
            //     }          
            // });
            //e.preventDefault(); //Prevent Default action.






            // LoadImagesInLibrary();
            return true;
        });


        //Callback handler for form submit event
        $("#form1").submit(function(e) {
 
            var formObj = $(this);
            var formURL = formObj.attr("action");
            var formData = new FormData(this);
            $.ajax({
                url: formURL,
                type: 'POST',
                data:  formData,
                mimeType:"multipart/form-data",
                contentType: false,
                cache: false,
                processData:false,
                success: function(data, textStatus, jqXHR) {
                    console.log("Image Upload success:"+ e);
                    LoadImagesInLibrary();
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.log("Image Upload failed:"+ e);
                }          
            });
            e.preventDefault(); //Prevent Default action.

        });
 

        var p; var canvas = document.createElement("canvas");
        var img1 = document.createElement("img");

        function getBase64Image() {
            p = document.getElementById("fileUpload").value;
            img1.setAttribute('src', p);
            canvas.width = img1.width;
            canvas.height = img1.height;
            var ctx = canvas.getContext("2d");
            ctx.drawImage(img1, 0, 0);
            var dataURL = canvas.toDataURL("image/png");
            alert("from getbase64 function" + dataURL);
            return dataURL;
        }

        function ClearData() {
            _LastSelectedImageId = null;
            _LastSelectedImageTags = null;
            _LastSelectedImageName = null;
        }


       /* function decodeHTML(str){
            //decoding HTML entites to show in textfield and text area 
            str = str.replace(/:/g,":");
            str = str.replace(/'/g,"\???"); 
            str = str.replace(/=/g,"=");
            str = str.replace(/(/g,"(");
            str = str.replace(/)/g,")");
            str = str.replace(/</g,"<");
            str = str.replace(/>/g,">");
            str = str.replace(/>/g,">"); 
            str = str.replace(/ /g," "); 
            str = str.replace(/"/g,"\"");
            str = str.replace(/&line;/g,"\n");
            return str;
        }*/

        $(".imageLib").on("click", "li", function () {
            UnSelectAllImages();
            $(this).css("background", "#429bf9");
            if (_deleteMode)
                $(this).addClass("del-active");
            var selectedImage = $(this).children().first();
            if (selectedImage.data("id") != null && selectedImage.data("id") != "")
                StoreSelectedImageData(selectedImage);
        });

        $(".ulBuildingBlocks").on("click", "li", function () {
            _LastSelectedBuildingBlock = $(this);
             UnSelectAllBlocks();
            $(this).css("background", "#429bf9");
        });

        $(".ulDynamicBlocks").on("click", "li", function () {
            _LastSelectedDynamicBuildingBlock = $(this);
             UnSelectAllDynamicBlocks();
            $(this).css("background", "#429bf9");
        });

        $(".editBB").click(function () {
            if (_LastSelectedBuildingBlock != null) {
                var name = _LastSelectedBuildingBlock.children("span").text();
                myElement.find(".editBlockInputName").val(name);
                InitializeBuildingBlockUpdatePopup();
                //_LastSelectedBuildingBlock = null;
            }
            else {
                alert("Please Select a Block First");
            }
        });

        $(".deleteBB").click(function () {
            if (_LastSelectedBuildingBlock != null) {
                var id = _LastSelectedBuildingBlock.data("id");
                var isDel = confirm("Are you sure you want to delete this Block");
                if (isDel) {
                    // Delete Block Server Call
                    var args = {
                        buildingBlock: null
                    };

                    //var txtPlaceHolder = $(this).find(".txtPlaceHolder");
                    //args.buildingDialogBox = $(this);

                    var buildingBlock = new Object();
                    //buildingBlock.Name = $(this).find(".txtPlaceHolder").val();
                    buildingBlock.Id = _LastSelectedBuildingBlock.data("id");
                    args.buildingBlock = buildingBlock;
                    //$(this).dialog('destroy');
                    _OnDeleteBuildingBlock(args);
                    _LastSelectedBuildingBlock = null;
                    UnSelectAllDynamicBlocks();
                    //_LastSelectedBuildingBlock = null;
                }
                else {
                    _LastSelectedBuildingBlock = null;
                    UnSelectAllDynamicBlocks();
                }
                //myElement.find(".editBlockInputName").val(name);
                //InitializeBuildingBlockUpdatePopup();
            }
            else {
                alert("Please Select a Block First");
            }
        });

        $(".editDBB").click(function () {
            if (_LastSelectedDynamicBuildingBlock != null) {
                var name = _LastSelectedDynamicBuildingBlock.children("span").text();
                myElement.find(".editdynamicBlockInputName").val(name);
                InitializeDynamicBuildingBlockUpdatePopup();
                return false;
            }
            else {
                alert("Please Select a Block First");
                return false;
            }
        });

        $(".deleteDBB").click(function () {
            if (_LastSelectedDynamicBuildingBlock != null) {
                var id = _LastSelectedDynamicBuildingBlock.data("id");
                var isDel = confirm("Are you sure you want to delete this Block");
                if (isDel) {
                    // Delete Block Server Call
                    var args = {
                        buildingBlock: null
                    };

                    //var txtPlaceHolder = $(this).find(".txtPlaceHolder");
                    //args.buildingDialogBox = $(this);

                    var dynamicVariation = new Object();
                    //buildingBlock.Name = $(this).find(".txtPlaceHolder").val();
                    dynamicVariation.Id = _LastSelectedDynamicBuildingBlock.data("id");
                    args.dynamicVariation = dynamicVariation;
                    //$(this).dialog('destroy');
                    _OnDeleteDynamicVariation(args);
                    _LastSelectedDynamicBuildingBlock = null;
                    UnSelectAllDynamicBlocks();
                    //_LastSelectedBuildingBlock = null;
                }
                else {
                    _LastSelectedDynamicBuildingBlock = null;
                    UnSelectAllDynamicBlocks();
                }
                //myElement.find(".editBlockInputName").val(name);
                //InitializeBuildingBlockUpdatePopup();
                return false;
            }
            else {
                alert("Please Select a Block First");
                return false;
            }
        });

        $('.MenuCallBackSave').click(function(){
            _saveCallBackMethod();
        });

        var _LastSelectedImageId = null;
        var _LastSelectedImageTags = null;
        var _LastSelectedImageName = null;
        var _LastSelectedBuildingBlock = null;
        var _LastSelectedDynamicBuildingBlock = null;
        function StoreSelectedImageData(image) {
            console.log(image);
            _LastSelectedImageId = image.data("id") != "" && image.data("id") != null ? image.data("id") : "";
            _LastSelectedImageTags = image.data("tags") != "" && image.data("tags") != null ? image.data("tags") : "";
            _LastSelectedImageName = image.data("name") != "" && image.data("name") != null ? image.data("name") : "";
            console.log("ID:" +_LastSelectedImageId);
        }

        function UnSelectAllImages() {
            $('.imageLib li').each(function () {
                $(this).css("background", "#71737a");
                $(this).removeClass("del-active");
            });
        }

        function UnSelectAllBlocks() {
            $('.ulBuildingBlocks li').each(function () {
                $(this).css("background", "#71737a");
                //$(this).removeClass("del-active");
            });
        }

        function UnSelectAllDynamicBlocks() {
            $('.ulDynamicBlocks li').each(function () {
                $(this).css("background", "#71737a");
                //$(this).removeClass("del-active");
            });
        }

        $('#imageTagsPopup').dialog({
            autoOpen: false,
            position: 'center',
            title: 'Add Update Tags',
            draggable: false,
            width: 760,
            height: 600,
            resizable: false,
            modal: true,
            buttons: [
            {
                text: "Close",
                click: function () {
                    $(this).dialog("close");
                    ClearData();
                    UnSelectAllImages();
                }
            }
            ]
        });

        $('.AddUpdateTags').click(function () {
            if (!_deleteMode) {
                if (_LastSelectedImageId != null && _LastSelectedImageId != "") {
                    $('#imageTagsPopup').load("AddUpdateTags.html", function () {
                        LoadExistingTags();
                        BindEventsOfPopup();
                        $("#imageTagsPopup").dialog("open");
                    });
                    //LoadExistingTags();
                }
                else
                    alert("Please Select Image First to Tag");
            }
            return false;
        });



        function LoadExistingTags() {
            if (_LastSelectedImageTags != null && _LastSelectedImageTags != "") {
                var existingtagsList = _LastSelectedImageTags.split(",");
                if (existingtagsList.length > 0) {
                    var tagsListHTML = "";
                    for (var i = 0; i < existingtagsList.length; i++) {
                        tagsListHTML += "<li>" + existingtagsList[i] + "<a href='#' class='RemoveTag'><span>X</span></a></li>";
                    }
                    //tagsListHTML += "</ul>";
                    $('.TagsList').html(tagsListHTML);
                    $('.TagsContainer').show();
                }
            }
        }

        var _saveImageTagsAjaxParameters = null;
        if (options.SaveImageTagsProperties != null) {
            _saveImageTagsAjaxParameters = new Object();
            _saveImageTagsAjaxParameters.Url = options.SaveImageTagsProperties.Url ;
            _saveImageTagsAjaxParameters.Data = options.SaveImageTagsProperties.Data;
            _saveImageTagsAjaxParameters.DataType = options.SaveImageTagsProperties.DataType != "" ? options.SaveImageTagsProperties.DataType : "json";
            _saveImageTagsAjaxParameters.Type = options.SaveImageTagsProperties.Type != "" ? options.SaveImageTagsProperties.Type : "POST";
            _saveImageTagsAjaxParameters.ContentType = options.SaveImageTagsProperties.ContentType != "" ? options.SaveImageTagsProperties.ContentType : "application/json; charset=latin1";
        }

        var SaveImageTags = function () {
            if (_LastSelectedImageId != null && _LastSelectedImageId != "") {
                if (_LastSelectedImageTags != null && _LastSelectedImageTags != "") {
                    var data = { imageId: _LastSelectedImageId, tags: _LastSelectedImageTags };
                    var jsonData = JSON.stringify(data);
                    _saveImageTagsAjaxParameters.Data = jsonData;
                    _saveImageTagsAjaxParameters.Url = options.SaveImageTagsProperties.Url + _LastSelectedImageId + "&tags=" + _LastSelectedImageTags;
            
                    returnData = SendServerRequest(_saveImageTagsAjaxParameters);
                    $("#imageTagsPopup").dialog("close");
                    ClearData();
                    UnSelectAllImages();
                    LoadImagesInLibrary();
                }
                else
                    alert("There are no tags defined for this photo");
            }
        }

        function BindEventsOfPopup() {
            $("#btnAddTag").on("click", function () {
                var newTag = $("#inputTag").val();
                if (newTag != "") {
                    if (_LastSelectedImageTags != null && _LastSelectedImageTags != "") {
                        $('.TagsList').append("<li>" + newTag + "<a href='#' class='RemoveTag'><span>X</span></a></li>");
                        _LastSelectedImageTags += "," + newTag;
                    }
                    else {
                        $('.TagsList').html("<li>" + newTag + "<a href='#' class='RemoveTag'><span>X</span></a></li>");
                        _LastSelectedImageTags += newTag;
                    }

                    //BindRemove();
                    $("#inputTag").val("");
                }
                else
                    alert("Please Enter Valid Tag");

                return false;
            });

            BindRemove();

            $("#btnSaveTags").on("click", function () {
                SaveImageTags();
            });
        }
        function BindRemove() {
            $(".RemoveTag").on("click", "span", function () {
                var removedTag = $(this).closest("li").clone().children().remove().end().text();
                RemoveTag(removedTag);
                $(this).closest("li").remove();

            });
        }

        function RemoveTag(tag) {
            if (_LastSelectedImageTags.indexOf(",") >= 0) {
                var tags = _LastSelectedImageTags.split(",");
                for (var i = 0; i < tags.length; i++) {
                    if (tags[i] == tag) {
                        tags.splice(i, 1);
                        _LastSelectedImageTags = tags.join(",");
                    }
                }
            }
            else
                _LastSelectedImageTags = "";
        }

        function ToggleDeleteMode() {
            if (!_deleteMode) {
                _deleteMode = true;
                UnSelectAllImages();
                ClearData();
                $('.del-menu').show();
            }
            else {
                _deleteMode = false;
                UnSelectAllImages();
                ClearData();
                $('.del-menu').hide();
            }
        }

        _deleteMode = false;
        $(".deleteMode").click(function () {
            ToggleDeleteMode();
            return false;
        });

        $('.cancel-del').click(function () {
            _deleteMode = false;
            UnSelectAllImages();
            ClearData();
            $('.del-menu').hide();
            return false;
        });

        var _deleteImageAjaxParameter = null;
        if (options.DeleteImageProperties != null) {
            _deleteImageAjaxParameter = new Object();
            _deleteImageAjaxParameter.Url = options.DeleteImageProperties.Url;
            _deleteImageAjaxParameter.Data = options.DeleteImageProperties.Data;
            _deleteImageAjaxParameter.DataType = options.DeleteImageProperties.DataType != "" ? options.DeleteImageProperties.DataType : "json";
            _deleteImageAjaxParameter.Type = options.DeleteImageProperties.Type != "" ? options.DeleteImageProperties.Type : "POST";
            _deleteImageAjaxParameter.ContentType = options.DeleteImageProperties.ContentType != "" ? options.DeleteImageProperties.ContentType : "application/json; charset=latin1";
        }

        var DeleteImage = function () {
            if (_LastSelectedImageName != null && _deleteMode == true) {

                var data = { imageName: _LastSelectedImageName };
                var jsonData = JSON.stringify(data);
                _deleteImageAjaxParameter.Data = jsonData;
                _deleteImageAjaxParameter.Url = options.DeleteImageProperties.Url + _LastSelectedImageId;
                returnData = SendServerRequest(_deleteImageAjaxParameter);
                ToggleDeleteMode();
                LoadImagesInLibrary();
                _LastSelectedImageId = null;
            }
            else
                alert("Image Not Deleted");
        }

        $('.confirm-del').click(function () {
            DeleteImage();
            return false;
        });

        $('.gridView').click(function () {
            $('.imageLib').removeClass("listing");
            return false;
        });

        $('.listView').click(function () {
            $('.imageLib').addClass("listing");
            return false;
        });
                
        // ------------------------------------------------------------------------------------------------------------------//

            //[Sohaib.Nadeem] - --------------- IMAGE FUNCTIONALITY ------------ // 
                $("#imageLinkDialog").dialog({
                    autoOpen: false,
                    position: 'center',
                    title: 'Link Gui',
                    draggable: false,
                    width: 760,
                    height: 600,
                    resizable: false,
                    modal: true,
                    buttons: [
                        {
                            text: "Insert",                            
                            click: function () {
                                if ($("#linkTrack").data("linkObject") == "image") {
                                    attachLinkWithElement(myElement.find("#imageDataSavingObject").data("myWorkingObject"));
                                } else if ($("#linkTrack").data("linkObject") == "text") {
                                    var myvar = "<a href='#' style='text-decoration:underline;'>" + $("#linkTextArea").val() + "</a>";
                                    //tinyMCE.activeEditor.selection.setContent(myvar);
                                    $("#currTinyMCE").data("myTinyMCE").setContent(myvar)
                                    //tinyMCE.activeEditor.selection.getNode().setAttribute("data", $("#linkHyperLinkURL").val() + "?campaignkw=" + $("#linkName").val());
                                    $("#currTinyMCE").data("myTinyMCE").getNode().setAttribute("data", $("#linkHyperLinkURL").val() + "?campaignkw=" + $("#linkName").val());
                                }
                                $(this).each(function (index) {
                                    $(this).dialog("close");
                                });
                                
                                
                            }
                        },
                        {
                            text: "Close",
                            click: function () {                                
                                $(this).each(function (index) {
                                    $(this).dialog("close");
                                });
                            }
                        }
                    ]
                });
            

            $("#fontColorDialog").dialog({
                    autoOpen: false,
                    position: 'center',
                    title: 'Font Color Picker',
                    draggable: false,
                    width: 300 ,
                    height: 450,
                    resizable: false,
                    modal: true,
                    /*buttons: [
                        {
                            text: "OK",                            
                            click: function () {
                                // if ($("#linkTrack").data("linkObject") == "text") {
                                //     var myvar = "<a href='#' style='text-decoration:underline;'>" + $("#linkTextArea").val() + "</a>";
                                //     //tinyMCE.activeEditor.selection.setContent(myvar);
                                //     $("#currTinyMCE").data("myTinyMCE").setContent(myvar)
                                //     //tinyMCE.activeEditor.selection.getNode().setAttribute("data", $("#linkHyperLinkURL").val() + "?campaignkw=" + $("#linkName").val());
                                //     $("#currTinyMCE").data("myTinyMCE").getNode().setAttribute("data", $("#linkHyperLinkURL").val() + "?campaignkw=" + $("#linkName").val());
                                // }
                                // $(this).each(function (index) {
                                //     $(this).dialog("close");
                                // });
                                var divFontColorPicker = $(".divFontColorPicker");
                                var selectedColor = divFontColorPicker.minicolors('value');
                                console.log("selected COlor:"+ selectedColor);
                            }
                        },
                        {
                            text: "Close",
                            click: function () {                                
                                $(this).each(function (index) {
                                    $(this).dialog("close");
                                });
                            }
                        }
                    ]*/
                });
            

            
    }
});





jQuery.fn.visible = function () {
    return this.css('visibility', 'visible');
};

jQuery.fn.invisible = function () {
    return this.css('visibility', 'hidden');
};

jQuery.fn.visibilityToggle = function () {
    return this.css('visibility', function (i, visibility) {
        return (visibility == 'visible') ? 'hidden' : 'visible';
    });
};

jQuery.fn.removeInlineStyle = function (property) {

    if (property == null)
        return this.removeAttr('style');

    var proporties = property.split(/\s+/);

    return this.each(function () {
        var remover =
        this.style.removeProperty   // modern browser
        || this.style.removeAttribute   // old browser (ie 6-8)
        || jQuery.noop;  //eventual

        for (var i = 0 ; i < proporties.length ; i++)
            remover.call(this.style, proporties[i]);

    });
};

jQuery.fn.isEmpty = function() {

    var el = this;

    if ($.trim(el.html()) == true || $.trim(el.html()) === "&nbsp;") {
        return true;
    }
    else {
        return false;
    }

}