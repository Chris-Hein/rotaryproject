(function() {
    "use strict";
	
	// loop variable
	var n = 0;
	
	// page variables
	var lblBusName = null;
	var txtBusName = null;
	var lblBusAddress = null;
	var txtBusAddress = null;
	var lblPhone = null;
	var txtPhone = null;
	var lblEmail = null;
	var txtEmail = null;
	var lblDescription = null;
	var txtDescription = null;
	var lblNotes = null;
	var txtNotes = null;
	
	var btnAgreed = null;
	var btnEdit = null;
	var btnDeclined = null;
	var btnApply = null;
	
    // inital loading event
    window.addEventListener("load", onInit);
	
	// ------------------------------------------------------------ private methods
	
	// ------------------------------------------------------------ event handlers
	
    function onInit() {
        console.log(">> initializing");
		
		// for controls using runat="server"
		// http://stackoverflow.com/questions/20227170/accessing-asp-net-controls-using-jquery-all-options
		// http://stackoverflow.com/questions/11986282/how-do-i-pass-asp-net-control-name-to-javascript-function
		
		// get references
		lblBusName = document.getElementById("lblBusName");
		txtBusName = document.getElementById("txtBusName");
		lblBusAddress = document.getElementById("lblBusAddress");
		txtBusAddress = document.getElementById("txtBusAddress");
		lblPhone = document.getElementById("lblPhone");
		txtPhone = document.getElementById("txtPhone");
		lblEmail = document.getElementById("lblEmail");
		txtEmail = document.getElementById("txtEmail");
		lblDescription = document.getElementById("lblDescription");
		txtDescription = document.getElementById("txtDescription");
		lblNotes = document.getElementById("lblNotes");
		txtNotes = document.getElementById("txtNotes");
		
		btnAgreed = document.getElementById("btnAgreed");
		btnEdit = document.getElementById("btnEdit");
		btnDeclined = document.getElementById("btnDeclined");
		btnApply = document.getElementById("btnApply");
		
		// grab data from database and display it
		
		
		// add event listeners to the buttons
		btnAgreed.addEventListener("mouseenter", hoverAgreed);
		btnAgreed.addEventListener("mouseleave", hoverAgreed);
		btnAgreed.addEventListener("click", onClick);
		
		btnEdit.addEventListener("mouseenter", hoverEdit);
		btnEdit.addEventListener("mouseleave", hoverEdit);
		btnEdit.addEventListener("click", onClick);
		
		btnDeclined.addEventListener("mouseenter", hoverDeclined);
		btnDeclined.addEventListener("mouseleave", hoverDeclined);
		btnDeclined.addEventListener("click", onClick);
		
		btnApply.addEventListener("mouseenter", hoverApply);
		btnApply.addEventListener("mouseleave", hoverApply);
		btnApply.addEventListener("click", onClick);
		
    }
	
	function hoverAgreed(e) {
		// which event?
		if (e.type === "mouseenter") {
			document.getElementById("btnAgreed").src = "images/agreed_hover.svg";
		} else {
			document.getElementById("btnAgreed").src = "images/agreed.svg";
		}
	}
	
	function hoverEdit(e) {
		// which event?
		if (e.type === "mouseenter") {
			document.getElementById("btnEdit").src = "images/edit_hover.svg";
		} else {
			document.getElementById("btnEdit").src = "images/edit.svg";
		}
	}
	
	function hoverDeclined(e) {
		// which event?
		if (e.type === "mouseenter") {
			document.getElementById("btnDeclined").src = "images/declined_hover.svg";
		} else {
			document.getElementById("btnDeclined").src = "images/declined.svg";
		}
	}
	
	function hoverApply(e) {
		// which event?
		if (e.type === "mouseenter") {
			document.getElementById("btnApply").src = "images/apply_hover.svg";
		} else {
			document.getElementById("btnApply").src = "images/apply.svg";
		}
	}
	
	function onClick(e) {
		// which button was clicked?
		switch (e.target.id) {
			case "btnAgreed":
				// confirm message
			
				// send details
				
				break;
			case "btnDeclined":
				// confirm message
				
				// send details
				
				break;
			case "btnEdit":
				// switch to edit mode
				// hide selection pane
				document.getElementById("divSelection").style.display = 'none';
				
				// hide elements that aren't to be seen
				// should be an equal number of textarea tags and span tags
				var spans = document.getElementsByTagName("span");
				var txts = document.getElementsByTagName("textarea");
				
				for (n=0;n<spans.length;n++) {
					// move data from span tag to it's respective textarea
					txts[n].innerHTML = spans[n].innerHTML; //textContent
					// hide span, display textarea
					spans[n].classList.add('hidden');
					txts[n].classList.remove('hidden');
				}
				
				// display apply button
				document.getElementById("divApply").classList.remove('hidden');
				
				break;
			case "btnApply":
				// send/update details
				
				// switch back to standard mode
				document.getElementById("divSelection").style.display = 'block';
				
				// hide elements that aren't to be seen
				// should be an equal number of textarea tags and span tags
				var spans = document.getElementsByTagName("span");
				var txts = document.getElementsByTagName("textarea");
				
				for (n=0;n<spans.length;n++) {
					// move data from textarea back to span tag
					spans[n].innerHTML = txts[n].innerHTML; //textContent
					// hide textareas, display spans
					spans[n].classList.remove('hidden');
					txts[n].classList.add('hidden');
				}
				
				// hide apply button
				document.getElementById("divApply").classList.add('hidden');
				
				// send data to database
				
				break;
		}
	}
	
})();