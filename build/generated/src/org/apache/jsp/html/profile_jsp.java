package org.apache.jsp.html;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.sql.*;

public final class profile_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css\" integrity=\"sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B\" crossorigin=\"anonymous\">\n");
      out.write("                \n");
      out.write("        <script src=\"https://code.jquery.com/jquery-3.3.1.slim.min.js\" integrity=\"sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js\" integrity=\"sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js\" integrity=\"sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em\" crossorigin=\"anonymous\"></script>      \n");
      out.write("        \n");
      out.write("        <link rel=\"stylesheet\" href=\"https://use.fontawesome.com/releases/v5.1.1/css/all.css\" integrity=\"sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ\" crossorigin=\"anonymous\">                \n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"../css/register.css\">        \n");
      out.write("        \n");
      out.write("        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/bootstrap-select.js\"></script>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.css\" />                        \n");
      out.write("        <style>\n");
      out.write(".avatar-upload {\n");
      out.write("  position: relative;\n");
      out.write("  max-width: 205px;\n");
      out.write("  margin: 50px auto;\n");
      out.write("}\n");
      out.write(".avatar-upload .avatar-edit {\n");
      out.write("  position: absolute;\n");
      out.write("  right: -8px;\n");
      out.write("  z-index: 1;\n");
      out.write("  top: 175px;\n");
      out.write("}\n");
      out.write(".avatar-upload .avatar-edit input {\n");
      out.write("  display: none;\n");
      out.write("}\n");
      out.write(".avatar-upload .avatar-edit input + label {\n");
      out.write("  display: inline-block;\n");
      out.write("  width: 34px;\n");
      out.write("  height: 34px;\n");
      out.write("  margin-bottom: 0;\n");
      out.write("  border-radius: 100%;\n");
      out.write("  background: #FFFFFF;\n");
      out.write("  border: 1px solid transparent;\n");
      out.write("  box-shadow: 3px 4px 6px #888;\n");
      out.write("  cursor: pointer;\n");
      out.write("  font-weight: normal;\n");
      out.write("  transition: all 0.2s ease-in-out;\n");
      out.write("}\n");
      out.write(".avatar-upload .avatar-edit input + label:hover {\n");
      out.write("  background: #f1f1f1;\n");
      out.write("  border-color: #d6d6d6;\n");
      out.write("}\n");
      out.write(".avatar-upload .avatar-edit input + label:after { \n");
      out.write("    font-family: 'Font Awesome 5 Free';\n");
      out.write("    content: \"\\f304\";\n");
      out.write("  font-weight: 900;\n");
      out.write("  color: #333;\n");
      out.write("  position: absolute;\n");
      out.write("  top: 5px;\n");
      out.write("  left: 0;\n");
      out.write("  right: 0;\n");
      out.write("  text-align: center;\n");
      out.write("  margin: auto;\n");
      out.write("}\n");
      out.write(".avatar-upload .avatar-preview {\n");
      out.write("  width: 200px;\n");
      out.write("  height: 200px;\n");
      out.write("  position: relative;\n");
      out.write("  border-radius: 0%;\n");
      out.write("  border: 6px solid #F8F8F8;\n");
      out.write("  box-shadow: 3px 4px 6px #888;\n");
      out.write("}\n");
      out.write(".avatar-upload .avatar-preview > div {\n");
      out.write("  width: 100%;\n");
      out.write("  height: 100%;\n");
      out.write("  border-radius: 0%;\n");
      out.write("  background-size: cover;\n");
      out.write("  background-repeat: no-repeat;\n");
      out.write("  background-position: center;\n");
      out.write("}\n");
      out.write("\n");
      out.write("  </style>\n");
      out.write("    </head>\n");
      out.write("    <body>                 \n");
      out.write("        ");

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobispec?" + "user=root&password=");

            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM users WHERE id='"+session.getAttribute("id")+"'");    
            if(rs.next()) {}
        
      out.write("                \n");
      out.write("        <div class=\"container\" style=\"margin-top: 20px;\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("            <div class=\"row\">                \n");
      out.write("                <div class=\"col-md-4\"> \n");
      out.write("                    <form class=\"form\" name=\"profileimgform\" method=\"POST\" action=\"../queries/updateprofileimg.jsp\" enctype=\"multipart/form-data\">                                                                                    \n");
      out.write("                            <div class=\"avatar-upload\" style=\"margin-top:15px;\">\n");
      out.write("                                <div class=\"avatar-edit\">\n");
      out.write("                                    <input type='file' id=\"imageUpload\" name=\"profile_img\" accept=\".png, .jpg, .jpeg\" />\n");
      out.write("                                    <label for=\"imageUpload\"></label>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"avatar-preview\">\n");
      out.write("                                    <div id=\"imagePreview\" style=\"background-image: url(../queries/profileimgcontainer.jsp?id=");
      out.print( session.getAttribute("id") );
      out.write(");\">\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>              \n");
      out.write("                                    <center>\n");
      out.write("                                    <div class=\"form-group\" style=\"margin-top:-20px;\">\n");
      out.write("                        <input type=\"submit\" class=\"form-control btn btn-success\" style=\"width: 70%;\" value=\"Update\" />\n");
      out.write("                                    </div>\n");
      out.write("                                    </center>\n");
      out.write("                    </form>\n");
      out.write("                        <div class=\"prefs\" style=\"margin-top: 20px;\">\n");
      out.write("                            <legend>Preferences</legend>                            \n");
      out.write("                            ");

                                String[] prefs = rs.getString("preferences").split(",");
                                ArrayList al = new ArrayList();                                                                
                                String row = "";
                                for(int i=0;i<prefs.length;i++) {
                                    al.add(prefs[i]);
                                    row += "<tr><td><a href='#'>"+prefs[i]+"</a></td></tr>";
                                }
                            
      out.write("\n");
      out.write("                            <form method=\"POST\" action=\"#\" style=\"margin-top:10px;\">\n");
      out.write("                                <select class=\"selectpicker form-control\" multiple data-selected-text-format=\"count 1\" data-max-options=\"5\" name=\"pref\">\n");
      out.write("                                    ");

                                        Statement st1 = con.createStatement();
                                        ResultSet rs1 = st1.executeQuery("SELECT * FROM brands"); 
                                        while(rs1.next()) {
                                            String model = rs1.getString("name");
                                            String sel = "";
                                            if(al.contains(model)) {
                                                sel = "selected";
                                            }else {
                                                sel = "";
                                            }
                                    
      out.write("\n");
      out.write("                                    <option value=\"");
      out.print( model );
      out.write('"');
      out.write(' ');
      out.print( sel );
      out.write('>');
      out.print( model );
      out.write("</option>\n");
      out.write("                                    ");

                                        }
                                    
      out.write("                                        \n");
      out.write("                                </select>\n");
      out.write("                                <div>\n");
      out.write("                                    <table class=\"table table-hover\" width=\"100%\">");
      out.print( row );
      out.write("</table>\n");
      out.write("                                </div>\n");
      out.write("                                <button class=\"btn btn-success\" type=\"submit\">Update Preferences</submit>\n");
      out.write("                            </form>                                                        \n");
      out.write("                        </div>                        \n");
      out.write("                </div>         \n");
      out.write("                    <div class=\"col-md-2\"></div>\n");
      out.write("                    <div class=\"col-md-6\">\n");
      out.write("                        <form class=\"form\" name=\"registrationForm\" onsubmit=\"return validate();\" action=\"../queries/newuser.jsp\" method=\"POST\">\n");
      out.write("                <div class=\"container\" style=\"padding: 20px;\">\n");
      out.write("                    <fieldset>\n");
      out.write("                        <legend>\n");
      out.write("                            User Details\n");
      out.write("                            <a href=\"#\" style=\"font-size:16px;margin-top:5px;\" class=\"float-right\">Change Password</a>\n");
      out.write("                        </legend>\n");
      out.write("                        <label for=\"email\">Email Address</label>\n");
      out.write("                        <input type=\"email\" name=\"email\" placeholder=\"Email Address\" value=\"");
      out.print( rs.getString("email") );
      out.write("\" disabled>\n");
      out.write("                        <label for=\"uname\">User Name</label> \n");
      out.write("                        <input type=\"text\" name=\"uname\" placeholder=\"User Name\" value=\"");
      out.print( rs.getString("username") );
      out.write("\" disabled>\n");
      out.write("                        <!--<label for=\"psw\">Password</label>\n");
      out.write("                        <input type=\"password\" name=\"psw\" placeholder=\"Password\">\n");
      out.write("                        <label for=\"confpsw\">Confirm Password</label>\n");
      out.write("                        <input type=\"password\" name=\"confpsw\" placeholder=\"Confirm Password\">-->\n");
      out.write("                    </fieldset>\n");
      out.write("                    <br/>\n");
      out.write("                    <fieldset>\n");
      out.write("                        <legend>Personal Details</legend>\n");
      out.write("                        <table border=\"0\">\n");
      out.write("                            <tr>\n");
      out.write("                                ");

                                    String gender = rs.getString("gender");
                                    String checkmale = "", checkfemale = "";
                                    if(gender.equals("male")) {
                                        checkmale = "checked";
                                        checkfemale = "";
                                    }else if(gender.equals("female")) {
                                        checkmale = "";
                                        checkfemale = "checked";
                                    }else {
                                        checkmale = "";
                                        checkfemale = "";
                                    }
                                
      out.write("\n");
      out.write("                                <td style=\"width:50%;\">\n");
      out.write("                                    <p style=\"margin-top: -25px;\">Gender</p>\n");
      out.write("                                  <label class=\"radio-container\">Male\n");
      out.write("                                      <input type=\"radio\" name=\"gender\" value=\"male\" ");
      out.print( checkmale );
      out.write(" disabled>\n");
      out.write("                                    <span class=\"radio-checkmark\"></span>\n");
      out.write("                                  </label>\n");
      out.write("                                  <label class=\"radio-container\">Female\n");
      out.write("                                      <input type=\"radio\" name=\"gender\" value=\"female\" ");
      out.print( checkfemale );
      out.write(" disabled>\n");
      out.write("                                    <span class=\"radio-checkmark\"></span>\n");
      out.write("                                  </label>                                  \n");
      out.write("\n");
      out.write("                                </td>\n");
      out.write("                                <td style=\"width:50%;\">\n");
      out.write("                                    <label for=\"dob\">Date of Birth</label>\n");
      out.write("                                    <input type=\"date\" name=\"dob\" value=\"");
      out.print( rs.getString("dateofbirth") );
      out.write("\" disabled>\n");
      out.write("                                </td>\n");
      out.write("                            </tr>\n");
      out.write("                            <tr>\n");
      out.write("                                <td colspan=\"2\">\n");
      out.write("                                    <label for=\"address\">Address</label>\n");
      out.write("                                    <textarea name=\"address\" rows=\"3\" placeholder=\"Address\">");
      out.print( rs.getString("address") );
      out.write("</textarea>\n");
      out.write("                                </td>\n");
      out.write("                            </tr>                            \n");
      out.write("                        </table>    \n");
      out.write("                        <br/>\n");
      out.write("                        ");

                            String nation = rs.getString("nationality");
                            String nationindia = "", nationother = "";
                            if(nation.equals("india")) {
                                nationindia = "selected";
                                nationother = "";
                            }else if(nation.equals("other")) {
                                nationindia = "";
                                nationother = "selected";
                            }else {
                                nationindia = "";
                                nationother = "";
                            }
                        
      out.write("\n");
      out.write("                        <label for=\"nation\">Nationality</label>\n");
      out.write("                        <select name=\"nation\">\n");
      out.write("                            <option value=\"\">Nation</option>\n");
      out.write("                            <option value=\"india\" ");
      out.print( nationindia );
      out.write(" >India</option>\n");
      out.write("                            <option value=\"other\" ");
      out.print( nationother );
      out.write(" >Other</option>\n");
      out.write("                        </select>                        \n");
      out.write("                    </fieldset>\n");
      out.write("                    <button type=\"submit\">Update</button>                    \n");
      out.write("                </div>\n");
      out.write("            </form>\n");
      out.write("                    </div>\n");
      out.write("            </div>\n");
      out.write("                    </div>\n");
      out.write("        </div>\n");
      out.write("                        <script\n");
      out.write("  src=\"https://code.jquery.com/jquery-3.3.1.min.js\"\n");
      out.write("  integrity=\"sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=\"\n");
      out.write("  crossorigin=\"anonymous\"></script>\n");
      out.write("                        <script>\n");
      out.write("function readURL(input) {\n");
      out.write("    if (input.files && input.files[0]) {\n");
      out.write("        var reader = new FileReader();\n");
      out.write("        reader.onload = function(e) {\n");
      out.write("            $('#imagePreview').css('background-image', 'url('+e.target.result +')');\n");
      out.write("            $('#imagePreview').hide();\n");
      out.write("            $('#imagePreview').fadeIn(650);\n");
      out.write("        }\n");
      out.write("        reader.readAsDataURL(input.files[0]);\n");
      out.write("    }\n");
      out.write("}\n");
      out.write("$(\"#imageUpload\").change(function() {\n");
      out.write("    readURL(this);\n");
      out.write("});\n");
      out.write("</script>\n");
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
