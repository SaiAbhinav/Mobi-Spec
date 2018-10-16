<%-- 
    Document   : filter
    Created on : 7 Aug, 2018, 11:42:26 PM
    Author     : saiab
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>JSP Page</title>
 </head>
 <body>
  <%
   int id = Integer.parseInt(request.getParameter("id"));
   int price = Integer.parseInt(request.getParameter("price"));

   Class.forName("com.mysql.jdbc.Driver");
   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobispec?" + "user=root&password=");

   Statement st = con.createStatement();
   ResultSet rs = st.executeQuery("SELECT * FROM mobiles WHERE brand_id=" + id + " AND price < " + price);
  %>
  <div class="row">
   <%
    while (rs.next()) {
     int mid = rs.getInt("id");
   %>
   <div class="col-md-3 mobile">                           
    <center>
     <a href="mobileinfo.jsp?id=<%= mid%>" target="myFrame" style="text-decoration: none;">
      <img src="../queries/mobileimgcontainer.jsp?id=<%= mid%>" width="auto" height="100%">                            
      <p class="mobilelink" style="font-size: 16px;"><%= rs.getString("name")%></p>
     </a>
    </center>
   </div>                    
   <% }%>
  </div>     
 </body>
</html>
