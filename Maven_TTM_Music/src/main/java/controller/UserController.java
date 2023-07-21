package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Users.*;

@WebServlet(name = "UserController", urlPatterns = {"/user"})
public class UserController extends HttpServlet {

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
        String action = request.getParameter("action");
        UserDAO userDAO = new UserDAO();
        if (action.equals("edit")) {
            request.setAttribute("action", "update");
            String username = request.getParameter("username");
            UserDTO userDTO = userDAO.load(username);
            int songCount = userDAO.countFavItems("song", username);
            int albumCount = userDAO.countFavItems("album", username);
            int artistCount = userDAO.countFavItems("artist", username);
            int playlistCount = userDAO.countFavItems("playlist", username);
            request.setAttribute("songCount", songCount);
            request.setAttribute("albumCount", albumCount);
            request.setAttribute("artistCount", artistCount);
            request.setAttribute("playlistCount", playlistCount);
            request.setAttribute("user", userDTO);
            request.getRequestDispatcher("userdetails.jsp").forward(request, response);
        } else if (action.equals("delete")) {
            String username = request.getParameter("username");
            if (username == null || username.isEmpty()) {
                response.sendRedirect("./admin");
            }
            HttpSession session = request.getSession(false);
            if (session != null) {
                if (session.getAttribute("usersession") != null) {
                    UserDTO currentUser = (UserDTO)(session.getAttribute("usersession"));
                    String currentUserName = currentUser.getUsername();
                    if (username.equals(currentUserName)) {
                        request.setAttribute("message", "Can't delete this user since this user is logging in!!");
                        request.getRequestDispatcher("./admin").forward(request, response);
                        return;
                    }
                }
            }
            userDAO.deleteUser(username);
            response.sendRedirect("./admin");
        } else if (action.equals("update")) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String role = request.getParameter("role");
            UserDTO userDTO = new UserDTO(username, password, email, role);
            userDAO.updateUser(userDTO);
            response.sendRedirect("./admin");
        } else if (action.equals("create")) {
            request.setAttribute("action", "insert");
            request.getRequestDispatcher("userdetails.jsp").forward(request, response);
        } else if (action.equals("insert")) {
            String username = request.getParameter("username");
            if (userDAO.load(username) != null) {
                request.setAttribute("action", "insert");
                request.setAttribute("message", "This username is already existed!!!");
                request.getRequestDispatcher("userdetails.jsp").forward(request, response);
                return;
            }
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String role = request.getParameter("role");
            userDAO.insertUser(new UserDTO(username, password, email, role));
            response.sendRedirect("./admin");
        }
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
