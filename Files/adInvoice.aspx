<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" Debug="true" ClientTarget="uplevel" EnableEventValidation="false" validateRequest="false" EnableViewState="true" %>
<%@ Import Namespace="MySql.Data.MySqlClient" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Windows.Forms" %>
<%@ Import Namespace="System.Text" %>
<%@ Import Namespace="System.Web" %>
<%@ Import Namespace="System.Web.UI" %>
<%@ Import Namespace="System.Net.Mail" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.Data" %>

<script runat="server">
    MySqlConnection dbConnection;
    MySqlCommand dbCommand;
    MySqlDataReader dbReader;
    string sqlString;
    MySqlDataAdapter dbAdapter;
    DataSet dbDataSet;

    Review review;

    protected void page_load() {
        if (!Page.IsPostBack) {
            displayAdData();
            populateEmailDropdown();
        }

        review = new Review();
    }

    protected void approveAd(Object src, EventArgs args) {

    }
    /*
    protected void rejectAd(Object src, EventArgs args) {
        // Cycles between the showing and hiding the contact div when the button is clicked
        if (messagePanel.Style["display"] == "none") {
            messagePanel.Style.Add("display", "block");
            btnApprove.CssClass = "btn btn-info";
        } else {
            messagePanel.Style.Add("display", "none");
            btnApprove.CssClass = "btn btn-danger";
        }
    }
    */

    protected void toggleSend(Object src, EventArgs args) {
        if (txtMessage.Text == "") {
            btnSendMessage.Enabled = false;
        } else {
            btnSendMessage.Enabled = true;
        }
    }

    protected void populateEmailDropdown() {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "SELECT business_email FROM adawaitingapproval WHERE id > 0";
            dbAdapter = new MySqlDataAdapter(sqlString, dbConnection);
            dbDataSet = new DataSet();
            dbAdapter.Fill(dbDataSet, "adawaitingapproval");
            // Executes the SQL
            // Binds the photographer data to the dropdown so it can be displayed
            drpContactInfo.DataSource = dbDataSet.Tables["adawaitingapproval"];
            drpContactInfo.DataValueField = "business_email";
            drpContactInfo.DataTextField = "business_email";
            drpContactInfo.DataBind();
            Cache["dbDataSet"] = dbDataSet;
        } finally {
            dbConnection.Close();
        }
    }

    // Method that generates the automated invoice
    protected void sendInvoice(Object src, EventArgs args) {
        int adCost = 0;
        string message;
        // The email that the automated invoice is being sent to (based on the selection in the drop down)
        string email = review.getEmail(drpContactInfo.SelectedValue.ToString());

        // Sets the ad price in the invoice message based on the size of the ad selected
        if (review.getAdSize(drpContactInfo.SelectedValue.ToString()) == "1/6 Page") {
            adCost = 415;
        } else if (review.getAdSize(drpContactInfo.SelectedValue.ToString()) == "1/3 Page") {
            adCost = 690;
        } else if (review.getAdSize(drpContactInfo.SelectedValue.ToString()) == "2/3 Page") {
            adCost = 1150;
        } else if (review.getAdSize(drpContactInfo.SelectedValue.ToString()) == "Full Page") {
            adCost = 1725;
        }

        //This is the string that holds the automated invoice message. automatically generates the name, ad size and price of the invoice and produces the body of the automated email
        message = "Hello " + review.getFirstName(drpContactInfo.SelectedValue.ToString()) + " " + review.getLastName(drpContactInfo.SelectedValue.ToString()) + " of " + review.getBusinessName(drpContactInfo.SelectedValue.ToString()) + ". This is an automated invoice message from the Rotary Club of Truro regarding your ad request. Your " + review.getAdSize(drpContactInfo.SelectedValue.ToString()) + " ad will cost $" + adCost + ". Please make your payment through the provided payment system. If you have any questions please contact the Rotary Club of Truro";

        //MailMessage o = new MailMessage("From", "To","Subject", "Body");
        MailMessage o = new MailMessage("trurorotaryclub@hotmail.com", email,"Rotary Club of Truro Yearbook Ad Invoice", message);
        //NetworkCredential netCred= new NetworkCredential("Sender Email","Sender Password");
        NetworkCredential netCred= new NetworkCredential("trurorotaryclub@hotmail.com","password");
        SmtpClient smtpobj= new SmtpClient("smtp.live.com", 587);
        smtpobj.EnableSsl = true;
        smtpobj.Credentials = netCred;
        smtpobj.Send(o);
    }

    // Method to generate automated messages sent via email
    protected void sendAutomatedMessage(Object src, EventArgs args) {
        string message;
        // The email that the automated invoice is being sent to (based on the selection in the drop down)
        string email = review.getEmail(drpContactInfo.SelectedValue.ToString());
        // Sets the body of the message to whatver text is in the text box
        message = txtMessage.Text.ToString();

        //MailMessage o = new MailMessage("From", "To","Subject", "Body");
        MailMessage o = new MailMessage("trurorotaryclub@hotmail.com", email,"Automated Message from the Rotary Club of Truro", message);
        //NetworkCredential netCred= new NetworkCredential("Sender Email","Sender Password");
        NetworkCredential netCred= new NetworkCredential("trurorotaryclub@hotmail.com","password");
        SmtpClient smtpobj= new SmtpClient("smtp.live.com", 587);
        smtpobj.EnableSsl = true;
        smtpobj.Credentials = netCred;
        smtpobj.Send(o);
    }

    protected void displayAdData() {
        // user and password have not yet been set up in the database, needs to be fixed to get this working, except for on my local phpmyadmin installation
        dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
        sqlString = "SELECT * FROM adawaitingapproval WHERE id > 0";
        dbAdapter = new MySqlDataAdapter(sqlString, dbConnection);
        DataTable table = new DataTable();
        dbAdapter.Fill(table);
        // Sets up the pager
        PagedDataSource pds = new PagedDataSource();
        pds.DataSource = table.DefaultView;
        pds.AllowPaging = true;
        // Sets the paging size (set to 1 so as to be able to scroll through one ad request at a time)
        pds.PageSize = 1;

        int currentPage;
        // Handles initial loading of the paged data
        if (Request.QueryString["page"] != null) {
            currentPage = Int32.Parse(Request.QueryString["page"]);
        } else {
            currentPage = 1;
        }
        // Handles display of the current page
        pds.CurrentPageIndex = currentPage - 1;
        lblPageInfo.Text = "Ad Request " + currentPage + " of " + pds.PageCount;
        // Handles navigation through the pages
        if (!pds.IsFirstPage) {
            lnkPrev.NavigateUrl = Request.CurrentExecutionFilePath + "?page=" + (currentPage - 1);
        }

        if (!pds.IsLastPage) {
            lnkNext.NavigateUrl = Request.CurrentExecutionFilePath + "?page=" + (currentPage + 1);
        }
        // Binding the data to the repeaters
        repDisplayImage.DataSource = pds;
        repDisplayCaption.DataSource = pds;
        repDisplayClientInfo.DataSource = pds;
        repDisplayImage.DataBind();
        repDisplayCaption.DataBind();
        repDisplayClientInfo.DataBind();
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="headBox" Runat="Server">
    <title>Rotary Yearbook Administration - Ad Review</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
     <!-- Latest compiled and minified CSS -->
     <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
     <!-- jQuery library -->
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
     <!-- Latest compiled JavaScript -->
     <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script type="text/javascript">
         $(document).ready(function () {
             // Toggles sliding the message panel open and closed
             $("#btnReject").click(function () {
                 $("#messagePanel").slideToggle("slow");
             }); 
         });
     </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyBox" Runat="Server">
    <form runat="server">
    <div class="container col-sm-12 well">
        <div class="container col-sm-12 well"> 
            <asp:Image ImageUrl="/images/YearbookLogo.png" AlternateText="imagelogo" height="100" width="500" runat="server" />
        </div>
        <div class="container col-sm-4 well" style="text-align:center"> 
            <asp:Label ID="lblUsername" Text="username" runat="server" />
        </div>
        <div class="container col-sm-4 well" style="text-align:center"> 
            <asp:Label ID="lblPageTitle" Text="Rotary Club Yearbook Invoice Page" runat="server" />
        </div>
        <div class="container col-sm-4 well" style="text-align:center"> 
            <asp:LinkButton ID="lblLogout" Text="logout" runat="server" />
        </div>
        <div class="container col-sm-6 well" style="text-align:center"> 
            <asp:Label ID="lblAdTitle" Text="Submitted Ad Information" runat="server" />
        </div>
        <div class="container col-sm-6 well" style="text-align:center"> 
            <asp:Label ID="lblClientTitle" Text="Sponsor Business Information" runat="server" />
        </div>
        <div class="container col-sm-6 well"> 
            <div class="container col-sm-12 well" style="text-align:center">
                <asp:repeater id="repDisplayImage" runat="server">
                    <ItemTemplate>
                        <!-- NOTE: the localhost and id of localhost must be set to the instance of the server while running to load the image correctly. this will also require a tweak on final deployment to the server -->
                        <img src="http://localhost:63275/adImages/<%# Eval("image")%>" alt="image" height="300" width="300" /><br /> 
                    </ItemTemplate>
                </asp:repeater>
            </div>
            <div class="container col-sm-12 well">
                <asp:repeater id="repDisplayCaption" runat="server">
                    <ItemTemplate>
                        <asp:Label ID="lblAdIDTitle" Text="Ad ID Number: " runat="server" />
                        <asp:Label ID="lblID" Text='<%# Eval("id") %>' runat="server" /><br />
                        <asp:Label ID="lblAdSize" Text="Requested Ad Size: " runat="server" /><%# Eval("ad_size") %><br />
                        <asp:Label ID="lblCaption" Text="Caption: " runat="server" /><%# Eval("caption") %><br />
                    </ItemTemplate>
                </asp:repeater>
            </div>
            <ul class="pager" style="text-align:center">
                <li><asp:HyperLink ID="lnkPrev" Font-Bold="true" Font-Underline="false" runat="server"><<</asp:HyperLink></li>
                <li><asp:Label ID="lblPageInfo" runat="server" /></li>
                <li><asp:HyperLink ID="lnkNext" Font-Bold="true" Font-Underline="false" runat="server">>></asp:HyperLink></li>
            </ul>
            <br /><br />
        </div>
        <div class="container col-sm-6 well"> 
            <!-- <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /> -->
            <div class="container col-sm-12 well">
                <!--<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /> -->
                <asp:repeater id="repDisplayClientInfo" runat="server">
                    <ItemTemplate>
                        <asp:Label ID="lblClientNameTitle" Text="Sponsor Name: " runat="server" />
                        <asp:Label ID="lblClientFirtName" Text='<%# Eval("first_name") %>' runat="server" />
                        <asp:Label ID="lblClientLastName" Text='<%# Eval("last_name") %>' runat="server" /><br />
                        <asp:Label ID="lblBusinessName" Text="Business Name: " runat="server" /><%# Eval("business_name") %><br />
                        <asp:Label ID="lblBusinessAddress" Text="Business Address: " runat="server" /><%# Eval("business_address") %><br />
                        <asp:Label ID="lblPhone" Text="Phone Number: " runat="server" /><%# Eval("phone") %><br />
                        <asp:Label ID="lblEmailTitle" Text="E-Mail Address: " runat="server" />
                        <asp:Label ID="lblEmail" Text='<%# Eval("business_email") %>' runat="server" /><br />
                    </ItemTemplate>
                </asp:repeater>
                <!--<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /> -->
                <br /><br /><br /><br /><br />
            </div>
            <div class="container col-sm-8 well" style="text-align:right;">
                <!-- <asp:Button ID="btnApprove" Text="Approve" CssClass="btn btn-danger" runat="server" />
                <asp:Button ID="btnReject" Text="Reject" CssClass="btn btn-danger" runat="server" /> -->
                <asp:DropDownList ID="drpContactInfo" CssClass="form form-control" runat="server" />
            </div>
            <div class="container col-sm-4 well" style="text-align:right;">
                <asp:Button ID="btnSendInvoice" Text="Send Invoice" OnClick="sendInvoice" CssClass="btn btn-danger" runat="server" />
            </div>
            <div id="messagePanel" class="container col-sm-12 well" style="text-align:right;">
                <asp:TextBox ID="txtMessage" Text="Write your automatically generated message here and click send. Use the above dropdown to select the email address to send invoices and automated messages" CssClass="form form-control" Height="100" TextMode="MultiLine" runat="server" /><br />
                <asp:Button ID="btnSendMessage" Text="Send Message" OnClick="sendAutomatedMessage" CssClass="btn btn-danger" runat="server" />
            </div>
            <div id="testdiv"></div>
        </div>
    </div>
    </form>
</asp:Content>

