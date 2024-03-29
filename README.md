# TTM Music
TTM Music Website by Group 9 - SE1726

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
- Who will use the system? Everyone will be able to use this website to listen to music

## System features:

- Listen to different genres of the songs and albums including pop, edm, indie and etc: users choose various songs with many genres
of the songs, albums to play by clicking on the cover image of the songs or albums
- Listen to already designed playlists including gaming music playlists for gamers, study music playlists, throwback playlists: this feature allows users to
have more choices to listen to music. Particularly, these playlists will be displayed as card item, users can click on them to choose to play a song or a whole playlist.
- Create and add songs to playlist: user can create another playlist by going to the library page and click on the plus button, then users can search the songs
that they want to add to the playlist and be able to add them. 
- Shuffle playlists: as the name of this feature suggest this feature will give users a fresh experience when they listen to the playlists.
- Search songs based on genres or artists: this feature allows user to find their songs easily.
- Edit your playlists: users can add new songs to playlist, remove songs from playlists, rename the playlist (unfinished)
- Admin features: manage users(insert, update, delete users)

# Wireframe or screenshots of the system:

## The sitemap: 
![](/TTM_Music_Sitemap.png)

## GUI:
### Login page

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/16d76f32-33ac-4603-af23-0082f20af9a6)

- This page allows users to login using username and password by entering their own created username and password (after sign up)
- If user choose **Remember Me**, next time user log out the username and password will be auto filled in the form (users can make change if they wanted to)

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/5cc43833-88ab-475a-9fa6-a747139276eb)

- If users enter wrong username or password, a message will be displayed above the form.

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/9031ffa9-19f6-4e7a-9701-dd62f9f2df5e)

### Sign up page
![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/8118c619-43e2-40cb-a6f0-a7f013d1178d)
- This page help users register their own accounts to login into the page by entering username, password and email (for password changing)
- After users register their accounts, they will be redirected to the login page to login with the username and password they have created.

### Home page:

- The home page has 5 sections:

**1. Category section:**

- This section will have 4 categories for the users to choose by clicking on the button with the name of the category.

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/f572a771-8a17-46b5-920e-ddf58c9773a0)

- After user click on each category buttons. A list of songs that have that category will be loaded for the users to choose. For example, if users choose Pop category, all of the songs that belong in the category *Pop* will be displayed:

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/ef66fe34-7355-40f4-84cb-2e79c548e164)

**2. Song section:**

- This section normally has 8 suggested songs for users to choose

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/341b5e07-1b2e-440c-bf45-8756973b8ba6)

- Users can play the song directly on the home page by first hover on the cover image of the songs, then a play button will appear on each of the song cover. After clicking on that play button, the song will automatically played, and the song control bar at the bottom will pop op showing the song information and the
control buttons for songs (users can pause/continue playing the song). 

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/0e33b811-3443-4391-b592-c320eda112fb)

- The control bar will automatically hide itself atfer a few seconds of being inactivity. Users can mouse over the now playing bar at the bottom for it to show up again.
![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/248325cf-0c96-42f8-9ba0-6de84ba02a50)
![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/9b44f3a8-fbc5-448c-a4f8-df4ee9d4de7c)

- When playing a songs, users can click the expand button on the top left corner of the control bar to open a bigger playing window

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/69322f15-2bb6-4cbb-a254-4bcebf69240b)
![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/aad2e29a-fe51-435c-851b-52029ca1b049)

- Users can view the lyrics on the right side of the window. Users can go back to the minimize the play window by clicking on the minimize button on the top right corner of the window.

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/9e104924-0066-442f-8441-14718fc54dc9)

- If users like the song, they can add it to libary by clicking on the add button on the control bar. Users can only use this feature when they are logged in, if they are not logged in, the page will redirect users to the login page.

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/4c7b41fa-c784-46f8-ac00-f2c4b742165f)

- They can remove the song from the library by clicking on it again

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

- If users like the album, they can add it to libary by clicking on the like button on the top of the album page. Users can only use this feature when they are logged in, if they are not logged in, the page will redirect users to the login page.

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/2e2d3a4e-e2c2-4b7f-911e-1094523a8f30)

- They can remove the album from the library by clicking on it again

**4. Artist section:**

- This section normally has 4 suggested artists for users to choose.

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/b6ace5c3-574a-4800-8ed1-3a4236aa21d5)

- Users can view the information of the artist by clicking on the artist image. The artist information will be displayed contains: songs, albums.

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/e06b8bf2-3ec8-4ad7-952f-bb4f545e9737)
![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/06c71170-d429-4337-9f15-9a3331e67eab)

- Users can play a song directly or select any albums to view.
- If users like the artist, they can add the current artist to libary by clicking on the like button on the top of the artist page. Users can only use this feature when they are logged in, if they are not logged in, the page will redirect users to the login page.

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/2e2d3a4e-e2c2-4b7f-911e-1094523a8f30)

- They can remove the saved artist from the library by clicking on it again

**5. Playlist section:**

