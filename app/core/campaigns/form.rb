module Campaigns
  class Form < Rectify::Form
    mimic :campaign

    attribute :name,                    String
    attribute :goal,                    Decimal
    attribute :story,                   String
    attribute :campaign_category_id,    Integer
    attribute :user_id,                 Integer


    validates :name, :goal, :story,:user_id, :campaign_category_id, :presence => true

    validate :user_existence_validator
    validate :campaign_category_existence

    def user_existence_validator
      return unless Utility::UserExistenceValidator.new(user_id).none?
      errors.add(:user_id, "User does not exist")
    end

    def campaign_category_existence
      return unless  Utility::ValidateCampaignCategory.new(campaign_category_id).none?
      errors.add(:campaign_category_id, "Campaign Category does not exists")
    end
  end

end
