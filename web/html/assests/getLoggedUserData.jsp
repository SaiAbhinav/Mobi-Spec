<%-- 
    Document   : getLoggedUserData
    Created on : 2 Sep, 2018, 11:00:58 PM
    Author     : saiab
--%>

<%@page import="javax.xml.transform.OutputKeys"%>
<%@page import="javax.xml.transform.stream.StreamResult"%>
<%@page import="java.io.File"%>
<%@page import="javax.xml.transform.dom.DOMSource"%>
<%@page import="javax.xml.transform.Transformer"%>
<%@page import="javax.xml.transform.TransformerFactory"%>
<%@page import="java.sql.*"%>
<%@page import="org.w3c.dom.*"%>
<%@page import="javax.xml.parsers.*"%>
<%
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobispec?" + "user=root&password=");
            int id = Integer.parseInt(session.getAttribute("id").toString());
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM users WHERE id="+id);
            if(rs.next()) {
                // creating document
                DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
                DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();  
                Document doc = dBuilder.newDocument();                
                // root element
                Element rootElement = doc.createElement("users");
                doc.appendChild(rootElement);
                //user element
                Element userElement = doc.createElement("user");
                rootElement.appendChild(userElement);
                // email element
                Element emailElement = doc.createElement("email");
                emailElement.appendChild(doc.createTextNode(rs.getString("email")));
                userElement.appendChild(emailElement);
                // username element
                Element usernameElement = doc.createElement("username");
                usernameElement.appendChild(doc.createTextNode(rs.getString("username")));
                userElement.appendChild(usernameElement);
                // gender element
                Element genderElement = doc.createElement("gender");
                genderElement.appendChild(doc.createTextNode(rs.getString("gender")));
                userElement.appendChild(genderElement);
                // dateofbirth element
                Element dobElement = doc.createElement("dob");
                dobElement.appendChild(doc.createTextNode(rs.getString("dateofbirth")));
                userElement.appendChild(dobElement);
                // address element
                Element addressElement = doc.createElement("address");
                addressElement.appendChild(doc.createTextNode(rs.getString("address")));
                userElement.appendChild(addressElement);                                               
                // preferences element
                Element preferencesElement = doc.createElement("preferences");
                //preferencesElement.appendChild(doc.createTextNode(rs.getString("preferences")));
                String prefs[] = rs.getString("preferences").split(",");
                for(String pref : prefs) {
                    Statement st1 = con.createStatement();
                    ResultSet rs1 = st1.executeQuery("SELECT * FROM brands WHERE name='"+pref+"'");
                    if(rs1.next()) {}
                    String id1 = ""+rs1.getInt("id");
                    Element prefElement = doc.createElement("pref");
                    prefElement.setAttribute("id", id1);
                    prefElement.appendChild(doc.createTextNode(pref)); 
                    preferencesElement.appendChild(prefElement);
                }
                userElement.appendChild(preferencesElement);
                // nation element
                Element nationElement = doc.createElement("nation");
                nationElement.appendChild(doc.createTextNode(rs.getString("nationality")));
                userElement.appendChild(nationElement);            

                // writing into xml file
                TransformerFactory tFactory = TransformerFactory.newInstance();
                Transformer tFormer = tFactory.newTransformer();                
                tFormer.setOutputProperty(OutputKeys.DOCTYPE_SYSTEM, "getLoggedUserData.dtd");                
                DOMSource source = new DOMSource(doc);
                StreamResult result = new StreamResult(new File("F:\\NetCentric\\mobi_spec\\web\\html\\assests\\getLoggedUserData.xml"));
                tFormer.transform(source, result);
            }            
%>
