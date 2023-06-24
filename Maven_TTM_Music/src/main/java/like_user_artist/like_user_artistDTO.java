package like_user_artist;

public class like_user_artistDTO {

    private String username;
    private String artistid;

    public like_user_artistDTO() {
    }

    public like_user_artistDTO(String username, String artistid) {
        this.username = username;
        this.artistid = artistid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getArtistid() {
        return artistid;
    }

    public void setArtistid(String artistid) {
        this.artistid = artistid;
    }

    @Override
    public String toString() {
        return "like_user_artistDTO{" + "username=" + username + ", artistid=" + artistid + '}';
    }

}
