.["@graph"] as $graph |
  $graph |
  map(select(.["@type"] == "km4c:Warehouse_and_storage")) as $warehouses |
  $warehouses | map(.["capacity"]) | add as $totalCapacity |
  ($warehouses | map(.["storedIn"])) | add as $products | $products | length as $totalProducts |
  {
    "Total inventory space": $totalCapacity,
    "Available inventory space": ($totalCapacity - $totalProducts)
  }