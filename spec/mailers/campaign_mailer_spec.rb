require "rails_helper"

RSpec.describe CampaignMailer, type: :mailer do
  let(:campaign) { create(:campaign) }
  let(:admin) { create(:admin) }
  let(:user) { build(:user) }

  describe "notify_admin" do
    let(:mail) { CampaignMailer.notify_admin(campaign,admin.email) }

    it "renders the headers" do

      expect(mail.subject).to eq(campaign.name)
      expect(mail.to).to eq(["#{admin.email}"])
      expect(mail.from).to eq(["notification@cisafrica.org"])
    end


    it "renders the body" do
      expect(mail.body.encoded).to match(campaign.story)
    end
  end

  describe "notify_user" do
    let(:mail) { CampaignMailer.notify_user(campaign) }

    it "renders the headers" do

      expect(mail.subject).to eq("New campaign request "+campaign.name)
      expect(mail.to).to eq(["#{user.email}"])
      expect(mail.from).to eq(["notification@cisafrica.org"])
    end


    it "renders the body" do
      expect(mail.body.encoded).to match("#{campaign.user.firstname} #{campaign.user.lastname}".titleize)
    end
  end

end
