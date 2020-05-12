--Which sales agent made the most in sales in 2009? HINT: TOP
select Top(1) Employee.EmployeeId, Employee.FirstName + ' ' + Employee.LastName as SalesAgentFullName, sum(Invoice.Total) as TotalSalesPerAgent
from Invoice
	join Customer
		on Invoice.CustomerId = Customer.CustomerId
	join Employee
		on Customer.SupportRepId = Employee.EmployeeId
where Employee.Title like 'Sales%Agent' AND InvoiceDate between '2009-01-01' AND '2009-12-31'
group by Employee.EmployeeId, Employee.LastName, Employee.FirstName
order by sum(Invoice.Total) desc


--Which sales agent made the most in sales over all?
select Top(1) Employee.EmployeeId, Employee.FirstName + ' ' + Employee.LastName as SalesAgentFullName, sum(Invoice.Total) as TotalSalesPerAgent
from Invoice
	join Customer
		on Invoice.CustomerId = Customer.CustomerId
	join Employee
		on Customer.SupportRepId = Employee.EmployeeId
where Employee.Title like 'Sales%Agent'
group by Employee.EmployeeId, Employee.LastName, Employee.FirstName
order by sum(Invoice.Total) desc


--Provide a query that shows the count of customers assigned to each sales agent.
select Employee.FirstName + ' ' + Employee.LastName as SalesAgentFullName, count(Customer.CustomerId) as TotalCustomersPerAgent
from Customer
	join Employee
		on Customer.SupportRepId = Employee.EmployeeId
where Employee.Title like 'Sales%Agent'
group by Customer.SupportRepId, Employee.LastName, Employee.FirstName