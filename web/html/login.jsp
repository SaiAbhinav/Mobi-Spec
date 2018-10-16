<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
  <title>Login</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">

  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>      

  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/all.css" integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ" crossorigin="anonymous">        
  <link rel="stylesheet" type="text/css" href="../css/login.css">
  <script src="../js/loginValidate.js"></script>
 </head>
 <body>


  <div class="container"> 
   <center>               
    <div class="alert alert-warning">                
     <strong>${msg} Please login to continue!</strong>
    </div>
    <table border="0" cellspacing=0 width="80%">
     <tr>
      <td width="50%"></td>
      <td width="50%">
       <form name="loginForm" method="POST" action="loginusingbean.jsp">  
        <div class="container" style="padding: 30px;">
         <label for="uname"><b>Username</b></label>
         <input type="text" placeholder="Enter Username" name="uname" required>
         <label for="psw"><b>Password</b></label>
         <input type="password" placeholder="Enter Password" name="psw" required>
         <button type="submit">Login</button>        
        </div>                            
       </form>
      </td>
     </tr>
    </table>
   </center>
  </div>
 </body>
</html>