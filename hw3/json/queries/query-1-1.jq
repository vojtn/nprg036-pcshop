//get customers who have "VIP" in their identifier
.["@graph"] | map(select(.["@type"] == "dpv:Customer" and .["schema:identifier"].["@value"] == "VIP"))