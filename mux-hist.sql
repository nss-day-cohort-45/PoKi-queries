

-- Get all columns from all rows in Song table
SELECT * FROM Song;

-- Get just data from these two columns in Song table
SELECT Title, ReleaseDate FROM Song;

-- Get just data from these two columns in Song table, and only the rows where the artist id is 6
SELECT Title, ReleaseDate FROM Song
WHERE ArtistId = 6;

-- Get just data from these two columns in Song table, and only the rows where the title contains the letter g
SELECT Title, ReleaseDate
FROM Song
WHERE Title LIKE "%G%"
AND ArtistId = 6;

-- How many songs are there in the Song table that contain the letter g?
SELECT Count() as 'Songs With G' FROM Song
WHERE Title LIKE "%G%";

-- Add a new row to the Artist table. The unique Id will be added for us automatically
insert into Artist (ArtistName, YearEstablished)
values ("The Monkees", "1965");

-- Add a new song
insert into Song
(Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
Values ("Let's Dance Like Idiots", 34, "03/04/2005", 1, 3, 6);

-- Get data from 2 different tables using JOIN
SELECT song.title as 'song title', album.title as 'album title'
FROM Song
JOIN Album
ON song.AlbumId = album.AlbumId;

-- Get data from 3 different tables
SELECT song.title as 'song title', album.title as 'album title', ArtistName
FROM Song
JOIN Album ON song.AlbumId = album.AlbumId
JOIN Artist ON song.ArtistId = Artist.ArtistId;

-- How many song records exist per album?
SELECT COUNT() as 'song total', album.title
FROM Song
JOIN Album on song.AlbumId = album.AlbumId
GROUP BY song.AlbumId;


-- UPDATE an existing record
UPDATE Song
SET Title = "I Need You Tomorrow"
WHERE songId = 11;


-- DELETE an existing record
DELETE FROM Song
Where SongId = 9;

-- Add a new song
insert into Song
(Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
Values ("Let's Dance Like Idiots", 34, "03/04/2005", 1, 3, 6);


insert into Song
(Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
SELECT "Let's Dance Like Idiots", 34, "03/04/2005", Genre.GenreId, Artist.ArtistId, Album.AlbumId
FROM Genre, Artist, Album
WHERE Genre.Label = "Rock"
and
Artist.ArtistName LIKE "%Beatles%"
and
Album.Title = "Revolver";


-- Left join!
SELECT song.title as 'song title', album.title as 'album title', ArtistName
FROM Album
LEFT JOIN Song ON song.AlbumId = album.AlbumId
JOIN Artist ON song.ArtistId = Artist.ArtistId;

UPDATE song
set albumid = NULL
WHERE SongId = 23;

-- From this exercise:
-- https://github.com/nashville-software-school/bangazon-llc/blob/master/orientation/exercises/SQL_MUSIC_HISTORY.md


    -- Query all of the entries in the Genre table
        select * from genre;

    -- Using the INSERT statement, add one of your favorite artists to the Artist table.
        insert into artist (artistname, yearestablished)
        values('Ben Folds Five', '2001');

    -- Using the INSERT statement, add one, or more, albums by your artist to the Album table.
        insert into album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId)
        values("Whatever and Ever, Amen", 1997,  3333, "Happy Times",  36,  2);

    -- Using the INSERT statement, add some songs that are on that album to the Song table.
        insert into song (title, songlength, releasedate, genreid, artistid, albumid)
        values ("One Angry Dwarf and 200 Solemn Faces", 666, 3/3/1997, 2, 36, 29);

    -- Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
        select s.title, al.title, ar.artistname
        from artist ar, album al LEFT JOIN song s on al.albumid = s.albumid
        where ar.artistname = "Ben Folds Five"
        and al.artistid = ar.artistid;

        -- Reminder: Direction of join matters. Try the following statements and see the difference in results.

    SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.AlbumId;
    SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.AlbumId;

    -- Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
        SELECT album.title AS Album,
        COUNT(song.title) AS '# of Tracks'
        FROM album, song
        ON album.albumid = song.albumid
        GROUP BY album.title

    -- Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.


    -- Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.


    -- Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.


    -- Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.


    -- Modify the previous query to also display the title of the album.

-- From Michale Carroll
-- Task One
-- Query all of the entries in the Genre table
SELECT * FROM Genre ORDER BY [Label];

-- Task Two
-- Query all the entries in the Artist table and order by the artist's name.
SELECT * FROM Artist ORDER BY ArtistName;

-- Task Three
-- Write a SELECT query that lists all the songs in the Song table and include the Artist name.
SELECT
    s.Id,
    s.Title AS 'Song Title',
    a.ArtistName AS 'Artist Name'
FROM Song s
JOIN Artist a ON s.ArtistId = a.Id
ORDER BY Title;

-- Task Four
-- Write a SELECT query that lists all the Artists that have a Heavy Metal Album.
-- Yes, there are no Pop albums. This is Steve pointing out his superior musical taste.
SELECT DISTINCT
    ar.Id,
    ar.ArtistName AS 'Artist Name',
    g.[Label] AS 'Genre'
FROM Artist ar
JOIN Album al ON ar.Id = al.ArtistId
JOIN Genre g ON al.GenreId = g.Id
WHERE g.[Label] = 'Heavy Metal'
ORDER BY ArtistName;

-- Task Five
-- Write a SELECT query that lists all the Artists that have a Jazz or Rock Album.
SELECT DISTINCT
    ar.Id,
    ar.ArtistName AS 'Artist Name',
    g.[Label] AS 'Genre'
FROM Artist ar
JOIN Album al ON ar.Id = al.ArtistId
JOIN Genre g ON al.GenreId = g.Id
WHERE g.[Label] = 'Jazz' OR g.[Label] = 'Rock'
ORDER BY ArtistName;

-- Task Six
-- Write a SELECT statement that lists the Albums with no songs.
SELECT DISTINCT
    al.Id,
    al.Title AS 'Album Title'
FROM Album al
LEFT JOIN Song s ON al.Id = s.AlbumId
WHERE s.AlbumId IS NULL
ORDER BY Title;

-- Task Seven
-- Using the INSERT statement, add one of your favorite artists to the Artist table.
--INSERT INTO Artist (ArtistName, YearEstablished) VALUES ('Blind Guardian', 1984);
-- Task Eight
-- Using the INSERT statement, add one, or more, albums by your artist to the Album table.
--INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) VALUES ('Somewhere Far Beyond', '06/30/1992', 3325, 'Virgin/Century Media', 28, 5);
--INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) VALUES ('Nightfall in Middle-Earth', '07/28/1998', 3929, 'Virgin/Century Media', 28, 5);
--INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) VALUES ('A Night at the Opera', '03/25/2002', 4021, 'Virgin/Century Media', 28, 5);
-- Task Nine
-- Using the INSERT statement, add some songs that are on that album to the Song table.
--INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Somewhere Far Beyond', 448, '06/30/1992', 5, 28, 23);
--INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Ashes to Ashes', 358, '06/30/1992', 5, 28, 23);
--INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('The Bard''s Song – In the Forest', 189, '06/30/1992', 2, 28, 23);
--INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('The Curse of Fëanor', 341, '07/28/1998', 5, 28, 24);
--INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Time Stands Still (At the Iron Hill)', 293, '07/28/1998', 5, 28, 24);
--INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Nightfall', 334, '07/28/1998', 5, 28, 24);
--INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('And Then There Was Silence', 846, '03/25/2002', 5, 28, 25);
--INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Age of False Innocence', 365, '03/25/2002', 5, 28, 25);
--INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Wait for an Answer', 390, '03/25/2002', 5, 28, 25);


