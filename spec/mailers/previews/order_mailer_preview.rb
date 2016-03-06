# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview
	def payment_completed
		@product = Product.first
		@user = User.first
		@order = Order.new(product_id: @product.id, total: 25.0, user_id: @user.id)
		OrderMailer.payment_completed(@order)
	end
end
