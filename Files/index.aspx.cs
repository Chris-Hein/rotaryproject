using System;
using System.Windows.Forms;

public partial class new_index : System.Web.UI.Page {

    private WebLogin login;

    // ---------------------------------------------------------------- initial startup

    protected override void OnInit(EventArgs e) {
        Load += new EventHandler(Page_Load);
        //base.OnInit(e);
    }

    protected void Page_Load(object sender, EventArgs e) {

        // weblogin object
        if (Session["login"] != null) {
            login = (WebLogin)Session["login"];

            // redirect if already logged in
            if (login.unlock() != "no") {
                sendAway();
            }

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
        switch (login.access) {
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
            // rewrite session object and then send away
            Session["login"] = login;
            sendAway();
        } else {
            // display error
            lblFeedback.InnerHtml = "Incorrect login, please try again...";
            //Console.Write(txtUsername.Value);
            //Console.Write(txtPassword.Value);
            // attempt counter

        }
    }

}