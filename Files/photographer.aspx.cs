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

public partial class new_photographer : System.Web.UI.Page {

    // regex variable - sanitizing inputs
    private Regex regexMsg;

    SqlConnection dbConnection;
    SqlDataAdapter dbAdapter;
    SqlCommand dbCommand;
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

    //front variables
    // RadioButton complete = document.getElementById('complete').value;
    // RadioButton showall = document.getElementById('showall').value;
    // RadioButton pending = document.getElementById('pending').value;

    // ---------------------------------------------------------------- initial startup

    protected void PageLoad(object sender, EventArgs e) {
        update = new UpdateAdmin();    
        //DB variables
        string contact_name = dbDataSet.Tables[0].Rows[0]["sponsorContact"].ToString();
        string business_name = dbDataSet.Tables[0].Rows[0]["SponsorName"].ToString();
        string business_email = dbDataSet.Tables[0].Rows[0]["sponsorEmail"].ToString();        
        string business_address = dbDataSet.Tables[0].Rows[0]["sponsorAddress"].ToString();
        string phone = dbDataSet.Tables[0].Rows[0]["sponsorPhone"].ToString();
        string image = dbDataSet.Tables[0].Rows[0]["image"].ToString();

        // event listeners
        btnSend.ServerClick += new ImageClickEventHandler(btnSendClick);
        btnSearch.ServerClick += new EventHandler(search);

        // maintain page position after hitting edit and apply buttons
        Page.MaintainScrollPositionOnPostBack = true;

        // build regex objects for input validation
        regexMsg = new Regex("^[\\w\\W\\'][\\w\\W\\s\\'\\-]+$");
        populateDropDown();
    }

    protected void populateDropDown() {
       
    //     if (showall.Checked()){
    //         try {
    //             dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
    //             dbConnection.Open();
    //             sqlString = "SELECT * FROM mainRecords WHERE id > 0";
    //             dbAdapter = new MySqlDataAdapter(sqlString, dbConnection);
    //             dbDataSet = new DataSet();
    //             dbAdapter.Fill(dbDataSet, "sponsor");
    //             // Executes the SQL
    //             // Binds the photographer data to the dropdown so it can be displayed
    //             drpSponsorList.DataSource = dbDataSet.Tables["sponsor"];
    //             drpSponsorList.DataValueField = "business_name";
    //             drpSponsorList.DataTextField = "business_name";
    //             //drpAssignPhotographer.DataBind();
    //             Cache["dbDataSet"] = dbDataSet;
    //         } finally {
    //             dbConnection.Close();
    //         }
    //    }
    //     if (pending.Checked()){
    //         try {
    //             dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
    //             dbConnection.Open();
    //             sqlString = "SELECT * FROM mainRecords WHERE id > 0";
    //             dbAdapter = new MySqlDataAdapter(sqlString, dbConnection);
    //             dbDataSet = new DataSet();
    //             dbAdapter.Fill(dbDataSet, "sponsor");
    //             // Executes the SQL
    //             // Binds the photographer data to the dropdown so it can be displayed
    //             drpSponsorList.DataSource = dbDataSet.Tables["sponsor"];
    //             drpSponsorList.DataValueField = "business_name";
    //             drpSponsorList.DataTextField = "business_name";
    //             //drpAssignPhotographer.DataBind();
    //             Cache["dbDataSet"] = dbDataSet;
    //         } finally {
    //             dbConnection.Close();
    //         }
    //    }
    //     if (complete.Checked()){
    //         try {
    //             dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
    //             dbConnection.Open();
    //             sqlString = "SELECT * FROM mainRecords WHERE id > 0";
    //             dbAdapter = new MySqlDataAdapter(sqlString, dbConnection);
    //             dbDataSet = new DataSet();
    //             dbAdapter.Fill(dbDataSet, "sponsor");
    //             // Executes the SQL
    //             // Binds the photographer data to the dropdown so it can be displayed
    //             drpSponsorList.DataSource = dbDataSet.Tables["sponsor"];
    //             drpSponsorList.DataValueField = "business_name";
    //             drpSponsorList.DataTextField = "business_name";
    //             //drpAssignPhotographer.DataBind();
    //             Cache["dbDataSet"] = dbDataSet;
    //         } finally {
    //             dbConnection.Close();
    //         }
     //  }
        
            try {
                dbConnection = new SqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
                dbConnection.Open();
                sqlString = "SELECT sponsorName FROM mainRecords WHERE id > 0";
                dbAdapter = new SqlDataAdapter(sqlString, dbConnection);
                dbDataSet = new DataSet();
                dbAdapter.Fill(dbDataSet, "admin");
                // Executes the SQL
                // Binds the photographer data to the dropdown so it can be displayed
                drpSponsorList.DataSource = dbDataSet.Tables["admin"];
                drpSponsorList.DataValueField = "business_name";
                drpSponsorList.DataTextField = "business_name";
                drpSponsorList.DataBind();
                Cache["dbDataSet"] = dbDataSet;
            } finally {
                dbConnection.Close();
            }       

        loadSponsorData();
    }

  
    // Handles display of in-depth data when user clicks the business name in the initial repeater
    // Uses custom paging bind the displayed data to the display repeater
    protected void loadSponsorData () {

        lblBus.InnerHtml = update.getSponsorName(drpSponsorList.ToString());
        lblEmail.InnerHtml = update.getSponsorEmail(drpSponsorList.ToString());
        lblPhone.InnerHtml = update.getSponsorPhone(drpSponsorList.ToString());
        lblAddress.InnerHtml = update.getSponsorAddress(drpSponsorList.ToString());
        lblName.InnerHtml = update.getSponsorContact(drpSponsorList.ToString());        
    }

