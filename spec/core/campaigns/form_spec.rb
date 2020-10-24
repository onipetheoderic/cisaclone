require 'rails_helper'
RSpec.describe Campaigns::Form do
    subject { described_class.from_params(params) }

    let(:user) { create(:user)}
    let(:campaign_category) { create(:campaign_category)}
    let(:params) do
      {
          "name" => "sample campaign",
          "goal" => "200000",
          "story" => "Sample story",
          "user_id" => user.id,
          "campaign_category_id" => campaign_category.id

      }
    end

    context "validation check" do
#    before { stub_query() }

      it "is valid with valid attributes" do
              expect(subject).to be_valid
      end

      describe "#name" do
          it "must be present" do
              subject.name = ""

              expect(subject).to be_invalid
              expect(subject.errors[:name]).to be_present
          end
      end

      describe "#story" do
        it "must be be present" do
          subject.story = ""
          expect(subject).to be_invalid
          expect(subject.errors[:story]).to be_present
        end
      end

      describe "#goals" do
        it "must be present" do
          subject.goal = ""
          expect(subject).to be_invalid
          expect(subject.errors[:goal]).to be_present
        end
      end

      describe "#user_id" do
        it "must be present" do
          subject.user_id = ""
          expect(subject).to be_invalid
          expect(subject.errors[:user_id]).to be_present
        end

        it "user must exist" do
          subject.user_id = "anything"
          expect(subject).to be_invalid
          expect(subject.errors[:user_id]).to be_present
        end
      end

      describe "#campaign_category_id" do
        it "must be present" do
          subject.campaign_category_id = ""

          expect(subject).to be_invalid
          expect(subject.errors[:campaign_category_id]).to be_present
        end

        it "campaign category must exist" do
          subject.campaign_category_id = "anything"
          expect(subject).to be_invalid
          expect(subject.errors[:campaign_category_id]).to be_present
        end
      end
    end
end
