package controller;

import Song.*;
import album.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import utils.SongUtils;

@WebServlet(name = "SaveAudioController", urlPatterns = {"/saveaudio"})
@MultipartConfig
public class SaveAudioController extends HttpServlet {

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
            out.println("<title>Servlet SaveAudioController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SaveAudioController at " + request.getContextPath() + "</h1>");
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
        SongDAO songDAO = new SongDAO();
        ArrayList<SongDTO> song_list = songDAO.getAllSong();
        request.setAttribute("song_list", song_list);
        request.getRequestDispatcher("admin.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private void ProceedAddSongs(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String songid = request.getParameter("songid");
        String songname = request.getParameter("name");

        //Audio handling part
        Part audioFilePart = request.getPart("songaudio");
        String audioFileName = SongUtils.getValidServerFileName(songname) + ".mp3";
        String uploadPath = getServletContext().getRealPath("") + File.separator + "songs";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        audioFilePart.write(uploadPath + File.separator + audioFileName);
        String finalSongPath = "http://localhost:8080" + request.getContextPath() + "/songs/" + audioFileName;

        //Lyric handling part
        Part lyricFilePart = request.getPart("lyric");
        String lyricFileName = SongUtils.getValidServerFileName(songname) + ".txt";
        String lyricUploadPath = getServletContext().getRealPath("") + File.separator + "lyrics";

        File lyricUploadDir = new File(lyricUploadPath);
        if (!lyricUploadDir.exists()) {
            lyricUploadDir.mkdir();
        }
        String finalLyricPath = lyricUploadPath + File.separator + lyricFileName;
        lyricFilePart.write(finalLyricPath);

        //Image handling part
        Part imageFilePart = request.getPart("image");
        String imageFileName = SongUtils.getValidServerFileName(songname) + ".png";
        String imageUploadPath = getServletContext().getRealPath("") + File.separator + "songimages";
        File imageUploadDir = new File(imageUploadPath);
        if (!imageUploadDir.exists()) {
            imageUploadDir.mkdir();
        }
        imageFilePart.write(imageUploadPath + File.separator + imageFileName);
        String finalImagePath = "http://localhost:8080" + request.getContextPath() + "/songimages/" + imageFileName;
        String albumid = request.getParameter("albumid");
        String categoryid = request.getParameter("categoryid");
        SongDTO song = new SongDTO(songid, songname, finalLyricPath, finalImagePath, finalSongPath, albumid);
        //Insert song to table song here
        //insert to table song and category
        SongDAO songDAO = new SongDAO();
        ArrayList<SongDTO> song_list = songDAO.getAllSong();
        request.setAttribute("song_list", song_list);
        request.setAttribute("mysong", song);
        request.getRequestDispatcher("admin.jsp").forward(request, response);
    }

    private void ProceedAddAlbum(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String albumid = request.getParameter("albumid");
        String artistid = request.getParameter("artistid");
        String albumname = request.getParameter("name");
        Part imageFilePart = request.getPart("image");
        String imageFileName = SongUtils.getValidServerFileName(albumname) + ".png";
        String imageUploadPath = getServletContext().getRealPath("") + File.separator + "albumimages";
        File imageUploadDir = new File(imageUploadPath);
        if (!imageUploadDir.exists()) {
            imageUploadDir.mkdir();
        }
        imageFilePart.write(imageUploadPath + File.separator + imageFileName);
        String finalImagePath = "http://localhost:8080" + request.getContextPath() + "/albumimages/" + imageFileName;
        AlbumDTO album = new AlbumDTO(albumid, artistid, albumname, finalImagePath);
        SongDAO songDAO = new SongDAO();
        ArrayList<SongDTO> song_list = songDAO.getAllSong();
        request.setAttribute("song_list", song_list);
        request.setAttribute("myalbum", album);
        request.getRequestDispatcher("admin.jsp").forward(request, response);
    }

    private void ProceedAddPlaylist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null || action.trim().isEmpty()) {

        } else if (action.equals("addsong")) {
            ProceedAddSongs(request, response);
        } else if (action.equals("addalbum")) {
            ProceedAddAlbum(request, response);
        }
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
