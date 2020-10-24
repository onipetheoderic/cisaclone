json.extract! resources_custom, :id, :title, :description, :published, :created_at, :updated_at
json.url resources_custom_url(resources_custom, format: :json)
