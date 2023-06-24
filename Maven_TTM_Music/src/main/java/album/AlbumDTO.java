package album;
public class AlbumDTO {

    private String albumid, artistid, name, albumimage;

    public AlbumDTO() {
    }

    public AlbumDTO(String albumid, String artistid, String name, String albumimage) {
        this.albumid = albumid;
        this.artistid = artistid;
        this.name = name;
        this.albumimage = albumimage;
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

    @Override
    public String toString() {
        return "AlbumDTO{" + "albumid=" + albumid + ", artistid=" + artistid + ", name=" + name + ", albumimage=" + albumimage + '}';
    }
    
}
