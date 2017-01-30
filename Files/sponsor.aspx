<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="false" CodeFile="sponsor.aspx.cs" Inherits="new_sponsor" %>

<asp:Content ID="headCon" ContentPlaceHolderID="headBox" Runat="Server">

</asp:Content>

<asp:Content ID="bodyCon" ContentPlaceHolderID="bodyBox" Runat="Server">

    <!-- form to fill out -->
    <div class="row">
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
			    <div id="divNote" class="form-group col-sm-offset-1 col-sm-10" style="margin-bottom: 20px;" runat="server">
			        <b>Note:</b> The text below will be printed. You can edit the text by clicking the edit button, making changes and then clicking the apply button. Please make any required corrections before approving. When you click confirm your changes will be saved immediately and you may close this window.
			    </div>

                <!-- basic info -->
                <div class="form-group col-sm-offset-1 col-sm-10" style="margin-bottom: 20px;">
                    <br/>
                    <b>Business name to display: <span id="lblBusName" runat="server">Testing Inc.</span></b>
                    <asp:TextBox ID="txtBusName" MaxLength="200" class="form-control" runat="server" />
                    <br/>
                    <b>Business address to display: <span id="lblBusAddress" runat="server">123 Fake Street</span></b>
                    <asp:TextBox ID="txtBusAddress" MaxLength="200" class="form-control" runat="server" />
                    <br/>
                    <b>Phone # to display: <span id="lblPhone" runat="server">902-555-1234</span></b>
                    <asp:TextBox ID="txtPhone" MaxLength="50" class="form-control" runat="server" />
                    <br/>
                    <b>Email to display: <span id="lblEmail" runat="server">noemail@noemail.com</span></b>
                    <asp:TextBox ID="txtEmail" MaxLength="100" class="form-control" runat="server" />
                    <br/>
                    <div id="divSize" runat="server">
                        <b>Page size of ad purchased: <span id="lblSize" runat="server">2 Billion by 0.3</span></b>
                    </div>
                </div>

                <!-- names -->
                <div class="form-group col-sm-offset-1 col-sm-10" style="margin-bottom: 20px;">
                    <div style="text-align: left;">
                        <b>(Optional) Names of people in front row: <span id="lblFrontRow" runat="server">Question Block, Diamond Block</span></b>
                        <asp:TextBox ID="txtFrontRow" MaxLength="300" class="form-control" TextMode="MultiLine" runat="server" />
                    </div>
                    <div style="text-align: left;">
                        <b>(Optional) Names of people in middle row: <span id="lblMiddleRow" runat="server">No One</span></b>
                        <asp:TextBox ID="txtMiddleRow" MaxLength="300" class="form-control" TextMode="MultiLine" runat="server" />
                    </div>
                    <div style="text-align: left;">
                        <b>(Optional) Names of people in back row: <span id="lblBackRow" runat="server">Red Clip</span></b>
                        <asp:TextBox ID="txtBackRow" MaxLength="300" class="form-control" TextMode="MultiLine" runat="server" />
                    </div>
                    <div style="text-align: left;">
                        <b>(Optional) Names of people missing from photo: <span id="lblMissing" runat="server">Blue Clip</span></b>
                        <asp:TextBox ID="txtMissing" MaxLength="300" class="form-control" TextMode="MultiLine" runat="server" />
                    </div>
                </div>

                <!-- apply button -->
                <span id="divApply" runat="server">
                    <div class="form-group alert alert-warning col-sm-offset-5 col-sm-2" style="text-align: center;">
                        <asp:Button ID="btnApply" Text="Apply" runat="server" />
                    </div>
                </span>

            </div> <!-- end of row -->

            <!-- approve, edit and deny buttons -->
            <div id="divButtons" runat="server">
                <div class="row col-sm-offset-3 col-sm-2" style="margin-top: 20px;">
                    <div class="alert alert-success" style="text-align: center;">
                        <asp:Button ID="btnApprove" Text="Approve" CssClass="button-inline" GroupName="ApproveGroup" runat="server" />
                    </div>
                </div>
			    <div class="row col-sm-2" style="margin-top: 20px;">
                    <div class="alert alert-warning" style="text-align: center;">
                        <asp:Button ID="btnEdit" Text="Edit these details" CssClass="button-inline" GroupName="ApproveGroup" runat="server" />
                    </div>
                </div>
                <div class="row col-sm-2" style="margin-top: 20px;">
                    <div class="alert alert-danger" style="text-align: center;">
                        <asp:Button ID="btnDeny" Text="Deny, please contact me" CssClass="button-inline" GroupName="ApproveGroup" runat="server" />
                    </div>
                </div>
            </div>

        </form>
    </div>

    <!-- approved page -->
    <div id="divApprove" runat="server">
        <div class="form-group col-sm-offset-1 col-sm-10" style="margin-bottom: 20px;" runat="server">
			<h1>Thank you.</h1>
            Your ad details have been processed. You may close this window.
		</div>
    </div>

    <!-- denied page -->
    <div id="divDenied" class="form-group col-sm-offset-1 col-sm-10" style="margin-bottom: 20px;" runat="server">
		<h1>We're Sorry</h1>
        We will be contacting you shortly to clarify your details.
    </div>

</asp:Content>