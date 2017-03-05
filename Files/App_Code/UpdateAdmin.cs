using System;
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

    // Method to update the sponsor name via the admin page
    public void updateSponsorName(string id, string sponsorName) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "UPDATE mainRecords SET sponsorName = @assigned_solicitor_name WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.AddWithValue("@assigned_solicitor_name", sponsorName);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    // Method to update the sponsor email via the admin page
    public void updateSponsorEmail(string id, string sponsorEmail) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "UPDATE mainRecords SET sponsorEmail = @sponsor_email WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.AddWithValue("@sponsor_email", sponsorEmail);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    // Method to update the sponsor phone via the admin page
    public void updatePhone(string id, string sponsorPhone) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "UPDATE mainRecords SET sponsorPhone = @sponsor_phone WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.AddWithValue("@sponsor_phone", sponsorPhone);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    // Method to update the sponsor address via the admin page
    public void updateAddress(string id, string sponsorAddress) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "UPDATE mainRecords SET sponsorAddress = @sponsor_address WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.AddWithValue("@sponsor_address", sponsorAddress);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    // Method to update the sponsor contact name via the admin page
    public void updateContactName(string id, string sponsorContact) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "UPDATE mainRecords SET sponsorContact = @sponsorContact WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.AddWithValue("@sponsorContact", sponsorContact);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    // Method to update the invoice via the admin page
    public void updateInvoice(string id, string invoice) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "UPDATE mainRecords SET invoiceSent = @invoice WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.AddWithValue("@invoice", invoice);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    // Method to update the admin auto message via the admin page
    public void updateAutoMsg(string id, string autoMsg) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "UPDATE mainRecords SET adminMsg = @adminMsg WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.AddWithValue("@adminMsg", autoMsg);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    // Method to update the photo approval status via the admin page
    public void updatePhotoStatus(string id, string photoStatus) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "UPDATE mainRecords SET approved = @approved WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.AddWithValue("@approved", photoStatus);
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
            sqlString = "UPDATE mainRecords SET photographer = @photographer WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.AddWithValue("@photographer", assignedPhotographer);
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
            sqlString = "UPDATE mainRecords SET adSize = @ad_size WHERE id = '" + id + "'";
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
            sqlString = "UPDATE mainRecords SET paid = @haspaid WHERE id = '" + id + "'";
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
            sqlString = "UPDATE mainRecords SET ordered = @ordered WHERE id = '" + id + "'";
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
            sqlString = "UPDATE mainRecords SET approved = @ad_approved WHERE id = '" + id + "'";
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
            sqlString = "UPDATE mainRecords SET paid = @pay_type WHERE id = '" + id + "'";
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
            sqlString = "UPDATE mainRecords SET contacted = @contacted WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.AddWithValue("@contacted", contacted);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    // Method to update the assigned sponsor name via the admin page
    public void updateAssignedSponsorName(string sponsor, string assignedSponsorName) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "UPDATE mainRecords SET assigned_sponsorName = @assigned_sponsorName WHERE assigned_sponsor_name = '" + sponsor + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.AddWithValue("@assigned_sponsorName", assignedSponsorName);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    // Method to update the assigned solicitor via the admin page
    public void updateAssignedSolicitorName(string solicitor, string assignedSolicitorName) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "UPDATE mainRecords SET assigned_solicitor_name = @assigned_solicitor_name WHERE assigned_sponsor_name = '" + solicitor + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.AddWithValue("@assigned_solicitor_name", assignedSolicitorName);
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
            sqlString = "SELECT id FROM admin WHERE sponsorName = '" + id + "'";
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
            sqlString = "SELECT sponsorName FROM admin WHERE sponsorName = '" + id + "'";
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
            sqlString = "SELECT sponsor_email FROM admin WHERE sponsorName = '" + id + "'";
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
            sqlString = "SELECT sponsor_phone FROM admin WHERE sponsorName = '" + id + "'";
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
            sqlString = "SELECT sponsor_address FROM admin WHERE sponsorName = '" + id + "'";
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
            sqlString = "SELECT first_name FROM admin WHERE sponsorName = '" + id + "'";
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
            sqlString = "SELECT middle_name FROM admin WHERE sponsorName = '" + id + "'";
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
            sqlString = "SELECT last_name FROM admin WHERE sponsorName = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public string getAssignedSolicitorName(string id) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "SELECT solicitor FROM admin WHERE assigned_solicitor_name = '" + id + "'";
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
            sqlString = "SELECT ad_size FROM admin WHERE sponsor_name = '" + id + "'";
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
            sqlString = "SELECT haspaid FROM admin WHERE sponsorName = '" + id + "'";
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
            sqlString = "SELECT ordered FROM admin WHERE sponsor_name = '" + id + "'";
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
            sqlString = "SELECT ad_approved FROM admin WHERE sponsorName = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public string getAutoMsg(string id) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "SELECT approved FROM admin WHERE sponsorName = '" + id + "'";
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
            sqlString = "SELECT pay_type FROM admin WHERE sponsorName = '" + id + "'";
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
            sqlString = "SELECT contacted FROM admin WHERE sponsorName = '" + id + "'";
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
            sqlString = "SELECT sponsorName FROM admin WHERE id > 0";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }


    public string getPhotoStatus(string id) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "SELECT approved FROM admin WHERE id > 0";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }
}