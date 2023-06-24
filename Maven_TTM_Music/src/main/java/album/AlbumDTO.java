package album;

import Song.SongDTO;
import java.util.ArrayList;

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

    @Override
    public String toString() {
        return "AlbumDTO{" + "albumid=" + albumid + ", artistid=" + artistid + ", name=" + name + ", albumimage=" + albumimage + '}';
    }
    
}
