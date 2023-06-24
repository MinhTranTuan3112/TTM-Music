/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package compose;

/**
 *
 * @author trinh
 */
public class composeDTO {
    private String songid, artistid;

    public composeDTO(String songid, String artistid) {
        this.songid = songid;
        this.artistid = artistid;
    }

    public String getSongid() {
        return songid;
    }

    public void setSongid(String songid) {
        this.songid = songid;
    }

    public String getArtistid() {
        return artistid;
    }

    public void setArtistid(String artistid) {
        this.artistid = artistid;
    }
    
}
