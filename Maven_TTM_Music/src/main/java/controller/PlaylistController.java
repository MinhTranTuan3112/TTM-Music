package controller;

import Song.SongDAO;
import Song.SongDTO;
import Users.UserDAO;
import Users.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import playlist.PlaylistDAO;
import playlist.PlaylistDTO;

@WebServlet(name = "PlaylistController", urlPatterns = {"/playlist"})
public class PlaylistController extends HttpServlet {

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
            String action = request.getParameter("action");
            if (action == null || action.trim().isEmpty()) {
                String playlistid = request.getParameter("playlistid");
                boolean isLiked = false;
                HttpSession session = request.getSession(false);
                if (session != null) {
                    if (session.getAttribute("usersession") != null) {
                        UserDTO userDTO = (UserDTO)(session.getAttribute("usersession"));
                        String username = userDTO.getUsername();
                        isLiked = (UserDAO.checkFavItemExist(username, "playlist",playlistid));
                    }
                }
                PlaylistDAO playlistDAO = new PlaylistDAO();
                PlaylistDTO playlistDTO = playlistDAO.load(playlistid);
                ArrayList<SongDTO> song_list = playlistDAO.getAllSongsOfAPlaylist(playlistid);
                boolean personalPlaylist = false;
                request.setAttribute("isLiked", isLiked);
                request.setAttribute("personalPlaylist", personalPlaylist);
                request.setAttribute("playlist", playlistDTO);
                request.setAttribute("song_list", song_list);
                request.getRequestDispatcher("playlist.jsp").forward(request, response);
            } else if (action.equals("create")) {
                boolean personalPlaylist = true;
                SongDAO songDAO = new SongDAO();
                ArrayList<SongDTO> lib_song_list = songDAO.getAllSong();
                request.setAttribute("personalPlaylist", personalPlaylist);
                request.setAttribute("lib_song_list", lib_song_list);
                request.getRequestDispatcher("playlist.jsp").forward(request, response);
            }
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
