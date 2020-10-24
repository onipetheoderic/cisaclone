Integration test is to test workflow, while feature test is will perform behaviour such as clicking the sign up button, inputing stuffs inside the text box


Capybara
=========
Capybara is for real world browser flowz, its a Feature test
Capybara plugs right into Rspec, allowing you to use the same syntax as Rspec and phrasing to write the test:

describe "the sign_in process", :type => :feature do
//we first create a new user, after creating a new user we now log the user in
//so before the test make a user by using User.make()
	before :each do
		User.make(email: "theoderic@gmail.com", password: "password")
	end

	it "signs me in" do
		visit "session/new"
			within("#session") do
				fill_in 'Email', with: "user@example.com"
				fill_in 'Password', with: "password"
			end
			click_button 'Sign In'
			expect(page).to have_content 'Success'
		end
	end



FactoryGirl
=============
FactoryGirl is to create Mock objects for your tests, Factory girl makes it super simple to create association through model definition

FactoryGirl.define do
	
	factory :user do
		name: "tdon"
		email: "tdondadon@gmail.motherfuckingcom"
	end

end

//now lets create validation for it

class User < ApplicationRecord 
	
	validates :email, presence: true
	validates :email, uniqueness: true
	validates :name, presence: true


	describe User do

		it "has a valid factory" do
			expect(FactoryGirl.build(:user).save).to be_true
		end

		it "is invalid without a name" do
			expect(FactoryGirl.build(:user, name:nil).save).to be_false
		end

		it 'is invalid without a unique email' do
			user = FactoryGirl.create(:user)
			expect(FactoryGirl.build(:user, name: "tdon").save).to be_false
		end
	end


	
















































