json.products @products do |product|
  json.id product.id
  json.name product.name
  json.created_at product.created_at
end