<%-- 
    Document   : mobileinfo
    Created on : 22 Jul, 2018, 2:22:56 AM
    Author     : saiab
--%>

<%@page import="TimeAgo.TimeAgo"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%
 Class.forName("com.mysql.jdbc.Driver");
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobispec?" + "user=root&password=");
 Statement st = con.createStatement();
 ResultSet rs = st.executeQuery("SELECT * FROM mobiles WHERE id=" + request.getParameter("id"));
 String brandname = "";
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

  <style>
   table {
    margin: 3% 0% 3% 0%;
   }
   ::-webkit-scrollbar {
    display: none;
   }
   .category {
    color: #d9534f; 
    font-weight: bold; 
    width:15%;
    background-color: #F8F8F8;
   }
   .feature {
    font-weight: bold; 
    width: 20%;
   }
   .mobile {
    margin-bottom: 10px;
    padding-top: 10px;
   }
   .mobile:hover {
    box-shadow: 3px 4px 6px #555;
    border-radius: 5px;
   }
   .mobilelink {
    padding: 10px;
    margin-top: 5px;
    background-color: #eee;
    color: #000;
   }
   .mobilelink:hover {
    background-color: #5cb85c;
    color: #fff;
   }
   a:hover .mobilelink {
    background-color: #5cb85c;
    color: #fff;
   }
   .cmt {
    background-color: #eee;
    border: none;                                
   }
   .cmt:focus {
    background-color:#eee;
    box-shadow: 3px 4px 6px #aaa !important;
    outline: none;
    border: none;
   }
   textarea {
    outline: none;
    box-shadow:none !important;
    border:1px solid #ccc !important;
   }
  </style>
 </head>
 <body>
  <div class="container" style="margin-bottom: 50px;">
   <table width="100%" border="0">
    <tr>
     <td style="width:40%"><iframe src="assests/brands.jsp" name="mob_brands" width="100%" height="285px" scrolling="no" frameborder="0"></iframe></td>
     <td style="width:60%"><img src="../queries/mobiletechimgcontainer.jsp?id=<%= request.getParameter("id")%>" width="100%" height="285px" /></td>
    </tr>	
   </table>            
   <div class="row">
    <div class="col-md-3" style="margin-top:50px;">
     <%
      Statement st2 = con.createStatement();
      ResultSet rs2 = st2.executeQuery("SELECT * FROM mobiles ORDER BY rand() LIMIT 5");
      while (rs2.next()) {
     %>                                            
     <a href="mobileinfo.jsp?id=<%= rs2.getInt("id")%>" target="myFrame" style="text-decoration: none;">
      <center class="mobile">
       <img src="../queries/mobileimgcontainer.jsp?id=<%= rs2.getInt("id")%>" width="auto" height="80%">                            
       <p class="mobilelink" style="font-size: 16px;"><%= rs2.getString("name")%></p>
      </center>
     </a>                                                                        
     <%
      }
     %>
    </div>
    <div class="col-md-9">
     <%
      String model = "";
      if (rs.next()) {
       Statement st1 = con.createStatement();
       ResultSet rs1 = st1.executeQuery("SELECT name FROM brands WHERE id=" + rs.getInt("brand_id"));
       model = rs.getString("name");
       if (rs1.next()) {
        String brand = rs1.getString("name");
        brandname += brand.substring(0, 1).toUpperCase();
        brandname += brand.substring(1).toLowerCase();
       }
     %>
     <table class="table">            
      <thead class="bg-dark text-white">
       <tr>
        <th colspan="3"><h5 style="text-transform: capitalize;"><%= brandname%> <%= rs.getString("name")%></h5></th>
       </tr>
      </thead>
      <tbody>      
       <!-- NETWORK -->
       <tr>
        <td class="category">NETWORK</td>
        <td class="feature">Technology</td>
        <td><%= rs.getString("technology")%></td>
       </tr>
       <tr>
        <td rowspan="2" class="category">LAUNCH</td>
        <td class="feature">Announced</td>
        <td><%= rs.getString("announced")%></td>
       </tr>
       <tr>                
        <td class="feature">Status</td>
        <td><%= rs.getString("status")%></td>
       </tr>
       <!-- BODY -->
       <tr>                
        <td rowspan="4" class="category">BODY</td>
        <td class="feature">Dimensions</td>
        <td><%= rs.getString("dimensions")%></td>
       </tr>
       <tr>                
        <td class="feature">Weight</td>
        <td><%= rs.getString("weight")%></td>
       </tr>
       <tr>                
        <td class="feature">Build</td>
        <td><%= rs.getString("build")%></td>
       </tr>
       <tr>                
        <td class="feature">Sim</td>
        <td><%= rs.getString("sim")%></td>
       </tr> 
       <!-- DISPLAY -->
       <tr>                
        <td rowspan="3" class="category">DISPLAY</td>
        <td class="feature">Type</td>
        <td><%= rs.getString("type")%></td>
       </tr>
       <tr>                
        <td class="feature">Size</td>
        <td><%= rs.getString("size")%></td>
       </tr>
       <tr>                
        <td class="feature">Resolution</td>
        <td><%= rs.getString("resolution")%></td>
       </tr>
       <!-- PLATFORM -->
       <tr>                
        <td rowspan="4" class="category">PLATFORM</td>
        <td class="feature">OS</td>
        <td><%= rs.getString("os")%></td>
       </tr>
       <tr>                
        <td class="feature">Chipset</td>
        <td><%= rs.getString("chipset")%></td>
       </tr>
       <tr>                
        <td class="feature">CPU</td>
        <td><%= rs.getString("cpu")%></td>
       </tr>
       <tr>                
        <td class="feature">GPU</td>
        <td><%= rs.getString("gpu")%></td>
       </tr> 
       <!-- MEMORY -->
       <tr>                
        <td rowspan="2" class="category">MEMORY</td>
        <td class="feature">Card Slot</td>
        <td><%= rs.getString("cardslot")%></td>
       </tr>
       <tr>                
        <td class="feature">Internal</td>
        <td><%= rs.getString("internal")%></td>
       </tr>
       <!-- CAMERA -->
       <tr>                
        <td rowspan="4" class="category">CAMERA</td>
        <td class="feature">Primary</td>
        <td><%= rs.getString("primarycamera")%></td>
       </tr>
       <tr>                
        <td class="feature">Features</td>
        <td><%= rs.getString("features")%></td>
       </tr>
       <tr>                
        <td class="feature">Video</td>
        <td><%= rs.getString("video")%></td>
       </tr>
       <tr>                
        <td class="feature">Secondary</td>
        <td><%= rs.getString("secondarycamera")%></td>
       </tr> 
       <!-- COMMS -->
       <tr>                
        <td rowspan="5" class="category">COMMS</td>
        <td class="feature">WLAN</td>
        <td><%= rs.getString("wlan")%></td>
       </tr>
       <tr>                
        <td class="feature">Bluetooth</td>
        <td><%= rs.getString("bluetooth")%></td>
       </tr>
       <tr>                
        <td class="feature">GPS</td>
        <td><%= rs.getString("gps")%></td>
       </tr>
       <tr>                
        <td class="feature">Radio</td>
        <td><%= rs.getString("radio")%></td>
       </tr>
       <tr>                
        <td class="feature">USB</td>
        <td><%= rs.getString("usb")%></td>
       </tr>
       <!-- FEATURES -->
       <tr>                
        <td class="category">FEATURES</td>
        <td class="feature">Sensors</td>
        <td><%= rs.getString("sensors")%></td>
       </tr>
       <!-- BATTERY -->
       <tr>                
        <td class="category">BATTERY</td>
        <td class="feature"></td>
        <td><%= rs.getString("battery")%></td>
       </tr>
       <!-- MISC -->
       <tr>                
        <td rowspan="2" class="category">MISC</td>
        <td class="feature">Colors</td>
        <td><%= rs.getString("colors")%></td>
       </tr>
       <tr>                
        <td class="feature">Price</td>
        <td><i class="fas fa-rupee-sign"></i> <%= rs.getString("price")%> /-</td>
       </tr>
      </tbody>
     </table>  
     <% }%>  
    </div>
   </div> 
   <h4 style="margin-top:10px;">Comments on <%= brandname + " " + model%></h4>
   <%
    if (session.getAttribute("id") != null) {
   %>
   <div class="row" style="margin-bottom: 10px;" id="yolos">
    <div class="col-md-12">                    
     <form onsubmit="return checkpattern();" method="POST" action="../queries/comment.jsp">
      <input type="hidden" name="mobile_id" value="<%= request.getParameter("id")%>" />
      <div class="row">
       <div class="col-md-12">
        <textarea name="comment" id="comment" class="form-control cmt" style="width:100%" rows="3" placeholder="Comment on <%= brandname + " " + model%> as <%= session.getAttribute("user")%>" value=""></textarea><br />
        <p id="ermsg" style="color: #f00;font-weight:bold;"></p>
       </div>                            
      </div>
      <div class="row">
       <div class="col-md-12">
        <button type="submit" id="post_cmt" class="btn btn-success float-right"><i class="fas fa-comment"></i> Comment</button>
       </div>                            
      </div>
     </form>        
    </div>
   </div> 
   <% } else { %>
   <h5 style="color: #888;padding:5px;">Please Login to Comment...</h5>
   <% } %>
   <div class="container" id="cmnts">
    <%
     Statement st3 = con.createStatement();
     ResultSet rs3 = st3.executeQuery("SELECT * from reviews WHERE mobile_id=" + request.getParameter("id") + " ORDER BY time DESC");
     while (rs3.next()) {
      Statement st4 = con.createStatement();
      ResultSet rs4 = st4.executeQuery("SELECT username FROM users WHERE id=" + rs3.getInt("user_id"));
      String viewer = "";
      if (rs4.next()) {
       viewer += rs4.getString("username");
      }
    %>
    <div class="row" style="border: 2px solid #ddd;padding-top:12px;padding-bottom:12px;margin-bottom: 10px;">
     <div class="col-md-12">
      <div class="row">
       <div class="col-md-1">
        <img src="../queries/profileimgcontainer.jsp?id=<%= rs3.getInt("user_id")%>" width="50" height="50">
       </div>
       <div class="col-md-11">
        <p>
         <b><%= viewer%></b> made a comment<br />
         <%
          String date = "" + rs3.getTimestamp("time");
          TimeAgo ta = new TimeAgo();
          String timeago = ta.getTimeAgo(date);
         %>
         <i class="fas fa-clock" style="color: #000;"></i> <%= timeago%>                                    
        </p>
       </div>
      </div>
      <div class="row">
       <div class="col-md-1"></div>
       <div class="col-md-11">
        <%= rs3.getString("review")%>
       </div>
      </div>
     </div>
    </div> 
    <% }%>
   </div>                                                             
  </div>      
  <script>
   function checkpattern() {
    var str = $("#comment").val();
    var patt = new RegExp("^[a-zA-Z0-9!@#$&* ]*$");
    var res = patt.test(str);
    if (res) {
     return true;
    } else {
     document.getElementById("ermsg").innerHTML = "WRONG FORMAT use only lowercase or uppercase alphabets, number and special charaters among (!@#$&* )";
     return false;
    }
   }
  </script>
 </body>
</html>
