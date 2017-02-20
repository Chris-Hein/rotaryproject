<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="photograper.aspx.cs" Inherits="new_photographer" %>

<asp:Content ID="headCon" ContentPlaceHolderID="headBox" Runat="Server">
    
</asp:Content>
<asp:Content ID="bodyCon" ContentPlaceHolderID="bodyBox" Runat="Server">         
    <!-- Sponsor information -->
    <section class="content-block">
        <div class="container">
            <!-- SEARCH BAR -->   
            <div class="row">
                 <form class="navbar-form" role="search">
                    <div class="input-group add-on">
                        <input class="form-control" placeholder="Search by Business Name" name="search-term" id="search-term" type="text">
                        <div class="input-group-btn">
                            <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                        </div>
                    </div>
                </form>
                <!-- END SEARCH BAR --> 
                <div class="col-md-6 pull-left">
                    <div class="editContent">
                        <h3>About the Sponsor:</h3>
                    </div>
                    <div class="editContent">
                        <p id="content">
                            <b>Contact Name: </b> <span id="lblName" runat="server">John Smith</span><br />
                            <b>Business Name: </b> <span id="lblBus" runat="server">Business of business</span><br />
                            <b>Email: </b> <span id="lblEmail" runat="server">johnsmith@email.com</span><br />
                            <b>Business address: </b><span id="lblAddress" runat="server">123 Fake Street</span><br/>
                            <b>Phone: </b><span id="lblPhone" runat="server">902-555-1234</span><br/>
                        </p>
                    </div>                    
                </div>

                <div class="col-md-6 pull-right">
                    <fieldset>
                        <!-- MESSAGE BOX -->
                        <form role="form">                           
                            <div class="form-group">
                                <label for="textArea" style="margin-top:2%">Message</label>
                                <textarea class="form-control" rows="5" id="txtMessage" placeholder="Email Message. . . "></textarea>                                
                            </div>

                            <a href="#" id="btnSend" class="btn btn-primary" runat="server">Send Email</a>
                        </form>
                    </fieldset>
                </div>

            </div><!-- // row -->
        </div><!-- // container -->
        <br />
        <div class="container">
            <div class="row">                
                <div class="col-sm-10 col-sm-offset-1" style="text-align: center;">
                    <!-- pulling a static image for now -->
                    <img src="images/placeholder.png" class="img-responsive" id="imgView" runat="server" />   
                    <p id="imgContent">
                        <b>Front Row: </b> Name Name Name Name Name Name<br />
                        <b>Second Row: </b> Name Name Name Name Name Name<br />
                        <b>Back Row: </b> Name Name Name Name Name Name<br />
                        <b>Missing: </b> Name Name Name Name Name Name<br />
                    </p>
                </div>
            </div>
        </div>
    </section>
    <!--// END Sponsor information -->

</asp:Content>