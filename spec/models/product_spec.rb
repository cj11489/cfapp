require 'rails_helper'

describe Product do
	context "when a product has comments" do
		before do
			@product = Product.create!(name: "birthday card")
			@user = FactoryGirl.create(:user)
			@product.comments.create!(rating: 1, user: @user, body: "terrible product")
			@product.comments.create!(rating: 3, user: @user, body: "not bad")
			@product.comments.create!(rating: 5, user: @user, body: "Amazing!")
		end

		it "returns an average rating of all comments" do
			expect(@product.average_rating).to eq 3
		end

		it "is not valid" do
			expect(Product.new(description: "5 letters to a line")).not_to be_valid
			expect(Product.new(colour: "red")).not_to be_valid
		end

	end
end