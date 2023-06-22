/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package album;

import java.util.List;
import com.microsoft.sqlserver.jdbc.*;
import java.sql.*;
import java.util.ArrayList;

public class albumDAO extends utils.DBUtils {

    public List<albumDTO> getAllAlbum() {
        List<albumDTO> list = new ArrayList<>();
        String sql = "select * from album";
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new albumDTO(rs.getString("albumid"), rs.getString("artistid"), rs.getString("name"), rs.getString("albumimage")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public void addNewAlbum(albumDTO album) {
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
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        albumDAO d = new albumDAO();
        List<albumDTO> list = d.getAllAlbum();
        for (albumDTO a : list) {
            System.out.println(a);
        }
    }
}
