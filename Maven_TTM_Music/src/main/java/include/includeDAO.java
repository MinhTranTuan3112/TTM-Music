package include;

import Song.SongDTO;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import utils.DBUtils;

public class includeDAO extends utils.DBUtils {
    public ArrayList<includeDTO> getAllinclude() {
        ArrayList<includeDTO> list = new ArrayList<>();
        String sql = "select * from include";
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new includeDTO(rs.getString("songid"), rs.getString("playlistid")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public void addNewhave_song_categories(includeDTO h) {
        String sql = "insert into include values(?,?)";
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, h.getSongid());
            ps.setString(2, h.getPlaylistid());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public ArrayList<SongDTO> getAllSongOfPlaylists(String playlistid) {
        ArrayList<SongDTO> song_list = new ArrayList<>();
        String sql = "{call proc_getAllSongInfo_Of_A_Playlist(?)}";
        try {
            Connection conn = DBUtils.getConnection();
            CallableStatement cs = conn.prepareCall(sql);
            cs.setString(1, playlistid);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {                
                song_list.add(new SongDTO(rs.getString("songid"), 
                        rs.getString("name"), rs.getString("lyric"),
                        rs.getString("image"), rs.getString("url"), rs.getString("albumid")));
            }
        } catch (SQLException e) {
            System.out.println("Query songs of an playlist error: " + e.getMessage());
        }
        return song_list;
    }
}
