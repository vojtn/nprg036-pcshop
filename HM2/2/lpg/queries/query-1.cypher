// Find Employees Assigned to a Specific Warehouse - warehouse with email "warehousesupport1@ppcshop.cz"
MATCH (e:EmployeeRole)-[:ASSIGNED_TO_WAREHOUSE]->(w:Warehouse {email: "warehousesupport1@ppcshop.cz"})
RETURN e.name, e.email, w.email;