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

    protected void page_load() {
        if (!Page.IsPostBack) {
            dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
            // Populates the record data based on the username (which is the users business name) of the logged in account
            sqlString = "SELECT * FROM businessrecords WHERE business_name = '" + lblUsername.Text + "'";
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
            repDisplayData.DataSource = pds;
            repDisplayData.DataBind();
        }
    }

    // Method to handle searching the business records
    protected void search(Object src, EventArgs args) {
        if (chkId.Checked == true) {
            // If the id is checked, search by id
            searchId();
        } else if (chkPrice.Checked == true) {
            // If the price is checked, search by price paid
            searchPrice();
        } else if (chkAdSize.Checked == true) {
            // If the ad size is checked, search by ad size
            searchAdSize();
        } else if (chkDate.Checked == true) {
            // If the date is checked, search by date (MM/DD/YY format)
            searchDate();
        } else if (chkAll.Checked == true) {
            searchAll();
        }
    }

    protected void searchDate() {
        dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
        // Populates the record data based on a search via date (checks against username as well to avoid security hole allowing user to get other users business record data)
        sqlString = "SELECT * FROM businessrecords WHERE date = '" + txtSearch.Text + "'" + " AND business_name = '" + lblUsername.Text + "'";
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
        repDisplayData.DataSource = pds;
        repDisplayData.DataBind();
    }

    protected void searchAdSize() {
        dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
        // Populates the record data based on a search via ad size (checks against username as well to avoid security hole allowing user to get other users business record data)
        sqlString = "SELECT * FROM businessrecords WHERE ad_size = '" + txtSearch.Text + "'" + " AND business_name = '" + lblUsername.Text + "'";
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
        repDisplayData.DataSource = pds;
        repDisplayData.DataBind();
    }

    protected void searchPrice() {
        dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
        // Populates the record data based on a search via ad price (checks against username as well to avoid security hole allowing user to get other users business record data)
        sqlString = "SELECT * FROM businessrecords WHERE ad_price = '" + txtSearch.Text + "'" + " AND business_name = '" + lblUsername.Text + "'";
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
        repDisplayData.DataSource = pds;
        repDisplayData.DataBind();
    }

    protected void searchId() {
        dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
        // Populates the record data based on a search via id (checks against username as well to avoid security hole allowing user to get other users business record data)
        sqlString = "SELECT * FROM businessrecords WHERE id = '" + txtSearch.Text + "'" + " AND business_name = '" + lblUsername.Text + "'";
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
        repDisplayData.DataSource = pds;
        repDisplayData.DataBind();
    }

    protected void searchAll() {
        dbConnection = new MySqlConnection("Database=rotaryyearbook;Data Source=localhost;User Id=useraccount;Password=userpassword");
        // Populates the record data based on a search via id (checks against username as well to avoid security hole allowing user to get other users business record data)
        sqlString = "SELECT * FROM businessrecords WHERE business_name = '" + lblUsername.Text + "'";
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
        repDisplayData.DataSource = pds;
        repDisplayData.DataBind();
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="headBox" Runat="Server">
    <title>Rotary Club Yearbook - Business Records</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
     <!-- Latest compiled and minified CSS -->
     <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
     <!-- jQuery library -->
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
     <!-- Latest compiled JavaScript -->
     <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="bodyBox" Runat="Server">
    <form runat="server">
    <div class="container col-sm-12 well">
        <div class="container col-sm-12 well">
            <asp:Image ImageUrl="/images/YearbookLogo.png" AlternateText="imagelogo" height="100" width="500" runat="server" />
        </div>
        <div class="container col-sm-4 well" style="text-align:center;">
                <asp:Label ID="lblUsername" Text="username" runat="server" />  
            </div>
            <div class="container col-sm-4 well" style="text-align:center;">
                <asp:Label ID="lblPageTitle" Text="Rotary Club Yearbook Business Records Page" runat="server" />  
            </div>
            <div class="container col-sm-4 well" style="text-align:center;">
                <asp:LinkButton ID="lnkLogout" Text="logout" runat="server" />
            </div>
       <!--</div>--> 
        <div class="container col-sm-3 well" style="text-align:center;">
            <asp:Label ID="lblExplan1" Text="Input search parameters and click search" runat="server" /><br /> 
        </div>
        <div class="container col-sm-4 well" style="text-align:center;">
            <asp:TextBox ID="txtSearch" CssClass="form form-control" runat="server" /> 
        </div>
        <div class="container col-sm-4 well btn-group" style="text-align:center;" data-toggle="buttons">
            <asp:RadioButton ID="chkId" Text="Id Num" GroupName="group" CssClass="btn btn-danger" AutoPostBack="true" runat="server" />
            <asp:RadioButton ID="chkPrice" Text="Price" GroupName="group" CssClass="btn btn-danger" AutoPostBack="true" runat="server" />
            <asp:RadioButton ID="chkAdSize" Text="Ad Size" GroupName="group" CssClass="btn btn-danger" AutoPostBack="true" runat="server" />
            <asp:RadioButton ID="chkDate" Text="Date" GroupName="group" CssClass="btn btn-danger" AutoPostBack="true" runat="server" />
            <asp:RadioButton ID="chkAll" Text="All" GroupName="group" CssClass="btn btn-danger" AutoPostBack="true" runat="server" />

        </div>
        <div class="container col-sm-1 well" style="text-align:center;">
            <asp:Button ID="btnSearch" Text="Search" OnClick="search" CssClass="btn btn-danger" runat="server" />
        </div>
        <div class="container col-sm-12 well" id="dataPanel" style="text-align:center;">
            <asp:Repeater id="repDisplayData" runat="server">
                <HeaderTemplate>
                    <table class="table table-hover table-condensed">
                        <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Business Name</th>
                                <th scope="col">First Name</th>
                                <th scope="col">Last Name</th>
                                <th scope="col">Ad Size</th>
                                <th scope="col">Ad Price (CDN $)</th>
                                <th scope="col">Date</th>
		                    </tr>
                        </thead>
                      <tbody>
                      </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                    <td><%# Eval("id") %></td>
                                    <td><%# Eval("business_name") %></td>
                                    <td><%# Eval("first_name") %></td>
                                    <td><%# Eval("last_name") %></td>
                                    <td><%# Eval("ad_size") %></td>
                                    <td><%# Eval("ad_price") %></td>
                                    <td><%# Eval("date") %></td>
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
            </ul>
        </div>
    </div>
    </form>
</asp:Content>

