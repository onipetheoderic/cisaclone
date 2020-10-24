class Career < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  scope :open_jobs, -> { where(published: true).where(closed: false)}

  validates_presence_of :title
end
