package Song;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import utils.*;

public class SongDAO {

    public ArrayList<SongDTO> getAllSong() {
        ArrayList<SongDTO> song_list = new ArrayList<>();
        String sql = "select * from dbo.song";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                song_list.add(new SongDTO(rs.getString("songid"), rs.getString("name"),
                        rs.getString("lyric"), rs.getString("image"), rs.getString("url"),
                        rs.getString("albumid")));
            }
        } catch (SQLException e) {
            System.out.println("Query all songs error: " + e.getMessage());
        }
        return song_list;
    }

    public SongDTO getSongFromSongID(String songid) {
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

    public void addNew_Song_Category() {
        
    }

    public void querySongInformationToPlay(String songid) {
        try {
            Connection conn = DBUtils.getConnection();
            CallableStatement cs = conn.prepareCall("{call proc_get_basic_song(?)}");
            cs.setString(1, songid);
            cs.executeQuery();
            ResultSet rs = cs.getResultSet();
            while (rs.next()) {
                System.out.println("Song name: " + rs.getString("song_name"));
                System.out.println("Song url: " + rs.getString("song_url"));
                System.out.println("Song image: " + rs.getString("song_image"));
                System.out.println("Artist name: " + rs.getString("artist_name"));
                System.out.println("Album name " + rs.getString("album_name"));
            }
        } catch (SQLException e) {
            System.out.println("Query song error: " + e.getMessage());
        }
    }

    public static void main(String[] args) {
        SongDAO cdb = new SongDAO();
        SongDTO song = cdb.getSongFromSongID("1zXCKTG3oF-J-lZ46EBDnDXS4VAT-TJ62");
        System.out.println(song.getLyric());
    }
}
