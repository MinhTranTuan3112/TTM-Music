package Users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utils.DBUtils;
import Song.SongDTO;
import album.AlbumDTO;
import artist.ArtistDTO;
import java.sql.CallableStatement;
import java.util.ArrayList;
import playlist.PlaylistDTO;

public class UserDAO {

    public UserDTO login(String username, String password) {
        String sql = "select * from dbo.users where username = ? and password = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                UserDTO user = new UserDTO(rs.getString("username"), rs.getString("password"),
                        rs.getString("email"), rs.getString("role"));
                return user;
            }
        } catch (SQLException e) {
            System.out.println("Login Error: " + e.getMessage());
        }
        return null;
    }

    public boolean checkUserNameExist(String username) {
        String sql = "select username"
                + "\nfrom dbo.users where username = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("Check username Error: " + e.getMessage());
        }
        return false;
    }

    public void SignUp(UserDTO user) {
        String sql = "insert into dbo.users\n"
                + "values(?,?,?,?);";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getEmail());
            ps.setString(4, "user");
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Insert Error: " + e.getMessage());
        }
    }

    public ArrayList<SongDTO> getAllFavoriteSongs(String username) {
        ArrayList<SongDTO> fav_song_list = new ArrayList<>();
        String keyword = "song";
        String sql = "{call dbo.proc_getLikeInformation(?,?)}";
        try {
            Connection conn = DBUtils.getConnection();
            CallableStatement cs = conn.prepareCall(sql);
            cs.setString(1, username);
            cs.setString(2, keyword);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                fav_song_list.add(new SongDTO(rs.getString("songid"),
                        rs.getString("name"), rs.getString("lyric"),
                        rs.getString("image"), rs.getString("url"),
                        rs.getString("albumid")));
            }
        } catch (SQLException e) {
            System.out.println("Query favorite songs error: " + e.getMessage());
        }
        return fav_song_list;
    }

    public ArrayList<AlbumDTO> getAllFavoriteAlbums(String username) {
        ArrayList<AlbumDTO> fav_album_list = new ArrayList<>();
        String keyword = "album";
        String sql = "{call dbo.proc_getLikeInformation(?,?)}";
        try {
            Connection conn = DBUtils.getConnection();
            CallableStatement cs = conn.prepareCall(sql);
            cs.setString(1, username);
            cs.setString(2, keyword);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                fav_album_list.add(new AlbumDTO(
                        rs.getString("albumid"), rs.getString("artistid"),
                        rs.getString("name"), rs.getString("albumimage")));
            }
        } catch (SQLException e) {
            System.out.println("Query favorite albums error: " + e.getMessage());
        }
        return fav_album_list;
    }

    public ArrayList<PlaylistDTO> getAllFavoritePlaylists(String username) {
        ArrayList<PlaylistDTO> fav_playlist_list = new ArrayList<>();
        String keyword = "playlist";
        String sql = "{call dbo.proc_getLikeInformation(?,?)}";
        try {
            Connection conn = DBUtils.getConnection();
            CallableStatement cs = conn.prepareCall(sql);
            cs.setString(1, username);
            cs.setString(2, keyword);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                fav_playlist_list.add(new PlaylistDTO(rs.getString("playlistid"), rs.getString("name")));
            }
        } catch (SQLException e) {
            System.out.println("Query favorite playlists error: " + e.getMessage());
        }
        return fav_playlist_list;
    }

    public ArrayList<ArtistDTO> getAllFavoriteArtists(String username) {
        ArrayList<ArtistDTO> fav_artist_list = new ArrayList<>();
        String keyword = "artist";
        String sql = "{call dbo.proc_getLikeInformation(?,?)}";
        try {
            Connection conn = DBUtils.getConnection();
            CallableStatement cs = conn.prepareCall(sql);
            cs.setString(1, username);
            cs.setString(2, keyword);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                fav_artist_list.add(new ArtistDTO(rs.getString("artistid"),
                        rs.getString("name"), rs.getString("image")));
            }
        } catch (SQLException e) {
            System.out.println("Query favorite artists error: " + e.getMessage());
        }
        return fav_artist_list;
    }

    public static <T> ArrayList<T> getAllFavorites(Class<T> type, String username) {
        ArrayList<T> fav_list = new ArrayList<>();
        String keyword = "";
        if (type == SongDTO.class) {
            keyword = "song";
        } else if (type == AlbumDTO.class) {
            keyword = "album";
        } else if (type == PlaylistDTO.class) {
            keyword = "playlist";
        } else if (type == ArtistDTO.class) {
            keyword = "artist";
        }
        String sql = "{call dbo.proc_getLikeInformation(?,?)}";
        try {
            Connection conn = DBUtils.getConnection();
            CallableStatement cs = conn.prepareCall(sql);
            cs.setString(1, username);
            cs.setNString(2, keyword);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                if (type == SongDTO.class) {
                    fav_list.add((T) new SongDTO(rs.getString("songid"),
                            rs.getString("name"), rs.getString("lyric"),
                            rs.getString("image"), rs.getString("url"),
                            rs.getString("albumid")));
                } else if (type == AlbumDTO.class) {
                    fav_list.add((T) new AlbumDTO(
                            rs.getString("albumid"), rs.getString("artistid"),
                            rs.getString("name"), rs.getString("albumimage")));
                } else if (type == PlaylistDTO.class) {
                    fav_list.add((T) new PlaylistDTO(rs.getString("playlistid"), rs.getString("name")));
                } else if (type == ArtistDTO.class) {
                    fav_list.add((T) new ArtistDTO(rs.getString("artistid"),
                            rs.getString("name"), rs.getString("image")));
                }
            }
        } catch (SQLException e) {
            System.out.println("Query favorite items error: " + e.getMessage());
        }
        return fav_list;
    }

    public static <T> ArrayList<T> searchAll(Class<T> type, String search_keyword) {
        ArrayList<T> search_list = new ArrayList<>();
        String type_keyword = "";
        if (type == SongDTO.class) {
            type_keyword = "song";
        } else if (type == AlbumDTO.class) {
            type_keyword = "album";
        } else if (type == PlaylistDTO.class) {
            type_keyword = "playlist";
        } else if (type == ArtistDTO.class) {
            type_keyword = "artist";
        }
        String sql = "{call proc_searchAll(?,?)}";
        try {
            Connection conn = DBUtils.getConnection();
            CallableStatement cs = conn.prepareCall(sql);
            cs.setString(1, search_keyword);
            cs.setString(2, type_keyword);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                if (type == SongDTO.class) {
                    search_list.add((T) new SongDTO(rs.getString("songid"),
                            rs.getString("name"), rs.getString("lyric"),
                            rs.getString("image"), rs.getString("url"),
                            rs.getString("albumid")));
                } else if (type == AlbumDTO.class) {
                    search_list.add((T) new AlbumDTO(
                            rs.getString("albumid"), rs.getString("artistid"),
                            rs.getString("name"), rs.getString("albumimage")));
                } else if (type == PlaylistDTO.class) {
                    search_list.add((T) new PlaylistDTO(rs.getString("playlistid"), rs.getString("name")));
                } else if (type == ArtistDTO.class) {
                    search_list.add((T) new ArtistDTO(rs.getString("artistid"),
                            rs.getString("name"), rs.getString("image")));
                }
            }
        } catch (SQLException e) {
            System.out.println("Search errors: " + e.getMessage());
        }
        return search_list;
    }

    public static <T> ArrayList<T> searchFavoriteItem(String search_keyword, String username, Class<T> type) {
        ArrayList<T> search_list = new ArrayList<>();
        String type_keyword = "";
        if (type == SongDTO.class) {
            type_keyword = "song";
        } else if (type == AlbumDTO.class) {
            type_keyword = "album";
        } else if (type == PlaylistDTO.class) {
            type_keyword = "playlist";
        } else if (type == ArtistDTO.class) {
            type_keyword = "artist";
        }
        String sql = "{call proc_searchUserFavorite(?,?,?)}";
        try {
            Connection conn = DBUtils.getConnection();
            CallableStatement cs = conn.prepareCall(sql);
            cs.setString(1, search_keyword);
            cs.setString(2, username);
            cs.setString(3, type_keyword);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                if (type == SongDTO.class) {
                    search_list.add((T) new SongDTO(rs.getString("songid"),
                            rs.getString("name"), rs.getString("lyric"),
                            rs.getString("image"), rs.getString("url"),
                            rs.getString("albumid")));
                } else if (type == AlbumDTO.class) {
                    search_list.add((T) new AlbumDTO(
                            rs.getString("albumid"), rs.getString("artistid"),
                            rs.getString("name"), rs.getString("albumimage")));
                } else if (type == PlaylistDTO.class) {
                    search_list.add((T) new PlaylistDTO(rs.getString("playlistid"), rs.getString("name")));
                } else if (type == ArtistDTO.class) {
                    search_list.add((T) new ArtistDTO(rs.getString("artistid"),
                            rs.getString("name"), rs.getString("image")));
                }
            }
        } catch (SQLException e) {
            System.out.println("Search user favorite errors: " + e.getMessage());
        }
        return search_list;
    }

    public static void addNewFavoriteItem(String type_keyword, String username, String item_id) {
        String sql = "{call proc_addFavItem(?,?,?)}";
        try {
            Connection conn = DBUtils.getConnection();
            CallableStatement cs = conn.prepareCall(sql);
            cs.setString(1, type_keyword.toLowerCase());
            cs.setString(2, username);
            cs.setString(3, item_id);
            cs.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Add new favorite item error: " + e.getMessage());
        }
    }

    public static void deleteFavoriteItem(String type_keyword, String username, String item_id) {
        String sql = "{call proc_deleteFavItem(?,?,?)}";
        try {
            Connection conn = DBUtils.getConnection();
            CallableStatement cs = conn.prepareCall(sql);
            cs.setString(1, type_keyword.toLowerCase());
            cs.setString(2, username);
            cs.setString(3, item_id);
            cs.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Delete favorite item error: " + e.getMessage());
        }
    }

    public static boolean checkFavItemExist(String username, String keyword, String itemid) {
        String sql = "{call proc_checkFavItemExist(?,?,?)}";
        try {
            Connection conn = DBUtils.getConnection();
            CallableStatement cs = conn.prepareCall(sql);
            cs.setString(1, username);
            cs.setString(2, keyword);
            cs.setString(3, itemid);
            ResultSet rs = cs.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    public static void main(String[] args) {
        UserDAO userDAO = new UserDAO();
        String username = "minhttse172842";
    }
}
