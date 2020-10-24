module Campaigns
  class CreateCampaign < Rectify::Command

    def initialize(form)
      @form = form
    end

    def call
      return broadcast(:invalid_campaign_form) if form.invalid?
      transaction do
        create_campaign
        notify_admin
        notify_user
      end
    end

    private
    attr_reader :form, :campaign

    def create_campaign
      @campaign ||= Campaign.create!(form.attributes)
    end

    def notify_admin
      CampaignMailer.notify_admin(@campaign,ENV['ADMIN_EMAIL']).deliver
    end

    def notify_user
      CampaignMailer.notify_user(@campaign).deliver 
    end

  end

end
