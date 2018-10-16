<%-- 
    Document   : changepassword
    Created on : 1 Sep, 2018, 6:38:58 PM
    Author     : saiab
--%>

<%@page import="java.sql.*"%>
<%
 String cur_psw = request.getParameter("curr_pass");
 String new_psw = request.getParameter("new_pass");
 String id = session.getAttribute("id").toString();

 Class.forName("com.mysql.jdbc.Driver");
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobispec?" + "user=root&password=");
 PreparedStatement ps = con.prepareStatement("UPDATE users SET password=? WHERE id=? AND password=?");
 ps.setString(1, new_psw);
 ps.setString(2, id);
 ps.setString(3, cur_psw);
 int i = ps.executeUpdate();
 if (i > 0) {
  response.sendRedirect("../html/profile.jsp");
 } else {
%>
<script>
 alert("Current password did not match...Please try again");
 window.location.href = "../html/profile.jsp";
</script>
<%
 }
%>
