//find all products priced above 100 and retrieve their brand names
.["@graph"] | map(select(.["@type"] == "schema:Product" and .["schema:price"] > 100) | .["schema:brand"].["@id"])