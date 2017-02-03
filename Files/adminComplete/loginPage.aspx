<%@ Page Language="C#" Debug="true" ClientTarget="uplevel" EnableEventValidation="false" validateRequest="false" EnableViewState="true" %>
<%@ Import Namespace="MySql.Data.MySqlClient" %>
<%@ Import Namespace="System.Net.Mail" %>
<%@ Import Namespace="System.Net" %>
<%@Import Namespace="System.Data" %>

<!DOCTYPE html>

<script runat="server">

    MySqlConnection dbConnection;
    MySqlCommand dbCommand;
    MySqlDataReader dbReader;
    string sqlString;
    // Login object
    WebLogin weblogin;

    //Public acctRegistration;

    protected void page_load() {
        if ((!Page.IsPostBack) || (Session["weblogin"] == null)) {
            // First visit
            // database, username, password, table
            weblogin = new WebLogin("rotaryyearbook", "rotaryuser", "rotarypass", "login");
            Session["weblogin"] = weblogin;
        } else {
            // Postback
            weblogin = (WebLogin)Session["weblogin"];
        }
    }

    protected void userlogin(Object src, EventArgs args) {
        weblogin.username = txtLoginUsername.Text;
        weblogin.password = txtLoginPassword.Text;
        Session["username"] = txtLoginUsername.Text;

        if (weblogin.unlock()) {
            // Access granted
            // TODO: set this to the proper page
            Response.Redirect("main.aspx");
        } else {
            // Access denied
            txtLoginUsername.Text = "";
            txtLoginPassword.Text = "";
            lblError.Text = "Error: Invalid username/password";
        }
    }


    protected void reset(Object src, EventArgs args) {
        // Cycles between the showing and hiding the basics div when the button is clicked
        if (resetPanel.Style["display"] == "none") {
            resetPanel.Style.Add("display", "block");
            loginPanel.Style.Add("display", "none");
            lnkReset.CssClass = "text text-danger";
            lnkLogin.CssClass = "text text-info";
        } else {
            resetPanel.Style.Add("display", "none");
            loginPanel.Style.Add("display", "none");
            lnkReset.CssClass = "text text-info";
            lnkLogin.CssClass = "text text-info";
        }
    }
 

    protected void login(Object src, EventArgs args) {
        // Cycles between the showing and hiding the basics div when the button is clicked
        if (loginPanel.Style["display"] == "none") {
            loginPanel.Style.Add("display", "block");
            lnkLogin.CssClass = "text text-danger";
            lnkReset.CssClass = "text text-info";
        } else {
            loginPanel.Style.Add("display", "none");
            lnkLogin.CssClass = "text text-info";
            lnkReset.CssClass = "text text-info";
        }
    }

    protected string messagetext() {
        string message;
        // Generates the automated message body and returns the content of the email that will be sent out
        message = "Password Reset Notice: The user" + txtResetUsername.Text + " has requested an administrator reset their login credentials for the rotary yearbook site";

        return message;
    }

    // This works and is currently set up for linking to hotmail accounts
    // Sends out an automated email to tell the rotaryadmin that there has been a request for a password reset, email is funneled through an smtp server (currently using hotmal)
    protected void automatedMail(Object src, EventArgs args) {
        //MailMessage o = new MailMessage("From", "To","Subject", "Body");
        MailMessage o = new MailMessage("automated message", "rotaryclub yearbook admin","User Requested Paswwrod Reset", messagetext());
        //NetworkCredential netCred= new NetworkCredential("Sender Email","Sender Password");
        NetworkCredential netCred= new NetworkCredential("rotaryclubyearbook@hotmail.com","password");
        SmtpClient smtpobj= new SmtpClient("smtp.live.com", 587);
        smtpobj.EnableSsl = true;
        smtpobj.Credentials = netCred;
        smtpobj.Send(o);
    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Rotary Club of Truro Yearbook Login Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
     <!-- Latest compiled and minified CSS -->
     <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
     <!-- jQuery library -->
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
     <!-- Latest compiled JavaScript -->
     <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
             // Toggles sliding the pw reset panel open and closed
             $("#lnkReset").click(function () {
                 $("#resetPanel").slideToggle("fast");
             }); 
         });

        $(document).ready(function () {
             // Toggles sliding the login panel open and closed
             $("#lnkLogin").click(function () {
                 $("#loginPanel").slideToggle("fast");
             }); 
         });
    </script>
</head>
<body>
    <form runat="server">
    <div class="container col-sm-12 well" style="text-align:center">
        <asp:Label ID="lblTitle" Text="The Rotary Club of Truro Yearbook Login" runat="server" />
    </div>
        <div id="dogfood" class="container col-sm-12 well" style="text-align:center">
            <br/>
            <br/><br/><br/><br/><br/><br/><br/>
            <div class="container col-sm-12 well" style="text-align:center;">
                <asp:LinkButton ID="lnkReset" Text="Reset" Font-Underline="false" OnClick="reset" Font-Size="small" runat="server" />
                <asp:Label ID="lblUpperBreak" Text=" | " runat="server" />
                <asp:LinkButton ID="lnkLogin" Text="Login" OnClick="login" Font-Underline="false" Font-Size="small" runat="server" />
            </div>
            <br/>

            <div id="resetPanel" class="col-sm-12 well" style="text-align:left;margin-bottom:20px;display:none;" runat="server">
                <asp:Label ID="Label4" Text="Enter the username of the password you wish to reset and click the button. A reset request will be sent to an admin" CssClass="label label-danger" Font-Size="Small" runat="server" />
                <asp:TextBox ID="txtResetUsername" Text="" CssClass="form-control" MaxLength="8" runat="server" /><br />
                <asp:Button ID="btnReset" Text="Reset Password" CssClass="btn btn-danger" OnClick="automatedMail" runat="server" />
            </div>

            <div id="loginPanel" class="col-sm-12 well" style="text-align:left;margin-bottom:20px;display:none;" runat="server">
                <asp:Label ID="lblLoginUsername" Text="Username" CssClass="label label-danger" Font-Size="Small" runat="server" />
                <asp:TextBox ID="txtLoginUsername" Text="" CssClass="form-control" MaxLength="8" runat="server" /><br />
                <asp:Label ID="lblLoginPassword" Text="Password" CssClass="label label-danger" Font-Size="Small" runat="server" />
                <asp:TextBox ID="txtLoginPassword" TextMode="Password" Text="" CssClass="form-control" MaxLength="8" runat="server" /><br />
                <asp:Button ID="btnLogin" Text="Login" CssClass="btn btn-danger" OnClick="userlogin" runat="server" />
                <asp:Label ID="lblError" CssClass="text text-danger" Font-Size="X-Small" Text="" runat="server" />
            </div>
            <br />
            <br/>
            <br/><br/><br/><br/><br/><br/><br/><br/><br/>
        </div>



        <div class="container col-sm-12 well" style="text-align:center">
            <asp:Label ID="Label1" Text="About" runat="server" />
            <asp:Label ID="Label2" Text=" | " runat="server" />
            <asp:Label ID="lblTest1" Text="Terms of Service" runat="server" />
            <asp:Label ID="lblBreak1" Text=" | " runat="server" />
            <asp:Label ID="lblTest2" Text="Contact" runat="server" /><br />
            <asp:Label ID="Label3" Text=" © 2017. All Rights Reserved " runat="server" />
        </div>
    </form>
</body>
</html>
