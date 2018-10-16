<jsp:useBean id="uservalid" scope="request" class="uservalidation.ValidateBean">
    <jsp:setProperty name="uservalid" property="uname" value="<%= request.getParameter("uname") %>" />
    <jsp:setProperty name="uservalid" property="psw" value="<%= request.getParameter("psw") %>" />
</jsp:useBean>

<% 
    String[] result = uservalid.validate(uservalid.getUname(), uservalid.getPsw());
    
    if(result[0].equals("true")) {
        session.setAttribute("id", result[1]);        
        session.setAttribute("user", result[2]);
        response.sendRedirect("../html/assests/getLoggedUserData.jsp");
    }else {
        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
        request.setAttribute("msg", "InValid Credentials...");
        rd.forward(request, response);        
    }
%>