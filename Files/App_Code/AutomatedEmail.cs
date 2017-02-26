using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Data;
using System.Text;
using System.Web.UI;
using System.Net.Mail;
using System.Net;

// Class to generate and send automated messages. Intended to be called as an automatic alert when a new image is uploaded to alert the admin of the new ad prior to billing
// Can be used to generate automated messages of any kind and through any web mail service by changing the smtp and port data and editing the message contents

public class AutomatedEmail {
    // Class variables
    string messageBody; 
    string messageSubject;
    string firstName; 
    string lastName; 
    string businessName; 
    string emailFrom; 
    string emailTo; 
    string smtpServer; 
    int portNumber; 
    string mailFromPassword;

    // Requires all message and webmail data at construction
    public AutomatedEmail(string subject, string firstname, string lastname, string businessname, string emailfrom, string emailto, string smtp, int port, string password) {
        // Initialization

        // Hotmail credential info:
        // smpt server: smtp.live.com
        // port: 587

        messageSubject = subject;
        firstName = firstname;
        lastName = lastname;
        businessName = businessname;
        emailFrom = emailfrom;
        emailTo = emailto;
        smtpServer = smtp;
        portNumber = port;
        mailFromPassword = password;
    }

    // Generates the text body of the email
    public string generateMessageBody(string firstname, string lastname, string businessname) {
        messageBody = "This is an automated message to the rotary club yearbook administrator to alert you that " + firstname + " " + lastname + " of " + businessname + " has updated the image for their ad and is ready for biling to be processed";

        return messageBody;
    }

    // Sets the senders email
    public void setEmailFrom(string email) {
        emailFrom = email;
    }

    // Returns the senders email
    public string getEmailFrom() {
        return emailFrom;
    }

    // Sets the email recipient 
    public void setEmailTo(string email) {
        emailTo = email;
    }

    // Returns the email recipient
    public string getEmailTo() {
        return emailTo;
    }
    
    // Sets the smpt server address
    public void setSmtpServer(string smtp) {
        smtpServer = smtp;
    }

    // Returns the smtp server address
    public string getSmtpServer() {
        return smtpServer;
    }

    // Sets the port number
    public void setPortNumber(int port) {
        portNumber = port;
    }

    // Returns the port number
    public int getPortNumber() {
        return portNumber;
    }

    // Sets the password for the senders email account (required for authentication)
    public void setMailFromPassword(string password) {
        mailFromPassword = password;
    }

    // Returns the senders email password
    public string getMailFromPassword() {
        return mailFromPassword;
    }

    // Sets the subject for the email
    public void setSubject(string subject) {
        messageSubject = subject;
    }

    // Returns the subject for the email
    public string getSubject() {
        return messageSubject;
    }

    // Method to actually send the automated message
    public void sendAutomatedMessage() {
        //MailMessage o = new MailMessage("From", "To","Subject", "Body");
        MailMessage o = new MailMessage(emailFrom, emailTo, messageSubject, messageBody);
        //NetworkCredential netCred= new NetworkCredential("Sender Email","Sender Password");
        NetworkCredential netCred = new NetworkCredential(getEmailFrom(), getMailFromPassword());
        SmtpClient smtpobj = new SmtpClient(getSmtpServer(), getPortNumber());
        smtpobj.EnableSsl = true;
        smtpobj.Credentials = netCred;
        smtpobj.Send(o);
    }
}