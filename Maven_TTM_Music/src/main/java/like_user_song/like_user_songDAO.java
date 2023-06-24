/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package like_user_song;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
public class like_user_songDAO extends utils.DBUtils{
    public List<like_user_songDTO> getAlllike_user_songDTO() {
        List<like_user_songDTO> list = new ArrayList<>();
        String sql = "select * from like_user_song";
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new like_user_songDTO(rs.getString("songid"), rs.getString("username")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public void addNewlike_user_albumDTO(like_user_songDTO h) {
        String sql = "insert into like_user_song values(?,?)";
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, h.getSongid());
            ps.setString(2, h.getUsername());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
