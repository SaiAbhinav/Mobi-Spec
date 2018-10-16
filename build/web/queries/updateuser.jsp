<%-- 
    Document   : updateuser
    Created on : 1 Sep, 2018, 8:07:09 PM
    Author     : saiab
--%>

<%@page import="java.sql.*"%>
<%
    String address = request.getParameter("address");
    String nation = request.getParameter("nation");
    String id = session.getAttribute("id").toString();    
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobispec?" + "user=root&password=");
    PreparedStatement ps = con.prepareStatement("UPDATE users SET address=?,nationality=? WHERE id=?");
    ps.setString(1, address);
    ps.setString(2, nation);    
    ps.setString(3, id);    
    int i = ps.executeUpdate();
    if(i > 0) {
        response.sendRedirect("../html/profile.jsp");
    }else {
%>
        <script>
            alert("Error Occured...Please try again");
            window.location.href="../html/profile.jsp";
        </script>
<%        
    }
%>