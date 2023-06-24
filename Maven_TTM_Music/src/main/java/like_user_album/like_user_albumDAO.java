/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package like_user_album;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
public class like_user_albumDAO extends utils.DBUtils{
    public List<like_user_albumDTO> getAlllike_user_album() {
        List<like_user_albumDTO> list = new ArrayList<>();
        String sql = "select * from like_user_album";
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new like_user_albumDTO(rs.getString("username"), rs.getString("albumid")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public void addNewlike_user_albumDTO(like_user_albumDTO h) {
        String sql = "insert into like_user_album values(?,?)";
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, h.getUsername());
            ps.setString(2, h.getAlbumid());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
