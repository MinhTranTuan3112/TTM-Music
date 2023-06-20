package Users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utils.DBUtils;

public class UserDAO {

    public UserDTO login(String username, String password) {
        String sql = "select * from dbo.users where username = ? and password = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                UserDTO user = new UserDTO(rs.getString("username"), rs.getString("password"),
                        rs.getString("email"), rs.getString("role"));
                return user;
            }
        } catch (SQLException e) {
            System.out.println("Login Error: " + e.getMessage());
        }
        return null;
    }
    public boolean checkUserNameExist(String username) {
        String sql = "select username"
                + "\nfrom dbo.users where username = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("Check username Error: " + e.getMessage());
        }
        return false;
    }

    public void SignUp(UserDTO user) {
        String sql = "insert into dbo.users\n"
                + "values(?,?,?,?);";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getEmail());
            ps.setString(4, "user");
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Insert Error: " + e.getMessage());
        }
    }

    public static void main(String[] args) {
        UserDAO cdb = new UserDAO();
        String username = "minhttse172842";
        String password = "172842";
        UserDTO user = cdb.login(username, password);
        if (user != null) {
            System.out.println("Login Success");
        } else {
            System.out.println("Login failed!");
        }
    }
}
