class OrderMailer < ApplicationMailer
	default from: "info@thewhiteleycollection.com"

	def payment_completed(order)
		@user = order.user
		@order = order
		@appname = "The Whiteley Collection"
		@order_url = "https://thewhiteleycollection.herokuapp.com/products"
		mail( :to => @user.email, :subject => "Thank you for ordering from The Whiteley Colletion!")
	end

end
