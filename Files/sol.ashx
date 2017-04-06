<%@ WebHandler Language="C#" Class="sol" %>

using System;
using System.Web;
using System.IO;
using System.Data;
using MySql.Data.MySqlClient;
using System.Collections.Generic;
using System.Web.Script.Serialization;
using Newtonsoft.Json;
using System.Web.SessionState;

public class sol : IHttpHandler {

    // declaring variables to hold my database connectivity objects
    private MySqlConnection dbConnect;
    private MySqlCommand dbCommand;
    private MySqlDataReader dbReader;
    private string dbString = "Database='rehberga_php';Data Source='mysql.nscctruro.ca';User Id='rehberga_nsccweb';Password='Normandy2492*'";

    internal class ResponseData {
        public bool success { get; set; }
    }

    private ResponseData response;

    public void ProcessRequest (HttpContext context) {
        
        
        // login check
        //if ((((WebLogin)Session["login"]).access == "solicitor") || (((WebLogin)Session["login"]).access == "master")) {
        
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
                dbConnect = new MySqlConnection(dbString);
                dbConnect.Open();

                // construct command object, write the SQL to use with the database and do appropriate parameterized queries
                if (state == "agreed") {
                    dbCommand = new MySqlCommand("UPDATE mainrecords SET orderStatus=@status, adSize=@size, price=@price WHERE sponsorName=@entry;", dbConnect);
                    dbCommand.Prepare();
                    dbCommand.Parameters.AddWithValue("@size", size);
                    dbCommand.Parameters.AddWithValue("@price", price);
                } else if (state == "pending") {
                    dbCommand = new MySqlCommand("UPDATE mainrecords SET orderStatus=@status WHERE sponsorName=@entry;", dbConnect);
                    dbCommand.Prepare();
                } else if (state == "declined") {
                    dbCommand = new MySqlCommand("UPDATE mainrecords SET orderStatus=@status WHERE sponsorName=@entry;", dbConnect);
                    dbCommand.Prepare();
                } else {
                    // failure
                    response.success = false;
                }

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

        //} //login check
        
    }

    public bool IsReusable {
        get {
            return true;
        }
    }
}