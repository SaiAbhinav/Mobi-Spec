<%-- 
    Document   : newuser
    Created on : 21 Jul, 2018, 8:31:02 PM
    Author     : saiab
--%>

<%@page import="java.security.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>

<%
    String email = request.getParameter("email");
    String username = request.getParameter("uname");
    String password = request.getParameter("psw");

    String gender = request.getParameter("gender");
    String dob = request.getParameter("dob");
    String address = request.getParameter("address");
    String prefs[] = request.getParameterValues("pref");
    String preflist = "";
    for(int i=0;i<prefs.length;i++) {
        preflist += prefs[i] + ",";
    }    
    preflist = preflist.substring(0, preflist.length()-1);
    String nation = request.getParameter("nation");

    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobispec", "root", "");

    String query = "INSERT INTO users(email,username,password,gender,dateofbirth,address,nationality,preferences) VALUES(?,?,?,?,?,?,?,?)";
    PreparedStatement ps = con.prepareStatement(query);
    ps.setString(1, email);
    ps.setString(2, username);
    ps.setString(3, password);
    ps.setString(4, gender);
    ps.setString(5, dob);
    ps.setString(6, address);
    ps.setString(7, nation);
    ps.setString(8, preflist);

    int i = ps.executeUpdate();
    String message = "";
    if(i > 0) {
        //response.sendRedirect("../html/login.jsp");
        message = "success";    
    } else {    
        message = "error";
    }
    request.setAttribute("message", message);
    request.getRequestDispatcher("../html/login.jsp").forward(request, response);
%>