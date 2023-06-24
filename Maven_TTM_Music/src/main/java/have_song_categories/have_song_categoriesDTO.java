/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package have_song_categories;

/**
 *
 * @author trinh
 */
public class have_song_categoriesDTO {
    private String songid, categoryid;

    public have_song_categoriesDTO(String songid, String categoryid) {
        this.songid = songid;
        this.categoryid = categoryid;
    }

    public String getSongid() {
        return songid;
    }

    public void setSongid(String songid) {
        this.songid = songid;
    }

    public String getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(String categoryid) {
        this.categoryid = categoryid;
    }
    
}
