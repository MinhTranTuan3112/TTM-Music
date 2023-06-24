package album;

import java.util.List;
import com.microsoft.sqlserver.jdbc.*;
import java.sql.*;
import java.util.ArrayList;

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

    public static void main(String[] args) {
        AlbumDAO d = new AlbumDAO();
        ArrayList<AlbumDTO> list = d.getAllAlbum();
        for (AlbumDTO a : list) {
            System.out.println(a);
        }
    }
}
