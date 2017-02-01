<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="new_index" %>

<asp:Content ID="headCon" ContentPlaceHolderID="headBox" Runat="Server">

</asp:Content>

<asp:Content ID="bodyCon" ContentPlaceHolderID="bodyBox" Runat="Server">

    <div class="col-sm-10 col-sm-offset-1" style="text-align: center;">
        <h4>Please enter your username and password to continue...</h4>
        <br /><br />
    </div>
    <div class="col-sm-offset-4 col-sm-4">
        <div>
            <form id="loginForm">
                <p><label class="field">Username:</label><input id="txtUserName" type="text" maxlength="20" class="textboxes" /></p>
                <p><label class="field">Password:</label><input id="txtPassword" type="password" maxlength="20" class="textboxes" /></p>
                <p><label class="field">&nbsp;</label><input id="btnSubmit" type="button" value="Submit" class="buttons" /></p>
                <div id="lblFeedback"></div>
            </form>
        </div>
    </div>

</asp:Content>