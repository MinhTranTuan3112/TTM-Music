package album;

import Song.SongDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import utils.DBUtils;

public class AlbumDTO {

    private String albumid, artistid, name, albumimage;
    private ArrayList<SongDTO> song_list;

    public AlbumDTO() {
        this.song_list = new ArrayList<>();
    }

    public AlbumDTO(String albumid, String artistid, String name, String albumimage) {
        this.albumid = albumid;
        this.artistid = artistid;
        this.name = name;
        this.albumimage = albumimage;
        this.song_list = new ArrayList<>();
    }

    public String getAlbumid() {
        return albumid;
    }

    public void setAlbumid(String albumid) {
        this.albumid = albumid;
    }

    public String getArtistid() {
        return artistid;
    }

    public void setArtistid(String artistid) {
        this.artistid = artistid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAlbumimage() {
        return albumimage;
    }

    public void setAlbumimage(String albumimage) {
        this.albumimage = albumimage;
    }

    public ArrayList<SongDTO> getSong_list() {
        return song_list;
    }

    public void setSong_list(ArrayList<SongDTO> song_list) {
        this.song_list = song_list;
    }

    public String getArtistName() {
        String sql = "select a.name as 'artist_name'\n"
                + "from dbo.artist a\n"
                + "where a.artistid=?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, this.artistid);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("artist_name");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    @Override
    public String toString() {
        return "AlbumDTO{" + "albumid=" + albumid + ", artistid=" + artistid + ", name=" + name + ", albumimage=" + albumimage + '}';
    }
    public static void main(String[] args) {
        AlbumDTO albumDTO = new AlbumDTO();
        albumDTO.setArtistid("ATC");
        System.out.println(albumDTO.getArtistName());
    }
}
