using System;
using MySql.Data.MySqlClient;

/// <summary>
/// Database manipulation object for the Rotary Club yearbook site
/// </summary>
public class WebData {

    // database connectivity variables
    private MySqlConnection dbConnection;
    private MySqlCommand dbCommand;
    private string mainTable;
    private string adTable;
    private string connection;

    // ---------------------------------------------------------------- constructor

    public WebData() {
        // setup connection string
        connection = "Database=rotaryyearbook;Data Source=localhost; User Id=useraccount; Password=userpassword";
        // setup table data
        mainTable = "mainrecords";
        adTable = "addata";
    }

    // ---------------------------------------------------------------- public methods

    public int getID(string sponsorName) {
        // variable for data 
        int data = -1;
        try {
            // open the connection
            dbConnection = new MySqlConnection(connection);
            dbConnection.Open();

            // get the data
            string sql = "SELECT id FROM " + mainTable + " WHERE sponsorName=" + sponsorName;
            dbCommand = new MySqlCommand(sql, dbConnection);
            data = (int) dbCommand.ExecuteScalar();
        } finally {
            // close the connection
            dbConnection.Close();
        }
        // return data
        return data;
    }

    public string getSponsorName(int id) {
        return getData("getSponsorName", id, "");
    }

    public string getSponsorAddress(string sponsorName) {
        return getData("getSponsorAddress", 0, sponsorName);
    }

    public string getSponsorAddress(int id) {
        return getData("getSponsorAddress", id, "");
    }

    public void editSponsorAddress(string sponsorName, string data) {
        editData("editSponsorAddress", 0, sponsorName, data);
    }

    public void editSponsorAddress(int id, string data) {
        editData("editSponsorAddress", id, "", data);
    }

    public string getSponsorContact(string sponsorName) {
        return getData("getSponsorContact", 0, sponsorName);
    }

    public string getSponsorContact(int id) {
        return getData("getSponsorContact", id, "");
    }

    public void editSponsorContact(string sponsorName, string data) {
        editData("editSponsorContact", 0, sponsorName, data);
    }

    public void editSponsorContact(int id, string data) {
        editData("editSponsorContact", id, "", data);
    }

    public string getSponsorPhone(string sponsorName) {
        return getData("getSponsorPhone", 0, sponsorName);
    }

    public string getSponsorPhone(int id) {
        return getData("getSponsorPhone", id, "");
    }

    public void editSponsorPhone(string sponsorName, string data) {
        editData("editSponsorPhone", 0, sponsorName, data);
    }

    public void editSponsorPhone(int id, string data) {
        editData("editSponsorPhone", id, "", data);
    }

    public string getSponsorEmail(string sponsorName) {
        return getData("getSponsorEmail", 0, sponsorName);
    }

    public string getSponsorEmail(int id) {
        return getData("getSponsorEmail", id, "");
    }

    public void editSponsorEmail(string sponsorName, string data) {
        editData("editSponsorEmail", 0, sponsorName, data);
    }

    public void editSponsorEmail(int id, string data) {
        editData("editSponsorEmail", id, "", data);
    }

    public string getSolicitor(string sponsorName) {
        return getData("getSolicitor", 0, sponsorName);
    }

    public string getSolicitor(int id) {
        return getData("getSolicitor", id, "");
    }

    public void editSolicitor(string sponsorName, string data) {
        editData("editSolicitor", 0, sponsorName, data);
    }

    public void editSolicitor(int id, string data) {
        editData("editSolicitor", id, "", data);
    }

    public string getOrderStatus(string sponsorName) {
        return getData("getOrderStatus", 0, sponsorName);
    }

    public string getOrderStatus(int id) {
        return getData("getOrderStatus", id, "");
    }

    public void editOrderStatus(string sponsorName, string data) {
        editData("editOrderStatus", 0, sponsorName, data);
    }

    public void editOrderStatus(int id, string data) {
        editData("editOrderStatus", id, "", data);
    }

    public string getAdSize(string sponsorName) {
        return getData("getAdSize", 0, sponsorName);
    }

    public string getAdSize(int id) {
        return getData("getAdSize", id, "");
    }

    public void editAdSize(string sponsorName, string data) {
        editData("editAdSize", 0, sponsorName, data);
    }

    public void editAdSize(int id, string data) {
        editData("editAdSize", id, "", data);
    }

    public int getPrice(string sponsorName) {
        return Int16.Parse(getData("getPrice", 0, sponsorName));
    }

