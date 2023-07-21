package controller;

import Song.SongDAO;
import Song.SongDTO;
import Users.UserDAO;
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

@WebServlet(name = "ExploreController", urlPatterns = {"/explore"})
public class ExploreController extends HttpServlet {

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
        SongDAO songDAO = new SongDAO();
        AlbumDAO albumDAO = new AlbumDAO();
        int totalSongs = songDAO.getTotalNumOfSongs(), totalAlbums = albumDAO.getTotalAlbumCount();
        int numOfSongPerPage = 8, numOfAlbumPerPage = 3;
        int startSongIndex = 0, startAlbumIndex = 0;
        int currentSongPage = 1, currentAlbumPage = 1;
        int totalSongPages = (int) Math.ceil((double) totalSongs / numOfSongPerPage);
        int totalAlbumPages = (int) Math.ceil((double) totalAlbums / numOfAlbumPerPage);

        if (action == null || action.trim().isEmpty()) {
            ArrayList<SongDTO> song_list = songDAO.getSongsPerPage(startSongIndex, numOfSongPerPage);
            ArrayList<AlbumDTO> album_list = albumDAO.getAlbumsPerPage(startAlbumIndex, numOfAlbumPerPage);
            request.setAttribute("currentSongPage", currentSongPage);
            request.setAttribute("totalSongPages", totalSongPages);
            request.setAttribute("song_list", song_list);
            request.setAttribute("totalAlbumPages", totalAlbumPages);
            request.setAttribute("album_list", album_list);
            request.getRequestDispatcher("explore.jsp").forward(request, response);
        } else if (action.equals("get")) {
            String songpageParam = request.getParameter("song_page");
            if (songpageParam != null && !songpageParam.isEmpty()) {
                try {
                    currentSongPage = Integer.parseInt(songpageParam);
                } catch (NumberFormatException e) {
                    System.out.println(e.getMessage());
                }
            }
            String albumpageParam = request.getParameter("album_page");
            if (albumpageParam != null && !albumpageParam.isEmpty()) {
                try {
                    currentAlbumPage = Integer.parseInt(albumpageParam);
                } catch (NumberFormatException e) {
                    System.out.println(e.getMessage());
                }
            }

            startSongIndex = (currentSongPage - 1) * numOfSongPerPage;
            startAlbumIndex = (currentAlbumPage - 1) * numOfAlbumPerPage;

            ArrayList<SongDTO> song_list = songDAO.getSongsPerPage(startSongIndex, numOfSongPerPage);
            ArrayList<AlbumDTO> album_list = albumDAO.getAlbumsPerPage(startAlbumIndex, numOfAlbumPerPage);

            request.setAttribute("currentSongPage", currentSongPage);
            request.setAttribute("totalSongPages", totalSongPages);
            request.setAttribute("song_list", song_list);

            request.setAttribute("currentAlbumPage", currentAlbumPage);
            request.setAttribute("totalAlbumPages", totalAlbumPages);
            request.setAttribute("album_list", album_list);

            request.getRequestDispatcher("explore.jsp").forward(request, response);
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
