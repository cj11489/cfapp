class StaticPagesController < ApplicationController
	def landing_page
		@featured_product = Product.first
		@products = Product.all
		max_count = [@products.count, 5].min
		@products = @products.take(max_count)
	end
	def thank_you
		@name = params[:name]
		@email = params[:email]
		@message = params[:message]
		ActionMailer::Base.mail(:from => @email,
			:to => 'cjoiner20@hotmail.co.uk',
			:subject => "A new Whiteley Collection message from #{@name}",
			:body => @message).deliver_now
	end
end
