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
- This page help users register an account to login into the page with username, password and email for password changing 
### Home page:

![Screenshot 2023-06-15 155621](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/a0e2e0d7-ea96-4e4d-81dd-f97dd5170f37)

![Screenshot 2023-06-15 155621](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/0a9958e9-f5a8-44d1-a3f6-40585d03cf5d)

- This is the website home page. The home page has 5 sections:

**1. Category section:**

- This section will have 4 categories for the users to choose by clicking on the button with the name of the category. After user click on each category buttons. A list of songs that have that category will be loaded for the users to choose.

**2. Song section:**

- This section normally has 8 suggested songs for users to choose
- Users can play the song directly on the home page by first hover on the cover image of the songs, then a play button will appear on each of the song cover. After clicking on that play button, the song will automatically played, and the song control bar at the bottom will pop op showing the song information and the
control buttons for songs (users can pause/continue playing the song).

**3. Album section:**

- This section normally has 3 suggested albums for users to choose.
- Users can first click on the cover image of the album to go to the details page of the album. Then simply a click on the play button will make the album start
playing. After a song end, next song will start playing automatically unless users turn on repeat mode button
- On the control bar, users can go to next song by clicking on the next button or go to previous song of the album by pressing the previous button.

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
## Controllers actions:
## UML Diagram:

# Conclusion and Discussion:

In conclusion, on the plus side, our website helps users relax, relieve stress after working hours by listening to music in different categories, artists. Our main target has somehow been done. On the other hand, the website still has a lot of problems that we wish we could have time to implement. Firstly, the adding playlist features are incomplete. Secondly, the songs control bar doesn’t keep its state when users perform operations like searching, viewing albums, playlists info,... And finally, our website still hasn't got the traditional music, classical music and many more wonderful genres.

About what we’ve learnt during the development of the development, we think that we have learnt a lot. First about the UI, we learnt how to make the UI responsive, then adding loading animations for the page to look more interesting. Then we learnt how web applications work by implementing each action of each controller. We also learnt how to use github (pushing code,...), writing documentation in markdown format to work as a team.

If we could have more time, the first thing that we want to add is the podcasts features since podcasts help provide knowledge, useful information for everyday life. Secondly, we want to try storing the audio files on the web server. Thirdly, we want to complete the playlists features. And finally, more and more songs.
