class PaymentsController < ApplicationController
	before_filter :authenticate_user!
	
	def show
	end

	def create
		@product = Product.find(params[:product_id])
		@user = current_user


		token = params[:stripeToken]

		begin 
			charge = Stripe::Charge.create(
				:amount => (@product.price_in_cents), #write the value in pence 
				:currency => "gbp",
				:source => token,
				:description => params[:stripeEmail]
				)

			if charge.paid
				@order = Order.create(
					:product_id => @product.id,
					:user_id => current_user.id,
					:total => @product.price
					)	
				OrderMailer.payment_completed(@order).deliver_later
			end

		rescue Stripe::CardError => e
			#The card has been declined
			body = e.json_body
			err = body[:error]
			flash[:error] = "Sorry, but there was an error processing your payment: #{err[:message]}"
		end

		redirect_to :action => 'show'	
	end
end
