<%@ Page Language="C#" Debug="true" ClientTarget="uplevel" EnableEventValidation="false" validateRequest="false" EnableViewState="true"  %>
<%@ Import Namespace="MySql.Data.MySqlClient" %>
<%@Import Namespace="System.Data" %>
<%@ Import Namespace="System.Windows.Forms" %>
<%@ Import Namespace="System.Text" %>
<%@ Import Namespace="System.Web" %>
<%@ Import Namespace="System.Web.UI" %>


<!DOCTYPE html>

<script runat="server">
    MySqlConnection dbConnection;
    MySqlCommand dbCommand;
    MySqlDataReader dbReader;
    string sqlString;
    MySqlDataAdapter dbAdapter;
    DataSet dbDataSet;
    // Used to handle updating fields
    UpdateAdmin update;

    string selectedBusiness;

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

            //business = new ListItem("Assign Business Here");
            //drpAssignBusiness.Items.Add(business);

            // Populates the two dropdowns
            populateBusinesses();
            populatePhotographers();

            btnSearch.Enabled = true;
            // Executes the paging code
            //loadBusinessData();
            // Handles loading of the businesses basic data
            mainDisplayDataLoad();
        }

        // Constructing update object
        //update = new UpdateAdmin();
    }

    // Handles population of the photographer dropdown
    protected void populatePhotographers() {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "SELECT assigned_photographer_name FROM admin WHERE id > 0";
            dbAdapter = new MySqlDataAdapter(sqlString, dbConnection);
            dbDataSet = new DataSet();
            dbAdapter.Fill(dbDataSet, "admin");
            // Executes the SQL
            // Binds the photographer data to the dropdown so it can be displayed
            drpAssignPhotographer.DataSource = dbDataSet.Tables["admin"];
            drpAssignPhotographer.DataValueField = "assigned_photographer_name";
            drpAssignPhotographer.DataTextField = "assigned_photographer_name";
            drpAssignPhotographer.DataBind();
            Cache["dbDataSet"] = dbDataSet;
        } finally {
            dbConnection.Close();
        }
    }

    // Handles population of the business dropdown
    protected void populateBusinesses() {
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            sqlString = "SELECT business_name FROM admin WHERE id > 0";
            dbAdapter = new MySqlDataAdapter(sqlString, dbConnection);
            dbDataSet = new DataSet();
            dbAdapter.Fill(dbDataSet, "admin");
            // Executes the SQL
            // Binds the business data to the dropdown so it can be displayed
            drpAssignBusiness.DataSource = dbDataSet.Tables["admin"];
            drpAssignBusiness.DataValueField = "business_name";
            drpAssignBusiness.DataTextField = "business_name";
            drpAssignBusiness.DataBind();
            Cache["dbDataSet"] = dbDataSet;
        } finally {
            dbConnection.Close();
        }
    }

    // Handles assigning a photographer to a business
    protected void assignPhotographer(Object src, EventArgs args) {
        update.updateAssignedBusinessName(drpAssignPhotographer.SelectedItem.Value.ToString(), drpAssignBusiness.SelectedItem.Value.ToString());
        update.updateAssignedPhotographerName(drpAssignBusiness.SelectedItem.Value.ToString(), drpAssignPhotographer.SelectedItem.Value.ToString());
    }

    // Handles admin selection of a user to view in greater detail
    protected void businessSelected (Object src, CommandEventArgs args) {
        // Uses the text of the command argument (which is the name of the business) to determine what data to load
        Session["selectedBusiness"] = args.CommandArgument;
        selectedBusiness = Session["selectedBusiness"].ToString();
        loadBusinessData();
    }

    // Handles display of in-depth data when user clicks the business name in the initial repeater
    // Uses custom paging bind the displayed data to the display repeater
    protected void loadBusinessData () {
        /*
        try {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            dbConnection.Open();
            dbCommand = new MySqlCommand("", dbConnection);
            sqlString = "SELECT * FROM admin WHERE business_name = '" + selectedBusiness + "'";
            dbCommand = new MySqlCommand(sqlString, dbConnection);
            // Executes the SQL
            dbCommand.CommandText = sqlString;
            dbReader = dbCommand.ExecuteReader();
            // Binds the data to the repeater so it can be displayed
            repSelectedBusiness.DataSource = dbReader;
            repSelectedBusiness.DataBind();
        } finally {
            dbConnection.Close();
        } */

        // Populates the expanded business data fields when a business is selected
        // Originally used a repeater, but that had to be rewritten because it made
        // the text fields out of scope (as they were in a repeater) so prevented
        // updating the db via the field inputs
        txtID.Text = Convert.ToString(update.getId(selectedBusiness));
        txtBusinessName.Text = update.getBusinessName(selectedBusiness);
        txtBusinessEmail.Text = update.getBusinessEmail(selectedBusiness);
        txtBusinessPhone.Text = update.getBusinessPhone(selectedBusiness);
        txtBusinessAddress.Text = update.getBusinessAddress(selectedBusiness);
        txtFirstName.Text = update.getFirstName(selectedBusiness);
        txtMiddleName.Text = update.getMiddleName(selectedBusiness);
        txtLastName.Text = update.getLastName(selectedBusiness);
        txtAssignedPhotographer.Text = update.getAssignedPhotographerName(selectedBusiness);
        txtAdSize.Text = update.getAdSize(selectedBusiness);
        txtPaid.Text = update.getHasPaid(selectedBusiness);
        txtOrdered.Text = update.getOrdered(selectedBusiness);
        txtAdApproved.Text = update.getAdApproved(selectedBusiness);
        txtPaymentMethod.Text = update.getPayType(selectedBusiness);
        txtContacted.Text = update.getContacted(selectedBusiness);
    }

    // Displays the data based on a selected business
    protected void mainDisplayDataLoad() {
        // user and password have not yet been set up in the database, needs to be fixed to get this working, except for on my local phpmyadmin installation
        dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
        sqlString = "SELECT * FROM admin WHERE id > 0";
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
    //updateBusiness();
    //} else if (result == DialogResult.No) {
    // No
    // Reloads the previous data to avoid accidental changes being made
    //loadBusinessData();
    //}


    //}

    // Handles updating user details
    protected void updateBusiness(Object src, EventArgs args) {
        // Updates business name
        update.updateBusinessName(Convert.ToString(txtID.Text), Convert.ToString(Server.HtmlEncode(txtBusinessName.Text)));
        // Updates business email
        update.updateBusinessEmail(Convert.ToString(txtID.Text), Convert.ToString(Server.HtmlEncode(txtBusinessEmail.Text)));
        // Updates business phone
        update.updatePhone(Convert.ToString(txtID.Text), Convert.ToString(Server.HtmlEncode(txtBusinessPhone.Text)));
        // Updates business address
        update.updateAddress(Convert.ToString(txtID.Text), Convert.ToString(Server.HtmlEncode(txtBusinessAddress.Text)));
        // Updates first name
        update.updateFirstName(Convert.ToString(txtID.Text), Convert.ToString(Server.HtmlEncode(txtFirstName.Text)));
        // Updates middle name
        update.updateMiddleName(Convert.ToString(txtID.Text), Convert.ToString(Server.HtmlEncode(txtMiddleName.Text)));
        // Updates last name
        update.updateLastName(Convert.ToString(txtID.Text), Convert.ToString(Server.HtmlEncode(txtLastName.Text)));
        // Updates assigned photographer
        update.updateAssignedPhotographer(Convert.ToString(txtID.Text), Convert.ToString(Server.HtmlEncode(txtAssignedPhotographer.Text)));
        // Updates ad size
        update.updateAdSize(Convert.ToString(txtID.Text), Convert.ToString(Server.HtmlEncode(txtAdSize.Text)));
        // Updates payment status
        update.updateHasPaid(Convert.ToString(txtID.Text), Convert.ToString(Server.HtmlEncode(txtPaid.Text)));
        // Updates order status
        update.updateOrdered(Convert.ToString(txtID.Text), Convert.ToString(Server.HtmlEncode(txtOrdered.Text)));
        // Updates approval status
        update.updateAdApproved(Convert.ToString(txtID.Text), Convert.ToString(Server.HtmlEncode(txtAdApproved.Text)));
        // Updates payment method
        update.updatePaymentType(Convert.ToString(txtID.Text), Convert.ToString(Server.HtmlEncode(txtPaymentMethod.Text)));
        // Updates whether user was contacted
        update.updateContacted(Convert.ToString(txtID.Text), Convert.ToString(Server.HtmlEncode(txtContacted.Text)));
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
            sqlString = "SELECT * FROM admin WHERE business_name = '" + Convert.ToString(Server.HtmlEncode(txtSearch.Text)) + "'";
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

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Rotary Club Yearbook - Admin Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
     <!-- Latest compiled and minified CSS -->
     <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
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
</head>
<body>
    <form runat="server">
    <div class="container col-sm-12 well">
        <div class="container col-sm-12 well">
        <!--<asp:Image ImageUrl="/images/rotaryYearbookLogo_sm.png" AlternateText="imagelogo" runat="server" /> -->
            <asp:Image ImageUrl="/images/YearbookLogo.png" AlternateText="imagelogo" height="100" width="500" runat="server" />
    </div>
       <!-- <div class="container col-sm-12 well"> -->
            <div class="container col-sm-4 well" style="text-align:center;">
                <asp:Label ID="lblUsername" Text="username" runat="server" />  
            </div>
            <div class="container col-sm-4 well" style="text-align:center;">
                <asp:Label ID="lblPageTitle" Text="Rotary Club Yearbook Admin Page" runat="server" />  
            </div>
            <div class="container col-sm-4 well" style="text-align:center;">
                <!--<asp:Label ID="lblLogout" Text="logout" runat="server" /> --> 
                <asp:LinkButton ID="lnkLogout" Text="logout" runat="server" />
            </div>
       <!--</div>--> 
        <div class="container col-sm-4 well" style="text-align:center;">
            <asp:Label ID="lblExplan1" Text="Input search parameters and click search" runat="server" /><br /> 
        </div>
        <div class="container col-sm-7 well" style="text-align:center;">
            <asp:TextBox ID="txtSearch" CssClass="form form-control" OnTextChanged="searchControl" runat="server" /> 
        </div>
        <div class="container col-sm-1 well" style="text-align:center;">
            <asp:Button ID="btnSearch" Text="Search" OnClick="search" CssClass="btn btn-danger" runat="server" />
        </div>

        <div class="container col-sm-12 well" id="searchPanel" style="text-align:center;">
            <asp:Label ID="lblExplamation" Text="Search bar output (will be hidden until search is executed)" runat="server" />
            <asp:Repeater id="repSearch" runat="server">
                <HeaderTemplate>
                    <table class="table table-hover table-condensed">
                        <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Business Name</th>
                                <th scope="col">First Name</th>
                                <th scope="col">Last Name</th>
                                <th scope="col">Business Phone</th>
                                <th scope="col">Business Email</th>
		                    </tr>
                        </thead>
                      <tbody>
                      </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                    <td><%# Eval("id") %></td>
                                    <td><asp:LinkButton ID="lnkLoadBusData" Text='<%# Eval("business_name") %>' CommandArgument='<%#Eval("business_name")%>' OnCommand="businessSelected" Font-Underline="false" Font-Size="small" runat="server" /></td>
                                    <td><%# Eval("first_name") %></td>
                                    <td><%# Eval("last_name") %></td>
                                    <td><%# Eval("business_phone") %></td>
                                    <td><%# Eval("business_email") %></td>
                                <br />
		                     </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                          </tbody>
                          </table>
                    </FooterTemplate>
              </asp:Repeater>
        </div>
        <div class="container col-sm-12 well" style="text-align:center;">
            <asp:Label ID="lblExplanation2" Text="Main Data Display (better organized version of admin data page)" runat="server" />
            <!--<br /> <br /> <br /> <br /> <br /><br /> <br /> <br /> <br /> <br /> -->
            <asp:Repeater id="repMainDisplay" runat="server">
                <HeaderTemplate>
                    <table class="table table-hover table-condensed">
                        <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Business Name</th>
                                <th scope="col">First Name</th>
                                <th scope="col">Last Name</th>
                                <th scope="col">Assigned Photographer</th>
                                <th scope="col">Business Phone</th>
                                <th scope="col">Ad Approved</th>
                                <th scope="col">Has Paid</th>
		                    </tr>
                        </thead>
                      <tbody>
                      </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                    <td><%# Eval("id") %></td>
                                    <td><asp:LinkButton ID="lnkLoadBusData" Text='<%# Eval("business_name") %>' CommandArgument='<%#Eval("business_name")%>' OnCommand="businessSelected" Font-Underline="false" Font-Size="small" runat="server" /></td>
                                    <td><%# Eval("first_name") %></td>
                                    <td><%# Eval("last_name") %></td>
                                    <td><%# Eval("assigned_photographer_name") %></td>
                                    <td><%# Eval("business_phone") %></td>
                                    <td><%# Eval("ad_approved") %></td>
                                    <td><%# Eval("haspaid") %></td>
                                <br />
		                     </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                          </tbody>
                          </table>
                    </FooterTemplate>
              </asp:Repeater>
           <!-- <div class="well" style="text-align:center"> -->
            <ul class="pager" style="text-align:center">
                <li><asp:HyperLink ID="lnkPrev" Font-Bold="true" Font-Underline="false" runat="server"><<</asp:HyperLink></li>
                <li><asp:Label ID="lblPageInfo" runat="server" /></li>
                <li><asp:HyperLink ID="lnkNext" Font-Bold="true" Font-Underline="false" runat="server">>></asp:HyperLink></li>
            </ul><br />
           <!-- </div> -->



        </div>
        <div class="container col-sm-12 well" style="text-align:left;">
            <asp:Label ID="lblExplanation3" Text="Secondary Data Display (shows more detailed report when user is selected)" runat="server" /><br />
            <asp:Label ID="lblID" CssClass="label label-danger" Text="User ID: " runat="server" />
                            <asp:TextBox ID="txtID" CssClass="form-control" Enabled="false" runat="server" />
                            <br />
                            <asp:Label ID="lblBusinessName" CssClass="label label-danger" Text="Business Name: " runat="server" />
                            <asp:TextBox ID="txtBusinessName" CssClass="form-control" runat="server" />
                            <br />
                            <asp:Label ID="lblBusinessEmail" CssClass="label label-danger" Text="Business E-Mail: " runat="server" />
                            <asp:TextBox ID="txtBusinessEmail" CssClass="form-control" runat="server" />
                            <br />
                            <asp:Label ID="lblBusinessPhone" CssClass="label label-danger" Text="Business Phone: " runat="server" />
                            <asp:TextBox ID="txtBusinessPhone" CssClass="form-control" runat="server" />
                            <br />
                            <asp:Label ID="lblBusinessAddress" CssClass="label label-danger" Text="Business Address: " runat="server" />
                            <asp:TextBox ID="txtBusinessAddress" CssClass="form-control" runat="server" />
                            <br />
                            <asp:Label ID="lblFirstName" CssClass="label label-danger" Text="First Name: " runat="server" />
                            <asp:TextBox ID="txtFirstName" CssClass="form-control" runat="server" />
                            <br />
                            <asp:Label ID="lblMiddleName" CssClass="label label-danger" Text="Middle Name: " runat="server" />
                            <asp:TextBox ID="txtMiddleName" CssClass="form-control" runat="server" />
                            <br />
                            <asp:Label ID="lblLastName" CssClass="label label-danger" Text="Last Name: " runat="server" />
                            <asp:TextBox ID="txtLastName" CssClass="form-control" runat="server" />
                            <br />
                            <asp:Label ID="lblAssignedPhotographer" CssClass="label label-danger" Text="Assigned Photographer: " runat="server" />
                            <asp:TextBox ID="txtAssignedPhotographer" CssClass="form-control" runat="server" />
                            <br />
                            <asp:Label ID="lblAdSize" CssClass="label label-danger" Text="Ad Size: " runat="server" />
                            <asp:TextBox ID="txtAdSize" CssClass="form-control" runat="server" />
                            <br />
                            <asp:Label ID="lblPaid" CssClass="label label-danger" Text="Paid: " runat="server" />
                            <asp:TextBox ID="txtPaid" CssClass="form-control" runat="server" />
                            <br />
                            <asp:Label ID="lblOrdered" CssClass="label label-danger" Text="Ordered: " runat="server" />
                            <asp:TextBox ID="txtOrdered" CssClass="form-control" runat="server" />
                            <br />
                            <asp:Label ID="lblAdApproved" CssClass="label label-danger" Text="Ad Approved: " runat="server" />
                            <asp:TextBox ID="txtAdApproved" CssClass="form-control" runat="server" />
                            <br />
                            <asp:Label ID="lblPaymentMethod" CssClass="label label-danger" Text="Payment Method: " runat="server" />
                            <asp:TextBox ID="txtPaymentMethod" CssClass="form-control" runat="server" />
                            <br />
                            <asp:Label ID="lblContacted" CssClass="label label-danger" Text="Contacted: " runat="server" />
                            <asp:TextBox ID="txtContacted" CssClass="form-control" runat="server" />
                            <br />
                            <asp:Button ID="btnUpdate" CssClass="btn btn-danger" OnClick="updateBusiness" Text="Update" runat="server" />
                            <br />
            <!-- <br /> <br /> <br /> <br /> <br /><br /> <br /> <br /> <br /> <br /> -->                                   
        </div>
        <div class="container col-sm-4 well" style="text-align:center;">
                <asp:Label ID="lblAssignInstructions" Text="Assign a photographer to a business by selecting each in the drop downs and clicking the assign button" runat="server" />  <br /><br />
        </div>
        <div class="container col-sm-7 well" style="text-align:center;">
                <asp:DropDownList ID="drpAssignPhotographer" CssClass="form-control" runat="server" /> 
                <asp:DropDownList ID="drpAssignBusiness" CssClass="form-control" runat="server" /> 
        </div>
        <div class="container col-sm-1 well" style="text-align:center;">
                <asp:Button ID="btnAssign" Text="Assign" OnClick="assignPhotographer" CssClass="btn btn-danger" runat="server" /><br /><br />
        </div>
       </div>


    

    </form>
    
</body>
</html>
