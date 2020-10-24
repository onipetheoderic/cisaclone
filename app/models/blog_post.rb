class BlogPost < ApplicationRecord
  belongs_to :owner, :class_name => 'User'
  belongs_to :approved_by, :class_name => 'User'

  has_attached_file :picture, style: { thumbnail: "60x60#"}
  validates_attachment :picture, content_type: {content_type: 'image/jpeg'}


end
