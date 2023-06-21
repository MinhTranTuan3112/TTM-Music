package controller;

import Song.SongDAO;
import Song.SongDTO;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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
        String songid = request.getParameter("id");
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
        SongDTO song = new SongDTO(songid, songname, finalLyricPath, finalImagePath, finalSongPath, albumid);
        request.setAttribute("mysong", song);
        request.getRequestDispatcher("admin.jsp").forward(request, response);
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
