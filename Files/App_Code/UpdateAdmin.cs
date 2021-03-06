﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Sql;
using System.Data;
using MySql.Data.MySqlClient;

public class UpdateAdmin {

    // Connection objects
    MySqlConnection dbConnection;
    MySqlCommand dbCommand;
    string sqlString;

    public UpdateAdmin() {
        // Initialization
    }

    // Method to update the business name via the admin page
    public void updateSponsorName(string id, string businessName) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "UPDATE admin SET business_name = @business_name WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.AddWithValue("@business_name", businessName);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    // Method to update the business email via the admin page
    public void updateSponsorEmail(string id, string businessEmail) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "UPDATE admin SET business_email = @business_email WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.AddWithValue("@business_email", businessEmail);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    // Method to update the business phone via the admin page
    public void updatePhone(string id, string businessPhone) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "UPDATE admin SET business_phone = @business_phone WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.AddWithValue("@business_phone", businessPhone);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    // Method to update the business address via the admin page
    public void updateAddress(string id, string businessAddress) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "UPDATE admin SET business_address = @business_address WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.AddWithValue("@business_address", businessAddress);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    // Method to update the first name via the admin page
    public void updateFirstName(string id, string firstName) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "UPDATE admin SET first_name = @first_name WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.AddWithValue("@first_name", firstName);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    // Method to update the middle name via the admin page
    public void updateMiddleName(string id, string middleName) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "UPDATE admin SET middle_name = @middle_name WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.AddWithValue("@middle_name", middleName);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    // Method to update the last name via the admin page
    public void updateLastName(string id, string lastName) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "UPDATE admin SET last_name = @last_name WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.AddWithValue("@last_name", lastName);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    // Method to update the assigned photographer name via the admin page
    public void updateAssignedPhotographer(string id, string assignedPhotographer) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "UPDATE admin SET assigned_photographer_name = @assigned_photographer_name WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.AddWithValue("@assigned_photographer_name", assignedPhotographer);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    // Method to update the ad size via the admin page
    public void updateAdSize(string id, string adSize) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "UPDATE admin SET ad_size = @ad_size WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.AddWithValue("@ad_size", adSize);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    // Method to update the haspaid via the admin page
    public void updateHasPaid(string id, string hasPaid) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "UPDATE admin SET haspaid = @haspaid WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.AddWithValue("@haspaid", hasPaid);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    // Method to update the ordered via the admin page
    public void updateOrdered(string id, string ordered) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "UPDATE admin SET ordered = @ordered WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.AddWithValue("@ordered", ordered);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    // Method to update the ad approved via the admin page
    public void updateAdApproved(string id, string adapproved) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "UPDATE admin SET ad_approved = @ad_approved WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.AddWithValue("@ad_approved", adapproved);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    // Method to update the payment type via the admin page
    public void updatePaymentType(string id, string paymentType) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "UPDATE admin SET pay_type = @pay_type WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.AddWithValue("@pay_type", paymentType);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    // Method to update the contacted via the admin page
    public void updateContacted(string id, string contacted) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "UPDATE admin SET contacted = @contacted WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.AddWithValue("@contacted", contacted);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    // Method to update the assigned business name via the admin page
    public void updateAssignedSponsorName(string photographer, string assignedSponsorName) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "UPDATE admin SET assigned_business_name = @assigned_business_name WHERE assigned_photographer_name = '" + photographer + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.AddWithValue("@assigned_business_name", assignedSponsorName);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    // Method to update the assigned photographer via the admin page
    public void updateAssignedPhotographerName(string business, string assignedPhotographerName) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "UPDATE admin SET assigned_photographer_name = @assigned_photographer_name WHERE business_name = '" + business + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.AddWithValue("@assigned_photographer_name", assignedPhotographerName);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    // Returns the text of the columns column so that it can be loaded into a text box for display and editing
    // Requires the id to be fed in to complete the sql string.

