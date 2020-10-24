class Volunteer < ApplicationRecord
  has_attached_file :photo, styles: {small: '64x64', med: '170x85', large: '200x200' }

  validates_attachment :photo, presence: true, content_type: {content_type: ['image/jpg','image/png', 'image/jpeg'] }
  validates_presence_of :full_name, :telephone, :address, :email
  validates_uniqueness_of :email, :telephone
end
