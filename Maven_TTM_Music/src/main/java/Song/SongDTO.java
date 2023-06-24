package Song;
import utils.*;
public class SongDTO {

    private String songid ;
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
        return lyric;
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

    @Override
    public String toString() {
        return "SongDTO{" + "songid=" + songid + ", name=" + name + ", lyric=" + lyric + ", image=" + image + ", url=" + url + ", albumid=" + albumid + '}';
    }

}
