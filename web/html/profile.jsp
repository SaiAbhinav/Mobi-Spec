<%-- 
    Document   : profile
    Created on : 29 Jul, 2018, 6:51:44 PM
    Author     : saiab
--%>

<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
 Class.forName("com.mysql.jdbc.Driver");
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobispec?" + "user=root&password=");

 Statement st = con.createStatement();
 ResultSet rs = st.executeQuery("SELECT * FROM users WHERE id='" + session.getAttribute("id") + "'");
 if (rs.next()) {
 }
%>  
<!DOCTYPE html>
<html>
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>JSP Page</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">

  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>      

  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/all.css" integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ" crossorigin="anonymous">                
  <link rel="stylesheet" type="text/css" href="../css/register.css">        

  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/bootstrap-select.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.css" />                        
  <style>
   .avatar-upload {
    position: relative;
    max-width: 205px;
    margin: 50px auto;
   }
   .avatar-upload .avatar-edit {
    position: absolute;
    right: -8px;
    z-index: 1;
    top: 175px;
   }
   .avatar-upload .avatar-edit input {
    display: none;
   }
   .avatar-upload .avatar-edit input + label {
    display: inline-block;
    width: 34px;
    height: 34px;
    margin-bottom: 0;
    border-radius: 100%;
    background: #FFFFFF;
    border: 1px solid transparent;
    box-shadow: 3px 4px 6px #888;
    cursor: pointer;
    font-weight: normal;
    transition: all 0.2s ease-in-out;
   }
   .avatar-upload .avatar-edit input + label:hover {
    background: #f1f1f1;
    border-color: #d6d6d6;
   }
   .avatar-upload .avatar-edit input + label:after { 
    font-family: 'Font Awesome 5 Free';
    content: "\f304";
    font-weight: 900;
    color: #333;
    position: absolute;
    top: 5px;
    left: 0;
    right: 0;
    text-align: center;
    margin: auto;
   }
   .avatar-upload .avatar-preview {
    width: 200px;
    height: 200px;
    position: relative;
    border-radius: 0%;
    border: 6px solid #F8F8F8;
    box-shadow: 3px 4px 6px #888;
   }
   .avatar-upload .avatar-preview > div {
    width: 100%;
    height: 100%;
    border-radius: 0%;
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
   }

  </style>
  <script>
   function checkpass() {
    var nw = document.forms["changepass"]["new_pass"].value;
    var re = document.forms["changepass"]["re_pass"].value;
    if (nw === re) {
     return true;
    } else {
     alert("Passwords Did not match");
     return false;
    }
    //alert(nw);
    return false;
   }
  </script>
 </head>
 <body>                               
  <div class="container" style="margin-top: 20px;margin-left: 197px;">
   <div class="container form">
    <div class="row">                
     <div class="col-md-4">                     
      <form  name="profileimgform" method="POST" action="../queries/updateprofileimg.jsp" enctype="multipart/form-data">                                                                                                            
       <div class="avatar-upload" style="margin-top:30px;">
        <div class="avatar-edit">
         <input type='file' id="imageUpload" name="profile_img" accept=".png, .jpg, .jpeg" />
         <label for="imageUpload"></label>
        </div>                                
        <div class="avatar-preview">
         <div id="imagePreview" style="background-image: url(../queries/profileimgcontainer.jsp?id=<%= session.getAttribute("id")%>);">
         </div>
        </div>
       </div>              
       <center>
        <div class="form-group" style="margin-top:-20px;">
         <button type="submit" style="width: 70%;">Update Profile Pic</button>
        </div>
       </center>
      </form>
      <div class="prefs" style="margin-top:-50px;">
       <legend>Preferences</legend>                            
       <%
        String[] prefs = rs.getString("preferences").split(",");
        ArrayList al = new ArrayList();
        String row = "";
        for (int i = 0; i < prefs.length; i++) {
         al.add(prefs[i]);
         Statement st2 = con.createStatement();
         ResultSet rs2 = st2.executeQuery("SELECT * FROM brands WHERE name='" + prefs[i] + "'");
         if (rs2.next()) {
         }
         row += "<tr><td><a href='brandinfo.jsp?id=" + rs2.getInt("id") + "' style='text-decoration:none;'>" + prefs[i] + "</a></td></tr>";
        }
       %>
       <form method="POST" action="../queries/updateprefs.jsp" style="margin-top:10px;">
        <select class="selectpicker form-control" multiple data-selected-text-format="count 1" data-max-options="5" name="pref">
         <%
          Statement st1 = con.createStatement();
          ResultSet rs1 = st1.executeQuery("SELECT * FROM brands");
          while (rs1.next()) {
           String model = rs1.getString("name");
           String sel = "";
           if (al.contains(model)) {
            sel = "selected";
           } else {
            sel = "";
           }
         %>
         <option value="<%= model%>" <%= sel%>><%= model%></option>
         <%
          }
         %>                                        
        </select>
        <div>
         <table class="table table-hover" width="100%"><%= row%></table>
        </div>
        <button style="margin-top:-8px;" type="submit">Update Preferences</submit>
       </form>                                                        
      </div>                        
     </div>         
     <div class="col-md-2"></div>
     <div class="col-md-6">
      <form action="../queries/updateuser.jsp" method="POST">
       <div class="container" style="padding: 20px;">
        <fieldset>
         <legend>
          User Details
          <a href="#" style="font-size:16px;margin-top:5px;" data-toggle="modal" data-target="#myModal" class="float-right">Change Password</a>
         </legend>
         <label for="email">Email Address</label>
         <input type="email" name="email" placeholder="Email Address" value="<%= rs.getString("email")%>" disabled>
         <label for="uname">User Name</label> 
         <input type="text" name="uname" placeholder="User Name" value="<%= rs.getString("username")%>" disabled>
        </fieldset>
        <br/>
        <fieldset>
         <legend>Personal Details</legend>
         <table border="0">
          <tr>
           <%
            String gender = rs.getString("gender");
            String checkmale = "", checkfemale = "";
            if (gender.equals("male")) {
             checkmale = "checked";
             checkfemale = "";
            } else if (gender.equals("female")) {
             checkmale = "";
             checkfemale = "checked";
            } else {
             checkmale = "";
             checkfemale = "";
            }
           %>
           <td style="width:50%;">
            <p style="margin-top: -25px;">Gender</p>
            <label class="radio-container">Male
             <input type="radio" name="gender" value="male" <%= checkmale%> disabled>
             <span class="radio-checkmark"></span>
            </label>
            <label class="radio-container">Female
             <input type="radio" name="gender" value="female" <%= checkfemale%> disabled>
             <span class="radio-checkmark"></span>
            </label>                                  

           </td>
           <td style="width:50%;">
            <label for="dob">Date of Birth</label>
            <input type="date" name="dob" value="<%= rs.getString("dateofbirth")%>" disabled>
           </td>
          </tr>
          <tr>
           <td colspan="2">
            <label for="address">Address</label>
            <textarea name="address" rows="3" placeholder="Address"><%= rs.getString("address")%></textarea>
           </td>
          </tr>                            
         </table>    
         <br/>
         <%
          String nation = rs.getString("nationality");
          String nationindia = "", nationother = "";
          if (nation.equals("india")) {
           nationindia = "selected";
           nationother = "";
          } else if (nation.equals("other")) {
           nationindia = "";
           nationother = "selected";
          } else {
           nationindia = "";
           nationother = "";
          }
         %>
         <label for="nation">Nationality</label>
         <select name="nation">
          <option value="" disabled>Nation</option>
          <option value="india" <%= nationindia%> >India</option>
          <option value="other" <%= nationother%> >Other</option>
         </select>                        
        </fieldset>
        <button type="submit">Update</button>                    
       </div>
      </form>
     </div>
    </div>
   </div>
  </div>
  <!-- The Modal -->
  <div class="modal fade" id="myModal">
   <div class="modal-dialog modal-sm">
    <div class="modal-content">
     <!-- Modal body -->
     <div class="modal-body">
      <div>
       <button type="button" class="close" data-dismiss="modal" style="margin-right: -120px;margin-top: -10px;">×</button>
      </div>
      <form name="changepass" onsubmit="return checkpass();" method="POST" action="../queries/changepassword.jsp">                
       <label for="current">Current Password</label>
       <input type="password" name="curr_pass" class="form-control" style="height: 40px;" pattern="[a-zA-Z0-9@#]{8,}" title="Should contain only Alphabets or numbers or @,# length 8."/>
       <label for="current">New Password</label>
       <input type="password" name="new_pass" class="form-control" style="height: 40px;" pattern="[a-zA-Z0-9@#]{8,}" title="Should contain only Alphabets or numbers or @,# length 8."/>
       <label for="current">Retype Password</label>
       <input type="password" name="re_pass" class="form-control" style="height: 40px;" pattern="[a-zA-Z0-9@#]{8,}" title="Should contain only Alphabets or numbers or @,# length 8."/>
       <input type="submit" value="Update" class="btn btn-success form-control" style="margin-top: 5px;" />
      </form>
     </div>
    </div>
   </div>
  </div>
  <script
   src="https://code.jquery.com/jquery-3.3.1.min.js"
   integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
  <script>
       function readURL(input) {
        if (input.files && input.files[0]) {
         var reader = new FileReader();
         reader.onload = function (e) {
          $('#imagePreview').css('background-image', 'url(' + e.target.result + ')');
          $('#imagePreview').hide();
          $('#imagePreview').fadeIn(650);
         }
         reader.readAsDataURL(input.files[0]);
        }
       }
       $("#imageUpload").change(function () {
        readURL(this);
       });
  </script>
 </body>
</html>
