package controller;

import Song.SongDTO;
import album.AlbumDAO;
import album.AlbumDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Users.*;
@WebServlet(name = "AlbumController", urlPatterns = {"/album"})
public class AlbumController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AlbumController</title>");
            out.println("</head>");
            out.println("<body>");
            String action = request.getParameter("action");
            if (action == null || action.trim().isEmpty()) {
                String albumid = request.getParameter("albumid");
                boolean isLiked = false;
                HttpSession session = request.getSession(false);
                if (session != null) {
                    if (session.getAttribute("usersession") != null) {
                        UserDTO userDTO = (UserDTO)(session.getAttribute("usersession"));
                        String username = userDTO.getUsername();
                        isLiked = (UserDAO.checkFavItemExist(username, "album", albumid));
                    }
                }
                AlbumDAO albumDAO = new AlbumDAO();
                AlbumDTO albumDTO = albumDAO.load(albumid);
                ArrayList<SongDTO> song_list = albumDAO.getAllSongsOfAnAlbum(albumid);
                request.setAttribute("album", albumDTO);
                request.setAttribute("song_list", song_list);
                request.setAttribute("isLiked", isLiked);
                request.getRequestDispatcher("album.jsp").forward(request, response);
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
