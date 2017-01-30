using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class theMaster : System.Web.UI.MasterPage {
    protected void Page_Load(object sender, EventArgs e) {
        // login check and redirect needed for all pages
        /* commented out for testing
        if (Session["login"] == null) {
            Response.Redirect("login.htm");
        } else if (((WebLogin)Session["login"]).access != true) {
            Response.Redirect("login.htm");
        }
        */
    }


}
