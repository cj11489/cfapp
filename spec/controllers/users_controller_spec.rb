require 'rails_helper'

describe UsersController, :type => :controller do

	before do
		@user = User.create!(first_name: "Chris", last_name: "Test", email: "test22@test.com", password: "password1") 
	end

	describe "GET #show" do
		context "User is logged in" do
			before do
				sign_in @user
			end

			it "shows user details" do
				get :show, id: @user.id
				expect(assigns(:user)).to eq @user
			end
		end
	
		context "No user is logged in" do
		 it "redirects to login" do
		   get :show, id: @user.id
		   expect(response).to redirect_to(new_user_session_path)
		 end
		end

		before do
			@user2 = User.create!(first_name: "Elisha", last_name: "Test", email: "elisha@test.com", password: "password2")
		end

		context "Logged in user cannot access other users details" do
			before do
				sign_in @user2
			end

			it "redirects user to index" do
				get :edit, id: @user.id
				expect(response).to redirect_to(root_path)
			end
		end
	end
end
