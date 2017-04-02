(function() {
    "use strict";
	
    // server side handler urls
    var edit = "spon.ashx";

    // XMLHttpRequest object
    var xmlhttp;
    // the JSON received from the server
    var json = null;

    // regular expression object for form validation
    var textRegex = /^[\w\s\.\,\!\-\&]+$/;
    // http://stackoverflow.com/questions/123559/a-comprehensive-regex-for-phone-number-validation
    var phoneRegex = /^(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:\(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})(?:\s*(?:#|x\.?|ext\.?|extension)\s*(\d+))?$/;
    // http://stackoverflow.com/questions/46155/validate-email-address-in-javascript
    var emailRegex = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

    // interface objects
    var lblBusName = document.getElementById("lblBusName");
    var txtBusAddress = document.getElementById("txtBusAddress");
    var lblBusAddress = document.getElementById("lblBusAddress");
    var txtPhone = document.getElementById("txtPhone");
    var lblPhone = document.getElementById("lblPhone");
    var txtEmail = document.getElementById("txtEmail");
    var lblEmail = document.getElementById("lblEmail");

    var txtFrontRow = document.getElementById("txtFrontRow");
    var lblFrontRow = document.getElementById("lblFrontRow");
    var txtMiddleRow = document.getElementById("txtMiddleRow");
    var lblMiddleRow = document.getElementById("lblMiddleRow");
    var txtBackRow = document.getElementById("txtBackRow");
    var lblBackRow = document.getElementById("lblBackRow");
    var txtMissing = document.getElementById("txtMissing");
    var lblMissing = document.getElementById("lblMissing");

    var btnEdit = document.getElementById("btnEdit");
    var btnApply = document.getElementById("btnApply");

    var lblFeedback = document.getElementById("lblFeedback");

    // grab the current boder color
    var border = txtBusAddress.style.borderColor;
    var error = "#FF0000";

    // other variables

    // construct Spinner object (spin.js) and add to loadingOverlay <div>
    var spinner = new Spinner({ color: '#FF0000', lines: 12 }).spin(document.getElementById("loadingOverlay"));

    // entry point
    window.addEventListener("load", onInit);
	
    // ------------------------------------------------------------ start

    function onInit() {
        console.log(">> initializing");

        // hide elements
        notloading();
        hideEdit();

        // add event listeners to the buttons
        btnEdit.addEventListener("click", onEdit);
        btnApply.addEventListener("click", onApply);

        // event listeners for textboxes
        txtBusAddress.addEventListener("click", regexCheck);
        txtPhone.addEventListener("click", regexCheck);
        txtEmail.addEventListener("click", regexCheck);
        txtFrontRow.addEventListener("click", regexCheck);
        txtMiddleRow.addEventListener("click", regexCheck);
        txtBackRow.addEventListener("click", regexCheck);
        txtMissing.addEventListener("click", regexCheck);

    }

	// ------------------------------------------------------------ private methods
	
    function goodFeedback() {
        // feedback
        lblFeedback.innerHTML = "<h4>Success</h4>";
        // display for a short time
        $('#lblFeedback').css('display', 'block');
        $('#lblFeedback').delay(4000).fadeOut(1000);
    }

    function badFeedback(words) {
        // feedback
        lblFeedback.innerHTML = "<h4>" + words + "</h4>";
        // display for a short time
        $('#lblFeedback').css('display', 'block');
        $('#lblFeedback').delay(4000).fadeOut(1000);
    }

    function loading() {
        // disable screen by placing the loading overlay on top
        document.getElementById("loadingOverlay").style.visibility = "block";
    }

    function notloading() {
        // enable screen by removing the loading overlay
        document.getElementById("loadingOverlay").style.visibility = "hidden";
    }

    function hideEdit() {
        // bring the labels back
        lblBusAddress.style.display = "";
        lblPhone.style.display = "";
        lblEmail.style.display = "";
        divSize.style.display = "";

        lblFrontRow.style.display = "";
        lblMiddleRow.style.display = "";
        lblBackRow.style.display = "";
        lblMissing.style.display = "";

        // show the approve, edit and decline buttons
        divButtons.style.display = "";

        // hide text elements
        txtBusAddress.style.display = "none";
        txtPhone.style.display = "none";
        txtEmail.style.display = "none";

        txtFrontRow.style.display = "none";
        txtMiddleRow.style.display = "none";
        txtBackRow.style.display = "none";
        txtMissing.style.display = "none";

        // hide the apply button
        divApply.style.display = "none";
    }

    // ------------------------------------------------------------ event handlers

    function regexCheck() {

        // validate the input
        if ((textRegex.test(txtBusAddress.value)) || (txtBusAddress.value === "")) {
            txtBusAddress.style.borderColor = border;
        } else {
            txtBusAddress.style.borderColor = error;
        }

        if ((phoneRegex.test(txtPhone.value)) || (txtPhone.value === "")) {
            txtPhone.style.borderColor = border;
        } else {
            txtPhone.style.borderColor = error;
        }

        if ((emailRegex.test(txtEmail.value)) || (txtEmail.value === "")) {
            txtEmail.style.borderColor = border;
        } else {
            txtEmail.style.borderColor = error;
        }

        if ((textRegex.test(txtFrontRow.value)) || (txtFrontRow.value === "")) {
            txtFrontRow.style.borderColor = border;
        } else {
            txtFrontRow.style.borderColor = error;
        }

        if ((textRegex.test(txtMiddleRow.value)) || (txtMiddleRow.value === "")) {
            txtMiddleRow.style.borderColor = border;
        } else {
            txtMiddleRow.style.borderColor = error;
        }

        if ((textRegex.test(txtBackRow.value)) || (txtBackRow.value === "")) {
            txtBackRow.style.borderColor = border;
        } else {
            txtBackRow.style.borderColor = error;
        }

        if ((textRegex.test(txtMissing.value)) || (txtMissing.value === "")) {
            txtMissing.style.borderColor = border;
        } else {
            txtMissing.style.borderColor = error;
        }

    }

    function onEdit() {

        console.log("Edit hit!");

        // hide  labels
        lblBusAddress.style.display = "none";
        lblPhone.style.display = "none";
        lblEmail.style.display = "none";
        divSize.style.display = "none";

        lblFrontRow.style.display = "none";
        lblMiddleRow.style.display = "none";
        lblBackRow.style.display = "none";
        lblMissing.style.display = "none";

        // hide approve, edit and decline buttons
        divButtons.style.display = "none";

        // show text elements 
        txtBusAddress.style.display = "";
        txtPhone.style.display = "";
        txtEmail.style.display = "";

        txtFrontRow.style.display = "";
        txtMiddleRow.style.display = "";
        txtBackRow.style.display = "";
        txtMissing.style.display = "";

        // show the apply button
        divApply.style.display = "";

    }

    function onApply() {

        console.log("Apply hit!");

        // validation check
        var valid = false;
        // /[/s]/.test();
        // check textboxes
        /*
        if ((textRegex.test(txtBusAddress.value)) || (txtBusAddress.value === ""))
        if ((phoneRegex.test(txtPhone.value)) || (txtPhone.value === ""))
        if ((emailRegex.test(txtEmail.value)) || (txtEmail.value === ""))
        if ((textRegex.test(txtFrontRow.value)) || (txtFrontRow.value === ""))
        if ((textRegex.test(txtMiddleRow.value)) || (txtMiddleRow.value === ""))
        if ((textRegex.test(txtBackRow.value)) || (txtBackRow.value === ""))
        if ((textRegex.test(txtMissing.value)) || (txtMissing.value === ""))
        */

        if (((textRegex.test(txtBusAddress.value)) || (txtBusAddress.value === ""))
            && ((phoneRegex.test(txtPhone.value)) || (txtPhone.value === ""))
            && ((emailRegex.test(txtEmail.value)) || (txtEmail.value === ""))
            && ((textRegex.test(txtFrontRow.value)) || (txtFrontRow.value === ""))
            && ((textRegex.test(txtMiddleRow.value)) || (txtMiddleRow.value === ""))
            && ((textRegex.test(txtBackRow.value)) || (txtBackRow.value === ""))
            && ((textRegex.test(txtMissing.value)) || (txtMissing.value === ""))) {
            valid = true;
        } else {
            valid = false;
        }

        if (valid) {

            // loading overlay
            loading();

            // construct the JSON object to send to the handler
            var sendJSON = null;

            sendJSON = {
                "BusAddress": txtBusAddress.value,
                "Phone": txtPhone.value,
                "Email": txtEmail.value,
                "FrontRow": txtFrontRow.value,
                "MiddleRow": txtMiddleRow.value,
                "BackRow": txtBackRow.value,
                "Missing": txtMissing.value
            }

            // turn object into a string
            var sendString = JSON.stringify(sendJSON);

            // send string to the server handler
            xmlhttp = new XMLHttpRequest();
            xmlhttp.addEventListener("readystatechange", onResponse);
            xmlhttp.open("POST", edit, true);
            // tell the server what you're doing
            xmlhttp.setRequestHeader("Content-type", "application/json");
            // send it
            xmlhttp.send(sendString);

        } else {
            // bad feedback
            badFeedback("There was an error in the editing. Check the entries and try again.");
        } // validation check
    }
	
    // ------------------------------------------------------------ event handlers

    function onResponse(e) {
        if ((xmlhttp.readyState === 4) && (xmlhttp.status === 200)) {
            // get the json data received
            json = JSON.parse(xmlhttp.responseText);
            // did it work?
            if (json.success === true) {

                // change the interface to match the new data
                lblBusAddress.innerHTML = txtBusAddress.value
                lblPhone.innerHTML = txtPhone.value
                lblEmail.innerHTML = txtEmail.value
                lblFrontRow.innerHTML = txtFrontRow.value
                lblMiddleRow.innerHTML = txtMiddleRow.value
                lblBackRow.innerHTML = txtBackRow.value
                lblMissing.innerHTML = txtMissing.value

                // change interface back
                hideEdit();

                // good feedback
                goodFeedback();

            } else {
                // bad feedback
                badFeedback("Uh oh. There was a serious error with the database. Please contact the Rotary Club to let them know.");
            }

            // disable loding screen
            notloading();

        }
    }

})();