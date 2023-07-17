package categories;

import java.sql.Connection;
import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utils.DBUtils;

public class CategoriesDAO extends utils.DBUtils {

    public ArrayList<CategoryDTO> getTop4Categories() {
        ArrayList<CategoryDTO> list = new ArrayList<>();
        String sql = "select top 4 * from categories order by newid()";
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new CategoryDTO(rs.getString("categoryid"), rs.getString("name")));
            }
        } catch (SQLException e) {
            System.out.println("Query top 4 categories error: " + e.getMessage());
        }
        return list;
    }

    public ArrayList<CategoryDTO> getAllCategories() {
        ArrayList<CategoryDTO> list = new ArrayList<>();
        String sql = "select * from categories";
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new CategoryDTO(rs.getString("categoryid"), rs.getString("name")));
            }
        } catch (SQLException e) {
            System.out.println("Query all categories error: " + e.getMessage());
        }
        return list;
    }

    public CategoryDTO loadCategory(String categoryid) {
        String sql = "select * from dbo.categories where categoryid=?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, categoryid);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new CategoryDTO(rs.getString("categoryid"), rs.getString("name"));
            }
        } catch (SQLException e) {
            System.out.println("Load category error: " + e.getMessage());
        }
        return null;
    }

    public void addNewCategories(CategoryDTO category) {
        String sql = "insert into categories values(?,?)";
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, category.getCategoryid());
            ps.setString(2, category.getName());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Insert category error: " + e.getMessage());
        }
    }

    public static void main(String[] args) {
        CategoriesDAO cdb = new CategoriesDAO();
        ArrayList<CategoryDTO> cat_list = cdb.getAllCategories();
        for (CategoryDTO c : cat_list) {
            System.out.println(c);
        }
    }
}
