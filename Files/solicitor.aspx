<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="solicitor.aspx.cs" Inherits="new_solicitor" %>

<asp:Content ID="headCon" ContentPlaceHolderID="headBox" Runat="Server">

</asp:Content>

<asp:Content ID="bodyCon" ContentPlaceHolderID="bodyBox" Runat="Server">

    <form runat="server">
        <div class="container">
            <!-- Welcome message -->
            <div class="row">
                <h1 class="tablet-cell-center">Welcome, Rotarian!</h1>
                <hr />
            </div>
        </div> <!-- /container -->

        <!-- Solicitor
            Needs a place to confirm visit and enter details. -->

        <div class="container"> <!-- dropdown and feedback bar -->
            <div class="row tablet-cell-center">
                <div class="col-sm-6">
                    <span style="font-size:16px;">Select the Sponsor to view: </span><asp:DropDownList id="sponsorList" ClientIDMode="static" runat="server"/>
                </div>
                <div class="col-sm-6">
                    <label id="lblFeedback" class="pull-right" ClientIDMode="static" runat="server"></label>
                </div>
                <hr />
            </div> <!-- /row -->
        </div> <!-- /container -->
    
        <div id="sponsorInfo" class="container">
            <div class="row tablet-cell-center">
                <h2 id="lblSponsor">Sponsor</h2><br/>
                <br />
                <div><b>Contact Name</b></div>
                <span id="lblContact">Contact Name</span><br/>
                <br />
                <div class="col-sm-4" style="padding:0px">
                    <div><b>Sponsor Address</b></div>
                    <span id="lblAddress">Sponsor Address</span>
                </div>
                <div class="col-sm-4" style="padding:0px">
                    <div><b>Sponsor Phone Number</b></div>
                    <span id="lblPhone">Sponsor Phone</span>
                </div>
                <div class="col-sm-4" style="padding:0px">
                    <div><b>Sponsor Email</b></div>
                    <span id="lblEmail">Sponsor Email</span>
                </div>
            </div> <!-- /row -->
            <div class="row">
            
            </div> <!-- /row -->
            <br/>
            <div class="row tablet-cell-center">
                <!-- additional important infomation ie special ad price, hearing impaired, alligator moat, etc...-->
                <div id="lblNotes">
                    These are additional notes. These are additional notes. These are additional notes. These are additional notes. These are additional notes. These are additional notes. These are additional notes. These are additional notes. These are additional notes. These are additional notes. These are additional notes. These are additional notes.
                </div> 
                <hr/>
            </div> <!-- /row -->
        </div> <!-- /sponsorInfo -->

        <div id="divSelection" class="container">
            <div class="row center">

                <div class="col-sm-4"> <!-- agree -->
                    <div class="row">
                        <h4>The Sponsor has agreed to an ad. Select the appropriate ad size and price.</h4>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <asp:Button id="btnAgreed" text="Agreed" class="btn btn-success" ClientIDMode="Static" runat="server"/>
                        </div>
                    </div>
                    <br/>
                    <div class="row">

                        <div class="col-lg-6">
                             <table style="text-align:left;">
                                <tr>
                                    <td><b>Page Size</b></td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td><b>Price</b></td>
                                </tr>
                                <tr>
                                    <td>1/6 of a Page</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>$<span id="lblSixth" runat="server">test</span></td>
                                </tr>
                                <tr>
                                    <td>1/3 of a Page</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>$<span id="lblThird" runat="server">test</span></td>
                                </tr>
                                <tr>
                                    <td>2/3 of a Page</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>$<span id="lblTwoThirds" runat="server">test</span></td>
                                </tr>
                                <tr>
                                    <td>Full Page</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>$<span id="lblFull" runat="server">test</span></td>
                                </tr>
                            </table>
                        </div>

                        <div class="col-lg-6">
                            <div style="font-size:16px;">Ad Size: </div>
                            <select id="sizeList" ClientIDMode="Static" runat="server">
                                <option value="0" selected="selected">Select a size...</option>
                                <option value="1">1/6 page</option> 
                                <option value="2">1/3 page</option> 
                                <option value="3">2/3 page</option> 
                                <option value="4">Full Page</option> 
                                <option value="5">Special Option</option>
                            </select>
                        </div>

                    </div>
                </div> <!-- /agree -->

                <div class="col-sm-4 center"> <!-- pending -->
                    <div class="row">
                        <h4 class="tablet-cell-center">The Sponsor must wait for approval or has requested that we come back later.</h4>
                    </div>
                    <div class="row">
                        <div class="col-lg-12"></div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12 center">
                            <asp:Button id="btnPending" text="Pending" class="btn btn-warning" ClientIDMode="Static" runat="server"/>
                        </div>
                    </div>
                </div> <!-- /pending -->

                <div class="col-sm-4 center"> <!-- declined -->
                    <div class="row">
                    <h4 class="tablet-cell-center">The Sponsor has declined an ad at this time.</h4>
                    </div>
                    <div class="row">
                        <div class="col-lg-12"></div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-sm-12 center">
                            <asp:Button id="btnDeclined" text="Declined" class="btn btn-danger" ClientIDMode="Static" runat="server"/>
                        </div>
                    </div>
                </div> <!-- /declined -->

            </div> <!-- /header row -->

        </div> <!-- /divSelection -->
    </form>
    <!-- javascript specific to this page -->
    <script src="resources/sol.js" type="text/javascript"></script>

</asp:Content>