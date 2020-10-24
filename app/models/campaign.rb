class Campaign < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  belongs_to :campaign_category, foreign_key: :campaign_category_id
  belongs_to :user
  # has_many :donations
  has_attached_file :image, validate_media_type: false, styles: { medium: "360x275>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/



 

  def percentage_donated
  	 self.raised.to_f/self.goal.to_f * 100
  end


end
