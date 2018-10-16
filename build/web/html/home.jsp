<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Visitors.Counter"%>
<%    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobispec?" + "user=root&password=");  
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT COUNT(*) AS registeredUsers FROM users");
    Statement st1 = con.createStatement();
    ResultSet rs1 = st1.executeQuery("SELECT COUNT(*) AS models FROM mobiles");
    Statement st2 = con.createStatement();
    ResultSet rs2 = st2.executeQuery("SELECT COUNT(*) AS comments FROM reviews");    
    Statement st3 = con.createStatement();
    ResultSet rs3 = st3.executeQuery("SELECT COUNT(*) AS todaycomments FROM `reviews` WHERE `time` > CURRENT_DATE ");
    if(rs.next()){}
    if(rs1.next()) {}
    if(rs2.next()) {}
    if(rs3.next()) {}
    
    String file_path = "C:\\Users\\saiab\\Desktop\\uservisitedcount.txt";
    File file_name = new File(file_path); 
    BufferedReader file = new BufferedReader(new FileReader(file_name));		
    String str, counts = ""; 
    while ((str = file.readLine()) != null) {
        counts = str;
    }                 	    

%>
<!DOCTYPE html>
<html>
    <head>
        <title>Home</title>
        <meta name="author" content="sanjay">	
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
                
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>      
        
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/all.css" integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ" crossorigin="anonymous">        
        <link rel="stylesheet" type="text/css" href="../css/home.css">
        <style>
            body {
                margin-left: 17px;
            }
            table {
                margin-top: 1%;                
            }           
            span {
                font-size: 20px;
                font-weight: bold;
                color: #696969;
                display: inline-block;
                position: relative;
                border-radius: 6px;
                padding: 7px 12px;
                text-align: center;
                margin: 5px;
                margin-top: 20px;
                background-color: #ddd;
                box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.34);                
            }
        </style>
        <script>
            function loadPage() {
                parent.frames['navbar'].location.reload();                   
            }
            $(document).ready(function() {                
                var visits = $("#visits");                
                var splitVisits = [];
                splitVisits = visits.html().trim().split(""); 
                var newVisits = "";
                for(var i = 0; i < splitVisits.length; i++) {
                    newVisits = newVisits + "<span>" + splitVisits[i] + "</span>";
                }                
                $("#visits").html(newVisits);
                
                var registers = $("#registers");                
                var splitRegisters = [];
                splitRegisters = registers.html().trim().split(""); 
                var newRegisters = "";
                for(var i = 0; i < splitRegisters.length; i++) {
                    newRegisters = newRegisters + "<span>" + splitRegisters[i] + "</span>";
                }                
                $("#registers").html(newRegisters);
            });
        </script>
    </head>
    <body onload="loadPage();">        
        <div class="container">             
            <table width="100%" border="0">
                <tr>
                    <td style="width:40%">
                        <iframe src="assests/brands.jsp" name="mob_brands" width="100%" height="285px" scrolling="no" frameborder="0"></iframe>
                    </td>
                    <td style="width:60%">
                        <iframe src="assests/comp.jsp" width="100%" height="285px" scrolling="no" frameborder="0"></iframe>
                    </td>
                </tr>	                
            </table>		            
            <div id="trending">				
                <table width="100%" cellspacing="1" cellpadding=0>
                    <thead class="text-center"><tr><th colspan="4"><h3 style="padding-top: 10px;padding-bottom: 10px;">TRENDING</h3></th></tr></thead>
                    <tbody>
                        <tr>
                            <td>
                                <div class="img-container">
                                    <img src="../assests/images/mobiles/trending/oneplus_6.jpg" width="100%">
                                    <div class="name_tag">ONEPLUS 6</div>
                                </div>
                            </td>						
                            <td>
                                <div class="img-container">
                                    <img src="../assests/images/mobiles/trending/samsung_galaxy_s9.jpg" width="100%">
                                    <div class="name_tag">SAMSUNG S9</div>
                                </div>
                            </td>						
                            <td>
                                <div class="img-container">
                                    <img src="../assests/images/mobiles/trending/vivo_nex_s.jpg" width="100%">
                                    <div class="name_tag">VIVO NEX S</div>
                                </div>
                            </td>						
                            <td>
                                <div class="img-container">
                                    <img src="../assests/images/mobiles/trending/oppo_find_x.jpg" width="100%">
                                    <div class="name_tag">OPPO FIND X</div>
                                </div>
                            </td>						
                        </tr>
                    </tbody>
                </table>
            </div>
            <center>                                
                <div class="row" style="width:100%;margin-top: 20px;color:#fff;margin-bottom:20px;">
                    <div class="col-md-2" style="background-color: #2f4e6f;padding: 10px 0px 10px 0px;">
                        <i class="fas fa-eye" style="font-size: 40px;"></i><br>
                        <font style="font-size: 25px;font-weight:bolder;">
                            <jsp:include page="../Counter" />
                        </font>
                        <hr style="width: 25%;background-color: lightgray;height: 2px;border: 0 none;border-radius: 5px;">
                        <font style="font-weight: bold; font-size:18px;">VISITORS</font>
                    </div>
                    <div class="col-md-2" style="background-color: #98b1c4;padding: 10px 0px 10px 0px;">
                        <i class="fas fa-users" style="font-size: 40px;"></i><br>
                        <font style="font-size: 25px;font-weight:bolder;"><%= rs.getInt("registeredUsers") %></font>
                        <hr style="width: 25%;background-color: lightgray;height: 2px;border: 0 none;border-radius: 15px;">
                        <font style="font-weight: bold; font-size:18px;">REGISTORS</font>                        
                    </div>                                     
                    <div class="col-md-2" style="background-color: #6d98ab;padding: 10px 0px 10px 0px;">
                        <i class="fas fa-mobile" style="font-size: 40px;"></i><br>
                        <font style="font-size: 25px;font-weight:bolder;">36</font>
                        <hr style="width: 25%;background-color: lightgray;height: 2px;border: 0 none;border-radius: 15px;">
                        <font style="font-weight: bold; font-size:18px;">BRANDS</font>                        
                    </div>                                     
                    <div class="col-md-2" style="background-color: #6699cc;padding: 10px 0px 10px 0px;">
                        <i class="fas fa-mobile-alt" style="font-size: 40px;"></i><br>
                        <font style="font-size: 25px;font-weight:bolder;"><%= rs1.getInt("models") %></font>
                        <hr style="width: 25%;background-color: lightgray;height: 2px;border: 0 none;border-radius: 15px;">
                        <font style="font-weight: bold; font-size:18px;">MODELS</font>                        
                    </div>                                     
                    <div class="col-md-2" style="background-color: #3964c3;padding: 10px 0px 10px 0px;">
                        <i class="fas fa-comments" style="font-size: 40px;"></i><br>
                        <font style="font-size: 25px;font-weight:bolder;"><%= rs2.getInt("comments") %></font>
                        <hr style="width: 25%;background-color: lightgray;height: 2px;border: 0 none;border-radius: 15px;">
                        <font style="font-weight: bold; font-size:18px;">REVIEWS</font>                        
                    </div>              
                    <div class="col-md-2" style="background-color: #5a6f8e;padding: 10px 0px 10px 0px;">
                        <i class="fas fa-comment-dots" style="font-size: 40px;"></i><br>
                        <font style="font-size: 25px;font-weight:bolder;"><%= rs3.getInt("todaycomments") %></font>
                        <hr style="width: 25%;background-color: lightgray;height: 2px;border: 0 none;border-radius: 15px;">
                        <font style="font-weight: bold; font-size:18px;">REVIEWS TODAY</font>                        
                    </div>              
                </div>            
            </center>
            <!--<form action="../Counter" method="GET" style="display: none;">
                <input id="getcount" type="submit" />
            </form>-->
        </div>            
        <script>
            /*$(document).ready(function() {
                $("#getcount").click();
            });*/
        </script>
    </body>
</html>
