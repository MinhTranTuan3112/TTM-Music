package controller;

import Song.SongDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Users.*;
import album.AlbumDTO;
import artist.ArtistDTO;
import java.util.ArrayList;
import playlist.PlaylistDAO;
import playlist.PlaylistDTO;

@WebServlet(name = "LibraryController", urlPatterns = {"/library"})
public class LibraryController extends HttpServlet {

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
            out.println("<title>Servlet LibraryController</title>");
            out.println("</head>");
            out.println("<body>");
            HttpSession session = request.getSession(false);
//            if (session.getAttribute("usersession") == null) {
//                request.setAttribute("message", "Please Login first!!");
//                request.getRequestDispatcher("login.jsp").forward(request, response);
//                return;
//            }
            String action = request.getParameter("action");
            PlaylistDAO playlistDAO = new PlaylistDAO();
            if (action == null || action.trim().isEmpty()) {
                UserDTO usersession = (UserDTO) (session.getAttribute("usersession"));
                if (usersession != null) {
                    String username = usersession.getUsername();
                    ArrayList<SongDTO> user_song_list = UserDAO.getAllFavorites(SongDTO.class, username);
                    ArrayList<AlbumDTO> user_album_list = UserDAO.getAllFavorites(AlbumDTO.class, username);
                    ArrayList<ArtistDTO> user_artist_list = UserDAO.getAllFavorites(ArtistDTO.class, username);
                    ArrayList<PlaylistDTO> user_playlist_list = UserDAO.getAllFavorites(PlaylistDTO.class, username);
                    for (PlaylistDTO playlistDTO : user_playlist_list) {
                        playlistDTO.setSong_list(playlistDAO.getAllSongsOfAPlaylist(playlistDTO.getPlaylistid()));
                    }
                    request.setAttribute("user_song_list", user_song_list);
                    request.setAttribute("user_album_list", user_album_list);
                    request.setAttribute("user_artist_list", user_artist_list);
                    request.setAttribute("user_playlist_list", user_playlist_list);
                }
                request.getRequestDispatcher("library.jsp").forward(request, response);
            } else if (action.equals("search")) {
                UserDTO usersession = (UserDTO) (session.getAttribute("usersession"));
                if (usersession != null) {
                    String search_keyword = request.getParameter("search_keyword");
                    String username = usersession.getUsername();
                    ArrayList<SongDTO> user_song_list = UserDAO.searchFavoriteItem(search_keyword, username, SongDTO.class);
                    ArrayList<AlbumDTO> user_album_list = UserDAO.searchFavoriteItem(search_keyword, username, AlbumDTO.class);
                    ArrayList<ArtistDTO> user_artist_list = UserDAO.searchFavoriteItem(search_keyword, username, ArtistDTO.class);
                    ArrayList<PlaylistDTO> user_playlist_list = UserDAO.searchFavoriteItem(search_keyword, username, PlaylistDTO.class);
                    for (PlaylistDTO playlistDTO : user_playlist_list) {
                        playlistDTO.setSong_list(playlistDAO.getAllSongsOfAPlaylist(playlistDTO.getPlaylistid()));
                    }
                    request.setAttribute("user_song_list", user_song_list);
                    request.setAttribute("user_album_list", user_album_list);
                    request.setAttribute("user_artist_list", user_artist_list);
                    request.setAttribute("user_playlist_list", user_playlist_list);
                    request.getRequestDispatcher("library.jsp").forward(request, response);
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
