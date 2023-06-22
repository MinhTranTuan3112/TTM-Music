/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package like_user_playlist;

/**
 *
 * @author trinh
 */
public class like_user_playlistDTO {
    private String username,playlistid;

    public like_user_playlistDTO(String username, String playlistid) {
        this.username = username;
        this.playlistid = playlistid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPlaylistid() {
        return playlistid;
    }

    public void setPlaylistid(String playlistid) {
        this.playlistid = playlistid;
    }
    
}
