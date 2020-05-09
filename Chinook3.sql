--Provide a query showing only the Employees who are Sales Agents.
select *
from Employee
where Title = 'Sales Support Agent'

--Provide a query showing a unique/distinct list of billing countries from the Invoice table.
select distinct BillingCountry
from Invoice

--Provide a query that shows the invoices associated with each sales agent.
--The resultant table should include the Sales Agent's full name.
select Employee.FirstName + ' ' + Employee.LastName as SalesAgentFullName, Invoice.*
from Invoice
	join Customer
		on Invoice.CustomerId = Customer.CustomerId
	join Employee
		on Customer.SupportRepId = Employee.EmployeeId
where Employee.Title like 'Sales%Agent'

--Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.
select Invoice.InvoiceId, Customer.FirstName + ' ' + Customer.LastName as CustomerFullName, Customer.Country, Employee.FirstName + ' ' + Employee.LastName as SalesAgentFullName, Invoice.Total
from Invoice
	left join Customer
		on Invoice.CustomerId = Customer.CustomerId
	left join Employee
		on Customer.SupportRepId = Employee.EmployeeId
where Employee.Title like 'Sales%Agent'

--How many Invoices were there in 2009 and 2011?
select count(*)
from Invoice
where InvoiceDate like '%2009%' OR InvoiceDate like '%2011%'

--What are the respective total sales for each of those years?
select year(Invoice.InvoiceDate) as InvoiceYear, sum(Invoice.Total) as TotalSales
from Invoice
where year(Invoice.InvoiceDate) in (2009, 2011)
group by year(Invoice.InvoiceDate)

--Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.
select count(*)
from InvoiceLine
where InvoiceId = '37'

--Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice. HINT: GROUP BY
select InvoiceId, count(*) as NumberOfLineItems
from InvoiceLine
group by InvoiceId
