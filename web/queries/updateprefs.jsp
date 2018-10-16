<%-- 
    Document   : updateprefs
    Created on : 1 Sep, 2018, 8:07:09 PM
    Author     : saiab
--%>

<%@page import="java.sql.*"%>
<%
    String prefs[] = request.getParameterValues("pref");
    String id = session.getAttribute("id").toString();
    String preflist = "";
    for(int i=0;i<prefs.length;i++) {
        preflist += prefs[i] + ",";
    }    
    preflist = preflist.substring(0, preflist.length()-1);
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobispec?" + "user=root&password=");
    PreparedStatement ps = con.prepareStatement("UPDATE users SET preferences=? WHERE id=?");
    ps.setString(1, preflist);
    ps.setString(2, id);    
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