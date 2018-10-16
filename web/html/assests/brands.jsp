<%@page import="java.lang.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
  <title>Brands</title>
  <meta name="author" content="sanjay">

  <!-- CSS -->
  <link rel="stylesheet" type="text/css" href="../../css/brands.css">
 </head>
 <body onload="loadXMLDoc()">
  <div id="brands">
   <table border="0" cellspacing=0>
    <thead><tr><th colspan="6"><h3>CHOOSE A BRAND</h3></th></tr></thead>
    <tbody id="brandslist"></tbody>
   </table>
  </div>
  <script>
   function loadXMLDoc() {
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function () {
     if (this.readyState == 4 && this.status == 200) {
      myFunction(this);
     }
    };
    xmlhttp.open("GET", "brandsdata.xml", true);
    xmlhttp.send();
   }
   function myFunction(xml) {
    var i;
    var xmlDoc = xml.responseXML;
    var table = "";
    var x = xmlDoc.getElementsByTagName("brand");
    for (i = 0; i < x.length; i = i + 4) {
     table += "<tr><td><a href='../brandinfo.jsp?id=" + x[i].getAttribute("id") + "' target='myFrame'>" + x[i].getElementsByTagName("name")[0].childNodes[0].nodeValue + "<a></td>";
     table += "<td><a href='../brandinfo.jsp?id=" + x[i + 1].getAttribute("id") + "' target='myFrame'>" + x[i + 1].getElementsByTagName("name")[0].childNodes[0].nodeValue + "<a></td>";
     table += "<td><a href='../brandinfo.jsp?id=" + x[i + 2].getAttribute("id") + "' target='myFrame'>" + x[i + 2].getElementsByTagName("name")[0].childNodes[0].nodeValue + "<a></td>";
     table += "<td><a href='../brandinfo.jsp?id=" + x[i + 3].getAttribute("id") + "' target='myFrame'>" + x[i + 3].getElementsByTagName("name")[0].childNodes[0].nodeValue + "<a></td></tr>";
    }
    document.getElementById("brandslist").innerHTML = table;
   }
  </script>
 </body>
</html>
