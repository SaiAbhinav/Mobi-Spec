<%-- 
    Document   : getspecs
    Created on : 8 Aug, 2018, 2:38:20 PM
    Author     : saiab
--%>

<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int fmid = Integer.parseInt(request.getParameter("fmid"));            
            int smid = Integer.parseInt(request.getParameter("smid"));            
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobispec?" + "user=root&password=");
            
            Statement st1 = con.createStatement();
            ResultSet rs1 = st1.executeQuery("SELECT * FROM mobiles WHERE id="+fmid);
            
            Statement st2 = con.createStatement();
            ResultSet rs2 = st2.executeQuery("SELECT * FROM mobiles WHERE id="+smid);
            
            if(rs1.next() && rs2.next()) {
        %>
            <tr class="bg-dark text-white">
                <td></td>
                <td></td>
                <td><a href="../html/mobileinfo.jsp?id=<%= rs1.getInt("id") %>" style="color:#fff;text-decoration: none;"><h5><%= rs1.getString("name") %> <i class="fas fa-external-link-alt" style="font-size:12px;color:#1E90FF;"></i></h5></a></td>
                <td><a href="../html/mobileinfo.jsp?id=<%= rs2.getInt("id") %>" style="color:#fff;text-decoration: none;"><h5><%= rs2.getString("name") %> <i class="fas fa-external-link-alt" style="font-size:12px;color:#1E90FF;"></i></h5></a></td>
            </tr>
            <!-- NETWORK -->
            <tr>
                <td class="category">NETWORK</td>
                <td class="feature">Technology</td>
                <td><%= rs1.getString("technology") %></td>                        
                <td><%= rs2.getString("technology") %></td>
            </tr>
            <tr>
                <td rowspan="2" class="category">LAUNCH</td>
                <td class="feature">Announced</td>
                <td><%= rs1.getString("announced") %></td>
                <td><%= rs2.getString("announced") %></td>
            </tr>
            <tr>                
                <td class="feature">Status</td>
                <td><%= rs1.getString("status") %></td>
                <td><%= rs2.getString("status") %></td>
            </tr>
            <!-- BODY -->
            <tr>                
                <td rowspan="4" class="category">BODY</td>
                <td class="feature">Dimensions</td>
                <td><%= rs1.getString("dimensions") %></td>
                <td><%= rs2.getString("dimensions") %></td>
            </tr>
            <tr>                
                <td class="feature">Weight</td>
                <td><%= rs1.getString("weight") %></td>
                <td><%= rs2.getString("weight") %></td>
            </tr>
            <tr>                
                <td class="feature">Build</td>
                <td><%= rs1.getString("build") %></td>
                <td><%= rs2.getString("build") %></td>
            </tr>
            <tr>                
                <td class="feature">Sim</td>
                <td><%= rs1.getString("sim") %></td>
                <td><%= rs2.getString("sim") %></td>
            </tr> 
            <!-- DISPLAY -->
            <tr>                
                <td rowspan="3" class="category">DISPLAY</td>
                <td class="feature">Type</td>
                <td><%= rs1.getString("type") %></td>
                <td><%= rs2.getString("type") %></td>
            </tr>
            <tr>                
                <td class="feature">Size</td>
                <td><%= rs1.getString("size") %></td>
                <td><%= rs2.getString("size") %></td>
            </tr>
            <tr>                
                <td class="feature">Resolution</td>
                <td><%= rs1.getString("resolution") %></td>
                <td><%= rs2.getString("resolution") %></td>
            </tr>
            <!-- PLATFORM -->
            <tr>                
                <td rowspan="4" class="category">PLATFORM</td>
                <td class="feature">OS</td>
                <td><%= rs1.getString("os") %></td>
                <td><%= rs2.getString("os") %></td>
            </tr>
            <tr>                
                <td class="feature">Chipset</td>
                <td><%= rs1.getString("chipset") %></td>
                <td><%= rs2.getString("chipset") %></td>
            </tr>
            <tr>                
                <td class="feature">CPU</td>
                <td><%= rs1.getString("cpu") %></td>
                <td><%= rs2.getString("cpu") %></td>
            </tr>
            <tr>                
                <td class="feature">GPU</td>
                <td><%= rs1.getString("gpu") %></td>
                <td><%= rs2.getString("gpu") %></td>
            </tr> 
            <!-- MEMORY -->
            <tr>                
                <td rowspan="2" class="category">MEMORY</td>
                <td class="feature">Card Slot</td>
                <td><%= rs1.getString("cardslot") %></td>
                <td><%= rs2.getString("cardslot") %></td>
            </tr>
            <tr>                
                <td class="feature">Internal</td>
                <td><%= rs1.getString("internal") %></td>
                <td><%= rs2.getString("internal") %></td>
            </tr>
            <!-- CAMERA -->
            <tr>                
                <td rowspan="4" class="category">CAMERA</td>
                <td class="feature">Primary</td>
                <td><%= rs1.getString("primarycamera") %></td>
                <td><%= rs2.getString("primarycamera") %></td>
            </tr>
            <tr>                
                <td class="feature">Features</td>
                <td><%= rs1.getString("features") %></td>
                <td><%= rs2.getString("features") %></td>
            </tr>
            <tr>                
                <td class="feature">Video</td>
                <td><%= rs1.getString("video") %></td>
                <td><%= rs2.getString("video") %></td>
            </tr>
            <tr>                
                <td class="feature">Secondary</td>
                <td><%= rs1.getString("secondarycamera") %></td>
                <td><%= rs2.getString("secondarycamera") %></td>
            </tr> 
            <!-- COMMS -->
            <tr>                
                <td rowspan="5" class="category">COMMS</td>
                <td class="feature">WLAN</td>
                <td><%= rs1.getString("wlan") %></td>
                <td><%= rs2.getString("wlan") %></td>
            </tr>
            <tr>                
                <td class="feature">Bluetooth</td>
                <td><%= rs1.getString("bluetooth") %></td>
                <td><%= rs2.getString("bluetooth") %></td>
            </tr>
            <tr>                
                <td class="feature">GPS</td>
                <td><%= rs1.getString("gps") %></td>
                <td><%= rs2.getString("gps") %></td>
            </tr>
            <tr>                
                <td class="feature">Radio</td>
                <td><%= rs1.getString("radio") %></td>
                <td><%= rs2.getString("radio") %></td>
            </tr>
            <tr>                
                <td class="feature">USB</td>
                <td><%= rs1.getString("usb") %></td>
                <td><%= rs2.getString("usb") %></td>
            </tr>
            <!-- FEATURES -->
            <tr>                
                <td class="category">FEATURES</td>
                <td class="feature">Sensors</td>
                <td><%= rs1.getString("sensors") %></td>
                <td><%= rs2.getString("sensors") %></td>
            </tr>
            <!-- BATTERY -->
            <tr>                
                <td class="category">BATTERY</td>
                <td class="feature"></td>
                <td><%= rs1.getString("battery") %></td>
                <td><%= rs2.getString("battery") %></td>
            </tr>
            <!-- MISC -->
            <tr>                
                <td rowspan="2" class="category">MISC</td>
                <td class="feature">Colors</td>
                <td><%= rs1.getString("colors") %></td>
                <td><%= rs2.getString("colors") %></td>
            </tr>
            <tr>                
                <td class="feature">Price</td>
                <td><i class="fas fa-rupee-sign"></i> <%= rs1.getString("price") %> /-</td>
                <td><i class="fas fa-rupee-sign"></i> <%= rs2.getString("price") %> /-</td>
            </tr>
        <%
            }else {
        %>
                <tr><td colspan="4"><h3 style="color:#aaa;">Please Select Two Mobiles to Compare...</h3></td></tr>
        <%
            }
        %>        
    </body>
</html>
