class SliderContent < ApplicationRecord
  has_attached_file :banner, styles: {small: '64x64', med: '170x85', large: '200x200' }

  validates_attachment :banner, presence: true, content_type: {content_type: ['image/jpg','image/png', 'image/jpeg'] }
  validates_presence_of :caption, :rider
end
