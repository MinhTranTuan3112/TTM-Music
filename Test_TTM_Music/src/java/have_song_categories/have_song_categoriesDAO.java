/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package have_song_categories;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class have_song_categoriesDAO extends utils.DBUtils {

    public List<have_song_categoriesDTO> getAllhave_song_categories() {
        List<have_song_categoriesDTO> list = new ArrayList<>();
        String sql = "select * from have_song_categories";
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new have_song_categoriesDTO(rs.getString("songid"), rs.getString("categoryid")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public void addNewhave_song_categories(have_song_categoriesDTO h) {
        String sql = "insert into have_song_categories values(?,?)";
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, h.getSongid());
            ps.setString(2, h.getCategoryid());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
