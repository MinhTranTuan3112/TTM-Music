package album;

import Song.SongDTO;
import java.util.List;
import com.microsoft.sqlserver.jdbc.*;
import java.sql.*;
import java.util.ArrayList;
import utils.DBUtils;

public class AlbumDAO extends utils.DBUtils {

    public ArrayList<AlbumDTO> searchAlbumsWithPaing(String keyword, int skip_num, int fetch_num) {
        ArrayList<AlbumDTO> album_list = new ArrayList<>();
        String sql = "{call proc_searchItemsWithPagination(?,?,?,?)}";
        try {
            Connection conn = DBUtils.getConnection();
            CallableStatement cs = conn.prepareCall(sql);
            cs.setString(1, "album");
            cs.setString(2, keyword);
            cs.setInt(3, skip_num);
            cs.setInt(4, fetch_num);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                album_list.add(new AlbumDTO(rs.getString("albumid"), rs.getString("artistid"), rs.getString("name"), rs.getString("albumimage")));
            }
        } catch (SQLException e) {
            System.out.println("Query all albums error: " + e.getMessage());
        }
        return album_list;
    }

    public ArrayList<AlbumDTO> getAlbumsPerPage(int skip_num, int fetch_num) {
        ArrayList<AlbumDTO> album_list = new ArrayList<>();
        String sql = "{call proc_getItemPerPage(?,?,?)}";
        try {
            Connection conn = DBUtils.getConnection();
            CallableStatement cs = conn.prepareCall(sql);
            cs.setString(1, "album");
            cs.setInt(2, skip_num);
            cs.setInt(3, fetch_num);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                album_list.add(new AlbumDTO(rs.getString("albumid"), rs.getString("artistid"), rs.getString("name"), rs.getString("albumimage")));
            }
        } catch (SQLException e) {
            System.out.println("Query albums error: " + e.getMessage());
        }
        return album_list;
    }

    public int getTotalAlbumCount() {
        int cnt = 0;
        String sql = "select count(albumid) as 'album_cnt' from dbo.album";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("album_cnt");
            }
        } catch (SQLException e) {
            System.out.println("Count albums error: " + e.getMessage());
        }
        return cnt;
    }

    public AlbumDTO load(String albumid) {
        String sql = "select * from album where albumid=?";
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, albumid);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new AlbumDTO(rs.getString("albumid"), rs.getString("artistid"), rs.getString("name"), rs.getString("albumimage"));
            }
        } catch (SQLException e) {
            System.out.println("Query album error: " + e.getMessage());
        }
        return null;
    }

    public ArrayList<AlbumDTO> getAllAlbum() {
        ArrayList<AlbumDTO> list = new ArrayList<>();
        String sql = "select * from album";
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new AlbumDTO(rs.getString("albumid"), rs.getString("artistid"), rs.getString("name"), rs.getString("albumimage")));
            }
        } catch (SQLException e) {
            System.out.println("Query all albums error: " + e.getMessage());
        }
        return list;
    }

    public ArrayList<AlbumDTO> getTop3Albums() {
        ArrayList<AlbumDTO> list = new ArrayList<>();
        String sql = "select top 3 * from album order by newid()";
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new AlbumDTO(rs.getString("albumid"), rs.getString("artistid"), rs.getString("name"), rs.getString("albumimage")));
            }
        } catch (SQLException e) {
            System.out.println("Query top 3 albums error: " + e.getMessage());
        }
        return list;
    }

    public void addNewAlbum(AlbumDTO album) {
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
            System.out.println("Insert new album error: " + e.getMessage());
        }
    }

    public ArrayList<SongDTO> getAllSongsOfAnAlbum(String albumid) {
        ArrayList<SongDTO> song_list = new ArrayList<>();
        String sql = "select * from dbo.song";
        if (albumid != null && !albumid.trim().isEmpty()) {
            sql += "\nwhere albumid=?";
        }
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            if (albumid != null && !albumid.trim().isEmpty()) {
                ps.setString(1, albumid);
            }
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SongDTO songDTO = new SongDTO(rs.getString("songid"),
                        rs.getString("name"), rs.getString("lyric"),
                        rs.getString("image"), rs.getString("url"),
                        rs.getString("albumid"));
                song_list.add(songDTO);
            }
        } catch (SQLException e) {
            System.out.println("Query songs from album error: " + e.getMessage());
        }
        return song_list;
    }

    public static ArrayList<AlbumDTO> getAllAlbumsOfArtist(String artistid) {
        ArrayList<AlbumDTO> album_list = new ArrayList<>();
        String sql = "{call proc_getAllAlbumOfArtist(?)}";
        try {
            Connection conn = DBUtils.getConnection();
            CallableStatement cs = conn.prepareCall(sql);
            cs.setString(1, artistid);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                album_list.add(new AlbumDTO(rs.getString("albumid"), rs.getString("artistid"), rs.getString("name"), rs.getString("albumimage")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return album_list;
    }

    public static void main(String[] args) {
        AlbumDAO cdb = new AlbumDAO();
        AlbumDTO albumDTO = cdb.load("NTM");
        System.out.println(albumDTO.toString());
    }
}
