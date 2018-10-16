package org.apache.jsp.html;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Login</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css\" integrity=\"sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B\" crossorigin=\"anonymous\">\n");
      out.write("                \n");
      out.write("        <script src=\"https://code.jquery.com/jquery-3.3.1.slim.min.js\" integrity=\"sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js\" integrity=\"sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js\" integrity=\"sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em\" crossorigin=\"anonymous\"></script>      \n");
      out.write("        \n");
      out.write("        <link rel=\"stylesheet\" href=\"https://use.fontawesome.com/releases/v5.1.1/css/all.css\" integrity=\"sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ\" crossorigin=\"anonymous\">        \n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"../css/login.css\">\n");
      out.write("        <script src=\"../js/loginValidate.js\"></script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
      uservalidation.ValidateBean uvalid = null;
      synchronized (_jspx_page_context) {
        uvalid = (uservalidation.ValidateBean) _jspx_page_context.getAttribute("uvalid", PageContext.PAGE_SCOPE);
        if (uvalid == null){
          uvalid = new uservalidation.ValidateBean();
          _jspx_page_context.setAttribute("uvalid", uvalid, PageContext.PAGE_SCOPE);
        }
      }
      out.write("\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.introspecthelper(_jspx_page_context.findAttribute("uvalid"), "uname", request.getParameter("uname"), request, "uname", false);
      out.write("\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.introspecthelper(_jspx_page_context.findAttribute("uvalid"), "psw", request.getParameter("psw"), request, "psw", false);
      out.write("\n");
      out.write("        \n");
      out.write("        <div class=\"container\"> \n");
      out.write("\t<center>               \n");
      out.write("            <div class=\"alert alert-warning\">\n");
      out.write("                ");
      out.print( uvalid.validate(uvalid.getPsw(), uvalid.getUname()) );
      out.write("\n");
      out.write("                <strong>Please login to continue! ");
      out.write(org.apache.jasper.runtime.JspRuntimeLibrary.toString((((uservalidation.ValidateBean)_jspx_page_context.findAttribute("uvalid")).getUname())));
      out.write(" & ");
      out.write(org.apache.jasper.runtime.JspRuntimeLibrary.toString((((uservalidation.ValidateBean)_jspx_page_context.findAttribute("uvalid")).getPsw())));
      out.write("</strong>\n");
      out.write("            </div>\n");
      out.write("            <table border=\"0\" cellspacing=0 width=\"80%\">\n");
      out.write("\t\t<tr>\n");
      out.write("                    <td width=\"50%\"></td>\n");
      out.write("                    <td width=\"50%\">\n");
      out.write("                        <form name=\"loginForm\" method=\"GET\" action=\"login.jsp\">  \n");
      out.write("                            <div class=\"container\" style=\"padding: 30px;\">\n");
      out.write("                                <label for=\"uname\"><b>Username</b></label>\n");
      out.write("                                <input type=\"text\" placeholder=\"Enter Username\" name=\"uname\" required>\n");
      out.write("                                <label for=\"psw\"><b>Password</b></label>\n");
      out.write("                                <input type=\"password\" placeholder=\"Enter Password\" name=\"psw\" required>\n");
      out.write("                                <button type=\"submit\">Login</button>        \n");
      out.write("                            </div>                            \n");
      out.write("                        </form>\n");
      out.write("                    </td>\n");
      out.write("\t\t</tr>\n");
      out.write("            </table>\n");
      out.write("\t</center>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>");
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
