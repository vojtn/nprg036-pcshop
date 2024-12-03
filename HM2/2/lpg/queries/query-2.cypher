// Products manufactured by AMD
MATCH (p:Product)-[:BRAND]-(b:Brand) WHERE b.name = "AMD" RETURN (p);