-- Task Ten
-- Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in.
-- Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
SELECT
    s.Title AS 'Song Title',
    al.Title AS 'Album Title',
    ar.ArtistName AS 'Artist Name'
FROM Song s
LEFT JOIN Album al ON al.Id = s.AlbumId
LEFT JOIN Artist ar ON ar.Id = s.ArtistId
WHERE ar.ArtistName = 'Blind Guardian' OR al.Title = 'Somewhere Far Beyond' OR al.Title = 'Nightfall in Middle-Earth' OR al.Title = 'A Night at the Opera'
ORDER BY s.Title;

-- Task Eleven
-- Write a SELECT statement to display how many songs exist for each album.
-- You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT
    a.Title AS 'Album Title',
    COUNT(s.Title) AS 'Number of Songs'
FROM Album a
JOIN Song s ON a.Id = s.AlbumId
GROUP BY a.Title
ORDER BY a.Title;

-- Task Twelve
-- Write a SELECT statement to display how many songs exist for each artist.
-- You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT
    a.ArtistName AS 'Artist Name',
    COUNT(s.Title) AS 'Number of Songs'
FROM Artist a
JOIN Song s ON a.Id = s.ArtistId
GROUP BY a.ArtistName
ORDER BY a.ArtistName;

-- Task Thirteen
-- Write a SELECT statement to display how many songs exist for each genre.
-- You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT
    g.[Label] AS 'Genre',
    COUNT(s.Title) AS 'Number of Songs'
