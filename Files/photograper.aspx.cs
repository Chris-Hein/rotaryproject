using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

public partial class new_photographer : System.Web.UI.Page {

    // regex variable - sanitizing inputs
    private Regex regexMsg;

    // ---------------------------------------------------------------- initial startup

    protected void PageLoad(object sender, EventArgs e) {

        // event listeners
       // btnSend.ServerClick += new EventHandler(btnSendClick);

        // maintain page position after hitting edit and apply buttons
        Page.MaintainScrollPositionOnPostBack = true;

        // build regex objects for input validation
        regexMsg = new Regex("^[\\w\\W\\'][\\w\\W\\s\\'\\-]+$");
    }
    

    private void getData() {
        //pull data from DB
    }

    //private void btnSendClick(object sender, EventArgs e) {

    //    bool pass = true;
    //    // regex check
    //    if (!regexMsg(txtMessage.text)) { pass = false; }

    //    if (pass) {

    //    } else {
    //        // regex check failed

    //    }
    //}
}
 