<%-- 
    Document   : admindetails
    Created on : 2 Sep, 2018, 2:24:34 PM
    Author     : saiab
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="xmlqueries.getUsers"%>
<%@page import="xmlqueries.getBrands"%>
<%@page import="xmlqueries.getReviews"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>      

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/all.css" integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ" crossorigin="anonymous">                
    </head>
    <body>
        <div class="container">
            <center>
            <div class="row" style="margin-top:10px;">
                <div class="col-md-4">
                    <div class="btn-group">
                        <form method="POST" action="../getUsers">
                            <input type="hidden" name="ttr" value="users" />
                            <button type="submit" class="btn btn-warning form-control">Users <i class="fas fa-download"></i></button>
                        </form>
                        <button type="button" class="btn btn-primary form-control" onclick="showUsers()">Users <i class="fas fa-clipboard-list"></i></button> 
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="btn-group">
                        <form method="POST" action="../getBrands">
                            <input type="hidden" name="ttr" value="brands" />
                            <button type="submit" class="btn btn-warning form-control">Brands <i class="fas fa-download"></i></button>
                        </form>
                        <button type="button" class="btn btn-primary form-control" onclick="showBrands()">Brands <i class="fas fa-clipboard-list"></i></button> 
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="btn-group">
                        <form method="POST" action="../getReviews">
                            <input type="hidden" name="ttr" value="reviews" />
                            <button type="submit" class="btn btn-warning form-control">Reviews <i class="fas fa-download"></i></button>
                        </form>
                        <button type="button" class="btn btn-primary form-control" onclick="showReviews()">Reviews <i class="fas fa-clipboard-list"></i></button> 
                    </div>
                </div>
            </div> 
            </center>
        </div>
        <script>
            function showUsers() {
                parent.frames['detailsFrame'].location.href = "users/userdata.html";
            }
            function showBrands() {
                parent.frames['detailsFrame'].location.href = "brands/brandsdata.html";
            }
            function showReviews() {
                parent.frames['detailsFrame'].location.href = "reviews/reviewsdata.html";
            }
        </script>
    </body>
</html>