FROM Genre g
JOIN Song s ON g.Id = s.GenreId
GROUP BY g.[Label]
ORDER BY g.[Label];

-- Task Fourteen
-- Write a SELECT query that lists the Artists that have put out records on more than one record label.
-- Hint: When using GROUP BY instead of using a WHERE clause, use the HAVING keyword.
SELECT
    ar.ArtistName AS 'Artist Name',
    COUNT(DISTINCT al.[Label]) AS 'Number of Labels'
FROM Artist ar
JOIN Album al ON al.ArtistId = ar.Id
GROUP BY ar.ArtistName
HAVING COUNT(DISTINCT al.[Label]) > 1;

-- Task Fifteen
-- Using MAX() function, write a select statement to find the album with the longest duration.
-- The result should display the album title and the duration.
SELECT
    Title AS 'Album Title',
    AlbumLength AS 'Album Length'
FROM Album
WHERE AlbumLength = (SELECT MAX(AlbumLength) FROM Album);
-- Thug isn't 15 minutes long....
-- UPDATE Song
-- SET SongLength = 257
-- WHERE Id = 13;
-- Dirt Off Your Shoulder isn't 14 minutes long...
-- UPDATE Song
-- SET SongLength = 239
-- WHERE Id = 21;
-- Task Sixteen
-- Using MAX() function, write a select statement to find the song with the longest duration.
-- The result should display the song title and the duration.
SELECT
    Title AS 'Song Title',
    SongLength AS 'Song Length'
FROM Song
WHERE SongLength = (SELECT MAX(SongLength) FROM Song);

-- Task Seventeen
--Modify the previous query to also display the title of the album.
SELECT
    s.Title AS 'Song Title',
    s.SongLength AS 'Song Length',
    a.Title AS 'Album Title'
FROM Song s
JOIN Album a ON a.Id = s.AlbumId
WHERE s.SongLength = (SELECT MAX(SongLength) FROM Song);






-- =====CHINOOK Queries=============
-- https://github.com/JoeShep/ChinookSQLexercise -- if I want to cheat

-- 1. Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.
SELECT firstName || " " || lastName as name, customerid, country
FROM Customer

-- 2. Provide a query only showing the Customers from Brazil.
SELECT * from customer where country = 'Brazil'

-- 3. Provide a query showing the Invoices of customers who are from Brazil. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.
SELECT firstName || " " || lastName as name, invoiceId, invoiceDate, billingCountry
FROM Customer
JOIN invoice
on country = billingCountry
where country = 'Brazil'
-- doesn't work. Lists every customer on every invoice. This does. so close!
SELECT firstName || " " || lastName, invoiceId, invoiceDate, billingCountry
FROM Customer
JOIN Invoice
ON Invoice.CustomerId = Customer.CustomerId -- here's the key that I missed
WHERE Customer.Country = "Brazil"

-- 4. Provide a query showing only the Employees who are Sales Agents. (support rep id)
SELECT * FROM employee where title = "Sales Support Agent"

-- 5. Provide a query showing a unique list of billing countries from the Invoice table.
SELECT distinct billingcountry from invoice
-- or
SELECT billingcountry from invoice group by billingCountry

-- 6. Provide a query showing the invoices of customers who are from Brazil.
-- duplicate

-- 7. Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.
SELECT Employee.FirstName || " " || Employee.LastName AS [Sales Rep], --Note brackets instead of quotes. Either works
c.FirstName || " " || c.LastName AS 'Customer',                        -- but quotes are more 'portable'
i.InvoiceId, i.CustomerId, i.InvoiceDate, i.Total
FROM Invoice i
JOIN Customer c ON c.CustomerId = i.CustomerId
JOIN Employee ON Employee.EmployeeId = c.SupportRepId
order by [Sales Rep]

