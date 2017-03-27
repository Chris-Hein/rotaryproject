<%@ Page Title="Rotary Club Yearbook 15th Edition - Admin Page" Language="C#" MasterPageFile="MasterPage.master" Debug="true" ClientTarget="uplevel" EnableEventValidation="false" validateRequest="false" EnableViewState="true" %>
<%@ Import Namespace="MySql.Data.MySqlClient" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Windows.Forms" %>
<%@ Import Namespace="System.Text" %>
<%@ Import Namespace="System.Web" %>
<%@ Import Namespace="System.Web.UI" %>

<script runat="server">
    MySqlConnection dbConnection;
    MySqlCommand dbCommand;
    MySqlDataReader dbReader;
    string sqlString;
    MySqlDataAdapter dbAdapter;
    DataSet dbDataSet;
    // Used to handle updating fields
    UpdateAdmin update;

    string selectedSponsor;

    protected void page_load() {

        // Constructing update object
        update = new UpdateAdmin();

        if (!Page.IsPostBack) {
            // ListItem photographer;
            // ListItem business;
            // This is just dummy data for display purposes, needs to be replaced with data from the database
            // In the middle of writing a class to handle this, not finished with it yet
            //photographer = new ListItem("Assign Photographer Here");
            //drpAssignPhotographer.Items.Add(photographer);

            //business = new ListItem("Assign Sponsor Here");
            //drpAssignSponsor.Items.Add(business);

            // Populates the two dropdowns
            populateSponsors();
            populatePhotographers();

            btnSearch.Enabled = true;
            // Executes the paging code
            //loadSponsorData();
            // Handles loading of the businesses basic data
            mainDisplayDataLoad();
            loadAdPrices();
        }

        // Constructing update object
        //update = new UpdateAdmin();
    }

    // Handles population of the photographer dropdown
    protected void populatePhotographers() {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "SELECT photographer FROM mainRecords WHERE id > 0";
            dbAdapter = new MySqlDataAdapter(sqlString, dbConnection);
            dbDataSet = new DataSet();
            dbAdapter.Fill(dbDataSet, "admin");
            // Executes the SQL
            // Binds the photographer data to the dropdown so it can be displayed
            drpAssignPhotographer.DataSource = dbDataSet.Tables["admin"];
            drpAssignPhotographer.DataValueField = "assigned_photographer_name";
            drpAssignPhotographer.DataTextField = "assigned_photographer_name";
            //drpAssignPhotographer.DataBind();
            Cache["dbDataSet"] = dbDataSet;
        } finally {
            dbConnection.Close();
        }
    }

    // Handles population of the business dropdown
    protected void populateSponsors() {
        try {
            dbConnection = new MySqlConnection("Database='rotaryyearbook';Data Source='localhost';User Id='useraccount';Password='userpassword'");
            dbConnection.Open();
            sqlString = "SELECT sponsorName FROM mainRecords WHERE id > 0";
            dbAdapter = new MySqlDataAdapter(sqlString, dbConnection);
            dbDataSet = new DataSet();
            dbAdapter.Fill(dbDataSet, "admin");
            // Executes the SQL
            // Binds the business data to the dropdown so it can be displayed
            drpAssignSponsor.DataSource = dbDataSet.Tables["admin"];
            drpAssignSponsor.DataValueField = "SponsorName";
            drpAssignSponsor.DataTextField = "SponsorName";
            drpAssignSponsor.DataBind();
            Cache["dbDataSet"] = dbDataSet;
        } finally {
            dbConnection.Close();
        }
    }

    // Handles assigning a photographer to a business
    protected void assignPhotographer(Object src, EventArgs args) {
        update.updateAssignedSponsorName(drpAssignPhotographer.SelectedItem.Value.ToString(), drpAssignSponsor.SelectedItem.Value.ToString());
        update.updateAssignedPhotographerName(drpAssignSponsor.SelectedItem.Value.ToString(), drpAssignPhotographer.SelectedItem.Value.ToString());
    }

    // Handles admin selection of a user to view in greater detail
    protected void businessSelected (Object src, CommandEventArgs args) {
        // Uses the text of the command argument (which is the name of the business) to determine what data to load
        Session["selectedSponsor"] = args.CommandArgument;
        selectedSponsor = Session["selectedSponsor"].ToString();
        loadSponsorData();
    }

    // Handles display of in-depth data when user clicks the business name in the initial repeater
    // Uses custom paging bind the displayed data to the display repeater
    protected void loadSponsorData () {

        txtSponsorName.Text = update.setSponsorName(selectedSponsor.ToString());
        txtSponsorEmail.Text = update.setSponsorEmail(selectedSponsor.ToString());
        txtSponsorPhone.Text = update.setSponsorPhone(selectedSponsor.ToString());
        txtSponsorAddress.Text = update.setSponsorAddress(selectedSponsor.ToString());
        txtContactName.Text = update.setSponsorContact(selectedSponsor.ToString());
        txtAdSize.Text = update.setAdSize(selectedSponsor.ToString());
        txtPaid.Text = update.setPaymentStatus(selectedSponsor.ToString());
        txtAdStatus.Text = update.setAdStatus(selectedSponsor.ToString());
        txtPaymentMethod.Text = update.setPaymentMethod(selectedSponsor.ToString());
        txtContacted.Text = update.setContactStatus(selectedSponsor.ToString());


        // Populates the expanded business data fields when a business is selected
        // Originally used a repeater, but that had to be rewritten because it made
        // the text fields out of scope (as they were in a repeater) so prevented
        // updating the db via the field inputs        
        // txtSponsorName.Text = update.getSponsorName(selectedSponsor);
        // txtSponsorEmail.Text = update.getSponsorEmail(selectedSponsor);
        // txtSponsorPhone.Text = update.getSponsorPhone(selectedSponsor);
        // txtSponsorAddress.Text = update.getSponsorAddress(selectedSponsor);
        // txtContactName.Text = update.getFirstName(selectedSponsor);
        // txtAdSize.Text = update.getAdSize(selectedSponsor);
        // txtPaid.Text = update.getHasPaid(selectedSponsor);
        // txtAdStatus.Text = update.getAdApproved(selectedSponsor);
        // txtPaymentMethod.Text = update.getPayType(selectedSponsor);
        // txtContacted.Text = update.getContacted(selectedSponsor);
    }

    // Displays the data based on a selected business
    protected void mainDisplayDataLoad() {
        // user and password have not yet been set up in the database, needs to be fixed to get this working, except for on my local phpmyadmin installation
        dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
        sqlString = "SELECT * FROM mainrecords WHERE id > 0";
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

    // Method to handle testing for a valid email address. Basically its checking for the @ symbol and a proper .com extension
    // Note that it tests the validity of the structure of the email address as written, not whether the email itself is a real existing address
    // That would be getting into network socket stuff and backend server stuff which is way beyond what was necessary and my knowledge to do at present
    public static bool emailIsValid(string emailAddress) {
        // If the string is not null and empty then check for email follow the format
        return string.IsNullOrEmpty(emailAddress)?false : new Regex(@"^(?!\.)(""([^""\r\\]|\\[""\r\\])*""|([-a-z0-9!#$%&'*+/=?^_`{|}~]|(?<!\.)\.)*)(?<!\.)@[a-z0-9][\w\.-]*[a-z0-9]\.[a-z][a-z\.]*[a-z]$", RegexOptions.IgnoreCase).IsMatch(emailAddress);
    }

    // Method to do the actual testing of the input email address
    // Simple true or false, runs the email through the emailIsValid method to test against the regex
    // Returns valid or invalid message based on whether it passes the regex
    protected void testEmail(Object src, EventArgs args) {
        bool test = emailIsValid(txtEmailTest.Text);

        if (test == true) {
            lblEmailTestFeedback.Text = "The input is a valid email address";
        } else {
            lblEmailTestFeedback.Text = "The input is not a valid email address";
        }
    }

    // Handles updating user details
    protected void updateSponsor(Object src, EventArgs args) {
        // Updates business name
        update.upSponsorName(Convert.ToString(selectedSponsor),Convert.ToString(Server.HtmlEncode(txtSponsorName.Text)));
        // Updates business email
        update.upSponsorEmail(Convert.ToString(selectedSponsor), Convert.ToString(Server.HtmlEncode(txtSponsorEmail.Text)));
        // Updates business phone
        update.upSponsorPhone(Convert.ToString(selectedSponsor), Convert.ToString(Server.HtmlEncode(txtSponsorPhone.Text)));
        // Updates business address
        update.upSponsorAddress(Convert.ToString(selectedSponsor), Convert.ToString(Server.HtmlEncode(txtSponsorAddress.Text)));
        // Updates contact name
        update.upSponsorContact(Convert.ToString(selectedSponsor), Convert.ToString(Server.HtmlEncode(txtContactName.Text)));
        // Updates ad size
        update.upAdSize(Convert.ToString(selectedSponsor), Convert.ToString(Server.HtmlEncode(txtAdSize.Text)));
        // Updates payment status
        update.upPaymentStatus(Convert.ToString(selectedSponsor), Convert.ToString(Server.HtmlEncode(txtPaid.Text)));
        // Updates approval status
        update.upAdStatus(Convert.ToString(selectedSponsor), Convert.ToString(Server.HtmlEncode(txtAdStatus.Text)));
        // Updates payment method
        update.upPaymentMethod(Convert.ToString(selectedSponsor), Convert.ToString(Server.HtmlEncode(txtPaymentMethod.Text)));
        // Updates whether user was contacted
        update.upContactStatus(Convert.ToString(selectedSponsor), Convert.ToString(Server.HtmlEncode(txtContacted.Text)));
    }

    protected void loadAdPrices() {
        // Displays the current prices for ads so they can be changed
        txtOneSixthPrice.Text = update.get16AdPrice(Convert.ToString(1));
        txtOneThirdPrice.Text = update.get13AdPrice(Convert.ToString(1));
        txtTwoThirdPrice.Text = update.get23AdPrice(Convert.ToString(1));
        txtFullPrice.Text = update.getFullAdPrice(Convert.ToString(1));
    }

    protected void updateAdPrices (Object src, EventArgs args) {
        update.up16adPrice(Convert.ToString(1), Convert.ToString(Server.HtmlEncode(txtOneSixthPrice.Text)));
        update.up13adPrice(Convert.ToString(1), Convert.ToString(Server.HtmlEncode(txtOneThirdPrice.Text)));
        update.up23adPrice(Convert.ToString(1), Convert.ToString(Server.HtmlEncode(txtTwoThirdPrice.Text)));
        update.upFulladPrice(Convert.ToString(1), Convert.ToString(Server.HtmlEncode(txtFullPrice.Text)));
        page_load();
    }

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
            sqlString = "SELECT * FROM mainrecords WHERE sponsorName = '" + Convert.ToString(Server.HtmlEncode(txtSearch.Text)) + "'";
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
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="headBox" Runat="Server">
    <title>Rotary Club Yearbook 15th Edition - Admin Page</title>
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
                    <asp:Label ID="lblPageTitle" Text="Rotary Club Yearbook 15th Edition - Admin Page" runat="server" />  
                </div>
                <div class="container col-sm-4" style="text-align:center;">
                    <asp:LinkButton ID="lnkLogout" Text="logout" runat="server" />
                </div>
            </div>

            <div class="row well">
                <div class="col-sm-4" style="text-align:center;">
                    <asp:Label ID="lblExplan1" Text="Input search parameters and click search" runat="server" /><br /> 
                </div>
                <div class="col-sm-3"></div> <!-- for spacing -->
                <div class="col-sm-4" style="text-align:center;">
                    <asp:TextBox ID="txtSearch" CssClass="form form-control" OnTextChanged="searchControl" runat="server" /> 
                </div>
                <div class="col-sm-1" style="text-align:center;">
                    <asp:Button ID="btnSearch" Text="Search" OnClick="search" CssClass="btn btn-danger" runat="server" />
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
                                        <th scope="col">Sponsor Name</th>
                                        <th scope="col">Sponsor Contact</th>
                                        <th scope="col">Phone</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Paid</th>
                                        <th scope="col">Photographer</th>
		                            </tr>
                                </thead>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("id") %></td>
                                <td><asp:LinkButton ID="lnkLoadBusData" Text='<%# Eval("sponsorName") %>' CommandArgument='<%#Eval("sponsorName")%>' OnCommand="businessSelected" Font-Underline="false" Font-Size="small" runat="server" /></td>
                                <td><%# Eval("sponsorContact") %></td>
                                <td><%# Eval("sponsorPhone") %></td>
                                <td><%# Eval("sponsorEmail") %></td>
                                <td><%# Eval("paid") %></td>
                                <td><%# Eval("photographer") %></td>
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
                                        <th scope="col">Sponsor Name</th>
                                        <th scope="col">Sponsor Contact</th>
                                        <th scope="col">Phone</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Paid</th>
                                        <th scope="col">Photographer</th>
		                            </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("id") %></td>
                                <td><asp:LinkButton ID="lnkLoadBusData" Text='<%# Eval("sponsorName") %>' CommandArgument='<%#Eval("sponsorName")%>' OnCommand="businessSelected" Font-Underline="false" Font-Size="small" runat="server" /></td>
                                <td><%# Eval("sponsorContact") %></td>
                                <td><%# Eval("sponsorPhone") %></td>
                                <td><%# Eval("sponsorEmail") %></td>
                                <td><%# Eval("paid") %></td>
                                <td><%# Eval("photographer") %></td>
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

            <div class="row well"> <!-- Secondary Data Display -->
                <div class="col-sm-6" style="text-align:left;">                    
                    <asp:Label ID="lblSponsorName" CssClass="label label-danger" Text="Sponsor Name: " runat="server" />
                    <asp:TextBox ID="txtSponsorName" CssClass="form-control" runat="server" />
                    <br />
                    <asp:Label ID="lblSponsorEmail" CssClass="label label-danger" Text="Sponsor E-Mail: " runat="server" />
                    <asp:TextBox ID="txtSponsorEmail" CssClass="form-control" runat="server" />
                    <br />
                    <asp:Label ID="lblSponsorPhone" CssClass="label label-danger" Text="Sponsor Phone: " runat="server" />
                    <asp:TextBox ID="txtSponsorPhone" CssClass="form-control" runat="server" />
                    <br />
                    <asp:Label ID="lblSponsorAddress" CssClass="label label-danger" Text="Sponsor Address: " runat="server" />
                    <asp:TextBox ID="txtSponsorAddress" CssClass="form-control" runat="server" />
                    <br />
                    <asp:Label ID="lblContactName" CssClass="label label-danger" Text="Contact Name: " runat="server" />
                    <asp:TextBox ID="txtContactName" CssClass="form-control" runat="server" />
                    <br />                                        
                </div>
                <div class="col-sm-6" style="text-align:left;">
                    <asp:Label ID="lblAdSize" CssClass="label label-danger" Text="Ad Size: " runat="server" />
                    <asp:TextBox ID="txtAdSize" CssClass="form-control" runat="server" />
                    <br />
                    <asp:Label ID="lblPaid" CssClass="label label-danger" Text="Payment Status: " runat="server" />
                    <asp:TextBox ID="txtPaid" CssClass="form-control" runat="server" />
                    <br />
                    <asp:Label ID="lblAdStatus" CssClass="label label-danger" Text="Ad Status: " runat="server" />
                    <asp:TextBox ID="txtAdStatus" CssClass="form-control" runat="server" />
                    <br />
                    <asp:Label ID="lblPaymentMethod" CssClass="label label-danger" Text="Payment Method: " runat="server" />
                    <asp:TextBox ID="txtPaymentMethod" CssClass="form-control" runat="server" />
                    <br />
                    <asp:Label ID="lblContacted" CssClass="label label-danger" Text="Contact Status: " runat="server" />
                    <asp:TextBox ID="txtContacted" CssClass="form-control" runat="server" />
                    <br />
                </div>
                    <asp:Button ID="btnUpdate" CssClass="btn btn-danger" OnClick="updateSponsor" Text="Update" runat="server" />
                    <br />                                
                </div>  <!-- Secondary Data Display -->



            <div class="row well">
                <div class="col-sm-1" style="text-align:center;">
                    <asp:Button ID="btnAssign" Text="Assign" OnClick="assignPhotographer" CssClass="btn btn-danger" runat="server" /><br /><br />
                </div>
                <div class="col-sm-7" style="text-align:center;">
                    <asp:DropDownList ID="drpAssignPhotographer" CssClass="form-control" runat="server" /> 
                    <asp:DropDownList ID="drpAssignSponsor" CssClass="form-control" runat="server" /> 
                </div>

                <div class="col-sm-4" style="text-align:center;">
                    <asp:Label ID="lblAssignInstructions" Text="Assign a photographer to a business by selecting each in the drop downs and clicking the assign button" runat="server" />  <br /><br />
                </div>
                <!-- -->
                

            </div> <!-- /row-->
            <div class="row well">
            
                <div class="col-sm-8" style="text-align:left;">
                    <asp:Label ID="lblAd1" CssClass="label label-danger" Text="1/6 Page: " runat="server" />
                    <asp:TextBox ID="txtOneSixthPrice" CssClass="form-control" runat="server" /><br />
                    <asp:Label ID="lblAd2" CssClass="label label-danger" Text="1/3 Page: " runat="server" />
                    <asp:TextBox ID="txtOneThirdPrice" CssClass="form-control" runat="server" /><br />
                    <asp:Label ID="lblAd3" CssClass="label label-danger" Text="2/3 Page: " runat="server" />
                    <asp:TextBox ID="txtTwoThirdPrice" CssClass="form-control" runat="server" /><br />
                    <asp:Label ID="lblAd4" CssClass="label label-danger" Text="Full Page: " runat="server" />
                    <asp:TextBox ID="txtFullPrice" CssClass="form-control" runat="server" /> <br /><br />
                    <asp:Button ID="btnUpdateAdPrices" Text="Set Ad Price" OnClick="updateAdPrices" CssClass="btn btn-danger" runat="server" /><br />
                </div>

                <div class="col-sm-4" style="text-align:right;">
                    <asp:Label ID="Label1" Text="Here you can view and set the current price of each ad size" runat="server" />  <br /><br />
                </div>
                </div>

            <div class="col-sm-6 row well">
                <asp:Button ID="btnEmailTest" Text="Test Email" OnClick="testEmail" CssClass="btn btn-danger" runat="server" />
                <asp:Label ID="lblEmailTestFeedback" Text="" runat="server" />
            </div>
            <div class="col-sm-6 row well">
                <asp:TextBox ID="txtEmailTest" CssClass="form-control" runat="server" />
            </div>
        </div> <!-- /container -->

    </form>

</asp:Content>