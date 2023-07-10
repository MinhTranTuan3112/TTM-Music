package playlist;

import Song.SongDTO;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

public class PlaylistDAO {
    public ArrayList<PlaylistDTO> getTop4Playlists() {
        ArrayList<PlaylistDTO> list = new ArrayList<>();
        String sql = "select top 4 * from dbo.playlist";
        try {
            Connection conn = utils.DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new PlaylistDTO(rs.getString("playlistid"), rs.getString("name")));
            }
        } catch (SQLException e) {
            System.out.println("Query top 4 playlists error: " + e.getMessage());
        }
        return list;
    }
    public ArrayList<PlaylistDTO> getAllplaylistDTO() {
        ArrayList<PlaylistDTO> list = new ArrayList<>();
        String sql = "select * from playlist";
        try {
            Connection conn = utils.DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new PlaylistDTO(rs.getString("playlistid"), rs.getString("name")));
            }
        } catch (SQLException e) {
            System.out.println("Query all playlists error: " + e.getMessage());
        }
        return list;
    }

    public PlaylistDTO load(String playlistid) {
        String sql = "select * from playlist"
                + "\nwhere playlistid=?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, playlistid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new PlaylistDTO(rs.getString("playlistid"), rs.getString("name"));
            }
        } catch (SQLException e) {
            System.out.println("Query playlist error: " + e.getMessage());
        }
        return null;
    }

    public ArrayList<SongDTO> getAllSongsOfAPlaylist(String playlistid) {
        ArrayList<SongDTO> song_list = new ArrayList<>();
        String sql = "{call proc_getAllSongInfo_Of_A_PlayList(?)}";
        try {
            Connection conn = DBUtils.getConnection();
            CallableStatement cs = conn.prepareCall(sql);
            cs.setString(1, playlistid);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                song_list.add(new SongDTO(rs.getString("songid"), rs.getString("name"),
                        rs.getString("lyric"), rs.getString("image"), rs.getString("url"),
                        rs.getString("albumid")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return song_list;
    }

    public void addNewlike_user_albumDTO(PlaylistDTO h) {
        String sql = "insert into playlist values(?,?)";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, h.getPlaylistid());
            ps.setString(2, h.getName());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
