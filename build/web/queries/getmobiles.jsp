<%-- 
    Document   : getmobiles
    Created on : 8 Aug, 2018, 2:26:45 PM
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
            int mid = Integer.parseInt(request.getParameter("mid"));            
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobispec?" + "user=root&password=");
            
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM mobiles WHERE brand_id="+mid);
            
            Statement st1 = con.createStatement();
            ResultSet rs1 = st1.executeQuery("SELECT name FROM brands WHERE id="+mid);
            String brand = "";
            if(rs1.next()) {
                brand = rs1.getString("name");
            }
        %>
            <option value="0">-- <%= brand %> --</option>
        <%
            while(rs.next()) {
        %>
        <option value="<%= rs.getInt("id") %>"><%= rs.getString("name") %></option>
        <%
            }
        %>
    </body>
</html>
