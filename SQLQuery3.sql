select Name as ArtistName
from Artist
--where ArtistId >= 100
--where Name like '%John%'
--where Name in (
--'AC/DC',
--'Marcos Valle',
--'Os Mutantes',
--'Olodum'
--)
--and ArtistId > 100

--inner join
--artists that have matching albums
--select Artist.Name as ArtistName, Album.Title as AlbumName
--from Artist
--	join Album
--		on Artist.ArtistId = Album.ArtistId

--left outer join
--all artist and my matching albums
--select Artist.Name as ArtistName, Album.Title as AlbumName
--from Artist
--	left join Album
--		on Artist.ArtistId = Album.ArtistId

--right outer join
--all albums and my matching artist

--all albums with an artist that starts with 'a'
select Album.*
from Album
	join Artist
		on Album.ArtistId = Artist.ArtistId
where Artist.Name like 'A%'
--union combines result sets
--union all will combine and leave duplicates
--except only those from the first set that do not appear in second set
--all albums that have tracks that start with the letter b
select distinct Album.*
from Album
	join Track
		on Track.AlbumId = Album.AlbumId
where track.Name like 'b%'
order by Album.Title --must specify if you want descending with desc

select artistid, count(*) as AlbumCount
from Album
where ArtistId in (select ArtistId from Artist where Name like 'A%')
group by ArtistId


select Artist.ArtistId, Artist.Name, count(*)
from Album
	join Artist
		on album.ArtistId = Artist.ArtistId
where Artist.Name like 'a%'
group by Artist.ArtistId, Artist.Name


select invoiceid, sum(unitprice * quantity)
from InvoiceLine
group by InvoiceId


--Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.
select firstName, lastName, customerId, country
from Customer
where country != 'USA'

--Provide a query only showing the Customers from Brazil.
select firstName, lastName, customerId
from Customer
where country = 'Brazil'

--Provide a query showing the Invoices of customers who are from Brazil.
--The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.
SELECT Customer.FirstName, Customer.LastName, InvoiceId, InvoiceDate, Invoice.BillingCountry
	FROM Invoice
		JOIN Customer
			ON Invoice.CustomerId = Customer.CustomerId
				WHERE Country = 'Brazil'