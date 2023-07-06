package utils;
import Song.SongDAO;
import Song.SongDTO;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
public class SongUtils {

    public static String getSongID(String GGDriveURL) {
        String[] splStrings = GGDriveURL.split("/");
        return splStrings[5];
    }

    /*
    @return playable song url
    @param GGDriveURL: the song url from table song
    convert song url from table song to the url that can be played using the audio tag
     */
    public static String getPlayableSongURL(String GGDriveURL) {
        String SongURL = "http://docs.google.com/uc?export=open&id=";
        String[] splStrings = GGDriveURL.split("/");
        String SongID = splStrings[5];
        return SongURL + SongID;
    }

    /*This method prints song lyrics to output.txt file to check
    @param inputFileName: pass the name of an input file to reads data
    @param outputFileName: the name of the output file 
     */
    public void ReadThenWriteSongLyricsToFile(String inputFileName, String outputFileName) {
        try {
            BufferedReader reader = new BufferedReader(new FileReader(inputFileName));
            BufferedWriter writer = new BufferedWriter(new FileWriter(outputFileName));
            while (reader.ready()) {
                String line = reader.readLine();
                for (int i = 0; i < line.length(); ++i) {
                    if (line.charAt(i) == '\'') {
                        line = line.substring(0, i) + "''" + line.substring(i + 1);
                        i++;
                    }
                }
                writer.write(String.format("'%s' + CHAR(13) + CHAR(10) + \n", line));
            }
            reader.close();
            writer.close();
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
    }

    /*
       @return: a string of song lyrics with char(13) + char(10) at the end(the endline characters in sql)
       @param: a name of the input file 
       Reads lyrics from the input txt file, then adds endline characters at the end of each line 
       to format the lyrics
     */
    public static String getSongLyrics(String inputFileName) {
        String lyrics = "";
        try {
            InputStream inputStream = new FileInputStream("D:\\Dev\\Java\\Maven_TTM_Music\\src\\main\\java\\LyricsPackage\\" + inputFileName);
            BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream, "UTF-8"));
            String line;
            while ((line = reader.readLine()) != null) {
                lyrics += String.format("%s\n", line);
            }
            reader.close();
        } catch (FileNotFoundException e) {
            System.out.println("File not found error: " + e.getMessage());
        } catch (IOException ioe) {
            System.out.println("I/O file error: " + ioe);
        } catch (NullPointerException e) {
            System.out.println("File null error: " + e.getMessage());
        }
        return lyrics;
    }
    public void SaveSongToServer(SongDTO song) {
        
    }
    public static String getValidServerFileName(String name) {
        name = name.replace("'", "");
        String splStrings[] = name.split("\\s+");
        String result = "";
        for (int i = 0;i < splStrings.length;++i) {
            result += splStrings[i];
            if (i != splStrings.length - 1) {
                result += "_";
            }
        }
        return result;
    }
    public static void main(String[] args) {
        SongDAO cdb = new SongDAO();
        ArrayList<SongDTO> song_list = new ArrayList<>();
        for (SongDTO songDTO : song_list) {
            cdb.addNewSong(songDTO);
        }
        System.out.println("Done");
    }
}
