<%@ Page Language="C#" Debug="true" ClientTarget="uplevel" EnableEventValidation="false" validateRequest="false" EnableViewState="true"  %>

<!DOCTYPE html>

<script runat="server">
    protected void page_load() {
        if (!Page.IsPostBack) {
            ListItem photographer;
            ListItem business;

            photographer = new ListItem("Assign Photographer Here");
            drpAssignPhotographer.Items.Add(photographer);

            business = new ListItem("Assign Business Here");
            drpAssignBusiness.Items.Add(business);
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
        <br /><br />
        logo
    </div>
       <!-- <div class="container col-sm-12 well"> -->
            <div class="container col-sm-4 well" style="text-align:center;">
                <asp:Label ID="lblUsername" Text="username" runat="server" />  
            </div>
            <div class="container col-sm-4 well" style="text-align:center;">
                <asp:Label ID="lblPageTitle" Text="Rotary Club Yearbook Admin Page" runat="server" />  
            </div>
            <div class="container col-sm-4 well" style="text-align:center;">
                <asp:Label ID="lblLogout" Text="logout" runat="server" />  
            </div>
       <!--</div>--> 
        <div class="container col-sm-4 well" style="text-align:center;">
            <asp:Label ID="Label3" Text="Input search parameters and click search" runat="server" /><br /> 
        </div>
        <div class="container col-sm-7 well" style="text-align:center;">
            <asp:TextBox ID="txtSearch" CssClass="form form-control" runat="server" /> 
        </div>
        <div class="container col-sm-1 well" style="text-align:center;">
            <asp:Button ID="btnSearch" Text="Search" CssClass="btn btn-danger" runat="server" />
        </div>

        <div class="container col-sm-12 well" style="text-align:center;">
            <asp:Label ID="lblExplamation" Text="Search bar output (will be hidden until search is executed)" runat="server" />
        </div>
        <div class="container col-sm-12 well" style="text-align:center;">
            <asp:Label ID="lblExplanation2" Text="Main Data Display (better organized version of admin data page)" runat="server" />
            <br /> <br /> <br /> <br /> <br /><br /> <br /> <br /> <br /> <br /> 
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
