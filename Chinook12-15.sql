--Provide a query that includes the purchased track name with each invoice line item.
select Track.Name as TrackName, InvoiceLine.*
from InvoiceLine
	join Track
		on InvoiceLine.TrackId = Track.TrackId


--Provide a query that includes the purchased track name AND artist name with each invoice line item.
select Track.[Name] as TrackName, Artist.[Name] as ArtistName, InvoiceLine.*
from InvoiceLine
	join Track
		on InvoiceLine.TrackId = Track.TrackId
	join Album
		on Track.AlbumId = Album.AlbumId
	join Artist
		on Album.ArtistId = Artist.ArtistId


--Provide a query that shows the # of invoices per country. HINT: GROUP BY
select BillingCountry, count(*) as NumberOfInvoices
from Invoice
group by BillingCountry


--Provide a query that shows the total number of tracks in each playlist. The Playlist name should be include on the resultant table.
select Playlist.[Name] as PlaylistName, count(*) as NumberOfTracks
from PlaylistTrack
	join Playlist
		on PlaylistTrack.PlaylistId = Playlist.PlaylistId
group by Playlist.[Name]



