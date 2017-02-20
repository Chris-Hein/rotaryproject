<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="solicitor.aspx.cs" Inherits="new_solicitor" %>

<asp:Content ID="headCon" ContentPlaceHolderID="headBox" Runat="Server">

</asp:Content>

<asp:Content ID="bodyCon" ContentPlaceHolderID="bodyBox" Runat="Server">

    <div class="container">
        <!-- Welcome message -->
        <div class="row">
            <h1 class="tablet-cell-center">Welcome, Rotarian!</h1>
            <h3 id="messageOutput" class="tablet-cell-center">MOTD goes here!</h3>
        </div>
        <hr />
    </div> <!-- /container -->

    <!-- Solicitor
        Needs a place to confirm visit and enter details. -->

    <div class="container">
        <div class="row tablet-cell-center">
            <div style="font-size:16px;">Sponsor to view: </div><select id="sponsorList"></select>
            <hr />
        </div> <!-- /row -->
    </div> <!-- /container -->
    
    <br/>

    <div id="sponsorInfo" class="container">
        <div class="row tablet-cell-center">
            <b><span id="lblBusName" class="name">Business Name</span></b><br/>
            <textarea id="txtBusName" MaxLength="200" class="form-control hidden"></textarea>
            <br />
            <div class="col-sm-4" style="padding:0px">
                <span id="lblBusAddress">Business Address</span>
                <textarea id="txtBusAddress" MaxLength="200" class="form-control hidden"></textarea>
            </div>
            <div class="col-sm-4" style="padding:0px">
                <span id="lblPhone">Business Phone</span>
                <textarea id="txtPhone" MaxLength="50" class="form-control hidden"></textarea>
            </div>
            <div class="col-sm-4" style="padding:0px">
                <span id="lblEmail">Business Email</span>
                <textarea id="txtEmail" MaxLength="100" class="form-control hidden"></textarea>
            </div>
        </div> <!-- /row -->
        <div class="row">
            
        </div> <!-- /row -->
        <br/>
        <div class="row tablet-cell-center">
            <span id="lblDescription" class="description">This is a description. This is a description. This is a description. This is a description. This is a description. This is a description. This is a description. This is a description. This is a description. This is a description. This is a description. This is a description. </span><br/> <!-- basic desciption -->
            <textarea id="txtDescription" MaxLength="500" class="form-control hidden" rows="4"></textarea>
        </div> <!-- /row -->
        <br/>
        <div class="row tablet-cell-center">
            <!-- additional important infomation ie special ad price, hearing impaired etc...-->
            <span id="lblNotes">These are additional notes. These are additional notes. These are additional notes. These are additional notes. These are additional notes. These are additional notes. These are additional notes. These are additional notes. These are additional notes. These are additional notes. These are additional notes. These are additional notes.</span> <br/> 
            <textarea id="txtNotes" MaxLength="500" class="form-control hidden" rows="4"></textarea>
        </div> <!-- /row -->
        <br/>

        <div id="divApply" class="row center hidden">
            <input id="btnApply" type="image" src="images/apply.svg" alt="Apply" ClientIDMode="Static" runat="server"/>
        </div>

    </div> <!-- /sponsorInfo -->

    <br/><br/>

    <div id="divSelection" class="container">
        <div class="row center">
            <div class="col-sm-4">
                <h4>Select the ad size that the sponsor has asked for before hitting the agreed button.</h4>
                <div style="font-size:16px;">Ad Size: </div>
                <select id="sizeList"></select>
            </div>
            <div class="col-sm-4">
                <h4>Do you need to edit the sponsor's details?</h4>
            </div>
            <div class="col-sm-4 center">
                <h4 class="tablet-cell-center">The sponsor has declined an ad.</h4>
            </div>
        </div> <!-- /header row -->

        <br/>

        <div class="row center">
            <div class="col-sm-4">
                <input id="btnAgreed" type="image" src="images/agreed.svg" alt="Agreed" ClientIDMode="Static" runat="server"/>
            </div>
            <div class="col-sm-4">
                <input id="btnEdit" type="image" src="images/edit.svg" alt="Edit" ClientIDMode="Static" runat="server"/>
            </div>
            <div class="col-sm-4 center">
                <input id="btnDeclined" type="image" src="images/declined.svg" alt="Declined" ClientIDMode="Static" runat="server"/>
            </div>
        </div> <!-- /edit row -->
    </div> <!-- /divSelection -->

    <!-- javascript specific to this page -->
    <script src="resources/sol.js" type="text/javascript"></script>

</asp:Content>