/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package artist;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import static utils.DBUtils.getConnection;

/**
 *
 * @author trinh
 */
public class artistDAO {

    public List<artistDTO> getAllArtist() {
        List<artistDTO> list = new ArrayList<>();
        String sql = "select * from artist";
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new artistDTO(rs.getInt("artistid"), rs.getString("name"), rs.getString("image")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public void addNewArtist(artistDTO artist) {
        String sql = "insert into artist values(?,?,?)";
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, artist.getArtistid());
            ps.setString(2, artist.getName());
            ps.setString(3, artist.getImage());
            
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
