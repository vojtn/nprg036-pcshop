CREATE (:Customer {name: "Jožko Mrkvička", email: "jozko@gmail.com", registrationDate: "10-04-98", identifier: "VIP"});
CREATE (:EmployeeRole {name: "Dano Drevo", email: "gabor@szekeshfehervar.sk", startDate: "17-2-2014"});

CREATE (:Brand {name: "Logitech", email: "support@logitech.com"});
CREATE (:Brand {name: "AMD", email: "support@amd.com"});
CREATE (:Brand {name: "TSMC", email: "support@tsmc.com"});

CREATE (:Address {countryName: "Hungary", locality: "Komarom", streetAddress: "Cajkovskeho 2", postalCode: "16900"});
CREATE (:Address {countryName: "Slovakia", locality: "Nitra", streetAddress: "Dunajska 14", postalCode: "49411"});
CREATE (:Address {countryName: "Czech republic", locality: "Praha", streetAddress: "Za zahradou 2", postalCode: "16200"});

CREATE (:Order {orderNumber: 0, price: 130});
CREATE (:Order {orderNumber: 1, price: 210});
CREATE (:Order {orderNumber: 2, price: 50});

CREATE (:Product {name: "Logitech MX Keys", price: 50, discount: 0, valueAddedTax: 21});
CREATE (:Product {name: "AMD Ryzen 5 7600", price: 100, discount: 20, valueAddedTax: 21});
CREATE (:Product {name: "AMD Ryzen 7 5700X3D", price: 150, discount: 20, valueAddedTax: 21});

CREATE (:Warehouse {capacity: 9, email: "warehousesupport1@ppcshop.cz"});
CREATE (:Warehouse {capacity: 9, email: "warehousesupport2@ppcshop.cz"});
CREATE (:Warehouse {capacity: 9, email: ["dwad@ppcshop.cz", "warehousesupport3@ppcschop.cz"]});

MATCH (c:Customer {name: "Jožko Mrkvička"}), (o:Order {orderNumber: 0})
CREATE (c)-[:REFERENCES_ORDER {date: "2024-11-1"}]->(o);

MATCH (c:Customer {name: "Jožko Mrkvička"}), (o:Order {orderNumber: 1})
CREATE (c)-[:REFERENCES_ORDER {date: "2024-11-1"}]->(o);

MATCH (c:Customer {name: "Jožko Mrkvička"}), (o:Order {orderNumber: 2})
CREATE (c)-[:REFERENCES_ORDER {date: "2024-11-1"}]->(o);

MATCH (e:EmployeeRole {name: "Dano Drevo"}), (w:Warehouse {email: "warehousesupport1@ppcshop.cz"})
CREATE (e)-[:ASSIGNED_TO_WAREHOUSE {since: "2020-01-01"}]->(w);

MATCH (e:EmployeeRole {name: "Dano Drevo"}), (w:Warehouse {email: "warehousesupport2@ppcshop.cz"})
CREATE (e)-[:ASSIGNED_TO_WAREHOUSE {since: "2020-01-01"}]->(w);

MATCH (e:EmployeeRole {name: "Dano Drevo"}), (w:Warehouse {email: "dwad@ppcshop.cz"})
CREATE (e)-[:ASSIGNED_TO_WAREHOUSE {since: "2020-01-01"}]->(w);

MATCH (o:Order {orderNumber: 0}), (p:Product {name: "Logitech MX Keys"})
CREATE (o)-[:ORDERED_ITEM {quantity: 1}]->(p);

MATCH (o:Order {orderNumber: 0}), (p:Product {name: "AMD Ryzen 5 7600"})
CREATE (o)-[:ORDERED_ITEM {quantity: 1}]->(p);

MATCH (o:Order {orderNumber: 1}), (p:Product {name: "AMD Ryzen 5 7600"})
CREATE (o)-[:ORDERED_ITEM {quantity: 1}]->(p);

MATCH (o:Order {orderNumber: 1}), (p:Product {name: "AMD Ryzen 7 5700X3D"})
CREATE (o)-[:ORDERED_ITEM {quantity: 1}]->(p);

MATCH (o:Order {orderNumber: 2}), (p:Product {name: "Logitech MX Keys"})
CREATE (o)-[:ORDERED_ITEM {quantity: 1}]->(p);

MATCH (p:Product {name: "Logitech MX Keys"}), (b:Brand {name: "Logitech"})
CREATE (p)-[:BRAND]->(b);

MATCH (p:Product {name: "AMD Ryzen 5 7600"}), (b:Brand {name: "AMD"})
CREATE (p)-[:BRAND]->(b);

MATCH (p:Product {name: "AMD Ryzen 7 5700X3D"}), (b:Brand {name: "AMD"})
CREATE (p)-[:BRAND]->(b);

MATCH (o:Order {orderNumber: 0}), (a:Address {countryName: "Hungary"})
CREATE (o)-[:BILLING_ADDRESS {deliveryTime: "3 days"}]->(a);

MATCH (o:Order {orderNumber: 1}), (a:Address {countryName: "Hungary"})
CREATE (o)-[:BILLING_ADDRESS {deliveryTime: "3 days"}]->(a);

MATCH (o:Order {orderNumber: 2}), (a:Address {countryName: "Hungary"})
CREATE (o)-[:BILLING_ADDRESS {deliveryTime: "3 days"}]->(a);

MATCH (p:Product {name: "Logitech MX Keys"}), (w:Warehouse {email: "warehousesupport1@ppcshop.cz"})
CREATE (p)-[:LOCATED_AT]->(w);

MATCH (p:Product {name: "AMD Ryzen 5 7600"}), (w:Warehouse {email: "warehousesupport2@ppcshop.cz"})
CREATE (p)-[:LOCATED_AT]->(w);

MATCH (p:Product {name: "AMD Ryzen 7 5700X3D"}), (w:Warehouse {email: "dwad@ppcshop.cz"})
CREATE (p)-[:LOCATED_AT]->(w);
