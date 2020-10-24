json.extract! campaign, :id, :campanign_category_id, :user_id, :name, :story, :facebooK_shares, :twitter_shares, :likes, :goal, :created_at, :updated_at
json.url campaign_url(campaign, format: :json)
