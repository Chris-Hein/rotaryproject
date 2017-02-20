using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Data;
using System.Data.SqlClient;

public partial class new_photographer : System.Web.UI.Page {

    // regex variable - sanitizing inputs
    private Regex regexMsg;

    SqlConnection dbConnection;
    SqlDataAdapter dbAdapter;
    SqlCommand dbCommand;
    DataSet dbDataSet;
    string sqlString;
    DataView dbDataView;

    //DB variables
    private string contact_name;
    private string business_name;
    private string business_email;
    private string business_address;
    private string phone;
    private string image;

    // ---------------------------------------------------------------- initial startup

    protected void PageLoad(object sender, EventArgs e) {
        try {
            // Create DataSet and fill with Products table
            dbConnection = new SqlConnection("Database=rotaryyearbook.sql; Data Source=localhost; User Id=useraccount; Password=userpassword");
            dbConnection.Open();
            sqlString = "SELECT * FROM adawaitingapproval ORDER BY business_name DESC";
            dbCommand = new SqlCommand(sqlString, dbConnection);

            dbAdapter = new SqlDataAdapter(sqlString, dbConnection);
            dbDataSet = new DataSet();
            dbAdapter.Fill(dbDataSet, "adawaitingapproval");

            sqlString = "SELECT * FROM adawaitingapproval";
            dbCommand.CommandText = sqlString;
            Cache["dbDataSet"] = dbDataSet;
        } catch (Exception c) {
            Response.Write("AN ERROR HAS OCCURED: <br/>");
            Response.Write(c.Message);
        } finally {
            dbConnection.Close();
        }
        //DB variables
        string contact_name = dbDataSet.Tables[0].Rows[0]["first_name" + " " + "last_name"].ToString();
        string business_name = dbDataSet.Tables[0].Rows[0]["business_name"].ToString();
        string business_email = dbDataSet.Tables[0].Rows[0]["business_email"].ToString();        
        string business_address = dbDataSet.Tables[0].Rows[0]["business_address"].ToString();
        string phone = dbDataSet.Tables[0].Rows[0]["phone"].ToString();
        string image = dbDataSet.Tables[0].Rows[0]["image"].ToString();

        // event listeners
        btnSend.ServerClick += new ImageClickEventHandler(btnSendClick);
        btnSearch.ServerClick += new EventHandler(search);

        // maintain page position after hitting edit and apply buttons
        Page.MaintainScrollPositionOnPostBack = true;

        // build regex objects for input validation
        regexMsg = new Regex("^[\\w\\W\\'][\\w\\W\\s\\'\\-]+$");
    }

    private void search(object sender, EventArgs e) {
        //getData();      
        if (txtSearch.Value != "") {
            dbConnection.Open();
            int i = 0;
            SqlCommand cmd0 = new SqlCommand("SELECT business_name FROM adawaitingapproval WHERE business_name ='" + txtSearch.Value + "'", dbConnection);
            i = int.Parse(cmd0.ExecuteScalar().ToString());
            if (i > 0) {
                SqlCommand cmd1 = new SqlCommand("SELECT notice FROM adawaitingapproval WHERE business_name ='" + txtSearch.Value + "'", dbConnection);
                string name = cmd1.ExecuteScalar().ToString();
                lblName.InnerHtml = contact_name;
                lblBus.InnerHtml = business_name;
                lblEmail.InnerHtml = business_email;
                lblAddress.InnerHtml = business_address;
                lblPhone.InnerHtml = phone;
                imgView.Src = image;
                dbConnection.Close();
            } else {
                //lblError.Visible = true;
                dbConnection.Close();
            }
        }

    }

    //private void getData() {
    //    try {
    //        // Create DataSet and fill with Products table
    //        dbConnection = new SqlConnection("Database=./Database/rotary tables/rotaryyearbook.sql; Data Source=localhost; User Id=useraccount; Password=userpassword");
    //        dbConnection.Open();
    //        sqlString = "SELECT * FROM adawaitingapproval ORDER BY business_name DESC";
    //        dbCommand = new SqlCommand(sqlString, dbConnection);

    //        dbAdapter = new SqlDataAdapter(sqlString, dbConnection);
    //        dbDataSet = new DataSet();
    //        dbAdapter.Fill(dbDataSet, "adawaitingapproval");
        
    //        sqlString = "SELECT * FROM adawaitingapproval";
    //        dbCommand.CommandText = sqlString;
    //        Cache["dbDataSet"] = dbDataSet;
    //    } catch (Exception e) {
    //        Response.Write("AN ERROR HAS OCCURED: <br/>");
    //        Response.Write(e.Message);
    //    } finally {
    //        dbConnection.Close();
    //    }
    //}    

    private void btnSendClick(object sender, EventArgs e) {

    //    bool pass = true;
    //    // regex check
    //    if (!regexMsg(txtMessage.text)) { pass = false; }

    //    if (pass) {

    //    } else {
    //        // regex check failed

    //    }
    }
}
 