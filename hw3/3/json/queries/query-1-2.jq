{ brands: [ .["@graph"][].orderedItem[] | select(.price > 100) | .brand.name["@value"] ]}