    public int getPrice(int id) {
        return Int16.Parse(getData("getPrice", id, ""));
    }

    public void editPrice(string sponsorName, int data) {
        editData("editAdSize", 0, sponsorName, data.ToString());
    }

    public void editPrice(int id, int data) {
        editData("editAdSize", id, "", data.ToString());
    }

    public string getPaid(string sponsorName) {
        return getData("getPaid", 0, sponsorName);
    }

    public string getPaid(int id) {
        return getData("getPaid", id, "");
    }

    public void editPaid(string sponsorName, string data) {
        editData("editPaid", 0, sponsorName, data);
    }

    public void editPaid(int id, string data) {
        editData("editPaid", id, "", data);
    }

    public DateTime getDatePaid(string sponsorName) {
        return DateTime.Parse(getData("getDatePaid", 0, sponsorName));
    }

    public DateTime getDatePaid(int id) {
        return DateTime.Parse(getData("getDatePaid", id, ""));
    }

    public void editDatePaid(string sponsorName, DateTime date) {
        editData("editDatePaid", 0, sponsorName, date.ToString());
    }

    public void editDatePaid(int id, DateTime date) {
        editData("editDatePaid", id, "", date.ToString());
    }

    public string getPhotographer(string sponsorName) {
        return getData("getPhotographer", 0, sponsorName);
    }

    public string getPhotographer(int id) {
        return getData("getPhotographer", id, "");
    }

    public void editPhotographer(string sponsorName, string data) {
        editData("editPhotographer", 0, sponsorName, data);
    }

    public void editPhotographer(int id, string data) {
        editData("editPhotographer", id, "", data);
    }

    public string getSponsorNotes(string sponsorName) {
        return getData("getSponsorNotes", 0, sponsorName);
    }

    public string getSponsorNotes(int id) {
        return getData("getSponsorNotes", id, "");
    }

    public void editSponsorNotes(string sponsorName, string data) {
        editData("editSponsorNotes", 0, sponsorName, data);
    }

    public void editSponsorNotes(int id, string data) {
        editData("editSponsorNotes", id, "", data);
    }

    public string getApproved(string sponsorName) {
        return getData("getApproved", 0, sponsorName);
    }

    public string getApproved(int id) {
        return getData("getApproved", id, "");
    }

    public void editApproved(string sponsorName, string data) {
        editData("editApproved", 0, sponsorName, data);
    }

    public void editApproved(int id, string data) {
        editData("editApproved", id, "", data);
    }

    public string getCaptionAddress(string sponsorName) {
        return getData("getCaptionAddress", 0, sponsorName);
    }

    public string getCaptionAddress(int id) {
        return getData("getCaptionAddress", id, "");
    }

    public void editCaptionAddress(string sponsorName, string data) {
        editData("editCaptionAddress", 0, sponsorName, data);
    }

    public void editCaptionAddress(int id, string data) {
        editData("editCaptionAddress", id, "", data);
    }

    public string getCaptionPhone(string sponsorName) {
        return getData("getCaptionPhone", 0, sponsorName);
    }

    public string getCaptionPhone(int id) {
        return getData("getCaptionPhone", id, "");
    }

    public void editCaptionPhone(string sponsorName, string data) {
        editData("editCaptionPhone", 0, sponsorName, data);
    }

    public void editCaptionPhone(int id, string data) {
        editData("editCaptionPhone", id, "", data);
    }

    public string getCaptionEmail(string sponsorName) {
        return getData("getCaptionEmail", 0, sponsorName);
    }

    public string getCaptionEmail(int id) {
        return getData("getCaptionEmail", id, "");
    }

    public void editCaptionEmail(string sponsorName, string data) {
        editData("editCaptionEmail", 0, sponsorName, data);
    }

    public void editCaptionEmail(int id, string data) {
        editData("editCaptionEmail", id, "", data);
    }

    public string getCaptionFront(string sponsorName) {
        return getData("getCaptionFront", 0, sponsorName);
    }

    public string getCaptionFront(int id) {
        return getData("getCaptionFront", id, "");
    }

    public void editCaptionFront(string sponsorName, string data) {
        editData("editCaptionFront", 0, sponsorName, data);
    }

    public void editCaptionFront(int id, string data) {
        editData("editCaptionFront", id, "", data);
    }

    public string getCaptionMiddle(string sponsorName) {
        return getData("getCaptionMiddle", 0, sponsorName);
    }

    public string getCaptionMiddle(int id) {
        return getData("getCaptionMiddle", id, "");
    }

