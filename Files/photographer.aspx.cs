using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net;
using MySql.Data;
using MySql.Data.MySqlClient;

public partial class new_photographer : System.Web.UI.Page {

    // regex variable - sanitizing inputs
    private Regex regexMsg;

    //MySqlConnection dbConnection = new MySqlConnection("Database='rehberga_php';Data Source='mysql.nscctruro.ca';User Id='rehberga_nsccweb';Password='Normandy2492*'");
    MySqlConnection dbConnection = new MySqlConnection("Database='rotaryyearbook';Data Source='localhost';User Id='useraccount';Password='userpassword'");
    MySqlDataAdapter dbAdapter;
    MySqlCommand dbCommand;
    DataSet dbDataSet;
    string sqlString;
    DataView dbDataView;
    UpdateAdmin update;

    //DB variables
    private string contact_name;
    private string business_name;
    private string business_email;
    private string business_address;
    private string phone;
    private string image;

    //label variables
    
    // ---------------------------------------------------------------- INITAIL STARTUP 
    protected override void OnInit(EventArgs e) {
        Load += new EventHandler(PageLoad);
        //base.OnInit(e);
    }


    protected void PageLoad(object sender, EventArgs e) {                        
        update = new UpdateAdmin();    

        // event listeners
        btnSend.ServerClick += new ImageClickEventHandler(btnSendClick);
        btnSearch.ServerClick += new EventHandler(loadSponsorData);

        // maintain page position after hitting edit and apply buttons
        Page.MaintainScrollPositionOnPostBack = true;

        // build regex objects for input validation
        regexMsg = new Regex("^[\\w\\W\\'][\\w\\W\\s\\'\\-]+$");  

         //initial run
        if (!Page.IsPostBack) {        
            populateSponsors();
            
        try {
            dbConnection.Open();
            sqlString = "SELECT sponsorName FROM mainrecords WHERE id > 0 ORDER BY id";
            dbAdapter = new MySqlDataAdapter(sqlString, dbConnection);
            dbDataSet = new DataSet();
            dbAdapter.Fill(dbDataSet, "admin");
            // Executes the SQL
            // Binds the business data to the dropdown so it can be displayed
            drpSponsorList.DataSource = dbDataSet.Tables["admin"];
            drpSponsorList.DataValueField = "sponsorName";
            drpSponsorList.DataTextField = "sponsorName";
            drpSponsorList.DataBind();
            Cache["dbDataSet"] = dbDataSet;
        } finally {
            dbConnection.Close();
        }        
                     
        }
        
        //---------------------------------------------------------------- CHECK LABELS
        // check to see if the labels are empty, if so, populate them
            Label lblName = content.FindControl("lblName") as Label;
            if (lblName != null) {
                lblName.Text = "No name given";
            }
            Label lblBus = content.FindControl("lblBus") as Label;
            if (lblBus != null) {
                lblBus.Text = "Anonymous";
            }
            Label lblEmail = content.FindControl("lblEmail") as Label;
            if (lblEmail != null) {
                lblEmail.Text = "No email given";
            }
            Label lblAddress = content.FindControl("lblAddress") as Label;
            if (lblAddress != null) {
                lblAddress.Text = "No address given";
            }
            Label lblPhone = content.FindControl("lblPhone") as Label;
            if (lblPhone != null) {
                lblPhone.Text = "No phone number given";
            }                 
    }   
    //-----------------------------------------------------------------------POPULATE DROP DOWN
     protected void populateSponsors() {

            if (rdoShowall.Checked){
                try {
                    dbConnection.Open();
                    sqlString = "SELECT sponsorName FROM mainRecords WHERE id > 0 ORDER BY id";
                    dbAdapter = new MySqlDataAdapter(sqlString, dbConnection);
                    dbDataSet = new DataSet();
                    dbAdapter.Fill(dbDataSet, "admin");
                    // Executes the SQL
                    // Binds the photographer data to the dropdown so it can be displayed
                    drpSponsorList.DataSource = dbDataSet.Tables["admin"];
                    drpSponsorList.DataValueField = "sponsorName";
                    drpSponsorList.DataTextField = "sponsorName";
                    //drpAssignPhotographer.DataBind();
                    Cache["dbDataSet"] = dbDataSet;
                } finally {
                    dbConnection.Close();
                }
            } else if (rdoPending.Checked){
                try {
                    dbConnection.Open();
                    sqlString = "SELECT * FROM mainRecords WHERE id > 0 AND orderStatus = 'pending' ORDER BY id";
                    dbAdapter = new MySqlDataAdapter(sqlString, dbConnection);
                    dbDataSet = new DataSet();
                    dbAdapter.Fill(dbDataSet, "sponsor");
                    // Executes the SQL
                    // Binds the photographer data to the dropdown so it can be displayed
                    drpSponsorList.DataSource = dbDataSet.Tables["sponsor"];
                    drpSponsorList.DataValueField = "sponsorName";
                    drpSponsorList.DataTextField = "sponsorName";
                    //drpAssignPhotographer.DataBind();
                    Cache["dbDataSet"] = dbDataSet;
                 } finally {
                     dbConnection.Close();
                 }
            } else if (rdoComplete.Checked){
                try {               
                    dbConnection.Open();
                    sqlString = "SELECT * FROM mainRecords WHERE id > 0 ORDER BY id";
                    dbAdapter = new MySqlDataAdapter(sqlString, dbConnection);
                    dbDataSet = new DataSet();
                    dbAdapter.Fill(dbDataSet, "sponsor");
                    // Executes the SQL
                    // Binds the photographer data to the dropdown so it can be displayed
                    drpSponsorList.DataSource = dbDataSet.Tables["sponsor"];
                    drpSponsorList.DataValueField = "sponsorName";
                    drpSponsorList.DataTextField = "sponsorName";
                    //drpAssignPhotographer.DataBind();
                    Cache["dbDataSet"] = dbDataSet;
                } finally {
                 dbConnection.Close();
                }
            }
     
    }
  
