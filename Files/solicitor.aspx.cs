using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class new_solicitor : System.Web.UI.Page {

    // variables
    private WebData webdata;

    // ---------------------------------------------------------------- initial startup

    protected override void OnInit(EventArgs e) {
        Load += new EventHandler(Page_Load);
        //base.OnInit(e);
    }

    protected void Page_Load(object sender, EventArgs e) {

        /*
        // redirect if not logged in
        if (Request.Cookies["card"] == null) {
            Response.Redirect("login.aspx");
        }
        // redirect if the wrong person
        if (Request.Cookies["card"]["user"] != "solicitor") {
            Response.Redirect("login.aspx");
        }
        */
        // set event listeners
        btnAgreed.Click += new EventHandler(onClick);
        btnDeclined.Click += new EventHandler(onClick);
    }

    // ---------------------------------------------------------------- private methods

    // ---------------------------------------------------------------- event handlers

    private void onClick(object sender, EventArgs e) {
        // which button was clicked
        if (((Button)sender).ID == "btnAgreed") {

        } else if (((Button)sender).ID == "btnDeclined") {

        }
    }
}