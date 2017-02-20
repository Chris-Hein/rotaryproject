using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

public partial class new_sponsor : System.Web.UI.Page {

    // regex variable - sanitizing inputs
    private Regex regexBusName;
    private Regex regexAddress;
    private Regex regexPhone;
    // email has it's own function below
    private Regex regexName;

    // ---------------------------------------------------------------- initial startup

    protected override void OnInit(EventArgs e) {
        Load += new EventHandler(Page_Load);
        //base.OnInit(e);
    }

    protected void Page_Load(object sender, EventArgs e) {

        // maintain page position after hitting edit and apply buttons
        Page.MaintainScrollPositionOnPostBack = true;

        // build regex objects for input validation
        regexBusName = new Regex("^[\\w\\W\\'][\\w\\W\\s\\'\\-]+$");
        regexAddress = new Regex("^[\\w\\W][\\w\\W\\s\\'\\-]+$");
        // http://stackoverflow.com/questions/123559/a-comprehensive-regex-for-phone-number-validation
        regexPhone = new Regex("^(?:(?:\\+?1\\s*(?:[.-]\\s*)?)?(?:\\(\\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\\s*\\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\\s*(?:[.-]\\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\\s*(?:[.-]\\s*)?([0-9]{4})(?:\\s*(?:#|x\\.?|ext\\.?|extension)\\s*(\\d+))?$");
        regexName = new Regex("^[A-Z\\'][a-zA-Z\\s\\'\\-\\,\\.]+$");

        // hide and disable elements that aren't meant to be displayed until edit is click
        hideEdit();
        divApprove.Visible = false;
        divDenied.Visible = false;

        // populate labels with data from database
        

        // event listeners
        btnEdit.ServerClick += new ImageClickEventHandler(btnEdit_Click);
        btnApply.ServerClick += new ImageClickEventHandler(btnApply_Click);
        btnAccept.ServerClick += new ImageClickEventHandler(btnApprove_Click);
        btnDeny.ServerClick += new ImageClickEventHandler(btnDeny_Click);

    }

    // ---------------------------------------------------------------- private functions

    private bool validEmail(string email) {
        // try to build the string as a valid email; returns true if valid
        try {
            System.Net.Mail.MailAddress m = new System.Net.Mail.MailAddress(email);
            return true;
        } catch (FormatException) {
            return false;
        }
    }

    private void hideEdit() {

        // display labels
        lblBusName.Visible = true;
        lblBusAddress.Visible = true;
        lblPhone.Visible = true;
        lblEmail.Visible = true;
        divSize.Visible = true;

        lblFrontRow.Visible = true;
        lblMiddleRow.Visible = true;
        lblBackRow.Visible = true;
        lblMissing.Visible = true;

        // display and enable approve, edit and deny buttons
        divButtons.Visible = true;

        // hide and disable elements 
        txtBusName.Visible = false;
        txtBusAddress.Visible = false;
        txtPhone.Visible = false;
        txtEmail.Visible = false;
        divSize.Visible = false;

        txtFrontRow.Visible = false;
        txtMiddleRow.Visible = false;
        txtBackRow.Visible = false;
        txtMissing.Visible = false;

        // hide and disable apply button
        divApply.Visible = false;

    }

    private void showEdit() {

        // hide and disable labels
        lblBusName.Visible = false;
        lblBusAddress.Visible = false;
        lblPhone.Visible = false;
        lblEmail.Visible = false;
        divSize.Visible = false;

        lblFrontRow.Visible = false;
        lblMiddleRow.Visible = false;
        lblBackRow.Visible = false;
        lblMissing.Visible = false;

        // hide approve, edit and deny buttons
        divButtons.Visible = false;

        // display and enable elements 
        txtBusName.Visible = true;
        txtBusAddress.Visible = true;
        txtPhone.Visible = true;
        txtEmail.Visible = true;

        txtFrontRow.Visible = true;
        txtMiddleRow.Visible = true;
        txtBackRow.Visible = true;
        txtMissing.Visible = true;

        // display and enable apply button
        divApply.Visible = true;

        // place label info in textbox - should be safe since we sanitize any input from the user
        txtBusName.Text = lblBusName.InnerText;
        txtBusAddress.Text = lblBusAddress.InnerText;
        txtPhone.Text = lblPhone.InnerText;
        txtEmail.Text = lblEmail.InnerText;

        txtFrontRow.Text = lblFrontRow.InnerText;
        txtMiddleRow.Text = lblMiddleRow.InnerText;
        txtBackRow.Text = lblBackRow.InnerText;
        txtMissing.Text = lblMissing.InnerText;

    }

    // ---------------------------------------------------------------- event handlers

    private void btnEdit_Click(object sender, EventArgs e) {

        // switch to edit mode
        showEdit();

    }

    private void btnApply_Click(object sender, EventArgs e) {

        /*
        bool good = true;

        // regex check
        if (!regexBusName.IsMatch(txtBusName.Text)) { good = false; }
        if (!regexAddress.IsMatch(txtBusAddress.Text)) { good = false; }
        if (!regexPhone.IsMatch(txtPhone.Text)) { good = false; }
        if (!validEmail(txtEmail.Text)) { good = false; }
        if (!regexName.IsMatch(txtFrontRow.Text)) { good = false; }
        if (!regexName.IsMatch(txtMiddleRow.Text)) { good = false; }
        if (!regexName.IsMatch(txtBackRow.Text)) { good = false; }
        if (!regexName.IsMatch(txtMissing.Text)) { good = false; }
        
        if (good) {
            // update and display all labels with the new text
            lblBusName.InnerText = txtBusName.Text;
            lblBusAddress.InnerText = txtBusAddress.Text;
            lblPhone.InnerText = txtPhone.Text;
            lblEmail.InnerText = txtEmail.Text;

            lblFrontRow.InnerText = txtFrontRow.Text;
            lblMiddleRow.InnerText = txtMiddleRow.Text;
            lblBackRow.InnerText = txtBackRow.Text;
            lblMissing.InnerText = txtMissing.Text;

            // back to approval mode
            hideEdit();
        } else {
            // regex check failed

        }
        */
        // WARNING - NOT SANITIZED
        // update and display all labels with the new text
        lblBusName.InnerText = txtBusName.Text;
        lblBusAddress.InnerText = txtBusAddress.Text;
        lblPhone.InnerText = txtPhone.Text;
        lblEmail.InnerText = txtEmail.Text;

        lblFrontRow.InnerText = txtFrontRow.Text;
        lblMiddleRow.InnerText = txtMiddleRow.Text;
        lblBackRow.InnerText = txtBackRow.Text;
        lblMissing.InnerText = txtMissing.Text;

        // back to approval mode
        hideEdit();

    }

    private void btnApprove_Click(object sender, EventArgs e) {

        // hide and disable everything
        sponsorForm.Visible = false;

        // show confirmation of approval
        divApprove.Visible = true;

        // send data off

    }

    private void btnDeny_Click(object sender, EventArgs e) {

        // hide and disable everything
        sponsorForm.Visible = false;

        // show confirmation of denial
        divDenied.Visible = true;

        // send data off

    }
}