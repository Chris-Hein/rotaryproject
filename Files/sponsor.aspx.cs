using System;
using System.Net;
using System.Net.Mail;
using MySql.Data.MySqlClient;
using System.Text.RegularExpressions;

public partial class new_sponsor : System.Web.UI.Page {

    // database variables
    private MySqlConnection dbConnect;
    private MySqlCommand dbCommand;
    private MySqlDataReader dbReader;
    private string sqlString;
    private WebLogin login = null;
    private string dbString = "Database='rehberga_php';Data Source='mysql.nscctruro.ca';User Id='rehberga_nsccweb';Password='Normandy2492*'";

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
            dbConnect = new MySqlConnection(dbString);
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
    
    protected void sendInvoice() {

        // variable for later
        string sendemail = null;
        bool paid = false;
        
        try {

            // get connection to the database
            dbConnect = new MySqlConnection(dbString);
            dbConnect.Open();

            // first thing - did they pay already?
            sqlString = "SELECT paid FROM mainrecords WHERE sponsorName=@sponsor";
            dbCommand = new MySqlCommand(sqlString, dbConnect);
            dbCommand.Prepare();
            dbCommand.Parameters.AddWithValue("@sponsor", ((WebLogin)Session["login"]).access);
            dbReader = dbCommand.ExecuteReader();

            // grab the info
            while (dbReader.Read()) {
                if (dbReader["sponsorEmail"] == null) {
                    paid = false;
                } else if (dbReader["sponsorEmail"].ToString() != "no") {
                    paid = true;
                }
            }
            dbReader.Close();

            // if they paid, we're not sending an invoice
            if (!paid) {

                // get the email
                sqlString = "SELECT sponsorEmail FROM mainrecords WHERE sponsorName=@sponsor";
                dbCommand.CommandText = sqlString;
                dbCommand.Prepare();
                dbCommand.Parameters.AddWithValue("@sponsor", ((WebLogin)Session["login"]).access);
                dbReader = dbCommand.ExecuteReader();

                // grab the info
                while (dbReader.Read()) {
                    if (dbReader["sponsorEmail"] != null) {
                        sendemail = dbReader["sponsorEmail"].ToString();
                    } else {
                        sendemail = null;
                    }
                }
                dbReader.Close();

                // check to see if an email address was posted in the contact form
                if (sendemail == null) {

                    // try the addata table
                    sqlString = "SELECT sponsorEmail FROM addata WHERE sponsorName=@sponsor";
                    dbCommand.CommandText = sqlString;
                    dbCommand.Prepare();
                    dbCommand.Parameters.AddWithValue("@sponsor", ((WebLogin)Session["login"]).access);
                    dbReader = dbCommand.ExecuteReader();

                    // grab the info
                    while (dbReader.Read()) {
                        if (dbReader["sponsorEmail"] != null) {
                            sendemail = dbReader["sponsorEmail"].ToString();
                        } else {
                            sendemail = null;
                        }
                    }
                    dbReader.Close();
                }

            } // paid check

        } finally {
            dbConnect.Close();
        }

        if (!paid) {
            // is there an email to send to?
            if (sendemail != null) {

                // Note: Server.MapPath refers to the location on the server where the invoice file is located. Must be accurate
                Attachment invoiceAttachment = new Attachment(Server.MapPath("~/invoice.docx"));

                string message = "This is an automated message from The Rotary Club of Truro. A payment invoice regarding your ad has been attached to this message. Please review it and arrange payment at your convenience. If you have any questions please contact the Rotary Club directly, as this account is not monitored for replies";

                //MailMessage o = new MailMessage("From", "To","Subject", "Body");
                MailMessage letter = new MailMessage("rotariansample@hotmail.com", sendemail, "Rotary Club of Truro Yearbook Ad Invoice", message);
                // Attaches the invoice attachment file to the email message
                letter.Attachments.Add(invoiceAttachment);
                //NetworkCredential netCred= new NetworkCredential("Sender Email","Sender Password");
                NetworkCredential netCred = new NetworkCredential("rotariansample@hotmail.com", "It$tudents");
                SmtpClient smtpobj = new SmtpClient("smtp.live.com", 587);
                smtpobj.EnableSsl = true;
                smtpobj.Credentials = netCred;
                smtpobj.Send(letter);

                // feedback of message sent
                lblApprovedFeed.InnerHtml = "An automated invoice has been sent to the email address that's assigned to this account.";

            } else {
                // feedback of no email assigned to account
                lblApprovedFeed.InnerHtml = "We were unable to find an email attached to this account to send an invoice to. To ensure that your ad gets placed, please contact The Rotary Club of Truro for payment options.";

            } // email check

        } // paid check again
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

                // invoice check
                sendInvoice();

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