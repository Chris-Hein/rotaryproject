using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Sql;
using System.Data;
using MySql.Data.MySqlClient;

public class UpdateAdmin {
    string dbname = "";
    // Connection objects
    MySqlConnection dbConnection;
    MySqlCommand dbCommand;
    string sqlString;

    public UpdateAdmin() {
        // Initialization
        string dbname = "Database='rehberga_php'; Datasource='mysql.nscctruro.ca'; User Id='rehberga_nsccweb'; Password='Normandy2492*'";
    // Connection objects
    MySqlConnection dbConnection = new MySqlConnection(dbname);
    }

    // Method to update the business name via the admin page
    public void updateSponsorName(string id, string sponsorName) {
        try {            
            dbConnection.Open();
            sqlString = "UPDATE mainrecords SET sponsorName = @sponsorName WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.Add("@sponsorName", sponsorName);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    // Method to update the business email via the admin page
    public void updateSponsorEmail(string id, string sponsorEmail) {
        try {
            dbConnection.Open();
            sqlString = "UPDATE mainRecords SET sponsorEmail = @sponsorEmail WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.Add("@sponsorEmail", sponsorEmail);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    // Method to update the business phone via the admin page
    public void updatePhone(string id, string sponsorPhone) {
        try {
            dbConnection.Open();
            sqlString = "UPDATE mainrecords SET sponsorPhone = @sponsorPhone WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.Add("@sponsorPhone", sponsorPhone);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    // Method to update the business address via the admin page
    public void updateAddress(string id, string sponsorAddress) {
        try {
            dbConnection.Open();
            sqlString = "UPDATE mainrecords SET sponsorAddress = @sponsorAddress WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.Add("@sponsorAddress", sponsorAddress);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    // Method to update the first name via the admin page
    public void updateFirstName(string id, string firstName) {
        try {
            dbConnection.Open();
            sqlString = "UPDATE admin SET first_name = @first_name WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.Add("@first_name", firstName);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    // Method to update the middle name via the admin page
    public void updateMiddleName(string id, string middleName) {
        try {
            dbConnection.Open();
            sqlString = "UPDATE admin SET middle_name = @middle_name WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.Add("@middle_name", middleName);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    // Method to update the last name via the admin page
    public void updateLastName(string id, string lastName) {
        try {
            dbConnection.Open();
            sqlString = "UPDATE admin SET last_name = @last_name WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.Add("@last_name", lastName);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    // Method to update the assigned photographer name via the admin page
    public void updateAssignedPhotographer(string id, string photographer) {
        try {
            dbConnection.Open();
            sqlString = "UPDATE mainrecords SET photographer = @photographer WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.Add("@photographer", photographer);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    // Method to update the ad size via the admin page
    public void updateAdSize(string id, string adSize) {
        try {
            dbConnection.Open();
            sqlString = "UPDATE mainrecords SET adSize = @adSize WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.Add("@aSize", adSize);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    // Method to update the haspaid via the admin page
    public void updateHasPaid(string id, string hasPaid) {
        try {
            dbConnection.Open();
            sqlString = "UPDATE mainrecords SET paid = @paid WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.Add("@paid", hasPaid);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    // Method to update the ordered via the admin page
    public void updateOrdered(string id, string ordered) {
        try {
            dbConnection.Open();
            sqlString = "UPDATE mainrecords SET orderStatus = @ordered WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.Add("@ordered", ordered);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    // Method to update the ad approved via the admin page
    public void updateAdApproved(string id, string adapproved) {
        try {
            dbConnection.Open();
            sqlString = "UPDATE addata SET approved = @ad_approved WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.Add("@ad_approved", adapproved);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    // Method to update the payment type via the admin page
    public void updatePaymentType(string id, string paymentType) {
        try {
            dbConnection.Open();
            sqlString = "UPDATE mainrecords SET paymentMethod = @pay_type WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.Add("@pay_type", paymentType);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    // Method to update the contacted via the admin page
    public void updateContacted(string id, string contacted) {
        try {
            dbConnection.Open();
            sqlString = "UPDATE admin SET contacted = @contacted WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.Add("@contacted", contacted);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    // Method to update the assigned business name via the admin page
    public void updateAssignedSponsorName(string photographer, string assignedSponsorName) {
        try {
            dbConnection.Open();
            sqlString = "UPDATE mainrecords SET assigned_business_name = @assigned_business_name WHERE assigned_photographer_name = '" + photographer + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.Add("@assigned_business_name", assignedSponsorName);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    // Method to update the assigned photographer via the admin page
    public void updateAssignedPhotographerName(string business, string assignedPhotographerName) {
        try {
            dbConnection.Open();
            sqlString = "UPDATE mainrecords SET photographer = @photographer WHERE sponsorName = '" + business + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.Add("@photographer", assignedPhotographerName);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    // Returns the text of the columns column so that it can be loaded into a text box for display and editing
    // Requires the id to be fed in to complete the sql string.

    public string getId(string id) {
        try {
            dbConnection.Open();
            sqlString = "SELECT id FROM mainrecords WHERE sponsorName = '" + id + "'";
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
            sqlString = "SELECT sponsorName FROM mainrecords WHERE sponsorName = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public string getSponsorEmail(string id){
        try {
            dbConnection.Open();
            sqlString = "SELECT sponsorEmail FROM mainrecords WHERE sponsorName = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public string getSponsorPhone(string id) {
        try {
            dbConnection.Open();
            sqlString = "SELECT sponsorPhone FROM mainrecords WHERE sponsorName = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public string getSponsorAddress(string id) {
        try {
            dbConnection.Open();
            sqlString = "SELECT sponsorAddress FROM mainrecords WHERE sponsorName = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public string getFirstName(string id) {
        try {
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
            dbConnection.Open();
            sqlString = "SELECT photographer FROM mainrecords WHERE sponsorName = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public string getAdSize(string id) {
        try {
            dbConnection.Open();
            sqlString = "SELECT adSize FROM mainrecords WHERE sponsorName = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public string getHasPaid(string id) {
        try {
            dbConnection.Open();
            sqlString = "SELECT paid FROM mainrecords WHERE sponsorName = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public string getOrdered(string id) {
        try {
            dbConnection.Open();
            sqlString = "SELECT order FROM mainrecords WHERE sponsorName = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public string getAdApproved(string id) {
        try {
            dbConnection.Open();
            sqlString = "SELECT approved FROM addara WHERE sponsorName = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public string getPayType(string id) {
        try {
            dbConnection.Open();
            sqlString = "SELECT paymentMethod FROM mainrecords WHERE sponsorName = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public string getContacted(string id) {
        try {
            dbConnection.Open();
            sqlString = "SELECT orderStatus FROM mainrecords WHERE sponsorName = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public string getSponsorContact(string id) {
        try {
            dbConnection.Open();
            sqlString = "SELECT sponsorContact FROM mainrecords WHERE sponsorName = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }


    public string getPhotographers() {
        try {
            dbConnection.Open();
            sqlString = "SELECT photographer FROM mainrecords WHERE id > 0";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public string getSponsors() {
        try {
            dbConnection.Open();
            sqlString = "SELECT sponsorName FROM mainrecords WHERE id > 0";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public string getCheckID(int id) {
        try {
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
            dbConnection.Open();
            sqlString = "UPDATE addata SET approved = @approved WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.Add("@approved", "approved");
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }
    //-------------------------------------------------------- new
    public string setSponsorName(string name) {
        try {
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
            dbConnection.Open();
            sqlString = "UPDATE mainrecords SET sponsorName = @sponsorName WHERE sponsorName = '" + name + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.Add("@sponsorName", sponsorName);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    public void upSponsorAddress(string name, string sponsorAddress) {
        try {
            dbConnection.Open();
            sqlString = "UPDATE mainrecords SET sponsorAddress = @sponsorAddress WHERE sponsorName = '" + name + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.Add("@sponsorAddress", sponsorAddress);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    public void upSponsorContact(string name, string sponsorContact) {
        try {
            dbConnection.Open();
            sqlString = "UPDATE mainrecords SET sponsorContact = @sponsorContact WHERE sponsorName = '" + name + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.Add("@sponsorContact", sponsorContact);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    public void upSponsorPhone(string name, string sponsorPhone) {
        try {
            dbConnection.Open();
            sqlString = "UPDATE mainrecords SET sponsorPhone = @sponsorPhone WHERE sponsorName = '" + name + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.Add("@sponsorPhone", sponsorPhone);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    public void upSponsorEmail(string name, string sponsorEmail) {
        try {
            dbConnection.Open();
            sqlString = "UPDATE mainrecords SET sponsorEmail = @sponsorEmail WHERE sponsorName = '" + name + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.Add("@sponsorEmail", sponsorEmail);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    public void upAdSize(string name, string adSize) {
        try {
            dbConnection.Open();
            sqlString = "UPDATE mainrecords SET adSize = @adSize WHERE sponsorName = '" + name + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.Add("@adSize", adSize);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    public void upPaymentStatus(string name, string paymentStatus) {
        try {
            dbConnection.Open();
            sqlString = "UPDATE mainrecords SET paid = @paid WHERE sponsorName = '" + name + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.Add("@paid", paymentStatus);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    public void upAdStatus(string name, string adStatus) {
        try {
            dbConnection.Open();
            sqlString = "UPDATE mainrecords SET orderStatus = @orderStatus WHERE sponsorName = '" + name + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.Add("@orderStatus", adStatus);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    public void upPaymentMethod(string name, string paymentMethod) {
        try {
            dbConnection.Open();
            sqlString = "UPDATE mainrecords SET paymentMethod = @paymentMethod WHERE sponsorName = '" + name + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.Add("@paymentMethod", paymentMethod);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    public void upContactStatus(string name, string contactStatus) {
        try {
            dbConnection.Open();
            sqlString = "UPDATE mainrecords SET adminMsg = @adminMsg WHERE sponsorName = '" + name + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.Add("@adminMsg", contactStatus);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    public string get16AdPrice(string id) {
        try {
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
            dbConnection.Open();
            sqlString = "UPDATE adprices SET 16adprice = @16adprice WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.Add("@16adprice", price);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    public void up13adPrice(string id, string price) {
        try {            
            dbConnection.Open();
            sqlString = "UPDATE adprices SET 13adprice = @13adprice WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.Add("@13adprice", price);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    public void up23adPrice(string id, string price) {
        try {            
            dbConnection.Open();
            sqlString = "UPDATE adprices SET 23adprice = @23adprice WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.Add("@23adprice", price);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }

    public void upFulladPrice(string id, string price) {
        try {            
            dbConnection.Open();
            sqlString = "UPDATE adprices SET fulladprice = @fulladprice WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            dbCommand.Parameters.Add("@fulladprice", price);
            dbCommand.ExecuteNonQuery();
        } finally {
            dbConnection.Close();
        }
    }
// ============================================ AD DATA
    public string getFrontRow(string id) {
        try {            
            dbConnection.Open();
            sqlString = "SELECT captionFront FROM addata WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public string getMiddleRow(string id) {
        try {            
            dbConnection.Open();
            sqlString = "SELECT captionMiddle FROM addata WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }
    public string getBackRow(string id) {
        try {            
            dbConnection.Open();
            sqlString = "SELECT captionBack FROM addata WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public string getImage(string id) {
        try {            
            dbConnection.Open();
            sqlString = "SELECT image FROM addata WHERE id = '" + id + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

}