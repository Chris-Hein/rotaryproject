using System;
using System.Collections.Generic;
using MySql.Data.MySqlClient;

/// <summary>
/// Summary description for WebLogin
/// </summary>
public class WebLogin {

    // database connectivity variables
    private MySqlConnection dbConnection;
    private string connectionString;
    private MySqlCommand dbCommand;
    private MySqlDataReader dbReader;

    // private property variables
    private string _username;
    private string _password;
    private string _usertype;
    private string _access;

    // list objects to hold username/password data
    private List<string> usernames;
    private List<string> passwords;
    private List<string> usertypes;

    public WebLogin(string database, string username, string password, string tableName) {

        try {
            // initialize the List objects
            usernames = new List<string>();
            passwords = new List<string>();
            usertypes = new List<string>();

            // *! -------- may need to sanitize inputs -------- !*

            // setup connection string
            connectionString = "Database="+ database +";Data Source=localhost;User Id=" + username + ";Password=" + password;

            // open the connection
            dbConnection = new MySqlConnection(connectionString);
            dbConnection.Open();

            // setup SQL
            string sqlString = "SELECT username,password,usertype FROM " + tableName;
            dbCommand = new MySqlCommand(sqlString, dbConnection);

            // get all the data!
            dbReader = dbCommand.ExecuteReader();

            // populate the List objects with usernames/passwords (Parallel Lists!)
            while (dbReader.Read()) {
                usernames.Add(dbReader["username"].ToString());
                passwords.Add(dbReader["password"].ToString());
                usertypes.Add(dbReader["usertype"].ToString());
            }
            dbReader.Close();

            // other initialization
            _username = "";
            _password = "";
            _usertype = "";
            _access = "no";
        } finally {
            dbConnection.Close();
        }
    }


    // --------------------------------------------------- get/sets
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

    public string access {
        get {
            return _access;
        }
    }

    // ---------------------------------------------------------------------------------- public method
    public string unlock() {
        // has the user already logged in?
        if (usernames == null) return _usertype;

        // loop through all the usernames in List
        _access = "no";
        for (int n = 0; n < usernames.Count; n++) {
            if ((_username == usernames[n]) && (_password == passwords[n])) {
                // access granted!
                _usertype = usertypes[n];
                _access = _usertype;
                // clear out lists for memory management
                usernames = null;
                passwords = null;
                usertypes = null;
                break;
            }
        }
        return _access;
    }
}