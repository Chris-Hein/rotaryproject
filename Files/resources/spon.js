(function() {
    "use strict";
	
    // inital loading event
    window.addEventListener("load", onInit);
	
	// ------------------------------------------------------------ private methods
	
	// ------------------------------------------------------------ event handlers
	
    function onInit() {
        console.log(">> initializing");
		
		// for controls using runat="server"
		// http://stackoverflow.com/questions/20227170/accessing-asp-net-controls-using-jquery-all-options
		// http://stackoverflow.com/questions/11986282/how-do-i-pass-asp-net-control-name-to-javascript-function
		
		// add event listeners to the buttons
		if (document.getElementById("btnAccept") !== null) {
			document.getElementById("btnAccept").addEventListener("mouseenter", hoverAccept);
			document.getElementById("btnAccept").addEventListener("mouseleave", hoverAccept);
		}
		if (document.getElementById("btnEdit") !== null) {
			document.getElementById("btnEdit").addEventListener("mouseenter", hoverEdit);
			document.getElementById("btnEdit").addEventListener("mouseleave", hoverEdit);
		}
		if (document.getElementById("btnDeny") !== null) {
			document.getElementById("btnDeny").addEventListener("mouseenter", hoverDeny);
			document.getElementById("btnDeny").addEventListener("mouseleave", hoverDeny);
		}
		if (document.getElementById("btnApply") !== null) {
			document.getElementById("btnApply").addEventListener("mouseenter", hoverApply);
			document.getElementById("btnApply").addEventListener("mouseleave", hoverApply);
		}
    }
	
	function hoverAccept(e) {
		// which event?
		if (e.type === "mouseenter") {
			document.getElementById("btnAccept").src = "images/accept_hover.svg";
		} else {
			document.getElementById("btnAccept").src = "images/accept.svg";
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
	
	function hoverDeny(e) {
		// which event?
		if (e.type === "mouseenter") {
			document.getElementById("btnDeny").src = "images/deny_hover.svg";
		} else {
			document.getElementById("btnDeny").src = "images/deny.svg";
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
	
})();