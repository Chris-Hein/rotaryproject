
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="photograper.aspx.cs" Inherits="new_photograper" %>

<html>
<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <title>Photographer</title>
</head>
<body>
<!-- // END Search bar -->

<!-- Sponsor information -->
    <section class="content-block">
        <div class="container">
            <div class="row">

                <div class="col-md-6 pull-left">
                    <div class="editContent">
                        <h2>About the Sponsor</h2>
                    </div>
                    <div class="editContent">
                        <p id="info"></p>
                    </div>
                    <!-- IMAGE -->
                    <img class="img-responsive map-img" src="">
                </div>

                <div class="col-md-6 pull-left">
                    <fieldset>
                        <form role="form">
                            <div class="form-group">
                                <label for="inputName">Name</label>
                                <input type="text" class="form-control" id="txtBusiness" placeholder="Sponsor name">
                            </div>
                            <div class="form-group">
                                <label for="inputEmail">Email</label>
                                <input type="email" class="form-control" id="txtEmail" placeholder="Sponsor email">
                            </div>
                            <div class="form-group">
                                <label for="textArea">Message</label>
                                <textarea class="form-control" rows="3" id="txtMessage" placeholder="Message . . ."></textarea>
                                <div class="editContent">
                                </div>
                            </div>

                            <a href="#" class="btn btn-primary">Send Email</a>

                        </form>
                    </fieldset>
                </div>

            </div><!-- // row -->
        </div><!-- // container -->

    </section>
    <!--// END Sponsor information -->




    </body>
</html>