require 'rails_helper'

RSpec.describe Campaigns::CreateCampaign do
  subject { described_class.new(form) }

  context "When form is invalid" do
      let(:form) { double(:invalid? => true) }

      it "broadcasts :invalid campaign form" do
        expect { subject.call }.to broadcast(:invalid_campaign_form)
      end
  end

  context "when form is valid" do
    let(:user) { create(:user) }
    let(:admin) { create(:admin) }
    let(:campaign_category) { create(:campaign_category)}
    let(:campaign) { create(:campaign) }
    let(:form)do
      Rectify::StubForm.new(
        :valid? => true,
        :name => "Sample campaign",
        :goal => 200000,
        :story => "Sample story",
        :user_id => user.id,
        :campaign_category_id => campaign_category.id
      )
    end

    it "creates new campaign" do
      expect { subject.call }.to change(Campaign, :count).by(1)
    end

    it "sends new campaign notification email to admin " do
      subject.call

      admin_campaign_email = email_with_subject("New campaign request "+form.name)
      expect(admin_campaign_email).to be_present
      expect(admin_campaign_email.to).to eq(["#{admin.email}"])

    end

    it "sends new campaign notification email to User" do
        subject.call

        campaign_email = email_with_subject(form.name)
        expect(campaign_email).to be_present
        expect(campaign_email.to).to eq(["#{user.email}"])
    end
  end
end
