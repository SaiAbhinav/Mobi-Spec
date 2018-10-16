/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package xmlqueries;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.XMLConstants;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;
import javax.xml.validation.Validator;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

/**
 *
 * @author saiab
 */
public class registerwithxml extends HttpServlet {

 static String preflist = "";

 /**
  * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
  * methods.
  *
  * @param request servlet request
  * @param response servlet response
  * @throws ServletException if a servlet-specific error occurs
  * @throws IOException if an I/O error occurs
  */
 protected void processRequest(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
  response.setContentType("text/html;charset=UTF-8");
  /*try (PrintWriter out = response.getWriter()) {            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet registerwithxml</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet registerwithxml at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }*/
 }

 // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
 /**
  * Handles the HTTP <code>GET</code> method.
  *
  * @param request servlet request
  * @param response servlet response
  * @throws ServletException if a servlet-specific error occurs
  * @throws IOException if an I/O error occurs
  */
 @Override
 protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
  processRequest(request, response);
 }

 /**
  * Handles the HTTP <code>POST</code> method.
  *
  * @param request servlet request
  * @param response servlet response
  * @throws ServletException if a servlet-specific error occurs
  * @throws IOException if an I/O error occurs
  */
 @Override
 protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
  processRequest(request, response);
  PrintWriter out = response.getWriter();

  String email = request.getParameter("email");
  String username = request.getParameter("uname");
  String password = request.getParameter("psw");

  String gender = request.getParameter("gender");
  String dob = request.getParameter("dob");
  String address = request.getParameter("address");
  String prefs[] = request.getParameterValues("pref");
  for (String pref1 : prefs) {
   preflist += pref1 + ",";
  }
  preflist = preflist.substring(0, preflist.length() - 1);
  String nation = request.getParameter("nation");

  try {
   // creating document
   DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
   DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
   Document doc = dBuilder.newDocument();

   // root element
   Element rootElement = doc.createElement("users");
   doc.appendChild(rootElement);
   // set schema location
   rootElement.setAttribute("xmlns:xsi", "http://www.w3.org/2001/XMLSchema-instance");
   rootElement.setAttribute("xsi:noNamespaceSchemaLocation", "registeruserschema.xsd");
   // user element
   Element userElement = doc.createElement("user");
   rootElement.appendChild(userElement);
   // email element
   Element emailElement = doc.createElement("email");
   emailElement.appendChild(doc.createTextNode(email));
   userElement.appendChild(emailElement);
   // username element
   Element usernameElement = doc.createElement("username");
   usernameElement.appendChild(doc.createTextNode(username));
   userElement.appendChild(usernameElement);
   // password element
   Element passwordElement = doc.createElement("password");
   passwordElement.appendChild(doc.createTextNode(password));
   userElement.appendChild(passwordElement);
   // gender element
   Element genderElement = doc.createElement("gender");
   genderElement.appendChild(doc.createTextNode(gender));
   userElement.appendChild(genderElement);
   // dateofbirth element
   Element dobElement = doc.createElement("dob");
   dobElement.appendChild(doc.createTextNode(dob));
   userElement.appendChild(dobElement);
   // address element
   Element addressElement = doc.createElement("address");
   addressElement.appendChild(doc.createTextNode(address));
   userElement.appendChild(addressElement);
   // preferences element            
   for (String pref : prefs) {
    Element preferencesElement = doc.createElement("preferences");
    preferencesElement.appendChild(doc.createTextNode(pref));
    userElement.appendChild(preferencesElement);
   }
   // nation element
   Element nationElement = doc.createElement("nation");
   nationElement.appendChild(doc.createTextNode(nation));
   userElement.appendChild(nationElement);

   // writing into xml file
   TransformerFactory tFactory = TransformerFactory.newInstance();
   Transformer tFormer = tFactory.newTransformer();
   DOMSource source = new DOMSource(doc);
   StreamResult result = new StreamResult(new File("F:\\NetCentric\\mobi_spec\\src\\java\\xmlqueries\\registeruserxmldata.xml"));
   tFormer.transform(source, result);

   // success statement
   //out.println("successful");
   boolean validated = validateXMLSchema("F:\\NetCentric\\mobi_spec\\src\\java\\xmlqueries\\registeruserschema.xsd", "F:\\NetCentric\\mobi_spec\\src\\java\\xmlqueries\\registeruserxmldata.xml");
   if (validated) {
    boolean added = addtoDB("F:\\NetCentric\\mobi_spec\\src\\java\\xmlqueries\\registeruserxmldata.xml");
    //out.println(added);
    if (added) {
     response.sendRedirect("html\\login.jsp");
    } else {
     response.sendRedirect("html\\register.jsp");
    }
   } else {
    out.println("error");
   }

  } catch (Exception e) {
   out.println(e);
  }

 }

 private static boolean validateXMLSchema(String xsdPath, String xmlPath) throws SAXException {
  try {
   SchemaFactory factory = SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI);
   Schema schema = factory.newSchema(new File(xsdPath));
   Validator validator = schema.newValidator();
   validator.validate(new StreamSource(new File(xmlPath)));
  } catch (IOException | SAXException e) {
   System.out.println("Exception: " + e.getMessage());
   return false;
  }
  return true;
 }

 private static boolean addtoDB(String xmlPath) throws Exception {
  Class.forName("com.mysql.jdbc.Driver");
  boolean msg;
  /**/
  try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobispec", "root", "")) {
   /**/
   DocumentBuilderFactory dbFactory1 = DocumentBuilderFactory.newInstance();
   DocumentBuilder dBuilder1 = dbFactory1.newDocumentBuilder();
   Document doc1 = dBuilder1.parse(new File(xmlPath));
   doc1.getDocumentElement().normalize();
   msg = false;
   // get Node List
   NodeList userList = doc1.getElementsByTagName("users");
   for (int i = 0; i < userList.getLength(); i++) {
    String query = "INSERT INTO users(email,username,password,gender,dateofbirth,address,nationality,preferences) VALUES(?,?,?,?,?,?,?,?)";
    PreparedStatement ps = con.prepareStatement(query);
    Node userData = userList.item(i);
    if (userData.getNodeType() == Node.ELEMENT_NODE) {
     Element userElement = (Element) userData;
     String email = userElement.getElementsByTagName("email").item(0).getTextContent();
     String username = userElement.getElementsByTagName("username").item(0).getTextContent();
     String password = userElement.getElementsByTagName("password").item(0).getTextContent();
     String gender = userElement.getElementsByTagName("gender").item(0).getTextContent();
     String dob = userElement.getElementsByTagName("dob").item(0).getTextContent();
     String address = userElement.getElementsByTagName("address").item(0).getTextContent();
     // String preferences = userElement.getElementsByTagName("preferences").item(0).getTextContent();
     String preferences = preflist;
     String nation = userElement.getElementsByTagName("nation").item(0).getTextContent();
     ps.setString(1, email);
     ps.setString(2, username);
     ps.setString(3, password);
     ps.setString(4, gender);
     ps.setString(5, dob);
     ps.setString(6, address);
     ps.setString(7, nation);
     ps.setString(8, preferences);
     ps.execute();
     msg = true;
    }
   }
  }
  return msg;
 }

 /**
  * Returns a short description of the servlet.
  *
  * @return a String containing servlet description
  */
 @Override
 public String getServletInfo() {
  return "Short description";
 }// </editor-fold>

}
