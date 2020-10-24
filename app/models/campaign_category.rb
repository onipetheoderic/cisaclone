class CampaignCategory < ApplicationRecord
  has_many :campaigns

  validates_presence_of :name
  validates_uniqueness_of :name
end
