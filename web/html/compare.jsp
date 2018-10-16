<%-- 
    Document   : compare
    Created on : 8 Aug, 2018, 1:19:41 PM
    Author     : saiab
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
 Class.forName("com.mysql.jdbc.Driver");
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobispec?" + "user=root&password=");
%>
<!DOCTYPE html>
<html>
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Compare</title>

  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">

  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>      

  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/all.css" integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ" crossorigin="anonymous">        

  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/bootstrap-select.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.css" />

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
  </style>
 </head>
 <body>
  <div class="container">
   <table width="100%" border="0" style="margin-top: 20px;" class="table">
    <thead>
     <tr>
      <td style="width:15%">
      </td>
      <td style="width:10%;">
      </td>
      <td style="width:32%">
       <div class="row">
        <div class="col-md-12">
         <select id="brand1" name="brand1" class="selectpicker form-control" data-live-search="true" data-size="5" onchange="chooseone(this.value)">
          <option value="0" selected>-- Select Brand One --</option>
          <%
           Statement st1 = con.createStatement();
           ResultSet rs1 = st1.executeQuery("SELECT * FROM brands");
           while (rs1.next()) {
          %>
          <option value="<%= rs1.getInt("id")%>"><%= rs1.getString("name")%></option>
          <%
           }
          %>
         </select>
        </div>
       </div>
       <div class="row" style="margin-top: 10px;">
        <div class="col-md-12">
         <select id="mobiles1" name="mobiles1" class="form-control" style="width:100%;" onchange="getspecs()">                            
          <option value="0" selected>-- Select Mobile One --</option>
         </select>
        </div>
       </div>
      </td>
      <td style="width:33%">
       <div class="row">
        <div class="col-md-12">
         <select id="brand2" name="brand2" class="selectpicker form-control" data-live-search="true" data-size="5" onchange="choosetwo(this.value)">
          <option value="0" selected>-- Select Brand Two --</option>
          <%
           Statement st2 = con.createStatement();
           ResultSet rs2 = st2.executeQuery("SELECT * FROM brands");
           while (rs2.next()) {
          %>
          <option value="<%= rs2.getInt("id")%>"><%= rs2.getString("name")%></option>
          <%
           }
          %>
         </select>
        </div>
       </div>
       <div class="row" style="margin-top: 10px;">
        <div class="col-md-12">
         <select id="mobiles2" name="mobiles2" class="form-control" style="width:100%;" onchange="getspecs()">                            
          <option value="0" selected>-- Select Mobile Two --</option>
         </select>
        </div>
       </div>
      </td>                    
     </tr>                    
    </thead>
    <tbody id="showspecs">
     <tr>
      <td colspan="4"><h3 style="color:#aaa;">Please Select Two Mobiles to Compare...</h3></td>
     </tr>
    </tbody>
   </table>
  </div>        
 </body>
 <script>
  function chooseone(fid) {
   var xreq;
   if (fid == "") {
    document.getElementById("mobiles1").innerHTML = "<option value='' disabled selected>-- Select Mobile One --</option>";
    return;
   }
   if (window.XMLHttpRequest) {
    xreq = new XMLHttpRequest();
   } else {
    xreq = new ActiveXObject("Microsoft.XMLHTTP");
   }
   xreq.onreadystatechange = function () {
    if ((xreq.readyState == 4) && (xreq.status == 200)) {
     document.getElementById("mobiles1").innerHTML = xreq.responseText;
    }
   }
   xreq.open("get", "../queries/getmobiles.jsp?mid=" + fid, "true");
   xreq.send();
  }
  function choosetwo(sid) {
   var xreq;
   if (sid == "") {
    document.getElementById("mobiles2").innerHTML = "<option value='' disabled selected>-- Select Mobile Two --</option>";
    return;
   }
   if (window.XMLHttpRequest) {
    xreq = new XMLHttpRequest();
   } else {
    xreq = new ActiveXObject("Microsoft.XMLHTTP");
   }
   xreq.onreadystatechange = function () {
    if ((xreq.readyState == 4) && (xreq.status == 200)) {
     document.getElementById("mobiles2").innerHTML = xreq.responseText;
    }
   }
   xreq.open("get", "../queries/getmobiles.jsp?mid=" + sid, "true");
   xreq.send();
  }
  function getspecs() {
   var fmid = document.getElementById("mobiles1").value;
   var smid = document.getElementById("mobiles2").value;
   var xreq;
   if (fmid == "" || smid == "") {
    document.getElementById("showspecs").innerHTML = "";
    return;
   }
   if (window.XMLHttpRequest) {
    xreq = new XMLHttpRequest();
   } else {
    xreq = new ActiveXObject("Microsoft.XMLHTTP");
   }
   xreq.onreadystatechange = function () {
    if ((xreq.readyState == 4) && (xreq.status == 200)) {
     document.getElementById("showspecs").innerHTML = xreq.responseText;
    }
   }
   xreq.open("get", "../queries/getspecs.jsp?fmid=" + fmid + "&smid=" + smid, "true");
   xreq.send();
  }
 </script>
 <script>
  $(document).ready(function () {
   $('[data-toggle="tooltip"]').tooltip();
  });
 </script>
</html>
