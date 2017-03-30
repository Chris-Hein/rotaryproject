<%@ WebHandler Language="C#" Class="pho" %>

using System;
using System.Web;
using System.IO;
using System.Data;
using MySql.Data.MySqlClient;
using System.Collections.Generic;
using System.Web.Script.Serialization;
using Newtonsoft.Json;
using System.Web.SessionState;

public class pho : IHttpHandler {

    // declaring variables to hold my database connectivity objects
    private MySqlConnection dbConnect;
    private MySqlCommand dbCommand;
    private MySqlDataReader dbReader;

    internal class SolicitorInfo {
        public string id { get; set; }
        public string name { get; set; }
        public string business { get; set; }
        public string email { get; set; }
        public string address { get; set; }
        public string phone { get; set; }
        public string image { get; set; }
    }

    internal class ResponseData {        
        public SolicitorInfo solInfo { get; set; }
    }

    private ResponseData response;

    public void ProcessRequest (HttpContext context) {

        // INPUT JSON PROCESSING
        StreamReader streamReader = new StreamReader(context.Request.InputStream);
        string jsonString = streamReader.ReadToEnd();
        dynamic requestData = JsonConvert.DeserializeObject(jsonString);

        string spon = requestData["sponsor"];
        string state = requestData["state"];
        string size = requestData["size"];
        string price = requestData["price"];

        // build response object
        response = new ResponseData();

        try {
            // connect to database
            dbConnect = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnect.Open();
            
            // construct command object, write the SQL to use with the database and do appropriate parameterized queries
            if (state == "agreed") {
                //if for the drop down
                dbCommand = new MySqlCommand("SELECT sponserName, sponsorAddress, sponsorContact, sponsorEmail, sponsorPhone FROM mainrecords;", dbConnect);                
                dbCommand.Prepare();
                dbCommand.Parameters.AddWithValue("@size", size);
                dbCommand.Parameters.AddWithValue("@price", price);
            } else {                
                // failure
                response.success = false;
            }

            //IF FOR THE PHOTO GENERATION AND INFO OF IT
            sql = new MySqlCommand ("SELECT sponsorName, captionAddress, captionPhone, captionEmail, captionFront, captionMiddle, captionBack, image, adNotes FROM addData", dbConnect);
            
            if (!response.success) {
                // failed so we do nothing
            } else {
                // more parameterized queries
                dbCommand.Parameters.AddWithValue("@status", state);
                dbCommand.Parameters.AddWithValue("@entry", spon);

                // execute
                dbCommand.ExecuteNonQuery();

                // reponse good
                response.success = true;

                // serialize object into JSON string for transmitting
                JavaScriptSerializer js = new JavaScriptSerializer();
                string json = js.Serialize(response);

                // let browser know what's coming
                context.Response.ContentType = "application/json";

                // open streamwriter to write JSON out to response stream
                StreamWriter streamWriter = new StreamWriter(context.Response.OutputStream);
                streamWriter.Write(json);
                streamWriter.Close();
            }

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