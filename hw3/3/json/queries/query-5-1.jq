.["@graph"] as $graph |
  $graph |
  map(select(.["@type"] == "schema:Brand")) |
  map({
    brandURI: .["@id"],
    brandName: .["name"]["@value"],
    productCount: (.["products"] | length)
  }) |
  sort_by(-.productCount)