<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="xmlqueries.registerwithxml"%>
<!DOCTYPE html>
<html>
 <head>
  <title>Register</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">

  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>      

  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/all.css" integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ" crossorigin="anonymous">                
  <link rel="stylesheet" type="text/css" href="../css/register.css">        

  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/bootstrap-select.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.css" />

  <script>
   function validate() {
    var email = document.forms["registrationForm"]["email"].value;
    var username = document.forms["registrationForm"]["uname"].value;
    var password = document.forms["registrationForm"]["psw"].value;
    var confirmpassword = document.forms["registrationForm"]["confpsw"].value;
    var gender = document.forms["registrationForm"]["gender"].value;
    var address = document.forms["registrationForm"]["address"].value;
    var nation = document.forms["registrationForm"]["nation"].value;

    if (email != "") {
     if (username != "") {
      if (password != "") {
       if (confirmpassword == password) {
        if (gender != "") {
         if (address != "") {
          if (nation != "") {
           alert(email + "\n" + username + "\n" + password + "\n" + confirmpassword + "\n" + gender + "\n" + age + "\n" + address + "\n" + sel + "\n" + nation);
           return true;
          } else {
           alert("select a nation");
           return false;
          }
         } else {
          alert("address cannot be empty");
          return false;
         }
        } else {
         alert("please choose a gender");
         return false;
        }
       } else {
        alert("passwords did not match");
        return false;
       }
      } else {
       alert("password cannot be empty");
       return false;
      }
     } else {
      alert("username cannot be empty");
      return false;
     }
    } else {
     alert("email cannot be empty");
     return false;
    }
   }
  </script>
 </head>
 <body>        
  <div class="container" style="width:40%;margin: 0 auto;padding: 20px;">            
   <!--<form class="form" name="registrationForm" onsubmit="return validate();" action="../queries/newuser.jsp" method="POST">-->
   <form class="form" name="registrationForm" onsubmit="return validate();" method="POST" action="../registerwithxml">
    <div class="container" style="padding: 20px;">
     <fieldset>
      <legend>User Details</legend>
      <label for="email">Email Address</label>
      <input type="email" name="email" pattern="([a-zA-Z0-9][\w.]*@(gmail|yahoo|outlook)\.com)" title="Use gmail.com | yahoo.com | outlook.com to register" placeholder="Email Address">
      <label for="uname">User Name</label> 
      <input type="text" name="uname" placeholder="User Name">
      <label for="psw">Password</label>
      <input type="password" name="psw" placeholder="Password" pattern="((?=.*[A-Z])(?=.*[!@#$&*])(?=.*[0-9])(?=.*[a-z]).{8,})" title="
             Atleast 1 uppercase letters,
             &nbsp; 1 special case letter amoung (!@#$&*),
             &nbsp; 1 digits,
             &nbsp; 1 lowercase letters,
             &nbsp; length 8.">
      <label for="confpsw">Confirm Password</label>
      <input type="password" name="confpsw" placeholder="Confirm Password" pattern="((?=.*[A-Z])(?=.*[!@#$&*])(?=.*[0-9])(?=.*[a-z]).{8,})" title="
             Atleast 1 uppercase letters,
             &nbsp; 1 special case letter amoung (!@#$&*),
             &nbsp; 1 digits,
             &nbsp; 1 lowercase letters,
             &nbsp; length 8.">
     </fieldset>
     <br/>
     <fieldset>
      <legend>Personal Details</legend>
      <table border="0">
       <tr>
        <td style="width:50%;">
         <p style="margin-top: -25px;">Gender</p>
         <label class="radio-container">Male
          <input type="radio" name="gender" value="male">
          <span class="radio-checkmark"></span>
         </label>
         <label class="radio-container">Female
          <input type="radio" name="gender" value="female">
          <span class="radio-checkmark"></span>
         </label>                                  
        </td>
        <td style="width:50%;">
         <label for="dob">Date of Birth</label>
         <input id="txtDate" type="date" name="dob" placeholder="Age">
        </td>
       </tr>
       <tr>
        <td colspan="2">
         <label for="address">Address</label>
         <textarea name="address" rows="3" placeholder="Address"></textarea>
        </td>
       </tr>
       <tr>
        <td colspan="2">
         <p>Preferences</p>
         <select class="selectpicker form-control" multiple data-selected-text-format="count 1" data-max-options="5" name="pref" required>
          <%
           Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobispec?" + "user=root&password=");

           Statement st = con.createStatement();
           ResultSet rs = st.executeQuery("SELECT * FROM brands");
           while (rs.next()) {
          %>
          <option value="<%= rs.getString("name")%>"><%= rs.getString("name")%></option>
          <%
           }
          %>
         </select>
        </td>
       </tr>
      </table>    
      <br/>
      <label for="nation">Nationality</label>
      <select name="nation">
       <option value="" disabled>Nation</option>
       <option value="india">India</option>
       <option value="other">Other</option>
      </select>                        
     </fieldset>
     <button type="submit">Register</button>                    
    </div>
   </form>
  </div>
 </body>
 <script>
  $(function () {
   var dtToday = new Date();

   var month = dtToday.getMonth() + 1;
   var day = dtToday.getDate();
   var year = dtToday.getFullYear();
   if (month < 10)
    month = '0' + month.toString();
   if (day < 10)
    day = '0' + day.toString();

   var maxDate = year + '-' + month + '-' + day;
   $('#txtDate').attr('max', maxDate);
  });
 </script>
</html>
