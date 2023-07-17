package controller;

import Users.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific message occurs
     * @throws IOException if an I/O message occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginController</title>");
            out.println("</head>");
            out.println("<body>");
            
            String action = request.getParameter("action");
            UserDAO userDAO = new UserDAO();
            if (action == null || action.trim().isEmpty() || action.equals("logout")) {
                //If user log outs, kill the session then send users back to login page
                HttpSession session = request.getSession(false);
                if (session != null) {
                    //If remember me is not checked by the user, kill the session
                    if (session.getAttribute("rememberedAccount") == null || (boolean)session.getAttribute("rememberedAccount") == false) {
                        session.invalidate();
                    } 
                }
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else if (action.equals("login")) {
                //If user logins, catch 2 parameters: username and password
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                //Catch an extra parameter for remember me checkbox
                boolean rememberedAccount = (request.getParameter("remember_me") != null);
                UserDTO user = userDAO.login(username, password);
                if (user != null) {
                    //log in success: create usersession to save username and password then forward to the home page
                    HttpSession session = request.getSession(true);
                    session.setAttribute("usersession", user);
                    session.setAttribute("rememberedAccount", rememberedAccount);
                    response.sendRedirect("./home");
                } else {
                    //log in failed: sends user back to login page with message
                    request.setAttribute("message", "Wrong username or password");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            } else if (action.equals("signup")) {
                //Catch 3 parameters from signup.jsp: username, password and email
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String email = request.getParameter("email");
                if (!userDAO.checkUserNameExist(username)) {
                    //If username doesn't exist, add this account to table users by calling insert method
                    userDAO.SignUp(new UserDTO(username, password, email));
                    //Forward users to login page
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                } else {
                    //else if the username is already existed, send users back to signup page 
                    request.setAttribute("message", "This username is already existed!!");
                    request.getRequestDispatcher("signup.jsp").forward(request, response);
                }
            }
            
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific message occurs
     * @throws IOException if an I/O message occurs
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
     * @throws ServletException if a servlet-specific message occurs
     * @throws IOException if an I/O message occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
