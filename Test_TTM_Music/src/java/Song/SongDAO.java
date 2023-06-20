package Song;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import utils.*;

public class SongDAO {
    public SongDTO getSong(String songid) {
        String sql = "select songid, name, lyric, image, url, albumid from dbo.song";
        if (songid != null && !songid.trim().isEmpty()) {
            sql += " where songid=?";
        }
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            if (songid != null && !songid.trim().isEmpty()) {
                ps.setString(1, songid);
            }
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SongDTO song = new SongDTO(rs.getString("songid"), rs.getString("name"),
                        rs.getString("lyric"), rs.getString("image"), rs.getString("url"),
                        rs.getString("albumid"));
                return song;
            }
        } catch (SQLException e) {
            System.out.println("Query song error: " + e.getMessage());
        }
        return null;
    }
    public void addNewSong(SongDTO newSong) {
        String sql = "insert into dbo.song(songid, name, lyric, image, url, albumid)"
                + "\nvalues(?,?,?,?,?,?)";  
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, newSong.getSongid());
            ps.setString(2, newSong.getName());
            ps.setString(3, newSong.getLyric());
            ps.setString(4, newSong.getImage());
            ps.setString(5, newSong.getUrl());
            ps.setString(6, newSong.getAlbumid());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Insert song error: " + e.getMessage());
        }
    }
    public static void main(String[] args) {
        SongDAO cdb = new SongDAO();
        ArrayList<SongDTO> song_list = new ArrayList<>();
        System.out.println("Done");  
    }
}
