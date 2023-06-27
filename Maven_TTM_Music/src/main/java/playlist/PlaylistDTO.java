package playlist;
public class PlaylistDTO {
    private String playlistid,name;

    public PlaylistDTO(String playlistid, String name) {
        this.playlistid = playlistid;
        this.name = name;
    }

    public String getPlaylistid() {
        return playlistid;
    }

    public void setPlaylistid(String playlistid) {
        this.playlistid = playlistid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
}
