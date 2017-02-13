<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="false" CodeFile="sponsor.aspx.cs" Inherits="new_sponsor" %>

<asp:Content ID="headCon" ContentPlaceHolderID="headBox" Runat="Server">

</asp:Content>

<asp:Content ID="bodyCon" ContentPlaceHolderID="bodyBox" Runat="Server">

    <!-- form to fill out -->
    <div class="container">
        <form id="sponsorForm" runat="server">
            <!-- photo area -->
            <div class="row">
                <div class="row" style="margin-bottom: 20px;">
                    <div class="col-sm-10 col-sm-offset-1" style="text-align: center;">
                        <!-- pulling a static image for now -->
                        <img src="images/photo/test.jpg" class="img-responsive" id="imgView" runat="server" />
                    </div>
                </div>
            </div>

            <div class="row">
			    <div id="divNote" class="form-group" style="margin-bottom: 20px;" runat="server">
			        <b>Note:</b> The text below will be printed. You can edit the text by clicking the edit button, making changes and then clicking the apply button. Please make any required corrections before approving. When you click confirm your changes will be saved immediately and you may close this window.
			    </div>
            </div> <!-- /row -->

            <div class="row">
                <!-- basic info -->
                <div class="form-group" style="margin-bottom: 20px;">
                    <br/>
                    <b>Business name to display: </b><span id="lblBusName" runat="server">Testing Inc.</span>
                    <asp:TextBox id="txtBusName" MaxLength="200" class="form-control" runat="server" />
                    <br/>
                    <b>Business address to display: </b><span id="lblBusAddress" runat="server">123 Fake Street</span>
                    <asp:TextBox id="txtBusAddress" MaxLength="200" class="form-control" runat="server" />
                    <br/>
                    <b>Phone # to display: </b><span id="lblPhone" runat="server">902-555-1234</span>
                    <asp:TextBox id="txtPhone" MaxLength="50" class="form-control" runat="server" />
                    <br/>
                    <b>Email to display: </b><span id="lblEmail" runat="server">noemail@noemail.com</span>
                    <asp:TextBox id="txtEmail" MaxLength="100" class="form-control" runat="server" />
                    <br/>
                    <div id="divSize" runat="server">
                        <b>Page size of ad purchased: </b><span id="lblSize" runat="server">2 Billion by 0.3</span>
                    </div>
                </div>

                <!-- names -->
                <div class="form-group" style="margin-bottom: 20px;">
                    <div style="text-align: left;">
                        <b>(Optional) Names of people in front row: </b><span id="lblFrontRow" runat="server">Question Block, Diamond Block</span>
                        <asp:TextBox ID="txtFrontRow" MaxLength="300" class="form-control" TextMode="MultiLine" runat="server" />
                    </div>
                    <div style="text-align: left;">
                        <b>(Optional) Names of people in middle row: </b><span id="lblMiddleRow" runat="server">No One</span>
                        <asp:TextBox ID="txtMiddleRow" MaxLength="300" class="form-control" TextMode="MultiLine" runat="server" />
                    </div>
                    <div style="text-align: left;">
                        <b>(Optional) Names of people in back row: </b><span id="lblBackRow" runat="server">Red Clip</span>
                        <asp:TextBox ID="txtBackRow" MaxLength="300" class="form-control" TextMode="MultiLine" runat="server" />
                    </div>
                    <div style="text-align: left;">
                        <b>(Optional) Names of people missing from photo: </b><span id="lblMissing" runat="server">Blue Clip</span>
                        <asp:TextBox ID="txtMissing" MaxLength="300" class="form-control" TextMode="MultiLine" runat="server" />
                    </div>
                </div>

                <!-- apply button -->
                <div id="divApply" runat="server">
                    <div class="form-group col-sm-offset-5 col-sm-2" style="text-align: center;">
                        <input id="btnApply" type="image" src="images/apply.svg" alt="Apply" ClientIDMode="Static" runat="server"/>
                    </div>
                </div>

            </div> <!-- /row -->

            <!-- approve, edit and deny buttons -->
            <div id="divButtons" class="row" runat="server">
                <div class="col-sm-offset-3 col-sm-2" style="margin-top: 20px;">
                    <div class="alert alert-success" style="text-align: center;">
                        <input id="btnAccept" type="image" src="images/accept.svg" alt="Accept" ClientIDMode="Static" runat="server"/>
                    </div>
                </div>
			    <div class="col-sm-2" style="margin-top: 20px;">
                    <div class="alert alert-warning" style="text-align: center;">
                        <input id="btnEdit" type="image" src="images/edit.svg" alt="Edit" ClientIDMode="Static" runat="server"/>
                    </div>
                </div>
                <div class="col-sm-2" style="margin-top: 20px;">
                    <div class="alert alert-danger" style="text-align: center;">
                        <input id="btnDeny" type="image" src="images/deny.svg" alt="Deny" ClientIDMode="Static" runat="server"/>
                    </div>
                </div>
            </div>

        </form>
    </div> <!-- /container -->

    <!-- approved page -->
    <div class="container">
        <div id="divApprove" class="row" style="margin-bottom:200px;" runat="server">
			<h1>Thank you.</h1>
            Your ad details have been processed. You may close this window.
        </div> <!-- /divApproved -->
    </div>

    <!-- denied page -->
    <div class="container">
        <div id="divDenied" class="row" style="margin-bottom:200px;" runat="server">
		    <h1>We're Sorry</h1>
            We will be contacting you shortly to clarify your details.
        </div> <!--/divDenied -->
    </div>

    <!-- javascript specific to this page -->
    <script src="resources/spon.js" type="text/javascript"></script>

</asp:Content>