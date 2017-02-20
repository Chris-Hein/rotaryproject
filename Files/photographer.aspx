<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="photographer.aspx.cs" Inherits="new_photographer" %>

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
                        <input id="txtSearch" runat="server" class="form-control" placeholder="Search by Business Name" type="text"/>
                        <div class="input-group-btn">
                            <button id="btnSearch" class="btn btn-default" type="submit" runat="server"><i class="glyphicon glyphicon-search"></i></button>
                        </div>
                    </div>
                </form>
            </div><!-- END SEARCH BAR -->

            <div class="row">
                <div class="col-md-4">
                    <h3>Sponsor Info:</h3>
                </div>
                <!--
                <div class="col-md-8">
                    <label for="textArea">Message</label>
                </div> 
                -->
            </div>

            <div class="row">
                <div class="col-md-4">
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

                <div class="col-md-8">
                    <!-- MESSAGE BOX -->
                    <form role="form">                           
                        <div class="form-group">
                            <textarea class="form-control" rows="3" id="txtMessage" placeholder="Email Message. . . "></textarea>                                
                        </div>
                        <input id="btnSend" type="image" src="images/sendemail.svg" alt="Send Email" ClientIDMode="Static" runat="server" value="Send Email"/>                        
                    </form>
                </div>

            </div><!-- // row -->
        </div><!-- // container -->

        <br />

        <div class="container">
            <div class="row">                
                <div class="col-sm-10 col-sm-offset-1" style="text-align: center;">
                    <!-- pulling a static image for now -->
                    <img src="images/placeholder.png" class="img-responsive" id="imgView" runat="server" />
                    <br />   
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