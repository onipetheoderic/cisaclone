module Utility
  class ValidateCampaignCategory < Rectify::Query

    def initialize(campaign_category_id)
      @campaign_category_id = campaign_category_id
    end

    def query
      CampaignCategory.find_by_id(campaign_category_id)
    end

    private
    attr_reader :campaign_category_id

  end

end
