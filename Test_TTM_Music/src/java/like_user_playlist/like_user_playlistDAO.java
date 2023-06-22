/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package like_user_playlist;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
public class like_user_playlistDAO extends utils.DBUtils{
    public List<like_user_playlistDTO> getAlllike_user_playlistDTO() {
        List<like_user_playlistDTO> list = new ArrayList<>();
        String sql = "select * from like_user_playlist";
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new like_user_playlistDTO(rs.getString("username"), rs.getString("playlistid")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public void addNewlike_user_albumDTO(like_user_playlistDTO h) {
        String sql = "insert into like_user_playlist values(?,?)";
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, h.getUsername());
            ps.setString(2, h.getPlaylistid());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
