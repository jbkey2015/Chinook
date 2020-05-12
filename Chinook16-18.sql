--Provide a query that shows all the Tracks, but displays no IDs. The result should include the Album name, Media type and Genre.
select 
	Track.[Name] as TrackName, 
	Album.Title as AlbumName,
	Composer,
	Milliseconds,
	Bytes,
	UnitPrice,
	Genre.[Name] as Genre,
	MediaType.[Name] as MediaType
from Track
	join Album
		on Track.AlbumId = Album.AlbumId
	join Genre
		on  Track.GenreId = Genre.GenreId
	join MediaType
		on Track.MediaTypeId = MediaType.MediaTypeId


--Provide a query that shows all Invoices but includes the # of invoice line items.
Select Invoice.InvoiceId, Count(InvoiceLine.InvoiceLineId) AS LineItems
	FROM Invoice
		LEFT JOIN InvoiceLine
			ON Invoice.InvoiceId = InvoiceLine.InvoiceId
				GROUP BY Invoice.InvoiceId


--Provide a query that shows total sales made by each sales agent.
SELECT Employee.EmployeeId, Employee.FirstName, Employee.LastName, SUM(Invoice.Total)  as TotalSales
	FROM Employee
		JOIN Customer
			ON Employee.EmployeeId = Customer.SupportRepId
				JOIN Invoice
					ON Invoice.CustomerId = Customer.CustomerId
						WHERE Employee.Title LIKE '%agent'
							GROUP BY Employee.EmployeeId, Employee.FirstName, Employee.LastName
