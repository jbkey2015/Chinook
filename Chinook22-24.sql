--Provide a query that shows the total sales per country.
select BillingCountry, sum(Total) as TotalSalesPerCountry
from Invoice
group by BillingCountry


--Which country's customers spent the most?
select Top(1) BillingCountry, sum(Total) as TopSales
from Invoice
group by BillingCountry
order by sum(Total) desc


--Provide a query that shows the most purchased track of 2013.
select top(1) with ties count(InvoiceLine.InvoiceLineId) as purchaseCount, Track.[Name] as TrackName
from InvoiceLine
	join Track
		on InvoiceLine.TrackId = Track.TrackId
	join Invoice
		on InvoiceLine.InvoiceId = Invoice.InvoiceId
where Invoice.InvoiceDate between '2013-01-01' and '2013-12-31'
group by Track.[Name]
order by count(*) desc


