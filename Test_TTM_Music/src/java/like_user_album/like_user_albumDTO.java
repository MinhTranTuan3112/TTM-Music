/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package like_user_album;

/**
 *
 * @author trinh
 */
public class like_user_albumDTO {
    private String username,albumid;

    public like_user_albumDTO(String username, String albumid) {
        this.username = username;
        this.albumid = albumid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getAlbumid() {
        return albumid;
    }

    public void setAlbumid(String albumid) {
        this.albumid = albumid;
    }
    
}
