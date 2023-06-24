package like_user_artist;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import utils.DBUtils;

public class like_user_artistDAO {
    public ArrayList<like_user_artistDTO> getAll_like_user_artist_DTO() {
        ArrayList<like_user_artistDTO> list = new ArrayList<>();
        String sql = "select * from dbo.like_user_artist";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {                
               list.add(new like_user_artistDTO(rs.getString("username"), rs.getString("artistid")));
            }
        } catch (SQLException e) {
            System.out.println("Query all like_user_artist error: " + e.getMessage());
        }
        return list;
    }    
    
}
