<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="false" CodeFile="sponsor.aspx.cs" Inherits="new_sponsor" %>

<asp:Content ID="headCon" ContentPlaceHolderID="headBox" Runat="Server">

</asp:Content>

<asp:Content ID="bodyCon" ContentPlaceHolderID="bodyBox" Runat="Server">

    <!-- loading overlay -->
    <div id="loadingOverlay"></div>

    <!-- form to fill out -->
    <div class="container">
        <form id="sponsorForm" runat="server">

            <div class="row center">
                <asp:Button id="btnLogout" text="Logout" class="btn btn-danger" ClientIDMode="Static" runat="server"/>
            </div>
            <br />

            <!-- photo area -->
            <div class="row">
                <div class="row" style="margin-bottom: 20px;">
                    <div class="col-sm-10 col-sm-offset-1 center">
                        <!-- pulling a static image for now -->
                        <img id="imgView" style="margin:auto" src="images/photo/test.jpg" class="img-responsive center" ClientIDMode="Static" runat="server" />
                    </div>
                </div>
            </div>

            <!-- note -->
            <div class="row">
			    <div id="divNote" class="form-group" style="margin-bottom: 20px;" runat="server">
			        <b>Note:</b> The text below will be printed. You can edit the text by clicking the edit button, making changes and then clicking the apply button. Please make any required corrections before approving. When you click confirm your changes will be saved immediately and you may close this window.
			    </div>
            </div> <!-- /row -->

            <div class="row">
                <div class="col-sm-4 col-sm-offset-4 center">
                    <span id="lblFeedback"></span>
                </div>
            </div>

            <!-- basic info -->
            <div class="row">
                <b>Business name to display: </b><span id="lblBusName" ClientIDMode="Static" runat="server">Testing Inc.</span>
            </div>
            <div class="row">
                <b>Business address to display: </b><span id="lblBusAddress" ClientIDMode="Static" runat="server">123 Fake Street</span>
                <asp:TextBox id="txtBusAddress" ClientIDMode="Static" MaxLength="200" class="form-control" runat="server" />
            </div>
            <div class="row">
                <b>Phone # to display: </b><span id="lblPhone" ClientIDMode="Static" runat="server">902-555-1234</span>
                <asp:TextBox id="txtPhone" ClientIDMode="Static" MaxLength="50" class="form-control" runat="server" />
            </div>
            <div class="row">
                <b>Email to display: </b><span id="lblEmail" ClientIDMode="Static" runat="server">noemail@noemail.com</span>
                <asp:TextBox id="txtEmail" ClientIDMode="Static" MaxLength="100" class="form-control" runat="server" />
            </div>
            <div class="row">
                <div id="divSize" ClientIDMode="Static" runat="server">
                    <b>Page size of ad purchased: </b><span id="lblSize" runat="server">2 Billion by 0.3</span>
                </div>
            </div> <!-- /basic info -->

            <br />

            <!-- names -->
            <div class="row">
                <b>(Optional) Names of people in front row: </b><span id="lblFrontRow" ClientIDMode="Static" runat="server">Question Block, Diamond Block</span>
                <asp:TextBox ID="txtFrontRow" ClientIDMode="Static" MaxLength="300" class="form-control" TextMode="MultiLine" runat="server" />
            </div>
            <div class="row">
                <b>(Optional) Names of people in middle row: </b><span id="lblMiddleRow" ClientIDMode="Static" runat="server">No One</span>
                <asp:TextBox ID="txtMiddleRow" ClientIDMode="Static" MaxLength="300" class="form-control" TextMode="MultiLine" runat="server" />
            </div>
            <div class="row">
                <b>(Optional) Names of people in back row: </b><span id="lblBackRow" ClientIDMode="Static" runat="server">Red Clip</span>
                <asp:TextBox ID="txtBackRow" ClientIDMode="Static" MaxLength="300" class="form-control" TextMode="MultiLine" runat="server" />
            </div>
            <div class="row">
                <b>(Optional) Names of people missing from photo: </b><span id="lblMissing" ClientIDMode="Static" runat="server">Blue Clip</span>
                <asp:TextBox ID="txtMissing" ClientIDMode="Static" MaxLength="300" class="form-control" TextMode="MultiLine" runat="server" />
            </div>
            <br />
            <!-- apply button -->
            <div id="divApply" class="row" ClientIDMode="Static" runat="server">
                <div class="form-group col-sm-offset-5 col-sm-2" style="text-align: center;">
                    <input id="btnApply" type="button" value="Apply" class="btn btn-warning"/>
                </div>
            </div>

            <!-- approve, edit and deny buttons -->
            <div id="divButtons" class="row center" ClientIDMode="Static" runat="server">

                <!-- accept -->
                <div class="col-sm-4">
                    <div class="row">
                        <span>The ad is acceptable. Please click the button below to accept the ad.</span>
                    </div>
                    <div class="row">
                        <asp:Button id="btnAccept" text="Accept" class="btn btn-success" ClientIDMode="Static" runat="server"/>
                    </div>
                </div> <!-- /accept -->

                <!-- pending -->
                <div class="col-sm-4">
                    <div class="row">
                        <span class="tablet-cell-center">Some minor detail (person's name in the photo, phone number to display, etc...) is wrong. Please click the button below to edit these details.</span>
                    </div>
                    <div class="row">
                        <input id="btnEdit" type="button" value="Edit Minor Details" class="btn btn-warning"/>
                    </div>
                </div> <!-- /pending -->

                <!-- declined -->
                <div class="col-sm-4 center">
                    <div class="row">
                        <span class="tablet-cell-center">There is a major issue with the ad. Please write what we can do to fix it in the box provided below and then click the button.</span>
                    </div>
                    <div class="row" style="margin-top:5px;margin-bottom:5px;">
                        <textarea id="txtDecline" ClientIDMode="Static" MaxLength="600" class="form-control" TextMode="MultiLine" runat="server"></textarea>
                    </div>
                    <div class="row">
                        <asp:Button id="btnDecline" text="Something's Wrong" class="btn btn-danger" ClientIDMode="Static" runat="server"/>
                    </div>
                </div> <!-- /declined -->

            </div> <!-- /divButtons -->

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
    <script type="text/javascript" src="resources/spin.min.js"></script>
    <script type="text/javascript" src="resources/spon.js" ></script>

</asp:Content>