// Orders with only one product
MATCH (o:Order) WHERE COUNT { (o)-[:ORDERED_ITEM]-(p:Product) } = 1 RETURN (o);