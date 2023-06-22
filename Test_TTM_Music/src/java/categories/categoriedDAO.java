/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package categories;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import com.microsoft.sqlserver.jdbc.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class categoriedDAO extends utils.DBUtils {

    public List<categoryDTO> getAllCategories() {
        List<categoryDTO> list = new ArrayList<>();
        String sql = "select * from categories";
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new categoryDTO(rs.getString("categoryid"), rs.getString("name")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public void addNewCategories(categoryDTO category) {
        String sql = "insert into categories values(?,?)";
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, category.getCategoryid());
            ps.setString(2, category.getName());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
