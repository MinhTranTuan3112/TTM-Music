package LikePackage;

public class LikeInformationDTO {

    private String username;
    private String songid;
    private String albumid;
    private String playlistid;
    private String artistid;

    public LikeInformationDTO() {
    }

    public LikeInformationDTO(String username, String songid, String albumid, String playlistid, String artistid) {
        this.username = username;
        this.songid = songid;
        this.albumid = albumid;
        this.playlistid = playlistid;
        this.artistid = artistid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getSongid() {
        return songid;
    }

    public void setSongid(String songid) {
        this.songid = songid;
    }

    public String getAlbumid() {
        return albumid;
    }

    public void setAlbumid(String albumid) {
        this.albumid = albumid;
    }

    public String getPlaylistid() {
        return playlistid;
    }

    public void setPlaylistid(String playlistid) {
        this.playlistid = playlistid;
    }

    public String getArtistid() {
        return artistid;
    }

    public void setArtistid(String artistid) {
        this.artistid = artistid;
    }

    @Override
    public String toString() {
        return "LikeInformationDTO{" + "username=" + username + ", songid=" + songid + ", albumid=" + albumid + ", playlistid=" + playlistid + ", artistid=" + artistid + '}';
    }

}
