json.extract! campaign_category, :id, :name, :description, :icon, :created_at, :updated_at
json.url campaign_category_url(campaign_category, format: :json)
