// Orders which includes Product "Logitech MX Keys"
MATCH (o:Order)-[:ORDERED_ITEM]-(p:Product) WHERE p.name = "Logitech MX Keys" RETURN (o);