    public string getId(string id) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "SELECT id FROM admin WHERE business_name = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public string getSponsorName(string id) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "SELECT business_name FROM admin WHERE business_name = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public string getSponsorEmail(string id){
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "SELECT business_email FROM admin WHERE business_name = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public string getSponsorPhone(string id) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "SELECT business_phone FROM admin WHERE business_name = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public string getSponsorAddress(string id) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "SELECT business_address FROM admin WHERE business_name = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public string getFirstName(string id) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "SELECT first_name FROM admin WHERE business_name = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public string getMiddleName(string id) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "SELECT middle_name FROM admin WHERE business_name = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public string getLastName(string id) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "SELECT last_name FROM admin WHERE business_name = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public string getAssignedPhotographerName(string id) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "SELECT assigned_photographer_name FROM admin WHERE business_name = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public string getAdSize(string id) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "SELECT ad_size FROM admin WHERE business_name = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public string getHasPaid(string id) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "SELECT haspaid FROM admin WHERE business_name = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public string getOrdered(string id) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "SELECT ordered FROM admin WHERE business_name = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public string getAdApproved(string id) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "SELECT ad_approved FROM admin WHERE business_name = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public string getPayType(string id) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "SELECT pay_type FROM admin WHERE business_name = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public string getContacted(string id) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "SELECT contacted FROM admin WHERE business_name = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public string getPhotographers() {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "SELECT assigned_photographer_name FROM admin WHERE id > 0";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public string getSponsores() {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "SELECT business_name FROM admin WHERE id > 0";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public string getCheckID(int id) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "SELECT captionEmail FROM addata WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    // Method to update the approved status of an ad via the invoice page
    public void updateApprovedStatus(string id, string approvedstatus) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "UPDATE addata SET approved = @approved WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.AddWithValue("@approved", "approved");
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }
    //-------------------------------------------------------- new
    public string setSponsorName(string name) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "SELECT sponsorName FROM mainrecords WHERE sponsorName = '" + name + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public string setSponsorEmail(string name) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "SELECT sponsorEmail FROM mainrecords WHERE sponsorName = '" + name + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public string setSponsorPhone(string name) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "SELECT sponsorPhone FROM mainrecords WHERE sponsorName = '" + name + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public string setSponsorAddress(string name) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "SELECT sponsorAddress FROM mainrecords WHERE sponsorName = '" + name + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public string setSponsorContact(string name) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "SELECT sponsorContact FROM mainrecords WHERE sponsorName = '" + name + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public string setAdSize(string name) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "SELECT adSize FROM mainrecords WHERE sponsorName = '" + name + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public string setPaymentStatus(string name) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "SELECT paid FROM mainrecords WHERE sponsorName = '" + name + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public string setAdStatus(string name) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "SELECT orderStatus FROM mainrecords WHERE sponsorName = '" + name + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public string setPaymentMethod(string name) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "SELECT paymentMethod FROM mainrecords WHERE sponsorName = '" + name + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public string setContactStatus(string name) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "SELECT adminMsg FROM mainrecords WHERE sponsorName = '" + name + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public void upSponsorName(string name, string sponsorName) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "UPDATE mainrecords SET sponsorName = @sponsorName WHERE sponsorName = '" + name + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.AddWithValue("@sponsorName", sponsorName);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    public void upSponsorAddress(string name, string sponsorAddress) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "UPDATE mainrecords SET sponsorAddress = @sponsorAddress WHERE sponsorName = '" + name + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.AddWithValue("@sponsorAddress", sponsorAddress);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    public void upSponsorContact(string name, string sponsorContact) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "UPDATE mainrecords SET sponsorContact = @sponsorContact WHERE sponsorName = '" + name + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.AddWithValue("@sponsorContact", sponsorContact);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    public void upSponsorPhone(string name, string sponsorPhone) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "UPDATE mainrecords SET sponsorPhone = @sponsorPhone WHERE sponsorName = '" + name + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.AddWithValue("@sponsorPhone", sponsorPhone);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    public void upSponsorEmail(string name, string sponsorEmail) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "UPDATE mainrecords SET sponsorEmail = @sponsorEmail WHERE sponsorName = '" + name + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.AddWithValue("@sponsorEmail", sponsorEmail);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    public void upAdSize(string name, string adSize) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "UPDATE mainrecords SET adSize = @adSize WHERE sponsorName = '" + name + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.AddWithValue("@adSize", adSize);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    public void upPaymentStatus(string name, string paymentStatus) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "UPDATE mainrecords SET paid = @paid WHERE sponsorName = '" + name + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.AddWithValue("@paid", paymentStatus);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    public void upAdStatus(string name, string adStatus) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "UPDATE mainrecords SET orderStatus = @orderStatus WHERE sponsorName = '" + name + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.AddWithValue("@orderStatus", adStatus);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    public void upPaymentMethod(string name, string paymentMethod) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "UPDATE mainrecords SET paymentMethod = @paymentMethod WHERE sponsorName = '" + name + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.AddWithValue("@paymentMethod", paymentMethod);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    public void upContactStatus(string name, string contactStatus) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "UPDATE mainrecords SET adminMsg = @adminMsg WHERE sponsorName = '" + name + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.AddWithValue("@adminMsg", contactStatus);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    public string get16AdPrice(string id) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "SELECT 16adprice FROM adprices WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public string get13AdPrice(string id) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "SELECT 13adprice FROM adprices WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public string get23AdPrice(string id) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "SELECT 23adprice FROM adprices WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public string getFullAdPrice(string id) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "SELECT fulladprice FROM adprices WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public void up16adPrice(string id, string price) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "UPDATE adprices SET 16adprice = @16adprice WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.AddWithValue("@16adprice", price);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    public void up13adPrice(string id, string price) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "UPDATE adprices SET 13adprice = @13adprice WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.AddWithValue("@13adprice", price);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    public void up23adPrice(string id, string price) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "UPDATE adprices SET 23adprice = @23adprice WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.AddWithValue("@23adprice", price);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    public void upFulladPrice(string id, string price) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "UPDATE adprices SET fulladprice = @fulladprice WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.AddWithValue("@fulladprice", price);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    // Method to update the assigned business name via the admin page
    public void updateAssignedSponsorName1(string photographer, string assignedSponsorName) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "UPDATE mainrecords SET sponsorName = @sponsorName WHERE photographer = '" + photographer + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.AddWithValue("@sponsorName", assignedSponsorName);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    // Method to update the assigned photographer via the admin page
    public void updateAssignedPhotographerName1(string business, string assignedPhotographerName) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "UPDATE mainrecords SET photographer = @photographer WHERE sponsorName = '" + business + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.AddWithValue("@photographer", assignedPhotographerName);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    public string autoComplete() {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "SELECT sponsorName FROM mainrecords WHERE id > 0";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }
}