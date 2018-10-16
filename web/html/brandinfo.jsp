<%-- 
    Document   : brandinfo
    Created on : 21 Jul, 2018, 10:04:14 PM
    Author     : saiab
--%>

<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
 Class.forName("com.mysql.jdbc.Driver");
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobispec?" + "user=root&password=");
 Statement st = con.createStatement();
 ResultSet rs = st.executeQuery("SELECT * FROM mobiles WHERE brand_id=" + request.getParameter("id"));
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
   .mobile {
    margin-bottom: 10px;
    padding-top:10px;
   }
   .mobile:hover {
    box-shadow: 3px 4px 6px #555;
    border-radius: 5px;
   }

   .slidecontainer {
    width: 100%; /* Width of the outside container */
   }

   /* The slider itself */
   .slider {
    -webkit-appearance: none;  /* Override default CSS styles */
    appearance: none;
    width: 100%; /* Full-width */
    height: 3px; /* Specified height */
    background: #1E90FF; /* Grey background */
    outline: none; /* Remove outline */
    opacity: 0.7; /* Set transparency (for mouse-over effects on hover) */
    -webkit-transition: .2s; /* 0.2 seconds transition on hover */
    transition: opacity .2s;
   }

   /* Mouse-over effects */
   .slider:hover {
    opacity: 1; /* Fully shown on mouse-over */
   }

   /* The slider handle (use -webkit- (Chrome, Opera, Safari, Edge) and -moz- (Firefox) to override default look) */
   .slider::-webkit-slider-thumb {
    -webkit-appearance: none; /* Override default look */
    appearance: none;
    border-radius: 50%;
    border: 2px solid #1E90FF;    
    width: 25px; /* Set a specific slider handle width */
    height: 25px; /* Slider handle height */
    background: #fff; /* Green background */
    cursor: pointer; /* Cursor on hover */
   }

   .slider::-moz-range-thumb {
    width: 25px; /* Set a specific slider handle width */
    height: 25px; /* Slider handle height */
    border-radius: 50%;
    border: 2px solid #1E90FF;    
    background: #fff; /* Green background */
    cursor: pointer; /* Cursor on hover */
   }
   #filterset {
    cursor: pointer;
   }
  </style>
 </head>
 <body>
  <div class="container">
   <table width="100%" border="0">
    <tr>
     <td style="width:40%"><iframe src="assests/brands.jsp" name="mob_brands" width="100%" height="285px" scrolling="no" frameborder="0"></iframe></td>
     <td style="width:60%"><img src="../queries/brandimgcontainer.jsp?id=<%= request.getParameter("id")%>" style="margin-top:-5px;" width="100%" height="285px" /></td>
    </tr>	
   </table>
   <div class="container">
    <div class="row">
     <div class="col-md-3">
      <table width="100%" style="border-right: 2px solid #aaa;">
       <tr>
        <td style="width: 80%"><h4>Filters</h4></td>
        <td style="width: 20%"><i class="fas fa-filter" id="filterset" onclick="removefilters(<%= request.getParameter("id")%>);"></i></td>
       </tr>
      </table>           
      <p style="color: #aaa;">Price: </p>
      <div class="slidecontainer">
       <input type="range" style="width: 85%;" class="slider" id="myRange" min="1000" step="1000" max="99999" value="1000" onchange="filtermobiles(this.value, <%= request.getParameter("id")%>)">
      </div>                        
      <div id="max" style="margin-top:10px;">
       <p style='color: #aaa;font-size: 14px;'>
        Min: <span style='color:#000;'>1000</span>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        Max: <span style='color:#000;'>1000</span>
       </p>
      </div>
     </div>
     <div class="col-md-9" id="showmobiles">
      <div class="row">
       <%
        while (rs.next()) {
         int id = rs.getInt("id");
       %>

       <div class="col-md-3 mobile">                           
        <center>
         <a href="mobileinfo.jsp?id=<%= id%>" target="myFrame" style="text-decoration: none;">
          <img src="../queries/mobileimgcontainer.jsp?id=<%= id%>" width="auto" height="100%">                            
          <p class="mobilelink" style="font-size: 16px;"><%= rs.getString("name")%></p>
         </a>
        </center>
       </div>                    
       <% }%>
      </div>
     </div>
    </div>  
   </div>
  </div>
 </body>    
 <script>
  function removefilters(mid) {
   document.getElementById("myRange").value = 1000;
   filtermobiles(100000, mid);
   document.getElementById("filterset").style.color = "#000";
  }

  function filtermobiles(price, mid) {
   document.getElementById("filterset").style.color = "#1E90FF";
   var slider = document.getElementById("myRange");
   var output = document.getElementById("max");
   slider.oninput = function () {
    output.innerHTML = "<p style='color: #aaa;font-size: 14px;'>Min: <span style='color:#000;'>1000</span> \n\
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n\
                                 Max: <span style='color:#000;'>" + this.value + "</span></p>";
   }
   var xreq;
   if (price == "") {
    document.getElementById("showmobiles").innerHTML = "";
    return;
   }
   if (window.XMLHttpRequest) {
    xreq = new XMLHttpRequest();
   } else {
    xreq = new ActiveXObject("Microsoft.XMLHTTP");
   }
   xreq.onreadystatechange = function () {
    if ((xreq.readyState == 4) && (xreq.status == 200)) {
     document.getElementById("showmobiles").innerHTML = xreq.responseText;
    }
   }
   xreq.open("get", "../queries/filter.jsp?id=" + mid + "&price=" + price, "true");
   xreq.send();
  }
 </script>
</html>
