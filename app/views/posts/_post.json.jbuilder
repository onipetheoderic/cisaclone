json.extract! post, :id, :owner_id, :title, :body, :approved_by, :current_state, :published_at
json.url post_url(post, format: :json)
