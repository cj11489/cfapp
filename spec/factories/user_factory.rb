FactoryGirl.define do 
	sequence(:email) { |n| "user#{n}@test.com" }
	sequence(:password) { |n| "password#{n}"}

	factory :user do
		first_name "Chris"
		last_name "Test"
		email 
		password
		admin "false"
	end

	factory :admin, class: User do
		first_name "Admin"
		last_name "User"
		email
		password
		admin "true"
	end
end