    public void editCaptionMiddle(string sponsorName, string data) {
        editData("editCaptionMiddle", 0, sponsorName, data);
    }

    public void editCaptionMiddle(int id, string data) {
        editData("editCaptionMiddle", id, "", data);
    }

    public string getCaptionBack(string sponsorName) {
        return getData("getCaptionBack", 0, sponsorName);
    }

    public string getCaptionBack(int id) {
        return getData("getCaptionBack", id, "");
    }

    public void editCaptionBack(string sponsorName, string data) {
        editData("editCaptionBack", 0, sponsorName, data);
    }

    public void editCaptionBack(int id, string data) {
        editData("editCaptionBack", id, "", data);
    }

    public string getImage(string sponsorName) {
        return getData("getImage", 0, sponsorName);
    }

    public string getImage(int id) {
        return getData("getImage", id, "");
    }

    public void editImage(string sponsorName, string data) {
        editData("editImage", 0, sponsorName, data);
    }

    public void editImage(int id, string data) {
        editData("editImage", id, "", data);
    }

    public string getAdNotes(string sponsorName) {
        return getData("getAdNotes", 0, sponsorName);
    }

    public string getAdNotes(int id) {
        return getData("getAdNotes", id, "");
    }

    public void editAdNotes(string sponsorName, string data) {
        editData("editAdNotes", 0, sponsorName, data);
    }

    public void editAdNotes(int id, string data) {
        editData("editAdNotes", id, "", data);
    }

    // ---------------------------------------------------------------- private methods

    private string getData(string func, int id, string sponsor) {
        // variable for sql
        string sql = "";
        // variable for data returned
        string data;

        // what are we looking with?
        string ending;
        if (id == 0) {
            ending = "sponsorName = " + sponsor;
        } else {
            ending = "ID = '" + id + "'";
        }

        // what data are we looking for?
        switch (func) {
            // get id is handled elsewere
            case "getSponsorName":
                sql = "SELECT sponsorName FROM " + mainTable + " WHERE " + ending;
                break;
            case "getSponsorAddress":
                sql = "SELECT sponsorAddress FROM " + mainTable + " WHERE " + ending;
                break;
            case "getSponsorContact":
                sql = "SELECT sponsorContact FROM " + mainTable + " WHERE " + ending;
                break;
            case "getSponsorPhone":
                sql = "SELECT sponsorPhone FROM " + mainTable + " WHERE " + ending;
                break;
            case "getSponsorEmail":
                sql = "SELECT sponsorEmail FROM " + mainTable + " WHERE " + ending;
                break;
            case "getSolicitor":
                sql = "SELECT solicitor FROM " + mainTable + " WHERE " + ending;
                break;
            case "getOrderStatus":
                sql = "SELECT orderStatus FROM " + mainTable + " WHERE " + ending;
                break;
            case "getAdSize":
                sql = "SELECT adSize FROM " + mainTable + " WHERE " + ending;
                break;
            case "getPrice":
                sql = "SELECT price FROM " + mainTable + " WHERE " + ending;
                break;
            case "getPaid":
                sql = "SELECT paid FROM " + mainTable + " WHERE " + ending;
                break;
            case "getDatePaid":
                sql = "SELECT datePaid FROM " + mainTable + " WHERE " + ending;
                break;
            case "getPhotographer":
                sql = "SELECT photographer FROM " + mainTable + " WHERE " + ending;
                break;
            case "getSponsorNotes":
                sql = "SELECT sponsorNotes FROM " + mainTable + " WHERE " + ending;
                break;
            case "getApproved":
                sql = "SELECT approved FROM " + adTable + " WHERE " + ending;
                break;
            case "getCaptionAddress":
                sql = "SELECT captionAddress FROM " + adTable + " WHERE " + ending;
                break;
            case "getCaptionPhone":
                sql = "SELECT captionPhone FROM " + adTable + " WHERE " + ending;
                break;
            case "getCaptionEmail":
                sql = "SELECT captionEmail FROM " + adTable + " WHERE " + ending;
                break;
            case "getCaptionFront":
                sql = "SELECT captionFront FROM " + adTable + " WHERE " + ending;
                break;
            case "getCaptionMiddle":
                sql = "SELECT captionMiddle FROM " + adTable + " WHERE " + ending;
                break;
            case "getCaptionBack":
                sql = "SELECT captionBack FROM " + adTable + " WHERE " + ending;
                break;
            case "getImage":
                sql = "SELECT image FROM " + adTable + " WHERE " + ending;
                break;
            case "getAdNotes":
                sql = "SELECT adNotes FROM " + adTable + " WHERE " + ending;
                break;
        }

        try {
            // open the connection
            dbConnection = new MySqlConnection(connection);
            dbConnection.Open();

            // get the data
            dbCommand = new MySqlCommand(sql, dbConnection);
            data = dbCommand.ExecuteScalar().ToString();
        } finally {
            // close the connection
            dbConnection.Close();
        }
        // return data
        return data;

    }

