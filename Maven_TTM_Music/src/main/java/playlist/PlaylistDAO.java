package playlist;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;
public class PlaylistDAO extends utils.DBUtils{
    public List<PlaylistDTO> getAllplaylistDTO() {
        List<PlaylistDTO> list = new ArrayList<>();
        String sql = "select * from playlist";
        try {
            Connection conn = utils.DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new PlaylistDTO(rs.getString("playlistid"), rs.getString("name")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public void addNewlike_user_albumDTO(PlaylistDTO h) {
        String sql = "insert into playlist values(?,?)";
        try {
            Connection conn =  DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, h.getPlaylistid());
            ps.setString(2, h.getName());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
