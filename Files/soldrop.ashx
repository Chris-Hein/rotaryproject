<%@ WebHandler Language="C#" Class="soldrop" %>

using System;
using System.Web;
using System.IO;
using System.Data;
using MySql.Data.MySqlClient;
using System.Collections.Generic;
using System.Web.Script.Serialization;
using Newtonsoft.Json;
using System.Web.SessionState;

public class soldrop : IHttpHandler {

    // declaring variables to hold my database connectivity objects
    private MySqlConnection dbConnect;
    private MySqlCommand dbCommand;
    private MySqlDataReader dbReader;

    internal class ResponseData {
        public string contact { get; set; }
        public string address { get; set; }
        public string phone { get; set; }
        public string email { get; set; }
        public string notes { get; set; }
    }

    private ResponseData response;

    public void ProcessRequest (HttpContext context) {

        // INPUT JSON PROCESSING
        StreamReader streamReader = new StreamReader(context.Request.InputStream);
        string jsonString = streamReader.ReadToEnd();
        dynamic requestData = JsonConvert.DeserializeObject(jsonString);
        string spon = requestData["value"];

        // build response object
        response = new ResponseData();

        try {
            // connect to database
            dbConnect = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnect.Open();

            // construct data adapter and setup with SQL to use with the database
            dbCommand = new MySqlCommand("SELECT sponsorAddress, sponsorContact, sponsorPhone, sponsorEmail, sponsorNotes FROM mainrecords WHERE sponsorName=@entry;", dbConnect);
             
            // parameterized queries 
            //https://dev.mysql.com/doc/connector-net/en/connector-net-programming-prepared-preparing.html
            dbCommand.Prepare();
            dbCommand.Parameters.AddWithValue("@entry", spon);
            
            // use the reader to get data
            dbReader = dbCommand.ExecuteReader();
            while (dbReader.Read()) {
                if ((dbReader["sponsorContact"].ToString() == null) || (dbReader["sponsorContact"].ToString() == "")) {
                    response.contact = "There is no special contact to display";
                } else {
                    response.contact = dbReader["sponsorContact"].ToString();
                }
                if ((dbReader["sponsorAddress"].ToString() == null) || (dbReader["sponsorAddress"].ToString() == "")) {
                    response.address = "There is no address to display";
                } else {
                    response.address = dbReader["sponsorAddress"].ToString();
                }
                if ((dbReader["sponsorPhone"].ToString() == null) || (dbReader["sponsorPhone"].ToString() == "")) {
                    response.phone = "There is no phone number to display";
                } else {
                    response.phone = dbReader["sponsorPhone"].ToString();
                }
                if ((dbReader["sponsorEmail"].ToString() == null) || (dbReader["sponsorEmail"].ToString() == "")) {
                    response.email = "There is no email address to display";
                } else {
                    response.email = dbReader["sponsorEmail"].ToString();
                }
                if ((dbReader["sponsorNotes"].ToString() == null) || (dbReader["sponsorNotes"].ToString() == "")) {
                    response.notes = "There are no notes to display";
                } else {
                    response.notes = dbReader["sponsorNotes"].ToString();
                }
            }

            // serialize object into JSON string for transmitting
            JavaScriptSerializer js = new JavaScriptSerializer();
            string json = js.Serialize(response);

            // let browser know what's coming
            context.Response.ContentType = "application/json";

            // open streamwriter to write JSON out to response stream
            StreamWriter streamWriter = new StreamWriter(context.Response.OutputStream);
            streamWriter.Write(json);
            streamWriter.Close();
        } finally {
            dbConnect.Close();
        }
    }

    public bool IsReusable {
        get {
            return true;
        }
    }
}