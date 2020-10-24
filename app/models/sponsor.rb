class Sponsor < ApplicationRecord
  has_attached_file :logo, styles: {small: '64x64', med: '170x85', large: '200x200' }

  validates_attachment :logo, presence: true, content_type: {content_type: ['image/jpg','image/png', 'image/jpeg'] }
  validates_presence_of :name
  validates_uniqueness_of :name
end
