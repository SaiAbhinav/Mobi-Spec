<%-- 
    Document   : updateprofileimg
    Created on : 29 Jul, 2018, 6:59:13 PM
    Author     : saiab
--%>

<%@ page import="java.sql.*" %>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.io.output.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>

<%  
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobispec?" + "user=root&password=");
    
    byte[] b = null;
    
    DiskFileItemFactory factory = new DiskFileItemFactory();
    
    ServletFileUpload sfu = new ServletFileUpload(factory);
    List items = sfu.parseRequest(request);
    
    Iterator iter = items.iterator();
    String value = "";
    while(iter.hasNext()) {
        FileItem item = (FileItem) iter.next();
        /*if(item.isFormField()) {            
            value = item.getString();
        }else {
            b = item.get();
        }*/
        if(!item.isFormField()) {
            b = item.get();
        }
    }
    
    Integer id = (Integer)session.getAttribute("id");
    
    PreparedStatement ps = con.prepareStatement("UPDATE users SET profile=? WHERE id="+id);
    ps.setBytes(1, b);        
    int check = ps.executeUpdate();
    
    String message = "" + value;
    if(check > 0) {        
        message = "success";    
    } else {    
        message = "error";
    }
    request.setAttribute("message", message);
    request.getRequestDispatcher("../html/profile.jsp").forward(request, response);
%>