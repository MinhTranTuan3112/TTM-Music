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

insert into users values('tungtsse172875','172875','tung@gmail.com','admin')
