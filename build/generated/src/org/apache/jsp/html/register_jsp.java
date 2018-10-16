package org.apache.jsp.html;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class register_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>Register</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css\" integrity=\"sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B\" crossorigin=\"anonymous\">\n");
      out.write("                \n");
      out.write("        <script src=\"https://code.jquery.com/jquery-3.3.1.slim.min.js\" integrity=\"sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js\" integrity=\"sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js\" integrity=\"sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em\" crossorigin=\"anonymous\"></script>      \n");
      out.write("        \n");
      out.write("        <link rel=\"stylesheet\" href=\"https://use.fontawesome.com/releases/v5.1.1/css/all.css\" integrity=\"sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ\" crossorigin=\"anonymous\">                \n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"../css/register.css\">\n");
      out.write("        <script src=\"../js/registerValidate.js\"></script>\n");
      out.write("    </head>\n");
      out.write("    <body>        \n");
      out.write("        <div class=\"container\" style=\"width:40%;margin: 0 auto;padding: 20px;\">            \n");
      out.write("            <form name=\"registrationForm\" onsubmit=\"return validate();\" action=\"mobispec/register\">\n");
      out.write("                <div class=\"container\" style=\"padding: 20px;\">\n");
      out.write("                    <fieldset>\n");
      out.write("                        <legend>User Details</legend>\n");
      out.write("                        <label for=\"email\">Email Address</label>\n");
      out.write("                        <input type=\"email\" name=\"email\" placeholder=\"Email Address\">\n");
      out.write("                        <label for=\"uname\">User Name</label> \n");
      out.write("                        <input type=\"text\" name=\"uname\" placeholder=\"User Name\">\n");
      out.write("                        <label for=\"psw\">Password</label>\n");
      out.write("                        <input type=\"password\" name=\"psw\" placeholder=\"Password\">\n");
      out.write("                        <label for=\"confpsw\">Confirm Password</label>\n");
      out.write("                        <input type=\"password\" name=\"confpsw\" placeholder=\"Confirm Password\">\n");
      out.write("                    </fieldset>\n");
      out.write("                    <br/>\n");
      out.write("                    <fieldset>\n");
      out.write("                        <legend>Personal Details</legend>\n");
      out.write("                        <table border=\"0\">\n");
      out.write("                            <tr>\n");
      out.write("                                <td style=\"width:50%;\">\n");
      out.write("                                    <!--<label for=\"gender\">Gender</label><br/><br/>\n");
      out.write("                                    <input type=\"radio\" name=\"gender\" value=\"male\"> Male\n");
      out.write("                                    <input type=\"radio\" name=\"gender\" value=\"female\"> Female-->\n");
      out.write("                                    <p style=\"margin-top: -25px;\">Gender</p>\n");
      out.write("                                  <label class=\"radio-container\">Male\n");
      out.write("                                    <input type=\"radio\" name=\"gender\" value=\"male\">\n");
      out.write("                                    <span class=\"radio-checkmark\"></span>\n");
      out.write("                                  </label>\n");
      out.write("                                  <label class=\"radio-container\">Female\n");
      out.write("                                      <input type=\"radio\" name=\"gender\" value=\"female\">\n");
      out.write("                                    <span class=\"radio-checkmark\"></span>\n");
      out.write("                                  </label>                                  \n");
      out.write("\n");
      out.write("                                </td>\n");
      out.write("                                <td style=\"width:50%;\">\n");
      out.write("                                    <label for=\"dob\">Date of Birth</label>\n");
      out.write("                                    <input type=\"date\" name=\"dob\" placeholder=\"Age\">\n");
      out.write("                                </td>\n");
      out.write("                            </tr>\n");
      out.write("                            <tr>\n");
      out.write("                                <td colspan=\"2\">\n");
      out.write("                                    <label for=\"address\">Address</label>\n");
      out.write("                                    <textarea name=\"address\" rows=\"3\" placeholder=\"Address\"></textarea>\n");
      out.write("                                </td>\n");
      out.write("                            </tr>\n");
      out.write("                            <tr>\n");
      out.write("                                <td colspan=\"2\">\n");
      out.write("                                    <!--<label for=\"pref\">Preferred Brands</label><br/><br/>\n");
      out.write("                                    <input type=\"checkbox\" name=\"pref\" value=\"samsung\"> Samsung \n");
      out.write("                                    <input type=\"checkbox\" name=\"pref\" value=\"oneplus\"> OnePlus\n");
      out.write("                                    <input type=\"checkbox\" name=\"pref\" value=\"apple\">Apple\n");
      out.write("                                    <input type=\"checkbox\" name=\"pref\" value=\"oppo\"> Oppo-->\n");
      out.write("                                    <p>Preferences</p>\n");
      out.write("                                    <label class=\"checkbox-container\">Samsung\n");
      out.write("                                        <input type=\"checkbox\" name=\"pref\" value=\"samsung\">\n");
      out.write("                                        <span class=\"checkbox-checkmark\"></span>\n");
      out.write("                                      </label>\n");
      out.write("                                      <label class=\"checkbox-container\">OnePlus\n");
      out.write("                                        <input type=\"checkbox\" name=\"pref\" value=\"oneplus\">\n");
      out.write("                                        <span class=\"checkbox-checkmark\"></span>\n");
      out.write("                                      </label>\n");
      out.write("                                      <label class=\"checkbox-container\">Apple\n");
      out.write("                                        <input type=\"checkbox\" name=\"pref\" value=\"apple\">\n");
      out.write("                                        <span class=\"checkbox-checkmark\"></span>\n");
      out.write("                                      </label>\n");
      out.write("                                      <label class=\"checkbox-container\">Oppo\n");
      out.write("                                        <input type=\"checkbox\" name=\"pref\" value=\"oppo\">\n");
      out.write("                                        <span class=\"checkbox-checkmark\"></span>\n");
      out.write("                                      </label>\n");
      out.write("                                </td>\n");
      out.write("                            </tr>\n");
      out.write("                        </table>    \n");
      out.write("                        <br/>\n");
      out.write("                        <label for=\"nation\">Nationality</label>\n");
      out.write("                        <select name=\"nation\">\n");
      out.write("                            <option value=\"\">Nation</option>\n");
      out.write("                            <option value=\"india\">India</option>\n");
      out.write("                            <option value=\"other\">Other</option>\n");
      out.write("                        </select>\n");
      out.write("                        \n");
      out.write("                    </fieldset>\n");
      out.write("                    <button type=\"submit\">Register</button>                    \n");
      out.write("                </div>\n");
      out.write("            </form>\n");
      out.write("        </div>\n");
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
