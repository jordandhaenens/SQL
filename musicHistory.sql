select *
from Genre;
select *
from Artist;
select * 
from Album;
select *
from Song;

--Query all of the entries in the Genre Table
select "Hi" as source, g.label, g.GenreId 
from Genre g;

--Query and UNION ALL all of the entries in Genre Table and add a column with a value of your choosing to the result
select "Hi" as message, g.label, g.GenreId 
from Genre g
UNION All
select "Hello" as message, g.label, g.GenreId
from Genre g;

--Delete any superflous entries of the artist "Broods"
DELETE from Artist
where ArtistName = "Broods";

--Using the INSERT statement, add one of your fav artists to the Artist table
insert into Artist
values (null, "Broods", 2016);

insert into Artist (ArtistName, YearEstablished)
values ("Azure", 2010);

--Using the INSERT statement, add one or more albums by your artist to the Album table
insert into Album
values (null, "Rue", 2016, null, null, 28, 14);

--Using the INSERT statement add some songs that are on that album to the Song table
insert into Song
values (null, "New Entry", 321, "2017", 1, )

--
select a.ArtistName, al.Title
from Artist a, Album al;

select Title
from Album
where artistId = 1;

select Title
from Album
where artistId = 1
and Title = "Point of Entry"; 

select potato.ArtistName, taco.Title
from Artist potato, Album taco
where potato.ArtistId = taco.ArtistId;

select p.ArtistName, taco.Title
from Artist p, Album taco
where p.ArtistId = taco.ArtistId
order by p.ArtistName desc;

--Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use LEFT JOIN
select s.Title as "Song", al.Title as "Album", a.ArtistName
from Song s, Album al, Artist a
where s.AlbumId = al.AlbumId;
and s.ArtistId = a.ArtistId;

-- long form version
select s.Title as "Song", al.Title as "Album", a.ArtistName
from Song s 
left join Album al
 on s.AlbumId = al.AlbumId
 left join Artist a
 on s.artistId = a.artistId;

--Write a Select statement to display how many songs exist for each album. You'll need to use COUNT( ) func and the GROUP BY keyword
select al.Title, count(s.albumId)
from Album al, Song s
where al.AlbumId = s.AlbumId
group by al.Title;

-- Display all songs in the database along with their album Title, genre, and Artist name
select s.Title as "Song",
			al.Title as "Album",
			g.Label as "Genre", 
			a.ArtistName as "Artist"
from Song s, Album al, Genre g, Artist a
where s.AlbumId = al.AlbumId
and s.GenreId = g.GenreId
and s.ArtistId = a.ArtistId;

--Query all of the entries in the Genre table
select *
from Genre;

select g.Label, g.genreid
from Genre g;

--Using the INSERT statement, add one of your favorite artists to the Artist table.
INSERT into Artist 
values (null, "Flux Pavillion", 2001);

--Using the INSERT statement, add one, or more, albums by your artist to the Album table.
INSERT into Album
	SELECT null,
	"Tesla", 
	2015,
	11,
	"SomeLabel",
	a.ArtistId,
	g.GenreId
	FROM Artist a, Genre g
	WHERE a.ArtistName = "Flux Pavillion"
	AND g.Label = "Electronic";
	
select a.Artistname, a.artistid
from Artist a 
where ArtistName = "Flux Pavillion";

--Using the INSERT statement, add some songs that are on that album to the Song table.
INSERT into Song
	SELECT null,
	"Tesla Theme",
	86,
	2015,
	al.GenreId,
	a.ArtistId,
	al.AlbumId
	FROM Artist a, Album al
	WHERE a.ArtistId = al.ArtistId
	AND al.Title = "Tesla";
	
INSERT into Song
	SELECT null,
	"Vibrate",
	426,
	2015,
	al.GenreId,
	a.ArtistId,
	al.AlbumId
	FROM Artist a, Album al
	WHERE a.ArtistId = al.ArtistId
	AND al.Title = "Tesla";
	
INSERT into Song
	SELECT null,
	"We Are Creators",
	222,
	2015,
	al.GenreId,
	a.ArtistId,
	al.AlbumId
	FROM Artist a, Album al
	WHERE a.ArtistId = al.ArtistId
	AND al.Title = "Tesla";
	
--Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.	
select s.Title as "Song", al.Title as "Album", a.ArtistName as "Artist"
from Song s
left join Album al
 on s.AlbumId = al.AlbumId
left join Artist a
 on s.artistId = a.artistId
where a.ArtistName = "Flux Pavillion";
