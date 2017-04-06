<%@ WebHandler Language="C#" Class="spon" %>

using System;
using System.Web;
using System.Windows.Forms;
using System.IO;
using System.Data;
using MySql.Data.MySqlClient;
using System.Collections.Generic;
using System.Web.Script.Serialization;
using Newtonsoft.Json;
using System.Web.SessionState;

public class spon : IHttpHandler, IRequiresSessionState {
    //http://stackoverflow.com/questions/1058568/asp-net-how-to-access-session-from-handler
    // declaring variables to hold my database connectivity objects
    private MySqlConnection dbConnect;
    private MySqlCommand dbCommand;
    private MySqlDataReader dbReader;
    private WebLogin login = null;
    private string dbString = "Database='rehberga_php';Data Source='mysql.nscctruro.ca';User Id='rehberga_nsccweb';Password='Normandy2492*'";

    internal class ResponseData {
        public bool success { get; set; }
    }

    private ResponseData response;

    public void ProcessRequest(HttpContext context) {

        // build response object
        response = new ResponseData();

        // login check
        if (context.Session["login"] == null) {
            // bad reponse
            response.success = false;
        } else if (((WebLogin)context.Session["login"]).access == "no") {
            // bad reponse
            response.success = false;
        } else {
            login = (WebLogin)context.Session["login"];

            // INPUT JSON PROCESSING
            StreamReader streamReader = new StreamReader(context.Request.InputStream);
            string jsonString = streamReader.ReadToEnd();
            dynamic requestData = JsonConvert.DeserializeObject(jsonString);

            string sponsor = login.access;
            string busAddress = requestData["BusAddress"];
            string phone = requestData["Phone"];
            string email = requestData["Email"];
            string frontRow = requestData["FrontRow"];
            string middleRow = requestData["MiddleRow"];
            string backRow = requestData["BackRow"];
            string missing = requestData["Missing"];

            try {
                // connect to database
                dbConnect = new MySqlConnection(dbString);
                dbConnect.Open();

                // construct command object, write the SQL to use with the database and do appropriate parameterized queries

                dbCommand = new MySqlCommand("UPDATE addata SET captionAddress=@add, captionPhone=@phone, captionEmail=@email, captionFront=@front, captionMiddle=@middle, captionBack=@back, captionMissing=@missing WHERE sponsorName=@sponsor;", dbConnect);
                dbCommand.Prepare();

                // more parameterized queries
                if (busAddress != "") {
                    dbCommand.Parameters.AddWithValue("@add", busAddress);
                } else {
                    dbCommand.Parameters.AddWithValue("@add", null);
                }
                if (phone != "") {
                    dbCommand.Parameters.AddWithValue("@phone", phone);
                } else {
                    dbCommand.Parameters.AddWithValue("@phone", null);
                }
                if (email != "") {
                    dbCommand.Parameters.AddWithValue("@email", email);
                } else {
                    dbCommand.Parameters.AddWithValue("@email", null);
                }
                if (frontRow != "") {
                    dbCommand.Parameters.AddWithValue("@front", frontRow);
                } else {
                    dbCommand.Parameters.AddWithValue("@front", null);
                }
                if (middleRow != "") {
                    dbCommand.Parameters.AddWithValue("@middle", middleRow);
                } else {
                    dbCommand.Parameters.AddWithValue("@middle", null);
                }
                if (backRow != "") {
                    dbCommand.Parameters.AddWithValue("@back", backRow);
                } else {
                    dbCommand.Parameters.AddWithValue("@back", null);
                }
                if (missing != "") {
                    dbCommand.Parameters.AddWithValue("@missing", missing);
                } else {
                    dbCommand.Parameters.AddWithValue("@missing", null);
                }
                
                dbCommand.Parameters.AddWithValue("@sponsor", sponsor);

                // execute
                dbCommand.ExecuteNonQuery();

                // good reponse
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

            } finally {
                dbConnect.Close();
            }
        } // login check
    }

    public bool IsReusable {
        get {
            return true;
        }
    }

}