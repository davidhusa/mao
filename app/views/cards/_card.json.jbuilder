json.extract! card, :id, :user_id, :name, :card_type_id, :description, :quote, :cost, :quick_ref, :max_grid_width, :created_at, :updated_at
json.url card_url(card, format: :json)