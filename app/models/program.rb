class Program < ApplicationRecord
	extend FriendlyId
	friendly_id :title, use: :slugged
  	has_many :donations

  	has_attached_file :image, validate_media_type: false, styles: { medium: "542x342>", small: "200x200>" }
  	# validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
		validates_attachment :image, presence: true, content_type: {content_type: ['image/jpg','image/png', 'image/jpeg'] }


		validates_presence_of :title, :goal, :short_description, :description, :starts_at, :ends_at
		validates_uniqueness_of :title, :slug

		validate :start_date_cannot_be_in_the_past
		validate :end_date_cannot_be_in_the_past

  def start_date_cannot_be_in_the_past
    if starts_at.present? && starts_at < Date.today
      errors.add(:starts_at, "can't be in the past")
    end
  end

	def end_date_cannot_be_in_the_past
    if ends_at.present? && starts_at.present? && ends_at < starts_at
      errors.add(:ends_at, "can't be older than start date")
    end
  end

	def percentage_donated
		 self.raised.to_f/self.goal.to_f * 100
	end
end
#233*157