    //------------------------------------------------------------------------------POPULATE LABELS FROM DROP DOWN SELECTION
    //loads the drop down data
    protected void loadSponsorData (object sender, EventArgs e) {

        lblName.InnerHtml = update.getSponsorContact(drpSponsorList.ToString());  
        lblBus.InnerHtml = update.getSponsorName(drpSponsorList.ToString());
        lblEmail.InnerHtml = update.getSponsorEmail(drpSponsorList.ToString());
        lblAddress.InnerHtml = update.getSponsorAddress(drpSponsorList.ToString());
        lblPhone.InnerHtml = update.getSponsorPhone(drpSponsorList.ToString());                
        imgView.Src = update.getImage(drpSponsorList.ToString());        
        imgContent.InnerHtml = update.getFrontRow(drpSponsorList.ToString()) + "<br /> " + update.getMiddleRow(drpSponsorList.ToString()) + "<br />" + update.getBackRow(drpSponsorList.ToString());
    }

    // private void searchSponsor(object sender, EventArgs e) {
        //getData();            
        //loadSponsorData();
        //dbConnection.Open();
        // int i = 0;            
        // MySqlCommand cmd0 = new MySqlCommand("SELECT sponsorName FROM addata WHERE sponsorName ='" + drpSponsorList.SelectedItem.Value.ToString() + "' ORDER BY id", dbConnection);
        // i = int.Parse(cmd0.ExecuteScalar().ToString());
        // if (i > 0) {
        //     MySqlCommand cmd1 = new MySqlCommand("SELECT image FROM addata WHERE sponsorName ='" + drpSponsorList.SelectedItem.Value.ToString() + "' ORDER BY id", dbConnection);
        //     string image = cmd1.ExecuteScalar().ToString();                
        //     imgView.Src = image;
        //     dbConnection.Close();
        // } else {
        //     //lblError.Visible = true;
        //     dbConnection.Close();
        // }
        

    // }
//------------------------------------------------------------------------------------------EMAIL SEND BUTTON CLICK
    private void btnSendClick(object sender, EventArgs e) {

    //    bool pass = true;
    //    // regex check
    //    if (!regexMsg(txtMessage.text)) { pass = false; }

    //    if (pass) {

    //    } else {
    //        // regex check failed

    //    }
    }

    // As per my last part of sprint 4, I added this method to handle notifying the club via email when an image is updated (which would be on the photographers end)
    // The method is coded, tested and ready to call, simply called imageUpdated() on an action and the email will be generated and sent automatically
    // I didn't know how rehberg wanted the specifics of the page to function so I just implemented the method and didn't call it anywhere
    private void imageUpdated(Object sender, EventArgs e) {
        string message;
        // email is the address its sent to, currently sends to the account sending the email, simply replace the email listed in the email variable (or hardcode it) when we decide who specifically gets the update email
        // Doesn't really apply to this usage but note that the target email can have issues with thinking the recipient email is null if there are multiple emails that aren't fed in from via a string. Its a weird issue
        // that seems to be related to the way the mail class itself was coded
        string email = "rotariansample@hotmail.com";
        // Sets the body of the message to whatver text is in the text box
        message = "This is an automated message to inform the club that a sponsor has updated one of their ad images";

        //MailMessage o = new MailMessage("From", "To","Subject", "Body");
        MailMessage o = new MailMessage("rotariansample@hotmail.com", email, "Automated Message from the Rotary Club of Truro - an image has been updated", message);
        //NetworkCredential netCred= new NetworkCredential("Sender Email","Sender Password");
        NetworkCredential netCred = new NetworkCredential("rotariansample@hotmail.com", "It$tudents");
        SmtpClient smtpobj = new SmtpClient("smtp.live.com", 587);
        smtpobj.EnableSsl = true;
        smtpobj.Credentials = netCred;
        smtpobj.Send(o);
    }
}
 