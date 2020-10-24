require 'rails_helper'
RSpec.describe" Account::SignUpForm" do
  subject { Account::SignUpForm }

  let(:params) do
    {
      "account" => {
        "firstname" => "Andy",
        "lastname"  => "Pike",
        "email"      => "me@here.com",
        "password"   => "secret123",
        "password_confirmation" => "secret123"
      }
    }
  end

  describe "validation" do
    # before { stub_query(Security::CredentialByUsername, :results => []) }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    describe "#firstname" do
      it "must be present" do
        subject.firstname = ""

        expect(subject).to be_invalid
        expect(subject.errors[:firstname]).to be_present
      end
    end

    describe "#lastname" do
      it "must be present" do
        subject.lastname = ""

        expect(subject).to be_invalid
        expect(subject.errors[:lastname]).to be_present
      end
    end

    describe "#email" do
      it "must be present" do
        subject.email = ""

        expect(subject).to be_invalid
        expect(subject.errors[:email]).to be_present
      end

      it "must be a valid email format" do
        subject.email = "this is present but not an email"

        expect(subject).to be_invalid
        expect(subject.errors[:email]).to be_present
      end

      it "must be unique within credentials" do
        stub_query(Security::CredentialByUsername, :results => Credential.new)

        expect(subject).to be_invalid
        expect(subject.errors[:email]).to be_present
      end
    end

    describe "#password" do
      it "must be present" do
        subject.password = ""

        expect(subject).to be_invalid
        expect(subject.errors[:password]).to be_present
      end

      it "must be at least 8 characters long" do
        subject.password = "a" * 7

        expect(subject).to be_invalid
        expect(subject.errors[:password]).to be_present
      end

      it "must be less than the max length suppored by AM::SecurePassword" do
        max_length = ActiveModel::SecurePassword::MAX_PASSWORD_LENGTH_ALLOWED
        subject.password = "a" * (max_length + 1)

        expect(subject).to be_invalid
        expect(subject.errors[:password]).to be_present
      end
    end

    describe "#password_confirmation" do
      it "must match #password" do
        subject.password_confirmation = "something different"

        expect(subject).to be_invalid
        expect(subject.errors[:password_confirmation]).to be_present
      end
    end
  end
end
