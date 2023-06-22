/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package like_user_song;

/**
 *
 * @author trinh
 */
public class like_user_songDTO {
    private String songid,username;

    public like_user_songDTO(String songid, String username) {
        this.songid = songid;
        this.username = username;
    }

    public String getSongid() {
        return songid;
    }

    public void setSongid(String songid) {
        this.songid = songid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
}
