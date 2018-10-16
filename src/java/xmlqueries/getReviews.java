/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package xmlqueries;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
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
public class getReviews extends HttpServlet {

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
            out.println("<title>Servlet getReviews</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet getReviews at " + request.getContextPath() + "</h1>");
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
            if(user.equals("reviews")) {
                rs = st.executeQuery("SELECT * FROM reviews"); 
            }

            // creating document
            DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();  
            Document doc = dBuilder.newDocument();
            
            // root element
            Element rootElement = doc.createElement("reviews");
            doc.appendChild(rootElement);

            while(rs.next()) {
                String id = ""+rs.getInt("id");
                Statement st1 = con.createStatement();
                ResultSet rs1 = st1.executeQuery("SELECT name FROM mobiles WHERE id="+rs.getInt("mobile_id"));
                if(rs1.next()) {}
                Statement st2 = con.createStatement();
                ResultSet rs2 = st2.executeQuery("SELECT username FROM users WHERE id="+rs.getInt("user_id"));
                if(rs2.next()) {}
                // review element
                Element reviewElement = doc.createElement("review");
                rootElement.appendChild(reviewElement);            
                // id element
                Element idElement = doc.createElement("id");
                idElement.appendChild(doc.createTextNode(id));
                reviewElement.appendChild(idElement); 
                // mobile element
                Element mobileElement = doc.createElement("mobile");
                mobileElement.appendChild(doc.createTextNode(rs1.getString("name")));
                reviewElement.appendChild(mobileElement);
                // user element
                Element userElement = doc.createElement("user");
                userElement.appendChild(doc.createTextNode(rs2.getString("username")));
                reviewElement.appendChild(userElement);
                // text element
                Element textElement = doc.createElement("text");
                textElement.appendChild(doc.createTextNode(rs.getString("review")));
                reviewElement.appendChild(textElement);
                // time element
                Element timeElement = doc.createElement("time");
                timeElement.appendChild(doc.createTextNode(rs.getString("time")));
                reviewElement.appendChild(timeElement);
            }

            // writing into xml file
            TransformerFactory tFactory = TransformerFactory.newInstance();
            Transformer tFormer = tFactory.newTransformer();
            DOMSource source = new DOMSource(doc);
            StreamResult result = new StreamResult(new File("F:\\NetCentric\\mobi_spec\\web\\admin\\reviews\\reviewsdata.xml"));
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
