<%-- 
    Document   : loginuser
    Created on : 29 Jul, 2018, 8:27:21 PM
    Author     : saiab
--%>

<%@page import="java.sql.*"%>
<%@page import="java.security.*"%>
<%
    String username = request.getParameter("uname");
    String password = request.getParameter("psw");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobispec?" + "user=root&password=");
    
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM users WHERE username='"+username+"' AND password='"+password+"'");       
    if(rs.next()) {
        int userid = rs.getInt("id");
        String user = rs.getString("username");
        session.setAttribute("auth", "true");
        session.setAttribute("id", userid);        
        session.setAttribute("user", user);
    }            
    response.sendRedirect("../html/assests/getLoggedUserData.jsp");    
%>
