Select sh.OrderDate as sales_order,sh.ShipDate as ship_date,sh.OnlineOrderFlag as Online_Order,
Sum(sh.SubTotal) as Sub_total,sum(sh.TaxAmt) as Tax_amount, sum(sh.Freight) as Freigth,
sum(sh.TotalDue) as Total_due,sum(sp.SalesQuota) as SalesQuota,sp.BusinessEntityID, sum(sd.OrderQty)as SumQty
from sales.SalesOrderHeader SH
inner join sales.SalesOrderDetail SD
on SH.SalesOrderID = SD.SalesOrderID
left join sales.SalesPerson SP
on sp.TerritoryID = sh.TerritoryID
Where sp.BusinessEntityID in (289,283, 279,278,277)
group by  sh.OrderDate ,sh.ShipDate,sh.OnlineOrderFlag,sp.BusinessEntityID

