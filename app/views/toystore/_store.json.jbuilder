json.extract! toystore, :id, :name, :brand, :price, :toytype, :description, :created_at, :updated_at
json.url toystore_url(toystore, format: :json)
