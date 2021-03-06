﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public partial class new_solicitor : System.Web.UI.Page {

    // variables
    private MySqlConnection dbConnect;
    private MySqlCommand dbCommand;
    private MySqlDataReader dbReader;
    private string sqlString;
    private MySqlDataAdapter dbAdapter;
    private DataSet dbDataSet;
    private WebLogin login = null;
    private string dbString = "Database='rehberga_php';Data Source='mysql.nscctruro.ca';User Id='rehberga_nsccweb';Password='Normandy2492*'";

    // prices
    private int sixthPagePrice;
    private int thirdPagePrice;
    private int twothirdsPagePrice;
    private int fullPagePrice;

    // prevent event from firing twice
    private bool bug = false;

    // ---------------------------------------------------------------- initial startup

    protected override void OnInit(EventArgs e) {
        Load += new EventHandler(Page_Load);
        //base.OnInit(e);
    }

    protected void Page_Load(object sender, EventArgs e) {

        /*
        // login check
        if ((((WebLogin)Session["login"]).access != "solicitor") || (((WebLogin)Session["login"]).access != "master")){
            // redirect
            Response.Redirect("index.aspx");
        } else {
            login = (WebLogin)Session["login"];
        }
        */

        // set event listeners
        btnAgreed.Click += new EventHandler(onClick);
        btnPending.Click += new EventHandler(onClick);
        btnDecline.Click += new EventHandler(onClick);
        btnLogout.Click += new EventHandler(logout);

        // first load
        if (!Page.IsPostBack) {
            // load the dropdown menu
            populateSponsors();
        } else {
            // remove extra event listeners - this doesn't work
            //http://stackoverflow.com/questions/10768676/why-is-my-event-handler-firing-twice
            //btnAgreed.Click -= new EventHandler(onClick);
            //btnPending.Click -= new EventHandler(onClick);
            //btnDeclined.Click -= new EventHandler(onClick);
        }

        // populate other data
        getPrices();

    }

    // ---------------------------------------------------------------- private methods
    
    protected void populateSponsors() {
        try {
            dbConnect = new MySqlConnection(dbString);
            dbConnect.Open();
            //sqlString = "SELECT sponsorName FROM mainrecords WHERE id > 0"; // pull everyone
            sqlString = "SELECT sponsorName FROM mainrecords WHERE orderStatus='needs visit' OR orderStatus='pending'"; // pull everyone who needs a visit
            //string temp = ((WebLogin)Session["login"]).username;
            dbAdapter = new MySqlDataAdapter(sqlString, dbConnect);
            dbDataSet = new DataSet();
            dbAdapter.Fill(dbDataSet, "admin");
            // Executes the SQL
            // Binds the business data to the dropdown so it can be displayed
            sponsorList.DataSource = dbDataSet.Tables["admin"];
            sponsorList.DataValueField = "SponsorName";
            sponsorList.DataTextField = "SponsorName";
            sponsorList.DataBind();
            Cache["dbDataSet"] = dbDataSet;
        } finally {
            dbConnect.Close();
        }
    }

    private void getPrices() {
        try {
            // get connection to the database
            dbConnect = new MySqlConnection(dbString);
            dbConnect.Open();

            // get all the data!
            sqlString = "SELECT * FROM adprices";
            dbCommand = new MySqlCommand(sqlString, dbConnect);
            dbReader = dbCommand.ExecuteReader();

            // populate the price information
            while (dbReader.Read()) {
                sixthPagePrice = Int16.Parse(dbReader["sixth"].ToString());
                thirdPagePrice = Int16.Parse(dbReader["third"].ToString());
                twothirdsPagePrice = Int16.Parse(dbReader["twothirds"].ToString());
                fullPagePrice = Int16.Parse(dbReader["full"].ToString());
            }
            dbReader.Close();

            lblSixth.InnerHtml = sixthPagePrice.ToString();
            lblThird.InnerHtml = thirdPagePrice.ToString();
            lblTwoThirds.InnerHtml = twothirdsPagePrice.ToString();
            lblFull.InnerHtml = fullPagePrice.ToString();

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

    private void onClick(object sender, EventArgs e) {

        // bug check
        if (!bug) {

            // stupid bug
            bug = true;

            // clear old feedback
            lblFeedback.InnerHtml = "";

            // set flag
            bool success = false;

            // construct data
            string state = "";
            string size = "";
            int? price = null;
            switch (sizeList.SelectedIndex) {
                case 1:
                    size = "one sixth of a page";
                    price = sixthPagePrice;
                    break;
                case 2:
                    size = "one third of a page";
                    price = thirdPagePrice;
                    break;
                case 3:
                    size = "two thirds of a page";
                    price = twothirdsPagePrice;
                    break;
                case 4:
                    size = "full page";
                    price = fullPagePrice;
                    break;
                case 5:
                    size = "special";
                    price = null;
                    break;
            }

            bool fail = false;
            try {
                // connect to database
                dbConnect = new MySqlConnection(dbString);
                dbConnect.Open();

                // construct command object, write the SQL to use with the database and do appropriate parameterized queries
                if ((((Button)sender).ID == "btnAgreed") && (sponsorList.SelectedIndex != 0)) {
                    dbCommand = new MySqlCommand("UPDATE mainrecords SET orderStatus=@status, adSize=@size, price=@price WHERE sponsorName=@entry;", dbConnect);
                    dbCommand.Prepare();
                    dbCommand.Parameters.AddWithValue("@size", size);
                    dbCommand.Parameters.AddWithValue("@price", price);
                    state = "agreed";
                } else if (((Button)sender).ID == "btnPending") {
                    dbCommand = new MySqlCommand("UPDATE mainrecords SET orderStatus=@status WHERE sponsorName=@entry;", dbConnect);
                    dbCommand.Prepare();
                    state = "pending";
                } else if (((Button)sender).ID == "btnDeclined") {
                    dbCommand = new MySqlCommand("UPDATE mainrecords SET orderStatus=@status WHERE sponsorName=@entry;", dbConnect);
                    dbCommand.Prepare();
                    state = "declined";
                } else {
                    // failure
                    fail = true;
                }

                if (!fail) {
                    // more parameterized queries
                    dbCommand.Parameters.AddWithValue("@status", state);
                    dbCommand.Parameters.AddWithValue("@entry", sponsorList.SelectedValue);

                    // execute
                    dbCommand.ExecuteNonQuery();

                    // reponse good
                    success = true;
                }

            } finally {
                dbConnect.Close();
            }

            // feedback
            lblFeedback.Visible = true;
            if (success) {
                lblFeedback.InnerHtml += "The sponsor information has been updated successfully";
            } else {
                lblFeedback.InnerHtml = "Oh no. Something has gone wrong. Please contact an administrator";
            }

            // redo dropdown menu
            populateSponsors();
        } else {
            // stupid bug
            bug = false;
        }

    }
}