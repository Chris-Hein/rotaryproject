using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Text.RegularExpressions;

public partial class new_sponsor : System.Web.UI.Page {

    // database variables
    private MySqlConnection dbConnect;
    private MySqlCommand dbCommand;
    private MySqlDataReader dbReader;
    private string sqlString;
    private WebLogin login = null;

    // regex variable - sanitizing input
    private Regex regexText;

    // prevent methods from firing twice
    private bool bug = false;

    // ---------------------------------------------------------------- initial startup

    protected override void OnInit(EventArgs e) {
        Load += new EventHandler(Page_Load);
        //base.OnInit(e);
    }

    protected void Page_Load(object sender, EventArgs e) {
        
        // login check
        if (Session["login"] == null) {
            // redirect
            Response.Redirect("index.aspx");
        } else if (((WebLogin)Session["login"]).access == "no") {
            // redirect
            Response.Redirect("index.aspx");
        } else {
            login = (WebLogin)Session["login"];
        }

        // maintain page position after hitting edit and apply buttons
        //Page.MaintainScrollPositionOnPostBack = true;

        // build regex objects for input validation
        regexText = new Regex("^[A-Z\\'][a-zA-Z\\s\\'\\-\\,\\.]+$");

        // hide and disable elements that aren't meant to be displayed until accept or decline is click
        divApprove.Visible = false;
        divDenied.Visible = false;

        // populate textboxes and labels with data from database
        getData();

        // event listeners
        btnAccept.Click += new EventHandler(btnApprove_Click);
        btnDecline.Click += new EventHandler(btnDeny_Click);
        btnLogout.Click += new EventHandler(logout);

    }

    // ---------------------------------------------------------------- private functions
    
    private void getData() {
        try {

            // get connection to the database
            dbConnect = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnect.Open();

            // get all the data!
            sqlString = "SELECT * FROM addata WHERE sponsorName=@sponsor";
            dbCommand = new MySqlCommand(sqlString, dbConnect);
            dbCommand.Prepare();
            dbCommand.Parameters.AddWithValue("@sponsor", ((WebLogin)Session["login"]).access);
            dbReader = dbCommand.ExecuteReader();

            // temp variables
            string add = "";
            string phone = "";
            string email = "";
            string front = "";
            string middle = "";
            string back = "";
            string missing = "";
            string img = "";

            // grab the information
            while (dbReader.Read()) {
                add = dbReader["captionAddress"].ToString();
                phone = dbReader["captionPhone"].ToString();
                email = dbReader["captionEmail"].ToString();
                front = dbReader["captionFront"].ToString();
                middle = dbReader["captionMiddle"].ToString();
                back = dbReader["captionBack"].ToString();
                missing = dbReader["captionMissing"].ToString();
                img = dbReader["image"].ToString();
            }
            dbReader.Close();

            // place picture
            imgView.Src = "images/photo/" + img;

            // populate the page with data
            lblBusName.InnerText = login.access;
            lblBusAddress.InnerHtml = add;
            txtBusAddress.Text = add;
            lblPhone.InnerHtml = phone;
            txtPhone.Text = phone;
            lblEmail.InnerHtml = email;
            txtEmail.Text = email;

            lblFrontRow.InnerHtml = front;
            txtFrontRow.Text = front;
            lblMiddleRow.InnerHtml = middle;
            txtMiddleRow.Text = middle;
            lblBackRow.InnerHtml = back;
            txtBackRow.Text = back;
            lblMissing.InnerHtml = missing;
            txtMissing.Text = missing;

            // get ad size
            sqlString = "SELECT adSize FROM mainrecords WHERE sponsorName=@sponsor";
            dbCommand = new MySqlCommand(sqlString, dbConnect);
            dbCommand.Prepare();
            dbCommand.Parameters.AddWithValue("@sponsor", ((WebLogin)Session["login"]).access);
            dbReader = dbCommand.ExecuteReader();

            while (dbReader.Read()) {
                lblSize.InnerHtml = dbReader["adSize"].ToString();
            }
            dbReader.Close();
            
        } finally {
            dbConnect.Close();
        }
    }
    
    // ---------------------------------------------------------------- event handlers

    private void logout(object sender, EventArgs e) {
        login = null;
        Session["login"] = null;
        Response.Redirect("index.aspx");
    }

    private void btnApprove_Click(object sender, EventArgs e) {

        // hide and disable everything
        sponsorForm.Visible = false;

        // show confirmation of approval
        divApprove.Visible = true;

        // send data off
        if (!bug) {

            // prevent from firing twice
            bug = true;

            // send data off
            try {

                // get connection to the database
                dbConnect = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
                dbConnect.Open();

                // send data off
                sqlString = "UPDATE addata SET approved='yes' WHERE sponsorName=@sponsor";
                dbCommand = new MySqlCommand(sqlString, dbConnect);
                dbCommand.Prepare();
                dbCommand.Parameters.AddWithValue("@sponsor", ((WebLogin)Session["login"]).access);
                dbCommand.ExecuteNonQuery();

            } finally {
                dbConnect.Close();
            }
        } else {
            // stupid bug
            bug = false;
        }

    }

    private void btnDeny_Click(object sender, EventArgs e) {

        // hide and disable everything
        sponsorForm.Visible = false;

        // show confirmation of denial
        divDenied.Visible = true;

        // validation in textbox
        if ((regexText.IsMatch(txtDecline.Value)) && (!bug)) {

            // prevent from firing twice
            bug = true;

            // send data off
            try {

                // get connection to the database
                dbConnect = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
                dbConnect.Open();

                // send data off
                sqlString = "UPDATE addata SET approved='no',adnotes=@notes WHERE sponsorName=@sponsor";
                dbCommand = new MySqlCommand(sqlString, dbConnect);
                dbCommand.Prepare();
                dbCommand.Parameters.AddWithValue("@sponsor", ((WebLogin)Session["login"]).access);
                dbCommand.Parameters.AddWithValue("@notes", txtDecline.Value);
                dbCommand.ExecuteNonQuery();

            } finally {
                dbConnect.Close();
            }
        } else {
            // stupid bug
            bug = false;
        }
    }
}