- This section normally has 4 suggested playlists for users to choose.

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/25a57279-10f1-4146-8a1f-ad9af34c1cf6)

- Users can first click on anywhere on the playlist to go to the details page of the album.

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/136eda2c-a67a-4db3-8d63-113a33cc49a0)
![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/5ebb49b3-1579-4f36-bf98-4e767fb30ef1)

- Then simply a click on the play button will make the playlist start playing. After a song end, next song will start playing automatically unless users turn on repeat mode button

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/1acbdd52-40d7-4672-bb43-19c3759aaea7)
![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/031afd29-ed55-4c6c-88eb-7e845342ead3)

- On the control bar, users can go to next song by clicking on the next button or go to previous song of the album by pressing the previous button.
- Users can shuffle the playing playlist by clicking on the shuffle button on the control bar. In case users want the playlist to have original song orders, they can refresh the page.

- If users like the playlist, they can add it to libary by clicking on the like button on the top of the playlist page. Users can only use this feature when they are logged in, if they are not logged in, the page will redirect users to the login page.

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/2e2d3a4e-e2c2-4b7f-911e-1094523a8f30)

- They can remove the playlist from the library by clicking on it again

### Library page:

- To go to the library page, users can click on the library button on the navigation bar. Users can only go to this page if they are logged in, else they will be redirected to the login page.
- Users can search their favorite songs, albums, artists and playlists using the search bar on the first section of the library page

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

- This section will display all users' favorite albums. Users can view the detail information of the album by clicking on the album image.

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/cd13d880-7078-4460-b693-986679899179)

**4. Artist section:**

- This section will display all users' favorite artists. Users can view the information of the artist by clickin on the artist image.

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/b31c8417-3348-4ce5-b29e-fc6d0832aa85)

**5. Playlist section:**

- This section will display all users' favorite playlists. Users can view the information of the artist by clickin on the playlist images

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/dc0e5231-632c-4afd-a52d-6f829910e465)

### Search features:

- Users can use this feature without login
- Users can search by entering the keyword on the search bar on the navigation bar on the top of the home page.

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/b0cfb809-c106-47aa-b9e6-8f00c5f64f68)

- The results will contain songs, albums, artists and playlists that have the name contains the keyword

### Admin page:
- This page can only be accessed by admin of the page (role is admin)
- The first section of the page shows the general data of the page, including total number of songs, albums, artists, playlists and users
- Admin can click on view to view all items of a category

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/50d47cff-da26-43b4-8b16-63d4006b3051)

- Song view:

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/9f776a71-fa1f-46ab-a6cd-eb4a811c8b2e)

- Album view:

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/ec14001c-7003-4a5b-8026-204d68027963)

- The second section of the admin page contains the all users information:

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/2e2c2c67-9d7b-4dde-950b-dc2422f530b6)

- On each row, there is a button to delete user (require confirmation) and a button to view the details information of the users
- After clicking on details of an account, admin can make change to password, email and role of that account, admin clicks save to save the information of the account

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/c2a9a4ff-f954-4f28-a953-880889a08019)


## Database design:

- ERD:

![ERD](ERD.png)

- Relational Schema:
  
![relational_schema](relational_schema.png)

# System design

## Source Code Structure:

- WebApp structure:

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/a14e2c42-121f-403d-8a7c-28bd4ed82b41)

- Java Source code structure:

![image](https://github.com/dunghuynh-teaching/prj301-se1726-09/assets/133552281/460d3d7c-945b-4dc9-85f2-efe16080b8af)

## Controllers sitemap:

![image](controller_sitemap.jpeg)

## UML Class Diagram:

![UML](UML.jpg)

# Conclusion and Discussion:

In conclusion, on the positive side, our website helps users to finally be able to relax after a long time of working by listening to their favorite music without being disturbed by any ads, or artists. Our main target has somehow been done. On the other hand, our website still has a lot of problems that are still in need of fixing to be perfect. To be more informative about these problems we encounter, adding playlist features is incomplete. Moreover, at first, the songs control bar has not been able to keep playing a song when users perform any operations such as searching, viewing albums, playlists info, etc. But after some time of doing research, we are now able to make it run as we desire. And finally, we are still in the process of improving our streaming quality.

What we’ve learned during development of our project, we think that we have learned a lot. First, about the UI, we learned how to make the UI responsive, then design our loading animations for the page to become more attentive. Next, we learned how web applications work by implementing each action of each controller. We also learned how to use GitHub (like storing our code for other members of the team, letting us work together on the project from anywhere), and write documentation in markdown format to document what we have done from the beginning of our project and our information.

If we could have more time, the first thing on our lists would be a podcast feature providing us with information for everyday life. Secondly, we want to try storing the audio files on the web server. Right now,  our files are still stored in Google Drive. Thirdly, we want to complete the playlist features. And next, our method of logging in by Google, Twitter, or Facebook is still being written therefore right now we can only log in being the traditional method which is using a username and password. Ultimately, our final goal is that everyone will be able to listen to every song they want, from the 90s to now.
