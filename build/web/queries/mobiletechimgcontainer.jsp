<%-- 
    Document   : mobiletechimgcontainer
    Created on : 22 Jul, 2018, 2:29:21 AM
    Author     : saiab
--%>

<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Blob image = null;
    byte[] imgData = null;    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobispec?" + "user=root&password=");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT techimage FROM mobiles WHERE id="+request.getParameter("id"));   
    if(rs.next()) {
        image = rs.getBlob("techimage");
        imgData = image.getBytes(1,(int)image.length());
    }
    response.setContentType("image/png");
    OutputStream o = response.getOutputStream();
    o.write(imgData);
    o.flush();
%>
