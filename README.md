# TTM Music
TTM Music Page by group 9 - SE1726

# Team members:
- Trần Tuấn Minh - SE172842
- Trịnh Sơn Tùng - SE172875
- Nguyễn Công Thành - SE172947

# About this project
  
# How to clone this project:
```
git clone https://github.com/dunghuynh-teaching/prj301-se1726-09.git
```

# Requirements

- Name of the system: **TTM Music**
- Purpose of the system: is to help people relax with music and relieve the stress after working or studying for a long time.
- Who will use the system? Everyone can use this website to listen to music

## System features:

- Listen to different genres of the songs and albums including pop, ballad, edm, indie and game soundtracks: users choose various songs with many genres
of the songs, albums to play by clicking on the cover image of the songs or albums
- Listen to specially designed playlists including gaming music playlists for gamers, study music playlists, throwback playlists: this feature allows users to
have more choices to listen to music. Particularly, these playlists will be displayed as card item, users can click on them to choose to play a song or a whole playlist.
- Create and add songs to playlist: user can create another playlist by going to the library page and click on the plus button, then users can search the songs
that they want to add to the playlist and be able to add them. 
- Shuffle playlists: this features give users a fresh experience when they listen to the playlists.
- Search songs based on genres or artists: this freature allows user to find their songs easily
- Edit your playlists: users can add new songs to playlist, remove songs from playlists, rename the playlist (unfinished)

# Wireframe or screenshots of the system:

![](wireframe.png)

## The sitemap: 
![](/TTM_Music_Sitemap.png)

## GUI:
### Login page

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/16d76f32-33ac-4603-af23-0082f20af9a6)

- This page allows users to login using username and password by entering their own created username and password (after sign up)
- If user choose **Remember Me**, next time user log out the username and password will be auto filled in the form (users can make change if they wanted to)

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/5cc43833-88ab-475a-9fa6-a747139276eb)

- If users enter wrong username or password, a message will be display above the form.

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/9031ffa9-19f6-4e7a-9701-dd62f9f2df5e)


### Sign up page
![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/8118c619-43e2-40cb-a6f0-a7f013d1178d)
- This page help users register their own accounts to login into the page by entering username, password and email (for password changing)

### Home page:

![Screenshot 2023-06-15 155621](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/a0e2e0d7-ea96-4e4d-81dd-f97dd5170f37)

![Screenshot 2023-06-15 155621](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/0a9958e9-f5a8-44d1-a3f6-40585d03cf5d)

- This is the website home page. The home page has 5 sections:

**1. Category section:**

- This section will have 4 categories for the users to choose by clicking on the button with the name of the category.

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/f572a771-8a17-46b5-920e-ddf58c9773a0)

- After user click on each category buttons. A list of songs that have that category will be loaded for the users to choose. For example, if users choose Pop category, all of the songs have the caetgory *Pop* will be displayed:

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/ef66fe34-7355-40f4-84cb-2e79c548e164)

**2. Song section:**

- This section normally has 8 suggested songs for users to choose

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/341b5e07-1b2e-440c-bf45-8756973b8ba6)

- Users can play the song directly on the home page by first hover on the cover image of the songs, then a play button will appear on each of the song cover. After clicking on that play button, the song will automatically played, and the song control bar at the bottom will pop op showing the song information and the
control buttons for songs (users can pause/continue playing the song).

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/0e33b811-3443-4391-b592-c320eda112fb)

- The control bar will hide itself after a few seconds. Users can mouse over the now playing bar at the bottom for it to pop up again.
![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/248325cf-0c96-42f8-9ba0-6de84ba02a50)
![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/9b44f3a8-fbc5-448c-a4f8-df4ee9d4de7c)

**3. Album section:**

- This section normally has 3 suggested albums for users to choose.

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/adf5dd6c-bf29-4ae1-8d0a-cefff1452727)

- Users can first click on the cover image of the album to go to the details page of the album. The page will display album name, its artist and all of the songs in the album.

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/89c9b1f4-2215-409b-a65b-1974c1b183ba)
![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/d8b4c0c6-92b3-4386-9ea5-a93228b5ff51)

- Then simply a click on the play button will make the album start playing.

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/13a56037-c91b-4262-b375-7340d49d82e9)
![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/640aa674-a557-4539-bcdf-95008bc66ec6)

- After a song end, next song will start playing automatically unless users turn on repeat mode button. In this album after the song *Water Fountain* ends, the next song *1994* will be start playing automatically. Or users can click on the next button to go to the next song if they wanted to.

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/f9e0a274-4ee1-4b8c-ba28-8c8179a4a2be)
![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/70f8d92a-40da-426a-86f6-4b742b9c48d6)

- On the control bar, users can go to next song by clicking on the next button or go to previous song of the album by pressing the previous button and pause/continue play the songs in the album.

**4. Artist section:**

- This section normally has 4 suggested artists for users to choose.
- Users can view the information of the artist by clicking on the artist image. The artist information will be displayed contains: songs, albums.

**5. Playlist section:**

- This section normally has 4 suggested playlists for users to choose.
- Users can first click on anywhere on the playlist to go to the details page of the album. Then simply a click on the play button will make the playlist start
playing. After a song end, next song will start playing automatically unless users turn on repeat mode button
- On the control bar, users can go to next song by clicking on the next button or go to previous song of the album by pressing the previous button.
- Users can shuffle the playing playlist by clicking on the shuffle button on the control bar. In case users want the playlist to have original song orders, they can refresh the page.

![Screenshot 2023-06-15 155621](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/cdd9c28d-824c-48d2-8e30-3221a3fb67e5)

![Screenshot 2023-06-15 155621](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/c7eb84f9-3185-485f-a687-e3f097393dd5)

### Library page:
![Library page](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/d2c02c0d-ea41-4cfb-a681-81176787bfd6)
- This is the library page, which displays users' saved playlists, songs and album
### Album page:
![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/230ca5a5-d105-4e05-a8cd-690b9bdccd85)
- This page displays album contents, with options to play, edit or add the whole album to the library 
### Playlist page:
![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/483a2f68-abba-4e1b-ba90-f3d52ef0191d)
- This page displays playlist contents, with options to play, edit or add new songs to the library 

## Database design:

- ERD:

![ERD](ERD.png)

- Relational Schema:
  
![relational_schema](relational_schema.png)

# System design(Working on it)

## Source Code Structure:

- WebApp structure:

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/a14e2c42-121f-403d-8a7c-28bd4ed82b41)


- Java Source code structure:

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/460d3d7c-945b-4dc9-85f2-efe16080b8af)


## Controllers sitemap:

## UML Diagram:

# Conclusion and Discussion:

In conclusion, on the plus side, our website helps users relax, relieve stress after working hours by listening to music in different categories, artists. Our main target has somehow been done. On the other hand, the website still has a lot of problems that we wish we could have time to implement. Firstly, the adding playlist features are incomplete. Secondly, the songs control bar doesn’t keep its state when users perform operations like searching, viewing albums, playlists info,... And finally, our website still hasn't got the traditional music, classical music and many more wonderful genres.

About what we’ve learnt during the development of the development, we think that we have learnt a lot. First about the UI, we learnt how to make the UI responsive, then adding loading animations for the page to look more interesting. Then we learnt how web applications work by implementing each action of each controller. We also learnt how to use github (pushing code,...), writing documentation in markdown format to work as a team.

If we could have more time, the first thing that we want to add is the podcasts features since podcasts help provide knowledge, useful information for everyday life. Secondly, we want to try storing the audio files on the web server. Thirdly, we want to complete the playlists features. And finally, more and more songs.
