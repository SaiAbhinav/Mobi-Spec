<%-- 
    Document   : logout
    Created on : 4 Aug, 2018, 10:59:09 AM
    Author     : saiab
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
 session.invalidate();
 response.sendRedirect("../html/home.jsp");
%>