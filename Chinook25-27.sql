--Provide a query that shows the top 5 most purchased songs.
select Top 5 with ties InvoiceLine.TrackId, Track.[Name], sum(InvoiceLine.Quantity) as PurchaseCount
from InvoiceLine
	join Track
		on InvoiceLine.TrackId = Track.TrackId
group by InvoiceLine.TrackId, Track.[Name], Track.Composer
order by sum(InvoiceLine.Quantity) desc


--Provide a query that shows the top 3 best selling artists.
select Top(3) with ties Artist.ArtistId, Artist.[Name], sum(InvoiceLine.Quantity) as PurchaseCount
from InvoiceLine
	join Track
		on InvoiceLine.TrackId = Track.TrackId
	join Album
		on Track.AlbumId = Album.AlbumId
	join Artist
		on Album.ArtistId = Artist.ArtistId
group by Artist.ArtistId, Artist.[Name]
order by sum(InvoiceLine.Quantity) desc


--Provide a query that shows the most purchased Media Type.
select Top(1) with ties MediaType.MediaTypeId, MediaType.[Name] as MediaType, sum(InvoiceLine.Quantity) as PurchaseCount
from InvoiceLine
	join Track
		on InvoiceLine.TrackId = Track.TrackId
	join MediaType
		on Track.MediaTypeId = MediaType.MediaTypeId
group by MediaType.MediaTypeId, MediaType.[Name]
order by sum(InvoiceLine.Quantity) desc