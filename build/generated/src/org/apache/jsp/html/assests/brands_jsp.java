package org.apache.jsp.html.assests;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.lang.*;
import java.sql.*;

public final class brands_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Brands</title>\n");
      out.write("        <meta name=\"author\" content=\"sanjay\">\n");
      out.write("\n");
      out.write("        <!-- CSS -->\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"../../css/brands.css\">\n");
      out.write("    </head>\n");
      out.write("    <body onload=\"loadXMLDoc()\">            \n");
      out.write("        <div id=\"brands\">\n");
      out.write("            <table border=\"0\" cellspacing=0>\n");
      out.write("                <thead><tr><th colspan=\"6\"><h3>CHOOSE A BRAND</h3></th></tr></thead>\n");
      out.write("                <tbody id=\"brandslist\"></tbody>\n");
      out.write("            </table>\n");
      out.write("        </div>\n");
      out.write("        <script>\n");
      out.write("            function loadXMLDoc() {\n");
      out.write("                var xmlhttp = new XMLHttpRequest();\n");
      out.write("                xmlhttp.onreadystatechange = function() {\n");
      out.write("                    if (this.readyState == 4 && this.status == 200) {\n");
      out.write("                        myFunction(this);\n");
      out.write("                    }\n");
      out.write("                };\n");
      out.write("                xmlhttp.open(\"GET\", \"brandsdata.xml\", true);\n");
      out.write("                xmlhttp.send();\n");
      out.write("            }\n");
      out.write("            function myFunction(xml) {\n");
      out.write("                var i;\n");
      out.write("                var xmlDoc = xml.responseXML;\n");
      out.write("                var table=\"\";\n");
      out.write("                var x = xmlDoc.getElementsByTagName(\"brands\");\n");
      out.write("                for (i = 0; i<x.length-4; i=i+4) {  \n");
      out.write("                    table += \"<tr>\"\n");
      out.write("                                + \"<td><a href='../brandinfo.jsp?id=\"+x[i].getAttribute(\"id\")+\"' target='myFrame'>\"+x[i].getElementsByTagName(\"brand\")[0].childNodes[0].nodeValue+\"<a></td>\"\n");
      out.write("                                + \"<td><a href='../brandinfo.jsp?id=\"+x[i+1].getAttribute(\"id\")+\"' target='myFrame'>\"+x[i+1].getElementsByTagName(\"brand\")[0].childNodes[0].nodeValue+\"</a></td>\"\n");
      out.write("                                + \"<td><a href='../brandinfo.jsp?id=\"+x[i+2].getAttribute(\"id\")+\"' target='myFrame'>\"+x[i+2].getElementsByTagName(\"brand\")[0].childNodes[0].nodeValue+\"</a></td>\"\n");
      out.write("                                + \"<td><a href='../brandinfo.jsp?id=\"+x[i+4].getAttribute(\"id\")+\"' target='myFrame'>\"+x[i+3].getElementsByTagName(\"brand\")[0].childNodes[0].nodeValue+\"</a></td>\"\n");
      out.write("                            + \"</tr>\";\n");
      out.write("                    /*table += \"<tr><td>\" + x[i].getAttribute(\"id\") +\n");
      out.write("                        \"</td><td>\" +\n");
      out.write("                        x[i].getElementsByTagName(\"email\")[0].childNodes[0].nodeValue +\n");
      out.write("                        \"</td><td>\" +\n");
      out.write("                        x[i].getElementsByTagName(\"username\")[0].childNodes[0].nodeValue +\n");
      out.write("                        \"</td><td>\" +\n");
      out.write("                        x[i].getElementsByTagName(\"password\")[0].childNodes[0].nodeValue +\n");
      out.write("                        \"</td><td>\" +\n");
      out.write("                        x[i].getElementsByTagName(\"gender\")[0].childNodes[0].nodeValue +\n");
      out.write("                        \"</td><td>\" +\n");
      out.write("                        x[i].getElementsByTagName(\"address\")[0].childNodes[0].nodeValue +\n");
      out.write("                        \"</td><td>\" +\n");
      out.write("                        x[i].getElementsByTagName(\"nationality\")[0].childNodes[0].nodeValue +\n");
      out.write("                        \"</td></tr>\";*/\n");
      out.write("                }\n");
      out.write("                document.getElementById(\"brandslist\").innerHTML = table;\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
