package artist;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import static utils.DBUtils.getConnection;

public class ArtistDAO {

    public ArrayList<ArtistDTO> getAllArtist() {
        ArrayList<ArtistDTO> list = new ArrayList<>();
        String sql = "select * from artist";
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ArtistDTO(rs.getString("artistid"), rs.getString("name"), rs.getString("image")));
            }
        } catch (SQLException e) {
            System.out.println("Query all artists error: " + e.getMessage());
        }
        return list;
    }
    public void addNewArtist(ArtistDTO artist) {
        String sql = "insert into artist values(?,?,?)";
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, artist.getArtistid());
            ps.setString(2, artist.getName());
            ps.setString(3, artist.getImage());
            
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Insert new artist error: " + e.getMessage());
        }
    }
}
