<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="new_index" %>

<asp:Content ID="headCon" ContentPlaceHolderID="headBox" Runat="Server">

</asp:Content>

<asp:Content ID="bodyCon" ContentPlaceHolderID="bodyBox" Runat="Server">

    <div class="container">

        <div class="row center">
            <div class="col-sm-12 center">
                <h4>Please enter your username and password to continue...</h4>
                <br /><br />
            </div>
        </div>

        <form id="loginForm" runat="server">
            <div class="row center">
                <div class="col-sm-12 ">
                     <table style="margin:auto;">
                        <tr>
                            <td><b>Username:</b></td>
                            <td><input id="txtUsername" type="text" maxlength="20" class="textboxes" runat="server" /></td>
                        </tr>
                        <tr>
                            <td><b>Password:</b></td>
                            <td><input id="txtPassword" type="password" maxlength="20" class="textboxes" runat="server" /></td>
                        </tr>
                    </table>
                </div>
            </div>

            <br/>

            <div class="row">
                <div class="col-sm-4 col-sm-offset-4 center">
                     <asp:Button id="btnSubmit" text="Submit" class="btn btn-danger" ClientIDMode="Static" runat="server" />
                </div>
            </div>

            <div class="row">
                <div class="col-sm-4 col-sm-offset-4 center">
                    <span id="lblFeedback" runat="server"></span>
                </div>
            </div>

        </form>
    </div>

</asp:Content>