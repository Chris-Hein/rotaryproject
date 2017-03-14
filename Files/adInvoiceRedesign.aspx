<%@ Page Title="Administrator" Language="C#" MasterPageFile="MasterPage.master" Debug="true" ClientTarget="uplevel" EnableEventValidation="false" validateRequest="false" EnableViewState="true" %>
<%@ Import Namespace="MySql.Data.MySqlClient" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Windows.Forms" %>
<%@ Import Namespace="System.Text" %>
<%@ Import Namespace="System.Web" %>
<%@ Import Namespace="System.Web.UI" %>
<%@ Import Namespace="System.Net.Mail" %>
<%@ Import Namespace="System.Net" %>

<script runat="server">
    MySqlConnection dbConnection;
    MySqlCommand dbCommand;
    MySqlDataReader dbReader;
    string sqlString;
    MySqlDataAdapter dbAdapter;
    DataSet dbDataSet;
    // Used to handle updating fields
    UpdateAdmin update;
    Review review;

    string selectedSponsor;

    string invoiceAddresses;
    string messageAddresses;

    protected void populatUsernameDropdown() {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            // Doesn't populate the dropdown (and thus allow the admin to send invoices) unless the ad has actually been approved first.
            sqlString = "SELECT username FROM login WHERE id > 0";
            dbAdapter = new MySqlDataAdapter(sqlString, dbConnection);
            dbDataSet = new DataSet();
            dbAdapter.Fill(dbDataSet, "login");
            // Executes the SQL
            // Binds the photographer data to the dropdown so it can be displayed
            drpUsername.DataSource = dbDataSet.Tables["login"];
            drpUsername.DataValueField = "username";
            drpUsername.DataTextField = "username";
            drpUsername.DataBind();
            Cache["dbDataSet"] = dbDataSet;
        } finally {
            dbConnection.Close();
        }
    }

    protected void page_load() {

        // Constructing update object
        update = new UpdateAdmin();
        review = new Review();

        if (!Page.IsPostBack) {
            // ListItem photographer;
            // ListItem business;
            // This is just dummy data for display purposes, needs to be replaced with data from the database
            // In the middle of writing a class to handle this, not finished with it yet
            //photographer = new ListItem("Assign Photographer Here");
            //drpAssignPhotographer.Items.Add(photographer);

            //business = new ListItem("Assign Sponsor Here");
            //drpAssignSponsor.Items.Add(business);
            populatUsernameDropdown();

            btnSearch.Enabled = true;
            // Executes the paging code
            //loadSponsorData();
            // Handles loading of the businesses basic data
            mainDisplayDataLoad();

        }



        // Constructing update object
        //update = new UpdateAdmin();
    }



    // Handles admin selection of a user to view in greater detail
    protected void businessSelected (Object src, CommandEventArgs args) {
        // Uses the text of the command argument (which is the name of the business) to determine what data to load
        Session["selectedSponsor"] = args.CommandArgument;
        selectedSponsor = Session["selectedSponsor"].ToString();
        loadSponsorData();
    }

    // Calls the password reset method
    // Requires the value from the dropdown (the username) and the new password
    protected void resetPassword(Object src, EventArgs args) {
        if (txtPassword.Text == "") {
            // Do nothing, disallows blank input as passwords
        } else {
            // Otherwise resets the password
            review.resetUserPassword(drpUsername.SelectedValue.ToString(), Server.HtmlEncode(txtPassword.Text));
        }
    }

    // Handles display of in-depth data when user clicks the business name in the initial repeater
    // Uses custom paging bind the displayed data to the display repeater
    protected void loadSponsorData () {
        /*
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            dbCommand = new MySqlCommand("", dbConnection);
            sqlString = "SELECT * FROM admin WHERE business_name = '" + selectedSponsor + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Executes the SQL
            dbCommand.CommandText = sqlString;
            dbReader = dbCommand.ExecuteReader();
            // Binds the data to the repeater so it can be displayed
            repSelectedSponsor.DataSource = dbReader;
            repSelectedSponsor.DataBind();
        } finally {
            dbConnection.Close();
        } */
    }

    // Displays the data based on a selected business
    protected void mainDisplayDataLoad() {
        // user and password have not yet been set up in the database, needs to be fixed to get this working, except for on my local phpmyadmin installation
        dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
        sqlString = "SELECT * FROM addata WHERE id > 0";
        //sqlString = "SELECT * FROM mainRecords WHERE id > 0";
        dbAdapter = new MySqlDataAdapter(sqlString, dbConnection);
        DataTable table = new DataTable();
        dbAdapter.Fill(table);
        // Sets up the pager
        PagedDataSource pds = new PagedDataSource();
        pds.DataSource = table.DefaultView;
        pds.AllowPaging = true;
        // Sets the paging size (set to 5 for testing purposes)
        pds.PageSize = 5;

        int currentPage;
        // Handles initial loading of the paged data
        if (Request.QueryString["page"] != null) {
            currentPage = Int32.Parse(Request.QueryString["page"]);
        } else {
            currentPage = 1;
        }
        // Handles display of the current page
        pds.CurrentPageIndex = currentPage - 1;
        lblPageInfo.Text = "Page " + currentPage + " of " + pds.PageCount;
        // Handles navigation through the pages
        if (!pds.IsFirstPage) {
            lnkPrev.NavigateUrl = Request.CurrentExecutionFilePath + "?page=" + (currentPage - 1);
        }

        if (!pds.IsLastPage) {
            lnkNext.NavigateUrl = Request.CurrentExecutionFilePath + "?page=" + (currentPage + 1);
        }
        // Binding the data to the repeater
        repMainDisplay.DataSource = pds;
        repMainDisplay.DataBind();
    }

    // Displays the data based on a selected business
    protected void searchDisplayDataLoad(Object src, EventArgs args) {
        // user and password have not yet been set up in the database, needs to be fixed to get this working, except for on my local phpmyadmin installation
        dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
        sqlString = "SELECT * FROM addata WHERE sponsorName = '" + Server.HtmlEncode(txtSearch.Text) + "'";
        //sqlString = "SELECT * FROM mainRecords WHERE id > 0";
        dbAdapter = new MySqlDataAdapter(sqlString, dbConnection);
        DataTable table = new DataTable();
        dbAdapter.Fill(table);
        // Sets up the pager
        PagedDataSource pds = new PagedDataSource();
        pds.DataSource = table.DefaultView;
        pds.AllowPaging = true;
        // Sets the paging size (set to 5 for testing purposes)
        pds.PageSize = 5;

        int currentPage;
        // Handles initial loading of the paged data
        if (Request.QueryString["page"] != null) {
            currentPage = Int32.Parse(Request.QueryString["page"]);
        } else {
            currentPage = 1;
        }
        // Handles display of the current page
        pds.CurrentPageIndex = currentPage - 1;
        lblPageInfo.Text = "Page " + currentPage + " of " + pds.PageCount;
        // Handles navigation through the pages
        if (!pds.IsFirstPage) {
            lnkPrev.NavigateUrl = Request.CurrentExecutionFilePath + "?page=" + (currentPage - 1);
        }

        if (!pds.IsLastPage) {
            lnkNext.NavigateUrl = Request.CurrentExecutionFilePath + "?page=" + (currentPage + 1);
        }
        // Binding the data to the repeater
        repMainDisplay.DataSource = pds;
        repMainDisplay.DataBind();
    }

    // Loads a modal confirmation popup to confirm that the admin wants to do an update
    // Modal updates the database on a yes and reloads the pre-edited data from the database on a no (to prevent accidental updates)
    //TODO: Get this working, something weird going on with the imports not allowing the dialogresult and messagebox objects to be recognized properly
    //protected void confirmUpdate(Object src, EventArgs args){
    // DialogResult result = MessageBox.Show("Confirm Update", "Are you sure you want to make these changes?", MessageBoxButtons.YesNo, MessageBoxIcon.Question, MessageBoxDefaultButton.Button2);

    //if (result == DialogResult.Yes) {
    // Yes
    // Call the update function
    //updateSponsor();
    //} else if (result == DialogResult.No) {
    // No
    // Reloads the previous data to avoid accidental changes being made
    //loadSponsorData();
    //}


    //}


    // Ensures the user is logged in to a valid account to be able to use the admin page
    // protected void checkLogin () {
    // Checks to ensure the user is actually logged into a valid account before permitting access to the main page
    //    if (Session["weblogin"] == null) {
    //      Response.Redirect("login.aspx");
    // } else if (((WebLogin)Session["weblogin"]).access != true) {
    //    Response.Redirect("login.aspx");
    // }

    // Sets the logged in username to the username stored as part of the login process
    // if (Session["username"] != null) {
    //    lblUsername.Text = Session["username"].ToString();
    // } else {
    // Just error checking, the user should never actually be able to hit this, if they do theres been a hack of some kind
    //     lblUsername.Text = "not logged in";
    // }
    // }



    // Handles search functionality (currently searches are based on business name)
    protected void search(Object src, EventArgs args) {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            dbCommand = new MySqlCommand("", dbConnection);
            sqlString = "SELECT * FROM addata WHERE sponsorName = '" + Convert.ToString(Server.HtmlEncode(txtSearch.Text)) + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Executes the SQL
            dbCommand.CommandText = sqlString;
            dbReader = dbCommand.ExecuteReader();
            // Binds the data to the repeater so it can be displayed
            repSearch.DataSource = dbReader;
            repSearch.DataBind();
        } finally {
            dbConnection.Close();
        }

        // Handles showing and hiding the search panel
        //   if (searchPanel.Style["display"] == "none") {
        //     searchPanel.Style.Add("display", "block");
        // } else {
        //    searchPanel.Style.Add("display", "none");

        // }
    }

    // Toggles enabling of search button
    protected void searchControl(Object src, EventArgs args) {
        if (txtSearch.Text != "") {
            btnSearch.Enabled = true;
        } else {
            btnSearch.Enabled = false;
        }
    }

    protected void onApproveChecked(Object src, EventArgs args) {
        foreach (RepeaterItem item in repMainDisplay.Items) {
            // Gets the state of the checkbox
            CheckBox checkbox = (CheckBox)item.FindControl("chkApprove");
            //
            if (checkbox.Checked) {
                // Automatically updates the approved status of an ad when checked off
                review.updateApprovedStatus(Convert.ToInt32(checkbox.Text), "yes");
                // Sends an automated message to notify of approval (deactivated for dev purposes)
                //adApproved();
            }
        }
    }

    protected void onSendInvoiceChecked(Object src, EventArgs args) {
        foreach (RepeaterItem item1 in repMainDisplay.Items) {
            // Gets the state of the checkbox
            CheckBox checkbox1 = (CheckBox)item1.FindControl("chkSendInvoice");
            //
            if (checkbox1.Checked) {
                // Stores the email of each checked user in a string for use in outputting the invoice
                invoiceAddresses += review.getMessageEmail(Convert.ToInt32(checkbox1.Text)) + ";";
            }
        }
    }

    protected void onSendMessageChecked(Object src, EventArgs args) {
        foreach (RepeaterItem item2 in repMainDisplay.Items) {
            // Gets the state of the checkbox
            CheckBox checkbox2 = (CheckBox)item2.FindControl("chkSendMessage");
            //
            if (checkbox2.Checked) {
                // Stores the email of each checked user in a string for use in outputting the message email
                messageAddresses += review.getMessageEmail(Convert.ToInt32(checkbox2.Text)) + ";";
            }
        }
    }

    // Called when an ad is approved
    protected void adApproved() {
        string message;
        // Sets the email address to the string list of email addresses generated by clicking the checkboxes
        string email = invoiceAddresses;


        // Then generate the approval email
        message = "this is the body of the automated approval message. TODO: edit this to whatver message is requested by matt";
        // Then send the email
        //MailMessage o = new MailMessage("From", "To","Subject", "Body");
        MailMessage o = new MailMessage("trurorotaryclub@hotmail.com", email,"Rotary Club of Truro Yearbook Ad Invoice", message);
        //NetworkCredential netCred= new NetworkCredential("Sender Email","Sender Password");
        NetworkCredential netCred= new NetworkCredential("trurorotaryclub@hotmail.com","password");
        SmtpClient smtpobj= new SmtpClient("smtp.live.com", 587);
        smtpobj.EnableSsl = true;
        smtpobj.Credentials = netCred;
        smtpobj.Send(o);
        // Then reload the page to update
        page_load();
    }

    // Method to generate automated messages sent via email
    protected void sendAutomatedMessage(Object src, EventArgs args) {
        string message;
        // Sets the email address to the string list of email addresses generated by clicking the checkboxes
        string email = messageAddresses;
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

       // Method that generates the automated invoice
    protected void sendInvoice(Object src, EventArgs args) {
        int adCost = 0;
        string message;
        // Loads emails from the checked email string
        string email = invoiceAddresses;


        // This section commented out until we decide how we are going to handle formatting the actual invoice
        // Sets the ad price in the invoice message based on the size of the ad selected
       // if (review.getAdSize(drpContactInfo.SelectedValue.ToString()) == "1/6 Page") {
       //     adCost = 415;
       // } else if (review.getAdSize(drpContactInfo.SelectedValue.ToString()) == "1/3 Page") {
       //     adCost = 690;
       // } else if (review.getAdSize(drpContactInfo.SelectedValue.ToString()) == "2/3 Page") {
       //     adCost = 1150;
       // } else if (review.getAdSize(drpContactInfo.SelectedValue.ToString()) == "Full Page") {
       //     adCost = 1725;
       // }

        message = "invoice message text";

        //MailMessage o = new MailMessage("From", "To","Subject", "Body");
        MailMessage o = new MailMessage("trurorotaryclub@hotmail.com", email,"Rotary Club of Truro Yearbook Ad Invoice", message);
        //NetworkCredential netCred= new NetworkCredential("Sender Email","Sender Password");
        NetworkCredential netCred= new NetworkCredential("trurorotaryclub@hotmail.com","password");
        SmtpClient smtpobj= new SmtpClient("smtp.live.com", 587);
        smtpobj.EnableSsl = true;
        smtpobj.Credentials = netCred;
        smtpobj.Send(o);
    }

    protected void businessSelected(Object src, EventArgs args) {
        // does nothing atm
    }

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="headBox" Runat="Server">
    <title>Rotary Club Yearbook - Ad Invoice Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
     <!-- jQuery library -->
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
     <!-- Latest compiled JavaScript -->
     <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script type="text/javascript">
         $(document).ready(function () {
             // Toggles sliding the input panel open and closed
             $("#btnSearch").click(function () {
                 $("#SearchPanel").slideToggle("fast");
             }); 
         });
     </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="bodyBox" Runat="Server">
    <form runat="server">

        <div class="container">
            <div class="row well">
                <div class="container col-sm-4" style="text-align:center;">
                    <asp:Label ID="lblUsername" Text="username" runat="server" />  
                </div>
                <div class="container col-sm-4" style="text-align:center;">
                    <asp:Label ID="lblPageTitle" Text="Rotary Club Yearbook Ad Invoice Page" runat="server" />  
                </div>
                <div class="container col-sm-4" style="text-align:center;">
                    <asp:LinkButton ID="lnkLogout" Text="logout" runat="server" />
                </div>
            </div>

            <div class="row well">
                <div class="col-sm-4" style="text-align:center;">
                    <asp:Label ID="lblExplan1" Text="Input business name and click search" runat="server" /><br /> 
                </div>
                <div class="col-sm-3"></div> <!-- for spacing -->
                <div class="col-sm-4" style="text-align:center;">
                    <asp:TextBox ID="txtSearch" CssClass="form form-control" OnTextChanged="searchControl" runat="server" /> 
                </div>
                <div class="col-sm-1" style="text-align:center;">
                    <asp:Button ID="btnSearch" Text="Search" OnClick="searchDisplayDataLoad" CssClass="btn btn-danger" runat="server" />
                </div>
            </div>

            <div id="searchPanel" class="row well hidden"> <!-- Search bar output -->
                <div class="col-sm-12" style="text-align:center;"> 
                    <asp:Repeater id="repSearch" runat="server">
                        <HeaderTemplate>
                            <table class="table table-hover table-condensed">
                                <thead>
                                    <tr>
                                        <th scope="col">ID</th>
                                        <th scope="col">Image</th>
                                        <th scope="col">Sponsor Name</th>
                                        <th scope="col">Caption Front</th>
                                        <th scope="col">Caption Middle</th>
                                        <th scope="col">Caption Back</th>
                                        <th scope="col">Business Address</th>
                                        <th scope="col">Phone</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Send Invoice</th>
                                        <th scope="col">Send Message</th>
                                        <th scope="col">Approve</th>
                                        <th scope="col">Approved</th>
                                        <th scope="col">Notes</th>
		                            </tr>
                                </thead>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("id") %></td>
                                <td><img src="http://localhost:63275/adImages/<%# Eval("image")%>" alt="image" height="150" width="150" /></td>
                                <td><asp:LinkButton ID="lnkLoadBusData" Text='<%# Eval("sponsorName") %>' CommandArgument='<%#Eval("sponsorName")%>' OnCommand="businessSelected" Font-Underline="false" Font-Size="small" runat="server" /></td>
                                <td><%# Eval("captionFront") %></td>
                                <td><%# Eval("captionMiddle") %></td>
                                <td><%# Eval("captionBack") %></td>
                                <td><%# Eval("captionAddress") %></td>
                                <td><%# Eval("captionPhone") %></td>
                                <td><%# Eval("captionEmail") %></td>
                                <td><asp:CheckBox ID="chkSendInvoice" OnCheckedChanged="onSendInvoiceChecked" AutoPostBack="true" Text='<%# Eval("id") %>' runat="server" /></td>
                                <td><asp:CheckBox ID="chkSendMessage" OnCheckedChanged="onSendMessageChecked" AutoPostBack="true" Text='<%# Eval("id") %>' runat="server" /></td>
                                <td><asp:CheckBox ID="chkApprove" OnCheckedChanged="onApproveChecked" AutoPostBack="true" Text='<%# Eval("id") %>' runat="server" /></td>
                                <td><%# Eval("approved") %></td>
                                <td><%# Eval("adNotes") %></td>
                            <br />
		                    </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </tbody>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
            </div> <!-- Search bar output -->

            <div class="row well"> <!-- main data display -->
                <div class="col-sm-12" style="text-align:center;"> 
                    <asp:Repeater id="repMainDisplay" runat="server">
                        <HeaderTemplate>
                            <table class="table table-hover table-condensed">
                                <thead>
                                    <tr>
                                        <th scope="col">ID</th>
                                        <th scope="col">Image</th>
                                        <th scope="col">Sponsor Name</th>
                                        <th scope="col">Caption Front</th>
                                        <th scope="col">Caption Middle</th>
                                        <th scope="col">Caption Back</th>
                                        <th scope="col">Business Address</th>
                                        <th scope="col">Phone</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Send Invoice</th>
                                        <th scope="col">Send Message</th>
                                        <th scope="col">Approve</th>
                                        <th scope="col">Approved</th>
                                        <th scope="col">Notes</th>
		                            </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("id") %></td>
                                <td><img src="http://localhost:63275/adImages/<%# Eval("image")%>" alt="image" height="75" width="75" /></td>
                                <td><asp:LinkButton ID="lnkLoadBusData" Text='<%# Eval("sponsorName") %>' CommandArgument='<%#Eval("sponsorName")%>' OnCommand="businessSelected" Font-Underline="false" Font-Size="small" runat="server" /></td>
                                <td><%# Eval("captionFront") %></td>
                                <td><%# Eval("captionMiddle") %></td>
                                <td><%# Eval("captionBack") %></td>
                                <td><%# Eval("captionAddress") %></td>
                                <td><%# Eval("captionPhone") %></td>
                                <td><%# Eval("captionEmail") %></td>
                                <td><asp:CheckBox ID="chkSendInvoice" OnCheckedChanged="onSendInvoiceChecked" AutoPostBack="true" Text='<%# Eval("id") %>' runat="server" /></td>
                                <td><asp:CheckBox ID="chkSendMessage" OnCheckedChanged="onSendMessageChecked" AutoPostBack="true" Text='<%# Eval("id") %>' runat="server" /></td>
                                <td><asp:CheckBox ID="chkApprove" OnCheckedChanged="onApproveChecked" AutoPostBack="true" Text='<%# Eval("id") %>' runat="server" /></td>
                                <td><%# Eval("approved") %></td>
                                <td><%# Eval("adNotes") %></td>
                                <br />
		                    </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </tbody>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                    <ul class="pager" style="text-align:center">
                    <li><asp:HyperLink ID="lnkPrev" Font-Bold="true" Font-Underline="false" runat="server"><<</asp:HyperLink></li>
                    <li><asp:Label ID="lblPageInfo" runat="server" /></li>
                    <li><asp:HyperLink ID="lnkNext" Font-Bold="true" Font-Underline="false" runat="server">>></asp:HyperLink></li>
                    </ul><br />

                </div>

            </div> <!-- main data display -->

        </div> <!-- /container -->

        <div class="row well col-sm-12" style="text-align:center;"> <!-- Secondary Data Display -->
            <div class="row well col-sm-6" style="text-align:center;"> <!-- Secondary Data Display -->
                <asp:Button ID="btnSendInvoice" CssClass="btn btn-danger" OnClick="sendInvoice" Text="Send Invoice" Width="122" runat="server" /><br />
                <asp:Button ID="btnSendMessage" CssClass="btn btn-danger" OnClick="sendAutomatedMessage" Text="Send Message" runat="server" /><br />
                <br />
            </div>
            <div class="row well col-sm-6"> <!-- Secondary Data Display -->
                <asp:TextBox ID="txtMessage" Text="Write your automatically generated message here, check off which users you want to send an automated message to and click send." CssClass="form form-control" Height="100" TextMode="MultiLine" runat="server" />              
            </div>   
        </div>

        <div class="row well col-sm-12" style="text-align:center;">
            <div id="approva" class="container col-sm-6 well" style="text-align:right;">
                <asp:DropDownList ID="drpUsername" CssClass="form form-control" runat="server" />
            </div>
            <div id="approva1" class="container col-sm-6 well" style="text-align:right;">
                <asp:TextBox ID="txtPassword" CssClass="form form-control" runat="server" />
            </div>
            <asp:Button ID="btnResetPassword" Text="Reset Password" OnClick="resetPassword" CssClass="btn btn-danger" runat="server" />
        </div>

    </form>

</asp:Content>