package Song;

import artist.ArtistDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import utils.*;
import org.apache.commons.text.StringEscapeUtils;
public class SongDTO {

    private String songid;
    private String name;
    private String lyric;
    private String image;
    private String url;
    private String albumid;

    public SongDTO() {

    }

    public SongDTO(String GGDriveURL, String name, String lyricsFileName, String image, String albumid) {
        this.songid = SongUtils.getSongID(GGDriveURL);
        this.name = name;
        this.lyric = SongUtils.getSongLyrics(lyricsFileName);
        this.image = image;
        this.url = SongUtils.getPlayableSongURL(GGDriveURL);
        this.albumid = albumid;

    }

    public SongDTO(String songid, String name, String lyric, String image, String url, String albumid) {
        this.songid = songid;
        this.name = name;
        this.lyric = lyric;
        this.image = image;
        this.url = url;
        this.albumid = albumid;

    }

    public String getSongid() {
        return songid;
    }

    public void setSongid(String songid) {
        this.songid = songid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLyric() {
        return StringEscapeUtils.escapeHtml4(this.lyric);
    }

    public void setLyric(String lyric) {
        this.lyric = lyric;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getAlbumid() {
        return albumid;
    }

    public void setAlbumid(String albumid) {
        this.albumid = albumid;
    }

    public String getAlbumName() {
        String sql = "select name as 'album_name' from dbo.album where albumid=?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, this.albumid);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("album_name");
            }
        } catch (SQLException e) {
            System.out.println("Get album name error: " + e.getMessage());
        }
        return null;
    }

    public ArrayList<String> getArtistNameList() {
        String sql = "select a.name as 'artist_name'\n"
                + "from dbo.artist a\n"
                + "where a.artistid in (\n"
                + "   select c.artistid\n"
                + "   from dbo.compose c\n"
                + "   where c.songid = ?\n"
                + ")";
        ArrayList<String> artist_name_list = new ArrayList<>();
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, this.songid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                artist_name_list.add(rs.getString("artist_name"));
            }
        } catch (SQLException e) {
            System.out.println("Get all artist name error: " + e.getMessage());
        }
        return artist_name_list;
    }

    public String getArtistInfo() {
        ArrayList<String> artist_name_list = getArtistNameList();
        String result = "";
        for (int i = 0; i < artist_name_list.size(); ++i) {
            result += artist_name_list.get(i);
            if (i != artist_name_list.size() - 1) {
                result += " , ";
            }
        }
        return result;
    }
    
    @Override
    public String toString() {
        return "SongDTO{" + "songid=" + songid + ", name=" + name + ", lyric=" + lyric + ", image=" + image + ", url=" + url + ", albumid=" + albumid + '}';
    }

    public static void main(String[] args) {
        SongDTO song = new SongDTO();
        song.setName("We Don't Talk Anymore");
        System.out.println(song.getName());
    }
}
