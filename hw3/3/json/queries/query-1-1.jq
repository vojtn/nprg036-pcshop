.["@graph"][] | select(."@type" == "schema:Order") | {
  orderNumber: .["schema:orderNumber"],
  price: .["schema:price"],
  orderedItems: (if .["schema:orderedItem"] | type == "array" then 
      [.["schema:orderedItem"][] | {product: .["@id"]}]
    else
      [{product: .["schema:orderedItem"]["@id"]}]
    end)
}