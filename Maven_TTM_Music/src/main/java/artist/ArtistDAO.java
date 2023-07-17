package artist;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import utils.DBUtils;
import static utils.DBUtils.getConnection;

public class ArtistDAO {

    public ArrayList<ArtistDTO> getTop4Artist() {
        ArrayList<ArtistDTO> list = new ArrayList<>();
        String sql = "select top 4 * from artist order by newid()";
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ArtistDTO(rs.getString("artistid"), rs.getString("name"), rs.getString("image")));
            }
        } catch (SQLException e) {
            System.out.println("Query top 4 artists error: " + e.getMessage());
        }
        return list;
    }

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

    public ArtistDTO load(String artistid) {
        String sql = "select * from artist where artistid=?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, artistid);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new ArtistDTO(rs.getString("artistid"), rs.getString("name"), rs.getString("image"));
            }
        } catch (SQLException e) {
            System.out.println("Query artist error: " + e.getMessage());
        }
        return null;
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
