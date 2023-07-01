/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package have_song_categories;

import Song.SongDTO;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

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
    
    public static ArrayList<SongDTO> getSongsFromCategory(String categoryid) {
        ArrayList<SongDTO> song_list = new ArrayList<>();
        try {
            Connection conn = DBUtils.getConnection();
            CallableStatement cs = conn.prepareCall("{call proc_get_all_song_categories(?)}");
            cs.setString(1, categoryid);
            cs.executeQuery();
            ResultSet rs = cs.getResultSet();
            while (rs.next()) {
                song_list.add(new SongDTO(rs.getString("songid"),rs.getString("name"),
                        rs.getString("lyric"), rs.getString("image"), rs.getString("url"), 
                rs.getString("albumid")));
            }
        } catch (SQLException e) {
            System.out.println("Query songs based on category error: " + e.getMessage());
        }
        return song_list;
    }
    public void AddNewSong_Categories_With_Names(String song_name, String category_name) {
        String sql = "{call proc_add_new_song_with_categories(?,?)}";
        try {
           Connection conn = DBUtils.getConnection();
           CallableStatement cs = conn.prepareCall(sql);
           cs.setString(1, song_name);
           cs.setString(2, category_name);
           cs.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Insert new song_categories error: " + e.getMessage());
        }
    }
    public static void main(String[] args) {
        have_song_categoriesDAO cdb = new have_song_categoriesDAO();
        ArrayList<SongDTO> song_list = cdb.getSongsFromCategory("POP");
        for (SongDTO songDTO : song_list) {
            System.out.println(songDTO.toString());
        }
    }
}
