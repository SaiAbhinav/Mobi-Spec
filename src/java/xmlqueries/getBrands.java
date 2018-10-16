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
import javax.servlet.annotation.WebServlet;
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
@WebServlet(name = "getBrands", urlPatterns = {"/getBrands"})
public class getBrands extends HttpServlet {

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
            out.println("<title>Servlet getBrands</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet getBrands at " + request.getContextPath() + "</h1>");
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
            if(user.equals("brands")) {
                rs = st.executeQuery("SELECT * FROM brands"); 
            }

            // creating document
            DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();  
            Document doc = dBuilder.newDocument();
            
            // root element
            Element rootElement = doc.createElement("brands");
            doc.appendChild(rootElement);

            while(rs.next()) {
                String id = ""+rs.getInt("id");
                Statement st1 = con.createStatement();
                ResultSet rs1 = st1.executeQuery("SELECT count(*) as cnt FROM mobiles WHERE brand_id="+rs.getInt("id"));
                if(rs1.next()) {}
                // user element
                Element brandElement = doc.createElement("brand");
                rootElement.appendChild(brandElement);            
                // id element
                Element idElement = doc.createElement("id");
                idElement.appendChild(doc.createTextNode(id));
                brandElement.appendChild(idElement);
                // name element
                Element nameElement = doc.createElement("name");
                nameElement.appendChild(doc.createTextNode(rs.getString("name")));
                brandElement.appendChild(nameElement); 
                // count element
                Element countElement = doc.createElement("count");
                countElement.appendChild(doc.createTextNode(rs1.getString("cnt")));
                brandElement.appendChild(countElement); 
            }

            // writing into xml file
            TransformerFactory tFactory = TransformerFactory.newInstance();
            Transformer tFormer = tFactory.newTransformer();
            DOMSource source = new DOMSource(doc);
            StreamResult result = new StreamResult(new File("F:\\NetCentric\\mobi_spec\\web\\admin\\brands\\brandsdata.xml"));
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