    private void search(object sender, EventArgs e) {
        //getData();      
        
            dbConnection.Open();
            int i = 0;
            SqlCommand cmd0 = new SqlCommand("SELECT sponsorName FROM addata WHERE sponsorName ='" + drpSponsorList.SelectedItem.Value.ToString() + "'", dbConnection);
            i = int.Parse(cmd0.ExecuteScalar().ToString());
            if (i > 0) {
                SqlCommand cmd1 = new SqlCommand("SELECT approved FROM addata WHERE sponsorName ='" + drpSponsorList.SelectedItem.Value.ToString() + "'", dbConnection);
                string name = cmd1.ExecuteScalar().ToString();
                lblName.InnerHtml = contact_name;
                lblBus.InnerHtml = business_name;
                lblEmail.InnerHtml = business_email;
                lblAddress.InnerHtml = business_address;
                lblPhone.InnerHtml = phone;
                imgView.Src = image;
                dbConnection.Close();
            } else {
                //lblError.Visible = true;
                dbConnection.Close();
            }
        

    }

    //private void getData() {
    //    try {
    //        // Create DataSet and fill with Products table
    //        dbConnection = new SqlConnection("Database=./Database/rotary tables/rotaryyearbook.sql; Data Source=localhost; User Id=useraccount; Password=userpassword");
    //        dbConnection.Open();
    //        sqlString = "SELECT * FROM adawaitingapproval ORDER BY business_name DESC";
    //        dbCommand = new SqlCommand(sqlString, dbConnection);

    //        dbAdapter = new SqlDataAdapter(sqlString, dbConnection);
    //        dbDataSet = new DataSet();
    //        dbAdapter.Fill(dbDataSet, "adawaitingapproval");
        
    //        sqlString = "SELECT * FROM adawaitingapproval";
    //        dbCommand.CommandText = sqlString;
    //        Cache["dbDataSet"] = dbDataSet;
    //    } catch (Exception e) {
    //        Response.Write("AN ERROR HAS OCCURED: <br/>");
    //        Response.Write(e.Message);
    //    } finally {
    //        dbConnection.Close();
    //    }
    //}    

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
 