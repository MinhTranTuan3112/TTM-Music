package controller;

import album.*;
import Song.SongDAO;
import Song.SongDTO;
import Users.UserDAO;
import Users.UserDTO;
import artist.ArtistDAO;
import artist.ArtistDTO;
import categories.CategoriesDAO;
import categories.CategoryDTO;
import have_song_categories.have_song_categoriesDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import playlist.*;

@WebServlet(name = "HomeController", urlPatterns = {"/home"})
public class HomeController extends HttpServlet {

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
            ArrayList<SongDTO> home_song_list;
            ArrayList<AlbumDTO> home_album_list;
            ArrayList<ArtistDTO> home_artist_list;
            ArrayList<CategoryDTO> home_category_list;
            ArrayList<PlaylistDTO> home_playlist_list;
            SongDAO songDAO = new SongDAO();
            AlbumDAO albumDAO = new AlbumDAO();
            ArtistDAO artistDAO = new ArtistDAO();
            CategoriesDAO categoriesDAO = new CategoriesDAO();
            PlaylistDAO playlistDAO = new PlaylistDAO();
            if (action == null || action.trim().isEmpty()) {
                if (request.getAttribute("message") != null) {
                    String message = request.getAttribute("message").toString();
                    request.setAttribute("message", message);
                }
                home_category_list = categoriesDAO.getTop4Categories();
                home_song_list = songDAO.getTop8Songs();
                home_album_list = albumDAO.getTop3Albums();
                home_artist_list = artistDAO.getTop4Artist();
                home_playlist_list = playlistDAO.getTop4Playlists();
                HttpSession session = request.getSession(false);
                if (session != null) {
                    if (session.getAttribute("usersession") != null) {
                        ArrayList<SongDTO> user_song_list;
                        UserDTO userDTO = (UserDTO) (session.getAttribute("usersession"));
                        String username = userDTO.getUsername();
                        user_song_list = UserDAO.getAllFavorites(SongDTO.class, username);
                        request.setAttribute("user_song_list", user_song_list);
                    }
                }
                for (PlaylistDTO playlistDTO : home_playlist_list) {
                    playlistDTO.setSong_list(playlistDAO.getAllSongsOfAPlaylist(playlistDTO.getPlaylistid()));
                }
                request.setAttribute("home_album_list", home_album_list);
                request.setAttribute("home_song_list", home_song_list);
                request.setAttribute("home_artist_list", home_artist_list);
                request.setAttribute("home_category_list", home_category_list);
                request.setAttribute("home_playlist_list", home_playlist_list);
                request.getRequestDispatcher("MusicPage.jsp").forward(request, response);
            } else if (action.equals("searchbycategory")) {
                String categoryid = request.getParameter("categoryid");
                home_category_list = categoriesDAO.getTop4Categories();
                home_song_list = have_song_categoriesDAO.getSongsFromCategory(categoryid);
                home_album_list = albumDAO.getTop3Albums();
                home_artist_list = artistDAO.getTop4Artist();
                home_playlist_list = playlistDAO.getTop4Playlists();
                HttpSession session = request.getSession(false);
                if (session != null) {
                    if (session.getAttribute("usersession") != null) {
                        ArrayList<SongDTO> user_song_list;
                        UserDTO userDTO = (UserDTO) (session.getAttribute("usersession"));
                        String username = userDTO.getUsername();
                        user_song_list = UserDAO.getAllFavorites(SongDTO.class, username);
                        request.setAttribute("user_song_list", user_song_list);
                    }
                }
                for (PlaylistDTO playlistDTO : home_playlist_list) {
                    playlistDTO.setSong_list(playlistDAO.getAllSongsOfAPlaylist(playlistDTO.getPlaylistid()));
                }
                CategoryDTO categoryDTO = categoriesDAO.loadCategory(categoryid);
                request.setAttribute("category_name", categoryDTO.getName());
                request.setAttribute("home_album_list", home_album_list);
                request.setAttribute("home_song_list", home_song_list);
                request.setAttribute("home_artist_list", home_artist_list);
                request.setAttribute("home_category_list", home_category_list);
                request.setAttribute("home_playlist_list", home_playlist_list);
                request.getRequestDispatcher("MusicPage.jsp").forward(request, response);
            } else if (action.equals("search")) {
                String search_keyword = request.getParameter("keyword");
                if ((search_keyword == null || search_keyword.trim().isEmpty())) {
                    response.sendRedirect("./home");
                    return;
                }
                request.setAttribute("search_keyword", search_keyword);
                String search_message = String.format("Search Results for \"%s\"", search_keyword);
                home_category_list = categoriesDAO.getTop4Categories();
                home_song_list = UserDAO.searchAll(SongDTO.class, search_keyword);
                home_album_list = UserDAO.searchAll(AlbumDTO.class, search_keyword);
                home_artist_list = UserDAO.searchAll(ArtistDTO.class, search_keyword);
                home_playlist_list = UserDAO.searchAll(PlaylistDTO.class, search_keyword);
                HttpSession session = request.getSession(false);
                if (session != null) {
                    if (session.getAttribute("usersession") != null) {
                        ArrayList<SongDTO> user_song_list;
                        UserDTO userDTO = (UserDTO) (session.getAttribute("usersession"));
                        String username = userDTO.getUsername();
                        user_song_list = UserDAO.getAllFavorites(SongDTO.class, username);
                        request.setAttribute("user_song_list", user_song_list);
                    }
                }
                for (PlaylistDTO playlistDTO : home_playlist_list) {
                    playlistDTO.setSong_list(playlistDAO.getAllSongsOfAPlaylist(playlistDTO.getPlaylistid()));
                }
                request.setAttribute("search_message", search_message);
                request.setAttribute("home_album_list", home_album_list);
                request.setAttribute("home_song_list", home_song_list);
                request.setAttribute("home_artist_list", home_artist_list);
                request.setAttribute("home_category_list", home_category_list);
                request.setAttribute("home_playlist_list", home_playlist_list);
                request.getRequestDispatcher("MusicPage.jsp").forward(request, response);
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
