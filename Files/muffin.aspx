<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="muffin.aspx.cs" Inherits="muffin" %>

<asp:Content ID="headCon" ContentPlaceHolderID="headBox" Runat="Server">

</asp:Content>

<asp:Content ID="bodyCon" ContentPlaceHolderID="bodyBox" Runat="Server">

    <div class="container">

        <div class="row center">
            <div class="col-sm-12">
                <h4>Select a page to view and visit...</h4>
                <br /><br />
            </div>
        </div>
        
        <div class="row center">
            <div class="col-sm-3 ">
                <a href="admin.aspx" class="btn btn-danger">Admin Page</a>
            </div>
            <div class="col-sm-3 ">
                <a href="solicitor.aspx" class="btn btn-danger">Solicitor Page</a>
            </div>
            <div class="col-sm-3 ">
                <a href="photograper.aspx" class="btn btn-danger">Photograper Page</a>
            </div>
            <div class="col-sm-3 ">
                <a href="sponsor.aspx" class="btn btn-danger">Sponsor Page</a>
            </div>
        </div>
        
    </div>

</asp:Content>

