<%-- 
    Document   : navBar
    Created on : 25 Jun, 2018, 9:49:04 AM
    Author     : saiab
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="author" content="abhinav">
        <title>JSP Page</title>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>      

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/all.css" integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ" crossorigin="anonymous">        

        <link rel="stylesheet" type="text/css" href="../css/navBar.css">
    </head>
    <body>
     <div class="container">
      <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
       <a class="navbar-brand" href="home.jsp" target="myFrame">MOBI SPEC</a>
       <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
       </button>
       <div id="navbarNavDropdown" class="navbar-collapse collapse">
        <ul class="navbar-nav mr-auto">
         <li class="nav-item">
          <a class="nav-link" href="aboutUs.jsp" target="myFrame"><i class="fas fa-info-circle"></i></a>
         </li>                          
         <%
          if (session.getAttribute("id") != null) {
           String id = session.getAttribute("id").toString();
           if (id.equals("1")) {
         %>
         <li class="nav-item" style="margin-top:-3px;">
          <a class="nav-link" href="../admin/admindetails.jsp" target="myFrame">List Details</a>
         </li>
         <%
           }
          }
         %>
        </ul>
        <ul class="navbar-nav">
         <li class="nav-item" style="margin-top:-3px;">
          <a class="nav-link" href="compare.jsp" target="myFrame"><i class="fas fa-mobile-alt"></i></a>
         </li>
         <li class="nav-item" style="margin-top:5px;margin-left:-20px;">
          <a class="nav-link" href="compare.jsp" target="myFrame"><i class="fas fa-mobile-alt"></i></a>
         </li>
         <li>                        
          <form method="POST" action="../queries/search.jsp">
           <div class="input-group" style="margin-top:2%;">
            <input type="text" name="searchText" class="form-control" pattern="([a-zA-Z0-9 ]+)" placeholder="Search" aria-label="Search" aria-describedby="Search">
            <div class="input-group-append">
             <button id="search" class="btn btn-outline-default bg-light" type="submit"><i class="fas fa-search" style="font-size:16px;color:inherit;"></i></button>
            </div>
           </div>                                
          </form>
         </li>
         <li class="nav-item">
          <a class="nav-link" href="#"><i class="fab fa-reddit-alien"></i></a>
         </li>
         <li class="nav-item">
          <a class="nav-link" href="#"><i class="fab fa-twitter"></i></a>
         </li>
         <li class="nav-item">
          <a class="nav-link" href="#"><i class="fab fa-facebook-f"></i></a>
         </li>                            
         <%
          if (session.getAttribute("id") == null) {
         %>
         <li class="nav-item no-login">
          <a class="nav-link" href="register.jsp" target="myFrame"><i class="fas fa-user-plus"></i></a>
         </li>
         <li class="nav-item no-login">
          <a class="nav-link" href="login.jsp" target="myFrame"><i class="fas fa-sign-in-alt"></i></a>
         </li>                       
         <%
         } else {
         %>
         <li class="nav-item login">
          <a class="nav-link" href="profile.jsp" target="myFrame"><i class="fas fa-user"></i></a>
         </li>
         <li class="nav-item login">
          <a class="nav-link" href="../queries/logout.jsp" target="myFrame"><i class="fas fa-sign-out-alt"></i></a>
         </li>
         <%
          }
         %>
        </ul>
       </div>
      </nav>
      <span id="msg" style="display: none;">${user}</span>
     </div>         
    </body>
    <script>
        $(document).ready(function () {
            $("#search").click(function () {
                document.getElementById("search").innerHTML = "<img src='../assests/images/loader.gif' width='18'>";
            });
        });
    </script>
</html>

