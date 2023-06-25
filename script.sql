create database TTMMusic;
use TTMMusic;
create table users (
	username nvarchar(50) primary key,
	password nvarchar(50),
	email nvarchar(100),
	role nvarchar(10)
);

create table album(
	albumid nvarchar(10) primary key,
	name nvarchar(100),
	albumimage nvarchar(100),
	artistid nvarchar(10) foreign key references artist(artistid) 
);

create table categories(
	categoryid nvarchar(10) primary key,
	name nvarchar(50)
);

create table artist(
	artistid nvarchar(10) primary key,
	name nvarchar(100),
	image nvarchar(100)
);

create table playlist(
	playlistid nvarchar(10) primary key,
	name nvarchar(500)
);

create table song(
	songid nvarchar(100) primary key,
	name nvarchar(100),
	lyric nvarchar(max),
	image nvarchar(100),
	url nvarchar(100),
	albumid nvarchar(10) foreign key references album(albumid) 
);

create table LikeInformation (
	primary key (username,songid,albumid,playlistid,artistid),
	username nvarchar(50) foreign key references users(username),
	songid nvarchar(100) foreign key references song(songid),
	albumid nvarchar(10) foreign key references album(albumid),
	playlistid nvarchar(10) foreign key references playlist(playlistid),
	artistid nvarchar(10) foreign key references artist(artistid)
);


 create table have_song_categiries(
	primary key (songid,categoryid),
	songid nvarchar(100) foreign key references song(songid),
	categoryid nvarchar(10) foreign key references categories(categoryid)
 );

create table compose(
	primary key (songid,artistid),
	songid nvarchar(100) foreign key references song(songid),
	artistid nvarchar(10) foreign key references artist(artistid)
);

create table include(
	primary key (songid,playlistid),
	songid nvarchar(100) foreign key references song(songid),
	playlistid nvarchar(10) foreign key references playlist(playlistid)
);
/*
@return a table of song name, song url, song image, artist nmae, album name
@param @songid 
*/

create or alter procedure [dbo].[proc_get_basic_song] @songid nvarchar(255)
as
select s.name as 'song_name',s.url as 'song_url', s.image as 'song_image',
(select a.name
from dbo.artist a
where a.artistid = 
(select c.artistid
from dbo.compose c
where c.songid = s.songid)) as 'artist_name',
(select al.name 
from dbo.album al
where al.albumid = s.albumid) as 'album_name'
from dbo.song s
where s.songid = @songid;
/*
@return a table with all song information
@param @categoryid 
get songs info from a categoryid
*/
create or alter procedure proc_get_all_song_categories @categoryid nvarchar(10)
as
select * from
dbo.song s
where s.songid in (select hsc.songid from dbo.have_song_categories hsc
where hsc.categoryid = @categoryid);
/*
@return a table of albumid, albumname, albumimage, aritstname, number of songs in the album
@param @albumid: the id of the album that needs to get the info
*/
create or alter procedure proc_get_basic_info_of_an_album @albumid nvarchar(10)
as
select a.albumid as 'albumid', a.name as 'albumname',
a.albumimage as 'albumimage', (select ar.name from dbo.artist ar where ar.artistid = a.artistid) as 'artistname',
(select count (s.songid)
from dbo.song s
where s.albumid = @albumid) as 'numberOfSong'
from dbo.album a
where a.albumid = @albumid;


/*
@return a table of songid, songname, song lyric, song image, song url, song albumid that
belongs to a playlist
@param @playlistid the id of the playlist that you want to get the information 
*/
create or alter procedure proc_getAllSongInfo_Of_A_PlayList @playlistid nvarchar(10)
as
select s.songid, s.name, s.lyric, s.image, s.url, s.albumid
from dbo.song s
where s.songid in (
select i.songid
from dbo.include i
where i.playlistid = @playlistid)
