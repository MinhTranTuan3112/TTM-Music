package artist;
public class ArtistDTO {
    private String artistid;
    private String name,image;

    public ArtistDTO(String artistid, String name, String image) {
        this.artistid = artistid;
        this.name = name;
        this.image = image;
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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    
}
