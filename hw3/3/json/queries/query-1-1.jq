.["@graph"][] | select(."@type" == "schema:Order") | {
  orderNumber: .["orderNumber"],
  price: .["price"],
  orderedItems: (if .["orderedItem"] | type == "array" then 
      [.["orderedItem"][] | {product: .["@id"]}]
    else
      [{product: .["orderedItem"]["@id"]}]
    end)
}