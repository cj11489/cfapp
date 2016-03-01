class PaymentsController < ApplicationController

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
				Order.create(
					:product_id => @product.id,
					:user_id => current_user,
					:total => @product.price
					)	
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
