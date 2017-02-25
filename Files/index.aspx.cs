using System;
using System.Windows.Forms;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

public partial class new_index : System.Web.UI.Page {

    private WebLogin login;

    // ---------------------------------------------------------------- initial startup

    protected override void OnInit(EventArgs e) {
        Load += new EventHandler(Page_Load);
        //base.OnInit(e);
    }

    protected void Page_Load(object sender, EventArgs e) {

        // redirect if already logged in
        if (Request.Cookies["card"] != null) {
            sendAway();
        }

        // weblogin object
        if (Session["login"] != null) {
            login = (WebLogin) Session["login"];
        } else {
            // build object and then save in session
            login = new WebLogin("rotaryyearbook", "useraccount", "userpassword", "login");
            Session["login"] = login;
        }
        
        // set event listeners
        btnSubmit.Click += new EventHandler(onSub);

    }

    // ---------------------------------------------------------------- private methods

    private void sendAway() {
        // where are we going?
        switch (Request.Cookies["card"]["user"]) {
            case "admin":
                Response.Redirect("admin.aspx");
                break;
            case "photographer":
                Response.Redirect("photographer.aspx");
                break;
            case "solicitor":
                Response.Redirect("solicitor.aspx");
                break;
            case "master":
                Response.Redirect("muffin.aspx");
                break;
            default:
                // must be a sponsor - sponsors are individualized
                Response.Redirect("sponsor.aspx");
                break;
        }
    }

    // ---------------------------------------------------------------- event handlers

    private void OnKeyDownHandler(object sender, KeyEventArgs e) {
        if (e.KeyCode == Keys.Return) {
            onSub(sender, e);
        }
    }

    private void onSub(object sender, EventArgs e) {

        // use login object to check against
        login.username = txtUsername.Value;
        login.password = txtPassword.Value;
        if (login.unlock() != "no") {
            // write the cookie and then redirect
            Response.Cookies["card"]["user"] = login.access;
            Response.Cookies["card"].Expires = DateTime.Now.AddDays(1);
            sendAway();
        } else {
            // display error
            lblFeedback.InnerHtml = "Incorrect login, please try again...";

            Console.Write(txtUsername.Value);
            Console.Write(txtPassword.Value);
            // attempt counter

        }

    } 

}