-- 8. Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.
SELECT i.Total,
c.FirstName || " " || c.LastName AS 'Customer', c.country,
e.FirstName || " " || e.LastName AS 'Sales Rep'
FROM Invoice i
JOIN Customer c ON c.CustomerId = i.CustomerId
JOIN Employee e ON e.EmployeeId = c.SupportRepId
order by 'Customer'

-- 9. How many Invoices were there in 2009 and 2011? What are the respective total sales for each of those years?
SELECT COUNT(InvoiceId) AS "Number of invocies", SUM(Total), strftime('%Y', InvoiceDate) as yearVal
FROM Invoice
WHERE strftime(yearVal, InvoiceDate) = "2009" OR strftime(yearVal, InvoiceDate) = "2011"
GROUP BY yearVal
ORDER BY InvoiceDate DESC;

-- 10. Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.
-- 11. Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice. HINT: [GROUP BY](http://www.sqlite.org/lang_select.html#resultset)
-- 12. Provide a query that includes the track name with each invoice line item.
-- 13. Provide a query that includes the purchased track name AND artist name with each invoice line item.
-- 14. Provide a query that shows the # of invoices per country. HINT: [GROUP BY](http://www.sqlite.org/lang_select.html#resultset)
-- 15. Provide a query that shows the total number of tracks in each playlist. The Playlist name should be include on the resultant table.
-- 16. Provide a query that shows all the Tracks, but displays no IDs. The resultant table should include the Album name, Media type and Genre.
-- 17. Provide a query that shows all Invoices but includes the # of invoice line items.
-- 18. Provide a query that shows total sales made by each sales agent.
-- 19. Which sales agent made the most in sales in 2009?
-- 20. Which sales agent made the most in sales in 2010?
-- 21. Which sales agent made the most in sales over all?
-- 22. Provide a query that shows the # of customers assigned to each sales agent.
-- 23. Provide a query that shows the total sales per country. Which country's customers spent the most?
-- 24. Provide a query that shows the most purchased track of 2013.
    -- http://www.w3resource.com/sqlite/sqlite-strftime.php
    -- stands for string format time?
    SELECT * FROM invoice
    where strftime('%Y', InvoiceDate) = "2013"

    -- Count number of tracks sold in 2013. More helpful
    SELECT COUNT(invoiceLine.InvoiceId)
    FROM InvoiceLine, Invoice
    WHERE strftime('%Y', Invoice.InvoiceDate) = "2013"
    AND InvoiceLine.InvoiceId = Invoice.InvoiceId

    -- boom (although shows multiple tracks sold 2 copies; there is no "most"
    SELECT COUNT(invoiceLine.TrackId) AS "tracks sold", Track.Name
    FROM InvoiceLine, Invoice, Track
    WHERE strftime('%Y', Invoice.InvoiceDate) = "2013"
    AND InvoiceLine.InvoiceId = Invoice.InvoiceId
    AND InvoiceLine.TrackId = Track.TrackId
    GROUP BY Track.Name
    ORDER BY "tracks sold" DESC

    -- Sept 17 attempt after a long time away from this. Very different result.
    -- What's different?
    SELECT count(invoiceLineId) as "tracks sold in '13", name from Track t
    join InvoiceLine il
    join Invoice i
    on t.TrackId = il.TrackId
    where i.invoiceDate >= '2013-01-01 00:00:00'
    and i.invoiceDate< '2014-01-01 00:00:00'
    group by t.name
    order by "tracks sold in '13" DESC

    -- Here's the hybrid fix
    SELECT count(il.TrackId) as "tracks sold in '13",  t.name
	FROM InvoiceLine il
	join Track t on t.TrackId = il.TrackId
    join Invoice i on il.InvoiceId = i.InvoiceId
	where i.invoiceDate >= '2013-01-01 00:00:00'
    and i.invoiceDate< '2014-01-01 00:00:00'
    group by t.name
    order by "tracks sold in '13" DESC

-- 25. Provide a query that shows the top 5 most purchased tracks over all.
-- 26. Provide a query that shows the top 3 best selling artists.
-- 27. Provide a query that shows the most purchased Media Type.
