$(document).ready(function () {
    "use strict";
    // retrieve server sided script
    var script = "./photographer.ashx";        
    // json data received from handler
    var json = null; 
    var list = $("#sponsorList");
    var count = 0;                
        
    //===========================================POPULATE
    // populate the dropdown menu
    function populateDropDown() {

        for (var i = 0; i < count; i++) {
            // ADDING DROPDOWN LIST CONTENT
            // create element for dropdown
            var option = $("<option />");
            //put the name in the dropdown
            $(option).text(json.samples[i].name);
            // store data for each sample in the listItem
            $(option).prop("id", json.samples[i].id);
            $(option).prop("id", json.samples[i].id);
            $(option).prop("name", json.samples[i].name);
            $(option).prop("message", json.samples[i].message);
            $(option).prop("email", json.samples[i].email);
            $(option).prop("address", json.samples[i].address);
            $(option).prop("phone", json.samples[i].phone);
            $(option).prop("business", json.samples[i].business);
            $(option).prop("image", json.samples[i].image)

            // add element to adminList as a new option
            list.append(option);           
                
            // ADDING VIEW ALL CONTENT
            var template = $("#editContent");
            // clone it
            var form = template.clone();
            // change id to avoid referencing conflicts on next loop
            $(form).prop("id", "sample" + i);
            // populate it using HTML DOM            
            $("#lblName").text(json.samples[i].name);
            $("#lblBus").text(json.samples[i].business);
            $("#lblEmail").text(json.samples[i].email); 
            $("#lblAddress").text(json.samples[i].address);            
            $("#lblPhone").text(json.samples[i].phone);            
            $("#imgView").prop("image", json.samples[i].image);          
                
        }
        // add event listener to dropdown
        list.on("change", onChanged);
        
    }

    //============================================= FIELD CHECK
    function onFieldCheck(e) {
        // check if something in the messagebox, if not disable the buttons
        
    }

    /**
     * ================================================ONCHANGED
     * @param {*} e 
     */
    function onChanged(e) {
        // reference to selected listItem in dropdown
        var listItem = $("#adminList :selected");
        // updating interface
        $("#lblName").val($(listItem).prop("name"));
        $("#lblBus").val($(listItem).prop("business"));
        $("#lblEmail-").val($(listItem).prop("email"));       
        $("#lblAddress").val($(listItem).prop("address"));  
        $("#lblPhone").val($(listItem).prop("phone"));  
        $("#imgView").val($(listItem).prop("image"));
    }       
    
    //==================================================ONEMPTY
    function onEmpty(e){
        //simple function to be called when the inputs need to be cleared
        $("#txtMessage").val("");        
    }    

//============================================================================BUTTONS
//=================================================================SEARCH
    $("#btnSearch").click (function onSearch(){
        if (($("#lblName").val()) && ($("#lblBus").val()) && validateUrl($("#txtUrl").val()) && validateName($("#txtDesc").val())){
            var searchItem = $("#adminList :selected").prop("id");
            //save all the changed fields        
            var sendJSON = {
                id: search,
                name: $("#lblName").val(),
                business: $("#lblBus").val(),
                message: $("#txtMessage").val(),
                email: $("#lblEmail").val(),
                address: $("#lblAddress").val(),
                phone: $("#lblPhone").val()      
            };
            //stringify the above so it can get posted
            var sendString = JSON.stringify(sendJSON);
            console.log(sendString);
            //send it out with AJAX
            $.ajax({
                    type:"POST",
                    url:script,
                    contentType:"application/JSON",
                    data:sendString,
                    success: onResponse,
                    error: onError
                });
                console.log("POSTED");      
        }
    });
//================================================================SEND
    $("#btnSend").click (function onSend() {
        if (($("#txtMessage").val()!=null)){                  
        // TODO SEND EMAIL    
            
                console.log("POSTED"); 
        
        }
    
    });
//===============================================================================
//======================================================================================== END BUTTONS
    /**
     * ==================================================Radio CLICK
     */

    $("#Radio").change( function() {
        console.log("CHANGED");
        //check the radio buttons and the drop down
        //apply necessary filters
        $("#").toggle(("display:", "block") || ("display:", "none"));        
        $("#").toggle(("display:", "block") || ("display:", "none"));        
        $("#").toggle(("display:", "block") || ("display:", "none"));        
        
        if ($("#showall").is(':checked')){            
            onChanged();  
            console.log("showAllChecked");
        }
        if  ($("#pending").is(':checked')){
            onChanged();            
            console.log("pendingChecked");
        }        
        if ($("#complete").is(':checked')){
            onChanged();
            console.log("completeChecked");
        }
    });

    /**
     * ===================================================RESPONSE 
     * @param {*} result 
     * @param {*} textStatus 
     * @param {*} xmlhttp 
     */
    function onResponse(result, textStatus, xmlhttp) {
        // grab JSON response from server and parse
        json = result;
        // how many samples are in the JSON?
        count = json.samples.length;        
        if (count > 0) {
            populateDropDown();     
            // get the json data received
            json = JSON.parse(xmlhttp.responseText);
            // populate the screen           
        } else {
            
                                   
        } 
    }
    /**
     * 
     * @param {*} xmlhttp 
     * @param {*} textStatus 
     */
    function onError(xmlhttp, textStatus) {
        console.log("Error in AJAX");
    } 

    function onUpdateError(xmlhttp, textStatus) {
        console.log("Error in Update AJAX");
    } 

     $.ajax({
        type: "GET",
        url: script + "?tricky=" + Math.random(),
        contentType: "application/json",
        success: onResponse,
        error: onError
    });
});