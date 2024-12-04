.["@graph"] as $graph |
  $graph |
  map(select(.["@type"] == "km4c:Warehouse_and_storage")) as $warehouses |
  $warehouses | map(.["oo:capacity"]) | add as $totalCapacity |
  ($graph | map(select(.["@type"] == "schema:Product")) | length) as $totalProducts |
  {
    "Total inventory space": $totalCapacity,
    "Available inventory space": ($totalCapacity - $totalProducts)
  }