    private void editData(string func, int id, string sponsor, string data) {

        // variable for sql
        string sql = "";
        // boolean checks for specific data types
        bool inte = false;
        bool date = false;

        // what are we looking with?
        string ending;
        if (id == 0) {
            ending = "sponsorName = " + sponsor;
        } else {
            ending = "ID = '" + id + "'";
        }

        // what data are we looking for?
        switch (func) {
            case "editSponsorAddress":
                sql = "UPDATE " + mainTable + " SET sponsorAddress = @param WHERE " + ending;
                break;
            case "editSponsorContact":
                sql = "UPDATE " + mainTable + " SET sponsorContact = @param WHERE " + ending;
                break;
            case "editSponsorPhone":
                sql = "UPDATE " + mainTable + " SET sponsorPhone = @param WHERE " + ending;
                break;
            case "editSponsorEmail":
                sql = "UPDATE " + mainTable + " SET sponsorEmail = @param WHERE " + ending;
                break;
            case "editSolicitor":
                sql = "UPDATE " + mainTable + " SET solicitor = @param WHERE " + ending;
                break;
            case "editOrderStatus":
                sql = "UPDATE " + mainTable + " SET orderStatus = @param WHERE " + ending;
                break;
            case "editAdSize":
                sql = "UPDATE " + mainTable + " SET adSize = @param WHERE " + ending;
                break;
            case "editPrice":
                inte = true; // this is an int
                sql = "UPDATE " + mainTable + " SET price = @param WHERE " + ending;
                break;
            case "editPaid":
                sql = "UPDATE " + mainTable + " SET paid = @param WHERE " + ending;
                break;
            case "editDatePaid":
                date = true; // this is an date object
                sql = "UPDATE " + mainTable + " SET datePaid = @param WHERE " + ending;
                break;
            case "editPhotographer":
                sql = "UPDATE " + mainTable + " SET photographer = @param WHERE " + ending;
                break;
            case "editSponsorNotes":
                sql = "UPDATE " + mainTable + " SET sponsorNotes = @param WHERE " + ending;
                break;
            case "editApproved":
                sql = "UPDATE " + mainTable + " SET approved = @param WHERE " + ending;
                break;
            case "editCaptionAddress":
                sql = "UPDATE " + mainTable + " SET captionAddress = @param WHERE " + ending;
                break;
            case "editCaptionPhone":
                sql = "UPDATE " + mainTable + " SET captionPhone = @param WHERE " + ending;
                break;
            case "editCaptionEmail":
                sql = "UPDATE " + mainTable + " SET captionEmail = @param WHERE " + ending;
                break;
            case "editCaptionFront":
                sql = "UPDATE " + mainTable + " SET captionFront = @param WHERE " + ending;
                break;
            case "editCaptionMiddle":
                sql = "UPDATE " + mainTable + " SET captionMiddle = @param WHERE " + ending;
                break;
            case "editCaptionBack":
                sql = "UPDATE " + mainTable + " SET captionBack = @param WHERE " + ending;
                break;
            case "editImage":
                sql = "UPDATE " + mainTable + " SET image = @param WHERE " + ending;
                break;
            case "editAdNotes":
                sql = "UPDATE " + mainTable + " SET adNotes = @param WHERE " + ending;
                break;
        }

        try {
            // open the connection
            dbConnection = new MySqlConnection(connection);
            dbConnection.Open();

            // get command object ready
            dbCommand = new MySqlCommand(sql, dbConnection);

            // data type check
            if (inte) {
                dbCommand.Parameters.AddWithValue("@param", Int16.Parse(data));
            } else if (date) {
                dbCommand.Parameters.AddWithValue("@param", DateTime.Parse(data));
            } else {
                dbCommand.Parameters.AddWithValue("@param", data);
            }

            // execute the command
            dbCommand.ExecuteNonQuery();
        } finally {
            // close the connection
            dbConnection.Close();
        }

    }

}