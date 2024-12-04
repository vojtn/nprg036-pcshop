//find all brands and how many products they have
.["@graph"] as $graph |
  $graph |
  map(select(.["@type"] == "schema:Brand")) |
  map({
    brandId: .["@id"],
    brandName: .["schema:name"]["@value"],
    productCount: (.["schema:Product"] | length)
  }) |
  sort_by(-.productCount)