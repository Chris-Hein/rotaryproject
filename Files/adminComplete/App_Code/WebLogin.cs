using System;
using System.Collections.Generic;
using MySql.Data.MySqlClient;
using System.Data.SqlClient;

public class WebLogin {
    // Database connectivity variables
    private SqlConnection dbConnection;
    private string connectionString;
    private MySqlCommand dbCommand;
    private MySqlDataReader dbReader;
    private string sqlString;

    // Private property variables
    private string _username;
    private string _password;
    private bool _access;

    // List objects to hold username/password data
    private List<string> usernames;
    private List<string> passwords;

    public WebLogin(string database, string username, string password, string tableName) {
        try {
            // Initialize the list objects
            usernames = new List<string>();
            passwords = new List<string>();
            // Setup connection string
            connectionString = "Database=" + database + ";DataSource=localhost;User Id=" + username + ";Password=" + password;
            // Open the connection
            dbConnection = new MySqlConnection(connectionString);
            dbConnection.Open();
            // Setup SQL
            sqlString = "SELECT username,password FROM " + tableName;
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Get the data
            dbReader = dbCommand.ExecuteReader();
            // Populate list objects with usernames/passwords using parallel lists
            while (dbReader.Read()) {
                usernames.Add(dbReader["username"].ToString());
                passwords.Add(dbReader["password"].ToString());
            }
            // Other initializations
            _username = "";
            _password = "";
            _access = false;
        } finally {
            dbConnection.Close();
        }
    }

    //-------------------------------------------------------------------------------gets/sets
    public string username {
        set {
            _username = value;
        }
    }

    public string password {
        set {
            _password = value;
        }
    }

    public bool access {
        get {
            return _access;
        }
    }
    //-----------------------------------------------------------------------------public methods
    public bool unlock() {
        // Has the user already logged in?
        if (usernames == null) return true;
        // Loop through all usernames in list
        _access = false;
        for (int i = 0; i < usernames.Count; n++) {
            if ((_username == usernames[i]) && (_password == passwords[i])) {
                _access = true;
                // Clear out lists for memory management
                usernames = null;
                passwords = null;
                break;
            }
        }
        return _access;
    }
}