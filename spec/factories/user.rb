FactoryBot.define do
	factory :user do
		firstname "Test"
		lastname "account"
		email "bc.adeyeye@gmail.com"
		role "customer"
		password "password"
	end

	factory :admin, class: User do
		firstname "Admin"
		lastname "account"
		email "consigliere911@gmail.com"
		role "admin"
		password "password"
	end
end
