<%-- 
    Document   : comment
    Created on : 4 Aug, 2018, 2:12:55 PM
    Author     : saiab
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int id = Integer.parseInt(request.getParameter("mobile_id"));
    String cmnt = request.getParameter("comment");
    Integer user_id = (Integer)session.getAttribute("id");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobispec?" + "user=root&password=");
    
    String query = "INSERT INTO reviews(mobile_id,user_id,review) VALUES(?,?,?)";
    PreparedStatement ps = con.prepareStatement(query);
    ps.setInt(1, id);
    ps.setInt(2, user_id);
    ps.setString(3, cmnt);    
    int i = ps.executeUpdate();
    if(i > 0) {
        response.sendRedirect("../html/mobileinfo.jsp?id="+id+"#yolos");
    }
%>