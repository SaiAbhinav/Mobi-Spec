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
import java.sql.DriverManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

/**
 *
 * @author saiab
 */
public class getUsers extends HttpServlet {

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
        /*response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {         
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet getUsers</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet getUsers at " + request.getContextPath() + "</h1>");
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
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobispec?" + "user=root&password=");
            Statement st = con.createStatement();
            String user = request.getParameter("ttr");
            ResultSet rs = null;
            if(user.equals("users")) {
                rs = st.executeQuery("SELECT * FROM users"); 
            }

            // creating document
            DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();  
            Document doc = dBuilder.newDocument();
            
            // root element
            Element rootElement = doc.createElement("users");
            doc.appendChild(rootElement);

            while(rs.next()) {
                // user element
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
                // password element
                Element passwordElement = doc.createElement("password");
                passwordElement.appendChild(doc.createTextNode(rs.getString("password")));
                userElement.appendChild(passwordElement);
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
                preferencesElement.appendChild(doc.createTextNode(rs.getString("preferences")));
                userElement.appendChild(preferencesElement);
                // nation element
                Element nationElement = doc.createElement("nation");
                nationElement.appendChild(doc.createTextNode(rs.getString("nationality")));
                userElement.appendChild(nationElement);            
            }

            // writing into xml file
            TransformerFactory tFactory = TransformerFactory.newInstance();
            Transformer tFormer = tFactory.newTransformer();
            DOMSource source = new DOMSource(doc);
            StreamResult result = new StreamResult(new File("F:\\NetCentric\\mobi_spec\\web\\admin\\users\\userdata.xml"));
            tFormer.transform(source, result);
 
        }catch(Exception e) {
            out.println(e);
        }
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
