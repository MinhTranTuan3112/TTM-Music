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
- After users register their accounts, they will be redirected to the login page.

### Home page:

- The home page has 5 sections:

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

- When playing a songs, users can click the exand button on the top left corner of the control bar to open a bigger playing window

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/69322f15-2bb6-4cbb-a254-4bcebf69240b)
![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/aad2e29a-fe51-435c-851b-52029ca1b049)

- Users can view the lyrics on the right side of the window. Users can go back to the minimize the play window by clicking on the minimize button on the top right corner of the window.

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/9e104924-0066-442f-8441-14718fc54dc9)

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

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/b6ace5c3-574a-4800-8ed1-3a4236aa21d5)

- Users can view the information of the artist by clicking on the artist image. The artist information will be displayed contains: songs, albums.

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/e06b8bf2-3ec8-4ad7-952f-bb4f545e9737)
![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/06c71170-d429-4337-9f15-9a3331e67eab)

- Users can play a song directly or select any albums to view.  

**5. Playlist section:**

- This section normally has 4 suggested playlists for users to choose.

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/279eb572-780d-4e70-b32f-da1f67594c75)

- Users can first click on anywhere on the playlist to go to the details page of the album.

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/136eda2c-a67a-4db3-8d63-113a33cc49a0)
![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/5ebb49b3-1579-4f36-bf98-4e767fb30ef1)

- Then simply a click on the play button will make the playlist start playing. After a song end, next song will start playing automatically unless users turn on repeat mode button

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/1acbdd52-40d7-4672-bb43-19c3759aaea7)
![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/031afd29-ed55-4c6c-88eb-7e845342ead3)

- On the control bar, users can go to next song by clicking on the next button or go to previous song of the album by pressing the previous button.
- Users can shuffle the playing playlist by clicking on the shuffle button on the control bar. In case users want the playlist to have original song orders, they can refresh the page.

### Library page:

- To go to the library page, users can click on the library button on the navigation bar. Users can only go to this page if they are logged in, else they will be redirected to the login page.

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/aea5c581-e6ce-43f6-9ff4-8129bcc0e967)

- This page is similar to the home page, it also contains 5 sections:

**1. Main section:**

- This section help users find their favorite songs, albums, artists and playlists easier. It contains 4 buttons: song, album, artist and playlist, after users click on each button, the page displays the corresponding users' favorite items
- It also contains a search bar for users to search favorite items

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/45df24c6-6693-4247-8fd3-327d2c6ac2f7)

**2. Song section:**

- This section will display all users' favorite songs. Users can play the song directly by clicking on the song images.

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/9a9d01bd-6bff-428c-9e41-26b741535b20)

**3. Album section:**



**4. Artist section:**



**5. Playlist section:**



- Users can search their favorite songs, albums, artists and playlists using the search bar on the first section of the library page

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

## UML Class Diagram:

# Conclusion and Discussion:

In conclusion, on the plus side, our website helps users relax, relieve stress after working hours by listening to music in different categories, artists. Our main target has somehow been done. On the other hand, the website still has a lot of problems that we wish we could have time to implement. Firstly, the adding playlist features are incomplete. Secondly, the songs control bar doesn’t keep its state when users perform operations like searching, viewing albums, playlists info,... And finally, our website still hasn't got the traditional music, classical music and many more wonderful genres.

About what we’ve learnt during the development of the development, we think that we have learnt a lot. First about the UI, we learnt how to make the UI responsive, then adding loading animations for the page to look more interesting. Then we learnt how web applications work by implementing each action of each controller. We also learnt how to use github (pushing code,...), writing documentation in markdown format to work as a team.

If we could have more time, the first thing that we want to add is the podcasts features since podcasts help provide knowledge, useful information for everyday life. Secondly, we want to try storing the audio files on the web server. Thirdly, we want to complete the playlists features. And finally, more and more songs.
