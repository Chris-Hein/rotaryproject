<%@ Page Language="C#" MasterPageFile="MasterPage.master" debug="true" AutoEventWireup="true" CodeFile="photographer.aspx.cs" Inherits="new_photographer" %>

<asp:Content ID="headCon" ContentPlaceHolderID="headBox" Runat="Server">
    
</asp:Content>
<asp:Content ID="bodyCon" ContentPlaceHolderID="bodyBox" Runat="Server"> 
        
    <form runat="server">

        <div class="container">

            <h1 class="tablet-cell-center">Welcome, Photographer!</h1>
            <hr />

            <div class="row">
                <div class="col-sm-3 btn-group" data-toggle="buttons">
                    <label class="btn btn-danger active">
                        <input type="radio" name="showall" id="rdoShowall" checked ClientIDMode="Static" runat="server"> Show All
                    </label>
                    <label class="btn btn-danger">
                        <input type="radio" name="pending" id="rdoPending" ClientIDMode="Static" runat="server"> Pending
                    </label>
                    <label class="btn btn-danger">
                        <input type="radio" name="complete" id="rdoComplete" ClientIDMode="Static" runat="server"> Complete
                    </label>
                </div>
                <div class="col-sm-5">
                    <asp:DropDownList id="sponsorList" width="400" class="form-control" ClientIDMode="Static" runat="server"/>
                </div>
                <div class="col-sm-4">
                    <asp:Button id="btnLogout" text="Logout" class="btn btn-danger pull-right" ClientIDMode="Static" runat="server"/>
                </div>
            </div> <!-- top bar -->

            <hr />

            <div class="row col-sm-12">
                <h3 id="lblSponsor" ClientIDMode="Static" runat="server">Sponsor Info:</h3>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <div class="editContent" id="editContent">
                        <p id="content">
                            <b>Contact: </b><span id="lblContact" ClientIDMode="Static" runat="server">John Smith</span><br />
                            <b>Address: </b><span id="lblAddress" ClientIDMode="Static" runat="server">123 Fake Street</span><br/>
                            <b>Phone: </b><span id="lblPhone" ClientIDMode="Static" runat="server">902-555-1234</span><br/>
                            <b>Email: </b><span id="lblEmail" ClientIDMode="Static" runat="server">johnsmith@email.com</span><br />
                            <b>Notes: </b><span id="lblNotes" ClientIDMode="Static" runat="server">Notes</span><br/>
                        </p>
                    </div>
                </div>

                <div class="col-md-8">
                    <div class="form-group">
                        <textarea class="form-control" rows="3" id="txtMessage" placeholder="Write email message to the selected client here..."></textarea>
                    </div>
                    <label id="lblFeedback" class="center" ClientIDMode="static" runat="server"></label>
                    <asp:Button id="btnSend" text="Send Email" class="btn btn-danger pull-right" ClientIDMode="Static" runat="server"/>
                </div>

            </div><!-- // row -->
        </div><!-- // top container --> 

        <div class="container">
            <hr />
        </div>

        <div class="container">

            <div class="row">

                <div class="col-sm-5" style="text-align: center;">
                    <!-- pulling a static image for now -->
                    <img src="images/placeholder.png" class="img-responsive" id="imgView" ClientIDMode="static" runat="server" />
                    
                </div>

                <div class="col-sm-7">
                    <div class="row">

                        <table style="margin:auto;">
                            <tr>
                                <td><b>Image File to Upload (this can be blank if you are just updating the fields below): </b></td>
                                <td>&nbsp;&nbsp;</td>
                                <td><input id="fileUpload" type="file" ClientIDMode="static" runat="server" /></td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <div class="row">
                        <table style="margin:auto;">
                            <tr>
                                <td><b>People in the Front Row: </b></td>
                                <td>&nbsp;&nbsp;</td>
                                <td><input id="txtFrontRow" type="text" size="75" maxlength="400" ClientIDMode="static" runat="server" /></td>
                            </tr>
                            <tr>
                                <td><b>People in the Middle Row: </b></td>
                                <td>&nbsp;&nbsp;</td>
                                <td><input id="txtMiddleRow" type="text" size="75" maxlength="400" ClientIDMode="static" runat="server" /></td>
                            </tr>
                            <tr>
                                <td><b>People in the Back Row: </b></td>
                                <td>&nbsp;&nbsp;</td>
                                <td><input id="txtBackRow" type="text" size="75" maxlength="400" ClientIDMode="static" runat="server" /></td>
                            </tr>
                            <tr>
                                <td><b>People who are missing: </b></td>
                                <td>&nbsp;&nbsp;</td>
                                <td><input id="txtMissing" type="text" size="75" maxlength="400" ClientIDMode="static" runat="server" /></td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <div class="row center">
                        <asp:Button id="btnSubmit" text="Submit database entry" class="btn btn-danger" ClientIDMode="Static" runat="server"/>
                    </div>
                </div> <!-- /column -->

            </div> <!-- /outer row -->

        </div> <!-- /end container -->
    </form>

    <script src="resources/photo.js" type="text/javascript"></script>

</asp:Content>