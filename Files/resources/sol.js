(function() {
    "use strict";
	
    // retrieve data
    var dropData = "dropData.ashx"; // this script gets data from a selection in a dropdown menu
    var script = "sol.ashx"
    // XMLHttpRequest object
    var xmlhttp = null;
    // json data received from handler
    var json = null;

	// page variables
    var sizeList = null;
    var sponsorList = null;
    //var btnAgreed = null;
    //var btnPending = null;
    //var btnDeclined = null;
	var lblSponsor = null;
	var lblContact = null;
	var lblAddress = null;
	var lblPhone = null;
	var lblEmail = null;
	var lblNotes = null;
	
    // inital loading event
    window.addEventListener("load", onInit);
	
	// ------------------------------------------------------------ private methods

    function getData() {
        // construct the JSON object to send to the handler
		var sendJSON = {
            "value": sponsorList[sponsorList.selectedIndex].value
		}

        // turn object into a string
		var sendString = JSON.stringify(sendJSON);

        // send string to the server handler
		xmlhttp = new XMLHttpRequest();
		xmlhttp.addEventListener("readystatechange", onResponse);
		xmlhttp.open("POST", dropData, true);
        // tell the server what you're doing
		xmlhttp.setRequestHeader("Content-type", "application/json");
        // send it
		xmlhttp.send(sendString);
    }

	// ------------------------------------------------------------ event handlers
	
    function onInit() {
        console.log(">> initializing");
		
		// for controls using runat="server"
		// http://stackoverflow.com/questions/20227170/accessing-asp-net-controls-using-jquery-all-options
		// http://stackoverflow.com/questions/11986282/how-do-i-pass-asp-net-control-name-to-javascript-function
		
		// get references
        sizeList = document.getElementById("sizeList");
        sponsorList = document.getElementById("sponsorList");
        //btnAgreed = document.getElementById("btnAgreed");
        //btnPending = document.getElementById("btnPending");
        //btnDeclined = document.getElementById("btnDeclined");
		lblSponsor = document.getElementById("lblSponsor");
		lblContact = document.getElementById("lblContact");
		lblAddress = document.getElementById("lblAddress");
		lblPhone = document.getElementById("lblPhone");
		lblEmail = document.getElementById("lblEmail");
		lblNotes = document.getElementById("lblNotes");
		
        // add event listener to the dropdowns
		sizeList.addEventListener("change", onSize);
		sponsorList.addEventListener("change", onChange);

        // add event listeners to the buttons
		//btnAgreed.addEventListener("click", onChange);
		//btnPending.addEventListener("click", onChange);
		//btnDeclined.addEventListener("click", onChange);

        // disable button and reset index on startup
		btnAgreed.disabled = true;
		sizeList.selectedIndex = 0;
		sponsorList.selectedIndex = 0;
		//console.log(sponsorList.selectedIndex);
		//console.log(sponsorList.tabIndex);
		//console.log(sponsorList[0]);
		//console.log(sponsorList[0].value);
		//console.log($("#sponsorList :selected"));

        // reference to selected listItem in dropdown
		//var listItem = $("#sampleList :selected");

        // grab data from server to populate the screen
		getData();

    }

    function onSize(e) {
        //console.log(e.target.selectedIndex);
        // button check - disable if no size is selected
        if (e.target.selectedIndex === 0) {
            btnAgreed.disabled = true;
        } else {
            btnAgreed.disabled = false;
        }

    }

    function onChange(e) {
        // change the interface
        getData();
    }

    // ---------------------------------------------------------------- data response

    function onResponse(e) {
        if ((xmlhttp.readyState === 4) && (xmlhttp.status === 200)) {
            // get the json data received
            json = JSON.parse(xmlhttp.responseText);
            // populate the screen
            lblSponsor.innerHTML = sponsorList[sponsorList.selectedIndex].value;
            lblContact.innerHTML = json.contact;
            lblAddress.innerHTML = json.address;
            lblPhone.innerHTML = json.phone;
            lblEmail.innerHTML = json.email;
            lblNotes.innerHTML = json.notes;
        }
    }
	
})();