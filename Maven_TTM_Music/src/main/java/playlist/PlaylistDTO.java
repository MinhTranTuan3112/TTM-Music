package playlist;

import Song.SongDTO;
import java.util.ArrayList;

public class PlaylistDTO {

    private String playlistid, name;
    private ArrayList<SongDTO> song_list;
    public PlaylistDTO () {
        
    }
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

    public ArrayList<SongDTO> getSong_list() {
        return song_list;
    }

    public void setSong_list(ArrayList<SongDTO> song_list) {
        this.song_list = song_list;
    }
    @Override
    public String toString() {
        return "PlaylistDTO{" + "playlistid=" + playlistid + ", name=" + name + '}';
    }

}
