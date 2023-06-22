/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package artist;

/**
 *
 * @author trinh
 */
public class artistDTO {
    private int artistid;
    private String name,image;

    public artistDTO(int artistid, String name, String image) {
        this.artistid = artistid;
        this.name = name;
        this.image = image;
    }

    public int getArtistid() {
        return artistid;
    }

    public void setArtistid(int artistid) {
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
