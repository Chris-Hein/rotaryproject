using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Sql;
using System.Data;
using MySql.Data.MySqlClient;

public class Review {
    // Connection objects
    MySqlConnection dbConnection;
    MySqlCommand dbCommand;
    string sqlString;

    public Review() {
        // Initialization
    }

    public string getAdSize(string email) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "SELECT ad_size FROM adawaitingapproval WHERE business_email = '" + email + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public string getFirstName(string email) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "SELECT first_name FROM adawaitingapproval WHERE business_email = '" + email + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public string getLastName(string email) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "SELECT last_name FROM adawaitingapproval WHERE business_email = '" + email + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public string getBusinessName(string email) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "SELECT business_name FROM adawaitingapproval WHERE business_email = '" + email + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }

    public string getEmail(string email) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "SELECT business_email FROM adawaitingapproval WHERE business_email = '" + email + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Uses executescalar because there is only one thing that needs to be returned
            return dbCommand.ExecuteScalar().ToString();
        } finally {
            dbConnection.Close();
        }
    }
}