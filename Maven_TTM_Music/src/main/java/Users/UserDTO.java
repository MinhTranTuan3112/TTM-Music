package Users;

import Song.SongDTO;
import album.AlbumDTO;
import artist.ArtistDTO;
import java.util.ArrayList;
import playlist.PlaylistDTO;

public class UserDTO {

    private String username;
    private String password;
    private String email = "";
    private String role;
    private ArrayList<SongDTO> fav_song_list;
    private ArrayList<AlbumDTO> fav_album_list;
    private ArrayList<PlaylistDTO> fav_playlist_list;
    private ArrayList<ArtistDTO> fav_artist_list;

    public UserDTO() {
        this.fav_song_list = new ArrayList<>();
        this.fav_album_list = new ArrayList<>();
        this.fav_playlist_list = new ArrayList<>();
        this.fav_artist_list = new ArrayList<>();
    }

    public UserDTO(String username, String password) {
        this.username = username;
        this.password = password;
        this.fav_song_list = new ArrayList<>();
        this.fav_album_list = new ArrayList<>();
        this.fav_playlist_list = new ArrayList<>();
        this.fav_artist_list = new ArrayList<>();
    }

    public UserDTO(String username, String password, String email) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.fav_song_list = new ArrayList<>();
        this.fav_album_list = new ArrayList<>();
        this.fav_playlist_list = new ArrayList<>();
        this.fav_artist_list = new ArrayList<>();
    }

    public UserDTO(String username, String password, String email, String role) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.role = role;
        this.fav_song_list = new ArrayList<>();
        this.fav_album_list = new ArrayList<>();
        this.fav_playlist_list = new ArrayList<>();
        this.fav_artist_list = new ArrayList<>();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public ArrayList<SongDTO> getFav_song_list() {
        return fav_song_list;
    }

    public void setFav_song_list(ArrayList<SongDTO> fav_song_list) {
        this.fav_song_list = fav_song_list;
    }

    public ArrayList<AlbumDTO> getFav_album_list() {
        return fav_album_list;
    }

    public void setFav_album_list(ArrayList<AlbumDTO> fav_album_list) {
        this.fav_album_list = fav_album_list;
    }

    public ArrayList<PlaylistDTO> getFav_playlist_list() {
        return fav_playlist_list;
    }

    public void setFav_playlist_list(ArrayList<PlaylistDTO> fav_playlist_list) {
        this.fav_playlist_list = fav_playlist_list;
    }

    public ArrayList<ArtistDTO> getFav_artist_list() {
        return fav_artist_list;
    }

    public void setFav_artist_list(ArrayList<ArtistDTO> fav_artist_list) {
        this.fav_artist_list = fav_artist_list;
    }

    @Override
    public String toString() {
        return "UserDTO{" + "username=" + username + ", password=" + password + ", email=" + email + ", role=" + role + '}';
    }

}
