<%@ Page Language="C#" Debug="true" ClientTarget="uplevel" EnableEventValidation="false" validateRequest="false" EnableViewState="true"  %>
<%@ Import Namespace="MySql.Data.MySqlClient" %>
<%@Import Namespace="System.Data" %>

<!DOCTYPE html>

<script runat="server">
    MySqlConnection dbConnection;
    MySqlCommand dbCommand;
    MySqlDataReader dbReader;
    string sqlString;
    MySqlDataAdapter dbAdapter;
    DataSet dbDataSet;

    protected void page_load() {
        if (!Page.IsPostBack) {
            ListItem photographer;
            ListItem business;
            // This is just dummy data for display purposes, needs to be replaced with data from the database
            // In the middle of writing a class to handle this, not finished with it yet
            photographer = new ListItem("Assign Photographer Here");
            drpAssignPhotographer.Items.Add(photographer);

            business = new ListItem("Assign Business Here");
            drpAssignBusiness.Items.Add(business);

            btnSearch.Enabled = false;
            // Executes the paging code
            loadBusinessData();
        }
    }

    // Handles display of in-depth data when user clicks the business name in the initial repeater
    // Uses custom paging bind the displayed data to the display repeater
    protected void loadBusinessData () {
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
            // Sets the paging size
            pds.PageSize = 20;

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
    protected void mainDisplayDataLoad() {

    }

    // Ensures the user is logged in to a valid account to be able to use the admin page
    protected void checkLogin () {
        // Checks to ensure the user is actually logged into a valid account before permitting access to the main page
        if (Session["weblogin"] == null) {
            Response.Redirect("login.aspx");
        } else if (((WebLogin)Session["weblogin"]).access != true) {
            Response.Redirect("login.aspx");
        }

        // Sets the logged in username to the username stored as part of the login process
        if (Session["username"] != null) {
            lblUsername.Text = Session["username"].ToString();
        } else {
            // Just error checking, the user should never actually be able to hit this, if they do theres been a hack of some kind
            lblUsername.Text = "not logged in";
        }
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
            <asp:Button ID="btnSearch" Text="Search" CssClass="btn btn-danger" runat="server" />
        </div>

        <div class="container col-sm-12 well" style="text-align:center;">
            <asp:Label ID="lblExplamation" Text="Search bar output (will be hidden until search is executed)" runat="server" />
        </div>
        <div class="container col-sm-12 well" style="text-align:center;">
            <asp:Label ID="lblExplanation2" Text="Main Data Display (better organized version of admin data page)" runat="server" />
            <!--<br /> <br /> <br /> <br /> <br /><br /> <br /> <br /> <br /> <br /> -->
            <asp:Repeater id="repMainDisplay" runat="server">
                <HeaderTemplate>
                    <table class="table table-hover table-condensed">
                        <thead>
                            <tr>
                                <th scope="col">Business Name</th>
                                <th scope="col">First Name</th>
                                <th scope="col">Last Name</th>
                                <th scope="col">Assigned Photographer</th>
                                <th scope="col">Sponsor</th>
                                <th scope="col">Add Approved</th>
                                <th scope="col">Has Paid</th>
		                    </tr>
                        </thead>
                      <tbody>
                      </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                    <td><asp:LinkButton ID="lnkLoadBusData" Text='<%# Eval("business_name") %>' CommandArgument='<%#Eval("business_name")%>' OnCommand="loadBusinessData" Font-Underline="false" Font-Size="small" runat="server" /></td>
                                    
                                    <td><%# Eval("first_name") %></td>
                                    <td><%# Eval("last_name") %></td>
                                    <td><%# Eval("assigned_photographer_name") %></td>
                                    <td><%# Eval("assigned_sponsor_name") %></td>
                                    <td><%# Eval("ad_approved") %></td>
                                    <td><%# Eval("haspaid") %></td>

		                     </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                          </tbody>
                          </table>
                    </FooterTemplate>
              </asp:Repeater>
            <div class="well" style="text-align:center">
            <ul class="pager">
                <li><asp:HyperLink ID="lnkPrev" Font-Bold="true" Font-Underline="false" runat="server"><<</asp:HyperLink></li>
                <li><asp:Label ID="lblPageInfo" runat="server" /></li>
                <li><asp:HyperLink ID="lnkNext" Font-Bold="true" Font-Underline="false" runat="server">>></asp:HyperLink></li>
            </ul><br />
            </div>
        </div>
        <div class="container col-sm-12 well" style="text-align:center;">
            <asp:Label ID="lblExplanation3" Text="Secondary Data Display (shows more detailed report when user is selected)" runat="server" />
            <br /> <br /> <br /> <br /> <br /><br /> <br /> <br /> <br /> <br /> 
        </div>
        <div class="container col-sm-4 well" style="text-align:center;">
                <asp:Label ID="lblAssignInstructions" Text="Assign a photographer to a sponsor by selecting each in the drop downs and clicking the assign button" runat="server" />  <br /><br />
        </div>
        <div class="container col-sm-7 well" style="text-align:center;">
                <asp:DropDownList ID="drpAssignPhotographer" CssClass="form-control" runat="server" /> 
                <asp:DropDownList ID="drpAssignBusiness" CssClass="form-control" runat="server" /> 
        </div>
        <div class="container col-sm-1 well" style="text-align:center;">
                <asp:Button ID="btnAssign" Text="Assign" CssClass="btn btn-danger" runat="server" /><br /><br />
        </div>

       </div>
    

    </form>
    
</body>
</html>
