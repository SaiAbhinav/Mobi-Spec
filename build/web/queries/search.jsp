<%-- 
    Document   : search
    Created on : 1 Sep, 2018, 9:02:03 PM
    Author     : saiab
--%>

<%@page import="java.sql.*"%>
<%
    String searchText = request.getParameter("searchText");
    searchText = searchText.replace(" ", "%");
    String searchTerms[] = searchText.split("%");
    String searchModel = "";
    for(int i=1;i<searchTerms.length;i++) {
        searchModel += searchTerms[i] + "%";
    }    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobispec?" + "user=root&password=");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT id FROM brands WHERE name='"+searchText+"'");
    Statement st1 = con.createStatement();
    ResultSet rs1 = st1.executeQuery("SELECT id FROM mobiles WHERE name LIKE'"+searchText+"'");
    Statement st2 = con.createStatement();
    ResultSet rs2 = st2.executeQuery("SELECT id FROM mobiles WHERE name LIKE'"+searchModel+"'");
    if(rs.next()) {        
%>
        <script>
            parent.frames["navbar"].location="../html/navBar.jsp";
            parent.frames["myFrame"].location="../html/brandinfo.jsp?id=<%= rs.getInt("id") %>";
        </script>
<%
    }else if(rs1.next()) {
%>
        <script>
            parent.frames["navbar"].location="../html/navBar.jsp";
            parent.frames["myFrame"].location="../html/mobileinfo.jsp?id=<%= rs1.getInt("id") %>";
        </script>
<%    
    }else if(rs2.next()) {
%>
        <script>
            parent.frames["navbar"].location="../html/navBar.jsp";
            parent.frames["myFrame"].location="../html/mobileinfo.jsp?id=<%= rs2.getInt("id") %>";
        </script>
<%    
    }else {
%>
        <script>
            alert("Not found...!");
            parent.frames["navbar"].location="../html/navBar.jsp";
            parent.frames["myFrame"].location="../html/home.jsp";
        </script>
<%    
    }
%>
