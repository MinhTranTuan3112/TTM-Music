
create database TTMMusic;
use TTMMusic;
create table users (
	username nvarchar(50) primary key,
	password nvarchar(50),
	email nvarchar(100)
);

create table album(
	albumid nvarchar(10) primary key,
	name nvarchar(100),
	albumimage nvarchar(100)
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
	lyric nvarchar(1000),
	image nvarchar(100),
	url nvarchar(100),
	albumid nvarchar(10) foreign key references album(albumid) 
);

create table like_user_song(
	primary key (songid,username),
	songid nvarchar(100) foreign key references song(songid),
	username nvarchar(50) foreign key references "user"(username)
);

create table like_user_album(
	primary key(albumid,username),
	albumid nvarchar(10) foreign key references album(albumid),
	username nvarchar(50) foreign key references "user"(username) 
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
