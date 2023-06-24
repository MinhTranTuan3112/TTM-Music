package album;

import Song.SongDTO;
import java.util.List;
import com.microsoft.sqlserver.jdbc.*;
import java.sql.*;
import java.util.ArrayList;
import utils.DBUtils;

public class AlbumDAO extends utils.DBUtils {

    public ArrayList<AlbumDTO> getAllAlbum() {
        ArrayList<AlbumDTO> list = new ArrayList<>();
        String sql = "select * from album";
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new AlbumDTO(rs.getString("albumid"), rs.getString("artistid"), rs.getString("name"), rs.getString("albumimage")));
            }
        } catch (SQLException e) {
            System.out.println("Query all albums error: " + e.getMessage());
        }
        return list;
    }

    public void addNewAlbum(AlbumDTO album) {
        String sql = "insert into album values(?,?,?,?)";
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, album.getAlbumid());
            ps.setString(2, album.getArtistid());
            ps.setString(3, album.getName());
            ps.setString(4, album.getAlbumimage());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Insert new album error: " + e.getMessage());
        }
    }
    public ArrayList<SongDTO> getAllSongsOfAnAlbum(String albumid) {
        ArrayList<SongDTO> song_list = new ArrayList<>();
        String sql = "select * from dbo.songs";
        if (albumid != null && !albumid.trim().isEmpty()) {
            sql += "where albumid=?";
        }
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {                
                SongDTO songDTO = new SongDTO(rs.getString("songid"),
                        rs.getString("name"), rs.getString("lyric"),
                        rs.getString("image"), rs.getString("url"), 
                rs.getString("albumid"));
                song_list.add(songDTO);
            }
        } catch (SQLException e) {
            System.out.println("Query songs from album error: " + e.getMessage());
        }
        return song_list;
    }
    public static void main(String[] args) {
        AlbumDAO d = new AlbumDAO();
        ArrayList<AlbumDTO> list = d.getAllAlbum();
        for (AlbumDTO a : list) {
            System.out.println(a);
        }
    }
}
